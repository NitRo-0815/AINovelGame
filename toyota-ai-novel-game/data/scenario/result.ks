; ============================================================
; result.ks
; すべての課題が終わった後の結果画面です。
;
; 役割:
; ・全課題終了メッセージ
; ・成功数表示
; ・タイトルへ戻るボタン
; ============================================================

*start

; 前の課題画面の表示を消します。
[cm]
[clearfix]
[freeimage layer=1]
[freeimage layer="free"]
[layopt layer="message0" visible=false]

; 背景を表示します。
[bg storage="bg1.PNG" time=300]

; 結果を表示します。
[ptext name="result_title" layer="1" page="fore" text="全課題終了" x=420 y=150 size=64 color="0xe8fbff" bold=true]
[ptext name="result_success" layer="1" page="fore" text="成功数：&f.success_count / 3" x=470 y=250 size=36 color="orange" bold=true]

; タイトルへ戻るボタンです。
[button x=390 y=390 graphic="title/button_start.png" enterimg="title/button_start2.png" target="*back_title" keyfocus=1]
[ptext name="back_label" layer="1" page="fore" text="タイトルへ戻る" x=515 y=407 size=24 color="0xffffff" bold=true]

[s]

*back_title

; 結果画面を消してタイトルへ戻ります。
[clearfix]
[freeimage layer=1]
[freeimage layer="free"]
[jump storage="title.ks"]
