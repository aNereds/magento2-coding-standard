#!/bin/sh
echo $GITHUB_WORKSPACE

cd $GITHUB_WORKSPACE
sh -c "/root/.composer/vendor/bin/phpcs -i"
sh -c "/root/.composer/vendor/bin/phpcs --standard=Magento2 $GITHUB_WORKSPACE -s ./"
sh -c "/root/.composer/vendor/bin/phpcs --standard=Magento2 --report=summary $GITHUB_WORKSPACE -s ./"