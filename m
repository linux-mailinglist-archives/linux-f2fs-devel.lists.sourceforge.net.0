Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A89636F5BB8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 May 2023 18:08:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1puF1l-00083O-7C;
	Wed, 03 May 2023 16:08:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <38IZSZAkbAHEhnoZPaaTgPeeXS.VddVaTjhTgRdciTci.Rdb@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1puF1j-000838-LN for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 May 2023 16:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=71jW7uIgVuYpWXUeJPoBc8ZU2WGP1l3iT3lCqvQhsNw=; b=YabmVVhWcQBrZpS5K4z3ZqL+7t
 Ucav4fOL7bK8Kd/QOegceYM/JLC2sAcSOedim8tSJSgdri0eCIPakeHB+8mo7j7AuNovVRVfg/ujj
 3d0aJuxfER93iwGV52kHgCLmRIgQ/o8fjpGfX1j14n8J5GEMugdZyAUR2oqQ1peUkmrc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=71jW7uIgVuYpWXUeJPoBc8ZU2WGP1l3iT3lCqvQhsNw=; b=G
 i0HY4hegbhQx3W/XqHTWBBvHXlsvxBM0/LSi0koRjEOQhOGJ6vhEufypZGbQtcvCG7eEmMecS6stU
 92yynIJNEBt0WJS4rcLWHPqQZ+mEmemZ0VODwgi33mF9GkkrTLISdv8l1qSG1VIIgGE2WJswNdfZR
 ITIqY1b9Tt+Bpbc8=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1puF1i-00071Z-PK for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 03 May 2023 16:08:24 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-331632be774so24239435ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 03 May 2023 09:08:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1683130097; x=1685722097;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=71jW7uIgVuYpWXUeJPoBc8ZU2WGP1l3iT3lCqvQhsNw=;
 b=SuMyUOuegrxGONb7t5PD1G95TQGGd2zUk59cQPb0ApuUJ1LEj/Psj6dGCufMSBnQHh
 SkO/VoUov9bCNQobIIxwMKXO38t5WA7ATqs26t2lJ50Jmw2I1KxQTgomK2ADUBkQKeDm
 8wHjBHz8eo11Ok90tFebErYMzFd5m8NK3UINcNY5ChkjHQLvxCk8VhPGpI6npUB73NcY
 g0CGRagzOWrTP5NCZotKBlzGZ1mmHP6ieMdixAMNIq2CYeKoUyez90ByhloijHE0zxxH
 FnCp6Vy9l2YUTmPz6pX4D64LH8Q/ct3UIUKet3GI/7iBPy1MFwpgMSYWzI2iSG7PMCly
 HN8g==
X-Gm-Message-State: AC+VfDw1wJCsQ0mZ+te/x/cnfMtYv7nyQMxnk58bqluxq5HPjPMtgpNu
 iUO4uToNxEqDIHJ7H1OH6lZa5C2EB6mckvHqDvn7gXwHgiiI
X-Google-Smtp-Source: ACHHUZ5oNa7yODoox6OXvj+QKQaJpHjPNCQC3VoAcxeVIxTFcbjncOxN6PIpXxwJaThLQmNOXxcWkYI0bpXcNRNhh5X8TyBi8vON
MIME-Version: 1.0
X-Received: by 2002:a5d:8044:0:b0:760:c237:bdd7 with SMTP id
 b4-20020a5d8044000000b00760c237bdd7mr1775222ior.1.1683130096756; Wed, 03 May
 2023 09:08:16 -0700 (PDT)
Date: Wed, 03 May 2023 09:08:16 -0700
In-Reply-To: <5540e94e-d744-bf51-6344-95c8a173e89a@kernel.org>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000872ce405facc4319@google.com>
From: syzbot <syzbot+eb6201248f684e99b9f8@syzkaller.appspotmail.com>
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
 syzbot has tested the proposed patch but the reproducer
 is still triggering an issue: general protection fault in f2fs_quota_on
 general
 protection fault, probably for non-canonical address 0xdffffc00000000e6:
 0000 [#1] PREEMPT SMP KASAN KASAN: null-ptr-deref in range
 [0x0000000000000730-0x0000000000000737]
 CPU: 0 PID: 5450 Com [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1puF1i-00071Z-PK
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING: lock held when returning
 to user space in f2fs_write_single_data_page
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
general protection fault in f2fs_quota_on

general protection fault, probably for non-canonical address 0xdffffc00000000e6: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000730-0x0000000000000737]
CPU: 0 PID: 5450 Comm: syz-executor.0 Not tainted 6.3.0-syzkaller-05651-gfd78b242ba1b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 04/14/2023
RIP: 0010:__lock_acquire+0x69/0x2000 kernel/locking/lockdep.c:4942
Code: df 0f b6 04 30 84 c0 0f 85 5a 16 00 00 83 3d c1 51 e9 0c 00 0f 84 02 11 00 00 83 3d f0 89 74 0b 00 74 2b 4c 89 f0 48 c1 e8 03 <80> 3c 30 00 74 12 4c 89 f7 e8 c9 54 76 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc90005a1faf8 EFLAGS: 00010002
RAX: 00000000000000e6 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000730
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000730 R15: ffff888077f13b80
FS:  00007fc1c2b17700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055800180a000 CR3: 00000000706b1000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 lock_acquire+0x1e3/0x520 kernel/locking/lockdep.c:5691
 down_write+0x3a/0x50 kernel/locking/rwsem.c:1573
 f2fs_down_write fs/f2fs/f2fs.h:2125 [inline]
 f2fs_quota_on+0x120/0x320 fs/f2fs/super.c:2916
 __do_sys_quotactl fs/quota/quota.c:960 [inline]
 __se_sys_quotactl+0x2b5/0x810 fs/quota/quota.c:916
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fc1c1e8c169
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fc1c2b17168 EFLAGS: 00000246 ORIG_RAX: 00000000000000b3
RAX: ffffffffffffffda RBX: 00007fc1c1fac050 RCX: 00007fc1c1e8c169
RDX: 0000000000000000 RSI: 0000000020000080 RDI: ffffffff80000202
RBP: 00007fc1c1ee7ca1 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000020008040 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffd3e2e112f R14: 00007fc1c2b17300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:__lock_acquire+0x69/0x2000 kernel/locking/lockdep.c:4942
Code: df 0f b6 04 30 84 c0 0f 85 5a 16 00 00 83 3d c1 51 e9 0c 00 0f 84 02 11 00 00 83 3d f0 89 74 0b 00 74 2b 4c 89 f0 48 c1 e8 03 <80> 3c 30 00 74 12 4c 89 f7 e8 c9 54 76 00 48 be 00 00 00 00 00 fc
RSP: 0018:ffffc90005a1faf8 EFLAGS: 00010002
RAX: 00000000000000e6 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000000000000 RSI: dffffc0000000000 RDI: 0000000000000730
RBP: 0000000000000000 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: dffffc0000000001 R12: 0000000000000001
R13: 0000000000000000 R14: 0000000000000730 R15: ffff888077f13b80
FS:  00007fc1c2b17700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055800180a000 CR3: 00000000706b1000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	df 0f                	fisttps (%rdi)
   2:	b6 04                	mov    $0x4,%dh
   4:	30 84 c0 0f 85 5a 16 	xor    %al,0x165a850f(%rax,%rax,8)
   b:	00 00                	add    %al,(%rax)
   d:	83 3d c1 51 e9 0c 00 	cmpl   $0x0,0xce951c1(%rip)        # 0xce951d5
  14:	0f 84 02 11 00 00    	je     0x111c
  1a:	83 3d f0 89 74 0b 00 	cmpl   $0x0,0xb7489f0(%rip)        # 0xb748a11
  21:	74 2b                	je     0x4e
  23:	4c 89 f0             	mov    %r14,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	80 3c 30 00          	cmpb   $0x0,(%rax,%rsi,1) <-- trapping instruction
  2e:	74 12                	je     0x42
  30:	4c 89 f7             	mov    %r14,%rdi
  33:	e8 c9 54 76 00       	callq  0x765501
  38:	48                   	rex.W
  39:	be 00 00 00 00       	mov    $0x0,%esi
  3e:	00 fc                	add    %bh,%ah


Tested on:

commit:         fd78b242 f2fs: fix potential deadlock due to unpaired ..
git tree:       https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git dev-test
console output: https://syzkaller.appspot.com/x/log.txt?x=11d46838280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=86e4eb913e90d4b2
dashboard link: https://syzkaller.appspot.com/bug?extid=eb6201248f684e99b9f8
compiler:       Debian clang version 15.0.7, GNU ld (GNU Binutils for Debian) 2.35.2

Note: no patches were applied.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
