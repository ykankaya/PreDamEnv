#!/bin/sh
cd ~/.config/qutebrowser/
wget -O dark.css https://raw.githubusercontent.com/alphapapa/solarized-everything-css/master/css/solarized-all-sites-dark.css
sed -i 's/#fff/#000000/g' dark.css
sed -i 's/#000/#ffffff/g' dark.css
sed -i 's/#002b36/#0e1112/g' dark.css
sed -i 's/#839496/#ffffff/g' dark.css
sed -i 's/#073642/#ffffff/g' dark.css
sed -i 's/#657b83/#ffffff/g' dark.css
sed -i 's/#eee8d5/#ffffff/g' dark.css
sed -i 's/#93a1a1/#ffffff/g' dark.css
sed -i 's/#586e75/#ffffff/g' dark.css
sed -i 's/#fdf6e3/#ffffff/g' dark.css
sed -i 's/#083c4a/#ffffff/g' dark.css
sed -i 's/#859900/#7fff00/g' dark.css
sed -i 's/#dc322f/#ff0000/g' dark.css
sed -i 's/#647300/#00ff00/g' dark.css
sed -i 's/#c1cacb/#ffffff/g' dark.css
sed -i 's/#721513/#ff0000/g' dark.css
sed -i 's/#b58900/#ffff00/g' dark.css
sed -i 's/#268bd2/#00bfff/g' dark.css
sed -i 's/#6c71c4/#a020f0/g' dark.css
sed -i 's/#2aa198/#1e90ff/g' dark.css
sed -i 's/#094352/#ffffff/g' dark.css
sed -i 's/#cb4b16/#ff4500/g' dark.css
sed -i 's/#d33682/#ff00ff/g' dark.css
