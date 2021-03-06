#!/usr/bin/env bash

#shell 命令
# printf format-string [arguments...]
# format-string 为格式控制字符串
# arguments 为参数列表

echo "Hello, Shell"
printf "Hello, Shell\n"
echo "================================================================================================="


printf "%-10s %-8s %-4s\n" 姓名  性别  体重kg
printf "%-10s %-8s %-4.2f\n" 郭靖  男  66.1234
printf "%-10s %-8s %-4.2f\n" 杨过  男  48.6543
printf "%-10s %-8s %-4.2f\n" 郭芙  女  47.9876
echo "================================================================================================="
#######################################################################################################
# %s %c %d %f都是格式替代符
#
# %-10s 指一个宽度为10个字符（-表示左对齐，没有则表示右对齐），任何字符都会被显示在10个字符宽的字符内，
# 如果不足则自动以空格填充，超过也会将内容全部显示出来。
#
# %-4.2f 指格式化为小数，其中.2指保留2位小数。
#######################################################################################################

# format-string为双引号
printf "%d %s\n" 1 "abc"
# 单引号与双引号效果一样
printf '%d %s\n' 1 "abc"
# 没有引号也可以输出
printf %s abcdef
# 格式只指定了一个参数，但多出的参数仍然会按照该格式输出，format-string 被重用
printf %s abc def
printf "%s\n" abc def
printf "%s %s %s\n" a b c d e f g h i j
# 如果没有 arguments，那么 %s 用NULL代替，%d 用 0 代替
printf "%s and %d \n"
echo "================================================================================================="

a=10
b=20
if [ $a == $b ]
then
   echo "a 等于 b"
elif [ $a -gt $b ]
then
   echo "a 大于 b"
elif [ $a -lt $b ]
then
   echo "a 小于 b"
else
   echo "没有符合的条件"
fi

num1=$[2*3]
num2=$[1+5]
if test ${num1} -eq ${num2}
then
    echo '两个数字相等!'
else
    echo '两个数字不相等!'
fi
echo "================================================================================================="

for loop in 1 2 3 4 5
do
    echo "The value is: $loop"
done
echo "================================================================================================="

int=1
while(( $int<=5 ))
do
    echo $int
    let "int++" # let 命令是 BASH 中用于计算的工具，用于执行一个或多个表达式，变量计算中不需要加上 $ 来表示变量。如果表达式中包含了空格或其他特殊字符，则必须引起来。
done
echo "================================================================================================="

a=0

until [ ! $a -lt 10 ]
do
   echo $a
   a=`expr $a + 1`
done
echo "================================================================================================="

#######################################################################################################
# case工作方式如上所示。取值后面必须为单词in，每一模式必须以右括号结束。取值可以为变量或常数。匹配发现取值符合某一模式后，
# 其间所有命令开始执行直至 ;;。
#
# 取值将检测匹配的每一个模式。一旦模式匹配，则执行完匹配模式相应命令后不再继续其他模式。如果无一匹配模式，使用星号 * 捕获该值，
# 再执行后面的命令。
# case的语法和C family语言差别很大，它需要一个esac（就是case反过来）作为结束标记，每个case分支用右圆括号，用两个分号表示break。
#######################################################################################################

echo '输入 1 到 4 之间的数字:'
echo '你输入的数字为:'
read aNum
case $aNum in
    1)  echo '你选择了 1';;
    2)  echo '你选择了 2';;
    3)  echo '你选择了 3';;
    4)  echo '你选择了 4';;
    *)  echo '你没有输入 1 到 4 之间的数字';;
esac
echo "================================================================================================="

# 跳出循环
#######################################################################################################
# 在循环过程中，有时候需要在未达到循环结束条件时强制跳出循环，Shell使用两个命令来实现该功能：break和continue。
# break命令允许跳出所有循环（终止执行后面的所有循环）。
# continue命令与break命令类似，只有一点差别，它不会跳出所有循环，仅仅跳出当前循环。
#######################################################################################################
while :
do
    echo -n "输入 1 到 5 之间的数字:"
    read aNum
    case $aNum in
        1|2|3|4|5) echo "你输入的数字为 $aNum!"
        ;;
        *) echo "你输入的数字不是 1 到 5 之间的! 游戏结束"
            break
        ;;
    esac
done

