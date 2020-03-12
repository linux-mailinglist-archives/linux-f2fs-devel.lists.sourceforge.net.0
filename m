Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F98618271D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Mar 2020 03:46:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jCDr9-00062F-F3; Thu, 12 Mar 2020 02:45:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jCDr7-000628-PX
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 02:45:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JM79cRRoGeeNvrV9Yy9D1XjkLOPDG7HVII2aiWkOBl8=; b=UOy2CF/iY8+OdNECZ4EUxmjujK
 XTEIsxJ/unqPQyjSQrJJBl4yIAqLPu++jZ8s57oAE+iSRpkIS8dIjWkJuxAUFw72WuromqQQWGeLk
 AEv+J7oK2xRER0n917mP6h4XeJcScRsB9+eere+CyeCpfbEHx2dkO3Ng9JKuCQ9zG3Pk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JM79cRRoGeeNvrV9Yy9D1XjkLOPDG7HVII2aiWkOBl8=; b=N
 yf2M/A35xwmmkmTMQYRa93iIerPTkK97xRVXqsoAapMH3T9S7OZ5P2FQO0UZ5wXSU2BtBhr4XEjRJ
 mk9enQovsxuY2+4FvEWj7hO0n+eNmRptVKwgwwWSeQhx338F51airpaTzqYfzLwbaJf2bibFkISaD
 sSmH1Nl+X9Ikmyj4=;
Received: from szxga06-in.huawei.com ([45.249.212.32] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jCDr4-00GA49-JF
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Mar 2020 02:45:53 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id C9BC4A2E5D5E8479C3A3;
 Thu, 12 Mar 2020 10:45:42 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Thu, 12 Mar 2020 10:45:33 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 12 Mar 2020 10:45:29 +0800
Message-ID: <20200312024529.4668-1-yuchao0@huawei.com>
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
X-Headers-End: 1jCDr4-00GA49-JF
Subject: [f2fs-dev] [PATCH] f2fs: fix to account compressed blocks in
 f2fs_compressed_blocks()
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

por_fsstress reports inconsistent status in orphan inode, the root cause
of this is in f2fs_write_raw_pages() we decrease i_compr_blocks incorrectly
due to wrong calculation in f2fs_compressed_blocks().

So this patch exposes below two functions based on __f2fs_cluster_blocks:
- f2fs_compressed_blocks: get count of compressed blocks in compressed cluster
- f2fs_cluster_blocks: get count of valid blocks (including reserved blocks)
in compressed cluster.

Then use f2fs_compress_blocks() to get correct compressed blocks count in
f2fs_write_raw_pages().

sanity_check_inode: inode (ino=ad80) hash inconsistent i_compr_blocks:2, i_blocks:1, run fsck to fix

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 28 ++++++++++++++++++++++------
 1 file changed, 22 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 8a9691a1d1d5..744ce2eb6ca7 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -719,8 +719,7 @@ static bool __cluster_may_compress(struct compress_ctx *cc)
 	return true;
 }
 
-/* return # of compressed block addresses */
-static int f2fs_compressed_blocks(struct compress_ctx *cc)
+static int __f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
 {
 	struct dnode_of_data dn;
 	int ret;
@@ -743,8 +742,13 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 
 			blkaddr = data_blkaddr(dn.inode,
 					dn.node_page, dn.ofs_in_node + i);
-			if (blkaddr != NULL_ADDR)
-				ret++;
+			if (compr) {
+				if (__is_valid_data_blkaddr(blkaddr))
+					ret++;
+			} else {
+				if (blkaddr != NULL_ADDR)
+					ret++;
+			}
 		}
 	}
 fail:
@@ -752,6 +756,18 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 	return ret;
 }
 
+/* return # of compressed blocks in compressed cluster */
+static int f2fs_compressed_blocks(struct compress_ctx *cc)
+{
+	return __f2fs_cluster_blocks(cc, true);
+}
+
+/* return # of valid blocks in compressed cluster */
+static int f2fs_cluster_blocks(struct compress_ctx *cc, bool compr)
+{
+	return __f2fs_cluster_blocks(cc, false);
+}
+
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 {
 	struct compress_ctx cc = {
@@ -761,7 +777,7 @@ int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 		.cluster_idx = index >> F2FS_I(inode)->i_log_cluster_size,
 	};
 
-	return f2fs_compressed_blocks(&cc);
+	return f2fs_cluster_blocks(&cc, false);
 }
 
 static bool cluster_may_compress(struct compress_ctx *cc)
@@ -810,7 +826,7 @@ static int prepare_compress_overwrite(struct compress_ctx *cc,
 	bool prealloc;
 
 retry:
-	ret = f2fs_compressed_blocks(cc);
+	ret = f2fs_cluster_blocks(cc, false);
 	if (ret <= 0)
 		return ret;
 
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
