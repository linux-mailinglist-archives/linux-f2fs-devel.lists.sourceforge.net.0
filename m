Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 95A3F79244
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 19:41:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hs9ei-0001pY-0S; Mon, 29 Jul 2019 17:41:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hs9eg-0001pR-P3
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 17:41:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gqkvCW4xK7y3qKB8Ge2yu4XoItJNB68b6YTUnw75dP0=; b=fIx4pf+13h8zjGdMA1jgVpefhL
 47GhGe2LU5ZpLyuhc2zmYWZni++d9hXNmVRX+5zTW0UEgkL8pW1aR23Ph1adOyxu+yl1JJT18C2Rs
 79Sols02vKzFhYRJ8Xv6SW6M+6Slp1B8KrFK9ZFID5B6caFLkGE9USgHbVa4cy8jybcg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Subject:To:From:Date:Sender:Reply-To
 :Cc:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gqkvCW4xK7y3qKB8Ge2yu4XoItJNB68b6YTUnw75dP0=; b=e
 AXasoahxu734+oImjdDmXPWe0p59dzM9Zq3gzPoZTZzrK2k/oMxQu5QRbD5Ijr98fE98Nrg/AzR/7
 gNFsF7JFFEJjAbA4qG+iiI9I0ZjhYzMsbbhkhh3EaQ4OlddGfm1vZuLiM0cTjj2+j3hQ1MB8kuKr4
 x447ZohiUOYL5+kM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hs9ee-003qvQ-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 17:41:50 +0000
Received: from gmail.com (unknown [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id ECDEB2073F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 29 Jul 2019 17:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1564422103;
 bh=HIRK8bVie8WAvxQR1AklVBpH/WTwodALxhjVbgCEjSk=;
 h=Date:From:To:Subject:From;
 b=NZYYr70R5I5h3a9f2on9pSnbTy9X2Kz4Ey8M7NfDcPDzS2J9RlOhJTsV+xqDQD5W6
 0ty3b//OtICC5qU6ZGrCLE1FesmBe2/128z4Env27e4lRTF+aFpFD4tb9d2uSFlPiF
 3u/anz0xlsuR7cecKpgscUIw3Pz55OBKcmzpZhPQ=
Date: Mon, 29 Jul 2019 10:41:41 -0700
From: Eric Biggers <ebiggers@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Message-ID: <20190729174140.GA169027@gmail.com>
Mail-Followup-To: linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Spam-Score: 3.4 (+++)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 3.5 FSL_HELO_FAKE          No description available.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hs9ee-003qvQ-IQ
Subject: [f2fs-dev] kernel BUG at fs/f2fs/segment.c:2391 during xfstest
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On xfstest generic/204 on f2fs, I'm getting a kernel BUG.

It bisects to:

	commit 1cb50f87e10696e8cc61fb62d0d948e11b0e6dc1
	Author: Jaegeuk Kim <jaegeuk@kernel.org>
	Date:   Fri Jul 6 16:47:34 2018 -0700

	    f2fs: do checkpoint in kill_sb

Here is the BUG, on v5.3-rc2:

generic/204 1s ... 	[10:34:22][    6.005271] run fstests generic/204 at 2019-07-29 10:34:22
------------[ cut here ]------------
kernel BUG at fs/f2fs/segment.c:2391!
invalid opcode: 0000 [#1] SMP
CPU: 1 PID: 111 Comm: kworker/u4:2 Not tainted 5.3.0-rc2 #4
Hardware name: QEMU Standard PC (i440FX + PIIX, 1996), BIOS 1.12.0-1 04/01/2014
Workqueue: writeback wb_workfn (flush-254:32)
RIP: 0010:get_new_segment fs/f2fs/segment.c:2382 [inline]
RIP: 0010:new_curseg+0x350/0x360 fs/f2fs/segment.c:2512
Code: 8b 7b 48 44 89 ea 41 0f af f6 e8 5b cb 06 00 41 8b 97 18 0b 00 00 41 89 c2 41 0f af d6 39 d0 0f 82 97 fe ff ff e9 a7 fd ff ff <0f> 0b 45 31 e4 45 31 ed e9 47 f2
RSP: 0018:ffffc9000045f5c8 EFLAGS: 00010246
RAX: 0000000000000031 RBX: ffff88807b533800 RCX: 0000000000000040
RDX: 0000000000000031 RSI: 0000000000000000 RDI: ffff88807af35b60
RBP: ffffc9000045f618 R08: 000000000000000a R09: 0000000000000001
R10: ffff88807b533828 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000000 R15: ffff888078d3c000
FS:  0000000000000000(0000) GS:ffff88807fd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055db93c6b2d8 CR3: 0000000078c43005 CR4: 0000000000760ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554
Call Trace:
 allocate_segment_by_default+0x9c/0x100 fs/f2fs/segment.c:2651
 f2fs_allocate_data_block+0x1f3/0x600 fs/f2fs/segment.c:3101
 do_write_page+0x9d/0x110 fs/f2fs/segment.c:3165
 f2fs_do_write_node_page+0x35/0xb0 fs/f2fs/segment.c:3216
 __write_node_page+0x290/0x660 fs/f2fs/node.c:1574
 f2fs_sync_node_pages+0x6e1/0x790 fs/f2fs/node.c:1843
 block_operations fs/f2fs/checkpoint.c:1225 [inline]
 f2fs_write_checkpoint+0x282/0x920 fs/f2fs/checkpoint.c:1576
 f2fs_sync_fs+0xc6/0x1b0 fs/f2fs/super.c:1116
 f2fs_balance_fs_bg+0x107/0x300 fs/f2fs/segment.c:557
 f2fs_write_node_pages+0x55/0x310 fs/f2fs/node.c:1931
 do_writepages+0x43/0xf0 mm/page-writeback.c:2342
 __writeback_single_inode+0x56/0x5b0 fs/fs-writeback.c:1364
 writeback_sb_inodes+0x253/0x580 fs/fs-writeback.c:1628
 wb_writeback+0x10f/0x480 fs/fs-writeback.c:1804
 wb_do_writeback fs/fs-writeback.c:1949 [inline]
 wb_workfn+0xa9/0x570 fs/fs-writeback.c:1990
 process_one_work+0x21c/0x5c0 kernel/workqueue.c:2269
 worker_thread+0x3a/0x3b0 kernel/workqueue.c:2415
 kthread+0x124/0x140 kernel/kthread.c:255
 ret_from_fork+0x24/0x30 arch/x86/entry/entry_64.S:352
---[ end trace 63bbe1af16f6dd61 ]---
RIP: 0010:get_new_segment fs/f2fs/segment.c:2382 [inline]
RIP: 0010:new_curseg+0x350/0x360 fs/f2fs/segment.c:2512
Code: 8b 7b 48 44 89 ea 41 0f af f6 e8 5b cb 06 00 41 8b 97 18 0b 00 00 41 89 c2 41 0f af d6 39 d0 0f 82 97 fe ff ff e9 a7 fd ff ff <0f> 0b 45 31 e4 45 31 ed e9 47 f2
RSP: 0018:ffffc9000045f5c8 EFLAGS: 00010246
RAX: 0000000000000031 RBX: ffff88807b533800 RCX: 0000000000000040
RDX: 0000000000000031 RSI: 0000000000000000 RDI: ffff88807af35b60
RBP: ffffc9000045f618 R08: 000000000000000a R09: 0000000000000001
R10: ffff88807b533828 R11: 0000000000000001 R12: 0000000000000000
R13: 0000000000000001 R14: 0000000000000000 R15: ffff888078d3c000
FS:  0000000000000000(0000) GS:ffff88807fd00000(0000) knlGS:0000000000000000
CS:  0010 DS: 0000 ES: 0000 CR0: 0000000080050033
CR2: 000055db93c6b2d8 CR3: 0000000078c43005 CR4: 0000000000760ee0
DR0: 0000000000000000 DR1: 0000000000000000 DR2: 0000000000000000
DR3: 0000000000000000 DR6: 00000000fffe0ff0 DR7: 0000000000000400
PKRU: 55555554


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
