#!/bin/bash

# Obsidian 볼트 → Quartz content 동기화 후 배포
VAULT="/Users/ggoungwoo/Desktop/git_blog"
QUARTZ="/Users/ggoungwoo/Desktop/quartz-blog"

# 볼트 내용을 content 폴더로 복사 (.obsidian 폴더 제외)
rsync -av --delete \
  --exclude='.obsidian/' \
  --exclude='.git/' \
  --exclude='sync_to_github.sh' \
  --exclude='.sync_log.txt' \
  --exclude='.sync_stdout.txt' \
  --exclude='.sync_stderr.txt' \
  "$VAULT/" "$QUARTZ/content/"

# Quartz 빌드 & GitHub 푸시
cd "$QUARTZ"
npx quartz sync 2>&1
