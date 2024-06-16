date_formatted=$(date "+%a %F %H:%M")
battery_status=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "state" | xargs)
battery_life=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "to\ full|to\ empty" | xargs)
battery_percentage=$(upower -i $(upower -e | grep BAT) | grep --color=never -E "percentage" | xargs)

echo "$battery_status | $battery_life | $battery_percentage | $date_formatted"
