function g {
  if [[ $# > 0 ]]; then
    git $@
  else
    git status
  fi
}

function take {
  mkdir $1
  cd $1
}

