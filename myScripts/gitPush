git status
read -p "push ? " -n 1 -r
printf "\n\n"
if [[ $REPLY =~ ^[Yy]$ ]]
then
  git add -A
  git commit -m "wtv"
  git push
fi
