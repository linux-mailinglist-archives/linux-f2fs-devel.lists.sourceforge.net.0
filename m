Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CD7F99CFEC8
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 16 Nov 2024 13:19:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tCHm6-0007q4-7H;
	Sat, 16 Nov 2024 12:19:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3zY04ZwkbAAw4ABwmxxq3m11up.s00sxq64q3o0z5qz5.o0y@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tCHm4-0007py-GJ for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Nov 2024 12:19:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3anrA2PKz52eUeH1obWVljaLKGmkTsCdR4ZJj9hlvjE=; b=Wr35nh7KRiVWwiX2S+ZKnLcq33
 JctISJkFCa82tfFasKTWQ2MZ3eYlzYqrr9hPjgODI9qTz1jTlq7+TVAdPq7EPSGTfPDpDUtVtvj+j
 rDcMDtst452Yk8SqcGM8WsCfTTUMzcvcFJ4rgpTju1KhlsSpQgI99DvT7arrPgvKsRPg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3anrA2PKz52eUeH1obWVljaLKGmkTsCdR4ZJj9hlvjE=; b=Z
 yEzICl6hXK9JGVfbzyS16Pv1Twcwek3YguPEFcjlnlAoik36EaB2Lp3KseSCxYNerFMYSpqe+/KEh
 hbVDnCaWMap/cJHqm23bHcDq/QxrGpSjpzKYeP0cGTJjOEEObtLvIdz+wlmCiqhOKN1Jru1RYCpKN
 Xs64jlQJnNkMV3/Y=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tCHm3-0001Nq-Mv for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 16 Nov 2024 12:19:36 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a4e80ccd1bso6284715ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 16 Nov 2024 04:19:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731759565; x=1732364365;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3anrA2PKz52eUeH1obWVljaLKGmkTsCdR4ZJj9hlvjE=;
 b=mJmO1dEnxNY2aCbXgQMOyu1lPz34XovClB4IBfysSA0BL9MhEj9cnAsOaTUCN+JK+U
 MNVlmSGJtwVlJMhHv+F9rGqEY+phWYokvEON8uzxHwT6hMT6meUFh7vZoupKnbWXtL/F
 Jv6QnCPFpPxjjpslN0puXJYSzi00m5u73LNbW5HYJAbOQ5aa3cmv6pnwJqLw+OnICD2k
 GBkvPmG3VCthvkdeO98cMhjw1N1k446WeQYpqzMPz3deU35VQ0fW3G4ufLpkOAMCoxHB
 HiSlLxLnEwJ8sk0DQM+CBo/8YvZNiq5AtaOLi5sBDUccekTOkTMPTpCVSGG/PsJG8Rhg
 Vqdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWp5awIEI9h+ihjDz30LsxYab0cNFunWucjzLY3CXsngT4S4IfohI1hmNRkpPV71zYjIqAJruXqyLJSIzmdxQjP@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxZjQ5MarriJd7i30KIIOAVGCsVQsiKnRc5hazxvBWXnwXEw24B
 /H+d0u29O2zeANQhDFjDYedns6CR8MF4teUCDCX2Kcx4kfT/Zut8dzeMqT1UAbumsFHE9nSwmP0
 E/30EXtizXnKq/aOTG8clbYZAqkssjzoG+h6zTOI+1o66y+woU4LJODA=
X-Google-Smtp-Source: AGHT+IFbSbf0OEedC5Ufrq0317YnBNFYeic6nqI9O0JEfjvq2aLN3ue6tcGQ2rxSjvE5LQd5Ruz7GduzwOJ5ykzIt3J3+RVUjXmJ
MIME-Version: 1.0
X-Received: by 2002:a92:cda3:0:b0:3a4:ec4b:92f0 with SMTP id
 e9e14a558f8ab-3a748077de2mr57693315ab.19.1731759565014; Sat, 16 Nov 2024
 04:19:25 -0800 (PST)
Date: Sat, 16 Nov 2024 04:19:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67388dcc.050a0220.bb738.0008.GAE@google.com>
From: syzbot <syzbot+5c81eb8c0a380fa578b5@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 2d5404caa8c7
 Linux 6.12-rc7 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=108a0ce8580000
 kernel config: https://syzkaller.appspot.com/x/.config?x=1503500c6f [...]
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.197 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1tCHm3-0001Nq-Mv
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode (4)
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

HEAD commit:    2d5404caa8c7 Linux 6.12-rc7
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=108a0ce8580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1503500c6f615d24
dashboard link: https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a2d329b82126/disk-2d5404ca.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/37a04ca225dd/vmlinux-2d5404ca.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4f837ce9d9dc/bzImage-2d5404ca.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c81eb8c0a380fa578b5@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:901!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 6239 Comm: syz-executor Not tainted 6.12.0-rc7-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:901
Code: 2e 8b a5 fd 31 ff 89 de e8 25 8b a5 fd 40 84 ed 75 28 e8 1b 88 a5 fd e9 3c ec ff ff e8 11 88 a5 fd 90 0f 0b e8 09 88 a5 fd 90 <0f> 0b e8 01 88 a5 fd 90 0f 0b 90 e9 fc fe ff ff e8 f3 87 a5 fd e8
RSP: 0000:ffffc9000529f928 EFLAGS: 00010293
RAX: ffffffff83ef51a7 RBX: 0000000000000002 RCX: ffff8880312a1e00
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83ef4b90 R09: 1ffff1100c3aeed9
R10: dffffc0000000000 R11: ffffed100c3aeeda R12: ffff888027a68000
R13: ffff888061d776c8 R14: ffff888061d77228 R15: dffffc0000000000
FS:  000055556b022500(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fcb2134e000 CR3: 0000000061454000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 evict+0x4e8/0x9b0 fs/inode.c:725
 dispose_list fs/inode.c:774 [inline]
 evict_inodes+0x6f6/0x790 fs/inode.c:828
 generic_shutdown_super+0xa0/0x2d0 fs/super.c:627
 kill_block_super+0x44/0x90 fs/super.c:1710
 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4927
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f34b5b7fa47
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007fff051bb088 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f34b5b7fa47
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007fff051bb140
RBP: 00007fff051bb140 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007fff051bc1c0
R13: 00007f34b5bf14b4 R14: 000000000002dc8b R15: 00007fff051bc200
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:901
Code: 2e 8b a5 fd 31 ff 89 de e8 25 8b a5 fd 40 84 ed 75 28 e8 1b 88 a5 fd e9 3c ec ff ff e8 11 88 a5 fd 90 0f 0b e8 09 88 a5 fd 90 <0f> 0b e8 01 88 a5 fd 90 0f 0b 90 e9 fc fe ff ff e8 f3 87 a5 fd e8
RSP: 0000:ffffc9000529f928 EFLAGS: 00010293

RAX: ffffffff83ef51a7 RBX: 0000000000000002 RCX: ffff8880312a1e00
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83ef4b90 R09: 1ffff1100c3aeed9
R10: dffffc0000000000 R11: ffffed100c3aeeda R12: ffff888027a68000
R13: ffff888061d776c8 R14: ffff888061d77228 R15: dffffc0000000000
FS:  000055556b022500(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f00031ff800 CR3: 0000000061454000 CR4: 00000000003526f0
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
