Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D76619A6055
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 11:39:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2osy-0004qu-Ih;
	Mon, 21 Oct 2024 09:39:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3UCEWZwkbACsZfgRHSSLYHWWPK.NVVNSLbZLYJVUaLUa.JVT@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1t2osw-0004qo-I6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 09:39:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kFFhOhQVZJyTA1z1TUXtRHzQuRmPnf012EPCZgXmh6Q=; b=R0UlQx2ro3ZfmIzs/kmmCC/PQy
 jXaY0dXv/Pei51BD17+6m3gNEJhvz4DvXduV2zPFl7pTGo0bV/aUFJpUIR1FQxuN1hMBlvE3aVE00
 n6jx3W6mJ1Dryh1YUG8C9kNnxoPlB/+nd0F2XayQiqNnRVC2B5ohH0fsFZ4EPfscaVzQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kFFhOhQVZJyTA1z1TUXtRHzQuRmPnf012EPCZgXmh6Q=; b=G
 /L3PF2pLrcl+FKu5EUXAsoyafMtmj8ts5/cgPac0Cc6U9GRSIpDEqaMHW0YQ1HX9vMy6ylk8IV7Bi
 +I8MGSRSOabFCorIZ80xp/zandxJ4XDMyJQHu7ym8Im0v7wlD7JVlMQq93IFEw+B94DaN2wWShX5z
 yhvVpNHqJh0ICi6w=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t2osw-0005c1-8e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 09:39:35 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-3a39631593aso36652395ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Oct 2024 02:39:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1729503568; x=1730108368;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=kFFhOhQVZJyTA1z1TUXtRHzQuRmPnf012EPCZgXmh6Q=;
 b=N6fWCCzl/qnAccGU2Eks4239YMgyvbiFSGAPl7C0I2+AaKLQbeb6J2IeCCWuPWxt7M
 ctvzkCAfXcFpNZw+g8H68quSRleEyG2KsMR+LzclQ00HrAF5JlCPJIsDwNFYGZpjvBxn
 a2sIMPOMGrzMZ2+rMtIKiIxmt3pcg4xNDc2pWQeq/K004BtdkVQyiE6QxNEWGFPanz2V
 NTqzwdCK/uwmt/UfdFk3Jyb6fQMYbg22aSdkPpJtH38/lamPcRo1F91/SeJ9T0QwvplB
 Ex1O/HO7G923GoapQzqFelVfV8T0JfbBQR3PTHG/0oN+AD6FrmwFudPnhp+88Ex4tS0k
 n6Pg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXNwSdZJlc1/Fk8HSu00gOvtJg8HC8hmR8ZqzAZUoSL+Q/8IPS04CkHKnpNBFOvHj1c3pZzeNCOsKw6qU1FusuW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxYk5f5OAGIBQdSHnN7sdT4gLsiKGPFBzjtq3AtcO8lcHC9X21P
 m/uMr95R6Dfpv8OgPr9k67ABSiy2dBJN8/OSc8xGRqGyWQPfZolrH0EG3Oz4SQxVZbz9ytiCpt5
 qxE67AITUcQiSQ5LiZuxplJQk4phqjtFp76dbHE5Mdo8tJ3XoFZly9Ww=
X-Google-Smtp-Source: AGHT+IF02rt1tsq0HnIn//72jz039wxyW3aMOec4zNKdKouignBrLYBXeuNIR/ChXgzYY03SYaxuk6a/Pc5rpj+59Dh/EI6PeTS4
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1845:b0:3a1:f6ac:621e with SMTP id
 e9e14a558f8ab-3a3f41974b2mr67666515ab.7.1729503568430; Mon, 21 Oct 2024
 02:39:28 -0700 (PDT)
Date: Mon, 21 Oct 2024 02:39:28 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <67162150.050a0220.10f4f4.0044.GAE@google.com>
From: syzbot <syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: c964ced77262
 Merge tag 'for-linus' of git://git.kernel.org.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=11420240580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
X-Headers-End: 1t2osw-0005c1-8e
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_record_stop_reason
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

HEAD commit:    c964ced77262 Merge tag 'for-linus' of git://git.kernel.org..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=11420240580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cfbd94c114a3d407
dashboard link: https://syzkaller.appspot.com/bug?extid=be4a9983e95a5e25c8d3
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7feb34a89c2a/non_bootable_disk-c964ced7.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/e937ef58569a/vmlinux-c964ced7.xz
kernel image: https://storage.googleapis.com/syzbot-assets/f1df9880ca4b/bzImage-c964ced7.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+be4a9983e95a5e25c8d3@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.12.0-rc3-syzkaller-00087-gc964ced77262 #0 Not tainted
------------------------------------------------------
kswapd0/79 is trying to acquire lock:
ffff888011824088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
ffff888011824088 (&sbi->sb_lock){++++}-{3:3}, at: f2fs_record_stop_reason+0x52/0x1d0 fs/f2fs/super.c:4068

but task is already holding lock:
ffff88804bd92610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #2 (sb_internal#2){.+.+}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1716 [inline]
       sb_start_intwrite+0x4d/0x1c0 include/linux/fs.h:1899
       f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842
       evict+0x4e8/0x9b0 fs/inode.c:725
       f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
       evict+0x4e8/0x9b0 fs/inode.c:725
       dispose_list fs/inode.c:774 [inline]
       prune_icache_sb+0x239/0x2f0 fs/inode.c:963
       super_cache_scan+0x38c/0x4b0 fs/super.c:223
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
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

-> #1 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       __fs_reclaim_acquire mm/page_alloc.c:3834 [inline]
       fs_reclaim_acquire+0x88/0x130 mm/page_alloc.c:3848
       might_alloc include/linux/sched/mm.h:318 [inline]
       prepare_alloc_pages+0x147/0x5b0 mm/page_alloc.c:4493
       __alloc_pages_noprof+0x16f/0x710 mm/page_alloc.c:4722
       alloc_pages_mpol_noprof+0x3e8/0x680 mm/mempolicy.c:2265
       alloc_pages_noprof mm/mempolicy.c:2345 [inline]
       folio_alloc_noprof+0x128/0x180 mm/mempolicy.c:2352
       filemap_alloc_folio_noprof+0xdf/0x500 mm/filemap.c:1010
       do_read_cache_folio+0x2eb/0x850 mm/filemap.c:3787
       read_mapping_folio include/linux/pagemap.h:1011 [inline]
       f2fs_commit_super+0x3c0/0x7d0 fs/f2fs/super.c:4032
       f2fs_record_stop_reason+0x13b/0x1d0 fs/f2fs/super.c:4079
       f2fs_handle_critical_error+0x2ac/0x5c0 fs/f2fs/super.c:4174
       f2fs_write_inode+0x35f/0x4d0 fs/f2fs/inode.c:785
       write_inode fs/fs-writeback.c:1503 [inline]
       __writeback_single_inode+0x711/0x10d0 fs/fs-writeback.c:1723
       writeback_single_inode+0x1f3/0x660 fs/fs-writeback.c:1779
       sync_inode_metadata+0xc4/0x120 fs/fs-writeback.c:2849
       f2fs_release_file+0xa8/0x100 fs/f2fs/file.c:1941
       __fput+0x23f/0x880 fs/file_table.c:431
       task_work_run+0x24f/0x310 kernel/task_work.c:228
       resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
       exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
       exit_to_user_mode_prepare include/linux/entry-common.h:328 [inline]
       __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
       syscall_exit_to_user_mode+0x168/0x370 kernel/entry/common.c:218
       do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&sbi->sb_lock){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3161 [inline]
       check_prevs_add kernel/locking/lockdep.c:3280 [inline]
       validate_chain+0x18ef/0x5920 kernel/locking/lockdep.c:3904
       __lock_acquire+0x1384/0x2050 kernel/locking/lockdep.c:5202
       lock_acquire+0x1ed/0x550 kernel/locking/lockdep.c:5825
       down_write+0x99/0x220 kernel/locking/rwsem.c:1577
       f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
       f2fs_record_stop_reason+0x52/0x1d0 fs/f2fs/super.c:4068
       f2fs_handle_critical_error+0x2ac/0x5c0 fs/f2fs/super.c:4174
       f2fs_evict_inode+0xa61/0x15c0 fs/f2fs/inode.c:883
       evict+0x4e8/0x9b0 fs/inode.c:725
       f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
       evict+0x4e8/0x9b0 fs/inode.c:725
       dispose_list fs/inode.c:774 [inline]
       prune_icache_sb+0x239/0x2f0 fs/inode.c:963
       super_cache_scan+0x38c/0x4b0 fs/super.c:223
       do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
       shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
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
  &sbi->sb_lock --> fs_reclaim --> sb_internal#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(sb_internal#2);
                               lock(fs_reclaim);
                               lock(sb_internal#2);
  lock(&sbi->sb_lock);

 *** DEADLOCK ***

3 locks held by kswapd0/79:
 #0: ffffffff8ea37160 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:6844 [inline]
 #0: ffffffff8ea37160 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0xbf1/0x3700 mm/vmscan.c:7226
 #1: ffff88804bd920e0 (&type->s_umount_key#47){.+.+}-{3:3}, at: super_trylock_shared fs/super.c:562 [inline]
 #1: ffff88804bd920e0 (&type->s_umount_key#47){.+.+}-{3:3}, at: super_cache_scan+0x94/0x4b0 fs/super.c:196
 #2: ffff88804bd92610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x662/0x15c0 fs/f2fs/inode.c:842

stack backtrace:
CPU: 0 UID: 0 PID: 79 Comm: kswapd0 Not tainted 6.12.0-rc3-syzkaller-00087-gc964ced77262 #0
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
 down_write+0x99/0x220 kernel/locking/rwsem.c:1577
 f2fs_down_write fs/f2fs/f2fs.h:2199 [inline]
 f2fs_record_stop_reason+0x52/0x1d0 fs/f2fs/super.c:4068
 f2fs_handle_critical_error+0x2ac/0x5c0 fs/f2fs/super.c:4174
 f2fs_evict_inode+0xa61/0x15c0 fs/f2fs/inode.c:883
 evict+0x4e8/0x9b0 fs/inode.c:725
 f2fs_evict_inode+0x1a4/0x15c0 fs/f2fs/inode.c:807
 evict+0x4e8/0x9b0 fs/inode.c:725
 dispose_list fs/inode.c:774 [inline]
 prune_icache_sb+0x239/0x2f0 fs/inode.c:963
 super_cache_scan+0x38c/0x4b0 fs/super.c:223
 do_shrink_slab+0x701/0x1160 mm/shrinker.c:435
 shrink_slab+0x1093/0x14d0 mm/shrinker.c:662
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
