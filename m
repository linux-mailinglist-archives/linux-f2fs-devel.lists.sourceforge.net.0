Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F82A8D5874
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 May 2024 03:58:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCrWz-0004yk-SM;
	Fri, 31 May 2024 01:58:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3qS5ZZgkbAKQWcdOEPPIVETTMH.KSSKPIYWIVGSRXIRX.GSQ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sCrWy-0004yb-LZ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 01:58:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lVF5fLhrIMnfDIaeb9o1U/wk5sbSqoaeBs5jwtIDr+g=; b=U6e3gbEXypzXeQgNPeXxk5BBOi
 eqOzSf4EeNfX1FS6GAXyBoAhwRj/sPPvpYkVW09vskQFDgI7iYtMx7RfbjkJVYgAKCGmyVWSVY/VU
 1XTNM52h9rGkyyIoGcYA9qdIGkkWBEIRpUDWQDZRrx3XJd+L41mQL1ew6k/tErtOdl9M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lVF5fLhrIMnfDIaeb9o1U/wk5sbSqoaeBs5jwtIDr+g=; b=a
 h9wh1Y8fgk5tP6KytRZL/c2q92G7Z4mjHNRNh+vQd66BqdSUM1Q9ZEzkSFnmO9uBGu+sVucKhzNsp
 0EYjAcoPdHQXJTXTiv9q2+SNs2Q0HpQLmnWXBcJ+chQt/lH6++9xah9DRCgp2RbySfuy+guWVnxiU
 nFVUDUynVLdeXWzQ=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sCrWy-0003TD-6R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 May 2024 01:58:08 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3747f77bafcso11182885ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 May 2024 18:58:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717120681; x=1717725481;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lVF5fLhrIMnfDIaeb9o1U/wk5sbSqoaeBs5jwtIDr+g=;
 b=JDG8+xF8a6GQ3BrjOEAT0EQRuGdDG0LoCO9BOWuQoE4QICEtpQEwcs7WKgjlyC0+Sm
 QDYaw7iS5RnJrHR1Z7+XccMealvvvTby1Pg1rAxZip3SjWxsQ2cduje0U0/Rzp50Hx7s
 /438wRMqhHePyD6/pctF77tZWmB6pvAgyQeRT9KVpreQ6foi1TdVGA2iEmfVHR0InvKy
 QoTDUOdPRgArjSA6a3HXwJE5S7YAddEcz95PYL3KF3+JEuQttmEQ0Djql9z4KE6jp0ml
 KA0eLLmC/gS2MnlN58rz2d3hqbwcLODiw0qbjFY0tR7L70NvTblilGuOqc6fgClxVQbb
 uZcA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUz37t8yRn/0m+4Q7QwIuTH30oRDA2YtHd6y8TBYTlSHWQwFi4cF3KfPbygpVZ73P9QnPrOCoZrF6yi8ZF+iZENkkZYlJwyu55ah0A+xgjLpHc+3PjEbw==
X-Gm-Message-State: AOJu0YzLgFQBN4XUZxMdvaghklM6AVm6KgikOjSpQimmCICQQtwq2Jxr
 D9uCwBlAwaxm5jD/r7M1kUxF5gf4qXvO2vyGChWGT+zcSdze0TXmW7mjPPzZs+5uomkBu92d3lT
 jBwbdk8UPwkr49J4Dm9FvBmFWKMeb58jLrWT850yMGLJUjVhHOyMClck=
X-Google-Smtp-Source: AGHT+IGrEt4nUHDcF3e9MOXXksrBLXmItYeZQKlTA/4sBECgJXxoMv/I84e0RWwwD6fDhWGo1aIlMPvg8kADYAiMA0xzhn5JIBFm
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e08:b0:374:5eee:dc2f with SMTP id
 e9e14a558f8ab-3748b8f23b6mr480465ab.0.1717120681793; Thu, 30 May 2024
 18:58:01 -0700 (PDT)
Date: Thu, 30 May 2024 18:58:01 -0700
In-Reply-To: <cdac627f-7d25-49d6-abf5-c9f9723f0dcc@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000466c600619b650a2@google.com>
From: syzbot <syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot has tested the proposed patch and the reproducer
 did not trigger any issue: Reported-and-tested-by:
 syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.197 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCrWy-0003TD-6R
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 sanity_check_extent_cache
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

Reported-and-tested-by: syzbot+74ebe2104433e9dc610d@syzkaller.appspotmail.com

Tested on:

commit:         b022159f f2fs: fix to truncate preallocated blocks in ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip
console output: https://syzkaller.appspot.com/x/log.txt?x=10811664980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6be91306a8917025
dashboard link: https://syzkaller.appspot.com/bug?extid=74ebe2104433e9dc610d
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.
Note: testing is done by a robot and is best-effort only.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
