PREVIOUS_COMMIT_MESSAGE=$(git log -1 --pretty=%B)
NEXT_COMMIT_MESSAGE="Vault backup: $(date +%m-%d-%y)"

echo "previous: $PREVIOUS_COMMIT_MESSAGE"
echo "next: $NEXT_COMMIT_MESSAGE"

git add .
if [ "$PREVIOUS_COMMIT_MESSAGE" == "$NEXT_COMMIT_MESSAGE" ]; then
	git commit --amend --no-edit
else
	git commit -m "$NEXT_COMMIT_MESSAGE"
fi
