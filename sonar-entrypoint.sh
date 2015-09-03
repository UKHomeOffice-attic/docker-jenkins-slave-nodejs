#!/usr/bin/env bash

if [ ! -z "$SONARQUBE_JDBC_PASSWORD_PATH" ]; then
    SONARQUBE_JDBC_PASSWORD="$(cat "$SONARQUBE_JDBC_PASSWORD_PATH")"
    export SONARQUBE_JDBC_PASSWORD
fi

cat > "/sonar-runner/sonar-runner-$SONAR_RUNNER_VERSION/conf/sonar-runner.properties" <<- EOM
sonar.host.url=$SONARQUBE_HOST_URL
sonar.jdbc.url=$SONARQUBE_JDBC_URL
sonar.jdbc.username=$SONARQUBE_JDBC_USERNAME
sonar.jdbc.password=$SONARQUBE_JDBC_PASSWORD
EOM

exec /usr/local/bin/jenkins-slave.sh "$@"
