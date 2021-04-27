Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CDED736BDA4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 05:08:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbE55-0007M9-1A; Tue, 27 Apr 2021 03:08:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <yuchao0@huawei.com>) id 1lbE53-0007M1-D1
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 03:08:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MHtI8cEQTGy2MR1BfzFTTEqGVJ7qWEabiGwueCQ1AR0=; b=N9hiGojLUhgmEWJoRTnUxrR/NF
 1tc3LWhXoRuDioEjXEY8RbRPcjUwYurtljY0omR7pJ3QMU2SaqylwIZslXEWEc8GUFBGhlHepz7YK
 SaXQerqYKUq7H+S7bKNKdtRmf5bw/WgzimCUb1nEIyfSjZYtZ+AtqAKcRDCnAC4xa9Js=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MHtI8cEQTGy2MR1BfzFTTEqGVJ7qWEabiGwueCQ1AR0=; b=S
 xNlInY7zymlSPyyfY0d5il24D5J+JAcAk3Sclcdcusl6mmJ/kFvYZdsS5HqxdPnYn5AFql6ln59wL
 ahDS6uRzDKFP1P/LqoT14FHBIe+Im6bvulWY1L5dm414x8bgJD2OEjIR7xlE/v7lZ84MHNyau6ixF
 6L834V//JCDv577Y=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lbE4o-00F0NN-AR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Apr 2021 03:08:09 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4FTmph64zqzvTF3;
 Tue, 27 Apr 2021 11:05:16 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Tue, 27 Apr 2021 11:07:34 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 27 Apr 2021 11:07:30 +0800
Message-ID: <20210427030730.90331-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lbE4o-00F0NN-AR
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: remove unneed check condition
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

This patch changes as below:
- remove unneeded check condition in __cluster_may_compress()
- rename __cluster_may_compress() to cluster_has_invalid_data() for
better readability
- add cp_error check in f2fs_write_compressed_pages() like we did
in f2fs_write_single_data_page()

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v2:
- rename function for better readability
- add cp_error check in f2fs_write_compressed_pages()
 fs/f2fs/compress.c | 22 +++++++++++-----------
 1 file changed, 11 insertions(+), 11 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6e46a00c1930..53f78befed8f 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -888,9 +888,8 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 	return is_page_in_cluster(cc, index);
 }
 
-static bool __cluster_may_compress(struct compress_ctx *cc)
+static bool cluster_has_invalid_data(struct compress_ctx *cc)
 {
-	struct f2fs_sb_info *sbi = F2FS_I_SB(cc->inode);
 	loff_t i_size = i_size_read(cc->inode);
 	unsigned nr_pages = DIV_ROUND_UP(i_size, PAGE_SIZE);
 	int i;
@@ -898,18 +897,13 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
 	for (i = 0; i < cc->cluster_size; i++) {
 		struct page *page = cc->rpages[i];
 
-		f2fs_bug_on(sbi, !page);
-
-		if (unlikely(f2fs_cp_error(sbi)))
-			return false;
-		if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
-			return false;
+		f2fs_bug_on(F2FS_I_SB(cc->inode), !page);
 
 		/* beyond EOF */
 		if (page->index >= nr_pages)
-			return false;
+			return true;
 	}
-	return true;
+	return false;
 }
 
 static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
@@ -985,7 +979,7 @@ static bool cluster_may_compress(struct compress_ctx *cc)
 		return false;
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(cc->inode))))
 		return false;
-	return __cluster_may_compress(cc);
+	return !cluster_has_invalid_data(cc);
 }
 
 static void set_cluster_writeback(struct compress_ctx *cc)
@@ -1232,6 +1226,12 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	loff_t psize;
 	int i, err;
 
+	/* we should bypass data pages to proceed the kworkder jobs */
+	if (unlikely(f2fs_cp_error(sbi))) {
+		mapping_set_error(cc->rpages[0]->mapping, -EIO);
+		goto out_free;
+	}
+
 	if (IS_NOQUOTA(inode)) {
 		/*
 		 * We need to wait for node_write to avoid block allocation during
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
