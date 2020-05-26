
time=`date "+%Y-%m-%d %H:%M:%S"`

for f in ./*/*;do
  base=$(basename $f .md)
  categories=$(basename $(dirname $f) $PWD)
  insert="---\ntitle: ${base}\ndate: ${time}\ncategories:\n- ${categories}\n---\n"
  echo  "${insert}$(cat $f)" > $f
done

