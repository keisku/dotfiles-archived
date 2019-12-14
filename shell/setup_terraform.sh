terraform --version &> /dev/null
if [ $? -ne 0 ] ; then
    brew install terraform
    gem install terraforming 
else
  echo "You have installed aws-cli before"
  terraform --version
fi