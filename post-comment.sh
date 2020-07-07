#!/bin/bash

if [ -z "${MESSAGE}" ]; then
  MESSAGE="Uhull, nosso ambiente de teste está criado. Bora fazer testes agora. :point_down: :point_down: :point_down: \\n\\n [Ambiente de testes](${URL})";
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