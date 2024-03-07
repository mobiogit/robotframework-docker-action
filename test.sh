# Create reports folder
REPORTS_DIR=$(pwd)/$ROBOT_REPORTS_DIR
sudo mkdir $REPORTS_DIR && sudo chmod 777 $REPORTS_DIR

docker run --shm-size=$ALLOWED_SHARED_MEMORY \
  -e BROWSER=$BROWSER \
  -e ROBOT_THREADS=$ROBOT_THREADS \
  -e PABOT_OPTIONS="$PABOT_OPTIONS" \
  -e ROBOT_OPTIONS="$ROBOT_OPTIONS" \
  -e ROBOT_TESTS_DIR="/opt/robotframework/tests/$ROBOT_TESTS_DIR" \
  -v $REPORTS_DIR:/opt/robotframework/reports:Z \
  -v .:/opt/robotframework/tests:Z \
  -v ./pip-requirements.txt:/opt/robotframework/pip-requirements.txt:Z \
  --user $(id -u):$(id -g) \
  $ROBOT_RUNNER_IMAGE
