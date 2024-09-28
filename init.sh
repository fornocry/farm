#!/bin/bash

git config --global credential.helper store

FRONTEND_REPO="https://github.com/fornocry/farm_frontend.git"
BACKEND_REPO="https://github.com/fornocry/farm_backend.git"
BOT_REPO="https://github.com/fornocry/farm_bot.git"

update_or_clone() {
    local repo_url=$1
    local dir_name=$2

    if [ -d "$dir_name" ]; then
        echo "Updating $dir_name..."
        cd "$dir_name" || exit
        git pull
        cd ..
    else
        echo "Cloning $dir_name..."
        git clone "$repo_url" "$dir_name"
    fi
}

update_or_clone "$FRONTEND_REPO" "frontend"
update_or_clone "$BACKEND_REPO" "backend"
update_or_clone "$BOT_REPO" "bot"

echo "Frontend, backend, bot repositories fetched or updated successfully."
