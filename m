Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C34788FE14
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Aug 2019 10:38:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hyXkM-0001N8-7q; Fri, 16 Aug 2019 08:38:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hyXkL-0001Mx-1N
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 08:38:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:
 MIME-Version:Date:Message-ID:From:CC:References:To:Subject:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YmSQ76F0AZh4JjArX4NJE3Msh/xM5xnt9TNq0OfirYY=; b=NPhqyp75yqbEluc8My53GOl8tt
 4VmBOi2I62/2btMl0M4rxCygoSgzNF+J7PBtbqFvdkEAChyAdQJMixRuwVPbfceLSqryCM8lQrCmS
 lsb0o5XR5ndeHNLeMp64ROluNWaR9e+/daTqSFABdL0Aj7YbWEDeKfxKYhln0KmeiRzA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:Content-Type:In-Reply-To:MIME-Version:Date:
 Message-ID:From:CC:References:To:Subject:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YmSQ76F0AZh4JjArX4NJE3Msh/xM5xnt9TNq0OfirYY=; b=mHidB66sE31eIsqwToZz1F5D8J
 D4Po31rZxwv7EJ4d7XSTjaSoEdxWwZOm/5O5faxeXF4SUtNHA26LUnaPihWWCmG1tN2PsPyXWMtFl
 aQpKByMSR66aOvxnXcIXErwOV00RGdqosdg8UNa6KcQAdIqrGBBCVtyT5oJcjp2mVJeg=;
Received: from [45.249.212.32] (helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hyXkC-005fMW-LK
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 16 Aug 2019 08:38:04 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 2127B8BFB1FB0D91A355;
 Fri, 16 Aug 2019 16:37:40 +0800 (CST)
Received: from [10.134.22.195] (10.134.22.195) by smtp.huawei.com
 (10.3.19.213) with Microsoft SMTP Server (TLS) id 14.3.439.0; Fri, 16 Aug
 2019 16:37:36 +0800
To: Eric Biggers <ebiggers@kernel.org>
References: <20190729174140.GA169027@gmail.com>
From: Chao Yu <yuchao0@huawei.com>
Message-ID: <13d9a0eb-2c5f-25c8-9ebb-16815a178d8f@huawei.com>
Date: Fri, 16 Aug 2019 16:37:35 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
 Thunderbird/52.9.1
MIME-Version: 1.0
In-Reply-To: <20190729174140.GA169027@gmail.com>
Content-Language: en-US
X-Originating-IP: [10.134.22.195]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 1.0 RDNS_NONE Delivered to internal network by a host with no rDNS
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hyXkC-005fMW-LK
Subject: Re: [f2fs-dev] kernel BUG at fs/f2fs/segment.c:2391 during xfstest
 generic/204
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi Eric,

Sorry for late reply...

I only hit ENOSPC error:

QA output created by 204
line 82: echo: write error: No space left on device

What is your mkfs/mount option?

On 2019/7/30 1:41, Eric Biggers wrote:
> On xfstest generic/204 on f2fs, I'm getting a kernel BUG.
> 
> It bisects to:
> 
> 	commit 1cb50f87e10696e8cc61fb62d0d948e11b0e6dc1
> 	Author: Jaegeuk Kim <jaegeuk@kernel.org>
> 	Date:   Fri Jul 6 16:47:34 2018 -0700
> 
> 	    f2fs: do checkpoint in kill_sb
> 
> Here is the BUG, on v5.3-rc2:
> 
> generic/204 1s ... 	[10:34:22][    6.005271] run fstests generic/204 at 2019-07-29 10:34:22
> ------------[ cut here ]------------
> kernel BUG at fs/f2fs/segment.c:2391!
> invalid opcode: 0000 [#1] SMP
> CPU: 1 PID: 111 Comm: kworker/u4:2 Not tainted 5.3.0-rc2 #4
> Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
> Workqueue: writeback wb_workfn (flush-254:32)
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2382 [inline]
> RIP: 0010:new_curseg+0x350/0x360 fs/f2fs/segment.c:2512
> Code: 8b 7b 48 44 89 ea 41 0f af f6 e8 5b cb 06 00 41 8b 97 18 0b 00 00 41 89 c2 41 0f af d6 39 d0 0f 82 97 fe ff ff e9 a7 fd ff ff <0f> 0b 45 31 e4 45 31 ed e9 47 f2
> RSP: 0018:ffffc9000045f5c8 EFLAGS: 00010246
> RAX: 0000000000000031 RBX: ffff88807b533800 RCX: 0000000000000040
> RDX: 0000000000000031 RSI: 0000000000000000 RDI: ffff88807af35b60
> RBP: ffffc9000045f618 R08: 000000000000000a R09: 0000000000000001
> R10: ffff88807b533828 R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000001 R14: 0000000000000000 R15: ffff888078d3c000
> FS:  0000000000000000(0000) GS:ffff88807fd00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055db93c6b2d8 CR3: 0000000078c43005 CR4: 0000000000760ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> Call Trace:
>  allocate_segment_by_default+0x9c/0x100 fs/f2fs/segment.c:2651
>  f2fs_allocate_data_block+0x1f3/0x600 fs/f2fs/segment.c:3101
>  do_write_page+0x9d/0x110 fs/f2fs/segment.c:3165
>  f2fs_do_write_node_page+0x35/0xb0 fs/f2fs/segment.c:3216
>  __write_node_page+0x290/0x660 fs/f2fs/node.c:1574
>  f2fs_sync_node_pages+0x6e1/0x790 fs/f2fs/node.c:1843
>  block_operations fs/f2fs/checkpoint.c:1225 [inline]
>  f2fs_write_checkpoint+0x282/0x920 fs/f2fs/checkpoint.c:1576
>  f2fs_sync_fs+0xc6/0x1b0 fs/f2fs/super.c:1116
>  f2fs_balance_fs_bg+0x107/0x300 fs/f2fs/segment.c:557
>  f2fs_write_node_pages+0x55/0x310 fs/f2fs/node.c:1931
>  do_writepages+0x43/0xf0 mm/page-writeback.c:2342
>  __writeback_single_inode+0x56/0x5b0 fs/fs-writeback.c:1364
>  writeback_sb_inodes+0x253/0x580 fs/fs-writeback.c:1628
>  wb_writeback+0x10f/0x480 fs/fs-writeback.c:1804
>  wb_do_writeback fs/fs-writeback.c:1949 [inline]
>  wb_workfn+0xa9/0x570 fs/fs-writeback.c:1990
>  process_one_work+0x21c/0x5c0 kernel/workqueue.c:2269
>  worker_thread+0x3a/0x3b0 kernel/workqueue.c:2415
>  kthread+0x124/0x140 kernel/kthread.c:255
>  ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
> ---[ end trace 63bbe1af16f6dd61 ]---
> RIP: 0010:get_new_segment fs/f2fs/segment.c:2382 [inline]
> RIP: 0010:new_curseg+0x350/0x360 fs/f2fs/segment.c:2512
> Code: 8b 7b 48 44 89 ea 41 0f af f6 e8 5b cb 06 00 41 8b 97 18 0b 00 00 41 89 c2 41 0f af d6 39 d0 0f 82 97 fe ff ff e9 a7 fd ff ff <0f> 0b 45 31 e4 45 31 ed e9 47 f2
> RSP: 0018:ffffc9000045f5c8 EFLAGS: 00010246
> RAX: 0000000000000031 RBX: ffff88807b533800 RCX: 0000000000000040
> RDX: 0000000000000031 RSI: 0000000000000000 RDI: ffff88807af35b60
> RBP: ffffc9000045f618 R08: 000000000000000a R09: 0000000000000001
> R10: ffff88807b533828 R11: 0000000000000001 R12: 0000000000000000
> R13: 0000000000000001 R14: 0000000000000000 R15: ffff888078d3c000
> FS:  0000000000000000(0000) GS:ffff88807fd00000(0000) knlGS:0000000000000000
> CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
> CR2: 000055db93c6b2d8 CR3: 0000000078c43005 CR4: 0000000000760ee0
> DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
> DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
> PKRU: 55555554
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> .
> 


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
