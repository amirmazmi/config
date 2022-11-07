#!/usr/bin/env bash

# source: https://sharats.me/posts/shell-script-best-practices/


set -o errexit   # abort on nonzero exitstatus
set -o nounset   # abort on unbound variable
set -o pipefail  # don't hide errors within pipes


# ideally use printf instead of echo


# use double brackets
[[ $var = '' ]] && echo True


# globbing / regex
t=”abc123″
[[ “$t” == abc* ]] # true (globbing)



# assign to variable if it has spaces
r=”a b+”
[[ “a bbb” =~ $r ]] # true



# When printing error messages, please redirect to stderr.
# Use this:
echo 'Something unexpected happened' >&2 



# Clean up code!!!
finish() {
  result=$?
  # Your cleanup code here
  exit ${result}
}
trap finish EXIT ERR




# DEBUGGING
# To perform a syntax check/dry run of your bash script run:
bash -n myscript.sh
# To produce a trace of every command executed run:
bash -v myscripts.sh
# To produce a trace of the expanded command use:
bash -x myscript.sh


# END
