Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AD6A9B2080F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Aug 2025 13:41:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:In-Reply-To:References:To:MIME-Version:Date:
	Message-ID:Sender:Cc:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mpytIHiPmwgKLoibisbJCC2veLWy06NTRf+uvOwP2eA=; b=JJ0JdH01FqiPnhjDMbDAW2Busw
	oFyx6blhuD/ot/56+Jk+gm4aVVSsq2jVy4a8uYR0dm8o5XVSW/8LBYmAoxZXd9HH0imzkXgFTLQpZ
	eFIPkXG8tDZ2yEj4ktN2dRUZj+7jGJRwhcHAm2wzsfKUCMqexgfGqUyyG6d69fEoQafo=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ulQtz-00052e-Cq;
	Mon, 11 Aug 2025 11:41:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1ulQty-00052R-L4
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:41:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qtMq6NcE7zzadJGGJrMr5Sr1a4Yqqf4+zayX/mUvVHc=; b=OnKDe7dCyvjvzfb+8p1zGx2kNJ
 RBKTlUdX+PaqQCAcyabS2QFEI2oDloAgTJTIeA8OVdQPqriq7JzwqPgoyaIsu8KnyXCr4n+t/pkHJ
 u2cPYQu1NEZll+gFVTgCqtZ/9mNMRkpsmRsYGpcQc4hn74bs/syYi+PU9JYrhPMj0zHU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qtMq6NcE7zzadJGGJrMr5Sr1a4Yqqf4+zayX/mUvVHc=; b=ioq69a7DDqhVsdmdG/NN7ZaCul
 efupCMH19i+urcNy+A/Ih2zVp4b/SfB634NwKtHmLap9og6o1SKsfnwSMNiYE1EpfBsUNAgtO3AjE
 smjkvs4N2yy5EBxE64RBqF8KunuBVs2RoLqDv2EivRquKJkjvkaLjifAaZdl9R2DAF7g=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ulQty-0007LJ-Qv for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Aug 2025 11:41:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 58EFA45997;
 Mon, 11 Aug 2025 11:41:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 89A34C4CEED;
 Mon, 11 Aug 2025 11:41:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1754912468;
 bh=se0LPPpyvdXaamX2AlSPQPdigMuM5TEAMp+uNnvVCyg=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=OA1H4RgyN2tdzhWdheQAv6OvMSfeervu1u8BNowQlTKKupXq2BnBECnlmb8JnQ24y
 cgik0aEOuzz9gXvFH8wmenWcAp5I357hFCUlMJNGb8CABr2Qf92GEczJDwZg8jart9
 8lKqwAtG5koeVdvTXBiRx9Hk13fWzLf1fnvTrupAkq0smQFk4O0ArNsNjgBumv5Xhx
 Pbxp7nD+VUztoVhrFkiWl59AoKOsE33plxTgv4Hm9uvgDeHM5d2WYUg4GXnIrO+YGO
 Lp4XCcRkZaaVxl6ydYSUDcKGiQii4dpLb5YtLB0N468Lg7fEhHG+D8BXC3RUUIYKWG
 Nt1VGPS0OjYtw==
Message-ID: <5a259275-e284-49b5-80d4-929c60b5c1cc@kernel.org>
Date: Mon, 11 Aug 2025 19:41:04 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com>,
 jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, syzkaller-bugs@googlegroups.com
References: <67ec7e14.050a0220.31979b.0031.GAE@google.com>
Content-Language: en-US
In-Reply-To: <67ec7e14.050a0220.31979b.0031.GAE@google.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 bugfix/common On 4/2/25 08:00, syzbot wrote: > Hello, > > syzbot found the
 following issue on: > > HEAD commit: 4e82c87058f4 Merge tag 'rust-6.15' of
 git://git.kernel.org.. > git tree: upstream > console output: ht [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1ulQty-0007LJ-Qv
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] kernel BUG in f2fs_write_end_io
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

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git bugfix/common

On 4/2/25 08:00, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    4e82c87058f4 Merge tag 'rust-6.15' of git://git.kernel.org..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=17007198580000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=4253e469c0d32ef6
> dashboard link: https://syzkaller.appspot.com/bug?extid=803dd716c4310d16ff3a
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/5e6f1c2744e3/disk-4e82c870.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/5c1a60744d62/vmlinux-4e82c870.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/228bbd75bd12/bzImage-4e82c870.xz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+803dd716c4310d16ff3a@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/data.c:358!
> Oops: invalid opcode: 0000 [#1] SMP KASAN PTI
> CPU: 1 UID: 0 PID: 23 Comm: ksoftirqd/1 Not tainted 6.14.0-syzkaller-10892-g4e82c87058f4 #0 PREEMPT(full) 
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 02/12/2025
> RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
> Code: e8 8b 01 f2 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 11 01 f2 fd e9 f1 fa ff ff e8 87 92 8b fd 90 <0f> 0b e8 8f d4 ed 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
> RSP: 0018:ffffc900001d79c0 EFLAGS: 00010246
> RAX: ffffffff8437d9e9 RBX: 0000000000000000 RCX: ffff88801da85a00
> RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000a
> RBP: ffffc900001d7ac8 R08: ffffffff8437d696 R09: 1ffffd400012b785
> R10: dffffc0000000000 R11: fffff9400012b786 R12: 0000000000000001
> R13: dffffc0000000000 R14: 000000000000000a R15: ffffea000095bc00
> FS:  0000000000000000(0000) GS:ffff8881250e5000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fd1b21f9438 CR3: 000000007b684000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  <TASK>
>  blk_update_request+0x5e5/0x1160 block/blk-mq.c:983
>  blk_mq_end_request+0x3e/0x70 block/blk-mq.c:1145
>  blk_complete_reqs block/blk-mq.c:1220 [inline]
>  blk_done_softirq+0x100/0x150 block/blk-mq.c:1225
>  handle_softirqs+0x2d6/0x9b0 kernel/softirq.c:579
>  run_ksoftirqd+0xcf/0x130 kernel/softirq.c:968
>  smpboot_thread_fn+0x576/0xaa0 kernel/smpboot.c:164
>  kthread+0x7b7/0x940 kernel/kthread.c:464
>  ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:153
>  ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:245
>  </TASK>
> Modules linked in:
> ---[ end trace 0000000000000000 ]---
> RIP: 0010:f2fs_write_end_io+0x77a/0x790 fs/f2fs/data.c:357
> Code: e8 8b 01 f2 fd e9 a2 fa ff ff 89 d9 80 e1 07 38 c1 0f 8c fe fa ff ff 48 89 df e8 11 01 f2 fd e9 f1 fa ff ff e8 87 92 8b fd 90 <0f> 0b e8 8f d4 ed 07 66 66 66 66 66 66 2e 0f 1f 84 00 00 00 00 00
> RSP: 0018:ffffc900001d79c0 EFLAGS: 00010246
> RAX: ffffffff8437d9e9 RBX: 0000000000000000 RCX: ffff88801da85a00
> RDX: 0000000000000100 RSI: 0000000000000000 RDI: 000000000000000a
> RBP: ffffc900001d7ac8 R08: ffffffff8437d696 R09: 1ffffd400012b785
> R10: dffffc0000000000 R11: fffff9400012b786 R12: 0000000000000001
> R13: dffffc0000000000 R14: 000000000000000a R15: ffffea000095bc00
> FS:  0000000000000000(0000) GS:ffff8881250e5000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 00007fd1b21f9438 CR3: 000000007b684000 CR4: 00000000003526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.
> 
> If the report is already addressed, let syzbot know by replying with:
> #syz fix: exact-commit-title
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
