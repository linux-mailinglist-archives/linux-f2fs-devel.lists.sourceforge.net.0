Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DE8B3D5375
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jul 2021 08:59:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m7uaS-0008Cw-8Q; Mon, 26 Jul 2021 06:59:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hdanton@sina.com>) id 1m7uaP-0008CX-E9
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 06:59:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g2T6gJTkvYCuOobMFaI7JBhglrmC7JDlgh0Bz18FyC8=; b=UcLQGkioNV4UpCrHcHCXmUkl+/
 cuKu1JlozZO+BYnfRh7umkCSV/87zBvrv1kEHODyp6qtaNDeUnnXlppwPfGCw/q8XS8GBwrWPv7GY
 dYTKvkDgAqG7GBmmd01nJJFRe07oJPiRT3I/n7L0vHH2M+V4Medk5l/k4c5JIWSx2nNE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g2T6gJTkvYCuOobMFaI7JBhglrmC7JDlgh0Bz18FyC8=; b=ITcGBdBs0O2iux8CpqnGmIBIzo
 YSUgMk3jU7hSwgpQnwbVP+VVzzA06hKGImGV75MJmlMEja5m/euBYf9mCYSHVBxHdqsGbLcyMguxU
 RDmLtO+EVisMV1aC8JhVhM7oK04Kmc/ktf9E6K9qQaa1djlnlEnoldAMNkp5goOQ3CAo=;
Received: from mail3-162.sinamail.sina.com.cn ([202.108.3.162])
 by sfi-mx-1.v28.lw.sourceforge.com with smtp (Exim 4.92.3)
 id 1m7uaH-002qCt-54
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Jul 2021 06:59:37 +0000
Received: from unknown (HELO localhost.localdomain)([1.24.238.81])
 by sina.com (172.16.97.27) with ESMTP
 id 60FE5D47000126EC; Mon, 26 Jul 2021 14:59:22 +0800 (CST)
X-Sender: hdanton@sina.com
X-Auth-ID: hdanton@sina.com
X-SMAIL-MID: 2642349283588
From: Hillf Danton <hdanton@sina.com>
To: syzbot <syzbot+07ff38c9c93ca170de07@syzkaller.appspotmail.com>
Date: Mon, 26 Jul 2021 14:59:17 +0800
Message-Id: <20210726065917.1439-1-hdanton@sina.com>
In-Reply-To: <000000000000d5677605c8007723@google.com>
References: <000000000000d5677605c8007723@google.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hdanton[at]sina.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [202.108.3.162 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [202.108.3.162 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1m7uaH-002qCt-54
Subject: Re: [f2fs-dev] [syzbot] BUG: unable to handle kernel NULL pointer
 dereference in f2fs_update_meta_page
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
Cc: syzkaller-bugs@googlegroups.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Sun, 25 Jul 2021 23:00:19 -0700
> syzbot found the following issue on:
> 
> HEAD commit:    6498f6151825 Merge tag 'riscv-for-linus-5.14-rc3' of git:/..
> git tree:       upstream
> console output: https://syzkaller.appspot.com/x/log.txt?x=14bbce46300000
> kernel config:  https://syzkaller.appspot.com/x/.config?x=5dc0e3202ae2f574
> dashboard link: https://syzkaller.appspot.com/bug?extid=07ff38c9c93ca170de07
> compiler:       Debian clang version 11.0.1-2, GNU ld (GNU Binutils for Debian) 2.35.1
> 
> Unfortunately, I don't have any reproducer for this issue yet.

Given the code [1], curious about the reasons possible behind this report.

2416 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
2417					void *src, block_t blk_addr)
2418 {
2419	struct page *page = f2fs_grab_meta_page(sbi, blk_addr);
2420
2421	memcpy(page_address(page), src, PAGE_SIZE);
2422	set_page_dirty(page);
2423	f2fs_put_page(page, 1);
2424 }

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/fs/f2fs/segment.c?id=6498f6151825#n2422

> 
> IMPORTANT: if you fix the issue, please add the following tag to the commit:
> Reported-by: syzbot+07ff38c9c93ca170de07@syzkaller.appspotmail.com
> 
> BUG: kernel NULL pointer dereference, address: 0000000000000000
> #PF: supervisor instruction fetch in kernel mode
> #PF: error_code(0x0010) - not-present page
> PGD 7395a067 P4D 7395a067 PUD 7395b067 PMD 0 
> Oops: 0010 [#1] PREEMPT SMP KASAN
> CPU: 0 PID: 14793 Comm: syz-executor.3 Not tainted 5.14.0-rc2-syzkaller #0
> Hardware name: Google Google Compute Engine/Google Compute Engine, BIOS Google 01/01/2011
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> RSP: 0018:ffffc9000158f858 EFLAGS: 00010286
> RAX: 1ffffffff147d97b RBX: 00000000000005ff RCX: ffffffff8a3ecbd8
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffea00027e9540
> RBP: ffffc9000158fad0 R08: ffffffff81aa846c R09: fffff940004fd2a9
> R10: fffff940004fd2a9 R11: 0000000000000000 R12: ffff888081491310
> R13: 0000000000000001 R14: ffff88807fa0e000 R15: ffffea00027e9540
> FS:  0000000002a84400(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000073959000 CR4: 00000000001526f0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> Call Trace:
>  f2fs_update_meta_page+0x4b/0x380 fs/f2fs/segment.c:2422
>  do_checkpoint fs/f2fs/checkpoint.c:1492 [inline]
>  f2fs_write_checkpoint+0x2f1b/0x5060 fs/f2fs/checkpoint.c:1650
>  f2fs_issue_checkpoint+0x308/0x4a0 fs/f2fs/checkpoint.c:1718
>  __sync_filesystem fs/sync.c:39 [inline]
>  sync_filesystem+0x19e/0x200 fs/sync.c:67
>  generic_shutdown_super+0x6e/0x2b0 fs/super.c:448
>  kill_block_super+0x79/0xd0 fs/super.c:1395
>  kill_f2fs_super+0x2f9/0x3c0 fs/f2fs/super.c:4329
>  deactivate_locked_super+0xa7/0xf0 fs/super.c:335
>  cleanup_mnt+0x462/0x510 fs/namespace.c:1136
>  task_work_run+0x146/0x1c0 kernel/task_work.c:164
>  tracehook_notify_resume include/linux/tracehook.h:189 [inline]
>  exit_to_user_mode_loop kernel/entry/common.c:175 [inline]
>  exit_to_user_mode_prepare+0x201/0x220 kernel/entry/common.c:209
>  __syscall_exit_to_user_mode_work kernel/entry/common.c:291 [inline]
>  syscall_exit_to_user_mode+0x26/0x60 kernel/entry/common.c:302
>  do_syscall_64+0x4c/0xb0 arch/x86/entry/common.c:86
>  entry_SYSCALL_64_after_hwframe+0x44/0xae
> RIP: 0033:0x467a47
> Code: ff d0 48 89 c7 b8 3c 00 00 00 0f 05 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48 83 c8 ff c3 66 0f 1f 44 00 00 b8 a6 00 00 00 0f 05 <48> 3d 01 f0 ff ff 73 01 c3 48 c7 c1 bc ff ff ff f7 d8 64 89 01 48
> RSP: 002b:00007fffa4976ab8 EFLAGS: 00000246 ORIG_RAX: 00000000000000a6
> RAX: 0000000000000000 RBX: 0000000000000000 RCX: 0000000000467a47
> RDX: 00007fffa4976b8b RSI: 0000000000000002 RDI: 00007fffa4976b80
> RBP: 00007fffa4976b80 R08: 00000000ffffffff R09: 00007fffa4976950
> R10: 0000000002a858e3 R11: 0000000000000246 R12: 00000000004bee90
> R13: 00007fffa4977c50 R14: 0000000002a85810 R15: 00007fffa4977c90
> Modules linked in:
> CR2: 0000000000000000
> ---[ end trace dff6785899946653 ]---
> RIP: 0010:0x0
> Code: Unable to access opcode bytes at RIP 0xffffffffffffffd6.
> RSP: 0018:ffffc9000158f858 EFLAGS: 00010286
> RAX: 1ffffffff147d97b RBX: 00000000000005ff RCX: ffffffff8a3ecbd8
> RDX: 0000000000000000 RSI: 0000000000000000 RDI: ffffea00027e9540
> RBP: ffffc9000158fad0 R08: ffffffff81aa846c R09: fffff940004fd2a9
> R10: fffff940004fd2a9 R11: 0000000000000000 R12: ffff888081491310
> R13: 0000000000000001 R14: ffff88807fa0e000 R15: ffffea00027e9540
> FS:  0000000002a84400(0000) GS:ffff8880b9c00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: ffffffffffffffd6 CR3: 0000000073959000 CR4: 00000000001526f0
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


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
