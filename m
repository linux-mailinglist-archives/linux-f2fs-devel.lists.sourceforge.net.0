Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C9EF46B082
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  7 Dec 2021 03:12:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1muPyJ-0002zG-0y; Tue, 07 Dec 2021 02:12:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <akpm@linux-foundation.org>) id 1muPyH-0002zA-GI
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 02:12:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:Mime-Version
 :References:In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y+JzhjzK0ImQe/WJkYZzxYQ8PYfnBl8DuHrrAsfA1mI=; b=Zoj996Lxe6qOwLL1QVW4ZgA8nu
 KbmL89nzrHOaYu82jnYBvSewPnx9TT8bI5hLQf7UZyKSJ+2Q/Ij3X3y1k0J2DsSKfoZNnkyiE/5hI
 yGvRKa7OM86HW93mY+0LInKKjyk39LMkGC7ZFjapVVThZURad6Crdz7KMfFzJzQGzV1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:Mime-Version:References:
 In-Reply-To:Message-Id:Subject:Cc:To:From:Date:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Y+JzhjzK0ImQe/WJkYZzxYQ8PYfnBl8DuHrrAsfA1mI=; b=MIYLDgW8s0eIn8qJ70JzmcQTV/
 h9z0SbaQrZQ22nVn2R9ePI77EcPMQIcYvyglMU64WxU/ORB2nrqh65FgteFkysAQhioPNDcE2fBzt
 o5T8lMA4HlFIsOm2UbpPyBDAirRxjMBJEY2NnmfOW988+WIoF4VonsfX+k0xfLKc7mA4=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1muPy9-006txC-Jj
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 07 Dec 2021 02:12:45 +0000
Received: from mail.kernel.org (unknown [198.145.29.99])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 9E504CE18BD;
 Tue,  7 Dec 2021 01:56:34 +0000 (UTC)
Received: by mail.kernel.org (Postfix) with ESMTPSA id E447C60EBB;
 Tue,  7 Dec 2021 01:56:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linux-foundation.org;
 s=korg; t=1638842193;
 bh=b/VP2yUNSXMDqDOnbHgxx09MYMM/sNMmnDNOVdXb0RA=;
 h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
 b=vMSNbM8vZIsAGf8maRR7w/w9aK/geHLwbvw6fpxURpdRkbnYmVEbDgmml5+wNq18w
 DhBpbpTkWmSaKxvHRdTOe64utAVXdk7dvIc57DRsP5ZY6jqygza+X22PWlZQ3zj/uk
 TEXiI/7MAvCoYYqT1cNmoOSWIJjhzwefEMYmKSjk=
Date: Mon, 6 Dec 2021 17:56:31 -0800
From: Andrew Morton <akpm@linux-foundation.org>
To: syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com>
Message-Id: <20211206175631.5d0c3caefa96f0479f0fc2e8@linux-foundation.org>
In-Reply-To: <0000000000005f297e05d24f05f6@google.com>
References: <0000000000005f297e05d24f05f6@google.com>
X-Mailer: Sylpheed 3.5.1 (GTK+ 2.24.31; x86_64-pc-linux-gnu)
Mime-Version: 1.0
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Sat, 04 Dec 2021 01:55:17 -0800 syzbot
 <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com>
 wrote: > Hello, > > syzbot found the following issue on: > > HEAD commit:
 58e1100fdc59 MAINTAINERS: co-maintain random.c > git tree: upstream > console
 output: https://syzkaller.appspot.com/x/log.txt?x=13628 [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1muPy9-006txC-Jj
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in folio_mark_dirty
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
Cc: linux-mm@kvack.org, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sat, 04 Dec 2021 01:55:17 -0800 syzbot <syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com> wrote:

> Hello,
> 
> syzbot found the following issue on:
> 
> HEAD commit:    58e1100fdc59 MAINTAINERS: co-maintain random.c
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=1362881eb00000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=e9ea28d2c3c2c389
> dashboard link: https://syzkaller.appspot.com/bug?extid=7cd473c2cac13fd2dd72
> compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.2
> 
> Unfortunately, I don't have any reproducer for this issue yet.
> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+7cd473c2cac13fd2dd72@syzkaller.appspotmail.com
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000

cc linux-f2fs-devel@lists.sourceforge.net

And willy, who might help with diagnosing this.  But it does seem that
f2fs got itself a NULL page* then put it in places where it shouldn't have.

> #PF: supervisor instruction fetch in kernel mode
> #PF: error_code(0x0010) - not-present page
> PGD 70764067 P4D 70764067 PUD 0 
> Oops: 0010 [#1] PREEMPT SMP KASAN
> CPU: 1 PID: 6541 Comm: syz-executor.3 Not tainted 5.16.0-rc3-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> RSP: 0018:ffffc900027ff7f8 EFLAGS: 00010246
> RAX: 1ffffffff14fef03 RBX: ffffffff8a7f7818 RCX: ffff88801b40d700
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffea0002790ec0
> RBP: dffffc0000000000 R08: ffffffff81b0fa16 R09: fffff940004f21d9
> R10: fffff940004f21d9 R11: 0000000000000000 R12: ffff88806c11c7b0
> R13: 0000000000000000 R14: 1ffffd40004f21d9 R15: ffffea0002790ec0
> FS:  0000555557165400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000030d85000 CR4: 00000000003526e0
> Call Trace:
>  <TASK>
>  folio_mark_dirty+0x136/0x270 mm/page-writeback.c:2639
>  f2fs_update_meta_page+0x4b/0x380 fs/f2fs/segment.c:2485
>  do_checkpoint fs/f2fs/checkpoint.c:1513 [inline]
>  f2fs_write_checkpoint+0x31ad/0x5430 fs/f2fs/checkpoint.c:1674
>  f2fs_issue_checkpoint+0x361/0x4e0
>  sync_filesystem+0x19c/0x1f0 fs/sync.c:63
>  generic_shutdown_super+0x6b/0x300 fs/super.c:448
>  kill_block_super+0x79/0xd0 fs/super.c:1397
>  kill_f2fs_super+0x2f9/0x3c0 fs/f2fs/super.c:4478
>  deactivate_locked_super+0xa7/0xf0 fs/super.c:335
>  cleanup_mnt+0x462/0x510 fs/namespace.c:1137
>  task_work_run+0x146/0x1c0 kernel/task_work.c:164
>  tracehook_notify_resume include/linux/tracehook.h:189 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
>  exit_to_user_mode_prepare+0x209/0x220 kernel/entry/common.c:207
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:289 [inline]
>  syscall_exit_to_user_mode+0x2e/0x70 kernel/entry/common.c:300
>  do_syscall_64+0x53/0xd0 arch/x86/entry/common.c:86
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x7f6cfdd59f57
> Code: ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 31 f6 e9 09 00 00 00 66 0f 1f 84 00 00 00 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fffcbddcad8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 00007f6cfdd59f57
> RDX: 00007fffcbddcbac RSI: 000000000000000a RDI: 00007fffcbddcba0
> RBP: 00007fffcbddcba0 R08: 00000000ffffffff R09: 00007fffcbddc970
> R10: 0000555557166903 R11: 0000000000000246 R12: 00007f6cfddb2105
> R13: 00007fffcbdddc60 R14: 0000555557166810 R15: 00007fffcbdddca0
>  </TASK>
> Modules linked in:
> CR2: 0000000000000000
> ---[ end trace 08eda5a5e35b48a0 ]---
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> RSP: 0018:ffffc900027ff7f8 EFLAGS: 00010246
> RAX: 1ffffffff14fef03 RBX: ffffffff8a7f7818 RCX: ffff88801b40d700
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffea0002790ec0
> RBP: dffffc0000000000 R08: ffffffff81b0fa16 R09: fffff940004f21d9
> R10: fffff940004f21d9 R11: 0000000000000000 R12: ffff88806c11c7b0
> R13: 0000000000000000 R14: 1ffffd40004f21d9 R15: ffffea0002790ec0
> FS:  0000555557165400(0000) GS:ffff8880b9b00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000030d85000 CR4: 00000000003526e0
> 
> 
> ---
> This report is generated by a bot. It may contain errors.
> See https://goo.gl/tpsmEJ for more information about syzbot.
> syzbot engineers can be reached at syzkaller@googlegroups.com.
> 
> syzbot will keep track of this issue. See:
> https://goo.gl/tpsmEJ#status for how to communicate with syzbot.


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
