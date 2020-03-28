Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 328931964D1
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Mar 2020 10:41:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jI7xh-0008AR-DW; Sat, 28 Mar 2020 09:41:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1jI7xh-0008AK-2o
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 09:41:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AahqtJvm4u1PiDqQ5CZN8phQgonk6zK2hZ8AJ/e3Ezc=; b=Z1PLPyYw3yKn5X7dEy+G7fxIN4
 MhZ4gonTlvzTE/UDtQUavTXwtCzRUdICXFsQVJVWdwtHkjXH/DUg7sWK5LICRZTMU6ywKzExHTwPa
 eNxqk7PKFPE82VWerpH0y3C1bR8KRkT9NuQRsgDrQ+CvbF8/FYtw+yFNLlUbButNkMOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=AahqtJvm4u1PiDqQ5CZN8phQgonk6zK2hZ8AJ/e3Ezc=; b=C
 0a8hFNgbkK5w4tFhNsS4BMCE1nSG8DhuTKNS/M3wiWQuLmqMuFEgfr68OCXP4cXXOcyg1cKXGvjZ5
 hQ4F7k3zDy2+VNDN5dVUSCpUDChCknMeFN1mTElC5EssVDH5APJwFur1XE4Fl21VrJeO95jfqC3bD
 S/0sfhuUJxd7eS4s=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jI7xe-008MYS-H8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Mar 2020 09:41:05 +0000
Received: from DGGEMS406-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 24377F02718C82F69AF3;
 Sat, 28 Mar 2020 17:40:54 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS406-HUB.china.huawei.com (10.3.19.206) with Microsoft SMTP Server id
 14.3.487.0; Sat, 28 Mar 2020 17:40:47 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 28 Mar 2020 17:40:40 +0800
Message-ID: <20200328094040.3785-1-yuchao0@huawei.com>
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
X-Headers-End: 1jI7xe-008MYS-H8
Subject: [f2fs-dev] [PATCH WIP] f2fs: support fiemap on compressed inode
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

Map normal/compressed cluster of compressed inode correctly, and give
the right fiemap flag FIEMAP_EXTENT_ENCODED on mapped compressed extent.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 55 ++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 53 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 89b73ee74120..363f7f1b6dc0 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1808,6 +1808,25 @@ static int f2fs_xattr_fiemap(struct inode *inode,
 	return (err < 0 ? err : 0);
 }
 
+static loff_t max_inode_blocks(struct inode *inode)
+{
+	loff_t result = ADDRS_PER_INODE(inode);
+	loff_t leaf_count = ADDRS_PER_BLOCK(inode);
+
+	/* two direct node blocks */
+	result += (leaf_count * 2);
+
+	/* two indirect node blocks */
+	leaf_count *= NIDS_PER_BLOCK;
+	result += (leaf_count * 2);
+
+	/* one double indirect node block */
+	leaf_count *= NIDS_PER_BLOCK;
+	result += leaf_count;
+
+	return result;
+}
+
 int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		u64 start, u64 len)
 {
@@ -1817,6 +1836,8 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	u64 logical = 0, phys = 0, size = 0;
 	u32 flags = 0;
 	int ret = 0;
+	bool compr_cluster = false;
+	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
 		ret = f2fs_precache_extents(inode);
@@ -1851,6 +1872,9 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	memset(&map_bh, 0, sizeof(struct buffer_head));
 	map_bh.b_size = len;
 
+	if (compr_cluster)
+		map_bh.b_size = blk_to_logical(inode, cluster_size - 1);
+
 	ret = get_data_block(inode, start_blk, &map_bh, 0,
 					F2FS_GET_BLOCK_FIEMAP, &next_pgofs);
 	if (ret)
@@ -1861,7 +1885,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		start_blk = next_pgofs;
 
 		if (blk_to_logical(inode, start_blk) < blk_to_logical(inode,
-					F2FS_I_SB(inode)->max_file_blocks))
+						max_inode_blocks(inode)))
 			goto prep_next;
 
 		flags |= FIEMAP_EXTENT_LAST;
@@ -1873,11 +1897,38 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 		ret = fiemap_fill_next_extent(fieinfo, logical,
 				phys, size, flags);
+		if (ret)
+			goto out;
+		size = 0;
 	}
 
-	if (start_blk > last_blk || ret)
+	if (start_blk > last_blk)
 		goto out;
 
+	if (compr_cluster) {
+		compr_cluster = false;
+
+
+		logical = blk_to_logical(inode, start_blk - 1);
+		phys = blk_to_logical(inode, map_bh.b_blocknr);
+		size = blk_to_logical(inode, cluster_size);
+
+		flags |= FIEMAP_EXTENT_ENCODED;
+
+		start_blk += cluster_size - 1;
+
+		if (start_blk > last_blk)
+			goto out;
+
+		goto prep_next;
+	}
+
+	if (map_bh.b_blocknr == COMPRESS_ADDR) {
+		compr_cluster = true;
+		start_blk++;
+		goto prep_next;
+	}
+
 	logical = blk_to_logical(inode, start_blk);
 	phys = blk_to_logical(inode, map_bh.b_blocknr);
 	size = map_bh.b_size;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
