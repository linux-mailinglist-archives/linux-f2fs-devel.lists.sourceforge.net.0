Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7F84B9E20A0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Dec 2024 16:01:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tIUPB-0006dK-Mo;
	Tue, 03 Dec 2024 15:01:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3SR1PZwkbAAIu01mcnngtcrrkf.iqqingwugteqpvgpv.eqo@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tIUP9-0006dD-QY for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 15:01:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=htusEmkyDY/hbdcduVlcNhrCjMOkDBfuFuzKEt3oxJ0=; b=j36ppWrp4jOeBarMck3BwBwFbv
 OslX0tmfHlkJ92vcHCGiVdpTeEt09HMWEjskByDQnZnr3V9h0lDdgixnLZKgLxM3xs+bfGgJul1q9
 yBZ6SYHtNme/6nQ9yeYca3i4UdzMGEg2tMUY1T/2d8jfR4mgpP76axoTifxjCWMWHGws=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=htusEmkyDY/hbdcduVlcNhrCjMOkDBfuFuzKEt3oxJ0=; b=e
 543ZJQKstevIwzqWRkm+XbI2CHSljK7wZkoMhvqMLgmGlk5M+i7lAV4QUoFNizTH3SJXdT4fV1qjI
 h4y26O/Q09TO9jF7VgMcQFQLScypFDmzBVIp2my7W6OtWxjTPwXpeqvsUlvz/dLvo9QZ+6JMEaHcl
 wVulNfKjSEJ6KfFQ=;
Received: from mail-il1-f208.google.com ([209.85.166.208])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tIUP9-0002ZY-PT for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Dec 2024 15:01:36 +0000
Received: by mail-il1-f208.google.com with SMTP id
 e9e14a558f8ab-3a79088e7abso49010105ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 03 Dec 2024 07:01:35 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733238090; x=1733842890;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=htusEmkyDY/hbdcduVlcNhrCjMOkDBfuFuzKEt3oxJ0=;
 b=uEpmqeORSpEaSWSLidu8BCuFdhHqJuhwVOJglQZO1yr1GzX+/DAWp4cVQm5xaPgM25
 QJJsNLDJT9Ct/KRMU2Y6VAeaXozq5q1dIcahw0JfqQSl7VkZ1/j5riafebV0ovsKXvO6
 dOTouGFy6XQVToc01aGqFdBWR1C7tyuuInHiS1cHqBvksVvw922/oGxEo1Wq6NvQZPLx
 Ul9zglx56L2i4p3jfpvVTESdasfhI/lpP3Mud7dozYKUAhkC8x7vzGq6HQ1wwIK+tLwE
 s14pl98gEJub3DO2mKXXw7Rs/GTn4JpyLkcaNjejwLY7FmjVt+/xgiA555Qhinjv7h7W
 D8eQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8W+PiNmo4dWJKQNik4N5qIWWbovrizIrxksY/O2tvE+Q2YOccHSoOOw1fgSzhSQYx8RvGQs7HwIq99rz4Gc8E@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yy2SIVseqTUFzs4kw7mJO9daLf9jhE70KYCPzUpMzw1gdhxKTTf
 tm1E8XKCi5NM0fkNDHVcC37j8mJPgMrygdJrtYLOGCRwoKVxu6zCyEckUoq/y/6u98mIzORE+At
 /AM3oDA8wq38vvCFhFW1aHZOp1xJuO2mEmLcwJxjzaQFQImaywYut1O0=
X-Google-Smtp-Source: AGHT+IEbjGX4zYdW+eNsISIwwcOpV6m4rCfsdUDuP40rWLKfNrY/QCJxUommigDOdl5Hxs2Y7WIN81pSYj8Q7Uiy77OOs2aChOdb
MIME-Version: 1.0
X-Received: by 2002:a92:c265:0:b0:3a7:e8df:3fde with SMTP id
 e9e14a558f8ab-3a7f9a46252mr27511935ab.9.1733238089926; Tue, 03 Dec 2024
 07:01:29 -0800 (PST)
Date: Tue, 03 Dec 2024 07:01:29 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <674f1d49.050a0220.48a03.003b.GAE@google.com>
From: syzbot <syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 0e287d31b62b
 Merge tag 'rtc-6.13' of git://git.kernel.org/.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=117ddf78580000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.208 listed in list.dnswl.org]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.208 listed in sa-trusted.bondedsender.org]
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.208 listed in wl.mailspike.net]
X-Headers-End: 1tIUP9-0002ZY-PT
Subject: [f2fs-dev] [syzbot] [f2fs?] KMSAN: uninit-value in
 f2fs_new_node_page
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

HEAD commit:    0e287d31b62b Merge tag 'rtc-6.13' of git://git.kernel.org/..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=117ddf78580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=b131ba4658863ffa
dashboard link: https://syzkaller.appspot.com/bug?extid=5141f6db57a2f7614352
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=145a65e8580000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=157ddf78580000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/19a3d9ed3459/disk-0e287d31.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/3473a586f547/vmlinux-0e287d31.xz
kernel image: https://storage.googleapis.com/syzbot-assets/bfd02e5a5157/bzImage-0e287d31.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/f9968897b785/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+5141f6db57a2f7614352@syzkaller.appspotmail.com

F2FS-fs (loop0): Mounted with checkpoint version = 48b305e5
F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=1, run fsck to fix.
F2FS-fs (loop0): f2fs_check_nid_range: out-of-range nid=2, run fsck to fix.
=====================================================
BUG: KMSAN: uninit-value in f2fs_new_node_page+0x14c5/0x1690 fs/f2fs/node.c:1341
 f2fs_new_node_page+0x14c5/0x1690 fs/f2fs/node.c:1341
 f2fs_new_inode_page+0xb6/0x100 fs/f2fs/node.c:1311
 f2fs_init_inode_metadata+0x18b/0x1e40 fs/f2fs/dir.c:501
 f2fs_add_inline_entry+0x5f5/0xbe0 fs/f2fs/inline.c:665
 f2fs_add_dentry fs/f2fs/dir.c:742 [inline]
 f2fs_do_add_link+0x4b0/0xad0 fs/f2fs/dir.c:785
 f2fs_add_link fs/f2fs/f2fs.h:3628 [inline]
 f2fs_symlink+0x6d5/0xf80 fs/f2fs/namei.c:641
 vfs_symlink+0x1ed/0x460 fs/namei.c:4669
 do_symlinkat+0x253/0x8b0 fs/namei.c:4695
 __do_sys_symlink fs/namei.c:4716 [inline]
 __se_sys_symlink fs/namei.c:4714 [inline]
 __x64_sys_symlink+0xe0/0x140 fs/namei.c:4714
 x64_sys_call+0x31ca/0x3c30 arch/x86/include/generated/asm/syscalls_64.h:89
 do_syscall_x64 arch/x86/entry/common.c:52 [inline]
 do_syscall_64+0xcd/0x1e0 arch/x86/entry/common.c:83
 entry_SYSCALL_64_after_hwframe+0x77/0x7f

Local variable new_ni created at:
 f2fs_new_node_page+0xa4/0x1690 fs/f2fs/node.c:1317
 f2fs_new_inode_page+0xb6/0x100 fs/f2fs/node.c:1311

CPU: 0 UID: 0 PID: 5782 Comm: syz-executor986 Not tainted 6.12.0-syzkaller-11930-g0e287d31b62b #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
=====================================================


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
