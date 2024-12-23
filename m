Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D114C9FB6EA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Dec 2024 23:15:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tPqiB-00028J-8Q;
	Mon, 23 Dec 2024 22:15:38 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3_eBpZwkbAKgaghSITTMZIXXQL.OWWOTMcaMZKWVbMVb.KWU@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1tPqi9-00028B-M9 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 22:15:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DOTVch9ENjh5G2hZPXYsxsV+NVS0MEGDFAzp5NggGZo=; b=jMSma5TaztQky8lbUV+p4Xk6Vp
 eOq8vF1Aa8uRkZ6cqoqbxLZJVFdp0j3KH7hVxMVhGbDMMLHWFEzcQAem7MIm/R1dZ4U7bXjHKhwoI
 UvuAAzlt8TrAyQQh2gJw6UrGaVUgfL8aWzKEmxke+HR0C2uAvA9kfvxCzzOklrzBlWUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DOTVch9ENjh5G2hZPXYsxsV+NVS0MEGDFAzp5NggGZo=; b=f
 ZLyXkdRYrFNJEdgfVDplwLSwRFHaHzDpVT1fVQiJdP/1kEFtMWl17B5XxCPZka7LcKXdyIOy0p1y2
 egNjOsfmqT8vVf3LnWd3tmBjkz9qFD09sTv71XBszm6yR3azxXpPv4t2PCKIJIeKhX6xcaDnaZ3h7
 L2tiSZRu3RVIJtzc=;
Received: from mail-il1-f207.google.com ([209.85.166.207])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tPqi8-0003Ro-95 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 23 Dec 2024 22:15:37 +0000
Received: by mail-il1-f207.google.com with SMTP id
 e9e14a558f8ab-3a812f562bbso94990225ab.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 23 Dec 2024 14:15:36 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734992125; x=1735596925;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=DOTVch9ENjh5G2hZPXYsxsV+NVS0MEGDFAzp5NggGZo=;
 b=HmjaDOJrA9qVFzQokU8GQ+u5iRHTeFqKgaYu0dU1Fhaw9+fdZJwSdsEj43CWIDErjH
 C3o+njEUwgUG2e51+bE0fVAoOe/0vJlcFONPdgkOTMYghR7eZRImWeP6p7GHjmLryVK0
 lx/ulQq4QJC2J04Nfv2opZ14w+FemXZ6CylhpD4hdiNX2Sa9zIqc1cbIlFE9X8Yl5hvA
 sTIpFy8aRtsSJi05To0o86HKFuusPzVtSUH6fMUfeoIvjlC6P4bcRfB6OPWX3WWJGh19
 hqyJdS0A9wRaZTw9wnOslxXintHfdzLvlPCsegDsfz0PL1gN6qnEvyZJO33itw6gG0rn
 D5Xw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW2WET1pe52P5pjYDKdyUu8a085fMx+7Dp5mDiFzJvH7JR90K9iREV1UMnOXcabjFBydudnyJ62A8fVwqDGnPB+@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwqOETZDlANxjyGq/P1HuqjEsTnEEVFGBh6NagS2teDjyBlVSML
 4ThzQktmuNCHw/X8rCIo9AiWcA1wTQpSxX1L+U4NIIwWp5k6ppKGXkfGkep36dt2Z5dEVVEP/dK
 rOoNCFONJvOBNx6fxp8hGarcOmmRVp26Alp2Hr4pQXKDOdl0QLV3WE7s=
X-Google-Smtp-Source: AGHT+IGPeRMQL3aMwhdRAQ0M1vdTerKkog966OXNfFXn8MqyyOF6Eb5CcE69Hd8Npb8/iTWy3HQ00s8MCHM3cUXO5rPUebvd+4Mu
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:2481:b0:3a7:2204:c83e with SMTP id
 e9e14a558f8ab-3c2d2782867mr158970395ab.10.1734992125514; Mon, 23 Dec 2024
 14:15:25 -0800 (PST)
Date: Mon, 23 Dec 2024 14:15:25 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <6769e0fd.050a0220.226966.0045.GAE@google.com>
From: syzbot <syzbot+fbef817617f48116dbdd@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: baaa2567a712
 Merge tag 'mmc-v6.13-rc2' of git://git.kernel.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=112cf730580000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.207 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.166.207 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.207 listed in list.dnswl.org]
X-Headers-End: 1tPqi8-0003Ro-95
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_put_super (2)
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

HEAD commit:    baaa2567a712 Merge tag 'mmc-v6.13-rc2' of git://git.kernel..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=112cf730580000
kernel config:  https://syzkaller.appspot.com/x/.config?x=1234f097ee657d8b
dashboard link: https://syzkaller.appspot.com/bug?extid=fbef817617f48116dbdd
compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/816d068f9171/disk-baaa2567.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/9b40d3a7d8cc/vmlinux-baaa2567.xz
kernel image: https://storage.googleapis.com/syzbot-assets/e9af7e09d18f/bzImage-baaa2567.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+fbef817617f48116dbdd@syzkaller.appspotmail.com

F2FS-fs (loop1): detect filesystem reference count leak during umount, type: 9, count: 2
------------[ cut here ]------------
kernel BUG at fs/f2fs/super.c:1667!
Oops: invalid opcode: 0000 [#1] PREEMPT SMP KASAN PTI
CPU: 1 UID: 0 PID: 7863 Comm: syz-executor Not tainted 6.13.0-rc3-syzkaller-00082-gbaaa2567a712 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 11/25/2024
RIP: 0010:f2fs_put_super+0x1132/0x1150 fs/f2fs/super.c:1667
Code: fd 41 bf 0c 00 00 00 4c 89 e7 44 89 fe e8 56 5a 00 00 4c 89 e7 31 f6 48 c7 c2 00 ab 4f 8c 44 89 f9 49 89 c0 e8 1f c2 fd ff 90 <0f> 0b e8 c7 45 a5 fd 90 0f 0b e8 af 6b c6 07 66 2e 0f 1f 84 00 00
RSP: 0018:ffffc900045afae0 EFLAGS: 00010246
RAX: dab673f7b3e95800 RBX: 0000000000000002 RCX: dab673f7b3e95800
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc900045afc18 R08: ffffffff817f09fc R09: 1ffff920008b5ed0
R10: dffffc0000000000 R11: fffff520008b5ed1 R12: ffff88807e130000
R13: dffffc0000000000 R14: ffff88805514e084 R15: 0000000000000009
FS:  00005555840ad500(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffe765b6f28 CR3: 000000006e1b6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 generic_shutdown_super+0x139/0x2d0 fs/super.c:642
 kill_block_super+0x44/0x90 fs/super.c:1710
 kill_f2fs_super+0x344/0x690 fs/f2fs/super.c:4972
 deactivate_locked_super+0xc4/0x130 fs/super.c:473
 cleanup_mnt+0x41f/0x4b0 fs/namespace.c:1373
 task_work_run+0x24f/0x310 kernel/task_work.c:239
 resume_user_mode_work include/linux/resume_user_mode.h:50 [inline]
 exit_to_user_mode_loop kernel/entry/common.c:114 [inline]
 exit_to_user_mode_prepare include/linux/entry-common.h:329 [inline]
 __syscall_exit_to_user_mode_work kernel/entry/common.c:207 [inline]
 syscall_exit_to_user_mode+0x13f/0x340 kernel/entry/common.c:218
 do_syscall_64+0x100/0x230 arch/x86/entry/common.c:89
 entry_SYSCALL_64_after_hwframe+0x77/0x7f
RIP: 0033:0x7ff2c2d87057
Code: a8 ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 00 f0 ff ff 77 01 c3 48 c7 c2 a8 ff ff ff f7 d8 64 89 02 b8
RSP: 002b:00007ffe765b76d8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007ff2c2d87057
RDX: 0000000000000000 RSI: 0000000000000009 RDI: 00007ffe765b7790
RBP: 00007ffe765b7790 R08: 0000000000000000 R09: 0000000000000000
R10: 00000000ffffffff R11: 0000000000000246 R12: 00007ffe765b8810
R13: 00007ff2c2e01894 R14: 00007ffe765b8850 R15: 0000000000000011
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_put_super+0x1132/0x1150 fs/f2fs/super.c:1667
Code: fd 41 bf 0c 00 00 00 4c 89 e7 44 89 fe e8 56 5a 00 00 4c 89 e7 31 f6 48 c7 c2 00 ab 4f 8c 44 89 f9 49 89 c0 e8 1f c2 fd ff 90 <0f> 0b e8 c7 45 a5 fd 90 0f 0b e8 af 6b c6 07 66 2e 0f 1f 84 00 00
RSP: 0018:ffffc900045afae0 EFLAGS: 00010246
RAX: dab673f7b3e95800 RBX: 0000000000000002 RCX: dab673f7b3e95800
RDX: 0000000000000000 RSI: 0000000080000000 RDI: 0000000000000000
RBP: ffffc900045afc18 R08: ffffffff817f09fc R09: 1ffff920008b5ed0
R10: dffffc0000000000 R11: fffff520008b5ed1 R12: ffff88807e130000
R13: dffffc0000000000 R14: ffff88805514e084 R15: 0000000000000009
FS:  00005555840ad500(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f4e760ce000 CR3: 000000006e1b6000 CR4: 00000000003526f0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
