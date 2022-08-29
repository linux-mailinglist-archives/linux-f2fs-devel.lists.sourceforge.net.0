Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 40F3E5A57A6
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 30 Aug 2022 01:33:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oSoGF-0007h7-20;
	Mon, 29 Aug 2022 23:33:43 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3zEwNYwkbALkrxyjZkkdqZoohc.fnnfkdtrdqbnmsdms.bnl@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1oSoGD-0007gx-Rb for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 23:33:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+R+0POhYwWHNdAeI2INPDZ+vmXYXil0g1qA/NRpeirA=; b=AIRFMpWk4PGBpamycd+/eYibOo
 MtvUXwOQvWYjWXdebwCvUDTBtZSrgFd+0h5F2U4sAmNnTQamTGr+LkqLhf1XmjwIY7zTnEMXZxoMW
 s7XFZgvVx++pdJQWTJ5cEZAM4i4oyvwlSHxuRXJQSSaKg702JQRBOIttpDNUEOyVaz5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+R+0POhYwWHNdAeI2INPDZ+vmXYXil0g1qA/NRpeirA=; b=O
 YTyctfiEAZUfQ7eerN20xIrFF/vaDjroTPgS+9Io10VdtyHrQbxSPVni8k2xPJyD2xdJGt90Q1uGf
 upGXbHhLRcLzRkC8oL8To5zhNnesaA3oTz1IErJ5PHxxPk+9P9wEiwjv4bdnCydXFNcLMvH6jaHhc
 jT+ijTdmwZ195KTM=;
Received: from mail-io1-f71.google.com ([209.85.166.71])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oSoGB-006u5O-C1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Aug 2022 23:33:41 +0000
Received: by mail-io1-f71.google.com with SMTP id
 g12-20020a5d8c8c000000b006894fb842e3so5666263ion.21
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Aug 2022 16:33:39 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc;
 bh=+R+0POhYwWHNdAeI2INPDZ+vmXYXil0g1qA/NRpeirA=;
 b=JzPbZ+evu7uHpTcwTuP/+fUo8y+a4pme6swaO8+Z0P3irS4Gnn6UkUf8ptFgIGmUWI
 9i7IRGvLqCOGC63ro2Jl/DTxG4M7IPEq4VZJvwwEvxzJUVCh5I4FKuEYn3GhDjt2zVai
 zWMqLCJ5oqHMO8Q19JW+AZmIYu2VdCgX0EAAehNhTnPGHsc+Hus1D45zgGs6wkVOhzKQ
 sIL3GSSEYMBkOMjR2Jf4qAP9PSRU4BuMq1Y4dVRKzrkHQeKD6DxxlMdt8cQlPcXo86O3
 F7GXvdS+TiLkZ5Vsnv3DoN2IL9/t32nBRGXlYT256U+dwTEned5H8GXUrlm3lCltDtF8
 zmbA==
X-Gm-Message-State: ACgBeo2MbF5QzjpOs+8Sk9xD9BAL8DsEQ9yFyW0ZTsnwS2aIYb/81SN+
 sv8Hx4RqJKfcfdObEhtIeT06+r0ynEBcPRKw+lMlmrocJW8h
X-Google-Smtp-Source: AA6agR76/ewUy/7FdUKWGxvetl2NLw9y3QxJ5/AYU0oDq6bhMKrKOp6UUn5+ZCUuiTKrblwx5vbCaze5AQefABcZycNQYHVckGbK
MIME-Version: 1.0
X-Received: by 2002:a92:c569:0:b0:2eb:5c94:9a1c with SMTP id
 b9-20020a92c569000000b002eb5c949a1cmr186312ilj.135.1661816012188; Mon, 29 Aug
 2022 16:33:32 -0700 (PDT)
Date: Mon, 29 Aug 2022 16:33:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000016b90805e769b1d2@google.com>
From: syzbot <syzbot+81684812ea68216e08c5@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: a41a877bc12d
 Merge branch 'for-next/fixes' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.71 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.71 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oSoGB-006u5O-C1
Subject: [f2fs-dev] [syzbot] kernel BUG in f2fs_init_xattr_caches
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

HEAD commit:    a41a877bc12d Merge branch 'for-next/fixes' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=13a4e48b080000
kernel config:  https://syzkaller.appspot.com/x/.config?x=5cea15779c42821c
dashboard link: https://syzkaller.appspot.com/bug?extid=81684812ea68216e08c5
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=114f2fa3080000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17cd7fa3080000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+81684812ea68216e08c5@syzkaller.appspotmail.com

loop0: detected capacity change from 0 to 20
 loop0: unable to read partition table
loop0: partition table beyond EOD, truncated
F2FS-fs (loop0): Magic Mismatch, valid(0xf2f52010) - read(0x0)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
------------[ cut here ]------------
kernel BUG at mm/slub.c:5893!
Internal error: Oops - BUG: 0 [#1] PREEMPT SMP
Modules linked in:
CPU: 1 PID: 3038 Comm: syz-executor368 Not tainted 6.0.0-rc2-syzkaller-16455-ga41a877bc12d #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/22/2022
pstate: 60400005 (nZCv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : create_unique_id mm/slub.c:5973 [inline]
pc : sysfs_slab_add+0x258/0x260 mm/slub.c:5950
lr : kmalloc include/linux/slab.h:600 [inline]
lr : create_unique_id mm/slub.c:5890 [inline]
lr : sysfs_slab_add+0xa0/0x260 mm/slub.c:5950
sp : ffff80001288b990
x29: ffff80001288b990 x28: ffff0000c9717380 x27: ffff0000c376cd00
x26: 0000000000020000 x25: ffff80000eee7000 x24: ffff80000eef6000
x23: 0000000000000000 x22: ffff0000c1be5b00 x21: 0000000000000008
x20: ffff0000c376cd00 x19: ffff0000c376cd00 x18: 0000000000000000
x17: 0000000000000000 x16: ffff80000dbb8658 x15: ffff0000c6ae4f80
x14: 0000000000000010 x13: 0000000000000000 x12: ffff0000c6ae4f80
x11: ff808000095ee038 x10: 0000000000000000 x9 : 0cbee7d022858900
x8 : 0cbee7d022858900 x7 : ffff8000084b7280 x6 : 0000000000000000
x5 : 0000000000000cc0 x4 : 0000000000000080 x3 : 0000000000000040
x2 : ffff0000c0001200 x1 : ffff80000cb90cf9 x0 : 0000000000000000
Call trace:
 sysfs_slab_add+0x258/0x260 mm/slub.c:5973
 __kmem_cache_create+0x60/0x118 mm/slub.c:4899
 create_cache mm/slab_common.c:229 [inline]
 kmem_cache_create_usercopy+0x19c/0x31c mm/slab_common.c:335
 kmem_cache_create+0x1c/0x28 mm/slab_common.c:390
 f2fs_kmem_cache_create fs/f2fs/f2fs.h:2766 [inline]
 f2fs_init_xattr_caches+0x78/0xb4 fs/f2fs/xattr.c:808
 f2fs_fill_super+0x1050/0x1e0c fs/f2fs/super.c:4149
 mount_bdev+0x1b8/0x210 fs/super.c:1400
 f2fs_mount+0x44/0x58 fs/f2fs/super.c:4512
 legacy_get_tree+0x30/0x74 fs/fs_context.c:610
 vfs_get_tree+0x40/0x140 fs/super.c:1530
 do_new_mount+0x1dc/0x4e4 fs/namespace.c:3040
 path_mount+0x358/0x914 fs/namespace.c:3370
 do_mount fs/namespace.c:3383 [inline]
 __do_sys_mount fs/namespace.c:3591 [inline]
 __se_sys_mount fs/namespace.c:3568 [inline]
 __arm64_sys_mount+0x2f8/0x408 fs/namespace.c:3568
 __invoke_syscall arch/arm64/kernel/syscall.c:38 [inline]
 invoke_syscall arch/arm64/kernel/syscall.c:52 [inline]
 el0_svc_common+0x138/0x220 arch/arm64/kernel/syscall.c:142
 do_el0_svc+0x48/0x154 arch/arm64/kernel/syscall.c:206
 el0_svc+0x58/0x150 arch/arm64/kernel/entry-common.c:624
 el0t_64_sync_handler+0x84/0xf0 arch/arm64/kernel/entry-common.c:642
 el0t_64_sync+0x18c/0x190
Code: a9415ff8 a8c47bfd d50323bf d65f03c0 (d4210000) 
---[ end trace 0000000000000000 ]---


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
