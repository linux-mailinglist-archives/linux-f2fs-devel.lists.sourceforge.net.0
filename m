Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C1A16C9285
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 26 Mar 2023 07:17:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pgIlL-0003T6-U3;
	Sun, 26 Mar 2023 05:17:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3eNUfZAkbAMk7DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pgIlK-0003Sz-Jm for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 05:17:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:In-Reply-To
 :Date:MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BnWaWq6NmsLrGhIeXnc5ObQWYd+TBJXXQle9ays3Dh4=; b=FfM+VMGgUJvqwypo9b8dGordcq
 dKdPx45lh4I2s0D1JLuRzumfCv9k3kzsonFIl12z4OQy2eIKH0oBC3koJA0laorHZI6rzJ/p1p1EA
 +z3RDzDAiYUibl84GbdgtwHUqvXGIyqnZqPItc7/IQ0tAi5qvLx5BTDgYb4mjbeYFvDk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:In-Reply-To:Date:MIME-Version:
 Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BnWaWq6NmsLrGhIeXnc5ObQWYd+TBJXXQle9ays3Dh4=; b=S
 VaK1yXiPcsZGLosFi2k4jecWusbKeMIB+jDV5dT6ONH8p+8cNyKGn9w+rypAAi3ndFxlzBwBJfPe6
 Gksln4iAL6eoKCLp660tkKtCULTc0pf96s64CyJFj7Et463DAiL/bFOaJEd6914F7hVtCYI9WsClz
 mVKUaP54OlBowgR0=;
Received: from mail-io1-f80.google.com ([209.85.166.80])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pgIlJ-003u3T-WE for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 26 Mar 2023 05:17:50 +0000
Received: by mail-io1-f80.google.com with SMTP id
 d204-20020a6bb4d5000000b00758cfdd36c3so3612331iof.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 25 Mar 2023 22:17:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679807864;
 h=to:from:subject:message-id:in-reply-to:date:mime-version
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=BnWaWq6NmsLrGhIeXnc5ObQWYd+TBJXXQle9ays3Dh4=;
 b=2VnWL916hADL22k5TdSLBUFEYdVi50MOlnmIajwnlOu9CeLemmNXIe6eCaXPcsSbL8
 fUxLEACqbMeOt78lNHROLRXirJEGMpw5d/hT+m6e5akY+4i/KoZIUvq8lvQ+If+GL4EN
 bFJ8W2ruoI030Ql+/uJWJ5L+uZUt2l12itdNasp+3Im1LOPHkcN4BW/SWeo71/Ch9jLy
 nkeXwElyHhXLTx4Nt2KeMT/ZSJyTAkpqSKztVmh3JX4pskYXEznaoN+DtKy2l1zFecrv
 qoZyS6uVXKB/7LKbO6fUy/pKTJPH7wABCoT4kmntZY4+CfvyTlPkTsVi6Xu3JWAuCgTr
 WCsA==
X-Gm-Message-State: AAQBX9dvw66cMe/qA6GrMi7NJNsMLgjT7DzesYvAefPQOOhNavbqyBaN
 cGNMuED2Ldj6GS/3uiacnnPz6wA9Hsssdz8iX7I5F6OkURJv
X-Google-Smtp-Source: AKy350ZRQDYv76Ns9NO0/l+lKJ173dbP3GtnLp0xyEFfUZZSvVfMCekJBnIzNh7QLOKyzNChSUztzM9mdVSJqoWSGfrkVeNEnoPB
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:152b:b0:325:fe45:7c85 with SMTP id
 i11-20020a056e02152b00b00325fe457c85mr495731ilu.4.1679807864360; Sat, 25 Mar
 2023 22:17:44 -0700 (PDT)
Date: Sat, 25 Mar 2023 22:17:44 -0700
In-Reply-To: <0000000000000ac4cc05f6e7f12b@google.com>
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000bf86505f7c6bf0c@google.com>
From: syzbot <syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  syzbot has found a reproducer for the following issue on:
 HEAD commit: 4bdec23f971b Merge tag 'hwmon-for-v6.3-rc4' of git://git.k..
 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=177bdf41c80000
 kernel config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.80 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.80 listed in wl.mailspike.net]
X-Headers-End: 1pgIlJ-003u3T-WE
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_balance_fs
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

HEAD commit:    4bdec23f971b Merge tag 'hwmon-for-v6.3-rc4' of git://git.k..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=177bdf41c80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=ea09b0836073ee4
dashboard link: https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1320ef41c80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100b561ec80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d61c34161317/disk-4bdec23f.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/6f84b5727488/vmlinux-4bdec23f.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1279076a5b70/bzImage-4bdec23f.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c38a9411ccc2/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com

INFO: task kworker/u4:4:56 blocked for more than 143 seconds.
      Not tainted 6.3.0-rc3-syzkaller-00322-g4bdec23f971b #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u4:4    state:D stack:26464 pid:56    ppid:2      flags:0x00004000
Workqueue: writeback wb_workfn (flush-7:0)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5304 [inline]
 __schedule+0xc91/0x5770 kernel/sched/core.c:6622
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
 __writeback_single_inode+0x9f8/0xdc0 fs/fs-writeback.c:1665
 writeback_sb_inodes+0x54d/0xe70 fs/fs-writeback.c:1891
 __writeback_inodes_wb+0xc6/0x280 fs/fs-writeback.c:1962
 wb_writeback+0x7e9/0xa50 fs/fs-writeback.c:2067
 wb_check_old_data_flush fs/fs-writeback.c:2167 [inline]
 wb_do_writeback fs/fs-writeback.c:2220 [inline]
 wb_workfn+0x765/0xfc0 fs/fs-writeback.c:2248
 process_one_work+0x991/0x15c0 kernel/workqueue.c:2390
 worker_thread+0x669/0x1090 kernel/workqueue.c:2537
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>

Showing all locks held in the system:
1 lock held by rcu_tasks_kthre/12:
 #0: ffffffff8c794b70 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x31/0xd80 kernel/rcu/tasks.h:510
1 lock held by rcu_tasks_trace/13:
 #0: ffffffff8c794870 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x31/0xd80 kernel/rcu/tasks.h:510
1 lock held by khungtaskd/28:
 #0: ffffffff8c7956c0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x340 kernel/locking/lockdep.c:6495
4 locks held by kworker/u4:4/56:
 #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
 #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
 #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1280 [inline]
 #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:639 [inline]
 #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:666 [inline]
 #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x87a/0x15c0 kernel/workqueue.c:2361
 #1: ffffc90001577da8 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x8ae/0x15c0 kernel/workqueue.c:2365
 #2: ffff8880244ae0e0 (&type->s_umount_key#44){.+.+}-{3:3}, at: trylock_super+0x21/0x110 fs/super.c:414
 #3: ffff8880200f12a8 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2207 [inline]
 #3: ffff8880200f12a8 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_balance_fs+0x54e/0x6c0 fs/f2fs/segment.c:427
2 locks held by getty/4755:
 #0: ffff88802be78098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x26/0x80 drivers/tty/tty_ldisc.c:244
 #1: ffffc900015a02f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xef4/0x13e0 drivers/tty/n_tty.c:2177
3 locks held by syz-executor470/5084:
1 lock held by syz-executor470/5814:

=============================================

NMI backtrace for cpu 1
CPU: 1 PID: 28 Comm: khungtaskd Not tainted 6.3.0-rc3-syzkaller-00322-g4bdec23f971b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 nmi_cpu_backtrace+0x29c/0x350 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x2a4/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:148 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:222 [inline]
 watchdog+0xe16/0x1090 kernel/hung_task.c:379
 kthread+0x2e8/0x3a0 kernel/kthread.c:376
 ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 PID: 5814 Comm: syz-executor470 Not tainted 6.3.0-rc3-syzkaller-00322-g4bdec23f971b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
RIP: 0010:__sanitizer_cov_trace_pc+0x3b/0x70 kernel/kcov.c:207
Code: 81 e1 00 01 00 00 65 48 8b 14 25 80 b8 03 00 a9 00 01 ff 00 74 0e 85 c9 74 35 8b 82 74 15 00 00 85 c0 74 2b 8b 82 50 15 00 00 <83> f8 02 75 20 48 8b 8a 58 15 00 00 8b 92 54 15 00 00 48 8b 01 48
RSP: 0018:ffffc9000444f8b8 EFLAGS: 00000246
RAX: 0000000000000000 RBX: ffff88802bb0af58 RCX: 0000000000000000
RDX: ffff888026079d40 RSI: ffffffff81b30401 RDI: 0000000000000001
RBP: ffffea0001b5f3c0 R08: 0000000000000001 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
R13: 0000000000000000 R14: ffffc9000444fa48 R15: 0000000000000001
FS:  00007ff4d3fdc700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff4cfbbb000 CR3: 00000000294d8000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 truncate_inode_folio+0x51/0x70 mm/truncate.c:197
 shmem_undo_range+0x33e/0x1340 mm/shmem.c:942
 shmem_truncate_range mm/shmem.c:1041 [inline]
 shmem_evict_inode+0x32f/0xb60 mm/shmem.c:1156
 evict+0x2ed/0x6b0 fs/inode.c:665
 iput_final fs/inode.c:1748 [inline]
 iput.part.0+0x50a/0x740 fs/inode.c:1774
 iput+0x5c/0x80 fs/inode.c:1764
 dentry_unlink_inode+0x2b1/0x460 fs/dcache.c:401
 __dentry_kill+0x3c0/0x640 fs/dcache.c:607
 dentry_kill fs/dcache.c:733 [inline]
 dput+0x865/0xe10 fs/dcache.c:913
 __fput+0x3cc/0xa90 fs/file_table.c:329
 task_work_run+0x16f/0x270 kernel/task_work.c:179
 ptrace_notify+0x118/0x140 kernel/signal.c:2354
 ptrace_report_syscall include/linux/ptrace.h:411 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:473 [inline]
 syscall_exit_work kernel/entry/common.c:251 [inline]
 syscall_exit_to_user_mode_prepare+0x129/0x220 kernel/entry/common.c:278
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0xd/0x50 kernel/entry/common.c:296
 do_syscall_64+0x46/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7ff4d3feca4b
Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 03 fd ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 41 fd ff ff 8b 44
RSP: 002b:00007ff4d3fdc160 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007ff4d3feca4b
RDX: 0000000000000010 RSI: 0000000000004c00 RDI: 0000000000000003
RBP: 0000000000000004 R08: 0000000000000000 R09: 00000000000105f8
R10: 0000000000000000 R11: 0000000000000293 R12: 00007ff4d3fdc6b8
R13: 00007ff4d3fdc190 R14: 00007ff4d3fdc1d0 R15: 0000000000000010
 </TASK>



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
