START_DATE="2025-02-01"
DAYS=90
FILE="README.md"

# Calculate the start date in seconds since epoch
START_SECONDS=$(date -d "$START_DATE" "+%s")

for ((i=0; i<$DAYS; i++)); do
  # Generate a random number of days to add (between 0 and DAYS-1)
  RANDOM_DAYS=$((RANDOM % DAYS))
  # Calculate random date
  COMMIT_DATE=$(date -d "@$((START_SECONDS + RANDOM_DAYS * 86400))" "+%Y-%m-%dT12:00:00")
  COMMIT_DISPLAY=$(date -d "@$((START_SECONDS + RANDOM_DAYS * 86400))" "+%Y-%m-%d")
  echo "Commit on $COMMIT_DISPLAY" >> $FILE
  git add $FILE
  GIT_AUTHOR_DATE="$COMMIT_DATE" GIT_COMMITTER_DATE="$COMMIT_DATE" git commit -m "Auto commit on $COMMIT_DISPLAY"
done

echo "✅ Done generating fake commits."
