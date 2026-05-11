
[cm]

@clearstack
@freeimage layer=1
@layopt layer=1 page=fore visible=true
@bg storage="room.jpg" time=100
@wait time=200

*start

[ptext layer="1" page="fore" text="AI PARTNER QUEST" x=90 y=92 size=54 color="0xe8fbff" bold=true]
[ptext layer="1" page="fore" text="CASE 01: 心が限界の友達" x=96 y=158 size=24 color="0x9be7ff"]
[ptext layer="1" page="fore" text="AIと人間が協力して、街の困りごとを解決する。" x=96 y=196 size=22 color="0xffffff"]

[button x=135 y=300 graphic="title/button_start.png" enterimg="title/button_start2.png" target="gamestart" keyfocus="1"]

[s]

*gamestart
; 最小プロトタイプ本編へジャンプする
@jump storage="first.ks"
