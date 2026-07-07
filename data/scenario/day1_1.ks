;==================================================
; day1_1.ks
; 
; 内容：
; ・ロボットが届く
; ・できることの紹介
; ・名前をつける
; ・次の出来事 day1_2.ks へ
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------



[free layer="1" name="maskB" time="1000" wait="false"] [wait time="200"]

#
次の日[p]

; 背景を即時表示
[room/day time="500"]


[jump target="*day1_1_scene1"]

[s]





;==================================================
; シーン1：初登場
;==================================================

*day1_1_scene1

ピンポーン[p]

#お父さん

届いたか！[p]
昨日のテレビでロボットに興味が沸いてさ[r]
toyozonで安かったから買ってみたんだ！[p]

古い型のだが、お試しにはちょうどいいだろう！[p]

#
箱を開けた[p]
; とよぽん初登場
; first.ks で toyopon は定義済み
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="500"]
;次のシーンへ
[jump target="*day1_1_scene2"]

[s]





;==================================================
; シーン2：できること紹介
;==================================================

*day1_1_scene2
[typ/def]
#？？？

こんにちは！私は家庭用お世話ロボット、ハウスボットです！[p]

私は、あらゆる家事ができます！[p]
掃除、洗濯、料理、片付け…だいたい何でもお任せください！[p]

スマホや家電にアクセスして、乗り移ることもできます！[p]

すごいでしょう！！！！[p]

#
・・・[p]

#？？？

ぼくは、人のためになることと、五平餅が大好きです！[p]

よろしくお願いします！[p]

[typ/def]

[jump target="*day1_1_scene3"]

[s]





;==================================================
; シーン3：名前をつけてほしい
;==================================================

*day1_1_scene3

#？？？

はじめに、ひとつだけお願いがあります！[p]

[typ/hap]

これから呼んでもらう、名前をつけてください！[p]

#
このロボットに名前をつけてあげよう！[p]

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
[edit name="f.robot_name" left="450" top="450" width="400" height="52" size="30" maxchars="8"]

; 決定ボタン
[button graphic="config/arrow_next.png" target="*day1_name_commit" x="600" y="550"]

; 入力待ち
[s]





;==================================================
; 入力内容をcommitして確認
;==================================================

*day1_name_commit

; edit の内容を f.robot_name に反映
[commit]

; 未入力だった場合の保険
[if exp="f.robot_name == ''"]
[eval exp="f.robot_name='とよぽん'"]
[endif]

; 入力欄とボタンを消す
[cm]

; 入力用画像を消す
[freeimage layer="1"]

; メッセージウィンドウを再表示
[layopt layer="message0" visible="true"]

; メッセージボックス再設定
[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄再設定
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="250" y="445" color="0xffffff" edge="0x000000"]
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

; 入力された名前を、以降も使えるように保存
[eval exp="sf.robot_name=f.robot_name"]

; 朝イベントの記録
[eval exp="f.summary_day1_morning='お世話ロボットが登場。できることを紹介してもらい、名前を「' + sf.robot_name + '」に決めた。'"]

; 画面を整える
[cm]

[chara_mod name="toyopon" face="happy" time="500"]

[jump target="*day1_morning_scene4"]

[s]





;==================================================
; シーン4：名前確定後
;==================================================

*day1_morning_scene4

[typ/hap]

#&sf.robot_name

[emb exp="sf.robot_name"]ですね！[p]

#&sf.robot_name

ありがとう！いい名前です！[p]

; 次の出来事へ
; 
[jump storage="day1_2.ks"]
