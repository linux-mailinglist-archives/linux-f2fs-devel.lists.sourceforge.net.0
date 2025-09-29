Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E493BAA795
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Sep 2025 21:33:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G6S3RXtdw2yyreVifQJkhf5Cxr+0JbB98wUfGMe6uqs=; b=UMgq9at1HiQZjkpy7HTOuCKb8/
	lkSL28XaToByrjmAf4r1518xbs/0Y21HLqQqhj7GLDAEUXQgjYuXZXXgm8+DK8fue32Wu/ZezZAQ9
	F2LNYIV3ZxBx63opElWNfpt0Ah8Vfdm0Pl/VlG5vD+OVnek+NulgcknxiFWMw3jEkFF0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v3Jd5-0003VO-6C;
	Mon, 29 Sep 2025 19:33:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3Dt_aaAkbAIU178tjuun0jyyrm.pxxpun31n0lxw2nw2.lxv@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1v3Jd4-0003VI-7d for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 19:33:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8GrA/dxNmeCNKoRCIKfSaDXkaBQWFsISbwSfBgBLiZ8=; b=cdSM1XC5H6Rh6F41d0g4UueRWz
 s735X0iratuVqA5YtYBRnIg1PI1OySfubob/e4++ba3xc/FuOShG3BPB8OmTVdkJsOv/XpPXbP70s
 eJl3mzIXYBUnZqPixEx4k13eJcpgcI/c/yoIkHE8boeGRuQZ38PpguTzhqlqlvAYJQzs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8GrA/dxNmeCNKoRCIKfSaDXkaBQWFsISbwSfBgBLiZ8=; b=a
 qvQevyyJyFgITf53bP+3NwVqEbQeoPiiUC9QAQD41x2yhU4Eou1lh8EniAZz0EebId0Ifc1UiJx7q
 9FVX/Es2rW19SeL8KIgiUfrb1YuqZJcdzXOvq3GLw/ksPivlqX22p7LgumPiaPt87dh2t7X/kvz3i
 On2HGSXMFc1DkUPM=;
Received: from mail-il1-f207.google.com ([209.85.166.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1v3Jd3-00042T-MP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Sep 2025 19:33:46 +0000
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-4256ef4eea3so61409555ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Sep 2025 12:33:45 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759174415; x=1759779215;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=8GrA/dxNmeCNKoRCIKfSaDXkaBQWFsISbwSfBgBLiZ8=;
 b=idpEkBIwTUQDNJ4qKB6KgJkwsbItOcyHhlgqCAiLapO42gCVNwO5c8YS2JysfFcFvT
 5vspTG2/7MzByzioX35yuFMBW15aemPuaAo9IQB9+C6HpYMpBOwNO7khyurj2i4x6K3e
 TZWVE7ZELB80qqZQPfS+jL0PJBU6DzC/shV9fRYIwNjA0+e/AYgCqnTMHRiD46Gbn8PO
 H3iH8eUzVtYlONQhou9v2luKZD3KpOOoEfPmySMywWPgdorF9E8l06w9r1of2W3/3ioS
 eFDE1s5Tx8fkQgR0i1gOOiGerO8rdOK3t4YpBxBTrDF9gc8PmTxVVUeEfmLwi+wNfBJJ
 VRYA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKDLl1hiSfMqsKEM92oRiMK7OfPG+xFIs8D9a0NjCDm1UtLN6bqv/ksjd8d+s9IziaMbCihg73YnIZ78rlq6j6@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzAb/x3CNSAMt6AVai1ZRPxvnhby7TR6MLnuLNFTrEnPgovYfeL
 wNgXP4vZ1tas/geuL+Vu71YweRuoxYZ2ajiwT1rpvw98kXWNcptFzhf1tmDIqxMZgTkHmmiResP
 IN7ni+LtwV8OcIs9a6hN/N6mmDOJE1foe1XCZZX/V91DggMNXp7MBzUwDpAE=
X-Google-Smtp-Source: AGHT+IG/ZuGyC0whfkXft9y1iVjwscYzOZ6qkOU7Ohgx6BuMWXQEwT9VY5IGEOzlFq5MUmmk0n1PFlUZWA6+1UtZDegaTkY8HK1U
MIME-Version: 1.0
X-Received: by 2002:a92:c262:0:b0:42a:7339:94a3 with SMTP id
 e9e14a558f8ab-42a7348dce0mr77929405ab.1.1759174414939; Mon, 29 Sep 2025
 12:33:34 -0700 (PDT)
Date: Mon, 29 Sep 2025 12:33:34 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68dadf0e.050a0220.1696c6.001d.GAE@google.com>
From: syzbot <syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 2213e57a69f0
 Merge branch 'for-next/core' into for-kernelci git tree:
 git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git
 for-kernelci console output: https://syzkaller.appspot. [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.207 listed in wl.mailspike.net]
X-Headers-End: 1v3Jd3-00042T-MP
Subject: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_delete_entry (2)
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

HEAD commit:    2213e57a69f0 Merge branch 'for-next/core' into for-kernelci
git tree:       git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git for-kernelci
console output: https://syzkaller.appspot.com/x/log.txt?x=12a822e2580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=714d45b6135c308e
dashboard link: https://syzkaller.appspot.com/bug?extid=c07d47c7bc68f47b9083
compiler:       Debian clang version 20.1.8 (++20250708063551+0c9f909b7976-1~exp1~20250708183702.136), Debian LLD 20.1.8
userspace arch: arm64
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1341fce2580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=144ddd34580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/bf4625d47a8f/disk-2213e57a.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/270abffcbf3c/vmlinux-2213e57a.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1f0f6eb3e385/Image-2213e57a.gz.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/2f5997142143/mount_0.gz
  fsck result: failed (log: https://syzkaller.appspot.com/x/fsck.log?x=135f62e2580000)

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+c07d47c7bc68f47b9083@syzkaller.appspotmail.com

------------[ cut here ]------------
WARNING: CPU: 0 PID: 6642 at fs/inode.c:417 drop_nlink+0xe4/0x138 fs/inode.c:417
Modules linked in:
CPU: 0 UID: 0 PID: 6642 Comm: syz-executor Not tainted syzkaller #0 PREEMPT 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/30/2025
pstate: 83400005 (Nzcv daif +PAN -UAO +TCO +DIT -SSBS BTYPE=--)
pc : drop_nlink+0xe4/0x138 fs/inode.c:417
lr : drop_nlink+0xe4/0x138 fs/inode.c:417
sp : ffff8000a54b79a0
x29: ffff8000a54b79a0 x28: dfff800000000000 x27: ffff0000efc5d000
x26: dfff800000000000 x25: 0000000200000000 x24: 0000000000000000
x23: 1fffe0001d284485 x22: dfff800000000000 x21: 0000000000000000
x20: ffff0000e9422428 x19: ffff0000e94223e0 x18: 0000000000000000
x17: 0000000000000000 x16: ffff8000805379bc x15: 0000000000000001
x14: 1fffe0001bd69171 x13: 0000000000000000 x12: 0000000000000000
x11: ffff60001bd69172 x10: 0000000000ff0100 x9 : 0000000000000000
x8 : ffff0000cdeb8000 x7 : ffff8000826e1b78 x6 : 0000000000000000
x5 : 0000000000000000 x4 : 0000000000000001 x3 : ffff800080537ac4
x2 : 0000000000000001 x1 : 0000000000000000 x0 : 0000000000000000
Call trace:
 drop_nlink+0xe4/0x138 fs/inode.c:417 (P)
 f2fs_i_links_write fs/f2fs/f2fs.h:3233 [inline]
 f2fs_drop_nlink+0x104/0x2e8 fs/f2fs/dir.c:849
 f2fs_delete_entry+0x740/0x9a8 fs/f2fs/dir.c:911
 f2fs_unlink+0x344/0xa3c fs/f2fs/namei.c:590
 f2fs_rmdir+0x5c/0x7c fs/f2fs/namei.c:755
 vfs_rmdir+0x328/0x464 fs/namei.c:4461
 do_rmdir+0x214/0x4c4 fs/namei.c:4516
 __do_sys_unlinkat fs/namei.c:4690 [inline]
 __se_sys_unlinkat fs/namei.c:4684 [inline]
 __arm64_sys_unlinkat+0xc8/0xf8 fs/namei.c:4684
 __invoke_syscall arch/arm64/kernel/syscall.c:35 [inline]
 invoke_syscall+0x98/0x254 arch/arm64/kernel/syscall.c:49
 el0_svc_common+0x130/0x23c arch/arm64/kernel/syscall.c:132
 do_el0_svc+0x48/0x58 arch/arm64/kernel/syscall.c:151
 el0_svc+0x5c/0x254 arch/arm64/kernel/entry-common.c:744
 el0t_64_sync_handler+0x84/0x12c arch/arm64/kernel/entry-common.c:763
 el0t_64_sync+0x198/0x19c arch/arm64/kernel/entry.S:596
irq event stamp: 143176
hardirqs last  enabled at (143175): [<ffff8000806302f8>] seqcount_lockdep_reader_access+0x80/0x104 include/linux/seqlock.h:74
hardirqs last disabled at (143176): [<ffff80008b01a2c4>] el1_brk64+0x20/0x54 arch/arm64/kernel/entry-common.c:434
softirqs last  enabled at (142090): [<ffff800080201608>] local_bh_enable+0x10/0x34 include/linux/bottom_half.h:32
softirqs last disabled at (142088): [<ffff8000802015d4>] local_bh_disable+0x10/0x34 include/linux/bottom_half.h:19
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
