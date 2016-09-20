require "tk"

root = TkRoot.new {title "Tiny Tk Application"}
label = TkLabel.new(root) {text "Hallo Jörg!"}
label.pack
Tk.mainloop