Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD81C877D2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Aug 2019 12:53:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hw2WW-0003rq-Jk; Fri, 09 Aug 2019 10:53:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1hw2WV-0003rd-QN
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XS+Y7DTVWikZWe0+AZi1VgaQS08HNEQ8dfFbPtF6bhM=; b=PVU2dOZcA8GQRLFG0YI+hrkyiE
 7DjjoznW3rIbAWq8AthQcRrqWEGoPxk9bEOVp8UwAae0syUVOI8FaJvWQVCuXgbaA1DO4V4MiNftV
 oKLRoKPNBgLdLSym9OvvQbxALhXc+fiXezfl0C6QEazHFTLo/5qJA8ADekVqZ158HAQA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XS+Y7DTVWikZWe0+AZi1VgaQS08HNEQ8dfFbPtF6bhM=; b=Dz1mw+5O2rxbwb1AsLZbLJQ7Og
 4aq6oPdPFQd7vSOAHMxuPl3OUiUmyB//OGqrw+L/44L/1NllV48Kt5oTQHBbc5biNnx3FkYnxb3Z6
 WOjdIS1DjSBGjcE5HOFOberBsG01S2+ZnRbOAhXa7uWEbNqWL7bgLVzmYvEkNayQ0eLs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hw2WT-00HEey-MY
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 09 Aug 2019 10:53:27 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 032981E164D2ACB37670;
 Fri,  9 Aug 2019 18:53:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.439.0; Fri, 9 Aug 2019 18:53:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 9 Aug 2019 18:52:55 +0800
Message-ID: <20190809105302.79876-3-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20190809105302.79876-1-yuchao0@huawei.com>
References: <20190809105302.79876-1-yuchao0@huawei.com>
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
X-Headers-End: 1hw2WT-00HEey-MY
Subject: [f2fs-dev] [PATCH 03/10] f2fs-tools: allocate memory in batch in
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Like we did in kernel, allocating memory in batch will be more
efficient.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fsck/f2fs.h  |  1 +
 fsck/mount.c | 28 ++++++++++++++++------------
 2 files changed, 17 insertions(+), 12 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index a52b5d4..6fc0bf3 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -82,6 +82,7 @@ struct sit_info {
 	block_t sit_base_addr;          /* start block address of SIT area */
 	block_t sit_blocks;             /* # of blocks used by SIT area */
 	block_t written_valid_blocks;   /* # of valid blocks in main area */
+	unsigned char *bitmap;		/* all bitmaps pointer */
 	char *sit_bitmap;               /* SIT bitmap pointer */
 	unsigned int bitmap_size;       /* SIT bitmap size */
 
diff --git a/fsck/mount.c b/fsck/mount.c
index af7149e..bed22d5 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1404,6 +1404,7 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 	unsigned int sit_segs;
 	int start;
 	char *src_bitmap, *dst_bitmap;
+	unsigned char *bitmap;
 	unsigned int bitmap_size;
 
 	sit_i = malloc(sizeof(struct sit_info));
@@ -1420,13 +1421,19 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 		goto free_sit_info;
 	}
 
+	bitmap_size = TOTAL_SEGS(sbi) * SIT_VBLOCK_MAP_SIZE;
+
+	sit_i->bitmap = calloc(bitmap_size, 1);
+	if (!sit_i->bitmap) {
+		MSG(1, "\tError: Calloc failed for build_sit_info!!\n");
+		goto free_sentries;
+	}
+
+	bitmap = sit_i->bitmap;
+
 	for (start = 0; start < TOTAL_SEGS(sbi); start++) {
-		sit_i->sentries[start].cur_valid_map
-			= calloc(SIT_VBLOCK_MAP_SIZE, 1);
-		if (!sit_i->sentries[start].cur_valid_map) {
-			MSG(1, "\tError: Calloc failed for build_sit_info!!\n");
-			goto free_validity_maps;
-		}
+		sit_i->sentries[start].cur_valid_map = bitmap;
+		bitmap += SIT_VBLOCK_MAP_SIZE;
 	}
 
 	sit_segs = get_sb(segment_count_sit) >> 1;
@@ -1452,10 +1459,9 @@ int build_sit_info(struct f2fs_sb_info *sbi)
 	return 0;
 
 free_validity_maps:
-	for (--start ; start >= 0; --start)
-		free(sit_i->sentries[start].cur_valid_map);
+	free(sit_i->bitmap);
+free_sentries:
 	free(sit_i->sentries);
-
 free_sit_info:
 	free(sit_i);
 
@@ -2913,9 +2919,7 @@ void f2fs_do_umount(struct f2fs_sb_info *sbi)
 	free(sbi->nm_info);
 
 	/* free sit_info */
-	for (i = 0; i < TOTAL_SEGS(sbi); i++)
-		free(sit_i->sentries[i].cur_valid_map);
-
+	free(sit_i->bitmap);
 	free(sit_i->sit_bitmap);
 	free(sit_i->sentries);
 	free(sm_i->sit_info);
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
