# CONF

# put here the playlist link
link="https://www.youtube.com/playlist?list=PLUQdJOBCPME-37eNUh2KNjXGONC_UuGob";

# The "code", do not edit anything bellow
playlistId=$(echo "$link"|cut -d= -f2);
# echo "$playlistId"; # DEBUG
# get the videoIds from the playlist
playlist=$(wget "https://gdata.youtube.com/feeds/api/playlists/$playlistId?v=2" -o /dev/null -O -);
videoIds=$(for i in $(echo "$playlist"); do echo "$i"|grep videoid|sed 's/videoid/\ /g'|cut -d" " -f2|cut -d\> -f2|cut -d\< -f1; done;);
for i in $videoIds; do echo "http://youtube.com/watch?v=$i"; done
