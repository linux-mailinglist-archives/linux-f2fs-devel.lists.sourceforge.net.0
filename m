Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A11A600828
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Oct 2022 09:54:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okKxO-0008AJ-T3;
	Mon, 17 Oct 2022 07:54:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3OApNYwkbAKETZaLBMMFSBQQJE.HPPHMFVTFSDPOUFOU.DPN@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1okKxL-0008AB-3y for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 07:54:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gV599A531jAViTaqPMnOQtBFnJJSS2cukLSLIg7dHW4=; b=Mt0JtNgTobW+aE7NJl339tqylm
 S36Yb6ob5tHMGA+MPkLv8Z8Sx7XUi7YJGRuZTPLXD05kQKwQro88jgY8b08+Y+FwvOhxsfrCoZ5Yt
 6KtyWBk5crhwkrUz5pcUaSfjs4geGYidlaFTKQpmXJoLSh2QmUL0CR/yhu1WsaSX5RhQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gV599A531jAViTaqPMnOQtBFnJJSS2cukLSLIg7dHW4=; b=i
 so5R7+DytYwlfXUh1OnZDKWAesGk92zCkGmGr33wSKlVLWmiWQgep69uH1b4CqIlj0eYd/SsxzJCQ
 BFohys9JJEifV/hI6+Fcu0UFn0DYJ497mPggBn37pbIlvv18I05GTZ9qhZZwL7iN7oea42xM91/Mg
 OUqq8KsrhPo4DlYg=;
Received: from mail-io1-f69.google.com ([209.85.166.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1okKxJ-0007SB-QP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Oct 2022 07:54:39 +0000
Received: by mail-io1-f69.google.com with SMTP id
 y4-20020a5e9204000000b006bbffbc3d27so6431784iop.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 17 Oct 2022 00:54:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=gV599A531jAViTaqPMnOQtBFnJJSS2cukLSLIg7dHW4=;
 b=mvR9hr1xugzuzF0rm7ngtdkN8xW5aBNa9kVrqX1GO3h5MzuKsGO7bGZVEbBbyet1S/
 Fh+T2SamAWUkjz0oq0KYzpKrX683ZAo24nYoYf/g+q6vQMWdU8hrVbsF9YaJ2npRogLg
 FwP8r/f2duAK5yGv8Q5K0gHxVHtgOt+ILN1LZ1aplR7Bm4HmFKmFKB/vypPAxjhngpEZ
 nq5RZjVfMdqhDwGQwmuz0Ger6x2lHIYxWbBJirDiHTTiQX6VNRF9mcFnjFj1YudGc0KP
 rKT5Y/4RVUKB/zTnx9xbMn8htgUNXaM6aHSv3x2C+qRSNJPWtxU3TJH6wY6/gNShabb7
 kFOQ==
X-Gm-Message-State: ACrzQf0EJYcEkBDbb9705U/BxFnhUKWQ80Dn3zdDPGPjz3idOK/82ubn
 ybEXHz92DpLWTWwe4euVUiAKd/z5q710gvPB1OhToWxAMgyU
X-Google-Smtp-Source: AMsMyM7UWNYmxDybTwyvYjwkyIufPocYeKurnW6Scu7aO1hbSXg8265Z4V3ZdHtSNJopTry9SwVIhC2AGtFk2ObeVEZF39auElsn
MIME-Version: 1.0
X-Received: by 2002:a05:6638:204b:b0:364:35b:bc2a with SMTP id
 t11-20020a056638204b00b00364035bbc2amr4351227jaj.44.1665993272847; Mon, 17
 Oct 2022 00:54:32 -0700 (PDT)
Date: Mon, 17 Oct 2022 00:54:32 -0700
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <00000000000039f36005eb3649ab@google.com>
From: syzbot <syzbot+f3829d0d4cd1c750c0c1@syzkaller.appspotmail.com>
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
 syzbot found the following issue on: HEAD commit: 493ffd6605b2
 Merge tag 'ucount-rlimits-cleanups-for-v5.19'.. git tree: upstream console
 output: https://syzkaller.appspot.com/x/log.txt?x=17cbb31a880000 kernel
 config: https://syzkaller.a [...] 
 Content analysis details:   (0.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.69 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.69 listed in wl.mailspike.net]
X-Headers-End: 1okKxJ-0007SB-QP
Subject: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in get_next_nat_page (2)
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

HEAD commit:    493ffd6605b2 Merge tag 'ucount-rlimits-cleanups-for-v5.19'..
git tree:       upstream
console output: https://syzkaller.appspot.com/x/log.txt?x=17cbb31a880000
kernel config:  https://syzkaller.appspot.com/x/.config?x=d19f5d16783f901
dashboard link: https://syzkaller.appspot.com/bug?extid=f3829d0d4cd1c750c0c1
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2

Unfortunately, I don't have any reproducer for this issue yet.

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/f1ff6481e26f/disk-493ffd66.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/101bd3c7ae47/vmlinux-493ffd66.xz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+f3829d0d4cd1c750c0c1@syzkaller.appspotmail.com

BUG: kernel NULL pointer dereference, address: 0000000000000000
#PF: supervisor instruction fetch in kernel mode
#PF: error_code(0x0010) - not-present page
PGD 7991b067 P4D 7991b067 PUD 0 
Oops: 0010 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 3644 Comm: syz-executor.4 Not tainted 6.0.0-syzkaller-09423-g493ffd6605b2 #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/22/2022
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:ffffc900042df7e0 EFLAGS: 00010292
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888027258000
RDX: 0000000000000000 RSI: ffffea0002495640 RDI: ffff88806f559e38
RBP: ffffea0002469d00 R08: ffffffff81b5b45b R09: fffff94000492ac9
R10: fffff94000492ac9 R11: 1ffffd4000492ac8 R12: ffffea0002469d00
R13: dffffc0000000000 R14: ffffea0002495640 R15: ffffea0002469d08
FS:  0000555555873400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000035168000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 get_next_nat_page+0x3a9/0x770 fs/f2fs/node.c:154
 __flush_nat_entry_set fs/f2fs/node.c:3005 [inline]
 f2fs_flush_nat_entries+0x9e3/0x1bf0 fs/f2fs/node.c:3109
 f2fs_write_checkpoint+0x14f1/0x1d70 fs/f2fs/checkpoint.c:1667
 kill_f2fs_super+0x22e/0x3c0 fs/f2fs/super.c:4538
 deactivate_locked_super+0xa7/0xf0 fs/super.c:331
 cleanup_mnt+0x4ce/0x560 fs/namespace.c:1186
 task_work_run+0x146/0x1c0 kernel/task_work.c:177
 resume_user_mode_work include/linux/resume_user_mode.h:49 [inline]
 exit_to_user_mode_loop+0x124/0x150 kernel/entry/common.c:169
 exit_to_user_mode_prepare+0xb2/0x140 kernel/entry/common.c:201
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0x26/0x60 kernel/entry/common.c:294
 do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7f1023c8ca17
Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd840e9448 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f1023c8ca17
RDX: 00007ffd840e951b RSI: 000000000000000a RDI: 00007ffd840e9510
RBP: 00007ffd840e9510 R08: 00000000ffffffff R09: 00007ffd840e92e0
R10: 00005555558748b3 R11: 0000000000000246 R12: 00007f1023ce55f6
R13: 00007ffd840ea5d0 R14: 0000555555874810 R15: 00007ffd840ea610
 </TASK>
Modules linked in:
CR2: 0000000000000000
---[ end trace 0000000000000000 ]---
RIP: 0010:0x0
Code: Unable to access opcode bytes at 0xffffffffffffffd6.
RSP: 0000:ffffc900042df7e0 EFLAGS: 00010292
RAX: 0000000000000000 RBX: 0000000000000000 RCX: ffff888027258000
RDX: 0000000000000000 RSI: ffffea0002495640 RDI: ffff88806f559e38
RBP: ffffea0002469d00 R08: ffffffff81b5b45b R09: fffff94000492ac9
R10: fffff94000492ac9 R11: 1ffffd4000492ac8 R12: ffffea0002469d00
R13: dffffc0000000000 R14: ffffea0002495640 R15: ffffea0002469d08
FS:  0000555555873400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: ffffffffffffffd6 CR3: 0000000035168000 CR4: 00000000003506e0
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
