Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9243D271F4D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Sep 2020 11:51:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKITz-0007Rf-8E; Mon, 21 Sep 2020 09:51:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3mndoXwkbAC0bhiTJUUNaJYYRM.PXXPUNdbNaLXWcNWc.LXV@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kKITx-0007RX-Po
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 09:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OrL68wKtZhSvX7AYiOaW0u6dSNafflp/Hd2TF8qq/OY=; b=TNERTkowm4c80ODZYec9PI3PBv
 +Gj3R4XXPb9DQBftQtJOlfe2C9daC67WIMC/tf6M3mGpys49fNdFA0l8r2vqM2UstzCY/65yNkKmi
 K9FlMFpyIzpSn6WC9BTHA4vfrTAAgu6BWajRj4HNStHHmMT5vzYK6oxuYAVTFzM1/ST8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OrL68wKtZhSvX7AYiOaW0u6dSNafflp/Hd2TF8qq/OY=; b=W
 XNJUcYV1K9dtjDoTw7cUnjGioTBBT8jlCkwJvNq/Sw9/OARVIRMaGuIR6pMu+DdJSwNgo0LWYDiUn
 8JlrxYz4o2bozdka7IpHG7rhTlVjG6Q/mygspc784TZJj1QCOC8n/4F3mrJap0mn+iZIO5O9tWgME
 gR//ezjJx81cQ1EU=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKITo-0007oc-5z
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 09:51:37 +0000
Received: by mail-io1-f77.google.com with SMTP id 80so9482129iou.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Sep 2020 02:51:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=OrL68wKtZhSvX7AYiOaW0u6dSNafflp/Hd2TF8qq/OY=;
 b=Ph3jc7w/du1jHdOYLpNyEdQJIEIMh9mdrFJmOHe10A3ASbn7s93uG1MIzZ1IB9W19j
 HeU8uZ6jaP4aidHgmxYUQxCMoJCqn9UmcIf7m5eEPg6lp/DH366fdEVi+XXYcIsLyjzZ
 ibelViqG4QIU5VyZq/+sc2L/t3Uj9LY8ZO5P+p8p6MFWJgyxBVgQ2chIRHD0mqTcH95K
 XQItUegiW28T1j4BlimmC1gI9H8JM/uUHifrHYj5nDqkivfs0U/vdhA67iEIjE5JuZWl
 zpbn8e9WbSRs1WCcRSj5Z9u98I25BK/K9QAqdfAy0+GFJvClJ3qVwl4eetFC8HnhVv4D
 xbRA==
X-Gm-Message-State: AOAM531nGics+iYnG6kJWOj4Jk5sMDYMcr9kZ03gEt0kUesdB4+Ka8iI
 /b6c4OcOtI59UTKVJagAbwNe54ZbHD83ZGArQATprUl6hI8W
X-Google-Smtp-Source: ABdhPJw2+O8RwPTpkwcJOVktU8klp/8OjvfoTUi5HM9hKxp1vz7zQK8E2Q4qCKTpt6/chh5+fUQWWJYyEQdZQhOO/BaNlS4xZ+S8
MIME-Version: 1.0
X-Received: by 2002:a02:a498:: with SMTP id d24mr39976112jam.137.1600681882524; 
 Mon, 21 Sep 2020 02:51:22 -0700 (PDT)
Date: Mon, 21 Sep 2020 02:51:22 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000019e9e05afcfcb96@google.com>
From: syzbot <syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.77 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.77 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kKITo-0007oc-5z
Subject: [f2fs-dev] WARNING in f2fs_is_valid_blkaddr
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

HEAD commit:    325d0eab Merge branch 'akpm' (patches from Andrew)
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=154f90d3900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b12e84189082991c
dashboard link: https://syzkaller.appspot.com/bug?extid=763ae12a2ede1d99d4dc
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12c469ab900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=10093365900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+763ae12a2ede1d99d4dc@syzkaller.appspotmail.com

F2FS-fs (loop0): Magic Mismatch, valid(0xf2f52010) - read(0x0)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc_offset: 0
F2FS-fs (loop0): access invalid blkaddr:1
------------[ cut here ]------------
WARNING: CPU: 0 PID: 6861 at fs/f2fs/checkpoint.c:189 arch_set_bit arch/x86/include/asm/bitops.h:55 [inline]
WARNING: CPU: 0 PID: 6861 at fs/f2fs/checkpoint.c:189 set_bit include/asm-generic/bitops/instrumented-atomic.h:29 [inline]
WARNING: CPU: 0 PID: 6861 at fs/f2fs/checkpoint.c:189 set_sbi_flag fs/f2fs/f2fs.h:1823 [inline]
WARNING: CPU: 0 PID: 6861 at fs/f2fs/checkpoint.c:189 f2fs_is_valid_blkaddr+0xdb2/0xf80 fs/f2fs/checkpoint.c:188
Kernel panic - not syncing: panic_on_warn set ...
CPU: 0 PID: 6861 Comm: syz-executor472 Not tainted 5.9.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
Call Trace:
 __dump_stack lib/dump_stack.c:77 [inline]
 dump_stack+0x198/0x1fd lib/dump_stack.c:118
 panic+0x382/0x7fb kernel/panic.c:231
 __warn.cold+0x20/0x4b kernel/panic.c:600
 report_bug+0x1bd/0x210 lib/bug.c:198
 handle_bug+0x38/0x90 arch/x86/kernel/traps.c:234
 exc_invalid_op+0x14/0x40 arch/x86/kernel/traps.c:254
 asm_exc_invalid_op+0x12/0x20 arch/x86/include/asm/idtentry.h:536
RIP: 0010:f2fs_is_valid_blkaddr+0xdb2/0xf80 fs/f2fs/checkpoint.c:189
Code: 89 e2 48 89 df 48 c7 c6 a0 90 cd 88 e8 e7 fa fe ff 48 8d bb b8 00 00 00 be 08 00 00 00 e8 26 11 5e fe f0 80 8b b8 00 00 00 04 <0f> 0b e9 af f7 ff ff e8 b2 3e 5e fe e9 a5 fa ff ff e8 b8 3e 5e fe
RSP: 0018:ffffc90005187738 EFLAGS: 00010206
RAX: 0000000000000001 RBX: ffff8880a6ff8000 RCX: ffffffff8358d09a
RDX: ffffed1014dff018 RSI: 0000000000000008 RDI: ffff8880a6ff80b8
RBP: 0000000000000007 R08: 0000000000000001 R09: ffff8880a6ff80bf
R10: ffffed1014dff017 R11: 0000000000000000 R12: 0000000000000001
R13: ffff888097a27c00 R14: 0000000000001400 R15: 0000000000000400
 f2fs_get_node_info+0x4b4/0xbc0 fs/f2fs/node.c:571
 read_node_page+0x4a6/0x9b0 fs/f2fs/node.c:1294
 __get_node_page.part.0+0xa2/0xac0 fs/f2fs/node.c:1354
 __get_node_page fs/f2fs/node.c:35 [inline]
 f2fs_get_node_page+0x109/0x180 fs/f2fs/node.c:1399
 do_read_inode fs/f2fs/inode.c:336 [inline]
 f2fs_iget+0x233/0x4b10 fs/f2fs/inode.c:485
 f2fs_fill_super+0x3ae8/0x6e80 fs/f2fs/super.c:3673
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
RIP: 0033:0x44766a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffe48abef58 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffe48abefb0 RCX: 000000000044766a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffe48abef70
RBP: 00007ffe48abef70 R08: 00007ffe48abefb0 R09: 00007ffe00000015
R10: 0000000000000000 R11: 0000000000000297 R12: 000000000000002f
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
Kernel Offset: disabled
Rebooting in 86400 seconds..


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
