function gco_sync --description "Fetch remote, switch to the branch, and pull latest changes"
    # Check if the branch name argument was provided
    if test (count $argv) -eq 0
        echo "❌ Please provide a branch name. Example: gco_sync my-branch"
        return 1
    end

    # Set local variable for the branch name
    set -l branch $argv[1]

    echo "🔄 1. Fetching updated branch list from remote..."
    git fetch origin

    echo "🔀 2. Switching to branch '$branch'..."
    if git checkout $branch
        echo "📥 3. Pulling the latest changes (git pull)..."
        git pull origin $branch
        echo "✅ All done! You are on '$branch' and fully up to date."
    else
        echo "❌ Error: The branch '$branch' does not exist locally or on the remote server."
        return 1
    end
end