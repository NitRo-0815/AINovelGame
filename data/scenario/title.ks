
*start
*title
;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;背景画像を設定
[image layer="base" page="fore" storage=bg1.PNG]

[locate x=200 y=300 ]
[button graphic="start.png" target=*first]

; [glink] 文字ボタンを出します。
[glink x="370" y="300" text="HAIの世界へ行く！" target="*first"]

[s]

;つづきからボタンが押された場合。ロード画面を表示
*loadmenu
[cm]
[showload]

[jump target=*title]
[s]

;ストーリー最初から
*first
[cm]
[freeimage layer=1]
;メッセージレイヤを再度表示する
@layopt layer=message0 visible=true

; [jump] day1_1.ksへ。
[jump storage="day0.ks"]
