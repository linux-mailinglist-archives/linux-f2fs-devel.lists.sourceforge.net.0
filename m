Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 026735F46F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2019 10:17:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hiww1-0006FU-UU; Thu, 04 Jul 2019 08:17:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hiww1-0006FO-7w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 08:17:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OoJT6k5DOV5H4GwAmpxtMhrUIoqXSQ/7z5cAxlQ+DzI=; b=Ly8uUJUskbILjadhxvL6gzhv1Q
 zzmW+c0M7zAnZi4LxsYZcNhj0pGAxhMEl6+vpVBZDNFzHI9G9PcNVqVOeRrEg8EsGjvhIYYG8D8dv
 emyUGI6jSdMmT00fOMSD6IDJlaulTxbajeXtrlC3T04Yedcdr9m6hHQVD+P2SqYYB8NI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OoJT6k5DOV5H4GwAmpxtMhrUIoqXSQ/7z5cAxlQ+DzI=; b=Q
 ZRtyP/hFJC4a8K6S6loUR7fiWzJR/jlovjlp8OhGPAM1MC6G7WrxgB3TRKzbfIPGRylXivIEaU5qr
 jjmPrXGX+ZLLBIJJOSbzkiUEZeciyV0YkEmg2QzhUypG4BK/p2m8QUmKn2iTQdrhogUVKQCstuAku
 yATPvppREisw8RVo=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hiww9-005Nz2-H2
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 04 Jul 2019 08:17:51 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 29C5538450216D996387;
 Thu,  4 Jul 2019 16:17:41 +0800 (CST)
Received: from szvp000201624.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Thu, 4 Jul 2019 16:17:34 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 4 Jul 2019 16:17:30 +0800
Message-ID: <20190704081730.46414-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1hiww9-005Nz2-H2
Subject: [f2fs-dev] [PATCH] f2fs: allocate memory in batch in
 build_sit_info()
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

build_sit_info() allocate all bitmaps for each segment one by one,
it's quite low efficiency, this pach changes to allocate large
continuous memory at a time, and divide it and assign for each bitmaps
of segment. For large size image, it can expect improving its mount
speed.

Signed-off-by: Chen Gong <gongchen4@huawei.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 51 +++++++++++++++++++++--------------------------
 fs/f2fs/segment.h |  1 +
 2 files changed, 24 insertions(+), 28 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 402fbbbb2d7c..73c803af1f31 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3929,7 +3929,7 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *raw_super = F2FS_RAW_SUPER(sbi);
 	struct sit_info *sit_i;
 	unsigned int sit_segs, start;
-	char *src_bitmap;
+	char *src_bitmap, *bitmap;
 	unsigned int bitmap_size;
 
 	/* allocate memory for SIT information */
@@ -3950,27 +3950,31 @@ static int build_sit_info(struct f2fs_sb_info *sbi)
 	if (!sit_i->dirty_sentries_bitmap)
 		return -ENOMEM;
 
+#ifdef CONFIG_F2FS_CHECK_FS
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 4;
+#else
+	bitmap_size = MAIN_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE * 3;
+#endif
+	sit_i->bitmap = f2fs_kzalloc(sbi, bitmap_size, GFP_KERNEL);
+	if (!sit_i->bitmap)
+		return -ENOMEM;
+
+	bitmap = sit_i->bitmap;
+
 	for (start = 0; start < MAIN_SEGS(sbi); start++) {
-		sit_i->sentries[start].cur_valid_map
-			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
-		sit_i->sentries[start].ckpt_valid_map
-			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
-		if (!sit_i->sentries[start].cur_valid_map ||
-				!sit_i->sentries[start].ckpt_valid_map)
-			return -ENOMEM;
+		sit_i->sentries[start].cur_valid_map = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
+
+		sit_i->sentries[start].ckpt_valid_map = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
 
 #ifdef CONFIG_F2FS_CHECK_FS
-		sit_i->sentries[start].cur_valid_map_mir
-			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
-		if (!sit_i->sentries[start].cur_valid_map_mir)
-			return -ENOMEM;
+		sit_i->sentries[start].cur_valid_map_mir = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
 #endif
 
-		sit_i->sentries[start].discard_map
-			= f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE,
-							GFP_KERNEL);
-		if (!sit_i->sentries[start].discard_map)
-			return -ENOMEM;
+		sit_i->sentries[start].discard_map = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
 	}
 
 	sit_i->tmp_map = f2fs_kzalloc(sbi, SIT_VBLOCK_MAP_SIZE, GFP_KERNEL);
@@ -4440,21 +4444,12 @@ static void destroy_free_segmap(struct f2fs_sb_info *sbi)
 static void destroy_sit_info(struct f2fs_sb_info *sbi)
 {
 	struct sit_info *sit_i = SIT_I(sbi);
-	unsigned int start;
 
 	if (!sit_i)
 		return;
 
-	if (sit_i->sentries) {
-		for (start = 0; start < MAIN_SEGS(sbi); start++) {
-			kvfree(sit_i->sentries[start].cur_valid_map);
-#ifdef CONFIG_F2FS_CHECK_FS
-			kvfree(sit_i->sentries[start].cur_valid_map_mir);
-#endif
-			kvfree(sit_i->sentries[start].ckpt_valid_map);
-			kvfree(sit_i->sentries[start].discard_map);
-		}
-	}
+	if (sit_i->sentries)
+		kvfree(sit_i->bitmap);
 	kvfree(sit_i->tmp_map);
 
 	kvfree(sit_i->sentries);
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 2fd53462fa27..4d171b489130 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -226,6 +226,7 @@ struct sit_info {
 	block_t sit_base_addr;		/* start block address of SIT area */
 	block_t sit_blocks;		/* # of blocks used by SIT area */
 	block_t written_valid_blocks;	/* # of valid blocks in main area */
+	char *bitmap;			/* all bitmaps pointer */
 	char *sit_bitmap;		/* SIT bitmap pointer */
 #ifdef CONFIG_F2FS_CHECK_FS
 	char *sit_bitmap_mir;		/* SIT bitmap mirror */
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
