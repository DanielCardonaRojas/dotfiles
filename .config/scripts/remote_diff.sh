# This script attempts to compare unsynchronized branches
# It is common to rebase a branch and wonder if something strange happened in the process
# this script aims at giving hints as to what changed in relation to your branch and excluding other stuff.
# to your work.
CURRENT_BRANCH=$(git rev-parse --abbrev-ref HEAD)
BRANCH=${1:-$CURRENT_BRANCH}
BASE=${2:-main}
BASE_REMOTE=${3:-main}

BRANCH_BASE=$(git oldest-ancestor $BASE $BRANCH)
BRANCH_BASE_REMOTE=$(git oldest-ancestor $BASE_REMOTE origin/$BRANCH)

echo "Local base: $BRANCH_BASE remote base: $BRANCH_BASE_REMOTE"
echo "git range-diff $BRANCH_BASE_REMOTE..origin/$BRANCH $BRANCH_BASE..$BRANCH"

git range-diff $BRANCH_BASE_REMOTE..origin/$BRANCH $BRANCH_BASE..$BRANCH 
