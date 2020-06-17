Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 602151FC9B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Jun 2020 11:21:44 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Cc:Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive
	:List-Unsubscribe:List-Id:Subject:Message-Id:Date:To:Sender:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=xecCwVksUX4Fn1F6J5A0J4WrAoR6X4O4rUxfIhUwn3M=; b=jqs9cD0XP8/cMi18nqp1Zo/MOH
	WzrZb61FdlPDxxh3V4P+OVfr4XjKqvCF+nc8nFQ23npSEacxB/Sb3eLdSl89squ9NzAP4umBLiPEW
	Q0Rq6xymE2+iJ2Y+UDMkWttTvm+C98SNOSvvRxMj67L5ILiyRrwQ8PJIayAqWGrRddBc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jlUGK-0005Ve-GS; Wed, 17 Jun 2020 09:21:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <zhaowuyun@wingtech.com>) id 1jlUGI-0005VG-NZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 09:21:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=RNhG+o/uNw1uZ3WZtuUzV9d/29L2mjjbo5SifCXr1hA=; b=EDvi4QaHkZpm8t/1cFiMUE+zJ0
 6+jdp+ToI+QW2OE0LySV+eB9fOs+caRRAs3R5na6wJlSD3TlPxNSFpOCIc/3Up6d0Sive988TL1yp
 oMTXjtU7CNLtq1h1tUfWtJPtMQJM6TdcB82UOVTo9hNRt3OUJdjQiutrRF+eRbJq2WhE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=RNhG+o/uNw1uZ3WZtuUzV9d/29L2mjjbo5SifCXr1hA=; b=MtY/9WIkV3HXZ+RO0RVOjnbRIT
 qKRjTyHUerpt1rJOUfx/uMkUYMcDTLdiOUmOkUu0fiX7asa9+gK/2CxUt2tpW/DRyfDT42hFH9YPN
 T/y4YpR5VovH62Yeupw0Yo3w+BkTtfgoZgnhtDibZlJNS0qryjOl1xUKRzxMX24QvZ7k=;
Received: from mx.wingtech.com ([180.166.216.14] helo=mail.wingtech.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-SHA:256) (Exim 4.92.2) id 1jlUGG-006dDp-Lq
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 17 Jun 2020 09:21:38 +0000
Received: from mx.wingtech.com ([192.168.2.43])
 by mail.wingtech.com  with SMTP id 05H94Moh022385-05H94Moi022385
 for <linux-f2fs-devel@lists.sourceforge.net>; Wed, 17 Jun 2020 17:04:22 +0800
Received: from 192.168.51.143 (HELO ZHAOWUYUN.WINGTECH.COM);
 Wed, 17 Jun 2020 17:04:19 +0800
To: jaegeuk@kernel.org, yuchao0@huawei.com
Date: Wed, 17 Jun 2020 17:04:19 +0800
Message-Id: <1592384659-20203-1-git-send-email-zhaowuyun@wingtech.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: wingtech.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 UNPARSEABLE_RELAY Informational: message has unparseable relay lines
X-Headers-End: 1jlUGG-006dDp-Lq
Subject: [f2fs-dev] [PATCH] f2fs: fix a race condition between
 f2fs_write_end_io and f2fs_del_fsync_node_entry
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
From: zhaowuyun--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhaowuyun@wingtech.com
Cc: zhaowuyun@wingtech.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Wuyun Zhao <zhaowuyun@wingtech.com>

Under some condition, the __write_node_page will submit a page which is not
f2fs_in_warm_node_list and will not call f2fs_add_fsync_node_entry.
f2fs_gc continue to run to invoke f2fs_iget -> do_read_inode to read the same node page
and set code node, which make f2fs_in_warm_node_list become true,
that will cause f2fs_bug_on in f2fs_del_fsync_node_entry when f2fs_write_end_io called.

[   34.966133] Call trace:
[   34.969902]  f2fs_del_fsync_node_entry+0x100/0x108
[   34.976071]  f2fs_write_end_io+0x1e0/0x288
[   34.981539]  bio_endio+0x248/0x270
[   34.986289]  blk_update_request+0x2b0/0x4d8
[   34.991841]  scsi_end_request+0x40/0x440
[   34.997126]  scsi_io_completion+0xa4/0x748
[   35.002593]  scsi_finish_command+0xdc/0x110
[   35.008143]  scsi_softirq_done+0x118/0x150
[   35.013610]  blk_done_softirq+0x8c/0xe8
[   35.018811]  __do_softirq+0x2e8/0x578
[   35.023828]  irq_exit+0xfc/0x120
[   35.028398]  handle_IPI+0x1d8/0x330
[   35.033233]  gic_handle_irq+0x110/0x1d4
[   35.038433]  el1_irq+0xb4/0x130
[   35.042917]  kmem_cache_alloc+0x3f0/0x418
[   35.048288]  radix_tree_node_alloc+0x50/0xf8
[   35.053933]  __radix_tree_create+0xf8/0x188
[   35.059484]  __radix_tree_insert+0x3c/0x128
[   35.065035]  add_gc_inode+0x90/0x118
[   35.069967]  f2fs_gc+0x1b80/0x2d70
[   35.074718]  f2fs_disable_checkpoint+0x94/0x1d0
[   35.080621]  f2fs_fill_super+0x10c4/0x1b88
[   35.086088]  mount_bdev+0x194/0x1e0
[   35.090923]  f2fs_mount+0x40/0x50
[   35.095589]  mount_fs+0xb4/0x190
[   35.100159]  vfs_kern_mount+0x80/0x1d8
[   35.105260]  do_mount+0x478/0xf18
[   35.109926]  ksys_mount+0x90/0xd0
[   35.114592]  __arm64_sys_mount+0x24/0x38

Signed-off-by: Wuyun Zhao <zhaowuyun@wingtech.com>
---
 fs/f2fs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index be6ac33..0df5c8c 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -402,6 +402,7 @@ static int do_read_inode(struct inode *inode)
 
 	/* try to recover cold bit for non-dir inode */
 	if (!S_ISDIR(inode->i_mode) && !is_cold_node(node_page)) {
+		f2fs_wait_on_page_writeback(node_page, NODE, true, true);
 		set_cold_node(node_page, false);
 		set_page_dirty(node_page);
 	}
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
