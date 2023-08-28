Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7FFB078B282
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Aug 2023 16:04:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qacr6-0006x9-8U;
	Mon, 28 Aug 2023 14:04:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1qacr2-0006wf-G0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 14:04:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fuf8lvG2IpaLnWoAUX0O/e+MhG9gfzWO/M9TjdC6zLw=; b=MFVmHMBtphFSvU4NHJqEF84CI0
 XgtdrSYFKJHPkXA75Gnr8mHEyQKcGoweNr2LwWmga+mXpIo8+joH/8liXzyvqoAE8NbBLObbg3Wdh
 cOh+QmojRSyVE0sRVldRNQxMmMlhI0u5yy7d6/yNNANw8l8ZtZlbKRxxVolVkzdc0bbA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fuf8lvG2IpaLnWoAUX0O/e+MhG9gfzWO/M9TjdC6zLw=; b=YEWG/qf02sSinItLRgTZ+g6g0o
 wcaziNk1Ct5ZCJyVELOLv8LyC/MYOfEWXKt0k0jVjBimmDIyKC7tKdL9A5+DwFd1uogxc8rQlQZrg
 s46XynDNlhjb316OheKOLHJ1SOe/txL8JczzkkIDpCEKaAInw6EPIerIxb66i6tzsJXM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qacr1-00043W-Km for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Aug 2023 14:04:32 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 013B7648F5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 28 Aug 2023 14:04:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 47734C433C8;
 Mon, 28 Aug 2023 14:04:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1693231465;
 bh=dz5WGcW0XCq5mKyveB9Rm7v1wiY2CcHMtPUPvLN0ics=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=kT2hxGEFWQ4knn471dORoGRgGx7B1WliZz9InbbM6YqXTYfT+r5XfZGWbcDjrOON9
 CmsU/+aclugRcXJ6zi6FgLwZ205PSTLokiyRx/rvpcdSrOdbRraEl3OEWZdWiUjdcx
 1W+MZc04wniOfJqrqA+m90CygGjkVrLcd4uizLPv8/bqFoY9YdhdviIKY5OHwk97S8
 Dsfy3QZmALv6+0IZ7FWDNWsSVsStZcq1S6E6vC8BAscmuua1XR4DII/grLfRB89H+b
 I9f1rLeTirBXy1Q2xCqmIs1JSeJ8sQEZAKNNhvaUBJZN7b4RuinK0rDgI9urTKSh5L
 zdjVybXCZS+6g==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 28 Aug 2023 22:04:16 +0800
Message-Id: <20230828140417.2951796-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230828140417.2951796-1-chao@kernel.org>
References: <20230828140417.2951796-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch covers sanity check logic on cluster w/
 CONFIG_F2FS_CHECK_FS, 
 otherwise, there will be performance regression while querying cluster mapping
 info. Callers of f2fs_is_compressed_cluster() only care about whether cluster
 is compressed or not, rather than # of valid blocks in compressed cluster,
 so, let's adjust f2fs_is_compressed_cluster()'s logic [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1qacr1-00043W-Km
Subject: [f2fs-dev] [PATCH 3/4] f2fs: compress: do sanity check on cluster
 when CONFIG_F2FS_CHECK_FS is on
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

This patch covers sanity check logic on cluster w/ CONFIG_F2FS_CHECK_FS,
otherwise, there will be performance regression while querying cluster
mapping info.

Callers of f2fs_is_compressed_cluster() only care about whether cluster
is compressed or not, rather than # of valid blocks in compressed cluster,
so, let's adjust f2fs_is_compressed_cluster()'s logic according to
caller's requirement.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/compress.c | 61 ++++++++++++++++++++++++++--------------------
 fs/f2fs/data.c     |  4 +--
 2 files changed, 35 insertions(+), 30 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 9662d635efbe..1828239cef0a 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -893,14 +893,15 @@ static bool cluster_has_invalid_data(struct compress_ctx *cc)
 
 bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
 {
+#ifdef CONFIG_F2FS_CHECK_FS
 	struct f2fs_sb_info *sbi = F2FS_I_SB(dn->inode);
 	unsigned int cluster_size = F2FS_I(dn->inode)->i_cluster_size;
-	bool compressed = dn->data_blkaddr == COMPRESS_ADDR;
 	int cluster_end = 0;
+	unsigned int count;
 	int i;
 	char *reason = "";
 
-	if (!compressed)
+	if (dn->data_blkaddr != COMPRESS_ADDR)
 		return false;
 
 	/* [..., COMPR_ADDR, ...] */
@@ -909,7 +910,7 @@ bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
 		goto out;
 	}
 
-	for (i = 1; i < cluster_size; i++) {
+	for (i = 1, count = 1; i < cluster_size; i++, count++) {
 		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
 							dn->ofs_in_node + i);
 
@@ -929,19 +930,42 @@ bool f2fs_sanity_check_cluster(struct dnode_of_data *dn)
 			goto out;
 		}
 	}
+
+	f2fs_bug_on(F2FS_I_SB(dn->inode), count != cluster_size &&
+		!is_inode_flag_set(dn->inode, FI_COMPRESS_RELEASED));
+
 	return false;
 out:
 	f2fs_warn(sbi, "access invalid cluster, ino:%lu, nid:%u, ofs_in_node:%u, reason:%s",
 			dn->inode->i_ino, dn->nid, dn->ofs_in_node, reason);
 	set_sbi_flag(sbi, SBI_NEED_FSCK);
 	return true;
+#else
+	return false;
+#endif
+}
+
+static int __f2fs_get_cluster_blocks(struct inode *inode,
+					struct dnode_of_data *dn)
+{
+	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
+	int count, i;
+
+	for (i = 1, count = 1; i < cluster_size; i++) {
+		block_t blkaddr = data_blkaddr(dn->inode, dn->node_page,
+							dn->ofs_in_node + i);
+
+		if (__is_valid_data_blkaddr(blkaddr))
+			count++;
+	}
+
+	return count;
 }
 
 static int __f2fs_cluster_blocks(struct inode *inode,
-				unsigned int cluster_idx, bool compr)
+				unsigned int cluster_idx, bool compr_blks)
 {
 	struct dnode_of_data dn;
-	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
 	unsigned int start_idx = cluster_idx <<
 				F2FS_I(inode)->i_log_cluster_size;
 	int ret;
@@ -956,31 +980,14 @@ static int __f2fs_cluster_blocks(struct inode *inode,
 
 	if (f2fs_sanity_check_cluster(&dn)) {
 		ret = -EFSCORRUPTED;
-		f2fs_handle_error(F2FS_I_SB(inode), ERROR_CORRUPTED_CLUSTER);
 		goto fail;
 	}
 
 	if (dn.data_blkaddr == COMPRESS_ADDR) {
-		int i;
-
-		ret = 1;
-		for (i = 1; i < cluster_size; i++) {
-			block_t blkaddr;
-
-			blkaddr = data_blkaddr(dn.inode,
-					dn.node_page, dn.ofs_in_node + i);
-			if (compr) {
-				if (__is_valid_data_blkaddr(blkaddr))
-					ret++;
-			} else {
-				if (blkaddr != NULL_ADDR)
-					ret++;
-			}
-		}
-
-		f2fs_bug_on(F2FS_I_SB(inode),
-			!compr && ret != cluster_size &&
-			!is_inode_flag_set(inode, FI_COMPRESS_RELEASED));
+		if (compr_blks)
+			ret = __f2fs_get_cluster_blocks(inode, &dn);
+		else
+			ret = 1;
 	}
 fail:
 	f2fs_put_dnode(&dn);
@@ -993,7 +1000,7 @@ static int f2fs_compressed_blocks(struct compress_ctx *cc)
 	return __f2fs_cluster_blocks(cc->inode, cc->cluster_idx, true);
 }
 
-/* return # of valid blocks in compressed cluster */
+/* return whether cluster is compressed one or not */
 int f2fs_is_compressed_cluster(struct inode *inode, pgoff_t index)
 {
 	return __f2fs_cluster_blocks(inode,
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 1ac34eb49a0e..cd9cedc35d7f 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1690,9 +1690,7 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 			map->m_flags |= F2FS_MAP_NEW;
 	} else if (is_hole) {
 		if (f2fs_compressed_file(inode) &&
-		    f2fs_sanity_check_cluster(&dn) &&
-		    (flag != F2FS_GET_BLOCK_FIEMAP ||
-		     IS_ENABLED(CONFIG_F2FS_CHECK_FS))) {
+		    f2fs_sanity_check_cluster(&dn)) {
 			err = -EFSCORRUPTED;
 			f2fs_handle_error(sbi,
 					ERROR_CORRUPTED_CLUSTER);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
