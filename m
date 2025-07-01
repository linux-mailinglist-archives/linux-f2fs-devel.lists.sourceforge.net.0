Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EAB2AEF049
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  1 Jul 2025 09:58:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:To:From:Message-ID:Date:MIME-Version:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=WLNhJf6KUk2n0awwIAz0rjPZX+81VoXYpMC2GIlT/uk=; b=Whwpy0vKK3jPYPo7cZ1rutTzLE
	8CfiXkYKpwodx3bXZyztx7KIqxknCNCwLA0a6rJoP8D6y4cza673Yw1BNS4HNIt0b7E4+Va89J5Kf
	JueN+kNvv0004RKlfjlX1Z7/DOSna+kZUSGVLo+1ON10TLjuKgnHOQWY/LU1iKGMiJEw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWVsz-0008Ly-TQ;
	Tue, 01 Jul 2025 07:58:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3IJVjaAkbACMRXYJ9KKDQ9OOHC.FNNFKDTRDQBNMSDMS.BNL@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1uWVsy-0008Ls-9O for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 07:58:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+CLVQD3LnpmiHjpHVQmScdzZclDfnwrqpmpY5qBYtNM=; b=mU7o3LE65xjoPT5HW1301RkR9L
 bciKYX9SGlFaoAdGR7mdsudd93gWJQrcXumK8KQy6MLoH2RNEQDmmvCrZM5ae2gW//+POW0r3Ilt4
 497sdTXB/5xPY0Vs1QGshQHyRBVSQV7ulapAW9OvH8//876z8gL665xb30MvGEvfVe0M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+CLVQD3LnpmiHjpHVQmScdzZclDfnwrqpmpY5qBYtNM=; b=j
 w/fFN5yIqMojLcviDo2YZJqdgFAPJW7cC1hEvXlAVbT6LO3BCmK0M2mqnKysR9r7lB5g7DBF4Fu7n
 DICqPNL6MqXC3uQn1vpa4Pr/IYInpob6TtnitCTqWZnD6rPkprKiJjRm60dPp/0nFJKhXBN6gHlKd
 vrEXExQDgfqinUhU=;
Received: from mail-il1-f207.google.com ([209.85.166.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uWVsx-0008Gk-N0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 01 Jul 2025 07:58:36 +0000
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3df4d2a8b5eso32265705ab.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 01 Jul 2025 00:58:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751356705; x=1751961505;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=+CLVQD3LnpmiHjpHVQmScdzZclDfnwrqpmpY5qBYtNM=;
 b=GLImjBVfYtabVD9zTGDeMKobErpJrlv8lxmi1FDWtjLTJDdaULl8TsWOLs2j1bDY0N
 BSY7OQoIy7OMU9N70wvT7WBplZTacM5Q8m6B9cN/kARHV2afP3OVGjityKtqyMgbT6sj
 xcv7ca9p3rVtVvH+g0mnByCdJT5cjc4hNAJJ4TxE1k3DOJ2ueCCLHhIM46IZ9NVL+yVx
 93+d0VQJz83IeD7XfWw++iu4LvA2aIYJrkZgzXtyTv1liIZfUx50X//oViwgOyUZ8USr
 EpDFSRZojYPz5p2GMczxU+s6UXx/1T+YcVN9Z0l9U/v3F3NhYnOHeG4E8qKBmcFmAVTS
 xf1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUpSYVXVVai4EcIaPGT5684xaSgCJz1ivDLzl5TYfK8qpmkXersEazhpgY6j4+ImssiKzAcKa251Y7e30ukv8Ls@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyaG/uafLh8dxDIZa+ZxuvNNw517miSt77RJ+WhPbF+CKvwWeJp
 annn7TIhWrqVWWkU7wePmC+NlTe6YJR6qVddFNBDwLRqRGI6GuV9ZtFsBfjSXUQQRbtUMp7Yqeu
 dvn2B7gI2v/uNi19aNeVNeW3N9MK7qukZ97mqIFuwb9pRf2rEgbCoXz/KSNI=
X-Google-Smtp-Source: AGHT+IEcB8LepVGB5wtxw5BKfJ9I8GpscC9V+PYsDaWVWZuuA+linCaw8tr9p2nd4DKfx/Z4dw65m45nHOomThcm1O32dzyoUkEu
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:1847:b0:3dd:c946:a273 with SMTP id
 e9e14a558f8ab-3df4ab865f0mr180191355ab.9.1751356704669; Tue, 01 Jul 2025
 00:58:24 -0700 (PDT)
Date: Tue, 01 Jul 2025 00:58:24 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <68639520.a70a0220.3b7e22.17e6.GAE@google.com>
From: syzbot <syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 2aeda9592360
 Add linux-next specific files for 20250627 git tree: linux-next console
 output:
 https://syzkaller.appspot.com/x/log.txt?x=152363d4580000 kernel config:
 https://syzkaller.apps [...] 
 Content analysis details:   (0.3 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.207 listed in wl.mailspike.net]
X-Headers-End: 1uWVsx-0008Gk-N0
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in do_write_page
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

HEAD commit:    2aeda9592360 Add linux-next specific files for 20250627
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=152363d4580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=7f5c1d958b70bf47
dashboard link: https://syzkaller.appspot.com/bug?extid=9201a61c060513d4be38
compiler:       Debian clang version 20.1.6 (++20250514063057+1e4d39e07757-1~exp1~20250514183223.118), Debian LLD 20.1.6

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d532560074a3/disk-2aeda959.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/483001f76864/vmlinux-2aeda959.xz
kernel image: https://storage.googleapis.com/syzbot-assets/8f233cdc1c77/bzImage-2aeda959.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9201a61c060513d4be38@syzkaller.appspotmail.com

F2FS-fs (loop9): inject invalid blkaddr in f2fs_is_valid_blkaddr of do_write_page+0x277/0xb10 fs/f2fs/segment.c:3956
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:3957!
Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
CPU: 0 UID: 0 PID: 10538 Comm: syz-executor Not tainted 6.16.0-rc3-next-20250627-syzkaller #0 PREEMPT(full) 
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 05/07/2025
RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f2ce7b71d60 CR3: 0000000031b0e000 CR4: 00000000003526f0
Call Trace:
 <TASK>
 f2fs_outplace_write_data+0x11a/0x220 fs/f2fs/segment.c:4017
 f2fs_do_write_data_page+0x12ea/0x1a40 fs/f2fs/data.c:2752
 f2fs_write_single_data_page+0xa68/0x1680 fs/f2fs/data.c:2851
 f2fs_write_cache_pages fs/f2fs/data.c:3133 [inline]
 __f2fs_write_data_pages fs/f2fs/data.c:3282 [inline]
 f2fs_write_data_pages+0x195b/0x3000 fs/f2fs/data.c:3309
 do_writepages+0x32b/0x550 mm/page-writeback.c:2636
 filemap_fdatawrite_wbc mm/filemap.c:386 [inline]
 __filemap_fdatawrite_range mm/filemap.c:419 [inline]
 __filemap_fdatawrite mm/filemap.c:425 [inline]
 filemap_fdatawrite+0x199/0x240 mm/filemap.c:430
 f2fs_sync_dirty_inodes+0x31f/0x830 fs/f2fs/checkpoint.c:1108
 block_operations fs/f2fs/checkpoint.c:1247 [inline]
 f2fs_write_checkpoint+0x95a/0x1df0 fs/f2fs/checkpoint.c:1638
 kill_f2fs_super+0x2c3/0x6c0 fs/f2fs/super.c:5081
 deactivate_locked_super+0xb9/0x130 fs/super.c:474
 cleanup_mnt+0x425/0x4c0 fs/namespace.c:1417
 task_work_run+0x1d4/0x260 kernel/task_work.c:227
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop+0xec/0x110 kernel/entry/common.c:114
 exit_to_user_mode_prepare include/linux/entry-common.h:330 [inline]
 syscall_exit_to_user_mode_work include/linux/entry-common.h:414 [inline]
 syscall_exit_to_user_mode include/linux/entry-common.h:449 [inline]
 do_syscall_64+0x2bd/0x3b0 arch/x86/entry/syscall_64.c:100
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7f85f3d8fc57
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffc395e64c8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 00007f85f3e10925 RCX: 00007f85f3d8fc57
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffc395e6580
RBP: 00007ffc395e6580 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffc395e7610
R13: 00007f85f3e10925 R14: 00000000000c355a R15: 00007ffc395e7650
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:do_write_page+0xa44/0xb10 fs/f2fs/segment.c:3956
Code: 82 7f ad fd 49 89 ed 48 89 e8 48 25 ff 0f 00 00 74 1a e8 8f 7a ad fd e9 9f 00 00 00 e8 85 7a ad fd 90 0f 0b e8 7d 7a ad fd 90 <0f> 0b 4d 89 ee 4c 89 ef be 08 00 00 00 e8 7a 7c 11 fe 49 c1 ee 03
RSP: 0018:ffffc90004f2ec58 EFLAGS: 00010293
RAX: ffffffff841257e3 RBX: ffffc90004f2ef40 RCX: ffff88802f493c00
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc90004f2ef5c R08: 0000000000000003 R09: 0000000000000004
R10: dffffc0000000000 R11: fffffbfff1bfa428 R12: ffff888042d28000
R13: 1ffff920009e5deb R14: dffffc0000000000 R15: ffffc90004f2ef5c
FS:  000055555f3a1500(0000) GS:ffff888125c1e000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ff1d4e5ef40 CR3: 0000000031b0e000 CR4: 00000000003526f0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.

If the report is already addressed, let syzbot know by replying with:
#syz fix: exact-commit-title

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
