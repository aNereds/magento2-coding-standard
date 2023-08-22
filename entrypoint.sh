
echo "Error Severity $1"
echo "Warning Severity $2"
echo $GITHUB_WORKSPACE

cd $GITHUB_WORKSPACE
sh -c "~/.composer/vendor/bin/phpcs -i"
sh -c "~/.composer/vendor/bin/phpcs --standard=Magento2 --error-severity=$1 --warning-severity=$2 $GITHUB_WORKSPACE -s ./"