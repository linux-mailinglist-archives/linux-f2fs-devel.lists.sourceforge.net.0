Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEA8CAF8F74
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  4 Jul 2025 12:08:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ksTECCHQl9aLqJz5vH1lqX2mKe26xBof2mP3O2znFBY=; b=b+FyHYSxLbQFNQQ+mpmw7U11Ck
	ZwcXc5nAKl1vHukheCaYqJVkyTcSGZJReQJ1HauXV4Ds2C3xLP2RHiKMPRa264yUkgqhJOWbhNiuN
	WWh/KCpMtNUDiVQ5fRhd7SyfpeHY2Z7Hjxcz9iEKVUv/tuyTWB3o0S9AYQPXYprl3v1g=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uXdKe-0006nA-9R;
	Fri, 04 Jul 2025 10:07:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <35qdnaAkbAB8NTUF5GG9M5KKD8.BJJBG9PN9M7JIO9IO.7JH@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uXdKc-0006n3-2z for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 10:07:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KMv5m+04peWmGOlb9xw+Y5TeBq2l+62yKhu0Uua0kXU=; b=lWedLwwXgoCFlgm9Bg7uGQHJoS
 6lLEt1HB9/fG9YLOYJaXOQVab9e3wY1v8WVn/Tuc499Bt/tYOa6xfSJ6mj90oiUVz+DWJ8/QGNeTy
 MErLnTJ+mm5Y1TBdHnBNFxR+Ull24jmXorJwdUkxUOshd2Q9gPiM26uJ4mjb+ZNjxUIE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KMv5m+04peWmGOlb9xw+Y5TeBq2l+62yKhu0Uua0kXU=; b=N
 F0hT72PyhoQRgU3G6FU31NqjjQsN8Z0XS5G841z49kj/+amMV9aPOtuSpli9ajkoI7f9D3Nlnouvf
 htF2Ll7W1cUsBtc7qw8f4YwaJZ2jHE7P0pBw/ufTj8rUBFXS3Pi5NVl20sW1L9uPXWYFgj4CdkLzf
 xcbvahkeNMm0CT54=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uXdKb-0001Op-Ei for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 04 Jul 2025 10:07:46 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3e0513ec553so17262355ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 04 Jul 2025 03:07:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751623655; x=1752228455;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=KMv5m+04peWmGOlb9xw+Y5TeBq2l+62yKhu0Uua0kXU=;
 b=dSGmBIiL6kpO8yNwozoaArAqfsDq1nbeNjMzULQSN29dassbgGmIQQic8d8gDaGZPt
 mJ4xNsBrkVgXqrgZfoi3VwKz77kEWkhVFs4Ylm9F2rl8Tfa8cfz6UoNWl/fx+/YCTnji
 PZWtbmuZLwFd160cOyizEBOfAJVW30KbGK/3Vrq0u9P7FFDRdXK8YEbxmbaqr81s2Be+
 Q89le2JzzjSM2INAAAVYgx1/BNiwWqKGFnun7o4xL3hjPbWrBrSjXOkb9rDRXBJy0vqB
 r8sOVkKwH+SO4Mbo3km2AfEmBauNOrIcy8vnZ51W86bSEn9qruHAPWD/qK1h0FS62boy
 xbag==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWDulnD+cSpWL87BA+Yb6CTA/VRLjQM/BEfiIzN4Ivfp1iVetABn1PQo3TK+AC0SHHsga6Op8wtd14l/lIWG1L@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzxM9+0lLNmLms4iHyhT022buAkslOxcYzPV01ZBsI0MELT7542
 uPhqVifNbrE78RkyC0o8chSkMIxeCVMdM1cbOEnjgspLaBgbHF+S8h0vLiTd/gysU5RsiALx2oT
 tsKXMKmXEniU+1ZbWn2/j/6LWan7rmmw/cCPX9QeXPLHahr5hYolvTUF+940=
X-Google-Smtp-Source: AGHT+IF11xHT/pqB9Y/nYKAHM6LlPwupuvXq9906vGmwFTfyHSeZlVRM9uzFA1dndUyqvbL92NL6NOE0o0ZmLkD8uZGn9nEmNF3+
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:12c3:b0:3e0:4f66:3106 with SMTP id
 e9e14a558f8ab-3e13547ddf5mr17855765ab.2.1751623654592; Fri, 04 Jul 2025
 03:07:34 -0700 (PDT)
Date: Fri, 04 Jul 2025 03:07:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6867a7e6.a00a0220.c7b3.001a.GAE@google.com>
From: syzbot <syzbot+8a7eea50810efde15b0a@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 66701750d556
 Merge tag 'io_uring-6.16-20250630' of git://g.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=15e4388c580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
X-Headers-End: 1uXdKb-0001Op-Ei
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in
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

Hello,

syzbot found the following issue on:

HEAD commit:    66701750d556 Merge tag 'io_uring-6.16-20250630' of git://g..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=15e4388c580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=e29b8115bf337f53
dashboard link: https://syzkaller.appspot.com/bug?extid=8a7eea50810efde15b0a
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/523bba6cff2e/disk-66701750.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0fcf3d9d70ad/vmlinux-66701750.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8b9c399a35d9/bzImage-66701750.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+8a7eea50810efde15b0a@syzkaller.appspotmail.com

INFO: task kworker/u8:8:5978 blocked for more than 143 seconds.
      Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:kworker/u8:8    state:D stack:21160 pid:5978  tgid:5978  ppid:2      task_flags:0x4208060 flags:0x00004000
Workqueue: writeback wb_workfn (flush-7:5)
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5396 [inline]
 __schedule+0x16a2/0x4cb0 kernel/sched/core.c:6785
 __schedule_loop kernel/sched/core.c:6863 [inline]
 schedule+0x165/0x360 kernel/sched/core.c:6878
 schedule_preempt_disabled+0x13/0x30 kernel/sched/core.c:6935
 rwsem_down_write_slowpath+0xbec/0x1030 kernel/locking/rwsem.c:1176
 __down_write_common kernel/locking/rwsem.c:1304 [inline]
 __down_write kernel/locking/rwsem.c:1313 [inline]
 down_write+0x1ab/0x1f0 kernel/locking/rwsem.c:1578
 f2fs_down_write fs/f2fs/f2fs.h:2229 [inline]
 f2fs_issue_checkpoint+0x39c/0x570 fs/f2fs/checkpoint.c:1846
 f2fs_balance_fs_bg+0x54d/0x980 fs/f2fs/segment.c:543
 f2fs_write_node_pages+0x146/0x6e0 fs/f2fs/node.c:2161
 do_writepages+0x32e/0x550 mm/page-writeback.c:2636
 __writeback_single_inode+0x145/0xff0 fs/fs-writeback.c:1680
 writeback_sb_inodes+0x6b5/0x1000 fs/fs-writeback.c:1976
 __writeback_inodes_wb+0x111/0x240 fs/fs-writeback.c:2047
 wb_writeback+0x44f/0xaf0 fs/fs-writeback.c:2158
 wb_check_old_data_flush fs/fs-writeback.c:2262 [inline]
 wb_do_writeback fs/fs-writeback.c:2315 [inline]
 wb_workfn+0xaef/0xef0 fs/fs-writeback.c:2343
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/31:
 #0: ffffffff8e13ee20 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 #0: ffffffff8e13ee20 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:841 [inline]
 #0: ffffffff8e13ee20 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x2e/0x180 kernel/locking/lockdep.c:6770
2 locks held by getty/5577:
 #0: ffff8880343b20a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000332b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x43e/0x1400 drivers/tty/n_tty.c:2222
4 locks held by kworker/u8:8/5978:
 #0: ffff888140a89948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff888140a89948 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x9b4/0x17b0 kernel/workqueue.c:3321
 #1: ffffc900053efbc0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc900053efbc0 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9ef/0x17b0 kernel/workqueue.c:3321
 #2: ffff88804c9700e0 (&type->s_umount_key#99){++++}-{4:4}, at: super_trylock_shared+0x20/0xf0 fs/super.c:563
 #3: ffff888077745410 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2229 [inline]
 #3: ffff888077745410 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_issue_checkpoint+0x39c/0x570 fs/f2fs/checkpoint.c:1846
6 locks held by syz.5.260/8622:

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 31 Comm: khungtaskd Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x39e/0x3d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x17a/0x300 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:158 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:307 [inline]
 watchdog+0xfee/0x1030 kernel/hung_task.c:470
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
 </TASK>
Sending NMI from CPU 0 to CPUs 1:
NMI backtrace for cpu 1
CPU: 1 UID: 0 PID: 78 Comm: kworker/u8:4 Not tainted 6.16.0-rc4-syzkaller-00013-g66701750d556 #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
Workqueue: events_unbound nsim_dev_trap_report_work
RIP: 0010:lockdep_enabled kernel/locking/lockdep.c:118 [inline]
RIP: 0010:lock_acquire+0x8d/0x360 kernel/locking/lockdep.c:5847
Code: f6 05 be ad eb 0d 01 0f 84 d7 01 00 00 83 3d 19 eb 01 0e 00 0f 84 f0 00 00 00 48 8b b4 24 90 00 00 00 4c 89 ef e8 43 5a 83 00 <83> 3d fc ea 01 0e 00 0f 84 fa 00 00 00 65 8b 05 ff de fb 10 85 c0
RSP: 0018:ffffc9000210f3d8 EFLAGS: 00000202
RAX: 0000000000000001 RBX: 0000000000000000 RCX: 5bd6d986281a0c00
RDX: 0000000000000000 RSI: ffffffff81728b12 RDI: 1ffffffff1c27dc4
RBP: ffffffff81728af5 R08: 0000000000000000 R09: 0000000000000000
R10: ffffc9000210f5f8 R11: fffff52000421ec1 R12: 0000000000000002
R13: ffffffff8e13ee20 R14: 0000000000000000 R15: 0000000000000000
FS:  0000000000000000(0000) GS:ffff888125d84000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000563853e3a168 CR3: 0000000030b5e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 rcu_lock_acquire include/linux/rcupdate.h:331 [inline]
 rcu_read_lock include/linux/rcupdate.h:841 [inline]
 class_rcu_constructor include/linux/rcupdate.h:1155 [inline]
 unwind_next_frame+0xc2/0x2390 arch/x86/kernel/unwind_orc.c:479
 __unwind_start+0x5b9/0x760 arch/x86/kernel/unwind_orc.c:758
 unwind_start arch/x86/include/asm/unwind.h:64 [inline]
 arch_stack_walk+0xe4/0x150 arch/x86/kernel/stacktrace.c:24
 stack_trace_save+0x9c/0xe0 kernel/stacktrace.c:122
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3e/0x80 mm/kasan/common.c:68
 kasan_save_free_info+0x46/0x50 mm/kasan/generic.c:576
 poison_slab_object mm/kasan/common.c:247 [inline]
 __kasan_slab_free+0x62/0x70 mm/kasan/common.c:264
 kasan_slab_free include/linux/kasan.h:233 [inline]
 slab_free_hook mm/slub.c:2381 [inline]
 slab_free mm/slub.c:4643 [inline]
 kmem_cache_free+0x18f/0x400 mm/slub.c:4745
 nsim_dev_trap_report drivers/net/netdevsim/dev.c:821 [inline]
 nsim_dev_trap_report_work+0x7cf/0xb80 drivers/net/netdevsim/dev.c:851
 process_one_work kernel/workqueue.c:3238 [inline]
 process_scheduled_works+0xae1/0x17b0 kernel/workqueue.c:3321
 worker_thread+0x8a0/0xda0 kernel/workqueue.c:3402
 kthread+0x711/0x8a0 kernel/kthread.c:464
 ret_from_fork+0x3fc/0x770 arch/x86/kernel/process.c:148
 ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
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
