Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 20AD1BD66FB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 13 Oct 2025 23:57:47 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iGcqB36oW9eO6SYscTX3eS7pIMjZciFtkJCC32MUKbo=; b=U8659z4yGVVK4OaLCP6CSDi6zH
	t0ji2LaFdFM0+7QX1PKWoy4cqh11/jBAU301PcwDaMAxyKOFnAwKnwuTfOlgb4hLWOWepTETbNVM8
	rh9GRy9lJbhowPpD8ja4IgMEbk3Y/npn8xRUa/31zrVImrva0vfthT82nj/FBt5pYhzg=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8QXz-0008C1-H7;
	Mon, 13 Oct 2025 21:57:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3x3XtaAkbALYouvgWhhanWlleZ.ckkchaqoanYkjpajp.Yki@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1v8QXz-0008Bt-2U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Oct 2025 21:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SvnsOugUEyMO21MP4J4A4tH2lO6OVEGAuTJV0kD2UUA=; b=g8phLT1RsTVhj0yTxiUqxtw2oo
 tysufoHtWCNuT2km2lsk/y7iFfY2T1aTTZewuEKabFmDMFMZQjL6ikljPKoKj+2o1RdGfYZMTkun+
 5wOXOaB7x/87QSNiyToPKndvLV8P/N+vj1PzfHgHtRtQbYrAqIfjmocyeWiFhcCIE3qI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SvnsOugUEyMO21MP4J4A4tH2lO6OVEGAuTJV0kD2UUA=; b=H
 YyA2NxtegSGQ63W7CP8MQ/czNUc6ODlx6KtLVV0GDxoVW5nE89L9xJWU012HbWqLXBeC86SF6Afzm
 jIAFGOf7cHyaSqaINsdtpH8NENWTxbL3JFPWPxOe8jOxQpQHBxriRSUu7SObvmJe2EVgrfnVe2eNo
 idJ73Jqp9NZPpZmU=;
Received: from mail-io1-f78.google.com ([209.85.166.78])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v8QXy-0001qe-GZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 13 Oct 2025 21:57:39 +0000
Received: by mail-io1-f78.google.com with SMTP id
 ca18e2360f4ac-91b3cc5aa6aso2491406439f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 13 Oct 2025 14:57:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760392648; x=1760997448;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=SvnsOugUEyMO21MP4J4A4tH2lO6OVEGAuTJV0kD2UUA=;
 b=kTbfOJIgZ7EgW0ca1V4SL+WWNK5OSPYuapfjssuGH2PWNgwScKG6J6avjAqhrYrYFf
 ge42cHCNAlPkDLq2JOMo5MLCDzidFcG0rV5oqAWnOSQDM2peZiWS1UO5Zj3sU6Gna+ka
 +FzK5w/Jot6XCQOT1t4wDZn06GrJ0kikXo8ZbtrR6BNkd4gZU8dq28TNWi7+WY6b9GH7
 d8xloN9yYxbMK6U3Sl1DzjdZd7laz0oAzLfMQWygzcXIhRWVu7Vg8oRm/o7fORQZwylq
 cpuorxs1k2L93vYkjM9nayvcXbOgyoYJyqd8L3rjQM2ov78s6PWgnW9oN6c77XV0Maob
 A0Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWbTXusl8p6uRX1t9xa/9rmbV2swftIzPB2c+j4In6EF0z708rsSSz3FT5MzscwH+FDOV6pLttiYJGgIYeq1q6y@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyy+qgE1gzDKTbff3Z2WlepfTRO/z7NRSYSzyNLqQCwf7Xeua77
 QuRVgRSOlxkmOdaItROZALq9s5dcEOE26dlMORaSYgKD3N/X1TcuhUrJ++A0hQVmnpYyYJzLKi/
 j1uWuAq408+mOyHuED49hLUF2MiQQz0zy6w6y7T/Y3rJHTEiDlYS9tf8Pg54=
X-Google-Smtp-Source: AGHT+IEuMX3/+3I7cj5Jz16VBYPe1Jo5F3O8yXF7rEJT1zspVePsmvU59Hta/WnWq9bCDQZstxtOHJoE/JnTlgUnIo0OXVFzBlsv
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c2a:b0:42d:8a3f:ec8f with SMTP id
 e9e14a558f8ab-42f873d1bbemr250930725ab.15.1760392647809; Mon, 13 Oct 2025
 14:57:27 -0700 (PDT)
Date: Mon, 13 Oct 2025 14:57:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68ed75c7.050a0220.91a22.01ef.GAE@google.com>
From: syzbot <syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: bf45a62baffc
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.78 listed in wl.mailspike.net]
X-Headers-End: 1v8QXy-0001qe-GZ
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_rename2 (2)
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

HEAD commit:    bf45a62baffc Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=113b0c58580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=bd2356106f507975
dashboard link: https://syzkaller.appspot.com/bug?extid=632cf32276a9a564188d
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=100a3892580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151c5b34580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f0d4874557e9/disk-bf45a62b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0bf44a13b5b2/vmlinux-bf45a62b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/18db8bc9907c/Image-bf45a62b.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/33a03f772bd8/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=15cce542580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+632cf32276a9a564188d@syzkaller.appspotmail.com

F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
F2FS-fs (loop0): Corrupted max_depth of 3: 16842753
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6707 at fs/inode.c:417 drop_nlink+0xe4/0x138 fs/inode.c:417
Modules linked in:
CPU: 0 UID: 0 PID: 6707 Comm: syz.0.17 Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/30/2025
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : drop_nlink+0xe4/0x138 fs/inode.c:417
lr : drop_nlink+0xe4/0x138 fs/inode.c:417
sp : ffff80009e187740
x29: ffff80009e187740 x28: 0000000000000000 x27: ffff0000d416503f
x26: ffff0000f68508f8 x25: ffff0000f69f08f8 x24: 0000000000000000
x23: 1fffe0001ed0a247 x22: dfff800000000000 x21: 0000000000000000
x20: ffff0000f6851238 x19: ffff0000f68511f0 x18: 00000000ffffffff
x17: ffff800093605000 x16: ffff800080528494 x15: 0000000000000001
x14: 1fffe0001ed0a2d5 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60001ed0a2d6 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000c7453d00 x7 : ffff80008269f9fc x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff80008052866c
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drop_nlink+0xe4/0x138 fs/inode.c:417 (P)
 f2fs_i_links_write fs/f2fs/f2fs.h:3233 [inline]
 f2fs_rename fs/f2fs/namei.c:1017 [inline]
 f2fs_rename2+0x1288/0x1fb4 fs/f2fs/namei.c:1290
 vfs_rename+0x934/0xce0 fs/namei.c:5129
 do_renameat2+0x614/0x8c8 fs/namei.c:5278
 __do_sys_renameat2 fs/namei.c:5312 [inline]
 __se_sys_renameat2 fs/namei.c:5309 [inline]
 __arm64_sys_renameat2+0xd8/0xf4 fs/namei.c:5309
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x254 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
irq event stamp: 170020
hardirqs last  enabled at (170019): [<ffff800080630af8>] seqcount_lockdep_reader_access+0x7c/0xf8 include/linux/seqlock.h:74
hardirqs last disabled at (170020): [<ffff80008b05ee64>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:434
softirqs last  enabled at (169238): [<ffff800080202608>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (169236): [<ffff8000802025d4>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
---[ end trace 0000000000000000 ]---


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

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
