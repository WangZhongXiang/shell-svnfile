#!/bin/sh
svn up  
users='(user1|wang|xiaogou)'
RID=`svn log -l 100 | egrep $users | awk '{ if($5>"2013-08-05") print $1}'|sort` #取用户username的修改文件履历,只取11.11之后的,但是考虑到速度,只看svnlog的前100条log  

for id in $RID  
do  
   #echo $id  
   files=`svn log -r $id --verbose | sed -n '4,$p' | awk '{if($1!="D")print $2}' | sed /^$/d` #组建目标文件路径  
   for file in $files  
   do
     if [[ "$file" =~ (.*)php ]]
     then
         echo $file
     fi
   done  
done 
