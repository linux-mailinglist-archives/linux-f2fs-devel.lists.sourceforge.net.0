Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA3EA1D1D4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Jan 2025 08:57:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcJzU-0003Yx-J1;
	Mon, 27 Jan 2025 07:57:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3KzyXZwkbAEQy45qgrrkxgvvoj.muumrk0ykxiutzktz.ius@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tcJz5-0003YM-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Jan 2025 07:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hJcB7Kr/MyGcTqRVm2CC+tjRLzd0VrcBipQTfCjD3gM=; b=BUIPLlcrpnjMRUNCPXWNabxtIF
 /qRHdt6SibpEy/KaZkLg8PkQdeo0hxaJpSJLlzke9qboScnOj3M1XQ+aW4rbcL5gbddpw1mL8Iqrc
 agKFHRdwiYQqIT9nhB5xECd/lMa08Ob9C+EB/SDwOS19Wxp2hV0yzobsYnj+j4GHBqlU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hJcB7Kr/MyGcTqRVm2CC+tjRLzd0VrcBipQTfCjD3gM=; b=i
 XDVagijMjGbNI9Qco3PnRCj7SsiNJUwOddZM+nJDUFUPren1Ek5TtpGBBwU7e96niaogsgYx89uTE
 0iUNTIFRklbZvVWU2/CWyet/iwU0K2gCwKeYHbzTm5Lmwz05Sl8AjeeCRVaLbxCQuBD92yarqcMB6
 022+dfLR93e8uEho=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tcJz4-0004QM-6i for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 27 Jan 2025 07:56:39 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-844e5b72c69so648773639f.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 26 Jan 2025 23:56:38 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737964587; x=1738569387;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=hJcB7Kr/MyGcTqRVm2CC+tjRLzd0VrcBipQTfCjD3gM=;
 b=kiXjnOpUeMw8HUYX6Q0X+ME0F3X3JxgFPXjxft+IAQcXD7kjp7RYBO0IgCLvMUCFG8
 nZLY5mQcK08IFKSSxuJd6GVj+dL3pUcwZ5d2FNq/qxjpoytCQqa29Gl2Ph0GEi7JSbBa
 jfb2TLuZWPcBTT567+VeW3tCTliC0PUi5M7qw1CJn7I2CH6dmkv5BLkGsX7S4X78tcjr
 dnkDBKzPPj9ILj00YGwidszwwJ+8KYbi0oOOcueilhBydlKAAZkjfcojkYOS4sBPEMjJ
 4nnJgBQS1tbq7IOFneblSl+iW8IFOcuaZusoUVmU0OP+rwcykUPo6q7WH8D5mn3vu8x+
 OA+w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWgJR+V0Kfe2eMTs2I1++o89IUZzFouCFgc95mYKXoE5hTx3J+If8+7JGfxgc5//gX3xnE/MiE4myndp/76DCRg@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yw1bzhUGWk7VTb1Rtk4pQZkajqYxskO9913pEZbamh027H20aEO
 +jswhygXsa2nzZV3ZclCpzMVGAJjradT1qHGkT8BEQh321icE0jaC4PugdgvZxE5Mv/QKhrF9Mr
 aYxqCuaY34QWtisOyP3EKvbxlW4L+ZYyQ5c+qyOYrvS11Pl9RjAxAWpw=
X-Google-Smtp-Source: AGHT+IGOhcSC4/+e0ekoStNGl5inEYUNQoGUudSGvUzDLwM1ViRAAYMRdPfoeRKOH7yYKUS8nunoyEl3MHhqp6n8wj6MmMTABlrC
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1c23:b0:3ce:8ed9:ca94 with SMTP id
 e9e14a558f8ab-3cf744905d8mr339180105ab.14.1737964587474; Sun, 26 Jan 2025
 23:56:27 -0800 (PST)
Date: Sun, 26 Jan 2025 23:56:27 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67973c2b.050a0220.11b1bb.0089.GAE@google.com>
From: syzbot <syzbot+b6b347b7a4ea1b2e29b6@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: df60eac9efe8
 Merge tag 'for-linus-6.14-1' of https://githu.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=10e14a38580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.77 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.77 listed in bl.score.senderscore.com]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.77 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.77 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1tcJz4-0004QM-6i
Subject: [f2fs-dev] [syzbot] [f2fs?] BUG: unable to handle kernel paging
 request in has_enough_free_secs
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

HEAD commit:    df60eac9efe8 Merge tag 'for-linus-6.14-1' of https://githu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e14a38580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e56f16478dfabb4
dashboard link: https://syzkaller.appspot.com/bug?extid=b6b347b7a4ea1b2e29b6
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c42a22eab378/disk-df60eac9.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e8d947efbb6a/vmlinux-df60eac9.xz
kernel image: https://storage.googleapis.com/syzbot-assets/0225eaefda10/bzImage-df60eac9.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+b6b347b7a4ea1b2e29b6@syzkaller.appspotmail.com

F2FS-fs (loop3): Stopped filesystem due to reason: 7
kworker/u8:7: attempt to access beyond end of device
loop3: rw=1, sector=45096, nr_sectors = 8 limit=40427
BUG: unable to handle page fault for address: ffffed1604ea3dfa
#PF: supervisor read access in kernel mode
#PF: error_code(0x0000) - not-present page
PGD 23ffee067 P4D 23ffee067 PUD 0 
Oops: Oops: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 0 UID: 0 PID: 2977 Comm: kworker/u8:7 Not tainted 6.13.0-syzkaller-04541-gdf60eac9efe8 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 12/27/2024
Workqueue: writeback wb_workfn (flush-7:3)
RIP: 0010:get_ckpt_valid_blocks fs/f2fs/segment.h:361 [inline]
RIP: 0010:has_curseg_enough_space fs/f2fs/segment.h:570 [inline]
RIP: 0010:__get_secs_required fs/f2fs/segment.h:620 [inline]
RIP: 0010:has_not_enough_free_secs fs/f2fs/segment.h:633 [inline]
RIP: 0010:has_enough_free_secs+0x575/0x1660 fs/f2fs/segment.h:649
Code: 3c 08 00 74 12 48 89 ef e8 88 30 0d fe 48 b9 00 00 00 00 00 fc ff df 4b 8d 1c 7f 48 c1 e3 04 48 03 5d 00 48 89 d8 48 c1 e8 03 <0f> b6 04 08 84 c0 0f 85 bc 02 00 00 44 0f b7 63 02 41 81 e4 ff 03
RSP: 0018:ffffc9000baa7268 EFLAGS: 00010a06
RAX: 1ffff11604ea3dfa RBX: ffff88b02751efd0 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000001
RBP: ffff888028c058e8 R08: ffffffff83f643f7 R09: 1ffff110037e6a00
R10: dffffc0000000000 R11: ffffed10037e6a01 R12: 1ffff110037e682e
R13: ffff88801bf34170 R14: 0000000000000001 R15: 00000000ffffffff
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffed1604ea3dfa CR3: 0000000033f0a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 f2fs_is_checkpoint_ready fs/f2fs/segment.h:671 [inline]
 f2fs_write_inode+0x425/0x540 fs/f2fs/inode.c:791
 write_inode fs/fs-writeback.c:1525 [inline]
 __writeback_single_inode+0x708/0x10d0 fs/fs-writeback.c:1745
 writeback_sb_inodes+0x820/0x1360 fs/fs-writeback.c:1976
 wb_writeback+0x413/0xb80 fs/fs-writeback.c:2156
 wb_do_writeback fs/fs-writeback.c:2303 [inline]
 wb_workfn+0x410/0x1080 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3236 [inline]
 process_scheduled_works+0xa66/0x1840 kernel/workqueue.c:3317
 worker_thread+0x870/0xd30 kernel/workqueue.c:3398
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Modules linked in:
CR2: ffffed1604ea3dfa
---[ end trace 0000000000000000 ]---
RIP: 0010:get_ckpt_valid_blocks fs/f2fs/segment.h:361 [inline]
RIP: 0010:has_curseg_enough_space fs/f2fs/segment.h:570 [inline]
RIP: 0010:__get_secs_required fs/f2fs/segment.h:620 [inline]
RIP: 0010:has_not_enough_free_secs fs/f2fs/segment.h:633 [inline]
RIP: 0010:has_enough_free_secs+0x575/0x1660 fs/f2fs/segment.h:649
Code: 3c 08 00 74 12 48 89 ef e8 88 30 0d fe 48 b9 00 00 00 00 00 fc ff df 4b 8d 1c 7f 48 c1 e3 04 48 03 5d 00 48 89 d8 48 c1 e8 03 <0f> b6 04 08 84 c0 0f 85 bc 02 00 00 44 0f b7 63 02 41 81 e4 ff 03
RSP: 0018:ffffc9000baa7268 EFLAGS: 00010a06
RAX: 1ffff11604ea3dfa RBX: ffff88b02751efd0 RCX: dffffc0000000000
RDX: 0000000000000000 RSI: 0000000000000001 RDI: 0000000000000001
RBP: ffff888028c058e8 R08: ffffffff83f643f7 R09: 1ffff110037e6a00
R10: dffffc0000000000 R11: ffffed10037e6a01 R12: 1ffff110037e682e
R13: ffff88801bf34170 R14: 0000000000000001 R15: 00000000ffffffff
FS:  0000000000000000(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffed1604ea3dfa CR3: 0000000033f0a000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
----------------
Code disassembly (best guess):
   0:	3c 08                	cmp    $0x8,%al
   2:	00 74 12 48          	add    %dh,0x48(%rdx,%rdx,1)
   6:	89 ef                	mov    %ebp,%edi
   8:	e8 88 30 0d fe       	call   0xfe0d3095
   d:	48 b9 00 00 00 00 00 	movabs $0xdffffc0000000000,%rcx
  14:	fc ff df
  17:	4b 8d 1c 7f          	lea    (%r15,%r15,2),%rbx
  1b:	48 c1 e3 04          	shl    $0x4,%rbx
  1f:	48 03 5d 00          	add    0x0(%rbp),%rbx
  23:	48 89 d8             	mov    %rbx,%rax
  26:	48 c1 e8 03          	shr    $0x3,%rax
* 2a:	0f b6 04 08          	movzbl (%rax,%rcx,1),%eax <-- trapping instruction
  2e:	84 c0                	test   %al,%al
  30:	0f 85 bc 02 00 00    	jne    0x2f2
  36:	44 0f b7 63 02       	movzwl 0x2(%rbx),%r12d
  3b:	41                   	rex.B
  3c:	81                   	.byte 0x81
  3d:	e4 ff                	in     $0xff,%al
  3f:	03                   	.byte 0x3


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
