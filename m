Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AF194A303A6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 07:35:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thjrV-00024W-NJ;
	Tue, 11 Feb 2025 06:35:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3le-qZwkbAGQUabMCNNGTCRRKF.IQQINGWUGTEQPVGPV.EQO@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1thjrU-00024Q-MC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 06:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Dnf+unHgvHTOrmxMwDXxzV/B0XTEiQ7sh1xCaruwTsc=; b=lEb/ZXhqAHuSsFKJhrv5jTF4tY
 YDi/Qr85BLEWBvYHrzovg2LAP3GACAFwBUO2uOsKEqTVNKO9zLekZ+OBi/v46lS+P1AG+NpezpSh/
 JcrGZXVGIlDSse56V0vWIOkpn7BZvEpdKYh+c/PplKarE4A9Kesq/QOLWR71mIYixoK0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Dnf+unHgvHTOrmxMwDXxzV/B0XTEiQ7sh1xCaruwTsc=; b=H
 J9iQyqqfZfjqaUpVSjI1WZv1WTMMUbv+v5fk6Unif1Doavz9M+RrxmID42/L5M8n1M86hsodMZxmf
 qnEZugoFttDzwektPUdLXngjHIVXbjIZYaDAMAN+vo4M2Zd00LfgHaQ8znXISOiK7h/ccJ+GnGEe6
 +LYevu0tUQM8Z6v4=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1thjrU-00067V-Fr for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 06:35:13 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d1445827f9so23699785ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 22:35:12 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739255702; x=1739860502;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Dnf+unHgvHTOrmxMwDXxzV/B0XTEiQ7sh1xCaruwTsc=;
 b=hX4EGCRweJLTqt6wzaifm82sEh+dqE2YyvqST9EkmZ+R80AKGfO0g/AyRx1CL4mDt/
 ALEGJOtabMcYkqZZxF5YBiAeiud5upn6j+Wn1f6b65o2HpYjX31FgVNWaZDX3rvhuJ0B
 Pg7dTZ/VK2GASq3TW/paAK7jxRJIRaJvaYYdUI8zXSNCt8NXzyGgJev5MEb8BbPs1iZN
 RvlAJKkhOPDV09QJhZEWGgVCrAIJ0qKxdwDrbNwopp1SC1eB37hAfop9ILu5wvb1ScKL
 V0xM2vvapk/QN/LSg53PA9fAx4Km7KuUUM2VZ2gU8SNqNtQa04+OUItlQ0DeJ13vwcs5
 DjUg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXphHvBSRs9NXgXYl7SazYXtle6jsltvtqTfsp2Iz0BTGTRaWg9pGKkayr51+2VeFCnPqTXFDJ+8+6TkCzUZuR8@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwjsAol38f+HNP3kr3oeZpWnDEl73nEb2WBD8KoUfwOefhdli+s
 EifZZ9iHjmO5AFU9WcH39Vrnmsp8lR3jm9NcDUI5KxhypHhN+b6nTJLGR+wRYrlhoxpSb0mTwiA
 XiA5Ws8Et7pRTSp5StGWgjTq/rADWh6MlAx8h5JofiMQxC9CQd0G/2Ac=
X-Google-Smtp-Source: AGHT+IGhMpMslXeGt3lLc1bKjPLawiRW7Nr5XJfSjPoi5bXWQhfcePiwGkI8j4D9+XAfR17GTUtGVMBsAPUuBwhwa8MQ/zJKNdWo
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1909:b0:3d0:1abc:fe03 with SMTP id
 e9e14a558f8ab-3d13df2351bmr155028975ab.15.1739255701871; Mon, 10 Feb 2025
 22:35:01 -0800 (PST)
Date: Mon, 10 Feb 2025 22:35:01 -0800
In-Reply-To: <c6764fc9-9ced-4a55-a91d-ae29e3db2433@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aaef95.050a0220.110943.003b.GAE@google.com>
From: syzbot <syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-by:
 syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
 Tested-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1thjrU-00067V-Fr
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in new_curseg (2)
X-BeenThere: linux-f2fs-devel@lists.sourceforge.net
X-Mailman-Version: 2.1.21
Precedence: list
List-Id: <linux-f2fs-devel.lists.sourceforge.net>
List-Unsubscribe: <https://lists.sourceforge.net/lists/options/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=unsubscribe>
List-Archive: <http://sourceforge.net/mailarchive/forum.php?forum_name=linux-f2fs-devel>
List-Post: <mailto:linux-f2fs-devel@lists.sourceforge.net>
List-Help: <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=help>
List-Subscribe: <https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel>, 
 <mailto:linux-f2fs-devel-request@lists.sourceforge.net?subject=subscribe>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hello,

syzbot has tested the proposed patch and the reproducer did not trigger any issue:

Reported-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com
Tested-by: syzbot+15669ec8c35ddf6c3d43@syzkaller.appspotmail.com

Tested on:

commit:         b278ebc2 f2fs: fix to avoid panic once fallocation fai..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=1191c3f8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=147b7d49d83b8036
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
