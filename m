Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A05A979631
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 15 Sep 2024 11:45:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1splp1-0005ys-Md;
	Sun, 15 Sep 2024 09:45:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3sqzmZgkbAOMXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sploz-0005yk-Jy for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Sep 2024 09:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zCBaiXs1WTTT+pMc0IfLWtHgFvIICs1MjC65CLyy1KQ=; b=IgiFBryzuzzFG3C8OZJSWedVJL
 yPORFujswbenQlFVOVV8Th4GbE3qGSNln90NECxS2JlOF6a9vaOykg5bYkcepBomhNiUfxDWQjseE
 GCf/otKvL9R4fi6vfNdHkzoT4fPm32nIDWAlK4JrovSfZdBawdkhPqtoci82Lsz95bnk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zCBaiXs1WTTT+pMc0IfLWtHgFvIICs1MjC65CLyy1KQ=; b=S
 93aIPBkTkkeT02cWgLPGqFdV2xOazd8lE0iC0aeE0LhtfuqwnMht1RWJx2aH1zHynzIECO5WJMLVW
 HKK00CmBkYTP5D6HC68EJhvIxx3doy7FAXH7epFPfGoSVoutGBBq9EcPuDKY5iW19mM+58nNPW6Xe
 4FGE9gZGs3FajfPE=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sploy-0000SU-TB for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 15 Sep 2024 09:45:34 +0000
Received: by mail-il1-f197.google.com with SMTP id
 e9e14a558f8ab-3a08f88aeceso38504795ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 15 Sep 2024 02:45:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1726393522; x=1726998322;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=zCBaiXs1WTTT+pMc0IfLWtHgFvIICs1MjC65CLyy1KQ=;
 b=WqK66m33Qa3rNWT7GBhFpUoDL+UZhBU7iCqxGoDPahv36620VEICCdfdH2pue6t0yu
 xzuCL/s8Qr+zBQYvBF3oAnkbfH6Q0QUxpoOjTSHM88jFuDTpdV5N5cLG101HOjAvq2Bb
 biafUNdujj+dDYDbQtM8hPCSAIOSi7z07k9/oNTf9xR+Q3tQAPdlunqxi1NxVqs3HUme
 fWyaS9ShnHgm7m1WEjKwy9DssP86uCXStuLEj9sF7lYxdElQyPytdeCPKsxfCwVxuHMe
 ISo6R4S1Lk4gc7965UG4017WXfAHpb2D2LUg0NYbZ8vUVdyMN5F9PEfc/2OrNNczOb8z
 i9cg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXrSuxaeKWBU4X5BQJnBp4LnBZ+kxIaRICXdu1n8mNfG6vjl/HmJGwT6TXRBwQQXFYOqdg/5i7tLwJv+XEaows1@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz0wPWlaJPLs1klx5VkTaiCdz/ivsjcBt6hFkdoq6sh6wCLnijf
 e+Rf3wesbU3C4DBYVE6c27tEOj7tdWcpkJZI/FgcAqnRS0evR4WHhYCiGVlBxS27AyfPmg9AZkI
 /yAFfCdSQIJIdd7zDswMjadk+f4UGyB64RrRzS9epIgs1WRYj0lonctA=
X-Google-Smtp-Source: AGHT+IErm49NPSj+LGQmLNrQ4nKC+VhbDwr+M4c8BTb9MYUg2uWbhnY8lUKaXcOj04SO6TSHmrITePrVyfoI7hW931plnPwhVmpe
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1946:b0:39d:351a:d0a2 with SMTP id
 e9e14a558f8ab-3a084975f6fmr102029185ab.25.1726393522053; Sun, 15 Sep 2024
 02:45:22 -0700 (PDT)
Date: Sun, 15 Sep 2024 02:45:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a00659062225501a@google.com>
From: syzbot <syzbot+6b03a52da637aa5db978@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 0babf683783d
 Merge tag 'pinctrl-v6.11-4' of git://git.kern.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=113b749f980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (-0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1sploy-0000SU-TB
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_file_open
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

HEAD commit:    0babf683783d Merge tag 'pinctrl-v6.11-4' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=113b749f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1c9e296880039df9
dashboard link: https://syzkaller.appspot.com/bug?extid=6b03a52da637aa5db978
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/aab0f0b09dd6/disk-0babf683.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/b97896b7812c/vmlinux-0babf683.xz
kernel image: https://storage.googleapis.com/syzbot-assets/340ce283efd3/bzImage-0babf683.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+6b03a52da637aa5db978@syzkaller.appspotmail.com

INFO: task syz.0.247:7777 blocked for more than 143 seconds.
      Not tainted 6.11.0-rc7-syzkaller-00149-g0babf683783d #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.247       state:D stack:27360 pid:7777  tgid:7765  ppid:7280   flags:0x00000004
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
 down_write+0x1d7/0x220 kernel/locking/rwsem.c:1580
 inode_lock include/linux/fs.h:800 [inline]
 finish_preallocate_blocks fs/f2fs/file.c:561 [inline]
 f2fs_file_open+0x11b/0x3a0 fs/f2fs/file.c:614
 do_dentry_open+0x970/0x1440 fs/open.c:959
 vfs_open+0x3e/0x330 fs/open.c:1089
 do_open fs/namei.c:3727 [inline]
 path_openat+0x2b3e/0x3470 fs/namei.c:3886
 do_filp_open+0x235/0x490 fs/namei.c:3913
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1416
 do_sys_open fs/open.c:1431 [inline]
 __do_sys_openat fs/open.c:1447 [inline]
 __se_sys_openat fs/open.c:1442 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1442
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f419437def9
RSP: 002b:00007f4195217038 EFLAGS: 00000246 ORIG_RAX: 0000000000000101
RAX: ffffffffffffffda RBX: 00007f4194536130 RCX: 00007f419437def9
RDX: 0000000000020242 RSI: 0000000020000380 RDI: ffffffffffffff9c
RBP: 00007f41943f0b76 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 0000000000000001 R14: 00007f4194536130 R15: 00007ffe6479cb08
 </TASK>

Showing all locks held in the system:
4 locks held by kworker/u8:1/12:
 #0: ffff88801ee93148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff88801ee93148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc90000117d00 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc90000117d00 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffff8880656920e0 (&type->s_umount_key#67){++++}-{3:3}, at: super_trylock_shared+0x22/0xf0 fs/super.c:562
 #3: ffff88806ce512a0 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2175 [inline]
 #3: ffff88806ce512a0 (&sbi->gc_lock){+.+.}-{3:3}, at: f2fs_balance_fs+0x5b0/0x7a0 fs/f2fs/segment.c:440
1 lock held by khungtaskd/30:
 #0: ffffffff8e738320 (rcu_read_lock){....}-{1:2}, at: rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
 #0: ffffffff8e738320 (rcu_read_lock){....}-{1:2}, at: rcu_read_lock include/linux/rcupdate.h:838 [inline]
 #0: ffffffff8e738320 (rcu_read_lock){....}-{1:2}, at: debug_show_all_locks+0x55/0x2a0 kernel/locking/lockdep.c:6626
3 locks held by kworker/1:1/51:
 #0: ffff88801a880948 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff88801a880948 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc90000bb7d00 (deferred_process_work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc90000bb7d00 (deferred_process_work){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: switchdev_deferred_process_work+0xe/0x20 net/switchdev/switchdev.c:104
5 locks held by kworker/u8:4/63:
 #0: ffff88801b6e3148 ((wq_completion)netns){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff88801b6e3148 ((wq_completion)netns){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc900015efd00 (net_cleanup_work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc900015efd00 (net_cleanup_work){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffffffff8fa6d250 (pernet_ops_rwsem){++++}-{3:3}, at: cleanup_net+0x16a/0xcc0 net/core/net_namespace.c:594
 #3: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: cleanup_net+0x6af/0xcc0 net/core/net_namespace.c:630
 #4: ffffffff8e73d6f8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: exp_funnel_lock kernel/rcu/tree_exp.h:328 [inline]
 #4: ffffffff8e73d6f8 (rcu_state.exp_mutex){+.+.}-{3:3}, at: synchronize_rcu_expedited+0x451/0x830 kernel/rcu/tree_exp.h:958
3 locks held by kworker/u8:5/1065:
 #0: ffff88802fc87948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff88802fc87948 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc90004007d00 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc90004007d00 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: addrconf_dad_work+0xd0/0x16f0 net/ipv6/addrconf.c:4194
3 locks held by kworker/u8:8/4377:
3 locks held by kworker/u8:9/4405:
 #0: ffff88801a889148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3206 [inline]
 #0: ffff88801a889148 ((wq_completion)events_unbound){+.+.}-{0:0}, at: process_scheduled_works+0x90a/0x1830 kernel/workqueue.c:3312
 #1: ffffc9000c787d00 ((linkwatch_work).work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3207 [inline]
 #1: ffffc9000c787d00 ((linkwatch_work).work){+.+.}-{0:0}, at: process_scheduled_works+0x945/0x1830 kernel/workqueue.c:3312
 #2: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: linkwatch_event+0xe/0x60 net/core/link_watch.c:276
1 lock held by syslogd/4656:
2 locks held by getty/4974:
 #0: ffff88803093b0a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc900031232f0 (&ldata->atomic_read_lock){+.+.}-{3:3}, at: n_tty_read+0x6ac/0x1e00 drivers/tty/n_tty.c:2211
6 locks held by syz.2.204/7247:
 #0: ffff8880b893e998 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:560
 #1: ffffe8ffffd7e008 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x3a7/0x770 kernel/sched/psi.c:977
 #2: ffffe8ffffd7e008 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_switch+0x3a7/0x770 kernel/sched/psi.c:977
 #3: ffff8880b8928948 (&per_cpu_ptr(group->pcpu, cpu)->seq){-.-.}-{0:0}, at: psi_task_change+0xfd/0x280 kernel/sched/psi.c:913
 #4: ffffffff9a383d68 (&obj_hash[i].lock){-.-.}-{2:2}, at: debug_object_activate+0x16d/0x510 lib/debugobjects.c:709
 #5: ffff8880b883e998 (&rq->__lock){-.-.}-{2:2}, at: raw_spin_rq_lock_nested+0x2a/0x140 kernel/sched/core.c:560
5 locks held by syz.0.247/7776:
2 locks held by syz.0.247/7777:
 #0: ffff888065692420 (sb_writers#18){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:515
 #1: ffff88805e06eaa8 (&sb->s_type->i_mutex_key#26){++++}-{3:3}, at: inode_lock include/linux/fs.h:800 [inline]
 #1: ffff88805e06eaa8 (&sb->s_type->i_mutex_key#26){++++}-{3:3}, at: finish_preallocate_blocks fs/f2fs/file.c:561 [inline]
 #1: ffff88805e06eaa8 (&sb->s_type->i_mutex_key#26){++++}-{3:3}, at: f2fs_file_open+0x11b/0x3a0 fs/f2fs/file.c:614
2 locks held by syz.0.349/8998:
 #0: ffff8880656920e0 (&type->s_umount_key#67){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff8880656920e0 (&type->s_umount_key#67){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff88802589a7d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff88802589a7d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790
2 locks held by syz.2.427/9330:
 #0: ffff8880656920e0 (&type->s_umount_key#67){++++}-{3:3}, at: __super_lock fs/super.c:58 [inline]
 #0: ffff8880656920e0 (&type->s_umount_key#67){++++}-{3:3}, at: super_lock+0x27c/0x400 fs/super.c:120
 #1: ffff88802589a7d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: bdi_down_write_wb_switch_rwsem fs/fs-writeback.c:388 [inline]
 #1: ffff88802589a7d0 (&bdi->wb_switch_rwsem){+.+.}-{3:3}, at: sync_inodes_sb+0x274/0xb20 fs/fs-writeback.c:2790
1 lock held by syz-executor/9333:
 #0: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock net/core/rtnetlink.c:79 [inline]
 #0: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x6e6/0xcf0 net/core/rtnetlink.c:6644
1 lock held by syz-executor/9335:
 #0: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock net/core/rtnetlink.c:79 [inline]
 #0: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x6e6/0xcf0 net/core/rtnetlink.c:6644
7 locks held by syz-executor/9422:
 #0: ffff8880355d6420 (sb_writers#8){.+.+}-{0:0}, at: file_start_write include/linux/fs.h:2882 [inline]
 #0: ffff8880355d6420 (sb_writers#8){.+.+}-{0:0}, at: vfs_write+0x227/0xc90 fs/read_write.c:586
 #1: ffff88807d04d088 (&of->mutex){+.+.}-{3:3}, at: kernfs_fop_write_iter+0x1eb/0x500 fs/kernfs/file.c:325
 #2: ffff888027e72878 (kn->active#51){.+.+}-{0:0}, at: kernfs_fop_write_iter+0x20f/0x500 fs/kernfs/file.c:326
 #3: ffffffff8f314108 (nsim_bus_dev_list_lock){+.+.}-{3:3}, at: new_device_store+0x1b4/0x890 drivers/net/netdevsim/bus.c:166
 #4: ffff8880555910e8 (&dev->mutex){....}-{3:3}, at: device_lock include/linux/device.h:1009 [inline]
 #4: ffff8880555910e8 (&dev->mutex){....}-{3:3}, at: __device_attach+0x8e/0x520 drivers/base/dd.c:1004
 #5: ffff888065000250 (&devlink->lock_key#30){+.+.}-{3:3}, at: nsim_drv_probe+0xcb/0xb80 drivers/net/netdevsim/dev.c:1534
 #6: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: nsim_init_netdevsim drivers/net/netdevsim/netdev.c:678 [inline]
 #6: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: nsim_create+0x408/0x890 drivers/net/netdevsim/netdev.c:750
1 lock held by syz-executor/9536:
 #0: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: rtnl_lock net/core/rtnetlink.c:79 [inline]
 #0: ffffffff8fa79e08 (rtnl_mutex){+.+.}-{3:3}, at: rtnetlink_rcv_msg+0x6e6/0xcf0 net/core/rtnetlink.c:6644
1 lock held by rm/9618:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 30 Comm: khungtaskd Not tainted 6.11.0-rc7-syzkaller-00149-g0babf683783d #0
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
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 63 Comm: kworker/u8:4 Not tainted 6.11.0-rc7-syzkaller-00149-g0babf683783d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 08/06/2024
Workqueue: netns cleanup_net
RIP: 0010:check_wait_context kernel/locking/lockdep.c:4772 [inline]
RIP: 0010:__lock_acquire+0x5ad/0x2040 kernel/locking/lockdep.c:5092
Code: 00 00 00 00 00 fc ff df 90 0f 0b 90 90 90 31 db 48 81 c3 c4 00 00 00 48 89 d8 48 c1 e8 03 0f b6 04 10 84 c0 0f 85 79 12 00 00 <0f> b6 2b 41 0f b6 04 16 84 c0 0f 85 8d 12 00 00 41 8b 1f 81 e3 ff
RSP: 0018:ffffc900015ef490 EFLAGS: 00000046
RAX: 0000000000000000 RBX: ffffffff939701cc RCX: ffffffff816fd764
RDX: dffffc0000000000 RSI: 0000000000000008 RDI: ffffffff93fa6840
RBP: 0000000000000014 R08: ffffffff93fa6847 R09: 1ffffffff27f4d08
R10: dffffc0000000000 R11: fffffbfff27f4d09 R12: ffff88801db6bc00
R13: 0000000000000021 R14: 1ffff11003b6d8f4 R15: ffff88801db6c7a0
FS:  0000000000000000(0000) GS:ffff8880b8800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffef9526cc0 CR3: 000000000e534000 CR4: 00000000003506f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <NMI>
 </NMI>
 <TASK>
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5759
 rcu_lock_acquire include/linux/rcupdate.h:326 [inline]
 rcu_read_lock include/linux/rcupdate.h:838 [inline]
 __rhashtable_remove_fast include/linux/rhashtable.h:1084 [inline]
 rhashtable_remove_fast+0x17f/0xe20 include/linux/rhashtable.h:1122
 __vlan_del+0x4a8/0x8e0 net/bridge/br_vlan.c:417
 __vlan_flush+0x1b1/0x3e0 net/bridge/br_vlan.c:459
 nbp_vlan_flush+0x108/0x1b0 net/bridge/br_vlan.c:1373
 del_nbp+0x651/0xb40 net/bridge/br_if.c:356
 br_dev_delete+0x6e/0x100 net/bridge/br_if.c:386
 br_net_exit_batch_rtnl+0xf2/0x1a0 net/bridge/br.c:369
 cleanup_net+0x709/0xcc0 net/core/net_namespace.c:633
 process_one_work kernel/workqueue.c:3231 [inline]
 process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
 worker_thread+0x870/0xd30 kernel/workqueue.c:3393
 kthread+0x2f0/0x390 kernel/kthread.c:389
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
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
