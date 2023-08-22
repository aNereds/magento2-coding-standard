#!/bin/sh
echo "Checking file extensions: $1"
echo "Display only Errors: $2"
echo "Show Source report: $3"
echo $GITHUB_WORKSPACE

cd $GITHUB_WORKSPACE
sh -c "/root/.composer/vendor/bin/phpcs -i"
sh -c "/root/.composer/vendor/bin/phpcs --standard=Magento2 --extensions=php,phtml $GITHUB_WORKSPACE ./"
sh -c "/root/.composer/vendor/bin/phpcs --standard=Magento2 --report=summary --extensions=php,phtml $GITHUB_WORKSPACE ./"