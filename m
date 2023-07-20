Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F31DA75A5EE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jul 2023 07:57:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qMMf0-0005wo-2K;
	Thu, 20 Jul 2023 05:57:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3q8y4ZAkbAFQEKL6w770DwBB4z.2AA270GE0DyA9F09F.yA8@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1qMMey-0005wi-8c for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 05:57:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z+rxMduQ95oYDVUMxmZJ5uvrCoIqem721VwhSpjD4Vo=; b=hxu/3no9aicLjnyTWoWUkOBe08
 YHhAsX9Y4+RDC0WiuzOLvNrim6oZJyGL6KHXeWb7KvuNHAT1Aw5j++lAs48U0Ua2xeBvTqetDZPyP
 f4opm2ElqFOstKIdfyFLK7iHadu6WJ6G/vVq/wrZTIRBFrV7N2ZFgcCcgkbGejuPAyvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z+rxMduQ95oYDVUMxmZJ5uvrCoIqem721VwhSpjD4Vo=; b=A
 U5744r4CrVsyByJOJ3XNl2rkaAS+9992E9nlbVHXb/OdkpK4jeU/9DopqiIkyRjdktt5yb+IkvWyX
 9bYrp8ZCMbu7YKcABq41gt0GXKPGRcV2gi1FaQujiw49xxRxABDRrYjdcTMUd3TIXVD6aDVslXKo6
 PdhQBJGO99k2rNtA=;
Received: from mail-oi1-f208.google.com ([209.85.167.208])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qMMeu-00Dm7W-Il for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 20 Jul 2023 05:57:08 +0000
Received: by mail-oi1-f208.google.com with SMTP id
 5614622812f47-3a426e70577so802776b6e.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 19 Jul 2023 22:57:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689832619; x=1690437419;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Z+rxMduQ95oYDVUMxmZJ5uvrCoIqem721VwhSpjD4Vo=;
 b=GgkaPS+SBRyRWleS2qncAS4qz4Jd7ErNofi1FLcJqGfhSJ4TrU6/33iFuVKLQKecni
 LRJKu3igHFWD/Gn+z4lW/a7X0JmW9GnYeCH67b/ZzopIQx9wsRZ4C57xAFs6s10oLd/O
 EN/8QrrH7r0fDTDlMLXfNGyp7HHg28eDa/eiz0khJbOvLIGMeT2NDiUsINtppFJ9J5uk
 25GueMAw79BEozd9fETl4mO1DjW4uWWMWvD361rQ/6w/ahTFinqTmJ+5wXNbQcpU1PCk
 DQM1JTZXfUgsPLPNk3REqSvl43biLCuKDmIM53m44C07vvyITSeEd4N8wJnKJ273XTI3
 LKNA==
X-Gm-Message-State: ABy/qLa+3CTvccO422hHU5D6m4qvIcoh5sItHffQWasQQ36aRyPqGExY
 WCsB6I6E3Wcwk3uSiTEPPf9RKesi5swDX2IxtYirXoIsR836
X-Google-Smtp-Source: APBJJlGeL4MGARAFxfmvcasWtUWLz/bh24gbE4GHdzC3qvhaohlci0IifcDP87jin2emHRKmgFzlCS9BkqGUxyCYTfi+YcnpcDwr
MIME-Version: 1.0
X-Received: by 2002:a05:6808:2189:b0:3a4:915f:4032 with SMTP id
 be9-20020a056808218900b003a4915f4032mr941991oib.4.1689832619043; Wed, 19 Jul
 2023 22:56:59 -0700 (PDT)
Date: Wed, 19 Jul 2023 22:56:58 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000fcf0690600e4d04d@google.com>
From: syzbot <syzbot+601018296973a481f302@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org, 
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com, 
 terrelln@fb.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 831fe284d827
 Merge tag 'spi-fix-v6.5-rc1' of git://git.ker.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=141f4b7ca80000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FROM_LOCAL_DIGITS      From: localpart has long digit sequence
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.167.208 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.167.208 listed in list.dnswl.org]
X-Headers-End: 1qMMeu-00Dm7W-Il
Subject: [f2fs-dev] [syzbot] [f2fs?] UBSAN: array-index-out-of-bounds in
 f2fs_iget
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

HEAD commit:    831fe284d827 Merge tag 'spi-fix-v6.5-rc1' of git://git.ker..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=141f4b7ca80000
kernel config:  https://syzkaller.appspot.com/x/.config?x=6d0f369ef5fb88c9
dashboard link: https://syzkaller.appspot.com/bug?extid=601018296973a481f302
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=158c0fa2a80000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=151ccab6a80000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/39d3caef3826/disk-831fe284.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3fe7a2f8d904/vmlinux-831fe284.xz
kernel image: https://storage.googleapis.com/syzbot-assets/35ec390bfc7b/bzImage-831fe284.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/246fb1ccbc0b/mount_0.gz

The issue was bisected to:

commit d48a7b3a72f121655d95b5157c32c7d555e44c05
Author: Chao Yu <chao@kernel.org>
Date:   Mon Jan 9 03:49:20 2023 +0000

    f2fs: fix to do sanity check on extent cache correctly

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=1647d396a80000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=1547d396a80000
console output: https://syzkaller.appspot.com/x/log.txt?x=1147d396a80000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+601018296973a481f302@syzkaller.appspotmail.com
Fixes: d48a7b3a72f1 ("f2fs: fix to do sanity check on extent cache correctly")

F2FS-fs (loop0): Mismatch start address, segment0(512) cp_blkaddr(605)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 1th superblock
F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Found nat_bits in checkpoint
================================================================================
UBSAN: array-index-out-of-bounds in fs/f2fs/f2fs.h:3275:19
index 1409 is out of range for type '__le32[923]' (aka 'unsigned int[923]')
CPU: 1 PID: 5015 Comm: syz-executor425 Not tainted 6.5.0-rc1-syzkaller-00259-g831fe284d827 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 07/03/2023
Call Trace:
 <TASK>
 __dump_stack lib/dump_stack.c:88 [inline]
 dump_stack_lvl+0x1e7/0x2d0 lib/dump_stack.c:106
 ubsan_epilogue lib/ubsan.c:217 [inline]
 __ubsan_handle_out_of_bounds+0x11c/0x150 lib/ubsan.c:348
 inline_data_addr fs/f2fs/f2fs.h:3275 [inline]
 __recover_inline_status fs/f2fs/inode.c:113 [inline]
 do_read_inode fs/f2fs/inode.c:480 [inline]
 f2fs_iget+0x4730/0x48b0 fs/f2fs/inode.c:604
 f2fs_fill_super+0x640e/0x80c0 fs/f2fs/super.c:4601
 mount_bdev+0x276/0x3b0 fs/super.c:1391
 legacy_get_tree+0xef/0x190 fs/fs_context.c:611
 vfs_get_tree+0x8c/0x270 fs/super.c:1519
 do_new_mount+0x28f/0xae0 fs/namespace.c:3335
 do_mount fs/namespace.c:3675 [inline]
 __do_sys_mount fs/namespace.c:3884 [inline]
 __se_sys_mount+0x2d9/0x3c0 fs/namespace.c:3861
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x41/0xc0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f9cb156f8ba
Code: d8 64 89 02 48 c7 c0 ff ff ff ff eb a6 e8 5e 04 00 00 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 40 00 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd13318458 EFLAGS: 00000286 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffd13318470 RCX: 00007f9cb156f8ba
RDX: 0000000020000000 RSI: 0000000020000040 RDI: 00007ffd13318470
RBP: 0000000000000004 R08: 00007ffd133184b0 R09: 0000000000007e87
R10: 0000000000000010 R11: 0000000000000286 R12: 0000000000000010
R13: 00007ffd133184b0 R14: 0000000000000003 R15: 0000000001ee4e54
 </TASK>
================================================================================


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection

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
