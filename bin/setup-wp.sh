#!/usr/bin/env bash

npm run wp -- option set timezone_string 'Asia/Seoul'
npm run wp -- option option set date_format 'Y년 F j일'
npm run wp -- option option set time_format 'a g:i'
npm run wp -- option blog_public 0
npm run wp -- option permalink_structure '/%postname%/'
npm run wp -- rewrite flush

npm run wp -- theme delete twentyeleven twentyfifteen twentyfourteen twentynineteen \
twentyseventeen twentysixteen twentyten twentythirteen  \
twentytwelve twentytwenty twentytwentyfour twentytwentyone \
twentytwentythree twentytwentytwo

npm run wp -- plugin delete hello

npm run wp -- language core install  ko_KR --activate
