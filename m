Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A61765738E
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Dec 2022 08:16:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pAQfT-0004F6-0P;
	Wed, 28 Dec 2022 07:16:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3J-2rYwkbANQIOPA0BB4H0FF83.6EE6B4KI4H2EDJ4DJ.2EC@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pAQfS-0004Ez-82 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Dec 2022 07:16:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8IVZWs7Fj0bD4vFVaAmg70gyF/cHcfBs+WGR7kbCiZQ=; b=donbDSt3ysvzre/n9g9/P5/dmR
 ZqC+2EJ2/gdsNiE0OU17l4mtAfWYNqdDt5RD8Jw3CenEjH9bYD9WwWmrGDkl6SCZ/PFC/Bph4Wwvg
 sE+UsXmUYvzlpBzOoW5y+5kh1gMRa3NgY4HZN33QGWZvHWczoMaNkOQA4byl05hAPXv8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8IVZWs7Fj0bD4vFVaAmg70gyF/cHcfBs+WGR7kbCiZQ=; b=g
 RT0ES+9dWU2b/QE5JD22NASkNLEL8Rl6xOLd+mpEX5gUlXcjfOgsARJJrQ7O7Q+AAyElzEpXKRujX
 oo2ZHRPK7q6pfGSc9S94mhV69JEVmar9mXyyx8a7WyNMtwmIY8FC99zL+JwAyDOvEKnOGpu+H3cCH
 sDX91yvHCXt3D15E=;
Received: from mail-il1-f197.google.com ([209.85.166.197])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pAQfO-00051T-2T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Dec 2022 07:16:02 +0000
Received: by mail-il1-f197.google.com with SMTP id
 r6-20020a92cd86000000b00304b2d1c2d7so9795764ilb.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 27 Dec 2022 23:15:58 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8IVZWs7Fj0bD4vFVaAmg70gyF/cHcfBs+WGR7kbCiZQ=;
 b=NkU9gziI45kTDbwOtcZGO7v6ObYCpe2OtFSfCMRYgNXADHI50DN3XjXXcpe6AwoIl8
 Jv4lne4pD5tk8z6CuXgowjeYnOxrHP4PNJh/WEbUrJxivtGhvogaFMxLORjmrpgCBc4v
 OKhnNNOYF0EBCAZJylFOvjCM1alOHKKUQRFhD8kmwMvA0+Ssa7Er//ZxioKoLEj52CzU
 vMyVd59BNr8vEU63CCPmjCdkuFXZJMoYLv4mVnoCE9kkjBdK0Af43LCfDlJ2FinhYvUK
 TkkSUcXP7IAo56lI6grLEQv09WmwrkscHZ/SKuEYENKXO8c9QHZjpw74l/4Hg7hWC44e
 bSAA==
X-Gm-Message-State: AFqh2kp+cD9/s2f36u8PBZt4+eqIDauElT12q5lAiU5OBEwEKtuXeXVF
 xLF9wRfG9tCcnZDNeJKfhWCCJePf4a0Z+6LTxQ4JbMP/ztLo
X-Google-Smtp-Source: AMrXdXth64vSMVEIGS56YbTcK4Wa4bLCYK8U9HKN3jufZ7lw4iSDgWsVELPaVX7YWdJe0FQX7AIajmO005hM8T8nPiYD0UOuEcrx
MIME-Version: 1.0
X-Received: by 2002:a02:711c:0:b0:38a:c412:6ed0 with SMTP id
 n28-20020a02711c000000b0038ac4126ed0mr2351775jac.27.1672211751700; Tue, 27
 Dec 2022 23:15:51 -0800 (PST)
Date: Tue, 27 Dec 2022 23:15:51 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000730db305f0de2300@google.com>
From: syzbot <syzbot+fb4ca11228cf7fef7938@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: a27405b2ed9c
 Merge tag 'sound-6.2-rc1-2' of git://git.kern.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=179bf81f880000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.197 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.197 listed in wl.mailspike.net]
X-Headers-End: 1pAQfO-00051T-2T
Subject: [f2fs-dev] [syzbot] [f2fs?] possible deadlock in
 f2fs_vm_page_mkwrite
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

HEAD commit:    a27405b2ed9c Merge tag 'sound-6.2-rc1-2' of git://git.kern..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=179bf81f880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b0e81c4eb13a67cd
dashboard link: https://syzkaller.appspot.com/bug?extid=fb4ca11228cf7fef7938
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/a20faa4894d9/disk-a27405b2.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/ab24ee3f0e4b/vmlinux-a27405b2.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8d684f455dae/bzImage-a27405b2.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fb4ca11228cf7fef7938@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.1.0-syzkaller-14565-ga27405b2ed9c #0 Not tainted
------------------------------------------------------
syz-executor.2/24424 is trying to acquire lock:
ffff888083cd8670 (mapping.invalidate_lock#5){++++}-{3:3}, at: filemap_invalidate_lock_shared include/linux/fs.h:811 [inline]
ffff888083cd8670 (mapping.invalidate_lock#5){++++}-{3:3}, at: f2fs_vm_page_mkwrite+0x630/0x1c90 fs/f2fs/file.c:104

but task is already holding lock:
ffff888085076558 (sb_pagefaults#2){.+.+}-{0:0}, at: do_page_mkwrite+0x19b/0x680 mm/memory.c:2947

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #6 (sb_pagefaults#2){.+.+}-{0:0}:
       percpu_down_read include/linux/percpu-rwsem.h:51 [inline]
       __sb_start_write include/linux/fs.h:1811 [inline]
       sb_start_pagefault include/linux/fs.h:1915 [inline]
       f2fs_vm_page_mkwrite+0x48a/0x1c90 fs/f2fs/file.c:99
       do_page_mkwrite+0x19b/0x680 mm/memory.c:2947
       wp_page_shared mm/memory.c:3295 [inline]
       do_wp_page+0x353/0x3370 mm/memory.c:3377
       handle_pte_fault mm/memory.c:4949 [inline]
       __handle_mm_fault+0x1f58/0x3c90 mm/memory.c:5073
       handle_mm_fault+0x1b6/0x850 mm/memory.c:5219
       do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1428
       handle_page_fault arch/x86/mm/fault.c:1519 [inline]
       exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1575
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570

-> #5 (&mm->mmap_lock){++++}-{3:3}:
       __might_fault mm/memory.c:5647 [inline]
       __might_fault+0x10c/0x180 mm/memory.c:5640
       _copy_to_user+0x29/0x150 lib/usercopy.c:29
       copy_to_user include/linux/uaccess.h:169 [inline]
       f2fs_ioc_get_encryption_pwsalt+0x2b2/0x370 fs/f2fs/file.c:2365
       __f2fs_ioctl+0x29f1/0xaaf0 fs/f2fs/file.c:4169
       f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4242
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #4 (&sbi->sb_lock){++++}-{3:3}:
       down_write+0x94/0x220 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2213 [inline]
       f2fs_handle_error+0x8e/0x200 fs/f2fs/super.c:3926
       check_block_count+0x440/0x4f0 fs/f2fs/segment.h:765
       build_sit_entries fs/f2fs/segment.c:4471 [inline]
       f2fs_build_segment_manager+0x5a08/0xa650 fs/f2fs/segment.c:5162
       f2fs_fill_super+0x3aba/0x7680 fs/f2fs/super.c:4328
       mount_bdev+0x351/0x410 fs/super.c:1359
       legacy_get_tree+0x109/0x220 fs/fs_context.c:610
       vfs_get_tree+0x8d/0x2f0 fs/super.c:1489
       do_new_mount fs/namespace.c:3145 [inline]
       path_mount+0x132a/0x1e20 fs/namespace.c:3475
       do_mount fs/namespace.c:3488 [inline]
       __do_sys_mount fs/namespace.c:3697 [inline]
       __se_sys_mount fs/namespace.c:3674 [inline]
       __x64_sys_mount+0x283/0x300 fs/namespace.c:3674
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #3 (&array[i].journal_rwsem){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       scan_curseg_cache+0xa7/0x3b0 fs/f2fs/node.c:2404
       __f2fs_build_free_nids+0x761/0xe10 fs/f2fs/node.c:2516
       f2fs_build_free_nids fs/f2fs/node.c:2531 [inline]
       f2fs_build_node_manager+0x2007/0x2fb0 fs/f2fs/node.c:3316
       f2fs_fill_super+0x3ade/0x7680 fs/f2fs/super.c:4334
       mount_bdev+0x351/0x410 fs/super.c:1359
       legacy_get_tree+0x109/0x220 fs/fs_context.c:610
       vfs_get_tree+0x8d/0x2f0 fs/super.c:1489
       do_new_mount fs/namespace.c:3145 [inline]
       path_mount+0x132a/0x1e20 fs/namespace.c:3475
       do_mount fs/namespace.c:3488 [inline]
       __do_sys_mount fs/namespace.c:3697 [inline]
       __se_sys_mount fs/namespace.c:3674 [inline]
       __x64_sys_mount+0x283/0x300 fs/namespace.c:3674
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #2 (&nm_i->nat_tree_lock){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
       f2fs_get_node_info+0x1ac/0x1070 fs/f2fs/node.c:564
       f2fs_do_write_data_page+0x7f5/0x1e20 fs/f2fs/data.c:2728
       f2fs_write_single_data_page+0x13f0/0x1920 fs/f2fs/data.c:2863
       f2fs_write_cache_pages+0xaa8/0x2010 fs/f2fs/data.c:3115
       __f2fs_write_data_pages fs/f2fs/data.c:3265 [inline]
       f2fs_write_data_pages+0x4c7/0x1230 fs/f2fs/data.c:3292
       do_writepages+0x1af/0x690 mm/page-writeback.c:2581
       filemap_fdatawrite_wbc mm/filemap.c:388 [inline]
       filemap_fdatawrite_wbc+0x147/0x1b0 mm/filemap.c:378
       __filemap_fdatawrite_range+0xb8/0xf0 mm/filemap.c:421
       file_write_and_wait_range+0xce/0x140 mm/filemap.c:777
       f2fs_do_sync_file+0x3a4/0x2a20 fs/f2fs/file.c:275
       f2fs_sync_file+0x13a/0x190 fs/f2fs/file.c:393
       vfs_fsync_range+0x13e/0x230 fs/sync.c:188
       generic_write_sync include/linux/fs.h:2882 [inline]
       f2fs_file_write_iter+0x1840/0x31c0 fs/f2fs/file.c:4721
       call_write_iter include/linux/fs.h:2186 [inline]
       new_sync_write fs/read_write.c:491 [inline]
       vfs_write+0x9ed/0xdd0 fs/read_write.c:584
       ksys_write+0x12b/0x250 fs/read_write.c:637
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #1 (&sbi->cp_rwsem){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2188 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2231 [inline]
       f2fs_do_truncate_blocks+0x6ae/0x11e0 fs/f2fs/file.c:688
       f2fs_truncate_blocks+0x7b/0x310 fs/f2fs/file.c:751
       f2fs_truncate.part.0+0x498/0x7c0 fs/f2fs/file.c:803
       f2fs_truncate include/linux/fs.h:806 [inline]
       f2fs_setattr+0x1b00/0x2350 fs/f2fs/file.c:1010
       notify_change+0xca7/0x1420 fs/attr.c:482
       do_truncate+0x143/0x200 fs/open.c:65
       handle_truncate fs/namei.c:3216 [inline]
       do_open fs/namei.c:3561 [inline]
       path_openat+0x2157/0x2a50 fs/namei.c:3714
       do_filp_open+0x1ba/0x410 fs/namei.c:3741
       do_sys_openat2+0x16d/0x4c0 fs/open.c:1310
       do_sys_open fs/open.c:1326 [inline]
       __do_sys_openat fs/open.c:1342 [inline]
       __se_sys_openat fs/open.c:1337 [inline]
       __x64_sys_openat+0x143/0x1f0 fs/open.c:1337
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (mapping.invalidate_lock#5){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
       lock_acquire kernel/locking/lockdep.c:5668 [inline]
       lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       filemap_invalidate_lock_shared include/linux/fs.h:811 [inline]
       f2fs_vm_page_mkwrite+0x630/0x1c90 fs/f2fs/file.c:104
       do_page_mkwrite+0x19b/0x680 mm/memory.c:2947
       wp_page_shared mm/memory.c:3295 [inline]
       do_wp_page+0x353/0x3370 mm/memory.c:3377
       handle_pte_fault mm/memory.c:4949 [inline]
       __handle_mm_fault+0x1f58/0x3c90 mm/memory.c:5073
       handle_mm_fault+0x1b6/0x850 mm/memory.c:5219
       do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1428
       handle_page_fault arch/x86/mm/fault.c:1519 [inline]
       exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1575
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570

other info that might help us debug this:

Chain exists of:
  mapping.invalidate_lock#5 --> &mm->mmap_lock --> sb_pagefaults#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(sb_pagefaults#2);
                               lock(&mm->mmap_lock);
                               lock(sb_pagefaults#2);
  lock(mapping.invalidate_lock#5);

 *** DEADLOCK ***

2 locks held by syz-executor.2/24424:
 #0: ffff88808236aa58 (&mm->mmap_lock){++++}-{3:3}, at: mmap_read_trylock include/linux/mmap_lock.h:136 [inline]
 #0: ffff88808236aa58 (&mm->mmap_lock){++++}-{3:3}, at: do_user_addr_fault+0x276/0x1210 arch/x86/mm/fault.c:1369
 #1: ffff888085076558 (sb_pagefaults#2){.+.+}-{0:0}, at: do_page_mkwrite+0x19b/0x680 mm/memory.c:2947

stack backtrace:
CPU: 1 PID: 24424 Comm: syz-executor.2 Not tainted 6.1.0-syzkaller-14565-ga27405b2ed9c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd1/0x138 lib/dump_stack.c:106
 check_noncircular+0x25f/0x2e0 kernel/locking/lockdep.c:2177
 check_prev_add kernel/locking/lockdep.c:3097 [inline]
 check_prevs_add kernel/locking/lockdep.c:3216 [inline]
 validate_chain kernel/locking/lockdep.c:3831 [inline]
 __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
 lock_acquire kernel/locking/lockdep.c:5668 [inline]
 lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
 down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
 filemap_invalidate_lock_shared include/linux/fs.h:811 [inline]
 f2fs_vm_page_mkwrite+0x630/0x1c90 fs/f2fs/file.c:104
 do_page_mkwrite+0x19b/0x680 mm/memory.c:2947
 wp_page_shared mm/memory.c:3295 [inline]
 do_wp_page+0x353/0x3370 mm/memory.c:3377
 handle_pte_fault mm/memory.c:4949 [inline]
 __handle_mm_fault+0x1f58/0x3c90 mm/memory.c:5073
 handle_mm_fault+0x1b6/0x850 mm/memory.c:5219
 do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1428
 handle_page_fault arch/x86/mm/fault.c:1519 [inline]
 exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1575
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
RIP: 0033:0x7f7704e2bd49
Code: 48 8b 04 24 48 85 c0 74 17 48 8b 54 24 18 48 0f ca 48 89 54 24 18 48 83 f8 01 0f 85 9b 02 00 00 48 8b 44 24 10 48 8b 54 24 18 <48> 89 10 e9 c2 fd ff ff 48 8b 44 24 10 0f b7 10 48 8b 04 24 48 85
RSP: 002b:00007fff6cf850f0 EFLAGS: 00010246
RAX: 00000000200015c0 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000020000080 RSI: 0000000000000000 RDI: 000055555625c2e8
RBP: 00007fff6cf851e8 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f7704a08208 R11: 0000000000000246 R12: 00000000000f9793
R13: 00007fff6cf85210 R14: 00007f7704fac050 R15: 0000000000000032
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
