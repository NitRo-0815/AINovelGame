;==================================================
; day3_3.ks
;
; 内容：
; ・最新型ロボット登場
; ・最終選択
; ・エンディングへ
;==================================================


;--------------------------------------------------
*start
;--------------------------------------------------
[room/evening time="500"]
[chara_show name="toyopon" layer="1" face="def" x="30" y="180" width="480" time="500"]

#
家に着いた。[p]

#お父さん

おかえり！[p]

#お父さん

家庭用ロボットとは順調そうじゃないか！[p]

#お父さん

あれは安くて、お試しで買ったものだ。[p]

#
父はリビングに立つロボットを指差した。[p]
[chara_show name="agent009" layer="1" face="def" x="650" y="100" width="480" time="500"]
; とよぽんをレイヤー1で移動（chara_moveはlayer1で不確実なためhide→show）
[chara_hide name="toyopon" layer="1" time="0"]
[chara_show name="toyopon" layer="1" face="def" x="650" y="120" width="480" time="500"]


#お父さん

最新の機種を買ってきたぞ！[p]

#お父さん

旧型はお店で買い取ってくれるらしいし、最新型は超高度な処理能力を持っている！[p]

#
見慣れないロボットが立っている。[p]

#AGENT009

はじめまして。[p]

#AGENT009

私はAGENT009です。[p]

#AGENT009

生活支援、学習支援、家事支援に対応しています。[p]

#AGENT009

あなたに最適な提案を行います。[p]

#

横を見ると、[emb exp="sf.robot_name"]が静かに立っていた。[p]

#お父さん

どうする？[p]

#お父さん

最新型を使うか、それとも今のロボットと過ごすかだ。[p]

#


[glink color=blue size=28 x=350 y=220 width=500 target=*choose_agent text="AGENT009を選ぶ"]
[glink color=blue size=28 x=350 y=340 width=500 target=*choose_toyopon text=&sf.robot_name+"を選ぶ"]

[s]



;==================================================
; AGENT009を選ぶ
;==================================================

*choose_agent

[cm]

[eval exp="f.final_choice='AGENT009'"]
[eval exp="f.summary_final='新しい性能と可能性を持つAGENT009を選んだ'"]

#

新しいロボットを選ぶことにした。[p]

#お父さん

そうか！[p]

#お父さん

きっとその方が便利だぞ！[p]

#AGENT009

選択を確認しました。[p]

#AGENT009

これからよろしくお願いします。[p]

#

[emb exp="sf.robot_name"]は静かにうなずいた。[p]

#&sf.robot_name

今までありがとうございました。[p]

#&sf.robot_name

とても楽しかったです。[p]

#

みんなはどう思った？[p]

[eval exp="f.summary_day3_evening='最終選択：AGENT009を選んだ'"]

; とよぽん・AGENT009（レイヤー1）を同時に退場させてから結果画面へ
[chara_hide_all layer="1" time="500"]
[wait time="500"]

[jump storage="day3_summary.ks"]



;==================================================
; とよぽんを選ぶ
;==================================================

*choose_toyopon

[cm]

[eval exp="f.final_choice=sf.robot_name"]
[eval exp="f.summary_final='三日間を一緒に過ごした' + sf.robot_name + 'を選んだ'"]

#

これからも、[emb exp="sf.robot_name"]と過ごしたい。[p]

#お父さん

そうか？[p]

#お父さん

新しい方が高性能なんだけどなぁ。[p]

#

それでもいいと思った。[p]

#&sf.robot_name

……本当ですか？[p]

#&sf.robot_name

ありがとうございます！[p]

#&sf.robot_name

これからも頑張ります！[p]

#
[emb exp="sf.robot_name"]のこと[r]
なんで選んだんだろう？[p]

[eval exp="f.summary_day3_evening='最終選択：' + sf.robot_name + 'を選んだ'"]


; とよぽん・AGENT009（レイヤー1）を同時に退場させてから結果画面へ
[chara_hide_all layer="1" time="500"]
[wait time="500"]

[jump storage="day3_summary.ks"]
