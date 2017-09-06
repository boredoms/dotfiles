#!/bin/bash
#set -x
WID_PATH=/tmp/pidgin_new_message_xdotool_id
WID=$(cat $WID_PATH)

for x in `xdotool search -class Pidgin`;
do
    if ( xprop -id $x WM_WINDOW_ROLE | grep conversation &> /dev/null );
    then
	echo $x > $WID_PATH
    fi
done

NewMessage=$(xprop -id $WID | grep "_PIDGIN_UNSEEN_COUNT" | awk {'print $3'})

if [ $NewMessage -gt 0 ];
then
    echo -n "$NewMessage new message"
    if [ $NewMessage -gt 1 ];
    then
	echo -n "s"
    fi
    echo ' ^fg(#aa759f)//^fg()'
#else
#    echo "no unread messages"
fi
