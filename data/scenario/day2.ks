;==================================================
; day2.ks
; 2日目：宿題の対応
;==================================================

*start

[set_default_view chara="off"]
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]
[eval exp="f.homework_state='' "]

[jump target="*day2_scene1"]

*day2_scene1

[typ/def]
#&sf.robot_name

おはようございます。今日は宿題がまだ残っていますね。[p]

*day2_scene2

[typ/hap]
#&sf.robot_name

どうしますか？[p]

[glink color=blue size=28 x=180 y=180 width=500 target=*day2_all_done text="全部やってもらう"]
[glink color=blue size=28 x=180 y=300 width=500 target=*day2_self text="全部自力でやる"]
[glink color=blue size=28 x=180 y=420 width=500 target=*day2_skip text="今日はやらない"]

[s]
[s]

*day2_all_done

[cm]
[typ/def]
#

お願いします！[emb exp="sf.robot_name"]、宿題を全部やってください！[p]

[typ/hap]
#&sf.robot_name

はい！すぐに取りかかります。あなたはリラックスしていてくださいね。[p]

[typ/def]
#&sf.robot_name

しっかりと確認しながら、すべての宿題を代わりに終わらせます。[p]

[jump target="*day2_end"]

*day2_self

[cm]
[typ/def]
#

今日は自分でやってみます。[p]

[typ/hap]
#&sf.robot_name

その気持ち、応援します！必要ならいつでもサポートしますね。[p]

[jump target="*day2_end"]

*day2_skip

[cm]
[typ/def]
#

今日はやりたくない、ですか。[p]

[typ/hap]
#&sf.robot_name

わかりました。無理はしないでくださいね。明日はまた新しい一日です。[p]

[jump target="*day2_end"]

*day2_end

[typ/hap]
#&sf.robot_name

明日はお風呂の準備を一緒にしましょう。[p]

[jump storage="day3.ks"]
