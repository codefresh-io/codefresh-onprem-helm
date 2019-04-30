function _createStandardNodejsComponent(name) {
    var port = {
        name: 'port',
        envVar: 'PORT',
        default: 9000
    };
    return new Component(name, {
        ports: [port]
    });
}

function _createNonStandardComponent(name, ports) {
    var nonStandardPorts = _.map(ports, function (p, i) {
        return {
            name: 'port_' + i,
            envVar: p.envVar,
            default: p.default
        }
    });
    return new Component(name, {
        ports: nonStandardPorts
    });
}

function $create(config) {
    return new CommandSet()
        .addCommand(
            new Command({
                name: 'git',
                description: 'Create branch',
                workDir: config['cf-helm-path'],
                program: 'sh',
                exec: [
                    '-c',
                    'git checkout dynamic && git pull && git checkout -b dynamic-'+config.name+' && git push --set-upstream origin dynamic-'+config.name
                ]
            })
        )
        .addCommand(
            new Command({
                name: 'codefresh-cli',
                description: 'Switch context in Codefresh CLI',
                program: 'codefresh',
                exec: [
                    'auth',
                    'use-context',
                    config.codefresh.context,
                ]
            })
        )
        .addCommand(
            new Command({
                name: 'run-pipeline',
                description: 'Run pipeline in Codefresh to create environment',
                program: 'sh',
                exec: [
                    '-c',
                    'codefresh logs -f $(codefresh get build --pipeline-name --branch dynamic-' + config.name + ' | awk \'NR >1\' | awk \'{ print $1}\')',
                ]
            })
        )
        .addCommand(
            new Command({
                name: 'wait',
                description: 'Wait for environment to be ready',
                program: 'sh',
                exec: [
                    '-c',
                    'while [[ "$(curl -s -o /dev/null -w %{http_code} http://'+config.name+'.dev.codefresh.io)" != "200" ]]; do echo "No ready yet, testing again in 5..." && sleep 5; done',
                ]
            })
        )
        .build();
}

function $connect(config, component) {
    var env = [];
    env.push('MERLIN_COMPONENT=' + component.name)

    var exec = [];
    _.chain(exec)
        .push('--context')
        .push(config.kubernetes.context)
        .push('--swap-deployment')
        .push(config.name + '-' + component.name)
        .push('--namespace')
        .push(config.name)
        .value()
    _.map(component.spec.ports, function (p) {
        var port = GetAvailablePort()
        exec.push('--expose')
        exec.push(port + ':' + p.default)
        env.push(component.name.replace('-', '_') + '_' + p.name + '=' + port);
    })

    if (config.run) {
        exec.push('--run')
        exec.push(config.run)
    }


    return JSON.stringify([{
        name: 'run-telepresence',
        program: 'telepresence',
        exec: exec,
        env: env,
        detached: true
    }]);
}

function $start(config, component) {
    var env = _.map(component.spec.ports, function (p) {
        return p.envVar + '=' + process.env[component.name.replace('-', '_') + '_' + p.name];
    })
    env.push('FORMAT_LOGS_TO_ELK=false')
    return JSON.stringify([{
            name: 'ensure-tools',
            description: 'Ensure telepresence & kubectl && jq && codefresh exist',
            env: env,
            program: 'node',
            exec: [
                '--inspect=' + GetAvailablePort(),
                'server/index.js'
            ]
        },
    ]);
}

function build() {
    var env = new Environment();
    return env
        .addComponent(_createNonStandardComponent('cfapi', [{
            envVar: 'INTERNAL_PORT',
            default: 40000.
        }, {
            envVar: 'PORT',
            default: 80
        }]))
        .addComponent(_createNonStandardComponent('runtime-environment-manager', [{
            envVar: 'PORT',
            default: 80
        }]))
        .addComponent(_createStandardNodejsComponent('pipeline-manager'))
        .addComponent(_createStandardNodejsComponent('context-manager'))
        .addOperator(new Operator({
            name: 'create',
            description: 'Create an environment',
            params: [{
                name: 'cf-helm-path',
                description: 'Path to cf-helm local repo',
                required: true,
                envVar: 'CF_HELM_PATH',
                interactive: true,
            }]
        }))
        .addOperator(new Operator({
            name: 'connect',
            description: 'Establish connection to the cluster and open ssh tunnel',
            scope: 'component'
        }))
        .addOperator(new Operator({
            name: 'start',
            description: 'Start application locally (assuming the connection is been established)',
            scope: 'component'
        }))
        .build();
}