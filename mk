#!/usr/bin/env bash

# ディレクトリ名を指定するとディレクトリとボイラープレートファイルを作成する
# ================================================================================

# 定数 : ボイラープレートファイルのパス
boilerplate_file_path='./boilerplate.html'

# 第1引数以降の全引数 : ディレクトリ名を指定する
directory_name="$@"

# 引数必須チェック
echo ''
if [ -z "${directory_name}" ]; then
  echo '第1引数でディレクトリ名を指定してください。中止します'
  exit 1
fi

# sed コマンドを指定する
sed_command='sed'
if type gsed > /dev/null 2>&1; then
  sed_command='gsed'
fi
# 小文字のみハイフンケースに変換する
directory_name="$(echo "${directory_name}" | "${sed_command}" -r 's/.*/\L\0/g; s/\s/-/g')"

# ディレクトリ存在チェック
if [ -d "./${directory_name}" ]; then
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
