Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 690A293B789
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jul 2024 21:20:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sWhXR-0001zT-Mq;
	Wed, 24 Jul 2024 19:20:37 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <39VOhZgkbAF4OUVG6HHAN6LLE9.CKKCHAQOAN8KJPAJP.8KI@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sWhXN-0001zJ-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 19:20:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xAfF8yFrvvPJASgn2RHcznuwDDgfM8r3YOT0gIovbTo=; b=A56AE13RTpBm09CeaJL5NfoaSE
 Ebdg4z1dmiQpFS3s/97yQZHH8ANbs7aWW+HuyrX2RlZ/gq5ewpHKtUgPcIXT0y00GqsD5zGF3N/R6
 Ecu1cZr77jGci6l9mh2jffsJNhDFoj7iNQjI/t54PDB9rhBvwoEEi+UsJ86FQzd/VbBw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xAfF8yFrvvPJASgn2RHcznuwDDgfM8r3YOT0gIovbTo=; b=O
 4jCpWtFf/MK1YivpptOPu0puJVUQ59EhfFi+zMAHiELjBSZ5HCJpqCtcd03i1/4tOcQOUg2vMvMbZ
 vl4NjnMrwK7HkuwvMHOhwYiFV3NqIKZWxnOodfuTrBg+bP4vAQcHxnfGtKF9M82pMsfjJaIJ7QYPL
 oSLPke/yG2qkkl5I=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sWhXM-0003dz-BB for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jul 2024 19:20:33 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-397a99d76baso1151105ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 24 Jul 2024 12:20:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721848821; x=1722453621;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xAfF8yFrvvPJASgn2RHcznuwDDgfM8r3YOT0gIovbTo=;
 b=sVnZ7Gh5wX2cEikZosyzU9VhThPnkYc6PsNXCUGH+1sG7+mZa5sGbIoNJHTl1PRWuQ
 dJ9odT3azstaMxzx6TsLZgoRxBeQxoSapxcse0zkRKT8jL25uctM1HePkvpLATJb1hyy
 LBrfWUBbVU8sExK9VlwOCDBAhiQEOWyoyh57X12PmZJBxyXDeyZMZ+V4PsyzEGDVFEsV
 NO+jvDsywL4l61kRiUOs+uMOMQ4lsF6BsxlBvPCj3P7DeTOECQmfUU0DNz71Pfhqchkd
 6qCMqwMJl8sxYOUjv9glIjQOtUz9n6i5ir7YxEgX3XBR1xjJVYHaHt48CFkd94EEjvLD
 NJ5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXX1668w7VbWvE7F8FBxav/4dWiYxmXlzy8BMPs4OLswZXZQX+lQRAvAX3+LuUQer/7Wc7USTn530C6fuNlT1RS4DJzoDJF1Das+w/NOk0Xw1erjUurBQ==
X-Gm-Message-State: AOJu0YxB4QTJLYN4kMDm2ptWX9ddAM5YFW3vZr39TifWONeEq9SE1oNP
 ItRKTLrmUf1Y8MMuONzlWuIS1cMknVmWxk2SrNylDjbTOO6L6T529Y2V0WKfO+yY6X85JtvOvV+
 eFGS49mG75hxucVG9hJfUPJ3dML5FegFfgCDFuurr1/R2fQVSiFmg8Zo=
X-Google-Smtp-Source: AGHT+IEdMp7I0sC47IH5C/KOX4QoYuRCrgs+OWjjVNjITUGIVSEqfnt886GfHSJCSXb8lCmIGQdWyX4qgoH7B3vZ5y2Sy3UaVrrE
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1383:b0:397:ca8e:d377 with SMTP id
 e9e14a558f8ab-39a2177dacfmr351165ab.0.1721848821475; Wed, 24 Jul 2024
 12:20:21 -0700 (PDT)
Date: Wed, 24 Jul 2024 12:20:21 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000005c7ccb061e032b9b@google.com>
From: syzbot <syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com>
To: chao@kernel.org, daehojeong@google.com, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -4.7 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 2c9b3512402e
 Merge tag 'for-linus' of git://git.kernel.org.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=158ef15e980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (-4.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.197 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
X-Headers-End: 1sWhXM-0003dz-BB
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: null-ptr-deref Write in
 f2fs_stop_gc_thread
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

HEAD commit:    2c9b3512402e Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=158ef15e980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f4925140c45a2a50
dashboard link: https://syzkaller.appspot.com/bug?extid=1a8e2b31f2ac9bd3d148
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=136eee95980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1510b445980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/3c29a41eae6b/disk-2c9b3512.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/938da4f6bc30/vmlinux-2c9b3512.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4f9521f6c1ef/bzImage-2c9b3512.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/1d96e2146be6/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/f1a30c7339a7/mount_14.gz
mounted in repro #3: https://storage.googleapis.com/syzbot-assets/b4ae6212a921/mount_18.gz

The issue was bisected to:

commit 3bdb7f161697e2d5123b89fe1778ef17a44858e7
Author: Jaegeuk Kim <jaegeuk@kernel.org>
Date:   Wed Apr 3 23:07:53 2024 +0000

    f2fs: don't set RO when shutting down f2fs

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=15dcb445980000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=17dcb445980000
console output: https://syzkaller.appspot.com/x/log.txt?x=13dcb445980000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+1a8e2b31f2ac9bd3d148@syzkaller.appspotmail.com
Fixes: 3bdb7f161697 ("f2fs: don't set RO when shutting down f2fs")

F2FS-fs (loop4): Mounted with checkpoint version = 48b305e5
F2FS-fs (loop4): Stopped filesystem due to reason: 0
==================================================================
BUG: KASAN: null-ptr-deref in instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
BUG: KASAN: null-ptr-deref in atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:252 [inline]
BUG: KASAN: null-ptr-deref in __refcount_add include/linux/refcount.h:184 [inline]
BUG: KASAN: null-ptr-deref in __refcount_inc include/linux/refcount.h:241 [inline]
BUG: KASAN: null-ptr-deref in refcount_inc include/linux/refcount.h:258 [inline]
BUG: KASAN: null-ptr-deref in get_task_struct include/linux/sched/task.h:118 [inline]
BUG: KASAN: null-ptr-deref in kthread_stop+0xca/0x630 kernel/kthread.c:704
Write of size 4 at addr 0000000000000028 by task syz-executor169/7772

CPU: 1 PID: 7772 Comm: syz-executor169 Not tainted 6.10.0-syzkaller-11185-g2c9b3512402e #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_report+0xe8/0x550 mm/kasan/report.c:491
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 kasan_check_range+0x282/0x290 mm/kasan/generic.c:189
 instrument_atomic_read_write include/linux/instrumented.h:96 [inline]
 atomic_fetch_add_relaxed include/linux/atomic/atomic-instrumented.h:252 [inline]
 __refcount_add include/linux/refcount.h:184 [inline]
 __refcount_inc include/linux/refcount.h:241 [inline]
 refcount_inc include/linux/refcount.h:258 [inline]
 get_task_struct include/linux/sched/task.h:118 [inline]
 kthread_stop+0xca/0x630 kernel/kthread.c:704
 f2fs_stop_gc_thread+0x65/0xb0 fs/f2fs/gc.c:210
 f2fs_do_shutdown+0x192/0x540 fs/f2fs/file.c:2283
 f2fs_ioc_shutdown fs/f2fs/file.c:2325 [inline]
 __f2fs_ioctl+0x443a/0xbe60 fs/f2fs/file.c:4325
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:907 [inline]
 __se_sys_ioctl+0xfc/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fac5a221249
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 71 1d 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fac5a1ce218 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007fac5a2a8708 RCX: 00007fac5a221249
RDX: 0000000020000140 RSI: 000000008004587d RDI: 0000000000000005
RBP: 00007fac5a2a8700 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 00007fac5a274b1c
R13: 00007fac5a274040 R14: 00007fac5a26e057 R15: 8c02ea27aa268e19
 </TASK>
==================================================================


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
