Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3064F955C21
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Aug 2024 12:41:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sfdLs-0002YM-Fn;
	Sun, 18 Aug 2024 10:41:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <318_BZgkbALox34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sfdLq-0002YF-L0 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Aug 2024 10:41:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rd5w9063sJbdbJRc5XRLD4j7R/MndzI38o1VODkYecE=; b=afqKrgY2NLUG9Pb7sDwMoDvh2o
 Q8eipgkJ8CfmvIxgysxIMBFPaBZmIxHfIB5SKuSw1eWW5ZuSeiVkJvwVCSfjg1v/RLYvqI3AbJJPx
 odk0riUgmFf5huoudIHk2/e8ziBE9fVJxJwIxZK1UDtCY5y/f4jsyWMtRUPGjbXUlNGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rd5w9063sJbdbJRc5XRLD4j7R/MndzI38o1VODkYecE=; b=j
 exybMIGDHvwGs6NQGQCyccAwgwJHFbZhIeRSi58e1hvKiCkk2xJddk/BxNtavy4xDh+3KTfp3Savk
 xS5iCojtYBb/aakhXVLgm0737JKJ9zPVagJewK1f3IVCaqP8sjNIbtV5Rklg1QJkh58IFeQMOHLtA
 N5ObjuRBgCOL/+gQ=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sfdLp-0007Dt-5i for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Aug 2024 10:41:33 +0000
Received: by mail-io1-f71.google.com with SMTP id
 ca18e2360f4ac-824c925d120so332028539f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 18 Aug 2024 03:41:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1723977687; x=1724582487;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Rd5w9063sJbdbJRc5XRLD4j7R/MndzI38o1VODkYecE=;
 b=G1sdVkohaGulCTyhckpxjbTMqgdhPzfra99DBAzattUy7dbs5kBYSAT+8Yi9kAC8/E
 3dWKCceqW/AeTyE0OO772XWr85rooywD0n0i4WoQ4h8DlhkXkNiF9a5OrBIR/f+Vm2hk
 fvR3FXtCsnPoZHyQ5f29BimVpVjxYI2UhA7goqw1grPV6mW/qNNrm3RI2MaSX2WRMTpR
 hwG9WUVECEYuDi7NTIHuK/3PdW0fED9NQQQd/0AHCKjqt+cW3+pUZP+2nYtNI8Raqg2g
 ivunEZj/lOUzdWJmAmI6cAvGQpsC8iCpgNn58lrBWGxGNRcniAn9BZI0cY2SfaDvkr0+
 Uj+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCW71KQuEC/SRmnVLNnZqPpBDb56XUQq9n/IISw/HklCZ+7yzcKdajr2o/hLmhgrdwsvDeLkLhXtbUxS8gFY/yGRk1MLEjVCFiEq5kTPgkOeEkXA5g++zQ==
X-Gm-Message-State: AOJu0YxAuOwNTjGX9J/B2EocqD99+l9dRwfLnKMEGCC9sQHTuC+nnRDT
 vBBT6od7Bcj47CJoL22adwMkkSfTQ/Sb8Umo2Htl3dAKYi43/nlC+dRuU/XLCdF6vpRzW2RF4Bh
 itT3mGYDTs+yXIWyrlwqRIW3uhaQkFSNpSotLAyj93qvadF3iQrozy6E=
X-Google-Smtp-Source: AGHT+IHUvrPsmfW5rrivHWUkbqOisU6xGQ1q0q35yUDoXiI4M2bd+GH8lW9YF0130HZgmq066orZQInRKDNAg1qKTsUjFOfuBWLH
MIME-Version: 1.0
X-Received: by 2002:a05:6638:408e:b0:4c0:9a05:44d0 with SMTP id
 8926c6da1cb9f-4cce15bc05cmr497146173.1.1723977687343; Sun, 18 Aug 2024
 03:41:27 -0700 (PDT)
Date: Sun, 18 Aug 2024 03:41:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a7b20f061ff2d56a@google.com>
From: syzbot <syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 9d5906799f7d
 Merge tag 'selinux-pr-20240814' of git://git... git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=152a1a05980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: goo.gl]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.71 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.71 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.166.71 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sfdLp-0007Dt-5i
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode (3)
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

HEAD commit:    9d5906799f7d Merge tag 'selinux-pr-20240814' of git://git...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=152a1a05980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=92c0312151c4e32e
dashboard link: https://syzkaller.appspot.com/bug?extid=ebea2790904673d7c618
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/446819619a5c/disk-9d590679.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/14a59529d386/vmlinux-9d590679.xz
kernel image: https://storage.googleapis.com/syzbot-assets/04e89692a4c8/bzImage-9d590679.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:896!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 5938 Comm: syz-executor Not tainted 6.11.0-rc3-syzkaller-00036-g9d5906799f7d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
Code: 2e b6 ab fd 31 ff 89 de e8 25 b6 ab fd 40 84 ed 75 28 e8 1b b3 ab fd e9 3c ec ff ff e8 11 b3 ab fd 90 0f 0b e8 09 b3 ab fd 90 <0f> 0b e8 01 b3 ab fd 90 0f 0b 90 e9 fc fe ff ff e8 f3 b2 ab fd e8
RSP: 0018:ffffc90009cf7928 EFLAGS: 00010293
RAX: ffffffff83e7c5c7 RBX: 0000000000000002 RCX: ffff888019f50000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83e7bfb0 R09: 1ffff1100b106843
R10: dffffc0000000000 R11: ffffed100b106844 R12: ffff888057150000
R13: ffff888058834218 R14: ffff888058833d78 R15: dffffc0000000000
FS:  0000555586684500(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcd737bd000 CR3: 0000000018b5c000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 evict+0x532/0x950 fs/inode.c:704
 dispose_list fs/inode.c:747 [inline]
 evict_inodes+0x5f9/0x690 fs/inode.c:797
 generic_shutdown_super+0x9d/0x2d0 fs/super.c:627
 kill_block_super+0x44/0x90 fs/super.c:1696
 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4898
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:228
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7fcd7cd7ad27
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffe52115828 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fcd7cd7ad27
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffe521158e0
RBP: 00007ffe521158e0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffe52116960
R13: 00007fcd7cde778c R14: 0000000000021420 R15: 00007ffe521169a0
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
Code: 2e b6 ab fd 31 ff 89 de e8 25 b6 ab fd 40 84 ed 75 28 e8 1b b3 ab fd e9 3c ec ff ff e8 11 b3 ab fd 90 0f 0b e8 09 b3 ab fd 90 <0f> 0b e8 01 b3 ab fd 90 0f 0b 90 e9 fc fe ff ff e8 f3 b2 ab fd e8
RSP: 0018:ffffc90009cf7928 EFLAGS: 00010293
RAX: ffffffff83e7c5c7 RBX: 0000000000000002 RCX: ffff888019f50000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83e7bfb0 R09: 1ffff1100b106843
R10: dffffc0000000000 R11: ffffed100b106844 R12: ffff888057150000
R13: ffff888058834218 R14: ffff888058833d78 R15: dffffc0000000000
FS:  0000555586684500(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcd737bd000 CR3: 0000000018b5c000 CR4: 00000000003506f0
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
