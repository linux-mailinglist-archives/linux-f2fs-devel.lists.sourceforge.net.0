Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EAEEB9FA94C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 03:17:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPY0k-0003eX-Si;
	Mon, 23 Dec 2024 02:17:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3LshoZwkbAKMVbcNDOOHUDSSLG.JRRJOHXVHUFRQWHQW.FRP@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tPY0g-0003eN-QT for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 02:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yhFYPMObK+rNTZy5q18QpqR0trWAoQ8lsYnJVQ+xSd0=; b=CH55fRNNeDwkwTLeU4eqFg/MWH
 lgoKfJGL5GUC/+NwnWDyXFIIQQvjkTIH5nLIsBzudpeI/0TLVWOLeVUGPvWnMmUwJwb6JI1D18B5R
 oYbTpwxWXo13SDcCT+GfU6qXXGjhQNNN42YFmvV95r+3PoSCt46etsYHOWCknJkTtt4A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yhFYPMObK+rNTZy5q18QpqR0trWAoQ8lsYnJVQ+xSd0=; b=N
 /Mai/gzCvvT0ax+DxNXZKJatSrg8oGwKG+BPaRCsFxV5u1fRF+PgUqUeq2ew8zlxh37UhJ7/Btyo1
 mvSHFo2IWR6kfoDBky3v8owH2zDKPy1RjCghBlCOItgrqoqswwDd0VS6/Rd9bukoElAXHPWS5jA4G
 eUVzRFnu1/9Y/3jc=;
Received: from mail-io1-f80.google.com ([209.85.166.80])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tPY0f-0006SF-Ah for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 02:17:30 +0000
Received: by mail-io1-f80.google.com with SMTP id
 ca18e2360f4ac-844e6476afeso282141939f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 22 Dec 2024 18:17:29 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734920238; x=1735525038;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=yhFYPMObK+rNTZy5q18QpqR0trWAoQ8lsYnJVQ+xSd0=;
 b=gDL/4+3AxolSxTzw2559f5b2LO6VtI0zoFy2pCiMBSdyIZF97MNxWbjSCytwoDuCsJ
 cu0MxgRNNWYR7ecTFS6zVW8zb8Pt8iT1lcFW394UFszZC5XzROCkUwc5HkJP6eokHMWL
 izwkxuHO7ETDeweniruYjzpTj14MWyguthPoq/4Ca93LRlF24k0/LJpVwXbTnjXhZsdJ
 7mVcsgH7D9pRaEgsp9UtkTc8WosS1lBWTJD6izfkZ8XdsysueKvAFaeta40Mr4N29BZ4
 CSUkieu/7Z6c1uYPguLlgLLuRK8Z0DtMJ9zFUPme8/3w+uWAtCW6PhHveMYf4vkSbPUp
 87Bw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX7nsYMI3tWgqGxK0G1XCUWLum2c8TrmjKgWtr8D0LeKQ42NkzMVXFG3gwkm1N2crFmZ+9IjEDbxvMF4BLtP/f6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwylSMIPANQGHq3QnCSXi5GAl5+a8A8slfxWQ+u2IOef+00JRrr
 8zfR2nQNfGvknnqYtYshZScyCqrPKqHykrhzzz8jCP+jcIBlo14fdksYQakOLSQy8/icodp763+
 HwwSsZCxAj9urOcXi9cdEYpvijTQzOHdcK6bJrbqwTTjfq4nrOEtdsCI=
X-Google-Smtp-Source: AGHT+IEhhscNC8u5vw/hvcYV5YZ7dG8O8Mld+bHUBuknVdSMm/7t24djcV+u4KW4Ov7attDPj1IiaTO0eEcPMoohWmZ0tNLNfoQY
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:349c:b0:3a7:fe8c:b015 with SMTP id
 e9e14a558f8ab-3c2d581a343mr10484665ab.24.1734920238585; Sun, 22 Dec 2024
 18:17:18 -0800 (PST)
Date: Sun, 22 Dec 2024 18:17:18 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6768c82e.050a0220.226966.0035.GAE@google.com>
From: syzbot <syzbot+b9972806adbe20a910eb@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: aef25be35d23
 hexagon: Disable constant extender optimizati.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=166c22df980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.80 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.80 listed in bl.score.senderscore.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.80 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.80 listed in list.dnswl.org]
X-Headers-End: 1tPY0f-0006SF-Ah
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_get_victim
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

HEAD commit:    aef25be35d23 hexagon: Disable constant extender optimizati..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=166c22df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6a2b862bf4a5409f
dashboard link: https://syzkaller.appspot.com/bug?extid=b9972806adbe20a910eb
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-aef25be3.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b51d6862d2de/vmlinux-aef25be3.xz
kernel image: https://storage.googleapis.com/syzbot-assets/cdb968bd31a4/bzImage-aef25be3.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b9972806adbe20a910eb@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 262144
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Start checkpoint disabled!
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
------------[ cut here ]------------
kernel BUG at fs/f2fs/gc.c:373!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN NOPTI
CPU: 0 UID: 0 PID: 5316 Comm: syz.0.0 Not tainted 6.13.0-rc3-syzkaller-00044-gaef25be35d23 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
RIP: 0010:get_cb_cost fs/f2fs/gc.c:373 [inline]
RIP: 0010:get_gc_cost fs/f2fs/gc.c:406 [inline]
RIP: 0010:f2fs_get_victim+0x68b1/0x6aa0 fs/f2fs/gc.c:912
Code: f9 80 e1 07 80 c1 03 38 c1 0f 8c 4f f8 ff ff 4c 89 ff e8 22 3c 06 fe e9 42 f8 ff ff e8 98 d3 9f fd 90 0f 0b e8 90 d3 9f fd 90 <0f> 0b e8 88 d3 9f fd 90 0f 0b 89 d1 80 e1 07 80 c1 03 38 c1 0f 8c
RSP: 0018:ffffc9000d44f2e0 EFLAGS: 00010287
RAX: ffffffff83ffa060 RBX: ffffffffffffffff RCX: 0000000000100000
RDX: ffffc9000eee2000 RSI: 00000000000003e0 RDI: 00000000000003e1
RBP: ffffc9000d44f628 R08: ffffffff83ff60bf R09: ffffffff83ff6048
R10: 0000000000000002 R11: ffff888000864880 R12: 0000000000000008
R13: ffff888011a96c00 R14: 0000000000000008 R15: dffffc0000000000
FS:  00007f10c73646c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f10c676c4c8 CR3: 0000000042e3e000 CR4: 0000000000352ef0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 __get_victim fs/f2fs/gc.c:1707 [inline]
 f2fs_gc+0xc89/0x2f60 fs/f2fs/gc.c:1915
 f2fs_ioc_gc fs/f2fs/file.c:2624 [inline]
 __f2fs_ioctl+0x4cc9/0xb8b0 fs/f2fs/file.c:4482
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:906 [inline]
 __se_sys_ioctl+0xf5/0x170 fs/ioctl.c:892
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f10c6585d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f10c7364038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f10c6775fa0 RCX: 00007f10c6585d29
RDX: 0000000020000140 RSI: 000000004004f506 RDI: 0000000000000006
RBP: 00007f10c6601a20 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f10c6775fa0 R15: 00007ffd0da279e8
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:get_cb_cost fs/f2fs/gc.c:373 [inline]
RIP: 0010:get_gc_cost fs/f2fs/gc.c:406 [inline]
RIP: 0010:f2fs_get_victim+0x68b1/0x6aa0 fs/f2fs/gc.c:912
Code: f9 80 e1 07 80 c1 03 38 c1 0f 8c 4f f8 ff ff 4c 89 ff e8 22 3c 06 fe e9 42 f8 ff ff e8 98 d3 9f fd 90 0f 0b e8 90 d3 9f fd 90 <0f> 0b e8 88 d3 9f fd 90 0f 0b 89 d1 80 e1 07 80 c1 03 38 c1 0f 8c
RSP: 0018:ffffc9000d44f2e0 EFLAGS: 00010287
RAX: ffffffff83ffa060 RBX: ffffffffffffffff RCX: 0000000000100000
RDX: ffffc9000eee2000 RSI: 00000000000003e0 RDI: 00000000000003e1
RBP: ffffc9000d44f628 R08: ffffffff83ff60bf R09: ffffffff83ff6048
R10: 0000000000000002 R11: ffff888000864880 R12: 0000000000000008
R13: ffff888011a96c00 R14: 0000000000000008 R15: dffffc0000000000
FS:  00007f10c73646c0(0000) GS:ffff88801fc00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f10c676c4c8 CR3: 0000000042e3e000 CR4: 0000000000352ef0
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
