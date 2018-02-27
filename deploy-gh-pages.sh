branch=${3:-"dev"} # default to dev when branch isn't specified

mkdir tempGH
cd tempGH
../gp.sh gobstones gobstones-code-runner ${branch}
cd ..
rm -rf tempGH
