Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 309BC3E1FA4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  6 Aug 2021 02:03:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mBnKN-0005wX-0P; Fri, 06 Aug 2021 00:03:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1mBnKL-0005wM-Sa
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 00:03:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z6CM7BTIcly4/l1lL4oBUAgbYK4399EbzX2NgZB8nsQ=; b=ZOIoqNfVR+d0zzVUCGaDrEkNj9
 /ga9UPeB7wAd312oRykbzZgFsLXcQSMB+oJmSDAYcLGzwOh1iWqaXuoRJelx2Rmxis+8rGtzAmvsi
 HkdJy3X747tPugrE7IsxDKvJF15RcxpDqYzh3m7T8Bcp0Jzmoo6doQ9HgbfZRGFth8g0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z6CM7BTIcly4/l1lL4oBUAgbYK4399EbzX2NgZB8nsQ=; b=J
 mDte7sNmqtRYMUMe/CnFn6ZfkL3/apwLaVJgRvphM4x/OxkxvGubEcYi2CsoJkrLFEz1oHnn931i/
 msvGlbgos3MwdF8Di3CtEX4DM6AUXOeX074M6WEsFDe30gJNQBP8yzc0cNl03S22RWA17MoRN9N0J
 XY9ngDaFJRHtUhMc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mBnKJ-00020z-UR
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 06 Aug 2021 00:03:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 6D08D60041;
 Fri,  6 Aug 2021 00:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1628208178;
 bh=w+EzrCFzoXO++utJ5paGjn1FR/ff9cpEjnMnfwT0t/c=;
 h=From:To:Cc:Subject:Date:From;
 b=akZQ6u2Lb+L6bHJIqwoQfEQEBWlGgz0lZfMKdDs7ZHfpj5DjtCUeWgdHUsaH3NMC1
 9kPfFPdbZoS4ZgGJfO6IbC2IYykgsH8bz3BrTMosfSP0WuYzJvRZdUht1ePOWQHcN4
 Jm+9aPLOu4zOruiiENrDmfME1nQ8C1HK764bO62tR7w/ZVPPV9AEIM670+exMt5zXz
 uRDTZ7iV8V0rCsNC7l/HPHkTQoVM2/1OAYYZIk72zTnVOAtT1Iz70UTIFSlkB5JARb
 l30EI+5NQlH0h9UOLXJWVbtFLjUp9Vj4wrmWYb19O0w6mpYBMoHMImw6jLYApIWTGk
 cizeNgMhPsFww==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Fri,  6 Aug 2021 08:02:50 +0800
Message-Id: <20210806000250.39728-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.1
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1mBnKJ-00020z-UR
Subject: [f2fs-dev] [PATCH v2] f2fs: compress: do sanity check on cluster
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
Cc: Chao Yu <chao.yu@linux.dev>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch adds f2fs_sanity_check_cluster() to support doing
sanity check on cluster of compressed file, it will be triggered
from below two paths:

- __f2fs_cluster_blocks()
- f2fs_map_blocks(F2FS_GET_BLOCK_FIEMAP)

And it can detect below three kind of cluster insanity status.

C: COMPRESS_ADDR
N: NULL_ADDR or NEW_ADDR
V: valid blkaddr
*: any value

1. [*|C|*|*]
2. [C|*|C|*]
3. [C|N|N|V]

Signed-off-by: Chao Yu <chao@kernel.org>
---
v2:
- cover all map_block cases
- give EFSCORRUPTED only when CHECK_FS is enabled for fiemap()
 fs/f2fs/compress.c | 53 ++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/data.c     |  9 ++++++++
 fs/f2fs/f2fs.h     |  1 +
 3 files changed, 63 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7dbfd6965b97..f25b32a6893a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -898,6 +898,54 @@ static bool cluster_has_invalid_data(struct compress_ctx *cc)
 	return false;
 }
 
+bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
+	unsigned int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
+	bool compressed = dn->data_blkaddr == COMPRESS_ADDR;
+	int cluster_end = 0;
+	int i;
+	char *reason = "";
+
+	if (!compressed)
+		return false;
+
+	/* [..., COMPR_ADDR, ...] */
+	if (dn->ofs_in_node % cluster_size) {
+		reason = "[*|C|*|*]";
+		goto out;
+	}
+
+	for (i = 1; i < cluster_size; i++) {
+		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
+							dn->ofs_in_node + i);
+
+		/* [COMPR_ADDR, ..., COMPR_ADDR] */
+		if (blkaddr == COMPRESS_ADDR) {
+			reason = "[C|*|C|*]";
+			goto out;
+		}
+		if (compressed) {
+			if (!__is_valid_data_blkaddr(blkaddr)) {
+				if (!cluster_end)
+					cluster_end = i;
+				continue;
+			}
+			/* [COMPR_ADDR, NULL_ADDR or NEW_ADDR, valid_blkaddr] */
+			if (cluster_end) {
+				reason = "[C|N|N|V]";
+				goto out;
+			}
+		}
+	}
+	return false;
+out:
+	f2fs_warn(sbi, "access invalid cluster, ino:%lu, nid:%u, ofs_in_node:%u, reason:%s",
+			dn->inode->i_ino, dn->nid, dn->ofs_in_node, reason);
+	set_sbi_flag(sbi, SBI_NEED_FSCK);
+	return true;
+}
+
 static int __f2fs_cluster_blocks(struct inode *inode,
 				unsigned int cluster_idx, bool compr)
 {
@@ -915,6 +963,11 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 		goto fail;
 	}
 
+	if (f2fs_sanity_check_cluster(&dn)) {
+		ret = -EFSCORRUPTED;
+		goto fail;
+	}
+
 	if (dn.data_blkaddr == COMPRESS_ADDR) {
 		int i;
 
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index df5e8d8c654e..d4c9aeba0842 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1552,6 +1552,15 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 			map->m_flags |= F2FS_MAP_NEW;
 			blkaddr = dn.data_blkaddr;
 		} else {
+#ifdef CONFIG_F2FS_FS_COMPRESSION
+			if (f2fs_compressed_file(inode) &&
+					f2fs_sanity_check_cluster(&dn) &&
+					(flag != F2FS_GET_BLOCK_FIEMAP ||
+					IS_ENABLED(CONFIG_F2FS_CHECK_FS))) {
+				err = -EFSCORRUPTED;
+				goto sync_out;
+			}
+#endif
 			if (flag == F2FS_GET_BLOCK_BMAP) {
 				map->m_pblk = 0;
 				goto sync_out;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e97b4d8c5efc..3b368bcbc4d7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4074,6 +4074,7 @@ void f2fs_end_read_compressed_page(struct page *page, bool failed,
 							block_t blkaddr);
 bool f2fs_cluster_is_empty(struct compress_ctx *cc);
 bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index);
+bool f2fs_sanity_check_cluster(struct dnode_of_data *dn);
 void f2fs_compress_ctx_add_page(struct compress_ctx *cc, struct page *page);
 int f2fs_write_multi_pages(struct compress_ctx *cc,
 						int *submitted,
-- 
2.22.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
