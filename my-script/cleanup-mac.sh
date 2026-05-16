#!/bin/bash

echo "🧹 Starting Mac cleanup..."

# -----------------------------
# NPM / Yarn / PNPM
# -----------------------------
echo "📦 Cleaning Node package caches..."

npm cache clean --force 2>/dev/null
yarn cache clean 2>/dev/null
pnpm store prune 2>/dev/null

# -----------------------------
# VS Code Cache
# -----------------------------
echo "🧠 Cleaning VS Code cache..."

rm -rf ~/Library/Application\ Support/Code/Cache/*
rm -rf ~/Library/Application\ Support/Code/CachedData/*
rm -rf ~/Library/Application\ Support/Code/User/workspaceStorage/*

# -----------------------------
# Chrome Cache
# -----------------------------
echo "🌐 Cleaning Chrome cache..."

rm -rf ~/Library/Caches/Google/Chrome/*

# -----------------------------
# Cursor Cache
# -----------------------------
echo "🤖 Cleaning Cursor cache..."

rm -rf ~/Library/Application\ Support/Cursor/Cache/*
rm -rf ~/Library/Application\ Support/Cursor/CachedData/*

# -----------------------------
# Claude Cache
# -----------------------------
echo "🧠 Cleaning Claude cache..."

rm -rf ~/Library/Application\ Support/Claude/Cache/*

# -----------------------------
# Notion Cache
# -----------------------------
echo "📝 Cleaning Notion cache..."

rm -rf ~/Library/Application\ Support/Notion/Cache/*

# -----------------------------
# Warp Cache
# -----------------------------
echo "⚡ Cleaning Warp cache..."

rm -rf ~/Library/Application\ Support/dev.warp.Warp-Stable/Cache/*

# -----------------------------
# macOS User Cache
# -----------------------------
echo "🍎 Cleaning macOS user cache..."

rm -rf ~/Library/Caches/*

# -----------------------------
# Logs
# -----------------------------
echo "📜 Cleaning logs..."

rm -rf ~/Library/Logs/*

# -----------------------------
# Docker Cleanup
# -----------------------------
echo "🐳 Cleaning Docker..."

docker system prune -af 2>/dev/null
docker volume prune -f 2>/dev/null

# -----------------------------
# Homebrew Cleanup
# -----------------------------
echo "🍺 Cleaning Homebrew..."

brew cleanup -s 2>/dev/null

if command -v brew &>/dev/null; then
    rm -rf "$(brew --cache)" 2>/dev/null
fi

# -----------------------------
# Empty Trash
# -----------------------------
echo "🗑 Emptying Trash..."

rm -rf ~/.Trash/*

# -----------------------------
# Remove old node_modules
# -----------------------------
echo "🗑 Removing old node_modules folders..."

find ~/Documents \
    -type d \
    -name "node_modules" \
    -mtime +14 \
    -prune \
    -exec rm -rf {} + 2>/dev/null

# -----------------------------
# Cleanup .next build cache
# -----------------------------
echo "⚡ Removing old .next caches..."

find ~/Documents \
    -type d \
    -name ".next" \
    -mtime +14 \
    -prune \
    -exec rm -rf {} + 2>/dev/null

# -----------------------------
# Cleanup dist/build folders
# -----------------------------
echo "🏗 Removing old build folders..."

find ~/Documents \
    \( -name "dist" -o -name "build" \) \
    -type d \
    -mtime +14 \
    -prune \
    -exec rm -rf {} + 2>/dev/null

echo ""
echo "✅ Cleanup complete!"
echo "🚀 Your Mac should feel lighter now 😄"
