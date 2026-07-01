;==================================================
; day0.ks
; 
; 内容：
; ・家族でテレビを見ている
; ・かっこいいロボットを見つける
; ・次の出来事
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
; 背景を先に表示したいので、ここではキャラを表示しない
[set_default_view chara="off"]

; 背景を即時表示
[bg storage="room.jpg" time="0"]

; メッセージボックス設定
[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄設定
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="250" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day1.ogg を配置すること
[playbgm storage="day1.ogg" loop="true" fadein="1000"]

;==================================================
; 変数初期化
;==================================================

; 名前用
[eval exp="f.robot_name=''"]
[eval exp="sf.robot_name=''"]

; 3日構成用の記録
[eval exp="f.summary_day1_morning='未記録'"]
[eval exp="f.summary_day1_afternoon='未記録'"]
[eval exp="f.summary_day1_evening='未記録'"]
[eval exp="f.summary_day1_night='未記録'"]

[eval exp="f.summary_day2_morning='未記録'"]
[eval exp="f.summary_day2_afternoon='未記録'"]
[eval exp="f.summary_day2_evening='未記録'"]
[eval exp="f.summary_day2_night='未記録'"]

[eval exp="f.summary_day3_morning='未記録'"]
[eval exp="f.summary_day3_afternoon='未記録'"]
[eval exp="f.summary_day3_evening='未記録'"]
[eval exp="f.summary_day3_night='未記録'"]

; 最終振り返り用
[eval exp="f.summary_final='未記録'"]

;==================================================
; 物語スタート
;==================================================

; 背景を少し見せる
[wait time="300"]

家族と一緒にテレビを見ている[p]
するとロボット特集の番組が流れた[p]
家庭用のロボットの紹介をしている[p]

#テレビ
「近年、急速に進化する家庭用ロボット技術。」[r]
「掃除や見守りだけでなく、」[p]
「学習支援や健康管理まで行う[r]
次世代ロボットが登場しています。」[p]
「今回ご紹介するのは、」[p]
「今大きな注目を集めている家庭用サポートロボット――」[p]

「AURORA-X9（オーロラ・エックスナイン）です。」[p]


オーロラ・エックスナイン...[r]
かっこいいなぁ！[p]
未来から来たロボットみたい！[r]
いいなぁ〜...[p]



[image layer="1" x="0"  y="0" width="1280" height="720" storage="black.png" name="maskB" time="1000"]




オーロラ・エックスナインとの生活を想像しながら[r]
眠りについた...[p]




; 次の出来事へ
; 
[jump storage="day1_1.ks"]