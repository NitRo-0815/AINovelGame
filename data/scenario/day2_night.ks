;==================================================
; day2_night.ks
; 2日目 夜：寝る準備（少しズレあり）
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

[playbgm storage="day1.ogg" loop="true" fadein="1000"]

[chara_show name="toyopon" face="def" x="30" y="180" width="480"]

[eval exp="f.day2_sleep_choice='未選択'"]
[eval exp="f.day2_sleep_result='未記録'"]

[eval exp="f.day2_wake_text=sf.robot_name + 'に起こしてもらう'"]

[jump target="*d2n_start"]





;==================================================
* d2n_start
;==================================================

#

夜になった。[p]

#

部屋の中が少し静かに感じる。[p]

#

今日のことを思い返すと、なんとなく頭に残るものがある。[p]

#

読み聞かせのことかもしれない。[p]

[typ/def]

#&sf.robot_name

……。[p]

#

少し、言葉が出るまで間がある。[p]

[typ/def]

#&sf.robot_name

今日は……おつかれさまでした。[p]

#

昨日より、少しだけ言い方がゆっくりだ。[p]

[typ/def]

#&sf.robot_name

寝る前に、明日のことを決めておきましょう。[p]

#

うん。[p]

[typ/def]

#&sf.robot_name

起き方を選びます。[p]

[pause time="300"]

#&sf.robot_name

どの方法が、いいでしょうか。[p]

[jump *d2n_choice]





;==================================================
* d2n_choice
;==================================================

[glink x=350 y=150 width=500 target=*d2n_toyopon text=&f.day2_wake_text]
[glink x=350 y=260 width=500 target=*d2n_alarm text="アラームで起きる"]
[glink x=350 y=370 width=500 target=*d2n_self text="自力で起きる"]

[s]





;==================================================
; とよぽんに起こしてもらう
;==================================================

*d2n_toyopon

[cm]

[eval exp="f.day2_sleep_choice=sf.robot_name + 'に起こしてもらう'"]

#

明日は起こしてもらう。[p]

[typ/def]

#&sf.robot_name

……はい。[p]

[pause time="200"]

#&sf.robot_name

起床時間に合わせて、声をかけます。[p]

#

以前と同じ説明のはずだけど、少しだけ言葉を選んでいる感じがする。[p]

#

安心できるのは確かだ。[p]

#

でも、自分で起きる力はあまり使っていない気もする。[p]

#

任せることに慣れてきているのかもしれない。[p]

[eval exp="f.day2_sleep_result='安心して任せた状態が続いている'"]

[jump *d2n_end]





;==================================================
; アラーム
;==================================================

*d2n_alarm

[cm]

[eval exp="f.day2_sleep_choice='アラームで起きる'"]

#

アラームを使うことにした。[p]

[typ/hap]

#&sf.robot_name

はい。[p]

[pause time="200"]

#&sf.robot_name

自分で起きる準備になります。[p]

#

少しだけ、言い直したように聞こえた。[p]

#

昨日より慎重になっているのかもしれない。[p]

#

アラームを設定して、枕元に置く。[p]

#

これなら起きられそうだ。[p]

#

ただ、音で起きるのは少し疲れるかもしれない。[p]

[eval exp="f.day2_sleep_result='自分で管理する意識が少し強くなった'"]

[jump *d2n_end]





;==================================================
; 自力
;==================================================

*d2n_self

[cm]

[eval exp="f.day2_sleep_choice='自力で起きる'"]

#

自力で起きることにした。[p]

[typ/def]

#&sf.robot_name

……はい。[p]

[pause time="300"]

#&sf.robot_name

挑戦、ですね。[p]

#

ほんの少しだけ、考えてから言った。[p]

#

前より慎重に言葉を選んでいる気がする。[p]

#

布団に入って、明日の予定を思い出す。[p]

#

ちゃんと起きられるかはわからない。[p]

#

でも、自分でやってみるのも悪くない気がした。[p]

[eval exp="f.day2_sleep_result='自分で起きようとする意識が強くなった'"]

[jump *d2n_end]





;==================================================
; 終了
;==================================================

*d2n_end

[cm]

[eval exp="f.summary_day2_night='寝る準備：' + f.day2_sleep_choice + '／結果：' + f.day2_sleep_result"]

#

部屋の明かりを落とした。[p]

#

今日一日のことが、少しだけ頭に浮かぶ。[p]

#

楽しかったこともあった。[p]

#

でも、少し引っかかる感じも残っている。[p]

#

[emb exp="sf.robot_name"]は近くにいる。[p]

#

いつもと同じはずなのに、少しだけ違う気もする。[p]

#

その理由は、まだよくわからない。[p]

#

こうして、二日目が終わった。[p]

[jump storage="day3_morning.ks"]