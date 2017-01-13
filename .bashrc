function goUpDirectory() {
   if [ -z $1 ]; then
      cd ..
   else
      local amt=$1
      while ((amt > 0)); do
         ((amt=amt-1))
         cd ..
      done
   fi
}

function findDirectory() {
   for d in */; do
      local directory=$(echo $d | tr '[:upper:]' '[:lower:]')
      local search=$(echo $1 | tr '[:upper:]' '[:lower:]')
      if [[ $directory =~ $search ]]; then
         cd $d
         ls
         break
      fi
   done
}

# $1: repo-name, $2: github-name
function newGithubRepo() {
   local json="{\"name\":\"$1\"}"
   mkdir $1
   cd $1
   touch .gitignore
   git init
   git add .gitignore
   git remote add origin "git@github.com:$2/$1.git"
   git commit -m "initial commit"
   curl -u '$2' https://api.github.com/user/repos -d "$json"
   git push --set-upstream origin master
}

alias h='cd ~;ls'
alias b=goUpDirectory
alias nr=newGithubRepo
alias f=findDirectory
alias s='git status'
alias c='git commit -m'
alias cl='git clone'
alias p='git pull'
alias u='git push'
alias di='git diff'
alias ch='git checkout'
alias chm='git checkout master'
