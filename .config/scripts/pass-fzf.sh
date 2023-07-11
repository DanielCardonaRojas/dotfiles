selected_file=$(find ~/.password-store/ -name "*.gpg" |
	sed -r 's/.*\.password-store\/(.*)\.gpg/\1/g' |
	fzf +m)

if ! [ -z $selected_file ]; then
	pass -c $selected_file
fi
