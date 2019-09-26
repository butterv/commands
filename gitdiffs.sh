#!bin/sh

echo "# Please input target branch"
read branchname

while read line
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
done <(git diff $branchname --name-only)

echo "\nFinish!"

# /Users/satoshi_inoue/Desktop/gitdiffs.txt
# redesign-accounts-m