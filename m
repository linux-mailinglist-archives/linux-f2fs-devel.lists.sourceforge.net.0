Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CBF049FFA96
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2025 15:45:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tTMSF-0008DM-6Q;
	Thu, 02 Jan 2025 14:45:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3g6Z2ZwkbAOwgmnYOZZSfOddWR.UccUZSigSfQcbhSbh.Qca@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tTMSA-0008DD-7U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 14:45:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ivsULfK+ZzTvO3DbL6uC7rzsm5SWLQfsBE/DdKr1YKE=; b=iRzdh2ZKmyg8eyL/eKhu32HRzb
 2Mq0Ie0cFRU9EFgl0U3BbcrOjJGRUd3m5SXlkXahmvPvR6tCSHGsRvY1BUXaGl3373CqQ5nFB2i0d
 2VxIULj+0JE7LIM77zXn4MwAqBDTTKcsbz7fES3h2PNvLR1LUn2Qj/+vsX9cYT2spWmk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ivsULfK+ZzTvO3DbL6uC7rzsm5SWLQfsBE/DdKr1YKE=; b=J
 dYe/PtCC1EvxxxKObwfdKIrQ0ma90zTTIpG7rynwXmSIHOKRP+Ho/BUeuogBrs4q2cncmb+IAl6cP
 RAQ+uUBGJYlPSUe5v/gQAzPMLI2sehcN/MlbabQaawg/yCK1qHwgDxBvCK0mI6TmbJqIQf/jQEHz8
 NpT+YKADMDPp4of8=;
Received: from mail-il1-f205.google.com ([209.85.166.205])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tTMS6-0007iU-7f for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 14:45:35 +0000
Received: by mail-il1-f205.google.com with SMTP id
 e9e14a558f8ab-3a7d85ab308so109125085ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 02 Jan 2025 06:45:34 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735829123; x=1736433923;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ivsULfK+ZzTvO3DbL6uC7rzsm5SWLQfsBE/DdKr1YKE=;
 b=PAS0q+4G9jYwKSPoax8grAwemK8krlhbDhwjGEjdUbKvC5JwneCMLT2uWTAZZyJTxI
 3TgI3d7lN3N359qtSxpakxsHJFG0duOHSquMMEGMJYJJXIs6HmZHH71F7Dzrguf3J2CL
 InqQZNmDbS+6+QtqcYGCzhsPj7ChEEVEdmeZAyKQfabrkjgtFeniFj+TrroahcZeC69X
 ZIT+hsFP8COHOiCP5b6A3BGZwiW7dpUAtbvlt1aNxXdQW9yntDH4TpYRe2+2kLwmYLSh
 k+xlTPQQNNoPGAY1ZwxfFBy+7rL845YrJ3KzAR6LTOXP+zZyTVRZQ3ARhqmhsF949M/y
 r+ZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWatoQOY58hrUObOrXkTaURAOCPqKBXF4cEYYVUoH+6Z8Z8QeUUYpISIYINFGwvnFgOl6AmQWStgbwY78WBtoEq@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwirKV1SynGGqIIcnJbP77M29jCLdDt6niH0qbSj0Rpz08FRJAc
 z9jb4Hb9w92lMUcLpzSFLrQOwZkzd3wZyZJKDOUxiSMS24QMYxyjtuWUn30514rtugTIRvB6fC7
 16hSaQV4aGJaS7CzBbd1sKV6BjvC7JL1Iv/47cLiosifwqqfAf8R7PMA=
X-Google-Smtp-Source: AGHT+IHWVLojWEw6PZvqD+plZze52iNLZPYUFfLRbFh4e8I6/s0I4K8Rq5emaVlJiL6WwBB3V+YGE28vWQ0X9rOWmBSQVoN2+E5h
MIME-Version: 1.0
X-Received: by 2002:a92:ca09:0:b0:3a7:8d8e:e730 with SMTP id
 e9e14a558f8ab-3c2d54348admr275238395ab.22.1735829123455; Thu, 02 Jan 2025
 06:45:23 -0800 (PST)
Date: Thu, 02 Jan 2025 06:45:23 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6776a683.050a0220.3a8527.0042.GAE@google.com>
From: syzbot <syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 573067a5a685
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.205 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.205 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.205 listed in wl.mailspike.net]
X-Headers-End: 1tTMS6-0007iU-7f
Subject: [f2fs-dev] [syzbot] [f2fs?] KASAN: slab-out-of-bounds Read in
 f2fs_getxattr
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

HEAD commit:    573067a5a685 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=108aa818580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=cd7202b56d469648
dashboard link: https://syzkaller.appspot.com/bug?extid=f5e74075e096e757bdbf
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10b9cac4580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=178bb0b0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/9d3b5c855aa0/disk-573067a5.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/0c06fc1ead83/vmlinux-573067a5.xz
kernel image: https://storage.googleapis.com/syzbot-assets/3390e59b9e4b/Image-573067a5.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/eddf26185633/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f5e74075e096e757bdbf@syzkaller.appspotmail.com

F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Mounted with checkpoint version = 1b41e954
==================================================================
BUG: KASAN: slab-out-of-bounds in __find_xattr fs/f2fs/xattr.c:235 [inline]
BUG: KASAN: slab-out-of-bounds in __find_inline_xattr fs/f2fs/xattr.c:261 [inline]
BUG: KASAN: slab-out-of-bounds in lookup_all_xattrs fs/f2fs/xattr.c:345 [inline]
BUG: KASAN: slab-out-of-bounds in f2fs_getxattr+0xf5c/0x1064 fs/f2fs/xattr.c:533
Read of size 4 at addr ffff0000cc09b278 by task syz-executor773/6410

CPU: 0 UID: 0 PID: 6410 Comm: syz-executor773 Not tainted 6.13.0-rc3-syzkaller-g573067a5a685 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
Call trace:
 show_stack+0x2c/0x3c arch/arm64/kernel/stacktrace.c:466 (C)
 __dump_stack lib/dump_stack.c:94 [inline]
 dump_stack_lvl+0xe4/0x150 lib/dump_stack.c:120
 print_address_description mm/kasan/report.c:378 [inline]
 print_report+0x198/0x538 mm/kasan/report.c:489
 kasan_report+0xd8/0x138 mm/kasan/report.c:602
 __asan_report_load4_noabort+0x20/0x2c mm/kasan/report_generic.c:380
 __find_xattr fs/f2fs/xattr.c:235 [inline]
 __find_inline_xattr fs/f2fs/xattr.c:261 [inline]
 lookup_all_xattrs fs/f2fs/xattr.c:345 [inline]
 f2fs_getxattr+0xf5c/0x1064 fs/f2fs/xattr.c:533
 f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
 __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
 smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
 smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
 security_d_instantiate+0x100/0x204 security/security.c:4070
 d_splice_alias+0x70/0x310 fs/dcache.c:3001
 f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
 lookup_open fs/namei.c:3627 [inline]
 open_last_lookups fs/namei.c:3748 [inline]
 path_openat+0xf7c/0x2b14 fs/namei.c:3984
 do_filp_open+0x1e8/0x404 fs/namei.c:4014
 do_sys_openat2+0x124/0x1b8 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

Allocated by task 6410:
 kasan_save_stack mm/kasan/common.c:47 [inline]
 kasan_save_track+0x40/0x78 mm/kasan/common.c:68
 kasan_save_alloc_info+0x40/0x50 mm/kasan/generic.c:568
 poison_kmalloc_redzone mm/kasan/common.c:377 [inline]
 __kasan_kmalloc+0xac/0xc4 mm/kasan/common.c:394
 kasan_kmalloc include/linux/kasan.h:260 [inline]
 __do_kmalloc_node mm/slub.c:4298 [inline]
 __kmalloc_noprof+0x32c/0x54c mm/slub.c:4310
 kmalloc_noprof include/linux/slab.h:905 [inline]
 f2fs_kmalloc fs/f2fs/f2fs.h:3428 [inline]
 f2fs_kzalloc+0x124/0x254 fs/f2fs/f2fs.h:3447
 xattr_alloc fs/f2fs/xattr.c:34 [inline]
 lookup_all_xattrs fs/f2fs/xattr.c:333 [inline]
 f2fs_getxattr+0xc60/0x1064 fs/f2fs/xattr.c:533
 f2fs_xattr_generic_get+0x130/0x174 fs/f2fs/xattr.c:63
 __vfs_getxattr+0x394/0x3c0 fs/xattr.c:423
 smk_fetch+0xc8/0x150 security/smack/smack_lsm.c:306
 smack_d_instantiate+0x594/0x880 security/smack/smack_lsm.c:3615
 security_d_instantiate+0x100/0x204 security/security.c:4070
 d_splice_alias+0x70/0x310 fs/dcache.c:3001
 f2fs_lookup+0x4c8/0x948 fs/f2fs/namei.c:523
 lookup_open fs/namei.c:3627 [inline]
 open_last_lookups fs/namei.c:3748 [inline]
 path_openat+0xf7c/0x2b14 fs/namei.c:3984
 do_filp_open+0x1e8/0x404 fs/namei.c:4014
 do_sys_openat2+0x124/0x1b8 fs/open.c:1402
 do_sys_open fs/open.c:1417 [inline]
 __do_sys_openat fs/open.c:1433 [inline]
 __se_sys_openat fs/open.c:1428 [inline]
 __arm64_sys_openat+0x1f0/0x240 fs/open.c:1428
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600

The buggy address belongs to the object at ffff0000cc09b260
 which belongs to the cache kmalloc-16 of size 16
The buggy address is located 12 bytes to the right of
 allocated 12-byte region [ffff0000cc09b260, ffff0000cc09b26c)

The buggy address belongs to the physical page:
page: refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0x10c09b
flags: 0x5ffc00000000000(node=0|zone=2|lastcpupid=0x7ff)
page_type: f5(slab)
raw: 05ffc00000000000 ffff0000c0001640 dead000000000100 dead000000000122
raw: 0000000000000000 0000000080800080 00000001f5000000 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff0000cc09b100: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
 ffff0000cc09b180: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
>ffff0000cc09b200: fa fb fc fc fa fb fc fc fa fb fc fc 00 04 fc fc
                                                                ^
 ffff0000cc09b280: 00 06 fc fc fa fb fc fc fa fb fc fc fa fb fc fc
 ffff0000cc09b300: fa fb fc fc fa fb fc fc fa fb fc fc fa fb fc fc
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
