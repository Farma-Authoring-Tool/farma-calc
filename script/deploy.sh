#!/bin/bash

git merge --no-edit master
git push origin production

commands="
  cd ~/farma-calc/farma &&
  git pull --no-edit origin production &&
  docker-compose exec web bundle install &&
"

if [ "$1" = "--compile-assets" ]; then
 commands+="
   docker-compose exec web bundle exec rake assets:precompile &&
 "
fi

commands+=" docker-compose restart web "

ssh deployer@200.134.18.140 -t $commands
