Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4DE922784B8
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 25 Sep 2020 12:08:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLkeX-0005zV-Ak; Fri, 25 Sep 2020 10:08:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3j8FtXwkbAMo8EF0q11u7q55yt.w44w1uA8u7s439u39.s42@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kLkeU-0005yV-DA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 10:08:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LBAtSY525dXbd0ojOFB8oyrekZcsL+aIkKxnwxJ5Sf4=; b=btKJOoS4FtFqX+Z/M+WXAzj2mK
 KACl9apsbTJWDzixxSdYuH5/JiXKQj3aHSp0OjJnn/ERGMxxbATlmQTk4ikYAiAuRujrdx0Q70X9L
 huRxxZRJblwq5iiPZT9LppBeYmFxldydrzkZQdV5HIk7vuSY0O3r/nbv7FjRpY6o9+hE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LBAtSY525dXbd0ojOFB8oyrekZcsL+aIkKxnwxJ5Sf4=; b=C
 MwMvUZyI4E1tUymPBlmn9SdATgi8EjrrbrmXETn9b2A43ZBSA67IibRZBegKd3Q//FJiJT1YElK5Y
 c2+ENtupIefcS7w/Z7/GltE2g1UoEe0P4TSQMU+g+eBuwrEZ+fpEqLTdSOsxSLxXU3DZRIkRCn4Wu
 4mRYP5kpIxPRq3xk=;
Received: from mail-il1-f206.google.com ([209.85.166.206])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLkeL-005KTP-FT
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 25 Sep 2020 10:08:30 +0000
Received: by mail-il1-f206.google.com with SMTP id o18so1435080ilm.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 25 Sep 2020 03:08:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=LBAtSY525dXbd0ojOFB8oyrekZcsL+aIkKxnwxJ5Sf4=;
 b=e6Yx8X7CziA64xs0IEKrbc0EIQfexxzSXg8YtBaJ4XFWG7eCL13gcgnDJzZuzjg/JF
 uV7UEjrFuIjHIxz2D8Y+f4xFTpJRIF1DrWg4yBc7dWcrntMdjlgcVXiuZ/FruJX+gFtZ
 avelYKruKDSmj2BsPDrHJlzQNqxg2HY2KTztgSHnloiz19RWpWtyUI06pJJEPE9cep2Y
 ikmo3HtK6bH7PNxFvEGqkAammuDMrsITRKpvJyY8TlRKlP/vFZ3++b/JvB28UBD7vI5u
 mJI/No5lWt55fJzji49AcOki/G237uN0n8Ur5UiHdrsVbJoFbCnYBleUwcNN5qaZiJeF
 dJVg==
X-Gm-Message-State: AOAM533cfs9zeDPysIKPUan+r1a8P5gZSX0eZd8hpnkjUScQua58BsnK
 HdHHEAYukfu7748gEMXD4OcCZ7kwjFFlXDXNVC3iIWoPL8Cl
X-Google-Smtp-Source: ABdhPJwfS+O9/TWqdONYl9KvZIE3fohTXDOLuRNa86zYdQ1YKEoTA8CallM0V2vCDESNixzvdFmblrzfccIgDdRR7uYhic5PxQg+
MIME-Version: 1.0
X-Received: by 2002:a6b:9309:: with SMTP id v9mr2699314iod.15.1601028495880;
 Fri, 25 Sep 2020 03:08:15 -0700 (PDT)
Date: Fri, 25 Sep 2020 03:08:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000c5b63505b0207e25@google.com>
From: syzbot <syzbot+481a3ffab50fed41dcc0@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlegroups.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.206 listed in list.dnswl.org]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.206 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kLkeL-005KTP-FT
Subject: [f2fs-dev] KASAN: slab-out-of-bounds Read in
 f2fs_build_segment_manager
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

HEAD commit:    171d4ff7 Merge tag 'mmc-v5.9-rc4-2' of git://git.kernel.or..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=105e69ab900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5f4c828c9e3cef97
dashboard link: https://syzkaller.appspot.com/bug?extid=481a3ffab50fed41dcc0
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=134bf08d900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=102fbac5900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+481a3ffab50fed41dcc0@syzkaller.appspotmail.com

F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): Fix alignment : done, start(4096) end(147456) block(12288)
F2FS-fs (loop0): invalid crc_offset: 0
==================================================================
BUG: KASAN: slab-out-of-bounds in init_min_max_mtime fs/f2fs/segment.c:4710 [inline]
BUG: KASAN: slab-out-of-bounds in f2fs_build_segment_manager+0x9302/0xa6d0 fs/f2fs/segment.c:4792
Read of size 8 at addr ffff8880a1b934a8 by task syz-executor682/6878

CPU: 1 PID: 6878 Comm: syz-executor682 Not tainted 5.9.0-rc6-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 print_address_description.constprop.0.cold+0xae/0x497 mm/kasan/report.c:383
 __kasan_report mm/kasan/report.c:513 [inline]
 kasan_report.cold+0x1f/0x37 mm/kasan/report.c:530
 init_min_max_mtime fs/f2fs/segment.c:4710 [inline]
 f2fs_build_segment_manager+0x9302/0xa6d0 fs/f2fs/segment.c:4792
 f2fs_fill_super+0x381a/0x6e80 fs/f2fs/super.c:3633
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x20a0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x446ffa
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffcfc6dc038 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffcfc6dc090 RCX: 0000000000446ffa
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffcfc6dc050
RBP: 00007ffcfc6dc050 R08: 00007ffcfc6dc090 R09: 00007ffc00000015
R10: 0000000000000000 R11: 0000000000000297 R12: 0000000000000008
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003

Allocated by task 6878:
 kasan_save_stack+0x1b/0x40 mm/kasan/common.c:48
 kasan_set_track mm/kasan/common.c:56 [inline]
 __kasan_kmalloc.constprop.0+0xbf/0xd0 mm/kasan/common.c:461
 kmalloc_node include/linux/slab.h:577 [inline]
 kvmalloc_node+0x61/0xf0 mm/util.c:574
 kvmalloc include/linux/mm.h:757 [inline]
 f2fs_kvmalloc fs/f2fs/f2fs.h:3030 [inline]
 f2fs_kvzalloc fs/f2fs/f2fs.h:3036 [inline]
 build_sit_info fs/f2fs/segment.c:4029 [inline]
 f2fs_build_segment_manager+0xb5b/0xa6d0 fs/f2fs/segment.c:4768
 f2fs_fill_super+0x381a/0x6e80 fs/f2fs/super.c:3633
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x20a0 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9

The buggy address belongs to the object at ffff8880a1b93000
 which belongs to the cache kmalloc-2k of size 2048
The buggy address is located 1192 bytes inside of
 2048-byte region [ffff8880a1b93000, ffff8880a1b93800)
The buggy address belongs to the page:
page:000000008c03fe3c refcount:1 mapcount:0 mapping:0000000000000000 index:0x0 pfn:0xa1b93
flags: 0xfffe0000000200(slab)
raw: 00fffe0000000200 ffffea000275f408 ffffea00025a7548 ffff8880aa040800
raw: 0000000000000000 ffff8880a1b93000 0000000100000001 0000000000000000
page dumped because: kasan: bad access detected

Memory state around the buggy address:
 ffff8880a1b93380: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
 ffff8880a1b93400: 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00 00
>ffff8880a1b93480: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
                                  ^
 ffff8880a1b93500: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
 ffff8880a1b93580: fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc fc
==================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
