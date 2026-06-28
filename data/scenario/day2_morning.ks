;==================================================
; day2_morning.ks
; 2日目 朝：宿題
; ・昨日に続く宿題イベント
; ・結果のみ提示（メリット・デメリット表現なし）
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

[set_default_view chara="off"]
[bg storage="room.jpg" time="0"]

[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" x="250" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

[playbgm storage="day2.ogg" loop="true" fadein="1000"]

[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

[eval exp="f.day2_homework_choice='未選択'"]
[eval exp="f.day2_homework_result='未記録'"]

[jump target="*d2_s1"]



;==================================================
* d2_s1
;==================================================

[typ/def]

#

朝になった。[p]

#

昨日決めた起き方で、なんとか起きることができた。[p]

#

机の上には、今日の宿題が置かれている。[p]

[typ/def]

#&sf.robot_name

おはようございます。[p]

#&sf.robot_name

今日も宿題がありますね。[p]

#

またか……。[p]

[typ/hap]

#&sf.robot_name

昨日の経験もあるので、今日は少し違う選び方もできるかもしれません。[p]

[jump target="*d2_choice"]



;==================================================
* d2_choice
;==================================================

[glink x=350 y=150 width=500 target=*d2_all text="全部やってもらう"]
[glink x=350 y=260 width=500 target=*d2_together text="教えてもらいながらやる"]
[glink x=350 y=370 width=500 target=*d2_skip text="今日はやらない"]

[s]



;==================================================
* d2_all
;==================================================

[cm]

[eval exp="f.day2_homework_choice='全部やってもらった'"]

#

今日も全部お願いすることにした。[p]

#

[emb exp="sf.robot_name"]はすぐに宿題を終わらせた。[p]

#

時間はたくさん余った。[p]

#

でも、内容はほとんど覚えていなかった。[p]

#

次の時間、授業で同じ問題が出たとき、答え方がまったく分からなかった。[p]

#

「昨日やったはずなのに」と思いながら、何も書けなかった。[p]

[eval exp="f.day2_homework_result='宿題は終わったが、授業で同じ問題が出ても解けなかった'"]

[jump storage="day2_afternoon.ks"]



;==================================================
* d2_together
;==================================================

[cm]

[eval exp="f.day2_homework_choice='一緒にやった'"]

#

今日は一緒にやることにした。[p]

#

時間はかかったけど、自分で考えながら進めた。[p]

#

途中で何度も止まったけど、少しずつ理解できた。[p]

#

授業で同じ問題が出たとき、少し迷いながらも解くことができた。[p]

#

昨日よりも、自分で考えられている感じがした。[p]

[eval exp="f.day2_homework_result='時間はかかったが、授業で同じ問題を自分で解けた'"]

[jump storage="day2_afternoon.ks"]


;==================================================
* d2_skip
;==================================================

[cm]

[eval exp="f.day2_homework_choice='やらなかった'"]

#

今日もやらないことにした。[p]

#

その時間は楽に過ごせた。[p]

#

でも、宿題はそのまま残った。[p]

#

授業で当てられたとき、答えられずに言葉に詰まった。[p]

#

周りの視線が少し気になった。[p]

[eval exp="f.day2_homework_result='宿題をしていなかったので授業で答えられなかった'"]




[jump storage="day2_afternoon.ks"]
``