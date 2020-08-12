while [ -z "$USER_NAME" ]; do
  echo "Please provide your bintray username"
  read USER_NAME
done
while [ -z "$API_KEY" ]; do
  echo "Please provide your bintray API key"
  read -s API_KEY
  echo
done

echo "Publishing to LI bintray ..."
MVN_DEPLOY_BINTRAY_USER=$USER_NAME MVN_DEPLOY_BINTRAY_KEY=$API_KEY eval 'mvn deploy -s ../.lipublish/publishSettings.xml -DskipTests -q -DretryFailedDeploymentCount=5 -DaltDeploymentRepository=bintray-linkedin-maven::default::"https://api.bintray.com/maven/linkedin/maven/linkedin-orc/;publish=1;override=1"'
