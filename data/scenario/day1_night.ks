;==================================================
; day1_night.ks
; 1日目 夜：お風呂に入る
; 元のday3をベースにしたお風呂イベント
; 選択肢：glink 使用
; 振り返り記録対応
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
[set_default_view chara="off"]

; 背景を即時表示
[bg storage="room.jpg" time="0"]

; メッセージボックス設定
[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄設定
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="250" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day3.ogg を配置すること
[playbgm storage="day3.ogg" loop="true" fadein="1000"]

;==================================================
; day1 お風呂用変数初期化
;==================================================

[eval exp="f.day1_bath_choice='未選択'"]
[eval exp="f.day1_bath_result='未記録'"]
[eval exp="f.day1_bath_merit='未記録'"]
[eval exp="f.day1_bath_demerit='未記録'"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

[jump target="*day1_bath_scene1"]





;==================================================
; シーン1：帰宅後、お風呂の確認
;==================================================

*day1_bath_scene1

[typ/def]

#

外出から帰ってきて、少し体が重く感じる。[p]

#

たくさん歩いたから、汗もかいた気がする。[p]

[typ/def]

#&sf.robot_name

外出、おつかれさまでした。[p]

[typ/hap]

#&sf.robot_name

今日は、宿題も外出もありましたから、かなり疲れていると思います。[p]

#

うん。ちょっと疲れた。[p]

[typ/def]

#&sf.robot_name

では、夜の準備を始めましょう。[p]

#&sf.robot_name

まずは、お風呂です。[p]

#

お風呂か……。[p]

#

入った方がいいのはわかっているけれど、準備するのが少し面倒だ。[p]

[typ/def]

#&sf.robot_name

お風呂に入るには、浴槽を掃除して、お湯をためる必要があります。[p]

#&sf.robot_name

ただし、どう準備するかは選べます。[p]

[typ/hap]

#&sf.robot_name

ぼくに任せてもいいですし、自分で準備してもいいです。[p]

[typ/def]

#&sf.robot_name

今日はかなり疲れているなら、最低限だけ整える方法もあります。[p]

#

どうしよう。[p]

[jump target="*day1_bath_choice"]





;==================================================
; シーン2：お風呂の選択肢
;==================================================

*day1_bath_choice

[typ/def]

#&sf.robot_name

お風呂の準備をどうしますか？[p]

[glink color=blue size=28 x=350 y=150 width=500 target=*day1_bath_help text="掃除とお湯わかしを任せる"]
[glink color=blue size=28 x=350 y=260 width=500 target=*day1_bath_self text="自分で掃除とお湯わかしをする"]
[glink color=blue size=28 x=350 y=370 width=500 target=*day1_bath_minimum text="今日は最低限だけにする"]

[s]





;==================================================
; 選択肢1：掃除とお湯わかしを任せる
;==================================================

*day1_bath_help

[cm]

[eval exp="f.day1_bath_choice='掃除とお湯わかしを任せた'"]

[typ/def]

#

[emb exp="sf.robot_name"]、今日はお風呂掃除とお湯わかしをお願いできますか？[p]

[typ/hap]

#&sf.robot_name

了解です！[p]

#&sf.robot_name

浴槽をきれいにして、ちょうどいい温度でお湯をためますね。[p]

[typ/def]

#&sf.robot_name

浴槽の汚れを確認。[p]

#&sf.robot_name

洗剤の量を調整。[p]

#&sf.robot_name

温度設定も問題ありません。[p]

#

[emb exp="sf.robot_name"]は、手際よくお風呂場へ向かっていった。[p]

#

しばらくすると、浴室から水音と、小さな機械音が聞こえてきた。[p]

[typ/hap]

#&sf.robot_name

準備完了です！[p]

#&sf.robot_name

いつでも入れますよ。[p]

#

本当にあっという間だった。[p]

#

自分では何もしていないのに、お風呂の準備が終わっている。[p]

#

疲れていた体には、とてもありがたかった。[p]

#

その日は、すぐに温かいお風呂に入ることができた。[p]

#

体が温まって、外出の疲れも少し取れた気がする。[p]

#

ただ、お風呂場を見ても、どこをどう掃除したのかはよくわからなかった。[p]

#

次に自分で準備するとき、同じようにできるかは少し不安だった。[p]

[typ/def]

#&sf.robot_name

今日は、休むことを優先できましたね。[p]

#&sf.robot_name

ただ、準備のやり方を覚える機会は少なくなりました。[p]

[eval exp="f.day1_bath_result='お風呂の準備はすぐに終わり、疲れた体を休めることができたが、自分で準備する方法は覚えにくかった'"]
[eval exp="f.day1_bath_merit='疲れていてもすぐにお風呂に入れて、体を休められた'"]
[eval exp="f.day1_bath_demerit='自分で掃除や準備をする経験が少なくなった'"]

[jump target="*day1_bath_result"]





;==================================================
; 選択肢2：自分で掃除とお湯わかしをする
;==================================================

*day1_bath_self

[cm]

[eval exp="f.day1_bath_choice='自分で掃除とお湯わかしをした'"]

[typ/def]

#

今日は、自分で準備してみます。[p]

[typ/hap]

#&sf.robot_name

いいですね。[p]

#&sf.robot_name

ぼくは見守りながら、必要なときにサポートします。[p]

[typ/def]

#&sf.robot_name

まずは浴槽を軽く流してから、スポンジでこすりましょう。[p]

#

少し面倒だけど、言われた通りに浴槽を流す。[p]

#

スポンジでこすると、少しずつ汚れが落ちていくのが見えた。[p]

#

最初は早く終わらせたいだけだったけれど、だんだんきれいになっていくのを見ると、少し気持ちよくなってきた。[p]

[typ/hap]

#&sf.robot_name

とても丁寧です。[p]

#&sf.robot_name

その調子です。[p]

#

掃除を終えて、お湯をわかすボタンを押した。[p]

#

温度を確認して、入れる量も設定する。[p]

[typ/def]

#&sf.robot_name

設定も問題ありません。[p]

[typ/hap]

#&sf.robot_name

準備完了ですね。[p]

#

時間はかかったし、少し疲れた。[p]

#

でも、自分で整えたお風呂に入ると、不思議といつもより気持ちよく感じた。[p]

#

自分でやったからこそ、きれいになったことがよくわかる。[p]

[typ/hap]

#&sf.robot_name

自分で整えたお風呂は、きっと気持ちいいですよね。[p]

#

うん。[p]

#

少し大変だったけれど、自分でできたのはよかったと思う。[p]

[eval exp="f.day1_bath_result='時間はかかったが、自分で掃除とお湯わかしをしたことで、準備のやり方がわかり、お風呂にも気持ちよく入れた'"]
[eval exp="f.day1_bath_merit='自分で準備する力がつき、達成感があった'"]
[eval exp="f.day1_bath_demerit='時間と手間がかかり、少し疲れた'"]

[jump target="*day1_bath_result"]





;==================================================
; 選択肢3：今日は最低限だけにする
;==================================================

*day1_bath_minimum

[cm]

[eval exp="f.day1_bath_choice='今日は最低限だけにした'"]

[typ/def]

#

今日は、ちゃんとお風呂に入る元気がないかも。[p]

[typ/def]

#&sf.robot_name

そうですか。[p]

[typ/hap]

#&sf.robot_name

外出もありましたし、疲れている日もありますね。[p]

[typ/def]

#&sf.robot_name

では、今日は最低限だけ整えましょう。[p]

#

最低限？[p]

[typ/def]

#&sf.robot_name

顔を洗うこと。[p]

#&sf.robot_name

手足を軽く拭くこと。[p]

#&sf.robot_name

そして、着替えることです。[p]

[typ/hap]

#&sf.robot_name

お風呂に入るほどではなくても、少し清潔にすると眠りやすくなります。[p]

#

それくらいなら、できそうだ。[p]

#

洗面所で顔を洗って、手足を軽く拭いた。[p]

#

それから、部屋着に着替える。[p]

#

お風呂に入るよりはずっと楽だった。[p]

#

気持ちも少し軽くなった。[p]

#

ただ、体の疲れや汗の感じは、少し残っている。[p]

#

温かいお風呂に入ったときほど、すっきりはしなかった。[p]

[typ/def]

#&sf.robot_name

今日は無理をしすぎずに済みましたね。[p]

#&sf.robot_name

ただ、しっかり疲れを取るなら、お風呂に入る方がよかったかもしれません。[p]

#

今日は最低限だけ。[p]

#

それでも、何もしないよりはよかった気がする。[p]

[eval exp="f.day1_bath_result='お風呂には入らず最低限だけ整えたため、楽に済ませられたが、疲れや汗の感じは少し残った'"]
[eval exp="f.day1_bath_merit='疲れていても無理せず、最低限の清潔を保てた'"]
[eval exp="f.day1_bath_demerit='お風呂ほどは疲れが取れず、すっきり感も少なかった'"]

[jump target="*day1_bath_end"]



;==================================================
; お風呂イベント終了
;==================================================

*day1_bath_end

[cm]


#

もう夜も遅い。[p]

#

そろそろ寝るが、明日どうやって起きるかも決めておいた方がよさそうだ。[p]

; 次の出来事へ
; 1日目 夜：寝る準備イベント
[jump storage="day1_sleep.ks"]