Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A03B7993EEF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Oct 2024 08:51:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sy44I-0005YE-Vf;
	Tue, 08 Oct 2024 06:51:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Z9YEZwkbAGYWcdOEPPIVETTMH.KSSKPIYWIVGSRXIRX.GSQ@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1sy44B-0005Y3-A9 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 06:51:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FqYhJv4q2LtytZyg/ouW3t6t8zPgnvGQTUWQmrSwZmI=; b=YTfNPg5wfXu+cZIPEEqIfd5V5M
 aCNTyOdt48Sa2DpHjAEbm2E+Z0Mn3NS/7PGqM4UFLRxM+dvHe/cXb3KrBT2yU/3ShB+ttnCQezkN4
 zCh3xl4xEOoxejlJWqcn4BG5F8+IoEy0Ae2rnYEinqU7oPYxdBq4Amq2gnwUkAMRHt/8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FqYhJv4q2LtytZyg/ouW3t6t8zPgnvGQTUWQmrSwZmI=; b=Q
 s0Pr42GmD/ZqaeyMlUcbPlwH4hyVvn8LCarE+0TcoFxeHdcS3ILE6EX6k51RJ8Okc5fo66P847544
 +O7haODVT5db+bqn90RRKOnsnv10pFLqxCgCigy4ODoIt3e3PrCeVNABv01xKxI7AmthVZN4KRT8B
 NylX6ajJBqc1ML+c=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sy44A-0003qg-6j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Oct 2024 06:51:31 +0000
Received: by mail-il1-f199.google.com with SMTP id
 e9e14a558f8ab-3a1a969fabfso65115865ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Oct 2024 23:51:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728370279; x=1728975079;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FqYhJv4q2LtytZyg/ouW3t6t8zPgnvGQTUWQmrSwZmI=;
 b=faqTYW0d8gRL7dvGxpkDFe8tZDOH39UPGz2WkbCvYqh7Kw8yIz5cLDQri4dsv/omPP
 U3hMnD6ny99NKwa+eyEkLOaDHQ9j3N3pfhjIURHe+fBaQRckYMLwo1HC77kPc8+KP2YC
 uFFsOnyXM0c6+URnFeP9EioLTdZi2IjbheYZSwlzT01IEk15oUR7MDk5m/7sNFUBq20E
 qtm5uqjNHM3IqdhN1OgQTZ/1tXyNeow7b+l66v+3PtGhIvAxVqT5QFPCuAU3963nSzRX
 +CTQeVBji87ckn6agm09rln/gsXTjqEMKP55ehKzrfSG4Iw3WdvzxuksqO/VfMOlhxUn
 B+2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbm5mya0+/zEDSFWiyCJ72XK6MWwC9IKCKjTnmw8ODb4hnuAlOv9+GoH3Y33XJw5lUQNxnz4UckgG2KoiELJKs@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz8r6F3g+g1shewTyC6UNkcEQ8nn8TB1KJFeJNoYl9h5i3G6wu9
 1jmwN/46LoJhXNzIwMfd001Q+y5iTRJhmCU5O83aCmBmSroIN5mLj34LEn0Gs5PwXu5eeHqz5hX
 skrQbFBNNhW6JympBv8cShD95JUryddT5oBkgbBlCxWBvN/fem/YiwSU=
X-Google-Smtp-Source: AGHT+IGwTvlKn3XWbC2+6PajMkX9P1CkOIZQQzxpl3S80SlepNfVMNKNwwR1Xbg25559frSF8FEhEBSTfLpQtndowZ+ykGBTErDH
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1ca7:b0:3a0:9043:59ac with SMTP id
 e9e14a558f8ab-3a375be5b99mr139424195ab.25.1728370279461; Mon, 07 Oct 2024
 23:51:19 -0700 (PDT)
Date: Mon, 07 Oct 2024 23:51:19 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6704d667.050a0220.1e4d62.0081.GAE@google.com>
From: syzbot <syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 3840cbe24cf0
 sched: psi: fix bogus pressure spikes from ag.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=10bbab9f980000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1sy44A-0003qg-6j
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in f2fs_evict_inode
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

HEAD commit:    3840cbe24cf0 sched: psi: fix bogus pressure spikes from ag..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10bbab9f980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f95955e3f7b5790c
dashboard link: https://syzkaller.appspot.com/bug?extid=7988d9999219aea9f2db
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a4b3d0580000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-3840cbe2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/55888d19e055/vmlinux-3840cbe2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f6b8ca10a019/bzImage-3840cbe2.xz
mounted in repro #1: https://storage.googleapis.com/syzbot-assets/1ebfe9150f9d/mount_0.gz
mounted in repro #2: https://storage.googleapis.com/syzbot-assets/91e39079514c/mount_7.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+7988d9999219aea9f2db@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.12.0-rc1-syzkaller-00114-g3840cbe24cf0 #0 Not tainted
------------------------------------------------------
kswapd0/79 is trying to acquire lock:
ffff888057a62610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842

but task is already holding lock:
ffffffff8ea37160 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6844 [inline]
ffffffff8ea37160 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3700 mm/vmscan.c:7226

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       __fs_reclaim_acquire mm/page_alloc.c:3834 [inline]
       fs_reclaim_acquire+0x88/0x140 mm/page_alloc.c:3848
       might_alloc include/linux/sched/mm.h:327 [inline]
       prepare_alloc_pages+0x147/0x5d0 mm/page_alloc.c:4493
       __alloc_pages_noprof+0x166/0x6c0 mm/page_alloc.c:4722
       alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
       alloc_pages_noprof mm/mempolicy.c:2345 [inline]
       folio_alloc_noprof+0x128/0x180 mm/mempolicy.c:2352
       filemap_alloc_folio_noprof+0xdf/0x500 mm/filemap.c:1010
       do_read_cache_folio+0x2eb/0x850 mm/filemap.c:3787
       read_mapping_folio include/linux/pagemap.h:1011 [inline]
       f2fs_commit_super+0x52b/0x7d0 fs/f2fs/super.c:4044
       f2fs_record_stop_reason+0x13b/0x1d0 fs/f2fs/super.c:4079
       f2fs_handle_critical_error+0x2ac/0x5c0 fs/f2fs/super.c:4174
       f2fs_write_inode+0x35f/0x4d0 fs/f2fs/inode.c:785
       f2fs_do_sync_file+0x1395/0x19f0 fs/f2fs/file.c:356
       f2fs_ioc_commit_atomic_write fs/f2fs/file.c:2259 [inline]
       __f2fs_ioctl+0x49db/0xb8f0 fs/f2fs/file.c:4417
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:907 [inline]
       __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:893
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&sbi->sb_lock){++++}-{3:3}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       down_write+0x99/0x220 kernel/locking/rwsem.c:1577
       f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
       f2fs_record_errors fs/f2fs/super.c:4121 [inline]
       f2fs_handle_error+0xf6/0x250 fs/f2fs/super.c:4138
       __get_node_page+0x8d0/0xfc0 fs/f2fs/node.c:1489
       f2fs_update_inode_page+0x87/0x170 fs/f2fs/inode.c:746
       f2fs_evict_inode+0xa61/0x15c0 fs/f2fs/inode.c:883
       evict+0x4e8/0x9b0 fs/inode.c:723
       do_unlinkat+0x512/0x830 fs/namei.c:4540
       __do_sys_unlink fs/namei.c:4581 [inline]
       __se_sys_unlink fs/namei.c:4579 [inline]
       __x64_sys_unlink+0x47/0x50 fs/namei.c:4579
       do_syscall_x64 arch/x86/entry/common.c:52 [inline]
       do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (sb_internal#2){.+.+}-{0:0}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
       __lock_acquire+0x1384/0x2050 kernel/locking/lockdep.c:5202
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1716 [inline]
       sb_start_intwrite+0x4d/0x1c0 include/linux/fs.h:1899
       f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842
       evict+0x4e8/0x9b0 fs/inode.c:723
       f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
       evict+0x4e8/0x9b0 fs/inode.c:723
       dispose_list fs/inode.c:772 [inline]
       prune_icache_sb+0x239/0x2f0 fs/inode.c:961
       super_cache_scan+0x38c/0x4b0 fs/super.c:223
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab_memcg mm/shrinker.c:548 [inline]
       shrink_slab+0x878/0x14d0 mm/shrinker.c:626
       shrink_one+0x43b/0x850 mm/vmscan.c:4818
       shrink_many mm/vmscan.c:4879 [inline]
       lru_gen_shrink_node mm/vmscan.c:4957 [inline]
       shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
       kswapd_shrink_node mm/vmscan.c:6765 [inline]
       balance_pgdat mm/vmscan.c:6957 [inline]
       kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
       kthread+0x2f0/0x390 kernel/kthread.c:389
       ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244

other info that might help us debug this:

Chain exists of:
  sb_internal#2 --> &sbi->sb_lock --> fs_reclaim

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(fs_reclaim);
                               lock(&sbi->sb_lock);
                               lock(fs_reclaim);
  rlock(sb_internal#2);

 *** DEADLOCK ***

2 locks held by kswapd0/79:
 #0: ffffffff8ea37160 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6844 [inline]
 #0: ffffffff8ea37160 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3700 mm/vmscan.c:7226
 #1: ffff888057a620e0 (&type->s_umount_key#54){++++}-{3:3}, at: super_trylock_shared fs/super.c:562 [inline]
 #1: ffff888057a620e0 (&type->s_umount_key#54){++++}-{3:3}, at: super_cache_scan+0x94/0x4b0 fs/super.c:196

stack backtrace:
CPU: 0 UID: 0 PID: 79 Comm: kswapd0 Not tainted 6.12.0-rc1-syzkaller-00114-g3840cbe24cf0 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:120
 print_circular_bug+0x13a/0x1b0 kernel/locking/lockdep.c:2074
 check_noncircular+0x36a/0x4a0 kernel/locking/lockdep.c:2206
 check_prev_add kernel/locking/lockdep.c:3161 [inline]
 check_prevs_add kernel/locking/lockdep.c:3280 [inline]
 validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
 __lock_acquire+0x1384/0x2050 kernel/locking/lockdep.c:5202
 lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
 percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
 __sb_start_write include/linux/fs.h:1716 [inline]
 sb_start_intwrite+0x4d/0x1c0 include/linux/fs.h:1899
 f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842
 evict+0x4e8/0x9b0 fs/inode.c:723
 f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
 evict+0x4e8/0x9b0 fs/inode.c:723
 dispose_list fs/inode.c:772 [inline]
 prune_icache_sb+0x239/0x2f0 fs/inode.c:961
 super_cache_scan+0x38c/0x4b0 fs/super.c:223
 do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
 shrink_slab_memcg mm/shrinker.c:548 [inline]
 shrink_slab+0x878/0x14d0 mm/shrinker.c:626
 shrink_one+0x43b/0x850 mm/vmscan.c:4818
 shrink_many mm/vmscan.c:4879 [inline]
 lru_gen_shrink_node mm/vmscan.c:4957 [inline]
 shrink_node+0x3799/0x3de0 mm/vmscan.c:5937
 kswapd_shrink_node mm/vmscan.c:6765 [inline]
 balance_pgdat mm/vmscan.c:6957 [inline]
 kswapd+0x1ca3/0x3700 mm/vmscan.c:7226
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
