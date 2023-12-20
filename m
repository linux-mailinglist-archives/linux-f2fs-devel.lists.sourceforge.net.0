Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A76DF81A07B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 15:00:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFx7B-0006su-W3;
	Wed, 20 Dec 2023 14:00:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFx79-0006sT-Ks
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 13:59:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=32GlP9vHEqARMVaEpjyRz2ivgY/q1Q1PAMgFqPrgVs8=; b=kVDnh92bkk3NPl3dGkasfNf60K
 8xivbXrvs7RPcn8VGzWrru8yod99/H+E1+yPpTeS4hkp3KWqVPymi3i1xkutuK3Xq/11gk/cVTJBg
 5x/tASxjloaMmrz+O5zEq4Gf57+288cMo4Zk5hFYOD9DHQ9hd3XJacj58WBZvx+jO9nQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=32GlP9vHEqARMVaEpjyRz2ivgY/q1Q1PAMgFqPrgVs8=; b=CEr5Zm+l6W0vPiBP5YnhY3IAhw
 3flwniSaUqUtWLSJbVc1WFOcH8r4rOUwtJeDzKVHio4eN/VQVBv3f74EWEIazSpJlHzsKRSXr/nG3
 Zy5QomXD51RnsnUelaBXzxs7gaMdngT+/DMlfYusALD5xwF8T1xvewlej4URJuMyufzQ=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFx78-0001K9-Pf for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 13:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5FB796165F
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Dec 2023 13:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDFAC433C7;
 Wed, 20 Dec 2023 13:59:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703080788;
 bh=syTLTyQL0h6bm/dVO7pwCM9/CV4AN46/r4l6pfWHOsk=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f+Xem3SDh/g99pjEVufXEyyYTplXClv9zD6wXfHQwb+grX1vfInCbK0xd+jGB3NWr
 sN92ub7zMqSpU6mGrNFx3TeQIYR3xngeYKtLy8zt6xGgWDU4RwAGi5j5Yyv63Kv6rO
 k7oX8GeZFKZF0dwOt0BxtO3EFM6aAvk3hxGX3iqHcmTI7vHmtTVePS8HEGQjxKLpDP
 Ihg1Wf/yOH3qLzMeu0NTd9/aECTj2+HT5FtVD8MW2wAadyp/IgN9BAAsh4hdSv5bA4
 Zb/YkGlt+TTHnO54zERz6Sk1nHQaLxXFVVtzGlktNXYFwNOj4UH0W4wRDMxP5aNDut
 NH+gV9zHyPH5Q==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 20 Dec 2023 21:59:32 +0800
Message-Id: <20231220135934.3471407-4-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220135934.3471407-1-chao@kernel.org>
References: <20231220135934.3471407-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.3 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In reserve_compress_blocks(), we update blkaddrs of dnode
 in prior to inc_valid_block_count(), it may cause inconsistent status bewteen
 i_blocks and blkaddrs once inc_valid_block_count() fails. To fix this issue,
 it needs to reverse their invoking order. 
 Content analysis details:   (-5.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFx78-0001K9-Pf
Subject: [f2fs-dev] [PATCH 4/6] f2fs: compress: fix to avoid inconsistent
 bewteen i_blocks and dnode
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

In reserve_compress_blocks(), we update blkaddrs of dnode in prior to
inc_valid_block_count(), it may cause inconsistent status bewteen
i_blocks and blkaddrs once inc_valid_block_count() fails.

To fix this issue, it needs to reverse their invoking order.

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/data.c    |  5 +++--
 fs/f2fs/f2fs.h    |  7 ++++++-
 fs/f2fs/file.c    | 26 ++++++++++++++------------
 fs/f2fs/segment.c |  2 +-
 4 files changed, 24 insertions(+), 16 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ceed5ac6c66b..cc4cb9099db6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1224,7 +1224,8 @@ int f2fs_reserve_new_blocks(struct dnode_of_data *dn, blkcnt_t count)
 
 	if (unlikely(is_inode_flag_set(dn->inode, FI_NO_ALLOC)))
 		return -EPERM;
-	if (unlikely((err = inc_valid_block_count(sbi, dn->inode, &count))))
+	err = inc_valid_block_count(sbi, dn->inode, &count, true);
+	if (unlikely(err))
 		return err;
 
 	trace_f2fs_reserve_new_blocks(dn->inode, dn->nid,
@@ -1481,7 +1482,7 @@ static int __allocate_data_block(struct dnode_of_data *dn, int seg_type)
 
 	dn->data_blkaddr = f2fs_data_blkaddr(dn);
 	if (dn->data_blkaddr == NULL_ADDR) {
-		err = inc_valid_block_count(sbi, dn->inode, &count);
+		err = inc_valid_block_count(sbi, dn->inode, &count, true);
 		if (unlikely(err))
 			return err;
 	}
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index bcb3940ab5ba..541c52fe2872 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2294,7 +2294,7 @@ static inline unsigned int get_available_block_count(struct f2fs_sb_info *sbi,
 
 static inline void f2fs_i_blocks_write(struct inode *, block_t, bool, bool);
 static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
-				 struct inode *inode, blkcnt_t *count)
+				 struct inode *inode, blkcnt_t *count, bool partial)
 {
 	blkcnt_t diff = 0, release = 0;
 	block_t avail_user_block_count;
@@ -2320,6 +2320,11 @@ static inline int inc_valid_block_count(struct f2fs_sb_info *sbi,
 	avail_user_block_count = get_available_block_count(sbi, inode, true);
 
 	if (unlikely(sbi->total_valid_block_count > avail_user_block_count)) {
+		if (!partial) {
+			spin_unlock(&sbi->stat_lock);
+			goto enospc;
+		}
+
 		diff = sbi->total_valid_block_count - avail_user_block_count;
 		if (diff > *count)
 			diff = *count;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c200b4c81baf..4f3ed627f6a1 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3633,14 +3633,16 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		blkcnt_t reserved;
 		int ret;
 
-		for (i = 0; i < cluster_size; i++, dn->ofs_in_node++) {
-			blkaddr = f2fs_data_blkaddr(dn);
+		for (i = 0; i < cluster_size; i++) {
+			blkaddr = data_blkaddr(dn->inode, dn->node_page,
+						dn->ofs_in_node + i);
 
 			if (i == 0) {
-				if (blkaddr == COMPRESS_ADDR)
-					continue;
-				dn->ofs_in_node += cluster_size;
-				goto next;
+				if (blkaddr != COMPRESS_ADDR) {
+					dn->ofs_in_node += cluster_size;
+					goto next;
+				}
+				continue;
 			}
 
 			/*
@@ -3656,20 +3658,20 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 				compr_blocks++;
 				continue;
 			}
-
-			f2fs_set_data_blkaddr(dn, NEW_ADDR);
 		}
 
 		reserved = cluster_size - compr_blocks;
 		if (!reserved)
 			goto next;
 
-		ret = inc_valid_block_count(sbi, dn->inode, &reserved);
-		if (ret)
+		ret = inc_valid_block_count(sbi, dn->inode, &reserved, false);
+		if (unlikely(ret))
 			return ret;
 
-		if (reserved != cluster_size - compr_blocks)
-			return -ENOSPC;
+		for (i = 0; i < cluster_size; i++, dn->ofs_in_node++) {
+			if (f2fs_data_blkaddr(dn) == NULL_ADDR)
+				f2fs_set_data_blkaddr(dn, NEW_ADDR);
+		}
 
 		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, true);
 
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index bafdd2295957..f95a2e914baf 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -248,7 +248,7 @@ static int __replace_atomic_write_block(struct inode *inode, pgoff_t index,
 	} else {
 		blkcnt_t count = 1;
 
-		err = inc_valid_block_count(sbi, inode, &count);
+		err = inc_valid_block_count(sbi, inode, &count, true);
 		if (err) {
 			f2fs_put_dnode(&dn);
 			return err;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
