
#内容不能直接有{{
#find ./source -name "*.md" | xargs  grep '{{'
# 解决 xargs: unterminated quote 问题
find ./source -name "*.md" -print0 | xargs -0  grep "{{" 

#标题不能有 []
find ./source -name "*.md" |   grep "\["
find ./source -name "*.md" |   grep "\]"
