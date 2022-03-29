hour=$(date '+%H')
case $hour in
	0[6-9]) printf "Good morning";;
	1[0-1]) printf "Hello";;
	1[2-5]) printf "Good afternoon";;
	1[6-9]) printf "Good evening";;
	2[0-1]) printf "Good night";;
	2[2-3]) printf "Sleep Well";;
	0[0-5]) printf "Sleep Well";;
esac
