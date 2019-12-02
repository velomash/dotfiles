#notmuch tag -new tag:new
mbsync goat
notmuch new

# PR Approval notification
#PR_APPROVAL_EMAIL_IDS="$(notmuch search --limit=1 --output=messages tag:new from:notifications@github.com "approved this pull request")"
PR_APPROVAL_EMAIL_IDS="$(notmuch search --limit=1 --output=messages tag:new "approved this pull request")"

for emailId in $PR_APPROVAL_EMAIL_IDS; do
  USERNAME=$(notmuch show $emailId | sed -n 's/\(\w*\) approved this pull request./\1/p')
  PR_URL=$(notmuch show $emailId | sed -n 's/.*\(https[^ <]*pullrequestreview-[0-9]*\).*/\1/p')
  PR_TITLE=$(notmuch show $emailId | sed -n 's/.*Subject.*\] \(.*\) (#.*/\1/p')

  notify --title "$USERNAME - PR 👍" \
    --icon=https://github.githubassets.com/images/modules/logos_page/Octocat.png \
    --message "$PR_TITLE" \
    --open "$PR_URL"
done
