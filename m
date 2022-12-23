Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 443C1655455
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8omu-0003Ow-CS;
	Fri, 23 Dec 2022 20:37:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omt-0003Op-H1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A+xtctLy+fQFyKbl/YtJ+IVU/zZ2qZt9cfPUzZOXAbk=; b=DxbC6R2Yg6ieDKdwwUqN9DdZpv
 CW4ZsXurp4ZtFFbYuMpJ4LuZVuCeyhVoCfjmczaQBl3APOfJ+i+P8abOTo7Jbc2aAxYn3DyxQgG4k
 2EqMqPqgHwMgoCc43D0/yxFMh/2s79eoQoYbcM20wPn7XIPrHS7SEUwxMKftpY8wv9B0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A+xtctLy+fQFyKbl/YtJ+IVU/zZ2qZt9cfPUzZOXAbk=; b=iDLD797SSpjnWHxOyNw1gQ/XtB
 NZxaruaq/Gt09q/sFGoLZvMjnwyEcGiBlPmvIagkJMGG2YpD4KVEsPcehjvWN3sXW7H+esRj9hRzm
 7EKT94jTBUMQCwTkHNSkA8MaI0OYcNUSV4RC8Vpc7+RL1wl2zJQPL2pCIWN35r+tTii8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8oms-00088U-Q2 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:03 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 68A8D61EF6;
 Fri, 23 Dec 2022 20:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8AB06C433F1;
 Fri, 23 Dec 2022 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827816;
 bh=t0yAzf0aY4TIwKR3lJb5ncYuHOsUm40J81t2ZXzWYCw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OrB9nct0a4D75w6OZb/PSADeO79+yJwZst83UJeD+WY4kVJr7xzqBKafuOYGiydbt
 DFBA/1jsp1UtZ45r05r5BpGhQn58FTfFYWUxdIug8yNDjXpbK1Jk56GbMRE6MTPX/X
 Jg1i+Tk1sadNzYRvqZWbUb1umRD1ailVYXQV97mbspBG8y7C57Z3oLQXhXKYeJPHM4
 +o+7Iyok+em4Zkzw2AkQI+IY8ysPbxMU818Q8qOqubpg5WNVStEQF6M3vNB2sPo8VF
 pneBVurJaEV04Vc1JTOKA10j3s8g/EK1VOdp+hMlfzjzMoe1qWQmZkrO1LHjpjJAIb
 ast7KgPHOwJDA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:29 -0800
Message-Id: <20221223203638.41293-3-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Eric Biggers <ebiggers@google.com> First, calculate
 max_ra_pages more efficiently by using the bio size. Second, calculate the
 number of readahead pages from the hash page index, instead of calculating
 it ahead of time using the data page index. This ends up being a bit simpler, 
 especially since level 0 [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8oms-00088U-Q2
Subject: [f2fs-dev] [PATCH v2 02/11] fsverity: simplify Merkle tree
 readahead size calculation
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

First, calculate max_ra_pages more efficiently by using the bio size.

Second, calculate the number of readahead pages from the hash page
index, instead of calculating it ahead of time using the data page
index.  This ends up being a bit simpler, especially since level 0 is
last in the tree, so we can just limit the readahead to the tree size.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h |  2 +-
 fs/verity/open.c             |  3 ++-
 fs/verity/verify.c           | 21 +++++++--------------
 3 files changed, 10 insertions(+), 16 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index e8b40c8000be7..48b97f5d05569 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -46,7 +46,7 @@ struct merkle_tree_params {
 	unsigned int log_arity;		/* log2(hashes_per_block) */
 	unsigned int num_levels;	/* number of levels in Merkle tree */
 	u64 tree_size;			/* Merkle tree size in bytes */
-	unsigned long level0_blocks;	/* number of blocks in tree level 0 */
+	unsigned long tree_pages;	/* Merkle tree size in pages */
 
 	/*
 	 * Starting block index for each tree level, ordered from leaf level (0)
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 83ccc3c137363..e356eefb54d7b 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -7,6 +7,7 @@
 
 #include "fsverity_private.h"
 
+#include <linux/mm.h>
 #include <linux/slab.h>
 
 static struct kmem_cache *fsverity_info_cachep;
@@ -97,7 +98,6 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 			 params->log_arity;
 		blocks_in_level[params->num_levels++] = blocks;
 	}
-	params->level0_blocks = blocks_in_level[0];
 
 	/* Compute the starting block of each level */
 	offset = 0;
@@ -118,6 +118,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 	}
 
 	params->tree_size = offset << log_blocksize;
+	params->tree_pages = PAGE_ALIGN(params->tree_size) >> PAGE_SHIFT;
 	return 0;
 
 out_err:
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index de0d7aef785bf..4c57a1bd01afc 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -74,7 +74,7 @@ static inline int cmp_hashes(const struct fsverity_info *vi,
  */
 static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
 			struct ahash_request *req, struct page *data_page,
-			unsigned long level0_ra_pages)
+			unsigned long max_ra_pages)
 {
 	const struct merkle_tree_params *params = &vi->tree_params;
 	const unsigned int hsize = params->digest_size;
@@ -103,7 +103,8 @@ static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
 		hash_at_level(params, index, level, &hindex, &hoffset);
 
 		hpage = inode->i_sb->s_vop->read_merkle_tree_page(inode, hindex,
-				level == 0 ? level0_ra_pages : 0);
+				level == 0 ? min(max_ra_pages,
+					params->tree_pages - hindex) : 0);
 		if (IS_ERR(hpage)) {
 			err = PTR_ERR(hpage);
 			fsverity_err(inode,
@@ -199,14 +200,13 @@ void fsverity_verify_bio(struct bio *bio)
 {
 	struct inode *inode = bio_first_page_all(bio)->mapping->host;
 	const struct fsverity_info *vi = inode->i_verity_info;
-	const struct merkle_tree_params *params = &vi->tree_params;
 	struct ahash_request *req;
 	struct bio_vec *bv;
 	struct bvec_iter_all iter_all;
 	unsigned long max_ra_pages = 0;
 
 	/* This allocation never fails, since it's mempool-backed. */
-	req = fsverity_alloc_hash_request(params->hash_alg, GFP_NOFS);
+	req = fsverity_alloc_hash_request(vi->tree_params.hash_alg, GFP_NOFS);
 
 	if (bio->bi_opf & REQ_RAHEAD) {
 		/*
@@ -218,24 +218,17 @@ void fsverity_verify_bio(struct bio *bio)
 		 * This improves sequential read performance, as it greatly
 		 * reduces the number of I/O requests made to the Merkle tree.
 		 */
-		bio_for_each_segment_all(bv, bio, iter_all)
-			max_ra_pages++;
-		max_ra_pages /= 4;
+		max_ra_pages = bio->bi_iter.bi_size >> (PAGE_SHIFT + 2);
 	}
 
 	bio_for_each_segment_all(bv, bio, iter_all) {
-		struct page *page = bv->bv_page;
-		unsigned long level0_index = page->index >> params->log_arity;
-		unsigned long level0_ra_pages =
-			min(max_ra_pages, params->level0_blocks - level0_index);
-
-		if (!verify_page(inode, vi, req, page, level0_ra_pages)) {
+		if (!verify_page(inode, vi, req, bv->bv_page, max_ra_pages)) {
 			bio->bi_status = BLK_STS_IOERR;
 			break;
 		}
 	}
 
-	fsverity_free_hash_request(params->hash_alg, req);
+	fsverity_free_hash_request(vi->tree_params.hash_alg, req);
 }
 EXPORT_SYMBOL_GPL(fsverity_verify_bio);
 #endif /* CONFIG_BLOCK */
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
