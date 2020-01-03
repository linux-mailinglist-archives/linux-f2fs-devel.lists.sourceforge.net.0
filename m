Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1958812F665
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  3 Jan 2020 10:51:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1inJcH-0004hG-Mt; Fri, 03 Jan 2020 09:51:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1inJcG-0004gs-3k
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 09:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=68YXLrrHvvrjwcMDkkjfMdhMxGBNpU7NDGv1QpSZd1g=; b=HvtSFmwaAWBzsFQwNluBuvyBMK
 y19dkaWEtJvvGOpXUTu2/ndVucKTqtjNA4ROVC1rzONZCiYsJpnr8tSQvb+Xu7pI7akM9/3VWwRja
 f31/qtGol7lV9Lzc+IvQ2zcRHDwJnD8jMYWXEYUKlXgPyWZIdzBCgVl1GdCr73qTIJF4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=68YXLrrHvvrjwcMDkkjfMdhMxGBNpU7NDGv1QpSZd1g=; b=L
 QtgNFikXynahweeNHaeBZVSIcXdHjktuxj6OY0ujAgOIM3+fQzLASXwe0Al6zunXIpZoxSrYURiNd
 xo3eqsMGE74363U7lZimrDEi7NttKghZAdFnbeK834VQjPxVOZuhp5scU5ileCdqH2MsW1AYQuHUz
 W1/QzkI3wBn9n6Vs=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1inJc8-007yrO-1q
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 03 Jan 2020 09:51:30 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id 8145DAB6D6BC0B2438A2;
 Fri,  3 Jan 2020 17:51:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.439.0; Fri, 3 Jan 2020 17:51:13 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 3 Jan 2020 17:51:07 +0800
Message-ID: <20200103095107.8152-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1inJc8-007yrO-1q
Subject: [f2fs-dev] [PATCH TEST] f2fs: compress: fix deadlock in
 prepare_compress_overwrite()
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

   100.00%    13.65%  fsstress  [f2fs]              [k] prepare_compress_overwrite
            |
            |--86.35%--prepare_compress_overwrite
            |          |
            |          |--46.78%--f2fs_read_multi_pages
            |          |          |
            |          |          |--19.81%--f2fs_decompress_end_io
            |          |          |          |
            |          |          |           --5.77%--unlock_page
            |          |          |
            |          |          |--19.53%--f2fs_get_dnode_of_data

In prepare_compress_overwrite(), we need to check cluster state before
read cluster data, otherwise, read normal cluster as a compressed one
will always cause failure and retry.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 23 +++++++++++++----------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9e8fba78db4d..f993b4ce1970 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -570,8 +570,7 @@ static void set_cluster_dirty(struct compress_ctx *cc)
 }
 
 static int prepare_compress_overwrite(struct compress_ctx *cc,
-		struct page **pagep, pgoff_t index, void **fsdata,
-		bool prealloc)
+		struct page **pagep, pgoff_t index, void **fsdata)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	struct address_space *mapping = cc->inode->i_mapping;
@@ -582,11 +581,20 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	unsigned int start_idx = start_idx_of_cluster(cc);
 	int i, idx;
 	int ret;
+	bool prealloc;
+
+retry:
+	ret = is_compressed_cluster(cc);
+	if (ret <= 0)
+		return ret;
+
+	/* compressed case */
+	prealloc = (ret == CLUSTER_HAS_SPACE);
 
 	ret = f2fs_init_compress_ctx(cc);
 	if (ret)
 		return ret;
-retry:
+
 	/* keep page reference to avoid page reclaim */
 	for (i = 0; i < cc->cluster_size; i++) {
 		page = f2fs_pagecache_get_page(mapping, start_idx + i,
@@ -632,6 +640,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 						(idx <= i) ? 1 : 0);
 				cc->rpages[idx] = NULL;
 			}
+			kvfree(cc->rpages);
 			cc->nr_rpages = 0;
 			goto retry;
 		}
@@ -687,14 +696,8 @@ int f2fs_prepare_compress_overwrite(struct inode *inode,
 		.rpages = NULL,
 		.nr_rpages = 0,
 	};
-	int ret = is_compressed_cluster(&cc);
-
-	if (ret <= 0)
-		return ret;
 
-	/* compressed case */
-	return prepare_compress_overwrite(&cc, pagep, index,
-			fsdata, ret == CLUSTER_HAS_SPACE);
+	return prepare_compress_overwrite(&cc, pagep, index, fsdata);
 }
 
 bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
