Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3766CCA9330
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 05 Dec 2025 21:04:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JJJabYmIOo4pp0E76Jnrs03sxiCOnJ282/yKqNYIrSk=; b=jLwEXGmRcnOmDIctkpROWn2Znb
	bgduzcxDNYc7aV8nRB4ckG1wo7XGIf9oilIgGt2DbmT0tsHoF7ia8Zw5/oS+B7EXud8+dMd4iaMU9
	3CpZhLpUTsghQsz4CKDSexCgI7geQ0fz+lkLqgmn9QDcUjfdgwemsj4bdHlW5DhdDx2o=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vRc2l-000171-9v;
	Fri, 05 Dec 2025 20:04:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3-SwzaQkbAHAgmnYOZZSfOddWR.UccUZSigSfQcbhSbh.Qca@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1vRc2j-00016n-Uo for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Dec 2025 20:04:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3khHIubM8YEWdJUe/bscGt4DrDOtFjOBY0BIlMeWhB4=; b=nA19NfBXD2ghLu9yr47nqLDiHZ
 TeAuV52LbsaXeliKldT/MENX2bwmltdwfJtF9d9Lq3KAGsRyDTOeIyDO4P7HIi7hZ3qPLiMesMzVn
 hTP9BG3GhTS2BamQw2sBdML7ggw0HWRTi7IIA8Zd7BSit3p081E8t2u+VFK0SXgwX3aY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=3khHIubM8YEWdJUe/bscGt4DrDOtFjOBY0BIlMeWhB4=; b=N
 QzjH8lI3xlfwPkmw9UkDCJV8F9wNLvnw1iNH94L6uGHnm6JPY6MnZYgltiYjT5tNySzzHzWWNgfot
 bFeziFD0TghltNuZh9JsS/yovoSufU3eXFOizfwEj04dd/ILVxnW17FknhiTDDyr6OFBjdhPXEgsD
 Je8GgCsuBGyOzrFo=;
Received: from mail-pg1-f208.google.com ([209.85.215.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vRc2i-0000kP-0x for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 05 Dec 2025 20:04:42 +0000
Received: by mail-pg1-f208.google.com with SMTP id
 41be03b00d2f7-bce224720d8so4436767a12.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 05 Dec 2025 12:04:39 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764965069; x=1765569869;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=3khHIubM8YEWdJUe/bscGt4DrDOtFjOBY0BIlMeWhB4=;
 b=ETWSHAYqbs/Hh+XbE/RAV8CVJsIzXIbGLQIc9snm09RTcpR88vMqA5XtjQm5U0yItm
 OsNzzUhnnbD+hIThOK88lO5RDsIp0NGcSBGDGqjpU+mJm95w9TJhY0uGaV8DxTmKAI2q
 HMaM0C6Qfn/kj8swoUZTleDfnEe+p4JIPhLdfSDmYqjTqdgpPly7UacmU618n18Xh5rb
 wsxbbgo0VL9EI7H/HL+/zQqXI3sJdGBCC2oD0qyRzrgLfAIGyXPjl/wEo7zRi3Wro2/J
 xmP+HK1/TapzFek0cSYRJpkgfY0chpZ3k3Q/Kkx5xlpanOYqqHH5K+BZf2VTmwOI550/
 lsKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbrnT7eIS6VTMHFo+DGvIJGTkP5pFRshd51IgFAFEC6tRRNiRzOz22P8l6ik4l1+UK4P5CRY16+zLre+y3BOjh@lists.sourceforge.net
X-Gm-Message-State: AOJu0YylLZp0GuOhvkyxQjzPhnkxmnnYa0QI0NvGAdbPYYZDqPE2tBdW
 o8TiOJM3IO1Rlp53y6fCcF17Kc0k7Wlz4yBOqrsDaZzhP3VV3ngYgMyZ+O2N6k/1m3WWKqZh/Qf
 LtVQmY6Rc5lfQnfcZwBplTOTDI74H2PVjgqQqSZKzjM4efyoWZR0p7VY/l4Q=
X-Google-Smtp-Source: AGHT+IEy/rzAsKF3jENU0Je7C5C9xBVgjfkJD0ZjrR/JJouCWGAMashOJALQ+VDX0wbvuP2mYvejRSAT0ABY51OywXWJV1N9+E20
MIME-Version: 1.0
X-Received: by 2002:a05:6820:4de1:b0:659:9a49:90c9 with SMTP id
 006d021491bc7-6599a9866dcmr116222eaf.72.1764961529222; Fri, 05 Dec 2025
 11:05:29 -0800 (PST)
Date: Fri, 05 Dec 2025 11:05:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <69332cf9.a70a0220.243dc6.0011.GAE@google.com>
From: syzbot <syzbot+4235e4d7b6fd75704528@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 7d0a66e4bb90
 Linux 6.18 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=14a682b4580000
 kernel config: https://syzkaller.appspot.com/x/.config?x=38a0c4cddc8461 [...]
 Content analysis details:   (0.5 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.208 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vRc2i-0000kP-0x
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_release_file (3)
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

HEAD commit:    7d0a66e4bb90 Linux 6.18
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=14a682b4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=38a0c4cddc846161
dashboard link: https://syzkaller.appspot.com/bug?extid=4235e4d7b6fd75704528
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=13492192580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12a682b4580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/0ea732cc9ee6/disk-7d0a66e4.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/7956b4b2019e/vmlinux-7d0a66e4.xz
kernel image: https://storage.googleapis.com/syzbot-assets/2e344e8da33c/bzImage-7d0a66e4.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/40c651c753a5/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=1030a512580000)

Bisection is inconclusive: the first bad commit could be any of:

2aac2538a97d f2fs: do sanity check on xattr node footer in f2fs_get_xnode_page()
1788971e0bfa f2fs: introduce FAULT_INCONSISTENT_FOOTER
1cf6b5670af1 f2fs: do sanity check on inode footer in f2fs_get_inode_page()
986c50f6bca1 f2fs: fix to avoid accessing uninitialized curseg
c2ecba026586 f2fs: control nat_bits feature via mount option
19426c4988aa Revert "f2fs: rebuild nat_bits during umount"

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1214e512580000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+4235e4d7b6fd75704528@syzkaller.appspotmail.com

INFO: task syz.0.17:6101 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.17        state:D stack:25160 pid:6101  tgid:6101  ppid:5984   task_flags:0x400040 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x16f3/0x4c20 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 rt_mutex_schedule+0x77/0xf0 kernel/sched/core.c:7307
 rt_mutex_slowlock_block kernel/locking/rtmutex.c:1647 [inline]
 __rt_mutex_slowlock kernel/locking/rtmutex.c:1721 [inline]
 __rt_mutex_slowlock_locked+0x1e04/0x25e0 kernel/locking/rtmutex.c:1760
 rt_mutex_slowlock+0xb5/0x160 kernel/locking/rtmutex.c:1800
 __rt_mutex_lock kernel/locking/rtmutex.c:1815 [inline]
 rwbase_write_lock+0x14f/0x750 kernel/locking/rwbase_rt.c:244
 inode_lock include/linux/fs.h:980 [inline]
 f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
 __fput+0x45b/0xa80 fs/file_table.c:468
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xe9/0x130 kernel/entry/common.c:43
 exit_to_user_mode_prepare include/linux/irq-entry-common.h:225 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:175 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:210 [inline]
 do_syscall_64+0x2bd/0xfa0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7059d0f749
RSP: 002b:00007ffef7d9ee78 EFLAGS: 00000246 ORIG_RAX: 00000000000001b4
RAX: 0000000000000000 RBX: 00007f7059f67da0 RCX: 00007f7059d0f749
RDX: 0000000000000000 RSI: 000000000000001e RDI: 0000000000000003
RBP: 00007f7059f67da0 R08: 0000000000000000 R09: 00000006f7d9f16f
R10: 00007f7059f67cb0 R11: 0000000000000246 R12: 000000000002e2cb
R13: 00007ffef7d9ef70 R14: ffffffffffffffff R15: 00007ffef7d9ef90
 </TASK>
INFO: task syz.0.17:6102 blocked for more than 143 seconds.
      Not tainted syzkaller #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz.0.17        state:D stack:24216 pid:6102  tgid:6101  ppid:5984   task_flags:0x400140 flags:0x00080002
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5325 [inline]
 __schedule+0x16f3/0x4c20 kernel/sched/core.c:6929
 __schedule_loop kernel/sched/core.c:7011 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:7026
 schedule_timeout+0x9a/0x270 kernel/time/sleep_timeout.c:75
 do_wait_for_common kernel/sched/completion.c:100 [inline]
 __wait_for_common kernel/sched/completion.c:121 [inline]
 wait_for_common kernel/sched/completion.c:132 [inline]
 wait_for_completion+0x2bf/0x5d0 kernel/sched/completion.c:153
 f2fs_issue_checkpoint+0x382/0x610 fs/f2fs/checkpoint.c:-1
 f2fs_unlink+0x5eb/0xac0 fs/f2fs/namei.c:603
 vfs_unlink+0x39a/0x660 fs/namei.c:4673
 do_unlinkat+0x345/0x570 fs/namei.c:4737
 __do_sys_unlinkat fs/namei.c:4778 [inline]
 __se_sys_unlinkat fs/namei.c:4771 [inline]
 __x64_sys_unlinkat+0xd3/0xf0 fs/namei.c:4771
 do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
 do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f7059d0f749
RSP: 002b:00007f705937e038 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
RAX: ffffffffffffffda RBX: 00007f7059f65fa0 RCX: 00007f7059d0f749
RDX: 0000000000000000 RSI: 0000200000000040 RDI: ffffffffffffff9c
RBP: 00007f7059d93f91 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007f7059f66038 R14: 00007f7059f65fa0 R15: 00007ffef7d9ed18
 </TASK>

Showing all locks held in the system:
3 locks held by kworker/0:1/10:
 #0: ffff88813ff55138 ((wq_completion)events){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88813ff55138 ((wq_completion)events){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc900000f7ba0 (deferred_process_work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc900000f7ba0 (deferred_process_work){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: switchdev_deferred_process_work+0xe/0x20 net/switchdev/switchdev.c:104
1 lock held by khungtaskd/38:
 #0: ffffffff8d5aa880 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8d5aa880 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:867 [inline]
 #0: ffffffff8d5aa880 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6775
3 locks held by kworker/u8:2/43:
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90000b47ba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90000b47ba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888036f820d0 (&type->s_umount_key#54){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
3 locks held by kworker/u8:3/57:
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc9000123fba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc9000123fba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff88803dffa0d0 (&type->s_umount_key#54){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
3 locks held by kworker/u8:4/69:
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc9000155fba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc9000155fba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff88802416e0d0 (&type->s_umount_key#54){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
3 locks held by kworker/u8:5/172:
 #0: ffff88814cbaf138 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88814cbaf138 ((wq_completion)ipv6_addrconf){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90003a6fba0 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90003a6fba0 ((work_completion)(&(&ifa->dad_work)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: rtnl_net_lock include/linux/rtnetlink.h:130 [inline]
 #2: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: addrconf_dad_work+0x119/0x15a0 net/ipv6/addrconf.c:4194
3 locks held by kworker/u8:7/1400:
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90005437ba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90005437ba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff888028d100d0 (&type->s_umount_key#54){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
3 locks held by kworker/u8:8/1477:
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff888142e88938 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc90005777ba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc90005777ba0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffff88803a6740d0 (&type->s_umount_key#54){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:562
3 locks held by kworker/u8:9/4073:
 #0: ffff88813ff69938 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3238 [inline]
 #0: ffff88813ff69938 ((wq_completion)events_unbound#2){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3346
 #1: ffffc9000ebf7ba0 ((linkwatch_work).work){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3239 [inline]
 #1: ffffc9000ebf7ba0 ((linkwatch_work).work){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3346
 #2: ffffffff8e863d78 (rtnl_mutex){+.+.}-{4:4}, at: linkwatch_event+0xe/0x60 net/core/link_watch.c:303
2 locks held by getty/5558:
 #0: ffff88823bf388a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc90003e762e0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x444/0x1400 drivers/tty/n_tty.c:2222
3 locks held by kworker/1:3/5860:
4 locks held by kworker/0:4/6093:
1 lock held by syz.0.17/6101:
 #0: ffff8880494f9478 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff8880494f9478 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.0.17/6102:
 #0: ffff88803a674480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff8880494f8af8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff8880494f8af8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff8880494f9478 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff8880494f9478 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
4 locks held by f2fs_ckpt-7:0/6122:
1 lock held by syz.1.18/6166:
 #0: ffff8880494fba78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff8880494fba78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.1.18/6167:
 #0: ffff888028d10480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff8880494fb0f8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff8880494fb0f8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff8880494fba78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff8880494fba78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
2 locks held by f2fs_ckpt-7:1/6171:
1 lock held by syz.2.19/6193:
 #0: ffff8880494fe078 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff8880494fe078 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.2.19/6194:
 #0: ffff88803dffa480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff8880494fd6f8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff8880494fd6f8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff8880494fe078 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff8880494fe078 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
3 locks held by f2fs_ckpt-7:2/6198:
1 lock held by syz.3.20/6226:
 #0: ffff888058db8178 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff888058db8178 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.3.20/6227:
 #0: ffff88802416e480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff8880494ff378 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff8880494ff378 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff888058db8178 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff888058db8178 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
3 locks held by f2fs_ckpt-7:3/6232:
1 lock held by syz.4.21/6262:
 #0: ffff888058db8af8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff888058db8af8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.4.21/6263:
 #0: ffff888036f82480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff888049582778 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff888049582778 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff888058db8af8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff888058db8af8 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
4 locks held by f2fs_ckpt-7:4/6267:
1 lock held by syz.5.22/6297:
 #0: ffff888049584d78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff888049584d78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.5.22/6298:
 #0: ffff888023d72480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff8880495843f8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff8880495843f8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff888049584d78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff888049584d78 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
2 locks held by f2fs_ckpt-7:5/6302:
1 lock held by syz.6.23/6339:
 #0: ffff888058dba778 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #0: ffff888058dba778 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: f2fs_release_file+0xe3/0x150 fs/f2fs/file.c:2063
3 locks held by syz.6.23/6340:
 #0: ffff88803128e480 (sb_writers#12){.+.+}-{0:0}, at: mnt_want_write+0x41/0x90 fs/namespace.c:499
 #1: ffff888058db9df8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:1025 [inline]
 #1: ffff888058db9df8 (&type->i_mutex_dir_key#8/1){+.+.}-{4:4}, at: do_unlinkat+0x1c7/0x570 fs/namei.c:4724
 #2: ffff888058dba778 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: inode_lock include/linux/fs.h:980 [inline]
 #2: ffff888058dba778 (&sb->s_type->i_mutex_key#20){+.+.}-{4:4}, at: vfs_unlink+0xf2/0x660 fs/namei.c:4662
5 locks held by f2fs_ckpt-7:6/6344:
1 lock held by syz-executor/6347:

=============================================

NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 38 Comm: khungtaskd Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:160 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:332 [inline]
 watchdog+0xf60/0xfa0 kernel/hung_task.c:495
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 1 to CPUs 0:
NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 6093 Comm: kworker/0:4 Not tainted syzkaller #0 PREEMPT_{RT,(full)} 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/25/2025
Workqueue: events_power_efficient neigh_periodic_work
RIP: 0010:check_preemption_disabled+0x12/0x120 lib/smp_processor_id.c:13
Code: 0f 1f 84 00 00 00 00 00 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 90 55 41 57 41 56 53 48 83 ec 10 65 48 8b 05 ce f4 e1 06 <48> 89 44 24 08 65 8b 05 d6 f4 e1 06 65 8b 0d cb f4 e1 06 f7 c1 ff
RSP: 0018:ffffc9000402f7c8 EFLAGS: 00000082
RAX: 36eecfcdf4ec5100 RBX: 0000000000000000 RCX: 36eecfcdf4ec5100
RDX: 0000000000000000 RSI: ffffffff8cf66051 RDI: ffffffff8b3de060
RBP: ffffffff81849131 R08: 0000000000000000 R09: ffffffff81849131
R10: dffffc0000000000 R11: fffffbfff1dac92f R12: 0000000000000002
R13: ffffffff8d5aa880 R14: 0000000000000000 R15: 0000000000000246
FS:  0000000000000000(0000) GS:ffff888126df4000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f96172835c0 CR3: 000000003c65c000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 lockdep_recursion_finish kernel/locking/lockdep.c:470 [inline]
 lock_acquire+0x130/0x360 kernel/locking/lockdep.c:5870
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:867 [inline]
 __local_bh_disable_ip+0x2fb/0x540 kernel/softirq.c:174
 local_bh_disable include/linux/bottom_half.h:20 [inline]
 write_lock_bh include/linux/rwlock_rt.h:98 [inline]
 neigh_periodic_work+0xc5c/0xe90 net/core/neighbour.c:1042
 process_one_work kernel/workqueue.c:3263 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3346
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3427
 kthread+0x711/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
F2FS-fs (loop7): inject read IO error in f2fs_read_end_io of blk_update_request+0x57e/0xe60 block/blk-mq.c:998
F2FS-fs (loop7): inject read IO error in f2fs_read_end_io of blk_update_request+0x57e/0xe60 block/blk-mq.c:998


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

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
