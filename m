Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A503653AD8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Dec 2022 03:57:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8BmF-0005YZ-1n;
	Thu, 22 Dec 2022 02:57:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <3osejYwkbAOMXdePFQQJWFUUNI.LTTLQJZXJWHTSYJSY.HTR@M3KW2WVRGUFZ5GODRSRYTGD7.apphosting.bounces.google.com>)
 id 1p8BmE-0005YS-Hu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 02:57:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:To:From:Subject:Message-ID:Date:
 MIME-Version:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QyXBieiJ7cY0MoEKI6KnrTbmapbftXsP47zDObaNoIo=; b=hPVhjuulCNOZLcH+7Uf/NH8so9
 IFqs4SLnSjYWmAW0ZV0OVe8PuhCDzKwY125fHQyQmYnpDeBSgNlGW0bdqMZUUzLIDpTf7yHElzIcb
 aWTfbCxdZ+6DGY5XsbxJrdu5UBUE3CTaTvQqdZ3q4WBQaUgRViTNEZsYmlYpRJC+eJXA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:To:From:Subject:Message-ID:Date:MIME-Version:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QyXBieiJ7cY0MoEKI6KnrTbmapbftXsP47zDObaNoIo=; b=g
 eVveCC3vLLJkGdeefuZwQ64mTIo/mAJMAUnJbbA/qvv/EzJ/FsjTByVl6ws0UCuk6mU7ErltJ8gF/
 8icJH/jkOTH+K25h1uVgV4ZaoUfhTvIshPF9hg4b+MVe0VlUdT5woUTA7VGPQPpMZEoWholKdrGQx
 PMvA1gDBx0sApmBg=;
Received: from mail-io1-f72.google.com ([209.85.166.72])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1p8BmD-007P8G-NP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Dec 2022 02:57:46 +0000
Received: by mail-io1-f72.google.com with SMTP id
 n10-20020a6b590a000000b006e03471b3eeso286036iob.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Dec 2022 18:57:45 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=to:from:subject:message-id:date:mime-version:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=QyXBieiJ7cY0MoEKI6KnrTbmapbftXsP47zDObaNoIo=;
 b=aHtdJD4vqSysl65ktF8c2HJ3GoQb+OFJsHH7Z/ND2XPYAHqxb6TmOYzdoc+kn+uZfX
 rkTnPBF+hBvscBCWzCK2U0q8PCmM6/tZGDtXBdrI/R8RlRPNXDZkwYhjuXNRfszPyuQR
 A8PGgNA090XyvbCcwpQLjBT50RikFc8ia5PNObwHaHdtderarY/9BBBtlKFm37QSeg6k
 /6QDZ72fMw6TzgMBGDPi06RHS3ZBKvTFSuW18G3Xx9glxHtSq6XO0uV77XmIbeiGOHZp
 U134aDMs5werSY7jVzOcNg+2rTGZ4hrVdXxbAKhERHIyMFZJkxc+9xB4F4z+4jshrE9d
 /ApA==
X-Gm-Message-State: AFqh2kpY35zwE/QBEVb8sE1JG855xvmM1UmfMAIPUY5bDzgOSJnVlwQq
 ocNRH59AheVBfoV4v/JPkPquNBvVbgECRd13k3TeldPMpRxr
X-Google-Smtp-Source: AMrXdXvhNLtD7E0YLTzmYt8FzcXCKQ5UPXZVWAu9Tx/HHC6b7vxGhW+UIZOS8QlroAmzNJW6r5VXLysWbEPqe2LYUOmPQZsJrZgt
MIME-Version: 1.0
X-Received: by 2002:a02:85e3:0:b0:38a:66d5:8715 with SMTP id
 d90-20020a0285e3000000b0038a66d58715mr327555jai.63.1671677858551; Wed, 21 Dec
 2022 18:57:38 -0800 (PST)
Date: Wed, 21 Dec 2022 18:57:38 -0800
X-Google-Appengine-App-Id: s~syzkaller
X-Google-Appengine-App-Id-Alias: syzkaller
Message-ID: <000000000000f020a905f061d4c2@google.com>
From: syzbot <syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com>
To: akpm@linux-foundation.org, chao@kernel.org, hughd@google.com, 
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net, 
 linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
 syzkaller-bugs@googlegroups.com
X-Spam-Score: 3.1 (+++)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hello,
 syzbot found the following issue on: HEAD commit: 77856d911a8c
 Merge tag 'arm64-fixes' of git://git.kernel.o.. git tree: upstream
 console+strace:
 https://syzkaller.appspot.com/x/log.txt?x=17c418c8480000 kernel config:
 https://syzkaller.a [...] 
 Content analysis details:   (3.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.3 FROM_LOCAL_HEX         From: localpart has long hexadecimal sequence
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.166.72 listed in list.dnswl.org]
 2.5 SORTED_RECIPS          Recipient list is sorted by address
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.166.72 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level
 mail domains are different
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1p8BmD-007P8G-NP
Subject: [f2fs-dev] [syzbot] [f2fs?] [tmpfs?] kernel BUG in f2fs_evict_inode
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

HEAD commit:    77856d911a8c Merge tag 'arm64-fixes' of git://git.kernel.o..
git tree:       upstream
console+strace: https://syzkaller.appspot.com/x/log.txt?x=17c418c8480000
kernel config:  https://syzkaller.appspot.com/x/.config?x=f967143badd2fa39
dashboard link: https://syzkaller.appspot.com/bug?extid=e1246909d526a9d470fa
compiler:       Debian clang version 13.0.1-++20220126092033+75e33f71c2da-1~exp1~20220126212112.63, GNU ld (GNU Binutils for Debian) 2.35.2
syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=160ea04f880000
C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=17e2a99d880000

Downloadable assets:
disk image: https://storage.googleapis.com/syzbot-assets/4b424d9203f5/disk-77856d91.raw.xz
vmlinux: https://storage.googleapis.com/syzbot-assets/47fd68051834/vmlinux-77856d91.xz
kernel image: https://storage.googleapis.com/syzbot-assets/d3091f087a86/bzImage-77856d91.xz
mounted in repro: https://storage.googleapis.com/syzbot-assets/36b1377afaef/mount_0.gz

IMPORTANT: if you fix the issue, please add the following tag to the commit:
Reported-by: syzbot+e1246909d526a9d470fa@syzkaller.appspotmail.com

------------[ cut here ]------------
kernel BUG at fs/f2fs/inode.c:864!
invalid opcode: 0000 [#1] PREEMPT SMP KASAN
CPU: 1 PID: 5067 Comm: syz-executor118 Not tainted 6.1.0-syzkaller-13031-g77856d911a8c #0
Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/26/2022
RIP: 0010:f2fs_evict_inode+0x1306/0x1310 fs/f2fs/inode.c:864
Code: ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 8a f5 ff ff 48 89 df e8 4b 51 1a fe e9 7d f5 ff ff e8 e1 b4 c4 fd 0f 0b e8 da b4 c4 fd <0f> 0b 0f 1f 84 00 00 00 00 00 55 41 57 41 56 53 48 89 fb e8 c2 b4
RSP: 0018:ffffc90003b3f8f8 EFLAGS: 00010293
RAX: ffffffff83c720e6 RBX: 0000000000000002 RCX: ffff8880251257c0
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83c71bc3 R09: ffffed100e5a41b5
R10: ffffed100e5a41b5 R11: 1ffff1100e5a41b4 R12: dffffc0000000000
R13: ffff888072d208f0 R14: ffff888072d20da0 R15: 0000000000000000
FS:  000055555685a300(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd85832d68 CR3: 00000000726a5000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
Call Trace:
 <TASK>
 evict+0x2a4/0x620 fs/inode.c:664
 dispose_list fs/inode.c:697 [inline]
 evict_inodes+0x658/0x700 fs/inode.c:747
 generic_shutdown_super+0x94/0x310 fs/super.c:480
 kill_block_super+0x79/0xd0 fs/super.c:1386
 kill_f2fs_super+0x2f9/0x3c0 fs/f2fs/super.c:4640
 deactivate_locked_super+0xa7/0xf0 fs/super.c:332
 cleanup_mnt+0x494/0x520 fs/namespace.c:1291
 task_work_run+0x243/0x300 kernel/task_work.c:179
 ptrace_notify+0x29a/0x340 kernel/signal.c:2354
 ptrace_report_syscall include/linux/ptrace.h:411 [inline]
 ptrace_report_syscall_exit include/linux/ptrace.h:473 [inline]
 syscall_exit_work+0x8c/0xe0 kernel/entry/common.c:251
 syscall_exit_to_user_mode_prepare+0x63/0xc0 kernel/entry/common.c:278
 __syscall_exit_to_user_mode_work kernel/entry/common.c:283 [inline]
 syscall_exit_to_user_mode+0xa/0x60 kernel/entry/common.c:296
 do_syscall_64+0x49/0xb0 arch/x86/entry/common.c:86
 entry_SYSCALL_64_after_hwframe+0x63/0xcd
RIP: 0033:0x7fd8e1d06d97
Code: 08 00 48 83 c4 08 5b 5d c3 66 2e 0f 1f 84 00 00 00 00 00 c3 66 2e 0f 1f 84 00 00 00 00 00 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 c0 ff ff ff f7 d8 64 89 01 48
RSP: 002b:00007ffd858334a8 EFLAGS: 00000202 ORIG_RAX: 00000000000000a6
RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007fd8e1d06d97
RDX: 00007ffd85833569 RSI: 000000000000000a RDI: 00007ffd85833560
RBP: 00007ffd85833560 R08: 00000000ffffffff R09: 00007ffd85833340
R10: 000055555685b653 R11: 0000000000000202 R12: 00007ffd858345d0
R13: 000055555685b5f0 R14: 00007ffd858334d0 R15: 0000000000000001
 </TASK>
Modules linked in:
---[ end trace 0000000000000000 ]---
RIP: 0010:f2fs_evict_inode+0x1306/0x1310 fs/f2fs/inode.c:864
Code: ff 89 d9 80 e1 07 80 c1 03 38 c1 0f 8c 8a f5 ff ff 48 89 df e8 4b 51 1a fe e9 7d f5 ff ff e8 e1 b4 c4 fd 0f 0b e8 da b4 c4 fd <0f> 0b 0f 1f 84 00 00 00 00 00 55 41 57 41 56 53 48 89 fb e8 c2 b4
RSP: 0018:ffffc90003b3f8f8 EFLAGS: 00010293
RAX: ffffffff83c720e6 RBX: 0000000000000002 RCX: ffff8880251257c0
RDX: 0000000000000000 RSI: 0000000000000002 RDI: 0000000000000000
RBP: 0000000000000000 R08: ffffffff83c71bc3 R09: ffffed100e5a41b5
R10: ffffed100e5a41b5 R11: 1ffff1100e5a41b4 R12: dffffc0000000000
R13: ffff888072d208f0 R14: ffff888072d20da0 R15: 0000000000000000
FS:  000055555685a300(0000) GS:ffff8880b9900000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 00007ffd85832d68 CR3: 00000000726a5000 CR4: 00000000003506e0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400


---
This report is generated by a bot. It may contain errors.
See https://goo.gl/tpsmEJ for more information about syzbot.
syzbot engineers can be reached at syzkaller@googlegroups.com.

syzbot will keep track of this issue. See:
https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
syzbot can test patches for this issue, for details see:
https://goo.gl/tpsmEJ#testing-patches


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
