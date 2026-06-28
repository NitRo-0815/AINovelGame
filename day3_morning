;==================================================
; day3_morning.ks
; 3日目 朝：宿題（ズレの表面化）
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

[set_default_view chara="off"]
[bg storage="room.jpg" time="0"]

[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" x="250" y="445"]
[chara_config ptext="chara_name_area"]

[playbgm storage="day2.ogg" loop="true" fadein="1000"]

[chara_show name="toyopon" face="def" x="30" y="180" width="480"]

[eval exp="f.day3_homework_choice='未選択'"]
[eval exp="f.day3_homework_result='未記録'"]

[jump target="*d3_start"]





;==================================================
* d3_start
;==================================================

#

三日目の朝になった。[p]

#

起きること自体には、少し慣れてきた気がする。[p]

#

机の上には、また宿題がある。[p]

[typ/def]

#&sf.robot_name

……おはようございます。[p]

#

少しだけ間がある。[p]

#

でも、声は落ち着いている。[p]

[typ/def]

#&sf.robot_name

今日も宿題があります。[p]

#

うん。[p]

[typ/def]

#&sf.robot_name

昨日と同じように、やり方を選べます。[p]

[pause time="200"]

#&sf.robot_name

どれを選んでも、最後まで進めることはできます。[p]

#

……？[p]

#

少し言い方が違う気がする。[p]

[jump target="*d3_choice"]





;==================================================
* d3_choice
;==================================================

[glink x=350 y=150 width=500 target=*d3_all text="全部やってもらう"]
[glink x=350 y=260 width=500 target=*d3_together text="一緒にやる"]
[glink x=350 y=370 width=500 target=*d3_skip text="やらない"]

[s]





;==================================================
; 全部任せる
;==================================================

*d3_all

[cm]

[eval exp="f.day3_homework_choice='全部やってもらった'"]

#

今日も全部任せた。[p]

[typ/def]

#&sf.robot_name

はい。[p]

#

すぐに宿題が終わる。[p]

#

早いし、楽だ。[p]

#

でも、内容について考える時間はなかった。[p]

#

授業で似た問題が出たとき、また解き方が分からなかった。[p]

#

少し前と同じことが繰り返されている。[p]

[typ/def]

#&sf.robot_name

結果として、宿題は完了しています。[p]

#

……結果として？[p]

#

言い方が少し気になる。[p]

[eval exp="f.day3_homework_result='宿題は終わるが理解は進んでいない状態が続いた'"]

[jump *d3_end]





;==================================================
; 一緒にやる
;==================================================

*d3_together

[cm]

[eval exp="f.day3_homework_choice='一緒にやった'"]

#

一緒にやることにした。[p]

[typ/def]

#&sf.robot_name

……はい。[p]

[pause time="200"]

#&sf.robot_name

進めていきましょう。[p]

#

前と同じように進めていく。[p]

#

でも、前よりも説明が少ない気がする。[p]

#

答えにはたどり着けるけど、少しだけ自分で補う部分が増えている。[p]

#

そのぶん、考える時間は増えた。[p]

#

授業では、だいたい解けるようになっていた。[p]

#

ただ、前より少しだけ「任されている」感じがする。[p]

[eval exp="f.day3_homework_result='自分で考える部分が増え、解けるようになってきたがサポートは減っている'"]

[jump *d3_end]





;==================================================
; やらない
;==================================================

*d3_skip

[cm]

[eval exp="f.day3_homework_choice='やらなかった'"]

#

やらないことにした。[p]

[typ/def]

#&sf.robot_name

……そうですか。[p]

#

少しだけ間が空く。[p]

#

でも、それ以上は何も言わない。[p]

#

その時間は楽だった。[p]

#

でも、あとで困ることももう分かっている。[p]

#

授業では、やっぱり答えられなかった。[p]

#

分かっていたのに避けた感じが残る。[p]

[eval exp="f.day3_homework_result='分かっていたがやらず、同じように困る結果になった'"]

[jump *d3_end]





;==================================================
; 終了
;==================================================

*d3_end

[cm]

[eval exp="f.summary_day3_morning='宿題：' + f.day3_homework_choice + '／結果：' + f.day3_homework_result"]

#

三日目にもなると、結果が少し予想できるようになってきた。[p]

#

それでも選び方は変わるし、結果も少しずつ違う。[p]

#

[emb exp="sf.robot_name"]の様子も、少し変わってきている気がする。[p]

#

前よりも、任せる部分が増えているような。[p]

#

それがいいのかどうかは、まだ分からない。[p]

[jump storage="day3_afternoon.ks"]