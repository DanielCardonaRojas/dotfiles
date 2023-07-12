CURRENT_WINDOW_INFO=$(yabai -m query --windows --window)
CURRENT_WIN_ID=$(echo $CURRENT_WINDOW_INFO | jq '{id: .id, app: .app } | .id')
CURRENT_WIN_NAME=$(echo $CURRENT_WINDOW_INFO | jq '{id: .id, app: .app } | .app')
ALL_APPLICATION_WINDOW_IDS_EXPRESSION="map({app, id }) | group_by(.app) | map({app: .[0].app, ids: map(.id)}) | map(select(.app == $CURRENT_WIN_NAME))[0] | .ids | sort"
ALL_APPLICATION_WINDOW_IDS=$(yabai -m query --windows | jq "$ALL_APPLICATION_WINDOW_IDS_EXPRESSION")
GET_NEXT_ID=".[(index($CURRENT_WIN_ID) + 1) % length]"
NEXT_ID=$(echo $ALL_APPLICATION_WINDOW_IDS | jq "$GET_NEXT_ID")
echo "app: $CURRENT_WIN_NAME ids: $ALL_APPLICATION_WINDOW_IDS"

if [[ $NEXT_ID != "null" ]]; then
	echo "moving to window with id: $NEXT_ID"
	yabai -m window --focus $NEXT_ID
else
	echo "could not find another instance of: $CURRENT_WIN_NAME"
fi
