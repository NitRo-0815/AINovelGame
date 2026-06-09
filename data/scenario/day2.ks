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

[jump target="*day2_scene2"]

*day2_scene2

[typ/hap]
#&sf.robot_name

どうしますか？[l][r]
[link target="*day2_all_done" exp="f.homework_state='全部やってもらう'" ][emb exp="sf.robot_name"]に全部やってもらう[endlink]／
[link target="*day2_self" exp="f.homework_state='自分でやる'" ]全部自力でやる[endlink]／
[link target="*day2_skip" exp="f.homework_state='やらない'" ]今日はやらない[endlink]

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
