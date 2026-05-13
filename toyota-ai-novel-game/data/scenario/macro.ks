; ============================================================
; macro.ks
; 複数の課題で使い回す演出マクロをまとめるファイルです。
;
; このファイルは main.ks から [call storage="macro.ks"] で読み込まれます。
; 最後に [return] を書くことで、main.ks に処理を戻します。
; ============================================================

; ------------------------------------------------------------
; show_task
; 課題タイトルを表示するマクロです。
;
; 使い方:
; [show_task title="課題A"]
; ------------------------------------------------------------
[macro name="show_task"]

; 前の演出テキストを消してから、新しい課題名を中央に表示します。
[freeimage layer="free"]
[ptext name="task_title" layer="free" page="fore" text="%title" x=500 y=220 size=80 color="orange" bold=true]

; クリックされるまで待ちます。
[l]

; 中央の大きな課題名を消し、左上に小さく表示し直します。
[freeimage layer="free"]
[ptext name="task_label" layer="free" page="fore" text="%title" x=36 y=28 size=30 color="orange" bold=true]

[endmacro]

; ------------------------------------------------------------
; show_success
; 成功演出を表示するマクロです。
;
; 使い方:
; [show_success]
; ------------------------------------------------------------
[macro name="show_success"]

; 成功メッセージを画面中央に表示します。
[ptext name="result_text" layer="free" page="fore" text="解決！" x=500 y=220 size=80 color="orange" bold=true]

; クリックされるまで、結果を画面に残します。
[l]

[endmacro]

; ------------------------------------------------------------
; show_fail
; 失敗演出を表示するマクロです。
;
; 使い方:
; [show_fail]
; ------------------------------------------------------------
[macro name="show_fail"]

; 失敗メッセージを画面中央に表示します。
[ptext name="result_text" layer="free" page="fore" text="失敗" x=545 y=230 size=60 color="skyblue" bold=true]

; クリックされるまで、結果を画面に残します。
[l]

[endmacro]

; main.ks に戻ります。
[return]
