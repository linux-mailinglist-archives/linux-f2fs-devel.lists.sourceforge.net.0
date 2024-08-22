Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B1DD95BAA4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 17:38:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sh9tR-0001mU-61;
	Thu, 22 Aug 2024 15:38:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3a1vHZgkbAHwx34pfqqjwfuuni.lttlqjzxjwhtsyjsy.htr@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sh9tO-0001mH-RI for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 15:38:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PfKYsHbOQ5A3mI9bYwHAlT48QrarSm2MDkSYLCjLupw=; b=F4Ak50ODGL4DypNZhgvlYC3sFv
 gALe4y4oXqHeQw+6KnJmUHTQ890gRwUY9ljoufZq+2R8n0119/HyKl9OrlAkO9t5ApitIAC4B2gXa
 28L104Yh8+ZDWPZoIgQInEMFy6fcigAIIKPM3hvoVnvmu0Ao0HWiOqYCX/9rFGVRiioU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PfKYsHbOQ5A3mI9bYwHAlT48QrarSm2MDkSYLCjLupw=; b=M
 Rd61YYQqH7fquz1oGAlDPzMoTwvg207+VDh3SzJhwTyhg0M2q6QU0Zjc7aNO/fAcJjdIpacVr7RfU
 h9nokzZ3yeuQV0tPT14PYPyln66dnw1Ahev3Xwn+LYIl0LDKH5pUzoswEks36r+Dp5DKHdPSID+Fa
 HWgYdQth1nTiIq3k=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sh9tN-0007ji-Vv for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 15:38:30 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-39d4cef7aa7so10331795ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 22 Aug 2024 08:38:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724341099; x=1724945899;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=PfKYsHbOQ5A3mI9bYwHAlT48QrarSm2MDkSYLCjLupw=;
 b=mWP4gpsvm8yaa92x9xiuk4ejUwT0w6x1JJWJfCfrmQRWSInI+idN7fa+UwibxAAwMc
 BqqfHaLUaGDHF5AEvgQvekt0wPT4+r/yRAKU61RR0M8J7qP6uQmJZoohpPZFtvgKGdU1
 olQ/qd/qvjjk8simspLgVJTUjQkGEEngxM+YsMOkDCpoVUvupW7F1ANBnCW6v23F4IPm
 2zKXafshvNoEKfnUhnHOO+Ex9QD9ILUmbIOVGf63Sf22aG1XjTPy87+LppL0fgcBy2lw
 85UKItqUKy3f8x9OJBmyIn6Af2ujY4/fWh9m/jOV1YPeQP17/DEHX2FPMmfLxJjZD7yV
 wo4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCWyWmJKQALP1ggXg+/9xBogolo7T/bjiWEjbj9RycPfJdSOqhjDLvF6sxMe1q191wHZu+ElJ7EkHFF2squaa8Je@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yxk3szTejANNPH/eW2iDPki3uw10Wl4oYBoJkDAskRsC8GBgQPJ
 iRRFSKPwdbUObWRespTJu4yxQe+rZTV7X+YstFPo1weESh4QcTQxqnUuZS5zTFrA9HcPdf/hJ8s
 HgmJcQx0+XAYfvq7ePl59G6HKUDKd28HPFm5hBrb0z7GczVla9PXMABc=
X-Google-Smtp-Source: AGHT+IEtX8IqW5G74fu+kZOKoA3ERwvpjCtOsNXhOVU26AFXVmnWAcMS4XoFfI2w7ZOh/fGgXZFWdBJ4yPGlH9ea+b7uuVtZa7RR
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1d16:b0:39d:1ca5:3903 with SMTP id
 e9e14a558f8ab-39d6c353c38mr4303105ab.1.1724341099171; Thu, 22 Aug 2024
 08:38:19 -0700 (PDT)
Date: Thu, 22 Aug 2024 08:38:19 -0700
In-Reply-To: <000000000000a7b20f061ff2d56a@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000b0231406204772a1@google.com>
From: syzbot <syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -4.4 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 872cf28b8df9 Merge tag 'platform-drivers-x86-v6.11-4' of g..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=13ece38d980000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (-4.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.198 listed in sa-accredit.habeas.com]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sh9tN-0007ji-Vv
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode (3)
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

syzbot has found a reproducer for the following issue on:

HEAD commit:    872cf28b8df9 Merge tag 'platform-drivers-x86-v6.11-4' of g..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13ece38d980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=4fc2afd52fd008bb
dashboard link: https://syzkaller.appspot.com/bug?extid=ebea2790904673d7c618
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1344680b980000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1034880b980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c63409516c62/disk-872cf28b.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/79b2b8c52d3a/vmlinux-872cf28b.xz
kernel image: https://storage.googleapis.com/syzbot-assets/27cb9df9c339/bzImage-872cf28b.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/1f04d7ef7499/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/831601ee93df/mount_5.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+ebea2790904673d7c618@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:896!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 5217 Comm: syz-executor605 Not tainted 6.11.0-rc4-syzkaller-00033-g872cf28b8df9 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
Code: 6e 9b ab fd 31 ff 89 de e8 65 9b ab fd 40 84 ed 75 28 e8 5b 98 ab fd e9 3c ec ff ff e8 51 98 ab fd 90 0f 0b e8 49 98 ab fd 90 <0f> 0b e8 41 98 ab fd 90 0f 0b 90 e9 fc fe ff ff e8 33 98 ab fd e8
RSP: 0018:ffffc90003497808 EFLAGS: 00010293
RAX: ffffffff83e7f267 RBX: 0000000000000002 RCX: ffff88801a3e8000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83e7ec50 R09: 1ffff1100efe9611
R10: dffffc0000000000 R11: ffffed100efe9612 R12: ffff88807a834000
R13: ffff888077f4b088 R14: ffff888077f4abe8 R15: dffffc0000000000
FS:  000055556d6353c0(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f376cbf9000 CR3: 00000000786a0000 CR4: 00000000003506f0
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
 ptrace_notify+0x2d2/0x380 kernel/signal.c:2402
 ptrace_report_syscall include/linux/ptrace.h:415 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:477 [inline]
 syscall_exit_work+0xc6/0x190 kernel/entry/common.c:173
 syscall_exit_to_user_mode_prepare kernel/entry/common.c:200 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:205 [inline]
 syscall_exit_to_user_mode+0x279/0x370 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f37740a00a7
Code: 08 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b0 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc120a25e8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000015fbb RCX: 00007f37740a00a7
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc120a26a0
RBP: 00007ffc120a26a0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffc120a3750
R13: 000055556d636700 R14: 431bde82d7b634db R15: 00007ffc120a36f4
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_evict_inode+0x1598/0x15c0 fs/f2fs/inode.c:896
Code: 6e 9b ab fd 31 ff 89 de e8 65 9b ab fd 40 84 ed 75 28 e8 5b 98 ab fd e9 3c ec ff ff e8 51 98 ab fd 90 0f 0b e8 49 98 ab fd 90 <0f> 0b e8 41 98 ab fd 90 0f 0b 90 e9 fc fe ff ff e8 33 98 ab fd e8
RSP: 0018:ffffc90003497808 EFLAGS: 00010293
RAX: ffffffff83e7f267 RBX: 0000000000000002 RCX: ffff88801a3e8000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83e7ec50 R09: 1ffff1100efe9611
R10: dffffc0000000000 R11: ffffed100efe9612 R12: ffff88807a834000
R13: ffff888077f4b088 R14: ffff888077f4abe8 R15: dffffc0000000000
FS:  000055556d6353c0(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f376bda6000 CR3: 00000000786a0000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
