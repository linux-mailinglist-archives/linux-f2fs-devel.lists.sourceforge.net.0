Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF221A6D0CB
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 23 Mar 2025 20:30:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1twR1p-0000wj-Qw;
	Sun, 23 Mar 2025 19:30:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3UGHgZwkbANkNTUF5GG9M5KKD8.BJJBG9PN9M7JIO9IO.7JH@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1twR1n-0000wQ-EI for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 23 Mar 2025 19:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NBdbNcX35k7KZavDe8NK2BNik7XoCQAB+GSEaX7GVKw=; b=DYKaAvfMNPpZ8oYktCTnlUQt5/
 jvdfYWIOSGtzU+Ne1ordclGY1uCU89n1G85+05hG1IZbhe8h0+6YnF1/Kw3XA+kJhwtMuKtjkA5qu
 n7mGC154o3PtCH4KD0dAVl8Y7Fp8VOH0zK07+fiDMpbP8Lui4zjYx+YX5fuuMKEUATEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=NBdbNcX35k7KZavDe8NK2BNik7XoCQAB+GSEaX7GVKw=; b=V
 brmFXGDGdp6Jeyf5k8ep7HCNInFLP9c1lJlx17Xcf94Ad5SbEiLH5euwrFZ9FJbkFDYgf5Cj+Bkmm
 SgS1mMG2wi/PAxVJhFPd9VDdG6M8qeWP3iWQjTdrLuAre2ZA3/RxR497CM295O5QlMoIfi7Mg5lnM
 Nfx14EF15LPBpkSE=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1twR1n-0008N0-8v for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 23 Mar 2025 19:30:36 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-85dad593342so340442739f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 23 Mar 2025 12:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742758224; x=1743363024;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=NBdbNcX35k7KZavDe8NK2BNik7XoCQAB+GSEaX7GVKw=;
 b=Ix4oj7Qjf2ohyLsFKCSgqz3apfAPclABumurNXbfQ/Q6UdM+tjvkGniKBQoagN2VM5
 8X452zZDO18A+ta+LMXHTCMkkrMqwNZYKIn7TPjllktMqh7bZ05+nR/B0d1dRU6nJt1R
 BeSj5HcWkHHwck8fxMx0O5QolwKjOGXrB3HgzlJeBm5UrEKOgHbYhnUahBCSJkxnDQMX
 +Os6bShoD4XGXV6XQFpz0doULGIfp3zbt0n6vlmaVlptY58BNEPu6LAnXPdjKCdLxVMR
 7LefH1grgrvLfILDRxDGaF+ZyUm2W76p58tDYG8dgOrqeyANKRgc7qRdXLoxxZ2Q3QZo
 D65w==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPfO7e1J1ZzQcqDDLKFDEY2W5C9pI1dnmy3S48nyG5wnCD2Aco2rA+SzBzcILx75vtsAnCXfq0JIWwmdiNWVYQ@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzXjKWv3a37zZdfCv0JySQgt53jfndWeitmQeBW4JlsZ3IDCXuV
 nlCIL4N3PEMvD2XqxeQ7Jb5x70lMvIDIFURr876uRYBg/fFQ0tZ+eWoVngpYuL0cQR0Y7eyzIWq
 yC+YguzXuGBrER4jXwCxMTsHF23/BKsWhUH1ko2pnP4R874nUREacyeA=
X-Google-Smtp-Source: AGHT+IGdAfspnFJau/nx7QI/bP4UmwZEZnEWUxrdOwsULAo5UQUbuqNUGzIAxpI6B8ihAdzW+mZOGNsg28jHvVx91uf45AZIOI/K
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:19ce:b0:3d4:6dd2:3989 with SMTP id
 e9e14a558f8ab-3d5961865f7mr102804875ab.20.1742758224512; Sun, 23 Mar 2025
 12:30:24 -0700 (PDT)
Date: Sun, 23 Mar 2025 12:30:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67e06150.050a0220.21942d.0005.GAE@google.com>
From: syzbot <syzbot+cc448dcdc7ae0b4e4ffa@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 81e4f8d68c66
 Merge tag 'pmdomain-v6.14-rc4' of git://git.k.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=139a6004580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.77 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.77 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.77 listed in wl.mailspike.net]
 0.1 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.77 listed in list.dnswl.org]
X-Headers-End: 1twR1n-0008N0-8v
Subject: [f2fs-dev] [syzbot] [f2fs?] INFO: task hung in f2fs_grab_cache_page
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

HEAD commit:    81e4f8d68c66 Merge tag 'pmdomain-v6.14-rc4' of git://git.k..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=139a6004580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=27515cfdbafbb90d
dashboard link: https://syzkaller.appspot.com/bug?extid=cc448dcdc7ae0b4e4ffa
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12756e98580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10e3744c580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-81e4f8d6.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/285c520dda1c/vmlinux-81e4f8d6.xz
kernel image: https://storage.googleapis.com/syzbot-assets/048e25a8dfed/bzImage-81e4f8d6.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/52a1b1c7431f/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=159a6004580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+cc448dcdc7ae0b4e4ffa@syzkaller.appspotmail.com

INFO: task syz-executor140:5308 blocked for more than 143 seconds.
      Not tainted 6.14.0-rc7-syzkaller-00069-g81e4f8d68c66 #0
"echo 0 > /proc/sys/kernel/hung_task_timeout_secs" disables this message.
task:syz-executor140 state:D stack:24016 pid:5308  tgid:5308  ppid:5306   task_flags:0x400140 flags:0x00000006
Call Trace:
 <TASK>
 context_switch kernel/sched/core.c:5378 [inline]
 __schedule+0x190e/0x4c90 kernel/sched/core.c:6765
 __schedule_loop kernel/sched/core.c:6842 [inline]
 schedule+0x14b/0x320 kernel/sched/core.c:6857
 io_schedule+0x8d/0x110 kernel/sched/core.c:7690
 folio_wait_bit_common+0x839/0xee0 mm/filemap.c:1317
 __folio_lock mm/filemap.c:1664 [inline]
 folio_lock include/linux/pagemap.h:1163 [inline]
 __filemap_get_folio+0x147/0xb40 mm/filemap.c:1917
 pagecache_get_page+0x2c/0x130 mm/folio-compat.c:87
 find_get_page_flags include/linux/pagemap.h:842 [inline]
 f2fs_grab_cache_page+0x2b/0x320 fs/f2fs/f2fs.h:2776
 __get_node_page+0x131/0x11b0 fs/f2fs/node.c:1463
 read_xattr_block+0xfb/0x190 fs/f2fs/xattr.c:306
 lookup_all_xattrs fs/f2fs/xattr.c:355 [inline]
 f2fs_getxattr+0x676/0xf70 fs/f2fs/xattr.c:533
 __f2fs_get_acl+0x52/0x870 fs/f2fs/acl.c:179
 f2fs_acl_create fs/f2fs/acl.c:375 [inline]
 f2fs_init_acl+0xd7/0x9b0 fs/f2fs/acl.c:418
 f2fs_init_inode_metadata+0xa0f/0x1050 fs/f2fs/dir.c:539
 f2fs_add_inline_entry+0x448/0x860 fs/f2fs/inline.c:666
 f2fs_add_dentry+0xba/0x1e0 fs/f2fs/dir.c:765
 f2fs_do_add_link+0x28c/0x3a0 fs/f2fs/dir.c:808
 f2fs_add_link fs/f2fs/f2fs.h:3616 [inline]
 f2fs_mknod+0x2e8/0x5b0 fs/f2fs/namei.c:766
 vfs_mknod+0x36d/0x3b0 fs/namei.c:4191
 unix_bind_bsd net/unix/af_unix.c:1286 [inline]
 unix_bind+0x563/0xe30 net/unix/af_unix.c:1379
 __sys_bind_socket net/socket.c:1817 [inline]
 __sys_bind+0x1e4/0x290 net/socket.c:1848
 __do_sys_bind net/socket.c:1853 [inline]
 __se_sys_bind net/socket.c:1851 [inline]
 __x64_sys_bind+0x7a/0x90 net/socket.c:1851
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f31e6165dc9
RSP: 002b:00007fff2bc5b438 EFLAGS: 00000246 ORIG_RAX: 0000000000000031
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f31e6165dc9
RDX: 000000000000006e RSI: 0000400000000080 RDI: 0000000000000004
RBP: 00000000000014bb R08: 0000000000000000 R09: 0000000000000000
R10: 000000000000557f R11: 0000000000000246 R12: 00007fff2bc5b480
R13: 00007fff2bc5b560 R14: 431bde82d7b634db R15: 00007f31e61af01d
 </TASK>

Showing all locks held in the system:
1 lock held by khungtaskd/26:
 #0: ffffffff8eb393e0 (rcu_read_lock){....}-{1:3}, at: rcu_lock_acquire include/linux/rcupdate.h:337 [inline]
 #0: ffffffff8eb393e0 (rcu_read_lock){....}-{1:3}, at: rcu_read_lock include/linux/rcupdate.h:849 [inline]
 #0: ffffffff8eb393e0 (rcu_read_lock){....}-{1:3}, at: debug_show_all_locks+0x55/0x2a0 kernel/locking/lockdep.c:6746
3 locks held by kworker/u4:7/1038:
 #0: ffff888030f3a148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3213 [inline]
 #0: ffff888030f3a148 ((wq_completion)writeback){+.+.}-{0:0}, at: process_scheduled_works+0x98b/0x18e0 kernel/workqueue.c:3319
 #1: ffffc9000256fc60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_one_work kernel/workqueue.c:3214 [inline]
 #1: ffffc9000256fc60 ((work_completion)(&(&wb->dwork)->work)){+.+.}-{0:0}, at: process_scheduled_works+0x9c6/0x18e0 kernel/workqueue.c:3319
 #2: ffff888011e7c0e0 (&type->s_umount_key#42){.+.+}-{4:4}, at: super_trylock_shared+0x22/0xf0 fs/super.c:562
2 locks held by getty/5107:
 #0: ffff88801f4d90a0 (&tty->ldisc_sem){++++}-{0:0}, at: tty_ldisc_ref_wait+0x25/0x70 drivers/tty/tty_ldisc.c:243
 #1: ffffc9000019b2f0 (&ldata->atomic_read_lock){+.+.}-{4:4}, at: n_tty_read+0x616/0x1770 drivers/tty/n_tty.c:2211
5 locks held by syz-executor140/5308:
 #0: ffff888011e7c420 (sb_writers#10){.+.+}-{0:0}, at: mnt_want_write+0x3f/0x90 fs/namespace.c:547
 #1: ffff888045a992d8 (&type->i_mutex_dir_key#6/1){+.+.}-{4:4}, at: inode_lock_nested include/linux/fs.h:912 [inline]
 #1: ffff888045a992d8 (&type->i_mutex_dir_key#6/1){+.+.}-{4:4}, at: filename_create+0x260/0x540 fs/namei.c:4082
 #2: ffff888011fa03b0 (&sbi->cp_rwsem){.+.+}-{4:4}, at: f2fs_down_read fs/f2fs/f2fs.h:2175 [inline]
 #2: ffff888011fa03b0 (&sbi->cp_rwsem){.+.+}-{4:4}, at: f2fs_lock_op fs/f2fs/f2fs.h:2224 [inline]
 #2: ffff888011fa03b0 (&sbi->cp_rwsem){.+.+}-{4:4}, at: f2fs_mknod+0x1f8/0x5b0 fs/f2fs/namei.c:765
 #3: ffff888045a99948 (&fi->i_xattr_sem){.+.+}-{4:4}, at: f2fs_down_read fs/f2fs/f2fs.h:2175 [inline]
 #3: ffff888045a99948 (&fi->i_xattr_sem){.+.+}-{4:4}, at: f2fs_add_dentry+0x9f/0x1e0 fs/f2fs/dir.c:764
 #4: ffff888045a99f70 (&fi->i_sem/1){+.+.}-{4:4}, at: f2fs_down_write_nested fs/f2fs/f2fs.h:2202 [inline]
 #4: ffff888045a99f70 (&fi->i_sem/1){+.+.}-{4:4}, at: f2fs_add_inline_entry+0x431/0x860 fs/f2fs/inline.c:664
2 locks held by f2fs_ckpt-7:0/5310:
 #0: ffff888011fa1350 (&sbi->gc_lock){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2191 [inline]
 #0: ffff888011fa1350 (&sbi->gc_lock){+.+.}-{4:4}, at: __write_checkpoint_sync fs/f2fs/checkpoint.c:1783 [inline]
 #0: ffff888011fa1350 (&sbi->gc_lock){+.+.}-{4:4}, at: __checkpoint_and_complete_reqs+0xcf/0x3b0 fs/f2fs/checkpoint.c:1803
 #1: ffff888011fa0318 (&sbi->cp_global_sem){+.+.}-{4:4}, at: f2fs_down_write fs/f2fs/f2fs.h:2191 [inline]
 #1: ffff888011fa0318 (&sbi->cp_global_sem){+.+.}-{4:4}, at: f2fs_write_checkpoint+0x21f/0x1c80 fs/f2fs/checkpoint.c:1653

=============================================

NMI backtrace for cpu 0
CPU: 0 UID: 0 PID: 26 Comm: khungtaskd Not tainted 6.14.0-rc7-syzkaller-00069-g81e4f8d68c66 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 nmi_cpu_backtrace+0x49c/0x4d0 lib/nmi_backtrace.c:113
 nmi_trigger_cpumask_backtrace+0x198/0x320 lib/nmi_backtrace.c:62
 trigger_all_cpu_backtrace include/linux/nmi.h:162 [inline]
 check_hung_uninterruptible_tasks kernel/hung_task.c:236 [inline]
 watchdog+0x1058/0x10a0 kernel/hung_task.c:399
 kthread+0x7a9/0x920 kernel/kthread.c:464
 ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:148
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
