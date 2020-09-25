Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CD6A277FDD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 07:18:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLg7x-0001Hb-VE; Fri, 25 Sep 2020 05:18:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3nX1tXwkbAFAAGH2s33w9s770v.y66y3wCAw9u65Bw5B.u64@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kLg7x-0001HR-10
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 05:18:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xnaQi0Ogw6Ir+bQkz0MTlcxfGbyjAbFPvVDgd22X8g4=; b=h6QZ5zrPtPEoHPVPuJPwNz0qOP
 kJNx9olUi8U5owWyjJJC3dMn9vvHfqnuIBQZYdq0MgEnfYHKL7wzv+CjxfanKTK9diNKwbzjxTBsv
 qmepuzkDjpcChm9SNS6fSBcRwbIIzgGMkt75Exl78/52A8WAORPIEsrlXHFUoUf9pIjU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xnaQi0Ogw6Ir+bQkz0MTlcxfGbyjAbFPvVDgd22X8g4=; b=R
 blS9h9i5vQs5z3buIgZzfHbXqEUBnCxE76y5+ST3Kzc4u3aUcXWMvKuDbA98fElOiYeYDc7mlq5xE
 pKFKT2IzAHJhWLNX/2yV5B2aeprYD+EaYTHS9S4dcarxD+OgznkRnPN7l6wp6rOxoIE9mfdCtTYNu
 5DAhvaNyLAOIvdZI=;
Received: from mail-io1-f79.google.com ([209.85.166.79])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLg7n-007IXN-5V
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 05:18:36 +0000
Received: by mail-io1-f79.google.com with SMTP id 80so1095944iou.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 24 Sep 2020 22:18:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=xnaQi0Ogw6Ir+bQkz0MTlcxfGbyjAbFPvVDgd22X8g4=;
 b=tR+XNZaVEsGH9vCBETcUZImM6IU7xpGD3NyHC8TuURTd85zbIpOVzB4PEx2z2wH9SG
 mBG2g6VtUle4mp6KI3wZcWGJxZXvfv0KI5DVoNzHIVzJUrW2MnyQ74I4ofgpNMd+Pcq7
 uwN0P+if7b7aek7htx0TV/LWAjJwcSCC8V0bNK/yGp7x8pS6jN8GH2+m9zCEzT5dRAym
 ZiDzsqojRzuU2YlwjhqAyDeMRRy0jur7ldqVD/GJbRJ4FjrJ/J7VNr887qnByPYp+5M3
 GoB9MXltl6sjr+DNWHoj/PFPbH1G/C4FFoelvAyiffFHxgxkLI+ePAJcu4eExotZt0To
 6fAg==
X-Gm-Message-State: AOAM530/onTjRli6UTrOJHkAnuLxWWbvSsdGcLxvDKjbXY8hZjNJGMz/
 SclXwOLayzKFv6qHT9aDg6IL1SLRIkamMCFcgvlyooh7obzk
X-Google-Smtp-Source: ABdhPJwFHnIAiyZebX2UEaNXh4EpklxkDUzVeGdciChcFKVao+vl1qvk1nfhQAvDSpVwdjyDosA8TNS/pClz6ns/4jJiDzlfljAN
MIME-Version: 1.0
X-Received: by 2002:a02:8802:: with SMTP id r2mr1962416jai.75.1601011101332;
 Thu, 24 Sep 2020 22:18:21 -0700 (PDT)
Date: Thu, 24 Sep 2020 22:18:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f9f80905b01c7185@google.com>
From: syzbot <syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com>
To: chao@kernel.org, glider@google.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: appspotmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.79 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.79 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kLg7n-007IXN-5V
Subject: [f2fs-dev] KMSAN: uninit-value in f2fs_lookup
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

syzbot found the following issue on:

HEAD commit:    c5a13b33 kmsan: clang-format core
git tree:       https://github.com/google/kmsan.git master
console output: https://syzkaller.appspot.com/x/log.txt?x=14f5b19b900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=20f149ad694ba4be
dashboard link: https://syzkaller.appspot.com/bug?extid=0eac6f0bbd558fd866d7
compiler:       clang version 10.0.0 (https://github.com/llvm/llvm-project/ c2443155a0fb245c8f17f2c1c72b6ea391e86e81)
userspace arch: i386

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+0eac6f0bbd558fd866d7@syzkaller.appspotmail.com

=====================================================
BUG: KMSAN: uninit-value in f2fs_lookup+0xe05/0x1a80 fs/f2fs/namei.c:503
CPU: 0 PID: 20216 Comm: syz-executor.5 Not tainted 5.9.0-rc4-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x21c/0x280 lib/dump_stack.c:118
 kmsan_report+0xf7/0x1e0 mm/kmsan/kmsan_report.c:122
 __msan_warning+0x58/0xa0 mm/kmsan/kmsan_instr.c:219
 f2fs_lookup+0xe05/0x1a80 fs/f2fs/namei.c:503
 lookup_open fs/namei.c:3082 [inline]
 open_last_lookups fs/namei.c:3177 [inline]
 path_openat+0x2729/0x6a90 fs/namei.c:3365
 do_filp_open+0x2b8/0x710 fs/namei.c:3395
 do_sys_openat2+0xa88/0x1140 fs/open.c:1168
 do_sys_open fs/open.c:1184 [inline]
 __do_compat_sys_openat fs/open.c:1242 [inline]
 __se_compat_sys_openat+0x2a4/0x310 fs/open.c:1240
 __ia32_compat_sys_openat+0x56/0x70 fs/open.c:1240
 do_syscall_32_irqs_on arch/x86/entry/common.c:80 [inline]
 __do_fast_syscall_32+0x129/0x180 arch/x86/entry/common.c:139
 do_fast_syscall_32+0x6a/0xc0 arch/x86/entry/common.c:162
 do_SYSENTER_32+0x73/0x90 arch/x86/entry/common.c:205
 entry_SYSENTER_compat_after_hwframe+0x4d/0x5c
RIP: 0023:0xf7f73549
Code: b8 01 10 06 03 74 b4 01 10 07 03 74 b0 01 10 08 03 74 d8 01 00 00 00 00 00 00 00 00 00 00 00 00 00 51 52 55 89 e5 0f 34 cd 80 <5d> 5a 59 c3 90 90 90 90 eb 0d 90 90 90 90 90 90 90 90 90 90 90 90
RSP: 002b:00000000f554c0cc EFLAGS: 00000296 ORIG_RAX: 0000000000000127
RAX: ffffffffffffffda RBX: 00000000ffffff9c RCX: 0000000020000980
RDX: 000000000002f042 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: 0000000000000000 R15: 0000000000000000

Local variable ----page@f2fs_lookup created at:
 f2fs_lookup+0x8f/0x1a80 fs/f2fs/namei.c:477
 f2fs_lookup+0x8f/0x1a80 fs/f2fs/namei.c:477
=====================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
