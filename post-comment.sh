#!/bin/bash

if [ -z "${MESSAGE}" ]; then

  if [ -n "${URL_FRONTEND}" ]; then
    FILE_PHRASES="phrases-with-frontend.list";
  else
    FILE_PHRASES="phrases.list";
  fi

  dockerize -template ${FILE_PHRASES}:${FILE_PHRASES}

  MESSAGE=$(tail ${FILE_PHRASES} | shuf | head -n 1)
fi

echo "PR: ${PR_NUMBER}";
echo "OWNER: ${OWNER}";
echo "REPO: ${REPO}";
echo "MESSAGE: '${MESSAGE}'";

curl -s \
     -H "Authorization: token ${GITHUB_TOKEN}" \
     -X POST \
     -d "{\"body\": \"${MESSAGE}\"}" \
     "https://api.github.com/repos/{$OWNER}/{$REPO}/issues/${PR_NUMBER}/comments"