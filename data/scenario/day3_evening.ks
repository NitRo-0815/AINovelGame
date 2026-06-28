;==================================================
; day3_evening.ks
; 3日目 夕方：最終選択（元day7ベース）
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

[playbgm storage="day7.ogg" loop="true" fadein="1000"]

[chara_hide name="agent001" time="0"]
[chara_show name="toyopon" face="def" left="80" top="0" width="420"]

[eval exp="f.final='未選択'"]

[jump *scene1]





;==================================================
*scene1
;==================================================

#&sf.robot_name

……。[p]

#

三日目、最後の夜になった。[p]

#&sf.robot_name

今日で、ぼくの担当期間は終わります。[p]

#

そうだった。[p]

#

もう終わりなんだ。[p]

[typ/def]

#&sf.robot_name

明日からは、別のサポートを案内される予定です。[p]

[jump *scene2]





;==================================================
*scene2
;==================================================

[chara_show name="agent001" face="def" left="650" top="150" width="380" time="800"]

#AGENT001

はじめまして。[p]

#AGENT001

次世代生活支援型ロボット、AGENT001です。[p]

#

……新しいロボット。[p]

#AGENT001

家事、学習、行動分析。[p]

#AGENT001

すべての精度において向上しています。[p]

#AGENT001

最適な行動を常に提案可能です。[p]

#

すごそうだ。[p]

#

何もかも、ちゃんとできそうな感じがする。[p]

[typ/def]

#&sf.robot_name

AGENT001は、高性能です。[p]

#&sf.robot_name

ぼくよりも、正確にサポートできます。[p]

#

……。[p]

[jump *scene3]





;==================================================
*scene3
;==================================================

[chara_move name="toyopon" left="80" top="0"]
[chara_move name="agent001" left="650" top="150"]

#&sf.robot_name

この三日間、いろいろありましたね。[p]

#

宿題も、外出も、読み聞かせもあった。[p]

#&sf.robot_name

最初はサポートすることだけを考えていました。[p]

#&sf.robot_name

でも……。[p]

[pause time="300"]

#&sf.robot_name

どうするのがいいのか、迷うこともありました。[p]

#

……。[p]

#AGENT001

判断に迷う必要はありません。[p]

#AGENT001

最適解を選べばよいだけです。[p]

#

最適解。[p]

#

たしかに、それなら迷わない。[p]

[jump *choice]





;==================================================
*choice
;==================================================

#

これから一緒にいるロボットを選ぶ。[p]

[glink x=350 y=200 width=500 target=*choose_toyopon text="とよぽんを選ぶ"]
[glink x=350 y=320 width=500 target=*choose_agent text="AGENT001を選ぶ"]

[s]





;==================================================
; とよぽん
;==================================================

*choose_toyopon

[cm]

[eval exp="f.final='toyopon'"]

#

これからも、[emb exp="sf.robot_name"]と一緒にいたい。[p]

[pause time="200"]

#&sf.robot_name

……いいんですか？[p]

#

うん。[p]

#

完璧じゃなくてもいい。[p]

#

一緒に考えたり、迷ったりしながらの方がいい。[p]

[pause]

#&sf.robot_name

……ありがとうございます。[p]

#

少しだけ、表情が明るくなる。[p]

#AGENT001

選択を確認しました。[p]

#AGENT001

サポート権限を移行します。[p]

#

こうして、三日間の続きが決まった。[p]

[jump *end]





;==================================================
; AGENT001
;==================================================

*choose_agent

[cm]

[eval exp="f.final='agent'"]

#

AGENT001にする。[p]

[pause]

#&sf.robot_name

……はい。[p]

[pause]

#&sf.robot_name

それが、最適な選択だと思います。[p]

#

……そうかもしれない。[p]

#AGENT001

選択を確認しました。[p]

#AGENT001

明日からサポートを開始します。[p]

#

横を見ると、[emb exp="sf.robot_name"]が静かに立っている。[p]

#&sf.robot_name

三日間、ありがとうございました。[p]

#

少しだけ、寂しそうに見えた。[p]

[jump *end]





;==================================================
*end
;==================================================

[cm]

#

三日間の生活が終わった。[p]

#

選んだことは、そのまま明日につながる。[p]

#

何が正しいかは、まだわからない。[p]

#

でも、選んだことだけは残る。[p]

[jump storage="day3_summary.ks"]