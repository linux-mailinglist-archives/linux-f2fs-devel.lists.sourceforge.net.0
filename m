Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D7D8B97A387
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Sep 2024 16:01:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqCIO-00034H-Qh;
	Mon, 16 Sep 2024 14:01:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3NzroZgkbAIo6CDyozzs5o33wr.u22uzs86s5q217s17.q20@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sqCIN-000343-Hr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 14:01:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpTZa+3f5vFMtGc/xeY0K8UY7Tsj3VjLiMQkzWkik7s=; b=TSSPN4vrj8adt8IJYWd70+QgtC
 gdGGcyysknOOglGCFusEEqNhCpI9BkrcVhQ8ymS5a33BRI4dw7clQL3yTlfGY0wnUCz/qjFqF11C3
 TdcgGtN0IXXOGHKYf4S7Ga//HotibSdy1ODXODjvoOlgmXaG4SbqU4Pj74G274OIh8BI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zpTZa+3f5vFMtGc/xeY0K8UY7Tsj3VjLiMQkzWkik7s=; b=W
 8c3XXkyAYky7s+5lN6CgsVP7Dx7ZaQYB2YFMvSBdjOR0xEXsAiptHVDmnn74+KVh7gVHjysG5EA0p
 sXIjyRyvw3lvKKWHP053QZeWn0j7dRKF949VR44gzD7J9cGl67aiwn60XqLx1dwyID6vUNiSOT696
 fYF0abkMc8Xlz2Pk=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sqCIM-0003f0-AX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 16 Sep 2024 14:01:39 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a05311890bso78942235ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 16 Sep 2024 07:01:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726495287; x=1727100087;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zpTZa+3f5vFMtGc/xeY0K8UY7Tsj3VjLiMQkzWkik7s=;
 b=CawAC5iI0cssucAZrsstrYLs4+6I8hAyeFkXsXcTjMoRuhQpsJT5+ofNgzhBqpda7u
 +Y5pS4sxKWNxPz0UiA8jJrTKtsnpaVe2XLhQ+9IXfvGp+vQh+d7Ute8F/PhDq0MGSjvm
 A+LePn7yQzTjAwQ8Fa7+eSwg/+G7MAIaS3ARLb1vSN1RKNTbwq+3xldyIEaWCPacDGRr
 NKP8Qf/XCThdYTV7j4SQaJT0rscgFpG2/0nJ4RqDdYkb1x07wAx++WMt6B+tFYd4Mzbv
 hgsPx0T14DIAj0aeBlq47a5Jgn1OCiHOi4UJCovOb6lICFCa6X6kBcUts6/SGJ2sLZeK
 eZYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWelIbNuPGfVR9RxxJcQND5lsVCT73NDa7t5/07k5XHypPnBvJLHuJXn3NqfVLOmQXLGslX7Ma6v+welapAP8Ex@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzO1b8/zo9X9HQN1DvYcK8xhA9NQ/RyLnvO0c2CwT70uf49nxnm
 QLStDW7z9PmO3SLd2qZ9QwEB7rXHPNh8ztx5JmXp04Ex3XelFZG/2U1Pcnr9D629zsQ4dGeNmqf
 4YGILj1Ql2b1dbEEVElbYjg9UqeGtcbLqXWZDPPncMQi6AGI7CdBe4hk=
X-Google-Smtp-Source: AGHT+IEOahGJnAYcNAFTeSSJn7eIBRm3sVV5bF1vc3boMhiNfydC+JbvSRUOSkHpZz3uDsCskC0osRJ9MSpbpgqswzSYIKS62sym
MIME-Version: 1.0
X-Received: by 2002:a92:c567:0:b0:39d:25d8:43a9 with SMTP id
 e9e14a558f8ab-3a08b65fec5mr97990035ab.0.1726495287337; Mon, 16 Sep 2024
 07:01:27 -0700 (PDT)
Date: Mon, 16 Sep 2024 07:01:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000004ef94906223d020e@google.com>
From: syzbot <syzbot+6165bc9800cd6e1fe958@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, kent.overstreet@linux.dev, 
 linux-bcachefs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 2.0 (++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 98f7e32f20d2
 Linux 6.11 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=13a5e277980000
 kernel config: https://syzkaller.appspot.com/x/.config?x=c78874575ba70f [...]
 Content analysis details:   (2.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
X-Headers-End: 1sqCIM-0003f0-AX
Subject: [f2fs-dev] [syzbot] [bcachefs?] INFO: task hung in vfs_rename
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

HEAD commit:    98f7e32f20d2 Linux 6.11
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13a5e277980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c78874575ba70f27
dashboard link: https://syzkaller.appspot.com/bug?extid=6165bc9800cd6e1fe958
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/5d74d59e4416/disk-98f7e32f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/aa8ddac249b8/vmlinux-98f7e32f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e275b6573f40/bzImage-98f7e32f.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6165bc9800cd6e1fe958@syzkaller.appspotmail.com

INFO: task syz.1.151:6872 blocked for more than 143 seconds.
      Not tainted 6.11.0-syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.1.151       state:D stack:26232 pid:6872  tgid:6826  ppid:6080   flags:0x00004004
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5188 [inline]
 __schedule+0x17ae/0x4a10 kernel/sched/core.c:6529
 __schedule_loop kernel/sched/core.c:6606 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6621
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6678
 rwsem_down_write_slowpath+0xeeb/0x13b0 kernel/locking/rwsem.c:1178
 __down_write_common kernel/locking/rwsem.c:1306 [inline]
 __down_write kernel/locking/rwsem.c:1315 [inline]
 down_write_nested+0x1e0/0x220 kernel/locking/rwsem.c:1696
 vfs_rename+0x6a2/0xf00 fs/namei.c:4937
 do_renameat2+0xd94/0x13f0 fs/namei.c:5123
 __do_sys_rename fs/namei.c:5170 [inline]
 __se_sys_rename fs/namei.c:5168 [inline]
 __x64_sys_rename+0x82/0x90 fs/namei.c:5168
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f392db7def9
RSP: 002b:00007f392d59c038 EFLAGS: 00000246 ORIG_RAX: 0000000000000052
RAX: ffffffffffffffda RBX: 00007f392dd36208 RCX: 00007f392db7def9
RDX: 0000000000000000 RSI: 0000000020000f40 RDI: 00000000200003c0
RBP: 00007f392dbf0b76 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f392dd36208 R15: 00007fff903dcd98
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/30:
 #0: ffffffff8e738320 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
 #0: ffffffff8e738320 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:838 [inline]
 #0: ffffffff8e738320 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x2a0 kernel/locking/lockdep.c:6626
2 locks held by kworker/u8:5/1098:
 #0: ffff8880b893e998 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:560
 #1: ffff8880b8928948 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x441/0x770 kernel/sched/psi.c:989
4 locks held by kworker/u8:6/1106:
 #0: ffff888020e82948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff888020e82948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc90004267d00 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc90004267d00 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: super_trylock_shared+0x22/0xf0 fs/super.c:562
 #3: ffff8880254e52a0 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2175 [inline]
 #3: ffff8880254e52a0 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_balance_fs+0x5b0/0x7a0 fs/f2fs/segment.c:440
2 locks held by getty/4976:
 #0: ffff88802ffe40a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900031232f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x6ac/0x1e00 drivers/tty/n_tty.c:2211
5 locks held by syz.1.151/6869:
3 locks held by syz.1.151/6872:
 #0: ffff88802c236420 (sb_writers#14){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:515
 #1: ffff888061a7bec0 (&type->i_mutex_dir_key#10/1){+.+.}-{3:3}, at: inode_lock_nested include/linux/fs.h:835 [inline]
 #1: ffff888061a7bec0 (&type->i_mutex_dir_key#10/1){+.+.}-{3:3}, at: lock_rename fs/namei.c:3147 [inline]
 #1: ffff888061a7bec0 (&type->i_mutex_dir_key#10/1){+.+.}-{3:3}, at: do_renameat2+0x62c/0x13f0 fs/namei.c:5058
 #2: ffff888061a7f370 (&sb->s_type->i_mutex_key#25/4){+.+.}-{3:3}, at: vfs_rename+0x6a2/0xf00 fs/namei.c:4937
2 locks held by syz.1.278/7991:
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790
2 locks held by syz.3.286/8085:
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790
2 locks held by syz.3.286/8114:
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790
2 locks held by syz.2.268/8388:
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790
2 locks held by syz.4.303/8406:
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff88802c2360e0 (&type->s_umount_key#69){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff8880259647d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 30 Comm: khungtaskd Not tainted 6.11.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:93 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:119
 nmi_cpu_backtrace+0x49c/0x4d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:223 [inline]
 watchdog+0xff4/0x1040 kernel/hung_task.c:379
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 6869 Comm: syz.1.151 Not tainted 6.11.0-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
RIP: 0010:io_serial_in+0x76/0xb0 drivers/tty/serial/8250/8250_port.c:406
Code: b0 6f 5b fc 89 e9 41 d3 e6 48 83 c3 40 48 89 d8 48 c1 e8 03 42 80 3c 38 00 74 08 48 89 df e8 41 93 bf fc 44 03 33 44 89 f2 ec <0f> b6 c0 5b 41 5e 41 5f 5d c3 cc cc cc cc 89 e9 80 e1 07 38 c1 7c
RSP: 0018:ffffc90004585f98 EFLAGS: 00000002
RAX: 1ffffffff3485500 RBX: ffffffff9a42ad00 RCX: 0000000000000000
RDX: 00000000000003fd RSI: 000000000003ffff RDI: 0000000000040000
RBP: 0000000000000000 R08: ffffffff85381ca6 R09: 1ffff11004a66046
R10: dffffc0000000000 R11: ffffffff85381c60 R12: dffffc0000000000
R13: 0000000000002647 R14: 00000000000003fd R15: dffffc0000000000
FS:  00007f392d5de6c0(0000) GS:ffff8880b8900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560cad2f6030 CR3: 000000006de62000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 serial_in drivers/tty/serial/8250/8250.h:137 [inline]
 serial_lsr_in drivers/tty/serial/8250/8250.h:159 [inline]
 wait_for_lsr drivers/tty/serial/8250/8250_port.c:2068 [inline]
 serial8250_console_fifo_write drivers/tty/serial/8250/8250_port.c:3315 [inline]
 serial8250_console_write+0x1099/0x1770 drivers/tty/serial/8250/8250_port.c:3393
 console_emit_next_record kernel/printk/printk.c:2984 [inline]
 console_flush_all+0x865/0xfd0 kernel/printk/printk.c:3050
 console_unlock+0x13b/0x4d0 kernel/printk/printk.c:3119
 vprintk_emit+0x5dc/0x7c0 kernel/printk/printk.c:2348
 _printk+0xd5/0x120 kernel/printk/printk.c:2373
 bio_check_eod block/blk-core.c:543 [inline]
 submit_bio_noacct+0x1018/0x1920 block/blk-core.c:770
 f2fs_submit_page_read+0x163/0x190 fs/f2fs/data.c:1114
 f2fs_get_read_data_page+0x49f/0x750 fs/f2fs/data.c:1273
 gc_data_segment fs/f2fs/gc.c:1607 [inline]
 do_garbage_collect+0x3d62/0x7d80 fs/f2fs/gc.c:1774
 f2fs_gc+0xf04/0x2fa0 fs/f2fs/gc.c:1877
 f2fs_balance_fs+0x5f8/0x7a0 fs/f2fs/segment.c:442
 f2fs_map_blocks+0x3dc5/0x4850 fs/f2fs/data.c:1781
 f2fs_expand_inode_data+0x622/0xbb0 fs/f2fs/file.c:1806
 f2fs_fallocate+0x448/0x960 fs/f2fs/file.c:1903
 vfs_fallocate+0x553/0x6c0 fs/open.c:334
 do_vfs_ioctl+0x2592/0x2e50 fs/ioctl.c:886
 __do_sys_ioctl fs/ioctl.c:905 [inline]
 __se_sys_ioctl+0x81/0x170 fs/ioctl.c:893
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f392db7def9
Code: ff ff c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 a8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f392d5de038 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f392dd36058 RCX: 00007f392db7def9
RDX: 00000000200001c0 RSI: 0000000040305828 RDI: 0000000000000004
RBP: 00007f392dbf0b76 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f392dd36058 R15: 00007fff903dcd98
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
