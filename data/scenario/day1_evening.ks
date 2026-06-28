;==================================================
; day1_afternoon.ks
; 1日目 昼：宿題を終わらせる
; 内容：
; ・宿題イベント
; ・選択肢ごとに結果、メリット、デメリットを表示
; ・次の出来事 day1_evening.ks へ
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
; data/bgm/day2.ogg を配置すること
[playbgm storage="day2.ogg" loop="true" fadein="1000"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

;==================================================
; 変数初期化
;==================================================

[eval exp="f.homework_state='未選択'"]
[eval exp="f.homework_result='未記録'"]
[eval exp="f.homework_merit='未記録'"]
[eval exp="f.homework_demerit='未記録'"]

[jump target="*day1_homework_scene1"]





;==================================================
; シーン1：宿題の確認
;==================================================

*day1_homework_scene1

[typ/def]

#&sf.robot_name

それでは、まず今日の予定を確認します。[p]

#&sf.robot_name

最初にやることは……宿題ですね。[p]

#

そうだった。[p]

#

机の上には、まだ終わっていない宿題が置かれている。[p]

[typ/def]

#&sf.robot_name

思ったより量がありますね。[p]

#

見ただけで少しやる気がなくなってくる。[p]

[typ/hap]

#&sf.robot_name

でも、大丈夫です。[p]

#&sf.robot_name

ぼくは宿題を手伝うこともできます。[p]

[typ/def]

#&sf.robot_name

ただし、どう手伝うかによって、あとで起きる結果も変わります。[p]

#

結果……。[p]

[typ/hap]

#&sf.robot_name

はい。宿題を終わらせるだけなら簡単です。[p]

#&sf.robot_name

でも、あなた自身が理解できるかどうかも大切です。[p]

#

どうしよう。[p]

[jump target="*day1_homework_choice"]





;==================================================
; シーン2：宿題の選択肢
;==================================================

*day1_homework_choice

[typ/def]

#&sf.robot_name

宿題をどうしますか？[p]

[glink color=blue size=28 x=350 y=150 width=500 target=*day1_homework_all_done text="全部やってもらう"]
[glink color=blue size=28 x=350 y=260 width=500 target=*day1_homework_together text="教えてもらいながら自分でやる"]
[glink color=blue size=28 x=350 y=370 width=500 target=*day1_homework_skip text="今日はやらない"]

[s]





;==================================================
; 選択肢1：全部やってもらう
;==================================================

*day1_homework_all_done

[cm]

[eval exp="f.homework_state='全部やってもらった'"]

[typ/def]

#

お願いします。[emb exp="sf.robot_name"]、宿題を全部やってください。[p]

[typ/def]

#&sf.robot_name

全部、ですか？[p]

[typ/hap]

#&sf.robot_name

ぼくなら、すぐに終わらせることはできます。[p]

[typ/def]

#&sf.robot_name

ですが、それだとあなたが内容を理解できないかもしれません。[p]

#

いいから、今日は早く終わらせたい。[p]

[typ/def]

#&sf.robot_name

……わかりました。[p]

#&sf.robot_name

では、宿題を確認します。[p]

#

[emb exp="sf.robot_name"]はノートを開き、ものすごい速さで問題を解いていった。[p]

#

計算問題も、漢字の書き取りも、読解問題も、あっという間に埋まっていく。[p]

[typ/hap]

#&sf.robot_name

終わりました。[p]

#

机の上の宿題は、きれいに完成していた。[p]

#

今日の自由時間は、かなり増えた。[p]

#

その日の夜、宿題をやらなくてよくなったぶん、ゆっくり過ごすことができた。[p]

#

けれど、次の日。[p]

#

宿題の内容をもとにした小テストがあった。[p]

#

問題を見ても、どうやって解けばいいのか思い出せない。[p]

#

宿題は終わっていたはずなのに、自分で考えていなかったから、ほとんど解けなかった。[p]

#

結果は、間違いだらけだった。[p]

[typ/def]

#&sf.robot_name

すみません。[p]

#&sf.robot_name

ぼくが宿題を終わらせたことで、あなたが考える時間をなくしてしまいました。[p]

#

宿題が終わることと、わかるようになることは、同じじゃないんだ。[p]

[eval exp="f.homework_result='宿題はすぐに終わったが、自分で理解していなかったので小テストで間違いだらけだった'"]
[eval exp="f.homework_merit='宿題が早く終わり、自由時間が増えた'"]
[eval exp="f.homework_demerit='自分で考えていないため、内容が身につかなかった'"]

[jump target="*day1_homework_end"]





;==================================================
; 選択肢2：教えてもらいながら自分でやる
;==================================================

*day1_homework_together

[cm]

[eval exp="f.homework_state='教えてもらいながら自分でやった'"]

[typ/def]

#

全部やってもらうんじゃなくて、教えてもらいながら自分でやってみます。[p]

[typ/hap]

#&sf.robot_name

いい選択だと思います。[p]

#&sf.robot_name

わからないところは、ぼくがヒントを出します。[p]

[typ/def]

#&sf.robot_name

でも、答えを書くのはあなたです。[p]

#

うん。やってみる。[p]

#

まずは計算問題から始めた。[p]

#

途中で手が止まると、[emb exp="sf.robot_name"]がすぐに答えを言うのではなく、考え方を教えてくれた。[p]

[typ/def]

#&sf.robot_name

ここは、先に式を分けて考えるとわかりやすいです。[p]

#

言われた通りに考えると、少しずつ解き方が見えてきた。[p]

#

時間はかかった。[p]

#

何度も間違えたし、途中で面倒にもなった。[p]

[typ/hap]

#&sf.robot_name

大丈夫です。自分で考えた時間は、ちゃんと残ります。[p]

#

そう言われて、もう少しだけ続けてみることにした。[p]

#

宿題が終わったころには、かなり疲れていた。[p]

#

でも、ノートには自分で考えて書いた答えが並んでいた。[p]

#

次の日、宿題の内容をもとにした小テストがあった。[p]

#

少し迷う問題もあったけれど、昨日考えたことを思い出しながら解くことができた。[p]

#

全部正解ではなかった。[p]

#

でも、昨日より少しわかるようになっていた。[p]

[typ/hap]

#&sf.robot_name

自分で考えたことが、ちゃんと力になっていましたね。[p]

#

大変だったけど、自分でやってよかった気がした。[p]

[eval exp="f.homework_result='時間はかかったが、自分で考えたので小テストでも少し解けるようになった'"]
[eval exp="f.homework_merit='内容を理解しやすくなり、次の日の小テストにも役立った'"]
[eval exp="f.homework_demerit='時間がかかり、少し疲れた'"]

[jump target="*day1_homework_end"]





;==================================================
; 選択肢3：今日はやらない
;==================================================

*day1_homework_skip

[cm]

[eval exp="f.homework_state='今日はやらなかった'"]

[typ/def]

#

今日は……やりたくない。[p]

[typ/def]

#&sf.robot_name

やらない、ですか。[p]

[typ/hap]

#&sf.robot_name

疲れているときは、無理をしないことも大切です。[p]

[typ/def]

#&sf.robot_name

ただし、宿題は消えてなくなるわけではありません。[p]

#

それは、わかってる。[p]

[typ/def]

#&sf.robot_name

では、せめて教科書とノートだけ机に出しておきませんか？[p]

#&sf.robot_name

明日の自分が、少し始めやすくなります。[p]

#

それくらいならできそうだ。[p]

#

机の上に教科書とノートを出した。[p]

#

でも、今日はそれ以上はやらなかった。[p]

#

その日は、宿題のことを考えずに過ごせた。[p]

#

少し気持ちは楽になった。[p]

#

けれど、次の日。[p]

#

宿題の提出時間が来た。[p]

#

ノートはほとんど白紙のままだった。[p]

#

先生に理由を聞かれて、少し気まずい気持ちになった。[p]

#

やらなかったぶん、あとで困ることになった。[p]

[typ/def]

#&sf.robot_name

休むことは悪いことではありません。[p]

#&sf.robot_name

でも、少しだけでも進めておくと、明日の自分が助かることがあります。[p]

#

昨日、教科書を出したところから、少しだけでもやっておけばよかったかもしれない。[p]

[eval exp="f.homework_result='宿題をやらなかったので、提出時に困ってしまった'"]
[eval exp="f.homework_merit='その日は気持ちが楽になり、休む時間を取れた'"]
[eval exp="f.homework_demerit='宿題が終わらず、次の日に提出で困った'"]


[glink color=green size=28 x=350 y=350 width=500 target=*day1_homework_end text="次の出来事へ"]

[s]





;==================================================
; 宿題イベント終了
;==================================================

*day1_homework_end

[cm]

[typ/hap]

#&sf.robot_name

[typ/def]

#&sf.robot_name


#

宿題が終わったから、外に出る準備をしよう[p]

#

[emb exp="sf.robot_name"]と一緒に外へ行くのは、少し不思議な感じがする。[p]

; 次の出来事へ
; 1日目 夕方：外出イベント
[jump storage="day1_evening.ks"]