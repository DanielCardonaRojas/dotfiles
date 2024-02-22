#!/bin/bash

# Check if at least two arguments are passed (GraphQL file and endpoint URL)
if [ "$#" -lt 2 ]; then
    echo "Usage: $0 <graphql_query_file.graphql> <graphql_endpoint_url> [key=value ...]"
    exit 1
fi

# Assign the first two arguments to variables
GRAPHQL_FILE="$1"
ENDPOINT_URL="$2"

# Prepare the GraphQL query
QUERY=$(cat "$GRAPHQL_FILE")

# Process additional arguments (if any) to create a JSON object for variables
if [ "$#" -gt 2 ]; then
    VARIABLES_JSON=$(echo "${@:3}" | awk -v RS=" " '{split($0, a, "="); printf (NR==1 ? "{" : ", ") "\"%s\": \"%s\"", a[1], a[2]} END {print " }"}')
else
    VARIABLES_JSON="{}"
fi

# Combine query and variables into a full JSON payload
JSON_PAYLOAD=$(jq -n \
                  --arg query "$QUERY" \
                  --argjson vars "$VARIABLES_JSON" \
                  '{query: $query, variables: $vars}')

echo "GraphQL request"
echo $JSON_PAYLOAD | jq

# Execute the GraphQL request
echo -e "\nResponse\n"
curl -s -X POST -H "Content-Type: application/json" --data "$JSON_PAYLOAD" "$ENDPOINT_URL" | jq
