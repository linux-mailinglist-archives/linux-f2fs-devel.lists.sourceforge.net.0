Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9431E64FDA3
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 18 Dec 2022 05:50:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6lch-0001AR-IF;
	Sun, 18 Dec 2022 04:50:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <355ueYwkbALwu01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1p6lcU-00019n-JR for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Dec 2022 04:49:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=n+FhJfj6E7sl4Slr4Gk9jkrev2nAPwkP+1YOGwn7/nI=; b=IByb5UYTu1U5qTvmBP610E4gWc
 Gvk1YGEfFg7DdDHq9p/AMUwR2b+PE6YlCxBKCSRnJ0hYaco5XHJBmNhnxY7cC9Nwjppit5yjdp8ku
 r82bvkXCMJWvJCPf/JZQKPnWPGT3TJTf/izHqr9ow/cIIZU/Nj4Eu1A7m6b/9kNmw4C4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=n+FhJfj6E7sl4Slr4Gk9jkrev2nAPwkP+1YOGwn7/nI=; b=f
 /TQLqjiQOvHI46sKKbiKUxFZH5LcKWxOOq7bfWySwv2zNhbqjWaM3SNL1ww2Qk0vdynNE5bSMNXOJ
 fBheY1LNBn+KQDUfIpSn36T0S9f896hPgLalK+ZdCAR4QGuClIphIe3l2kmNeS7JrXZEQ8bHxsZZy
 81/umjHskX5DcvAE=;
Received: from mail-il1-f200.google.com ([209.85.166.200])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p6lcT-0003hF-E8 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 18 Dec 2022 04:49:50 +0000
Received: by mail-il1-f200.google.com with SMTP id
 l13-20020a056e0212ed00b00304c6338d79so4597814iln.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 17 Dec 2022 20:49:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=n+FhJfj6E7sl4Slr4Gk9jkrev2nAPwkP+1YOGwn7/nI=;
 b=RV6TdSfaUhyrz9wb4qNCTsmOi6WTjpzsWEOx9FWfwDWPBLhWgYFNvkoPAQCW9wySk4
 zz/cUalvDLvovaAPtvuMj6ZUpDyEm2xVbrmpRAXqExqpg1Fwf62/rKQcNknRcrjaQ91a
 hv2+uOU0jXiOdWaXw1c6WoryYjUsJJBmAJI4yiZ7C/7hIGi45pzqEa2oNwpElOF6w396
 pnRFGXNB7adOZ6NU+7va4iNeKItZmggQxsuJhTa5BENpL3gg22cWLyTgGkgAxC4JRwyp
 SCHK0Srgewf3peI8hkbEU3gw4hR4/HbFqskCtLOF8OUKTwxW6mSkz10V00iWCXE0Z/U/
 gSuw==
X-Gm-Message-State: ANoB5pnnxj2/YLZvqB39Y5kElV0l3lVS4x/zSv4LxF7/RuVJW0vGwk6M
 lrtURk3nckAOsFmXxfN9e92u+kxt7hM0oLLqP7ghbLw5wlkp
X-Google-Smtp-Source: AA0mqf4GLbDAV6RIeq9fKN7QMUj4o2Ad7tVqtX7M1HYJlN87vomHlldCggZ7Kv09k/FE6ZqKtU+cHo42pohdoyl86eSpmbpTvY/g
MIME-Version: 1.0
X-Received: by 2002:a02:190a:0:b0:376:1ab0:7bd5 with SMTP id
 b10-20020a02190a000000b003761ab07bd5mr40704693jab.8.1671338983563; Sat, 17
 Dec 2022 20:49:43 -0800 (PST)
Date: Sat, 17 Dec 2022 20:49:43 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000006a289e05f012ee28@google.com>
From: syzbot <syzbot+77204b1ec54dde7158d6@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 764822972d64
 Merge tag 'nfsd-6.2' of git://git.kernel.org/.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=123f0db7880000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.200 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.200 listed in list.dnswl.org]
X-Headers-End: 1p6lcT-0003hF-E8
Subject: [f2fs-dev] [syzbot] possible deadlock in f2fs_convert_inline_inode
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

HEAD commit:    764822972d64 Merge tag 'nfsd-6.2' of git://git.kernel.org/..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=123f0db7880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=56488a108d0b7cb8
dashboard link: https://syzkaller.appspot.com/bug?extid=77204b1ec54dde7158d6
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/10cd94ab1fd0/disk-76482297.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/4116972537f8/vmlinux-76482297.xz
kernel image: https://storage.googleapis.com/syzbot-assets/4a815774b892/bzImage-76482297.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+77204b1ec54dde7158d6@syzkaller.appspotmail.com

======================================================
WARNING: possible circular locking dependency detected
6.1.0-syzkaller-03225-g764822972d64 #0 Not tainted
------------------------------------------------------
syz-executor.2/12276 is trying to acquire lock:
ffff888022de03b0 (&sbi->cp_rwsem){++++}-{3:3}, at: f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
ffff888022de03b0 (&sbi->cp_rwsem){++++}-{3:3}, at: f2fs_lock_op fs/f2fs/f2fs.h:2223 [inline]
ffff888022de03b0 (&sbi->cp_rwsem){++++}-{3:3}, at: f2fs_convert_inline_inode+0x481/0x8f0 fs/f2fs/inline.c:219

but task is already holding lock:
ffff88801c84e6d8 (&mm->mmap_lock#2){++++}-{3:3}, at: mmap_read_trylock include/linux/mmap_lock.h:136 [inline]
ffff88801c84e6d8 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x276/0x1210 arch/x86/mm/fault.c:1369

which lock already depends on the new lock.


the existing dependency chain (in reverse order) is:

-> #4 (&mm->mmap_lock#2){++++}-{3:3}:
       __might_fault mm/memory.c:5645 [inline]
       __might_fault+0x10c/0x180 mm/memory.c:5638
       _copy_to_user+0x29/0x150 lib/usercopy.c:29
       copy_to_user include/linux/uaccess.h:169 [inline]
       f2fs_ioc_get_encryption_pwsalt+0x2b2/0x370 fs/f2fs/file.c:2349
       __f2fs_ioctl+0x1755/0xa7c0 fs/f2fs/file.c:4151
       f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4224
       vfs_ioctl fs/ioctl.c:51 [inline]
       __do_sys_ioctl fs/ioctl.c:870 [inline]
       __se_sys_ioctl fs/ioctl.c:856 [inline]
       __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #3 (&sbi->sb_lock){++++}-{3:3}:
       down_write+0x94/0x220 kernel/locking/rwsem.c:1562
       f2fs_down_write fs/f2fs/f2fs.h:2205 [inline]
       f2fs_handle_error+0x8e/0x200 fs/f2fs/super.c:3898
       check_block_count+0x440/0x4f0 fs/f2fs/segment.h:771
       build_sit_entries fs/f2fs/segment.c:4432 [inline]
       f2fs_build_segment_manager+0x5a30/0xa670 fs/f2fs/segment.c:5123
       f2fs_fill_super+0x3a73/0x77a0 fs/f2fs/super.c:4300
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

-> #2 (&array[i].journal_rwsem){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       scan_curseg_cache+0xa7/0x3b0 fs/f2fs/node.c:2401
       __f2fs_build_free_nids+0x761/0xe10 fs/f2fs/node.c:2513
       f2fs_build_free_nids fs/f2fs/node.c:2528 [inline]
       f2fs_build_node_manager+0x2007/0x2fb0 fs/f2fs/node.c:3313
       f2fs_fill_super+0x3a95/0x77a0 fs/f2fs/super.c:4306
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

-> #1 (&nm_i->nat_tree_lock){++++}-{3:3}:
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_get_node_info+0x1ac/0x1070 fs/f2fs/node.c:560
       __allocate_data_block+0x180/0xbf0 fs/f2fs/data.c:1425
       f2fs_map_blocks+0x1505/0x3600 fs/f2fs/data.c:1608
       f2fs_preallocate_blocks fs/f2fs/file.c:4451 [inline]
       f2fs_file_write_iter+0x10f0/0x3160 fs/f2fs/file.c:4654
       call_write_iter include/linux/fs.h:2186 [inline]
       do_iter_readv_writev+0x20b/0x3b0 fs/read_write.c:735
       do_iter_write+0x182/0x700 fs/read_write.c:861
       vfs_iter_write+0x74/0xa0 fs/read_write.c:902
       iter_file_splice_write+0x745/0xc90 fs/splice.c:686
       do_splice_from fs/splice.c:764 [inline]
       direct_splice_actor+0x114/0x180 fs/splice.c:931
       splice_direct_to_actor+0x335/0x8a0 fs/splice.c:886
       do_splice_direct+0x1ab/0x280 fs/splice.c:974
       do_sendfile+0xb19/0x1270 fs/read_write.c:1255
       __do_sys_sendfile64 fs/read_write.c:1323 [inline]
       __se_sys_sendfile64 fs/read_write.c:1309 [inline]
       __x64_sys_sendfile64+0x1d0/0x210 fs/read_write.c:1309
       do_syscall_x64 arch/x86/entry/common.c:50 [inline]
       do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
       entry_SYSCALL_64_after_hwframe+0x63/0xcd

-> #0 (
&sbi->cp_rwsem){++++}-{3:3}:
       check_prev_add kernel/locking/lockdep.c:3097 [inline]
       check_prevs_add kernel/locking/lockdep.c:3216 [inline]
       validate_chain kernel/locking/lockdep.c:3831 [inline]
       __lock_acquire+0x2a43/0x56d0 kernel/locking/lockdep.c:5055
       lock_acquire kernel/locking/lockdep.c:5668 [inline]
       lock_acquire+0x1e3/0x630 kernel/locking/lockdep.c:5633
       down_read+0x9c/0x450 kernel/locking/rwsem.c:1509
       f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
       f2fs_lock_op fs/f2fs/f2fs.h:2223 [inline]
       f2fs_convert_inline_inode+0x481/0x8f0 fs/f2fs/inline.c:219
       f2fs_vm_page_mkwrite+0x308/0x1c90 fs/f2fs/file.c:79
       do_page_mkwrite+0x19b/0x680 mm/memory.c:2977
       do_shared_fault mm/memory.c:4618 [inline]
       do_fault mm/memory.c:4686 [inline]
       handle_pte_fault mm/memory.c:4954 [inline]
       __handle_mm_fault+0x2280/0x3a40 mm/memory.c:5096
       handle_mm_fault+0x1cc/0x780 mm/memory.c:5217
       do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1428
       handle_page_fault arch/x86/mm/fault.c:1519 [inline]
       exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1575
       asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570

other info that might help us debug this:

Chain exists of:
  &sbi->cp_rwsem --> &sbi->sb_lock --> &mm->mmap_lock#2

 Possible unsafe locking scenario:

       CPU0                    CPU1
       ----                    ----
  lock(&mm->mmap_lock#2);
                               lock(&sbi->sb_lock);
                               lock(&mm->mmap_lock#2);
  lock(&sbi->cp_rwsem);

 *** DEADLOCK ***

1 lock held by syz-executor.2/12276:
 #0: ffff88801c84e6d8 (&mm->mmap_lock#2){++++}-{3:3}, at: mmap_read_trylock include/linux/mmap_lock.h:136 [inline]
 #0: ffff88801c84e6d8 (&mm->mmap_lock#2){++++}-{3:3}, at: do_user_addr_fault+0x276/0x1210 arch/x86/mm/fault.c:1369

stack backtrace:
CPU: 1 PID: 12276 Comm: syz-executor.2 Not tainted 6.1.0-syzkaller-03225-g764822972d64 #0
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
 f2fs_down_read fs/f2fs/f2fs.h:2180 [inline]
 f2fs_lock_op fs/f2fs/f2fs.h:2223 [inline]
 f2fs_convert_inline_inode+0x481/0x8f0 fs/f2fs/inline.c:219
 f2fs_vm_page_mkwrite+0x308/0x1c90 fs/f2fs/file.c:79
 do_page_mkwrite+0x19b/0x680 mm/memory.c:2977
 do_shared_fault mm/memory.c:4618 [inline]
 do_fault mm/memory.c:4686 [inline]
 handle_pte_fault mm/memory.c:4954 [inline]
 __handle_mm_fault+0x2280/0x3a40 mm/memory.c:5096
 handle_mm_fault+0x1cc/0x780 mm/memory.c:5217
 do_user_addr_fault+0x475/0x1210 arch/x86/mm/fault.c:1428
 handle_page_fault arch/x86/mm/fault.c:1519 [inline]
 exc_page_fault+0x98/0x170 arch/x86/mm/fault.c:1575
 asm_exc_page_fault+0x26/0x30 arch/x86/include/asm/idtentry.h:570
RIP: 0033:0x7f9fd622bd79
Code: 48 8b 04 24 48 85 c0 74 17 48 8b 54 24 18 48 0f ca 48 89 54 24 18 48 83 f8 01 0f 85 9b 02 00 00 48 8b 44 24 10 48 8b 54 24 18 <48> 89 10 e9 c2 fd ff ff 48 8b 44 24 10 0f b7 10 48 8b 04 24 48 85
RSP: 002b:00007fff19a9e770 EFLAGS: 00010246
RAX: 00000000200002c0 RBX: 0000000000000000 RCX: 0000000000000000
RDX: 0000000020000100 RSI: 0000000000000000 RDI: 000055555586e2e8
RBP: 00007fff19a9e868 R08: 0000000000000000 R09: 0000000000000000
R10: 00007f9fd5e10898 R11: 0000000000000246 R12: 00000000001aa76f
R13: 00007fff19a9e890 R14: 00007f9fd63abf80 R15: 0000000000000032
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
