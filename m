Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA5039D6130
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Nov 2024 16:15:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tEVNi-0007wb-83;
	Fri, 22 Nov 2024 15:15:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3DKBAZwkbAI8BHI3t44xAt881w.z77z4xDBxAv76Cx6C.v75@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tEVNg-0007wV-Td for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 15:15:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ejQ4luGM0Gf7q3W5sue7aadcqAkloWGiUT5VdFqQcio=; b=apr5ZbdXq+JQTWJ0Yd5cwiYLSL
 FVnG4exxzdzA0ZTFetwkAMiQHEOqAyyd2Tz37AXqCMAfaJbx+Ab8jVxSdvp+EyWJaFvTvwD/vBTaD
 YgiWc43cD5uiNINsNn7Qa8XTSrICWClFnZgPl1ceXMNzjoyGMg9Mhy48aZASau2rU3MA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ejQ4luGM0Gf7q3W5sue7aadcqAkloWGiUT5VdFqQcio=; b=E
 gzu7bCPIm+kaSGj4yhq61vRT7ASv3F9eKti12oxPDHurwMeVTvFpYX5iVfq6u/fo55hSnmq+7NrQ5
 nAVaB1CTe3hI05yKUQu6AAUVh9Wuc5kscHMN0kgLyDkOlylUeaITWM/H5QicfIakQCwCqbIDZGnxh
 LJ42x21vk5Ft/IWk=;
Received: from mail-io1-f70.google.com ([209.85.166.70])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tEVNf-0004ey-II for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Nov 2024 15:15:36 +0000
Received: by mail-io1-f70.google.com with SMTP id
 ca18e2360f4ac-83adc5130e3so226035839f.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Nov 2024 07:15:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1732288525; x=1732893325;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ejQ4luGM0Gf7q3W5sue7aadcqAkloWGiUT5VdFqQcio=;
 b=RkiCS1rHOsXZrxD7ONiCCPU8qszlq3DW1b5TrzOaal/tLH8Y8zA38ij6q4HxOEei7e
 IvaH6lpMd+GgtCW4fVNJ0vJqU6IZC/OScplsRTRuQuY+PKpw5fVbrBBZ5tUhpMKnePCa
 ozI5E/TdWBURUsAC+OAiAUsNXmJhcgD4bg8OezSXOFYJ3Al6iW1j8RPpWYDb6x2fgNEr
 y+ZEPfWhM0VmYy1XpAHaCIu2x7fG/fyJxLewD+u/KMlN7WTUyjIj6CHC4Gec0kc6v3/I
 ndTIfSlH98KF37ZfWFl/Fck46V7lTvQSWSuhkKVpos71gz4sIFVRgR4fkx30WC4EUiEw
 ALag==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbD8dwbBGT/umzicbAt2FKobRV1m8bPGXPF7idOdb3qzm6JdPYnHgv/tUbeVGitrFdVjOkOtm7D0DIJ/Saw481@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzWVvrEG7GV035PX2m7a02cVS8dDyzW7htzm//MMqrTxbt6w6ib
 z/SSy8TgjgUC+SNW5JzgIPX7OWo/9JhJz2b+8m35VfMgWR5bmOXGHSPWkGiwPsjFOcr1PE0Sggf
 sl+XkIiOaT6JWapTzJm9eIiUbygwKz6mrT1u/Bly7Z0+SoHrA8xwC3HM=
X-Google-Smtp-Source: AGHT+IEuzJDSiXvi4tJrnkPXJgVJtTbxGoUlnFlYXnfnOA85fBK28gFk1/h0ZXpAQ0p5T+ReZxKH1kWjBmAvrnY3xqHS3o1l7bRM
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:18c8:b0:3a7:9801:9d11 with SMTP id
 e9e14a558f8ab-3a79afd9c2fmr27835885ab.22.1732288524703; Fri, 22 Nov 2024
 07:15:24 -0800 (PST)
Date: Fri, 22 Nov 2024 07:15:24 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6740a00c.050a0220.363a1b.0144.GAE@google.com>
From: syzbot <syzbot+35a21b6aade7af3c7b3a@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 7b1d1d4cfac0
 Merge remote-tracking branch 'iommu/arm/smmu'.. git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.70 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.70 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.70 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.70 listed in wl.mailspike.net]
X-Headers-End: 1tEVNf-0004ey-II
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_delete_entry
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

HEAD commit:    7b1d1d4cfac0 Merge remote-tracking branch 'iommu/arm/smmu'..
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12978ec0580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=dfe1e340fbee3d16
dashboard link: https://syzkaller.appspot.com/bug?extid=35a21b6aade7af3c7b3a
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=12f31b78580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16978ec0580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/354fe38e2935/disk-7b1d1d4c.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/f12e0b1ef3fd/vmlinux-7b1d1d4c.xz
kernel image: https://storage.googleapis.com/syzbot-assets/291dbc519bb3/Image-7b1d1d4c.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/009d543e9698/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+35a21b6aade7af3c7b3a@syzkaller.appspotmail.com

F2FS-fs (loop0): invalid crc value
F2FS-fs (loop0): Found nat_bits in checkpoint
F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
------------[ cut here ]------------
WARNING: CPU: 1 PID: 6420 at fs/inode.c:336 drop_nlink+0xe4/0x138 fs/inode.c:336
Modules linked in:
CPU: 1 UID: 0 PID: 6420 Comm: syz-executor117 Not tainted 6.12.0-syzkaller-g7b1d1d4cfac0 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
pstate: 80400005 (Nzcv daif +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
pc : drop_nlink+0xe4/0x138 fs/inode.c:336
lr : drop_nlink+0xe4/0x138 fs/inode.c:336
sp : ffff8000a3d57930
x29: ffff8000a3d57930 x28: 0000000000000000 x27: dfff800000000000
x26: 0000000000000003 x25: fffffdffc363c040 x24: 1fffe0001bc77232
x23: 1fffe0001bc7723b x22: dfff800000000000 x21: 0000000000000000
x20: ffff0000de3b91d8 x19: ffff0000de3b9190 x18: ffff8000a3d57520
x17: 000000000000d842 x16: ffff800080355c58 x15: 0000000000000001
x14: 1ffff00011f440c0 x13: 0000000000000000 x12: 0000000000000000
x11: ffff700011f440c1 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000c2d80000 x7 : 0000000000000000 x6 : 0000000000000000
x5 : ffff8000933cf888 x4 : 0000000000000004 x3 : ffff8000804807cc
x2 : 0000000000000000 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drop_nlink+0xe4/0x138 fs/inode.c:336 (P)
 drop_nlink+0xe4/0x138 fs/inode.c:336 (L)
 f2fs_i_links_write fs/f2fs/f2fs.h:3127 [inline]
 f2fs_drop_nlink+0xd0/0x2ec fs/f2fs/dir.c:822
 f2fs_delete_entry+0x9c8/0xcb0 fs/f2fs/dir.c:886
 f2fs_unlink+0x48c/0xad8 fs/f2fs/namei.c:572
 vfs_unlink+0x2f0/0x534 fs/namei.c:4469
 do_unlinkat+0x4d0/0x700 fs/namei.c:4533
 __do_sys_unlinkat fs/namei.c:4576 [inline]
 __se_sys_unlinkat fs/namei.c:4569 [inline]
 __arm64_sys_unlinkat+0xc8/0xf8 fs/namei.c:4569
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x2b8 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x54/0x168 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x108 arch/arm64/kernel/entry-common.c:762
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:600
irq event stamp: 212352
hardirqs last  enabled at (212351): [<ffff80008047a5a4>] seqcount_lockdep_reader_access+0x80/0x104 include/linux/seqlock.h:74
hardirqs last disabled at (212352): [<ffff80008b4b302c>] el1_dbg+0x24/0x80 arch/arm64/kernel/entry-common.c:488
softirqs last  enabled at (212312): [<ffff80008020396c>] softirq_handle_end kernel/softirq.c:400 [inline]
softirqs last  enabled at (212312): [<ffff80008020396c>] handle_softirqs+0xa38/0xbf8 kernel/softirq.c:582
softirqs last disabled at (212299): [<ffff800080020db4>] __do_softirq+0x14/0x20 kernel/softirq.c:588
---[ end trace 0000000000000000 ]---


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
