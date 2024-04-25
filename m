Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E73B28B1C59
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 25 Apr 2024 09:59:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzu1D-0001Lo-Ih;
	Thu, 25 Apr 2024 07:59:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Xw0qZgkbAFoKQRC2DD6J2HHA5.8GG8D6MK6J4GFL6FL.4GE@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1rzu14-0001LZ-Pl for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 07:59:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JI+ig1oD7MIpva3UZKvQJUrH9KBuWaizU7Bv3AWmx54=; b=BuJ3d7gdlRR3+xxEKHbEPLdLDb
 94+8rvuN/c2m2+WoB4CtyYYDVI2p6KZmJdTyOrTHgA0kmjShCf7zVWmegbEWuDZeUxp+69DbFtIkU
 1OyzpvANFyABE8G5RNNRS3A2yP0IADG9wHf9iZQJUqg434gN9uhN2fkoYxVBJi9oCHWQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JI+ig1oD7MIpva3UZKvQJUrH9KBuWaizU7Bv3AWmx54=; b=V
 Nz9DDryKJiuFVRmyC+XABTBBZb/cmH9dsNiVhCzaK2LDsfoNyZS18Bfol101+KuwCqqeDYGGdHO/7
 /kKz/jaocT25YeE3XSqOf5/emMwUl3qgkCBF9tQvTDhcd80PPHgxI3tEpxdT6ysVakbF9wpU+oOGy
 LgX0VopISq26kh0s=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rzu14-0001Yv-2O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 25 Apr 2024 07:59:39 +0000
Received: by mail-io1-f72.google.com with SMTP id
 ca18e2360f4ac-7ddceae0763so75477239f.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 25 Apr 2024 00:59:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714031968; x=1714636768;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JI+ig1oD7MIpva3UZKvQJUrH9KBuWaizU7Bv3AWmx54=;
 b=kQK9W5ffPKWO9iUP5PeIlEyiLoj/Aw8vYyaaVHNBO+fX0h5u3nblUifvim1aPn7un0
 Gy0P31H/6yjcw+Z4TWpUbFs+R/lwjZFBpnFqNc/a4+g3wBvN5e9XucWDRzJjYbusX809
 dISZY+XMirBgJUGkU3lcs7rVbGwYq/kVzIDkDKxdIgmeRfPL9AZXKZfq0KjQv3OhbQm7
 mWhVyFHjAjtT8xWIuRWiqUYuE5MJB2IrudC58sAL89VSqJBvrxItnzaE3En5CcV+1rYr
 gEwwvIMduP/iKFti92/zlvDeR5hyCNMkbpVZ3YHU0amsDrqu+N8U2kXfZU1JSpF1llY1
 c2uw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOuBhP6ROFcQiMNgkikkI/oe3TVRqiLvaCf3QSJppxtSFo4Br2+rsO5hHOLwEr12xYc2Xz4ex/LOqcSCaZC6SCQ+38mfqGr+fNiVKIIc76yxvxAuHnLA==
X-Gm-Message-State: AOJu0YxzEhnK1IURHN6NfXZREdAPHPm3mf+Z6PswUqXFElnCgdiWbukT
 lJUy33/If2DxAKCbAVIrcb9qbItoIRxsV/hWpAPLYuhWsyG+bgn0NXCdofBpagEmjB+GWsQ0EVa
 KBoUxC3bRttKr0vLbLxipElzJM+dRIRgbMwaHFxIw+0U1qA5ctZnstHA=
X-Google-Smtp-Source: AGHT+IGv97Rgi1WZRIcMix4Ifbuj6lYQ7t4S8OvA23TOmAF6oP/ZkCcorNQ53P8MUtzSLUyEWvkcBhuWlqaTXCnga6qRKS/dJbuv
MIME-Version: 1.0
X-Received: by 2002:a05:6602:60cc:b0:7da:eb31:7c9d with SMTP id
 ft12-20020a05660260cc00b007daeb317c9dmr66653iob.2.1714031967858; Thu, 25 Apr
 2024 00:59:27 -0700 (PDT)
Date: Thu, 25 Apr 2024 00:59:27 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000094036c0616e72a1d@google.com>
From: syzbot <syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: ed30a4a51bb1
 Linux 6.9-rc5 git tree: upstream console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=1116bc30980000
 kernel config: https://syzkaller.appspot.com/x/.config?x=5a05c230e14 [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googleapis.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1rzu14-0001Yv-2O
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 f2fs_get_node_info
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

HEAD commit:    ed30a4a51bb1 Linux 6.9-rc5
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=1116bc30980000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5a05c230e142f2bc
dashboard link: https://syzkaller.appspot.com/bug?extid=3694e283cf5c40df6d14
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1128486b180000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1516bc30980000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/7a2e1a02882c/disk-ed30a4a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/329966999344/vmlinux-ed30a4a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1befbdf4dcac/bzImage-ed30a4a5.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/42ddf2738cf7/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3694e283cf5c40df6d14@syzkaller.appspotmail.com

F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
==================================================================
BUG: KASAN: slab-out-of-bounds in f2fs_test_bit fs/f2fs/f2fs.h:2933 [inline]
BUG: KASAN: slab-out-of-bounds in current_nat_addr fs/f2fs/node.h:213 [inline]
BUG: KASAN: slab-out-of-bounds in f2fs_get_node_info+0xece/0x1200 fs/f2fs/node.c:600
Read of size 1 at addr ffff88807a58c76c by task syz-executor280/5076

CPU: 1 PID: 5076 Comm: syz-executor280 Not tainted 6.9.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 03/27/2024
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x241/0x360 lib/dump_stack.c:114
 print_address_description mm/kasan/report.c:377 [inline]
 print_report+0x169/0x550 mm/kasan/report.c:488
 kasan_report+0x143/0x180 mm/kasan/report.c:601
 f2fs_test_bit fs/f2fs/f2fs.h:2933 [inline]
 current_nat_addr fs/f2fs/node.h:213 [inline]
 f2fs_get_node_info+0xece/0x1200 fs/f2fs/node.c:600
 f2fs_xattr_fiemap fs/f2fs/data.c:1848 [inline]
 f2fs_fiemap+0x55d/0x1ee0 fs/f2fs/data.c:1925
 ioctl_fiemap fs/ioctl.c:220 [inline]
 do_vfs_ioctl+0x1c07/0x2e50 fs/ioctl.c:838
 __do_sys_ioctl fs/ioctl.c:902 [inline]
 __se_sys_ioctl+0x81/0x170 fs/ioctl.c:890
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f60d34ae739
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffc9f2f1148 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007ffc9f2f1318 RCX: 00007f60d34ae739
RDX: 0000000020000040 RSI: 00000000c020660b RDI: 0000000000000004
RBP: 00007f60d3527610 R08: 0000000000000000 R09: 00007ffc9f2f1318
R10: 000000000000551a R11: 0000000000000246 R12: 0000000000000001
R13: 00007ffc9f2f1308 R14: 0000000000000001 R15: 0000000000000001
 </TASK>

Allocated by task 5076:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x3f/0x80 mm/kasan/common.c:68
 poison_kmalloc_redzone mm/kasan/common.c:370 [inline]
 __kasan_kmalloc+0x98/0xb0 mm/kasan/common.c:387
 kasan_kmalloc include/linux/kasan.h:211 [inline]
 __do_kmalloc_node mm/slub.c:3966 [inline]
 __kmalloc_node_track_caller+0x24e/0x4e0 mm/slub.c:3986
 kmemdup+0x2a/0x60 mm/util.c:131
 init_node_manager fs/f2fs/node.c:3268 [inline]
 f2fs_build_node_manager+0x8cc/0x2870 fs/f2fs/node.c:3329
 f2fs_fill_super+0x583c/0x8120 fs/f2fs/super.c:4540
 mount_bdev+0x20a/0x2d0 fs/super.c:1658
 legacy_get_tree+0xee/0x190 fs/fs_context.c:662
 vfs_get_tree+0x90/0x2a0 fs/super.c:1779
 do_new_mount+0x2be/0xb40 fs/namespace.c:3352
 do_mount fs/namespace.c:3692 [inline]
 __do_sys_mount fs/namespace.c:3898 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3875
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xf5/0x240 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

The buggy address belongs to the object at ffff88807a58c700
 which belongs to the cache kmalloc-64 of size 64
The buggy address is located 44 bytes to the right of
 allocated 64-byte region [ffff88807a58c700, ffff88807a58c740)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x7a58c
flags: 0xfff80000000800(slab|node=0|zone=1|lastcpupid=0xfff)
page_type: 0xffffffff()
raw: 00fff80000000800 ffff888015041640 ffffea0000aa6400 dead000000000004
raw: 0000000000000000 0000000000200020 00000001ffffffff 0000000000000000
page dumped because: kasan: bad access detected
page_owner tracks the page as allocated
page last allocated via order 0, migratetype Unmovable, gfp_mask 0x12c40(GFP_NOFS|__GFP_NOWARN|__GFP_NORETRY), pid 4536, tgid 106643948 (udevd), ts 4536, free_ts 43042041281
 set_page_owner include/linux/page_owner.h:32 [inline]
 post_alloc_hook+0x1ea/0x210 mm/page_alloc.c:1534
 prep_new_page mm/page_alloc.c:1541 [inline]
 get_page_from_freelist+0x3410/0x35b0 mm/page_alloc.c:3317
 __alloc_pages+0x256/0x6c0 mm/page_alloc.c:4575
 __alloc_pages_node include/linux/gfp.h:238 [inline]
 alloc_pages_node include/linux/gfp.h:261 [inline]
 alloc_slab_page+0x5f/0x160 mm/slub.c:2175
 allocate_slab mm/slub.c:2338 [inline]
 new_slab+0x84/0x2f0 mm/slub.c:2391
 ___slab_alloc+0xc73/0x1260 mm/slub.c:3525
 __slab_alloc mm/slub.c:3610 [inline]
 __slab_alloc_node mm/slub.c:3663 [inline]
 slab_alloc_node mm/slub.c:3835 [inline]
 __do_kmalloc_node mm/slub.c:3965 [inline]
 __kmalloc+0x2e5/0x4a0 mm/slub.c:3979
 kmalloc include/linux/slab.h:632 [inline]
 kzalloc include/linux/slab.h:749 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x26f/0x540 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x59e/0x5e0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x23a/0x880 security/tomoyo/file.c:723
 tomoyo_path_mknod+0x176/0x1b0 security/tomoyo/tomoyo.c:252
 security_path_mknod+0xf8/0x150 security/security.c:1791
 may_o_create fs/namei.c:3319 [inline]
 lookup_open fs/namei.c:3460 [inline]
 open_last_lookups fs/namei.c:3566 [inline]
 path_openat+0xc7c/0x3240 fs/namei.c:3796
 do_filp_open+0x235/0x490 fs/namei.c:3826
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1406
 do_sys_open fs/open.c:1421 [inline]
 __do_sys_openat fs/open.c:1437 [inline]
 __se_sys_openat fs/open.c:1432 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1432
page last free pid 4528 tgid 4528 stack trace:
 reset_page_owner include/linux/page_owner.h:25 [inline]
 free_pages_prepare mm/page_alloc.c:1141 [inline]
 free_unref_page_prepare+0x97b/0xaa0 mm/page_alloc.c:2347
 free_unref_page+0x37/0x3f0 mm/page_alloc.c:2487
 __slab_free+0x31b/0x3d0 mm/slub.c:4192
 qlink_free mm/kasan/quarantine.c:163 [inline]
 qlist_free_all+0x5e/0xc0 mm/kasan/quarantine.c:179
 kasan_quarantine_reduce+0x14f/0x170 mm/kasan/quarantine.c:286
 __kasan_slab_alloc+0x23/0x80 mm/kasan/common.c:322
 kasan_slab_alloc include/linux/kasan.h:201 [inline]
 slab_post_alloc_hook mm/slub.c:3798 [inline]
 slab_alloc_node mm/slub.c:3845 [inline]
 __do_kmalloc_node mm/slub.c:3965 [inline]
 __kmalloc+0x1e2/0x4a0 mm/slub.c:3979
 kmalloc include/linux/slab.h:632 [inline]
 kzalloc include/linux/slab.h:749 [inline]
 tomoyo_encode2 security/tomoyo/realpath.c:45 [inline]
 tomoyo_encode+0x26f/0x540 security/tomoyo/realpath.c:80
 tomoyo_realpath_from_path+0x59e/0x5e0 security/tomoyo/realpath.c:283
 tomoyo_get_realpath security/tomoyo/file.c:151 [inline]
 tomoyo_path_number_perm+0x23a/0x880 security/tomoyo/file.c:723
 tomoyo_path_mknod+0x176/0x1b0 security/tomoyo/tomoyo.c:252
 security_path_mknod+0xf8/0x150 security/security.c:1791
 may_o_create fs/namei.c:3319 [inline]
 lookup_open fs/namei.c:3460 [inline]
 open_last_lookups fs/namei.c:3566 [inline]
 path_openat+0xc7c/0x3240 fs/namei.c:3796
 do_filp_open+0x235/0x490 fs/namei.c:3826
 do_sys_openat2+0x13e/0x1d0 fs/open.c:1406
 do_sys_open fs/open.c:1421 [inline]
 __do_sys_openat fs/open.c:1437 [inline]
 __se_sys_openat fs/open.c:1432 [inline]
 __x64_sys_openat+0x247/0x2a0 fs/open.c:1432

Memory state around the buggy address:
 ffff88807a58c600: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff88807a58c680: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
>ffff88807a58c700: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
                                                          ^
 ffff88807a58c780: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
 ffff88807a58c800: 00 00 00 00 00 00 00 00 fc fc fc fc fc fc fc fc
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
