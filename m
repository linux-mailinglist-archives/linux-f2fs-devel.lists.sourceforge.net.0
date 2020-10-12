Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB6A728B11A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Oct 2020 11:07:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kRtnT-0006dR-4O; Mon, 12 Oct 2020 09:07:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kRtnR-0006dG-Mj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 09:07:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IbTwFvh4btZA2jqhyMous99GZvAzQBjQPpomixRCmyU=; b=VtK1/R+IaaJiQpI0V+2Lq6/OQD
 DIlNTzQLFuu4bfepqKfVSLU+c5UgKJRfWoXaz85Y3ukDQUoqfNJJ6K9lrsbHMDy9aOL5SrnU7LQgM
 pra7P21Nya3J9KVFuShk4uPxFo0Tv645/84SDzD+6CnjMBc1pYmOqvf1RmVQv3P4Tb/A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=IbTwFvh4btZA2jqhyMous99GZvAzQBjQPpomixRCmyU=; b=P
 Nt3vP0xxyVE4cqZ8gkPH2b1iW8Nnt2/6FG9TSxWjlJC484gYaINmJdjlWedG2H+Y/eYfmCtfPcdAE
 vWU9qAoyqWRzR6LmiaBquSESWhLhRoHurJbbn9IfZtFKwlPZ3LRB2/qQPbBdn8YFz5BcJJ+1USKuf
 9yUQtD3ZprVCHnFE=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kRtnJ-00Bspo-2S
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Oct 2020 09:07:09 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 80AB1FCFC1F4BC6F89CA;
 Mon, 12 Oct 2020 17:06:47 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.487.0; Mon, 12 Oct 2020 17:06:40 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 12 Oct 2020 17:06:05 +0800
Message-ID: <20201012090605.30604-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kRtnJ-00Bspo-2S
Subject: [f2fs-dev] [PATCH] f2fs: introduce check_swap_activate_fast()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

check_swap_activate() will lookup block mapping via bmap() one by one, so
its performance is very bad, this patch introduces check_swap_activate_fast()
to use f2fs_fiemap() to boost this process, since f2fs_fiemap() will lookup
block mappings in batch, therefore, it can improve swapon()'s performance
significantly.

Note that this enhancement only works when page size is equal to f2fs' block
size.

Testcase: (backend device: zram)
- touch file
- pin & fallocate file to 8GB
- mkswap file
- swapon file

Before:
real	0m2.999s
user	0m0.000s
sys	0m2.980s

After:
real	0m0.081s
user	0m0.000s
sys	0m0.064s

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 80 ++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ee87407602fa..be4da52604ed 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3883,6 +3883,83 @@ int f2fs_migrate_page(struct address_space *mapping,
 #endif
 
 #ifdef CONFIG_SWAP
+static int check_swap_activate_fast(struct swap_info_struct *sis,
+				struct file *swap_file, sector_t *span)
+{
+	struct address_space *mapping = swap_file->f_mapping;
+	struct inode *inode = mapping->host;
+	sector_t cur_lblock;
+	sector_t last_lblock;
+	sector_t pblock;
+	sector_t lowest_pblock = -1;
+	sector_t highest_pblock = 0;
+	int nr_extents = 0;
+	unsigned long nr_pblocks;
+	unsigned long len;
+	int ret;
+
+	/*
+	 * Map all the blocks into the extent list.  This code doesn't try
+	 * to be very smart.
+	 */
+	cur_lblock = 0;
+	last_lblock = logical_to_blk(inode, i_size_read(inode));
+	len = i_size_read(inode);
+
+	while (cur_lblock <= last_lblock && cur_lblock < sis->max) {
+		struct buffer_head map_bh;
+		pgoff_t next_pgofs;
+
+		cond_resched();
+
+		memset(&map_bh, 0, sizeof(struct buffer_head));
+		map_bh.b_size = len - cur_lblock;
+
+		ret = get_data_block(inode, cur_lblock, &map_bh, 0,
+					F2FS_GET_BLOCK_FIEMAP, &next_pgofs);
+		if (ret)
+			goto err_out;
+
+		/* hole */
+		if (!buffer_mapped(&map_bh))
+			goto err_out;
+
+		pblock = map_bh.b_blocknr;
+		nr_pblocks = logical_to_blk(inode, map_bh.b_size);
+
+		if (cur_lblock + nr_pblocks >= sis->max)
+			nr_pblocks = sis->max - cur_lblock;
+
+		if (cur_lblock) {	/* exclude the header page */
+			if (pblock < lowest_pblock)
+				lowest_pblock = pblock;
+			if (pblock + nr_pblocks - 1 > highest_pblock)
+				highest_pblock = pblock + nr_pblocks - 1;
+		}
+
+		/*
+		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
+		 */
+		ret = add_swap_extent(sis, cur_lblock, nr_pblocks, pblock);
+		if (ret < 0)
+			goto out;
+		nr_extents += ret;
+		cur_lblock += nr_pblocks;
+	}
+	ret = nr_extents;
+	*span = 1 + highest_pblock - lowest_pblock;
+	if (cur_lblock == 0)
+		cur_lblock = 1;	/* force Empty message */
+	sis->max = cur_lblock;
+	sis->pages = cur_lblock - 1;
+	sis->highest_bit = cur_lblock - 1;
+out:
+	return ret;
+err_out:
+	pr_err("swapon: swapfile has holes\n");
+	return -EINVAL;
+}
+
 /* Copied from generic_swapfile_activate() to check any holes */
 static int check_swap_activate(struct swap_info_struct *sis,
 				struct file *swap_file, sector_t *span)
@@ -3899,6 +3976,9 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	int nr_extents = 0;
 	int ret;
 
+	if (PAGE_SIZE == F2FS_BLKSIZE)
+		return check_swap_activate_fast(sis, swap_file, span);
+
 	blkbits = inode->i_blkbits;
 	blocks_per_page = PAGE_SIZE >> blkbits;
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
