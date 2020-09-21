Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69C09271E31
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Sep 2020 10:41:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKHOG-0004Dd-2u; Mon, 21 Sep 2020 08:41:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3MGdoXwkbAKETZaLBMMFSBQQJE.HPPHMFVTFSDPOUFOU.DPN@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kKHOE-0004DV-06
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 08:41:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c4HhHXZZGrSKTcTM17ro4CKqKcqkq/waKOGnozhbv5g=; b=i8qI3Zz92uobDTP1nHzLjBtglU
 jWlx/K5bnbYq8HO8WtfzSlnwfKpM2chKl7soQomOyOgHEt4DkbVQRCwVBHAIfGbLs8lNh+zloeGRJ
 kjtUwk7u5dq1Ng3k31AutVbn86c1uWWqVSpCohlTqVnPcK3z7/lQsHWuWv2Mqa8hnFF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c4HhHXZZGrSKTcTM17ro4CKqKcqkq/waKOGnozhbv5g=; b=M
 UwkN/l2X7JpfLCP4GQCRSRou5MbVETiB9b2MssEFjiZzzvHANMej40b0Ke2/fuMsP7Pl6V4IPzscc
 dDoPj7hMhNb/J5anag+KepxYvB6yFX0mX40oNvVwAIvMQZO5+yuz0K842RTfaes0GESAUmAxnq3hw
 bHtgY8geLs+lXikQ=;
Received: from mail-io1-f77.google.com ([209.85.166.77])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKHO2-001lVy-FQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 21 Sep 2020 08:41:37 +0000
Received: by mail-io1-f77.google.com with SMTP id l8so9382016ioa.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 21 Sep 2020 01:41:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=c4HhHXZZGrSKTcTM17ro4CKqKcqkq/waKOGnozhbv5g=;
 b=S+9Avn0p/PAruhocvfMcTPHHuYPqlXHt6DCGYmffFDXT24tYrcnupM/5m1Ma7Dur1y
 qzHX9MFx5q3PR1B4LcuIr/x80jvyPztkiyH3SkxXm4flDMuylQLf2p9YAfwDvufJ80qn
 7PNNBgFzj6rJ3PAopMuQSH0xJforu+A8E5UCxZn/39XcEZrYxDuez2sfab8A/vbIDyWq
 0P8Az87SEZIbsAwGOJ6qBjSFFqyofUq8fSNbSJJyDUhwRDpTNnMWQWJziRellYu99dCW
 3L36rDdH9PyPclOvvor4oO1G3kSkN3XR40+7fHqXBKoLnubaXPDz3tvKathiygLBKkpO
 dqsQ==
X-Gm-Message-State: AOAM531tuE2J0Syw6gi0Z+KJokfzRDAF8HQpx/s04t480kMB8d5p2blh
 14Tce/Ktz93bkQT1/8opt8CIs2KkalviG7+Uz2+y14zTTZ8k
X-Google-Smtp-Source: ABdhPJyYSHQZ1eVJjA+AUJXiv3Rk4hW+a+c63bZbA63TdG5HylRlDHEkyyG6MltcPYi31A6EjOXkym3Hbznulk0QlaL0Y2NnCSqU
MIME-Version: 1.0
X-Received: by 2002:a92:9ad6:: with SMTP id c83mr11379566ill.155.1600677680759; 
 Mon, 21 Sep 2020 01:41:20 -0700 (PDT)
Date: Mon, 21 Sep 2020 01:41:20 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000008fcdcc05afced03d@google.com>
From: syzbot <syzbot+978a34b783141d673eda@syzkaller.appspotmail.com>
To: aravind.ramesh@wdc.com, chao@kernel.org, damien.lemoal@wdc.com, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, niklas.cassel@wdc.com, 
 syzkaller-bugs@googlegroups.com, yuchao0@huawei.com
X-Spam-Score: 3.1 (+++)
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
 2.5 SORTED_RECIPS          Recipient list is sorted by address
X-Headers-End: 1kKHO2-001lVy-FQ
Subject: [f2fs-dev] general protection fault in f2fs_usable_blks_in_seg
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

HEAD commit:    b652d2a5 Add linux-next specific files for 20200918
git tree:       linux-next
console output: https://syzkaller.appspot.com/x/log.txt?x=103ab84b900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=3cf0782933432b43
dashboard link: https://syzkaller.appspot.com/bug?extid=978a34b783141d673eda
compiler:       gcc (GCC) 10.1.0-syz 20200507
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=10ffaec5900000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=16aa5d1d900000

The issue was bisected to:

commit de881df97768d07b342cbd1f8359b832afccace9
Author: Aravind Ramesh <aravind.ramesh@wdc.com>
Date:   Thu Jul 16 12:56:56 2020 +0000

    f2fs: support zone capacity less than zone size

bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=10f2f707900000
final oops:     https://syzkaller.appspot.com/x/report.txt?x=12f2f707900000
console output: https://syzkaller.appspot.com/x/log.txt?x=14f2f707900000

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+978a34b783141d673eda@syzkaller.appspotmail.com
Fixes: de881df97768 ("f2fs: support zone capacity less than zone size")

F2FS-fs (loop0): Magic Mismatch, valid(0xf2f52010) - read(0x0)
F2FS-fs (loop0): Can't find valid F2FS filesystem in 2th superblock
F2FS-fs (loop0): invalid crc_offset: 0
general protection fault, probably for non-canonical address 0xdffffc0000000009: 0000 [#1] PREEMPT SMP KASAN
KASAN: null-ptr-deref in range [0x0000000000000048-0x000000000000004f]
CPU: 1 PID: 6861 Comm: syz-executor912 Not tainted 5.9.0-rc5-next-20200918-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:get_zone_idx fs/f2fs/segment.c:4892 [inline]
RIP: 0010:f2fs_usable_zone_blks_in_seg fs/f2fs/segment.c:4943 [inline]
RIP: 0010:f2fs_usable_blks_in_seg+0x39b/0xa00 fs/f2fs/segment.c:4999
Code: 05 00 00 49 63 d6 4c 8b 83 40 14 00 00 48 6b d2 68 49 8d 04 10 48 ba 00 00 00 00 00 fc ff df 48 8d 78 4c 48 89 fe 48 c1 ee 03 <0f> b6 34 16 48 89 fa 83 e2 07 83 c2 03 40 38 f2 7c 09 40 84 f6 0f
RSP: 0018:ffffc90000ef78b0 EFLAGS: 00010207
RAX: 0000000000000000 RBX: ffff88809632c000 RCX: 0000000000000e00
RDX: dffffc0000000000 RSI: 0000000000000009 RDI: 000000000000004c
RBP: 0000000000001000 R08: 0000000000000000 R09: ffffc90000ef7a81
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000200
R13: ffff88809632c010 R14: 0000000000000000 R15: ffff88809632d440
FS:  0000000002206880(0000) GS:ffff8880ae500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffea055b000 CR3: 000000009486b000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 check_block_count+0x69/0x4e0 fs/f2fs/segment.h:704
 build_sit_entries fs/f2fs/segment.c:4403 [inline]
 f2fs_build_segment_manager+0x51da/0xa370 fs/f2fs/segment.c:5100
 f2fs_fill_super+0x3880/0x6ff0 fs/f2fs/super.c:3684
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2896 [inline]
 path_mount+0x12ae/0x1e70 fs/namespace.c:3216
 do_mount fs/namespace.c:3229 [inline]
 __do_sys_mount fs/namespace.c:3437 [inline]
 __se_sys_mount fs/namespace.c:3414 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3414
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x44793a
Code: b8 08 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd ad fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da ad fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007ffea055a198 EFLAGS: 00000297 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007ffea055a1f0 RCX: 000000000044793a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007ffea055a1b0
RBP: 00007ffea055a1b0 R08: 00007ffea055a1f0 R09: 00007ffe00000015
R10: 0000000000000000 R11: 0000000000000297 R12: 000000000000004a
R13: 0000000000000004 R14: 0000000000000003 R15: 0000000000000003
Modules linked in:
---[ end trace 49ea7ada353f1c96 ]---
RIP: 0010:get_zone_idx fs/f2fs/segment.c:4892 [inline]
RIP: 0010:f2fs_usable_zone_blks_in_seg fs/f2fs/segment.c:4943 [inline]
RIP: 0010:f2fs_usable_blks_in_seg+0x39b/0xa00 fs/f2fs/segment.c:4999
Code: 05 00 00 49 63 d6 4c 8b 83 40 14 00 00 48 6b d2 68 49 8d 04 10 48 ba 00 00 00 00 00 fc ff df 48 8d 78 4c 48 89 fe 48 c1 ee 03 <0f> b6 34 16 48 89 fa 83 e2 07 83 c2 03 40 38 f2 7c 09 40 84 f6 0f
RSP: 0018:ffffc90000ef78b0 EFLAGS: 00010207
RAX: 0000000000000000 RBX: ffff88809632c000 RCX: 0000000000000e00
RDX: dffffc0000000000 RSI: 0000000000000009 RDI: 000000000000004c
RBP: 0000000000001000 R08: 0000000000000000 R09: ffffc90000ef7a81
R10: 0000000000000001 R11: 0000000000000000 R12: 0000000000000200
R13: ffff88809632c010 R14: 0000000000000000 R15: ffff88809632d440
FS:  0000000002206880(0000) GS:ffff8880ae500000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffea055b000 CR3: 000000009486b000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
For information about bisection process see: https://goo.gl/tpsmEJ#bisection
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
