;==================================================
; day5.ks
; 5日目：お出かけイベント
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

; メッセージボックスを中央寄せ・濃いめに再設定
[position left="250" top="440" width="820" height="250" color="0x000000" opacity="220" frame="none"]
[position margint="50" marginl="25" marginr="25" marginb="10"]

; 名前欄も中央寄せしたメッセージボックスに合わせて再配置
[free name="chara_name_area" layer="message0"]
[ptext name="chara_name_area" layer="message0" zindex="102" size="32" face="ロゴたいぷゴシック,メイリオ,sans-serif" x="250" y="445" color="0xffffff" edge="0x000000"]
[chara_config ptext="chara_name_area"]

; BGM開始
; data/bgm/day5.ogg を配置すること
[playbgm storage="day5.ogg" loop="true" fadein="1000"]

; day5用変数初期化
[eval exp="f.day5_route='未選択'"]
[eval exp="f.day5_robot='未選択'"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

[jump target="*odekake_start"]





;==================================================
; お出かけイベント
;==================================================

*odekake_start

#あなた

今日はお出かけするんだ。[p]

#&sf.robot_name

一緒に行こう！[p]

#あなた

そのままだと目立つから、スマホに乗り移れる？[p]

#&sf.robot_name

できるよ！[p]

; とよぽんをスマホ状態に変更
[typ/ph_def]

; スマホ状態の大きさは変えず、位置だけ少し下げる
[chara_move name="toyopon" x="30" y="230" width="480" time="300"]

#&sf.robot_name

それじゃあ行こう！[p]

; 場面転換
[bg storage="station.jpg" time="1000"]

; 駅でもスマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#あなた

駅に着いたね。[p]





;==================================================
; ルート選択
;==================================================

#

どうやって目的地まで行こう？[p]
[eval exp="f.day5_route_toyopon_text=sf.robot_name + 'に調べてもらう'"]
[glink color=blue size=28 x=350 y=140 width=500 target=*route_toyopon text=&f.day5_route_toyopon_text]
[glink color=blue size=28 x=350 y=245 width=500 target=*route_self text="自分で調べてみる"]
[glink color=blue size=28 x=350 y=350 width=500 target=*route_ask text="通行人に聞いてみる"]

[s]





;==================================================
; とよぽんに調べてもらう
;==================================================

*route_toyopon

[cm]
[eval exp="f.day5_route='ロボットに調べてもらう'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#&sf.robot_name

乗り換えを調べるね！[p]

#&sf.robot_name

こっちの路線に乗って、そのあと乗り換えだよ！[p]

#

[emb exp="sf.robot_name"]は丁寧に案内してくれた。[l]
でも少し遠回りだった。[p]

[jump target="*arrive"]





;==================================================
; 自分で調べる
;==================================================

*route_self

[cm]
[eval exp="f.day5_route='自分で調べる'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#あなた

自分で調べてみようかな。[p]

#

知らない路線だったので、調べるのに時間がかかった。[l]
乗り換えでも少し迷ってしまった。[p]

[jump target="*arrive"]





;==================================================
; 通行人に聞く
;==================================================

*route_ask

[cm]
[eval exp="f.day5_route='通行人に聞いた'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#あなた

通行人に聞いてみようかな。[p]

#

近くにいた人が、乗り場を教えてくれた。[p]

#&sf.robot_name

人に聞くのも、いい方法ですね。[p]

#

少し緊張したけれど、思ったより早く道がわかった。[p]

[jump target="*arrive"]





;==================================================
; 目的地到着
;==================================================

*arrive

; 背景変更
[bg storage="ekimae.jpg" time="1000"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

目的地に到着した。[p]

#あなた

なにかロボットがいるよ。[p]

#&sf.robot_name

どうしたんだろう。[p]

#

ゴミの周りでうろうろしているロボットがいる。[p]





;==================================================
; ロボットイベント選択
;==================================================

#

あのロボットは何をしているんだろう？[p]

[glink color=blue size=28 x=350 y=210 width=500 target=*robot_walk text="散歩しているのかも"]
[glink color=blue size=28 x=350 y=330 width=500 target=*robot_trouble text="困っているみたい"]

[s]





;==================================================
; 散歩ルート
;==================================================

*robot_walk

[cm]
[eval exp="f.day5_robot='散歩していると思った'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#あなた

散歩しているみたい。[p]

#

ロボットはそのままどこかへ行ってしまった。[p]

[jump target="*event_end"]





;==================================================
; 困っているルート
;==================================================

*robot_trouble

[cm]
[eval exp="f.day5_robot='困っていると思って助けた'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#あなた

困っているみたい。[p]

#&sf.robot_name

ゴミが落ちているよ！[p]

#あなた

拾ってあげよう。[p]

#

ゴミ箱ロボットが喜んでいる。[p]

#&sf.robot_name

いいことができて、なんだか気持ちがいいね！[p]

[jump target="*event_end"]





;==================================================
; イベント終了
;==================================================

*event_end

; day5の振り返り記録
[eval exp="f.summary_day5='お出かけ：移動=' + f.day5_route + '／ゴミ箱ロボット=' + f.day5_robot"]

#

お出かけを終えて、少しだけ新しい景色を見られた気がした。[p]

#&sf.robot_name

今日はたくさん歩きましたね。[p]

#

うん。少し疲れたけど、楽しかった。[p]

[typ/ph_hap]

; スマホ笑顔でも大きさは変えず、位置だけ維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#&sf.robot_name

それでは、今日はゆっくり休んでください。[p]

#&sf.robot_name

おやすみなさい。また明日、そばにいますね。[p]

#

こうして、[emb exp="sf.robot_name"]との五日目が終わった。[p]

; day6.ksへ
[jump storage="day6.ks"]