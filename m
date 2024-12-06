Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B373F9E76AF
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Dec 2024 18:07:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tJbns-000394-6T;
	Fri, 06 Dec 2024 17:07:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3VC9TZwkbAEEv12ndoohudsslg.jrrjohxvhufrqwhqw.frp@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tJbnr-00038y-9E for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Dec 2024 17:07:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K3ToCg1oZmUTHAe8VqTMmZaX3s+UFbukdNccXKpQqBM=; b=DcRJz0aicOFjqeF5/EFWlB+M59
 DDk53YzxN9wd2G59ff8hhwQNZPlqsdgoA2hVC5HegxMXSGZLkogYUYP++Hkzg8BOxSxvUMuJ08mtf
 FwpSc3OPChHdV0uk4Fypzj2Ckmjulz6t+EMcKxVFjY6PL1QRN/wlDyMcvnolA5pEmHjQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=K3ToCg1oZmUTHAe8VqTMmZaX3s+UFbukdNccXKpQqBM=; b=Y
 MRxqw8dp4pHqw+UwLDt96Wn7mO6pfGq4SYppIOUnAkmSZY3nOHroFj6d5LxPhyeW9PthiGAo5T2oD
 CMatTvDToUpoepJoetXTgRz1FYoTqitBJwjATLrw28yObEV0Y+1m+seL188R0okIPEfbRPPHTjQHE
 rpw4whD7UD95f6Ik=;
Received: from mail-il1-f206.google.com ([209.85.166.206])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tJbnr-0004uC-8V for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Dec 2024 17:07:43 +0000
Received: by mail-il1-f206.google.com with SMTP id
 e9e14a558f8ab-3a7ace5dd02so28450075ab.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 06 Dec 2024 09:07:43 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733504852; x=1734109652;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=K3ToCg1oZmUTHAe8VqTMmZaX3s+UFbukdNccXKpQqBM=;
 b=f2lzdrUmQxrFsnMq/x+9Ghd7mzW3EnWe0xCl2KUnJGMsLFBmEa14ku5wwvmoS+R9pt
 xDVilkLQS42/o6sQn9zcEM+3ySZ2gR3G3Fyu7zu1oprzPzY8RMIjnE0dY9CKbZmQp2E2
 p8KM13CpPTN0uHlSV3NhdiUsjaW7nTpHHKzWmO07lEMLfMZ4x5QUR/ZuGjXEoi9wDhvt
 cUgFO0FwTwzoiN9Ne0AJ01jiJbY8K2CmEWbIiA/Njbon7FhEkoymyLUB8owuH4e20HK4
 m1mD7ofOmKcZ4Epo80srbPmfRgnkvgMbDbuStRHr+kVhlu5iE3hThklJGYMfniOEB9uf
 d/GQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYgawLAmnLVcMuq6UTcwmoR63D6YiMDqadLkMaqQo/P9OFURf2WNEI8tT2oPPEB+XH9LD+h2rU9Yayd/HpulxK@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yyz8+uEEgMn+mQXjGhlV0dOqKaknv4bqQ1whW4IyhTio2HhAgCn
 Z8P++s8KWoao6euBSwV2l8pDLdVvJcRyGzXIXBETetVoRD/AvkVvRZHAKa4Nsx9Vt5/lA9fDJgj
 h8aVdrWD5hOiC9AbBNN9ztk2jOj01ivHE+KFA89BwvUO2NrMg0BWn340=
X-Google-Smtp-Source: AGHT+IH5KQd3lTPqzzszmHoWEmqSW5kBjzQ6bpWqs7MzSI8Vdtg6aMzGrjdBh6vQJjiXhA22kcylN2Fjx3SA257i1NtjWGt1tcfq
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1e06:b0:3a7:d082:651 with SMTP id
 e9e14a558f8ab-3a811db1f7amr47114085ab.12.1733504852456; Fri, 06 Dec 2024
 09:07:32 -0800 (PST)
Date: Fri, 06 Dec 2024 09:07:32 -0800
In-Reply-To: <67388dcc.050a0220.bb738.0008.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67532f54.050a0220.a30f1.0142.GAE@google.com>
From: syzbot <syzbot+5c81eb8c0a380fa578b5@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: b8f52214c61a Merge tag 'audit-pr-20241205' of git://git.ke..
 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=12ba98df980000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.206 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.206 listed in sa-accredit.habeas.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.206 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.206 listed in wl.mailspike.net]
X-Headers-End: 1tJbnr-0004uC-8V
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_evict_inode (4)
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

HEAD commit:    b8f52214c61a Merge tag 'audit-pr-20241205' of git://git.ke..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=12ba98df980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=335e39020523e2ed
dashboard link: https://syzkaller.appspot.com/bug?extid=5c81eb8c0a380fa578b5
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=155bd0f8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=13cad330580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/cfa353b9a35b/disk-b8f52214.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4e744ff2abaf/vmlinux-b8f52214.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2dbf687d48e1/bzImage-b8f52214.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/45ab44aae0f6/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5c81eb8c0a380fa578b5@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:920!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 5827 Comm: syz-executor120 Not tainted 6.13.0-rc1-syzkaller-00182-gb8f52214c61a #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
RIP: 0010:f2fs_evict_inode+0x1671/0x1690 fs/f2fs/inode.c:920
Code: 31 ff 89 de e8 f0 f0 a3 fd 40 84 ed 75 2c e8 e6 ed a3 fd 4c 8b 3c 24 e9 63 eb ff ff e8 d8 ed a3 fd 90 0f 0b e8 d0 ed a3 fd 90 <0f> 0b e8 c8 ed a3 fd 90 0f 0b 90 e9 fb fe ff ff e8 ba ed a3 fd e8
RSP: 0018:ffffc90003d17918 EFLAGS: 00010293
RAX: ffffffff83fb83f0 RBX: 0000000000000002 RCX: ffff88804cda8000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83fb7dd7 R09: 1ffff1100cbe51ad
R10: dffffc0000000000 R11: ffffed100cbe51ae R12: ffff888065f28910
R13: ffff888065f288c8 R14: dffffc0000000000 R15: ffff88807e0e0000
FS:  00005555814413c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2787dbd000 CR3: 0000000021b7c000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 evict+0x4e8/0x9a0 fs/inode.c:796
 dispose_list fs/inode.c:845 [inline]
 evict_inodes+0x6f6/0x790 fs/inode.c:899
 generic_shutdown_super+0xa0/0x2d0 fs/super.c:627
 kill_block_super+0x44/0x90 fs/super.c:1710
 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4972
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f278ef02cb7
Code: 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 b0 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffca034a6e8 EFLAGS: 00000206 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f278ef02cb7
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffca034a7a0
RBP: 00007ffca034a7a0 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000206 R12: 00007ffca034b850
R13: 0000555581442700 R14: 0000000000016846 R15: 0000000000000008
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_evict_inode+0x1671/0x1690 fs/f2fs/inode.c:920
Code: 31 ff 89 de e8 f0 f0 a3 fd 40 84 ed 75 2c e8 e6 ed a3 fd 4c 8b 3c 24 e9 63 eb ff ff e8 d8 ed a3 fd 90 0f 0b e8 d0 ed a3 fd 90 <0f> 0b e8 c8 ed a3 fd 90 0f 0b 90 e9 fb fe ff ff e8 ba ed a3 fd e8
RSP: 0018:ffffc90003d17918 EFLAGS: 00010293
RAX: ffffffff83fb83f0 RBX: 0000000000000002 RCX: ffff88804cda8000
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83fb7dd7 R09: 1ffff1100cbe51ad
R10: dffffc0000000000 R11: ffffed100cbe51ae R12: ffff888065f28910
R13: ffff888065f288c8 R14: dffffc0000000000 R15: ffff88807e0e0000
FS:  00005555814413c0(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2787dbd000 CR3: 0000000021b7c000 CR4: 00000000003526f0
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
