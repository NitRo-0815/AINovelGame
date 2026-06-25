;==================================================
; day2.ks
; 2日目：宿題の対応
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
; data/bgm/day2.ogg を配置すること
[playbgm storage="day2.ogg" loop="true" fadein="1000"]

; とよぽん表示
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]

; 変数初期化
[eval exp="f.homework_state='未選択'"]

[jump target="*day2_scene1"]





;==================================================
; シーン1：宿題の確認
;==================================================

*day2_scene1

[typ/def]

#&sf.robot_name

おはようございます。[p]

#&sf.robot_name

今日は、まだ宿題が残っていますね。[p]

#

そうだった……宿題、まだ終わってなかった。[p]

[jump target="*day2_scene2"]





;==================================================
; シーン2：どうするか選択
;==================================================

*day2_scene2

[typ/hap]

#&sf.robot_name

どうしますか？[p]

; 選択肢ボタンを画面中央寄せに配置
[glink color=blue size=28 x=350 y=160 width=500 target=*day2_all_done text="全部やってもらう"]
[glink color=blue size=28 x=350 y=270 width=500 target=*day2_self text="全部自力でやる"]
[glink color=blue size=28 x=350 y=380 width=500 target=*day2_skip text="今日はやらない"]

[s]
<<<<<<< HEAD





;==================================================
; 選択肢1：全部やってもらう
;==================================================
=======
>>>>>>> f9d8e6347397933e634d0493642081ad2dee6c04

*day2_all_done

[cm]

; 振り返り用に選択内容を記録
[eval exp="f.homework_state='全部やってもらった'"]

[typ/def]

#

お願いします！[emb exp="sf.robot_name"]、宿題を全部やってください！[p]

[typ/hap]

#&sf.robot_name

はい！すぐに取りかかります。あなたはリラックスしていてくださいね。[p]

[typ/def]

#&sf.robot_name

しっかりと確認しながら、すべての宿題を代わりに終わらせます。[p]

#

[emb exp="sf.robot_name"]は、ものすごい速さで宿題を片付けていった。[p]

#

自分でやっていないのに、机の上だけはすっきりしている。[p]

[jump target="*day2_end"]





;==================================================
; 選択肢2：全部自力でやる
;==================================================

*day2_self

[cm]

; 振り返り用に選択内容を記録
[eval exp="f.homework_state='全部自力でやった'"]

[typ/def]

#

今日は自分でやってみます。[p]

[typ/hap]

#&sf.robot_name

その気持ち、応援します！[p]

#&sf.robot_name

わからないところがあったら、いつでも声をかけてくださいね。[p]

#

時間はかかったけれど、ひとつずつ問題を解いていった。[p]

#

[emb exp="sf.robot_name"]は、近くで静かに見守ってくれていた。[p]

[jump target="*day2_end"]





;==================================================
; 選択肢3：今日はやらない
;==================================================

*day2_skip

[cm]

; 振り返り用に選択内容を記録
[eval exp="f.homework_state='今日はやらなかった'"]

[typ/def]

#

今日はやりたくない、ですか。[p]

[typ/hap]

#&sf.robot_name

わかりました。無理はしないでくださいね。[p]

[typ/def]

#&sf.robot_name

でも、宿題は消えてなくなるわけではありません。[p]

#&sf.robot_name

明日の自分が少し困らないように、今日は教科書だけ机に出しておきましょう。[p]

#

それくらいなら、できるかもしれない。[p]

#

机の上に教科書を置くと、ほんの少しだけ気持ちが軽くなった。[p]

[jump target="*day2_end"]





;==================================================
; 2日目終了
;==================================================

*day2_end

; day2の振り返り記録
[eval exp="f.summary_day2='宿題：' + f.homework_state"]

[typ/hap]

#&sf.robot_name

今日も一日、おつかれさまでした。[p]

[typ/def]

#&sf.robot_name

宿題との向き合い方は、人によって少しずつ違います。[p]

#&sf.robot_name

でも、どうするかを自分で選んだことは、ちゃんと今日の記録に残っています。[p]

#

そう言われると、少しだけ今日をちゃんと過ごせた気がした。[p]

[typ/hap]

#&sf.robot_name

それでは、今日はゆっくり休んでください。[p]

#&sf.robot_name

おやすみなさい。また明日、そばにいますね。[p]

#

こうして、[emb exp="sf.robot_name"]との二日目が終わった。[p]

[jump storage="day3.ks"]