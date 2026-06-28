;==================================================
; day1_evening.ks
; 1日目 夕方：外出イベント
; 元のday5をベースにした外出の出来事
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
; data/bgm/day5.ogg を配置すること
[playbgm storage="day5.ogg" loop="true" fadein="1000"]

;==================================================
; day1 外出用変数初期化
;==================================================

[eval exp="f.day1_outing_route='未選択'"]
[eval exp="f.day1_outing_route_result='未記録'"]
[eval exp="f.day1_outing_route_merit='未記録'"]
[eval exp="f.day1_outing_route_demerit='未記録'"]

[eval exp="f.day1_outing_robot='未選択'"]
[eval exp="f.day1_outing_robot_result='未記録'"]
[eval exp="f.day1_outing_robot_merit='未記録'"]
[eval exp="f.day1_outing_robot_demerit='未記録'"]

; 選択肢表示用テキスト
[eval exp="f.day1_route_toyopon_text=sf.robot_name + 'に調べてもらう'"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

[jump target="*day1_outing_start"]





;==================================================
; 外出イベント開始
;==================================================

*day1_outing_start

[typ/def]

#

宿題のあと、少し外に出ることになった。[p]

#

ずっと部屋にいたから、気分転換にはちょうどいいかもしれない。[p]

[typ/hap]

#&sf.robot_name

外出ですね！[p]

#&sf.robot_name

道案内や予定確認なら、ぼくに任せてください。[p]

#

でも、そのままだと少し目立つかも。[p]

[typ/def]

#&sf.robot_name

たしかに、この姿で外を歩くと少し注目されるかもしれません。[p]

#

スマホに乗り移れるって言ってたよね？[p]

[typ/hap]

#&sf.robot_name

はい！できます！[p]

#&sf.robot_name

では、スマホに移動しますね。[p]

; とよぽんをスマホ状態に変更
[typ/ph_def]

; スマホ状態の大きさは変えず、位置だけ少し下げる
[chara_move name="toyopon" x="30" y="230" width="480" time="300"]

[typ/ph_hap]

#&sf.robot_name

準備完了です！[p]

#&sf.robot_name

これなら一緒に外へ行けますね。[p]

#

スマホの画面の中で、[emb exp="sf.robot_name"]がうれしそうにしている。[p]

#

少し不思議だけど、これなら目立たずに出かけられそうだ。[p]

; 場面転換
[bg storage="station.jpg" time="1000"]

; 駅でもスマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

駅に着いた。[p]

#

人が多くて、どの路線に乗ればいいのか少し迷う。[p]

[typ/ph_def]

#&sf.robot_name

目的地までは、いくつか行き方がありますね。[p]

#&sf.robot_name

どうやって調べますか？[p]

[jump target="*day1_route_choice"]





;==================================================
; ルート選択
;==================================================

*day1_route_choice

[typ/ph_def]

#&sf.robot_name

目的地までの行き方を選びましょう。[p]

[glink color=blue size=28 x=350 y=140 width=500 target=*day1_route_toyopon text=&f.day1_route_toyopon_text]
[glink color=blue size=28 x=350 y=245 width=500 target=*day1_route_self text="自分で調べてみる"]
[glink color=blue size=28 x=350 y=350 width=500 target=*day1_route_ask text="通行人に聞いてみる"]

[s]





;==================================================
; ルート1：とよぽんに調べてもらう
;==================================================

*day1_route_toyopon

[cm]

[eval exp="f.day1_outing_route=sf.robot_name + 'に調べてもらった'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

[typ/ph_hap]

#&sf.robot_name

すぐに調べますね！[p]

[typ/ph_def]

#&sf.robot_name

現在地、目的地、乗り換え時間を確認しています。[p]

#&sf.robot_name

この路線に乗って、次の駅で乗り換えるのが安全です。[p]

#

[emb exp="sf.robot_name"]は、すぐにルートを表示してくれた。[p]

#

迷わず進めるので、とても楽だった。[p]

#

ただ、[emb exp="sf.robot_name"]は安全な道を優先したらしく、少し遠回りになった。[p]

#

目的地には無事に着いたけれど、自分ではあまり道を覚えられなかった。[p]

[typ/ph_def]

#&sf.robot_name

到着しやすさを優先したルートでした。[p]

#&sf.robot_name

ただ、次にひとりで来るときは、もう一度確認が必要かもしれません。[p]

[eval exp="f.day1_outing_route_result='迷わず目的地へ向かえたが、少し遠回りになり、自分では道を覚えにくかった'"]
[eval exp="f.day1_outing_route_merit='迷わず安全に移動できた'"]
[eval exp="f.day1_outing_route_demerit='ロボット任せになり、自分で道を覚えにくかった'"]

[jump target="*day1_outing_end"]





;==================================================
; ルート2：自分で調べる
;==================================================

*day1_route_self

[cm]

[eval exp="f.day1_outing_route='自分で調べた'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

自分で調べてみよう。[p]

#

スマホの地図アプリを開いて、目的地までの行き方を探す。[p]

#

知らない路線が多くて、少し時間がかかった。[p]

[typ/ph_def]

#&sf.robot_name

焦らなくて大丈夫です。[p]

#&sf.robot_name

乗り換え駅とホーム番号を順番に確認しましょう。[p]

#

[emb exp="sf.robot_name"]は答えをすぐには言わず、確認する場所だけ教えてくれた。[p]

#

何度か迷いながらも、自分でルートを見つけることができた。[p]

#

乗り換えでは少し不安になったけれど、自分で調べたぶん、道の流れは覚えやすかった。[p]

[typ/ph_hap]

#&sf.robot_name

自分で調べられましたね。[p]

#&sf.robot_name

少し時間はかかりましたが、次はもっと早くできると思います。[p]

[eval exp="f.day1_outing_route_result='時間はかかったが、自分で調べたことで道の流れを覚えやすかった'"]
[eval exp="f.day1_outing_route_merit='自分で調べる力がつき、道を覚えやすかった'"]
[eval exp="f.day1_outing_route_demerit='調べるのに時間がかかり、少し迷った'"]

[jump target="*day1_outing_end"]





;==================================================
; ルート3：通行人に聞く
;==================================================

*day1_route_ask

[cm]

[eval exp="f.day1_outing_route='通行人に聞いた'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

近くにいる人に聞いてみようかな。[p]

#

少し緊張したけれど、駅の案内板の近くにいた人に声をかけた。[p]

#

すみません、この目的地に行くには、どの路線に乗ればいいですか？[p]

#

その人は、乗り場と乗り換え駅を丁寧に教えてくれた。[p]

[typ/ph_hap]

#&sf.robot_name

人に聞くのも、いい方法ですね。[p]

#&sf.robot_name

自分だけで抱え込まないことも大切です。[p]

#

思ったより早く道がわかった。[p]

#

ただ、聞いた内容を忘れないようにする必要があった。[p]

#

もう一度聞き直すのは少し恥ずかしいので、急いでメモを取った。[p]

[typ/ph_def]

#&sf.robot_name

人に聞くと早く解決することがあります。[p]

#&sf.robot_name

でも、聞いたことを確認する習慣も大切ですね。[p]

[eval exp="f.day1_outing_route_result='通行人に聞いたことで早く道がわかったが、聞いた内容を忘れないようにする必要があった'"]
[eval exp="f.day1_outing_route_merit='人に聞くことで早く解決できた'"]
[eval exp="f.day1_outing_route_demerit='聞いた内容を忘れると、もう一度確認が必要になる'"]

[jump target="*day1_outing_end"]






;==================================================
; 目的地到着
;==================================================

*day1_arrive

[cm]

; 背景変更
[bg storage="ekimae.jpg" time="1000"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

目的地に到着した。[p]

#

駅前には人が多く、店や看板が並んでいる。[p]

#

その中で、なにか小さなロボットが動いているのが見えた。[p]

#

あれ？ なにかロボットがいるよ。[p]

[typ/ph_def]

#&sf.robot_name

本当ですね。[p]

#&sf.robot_name

何かを探しているようにも見えます。[p]

#

ゴミの周りを、うろうろしているロボットがいる。[p]

[jump target="*day1_robot_choice"]





;==================================================
; ゴミ箱ロボットイベント選択
;==================================================

*day1_robot_choice

[typ/ph_def]

#&sf.robot_name

あのロボットは何をしているのでしょう？[p]

[glink color=blue size=28 x=350 y=210 width=500 target=*day1_robot_walk text="散歩しているのかも"]
[glink color=blue size=28 x=350 y=330 width=500 target=*day1_robot_trouble text="困っているみたい"]

[s]





;==================================================
; ロボット選択1：散歩していると思う
;==================================================

*day1_robot_walk

[cm]

[eval exp="f.day1_outing_robot='散歩していると思った'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

散歩しているだけかもしれない。[p]

[typ/ph_def]

#&sf.robot_name

そうかもしれませんね。[p]

#

しばらく見ていると、ロボットはゴミの近くをうろうろしたあと、別の場所へ移動していった。[p]

#

地面には、カップと紙袋が残ったままだった。[p]

#

誰かが片付けるだろうと思って、その場を離れた。[p]

#

けれど、少し後で同じ場所を通ると、ゴミはまだ残っていた。[p]

#

近くを歩く人が、それを避けるように通っている。[p]

#

もしかしたら、あのロボットは困っていたのかもしれない。[p]

[typ/ph_def]

#&sf.robot_name

見守るだけでも、状況を知ることはできます。[p]

#&sf.robot_name

でも、困っている相手に気づけないこともありますね。[p]

[eval exp="f.day1_outing_robot_result='ロボットを助けなかったため、ゴミはしばらく残ったままだった'"]
[eval exp="f.day1_outing_robot_merit='余計なことをせず、そのまま移動できた'"]
[eval exp="f.day1_outing_robot_demerit='困っている可能性に気づけず、問題が残ってしまった'"]

[jump target="*day1_outing_end"]





;==================================================
; ロボット選択2：困っていると思って助ける
;==================================================

*day1_robot_trouble

[cm]

[eval exp="f.day1_outing_robot='困っていると思って助けた'"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

困っているみたい。[p]

[typ/ph_def]

#&sf.robot_name

近くにゴミがありますね。[p]

#&sf.robot_name

もしかすると、ゴミ箱ロボットなのかもしれません。[p]

#

ゴミ箱ロボット？[p]

[typ/ph_hap]

#&sf.robot_name

はい。ゴミを集めたり、捨てやすい場所に移動したりするロボットです。[p]

#

じゃあ、あのゴミを拾ってあげよう。[p]

#

落ちていたカップと紙袋を拾い、ゴミ箱ロボットの近くへ持っていった。[p]

#

ゴミ箱ロボットは、嬉しそうに小さな音を鳴らした。[p]

[typ/ph_hap]

#&sf.robot_name

喜んでいるみたいです！[p]

#

少しだけ周りの人にも見られて、恥ずかしかった。[p]

#

でも、道がきれいになって、なんだか気持ちがよかった。[p]

#

ゴミ箱ロボットは、安心したようにその場を離れていった。[p]

[typ/ph_hap]

#&sf.robot_name

困っている相手に気づいて、行動できましたね。[p]

[typ/ph_def]

#&sf.robot_name

少し勇気は必要でしたが、ちゃんと良い結果につながりました。[p]

[eval exp="f.day1_outing_robot_result='ゴミ箱ロボットを助けたことで、道がきれいになりロボットも喜んだ'"]
[eval exp="f.day1_outing_robot_merit='困っている相手を助けられ、周りの環境もよくなった'"]
[eval exp="f.day1_outing_robot_demerit='人前で行動するため、少し恥ずかしさや勇気が必要だった'"]

[jump target="*day1_outing_end"]








;==================================================
; 外出イベント終了
;==================================================

*day1_outing_end

[cm]

; day1夕方の振り返り記録
[eval exp="f.summary_day1_evening='外出：移動=' + f.day1_outing_route + '／移動結果=' + f.day1_outing_route_result + '／移動メリット=' + f.day1_outing_route_merit + '／移動デメリット=' + f.day1_outing_route_demerit + '／ゴミ箱ロボット=' + f.day1_outing_robot + '／対応結果=' + f.day1_outing_robot_result + '／対応メリット=' + f.day1_outing_robot_merit + '／対応デメリット=' + f.day1_outing_robot_demerit"]

; 背景を部屋に戻す
[bg storage="room.jpg" time="1000"]

; スマホ状態の位置を維持
[chara_move name="toyopon" x="30" y="230" width="480" time="0"]

#

外出を終えて、家に戻ってきた。[p]

#

少し疲れたけれど、新しい景色を見られた気がした。[p]

[typ/ph_hap]

#&sf.robot_name

今日は外でいろいろな選択をしましたね。[p]

[typ/ph_def]

#&sf.robot_name

目的地への行き方をどうするか。[p]

#&sf.robot_name

困っているかもしれないロボットに、どう関わるか。[p]

[typ/ph_hap]

#&sf.robot_name

どちらも、あなたが選んだことです。[p]

#

うん。[p]

#

室内に戻ると、スマホの中の[emb exp="sf.robot_name"]がこちらを見た。[p]

[typ/ph_def]

#&sf.robot_name

そろそろ、夜の準備を始める時間ですね。[p]

#

夜の準備……。[p]

#

たしか、お風呂にも入らないといけない。[p]

[typ/ph_hap]

#&sf.robot_name

次は、お風呂の準備をしましょう。[p]

; 次の出来事へ
; 1日目 夜：お風呂・寝る準備イベント
[jump storage="day1_night.ks"]