help() {
    echo 'Moving the cursor:
  Ctrl + w   Delete word before cursor
  Alt  + d   Delete word after cursor
  Ctrl + a   Go to the beginning of the line (Home)
  Ctrl + e   Go to the End of the line (End)
  Ctrl + p   Previous command (Up arrow)
  Ctrl + n   Next command (Down arrow)
  Alt  + b   Back (left) one word
  Alt  + f   Forward (right) one word
  Ctrl + f   Forward one character
  Ctrl + b   Backward one character
  Ctrl + xx  Toggle between the start of line and current cursor position\n';
    echo 'Special keys:
  Ctrl + I   Tab
  Ctrl + J   Newline
  Ctrl + M   Enter\n';
    echo 'History:
  Ctrl + r   Recall the last command including the specified character(s)
             searches the command history as you type.
             Equivalent to : vim ~/.bash_history. 
  Ctrl + p   Previous command in history (i.e. walk back through the command history)
  Ctrl + n   Next command in history (i.e. walk forward through the command history)

  Ctrl + s   Go back to the next most recent command.
             (beware to not execute it from a terminal because this will also launch its XOFF).
  Ctrl + o   Execute the command found via Ctrl+r or Ctrl+s
  Ctrl + g   Escape from history searching mode
        !!   Repeat last command
      !abc   Run last command starting with abc
    !abc:p   Print last command starting with abc
        !$   Last argument of previous command
   ALT + .   Last argument of previous command
        !*   All arguments of previous command
^abc­^­def   Run previous command, replacing abc with def';
}

