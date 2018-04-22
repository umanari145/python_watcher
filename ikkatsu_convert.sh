#!/bin/sh

water_mark_path='watermark.png'


#ファイルパスからディレクトを取得
#ファイル名を取得
#拡張子と拡張子以外を取得
#拡張子以外をリネームし拡張子を付けて総合ファイルパスを作る
#
for target_img in `find ./* -name '*.jpg' `; do
   target_dir=`dirname ${target_img}`
   target_file_name=`basename ${target_img}`
   target_file_name_exclude_ext=${target_file_name%.*}
   target_file_name_ext=${target_file_name##*.}
   rename_file_path=${target_dir}/${target_file_name_exclude_ext}w.${target_file_name_ext}
   convert -composite -gravity Center ${target_img} ${water_mark_path} ${rename_file_path}
done
