;==================================================
; day4.ks
; 4日目：読み聞かせの練習
; 背景：とよぽんが話を忘れてしまうので、プレイヤーが助ける
; 方針：間違った選択肢でも、そのまま物語として進む
; 選択肢：glink 使用
;==================================================

*start

[set_default_view chara="off"]
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

; 選択肢用変数の初期化
[eval exp="f.c1=''"]
[eval exp="f.c2=''"]
[eval exp="f.c3=''"]
[eval exp="f.c4=''"]
[eval exp="f.c5=''"]
[eval exp="f.c6=''"]
[eval exp="f.c7=''"]
[eval exp="f.c8=''"]

; 正解数
[eval exp="f.correct_count=0"]

[jump target="*day4_scene1"]


;==================================================
; シーン1：読み聞かせ開始
;==================================================

*day4_scene1

[typ/hap]
#&sf.robot_name

ねえ、今日は読み聞かせの練習をさせてほしいです！[p]

#

読み聞かせ？[p]

[typ/def]
#&sf.robot_name

はい。桃太郎のお話を読もうと思うのですが……。[p]

[typ/def]
#&sf.robot_name

実は、ところどころ内容を忘れてしまっていて。[p]

#

忘れちゃったの？[p]

[typ/def]
#&sf.robot_name

はい……。お世話ロボットなのに、少し恥ずかしいです。[p]

[typ/hap]
#&sf.robot_name

なので、ぼくが言葉に詰まったら、次に続く言葉を選んで助けてくれませんか？[p]

#

うん。任せて。[p]

[typ/hap]
#&sf.robot_name

ありがとうございます！たとえ少し違っていても、あなたが選んでくれた言葉で読んでみますね。[p]

[jump target="*day4_read1"]


;==================================================
; 選択肢1：お爺さんは山へ？
; 正解：芝刈り
;==================================================

*day4_read1

[typ/def]
#&sf.robot_name

むかーし昔、あるところに、お爺さんとお婆さんが暮らしていました。[p]

[typ/def]
#&sf.robot_name

お爺さんは山へ……ええと、山へ……。[p]

[typ/def]
#&sf.robot_name

何をしに行ったのでしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c1_shibakari text="芝刈り"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c1_chikurin text="竹林"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c1_yamakaji text="山火事"]

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

[typ/def]
#&sf.robot_name

少し違う気もしますが、あなたが選んでくれたので、そのまま読んでみます。[p]
[endif]

[typ/def]
#&sf.robot_name

お爺さんは山へ[emb exp="f.c1"]に行きました。[p]

[typ/def]
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

[typ/def]
#&sf.robot_name

ええと、どんなふうに流れてくるんでしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c2_zabun text="ざぶーん、ざぶーんと"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c2_donbura text="どんぶらこ、どんぶらこと"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c2_basha text="バシャバシャバシャと"]

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

[typ/def]
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

[typ/def]
#&sf.robot_name

そして桃を切ってみると、中から元気な男の子が生まれました。[p]

[typ/def]
#&sf.robot_name

その子の名前は……。[p]

[typ/def]
#&sf.robot_name

あれ？何太郎でしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c3_kibi text="キビ太郎"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c3_tanaka text="田中太郎"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c3_momo text="桃太郎"]

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

[typ/def]
#&sf.robot_name

たしか桃から生まれたような気もしますが……でも、今は[emb exp="f.c3"]で進めます。[p]
[endif]

[typ/def]
#&sf.robot_name

その子は[emb exp="f.c3"]と名づけられました。[p]

[typ/def]
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

[typ/def]
#&sf.robot_name

ええと……何を持たせたのでしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c4_onigiri text="おにぎり"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c4_kibidango text="キビだんご"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c4_mame text="豆"]

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

[typ/def]
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

[typ/def]
#&sf.robot_name

最初に出会ったのは……。[p]

[typ/def]
#&sf.robot_name

ええと、誰でしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c5_dobashi text="江刺さん"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c5_ookami text="オオカミ"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c5_inu text="犬"]

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

[typ/def]
#&sf.robot_name

桃太郎のお話に出てきましたっけ……？でも、きっと頼もしい仲間ですね。[p]
[endif]

[typ/def]
#&sf.robot_name

[emb exp="f.c3"]は[emb exp="f.c5"]に出会いました。[p]

[typ/def]
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

[typ/def]
#&sf.robot_name

ええと、次の仲間は誰でしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c6_saru text="さる"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c6_gorira text="ゴリラ"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c6_momonga text="モモンガ"]

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

[typ/def]
#&sf.robot_name

あれ、そんな仲間もいましたっけ……？でも、続けてみます。[p]
[endif]

[typ/def]
#&sf.robot_name

次に[emb exp="f.c3"]は[emb exp="f.c6"]に出会いました。[p]

[typ/def]
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

[typ/def]
#&sf.robot_name

ううん、ここまで来ているのに思い出せません。[p]

[typ/def]
#&sf.robot_name

最後の仲間は誰でしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c7_hagewashi text="ハゲワシ"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c7_fukurou text="フクロウ"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c7_kiji text="キジ"]

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

キジです！犬、さる、キジ。これでそろいました！[p]
[else]
[typ/def]
#&sf.robot_name

[emb exp="f.c7"]……。[p]

[typ/def]
#&sf.robot_name

空を飛ぶ仲間、という意味では近い……のでしょうか。少し自信がありません。[p]
[endif]

[typ/def]
#&sf.robot_name

最後に[emb exp="f.c3"]は[emb exp="f.c7"]に出会いました。[p]

[typ/def]
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

[typ/def]
#&sf.robot_name

そして[emb exp="f.c3"]は……。[p]

[typ/def]
#&sf.robot_name

最後は、どうするんでしたっけ？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day4_c8_throw text="鬼に持っていたものを投げた"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day4_c8_defeat text="鬼を倒した"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day4_c8_friend text="鬼と仲良くなった"]

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

[typ/def]
#&sf.robot_name

元のお話とは少し違う気もしますが、あなたが選んだ結末で読んでみます。[p]
[endif]

[typ/def]
#&sf.robot_name

鬼ヶ島に着いた[emb exp="f.c3"]は、[emb exp="f.c8"]。[p]

[typ/def]
#&sf.robot_name

そのあと、鬼に取られた宝物を取り返し、村へ帰りました。[p]

[typ/hap]
#&sf.robot_name

村の人たちは[emb exp="f.c3"]たちに、とても感謝しました。[p]

[typ/def]
#&sf.robot_name

めでたし、めでたし。[p]

[jump target="*day4_result"]


;==================================================
; 読み聞かせ結果
;==================================================

*day4_result

[typ/hap]
#&sf.robot_name

ふう……最後まで読めました。[p]

[typ/def]
#&sf.robot_name

途中で何度も忘れてしまいましたが、あなたが言葉を選んでくれたおかげです。[p]

[typ/def]
#&sf.robot_name

今日のお話は……。[p]

[typ/def]
#&sf.robot_name

お爺さんは山へ[emb exp="f.c1"]に行き、お婆さんが川で洗濯をしていると、大きな桃が[emb exp="f.c2"]流れてきました。[p]

[typ/def]
#&sf.robot_name

桃から生まれた子は[emb exp="f.c3"]と名づけられ、[emb exp="f.c4"]を持って鬼ヶ島へ向かいました。[p]

[typ/def]
#&sf.robot_name

道中で[emb exp="f.c5"]、[emb exp="f.c6"]、[emb exp="f.c7"]を仲間にして、最後は[emb exp="f.c8"]のです。[p]

[if exp="f.correct_count >= 7"]
[typ/hap]
#&sf.robot_name

すごいです！ほとんど元のお話どおりでした。あなたのおかげで、安心して読めました。[p]

[elsif exp="f.correct_count >= 4"]
[typ/hap]
#&sf.robot_name

少しだけ不思議なところもありましたが、ちゃんと桃太郎として最後まで読めましたね。[p]

[typ/def]
#&sf.robot_name

迷ったところも、あなたが選んでくれたので進むことができました。[p]

[else]
[typ/def]
#&sf.robot_name

ええと……元のお話とは、かなり違っていた気がします。[p]

[typ/hap]
#&sf.robot_name

でも、最後まで止まらずに読めました。助けてくれてありがとうございます。[p]
[endif]

#

ちゃんと最後まで読めてよかったね。[p]

[typ/hap]
#&sf.robot_name

はい！あなたがいてくれたからです。[p]

[typ/def]
#&sf.robot_name

読み聞かせは、間違えないことだけが大事なのではないんですね。[p]

[typ/def]
#&sf.robot_name

途中で迷っても、誰かが言葉をくれたら、物語は先に進めるんだとわかりました。[p]

[glink color=green size=28 x=180 y=330 width=500 target=*day4_end text="読み聞かせを終える"]

[s]


;==================================================
; 4日目終了
;==================================================

*day4_end

[cm]

[typ/hap]
#&sf.robot_name

今日は手伝ってくれて、本当にありがとうございました。[p]

[typ/def]
#&sf.robot_name

明日もまた、あなたのお世話をがんばりますね。[p]

[jump storage="day5.ks"]