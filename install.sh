#!/bin/bash

function err_quit()
{
    echo $1
    exit 1
}

function run()
{
    echo "==== Building $1 - Beging ... ======"
    [ -f $1/BUILD_DONE ] && echo "  Already build. Quit" && return

    ( cd $1 && test -x ./install.sh && CFLAGS="$CFLAGS" ./install.sh) || err_quit "XXXXXX Build $1 FAILED!!!XXXXX"
    echo "==== Building $1 - OK. ======"
}


################ Main ##############
# 判断当前系统
OS=
if [ `grep -c Ubuntu /etc/issue` -eq 1 ]; then
	OS="Ubuntu"
elif [ `grep -c "SUSE Linux Enterprise Server" /etc/issue` -eq 1 ]; then
	OS="SLES"
elif [ `grep -c CentOS /etc/issue` -eq 1 ]; then
	OS="CentOS"
fi

# 分别安装初始化数据
PROG="vim python shell"

for p in $PROG; do
    run $p $OS
done


exit 0


#1. subersion local 
D=~/.subversion/config
sed 's/^# global-ignores/global-ignores = tags cscope.* *.o *.lo *.la *.al .libs *.so *.so.[0-9]* *.a *.pyc *.pyo/' $D > $D.1
mv $D.1 $D


if [ `grep -c "$NOW/pack" $D` -eq 0 ]; then
        echo "PATH=$PATH:$NOW/pack" >> $D
        echo "export PATH" >> $D
fi


#3. vim
zypper -n install cscope
pushd vim
        ## vim环境安装
        cp -a .vimrc .vim ~
        cp -v .vimrc /etc/vimrc
popd

touch BUILD_DONE
exit 0
