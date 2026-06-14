;==================================================
; day1.ks
; 1日目：お世話ロボットがやってくる
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
; 背景を先に表示したいので、ここではキャラを表示しない
[set_default_view chara="off"]

; 念のため背景を即時表示
[bg storage="room.jpg" time="0"]

; メッセージボックスを中央寄せ・濃いめに再設定
[position left="200" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄も中央寄せしたメッセージボックスに合わせて再配置
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="200" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day1.ogg を配置すること
[playbgm storage="day1.ogg" loop="true" fadein="1000"]

; 変数初期化
[eval exp="f.robot_name=''"]
[eval exp="sf.robot_name=''"]

; 振り返り用変数の初期化
[eval exp="f.summary_day1='未記録'"]
[eval exp="f.summary_day2='未記録'"]
[eval exp="f.summary_day3='未記録'"]
[eval exp="f.summary_day4='未記録'"]
[eval exp="f.summary_day5='未記録'"]
[eval exp="f.summary_day6='未記録'"]
[eval exp="f.summary_day7='未記録'"]

; 背景を少し先に見せてから、とよぽん初登場
[wait time="300"]

; とよぽん初登場
; first.ks で toyopon は定義済み
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="800"]

[jump target="*day1_scene1"]
[s]




;==================================================
; シーン1：初登場
;==================================================

*day1_scene1

#？？？

初めまして！今日からみなさんのお世話をするロボットです！[p]

[jump target="*day1_scene2"]
[s]




;==================================================
; シーン2：名前をつけてほしい
;==================================================

*day1_scene2

[typ/def]

#？？？

まず初めに皆さんに名前をつけて欲しいです！[p]

[jump target="*day1_scene3"]

[s]



;==================================================
; シーン3：入力を促す
;==================================================

*day1_scene3

[typ/def]

#？？？

ぼくの名前を入力してください！[p]

[jump target="*day1_name_edit"]

[s]



;==================================================
; 名前入力画面
;==================================================

*day1_name_edit

; 再入力時のため、一時変数を空にしておく
[eval exp="f.robot_name=''"]

; 入力中はメッセージウィンドウを隠す
[layopt layer="message0" visible="false"]

; 入力用の背景画像
; data/image/15_input_A.png が必要
[image layer="1" storage="15_input_A.png" x="0" y="0"]

; 入力欄
; 画面中央に配置
; 960x640想定：幅400、左280で中央寄せ
[edit name="f.robot_name" left="450" top="450" width="400" height="52" size="30" maxchars="8"]

; 決定ボタン
; 入力欄の下に中央寄せ
; ボタン画像の横幅によって多少見え方が変わるため、中央付近に配置
[button graphic="config/arrow_next.png" target="*day1_name_commit" x="600" y="550"]

; 入力待ち
[s]





;==================================================
; 入力内容をcommitして確認
;==================================================

*day1_name_commit

; edit の内容を f.robot_name に反映
[commit]

; 入力欄とボタンを消す
[cm]

; 入力用画像を消す
[freeimage layer="1"]

; メッセージウィンドウを再表示
[layopt layer="message0" visible="true"]

; メッセージボックスを中央寄せ・濃いめに再設定
[position left="200" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄も中央寄せしたメッセージボックスに合わせて再配置
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="200" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

#？？？

「[emb exp="f.robot_name"]」ですね！[l][r]

[link target="*day1_name_ok"]【はい】[endlink]／
[link target="*day1_name_edit"]【いいえ】[endlink]

[s]





;==================================================
; 名前確定
;==================================================

*day1_name_ok

; 未入力だった場合の保険
[if exp="f.robot_name == ''"]
[eval exp="f.robot_name='とよぽん'"]
[endif]

; 入力された名前を、以降も使えるように保存
[eval exp="sf.robot_name=f.robot_name"]

; 振り返り用記録
[eval exp="f.summary_day1='名前：' + sf.robot_name"]

; 画面を整える
[cm]

[jump target="*day1_scene4"]

[s]



;==================================================
; シーン4：入力された名前で進行
;==================================================

*day1_scene4

; 名前をつけてもらったのでhappyにする
[chara_mod name="toyopon" face="happy" time="500"]

#&sf.robot_name

[emb exp="sf.robot_name"]ですね！これからよろしくお願いします！[p]

#

今日から、[emb exp="sf.robot_name"]との一週間の生活が始まる。[p]

[jump target="*day1_scene5"]

[s]



;==================================================
; シーン5：お世話開始
;==================================================

*day1_scene5

#&sf.robot_name

それでは、さっそくお世話を開始します。[p]

#

こうして、少し不思議なお世話ロボットとの一日目が始まった。[p]

[jump target="*day1_scene6"]





;==================================================
; シーン6：できること紹介
;==================================================

*day1_scene6

[chara_mod name="toyopon" face="happy" time="500"]

#&sf.robot_name

お世話ロボットとしてできることを紹介します！[p]

[typ/hap]

#&sf.robot_name

まず、家事ができます！掃除、洗濯、料理、片付け、予定管理、目覚まし、話し相手……だいたい何でもお任せください！[p]

#&sf.robot_name

スマホやエアコンに乗り移ることもできます！[p]

[jump target="*day1_scene7"]





;==================================================
; シーン7：一日目の終わり
;==================================================

*day1_scene7

[typ/def]

#&sf.robot_name

今日は、名前をつけてくれてありがとうございました。[p]

#&sf.robot_name

ぼくにとって、とても大切な一日になりました。[p]

#

そう言って、[emb exp="sf.robot_name"]はうれしそうにこちらを見ていた。[p]

[typ/hap]

#&sf.robot_name

それでは、今日はゆっくり休んでください。[p]

#&sf.robot_name

おやすみなさい。また明日、そばにいますね。[p]

#

こうして、[emb exp="sf.robot_name"]との一日目が静かに終わった。[p]

[jump storage="day2.ks"]