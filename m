Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94D4C198D51
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 31 Mar 2020 09:47:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jJBc1-0006h6-70; Tue, 31 Mar 2020 07:47:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jJBbz-0006go-9L
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 07:47:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m65wXxkYFVYW4ewyjKbRPPj4dm4dJEttX1aY9ia3vo0=; b=Dhb1gN6oXtodIE96g2asjklbtO
 RiB1fSkyYs6v+he9B12E+5b8eFKSDbeoPw5TzNrkXl9QEEv2MHaztER8ym4AkDydb01ceNyBzX4e+
 aE4UsJMJRTKS2LbmrVozxR9RGzGvAL0/vj7U6Plgy4ZkndaT2k9UITKAJhqIOOOlMjMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=m65wXxkYFVYW4ewyjKbRPPj4dm4dJEttX1aY9ia3vo0=; b=n
 Jf1FqwRuEzvsVR9/IH0L/emwONpSUGxKdRt2OAoRgiaCZXLVaSH/LkFzZnm5OGjVcQ55gUUJ6T1QK
 x48SywU0iv+g1bdKLQiLKBMquae+KkaVoZ8Ou7djh8WSio28U54JUCgboW5tFLD5+gsS3vQ4KL2DJ
 a6ckR9yklxlWFFS8=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jJBbt-00GWMP-Ul
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 31 Mar 2020 07:47:03 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 9AD01F0DF21D4FFBF467;
 Tue, 31 Mar 2020 15:46:47 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 31 Mar 2020 15:46:38 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 31 Mar 2020 15:46:28 +0800
Message-ID: <20200331074628.25325-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1jJBbt-00GWMP-Ul
Subject: [f2fs-dev] [PATCH v2] f2fs: use round_up()/DIV_ROUND_UP()
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

.i_cluster_size should be power of 2, so we can use round_up() instead
of roundup() to enhance the calculation.

In addition, use DIV_ROUND_UP to clean up codes.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- don't change blocksize to PAGE_SIZE
 fs/f2fs/data.c | 14 ++++++--------
 fs/f2fs/file.c | 17 +++++------------
 2 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 0a829a89f596..fea93719f14f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1969,8 +1969,7 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 					bool is_readahead)
 {
 	struct bio *bio = *bio_ret;
-	const unsigned blkbits = inode->i_blkbits;
-	const unsigned blocksize = 1 << blkbits;
+	const unsigned blocksize = 1 << inode->i_blkbits;
 	sector_t block_in_file;
 	sector_t last_block;
 	sector_t last_block_in_file;
@@ -1979,8 +1978,8 @@ static int f2fs_read_single_page(struct inode *inode, struct page *page,
 
 	block_in_file = (sector_t)page_index(page);
 	last_block = block_in_file + nr_pages;
-	last_block_in_file = (f2fs_readpage_limit(inode) + blocksize - 1) >>
-							blkbits;
+	last_block_in_file = DIV_ROUND_UP(f2fs_readpage_limit(inode),
+								blocksize);
 	if (last_block > last_block_in_file)
 		last_block = last_block_in_file;
 
@@ -2091,16 +2090,15 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	struct bio *bio = *bio_ret;
 	unsigned int start_idx = cc->cluster_idx << cc->log_cluster_size;
 	sector_t last_block_in_file;
-	const unsigned blkbits = inode->i_blkbits;
-	const unsigned blocksize = 1 << blkbits;
+	const unsigned blocksize = 1 << inode->i_blkbits;
 	struct decompress_io_ctx *dic = NULL;
 	int i;
 	int ret = 0;
 
 	f2fs_bug_on(sbi, f2fs_cluster_is_empty(cc));
 
-	last_block_in_file = (f2fs_readpage_limit(inode) +
-					blocksize - 1) >> blkbits;
+	last_block_in_file = DIV_ROUND_UP(f2fs_readpage_limit(inode),
+								blocksize);
 
 	/* get rid of pages beyond EOF */
 	for (i = 0; i < cc->cluster_size; i++) {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c2d38a1c4972..0f8be076620c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -736,16 +736,9 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	 * for compressed file, only support cluster size
 	 * aligned truncation.
 	 */
-	if (f2fs_compressed_file(inode)) {
-		size_t cluster_shift = PAGE_SHIFT +
-					F2FS_I(inode)->i_log_cluster_size;
-		size_t cluster_mask = (1 << cluster_shift) - 1;
-
-		free_from = from >> cluster_shift;
-		if (from & cluster_mask)
-			free_from++;
-		free_from <<= cluster_shift;
-	}
+	if (f2fs_compressed_file(inode))
+		free_from = round_up(from,
+				F2FS_I(inode)->i_cluster_size << PAGE_SHIFT);
 #endif
 
 	err = f2fs_do_truncate_blocks(inode, free_from, lock);
@@ -3537,7 +3530,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
-		count = roundup(count, F2FS_I(inode)->i_cluster_size);
+		count = round_up(count, F2FS_I(inode)->i_cluster_size);
 
 		ret = release_compress_blocks(&dn, count);
 
@@ -3689,7 +3682,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 
 		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
 		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
-		count = roundup(count, F2FS_I(inode)->i_cluster_size);
+		count = round_up(count, F2FS_I(inode)->i_cluster_size);
 
 		ret = reserve_compress_blocks(&dn, count);
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
