; ============================================================
; Task macro prototype
; Resolved fgimage paths:
; - agent/standard  -> chara/agent/standard.PNG
; - agent/happy     -> chara/agent/happy.PNG
; - person1/confuse -> chara/person1/confuse.PNG
; - person1/standard -> chara/person1/standard.PNG
; ============================================================

[macro name="task_template"]
[cm]
[eval exp="tf.current_task_name = '%task_name'"]
[free name="task_name_area" layer="1"]

[chara_show name="person1" face="confuse" left=700 top=150 width=450 time=1]

[ptext name="task_name_area" layer="1" page="fore" text="%task_name" x=460 y=100 size=38 color="0xe8fbff" bold=true]

#
新しい課題が届いた。
[p]

#相談者
「%task_name」で困っています。どうしたらいいですか？
[p]

[glink color="blue" text="a：AIと協力して助ける" target="*task_success" x=360 y=250 width=560 size=24]
[glink color="blue" text="b：今回はうまく助けられない" target="*task_fail" x=360 y=350 width=560 size=24]
[s]
[endmacro]

*start

[cm]
[clearfix]
[freeimage layer=1]
[layopt layer=1 page=fore visible=true]
[start_keyconfig]
[showmenubutton]

; Simple background.
[bg storage="bg1.PNG" time="300"]

; Message window.
[position layer="message0" left=130 top=500 width=1020 height=185 page=fore visible=true]
[position layer="message0" page=fore margint="42" marginl="52" marginr="56" marginb="42"]
[layopt layer="message0" visible="true"]

; Name area.
[ptext name="chara_name_area" layer="message0" color="white" size=27 bold=true x=155 y=510]
[chara_config ptext="chara_name_area"]

; Characters.
[chara_new name="agent" storage="chara/agent/standard.PNG" jname="AIエージェント" width=450]
[chara_face name="agent" face="standard" storage="chara/agent/standard.PNG"]
[chara_face name="agent" face="happy" storage="chara/agent/happy.PNG"]

[chara_new name="person1" storage="chara/person1/standard.PNG" jname="相談者" width=450]
[chara_face name="person1" face="standard" storage="chara/person1/standard.PNG"]
[chara_face name="person1" face="confuse" storage="chara/person1/confuse.PNG"]

; Main scenario state.
[eval exp="f.task_index = 0"]

[ptext name="hud_title" layer="1" page="fore" text="AI TASK TRAINING" x=36 y=28 size=20 color="0x9be7ff" bold=true]
[ptext name="hud_agent" layer="1" page="fore" text="AGENT: STANDARD" x=36 y=58 size=18 color="0xdff8ff"]

[chara_show name="agent" left=100 top=150 width=450 time=300]

#AIエージェント
準備完了。課題を順番に確認していきましょう。
[p]

*task_a
[task_template task_name="課題A"]

*task_b
[task_template task_name="課題B"]

*task_c
[task_template task_name="課題C"]

*task_success
[chara_mod name="person1" face="standard"]
[chara_mod name="agent" face="happy"]
[free name="hud_agent" layer="1"]
[ptext name="hud_agent" layer="1" page="fore" text="AGENT: HAPPY" x=36 y=58 size=18 color="0xdff8ff"]

#相談者
ありがとう。
[p]

#AIエージェント
どういたしまして。
[p]

[jump target="*task_reset"]

*task_fail
#
助けられなかった。
[p]

[jump target="*task_reset"]

*task_reset
[free name="task_name_area" layer="1"]
[chara_hide name="person1" time=1]
[chara_mod name="agent" face="standard"]
[free name="hud_agent" layer="1"]
[ptext name="hud_agent" layer="1" page="fore" text="AGENT: STANDARD" x=36 y=58 size=18 color="0xdff8ff"]
[eval exp="f.task_index += 1"]

[if exp="f.task_index == 1"]
	[jump target="*task_b"]
[elsif exp="f.task_index == 2"]
	[jump target="*task_c"]
[else]
	[jump target="*task_end"]
[endif]

*task_end
[cm]
#
すべての課題が終了した。
[p]

#AIエージェント
次の課題セットも、このテンプレートで追加できます。
[p]

[glink color="blue" text="もう一度実行する" target="*start" x=390 y=300 width=500 size=24]
[s]
