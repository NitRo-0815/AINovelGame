;==================================================
; day3.ks
; 3日目：お風呂の準備
;==================================================



;--------------------------------------------------
*start
;--------------------------------------------------

; 画面初期化
[set_default_view chara="off"]

; 背景を即時表示
[bg storage="room.jpg" time="0"]

; メッセージボックスを中央寄せ・濃いめに再設定
[position left="200" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄も中央寄せしたメッセージボックスに合わせて再配置
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="200" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day3.ogg を配置すること
[playbgm storage="day3.ogg" loop="true" fadein="1000"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

; 変数初期化
[eval exp="f.bath_choice='未選択'"]

[jump target="*day3_scene1"]

<<<<<<< HEAD




;==================================================
; シーン1：お風呂の準備確認
;==================================================
=======
[s]
>>>>>>> f9d8e6347397933e634d0493642081ad2dee6c04

*day3_scene1

[typ/def]

#&sf.robot_name

今日は、お風呂に入る日ですね。[p]

#&sf.robot_name

準備はまだ整っていないようです。[p]

#

お風呂掃除と、お湯わかしをしないといけないんだよね。[p]

[typ/hap]

#&sf.robot_name

はい。きれいなお風呂に入るためには、準備が大切です。[p]

[jump target="*day3_scene2"]





;==================================================
; シーン2：どうするか選択
;==================================================

*day3_scene2

[typ/hap]

#&sf.robot_name

どうしますか？[p]

; 選択肢ボタンを画面中央寄せに配置
[glink color=blue size=28 x=230 y=160 width=500 target=*day3_help text="掃除とお湯わかしを任せる"]
[glink color=blue size=28 x=230 y=270 width=500 target=*day3_self text="自分で掃除とお湯わかしをする"]
[glink color=blue size=28 x=230 y=380 width=500 target=*day3_skip text="今日はやらない"]

[s]





;==================================================
; 選択肢1：掃除とお湯わかしを任せる
;==================================================

*day3_help

[cm]

; 振り返り用に選択内容を記録
[eval exp="f.bath_choice='掃除とお湯わかしを任せた'"]

[typ/def]

#

[emb exp="sf.robot_name"]、今日はお風呂掃除とお湯わかしをお願いできますか？[p]

[typ/hap]

#&sf.robot_name

了解です！すぐにピカピカにして、お湯もあたためますね。[p]

[typ/def]

#&sf.robot_name

浴槽の汚れを確認。洗剤の量を調整。温度設定も問題ありません。[p]

#

[emb exp="sf.robot_name"]は、手際よくお風呂場へ向かっていった。[p]

#

しばらくすると、浴室から水音と、機械音のような小さな音が聞こえてきた。[p]

[typ/hap]

#&sf.robot_name

準備完了です！いつでも入れますよ。[p]

#

自分では何もしていないのに、お風呂の準備が終わってしまった。[p]

[jump target="*day3_end"]

<<<<<<< HEAD




;==================================================
; 選択肢2：自分で掃除とお湯わかしをする
;==================================================
=======
[s]
>>>>>>> f9d8e6347397933e634d0493642081ad2dee6c04

*day3_self

[cm]

; 振り返り用に選択内容を記録
[eval exp="f.bath_choice='自分で掃除とお湯わかしをした'"]

[typ/def]

#

今日は自分で準備します。[p]

[typ/hap]

#&sf.robot_name

いいですね。私は見守りながら、必要なときにサポートします。[p]

[typ/def]

#&sf.robot_name

まずは浴槽を軽く流してから、スポンジでこすりましょう。[p]

#

言われた通りに掃除を始める。[p]

#

少し面倒だったけれど、汚れが落ちていくのを見ると、だんだん気持ちよくなってきた。[p]

[typ/hap]

#&sf.robot_name

とても丁寧です。その調子です。[p]

#

掃除を終えて、お湯をわかすボタンを押した。[p]

[typ/hap]

#&sf.robot_name

準備完了ですね。自分で整えたお風呂は、きっと気持ちいいですよ。[p]

[jump target="*day3_end"]





;==================================================
; 選択肢3：今日はやらない
;==================================================

*day3_skip

[cm]

; 振り返り用に選択内容を記録
[eval exp="f.bath_choice='今日はやらなかった'"]

[typ/def]

#

今日はお風呂をやめておきますか。[p]

[typ/hap]

#&sf.robot_name

わかりました。無理せず、また気分が乗ったときにしましょう。[p]

[typ/def]

#&sf.robot_name

ただ、体を休めることも、清潔にすることも、どちらも大切です。[p]

#

そう言われると、少しだけ考えてしまう。[p]

[typ/hap]

#&sf.robot_name

今日はお風呂に入らなくても、顔を洗ったり、着替えたりするだけでも十分です。[p]

#

それならできそうだ。[p]

#

洗面所で顔を洗うと、少しだけ気分がすっきりした。[p]

[jump target="*day3_end"]





;==================================================
; 3日目終了
;==================================================

*day3_end

; day3の振り返り記録
[eval exp="f.summary_day3='お風呂の準備：' + f.bath_choice"]

[typ/def]

#&sf.robot_name

今日も一日、おつかれさまでした。[p]

[typ/hap]

#&sf.robot_name

お風呂の準備は、ただの作業ではありません。[p]

#&sf.robot_name

自分の体を休ませるための、ちいさな準備でもあります。[p]

#

たしかに、きれいな場所で休むと、少し安心できる気がする。[p]

[typ/def]

#&sf.robot_name

今日の選択も、ちゃんと記録しておきますね。[p]

[typ/hap]

#&sf.robot_name

それでは、今日はゆっくり休んでください。[p]

#&sf.robot_name

おやすみなさい。また明日、そばにいますね。[p]

#

こうして、[emb exp="sf.robot_name"]との三日目が終わった。[p]

[jump storage="day4.ks"]