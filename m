Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 064B6A304A4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 11 Feb 2025 08:38:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1thkpt-0006sK-DD;
	Tue, 11 Feb 2025 07:37:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1thkps-0006sD-6z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 07:37:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ia5CRda2OYsxVMbwnHPrSJi65XFhpRFjwRpl+twKumQ=; b=LTAWV30cunEb/eaYPukHrE55i8
 QIQrH+7tngk/ZKnGlCJe5BoAROI2TrI0UslLqd4RG7QmdS3/+1SnoSg9ab6B9laBdUZXARr6kwJbE
 d4OW2okM203p1G9ThhQwt4FrRaF79C/MkPnLhBOWY0q2V06cBBaCXdTXsCOfiyU++9bg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Ia5CRda2OYsxVMbwnHPrSJi65XFhpRFjwRpl+twKumQ=; b=HaRXWFdEOatV8zajC9iTYKVyo5
 hWWTCrj0sRNLKYhmqlE5qkMsaSfI1fI88R+eJqJp/9Jc+vjmRQ5X8cWA0EQ5k6zL8/8HnZLebXM+9
 f/RVe4vjjdR/jHA4gDjxheDms/ugZXyF+8g7+D6Pk4fTNBuzlfOH8kfw6MoPR/d9clss=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1thkpq-0000mq-Mj for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 11 Feb 2025 07:37:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id BACF45C041E;
 Tue, 11 Feb 2025 07:36:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7DAEC4CEDD;
 Tue, 11 Feb 2025 07:37:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1739259444;
 bh=G9ln38LUgIQm/l5jvzediKDFNg8NNLa3gI7eEO2KkOw=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=IFD8FuWEaJ1z74XDDYyz/VOeYVsHHRpS+5a2jBJ9xxwlZKHJqHOY/33keUOg4QZdV
 yVbjQbIp15MwTB6HVrmcR/zKDJeA6Gk/c5IJr5RvOlsVrscDmVvn7REmOwJTB7npQz
 xWj/Rpu0NibRf0rr5EkGTSYheAWUXQBLg3Z78cpFnBPgYOC8TY7QKJ2EURPdrCfCmr
 dUQ7HXb0C3z7MU2l1cB4lt2ub/t8byv5/Q77uZmDXgB5S1t+gx/t4dqe4a17hzESZR
 zHm79YEn6H/P1pjBynhnuQ/udSs2DG02yjBYHA48t+5VxwyXYxq+05U4Hi1hE7pK83
 bTksTNz7xGjtQ==
Message-ID: <b701e24f-9689-4573-b24f-a2bb8ee5bd72@kernel.org>
Date: Tue, 11 Feb 2025 15:37:01 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com,
 yuchao0@huawei.com
References: <67450f9a.050a0220.21d33d.0003.GAE@google.com>
Content-Language: en-US
In-Reply-To: <67450f9a.050a0220.21d33d.0003.GAE@google.com>
X-Spam-Score: -6.7 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz dup: WARNING in f2fs_unlink On 11/26/24 08:00, syzbot
 wrote: > Hello, > > syzbot found the following issue on: > > HEAD commit:
 228a1157fb9f Merge tag '6.13-rc-part1-SMB3-client-fixes' o.. > git tree:
 upstream > console+strace: [...] 
 Content analysis details:   (-6.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [139.178.84.217 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -1.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1thkpq-0000mq-Mj
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in f2fs_rename2
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

#syz dup: WARNING in f2fs_unlink

On 11/26/24 08:00, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    228a1157fb9f Merge tag '6.13-rc-part1-SMB3-client-fixes' o..
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=1374b6e8580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=402159daa216c89d
> dashboard link: https://syzkaller.appspot.com/bug?extid=82064afd8bd59070fc22
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1774b6e8580000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=1335975f980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/d32a8e8c5aae/disk-228a1157.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/28d5c070092e/vmlinux-228a1157.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/45af4bfd9e8e/bzImage-228a1157.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/1e2338334d9b/mount_0.gz
> 
> The issue was bisected to:
> 
> commit 4c8ff7095bef64fc47e996a938f7d57f9e077da3
> Author: Chao Yu <yuchao0@huawei.com>
> Date:   Fri Nov 1 10:07:14 2019 +0000
> 
>     f2fs: support data compression
> 
> bisection log:  https://syzkaller.appspot.com/x/bisect.txt?x=150076e8580000
> final oops:     https://syzkaller.appspot.com/x/report.txt?x=170076e8580000
> console output: https://syzkaller.appspot.com/x/log.txt?x=130076e8580000
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+82064afd8bd59070fc22@syzkaller.appspotmail.com
> Fixes: 4c8ff7095bef ("f2fs: support data compression")
> 
> F2FS-fs (loop0): Mounted with checkpoint version = 48b305e4
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 5835 at fs/inode.c:407 drop_nlink+0xc4/0x110 fs/inode.c:407
> Modules linked in:
> CPU: 1 UID: 0 PID: 5835 Comm: syz-executor143 Not tainted 6.12.0-syzkaller-08446-g228a1157fb9f #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 09/13/2024
> RIP: 0010:drop_nlink+0xc4/0x110 fs/inode.c:407
> Code: bb 70 07 00 00 be 08 00 00 00 e8 27 d8 e5 ff f0 48 ff 83 70 07 00 00 5b 41 5c 41 5e 41 5f 5d c3 cc cc cc cc e8 9d 40 7e ff 90 <0f> 0b 90 eb 83 44 89 e1 80 e1 07 80 c1 03 38 c1 0f 8c 5c ff ff ff
> RSP: 0018:ffffc90003e377d0 EFLAGS: 00010293
> RAX: ffffffff82170c43 RBX: 1ffff1100efa8122 RCX: ffff88802cca0000
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: 0000000000000000
> RBP: 0000000000000000 R08: ffffffff82170bc3 R09: 1ffff1100efa81af
> R10: dffffc0000000000 R11: ffffed100efa81b0 R12: ffff888077d40910
> R13: dffffc0000000000 R14: ffff888077d408c8 R15: dffffc0000000000
> FS:  000055558e8f7380(0000) GS:ffff8880b8700000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000000000066c7e0 CR3: 000000007ac16000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  f2fs_i_links_write fs/f2fs/f2fs.h:3127 [inline]
>  f2fs_rename fs/f2fs/namei.c:999 [inline]
>  f2fs_rename2+0x1b6c/0x2c30 fs/f2fs/namei.c:1272
>  vfs_rename+0xbdb/0xf00 fs/namei.c:5067
>  do_renameat2+0xd94/0x13f0 fs/namei.c:5224
>  __do_sys_renameat2 fs/namei.c:5258 [inline]
>  __se_sys_renameat2 fs/namei.c:5255 [inline]
>  __x64_sys_renameat2+0xce/0xe0 fs/namei.c:5255
>  do_syscall_x64 arch/x86/entry/common.c:52 [inline]
>  do_syscall_64+0xf3/0x230 arch/x86/entry/common.c:83
>  entry_SYSCALL_64_after_hwframe+0x77/0x7f
> RIP: 0033:0x7fea51a18679
> Code: 28 00 00 00 75 05 48 83 c4 28 c3 e8 61 17 00 00 90 48 89 f8 48 89 f7 48 89 d6 48 89 ca 4d 89 c2 4d 89 c8 4c 8b 4c 24 08 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 b8 ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007ffd47104348 EFLAGS: 00000246 ORIG_RAX: 000000000000013c
> RAX: ffffffffffffffda RBX: 00007ffd47104518 RCX: 00007fea51a18679
> RDX: 0000000000000004 RSI: 00000000200000c0 RDI: 0000000000000005
> RBP: 00007fea51a9b610 R08: 0000000000000000 R09: 00007ffd47104518
> R10: 0000000020000100 R11: 0000000000000246 R12: 0000000000000001
> R13: 00007ffd47104508 R14: 0000000000000001 R15: 0000000000000001
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
