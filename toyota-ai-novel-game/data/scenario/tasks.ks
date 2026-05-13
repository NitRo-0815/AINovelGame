; ============================================================
; tasks.ks
; 課題A → 課題B → 課題C を順番に進めるファイルです。
;
; 役割:
; ・各課題の表示
; ・a / b の選択肢
; ・成功 / 失敗の分岐
; ・最後に result.ks へ移動
; ============================================================

*start

; 課題用の画面を準備します。
[cm]
[clearfix]
[freeimage layer="free"]
[layopt layer="message0" visible=true]
[eval exp="f.success_count = 0"]

; 最初の課題へ進みます。
[jump target="*task_a"]

; ------------------------------------------------------------
; 課題A
; ------------------------------------------------------------
*task_a

[show_task title="課題A"]

#困っている人
課題Aで困っています……。
[p]

[glink color="blue" text="a" target="*task_a_success" x=430 y=260 width=180 size=32]
[glink color="blue" text="b" target="*task_a_fail" x=670 y=260 width=180 size=32]
[s]

*task_a_success
[eval exp="f.task_result = 'success'"]
[eval exp="f.success_count += 1"]
[show_success]
[jump target="*task_b"]

*task_a_fail
[eval exp="f.task_result = 'fail'"]
[show_fail]
[jump target="*task_b"]

; ------------------------------------------------------------
; 課題B
; ------------------------------------------------------------
*task_b

[show_task title="課題B"]

#困っている人
課題Bで困っています……。
[p]

[glink color="blue" text="a" target="*task_b_success" x=430 y=260 width=180 size=32]
[glink color="blue" text="b" target="*task_b_fail" x=670 y=260 width=180 size=32]
[s]

*task_b_success
[eval exp="f.task_result = 'success'"]
[eval exp="f.success_count += 1"]
[show_success]
[jump target="*task_c"]

*task_b_fail
[eval exp="f.task_result = 'fail'"]
[show_fail]
[jump target="*task_c"]

; ------------------------------------------------------------
; 課題C
; ------------------------------------------------------------
*task_c

[show_task title="課題C"]

#困っている人
課題Cで困っています……。
[p]

[glink color="blue" text="a" target="*task_c_success" x=430 y=260 width=180 size=32]
[glink color="blue" text="b" target="*task_c_fail" x=670 y=260 width=180 size=32]
[s]

*task_c_success
[eval exp="f.task_result = 'success'"]
[eval exp="f.success_count += 1"]
[show_success]
[jump target="*finish_tasks"]

*task_c_fail
[eval exp="f.task_result = 'fail'"]
[show_fail]
[jump target="*finish_tasks"]

; ------------------------------------------------------------
; すべての課題が終わったら result.ks へ移動します。
; ------------------------------------------------------------
*finish_tasks

[cm]
[clearfix]
[freeimage layer="free"]
[jump storage="result.ks"]
