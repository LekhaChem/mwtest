local replylist = {
  ['^表白vva$'] = '谢谢。',
  ['艹|鸡巴|屌|屄'] = '请注意文明用语',
  ['词条'] = '百科请用“条目”，词典才用“词条”',
  ['IP封禁|%f[%a][iI][pP][bB][eE]%f[%A]'] = [[如果您注册帐号或者试图编辑时被系统拦截，请您参阅《如何解决无法编辑中文维基百科的问题》以及《如何注册中文维基账户》两个群文件。
这是机器人自动生成的回复。如果您仍有问题，请指明并等待其他群员协助您。]],
  ['上维基'] = '请前往 https://github.com/getlantern/download 下载上网工具。如需付费工具推荐，建议您浏览 http://www.evernote.com/l/AmEIfRIK0H9LE5XUla9dVz21Q8NQ5sVaxMM/',
  ['做维基'] = [[如果你希望给你的公司、企业、品牌、或你认识的人创建维基百科条目，你需要：
* 保证你在维基上发布的内容没有事先在其他网站发布，否则会被算侵权；
* 在维基上发布的内容不能带有任何文宣品的语调；
* 需要有至少三条第三方媒体报道。不能是自己的网站、也不能看出来是你们找这家媒体发的软文。“三条”报道指的是三条不同的报道，不是同一个报道在三家媒体上发了三次。
* 如果媒体有负面报道，一样要写出来。

如果上述几条有任何一条不能满足，你的东西发到维基上就会被删。都满足了也不保证一定能留下来。]]
}

local cmd_replylist = {
  ipbe = 'IP 封禁例外（IPBE）可以让您免受 IP 封禁影响。该权限只授予给有需要的维基人。若您的确需要使用匿名代理、大陆用户无法使用 hosts 绕过干扰或被 IP 封禁无辜波及，还请考虑申请。申请办法请见： https://zhwp.org/WP:IPBE （可让其他用户代为提交）',
  ping = 'pong',
  ['42'] = '本群由中文维基百科爱好者组成，通常用来交流维基百科相关的问题。您若有其他问题也可提出，但请注意本群不是万事通，群员没有义务为您解答您遇到的一切问题。知识、教程类问题，建议先行在互联网上自行搜索。',
  g11 = '维基百科不是用来打广告的地方。如想撰写中立的描述，行文中不要有广告语气、确保您的内容符合关注度指引（类似于知名度），并为其附上独立、二手的可靠来源。因版权原因，建议使用从未在任何地方发表过的文字撰写。请注明您与条目主题的利益冲突。',
  ['3rr'] = '【回退不过三】原则适用于所有维基人，即一位编者对于某一页面，在24小时内，不可以执行多于三次的回退（自我回退、修复恶意破坏除外）。',
  bias = '请避免地域中心：现时中文维基百科的用户多为华人，多来自其居住地，因此有时会不自觉变得地域中心、从其自身习惯撰写条目，而这未必符合我们的中立观点政策。请以全球观作适当表述。',
  blp = '我们的条目可能影响真实人物的生活，对此我们负有道德和法律上的责任。传记类条目必须严谨地撰写，并必须可供查证、保持中立并避免原创研究。',
  npa = '不要进行人身攻击。发表意见时，请针对条目，而不是编者；换句话说，请对事不对人。人身攻击会破坏这个社群。没人喜欢被辱骂。',
  npov = '须按照中立、准确的立场来写条目。我们须在条目中准确表达和以平等的态度对待各项观点——不可把部分观点演绎为“真理”或“最佳观点”。孰是孰非，交由读者判断。',
  ccbysa = '我们根据知识共享 署名-相同方式共享 3.0协议开放版权。在署名的前提下，人人可以自由发布和编辑，包括您贡献的所有内容。',
  verify = '维基百科不是发表原创研究的场所，编写时应参考可靠的来源。条目进入维基百科的门槛，是可验证性，而非真实性、众人的直觉和常识。经过独立第三方证实的内容方可纳入维基百科。',
  eq = '请保持文明——即使不同意他人观点，也请您尊重他们。切勿人身政击或主观论断他人。应保持开放和包容的心态参与讨论，并以达成共识为重。',
  iar = '我们没有一成不变的规则。请勇于编辑。虽然我们追求卓越，但并不要求您做到十全十美，因此请不要担心在编辑时犯错。',
  official = '本群由中文维基百科爱好者（“维基人”）自发组织起来，与负责运营维基百科的维基媒体基金会并没有关系。因此，本群属于爱好者群体，虽然人数较多，但并不是“官方群”。中文维基百科亦无“官方群”一说。',
  ref = '引用资料来源的方法是这样的： 1999年9月，某某某做了一件事。<ref>[http://example.com/ <标题>]</ref> （其中， http://example.com/ 是资料来源的网址，<标题>是资料来源的文章标题）',
  suggest = '维基百科欢迎您参与编写条目，并感谢您的贡献。不过，我们建议想创建条目的新手先阅读 http://zh.wikipedia.org/wiki/WP:42 （收录准则）、 http://zh.wikipedia.org/wiki/WP:8S （选择来源准则）、 http://zh.wikipedia.org/wiki/WP:MOS （条目格式准则），谢谢！',
  notability = '维基百科收录已被独立来源予以关注的主题。如果是没有违反“维基百科不是什么”的主题，并且得到可靠的第二手来源的有效介绍，我们便可假定该主题符合收录标准。详情请参见 https://zh.wikipedia.org/wiki/WP:N 。',
  onepage = '如果想快速入门了解维基百科的规则，请阅读 https://zh.wikipedia.org/wiki/WP:KNOW ，此页或许可以帮助您处理大部分问题。',
  register = '我们强烈建议您在维基百科注册一个账号。您在维基百科的每一笔编辑都会被记录下来，没有账号会导致您的IP地址被公开。同时，由于IP会浮动的缘故，其他人将很难把握您在维基百科中的贡献，不利于交流协作。请前往 http://zhwp.org/Special:创建账户 注册。',
  politics = '请避免在此群谈论政治，如有需要，请移步IRC Freenode #wikipedia-zh-politics',
  wikileaks = '维基百科和维基解密无关。维基百科和维基解密无关。维基百科和维基解密无关。https://zh.wikipedia.org/wiki/Wikipedia:NOTLEAKS',
  source = 'Viviane的源代码位于https://github.com/AlexanderMisel/mwtest ，以GPLv3协议自由使用，欢迎贡献代码。'
}

local newbie_reply = {
  '维基百科上很多条目存在来源不明问题，大家用 https://tools.wmflabs.org/citationhunt/ 这个小工具就可以帮忙修复。有空就来改善来源吧！',
  '维基百科是一个任何人都可以参与的项目。维基百科不是少数专业人士编出来的，而是像你我这样的普通人编的。希望大家在使用的时候，随时能够参与贡献。',
  '中文维基百科是不分简体版和繁体版的，无论我们还是世界其他地方的人看到的都是同一个条目。大家编写维基的时候可以尽管用简体，不用管条目其他地方是繁体还是简体。维基有强大的自动简繁转换系统，让大家看到熟悉的文字版本。',
  '在维基百科上，修改一个条目的标题是通过“移动”功能实现的，这个功能只有编辑次数>=50的用户才能使用。大家如果标题写错了，可以在群里或者站内求助喔。',
  '如果你需要入门维基百科，群文件是一个很好的途径。如果你需要视频教程的话，可以看看我的YouTube频道https://www.youtube.com/channel/UCAZvWoqHbHoKfwUNaQYn_uQ',
  '如果你打算建立一个新条目了，你可以尝试使用https://zh.wikipedia.org/wiki/WP:WIZ 这个工具。',
  '维基百科非常重视版权。如果你不想了解版权协议的细节，那只要记着，不要“搬运”别处的内容到维基百科即可。即使注明来源也不可以！！！具体的版权协议请刷 /ccbysa 了解。',
  '我们欢迎你给维基百科条目配图，图片需要先进行上传才能使用。你配的图应该是版权自由的图像。版权自由是不是就是没版权？不是！如果你不想闹懂它，那就只传你自己拍摄或制作的图就行了。',
  '如果你看到维基百科顶端有巨幅的捐款公告，上面的措辞显得很可怜。你可以不必当回事。WMF基金会不缺钱。如果你不信我说的，也没有关系，没有人拦着你捐钱。',
  '想知道一个条目的历史编辑，点击右上方的“查看历史”按钮即可。如果你发现条目正在遭受破坏，可以在破坏性编辑上点击“撤销”。不过请注意，在维基百科上界定破坏的标准是是否违反维基百科的方针。'
}

return {
  replylist = replylist,
  cmd_replylist = cmd_replylist,
  newbie_reply = newbie_reply
}