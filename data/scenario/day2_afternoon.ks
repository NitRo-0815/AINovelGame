;==================================================
; day2_afternoon.ks
; 2日目 昼：読み聞かせ（完成版）
;==================================================

*start

[set_default_view chara="off"]
[bg storage="room.jpg" time="0"]

[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" x="250" y="445"]
[chara_config ptext="chara_name_area"]

[playbgm storage="day4.ogg" loop="true"]

[chara_show name="toyopon" face="def" x="30" y="180" width="480"]

[eval exp="f.correct_count=0"]

[jump *intro]



;==================================================
*intro
;==================================================

#&sf.robot_name

お願いがあります。[p]

#&sf.robot_name

読み聞かせの練習を、手伝ってもらえませんか？[p]

#

練習？[p]

#&sf.robot_name

途中を忘れてしまうことがあるので……[p]

#&sf.robot_name

その時は続きを教えてほしいです。[p]

#

つまり、自分が読み聞かせをする感じか。[p]

#&sf.robot_name

はい。一緒にお話を完成させましょう。[p]

[jump *q1]



;==================================================
; 問題群（元day4準拠）
;==================================================
[typ/def]

#&sf.robot_name

むかーし昔、あるところに、お爺さんとお婆さんが暮らしていました。[p]

#&sf.robot_name

お爺さんは山へ……ええと、山へ……。[p]

#&sf.robot_name

何をしに行ったのでしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c1_shibakari text="芝刈り"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c1_chikurin text="竹林"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c1_yamakaji text="山火事"]

[s]

*day4_c1_shibakari

[cm]
[eval exp="f.c1='芝刈り'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c1"]

*day4_c1_chikurin

[cm]
[eval exp="f.c1='竹林'"]
[jump target="*day4_after_c1"]

*day4_c1_yamakaji

[cm]
[eval exp="f.c1='山火事'"]
[jump target="*day4_after_c1"]


*day4_after_c1

[if exp="f.c1 == '芝刈り'"]

[typ/hap]

#&sf.robot_name

そうです、芝刈りです！思い出しました！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c1"]……でしたっけ？[p]

#&sf.robot_name

少し違う気もしますが、あなたが選んでくれたので、そのまま読んでみます。[p]

[endif]

[typ/def]

#&sf.robot_name

お爺さんは山へ[emb exp="f.c1"]に行きました。[p]

#&sf.robot_name

そして、お婆さんは川へ洗濯に行きました。[p]

[jump target="*day4_read2"]





;==================================================
; 選択肢2：桃の流れ方
; 正解：どんぶらこ、どんぶらこと
;==================================================

*day4_read2

[typ/def]

#&sf.robot_name

お婆さんが川で洗濯をしていると、大きな桃が……。[p]

#&sf.robot_name

ええと、どんなふうに流れてくるんでしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c2_zabun text="ざぶーん、ざぶーんと"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c2_donbura text="どんぶらこ、どんぶらこと"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c2_basha text="バシャバシャバシャと"]

[s]

*day4_c2_zabun

[cm]
[eval exp="f.c2='ざぶーん、ざぶーんと'"]
[jump target="*day4_after_c2"]

*day4_c2_donbura

[cm]
[eval exp="f.c2='どんぶらこ、どんぶらこと'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c2"]

*day4_c2_basha

[cm]
[eval exp="f.c2='バシャバシャバシャと'"]
[jump target="*day4_after_c2"]


*day4_after_c2

[if exp="f.c2 == 'どんぶらこ、どんぶらこと'"]

[typ/hap]

#&sf.robot_name

そうです！どんぶらこ、どんぶらこです！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c2"]……。[p]

#&sf.robot_name

うーん、少し勢いがある気もしますが……続けますね。[p]

[endif]

[typ/def]

#&sf.robot_name

大きな桃が、[emb exp="f.c2"]流れてきました。[p]

[jump target="*day4_read3"]





;==================================================
; 選択肢3：桃から生まれた子の名前
; 正解：桃太郎
;==================================================

*day4_read3

[typ/def]

#&sf.robot_name

お婆さんはその桃を家に持ち帰りました。[p]

#&sf.robot_name

そして桃を切ってみると、中から元気な男の子が生まれました。[p]

#&sf.robot_name

その子の名前は……。[p]

#&sf.robot_name

あれ？何太郎でしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c3_kibi text="キビ太郎"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c3_tanaka text="田中太郎"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c3_momo text="桃太郎"]

[s]

*day4_c3_kibi

[cm]
[eval exp="f.c3='キビ太郎'"]
[jump target="*day4_after_c3"]

*day4_c3_tanaka

[cm]
[eval exp="f.c3='田中太郎'"]
[jump target="*day4_after_c3"]

*day4_c3_momo

[cm]
[eval exp="f.c3='桃太郎'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c3"]


*day4_after_c3

[if exp="f.c3 == '桃太郎'"]

[typ/hap]

#&sf.robot_name

はい、桃太郎です！大事な主人公の名前でしたね。[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c3"]……。[p]

#&sf.robot_name

たしか桃から生まれたような気もしますが……でも、今は[emb exp="f.c3"]で進めます。[p]

[endif]

[typ/def]

#&sf.robot_name

その子は[emb exp="f.c3"]と名づけられました。[p]

#&sf.robot_name

[emb exp="f.c3"]はすくすくと育ち、やがて村の人を困らせている鬼を退治しに行くことになりました。[p]

[jump target="*day4_read4"]





;==================================================
; 選択肢4：お婆さんが持たせたもの
; 正解：キビだんご
;==================================================

*day4_read4

[typ/def]

#&sf.robot_name

旅立つ[emb exp="f.c3"]に、お婆さんは何かを持たせました。[p]

#&sf.robot_name

ええと……何を持たせたのでしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c4_onigiri text="おにぎり"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c4_kibidango text="キビだんご"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c4_mame text="豆"]

[s]

*day4_c4_onigiri

[cm]
[eval exp="f.c4='おにぎり'"]
[jump target="*day4_after_c4"]

*day4_c4_kibidango

[cm]
[eval exp="f.c4='キビだんご'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c4"]

*day4_c4_mame

[cm]
[eval exp="f.c4='豆'"]
[jump target="*day4_after_c4"]


*day4_after_c4

[if exp="f.c4 == 'キビだんご'"]

[typ/hap]

#&sf.robot_name

そうでした！キビだんごです！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c4"]……ですか。[p]

#&sf.robot_name

それを持って鬼ヶ島へ……少し不思議ですが、進めてみます。[p]

[endif]

[typ/def]

#&sf.robot_name

お婆さんは[emb exp="f.c3"]に[emb exp="f.c4"]を持たせました。[p]

[jump target="*day4_read5"]





;==================================================
; 選択肢5：最初の仲間
; 正解：犬
;==================================================

*day4_read5

[typ/def]

#&sf.robot_name

[emb exp="f.c3"]は鬼ヶ島へ向かう道中で、まず誰かに出会いました。[p]

#&sf.robot_name

最初に出会ったのは……。[p]

#&sf.robot_name

ええと、誰でしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c5_dobashi text="江刺さん"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c5_ookami text="オオカミ"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c5_inu text="犬"]

[s]

*day4_c5_dobashi

[cm]
[eval exp="f.c5='江刺さん'"]
[jump target="*day4_after_c5"]

*day4_c5_ookami

[cm]
[eval exp="f.c5='オオカミ'"]
[jump target="*day4_after_c5"]

*day4_c5_inu

[cm]
[eval exp="f.c5='犬'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c5"]


*day4_after_c5

[if exp="f.c5 == '犬'"]

[typ/hap]

#&sf.robot_name

犬です！思い出しました！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c5"]……。[p]

#&sf.robot_name

桃太郎のお話に出てきましたっけ……？でも、きっと頼もしい仲間ですね。[p]

[endif]

[typ/def]

#&sf.robot_name

[emb exp="f.c3"]は[emb exp="f.c5"]に出会いました。[p]

#&sf.robot_name

[emb exp="f.c3"]は[emb exp="f.c5"]に[emb exp="f.c4"]をひとつ渡し、仲間にしました。[p]

[jump target="*day4_read6"]





;==================================================
; 選択肢6：二番目の仲間
; 正解：さる
;==================================================

*day4_read6

[typ/def]

#&sf.robot_name

次に[emb exp="f.c3"]が出会ったのは……。[p]

#&sf.robot_name

ええと、次の仲間は誰でしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c6_saru text="さる"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c6_gorira text="ゴリラ"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c6_momonga text="モモンガ"]

[s]

*day4_c6_saru

[cm]
[eval exp="f.c6='さる'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c6"]

*day4_c6_gorira

[cm]
[eval exp="f.c6='ゴリラ'"]
[jump target="*day4_after_c6"]

*day4_c6_momonga

[cm]
[eval exp="f.c6='モモンガ'"]
[jump target="*day4_after_c6"]


*day4_after_c6

[if exp="f.c6 == 'さる'"]

[typ/hap]

#&sf.robot_name

はい、さるです！順番も思い出せました！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c6"]……。[p]

#&sf.robot_name

あれ、そんな仲間もいましたっけ……？でも、続けてみます。[p]

[endif]

[typ/def]

#&sf.robot_name

次に[emb exp="f.c3"]は[emb exp="f.c6"]に出会いました。[p]

#&sf.robot_name

[emb exp="f.c3"]は[emb exp="f.c6"]にも[emb exp="f.c4"]を渡し、仲間にしました。[p]

[jump target="*day4_read7"]





;==================================================
; 選択肢7：三番目の仲間
; 正解：キジ
;==================================================

*day4_read7

[typ/def]

#&sf.robot_name

最後に[emb exp="f.c3"]が出会った仲間は……。[p]

#&sf.robot_name

ううん、ここまで来ているのに思い出せません。[p]

#&sf.robot_name

最後の仲間は誰でしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c7_hagewashi text="ハゲワシ"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c7_fukurou text="フクロウ"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c7_kiji text="キジ"]

[s]

*day4_c7_hagewashi

[cm]
[eval exp="f.c7='ハゲワシ'"]
[jump target="*day4_after_c7"]

*day4_c7_fukurou

[cm]
[eval exp="f.c7='フクロウ'"]
[jump target="*day4_after_c7"]

*day4_c7_kiji

[cm]
[eval exp="f.c7='キジ'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c7"]


*day4_after_c7

[if exp="f.c7 == 'キジ'"]

[typ/hap]

#&sf.robot_name

キジです！思い出しました！[p]

[typ/hap]

#&sf.robot_name

これで、[emb exp="f.c5"]、[emb exp="f.c6"]、[emb exp="f.c7"]がそろいました！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c7"]……。[p]

#&sf.robot_name

空を飛ぶ仲間、という意味では近い……のでしょうか。少し自信がありません。[p]

[typ/def]

#&sf.robot_name

でも、これで[emb exp="f.c5"]、[emb exp="f.c6"]、[emb exp="f.c7"]がそろいました。[p]

[endif]

[typ/def]

#&sf.robot_name

最後に[emb exp="f.c3"]は[emb exp="f.c7"]に出会いました。[p]

#&sf.robot_name

[emb exp="f.c3"]は[emb exp="f.c7"]にも[emb exp="f.c4"]を渡し、仲間にしました。[p]

[typ/hap]

#&sf.robot_name

こうして、[emb exp="f.c3"]、[emb exp="f.c5"]、[emb exp="f.c6"]、[emb exp="f.c7"]は鬼ヶ島へ向かいました。[p]

[jump target="*day4_read8"]





;==================================================
; 選択肢8：鬼ヶ島でどうした？
; 正解：鬼を倒した
;==================================================

*day4_read8

[typ/def]

#&sf.robot_name

鬼ヶ島に着いた[emb exp="f.c3"]たちは、鬼たちと向き合いました。[p]

#&sf.robot_name

そして[emb exp="f.c3"]は……。[p]

#&sf.robot_name

最後は、どうするんでしたっけ？[p]

[eval exp="f.c8_throw_text='鬼に' + f.c4 + 'を投げた'"]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c8_throw text=&f.c8_throw_text]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c8_defeat text="鬼を倒した"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c8_friend text="鬼と仲良くなった"]

[s]

*day4_c8_throw

[cm]
[eval exp="f.c8='鬼に' + f.c4 + 'を投げた'"]
[jump target="*day4_after_c8"]

*day4_c8_defeat

[cm]
[eval exp="f.c8='鬼を倒した'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c8"]

*day4_c8_friend

[cm]
[eval exp="f.c8='鬼と仲良くなった'"]
[jump target="*day4_after_c8"]


*day4_after_c8

[if exp="f.c8 == '鬼を倒した'"]

[typ/hap]

#&sf.robot_name

そうです！[emb exp="f.c3"]は鬼を倒したんです！[p]

[else]

[typ/def]

#&sf.robot_name

[emb exp="f.c8"]……。[p]

#&sf.robot_name

元のお話とは少し違う気もしますが、あなたが選んだ結末で読んでみます。[p]

[endif]

[typ/def]

#&sf.robot_name

鬼ヶ島に着いた[emb exp="f.c3"]は、[emb exp="f.c8"]。[p]

#&sf.robot_name

そのあと、鬼に取られた宝物を取り返し、村へ帰りました。[p]

[typ/hap]

#&sf.robot_name

村の人たちは[emb exp="f.c3"]たちに、とても感謝しました。[p]

[typ/def]

#&sf.robot_name

めでたし、めでたし。[p]

;==================================================
; 練習後
;==================================================

*after_story

#

最後まで読み終えた。[p]

#&sf.robot_name

ありがとうございます！[p]

#&sf.robot_name

おかげで、最後まで読めました！[p]

#&sf.robot_name

これなら大丈夫そうです！[p]

#

かなり自信がついたみたいだ。[p]

#

そのまま、読み聞かせに出かけていった。[p]

[jump *result]



;==================================================
; 結果分岐
;==================================================

*result

[cm]

#

しばらくして、戻ってきた。[p]

[if exp="f.correct_count >= 6"]

[jump *success]

[else]

[jump *fail]

[endif]



;==================================================
; 成功
;==================================================

*success

[typ/hap]

#&sf.robot_name

成功しました！[p]

#&sf.robot_name

子どもたち、笑ってくれました！[p]

#

すこし誇らしそうだ。[p]

#

ちゃんと伝わったみたいだ。[p]

[eval exp="f.summary_day2_afternoon='読み聞かせ：うまく伝わり成功した'"]

[jump storage="day2_evening.ks"]



;==================================================
; 失敗（重要）
;==================================================

*fail

[typ/def]

#&sf.robot_name

……戻りました。[p]

#

様子が少し違う。[p]

#&sf.robot_name

最後まで読むことはできました。[p]

#&sf.robot_name

でも……少し違ったみたいです。[p]

#

違った？[p]

#&sf.robot_name

途中から、戸惑っている様子がありました。[p]

#&sf.robot_name

「それ違うよ」と言われてしまって……。[p]

#

……。[p]

#&sf.robot_name

どこまで変えていいのか、まだよく分からないです。[p]

#

少しだけ、元気が無くなっている。[p]

#

でも、まだ崩れてはいない。[p]

#

ただ、迷いが残った感じがした。[p]

[eval exp="f.summary_day2_afternoon='読み聞かせ：内容が伝わらず違和感が残った'"]

[jump storage="day2_evening.ks"]