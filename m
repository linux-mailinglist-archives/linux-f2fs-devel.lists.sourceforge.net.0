Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8A3D9747F3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 03:48:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soCTA-0006uK-AF;
	Wed, 11 Sep 2024 01:48:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1soCT8-0006u8-US
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 01:48:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 From:References:To:Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KUXQY2j1t0p2XVqWCNUTsx5pH2z3t/Or3ErigMQnF5c=; b=khU65zJMJL31EzXHufkjehF8GO
 zLG270zSCzV/lWgHzkNcM5eI85RDUN2G99pzuxqg+O+Jhb/o7Os5Do8OesfcnQ+4qr5jObzcWBuuV
 2vDh5WYHiWABUOzZF62QTMAKlZr6T9EA/jFQLbAzeLlrVY8AaotqcTqpE2qjM+RVGui4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:
 Subject:Cc:MIME-Version:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KUXQY2j1t0p2XVqWCNUTsx5pH2z3t/Or3ErigMQnF5c=; b=FWiq1+yiqF9WXh48b4CfneVmHl
 SXfSSYUdLjmugWeXuAh20T7EjT7MAYGulduE/U/n1NunveOR+UTMyNOp7IeQcYqVh2AE529KP9Dq/
 Obxi4MQLB+44vyyIsYCy3HROmB1TJuDbu0WHasI2D+6J3UU4fMngyaNVz/jyrh7/foLc=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soCT7-0003e7-V1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 01:48:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 728C1A44178;
 Wed, 11 Sep 2024 01:48:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB910C4CEC3;
 Wed, 11 Sep 2024 01:48:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1726019298;
 bh=wu9D8GMK4xddW2kkLvlhjUZNk9I/s0JwheSYbmR6ou8=;
 h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
 b=Hi/SRwpE36fpJCz5j0QZeerRwMyGw8YcM4mHzTNV9DzlCQVEIrPbUrFapPuMDfsL1
 PjOhgRNIZpqc7dbSW3bhabapqo7858L8HAXpBJ31uEmhvGIwexGQwOwzeWnB1KbqEI
 g/Ae43cGsNYAu+x6wWKKxvaFmApbwOr0+X0nkVPSru57gzR4zkk74GA7DMMdqfTzU1
 WVjnsSTnPulUaa71RCxtOnQNMFcpWLd/ablF7ka91Frdt4HP7PIIzq1eD+nnXuK+RD
 p3eEylvuL/fvXMPh5DFeR2ycjBnMoOthaR2Hm0H4o+kkGODMb1eyxyahpi1hJUCt9k
 zNFL5RXOzg+Kw==
Message-ID: <2fba030d-bd24-4a3d-852e-e10a484feaaf@kernel.org>
Date: Wed, 11 Sep 2024 09:48:10 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: syzbot <syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com>
References: <000000000000b90a8e061e21d12f@google.com>
Content-Language: en-US
In-Reply-To: <000000000000b90a8e061e21d12f@google.com>
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: #syz test:
 https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git
 wip On 2024/7/26 15:54, syzbot wrote: > Hello, > > syzbot found the following
 issue on: > > HEAD commit: 1722389b0d86 Merge tag 'net-6.11-rc1' of
 git://git.kernel...
 > git tree: upstream > console+strace: [...] 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1soCT7-0003e7-V1
Subject: Re: [f2fs-dev] [syzbot] [f2fs?] WARNING in rcu_sync_dtor
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
Cc: brauner@kernel.org, jack@suse.cz, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 viro@zeniv.linux.org.uk, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

#syz test: https://git.kernel.org/pub/scm/linux/kernel/git/chao/linux.git wip

On 2024/7/26 15:54, syzbot wrote:
> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    1722389b0d86 Merge tag 'net-6.11-rc1' of git://git.kernel...
> git tree:       upstream
> console+strace: https://syzkaller.appspot.com/x/log.txt?x=14955423980000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=b698a1b2fcd7ef5f
> dashboard link: https://syzkaller.appspot.com/bug?extid=20d7e439f76bbbd863a7
> compiler:       Debian clang version 15.0.6, GNU ld (GNU Binutils for Debian) 2.40
> syz repro:      https://syzkaller.appspot.com/x/repro.syz?x=1237a1f1980000
> C reproducer:   https://syzkaller.appspot.com/x/repro.c?x=115edac9980000
> 
> Downloadable assets:
> disk image: https://storage.googleapis.com/syzbot-assets/e3f4ec8ccf7c/disk-1722389b.raw.xz
> vmlinux: https://storage.googleapis.com/syzbot-assets/f19bcd908282/vmlinux-1722389b.xz
> kernel image: https://storage.googleapis.com/syzbot-assets/d93604974a98/bzImage-1722389b.xz
> mounted in repro: https://storage.googleapis.com/syzbot-assets/e0d10e1258f5/mount_0.gz
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+20d7e439f76bbbd863a7@syzkaller.appspotmail.com
> 
> ------------[ cut here ]------------
> WARNING: CPU: 1 PID: 58 at kernel/rcu/sync.c:177 rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
> Modules linked in:
> CPU: 1 UID: 0 PID: 58 Comm: kworker/1:2 Not tainted 6.10.0-syzkaller-12562-g1722389b0d86 #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 06/27/2024
> Workqueue: events destroy_super_work
> RIP: 0010:rcu_sync_dtor+0xcd/0x180 kernel/rcu/sync.c:177
> Code: 74 19 e8 86 d5 00 00 43 0f b6 44 25 00 84 c0 0f 85 82 00 00 00 41 83 3f 00 75 1d 5b 41 5c 41 5d 41 5e 41 5f c3 cc cc cc cc 90 <0f> 0b 90 e9 66 ff ff ff 90 0f 0b 90 eb 89 90 0f 0b 90 eb dd 44 89
> RSP: 0018:ffffc9000133fb30 EFLAGS: 00010246
> RAX: 0000000000000002 RBX: 1ffff11005324477 RCX: ffff8880163f5a00
> RDX: 0000000000000000 RSI: ffffffff8c3f9540 RDI: ffff888029922350
> RBP: 0000000000000167 R08: ffffffff82092061 R09: 1ffffffff1cbbbd4
> R10: dffffc0000000000 R11: fffffbfff1cbbbd5 R12: dffffc0000000000
> R13: 1ffff1100532446a R14: ffff888029922350 R15: ffff888029922350
> FS:  0000000000000000(0000) GS:ffff8880b9300000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055557c167738 CR3: 000000007ada8000 CR4: 00000000003506f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>   <TASK>
>   percpu_free_rwsem+0x41/0x80 kernel/locking/percpu-rwsem.c:42
>   destroy_super_work+0xec/0x130 fs/super.c:282
>   process_one_work kernel/workqueue.c:3231 [inline]
>   process_scheduled_works+0xa2c/0x1830 kernel/workqueue.c:3312
>   worker_thread+0x86d/0xd40 kernel/workqueue.c:3390
>   kthread+0x2f0/0x390 kernel/kthread.c:389
>   ret_from_fork+0x4b/0x80 arch/x86/kernel/process.c:147
>   ret_from_fork_asm+0x1a/0x30 arch/x86/entry/entry_64.S:244
>   </TASK>
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
