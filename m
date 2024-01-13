Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D818F82CAF0
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 10:49:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOadr-0005Vu-8m;
	Sat, 13 Jan 2024 09:49:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3nVyiZQkbABQCIJ4u55yBu992x.08805yECyBw87Dy7D.w86@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rOadq-0005Vo-5x for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 09:49:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FiI0A5jMyNodzXTEyWgURRm2S6ff8rPyhAhG1y0SIkM=; b=Bw6wt5a21ZILySUJKOmaxkHZsU
 B7VEnh8SsZP3fZQgq2z+HYuiqfxdp4JltFC0okkDL9V+PMhkJlkHtjAbGBHR5E1AlRAdZa0XRptPY
 TuJxNCg6O5mGNHqDH7nXwHYooodZoNs3YDvxBvPfT9H1a4CVh4sQfg5PzztNXxrxhTxQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FiI0A5jMyNodzXTEyWgURRm2S6ff8rPyhAhG1y0SIkM=; b=N
 CiZyQRjSIYooV4RYbGnUWTOufz3ddOomKGe+5bCSam7pLq61WyG65piy+FUEt9j/CYuWLTDj9v7vd
 0Psna9+pu9c8q3EMCmceI24pPWrOm5oa+EBGWWybScMsJ6VNASVV6tBl3ld+Tu68WJXsL0HxedEd4
 tTe0XWngX4188eDA=;
Received: from mail-il1-f198.google.com ([209.85.166.198])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rOadm-0002iH-2D for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 09:49:26 +0000
Received: by mail-il1-f198.google.com with SMTP id
 e9e14a558f8ab-35fc6976630so59952565ab.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 13 Jan 2024 01:49:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705139357; x=1705744157;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=FiI0A5jMyNodzXTEyWgURRm2S6ff8rPyhAhG1y0SIkM=;
 b=hc7YzZrrvMA697M57Fdwgjkaayc9bwih7cmTxa/x3zbqCyq5+Di8tK0y8FRU/KIGew
 AvWRedmQMWMpf2bCuvna5/PqtPyixGEdXL5p28DmHD3cxPRusix8ASy4BWNTGY6ad8Jy
 mGop7D3FrE/Zj3FgX3+CVKY70E2RfBQVm6rlyiuOCTx660VCl0es26j8mR1gcFwq6kkC
 X3uEtKakFImj3lO27HV8WhFINFPsyw0DUhEsE/rcfzfEXekuAjP9Y0JNjU8pkUZpQYST
 NMcHIjqGGs7lwJ5cA+BeEZeWk9+naX5KMZrN8Lha9xDQQNGXroqY/JcvGIo5Dcs7HgKn
 q8fA==
X-Gm-Message-State: AOJu0Ywwswsbh9O9LcUMLLvjRDbsqrFOEByTT0laZmUmRc6BAiX3lSgN
 BUAsy6/sq9mTwmvhyKwx7tBphDncgocWoqqiZZhF757eBeHy
X-Google-Smtp-Source: AGHT+IFDlnUyi20FJE3MtGHhbtbZ/1l0ofmvTXJNnB+tLPyngVrhjozRvjutyEgU4aSU6wUg+SGYLtJtW7xBp/CfrH22NJksZh3T
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1b85:b0:35f:f01e:bb1d with SMTP id
 h5-20020a056e021b8500b0035ff01ebb1dmr310049ili.5.1705139357007; Sat, 13 Jan
 2024 01:49:17 -0800 (PST)
Date: Sat, 13 Jan 2024 01:49:16 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000aac725060ed0b15c@google.com>
From: syzbot <syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 23a80d462c67
 Merge tag 'rcu.release.v6.8' of https://githu.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=140d9913e80000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.198 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.198 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rOadm-0002iH-2D
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-use-after-free Read in
 destroy_device_list
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

HEAD commit:    23a80d462c67 Merge tag 'rcu.release.v6.8' of https://githu..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=140d9913e80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7c8840a4a09eab8
dashboard link: https://syzkaller.appspot.com/bug?extid=a5e651ca75fa0260acd5
compiler:       gcc (Debian 12.2.0-14) 12.2.0, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10071683e80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=15f2e4dde80000

Downloadable assets:
disk image (non-bootable): https://storage.googleapis.com/syzbot-assets/7bc7510fe41f/non_bootable_disk-23a80d46.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/786a4e8b6bd9/vmlinux-23a80d46.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8778a236d47f/bzImage-23a80d46.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/24774803a66f/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+a5e651ca75fa0260acd5@syzkaller.appspotmail.com

F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): Unrecognized mount option "noacl	fastboot" or missing value
==================================================================
BUG: KASAN: slab-use-after-free in destroy_device_list+0x195/0x200 fs/f2fs/super.c:1606
Read of size 4 at addr ffff88802356d77c by task syz-executor178/5154

CPU: 3 PID: 5154 Comm: syz-executor178 Not tainted 6.7.0-syzkaller-09918-g23a80d462c67 #0
Hardware name: QEMU Standard PC (Q35 + ICH9, 2009), BIOS 1.16.2-debian-1.16.2-1 04/01/2014
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0xd9/0x1b0 lib/dump_stack.c:106
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0xc4/0x620 mm/kasan/report.c:488
 kasan_report+0xda/0x110 mm/kasan/report.c:601
 destroy_device_list+0x195/0x200 fs/f2fs/super.c:1606
 kill_f2fs_super+0x2c6/0x430 fs/f2fs/super.c:4932
 deactivate_locked_super+0xbc/0x1a0 fs/super.c:477
 mount_bdev+0x277/0x2d0 fs/super.c:1665
 legacy_get_tree+0x109/0x220 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x370 fs/super.c:1784
 do_new_mount fs/namespace.c:3352 [inline]
 path_mount+0x14e6/0x1f20 fs/namespace.c:3679
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount fs/namespace.c:3875 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd3/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b
RIP: 0033:0x7f30633d797a
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffe0148d918 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffe0148d930 RCX: 00007f30633d797a
RDX: 0000000020000040 RSI: 0000000020000080 RDI: 00007ffe0148d930
RBP: 0000000000000004 R08: 00007ffe0148d970 R09: 002c65686361635f
R10: 0000000000000000 R11: 0000000000000286 R12: 0000000000000000
R13: 00007ffe0148d970 R14: 0000000000000003 R15: 00000000013bd7ef
 </TASK>

Allocated by task 5154:
 kasan_save_stack+0x33/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:372 [inline]
 __kasan_kmalloc+0xa2/0xb0 mm/kasan/common.c:389
 kmalloc include/linux/slab.h:590 [inline]
 kzalloc include/linux/slab.h:711 [inline]
 f2fs_fill_super+0xfe/0x8e50 fs/f2fs/super.c:4397
 mount_bdev+0x1df/0x2d0 fs/super.c:1663
 legacy_get_tree+0x109/0x220 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x370 fs/super.c:1784
 do_new_mount fs/namespace.c:3352 [inline]
 path_mount+0x14e6/0x1f20 fs/namespace.c:3679
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount fs/namespace.c:3875 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd3/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

Freed by task 5154:
 kasan_save_stack+0x33/0x50 mm/kasan/common.c:47
 kasan_save_track+0x14/0x30 mm/kasan/common.c:68
 kasan_save_free_info+0x3f/0x60 mm/kasan/generic.c:634
 poison_slab_object mm/kasan/common.c:241 [inline]
 __kasan_slab_free+0x121/0x1b0 mm/kasan/common.c:257
 kasan_slab_free include/linux/kasan.h:184 [inline]
 slab_free_hook mm/slub.c:2121 [inline]
 slab_free mm/slub.c:4299 [inline]
 kfree+0x124/0x360 mm/slub.c:4409
 f2fs_fill_super+0x270c/0x8e50 fs/f2fs/super.c:4882
 mount_bdev+0x1df/0x2d0 fs/super.c:1663
 legacy_get_tree+0x109/0x220 fs/fs_context.c:662
 vfs_get_tree+0x8c/0x370 fs/super.c:1784
 do_new_mount fs/namespace.c:3352 [inline]
 path_mount+0x14e6/0x1f20 fs/namespace.c:3679
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount fs/namespace.c:3875 [inline]
 __x64_sys_mount+0x293/0x310 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd3/0x250 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x63/0x6b

The buggy address belongs to the object at ffff88802356c000
 which belongs to the cache kmalloc-8k of size 8192
The buggy address is located 6012 bytes inside of
 freed 8192-byte region [ffff88802356c000, ffff88802356e000)

The buggy address belongs to the physical page:
page:ffffea00008d5a00 refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x23568
head:ffffea00008d5a00 order:3 entire_mapcount:0 nr_pages_mapped:0 pincount:0
ksm flags: 0xfff00000000840(slab|head|node=0|zone=1|lastcpupid=0x7ff)
page_type: 0xffffffff()
raw: 00fff00000000840 ffff888013043180 ffffea0000954e00 dead000000000003
raw: 0000000000000000 0000000080020002 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 3, migratetype Unmovable, gfp_mask 0xd28c0(GFP_NOWAIT|__GFP_IO|__GFP_FS|__GFP_NORETRY|__GFP_COMP|__GFP_NOMEMALLOC), pid 4877, tgid 4877 (dhcpcd), ts 26455000649, free_ts 26430514243
 set_page_owner include/linux/page_owner.h:31 [inline]
 post_alloc_hook+0x2d0/0x350 mm/page_alloc.c:1533
 prep_new_page mm/page_alloc.c:1540 [inline]
 get_page_from_freelist+0xa28/0x3780 mm/page_alloc.c:3311
 __alloc_pages+0x22f/0x2440 mm/page_alloc.c:4567
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page mm/slub.c:2190 [inline]
 allocate_slab mm/slub.c:2354 [inline]
 new_slab+0xcc/0x3a0 mm/slub.c:2407
 ___slab_alloc+0x4af/0x19a0 mm/slub.c:3540
 __slab_alloc.constprop.0+0x56/0xa0 mm/slub.c:3625
 __slab_alloc_node mm/slub.c:3678 [inline]
 slab_alloc_node mm/slub.c:3850 [inline]
 __do_kmalloc_node mm/slub.c:3980 [inline]
 __kmalloc_node_track_caller+0x35b/0x460 mm/slub.c:4001
 kmalloc_reserve+0xef/0x260 net/core/skbuff.c:582
 __alloc_skb+0x12b/0x330 net/core/skbuff.c:651
 alloc_skb include/linux/skbuff.h:1296 [inline]
 netlink_dump+0x2e5/0xca0 net/netlink/af_netlink.c:2231
 netlink_recvmsg+0x9ff/0xf20 net/netlink/af_netlink.c:1990
 sock_recvmsg_nosec net/socket.c:1046 [inline]
 sock_recvmsg+0xe2/0x170 net/socket.c:1068
 ____sys_recvmsg+0x21f/0x5c0 net/socket.c:2803
 ___sys_recvmsg+0x115/0x1a0 net/socket.c:2845
 __sys_recvmsg+0x114/0x1e0 net/socket.c:2875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xd3/0x250 arch/x86/entry/common.c:83
page last free pid 4877 tgid 4877 stack trace:
 reset_page_owner include/linux/page_owner.h:24 [inline]
 free_pages_prepare mm/page_alloc.c:1140 [inline]
 free_unref_page_prepare+0x51f/0xb10 mm/page_alloc.c:2346
 free_unref_page+0x33/0x3c0 mm/page_alloc.c:2486
 __put_partials+0x14c/0x160 mm/slub.c:2922
 qlink_free mm/kasan/quarantine.c:160 [inline]
 qlist_free_all+0x58/0x150 mm/kasan/quarantine.c:176
 kasan_quarantine_reduce+0x18e/0x1d0 mm/kasan/quarantine.c:283
 __kasan_slab_alloc+0x65/0x90 mm/kasan/common.c:324
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3813 [inline]
 slab_alloc_node mm/slub.c:3860 [inline]
 kmem_cache_alloc+0x136/0x320 mm/slub.c:3867
 kmem_cache_zalloc include/linux/slab.h:701 [inline]
 __kernfs_new_node+0xd3/0x890 fs/kernfs/dir.c:615
 kernfs_new_node+0x94/0x110 fs/kernfs/dir.c:679
 __kernfs_create_file+0x53/0x340 fs/kernfs/file.c:1025
 sysfs_add_file_mode_ns+0x1ff/0x3b0 fs/sysfs/file.c:307
 create_files fs/sysfs/group.c:64 [inline]
 internal_create_group+0x31c/0xb50 fs/sysfs/group.c:152
 internal_create_groups+0x9d/0x150 fs/sysfs/group.c:192
 device_add_groups drivers/base/core.c:2727 [inline]
 device_add_attrs drivers/base/core.c:2847 [inline]
 device_add+0xf66/0x1aa0 drivers/base/core.c:3579
 netdev_register_kobject+0x187/0x3e0 net/core/net-sysfs.c:2055
 register_netdevice+0x1385/0x1da0 net/core/dev.c:10261

Memory state around the buggy address:
 ffff88802356d600: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802356d680: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
>ffff88802356d700: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
                                                                ^
 ffff88802356d780: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
 ffff88802356d800: fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb fb
==================================================================


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
