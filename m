Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 79C348FB799
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jun 2024 17:40:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEWGl-0000VH-E9;
	Tue, 04 Jun 2024 15:40:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3VDVfZgkbAHUlrsdTeeXkTiibW.ZhhZeXnlXkVhgmXgm.Vhf@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sEWGk-0000V8-41 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 15:40:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IUyz+L4QW1yPiCkGSSsrehPuI4CGB6TTCD6NGaUJQcs=; b=M71blY/W3FULNP5axWN4w29nBr
 7NAfpDHIAFKfk1mXCb2Eyw9/uODqkK9r23BU4b5DKMXI0vntbmow2/EqAI0E0OMXVDpVAUoZdujjI
 CgnYUAFCLI//NxDrox7/yuDDH66i6WRrehs/dzD18DtjONmy8lb9T8P9XrDe2B62or9k=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IUyz+L4QW1yPiCkGSSsrehPuI4CGB6TTCD6NGaUJQcs=; b=B
 kuAvZz1A7K4v2kqyfTqpZMLgF4CwWlSPU8jVBMb6mTvMcEQuKUguBAPChquOSyFSJy22MownC73Et
 jRpz9zu4/A4MVpAJNqI4ucb3Sd3kgOTmKHubHyZXFJtCQwlBaZDha6+9u4U9o1jdsCzGWeuvTqjVS
 VY5P+hbC32U3OZLc=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sEWGl-00069T-Ff for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 15:40:15 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3737b6fc28fso49926285ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Jun 2024 08:40:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717515604; x=1718120404;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=IUyz+L4QW1yPiCkGSSsrehPuI4CGB6TTCD6NGaUJQcs=;
 b=fyuxzcy78/ec13OXAuiWgDD0B8+J+tNckwRr46OOLB419gwLVFv35j8BY9Y9AH5HK6
 e8YkUAP/niV8LDCGI74IP/iOy27xhfduVWcbBf8qvMcBg14Iaa40GrwZkwtAFiZtN0jX
 ceslec5NB0LZbC0QcqDX7XrRqRvAsRl2xGJR0oiEQJTiSV0iI6S6Q9W5wcnIkiot/QBB
 8SrDs8vfyO9taur2wyRCcSg4qPDrvgYJM/nNrIo/WU5uSXwwU/ieR2tIcAFcDI/z4bID
 2MNrNqjprbAjisrMRtRSWoMuyiOn428sfvpdZqxukQJ4HTXL69Gg4JbD8zKhtJvEIK/p
 6ZTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0n3Ee73kjeCZg5E7PlaLI4nXCsO5fcjQQsMIv/dcUSU0Rvs7m1TS/0h+YI2k4zZg5UYJ3wz45bWzsUfLihENdnGmn1fE+AN9rWHLMqBtyq23WXoCX7Q==
X-Gm-Message-State: AOJu0YwOp3JTnrxtzgB42xDQ93kj/gm5l9//MQm5tjuVVqTMtYQKSGT/
 e4451Y7n3y7Qfp6Q3rNGev7gBMZAdA1sG8DELNQVbpfBX+AuDzp5LH5I+mCV8S3ms8BbVpByoY6
 S8xgZ+Za0ofoBDsiNhuZSJs+wdvNYVIyRQMrosYsHpHrQWZEGBFtdkwA=
X-Google-Smtp-Source: AGHT+IFGhGxQk2d4VPpAMbOpbT3fHBYBgC5cRPRwhnU2rdKJrsLua3NcjPW+ofZYIToEnVAlPsVSGeQJSptZd9DrNQqZdq1fO/Ps
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:20e1:b0:374:9305:62be with SMTP id
 e9e14a558f8ab-374a850a1fcmr1743585ab.2.1717515604014; Tue, 04 Jun 2024
 08:40:04 -0700 (PDT)
Date: Tue, 04 Jun 2024 08:40:04 -0700
In-Reply-To: <08cf0523-b70f-422b-8125-884ddc21d1ea@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000079499e061a12436f@google.com>
From: syzbot <syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.197 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sEWGl-00069T-Ff
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_balance_fs
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

Reported-and-tested-by: syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com

Tested on:

commit:         4d419837 f2fs: fix to don't dirty inode for readonly f..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=117f66f6980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=db568e553e0f3797
dashboard link: https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
