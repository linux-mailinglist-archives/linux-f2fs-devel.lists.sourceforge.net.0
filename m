Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BDD6BA599
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 Mar 2023 04:29:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pcHov-0001xE-Bi;
	Wed, 15 Mar 2023 03:28:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3bTsRZAkbAFAAGH2s33w9s770v.y66y3wCAw9u65Bw5B.u64@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pcHoq-0001x8-Kc for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Mar 2023 03:28:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ECiNvzD1JpR7QBf80Hg4p0SOYIhDi+NfZjusM0FTKDI=; b=NO32VjNsI8dcr+BN09fY9fKZUK
 6M24loHTaubwHXa8TddVGqdmWx6vAHOXO4DyzKtyhx9RHkjpx4QllG31yauhmIhGsZFpvJTYwdF1r
 AfU9OMqX2VfekWt74Owemr7WDQydtl0iPGMPll07/INAQFj0gmoAHhcEdSTC1PCgSa5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ECiNvzD1JpR7QBf80Hg4p0SOYIhDi+NfZjusM0FTKDI=; b=C
 3zdvXCGKrvCmUrL1VW9p5VUoHmX1V6zFrgMKP4U6EZNUjwSbYyjNW7dYd6gfqZE8UHXZqb2jsN1/i
 4+WaRC+6Opgafu+b33p+TCZ111vUJp8K08RD9HgMchgmHQngryFqjy50VHX2Q5hZx+iXRFLQff4wf
 vjKqVVfEThnsjbpA=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pcHop-00076P-26 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 Mar 2023 03:28:53 +0000
Received: by mail-io1-f72.google.com with SMTP id
 9-20020a5ea509000000b0074ca36737d2so8680853iog.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Mar 2023 20:28:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678850925;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ECiNvzD1JpR7QBf80Hg4p0SOYIhDi+NfZjusM0FTKDI=;
 b=AZDNksisCQJkzJTn0qnDeY1YhCFkTq+ZjGiD8iG8NWiSRQ87Is6H6m9HpS4LNXYbcw
 63ORZHRXg6wH39Gt+6ABYpAxz/wV6vTOS+b3MkwmbGazdwxPSLA1YE938DarEaRz1gch
 /HlJ/VqPWbk2nkr0AyiQS8UB71cSQmhqOQybNCYxilmjgcUI8cqxukBbNWYbYIj2PZQ3
 aL6JkwFRGAgPiE03h6jCs0181wmWu4l5bAvWEaqLnX06k5cnsQNwb9yPrRp3zgvyVMy0
 W458YJ06NQbNM5p6Csl3HSayIlmxwp+QCG58DpRr6gCejYemwDSiqvjAhi2oHe3J8lol
 1H9A==
X-Gm-Message-State: AO0yUKW4JTmEMqbbnZZyHqUcV9pWy2vMFW3nN661td2XLGBFc01pxRKp
 RA+Wd2BG7y8EMM80iqJeJAjtk7HDXtmRkR8ojl8IGK2Y8NM8
X-Google-Smtp-Source: AK7set+QmApVj0ICRJmOpskgyjylBoDGFcOWYzfe50PuOSsHKphgoEA75fYPHti5kCKoRdUDG8do5n/H4A6Ru2azbgec5n2yzOlz
MIME-Version: 1.0
X-Received: by 2002:a02:85e9:0:b0:3fc:e1f5:961a with SMTP id
 d96-20020a0285e9000000b003fce1f5961amr6051201jai.2.1678850925443; Tue, 14 Mar
 2023 20:28:45 -0700 (PDT)
Date: Tue, 14 Mar 2023 20:28:45 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000ac4cc05f6e7f12b@google.com>
From: syzbot <syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 0988a0ea7919
 Merge tag 'for-v6.3-part2' of git://git.kerne.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=1666fbb0c80000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
X-Headers-End: 1pcHop-00076P-26
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_balance_fs
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

HEAD commit:    0988a0ea7919 Merge tag 'for-v6.3-part2' of git://git.kerne..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=1666fbb0c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cab35c936731a347
dashboard link: https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/c3d3396c296c/disk-0988a0ea.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/16cef168e621/vmlinux-0988a0ea.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4324b131ded6/bzImage-0988a0ea.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com

INFO: task kworker/u4:11:5360 blocked for more than 143 seconds.
      Not tainted 6.2.0-syzkaller-13467-g0988a0ea7919 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u4:11   state:D stack:25896 pid:5360  ppid:2      flags:0x00004000
Workqueue: writeback wb_workfn (flush-7:5)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5304 [inline]
 __schedule+0xcce/0x5b20 kernel/sched/core.c:6622
 schedule+0xde/0x1a0 kernel/sched/core.c:6698
 schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6757
 rwsem_down_write_slowpath+0x3e2/0x1220 kernel/locking/rwsem.c:1178
 __down_write_common kernel/locking/rwsem.c:1306 [inline]
 __down_write kernel/locking/rwsem.c:1315 [inline]
 down_write+0x1d2/0x200 kernel/locking/rwsem.c:1574
 f2fs_down_write fs/f2fs/f2fs.h:2207 [inline]
 f2fs_balance_fs+0x54e/0x6c0 fs/f2fs/segment.c:427
 f2fs_write_inode+0x582/0xe00 fs/f2fs/inode.c:760
 write_inode fs/fs-writeback.c:1453 [inline]
 __writeback_single_inode+0xd38/0x14d0 fs/fs-writeback.c:1665
 writeback_sb_inodes+0x54d/0xfa0 fs/fs-writeback.c:1891
 __writeback_inodes_wb+0xc6/0x280 fs/fs-writeback.c:1962
 wb_writeback+0x8d6/0xdd0 fs/fs-writeback.c:2067
 wb_check_old_data_flush fs/fs-writeback.c:2167 [inline]
 wb_do_writeback fs/fs-writeback.c:2220 [inline]
 wb_workfn+0x88a/0x1340 fs/fs-writeback.c:2248
 process_one_work+0x9bf/0x1820 kernel/workqueue.c:2390
 worker_thread+0x669/0x1090 kernel/workqueue.c:2537
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>

Showing all locks held in the system:
1 lock held by rcu_tasks_kthre/12:
 #0: ffffffff8c794e30 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x31/0xd80 kernel/rcu/tasks.h:510
1 lock held by rcu_tasks_trace/13:
 #0: ffffffff8c794b30 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x31/0xd80 kernel/rcu/tasks.h:510
1 lock held by khungtaskd/28:
 #0: ffffffff8c795980 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x340 kernel/locking/lockdep.c:6495
2 locks held by getty/4752:
 #0: ffff88814a459098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x26/0x80 drivers/tty/tty_ldisc.c:244
 #1: ffffc900015a02f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xef4/0x13e0 drivers/tty/n_tty.c:2177
4 locks held by kworker/u4:11/5360:
 #0: ffff888144ade138 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff888144ade138 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff888144ade138 ((wq_completion)writeback){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1280 [inline]
 #0: ffff888144ade138 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:639 [inline]
 #0: ffff888144ade138 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:666 [inline]
 #0: ffff888144ade138 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x86d/0x1820 kernel/workqueue.c:2361
 #1: ffffc900053dfda8 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x8a1/0x1820 kernel/workqueue.c:2365
 #2: ffff8880205a80e0 (&type->s_umount_key#76){++++}-{3:3}, at: trylock_super+0x21/0x110 fs/super.c:414
 #3: ffff8880813012a8 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2207 [inline]
 #3: ffff8880813012a8 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_balance_fs+0x54e/0x6c0 fs/f2fs/segment.c:427
2 locks held by syz-executor.5/13735:
1 lock held by syz-executor.4/13932:

=============================================

NMI backtrace for cpu 0
CPU: 0 PID: 28 Comm: khungtaskd Not tainted 6.2.0-syzkaller-13467-g0988a0ea7919 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 nmi_cpu_backtrace+0x316/0x3e0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x33f/0x460 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:148 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:222 [inline]
 watchdog+0xe94/0x11e0 kernel/hung_task.c:379
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 PID: 13735 Comm: syz-executor.5 Not tainted 6.2.0-syzkaller-13467-g0988a0ea7919 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
RIP: 0010:__might_sleep+0x21/0x160 kernel/sched/core.c:9975
Code: 2e 0f 1f 84 00 00 00 00 00 f3 0f 1e fa 48 b8 00 00 00 00 00 fc ff df 41 54 41 89 f4 55 48 89 fd 53 65 48 8b 1c 25 80 b8 03 00 <48> 8d 7b 18 48 83 ec 10 48 89 fa 48 c1 ea 03 0f b6 04 02 84 c0 74
RSP: 0018:ffffc9001571e308 EFLAGS: 00000286
RAX: dffffc0000000000 RBX: ffff88803edcba80 RCX: 0000000000000000
RDX: ffff88803edcba80 RSI: 00000000000005ef RDI: ffffffff8a4c5ec0
RBP: ffffffff8a4c5ec0 R08: 0000000000000004 R09: 0000000000000200
R10: 0000000000000001 R11: 0000000000094001 R12: 00000000000005ef
R13: 0000000000000001 R14: dffffc0000000000 R15: 000000000000000b
FS:  00007f3f5dda8700(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000555556b08888 CR3: 0000000079d24000 CR4: 0000000000350ee0
Call Trace:
 <TASK>
 down_read+0x19/0x50 kernel/locking/rwsem.c:1519
 check_valid_map fs/f2fs/gc.c:958 [inline]
 gc_data_segment fs/f2fs/gc.c:1510 [inline]
 do_garbage_collect+0x1b42/0x3e30 fs/f2fs/gc.c:1739
 f2fs_gc+0x890/0x20e0 fs/f2fs/gc.c:1837
 f2fs_balance_fs+0x55b/0x6c0 fs/f2fs/segment.c:428
 f2fs_write_single_data_page+0x13f5/0x1930 fs/f2fs/data.c:2897
 f2fs_write_cache_pages+0xce9/0x1ef0 fs/f2fs/data.c:3144
 __f2fs_write_data_pages fs/f2fs/data.c:3295 [inline]
 f2fs_write_data_pages+0x4c7/0x1270 fs/f2fs/data.c:3322
 do_writepages+0x1a8/0x640 mm/page-writeback.c:2551
 filemap_fdatawrite_wbc mm/filemap.c:390 [inline]
 filemap_fdatawrite_wbc+0x147/0x1b0 mm/filemap.c:380
 __filemap_fdatawrite_range+0xb8/0xf0 mm/filemap.c:423
 file_write_and_wait_range+0xce/0x140 mm/filemap.c:781
 f2fs_do_sync_file+0x3a4/0x2a60 fs/f2fs/file.c:273
 f2fs_sync_file+0x13a/0x190 fs/f2fs/file.c:391
 vfs_fsync_range+0x13e/0x230 fs/sync.c:188
 generic_write_sync include/linux/fs.h:2452 [inline]
 f2fs_file_write_iter+0x15d6/0x29a0 fs/f2fs/file.c:4727
 __kernel_write_iter+0x262/0x7a0 fs/read_write.c:517
 dump_emit_page fs/coredump.c:885 [inline]
 dump_user_range+0x234/0x700 fs/coredump.c:912
 elf_core_dump+0x277e/0x36e0 fs/binfmt_elf.c:2142
 do_coredump+0x2d28/0x3cc0 fs/coredump.c:762
 get_signal+0x1bff/0x25b0 kernel/signal.c:2845
 arch_do_signal_or_restart+0x79/0x5c0 arch/x86/kernel/signal.c:306
 exit_to_user_mode_loop kernel/entry/common.c:168 [inline]
 exit_to_user_mode_prepare+0x15f/0x250 kernel/entry/common.c:203
 irqentry_exit_to_user_mode+0x9/0x40 kernel/entry/common.c:309
 asm_exc_general_protection+0x26/0x30 arch/x86/include/asm/idtentry.h:564
RIP: 0033:0x7f3f5d08c101
Code: c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 48 3d 01 f0 ff ff 73 01 <c3> 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 2e 0f 1f
RSP: 002b:00000000200002f0 EFLAGS: 00010217
RAX: 0000000000000000 RBX: 00007f3f5d1abf80 RCX: 00007f3f5d08c0f9
RDX: 0000000020000000 RSI: 00000000200002f0 RDI: 0000000000000000
RBP: 00007f3f5d0e7ae9 R08: 0000000020000300 R09: 0000000020000300
R10: 0000000020000180 R11: 0000000000000246 R12: 0000000000000000
R13: 00007fff58642dbf R14: 00007f3f5dda8300 R15: 0000000000022000
 </TASK>


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
