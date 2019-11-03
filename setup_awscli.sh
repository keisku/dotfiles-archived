aws --version &> /dev/null
if [ $? -ne 0 ] ; then
  echo "aws-cli is not found."
  brew install awscli
  printf +"%.s" {1..80}|echo $(cat)
  echo "You need set configuration."
  printf +"%.s" {1..80}|echo $(cat)
  aws configure
else
  echo "You have installed aws-cli before"
  aws --version
fi