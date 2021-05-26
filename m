Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DEE9F3910BB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 26 May 2021 08:30:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lln37-0001Ht-3i; Wed, 26 May 2021 06:29:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lln34-0001Hl-DJ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 06:29:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M6qvMRrZSaXWR0jWXHS5FogTAi2w+VL/Eeu3VqtxnsM=; b=Vo9sK743AcK3qfz0R7tiJkj/dj
 Jj/V9WqBIo0E1qONOMmBz2q61PavqBHNXycW0tPwTSJO7zR6oO6y55Anx/AL0r3GLC3NLoPNZ3hGA
 GAlLnVnQso0wxdjVebImjdwoYukTYBC9JVGxN5GYw7nek+Ek0KfdAhKlR4V9CEZUw/y4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=M6qvMRrZSaXWR0jWXHS5FogTAi2w+VL/Eeu3VqtxnsM=; b=m
 38dpmTSRCBPjaPxrmSdOOgqtIv6q4yfnJIx0UptOGHc5sbl2BquqIDI3EwjO/hqi/O+tLcQg/FNz3
 40XKlTuJ0oLYIQb+xpFkQEEBe0GOPPvs7d0IGuVt3syqiz2vNTKDnGsWUcCmCOuV/lXxMrdI48jsF
 NbVsVdNa7H95C1Y0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lln2y-006BUM-3E
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 26 May 2021 06:29:48 +0000
Received: from dggems701-chm.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fqgvg38y7z1BQvW;
 Wed, 26 May 2021 14:26:39 +0800 (CST)
Received: from dggemx753-chm.china.huawei.com (10.0.44.37) by
 dggems701-chm.china.huawei.com (10.3.19.178) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.1.2176.2; Wed, 26 May 2021 14:29:31 +0800
Received: from szvp000207684.huawei.com (10.120.216.130) by
 dggemx753-chm.china.huawei.com (10.0.44.37) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id
 15.1.2176.2; Wed, 26 May 2021 14:29:30 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 26 May 2021 14:29:26 +0800
Message-ID: <20210526062927.52629-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 dggemx753-chm.china.huawei.com (10.0.44.37)
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lln2y-006BUM-3E
Subject: [f2fs-dev] [PATCH 1/2] f2fs: swap: remove dead codes
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

After commit af4b6b8edf6a ("f2fs: introduce check_swap_activate_fast()"),
we will never run into original logic of check_swap_activate() before
f2fs supports non 4k-sized page, so let's delete those dead codes.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 171 +------------------------------------------------
 1 file changed, 3 insertions(+), 168 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3058c7e28b11..9c23fde93b76 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3830,67 +3830,7 @@ int f2fs_migrate_page(struct address_space *mapping,
 #endif
 
 #ifdef CONFIG_SWAP
-static int f2fs_is_file_aligned(struct inode *inode)
-{
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	block_t main_blkaddr = SM_I(sbi)->main_blkaddr;
-	block_t cur_lblock;
-	block_t last_lblock;
-	block_t pblock;
-	unsigned long nr_pblocks;
-	unsigned int blocks_per_sec = BLKS_PER_SEC(sbi);
-	unsigned int not_aligned = 0;
-	int ret = 0;
-
-	cur_lblock = 0;
-	last_lblock = bytes_to_blks(inode, i_size_read(inode));
-
-	while (cur_lblock < last_lblock) {
-		struct f2fs_map_blocks map;
-
-		memset(&map, 0, sizeof(map));
-		map.m_lblk = cur_lblock;
-		map.m_len = last_lblock - cur_lblock;
-		map.m_next_pgofs = NULL;
-		map.m_next_extent = NULL;
-		map.m_seg_type = NO_CHECK_TYPE;
-		map.m_may_create = false;
-
-		ret = f2fs_map_blocks(inode, &map, 0, F2FS_GET_BLOCK_FIEMAP);
-		if (ret)
-			goto out;
-
-		/* hole */
-		if (!(map.m_flags & F2FS_MAP_FLAGS)) {
-			f2fs_err(sbi, "Swapfile has holes\n");
-			ret = -ENOENT;
-			goto out;
-		}
-
-		pblock = map.m_pblk;
-		nr_pblocks = map.m_len;
-
-		if ((pblock - main_blkaddr) & (blocks_per_sec - 1) ||
-			nr_pblocks & (blocks_per_sec - 1)) {
-			if (f2fs_is_pinned_file(inode)) {
-				f2fs_err(sbi, "Swapfile does not align to section");
-				ret = -EINVAL;
-				goto out;
-			}
-			not_aligned++;
-		}
-
-		cur_lblock += nr_pblocks;
-	}
-	if (not_aligned)
-		f2fs_warn(sbi, "Swapfile (%u) is not align to section: \n"
-			"\t1) creat(), 2) ioctl(F2FS_IOC_SET_PIN_FILE), 3) fallocate()",
-			not_aligned);
-out:
-	return ret;
-}
-
-static int check_swap_activate_fast(struct swap_info_struct *sis,
+static int check_swap_activate(struct swap_info_struct *sis,
 				struct file *swap_file, sector_t *span)
 {
 	struct address_space *mapping = swap_file->f_mapping;
@@ -3907,6 +3847,8 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	unsigned int not_aligned = 0;
 	int ret = 0;
 
+	f2fs_bug_on(sbi, PAGE_SIZE != F2FS_BLKSIZE);
+
 	/*
 	 * Map all the blocks into the extent list.  This code doesn't try
 	 * to be very smart.
@@ -3986,113 +3928,6 @@ static int check_swap_activate_fast(struct swap_info_struct *sis,
 	return ret;
 }
 
-/* Copied from generic_swapfile_activate() to check any holes */
-static int check_swap_activate(struct swap_info_struct *sis,
-				struct file *swap_file, sector_t *span)
-{
-	struct address_space *mapping = swap_file->f_mapping;
-	struct inode *inode = mapping->host;
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	unsigned blocks_per_page;
-	unsigned long page_no;
-	sector_t probe_block;
-	sector_t last_block;
-	sector_t lowest_block = -1;
-	sector_t highest_block = 0;
-	int nr_extents = 0;
-	int ret = 0;
-
-	if (PAGE_SIZE == F2FS_BLKSIZE)
-		return check_swap_activate_fast(sis, swap_file, span);
-
-	ret = f2fs_is_file_aligned(inode);
-	if (ret)
-		goto out;
-
-	blocks_per_page = bytes_to_blks(inode, PAGE_SIZE);
-
-	/*
-	 * Map all the blocks into the extent list.  This code doesn't try
-	 * to be very smart.
-	 */
-	probe_block = 0;
-	page_no = 0;
-	last_block = bytes_to_blks(inode, i_size_read(inode));
-	while ((probe_block + blocks_per_page) <= last_block &&
-			page_no < sis->max) {
-		unsigned block_in_page;
-		sector_t first_block;
-		sector_t block = 0;
-
-		cond_resched();
-
-		block = probe_block;
-		ret = bmap(inode, &block);
-		if (ret)
-			goto out;
-		if (!block)
-			goto bad_bmap;
-		first_block = block;
-
-		/*
-		 * It must be PAGE_SIZE aligned on-disk
-		 */
-		if (first_block & (blocks_per_page - 1)) {
-			probe_block++;
-			goto reprobe;
-		}
-
-		for (block_in_page = 1; block_in_page < blocks_per_page;
-					block_in_page++) {
-
-			block = probe_block + block_in_page;
-			ret = bmap(inode, &block);
-			if (ret)
-				goto out;
-			if (!block)
-				goto bad_bmap;
-
-			if (block != first_block + block_in_page) {
-				/* Discontiguity */
-				probe_block++;
-				goto reprobe;
-			}
-		}
-
-		first_block >>= (PAGE_SHIFT - inode->i_blkbits);
-		if (page_no) {	/* exclude the header page */
-			if (first_block < lowest_block)
-				lowest_block = first_block;
-			if (first_block > highest_block)
-				highest_block = first_block;
-		}
-
-		/*
-		 * We found a PAGE_SIZE-length, PAGE_SIZE-aligned run of blocks
-		 */
-		ret = add_swap_extent(sis, page_no, 1, first_block);
-		if (ret < 0)
-			goto out;
-		nr_extents += ret;
-		page_no++;
-		probe_block += blocks_per_page;
-reprobe:
-		continue;
-	}
-	ret = nr_extents;
-	*span = 1 + highest_block - lowest_block;
-	if (page_no == 0)
-		page_no = 1;	/* force Empty message */
-	sis->max = page_no;
-	sis->pages = page_no - 1;
-	sis->highest_bit = page_no - 1;
-out:
-	return ret;
-bad_bmap:
-	f2fs_err(sbi, "Swapfile has holes\n");
-	return -EINVAL;
-}
-
 static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 				sector_t *span)
 {
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
