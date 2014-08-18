#!/bin/sh

cli=/Applications/Karabiner.app/Contents/Library/bin/karabiner

# Hold Command+Q to Quit Application
$cli set remap.holdcommandQ 1
/bin/echo -n .

# Holding Key to Key threshold
$cli set parameter.holdingkeytokey_wait 250
/bin/echo -n .

# Swap the Tilde(~) key with Section (§) (For International English Keyboard)
$cli set remap.iso_swap_tilda_section 1
/bin/echo -n .

/bin/echo
