
*start
*title
;メッセージレイヤを非表示にしておく
@layopt layer=message0 visible=false

;背景画像を設定
[image layer="base" page="fore" storage=title.JPEG]

[locate x=90 y=470 ]
[button graphic="config/gobutton.PNG" target=*first width= 500]


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
