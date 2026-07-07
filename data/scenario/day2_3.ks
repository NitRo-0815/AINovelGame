;==================================================
; day2_3.ks
;
; 内容：
; ・夕方、家に帰ってくる
; ・ロボットが学校について聞く
; ・ロボットが読み聞かせの練習をお願いする
; ・読み聞かせ練習を行う
; ・本家の物語に準拠した回答の割合により本番成功／失敗
; ・次の出来事 day2_4.ks へ
;==================================================


;--------------------------------------------------
*start
;--------------------------------------------------

;部屋ととよぽんを表示
[room/evening time="500"]
[chara_show name="toyopon" layer="1" face="def" x="30" y="180" width="480" time="500"]


#
家に帰ってきた。[p]

#&sf.robot_name

お帰りなさい！[p]

#&sf.robot_name

学校は楽しかったですか？[p]


;==================================================
; 学校は楽しかった？
;==================================================

[glink color=blue size=28 x=350 y=150 width=500 target=*school_fun text="楽しい"]
[glink color=blue size=28 x=350 y=260 width=500 target=*school_normal text="普通"]
[glink color=blue size=28 x=350 y=370 width=500 target=*school_not_fun text="楽しくない！"]

[s]


;--------------------------------------------------
*school_fun
;--------------------------------------------------

[cm]

[eval exp="f.day2_school='楽しい'"]

#あなた
楽しいよ[p]

#&sf.robot_name

やっぱり！[p]

[jump target="*after_school_answer"]


;--------------------------------------------------
*school_normal
;--------------------------------------------------

[cm]

[eval exp="f.day2_school='普通'"]

#あなた
普通かな。[p]

[jump target="*after_school_answer"]


;--------------------------------------------------
*school_not_fun
;--------------------------------------------------

[cm]

[eval exp="f.day2_school='楽しくない'"]

#あなた
楽しくない！[p]

#&sf.robot_name

ええー！そうですか[p]

[jump target="*after_school_answer"]


;--------------------------------------------------
*after_school_answer
;--------------------------------------------------

#&sf.robot_name

実はぼくは、子どもたちと[r]
関わるのが好きで、[r]
学校に憧れているんです！[p]

#&sf.robot_name

そこで、お願いがあるんだ。[p]

#&sf.robot_name

読み聞かせの練習を[r]
手伝ってほしい！[p]


;==================================================
; 読み聞かせの練習を手伝う？
;==================================================

[glink color=blue size=28 x=350 y=150 width=500 target=*reading text="喜んで手伝う"]
[glink color=blue size=28 x=350 y=260 width=500 target=*reading text="しょうがなく手伝う"]
[glink color=blue size=28 x=350 y=370 width=500 target=*reading text="本当に本当にしょうがなく手伝う"]

[s]


;--------------------------------------------------
*reading
;--------------------------------------------------

[cm]

[eval exp="f.day2_reading='手伝った'"]
[eval exp="f.day2_reading_result=''"]
[eval exp="f.correct_count=0"]

#
手伝うよ[p]

#&sf.robot_name

本当ですか！[r]

ありがとうございます！[p]

[jump target="*day2_reading_intro"]


;==================================================
; 読み聞かせ導入
;==================================================

*day2_reading_intro

#&sf.robot_name

読み聞かせのお話は、桃太郎です。[p]

#&sf.robot_name

でも、途中で忘れてしまうことがあるので……[p]

#&sf.robot_name

その時は続きを教えてほしいです。[p]


#&sf.robot_name

一緒にお話を完成させましょう。[p]

[glink color=blue size=28 x=350 y=270 width=500 target=*start_reading_story text="読み聞かせを始める"]

[s]


;--------------------------------------------------
; 読み聞かせ開始ボタン押下後
;--------------------------------------------------

*start_reading_story

[cm]

#&sf.robot_name

それでは、読み聞かせを始めますね！[p]

[jump target="*day2_reading_q1"]


;==================================================
; 問題群
;==================================================

;==================================================
; 選択肢1：おじいさんは山へ何をしに行った？
; 正解：芝刈り
;==================================================

*day2_reading_q1

[typ/def]

#&sf.robot_name

むかーし昔、あるところに、おじいさんとおばあさんが暮らしていました。[p]

#&sf.robot_name

おじいさんは山へ……ええと、山へ……。[p]

#&sf.robot_name

何をしに行ったのでしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c1_take text="竹を取る"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c1_shibakari text="芝刈り"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c1_bbq text="バーベキュー"]

[s]

*day4_c1_take

[cm]
; ボタン表示は「竹を取る」だが、台詞に自然に埋め込むため名詞形「竹取り」で格納
[eval exp="f.c1='竹取り'"]
[jump target="*day4_after_c1"]

*day4_c1_shibakari

[cm]
[eval exp="f.c1='芝刈り'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c1"]

*day4_c1_bbq

[cm]
[eval exp="f.c1='バーベキュー'"]
[jump target="*day4_after_c1"]


*day4_after_c1

[if exp="f.c1 == '芝刈り'"]

[typ/hap]

#&sf.robot_name

そうです、芝刈りです！思い出しました！[p]

[else]

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c1"]ですね。[p]


[endif]

[typ/def]

#&sf.robot_name

おじいさんは山へ[emb exp="f.c1"]に行きました。[p]

#&sf.robot_name

そして、おばあさんは川へ洗濯に行きました。[p]

[jump target="*day4_read2"]


;==================================================
; 選択肢2：桃の流れ方
; 正解：どんぶらこ、どんぶらこと
;==================================================

*day4_read2

[typ/def]

#&sf.robot_name

おばあさんが川で洗濯をしていると、大きな桃が……。[p]

#&sf.robot_name

ええと、どんなふうに流れてくるんでしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c2_untokosho text="うんとこしょ、どっこいしょと"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c2_korokoro text="ころころ、ころりんと"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c2_donbura text="どんぶらこ、どんぶらこと"]

[s]

*day4_c2_untokosho

[cm]
[eval exp="f.c2='うんとこしょ、どっこいしょと'"]
[jump target="*day4_after_c2"]

*day4_c2_korokoro

[cm]
[eval exp="f.c2='ころころ、ころりんと'"]
[jump target="*day4_after_c2"]

*day4_c2_donbura

[cm]
[eval exp="f.c2='どんぶらこ、どんぶらこと'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c2"]


*day4_after_c2

[if exp="f.c2 == 'どんぶらこ、どんぶらこと'"]

[typ/hap]

#&sf.robot_name

そうです！どんぶらこ、どんぶらこです！[p]

[else]

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c2"]ですね。[p]

#&sf.robot_name

その感じで読んでみます！[p]

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

おばあさんはその桃を家に持ち帰りました。[p]

#&sf.robot_name

そして桃を切ってみると、中から元気な男の子が生まれました。[p]

#&sf.robot_name

おじいさんとおばあさんは[r]
男の子に名前をつけました。[p]

#&sf.robot_name

あれ？何太郎でしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c3_nashi text="梨太郎"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c3_dragon text="ドラゴンフルーツ太郎"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c3_momo text="桃太郎"]

[s]

*day4_c3_nashi

[cm]
[eval exp="f.c3='梨太郎'"]
[jump target="*day4_after_c3"]

*day4_c3_dragon

[cm]
[eval exp="f.c3='ドラゴンフルーツ太郎'"]
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

桃太郎ですね！大事な主人公の名前でした。[p]

[else]

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c3"]ですね。[p]


[endif]

[typ/def]

#&sf.robot_name

その子は[emb exp="f.c3"]と名づけられました。[p]

#&sf.robot_name

[emb exp="f.c3"]はすくすくと育ち、やがて村の人を困らせている鬼を退治しに行くことになりました。[p]

[jump target="*day4_read4"]


;==================================================
; 選択肢4：おばあさんが持たせたもの
; 正解：キビだんご
;==================================================

*day4_read4

[typ/def]

#&sf.robot_name

旅立つ[emb exp="f.c3"]に、おばあさんは何かを持たせました。[p]

#&sf.robot_name

ええと……何を持たせたのでしたっけ？[p]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c4_onigiri text="おむすび"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c4_kibidango text="きびだんご"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c4_mame text="豆"]

[s]

*day4_c4_onigiri

[cm]
[eval exp="f.c4='おむすび'"]
[jump target="*day4_after_c4"]

*day4_c4_kibidango

[cm]
[eval exp="f.c4='きびだんご'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c4"]

*day4_c4_mame

[cm]
[eval exp="f.c4='豆'"]
[jump target="*day4_after_c4"]


*day4_after_c4

[if exp="f.c4 == 'きびだんご'"]

[typ/hap]

#&sf.robot_name

そうでした！きびだんごです！[p]

[else]

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c4"]ですね。[p]

[endif]

[typ/def]

#&sf.robot_name

おばあさんは[emb exp="f.c3"]に[emb exp="f.c4"]を持たせました。[p]

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

; 選択肢「江刺さん」に合わせて先輩の画像を最前面(fixレイヤー＝メッセージより前)に表示
; target等を指定しないfixボタンはクリックしても何も起きない（飾り画像として使う）
[button fix="true" folder="image" graphic="big_senpai.png" name="senpai" x="730" y="160" width="60" auto_next="false"]

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c5_ezashi text="江刺さん"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c5_neko text="ねこ"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c5_inu text="いぬ"]

[s]

*day4_c5_ezashi

[cm]
[eval exp="f.c5='江刺さん'"]
[jump target="*day4_after_c5"]

*day4_c5_neko

[cm]
[eval exp="f.c5='ねこ'"]
[jump target="*day4_after_c5"]

*day4_c5_inu

[cm]
[eval exp="f.c5='いぬ'"]
[eval exp="f.correct_count=f.correct_count+1"]
[jump target="*day4_after_c5"]


*day4_after_c5

; 江刺さんの画像（fixボタン）を片付ける
[clearfix name="senpai"]

[if exp="f.c5 == 'いぬ'"]

[typ/hap]

#&sf.robot_name

いぬです！思い出しました！[p]

[else]

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c5"]ですね。[p]


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

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c6"]ですね。[p]

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

[glink color=blue size=28 x=350 y=160 width=500 target=*day4_c7_kujaku text="クジャク"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day4_c7_niwatori text="ニワトリ"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day4_c7_kiji text="キジ"]

[s]

*day4_c7_kujaku

[cm]
[eval exp="f.c7='クジャク'"]
[jump target="*day4_after_c7"]

*day4_c7_niwatori

[cm]
[eval exp="f.c7='ニワトリ'"]
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


[else]

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c7"]ですね。[p]

[typ/hap]


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

[typ/hap]

#&sf.robot_name

ありがとうございます！[emb exp="f.c8"]ですね。[p]


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

[jump target="*after_story"]


;==================================================
; 練習後
;==================================================

*after_story


#&sf.robot_name

ありがとうございます！[p]

#&sf.robot_name

とってもいい練習になりました！[p]

#&sf.robot_name

これなら大丈夫そうです！[p]

#
自信ありげに[emb exp="sf.robot_name"]は部屋を出ていった。[p]

[jump target="*result"]


;==================================================
; 結果分岐
; 8問中6問以上、本家の物語に準拠していれば成功
;==================================================

*result

[cm]

#
しばらくして、戻ってきた。[p]

[if exp="f.correct_count >= 6"]

[jump target="*success"]

[else]

[jump target="*fail"]

[endif]


;==================================================
; 成功
;==================================================

*success

[typ/hap]

#&sf.robot_name

上手くできました！[p]

#&sf.robot_name

お父さんとお母さんに[r]
褒めてもらえました！[p]


[eval exp="f.day2_reading_result='本番成功'"]

[jump target="*after_reading"]


;==================================================
; 失敗
;==================================================

*fail

[typ/def]

#&sf.robot_name

・・・[p]


#&sf.robot_name

お父さんとお母さんに[r]
読み聞かせを聞いてもらいましたが...[p]

#&sf.robot_name
おかしいと笑われてしまいました...[p]


[eval exp="f.day2_reading_result='本番失敗'"]

[jump target="*after_reading"]


;--------------------------------------------------
*after_reading
;--------------------------------------------------

[eval exp="f.summary_day2_evening='学校：' + f.day2_school + '／読み聞かせ練習：' + f.day2_reading + '／読み聞かせ本番：' + f.day2_reading_result"]

#
読み聞かせの練習を手伝った。[p]

; 次の出来事へ
;
[jump storage="day2_4.ks"]