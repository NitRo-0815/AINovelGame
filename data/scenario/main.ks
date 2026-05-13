; ============================================================
; main.ks
; ゲーム全体の入口になるファイルです。
;
; 役割:
; ・ゲーム初期化
; ・共通設定
; ・character.ks 読み込み
; ・macro.ks 読み込み
; ・title.ks へ移動
; ============================================================

*start

; 画面に残っている文章やボタンを消します。
; タイトルからやり直した時にも、前の表示が残りにくくなります。
[cm]
[clearfix]
[freeimage layer=1]
[freeimage layer="free"]

; メニューやキー設定を使えるようにします。
; 不要な場合は [showmenubutton] を消しても大丈夫です。
[start_keyconfig]
[showmenubutton]

; よく使う変数をここで初期化します。
; f. から始まる変数はセーブデータに保存されるゲーム用変数です。
[eval exp="f.current_task = ''"]
[eval exp="f.task_result = ''"]
[eval exp="f.task_index = 0"]
[eval exp="f.success_count = 0"]

; 共通の画面設定です。
; メッセージウィンドウの位置や名前欄は、全シーンで使えるようにここで設定します。
[position layer="message0" left=130 top=500 width=1020 height=185 page=fore visible=true]
[position layer="message0" page=fore margint=42 marginl=52 marginr=56 marginb=42]
[layopt layer="message0" visible=true]

; キャラクター名を表示するための領域を作ります。
; #AIエージェント のように書いた時、この場所に名前が表示されます。
[ptext name="chara_name_area" layer="message0" color="white" size=27 bold=true x=155 y=510]
[chara_config ptext="chara_name_area"]

; キャラクター定義を読み込みます。
; character.ks の最後には [return] を書いておく想定です。
[call storage="character.ks"]

; 共通マクロを読み込みます。
; macro.ks の最後にも [return] を書いておく想定です。
[call storage="macro.ks"]

; 初期化が終わったらタイトル画面へ移動します。
[jump storage="title.ks"]
