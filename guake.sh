#!/bin/bash 

# Save this script into set_colors.sh, make this file executable and run it: 
# 
# $ chmod +x set_colors.sh 
# $ ./set_colors.sh 
# 
# Alternatively copy lines below directly into your shell. 
# 
# *background: #1D1F21
# *foreground: #C5C8C6
# ! black
# *color0: #282A2E
# *color8: #373B41
# ! red
# *color1: #A54242
# *color9: #CC6666
# ! green
# *color2: #8C9440
# *color10: #B5BD68
# ! yellow
# *color3: #DE935F
# *color11: #F0C674
# ! blue
# *color4: #5F819D
# *color12: #81A2BE
# ! magenta
# *color5: #85678F
# *color13: #B294BB
# ! cyan
# *color6: #5E8D87
# *color14: #8ABEB7
# ! white
# *color7: #707880
# *color15: #C5C8C6
COLORS="#28282A2A2E2E:#A5A542424242:#8C8C94944040:#DEDE93935F5F:#5F5F81819D9D:#858567678F8F:#5E5E8D8D8787:#707078788080:#37373B3B4141:#CCCC66666666:#B5B5BDBD6868:#F0F0C6C67474:#8181A2A2BEBE:#B2B29494BBBB:#8A8ABEBEB7B7:#C5C5C8C8C6C6"
FOREGROUND="#C5C5C8C8C6C6"
BACKGROUND="#1D1D1F1F2121"

gconftool-2 -s -t string /apps/guake/style/background/color $BACKGROUND
gconftool-2 -s -t string /apps/guake/style/font/palette $COLORS
gconftool-2 -s -t string /apps/guake/style/font/color $FOREGROUND
# gconftool-2 -s -t string /apps/guake/style/background/color '#1D1F21'
# gconftool-2 -s -t string /apps/guake/style/font/color '#fcfce8e8c3c3'
# gconftool-2 -s -t string /apps/guake/style/font/palette '##282A2E:#ffff31312828:#51519f9f5050:#fbfbb8b82929:#55557373a3a3:#e0e02c2c6d6d:#16169393a5a5:#919181817575:#2d2d2b2b2828:#dada49493939:#9898bcbc3737:#ffffc6c66d6d:#6d6d9c9cbebe:#e3e356568282:#3434bebedada:#fcfce8e8c3c3'
