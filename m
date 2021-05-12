Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 74EA637B9B1
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 May 2021 11:53:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lglYU-0002Us-Lh; Wed, 12 May 2021 09:53:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lglYS-0002UL-KM
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 09:53:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xSNHWFHaDPvKcOBXzDZgmP5NxxBOq0ecReOdawmsSjc=; b=PzXAT6X20ftUPG5fKLNQkZMK6b
 /s6NrTkOTDrW3bBosTDRnFmZA3XSrw3yYLCPvfVyg1Bi1dt0tj0gl/mS7Xi20D1k5yEVkkbc4Qimv
 69yn54AIDR1TalF4LOj2GO6yD98JqhAS29yMg6MguUpZcoS3mC8c6nV9uwpI9yttc6lo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xSNHWFHaDPvKcOBXzDZgmP5NxxBOq0ecReOdawmsSjc=; b=H0kNKZimcRIix+rvRyitE3dv8K
 0mUZrbA7lem6hr8zhd9GETnVHi928XrkcrXhqb6kynzTTyRMTmjKIZJpgz1YDtHL4xhG5AKVzvM10
 QNQNbYw+UnJTwccHcTjnknP6xW1yo/lAVWGdPExjNW9lyyJ1dlkGyNpE8Q99Va1aXT+Y=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lglYM-0006bk-Vf
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 12 May 2021 09:53:24 +0000
Received: from DGGEMS402-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4Fg94Y191RzqTV6;
 Wed, 12 May 2021 17:49:49 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS402-HUB.china.huawei.com (10.3.19.202) with Microsoft SMTP Server id
 14.3.498.0; Wed, 12 May 2021 17:53:04 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 12 May 2021 17:52:57 +0800
Message-ID: <20210512095258.96918-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20210512095258.96918-1-yuchao0@huawei.com>
References: <20210512095258.96918-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lglYM-0006bk-Vf
Subject: [f2fs-dev] [PATCH 2/3] f2fs: compress: clean up parameter of
 __f2fs_cluster_blocks()
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

Previously, in order to reuse __f2fs_cluster_blocks(),
f2fs_is_compressed_cluster() assigned a compress_ctx type variable,
which is used to pass few parameters (cc.inode, cc.cluster_size,
cc.cluster_idx), it's wasteful to allocate such large space in stack.

Let's clean up parameters of __f2fs_cluster_blocks() to avoid that.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 33 +++++++++++++--------------------
 1 file changed, 13 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 8bb9e57a6db8..b6bd6862eef2 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -898,14 +898,17 @@ static bool cluster_has_invalid_data(struct compress_ctx *cc)
 	return false;
 }
 
-static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
+static int __f2fs_cluster_blocks(struct inode *inode,
+				unsigned int cluster_idx, bool compr)
 {
 	struct dnode_of_data dn;
+	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	unsigned int start_idx = cluster_idx <<
+				F2FS_I(inode)->i_log_cluster_size;
 	int ret;
 
-	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
-	ret = f2fs_get_dnode_of_data(&dn, start_idx_of_cluster(cc),
-							LOOKUP_NODE);
+	set_new_dnode(&dn, inode, NULL, NULL, 0);
+	ret = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
 	if (ret) {
 		if (ret == -ENOENT)
 			ret = 0;
@@ -916,7 +919,7 @@ static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
 		int i;
 
 		ret = 1;
-		for (i = 1; i < cc->cluster_size; i++) {
+		for (i = 1; i < cluster_size; i++) {
 			block_t blkaddr;
 
 			blkaddr = data_blkaddr(dn.inode,
@@ -938,25 +941,15 @@ static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
 /* return # of compressed blocks in compressed cluster */
 static int f2fs_compressed_blocks(struct compress_ctx *cc)
 {
-	return __f2fs_cluster_blocks(cc, true);
+	return __f2fs_cluster_blocks(cc->inode, cc->cluster_idx, true);
 }
 
 /* return # of valid blocks in compressed cluster */
-static int f2fs_cluster_blocks(struct compress_ctx *cc)
-{
-	return __f2fs_cluster_blocks(cc, false);
-}
-
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 {
-	struct compress_ctx cc = {
-		.inode = inode,
-		.log_cluster_size = F2FS_I(inode)->i_log_cluster_size,
-		.cluster_size = F2FS_I(inode)->i_cluster_size,
-		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
-	};
-
-	return f2fs_cluster_blocks(&cc);
+	return __f2fs_cluster_blocks(inode,
+		index >> F2FS_I(inode)->i_log_cluster_size,
+		false);
 }
 
 static bool cluster_may_compress(struct compress_ctx *cc)
@@ -1007,7 +1000,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	bool prealloc;
 
 retry:
-	ret = f2fs_cluster_blocks(cc);
+	ret = f2fs_is_compressed_cluster(cc->inode, start_idx);
 	if (ret <= 0)
 		return ret;
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
