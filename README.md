Viviane the Bot
===

## 必需
* Microsoft Windows
* 酷 Q
* [me.cqp.ishisashi.cqsocketapi.cpk](https://dl.bintray.com/mrhso/cqsocketapi/me.cqp.ishisashi.cqsocketapi.cpk)

## 设置（根据 AlexanderMisel 口述整理）
### linky.lua
* bad_patterns 是所有敏感词，可以使用 Lua 的模式匹配；
* op_admins 是可以加黑、解黑、shutdown、startup 的管理员名单；
* enabled_groups 是启用的群号；
* welcome_test 是新成员的欢迎词，cq_at 表示 @ 那个人；
* group_card 配置群名片规则；
* dont_checkcard 配置不检查群名片的群组。

### reply_dicts.lua
* replylist 匹配前面的模式即回复；
* cmd_replylist 是 /xxx 的回复；
* newbie_reply 是 /newbie 的随机回复。

## 运行
运行 run_linky.bat 即可启动机器人。
