Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36175271325
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 20 Sep 2020 11:22:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJvYK-00087g-TZ; Sun, 20 Sep 2020 09:22:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3Rx9nXwkbACQSYZKALLERAPPID.GOOGLEUSERCONTENT.COM@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1kJvYJ-00087V-3T
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Sep 2020 09:22:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=To0958KlvR9rnacFqHmwL9rHYI1TEUcFIt/m7KfPjyg=; b=Hxew+U3W2f3oCrL4ai+uWoOLio
 640OgJYZ4SWK+MHZNqzTIgZN0y+QsUhfHbM/wDLHiTCMHJl/OxaTFj14XhLFRaIr+1uaUoF3yeQ34
 mCELYeCLto2jFB5JpWxKtJbe/fw5je4om6KoQZ8Tpi5lk0kGVZ2OXFnxHyX38T5U6grg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=To0958KlvR9rnacFqHmwL9rHYI1TEUcFIt/m7KfPjyg=; b=I
 lru4UTU29Q3xB4YVOlSrfl3EBYB7qzmmKs4VPWzQ1fHmG28sy7HbGpVLdohcFhlhuZzXj9qmIaENB
 PmxCHflS7nWOmk3f1ul6ct24gZQ3FCvq+8SA9/Ma/8+HloS52TSrd3gSRsfN03L+MUvgLaibNiIVv
 CX2Z/yMuUrsJqMeI=;
Received: from mail-io1-f80.google.com ([209.85.166.80])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kJvYC-000E02-JO
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 20 Sep 2020 09:22:35 +0000
Received: by mail-io1-f80.google.com with SMTP id j4so7838091iob.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 20 Sep 2020 02:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:date:message-id:subject:from:to;
 bh=To0958KlvR9rnacFqHmwL9rHYI1TEUcFIt/m7KfPjyg=;
 b=XjAKK0hv1mCNGu4oR46sCpVq0R7/JJ+w6s5Y0uzHITY/vfq4Pg0OhIfOP22dARklcl
 vPEh/uCy7bqbH0cdGNhv32zs5Ec5Dkl3kWPmN0mut6dmZokEWmk7pf+ejYJ9EngCWwYh
 VeeTexB9qXxzGc04DKUxH5faElpo9yrkGvi4lBHEnTY5cpMBZsBkOWQmMzUJdgv4hfSu
 oQBoZZ7Ju2YH0dn2Ln8ZJiC16/hpZemKrdJb50ljbrRRCNGA74hcyzE1ZVEu+m3yiXAL
 X/X7BQFOSirdrbPLzMY9W1d7iNQQ9fggDOhAbfa7Rmi/hUBpWjiaUhMKoU8nKo8gybUn
 MacA==
X-Gm-Message-State: AOAM530n2OSn4waPBbeE6LBJFX1C6DWDV/WZXvEv86aLqLdCJBFZcPcC
 0aiecB6MIvRbuOT3gMpw7x2xSPBWCb6gyXfcIRPBjnYN3r/U
X-Google-Smtp-Source: ABdhPJyDNeCia96xmEw5fuolUcxaByXJ+cAvOxDtBcMePQNKg2EwPE7xCw4BLtJyOSVE73rkr70HGoYo3xNrCSlFgfm+dT1U/zz3
MIME-Version: 1.0
X-Received: by 2002:a92:4101:: with SMTP id o1mr2661993ila.296.1600593735683; 
 Sun, 20 Sep 2020 02:22:15 -0700 (PDT)
Date: Sun, 20 Sep 2020 02:22:15 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <0000000000000b953a05afbb4548@google.com>
From: syzbot <syzbot+3698081bcf0bb2d12174@syzkaller.appspotmail.com>
To: chao@kernel.org, jaegeuk@kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 0.6 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: googlegroups.com]
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.166.80 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.80 listed in wl.mailspike.net]
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kJvYC-000E02-JO
Subject: [f2fs-dev] kernel BUG at fs/f2fs/segment.h:LINE!
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

HEAD commit:    fc4f28bb Merge tag 'for-5.9-rc5-tag' of git://git.kernel.o..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=134d97dd900000
kernel config:  https://syzkaller.appspot.com/x/.config?x=c61f6bd349c981f3
dashboard link: https://syzkaller.appspot.com/bug?extid=3698081bcf0bb2d12174
compiler:       gcc (GCC) 10.1.0-syz 20200507

Unfortunately, I don't have any reproducer for this issue yet.

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+3698081bcf0bb2d12174@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.h:657!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 16220 Comm: syz-executor.0 Not tainted 5.9.0-rc5-syzkaller #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
RIP: 0010:f2fs_ra_meta_pages+0xa51/0xdc0 fs/f2fs/segment.h:657
Code: 08 49 83 ed 01 e9 3f f8 ff ff c7 44 24 18 80 00 00 00 45 31 ff 45 31 f6 31 f6 41 bc 01 00 00 00 e9 cd fb ff ff e8 0f 48 3e fe <0f> 0b e8 08 48 3e fe 4c 8b 6c 24 08 be 04 00 00 00 4c 89 ef e8 76
RSP: 0018:ffffc9000b4177a8 EFLAGS: 00010246
RAX: 0000000000040000 RBX: dffffc0000000000 RCX: ffffc9000ac51000
RDX: 0000000000040000 RSI: ffffffff833605d1 RDI: 0000000000000004
RBP: ffff88804e738000 R08: 0000000000000001 R09: ffffea00060e7337
R10: 0000000000000037 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000601 R14: ffff88808cb73800 R15: 000000000000001e
FS:  00007fcc23249700(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 0000560df32133b7 CR3: 0000000074a09000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 build_sit_entries fs/f2fs/segment.c:4195 [inline]
 f2fs_build_segment_manager+0x4b8a/0xa3c0 fs/f2fs/segment.c:4779
 f2fs_fill_super+0x377d/0x6b80 fs/f2fs/super.c:3633
 mount_bdev+0x32e/0x3f0 fs/super.c:1417
 legacy_get_tree+0x105/0x220 fs/fs_context.c:592
 vfs_get_tree+0x89/0x2f0 fs/super.c:1547
 do_new_mount fs/namespace.c:2875 [inline]
 path_mount+0x1387/0x2070 fs/namespace.c:3192
 do_mount fs/namespace.c:3205 [inline]
 __do_sys_mount fs/namespace.c:3413 [inline]
 __se_sys_mount fs/namespace.c:3390 [inline]
 __x64_sys_mount+0x27f/0x300 fs/namespace.c:3390
 do_syscall_64+0x2d/0x70 arch/x86/entry/common.c:46
 entry_SYSCALL_64_after_hwframe+0x44/0xa9
RIP: 0033:0x46004a
Code: b8 a6 00 00 00 0f 05 48 3d 01 f0 ff ff 0f 83 fd 89 fb ff c3 66 2e 0f 1f 84 00 00 00 00 00 66 90 49 89 ca b8 a5 00 00 00 0f 05 <48> 3d 01 f0 ff ff 0f 83 da 89 fb ff c3 66 0f 1f 84 00 00 00 00 00
RSP: 002b:00007fcc23248a88 EFLAGS: 00000202 ORIG_RAX: 00000000000000a5
RAX: ffffffffffffffda RBX: 00007fcc23248b20 RCX: 000000000046004a
RDX: 0000000020000000 RSI: 0000000020000100 RDI: 00007fcc23248ae0
RBP: 00007fcc23248ae0 R08: 00007fcc23248b20 R09: 0000000020000000
R10: 0000000000000000 R11: 0000000000000202 R12: 0000000020000000
R13: 0000000020000100 R14: 0000000020000200 R15: 0000000020012400
Modules linked in:
---[ end trace a60c6b47a90afa81 ]---
RIP: 0010:f2fs_ra_meta_pages+0xa51/0xdc0 fs/f2fs/segment.h:657
Code: 08 49 83 ed 01 e9 3f f8 ff ff c7 44 24 18 80 00 00 00 45 31 ff 45 31 f6 31 f6 41 bc 01 00 00 00 e9 cd fb ff ff e8 0f 48 3e fe <0f> 0b e8 08 48 3e fe 4c 8b 6c 24 08 be 04 00 00 00 4c 89 ef e8 76
RSP: 0018:ffffc9000b4177a8 EFLAGS: 00010246
RAX: 0000000000040000 RBX: dffffc0000000000 RCX: ffffc9000ac51000
RDX: 0000000000040000 RSI: ffffffff833605d1 RDI: 0000000000000004
RBP: ffff88804e738000 R08: 0000000000000001 R09: ffffea00060e7337
R10: 0000000000000037 R11: 0000000000000000 R12: 0000000000000001
R13: 0000000000000601 R14: ffff88808cb73800 R15: 000000000000001e
FS:  00007fcc23249700(0000) GS:ffff8880ae700000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007f253183c000 CR3: 0000000074a09000 CR4: 00000000001506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


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
