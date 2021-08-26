Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F7F43F804A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 26 Aug 2021 04:03:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mJ4jr-0004Cu-8N; Thu, 26 Aug 2021 02:03:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mJ4jp-0004Ch-S8
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Aug 2021 02:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gJohtL3iKHwPERaojKuLQ2vmp+dW350PgYUzloeHUp4=; b=hgWDe2MBffypLHVYrewkMv+Gka
 VMM3iv/F7umEmDxozK7ei3qHebFAaKSKxUYDoNPfkujLNUp8J8T08e1a/cLmxxAIOrJraQ2XcOX7U
 UR31zRjbTue/kqhhtmyEodoXX3o8qC1fnWYRU76cjr+3GrPscbMHgYTfkw3VjInb4pkE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=gJohtL3iKHwPERaojKuLQ2vmp+dW350PgYUzloeHUp4=; b=J
 lZrd0cuYwW+oOdzvvzz9mfqAUTA3tif4PLilCnqRJrY3/CfH3O/guMhZ5byi4Wsf7BBDaZOWnuKhU
 nN3gOAPk4Ga1PKF9rw1kDLjU3Ki55uTU93r3v0PcR2PmMuzsv3xROH3CEy0ZgHgB0douOpU4I8mQX
 2JdygzUROI2yleHY=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mJ4jo-00018E-KL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 26 Aug 2021 02:03:29 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0E96460F5C;
 Thu, 26 Aug 2021 02:03:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1629943403;
 bh=/e7s8OHhSJWB06eMdrxjfFecme8EyMtS8cI5Ew9WuX8=;
 h=From:To:Cc:Subject:Date:From;
 b=HGtn92z8/PNNaHuSsUgeUxMJW3B2l3O6tP4it/rTNaT+8/vh7vhX/gCluuViBGrWZ
 5cOpf0EtXLqcgP0dBbIETMTVwYQnTzobh5EtSx6ZKjUtxzPyXiuE28xgzBf7MBKFZ9
 2yezHlTcuW6FE0tfKn2a5AlyZms+SUXHHQLS0a4K/IIfQl6rafM0l2mt+MLJ+h92ba
 RsODULdl7FvrKhm8VbR5tpGNsv/MgHOZa4a/4cIueRn9dKkRSKBtxCEuuENy6i9hQl
 6LnskCM/yOzp5BFgO5IJjFcijj0fxT56XnMFKvyCv9IpLImC930kIag7G85fEeQZJF
 Cg4OaJaXFZGfw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 26 Aug 2021 10:03:15 +0800
Message-Id: <20210826020315.9032-1-chao@kernel.org>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Spam-Score: -1.6 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.8 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mJ4jo-00018E-KL
Subject: [f2fs-dev] [PATCH] f2fs: fix unexpected ENOENT comes from
 f2fs_map_blocks()
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In below path, it will return ENOENT if filesystem is shutdown:

- f2fs_map_blocks
 - f2fs_get_dnode_of_data
  - f2fs_get_node_page
   - __get_node_page
    - read_node_page
     - is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)
       return -ENOENT
 - force return value from ENOENT to 0

It should be fine for read case, since it indicates a hole condition,
and caller could use .m_next_pgofs to skip the hole and continue the
lookup.

However it may cause confusing for write case, since leaving a hole
there, and said nothing was wrong doesn't help.

There is at least one case from dax_iomap_actor() will complain that,
so fix this in prior to supporting dax in f2fs.

xfstest generic/388 reports below warning:

ubuntu godown: xfstests-induced forced shutdown of /mnt/scratch_f2fs:
------------[ cut here ]------------
WARNING: CPU: 0 PID: 485833 at fs/dax.c:1127 dax_iomap_actor+0x339/0x370
Call Trace:
 iomap_apply+0x1c4/0x7b0
 ? dax_iomap_rw+0x1c0/0x1c0
 dax_iomap_rw+0xad/0x1c0
 ? dax_iomap_rw+0x1c0/0x1c0
 f2fs_file_write_iter+0x5ab/0x970 [f2fs]
 do_iter_readv_writev+0x273/0x2e0
 do_iter_write+0xab/0x1f0
 vfs_iter_write+0x21/0x40
 iter_file_splice_write+0x287/0x540
 do_splice+0x37c/0xa60
 __x64_sys_splice+0x15f/0x3a0
 do_syscall_64+0x3b/0x90
 entry_SYSCALL_64_after_hwframe+0x44/0xae

ubuntu godown: xfstests-induced forced shutdown of /mnt/scratch_f2fs:
------------[ cut here ]------------
RIP: 0010:dax_iomap_pte_fault.isra.0+0x72e/0x14a0
Call Trace:
 dax_iomap_fault+0x44/0x70
 f2fs_dax_huge_fault+0x155/0x400 [f2fs]
 f2fs_dax_fault+0x18/0x30 [f2fs]
 __do_fault+0x4e/0x120
 do_fault+0x3cf/0x7a0
 __handle_mm_fault+0xa8c/0xf20
 ? find_held_lock+0x39/0xd0
 handle_mm_fault+0x1b6/0x480
 do_user_addr_fault+0x320/0xcd0
 ? rcu_read_lock_sched_held+0x67/0xc0
 exc_page_fault+0x77/0x3f0
 ? asm_exc_page_fault+0x8/0x30
 asm_exc_page_fault+0x1e/0x30

Fixes: 83a3bfdb5a8a ("f2fs: indicate shutdown f2fs to allow unmount successfully")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5e4120b92f59..8e8824605f83 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1504,7 +1504,21 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 	if (err) {
 		if (flag == F2FS_GET_BLOCK_BMAP)
 			map->m_pblk = 0;
+
 		if (err == -ENOENT) {
+			/*
+			 * There is one exceptional case that read_node_page()
+			 * may return -ENOENT due to filesystem has been
+			 * shutdown or cp_error, so force to convert error
+			 * number to EIO for such case.
+			 */
+			if (map->m_may_create &&
+				(is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN) ||
+				f2fs_cp_error(sbi))) {
+				err = -EIO;
+				goto unlock_out;
+			}
+
 			err = 0;
 			if (map->m_next_pgofs)
 				*map->m_next_pgofs =
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
