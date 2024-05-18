Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A0EB8C8F97
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 18 May 2024 06:28:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s8BgU-000678-9G;
	Sat, 18 May 2024 04:28:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3cC5IZgkbACcVbcNDOOHUDSSLG.JRRJOHXVHUFRQWHQW.FRP@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1s8BgT-000672-MB for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 May 2024 04:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QBHO1S9NxogkqJjTBRij/9wmAvilUNV4j/zXnwQVJFE=; b=FodXAm06aDSJdTtAPXZXoc2kTq
 /ZSkLeG5tNeAq4vkqkMY91Rw8PujsQrmtXkcDShKl8VMaIrMLV16wg4Skok3cVpo6uKaMjhPIE9yJ
 XomyV9U/OZggYxOwN8o+dqHALvX6tYuAFBKq3nNru/MqsHf6Y3SImXqVtt711pmU+z4Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QBHO1S9NxogkqJjTBRij/9wmAvilUNV4j/zXnwQVJFE=; b=G
 0NcDDqapj4020F8RHX7NEI4WDPCXoqWQRk7vg5EfhybMS1owF7ZKKSSre6XG1z34v6KuV3f7XrXa2
 77WDbhqbUrdHIqCRow7F6U8ggmdsd9UDQ8KMnX9zv5KQ9c5rzR4y/8LH9TLZMLdxP4O6HSelba7p/
 1tWhsVIwWcfveuZY=;
Received: from mail-io1-f79.google.com ([209.85.166.79])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1s8BgU-0003mR-E6 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 18 May 2024 04:28:38 +0000
Received: by mail-io1-f79.google.com with SMTP id
 ca18e2360f4ac-7e1d56d36b9so837718839f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 17 May 2024 21:28:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716006512; x=1716611312;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QBHO1S9NxogkqJjTBRij/9wmAvilUNV4j/zXnwQVJFE=;
 b=H+UmUlN7j/22jJ4TQ5c3yOkpBFrTQQEWMjpYFVdK3ObGgi584HgiFNPdTfNsGybCwj
 cqw/A2kE380WCvcFjYgL6OhC4KRTjVQ0ZPSqSjCw4fImsI5mdl6TR07WJOtDTRLa/bLl
 Qk9SM5mWM68PnEk4dEn5czMeyCmyesBfKigpyOTOv3YQ19Km7XX2aFMefbOxCOoc3Rip
 8BrY9L2Aiv1K159WZxJymDKiA2mB0RWuwj2aq/KO4rNkJ7Zl0p6ylCM//RMtoz3N6fGo
 R/feUC4OY1IYiDhI/pht9Vf52rFacT6Ln5hlER8Z1o2BNPVf9sanwTyXHRUxUYiIXx1U
 VNPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVy5xvGJTr05WZQg+i4VpkXcYLtKfwNo98mo2BkKyn8dcItMSq2fsvOCgFS7T4YeEEv42jrELXsF3vEdLHLIjkJAl7xObg2vR79mPpoUPQVDrvwsTq1YQ==
X-Gm-Message-State: AOJu0Yxd/Bdd3EkjLeFhIhSPlj8Bs/nbGjTw8iyuoWGHHpRZ/BIRdGr3
 kr/d57L+RHHaPASg7vAjMFyloJYb5fxmb+R6ImCqOBfjl+5EDrjYmraWCrTRW3QaKo6wxr0qgBH
 qovEJQ0WYhjycgV8vusd6WeCDBSp42QPyRfDMjJoqTzJUF06gFNPN7Xk=
X-Google-Smtp-Source: AGHT+IHYBnAMvTLXRNFObOVoi4Ae6xEE72/uGamyxHtrxqeZVv2WnXmm2TTyhEcw+ZRsro33DbHUqZAWEU7NRahrbipOpMTi3Owx
MIME-Version: 1.0
X-Received: by 2002:a05:6602:2b8d:b0:7da:b30e:df80 with SMTP id
 ca18e2360f4ac-7e1b500aed7mr121047139f.0.1716006512022; Fri, 17 May 2024
 21:28:32 -0700 (PDT)
Date: Fri, 17 May 2024 21:28:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000094e5b70618b2e6c1@google.com>
From: syzbot <syzbot+8f9e913ccc308e66c407@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: a5131c3fdf26
 Merge tag 'x86-shstk-2024-05-13' of git://git.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=12cee100980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.79 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.79 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Headers-End: 1s8BgU-0003mR-E6
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING: locking bug in f2fs_getxattr
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

HEAD commit:    a5131c3fdf26 Merge tag 'x86-shstk-2024-05-13' of git://git..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12cee100980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e4f7e6f2d15a8e15
dashboard link: https://syzkaller.appspot.com/bug?extid=8f9e913ccc308e66c407
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a81f43baa3cd/disk-a5131c3f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/46b648092f89/vmlinux-a5131c3f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e6e6c1a3a7e3/bzImage-a5131c3f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8f9e913ccc308e66c407@syzkaller.appspotmail.com

F2FS-fs (loop2): Try to recover 1th superblock, ret: 0
F2FS-fs (loop2): Mounted with checkpoint version = 48b305e5
------------[ cut here ]------------
Looking for class "c->lock" with key init_kmem_cache_cpus.__key, but found a different class "&c->lock" with the same key
WARNING: CPU: 0 PID: 5944 at kernel/locking/lockdep.c:935 look_up_lock_class+0xdc/0x160 kernel/locking/lockdep.c:932
Modules linked in:
CPU: 0 PID: 5944 Comm: syz-executor.2 Not tainted 6.9.0-syzkaller-01768-ga5131c3fdf26 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/02/2024
RIP: 0010:look_up_lock_class+0xdc/0x160 kernel/locking/lockdep.c:932
Code: 01 0f 85 80 00 00 00 c6 05 1d 21 13 04 01 90 49 8b 16 49 8b 76 18 48 8b 8b b8 00 00 00 48 c7 c7 80 dd ca 8b e8 95 d8 d7 f5 90 <0f> 0b 90 90 eb 57 90 e8 78 23 2b f9 48 c7 c7 c0 dc ca 8b 89 de e8
RSP: 0018:ffffc9000455ee70 EFLAGS: 00010046
RAX: cedb96dd9fdb9000 RBX: ffffffff92c296e0 RCX: 0000000000040000
RDX: ffffc9000a9a0000 RSI: 000000000000ef17 RDI: 000000000000ef18
RBP: ffffc9000455ef80 R08: ffffffff81589ca2 R09: fffffbfff1c39d38
R10: dffffc0000000000 R11: fffffbfff1c39d38 R12: ffffe8ffffc76260
R13: ffffe8ffffc76260 R14: ffffe8ffffc76260 R15: ffffffff94791b10
FS:  00007f130db086c0(0000) GS:ffff8880b9400000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f130ce7ddf0 CR3: 000000023177c000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 register_lock_class+0x102/0x980 kernel/locking/lockdep.c:1284
 __lock_acquire+0xda/0x1fd0 kernel/locking/lockdep.c:5014
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5754
 local_lock_acquire+0x20/0x80 include/linux/local_lock_internal.h:29
 ___slab_alloc+0x1004/0x12e0 mm/slub.c:3641
 __slab_alloc mm/slub.c:3682 [inline]
 __slab_alloc_node mm/slub.c:3735 [inline]
 slab_alloc_node mm/slub.c:3908 [inline]
 kmem_cache_alloc+0x252/0x350 mm/slub.c:3925
 f2fs_kmem_cache_alloc fs/f2fs/f2fs.h:2832 [inline]
 xattr_alloc fs/f2fs/xattr.c:30 [inline]
 lookup_all_xattrs fs/f2fs/xattr.c:333 [inline]
 f2fs_getxattr+0x477/0x13b0 fs/f2fs/xattr.c:533
 vfs_getxattr_alloc+0x474/0x5c0 fs/xattr.c:393
 ima_read_xattr+0x38/0x60 security/integrity/ima/ima_appraise.c:229
 process_measurement+0x11d5/0x1f60 security/integrity/ima/ima_main.c:340
 ima_file_check+0xf2/0x170 security/integrity/ima/ima_main.c:559
 security_file_post_open+0x6f/0xa0 security/security.c:2981
 do_open fs/namei.c:3652 [inline]
 path_openat+0x28b7/0x3240 fs/namei.c:3807
 do_filp_open+0x235/0x490 fs/namei.c:3834
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1406
 do_sys_open fs/open.c:1421 [inline]
 __do_sys_openat fs/open.c:1437 [inline]
 __se_sys_openat fs/open.c:1432 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1432
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f130ce7dd69
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 20 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f130db080c8 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f130cfabf80 RCX: 00007f130ce7dd69
RDX: 000000000000275a RSI: 0000000020000040 RDI: ffffffffffffff9c
RBP: 00007f130ceca49e R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 000000000000000b R14: 00007f130cfabf80 R15: 00007ffe63d5a628
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
