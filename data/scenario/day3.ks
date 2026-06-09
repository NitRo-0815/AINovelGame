;==================================================
; day3.ks
; 3日目：お風呂の準備
;==================================================

*start

[set_default_view chara="off"]
[chara_show name="toyopon" face="def" x="30" y="180" width="480" time="0"]
[eval exp="f.bath_choice='' "]

[jump target="*day3_scene1"]

*day3_scene1

[typ/def]
#&sf.robot_name

今日はお風呂に入る日です。準備は整っていますか？[p]

[jump target="*day3_scene2"]

*day3_scene2

[typ/hap]
#&sf.robot_name

どうしますか？[l][r]
[link target="*day3_help" exp="f.bath_choice='頼む'" ][emb exp="sf.robot_name"]に掃除とお湯わかしを任せる[endlink]／
[link target="*day3_self" exp="f.bath_choice='自分でやる'" ]自分で掃除とお湯わかしをする[endlink]／
[link target="*day3_skip" exp="f.bath_choice='やらない'" ]今日はやらない[endlink]

[s]

*day3_help

[typ/def]
#

[emb exp="sf.robot_name"]、今日はお風呂掃除とお湯沸かしをお願いできますか？[p]

[typ/hap]
#&sf.robot_name

了解です！すぐにピカピカにして、お湯もあたためますね。[p]

[jump target="*day3_end"]

*day3_self

[typ/def]
#

今日は自分で準備します。[p]

[typ/hap]
#&sf.robot_name

いいですね。私は見守りながら、必要なときにサポートします。[p]

[jump target="*day3_end"]

*day3_skip

[typ/def]
#

今日はお風呂をやめておきますか。[p]

[typ/hap]
#&sf.robot_name

わかりました。無理せず、また気分が乗ったときにしましょう。[p]

[jump target="*day3_end"]

*day3_end

[typ/hap]
#&sf.robot_name

明日は読み聞かせの練習をしましょう。お楽しみに！[p]

[jump storage="day4.ks"]
