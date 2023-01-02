Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 21FCD65AF2C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Jan 2023 11:01:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pCHdd-0007rf-6j;
	Mon, 02 Jan 2023 10:01:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3hKuyYwkbAMk7DEzp00t6p44xs.v33v0t97t6r328t28.r31@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1pCHdc-0007rT-9Y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jan 2023 10:01:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2gTVxH1zp8JSpYvuSq3RyaiZ87QO7AjNm6jJ2nVfpLg=; b=IIQW+IZLnDXpzqMXXg3eLZQUYY
 gEoJpeh5bSA6njjo7OZQvO1S/WN0s97Z6bpmyPz11alsor0KrzvdHxUK+Lm+EbgpxYHTJRzPNSfRy
 mdPVrM5SHkQe7K4U/ojJPM56JN6joyvInfhpOsN8Vjw8jxp0zZTV6V0T1aAhjIYJrh5g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2gTVxH1zp8JSpYvuSq3RyaiZ87QO7AjNm6jJ2nVfpLg=; b=b
 OEGE6pdLslOdikZaxKi9N6F9YOYsTE7XS1K+SoRUbMcY6fi/Rp8gfS1RSHqkVsDIUYxLhhyuCpijm
 ekWMexlztCj1PGVqX8Rgh/DMqKJMz5tYDOlJlV95C1p54E/J0s6qfhUnoCMxulu+M8qJW8UYsVgva
 TLI/xwr3c5Q1sQgk=;
Received: from mail-il1-f199.google.com ([209.85.166.199])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pCHda-0007lh-EJ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Jan 2023 10:01:48 +0000
Received: by mail-il1-f199.google.com with SMTP id
 i14-20020a056e020d8e00b003034b93bd07so17726920ilj.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Jan 2023 02:01:46 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=2gTVxH1zp8JSpYvuSq3RyaiZ87QO7AjNm6jJ2nVfpLg=;
 b=3Lury3qJy/JcmwePMrjBvtEu7+ZeWCQUEtQxyigRuH5yO/NqLPgMskV87adlnylc1v
 QWBrSQquq/yhijAPlr46CuMQSxLHbJAd6e9Vus6Cl/f+DNUhCV+qBa+rxpC2In9CR1mJ
 qoo0xhjNfHdlSM1DgV2c80JcMDh6gxmFpJc3I7YoXUjBtorvNpjfDxPFNXZRHQHH9cQB
 L8nOqoFGvm0EQBPptHpmpF5NgkbbA6dBALyIY+QHfVdcMKhVoI4YDkg3h4+aW5K8pDOd
 uguKnfpxbyL+EkVQjY+6fXwMqxfWZX1ELJUmleCKTDEha23RUIZLv31Kk3wrxiCnW5Hf
 Yw6g==
X-Gm-Message-State: AFqh2ko0hV9sndD4x1BIlp2oNv4S6vVFK67AueF70l7ZvbmBfHOEVATA
 cd1+xfhiTSjxsaeMbpwrdA3YvYloTiLBqpgXxsJ3qFD3SUwK
X-Google-Smtp-Source: AMrXdXu4s9TXlbwA9vLcIWPeEO71I6oyEUfygDplgDzoYITeWFVQrFg4Jz5AHEBIW2DzsQP3QS5HGnpjbl7fpI/rEt5iQ7rXshIb
MIME-Version: 1.0
X-Received: by 2002:a05:6e02:803:b0:304:c661:f53 with SMTP id
 u3-20020a056e02080300b00304c6610f53mr3385441ilm.155.1672653700643; Mon, 02
 Jan 2023 02:01:40 -0800 (PST)
Date: Mon, 02 Jan 2023 02:01:40 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000a8c57205f1450921@google.com>
From: syzbot <syzbot+9b7be0f1263ed2dbfbba@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 1b929c02afd3
 Linux 6.2-rc1 git tree: upstream console output:
 https://syzkaller.appspot.com/x/log.txt?x=10e8d2e4480000
 kernel config: https://syzkaller.appspot.com/x/.config?x=2651619a26b [...]
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.199 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.199 listed in wl.mailspike.net]
X-Headers-End: 1pCHda-0007lh-EJ
Subject: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_abort_atomic_write
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

HEAD commit:    1b929c02afd3 Linux 6.2-rc1
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=10e8d2e4480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=2651619a26b4d687
dashboard link: https://syzkaller.appspot.com/bug?extid=9b7be0f1263ed2dbfbba
compiler:       gcc (Debian 10.2.1-6) 10.2.1 20210110, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/d562ace1a56c/disk-1b929c02.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/39f000fe6b9e/vmlinux-1b929c02.xz
kernel image: https://storage.googleapis.com/syzbot-assets/1c67e48de5a0/bzImage-1b929c02.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+9b7be0f1263ed2dbfbba@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/inode.c:1763!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 0 PID: 533 Comm: syz-executor.3 Not tainted 6.2.0-rc1-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:iput+0x68/0x80 fs/inode.c:1763
Code: ff 83 e3 40 48 89 de e8 16 d0 9b ff 48 85 db 75 14 e8 3c d3 9b ff 48 89 ef e8 24 f7 ff ff 5b 5d e9 2d d3 9b ff e8 28 d3 9b ff <0f> 0b e8 d1 da e9 ff eb c5 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
RSP: 0018:ffffc90014357be0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000000000000
RDX: ffff8880766d1d40 RSI: ffffffff81e57f18 RDI: 0000000000000007
RBP: ffff88808c1e5960 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000040 R11: 0000000000000000 R12: ffff88808c1e04b0
R13: 0000000000000000 R14: ffff88808c1e5960 R15: 0000000000000000
FS:  00007f8898356700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8898335718 CR3: 00000000290d3000 CR4: 0000000000350ef0
Call Trace:
 <TASK>
 f2fs_abort_atomic_write+0xea/0x4f0 fs/f2fs/segment.c:196
 f2fs_ioc_commit_atomic_write+0x19f/0x260 fs/f2fs/file.c:2157
 __f2fs_ioctl+0x26f0/0xaaf0 fs/f2fs/file.c:4154
 f2fs_ioctl+0x18e/0x220 fs/f2fs/file.c:4242
 vfs_ioctl fs/ioctl.c:51 [inline]
 __do_sys_ioctl fs/ioctl.c:870 [inline]
 __se_sys_ioctl fs/ioctl.c:856 [inline]
 __x64_sys_ioctl+0x197/0x210 fs/ioctl.c:856
 do_syscall_x64 arch/x86/entry/common.c:50 [inline]
 do_syscall_64+0x39/0xb0 arch/x86/entry/common.c:80
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f889768c0a9
Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 f1 19 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007f8898356168 EFLAGS: 00000246 ORIG_RAX: 0000000000000010
RAX: ffffffffffffffda RBX: 00007f88977ac050 RCX: 00007f889768c0a9
RDX: 0000000000000000 RSI: 000000000000f502 RDI: 0000000000000004
RBP: 00007f88976e7ae9 R08: 0000000000000000 R09: 0000000000000000
R10: 0000000000000000 R11: 0000000000000246 R12: 0000000000000000
R13: 00007ffc5d002faf R14: 00007f8898356300 R15: 0000000000022000
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:iput+0x68/0x80 fs/inode.c:1763
Code: ff 83 e3 40 48 89 de e8 16 d0 9b ff 48 85 db 75 14 e8 3c d3 9b ff 48 89 ef e8 24 f7 ff ff 5b 5d e9 2d d3 9b ff e8 28 d3 9b ff <0f> 0b e8 d1 da e9 ff eb c5 66 66 2e 0f 1f 84 00 00 00 00 00 0f 1f
RSP: 0018:ffffc90014357be0 EFLAGS: 00010293
RAX: 0000000000000000 RBX: 0000000000000040 RCX: 0000000000000000
RDX: ffff8880766d1d40 RSI: ffffffff81e57f18 RDI: 0000000000000007
RBP: ffff88808c1e5960 R08: 0000000000000007 R09: 0000000000000000
R10: 0000000000000040 R11: 0000000000000000 R12: ffff88808c1e04b0
R13: 0000000000000000 R14: ffff88808c1e5960 R15: 0000000000000000
FS:  00007f8898356700(0000) GS:ffff8880b9800000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f8898335718 CR3: 00000000290d3000 CR4: 0000000000350ef0


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
