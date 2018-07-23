function choke-appserver() {
    docker-compose exec appserver sh -c 'kill `/bin/cat /tmp/uwsgi.pid`'
}

function dev-features-on() {
    curl --request PUT --data True http://localhost:8500/v1/kv/config_override/shared/appserver/webclient/use_dev
}

function dev-features-off() {
    curl --request PUT --data False http://localhost:8500/v1/kv/config_override/shared/appserver/webclient/use_dev
}

function debug-appserver() {
    local SVC=appserver
    echo "Running debug with SVC=$SVC..."
    docker-compose stop $SVC
    docker-compose run --service-ports --rm $SVC /lime/debug-service
}

function setup-static-files() {
    docker-compose exec appserver /lime/setup_static_files.py
}
