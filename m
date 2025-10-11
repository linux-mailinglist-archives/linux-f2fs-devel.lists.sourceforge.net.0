Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 56B3BBCFD7E
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 12 Oct 2025 01:14:30 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YsL7A8D/CstLKCGfdprXkEGcQmkOaMczALC7FgES36g=; b=T+iVw8qvVfVtX7Nb2nOUxMNlBm
	Gp3oOdRH6PHQtqExMnGStvvO0j9qCwSgHTnXAXr6c6FVqzx0yEK4HxLwxjFTTCjNeB1t7Imbtl229
	j/o/yY5Fh19Nwg1lz6DxZPSOuuwZm7UXJmFLbQ2JFMbFeEMMUCZiK8iEkm2ZqVThc7KI=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v7in7-00082z-Of;
	Sat, 11 Oct 2025 23:14:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3m-TqaAkbAF4OUVG6HHAN6LLE9.CKKCHAQOAN8KJPAJP.8KI@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1v7imU-0007zF-FV for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 23:13:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Hcb0IvGwyDF+zKQ4OnPf3nn2N6zm9YGR4E3ICRLLHWI=; b=QKw1nznDKvKAVA9RzZSlaxNaT8
 jpys5uFZ5OR/Nxl5/RI1Kh+2Xg5FmKAabVS61SH8v/EO/o1mKEz7/u1AlGuQPA4BRUCSZ8xCaPi1o
 K0hAvoLytzJPFlmM9e8nrZiKo0oUNyyRWQiQs/YSfT4SUIK9BVcWOl/O9/ng9eqi1PmY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Hcb0IvGwyDF+zKQ4OnPf3nn2N6zm9YGR4E3ICRLLHWI=; b=C
 ETGqpOwhd7KN0UySHSaHaCu34kaxKIdYXS81HWeOQeGpmI4Mdltt6CixLILpVallvfDnv6+CPCtP1
 GdZA6ZpWZeqOEppeymVKSVvlfbz5VMLf7LpzrAOH6LI3tX3Xk0AOMYFtP9sBncPKS4ZwdzQdeOFXN
 EvUjhfbBoycE2+Z4=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v7imU-0001fD-G8 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 11 Oct 2025 23:13:43 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-93bbd28b4f3so1016474139f.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 11 Oct 2025 16:13:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760224412; x=1760829212;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Hcb0IvGwyDF+zKQ4OnPf3nn2N6zm9YGR4E3ICRLLHWI=;
 b=h9krLBJjR7Dh6wdAuCU8YjUq7s+arr4OA/dLOqigHv+ZfDQBFisqJutBmWQIHtoAGw
 Jo42CEdryXN0MP7qgvXWe4FGGeazmdbxG4/WWRxk3aeQisN48SVHh0krNFIdY11s3oGv
 iN2OrVu3DATOkR5kjQFzSWMoXJBei3PCg85e27ubLB960nS2OZICEY8KzUgyNWVP3SFV
 Ti+7eDZsg51WnU38sNswLHkRQXBz4hYBvX2+aCSSrx8LMKqi7cO1sCGyrdFb3Pye0gbf
 gxAfHEWelou9duQpcgu6rscLifEGspRPjLSLQivwbPmv3RzNKgnPa+P8MwLWCYVyKAPd
 xR+Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXfdhaSIShwzrHfG11gPrrqyWk9DoQ1irZRNG+uDMPno3PVtdv8v7pi3q5uJ/Ag4dscrPkyNRGrSjVb535+9b0h@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxKS7s3fkgtxZDOJsoMNSHE9hWXRvyN2XgDyIGf0F/2378MNmxH
 ABUR1tuXibWI00DhYaICmzRLeX6pf5lmxeUae7SXeb76JX3so6SMdyqW6yl91mG2iw8wkWqwrd4
 TWU2oNh7BTg1BuPdWj4uAlObV8TpW8SZ/TskiB2lwknNiIKgMoDH1l5vp2VU=
X-Google-Smtp-Source: AGHT+IGlax2PylLVRjOgYwpJPGlmlM0UhfuvBdd6TdQAodSSpA3ieGaIBNVWNI0oihkGWTcco1DfyUJBIv3CQxw1bSpzX/rhxG8b
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1fcb:b0:42d:8695:12f with SMTP id
 e9e14a558f8ab-42f873fd81cmr182003055ab.23.1760224411799; Sat, 11 Oct 2025
 16:13:31 -0700 (PDT)
Date: Sat, 11 Oct 2025 16:13:31 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68eae49b.050a0220.ac43.0001.GAE@google.com>
From: syzbot <syzbot+14b90e1156b9f6fc1266@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: c746c3b51698
 Merge tag 'for-6.18-tag' of git://git.kernel... git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=13bb7334580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.77 listed in wl.mailspike.net]
X-Headers-End: 1v7imU-0001fD-G8
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_do_truncate_blocks
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

HEAD commit:    c746c3b51698 Merge tag 'for-6.18-tag' of git://git.kernel...
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=13bb7334580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c1486b135ff0ff9b
dashboard link: https://syzkaller.appspot.com/bug?extid=14b90e1156b9f6fc1266
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/d900f083ada3/non_bootable_disk-c746c3b5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/8de5aa0a3f80/vmlinux-c746c3b5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/797705bd8ae3/bzImage-c746c3b5.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+14b90e1156b9f6fc1266@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
syzkaller #0 Not tainted
------------------------------------------------------
kswapd0/73 is trying to acquire lock:
ffff888032fb03b0 (&sbi->cp_rwsem){.+.+}-{4:4}, at: f2fs_down_read fs/f2fs/f2fs.h:2278 [inline]
ffff888032fb03b0 (&sbi->cp_rwsem){.+.+}-{4:4}, at: f2fs_lock_op fs/f2fs/f2fs.h:2357 [inline]
ffff888032fb03b0 (&sbi->cp_rwsem){.+.+}-{4:4}, at: f2fs_do_truncate_blocks+0x21c/0x10c0 fs/f2fs/file.c:791

but task is already holding lock:
ffff888011840610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x8d9/0x1b60 fs/f2fs/inode.c:890

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #3 (sb_internal#2){.+.+}-{0:0}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       percpu_down_read_internal include/linux/percpu-rwsem.h:53 [inline]
       percpu_down_read_freezable include/linux/percpu-rwsem.h:83 [inline]
       __sb_start_write include/linux/fs.h:1916 [inline]
       sb_start_intwrite+0x4d/0x1c0 include/linux/fs.h:2099
       f2fs_evict_inode+0x8d9/0x1b60 fs/f2fs/inode.c:890
       evict+0x504/0x9c0 fs/inode.c:810
       f2fs_evict_inode+0x1dc/0x1b60 fs/f2fs/inode.c:853
       evict+0x504/0x9c0 fs/inode.c:810
       dispose_list fs/inode.c:852 [inline]
       prune_icache_sb+0x21b/0x2c0 fs/inode.c:1000
       super_cache_scan+0x39b/0x4b0 fs/super.c:224
       do_shrink_slab+0x6ef/0x1110 mm/shrinker.c:437
       shrink_slab_memcg mm/shrinker.c:550 [inline]
       shrink_slab+0x7ef/0x10d0 mm/shrinker.c:628
       shrink_one+0x28a/0x7c0 mm/vmscan.c:4955
       shrink_many mm/vmscan.c:5016 [inline]
       lru_gen_shrink_node mm/vmscan.c:5094 [inline]
       shrink_node+0x315d/0x3780 mm/vmscan.c:6081
       kswapd_shrink_node mm/vmscan.c:6941 [inline]
       balance_pgdat mm/vmscan.c:7124 [inline]
       kswapd+0x147c/0x2800 mm/vmscan.c:7389
       kthread+0x70e/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

-> #2 (fs_reclaim){+.+.}-{0:0}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       __fs_reclaim_acquire mm/page_alloc.c:4269 [inline]
       fs_reclaim_acquire+0x72/0x100 mm/page_alloc.c:4283
       might_alloc include/linux/sched/mm.h:318 [inline]
       prepare_alloc_pages+0x153/0x610 mm/page_alloc.c:4951
       __alloc_frozen_pages_noprof+0x123/0x370 mm/page_alloc.c:5172
       alloc_pages_mpol+0x232/0x4a0 mm/mempolicy.c:2416
       alloc_frozen_pages_noprof mm/mempolicy.c:2487 [inline]
       alloc_pages_noprof+0xa9/0x190 mm/mempolicy.c:2507
       folio_alloc_noprof+0x1e/0x30 mm/mempolicy.c:2517
       filemap_alloc_folio_noprof+0xdf/0x470 mm/filemap.c:1020
       do_read_cache_folio+0x2da/0x590 mm/filemap.c:3986
       read_mapping_folio include/linux/pagemap.h:999 [inline]
       f2fs_commit_super+0x277/0x5e0 fs/f2fs/super.c:4479
       f2fs_record_errors fs/f2fs/super.c:4573 [inline]
       f2fs_handle_error+0x183/0x240 fs/f2fs/super.c:4585
       lookup_all_xattrs fs/f2fs/xattr.c:371 [inline]
       f2fs_getxattr+0x92f/0xe70 fs/f2fs/xattr.c:533
       __vfs_getxattr+0x3f1/0x430 fs/xattr.c:423
       cap_inode_need_killpriv+0x45/0x60 security/commoncap.c:331
       security_inode_need_killpriv+0x89/0x270 security/security.c:2707
       dentry_needs_remove_privs+0x8d/0x100 fs/inode.c:2213
       do_truncate+0xfe/0x220 fs/open.c:57
       handle_truncate fs/namei.c:3596 [inline]
       do_open fs/namei.c:3979 [inline]
       path_openat+0x306c/0x3830 fs/namei.c:4134
       do_filp_open+0x1fa/0x410 fs/namei.c:4161
       do_sys_openat2+0x121/0x1c0 fs/open.c:1437
       do_sys_open fs/open.c:1452 [inline]
       __do_sys_openat fs/open.c:1468 [inline]
       __se_sys_openat fs/open.c:1463 [inline]
       __x64_sys_openat+0x138/0x170 fs/open.c:1463
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #1 (&sbi->sb_lock){+.+.}-{4:4}:
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       down_write+0x96/0x1f0 kernel/locking/rwsem.c:1590
       f2fs_down_write fs/f2fs/f2fs.h:2294 [inline]
       f2fs_record_errors fs/f2fs/super.c:4568 [inline]
       f2fs_handle_error+0xde/0x240 fs/f2fs/super.c:4585
       f2fs_check_nid_range fs/f2fs/node.c:44 [inline]
       __get_node_folio+0xff6/0x14f0 fs/f2fs/node.c:1548
       f2fs_get_node_folio fs/f2fs/node.c:1597 [inline]
       f2fs_get_dnode_of_data+0xab4/0x1cf0 fs/f2fs/node.c:879
       __replace_atomic_write_block+0x152/0x14a0 fs/f2fs/segment.c:234
       __f2fs_commit_atomic_write fs/f2fs/segment.c:355 [inline]
       f2fs_commit_atomic_write+0x93a/0x1930 fs/f2fs/segment.c:412
       f2fs_ioc_commit_atomic_write fs/f2fs/file.c:2380 [inline]
       __f2fs_ioctl+0x3f31/0xb5b0 fs/f2fs/file.c:4624
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:597 [inline]
       __se_sys_ioctl+0xf9/0x170 fs/ioctl.c:583
       do_syscall_x64 arch/x86/entry/syscall_64.c:63 [inline]
       do_syscall_64+0xfa/0xfa0 arch/x86/entry/syscall_64.c:94
       entry_SYSCALL_64_after_hwframe+0x77/0x7f

-> #0 (&sbi->cp_rwsem){.+.+}-{4:4}:
       check_prev_add kernel/locking/lockdep.c:3165 [inline]
       check_prevs_add kernel/locking/lockdep.c:3284 [inline]
       validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
       __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
       lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
       down_read+0x46/0x2e0 kernel/locking/rwsem.c:1537
       f2fs_down_read fs/f2fs/f2fs.h:2278 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2357 [inline]
       f2fs_do_truncate_blocks+0x21c/0x10c0 fs/f2fs/file.c:791
       f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:867
       f2fs_truncate+0x489/0x7c0 fs/f2fs/file.c:925
       f2fs_evict_inode+0x9f2/0x1b60 fs/f2fs/inode.c:897
       evict+0x504/0x9c0 fs/inode.c:810
       f2fs_evict_inode+0x1dc/0x1b60 fs/f2fs/inode.c:853
       evict+0x504/0x9c0 fs/inode.c:810
       dispose_list fs/inode.c:852 [inline]
       prune_icache_sb+0x21b/0x2c0 fs/inode.c:1000
       super_cache_scan+0x39b/0x4b0 fs/super.c:224
       do_shrink_slab+0x6ef/0x1110 mm/shrinker.c:437
       shrink_slab_memcg mm/shrinker.c:550 [inline]
       shrink_slab+0x7ef/0x10d0 mm/shrinker.c:628
       shrink_one+0x28a/0x7c0 mm/vmscan.c:4955
       shrink_many mm/vmscan.c:5016 [inline]
       lru_gen_shrink_node mm/vmscan.c:5094 [inline]
       shrink_node+0x315d/0x3780 mm/vmscan.c:6081
       kswapd_shrink_node mm/vmscan.c:6941 [inline]
       balance_pgdat mm/vmscan.c:7124 [inline]
       kswapd+0x147c/0x2800 mm/vmscan.c:7389
       kthread+0x70e/0x8a0 kernel/kthread.c:463
       ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
       ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245

other info that might help us debug this:

Chain exists of:
  &sbi->cp_rwsem --> fs_reclaim --> sb_internal#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  rlock(sb_internal#2);
                               lock(fs_reclaim);
                               lock(sb_internal#2);
  rlock(&sbi->cp_rwsem);

 *** DEADLOCK ***

3 locks held by kswapd0/73:
 #0: ffffffff8e247a40 (fs_reclaim){+.+.}-{0:0}, at: balance_pgdat mm/vmscan.c:7015 [inline]
 #0: ffffffff8e247a40 (fs_reclaim){+.+.}-{0:0}, at: kswapd+0x951/0x2800 mm/vmscan.c:7389
 #1: ffff8880118400e0 (&type->s_umount_key#50){.+.+}-{4:4}, at: super_trylock_shared fs/super.c:562 [inline]
 #1: ffff8880118400e0 (&type->s_umount_key#50){.+.+}-{4:4}, at: super_cache_scan+0x91/0x4b0 fs/super.c:197
 #2: ffff888011840610 (sb_internal#2){.+.+}-{0:0}, at: f2fs_evict_inode+0x8d9/0x1b60 fs/f2fs/inode.c:890

stack backtrace:
CPU: 0 UID: 0 PID: 73 Comm: kswapd0 Not tainted syzkaller #0 PREEMPT(full) 
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.3-debian-1.16.3-2~bpo12+1 04/01/2014
Call Trace:
 <TASK>
 dump_stack_lvl+0x189/0x250 lib/dump_stack.c:120
 print_circular_bug+0x2ee/0x310 kernel/locking/lockdep.c:2043
 check_noncircular+0x134/0x160 kernel/locking/lockdep.c:2175
 check_prev_add kernel/locking/lockdep.c:3165 [inline]
 check_prevs_add kernel/locking/lockdep.c:3284 [inline]
 validate_chain+0xb9b/0x2140 kernel/locking/lockdep.c:3908
 __lock_acquire+0xab9/0xd20 kernel/locking/lockdep.c:5237
 lock_acquire+0x120/0x360 kernel/locking/lockdep.c:5868
 down_read+0x46/0x2e0 kernel/locking/rwsem.c:1537
 f2fs_down_read fs/f2fs/f2fs.h:2278 [inline]
 f2fs_lock_op fs/f2fs/f2fs.h:2357 [inline]
 f2fs_do_truncate_blocks+0x21c/0x10c0 fs/f2fs/file.c:791
 f2fs_truncate_blocks+0x10a/0x300 fs/f2fs/file.c:867
 f2fs_truncate+0x489/0x7c0 fs/f2fs/file.c:925
 f2fs_evict_inode+0x9f2/0x1b60 fs/f2fs/inode.c:897
 evict+0x504/0x9c0 fs/inode.c:810
 f2fs_evict_inode+0x1dc/0x1b60 fs/f2fs/inode.c:853
 evict+0x504/0x9c0 fs/inode.c:810
 dispose_list fs/inode.c:852 [inline]
 prune_icache_sb+0x21b/0x2c0 fs/inode.c:1000
 super_cache_scan+0x39b/0x4b0 fs/super.c:224
 do_shrink_slab+0x6ef/0x1110 mm/shrinker.c:437
 shrink_slab_memcg mm/shrinker.c:550 [inline]
 shrink_slab+0x7ef/0x10d0 mm/shrinker.c:628
 shrink_one+0x28a/0x7c0 mm/vmscan.c:4955
 shrink_many mm/vmscan.c:5016 [inline]
 lru_gen_shrink_node mm/vmscan.c:5094 [inline]
 shrink_node+0x315d/0x3780 mm/vmscan.c:6081
 kswapd_shrink_node mm/vmscan.c:6941 [inline]
 balance_pgdat mm/vmscan.c:7124 [inline]
 kswapd+0x147c/0x2800 mm/vmscan.c:7389
 kthread+0x70e/0x8a0 kernel/kthread.c:463
 ret_from_fork+0x4bc/0x870 arch/x86/kernel/process.c:158
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
