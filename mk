#!/bin/bash

# ディレクトリ名を指定するとディレクトリとボイラープレートファイルを作成する
# ================================================================================

# 定数 : ボイラープレートファイルのパス
boilerplate_file_path='./boilerplate.html'

# 第1引数 : ディレクトリ名を指定する
directory_name="$1"

# 引数必須チェック・ディレクトリ存在チェック
echo ''
if [ -z "${directory_name}" ]; then
  echo '第1引数でディレクトリ名を指定してください。中止します'
  exit 1
elif [ -d "./${directory_name}" ]; then
  echo "[${directory_name}] ディレクトリは既に存在しています。中止します"
  exit 1
fi

# 実行前確認・「y」と入力されなかった場合は中止する
echo "ディレクトリ名 : [${directory_name}]"
read -p '作成してよろしいですか？ (y) : ' confirm
echo ''
if [ ! "${confirm}" = 'y' ]; then
  echo '中止します'
  exit 1
fi

# 実行
mkdir -p "./${directory_name}"
cp "${boilerplate_file_path}" "./${directory_name}/index.html"
echo '作成完了'
