;==================================================
; day4.ks
; 4日目：読み聞かせの練習
;==================================================

*start

[set_default_view chara="off"]
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

[jump target="*day4_scene1"]

*day4_scene1

[typ/hap]
#&sf.robot_name

ねえ、今日は読み聞かせの練習をさせてほしいです！[p]

[typ/def]
#&sf.robot_name

わかりました。どんなお話を読んでくれるんですか？[p]

[typ/hap]
#&sf.robot_name

桃太郎の読み聞かせをします。ところどころで言葉が抜けてしまうかもしれませんが、あなたの選択で進めてくださいね。[p]

[jump target="*day4_read1"]

*day4_read1

[typ/def]
#&sf.robot_name

むかーし昔、あるところに、お爺さんとお婆さんが暮らしていました。[p]

[typ/hap]
#&sf.robot_name

お爺さんは山へ[l][r]
[link target="*day4_choice1" exp="f.c1 = '芝刈り'" ]芝刈り[endlink]／
[link target="*day4_choice1" exp="f.c1 = '竹林'" ]竹林[endlink]／
[link target="*day4_choice1" exp="f.c1 = '山火事'" ]山火事[endlink]

[s]

*day4_choice1


[typ/def]
#&sf.robot_name

お爺さんは山へ[emb exp="f.c1"]に行きました。[p]

[typ/hap]
#&sf.robot_name

お婆さんは川へ洗濯に行きました。[p]

[typ/def]
#&sf.robot_name

お婆さんが洗濯をしていると、大きな桃が[l][r]
[link target="*day4_choice2" exp="f.c2 = 'ざぶーん、ざぶーんと'" ]ざぶーん、ざぶーんと[endlink]／
[link target="*day4_choice2" exp="f.c2 = 'どんぶらこ、どんぶらこ'" ]どんぶらこ、どんぶらこ[endlink]／
[link target="*day4_choice2" exp="f.c2 = 'バシャバシャバシャと'" ]バシャバシャバシャと[endlink]

[s]

*day4_choice2

[typ/def]
#&sf.robot_name

[emb exp="f.c2"]流れてきました。[p]

[typ/hap]
#&sf.robot_name

お婆さんはそれを家に持ち帰り、食べることにしました。[p]

[typ/def]
#&sf.robot_name

家で桃を切ってみると、なんと赤ん坊が入っており[l][r]
[link target="*day4_choice3" exp="f.c3 = 'キビ太郎'" ]キビ太郎[endlink]／
[link target="*day4_choice3" exp="f.c3 = '田中太郎'" ]田中太郎[endlink]／
[link target="*day4_choice3" exp="f.c3 = '桃太郎'" ]桃太郎[endlink]

[s]

*day4_choice3

[typ/def]
#&sf.robot_name

[emb exp="f.c3"]と名づけました。[p]

[typ/hap]
#&sf.robot_name

[emb exp="f.c3"]はすくすくと育ち、村の人を困らせている鬼を倒しにいくことになりました。[p]

[typ/def]
#&sf.robot_name

お婆さんは[emb exp="f.c3"]に[l][r]
[link target="*day4_choice4" exp="f.c4 = 'おにぎり'" ]おにぎり[endlink]／
[link target="*day4_choice4" exp="f.c4 = 'キビだんご'" ]キビだんご[endlink]／
[link target="*day4_choice4" exp="f.c4 = '豆'" ]豆[endlink]

[s]

*day4_choice4

[typ/def]
#&sf.robot_name

[emb exp="f.c4"]を持たせました。[p]

[typ/hap]
#&sf.robot_name

[emb exp="f.c3"]は鬼ヶ島に向かう道中で[l][r]
[link target="*day4_choice5" exp="f.c5 = '土橋さん'" ]土橋さん[endlink]／
[link target="*day4_choice5" exp="f.c5 = 'オオカミ'" ]オオカミ[endlink]／
[link target="*day4_choice5" exp="f.c5 = '犬'" ]犬[endlink]

[s]

*day4_choice5

[typ/def]
#&sf.robot_name

[emb exp="f.c5"]に出会い、[l][r]
[link target="*day4_choice6" exp="f.c6 = 'さる'" ]さる[endlink]／
[link target="*day4_choice6" exp="f.c6 = 'ゴリラ'" ]ゴリラ[endlink]／
[link target="*day4_choice6" exp="f.c6 = 'モモンガ'" ]モモンガ[endlink]

[s]

*day4_choice6

[typ/def]
#&sf.robot_name

[emb exp="f.c6"]と[l][r]
[link target="*day4_choice7" exp="f.c7 = 'ハゲワシ'" ]ハゲワシ[endlink]／
[link target="*day4_choice7" exp="f.c7 = 'フクロウ'" ]フクロウ[endlink]／
[link target="*day4_choice7" exp="f.c7 = 'キジ'" ]キジ[endlink]

[s]

*day4_choice7


[typ/def]
#&sf.robot_name

[emb exp="f.c7"]に出会い、[emb exp="f.c4"]を渡して仲間にしました。[p]

[typ/hap]
#&sf.robot_name

鬼ヶ島に着いた[emb exp="f.c3"]は[l][r]
[link target="*day4_choice8" exp="f.c8 = '鬼に[emb exp=\"f.c4\"]を投げた'" ]鬼に[emb exp="f.c4"]を投げた[endlink]／
[link target="*day4_choice8" exp="f.c8 = '鬼を倒した'" ]鬼を倒した[endlink]／
[link target="*day4_choice8" exp="f.c8 = '鬼と仲良くなった'" ]鬼と仲良くなった[endlink]

[s]

*day4_choice8

[typ/def]
#&sf.robot_name

[emb exp="f.c8"][。[p]

[typ/hap]
#&sf.robot_name

鬼に取られた金銀財宝を取り返した[emb exp="f.c3"]は、村で大変感謝されました。[p]

[typ/def]
#&sf.robot_name

めでたしめでたし。[p]

[link target="*day4_end"]【読み聞かせを終える】[endlink]

[s]

*day4_end

[typ/hap]
#&sf.robot_name

ありがとうございました！いろいろなお話が作れました。また明日もお願いします！[p]

[jump storage="day5.ks"]
