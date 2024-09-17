Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6CC2597AD00
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Sep 2024 10:41:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqTm8-0005aC-Jl;
	Tue, 17 Sep 2024 08:41:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3tUDpZgkbABoIOPA0BB4H0FF83.6EE6B4KI4H2EDJ4DJ.2EC@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sqTm6-0005Zq-VD for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Sep 2024 08:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1GbxJY/SaqP/ls656/lh8lA7/iftAcnVWmDpAHENKNc=; b=ejvu2ZxGt/GOg/i/ysSC3cnC3H
 wpLWPxIIN8WNlVwSW8ZcJVX6cP41mI9aeNHnV0hmFAVCEHYP5G4QhAkFryb/2vuXJ0L6pytZz/lD4
 ATBEcAPBzXV5b+Sysbbn9qTvbpM2B3zdH7o0kOICtNBpIe3jHtT6SRuMDDrV+Mqhmyf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=1GbxJY/SaqP/ls656/lh8lA7/iftAcnVWmDpAHENKNc=; b=Y
 16Qe3imHWOgbCJaU0ojcmi3fuh4CAcDo6RRWlfv+vahnkjF8645z/dRTddb/PXKTk6q1QFffLiGHS
 uTm8AAZMayU4SfaIkibX/qmU8/jti+PHJiV0aEgIJ+WQaJLGKWhkIrCIyg8CFz7/24Ks8NBqCc9/g
 5LYdvuysHtwB1dqA=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sqTm6-0007VH-RI for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 17 Sep 2024 08:41:31 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a09da3baa8so21779325ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 17 Sep 2024 01:41:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726562485; x=1727167285;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=1GbxJY/SaqP/ls656/lh8lA7/iftAcnVWmDpAHENKNc=;
 b=J18/bD0+3LWy5Ne+vYanqVjYULFpKT2llbGIsMIzwM0tNUUR7rQBHfwLMcRYQua+Y+
 7pLW+BfVLWbwsLWL3g+GQfRApWhcUr6jZXt0qQBuFxLzqeZPtiqAJRNbCEI4xK5jRVP4
 fhhJbVdVwTo6x2UmQ10M3Un3NujJxUZutAYvDLd4Z2mwoR9WJpfgCsfhUBZBIhK4YBvf
 U7tDWEvtVM3U407/sJmxhqvtGbkt+EvpJXJ/R3IMZhHVSWK0lxS08Rs+RYM2xJfc5gN0
 3wrzGhaYEIuB4BRk+3vnqGBKefJ3KupBeRHJzP2J+t7iRIWodwWfc/Ziirz0E94fyS4u
 I01w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXG2j3dpdF7mklxJx8zctmCD/tzl+wBtIpE/X6nLl5jyhYj+6C60IHn2BjgJLKe+eZNAVCKLR7962ZdsP6KXarS@lists.sourceforge.net
X-Gm-Message-State: AOJu0Ywj/uPqWkzyFhUyamPsjAbvNDr/+6TC6uxN4lK8vWxUj5Jkcpu/
 ZeRH33Kpk9waRg3GRacy05viZiP8xEtK8rhY6iPS+j/XK7nxfLmQe7f2EhejdhV7uC4G2uyP2Du
 ivvlynMOE4JzanFAJahNS6ApRBUvIMlYy9I9NRPGKwrlmMqv1ck2dbr8=
X-Google-Smtp-Source: AGHT+IEVE+mmkKDEjBlpz5d/VwaatKN31WsZkAxPamlwq0678Pabz05+Wlo3Yjg2XI1286qIJO0t5FfJC4vcqW9j7ZubSDb7fdEB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d88:b0:395:e85e:f2fa with SMTP id
 e9e14a558f8ab-3a084611b38mr141704115ab.1.1726562485032; Tue, 17 Sep 2024
 01:41:25 -0700 (PDT)
Date: Tue, 17 Sep 2024 01:41:25 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000009a6cd706224ca720@google.com>
From: syzbot <syzbot+33379ce4ac76acf7d0c7@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 196145c606d0
 Merge tag 'clk-fixes-for-linus' of git://git... git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1051f100580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1sqTm6-0007VH-RI
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_invalidate_blocks
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

HEAD commit:    196145c606d0 Merge tag 'clk-fixes-for-linus' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1051f100580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=61d235cb8d15001c
dashboard link: https://syzkaller.appspot.com/bug?extid=33379ce4ac76acf7d0c7
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-196145c6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4567b7dd8173/vmlinux-196145c6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/79fbae030fbb/bzImage-196145c6.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+33379ce4ac76acf7d0c7@syzkaller.appspotmail.com

UDPLite6: UDP-Lite is deprecated and scheduled to be removed in 2025, please contact the netdev mailing list
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2519!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5111 Comm: syz.0.0 Not tainted 6.11.0-rc7-syzkaller-00097-g196145c606d0 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:f2fs_invalidate_blocks+0x35f/0x370 fs/f2fs/segment.c:2519
Code: 2f fe fd e9 7f fe ff ff e8 6e e7 96 fd 44 89 ee 48 c7 c7 30 29 f1 8e 48 89 da e8 9c b0 ef 00 e9 fb fd ff ff e8 52 e7 96 fd 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 90 90 90 90 90
RSP: 0000:ffffc90002fff840 EFLAGS: 00010287
RAX: ffffffff83fca55e RBX: 0000000000000000 RCX: 0000000000040000
RDX: ffffc9000b7e9000 RSI: 00000000000063bf RDI: 00000000000063c0
RBP: 0000000000000000 R08: 0000000000000005 R09: ffffffff83fca3ce
R10: 0000000000000003 R11: ffff88800023c880 R12: ffffc90002fffa48
R13: 00000000ffffffff R14: ffff888011e3c000 R15: 0000000000000000
FS:  00007f843cafe6c0(0000) GS:ffff88801fe00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffed846bd20 CR3: 000000003d572000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 truncate_node+0x1a4/0x6f0 fs/f2fs/node.c:909
 f2fs_remove_inode_page+0x5c2/0x870 fs/f2fs/node.c:1288
 f2fs_evict_inode+0x879/0x15c0 fs/f2fs/inode.c:851
 evict+0x532/0x950 fs/inode.c:704
 __dentry_kill+0x20d/0x630 fs/dcache.c:615
 dput+0x19f/0x2b0 fs/dcache.c:857
 __fput+0x5f8/0x8a0 fs/file_table.c:430
 task_work_run+0x24f/0x310 kernel/task_work.c:228
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f843bd7def9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f843cafe038 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f843bf36058 RCX: 00007f843bd7def9
RDX: 0000000000000000 RSI: ffffffffffffffff RDI: 0000000000000007
RBP: 00007f843bdf0b76 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f843bf36058 R15: 00007ffd271d7608
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_invalidate_blocks+0x35f/0x370 fs/f2fs/segment.c:2519
Code: 2f fe fd e9 7f fe ff ff e8 6e e7 96 fd 44 89 ee 48 c7 c7 30 29 f1 8e 48 89 da e8 9c b0 ef 00 e9 fb fd ff ff e8 52 e7 96 fd 90 <0f> 0b 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 90 90 90 90 90
RSP: 0000:ffffc90002fff840 EFLAGS: 00010287
RAX: ffffffff83fca55e RBX: 0000000000000000 RCX: 0000000000040000
RDX: ffffc9000b7e9000 RSI: 00000000000063bf RDI: 00000000000063c0
RBP: 0000000000000000 R08: 0000000000000005 R09: ffffffff83fca3ce
R10: 0000000000000003 R11: ffff88800023c880 R12: ffffc90002fffa48
R13: 00000000ffffffff R14: ffff888011e3c000 R15: 0000000000000000
FS:  00007f843cafe6c0(0000) GS:ffff88801fe00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055e3c26bf118 CR3: 000000003d572000 CR4: 0000000000350ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want to overwrite report's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the report is a duplicate of another one, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
