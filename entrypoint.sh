#!/bin/sh
echo "Checking file extensions: $1"
echo "Display only Errors: $2"
echo "Show Source report: $3"

echo $GITHUB_WORKSPACE

COMMAND_FLAGS=""

if [ "$2" = "yes" ]
then
  COMMAND_FLAGS${COMMAND_FLAGS$}"-n"
fi

cd $GITHUB_WORKSPACE
sh -c "/root/.composer/vendor/bin/phpcs --standard=Magento2 --extensions=$1 --error-severity=10 --report=code,summary $COMMAND_FLAGS $GITHUB_WORKSPACE ./"
