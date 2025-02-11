Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BC6BA3048D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 08:35:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thknZ-0005sW-Vo;
	Tue, 11 Feb 2025 07:35:14 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thknY-0005sQ-UV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 07:35:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q7BGG/uq2kHbBhx3Bo5HcoiLViSReGxThd9xMpCDXnU=; b=LmHaYSXTfGWnUPmnGwcJq3rovH
 RPU5q52x3bYr8SkDH4NXMVASUN01ai8HftBOAvU6h8dmzlCoABFxoIzmBQ9EnrRQsQsYsofpfDocJ
 ZaFGhveBC2clYeThPLMxF9DnzhhJ3nVEJhMbL4t8XOwE/ubB92IZ4UKcZO0Fm+G2PH/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q7BGG/uq2kHbBhx3Bo5HcoiLViSReGxThd9xMpCDXnU=; b=NRNKtqqtQY+0Hrh20RPuuRjR2R
 w7GbwxzXEG+u2hM3ozGjw/ZRff4Zb8LN/ECBZz7pDicEf8T0FC/88FtvedT4+vCXJN4slapW/nAIr
 iDa+DDpvUJzsL/zdgEysWADdya4Pfw8DULe2rMcXBz+nR2Y2prINnyFJQTRrM74ZDsws=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thknY-0000eH-8Y for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 07:35:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id E9CB1A400F6;
 Tue, 11 Feb 2025 07:33:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD8C5C4CEE4;
 Tue, 11 Feb 2025 07:34:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739259301;
 bh=VXx9XRWZ6SNYz5xhlFIrjMnEQJYZHXc0ZThOD1Vd9Vk=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=mSws1pXM8HuNea4h20NW9LtLpCpG/nqwhR2CDeiobmF7BqY9i6ulITyjAKiolQj3j
 Ifi8YuwLEIbKmfKo8J7GT/PgfT47g2sgB9wnq8tOKVgIi/Gy5d8/N2HwEWyOSWAwkw
 EbqHQWa5Q9/VfY3X+t6lF/7mxXV87Zs0fvIieF3SVEkGReJENTC2EisD6NCxAgCy32
 q00XlfZr2l/HBVNeLFUwgNWwC3ZvJD8LlFTOj+19knyBtr+auTIVnn90mE3TYA49dD
 1WPwEJ41gH4akGPbFCUWmmRL4Emj+GFnXwP6v9gifswfdcPn5o0aCILzu820EzETO6
 f9m/fli3n58sw==
Message-ID: <faf182dc-bc81-4e94-8ca6-99fc42b0845d@kernel.org>
Date: Tue, 11 Feb 2025 15:34:58 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 yuchao0@huawei.com
References: <6740a00c.050a0220.363a1b.0143.GAE@google.com>
Content-Language: en-US
In-Reply-To: <6740a00c.050a0220.363a1b.0143.GAE@google.com>
X-Spam-Score: -4.0 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz fix: f2fs: add check for deleted inode On 11/22/24 23:15,
 syzbot wrote: > Hello, > > syzbot found the following issue on: > > HEAD
 commit: 43fb83c17ba2 Merge tag 'soc-arm-6.13' of git://git.kernel... > git
 tree: upstream > console+strace: [...] 
 Content analysis details:   (-4.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thknY-0000eH-8Y
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_unlink
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz fix: f2fs: add check for deleted inode

On 11/22/24 23:15, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    43fb83c17ba2 Merge tag 'soc-arm-6.13' of git://git.kernel...
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=170f5930580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e796b1bf154f93a7
> dashboard link: https://syzkaller.appspot.com/bug?extid=b01a36acd7007e273a83
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1213fae8580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=12b3a75f980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/c93bb9014475/disk-43fb83c1.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/8116200f91e3/vmlinux-43fb83c1.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d3a982ec74b0/bzImage-43fb83c1.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/43c22dda0085/mount_0.gz
> 
> The issue was bisected to:
> 
> commit 4c8ff7095bef64fc47e996a938f7d57f9e077da3
> Author: Chao Yu <yuchao0@huawei.com>
> Date:   Fri Nov 1 10:07:14 2019 +0000
> 
>     f2fs: support data compression
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=101e5b78580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=121e5b78580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=141e5b78580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+b01a36acd7007e273a83@syzkaller.appspotmail.com
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> 
> F2FS-fs (loop0): Found nat_bits in checkpoint
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
> ------------[ cut here ]------------
> WARNING: CPU: 0 PID: 5835 at fs/inode.c:407 drop_nlink+0xc4/0x110 fs/inode.c:407
> Modules linked in:
> CPU: 0 UID: 0 PID: 5835 Comm: syz-executor152 Not tainted 6.12.0-syzkaller-03657-g43fb83c17ba2 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 10/30/2024
> RIP: 0010:drop_nlink+0xc4/0x110 fs/inode.c:407
> Code: bb 70 07 00 00 be 08 00 00 00 e8 07 df e5 ff f0 48 ff 83 70 07 00 00 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 ed e9 7e ff 90 <0f> 0b 90 eb 83 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 5c ff ff ff
> RSP: 0018:ffffc90003cafb98 EFLAGS: 00010293
> RAX: ffffffff82160e93 RBX: 1ffff1100e63e009 RCX: ffff888035573c00
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff82160e13 R09: 1ffffffff203969e
> R10: dffffc0000000000 R11: fffffbfff203969f R12: ffff8880731f0048
> R13: dffffc0000000000 R14: ffff8880731f0000 R15: dffffc0000000000
> FS:  0000555576140380(0000) GS:ffff8880b8600000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000066c7e0 CR3: 00000000758b4000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  f2fs_i_links_write fs/f2fs/f2fs.h:3127 [inline]
>  f2fs_drop_nlink+0xd6/0x380 fs/f2fs/dir.c:822
>  f2fs_unlink+0x47f/0x960 fs/f2fs/namei.c:572
>  vfs_unlink+0x365/0x650 fs/namei.c:4523
>  do_unlinkat+0x4ae/0x830 fs/namei.c:4587
>  __do_sys_unlinkat fs/namei.c:4630 [inline]
>  __se_sys_unlinkat fs/namei.c:4623 [inline]
>  __x64_sys_unlinkat+0xcc/0xf0 fs/namei.c:4623
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7f71e4b355f9
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffed28a90b8 EFLAGS: 00000246 ORIG_RAX: 0000000000000107
> RAX: ffffffffffffffda RBX: 00007ffed28a9298 RCX: 00007f71e4b355f9
> RDX: 0000000000000000 RSI: 0000000020000380 RDI: 00000000ffffff9c
> RBP: 00007f71e4bb8610 R08: 00000000000105b7 R09: 0000000000000000
> R10: 00007ffed28a8f80 R11: 0000000000000246 R12: 0000000000000001
> R13: 00007ffed28a9288 R14: 0000000000000001 R15: 0000000000000001
>  </TASK>
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> For information about bisection process see: https://goo.gl/tpsmEJ#bisection
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
> 
> If you want syzbot to run the reproducer, reply with:
> #syz test: git://repo/address.git branch-or-commit-hash
> If you attach or paste a git patch, syzbot will apply it before testing.
> 
> If you want to overwrite report's subsystems, reply with:
> #syz set subsystems: new-subsystem
> (See the list of subsystem names on the web dashboard)
> 
> If the report is a duplicate of another one, reply with:
> #syz dup: exact-subject-of-another-report
> 
> If you want to undo deduplication, reply with:
> #syz undup



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
