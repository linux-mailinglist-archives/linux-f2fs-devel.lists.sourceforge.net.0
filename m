Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A42BB0538E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 15 Jul 2025 09:45:53 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:In-Reply-To:Date:MIME-Version:Sender:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=iDggRjCyKmCO/n9NCxOTPRiBO9zV0sg/S4Z7Np6aYMQ=; b=bsSuzDBzSID2lMTDl09eF3IIGG
	BmbJv0I6pzxyKvXOSFA+qQgIWug+3G3tYRkWqYzaIra2Jw0V4FUNInMWp0n4xZ4d5hMSjw0fYqQSm
	xh+yZVMUH8WcYkURKuvXHUNoJ7FEf/w3W+FGUuf8b/P8D8l9P+6HyRnbdaMrmAMtPWwE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ubaMF-0000va-Gi;
	Tue, 15 Jul 2025 07:45:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3HAd2aAkbAE07DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1ubaMB-0000vQ-Nt for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 07:45:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HJcDxNdksfokdJf2O0K2cNXP/0MZixzEwZMVOab1/Oc=; b=LEWEAcK2kNb0Wxrr7jxkzmWidc
 y/ovywKiYXfmIupVzA1C2saSo7Mm8htATTvqCY8XgmfFgl2U0JWAm0pPMQM6umMcb5QDwwu7Z1pjj
 H4fXvQ9R99xKdVGwxT9cUe77MGcFWp2ZVlyo7oL0q5wwJ8x4Wcm4EMFlT7qoMW6Oudqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HJcDxNdksfokdJf2O0K2cNXP/0MZixzEwZMVOab1/Oc=; b=c
 ZXekwWsu/Uq48eZtPoCTYF85mGFjDZFe0dMitAFwZhwelHVGI4+LWI+pnzO8r1O7cqofVWM8+0xGd
 sRYlIsZH7eBSllYvVe4vV9tCdQZHQqVkD0d28kISq0P6tcwnaoJNj6U/swX6Y7SbBv4cYyKQvr6Sn
 z/SOuW2skIYtaCCk=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ubaMB-000396-49 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 15 Jul 2025 07:45:43 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3e0616aed31so57481735ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 15 Jul 2025 00:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752565532; x=1753170332;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=HJcDxNdksfokdJf2O0K2cNXP/0MZixzEwZMVOab1/Oc=;
 b=lKinGlVZceYaFARe5LT1NcKUfgJrDcMT7Z35CsUM+SpWk4f3kOl1j2QXIGYqkDYQjx
 qXIECokJ0drNsvxJUPE3/eANEw8AB0fHL64HLzjgohvEXId4c0AAs6hPROSiAxf4rfAU
 rYdpi738JnccSyOG7fMY+p9g5pAY1dczyvh6vI1atmWUD5WkRDFBPwo0F1jTHl9ghgW7
 jkBkFaITsI6t9fi0mQ6S4L5qXQ6U4kv6AR2ozTcYxMaymYaupgBylEU1sWwjZ8t8haIA
 Eaw9UZzXUOB+uKQOFVYgH2eI5DyClDTLW2+BXWRpFThqYZmvQ99miFCMNPaPXQFnKtzi
 83pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXJU/z/bRqOx2SnAwZ/A2pGl8iCX1b4FcD8YxzC8gxZGMQMPRgBqA37x4A7N9Xicc/1q9bf5N1PO61Vw++BTWjv@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxgtpAf2hldLZAj9q2k7z7ofp4Bd3f93pt4cEWS3pvLom4ogWeH
 2jBRuTcBV/qpRTMB4cFUJ/lvceVr2VX7y+Pf7q7ag+2yWjjKSL2c2ZtaxWZDDAjI/99+cPZYFiV
 rhcIXfK2rcyTyy8arRM4AhCNAUSJODOarwI9l+Bnx8880dr56vvCg8ax1PX0=
X-Google-Smtp-Source: AGHT+IH1gUo0BpFJUVoIAsN7ut0nNXM99gr16Ed7clqdTYu36NI2YrsgZTQqLpshyWg7Akpr/UR1TE4mX+0Ce+GFYPoIuThNZpLu
MIME-Version: 1.0
X-Received: by 2002:a92:c242:0:b0:3df:4b77:28d6 with SMTP id
 e9e14a558f8ab-3e25334e8camr185235805ab.21.1752565532235; Tue, 15 Jul 2025
 00:45:32 -0700 (PDT)
Date: Tue, 15 Jul 2025 00:45:32 -0700
In-Reply-To: <6867a7e6.a00a0220.c7b3.001a.GAE@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6876071c.050a0220.158d12.0001.GAE@google.com>
From: syzbot <syzbot+8a7eea50810efde15b0a@syzkaller.appspotmail.com>
To: anna-maria@linutronix.de, chao@kernel.org, frederic@kernel.org, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 tglx@linutronix.de
X-Spam-Score: 2.8 (++)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 0be23810e32e Add linux-next specific files for 20250714 git tree:
 linux-next console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=1409f0f0580000
 kernel config: https://syzkaller.apps [...] 
 Content analysis details:   (2.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1ubaMB-000396-49
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in
 f2fs_issue_checkpoint (2)
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

HEAD commit:    0be23810e32e Add linux-next specific files for 20250714
git tree:       linux-next
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1409f0f0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=adc3ea2bfe31343b
dashboard link: https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
compiler:       Debian clang version 20.1.7 (++20250616065708+6146a88f6049-1~exp1~20250616065826.132), Debian LLD 20.1.7
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=106af18c580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16a88382580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/13b5be5048fe/disk-0be23810.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3d2b3b2ceddf/vmlinux-0be23810.xz
kernel image: https://storage.googleapis.com/syzbot-assets/c7e5fbf3efa6/bzImage-0be23810.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/4e5d1c6cac7f/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=14a88382580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a7eea50810efde15b0a@syzkaller.appspotmail.com

INFO: task syz-executor288:5860 blocked for more than 143 seconds.
      Not tainted 6.16.0-rc6-next-20250714-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor288 state:D stack:24648 pid:5860  tgid:5860  ppid:5859   task_flags:0x400140 flags:0x00004006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5314 [inline]
 __schedule+0x16f5/0x4d00 kernel/sched/core.c:6697
 __schedule_loop kernel/sched/core.c:6775 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6790
 schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2bf/0x5d0 kernel/sched/completion.c:153
 f2fs_issue_checkpoint+0x376/0x570 fs/f2fs/checkpoint.c:-1
 f2fs_do_sync_file+0x869/0x1860 fs/f2fs/file.c:346
 generic_write_sync include/linux/fs.h:3038 [inline]
 f2fs_file_write_iter+0x74d/0x2410 fs/f2fs/file.c:5252
 new_sync_write fs/read_write.c:593 [inline]
 vfs_write+0x548/0xa90 fs/read_write.c:686
 ksys_pwrite64 fs/read_write.c:793 [inline]
 __do_sys_pwrite64 fs/read_write.c:801 [inline]
 __se_sys_pwrite64 fs/read_write.c:798 [inline]
 __x64_sys_pwrite64+0x193/0x220 fs/read_write.c:798
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0x3b0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f9b43976b19
RSP: 002b:00007ffee8c2a118 EFLAGS: 00000246 ORIG_RAX: 0000000000000012
RAX: ffffffffffffffda RBX: 0000200000000040 RCX: 00007f9b43976b19
RDX: 000000000000fdef RSI: 0000200000000140 RDI: 0000000000000004
RBP: 0031656c69662f2e R08: 0000555559c514c0 R09: 0000555559c514c0
R10: 0000000000000e7c R11: 0000000000000246 R12: 00007ffee8c2a140
R13: 00007ffee8c2a368 R14: 431bde82d7b634db R15: 00007f9b439bf03b
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8e13eca0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e13eca0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e13eca0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6770
3 locks held by kworker/u8:6/1102:
 #0: ffff8881404f4948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #0: ffff8881404f4948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3322
 #1: ffffc90003c6fbc0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3215 [inline]
 #1: ffffc90003c6fbc0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3322
 #2: ffff8880292d40e0 (&type->s_umount_key#42){.+.+}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:563
2 locks held by getty/5605:
 #0: ffff88803009b0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
1 lock held by syz-executor288/5860:
 #0: ffff8880292d4428 (sb_writers#8){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:3103 [inline]
 #0: ffff8880292d4428 (sb_writers#8){.+.+}-{0:0}, at: vfs_write+0x211/0xa90 fs/read_write.c:682
2 locks held by f2fs_ckpt-7:0/5861:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.16.0-rc6-next-20250714-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:328 [inline]
 watchdog+0xfee/0x1030 kernel/hung_task.c:491
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 5861 Comm: f2fs_ckpt-7:0 Not tainted 6.16.0-rc6-next-20250714-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:xa_entry include/linux/xarray.h:1226 [inline]
RIP: 0010:xas_reload+0x19a/0x470 include/linux/xarray.h:1630
Code: ff e8 ba 15 7f 09 89 c5 31 ff 89 c6 e8 1f a4 c7 ff 85 ed 0f 84 14 01 00 00 e8 d2 9f c7 ff e9 5a 02 00 00 e8 c8 9f c7 ff eb 1d <e8> 31 53 ad ff 89 c5 31 ff 89 c6 e8 f6 a3 c7 ff 85 ed 0f 84 27 01
RSP: 0018:ffffc9000414f528 EFLAGS: 00000246
RAX: ffffffff81f82547 RBX: ffffea0001c272c0 RCX: 0000000000000000
RDX: ffff8880792bbc00 RSI: 0000000000000000 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffea0001c272f7 R09: 1ffffd4000384e5e
R10: dffffc0000000000 R11: fffff94000384e5f R12: ffff888075e30240
R13: 1ffff92000829eb0 R14: ffffc9000414f580 R15: ffff888025979e40
FS:  0000000000000000(0000) GS:ffff888125bed000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007fe4c0415fb3 CR3: 000000000df38000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 filemap_get_entry+0x1c4/0x2f0 mm/filemap.c:1884
 __filemap_get_folio+0x68/0xaf0 mm/filemap.c:1916
 f2fs_grab_cache_folio+0x2b/0x380 fs/f2fs/f2fs.h:2870
 __get_node_folio+0x194/0x1410 fs/f2fs/node.c:1505
 f2fs_update_inode_page+0x82/0x190 fs/f2fs/inode.c:766
 f2fs_sync_inode_meta fs/f2fs/checkpoint.c:1156 [inline]
 block_operations fs/f2fs/checkpoint.c:1263 [inline]
 f2fs_write_checkpoint+0xb6e/0x1df0 fs/f2fs/checkpoint.c:1638
 __write_checkpoint_sync fs/f2fs/checkpoint.c:1756 [inline]
 __checkpoint_and_complete_reqs+0xd9/0x3b0 fs/f2fs/checkpoint.c:1775
 issue_checkpoint_thread+0xd9/0x260 fs/f2fs/checkpoint.c:1806
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x3f9/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>


---
If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
