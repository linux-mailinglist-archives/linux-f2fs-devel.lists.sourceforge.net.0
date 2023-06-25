Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 65BE073D300
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 25 Jun 2023 20:29:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDUTt-0005yu-D9;
	Sun, 25 Jun 2023 18:29:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3ZIeYZAkbAAEtz0lbmmfsbqqje.hpphmfvtfsdpoufou.dpn@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qDUTr-0005yi-3G for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 18:28:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ju2DdSfEbV8SlpVDU55Jl3Losecf9PbROboDA08RpUY=; b=I6GUJtKAjAJPh+iFGdYeiVpZs6
 /0bM3i60u78dOcLoufM9JjFddtX7eOvsRS2cIWTvSQ5q+gOl38Rgm5aCaiersdECdiCjcH61Ingkf
 5dVy3uEwhyQDKMaQiMB+o64lI0kEkIhB4P+huNDkWDFDlg99dTtcrWbFDpRYRkeSnPdY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ju2DdSfEbV8SlpVDU55Jl3Losecf9PbROboDA08RpUY=; b=S
 23Zk3+fLJls/68rlO1Jik71ptrQPC7wOYxXpw8S5uiMD6+akwBKg6O9stYpE+dqoelKjZwqMu1eOm
 2GIdMgImMSDKONwZlyt6waJ/ssbP44P6u5n8h0ySvlEUEFMNu2sI73v0a2tADTMKjpavzYguopIPR
 9BUjckiiLgA+HkdU=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qDUTq-0002ad-FH for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 25 Jun 2023 18:28:59 +0000
Received: by mail-io1-f77.google.com with SMTP id
 ca18e2360f4ac-77a1d6d2f7fso214230939f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Jun 2023 11:28:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687717733; x=1690309733;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ju2DdSfEbV8SlpVDU55Jl3Losecf9PbROboDA08RpUY=;
 b=Jk2yB3ln2AkWG6pV0DtdHpt6XaM+5Du43Fzdra6KcGHCSUEVJs1rQjdD15c5Y5qT5T
 hqScXUabsdax/+i84OKspK69aocZG6YNwcSbVeqV3TbyMLGf6EEx99msq9DFQAv06MN2
 xjgE86V846vcV2DUVQKPFYvQUIbzkhLyplbVhnNlBQgkHRE+81ee8hoXLuCh9h53CONK
 HnhtTu/3No/HWyAwWbdt2wTfAAzztpQBGVyrf2LAgv2I5mUCM5+Z2lJvMYZBYk32HJ53
 kaqHtgnYTxQNvZjTbKeB1ryphDrjJQ0pIAO6qbZND8ucOZ8hBy2ASFFVwlFiKicpVfgU
 N0bw==
X-Gm-Message-State: AC+VfDx/n9RitJ4pBynE9fnhRZye+0oQEtOeA8/SeLiy1CF1TXM4dMzX
 rFpQ0iMMYL5NN3+9ddmGMKeb/W2tAB7jwp+Z8zMii2N/fo09
X-Google-Smtp-Source: ACHHUZ65ciJYqUAxOExe2+7A0M8Lk5wG0Bsm/QUTau1i/GE+ziDcP/4cJLdhp9xFveMGns5DeHRZwGQT1s+H70WjOjBdg2ej1jyD
MIME-Version: 1.0
X-Received: by 2002:a05:6638:1137:b0:426:8d01:a26a with SMTP id
 f23-20020a056638113700b004268d01a26amr6229697jar.2.1687717732875; Sun, 25 Jun
 2023 11:28:52 -0700 (PDT)
Date: Sun, 25 Jun 2023 11:28:52 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f3038a05fef867f8@google.com>
From: syzbot <syzbot+12cb4425b22169b52036@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: e660abd551f1
 Merge tag 'acpi-6.4-rc8' of git://git.kernel... git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=13471cdb280000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.77 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.77 listed in list.dnswl.org]
X-Headers-End: 1qDUTq-0002ad-FH
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 f2fs_truncate_data_blocks_range
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

HEAD commit:    e660abd551f1 Merge tag 'acpi-6.4-rc8' of git://git.kernel...
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=13471cdb280000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2cbd298d0aff1140
dashboard link: https://syzkaller.appspot.com/bug?extid=12cb4425b22169b52036
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=17a63660a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=131640c0a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/2e47c18aa0be/disk-e660abd5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/716ba16b9d0f/vmlinux-e660abd5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/ab18bb4a6fb6/bzImage-e660abd5.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/c0c0363e4409/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+12cb4425b22169b52036@syzkaller.appspotmail.com

RSP: 002b:00007fff6c2d5898 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f6711ef01e9
RDX: 00007f6711eae1c3 RSI: 00000000000001f8 RDI: 00000000200000c0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000001
R10: 00007fff6c2d5760 R11: 0000000000000246 R12: 00007fff6c2d58c0
R13: 0000000000000000 R14: 431bde82d7b634db R15: 0000000000000000
 </TASK>
==================================================================
BUG: KASAN: slab-use-after-free in f2fs_truncate_data_blocks_range+0x122a/0x14c0 fs/f2fs/file.c:574
Read of size 4 at addr ffff88802a25c000 by task syz-executor148/5000

CPU: 1 PID: 5000 Comm: syz-executor148 Not tainted 6.4.0-rc7-syzkaller-00041-ge660abd551f1 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/27/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x150 lib/dump_stack.c:106
 print_address_description.constprop.0+0x2c/0x3c0 mm/kasan/report.c:351
 print_report mm/kasan/report.c:462 [inline]
 kasan_report+0x11c/0x130 mm/kasan/report.c:572
 f2fs_truncate_data_blocks_range+0x122a/0x14c0 fs/f2fs/file.c:574
 truncate_dnode+0x229/0x2e0 fs/f2fs/node.c:944
 f2fs_truncate_inode_blocks+0x64b/0xde0 fs/f2fs/node.c:1154
 f2fs_do_truncate_blocks+0x4ac/0xf30 fs/f2fs/file.c:721
 f2fs_truncate_blocks+0x7b/0x300 fs/f2fs/file.c:749
 f2fs_truncate.part.0+0x4a5/0x630 fs/f2fs/file.c:799
 f2fs_truncate include/linux/fs.h:825 [inline]
 f2fs_setattr+0x1738/0x2090 fs/f2fs/file.c:1006
 notify_change+0xb2c/0x1180 fs/attr.c:483
 do_truncate+0x143/0x200 fs/open.c:66
 handle_truncate fs/namei.c:3295 [inline]
 do_open fs/namei.c:3640 [inline]
 path_openat+0x2083/0x2750 fs/namei.c:3791
 do_filp_open+0x1ba/0x410 fs/namei.c:3818
 do_sys_openat2+0x16d/0x4c0 fs/open.c:1356
 do_sys_open fs/open.c:1372 [inline]
 __do_sys_creat fs/open.c:1448 [inline]
 __se_sys_creat fs/open.c:1442 [inline]
 __x64_sys_creat+0xcd/0x120 fs/open.c:1442
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f6711ef01e9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 e1 14 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007fff6c2d5898 EFLAGS: 00000246 ORIG_RAX: 0000000000000055
RAX: ffffffffffffffda RBX: 0000000000000000 RCX: 00007f6711ef01e9
RDX: 00007f6711eae1c3 RSI: 00000000000001f8 RDI: 00000000200000c0
RBP: 0000000000000000 R08: 0000000000000000 R09: 0000000000000001
R10: 00007fff6c2d5760 R11: 0000000000000246 R12: 00007fff6c2d58c0
R13: 0000000000000000 R14: 431bde82d7b634db R15: 0000000000000000
 </TASK>

Allocated by task 4667:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 __kasan_slab_alloc+0x7f/0x90 mm/kasan/common.c:328
 kasan_slab_alloc include/linux/kasan.h:186 [inline]
 slab_post_alloc_hook mm/slab.h:711 [inline]
 slab_alloc_node mm/slub.c:3451 [inline]
 kmem_cache_alloc_node+0x185/0x3e0 mm/slub.c:3496
 __alloc_skb+0x288/0x330 net/core/skbuff.c:644
 alloc_skb include/linux/skbuff.h:1288 [inline]
 alloc_skb_with_frags+0x9a/0x6c0 net/core/skbuff.c:6380
 sock_alloc_send_pskb+0x7a7/0x930 net/core/sock.c:2729
 unix_dgram_sendmsg+0x41b/0x1950 net/unix/af_unix.c:1944
 sock_sendmsg_nosec net/socket.c:724 [inline]
 sock_sendmsg+0xde/0x190 net/socket.c:747
 sock_write_iter+0x295/0x3d0 net/socket.c:1140
 call_write_iter include/linux/fs.h:1868 [inline]
 new_sync_write fs/read_write.c:491 [inline]
 vfs_write+0x945/0xd50 fs/read_write.c:584
 ksys_write+0x1ec/0x250 fs/read_write.c:637
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Freed by task 4668:
 kasan_save_stack+0x22/0x40 mm/kasan/common.c:45
 kasan_set_track+0x25/0x30 mm/kasan/common.c:52
 kasan_save_free_info+0x2e/0x40 mm/kasan/generic.c:521
 ____kasan_slab_free mm/kasan/common.c:236 [inline]
 ____kasan_slab_free+0x160/0x1c0 mm/kasan/common.c:200
 kasan_slab_free include/linux/kasan.h:162 [inline]
 slab_free_hook mm/slub.c:1781 [inline]
 slab_free_freelist_hook+0x8b/0x1c0 mm/slub.c:1807
 slab_free mm/slub.c:3786 [inline]
 kmem_cache_free+0xe9/0x480 mm/slub.c:3808
 kfree_skbmem+0xef/0x1b0 net/core/skbuff.c:971
 __kfree_skb net/core/skbuff.c:1029 [inline]
 consume_skb net/core/skbuff.c:1244 [inline]
 consume_skb+0xdf/0x170 net/core/skbuff.c:1238
 __unix_dgram_recvmsg+0x42c/0xb90 net/unix/af_unix.c:2532
 unix_dgram_recvmsg+0xc4/0xf0 net/unix/af_unix.c:2549
 sock_recvmsg_nosec net/socket.c:1019 [inline]
 sock_recvmsg+0xe2/0x160 net/socket.c:1040
 sock_read_iter+0x2bd/0x3b0 net/socket.c:1118
 call_read_iter include/linux/fs.h:1862 [inline]
 new_sync_read fs/read_write.c:389 [inline]
 vfs_read+0x778/0x8a0 fs/read_write.c:470
 ksys_read+0x1ec/0x250 fs/read_write.c:613
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

The buggy address belongs to the object at ffff88802a25c000
 which belongs to the cache skbuff_head_cache of size 240
The buggy address is located 0 bytes inside of
 freed 240-byte region [ffff88802a25c000, ffff88802a25c0f0)

The buggy address belongs to the physical page:
page:ffffea0000a89700 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x2a25c
flags: 0xfff00000000200(slab|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000200 ffff888019647500 dead000000000122 0000000000000000
raw: 0000000000000000 00000000000c000c 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12cc0(GFP_KERNEL|__GFP_NOWARN|__GFP_NORETRY), pid 4667, tgid 4667 (dhcpcd), ts 55006053414, free_ts 46990193370
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x2db/0x350 mm/page_alloc.c:1731
 prep_new_page mm/page_alloc.c:1738 [inline]
 get_page_from_freelist+0xf41/0x2c00 mm/page_alloc.c:3502
 __alloc_pages+0x1cb/0x4a0 mm/page_alloc.c:4768
 alloc_pages+0x1aa/0x270 mm/mempolicy.c:2279
 alloc_slab_page mm/slub.c:1851 [inline]
 allocate_slab+0x25f/0x390 mm/slub.c:1998
 new_slab mm/slub.c:2051 [inline]
 ___slab_alloc+0xa91/0x1400 mm/slub.c:3192
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3291
 __slab_alloc_node mm/slub.c:3344 [inline]
 slab_alloc_node mm/slub.c:3441 [inline]
 kmem_cache_alloc_node+0x138/0x3e0 mm/slub.c:3496
 __alloc_skb+0x288/0x330 net/core/skbuff.c:644
 alloc_skb include/linux/skbuff.h:1288 [inline]
 alloc_skb_with_frags+0x9a/0x6c0 net/core/skbuff.c:6380
 sock_alloc_send_pskb+0x7a7/0x930 net/core/sock.c:2729
 unix_dgram_sendmsg+0x41b/0x1950 net/unix/af_unix.c:1944
 sock_sendmsg_nosec net/socket.c:724 [inline]
 sock_sendmsg+0xde/0x190 net/socket.c:747
 sock_write_iter+0x295/0x3d0 net/socket.c:1140
 call_write_iter include/linux/fs.h:1868 [inline]
 new_sync_write fs/read_write.c:491 [inline]
 vfs_write+0x945/0xd50 fs/read_write.c:584
 ksys_write+0x1ec/0x250 fs/read_write.c:637
page last free stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1302 [inline]
 free_unref_page_prepare+0x62e/0xcb0 mm/page_alloc.c:2564
 free_unref_page+0x33/0x370 mm/page_alloc.c:2659
 __folio_put_small mm/swap.c:106 [inline]
 __folio_put+0xc5/0x140 mm/swap.c:129
 folio_put include/linux/mm.h:1430 [inline]
 put_page include/linux/mm.h:1499 [inline]
 anon_pipe_buf_release+0x3fb/0x4c0 fs/pipe.c:138
 pipe_buf_release include/linux/pipe_fs_i.h:203 [inline]
 pipe_read+0x620/0x1170 fs/pipe.c:324
 call_read_iter include/linux/fs.h:1862 [inline]
 new_sync_read fs/read_write.c:389 [inline]
 vfs_read+0x778/0x8a0 fs/read_write.c:470
 ksys_read+0x1ec/0x250 fs/read_write.c:613
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd

Memory state around the buggy address:
 ffff88802a25bf00: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff88802a25bf80: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff88802a25c000: fa fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                   ^
 ffff88802a25c080: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fc fc
 ffff88802a25c100: fc fc fc fc fc fc fc fc fa fb fb fb fb fb fb fb
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the bug is already fixed, let syzbot know by replying with:
#syz fix: exact-commit-title

If you want syzbot to run the reproducer, reply with:
#syz test: git://repo/address.git branch-or-commit-hash
If you attach or paste a git patch, syzbot will apply it before testing.

If you want to change bug's subsystems, reply with:
#syz set subsystems: new-subsystem
(See the list of subsystem names on the web dashboard)

If the bug is a duplicate of another bug, reply with:
#syz dup: exact-subject-of-another-report

If you want to undo deduplication, reply with:
#syz undup


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
