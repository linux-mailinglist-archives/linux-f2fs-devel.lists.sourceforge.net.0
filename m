Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 54C6887A9C4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 Mar 2024 15:50:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rkPvw-0002uk-5a;
	Wed, 13 Mar 2024 14:50:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3G73xZQkbAJIEKL6w770DwBB4z.2AA270GE0DyA9F09F.yA8@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rkPvu-0002ub-3s for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 14:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pBqXF+FtEC98JPe7hVSSvBQgwR2DkFM1Y3dRr1bdJDs=; b=aMrAqfpllz/y8PtZy7DnMPCA64
 yGVfAS5CkcSQiCYZJSOGu3IYSn8z1sreHMnFpJKwcOLfaJ8jM5B+zdB1bj+x5YlHzgbXxJbQeinYb
 aoyYWjfMcycohINnhwuwZy2dEyvehqOIK3ZBoYCQdohZabwYUy4Ig3h8wh28FuQcPnsY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=pBqXF+FtEC98JPe7hVSSvBQgwR2DkFM1Y3dRr1bdJDs=; b=i
 +jY8xZTvl6sjLB0YbYWHrIzZQ9rPR/ERm8F+etvkU2QL6orsjgfHjWeLW8QC3FKrHMJJwPmFc1b3C
 weAGmmRCYPBQN62tQ4KZ1PvufbansWE+T9hIw5QmxY86n4JdPMfIkrED5tboPbyPGCzuBdBMRp7Fh
 2udZV519SFBGXwzw=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rkPvj-0000TA-Oz for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 Mar 2024 14:50:18 +0000
Received: by mail-il1-f200.google.com with SMTP id
 e9e14a558f8ab-3667a84b02cso3625015ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 13 Mar 2024 07:50:13 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710341403; x=1710946203;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pBqXF+FtEC98JPe7hVSSvBQgwR2DkFM1Y3dRr1bdJDs=;
 b=Qif0jM1O9WQ4CuiW81J8YkUaU93AP0dofwidgP4WoHkHVG0+5cwvPrBgIelGW9Phze
 KbrxP0aZU8nZa43MYp+J0iuj+JsEvDvPCl2m0RgJQ4d19Zy3DWZJJT3ZuykSF5Uyq+yQ
 Vp5TgefCq/5PggnuDG40zSNwHFwvgNhdcs+QSklcEQlLo4TR5ZFb9+ULLqjfKEL+qPDt
 bitAzsTA82h+anFuMxwUft6gUHlZEtcSjZGv1Dkx8nhd21qt+FNY/RaFtevkd2MPxBZU
 d1/QmsS2AVOuX9nrwGbdjKSeGWFT6d2+GIuA9Z/sKd0MVKsvCOOvMktWS8ZFNfyDixl+
 9ySg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVavj3AOVgllDIZYWdXRV35CMGx59AUXDtNyaJZRdyWJY+C21c1W4F1RKBhSoAgH4IRLynldIJmbhK2DEDh3nSoF6ryJsvHtFCxZg0f1Sg9/E3gLA0D+A==
X-Gm-Message-State: AOJu0Yz5jgUaMLHp/eUYzB8FGOMEQN/RXC9XZkjLAnsyG8mzkcTChcpk
 3AlaP17qp/XWM43YJoJ9vz0/JYXWlh6fAjt5Y8CXAmWkAUb3rLjl579hhw3wvpjteX70UkaXz/2
 T2z2t+3ageSF/9oiZtvF+0n/PQ8fHvVlwR9u/5BYaV2HhsdBnUUTTBtA=
X-Google-Smtp-Source: AGHT+IE/nKeb60I7S1447N7p6nt1amMYQgnAkwkywJB8/ZNa7GHWQrU7DmYHP7hBdfeVeAYsfJKzbhQ3eGlGodGUdOWmyLZKDxOl
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c2a:b0:365:3e12:3eb1 with SMTP id
 m10-20020a056e021c2a00b003653e123eb1mr5642ilh.1.1710341403338; Wed, 13 Mar
 2024 07:50:03 -0700 (PDT)
Date: Wed, 13 Mar 2024 07:50:03 -0700
In-Reply-To: <21fc3ed1-de3d-4027-b775-ef061eaca53d@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000ca7cd306138be344@google.com>
From: syzbot <syzbot+763afad57075d3f862f2@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+763afad57075d3f862f2@syzkaller.appspotmail.com
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rkPvj-0000TA-Oz
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 f2fs_filemap_fault
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

Reported-and-tested-by: syzbot+763afad57075d3f862f2@syzkaller.appspotmail.com

Tested on:

commit:         51fc665a f2fs: fix to avoid use-after-free issue in f2..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=113bf9fa180000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1fcc0a6ff51770e5
dashboard link: https://syzkaller.appspot.com/bug?extid=763afad57075d3f862f2
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
