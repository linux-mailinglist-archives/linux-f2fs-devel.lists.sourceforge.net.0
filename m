Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58EEA9D8F5C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2024 01:00:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFj0M-0001kz-NF;
	Tue, 26 Nov 2024 00:00:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3mg9FZwkbAA87DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tFj0M-0001kt-16 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 00:00:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gTxVRndIzMFiQrildLnogrEKpcut5mHcfiaAF0ID0rA=; b=EqWpcHL2eDi/RAjvEDKAhiE7vU
 kWovkly3vPBtwDsE+z+O+wa405EdKcnid3/rc8qjcf9BGTrbUKzG+dUMOuhHiwxulXBNrZQBA7R1i
 J2VUk0WVi501b0OLCpq4t4xbUE8cMsZiGx6A6EZZg1I2jUkzWR7YdlLDCv9TSx6XZ78M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gTxVRndIzMFiQrildLnogrEKpcut5mHcfiaAF0ID0rA=; b=Y
 nSK8RBH6a0Z2xeowhoKtVoMX0QnzzhL7WwDl1+LKMyNRaX7TRxRYbfnWzQYT3MU5CuWMqvasYK9bG
 S6oj6Jk4DUYy6TZ7rwgJQymY+fHfZZ1vdw8pCAV1w0pcefQKMXzeeAtWSkHzdijNzHBprQlBw9NlK
 vrA1/mxamYG7HSLM=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tFj0K-0000NB-I5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 00:00:33 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-841896ec108so195011239f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 25 Nov 2024 16:00:32 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732579227; x=1733184027;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gTxVRndIzMFiQrildLnogrEKpcut5mHcfiaAF0ID0rA=;
 b=nA1Zi8q1vDL8pFCtvGRzvkeQWOoFLvFDyViroFORluKro7XGczX044l4KpoWNgMWGt
 +DCLCIpA7viahmzrbRXv1yYO7pO2XHfpJZZ7HWxcFtll6j5PvD20uSze/azTRpGu1/cA
 bWoDq2zoRPvvTgGc7vUPJ28ERJIikQ0YuEHlcEMCOdt3P7B0bif2ErVEGJm+0dG1ONg9
 Km+0XMvjztUqETUKe1jS+ERDxYoQnEofnWnK/g0BQwQg9I58V1ZKF+qZ2r9mJ9jYLXU4
 tml7NvWjQbHQnm7HQvJb1t9S4+yT0F2ve8bKlVh1Na5gQlVT6RB08AIi21rn1La5+y3p
 ofLg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWtzFcjxc5BwvpYU7/9HYFqLZK/PdTFnUCnE9s53OdI04Vgpt3N/heUt0YbaObQC2UQ3Hzlo+bGzrzg5t2Dhm3O@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx3oF6nq1dL1VOGSXJYvzm1yWcExHTlevU9VSWOUF2RuEfueAEu
 LsGUFLlYTyUiA+KMvvuGO3JO5d2q3VT9+iNBAXQdA9tDgWu8U/lAYR1TBxx4p03dDDWXAdQvNLd
 3czveeBr3La3JABIB/qkurnp8YMumbosU/p0zim9qrDRRUlLVrzS3z1w=
X-Google-Smtp-Source: AGHT+IEMqiYCWGRgxuA2PHH/ajse1RTikx/7/IqR5pUYZN/QScPO1Ga1UzSCPwcyjtT3flf9LV4CouoWbQSzenkRWhWZWlqNJzAR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:156f:b0:3a7:66e0:a98a with SMTP id
 e9e14a558f8ab-3a79adc71b2mr152777095ab.9.1732579226839; Mon, 25 Nov 2024
 16:00:26 -0800 (PST)
Date: Mon, 25 Nov 2024 16:00:26 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67450f9a.050a0220.21d33d.0003.GAE@google.com>
From: syzbot <syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com, yuchao0@huawei.com
X-Spam-Score: -0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 228a1157fb9f
 Merge tag '6.13-rc-part1-SMB3-client-fixes' o.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=1374b6e8580000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (-0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.71 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.71 listed in sa-accredit.habeas.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
X-Headers-End: 1tFj0K-0000NB-I5
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_rename2
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

HEAD commit:    228a1157fb9f Merge tag '6.13-rc-part1-SMB3-client-fixes' o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1374b6e8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=402159daa216c89d
dashboard link: https://syzkaller.appspot.com/bug?extid=82064afd8bd59070fc22
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1774b6e8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1335975f980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d32a8e8c5aae/disk-228a1157.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/28d5c070092e/vmlinux-228a1157.xz
kernel image: https://storage.googleapis.com/syzbot-assets/45af4bfd9e8e/bzImage-228a1157.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/1e2338334d9b/mount_0.gz

The issue was bisected to:

commit 4c8ff7095bef64fc47e996a938f7d57f9e077da3
Author: Chao Yu <yuchao0@huawei.com>
Date:   Fri Nov 1 10:07:14 2019 +0000

    f2fs: support data compression

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=150076e8580000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=170076e8580000
console output: https://syzkaller.appspot.com/x/log.txt?x=130076e8580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com
Fixes: 4c8ff7095bef ("f2fs: support data compression")

F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
------------[ cut here ]------------
WARNING: CPU: 1 PID: 5835 at fs/inode.c:407 drop_nlink+0xc4/0x110 fs/inode.c:407
Modules linked in:
CPU: 1 UID: 0 PID: 5835 Comm: syz-executor143 Not tainted 6.12.0-syzkaller-08446-g228a1157fb9f #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:drop_nlink+0xc4/0x110 fs/inode.c:407
Code: bb 70 07 00 00 be 08 00 00 00 e8 27 d8 e5 ff f0 48 ff 83 70 07 00 00 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 9d 40 7e ff 90 <0f> 0b 90 eb 83 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 5c ff ff ff
RSP: 0018:ffffc90003e377d0 EFLAGS: 00010293
RAX: ffffffff82170c43 RBX: 1ffff1100efa8122 RCX: ffff88802cca0000
RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff82170bc3 R09: 1ffff1100efa81af
R10: dffffc0000000000 R11: ffffed100efa81b0 R12: ffff888077d40910
R13: dffffc0000000000 R14: ffff888077d408c8 R15: dffffc0000000000
FS:  000055558e8f7380(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000000000066c7e0 CR3: 000000007ac16000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_i_links_write fs/f2fs/f2fs.h:3127 [inline]
 f2fs_rename fs/f2fs/namei.c:999 [inline]
 f2fs_rename2+0x1b6c/0x2c30 fs/f2fs/namei.c:1272
 vfs_rename+0xbdb/0xf00 fs/namei.c:5067
 do_renameat2+0xd94/0x13f0 fs/namei.c:5224
 __do_sys_renameat2 fs/namei.c:5258 [inline]
 __se_sys_renameat2 fs/namei.c:5255 [inline]
 __x64_sys_renameat2+0xce/0xe0 fs/namei.c:5255
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fea51a18679
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd47104348 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
RAX: ffffffffffffffda RBX: 00007ffd47104518 RCX: 00007fea51a18679
RDX: 0000000000000004 RSI: 00000000200000c0 RDI: 0000000000000005
RBP: 00007fea51a9b610 R08: 0000000000000000 R09: 00007ffd47104518
R10: 0000000020000100 R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffd47104508 R14: 0000000000000001 R15: 0000000000000001
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
