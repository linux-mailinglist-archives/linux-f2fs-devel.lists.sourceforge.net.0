Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 923679FDC25
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Dec 2024 20:49:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tRcom-0004m8-VF;
	Sat, 28 Dec 2024 19:49:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3T1ZwZwkbAP4y45qgrrkxgvvoj.muumrk0ykxiutzktz.ius@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tRcol-0004m1-HF for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Dec 2024 19:49:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XxwRIERfhsTo4XoceHAY21n16AEs/dnE+SRDu8dN/1s=; b=T1QAPDsuc/lSPQim31DaZFLhwH
 UD9nwqqXJXTokvTpKtiw3/6vfYW+plp0Id4/lZNZKnTzrCTvMQ6aqGrSeWdaqf9NQZhMKfYDsJM1v
 M7uSaxHta3hSonYEJ48OCdaEraDL4ITEVYxVxuEG5gt0S8vVULjylG859PP8JEV0XX80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XxwRIERfhsTo4XoceHAY21n16AEs/dnE+SRDu8dN/1s=; b=T
 Vevngol1KLb4GiZJyNDSrT3JKPK6WtVR0qWdpKFotMprNa7615yo8maqfORAJzXRV3pybJWy/9wZA
 vFAyExLropHCoXbiAJx1ojojWUeIyO+J/SgwA0+jGdZKZLQuIHivtYG0MlUs4Zcd8wwPop4XPwosK
 8MIyQjrB5CHf3X4g=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tRcok-0003EF-2X for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 28 Dec 2024 19:49:46 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3a7de3ab182so156923395ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Dec 2024 11:49:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735415375; x=1736020175;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=XxwRIERfhsTo4XoceHAY21n16AEs/dnE+SRDu8dN/1s=;
 b=prybHfBv7fd9wH4N0yFxFFA41YZ3DgVU5fXgdrRN7rW8ViFRc9RZkBdebZR7VR/jPI
 yozkepKz5vm/cvPesjJP5kyya8SsP6COMmtZgu8xE+jgk4jXIiMaVzM/jclL0t8NgC4q
 tiGBu2PlR6OWMEho9vm2YBhCy0vsbe2pq+hkPS+om8X9pjcv4kmhzi2tXIogJP93ME61
 aSfLxMt3pF6iHx325YKs8siQKrChMQ/UhoTUwqxy9JO86JXFQN23fA0KuVaYUpwOsi5l
 9ImRpWBZqTY+J4ZtmlZqp1BYMOf5VPNYQOBLZjMOBEmO/u/0N2IBIZJHFZZQrbSAwJOo
 XTHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGO1v8CYY+qhL9XjD6fRr+HqQ/Sh5TgXXO1LV0s6L1PytDk9GbGMuz4eIXNFgQS/zpuC0rD61U1EqESSvidqQZ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyMvyzmJOJQQy0lV7S74zmXLcukLVf4URc8EQw9QedmEtE6Qtkd
 TrBYIcDMFeyssCTrW3IXi7E9uV8BZAu7L2nw0vAO9yxp0eUMyvPEbuvTljjecZY3/QA/sZcwFt1
 GZGMYq0U4oFmCDHTZ27nqRWTpzw6SvnDr+hsP/nq/tqOqMhjPUbTZS7s=
X-Google-Smtp-Source: AGHT+IHPx5YTY0Mu1dX8dxioAhGqhkUA9a8Tfu3+92YxZ2hpKdkq7aB7MFY6jaZ1bZXfLO3iHp73juoY5QVHtBfJnncfY50lQRvc
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18cd:b0:3a7:81a4:a557 with SMTP id
 e9e14a558f8ab-3c2d65e508dmr250806935ab.24.1735415375343; Sat, 28 Dec 2024
 11:49:35 -0800 (PST)
Date: Sat, 28 Dec 2024 11:49:35 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6770564f.050a0220.2f3838.049a.GAE@google.com>
From: syzbot <syzbot+342b72cb42bbe3fb3aaa@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9b2ffa6148b1
 Merge tag 'mtd/fixes-for-6.13-rc5' of git://g.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1081b4c4580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1tRcok-0003EF-2X
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_getxattr (2)
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

HEAD commit:    9b2ffa6148b1 Merge tag 'mtd/fixes-for-6.13-rc5' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1081b4c4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4c4096b0d467a682
dashboard link: https://syzkaller.appspot.com/bug?extid=342b72cb42bbe3fb3aaa
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/de1e2d4b88e8/disk-9b2ffa61.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/5eacd6368afe/vmlinux-9b2ffa61.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e7bb223e545d/bzImage-9b2ffa61.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+342b72cb42bbe3fb3aaa@syzkaller.appspotmail.com

------------[ cut here ]------------
DEBUG_LOCKS_WARN_ON(l->owner)
WARNING: CPU: 1 PID: 6410 at ./include/linux/local_lock_internal.h:30 local_lock_acquire+0x6f/0x80 include/linux/local_lock_internal.h:30
Modules linked in:
CPU: 1 UID: 0 PID: 6410 Comm: syz.2.63 Not tainted 6.13.0-rc4-syzkaller-00012-g9b2ffa6148b1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:local_lock_acquire+0x6f/0x80 include/linux/local_lock_internal.h:30
Code: cc cc 90 e8 53 a9 be 02 85 c0 74 22 83 3d 4c 50 20 0e 00 75 19 90 48 c7 c7 ce 3e 05 8e 48 c7 c6 32 92 05 8e e8 42 e2 67 ff 90 <0f> 0b 90 90 90 eb be 66 2e 0f 1f 84 00 00 00 00 00 90 90 90 90 90
RSP: 0018:ffffc90003c2f1f0 EFLAGS: 00010046
RAX: d9e8418fbd5be700 RBX: ffffe8ffffd68250 RCX: 0000000000080000
RDX: ffffc9000c359000 RSI: 0000000000004e9b RDI: 0000000000004e9c
RBP: ffffe8ffffd68250 R08: ffffffff816019a2 R09: 1ffff110170e519a
R10: dffffc0000000000 R11: ffffed10170e519b R12: ffff88814e914a00
R13: 0000000000000202 R14: ffffea0001660600 R15: ffff888059818000
FS:  00007f6c2d4df6c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f0e5ad77bac CR3: 0000000032606000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 ___slab_alloc+0x119c/0x14a0 mm/slub.c:3879
 __slab_alloc+0x58/0xa0 mm/slub.c:3920
 __slab_alloc_node mm/slub.c:3995 [inline]
 slab_alloc_node mm/slub.c:4156 [inline]
 kmem_cache_alloc_noprof+0x268/0x380 mm/slub.c:4175
 f2fs_kmem_cache_alloc fs/f2fs/f2fs.h:2868 [inline]
 xattr_alloc fs/f2fs/xattr.c:30 [inline]
 lookup_all_xattrs fs/f2fs/xattr.c:333 [inline]
 f2fs_getxattr+0x477/0x13b0 fs/f2fs/xattr.c:533
 vfs_getxattr_alloc+0x472/0x5c0 fs/xattr.c:393
 ima_read_xattr+0x38/0x60 security/integrity/ima/ima_appraise.c:229
 process_measurement+0x117a/0x1fb0 security/integrity/ima/ima_main.c:353
 ima_file_check+0xd9/0x120 security/integrity/ima/ima_main.c:572
 security_file_post_open+0xb9/0x280 security/security.c:3121
 do_open fs/namei.c:3830 [inline]
 path_openat+0x2ccd/0x3590 fs/namei.c:3987
 do_filp_open+0x27f/0x4e0 fs/namei.c:4014
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1428
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f6c2c785d29
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f6c2d4df038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f6c2c975fa0 RCX: 00007f6c2c785d29
RDX: 0000000000000042 RSI: 0000000020000040 RDI: ffffffffffffff9c
RBP: 00007f6c2c801aa8 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000000 R14: 00007f6c2c975fa0 R15: 00007ffe7662bc28
 </TASK>


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
