#!bin/sh

echo "# Please input target branch"
read branchname

diff=$(git diff $branchname --name-only)

while read -u 9 line
do
  git diff $branchname $line
  
  read -p "# Do you go to the next file? (y/n): " next
  if [ $next = 'y' ] ; then 
  	continue
  else
  	break
  fi

  case $next in
    'y')
        continue
        ;;
    'n')
        break
        ;;
    *)
        exit 1
        ;;
  esac
done 9<< FILE
$diff
FILE

echo "\nFinish!"

# /Users/satoshi_inoue/Desktop/gitdiffs.txt
# redesign-accounts-m