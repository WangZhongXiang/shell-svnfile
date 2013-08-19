#!/bin/sh
#oot=`svn info . | sed -n '3p' | awk '{print $3}'`  
#dev_dir="../src_v2.1" #包含最新的开发代码  
#dep_dir="./list" #一个基线代码,合并的基础  
#startTime="2013-08-05"
##cd $dev_dir  
#svn up  
users='(nalan|yantian|leduo)'
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
   ##   cp -a $dep_dir/$file $dep_dir/$file".bak"  
   ##   cp -a $file $dep_dir/$file   
   done  
done 
