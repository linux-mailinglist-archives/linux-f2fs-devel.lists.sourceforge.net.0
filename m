Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 045F78FB6B4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Jun 2024 17:13:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sEVqX-0005gv-TS;
	Tue, 04 Jun 2024 15:13:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1sEVqW-0005gp-5e
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 15:13:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SS81qHF7O3lKGUylYX3eBz79w8EnrpPEChpy7gm6N1Y=; b=jMYhnrrJiaSo2i9q4b3W23dIl6
 SkplHBK8sSypO1jIJAB6eJ0vns+7xBsBWzchVnTCBAS3kDVxV3smDQoQQCoWM0J5tBFZVngE3rt3i
 lreGaYT77DjWnY8YNiyeRnO0hOfxg+I1LJr2d8WLMIcEOE5aY8hMCUvizoQJlCDOtR/o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SS81qHF7O3lKGUylYX3eBz79w8EnrpPEChpy7gm6N1Y=; b=HPW37KP5IEKIcKqU+A2FJ/hQW4
 uTVZZGQ63kj2R9r2jbLbHAAlTQA/V+sKPZA9kYH8XgA4dXgso4HtwfBd+gRggIG3aBhZqJWMmDLS1
 vC6JUCKXfJw9Osjln6QLXCkDPba5Nf2zMIrZWl77EDXNLJbWy+kleHZLva5mXj3LTJZs=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sEVqX-0004yK-1B for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Jun 2024 15:13:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id D22046130C;
 Tue,  4 Jun 2024 15:12:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3754CC32786;
 Tue,  4 Jun 2024 15:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1717513977;
 bh=IdNjnDExFbPxluEOLgMemhixeZVTAlmSXGOoVCDMfeM=;
 h=Date:Subject:To:References:From:In-Reply-To:From;
 b=ELyiHJcMxG2syYG/tM9LP6g7LJfKYu/oXoePsjVKeQ6ZKYPXpf+4KnTyNASkDAZSm
 H1CJZDpfYahjn8+M9VlTDAhuIgYjuqRnqI69pKJjYNJRUfILIzuCUlvBegJE1TfiyT
 dVIC+rOg/EP8EEqWCZyZHPc5X62mFxk3Ja3i+8rsAARPGDDmZh5oizpicd5M87M/mu
 UcqdfSboRzhm2FMbPK8fpNX7tyKg5AFA0qC8hOEH5xPm2UDMk5EWxBnnVz03Unp5Y0
 y4Mft6XM0Q64hVOhSPcnBm0s+jhcXbErgM+jC/vGAGIWOtc+UhRxOlULU4bKp3qMSj
 LSsyf0O54qhRw==
Message-ID: <08cf0523-b70f-422b-8125-884ddc21d1ea@kernel.org>
Date: Tue, 4 Jun 2024 23:12:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org,
 syzkaller-bugs@googlegroups.com
References: <0000000000000bf86505f7c6bf0c@google.com>
Content-Language: en-US
From: Chao Yu <chao@kernel.org>
Autocrypt: addr=chao@kernel.org; keydata=
 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
In-Reply-To: <0000000000000bf86505f7c6bf0c@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip On 2023/3/26 13:17, syzbot wrote: > syzbot has found a reproducer for
 the following issue on: > > HEAD commit: 4bdec23f971b Merge tag
 'hwmon-for-v6.3-rc4'
 of git://git.k.. > git tree: upstream > conso [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: syzkaller.appspot.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sEVqX-0004yK-1B
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip

On 2023/3/26 13:17, syzbot wrote:
> syzbot has found a reproducer for the following issue on:
> 
> HEAD commit:    4bdec23f971b Merge tag 'hwmon-for-v6.3-rc4' of git://git.k..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=177bdf41c80000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=ea09b0836073ee4
> dashboard link: https://syzkaller.appspot.com/bug?extid=8b85865808c8908a0d8c
> compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1320ef41c80000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=100b561ec80000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/d61c34161317/disk-4bdec23f.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/6f84b5727488/vmlinux-4bdec23f.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/1279076a5b70/bzImage-4bdec23f.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/c38a9411ccc2/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+8b85865808c8908a0d8c@syzkaller.appspotmail.com
> 
> INFO: task kworker/u4:4:56 blocked for more than 143 seconds.
>        Not tainted 6.3.0-rc3-syzkaller-00322-g4bdec23f971b #0
> "echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
> task:kworker/u4:4    state:D stack:26464 pid:56    ppid:2      flags:0x00004000
> Workqueue: writeback wb_workfn (flush-7:0)
> Call Trace:
>   <TASK>
>   context_switch kernel/sched/core.c:5304 [inline]
>   __schedule+0xc91/0x5770 kernel/sched/core.c:6622
>   schedule+0xde/0x1a0 kernel/sched/core.c:6698
>   schedule_preempt_disabled+0x13/0x20 kernel/sched/core.c:6757
>   rwsem_down_write_slowpath+0x3e2/0x1220 kernel/locking/rwsem.c:1178
>   __down_write_common kernel/locking/rwsem.c:1306 [inline]
>   __down_write kernel/locking/rwsem.c:1315 [inline]
>   down_write+0x1d2/0x200 kernel/locking/rwsem.c:1574
>   f2fs_down_write fs/f2fs/f2fs.h:2207 [inline]
>   f2fs_balance_fs+0x54e/0x6c0 fs/f2fs/segment.c:427
>   f2fs_write_inode+0x582/0xe00 fs/f2fs/inode.c:760
>   write_inode fs/fs-writeback.c:1453 [inline]
>   __writeback_single_inode+0x9f8/0xdc0 fs/fs-writeback.c:1665
>   writeback_sb_inodes+0x54d/0xe70 fs/fs-writeback.c:1891
>   __writeback_inodes_wb+0xc6/0x280 fs/fs-writeback.c:1962
>   wb_writeback+0x7e9/0xa50 fs/fs-writeback.c:2067
>   wb_check_old_data_flush fs/fs-writeback.c:2167 [inline]
>   wb_do_writeback fs/fs-writeback.c:2220 [inline]
>   wb_workfn+0x765/0xfc0 fs/fs-writeback.c:2248
>   process_one_work+0x991/0x15c0 kernel/workqueue.c:2390
>   worker_thread+0x669/0x1090 kernel/workqueue.c:2537
>   kthread+0x2e8/0x3a0 kernel/kthread.c:376
>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
>   </TASK>
> 
> Showing all locks held in the system:
> 1 lock held by rcu_tasks_kthre/12:
>   #0: ffffffff8c794b70 (rcu_tasks.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x31/0xd80 kernel/rcu/tasks.h:510
> 1 lock held by rcu_tasks_trace/13:
>   #0: ffffffff8c794870 (rcu_tasks_trace.tasks_gp_mutex){+.+.}-{3:3}, at: rcu_tasks_one_gp+0x31/0xd80 kernel/rcu/tasks.h:510
> 1 lock held by khungtaskd/28:
>   #0: ffffffff8c7956c0 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x340 kernel/locking/lockdep.c:6495
> 4 locks held by kworker/u4:4/56:
>   #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic64_set arch/x86/include/asm/atomic64_64.h:34 [inline]
>   #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: arch_atomic_long_set include/linux/atomic/atomic-long.h:41 [inline]
>   #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: atomic_long_set include/linux/atomic/atomic-instrumented.h:1280 [inline]
>   #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_data kernel/workqueue.c:639 [inline]
>   #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: set_work_pool_and_clear_pending kernel/workqueue.c:666 [inline]
>   #0: ffff88801750f138 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work+0x87a/0x15c0 kernel/workqueue.c:2361
>   #1: ffffc90001577da8 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work+0x8ae/0x15c0 kernel/workqueue.c:2365
>   #2: ffff8880244ae0e0 (&type->s_umount_key#44){.+.+}-{3:3}, at: trylock_super+0x21/0x110 fs/super.c:414
>   #3: ffff8880200f12a8 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2207 [inline]
>   #3: ffff8880200f12a8 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_balance_fs+0x54e/0x6c0 fs/f2fs/segment.c:427
> 2 locks held by getty/4755:
>   #0: ffff88802be78098 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x26/0x80 drivers/tty/tty_ldisc.c:244
>   #1: ffffc900015a02f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0xef4/0x13e0 drivers/tty/n_tty.c:2177
> 3 locks held by syz-executor470/5084:
> 1 lock held by syz-executor470/5814:
> 
> =============================================
> 
> NMI backtrace for cpu 1
> CPU: 1 PID: 28 Comm: khungtaskd Not tainted 6.3.0-rc3-syzkaller-00322-g4bdec23f971b #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
> Call Trace:
>   <TASK>
>   __dump_stack lib/dump_stack.c:88 [inline]
>   dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
>   nmi_cpu_backtrace+0x29c/0x350 lib/nmi_backtrace.c:113
>   nmi_trigger_cpumask_backtrace+0x2a4/0x300 lib/nmi_backtrace.c:62
>   trigger_all_cpu_backtrace include/linux/nmi.h:148 [inline]
>   check_hung_uninterruptible_tasks kernel/hung_task.c:222 [inline]
>   watchdog+0xe16/0x1090 kernel/hung_task.c:379
>   kthread+0x2e8/0x3a0 kernel/kthread.c:376
>   ret_from_fork+0x1f/0x30 arch/x86/entry/entry_64.S:308
>   </TASK>
> Sending NMI from CPU 1 to CPUs 0:
> NMI backtrace for cpu 0
> CPU: 0 PID: 5814 Comm: syz-executor470 Not tainted 6.3.0-rc3-syzkaller-00322-g4bdec23f971b #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/02/2023
> RIP: 0010:__sanitizer_cov_trace_pc+0x3b/0x70 kernel/kcov.c:207
> Code: 81 e1 00 01 00 00 65 48 8b 14 25 80 b8 03 00 a9 00 01 ff 00 74 0e 85 c9 74 35 8b 82 74 15 00 00 85 c0 74 2b 8b 82 50 15 00 00 <83> f8 02 75 20 48 8b 8a 58 15 00 00 8b 92 54 15 00 00 48 8b 01 48
> RSP: 0018:ffffc9000444f8b8 EFLAGS: 00000246
> RAX: 0000000000000000 RBX: ffff88802bb0af58 RCX: 0000000000000000
> RDX: ffff888026079d40 RSI: ffffffff81b30401 RDI: 0000000000000001
> RBP: ffffea0001b5f3c0 R08: 0000000000000001 R09: 0000000000000000
> R10: 0000000000000000 R11: 0000000000000000 R12: 0000000000000000
> R13: 0000000000000000 R14: ffffc9000444fa48 R15: 0000000000000001
> FS:  00007ff4d3fdc700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007ff4cfbbb000 CR3: 00000000294d8000 CR4: 0000000000350ef0
> Call Trace:
>   <TASK>
>   truncate_inode_folio+0x51/0x70 mm/truncate.c:197
>   shmem_undo_range+0x33e/0x1340 mm/shmem.c:942
>   shmem_truncate_range mm/shmem.c:1041 [inline]
>   shmem_evict_inode+0x32f/0xb60 mm/shmem.c:1156
>   evict+0x2ed/0x6b0 fs/inode.c:665
>   iput_final fs/inode.c:1748 [inline]
>   iput.part.0+0x50a/0x740 fs/inode.c:1774
>   iput+0x5c/0x80 fs/inode.c:1764
>   dentry_unlink_inode+0x2b1/0x460 fs/dcache.c:401
>   __dentry_kill+0x3c0/0x640 fs/dcache.c:607
>   dentry_kill fs/dcache.c:733 [inline]
>   dput+0x865/0xe10 fs/dcache.c:913
>   __fput+0x3cc/0xa90 fs/file_table.c:329
>   task_work_run+0x16f/0x270 kernel/task_work.c:179
>   ptrace_notify+0x118/0x140 kernel/signal.c:2354
>   ptrace_report_syscall include/linux/ptrace.h:411 [inline]
>   ptrace_report_syscall_exit include/linux/ptrace.h:473 [inline]
>   syscall_exit_work kernel/entry/common.c:251 [inline]
>   syscall_exit_to_user_mode_prepare+0x129/0x220 kernel/entry/common.c:278
>   __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
>   syscall_exit_to_user_mode+0xd/0x50 kernel/entry/common.c:296
>   do_syscall_64+0x46/0xb0 arch/x86/entry/common.c:86
>   entry_SYSCALL_64_after_hwframe+0x63/0xcd
> RIP: 0033:0x7ff4d3feca4b
> Code: 0f 05 48 3d 00 f0 ff ff 77 45 c3 0f 1f 40 00 48 83 ec 18 89 7c 24 0c e8 03 fd ff ff 8b 7c 24 0c 41 89 c0 b8 03 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 35 44 89 c7 89 44 24 0c e8 41 fd ff ff 8b 44
> RSP: 002b:00007ff4d3fdc160 EFLAGS: 00000293 ORIG_RAX: 0000000000000003
> RAX: 0000000000000000 RBX: 0000000000000003 RCX: 00007ff4d3feca4b
> RDX: 0000000000000010 RSI: 0000000000004c00 RDI: 0000000000000003
> RBP: 0000000000000004 R08: 0000000000000000 R09: 00000000000105f8
> R10: 0000000000000000 R11: 0000000000000293 R12: 00007ff4d3fdc6b8
> R13: 00007ff4d3fdc190 R14: 00007ff4d3fdc1d0 R15: 0000000000000010
>   </TASK>
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
