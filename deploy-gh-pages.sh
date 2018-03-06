branch=${3:-"master"} # default to master when branch isn't specified

mkdir tempGH
cd tempGH
../gp.sh gobstones gobstones-code-runner ${branch}
cd ..
rm -rf tempGH
