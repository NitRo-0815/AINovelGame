*start

[cm]
[clearfix]
[freeimage layer=1]
[layopt layer=1 page=fore visible=true]
[start_keyconfig]
[showmenubutton]

[bg storage="room.jpg" time="300"]
[ptext layer="1" page="fore" text="AI PARTNER QUEST" x=90 y=92 size=54 color="0xe8fbff" bold=true]
[ptext layer="1" page="fore" text="CASE 01: 心が限界の友達" x=96 y=158 size=24 color="0x9be7ff"]
[ptext layer="1" page="fore" text="AIと人間が協力して、街の困りごとを解決する。" x=96 y=196 size=22 color="0xffffff"]
[button x=135 y=300 graphic="title/button_start.png" enterimg="title/button_start2.png" target="*game_start" keyfocus="1"]
[s]

*game_start
[cm]
[clearfix]
[freeimage layer=1]
[layopt layer=1 page=fore visible=true]

; Prototype variables.
[eval exp="f.empathy = 0"]
[eval exp="f.clarity = 0"]
[eval exp="f.action = 0"]
[eval exp="f.trust = 0"]

[bg storage="room.jpg" time="500" method="crossfade"]
[playbgm storage="music.ogg" loop="true" volume="45"]

; Message window.
[position layer="message0" left=130 top=500 width=1020 height=185 page=fore visible=true]
[position layer="message0" page=fore margint="42" marginl="52" marginr="56" marginb="42"]
[layopt layer="message0" visible="true"]

[ptext name="chara_name_area" layer="message0" color="white" size=27 bold=true x=155 y=510]
[chara_config ptext="chara_name_area"]

; Characters. Existing sample assets are reused for the prototype.
[chara_new name="luma" storage="chara/yamato/normal.png" jname="LUMA"]
[chara_face name="luma" face="happy" storage="chara/yamato/happy.png"]
[chara_face name="luma" face="sad" storage="chara/yamato/sad.png"]
[chara_new name="mina" storage="chara/akane/sad.png" jname="ミナ"]
[chara_face name="mina" face="normal" storage="chara/akane/normal.png"]
[chara_face name="mina" face="happy" storage="chara/akane/happy.png"]
[chara_face name="mina" face="sad" storage="chara/akane/sad.png"]

[ptext name="hud_title" layer="1" page="fore" text="CASE 01  心が限界の友達" x=36 y=28 size=20 color="0x9be7ff" bold=true]
[ptext name="hud_ai" layer="1" page="fore" text="AI PARTNER: LUMA / ONLINE" x=36 y=58 size=18 color="0xdff8ff"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY 0  CLARITY 0  ACTION 0" x=860 y=34 size=17 color="0x9be7ff"]

[chara_show name="luma" left=760 top=170 time=500]
#LUMA
起動完了。私は君専属のAIエージェント、LUMA。
[p]
情報整理は得意。でも、相手の気持ちに触れるのは、君のほうが上手かもしれない。
[p]

#
放課後の教室。友達のミナが、机に伏せたまま動かない。
[p]

[chara_hide name="luma" time=300]
[chara_show name="mina" left=430 top=160 time=500]
#ミナ
最近ずっとしんどい……。
[p]
文化祭の準備も、バイトも、家のこともあって。
[p]
何もやる気が出ない。
[p]

#
最初に、どう声をかける？
[p]

[glink color="blue" text="何があったか、少し聞かせて" target="*listen_first" x=330 y=150 width=620 size=24]
[glink color="blue" text="LUMAにすぐ解決策を出してもらう" target="*ai_first" x=330 y=250 width=620 size=24]
[glink color="blue" text="気合いで乗り切ろう、と励ます" target="*push_first" x=330 y=350 width=620 size=24]
[s]

*listen_first
[eval exp="f.empathy += 2; f.trust += 1"]
[free name="hud_scan" layer="1"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY 2  CLARITY 0  ACTION 0" x=860 y=34 size=17 color="0x9be7ff"]
#主人公
無理に話さなくてもいいよ。話せるところだけで大丈夫。
[p]
[chara_mod name="mina" face="normal"]
#ミナ
……うん。怒られないなら、少しだけ。
[p]
[jump target="*ask_luma"]

*ai_first
[eval exp="f.clarity += 1"]
[free name="hud_scan" layer="1"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY 0  CLARITY 1  ACTION 0" x=860 y=34 size=17 color="0x9be7ff"]
[chara_show name="luma" left=760 top=170 time=300]
#LUMA
候補を出すね。休養、相談窓口、シフト調整、先生への共有。
[p]
[chara_hide name="luma" time=200]
#ミナ
……正しいのはわかる。でも、今それを全部言われると、ちょっと苦しい。
[p]
[eval exp="f.trust -= 1"]
[jump target="*ask_luma"]

*push_first
[eval exp="f.empathy -= 1"]
[free name="hud_scan" layer="1"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY -1  CLARITY 0  ACTION 0" x=860 y=34 size=17 color="0x9be7ff"]
#主人公
あと少しだよ。気合いで乗り切ろう。
[p]
[chara_mod name="mina" face="sad"]
#ミナ
……うん。そうだよね。
[p]
でも、その「あと少し」がずっと続いてる気がする。
[p]
[jump target="*ask_luma"]

*ask_luma
[cm]
[chara_hide name="mina" time=200]
[chara_show name="luma" left=760 top=170 time=400]
#LUMA
状況を整理するね。
[p]
ミナは「疲れ」だけじゃなくて、ひとりで抱えすぎている可能性がある。
[p]
私は相談先や制度を探せる。でも、最初の安心は君の言葉で作れる。
[p]

#
LUMAの分析を聞いて、次にどう動く？
[p]

[glink color="blue" text="ミナの気持ちを確認してから、相談先を一緒に見る" target="*balanced_plan" x=250 y=145 width=780 size=23]
[glink color="blue" text="相談窓口の情報だけを送って、今日は帰る" target="*info_only" x=250 y=245 width=780 size=23]
[glink color="blue" text="自分だけで全部なんとかすると約束する" target="*human_only" x=250 y=345 width=780 size=23]
[s]

*balanced_plan
[eval exp="f.empathy += 1; f.clarity += 1; f.action += 2; f.trust += 2"]
[free name="hud_scan" layer="1"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY +  CLARITY +  ACTION ++" x=860 y=34 size=17 color="0x9be7ff"]
[chara_hide name="luma" time=200]
[chara_show name="mina" left=430 top=160 time=300]
#主人公
今すぐ決めなくていいよ。まず、何が一番つらいか一緒に整理しよう。
[p]
そのあと、LUMAに相談できる場所を探してもらう。
[p]
[chara_mod name="mina" face="normal"]
#ミナ
……一緒なら、見てみてもいいかも。
[p]
[jump target="*judge_end"]

*info_only
[eval exp="f.clarity += 2; f.action += 1; f.trust -= 1"]
[free name="hud_scan" layer="1"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY ?  CLARITY ++  ACTION +" x=860 y=34 size=17 color="0x9be7ff"]
#LUMA
相談先リストを作成したよ。担任、スクールカウンセラー、地域の相談窓口。
[p]
[chara_hide name="luma" time=200]
[chara_show name="mina" left=430 top=160 time=300]
#ミナ
ありがとう。でも、ひとりで連絡するのは少し怖いな。
[p]
[jump target="*judge_end"]

*human_only
[eval exp="f.empathy += 1; f.action -= 1"]
[free name="hud_scan" layer="1"]
[ptext name="hud_scan" layer="1" page="fore" text="EMPATHY +  CLARITY ?  ACTION -" x=860 y=34 size=17 color="0x9be7ff"]
[chara_hide name="luma" time=200]
[chara_show name="mina" left=430 top=160 time=300]
#主人公
自分が全部なんとかする。任せて。
[p]
#ミナ
うれしいけど……君までつらくなったら困るよ。
[p]
[jump target="*judge_end"]

*judge_end
[if exp="f.empathy >= 2 && f.clarity >= 1 && f.action >= 1 && f.trust >= 1"]
	[jump target="*ending_best"]
[elsif exp="f.clarity >= 2 && f.empathy <= 0"]
	[jump target="*ending_cold"]
[else]
	[jump target="*ending_normal"]
[endif]

*ending_best
[chara_mod name="mina" face="happy"]
#ミナ
明日、先生に話してみる。ひとりじゃないって思えた。
[p]
[chara_show name="luma" left=760 top=170 time=300]
#LUMA
私は道を探せる。君は、ミナが歩き出せる空気を作った。
[p]
協力、成功だね。
[p]
[jump target="*ending_common"]

*ending_cold
[chara_mod name="mina" face="sad"]
#ミナ
情報は助かる。でも、今はちょっと受け止めきれないかも。
[p]
[chara_show name="luma" left=760 top=170 time=300]
#LUMA
正しい情報だけでは届かない時がある。次は、先に気持ちを聞こう。
[p]
[jump target="*ending_common"]

*ending_normal
[chara_mod name="mina" face="normal"]
#ミナ
少しだけ楽になった。まだ怖いけど、明日また話してもいい？
[p]
[chara_show name="luma" left=760 top=170 time=300]
#LUMA
前進は小さくてもいい。次は、具体的な相談先まで一緒に進めそう。
[p]
[jump target="*ending_common"]

*ending_common
#
CASE 01 CLEAR
[p]
[stopbgm time="800"]
[glink color="blue" text="もう一度プレイする" target="*start" x=390 y=230 width=500 size=24]
[glink color="blue" text="タイトルへ戻る" storage="title.ks" target="*start" x=390 y=330 width=500 size=24]
[s]
