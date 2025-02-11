Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D62EAA302EB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 06:32:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thisU-0006a5-Ei;
	Tue, 11 Feb 2025 05:32:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <30uCqZwkbAIMz56rhsslyhwwpk.nvvnsl1zlyjvu0lu0.jvt@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1thisT-0006Zz-LB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 05:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VlVUHeZMHHklhN4yxXU8wF+3Tx00zULTzJ3c+WwKunU=; b=JW5suU5lw/nwkwjN0l2q41zN1p
 Ykfelgt7IkZwuML9ocoqxAZUb5/AR5PRLgM/R0joZGP8E7Zjt4PtTtq10Uu6f1sEYRjV3Bt4gyHXa
 yhb1nC5ViAAfXa6AqycXA2gBjr+cco1fV2lygP9wCUAZryAMAsACYa2siepDMX/8gbIg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VlVUHeZMHHklhN4yxXU8wF+3Tx00zULTzJ3c+WwKunU=; b=B
 bPvAdT6RsBT3sPP0ZZ/5OIga/AgimTIKyVxrHu5Hk7j6FyZnm5UTQ299JBJrwxcqdC0M+y2KqA9g4
 IGENP1TN8M3f2Xf4D96J1fFJ3/ViI6LnPfc+qLNY+vzThKZ+b1mnQvkyupK+Fdq+9J5MbXB1uEJJn
 1FeZHFO+E7tXEqzo=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1thisS-0002hZ-BB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 05:32:10 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3d162c02150so13120335ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Feb 2025 21:32:08 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739251922; x=1739856722;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=VlVUHeZMHHklhN4yxXU8wF+3Tx00zULTzJ3c+WwKunU=;
 b=Ic6/+i3GIHXYfjRqerj5xwmsQideOowpFV4cB4MIYj4mm4zFwatkue9oCTl1V+BqKl
 w8gfyVP9BbVjIxBAyT3arzvFL3UcikLqZudP5wkclxHtLW7g6IRb2JfBsHkPHGXUccNG
 dybcwFxIvGqTn9YiTRw/AKViUF0zdjsVRODszXsLrhqywNReoV/LW3R70nnhf6EUMSx4
 zSGYKwdvZIMPjwVJXw2hAWJkpVhLeoNHf1kwZgrNoyIOGlAFqITDegZY6gm6yNkRBcUG
 PC2AX42nc4nvEKy8YJOhZIA6HP0BL5rWAr8LZzpqmNdnpk1YKsErIFf0N0FPplyICeYv
 xUyg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbATDeKPUTCaT7UEHH6CN67pbzfQy6jMVyXX9tQQK+VNaYE6FYrBGFD/IZn+UpCE3l/gZbKvNQ+5s9ofr3cVRv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyRd41Qwm3ZmPvaF9uJSxjfvoVsCNNrQ7oTy8ZIJt/GNQqvy7KE
 htHQnlKn8taWfUH2rLqfxqTQeX2UEDPzShdIgKveZIuttakfHI0/3WogTeHfSXon5MllHfOJvye
 OUNtus/xDmHIcKvX1W9wuBBpAsPT1RJcZvA/pachODHpn5xj8M9mhinA=
X-Google-Smtp-Source: AGHT+IEpTYRKmOmIn+fHcT4atdFSY5bs8ytIyieHO8f6r1aLNTuV40aBCQyvjPjl/AGFZ0IGy71JLOJ8jNiLmrpmOFk51pZwl2JC
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:17ca:b0:3cd:d14c:be69 with SMTP id
 e9e14a558f8ab-3d16f4d9170mr15164065ab.11.1739251922678; Mon, 10 Feb 2025
 21:32:02 -0800 (PST)
Date: Mon, 10 Feb 2025 21:32:02 -0800
In-Reply-To: <5a647c34-62d0-47e9-827d-6d7fa9ee5ec5@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67aae0d2.050a0220.3d72c.005b.GAE@google.com>
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
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: WARNING in f2fs_handle_critical_error
 kworker/u8:3:
 attempt to access beyond end of device loop0: rw=2049, sector=40960, nr_sectors
 = 16 limit=40427 [ cut here ] WARNING: CPU: 0 PID: 53 at fs/f2fs/super.c:4255
 f2fs [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1thisS-0002hZ-BB
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

syzbot has tested the proposed patch but the reproducer is still triggering an issue:
WARNING in f2fs_handle_critical_error

kworker/u8:3: attempt to access beyond end of device
loop0: rw=2049, sector=40960, nr_sectors = 16 limit=40427
------------[ cut here ]------------
WARNING: CPU: 0 PID: 53 at fs/f2fs/super.c:4255 f2fs_handle_critical_error+0x34f/0x590 fs/f2fs/super.c:4255
Modules linked in:
CPU: 0 UID: 0 PID: 53 Comm: kworker/u8:3 Not tainted 6.14.0-rc1-syzkaller-00028-gb49923b8c6ce #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: writeback wb_workfn (flush-7:0)
RIP: 0010:f2fs_handle_critical_error+0x34f/0x590 fs/f2fs/super.c:4255
Code: 48 83 e6 40 31 ff e8 00 10 a4 fd 48 83 e3 40 0f 84 30 02 00 00 e8 11 0b a4 fd 48 8b 5c 24 10 40 84 ed 74 1a e8 02 0b a4 fd 90 <0f> 0b 90 80 7c 24 08 00 74 30 e8 f2 0a a4 fd e9 83 00 00 00 e8 e8
RSP: 0018:ffffc90000bd6be0 EFLAGS: 00010293
RAX: ffffffff841b52be RBX: ffff88807df62000 RCX: ffff8880226fda00
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000002
RBP: 0000000000000003 R08: ffffffff841b521b R09: 1ffffffff2858d2c
R10: dffffc0000000000 R11: fffffbfff2858d2d R12: ffff8880551e596b
R13: dffffc0000000000 R14: ffff8880551e4000 R15: ffff8880551e5988
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f490b243290 CR3: 0000000029b3e000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_write_end_io+0x674/0x9a0 fs/f2fs/data.c:347
 __submit_merged_bio+0x2a9/0x710 fs/f2fs/data.c:537
 __f2fs_submit_merged_write fs/f2fs/data.c:633 [inline]
 __submit_merged_write_cond fs/f2fs/data.c:655 [inline]
 f2fs_submit_merged_write+0x1ea/0x2c0 fs/f2fs/data.c:665
 f2fs_sync_node_pages+0x1a2c/0x1c90 fs/f2fs/node.c:2101
 f2fs_write_node_pages+0x304/0x6d0 fs/f2fs/node.c:2173
 do_writepages+0x35f/0x880 mm/page-writeback.c:2687
 __writeback_single_inode+0x14f/0x10d0 fs/fs-writeback.c:1680
 writeback_sb_inodes+0x820/0x1360 fs/fs-writeback.c:1976
 wb_writeback+0x413/0xb80 fs/fs-writeback.c:2156
 wb_do_writeback fs/fs-writeback.c:2303 [inline]
 wb_workfn+0x410/0x1080 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>


Tested on:

commit:         b49923b8 f2fs: fix to avoid panic once fallocation fai..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/syzbot
console output: https://syzkaller.appspot.com/x/log.txt?x=14c2b1b0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=147b7d49d83b8036
dashboard link: https://syzkaller.appspot.com/bug?extid=15669ec8c35ddf6c3d43
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
