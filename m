Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 976FF655482
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8onJ-0000oZ-By;
	Fri, 23 Dec 2022 20:37:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omw-0000oL-KC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7g/TbiqxvwdS1NEAnv8cdY3TmAZBdAC77YD+BDdjpms=; b=YyM8aCSew6jN3kRwvAr/qkbYux
 4/2uM/LtjgQw/DaSKGB2iadfslPR7tkRpq3qR8QR34sb9MyXXvDL1XBD5ODFH5sktnHzHKMFvu+jJ
 9Trwyg618cVkDfqBVzEswdbLyyLZQpZj3gPH5wTV1qjdwTPRc8lZ5DZV0HjOIgPFp4zA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7g/TbiqxvwdS1NEAnv8cdY3TmAZBdAC77YD+BDdjpms=; b=lg/aGQi9Jbj+CV4mJ/TbBSAsYB
 fVKHOTR13zGxE66RlPTAUPqB2njS5ldxDvV9VL1mLgzjFyil/prugOWbaBrFKmjkPiyoVkRsiGBrk
 6QePijm/msTC4HFIL4ix2Zqta/+w86B61OexbgRsxW0m+OyE7CTIVvullDCyonC646I4=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8omu-009S2Q-UW for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 8325261EFA;
 Fri, 23 Dec 2022 20:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B0D06C433D2;
 Fri, 23 Dec 2022 20:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827817;
 bh=Z8CoE1PrgXB4eCUJFPaeZnMBi1T65cAAQrdPuKXjbOU=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=eCLe0H2xFKnziAiqA2LNbf2DlfdqUPb/wum6IDM32pPVFT/cKXXtSWm14HjE4+Qjq
 DFVdyJ76MyUk00jJ9ZNdS5Emr5EPZsLOExbHr+EVn6ADX6sznqcDox+alvSDym6qBU
 GaBvJdK1PG2B7ztRY/vTIuTRoTRQoY0T/nmBF7O5b6clLy12I4r18+8EQslc66iPdu
 YUndUmZry26NfrH+dYisSN06/Imxj9koAbw07slDBCXsxxci7v6qjtNQSMMEBYHvrv
 1qGcgrGGbg/Wxz1MmNaw/uXD7VezoenL7uG3JMipXFVsdoFQeeYmcRJpglaKysu5YD
 v8kkjgNQDRqzQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:32 -0800
Message-Id: <20221223203638.41293-6-ebiggers@kernel.org>
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
 Content preview: From: Eric Biggers <ebiggers@google.com> In preparation for
 allowing the Merkle tree block size to differ from PAGE_SIZE,
 replace fsverity_hash_page()
 with fsverity_hash_block(). The new function is similar to the old one, but
 it operates on [...] 
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
X-Headers-End: 1p8omu-009S2Q-UW
Subject: [f2fs-dev] [PATCH v2 05/11] fsverity: replace fsverity_hash_page()
 with fsverity_hash_block()
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

In preparation for allowing the Merkle tree block size to differ from
PAGE_SIZE, replace fsverity_hash_page() with fsverity_hash_block().  The
new function is similar to the old one, but it operates on the block at
the given offset in the page instead of on the full page.

(For now, all callers still pass a full page.)

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/enable.c           |  4 ++--
 fs/verity/fsverity_private.h |  6 +++---
 fs/verity/hash_algs.c        | 24 +++++++++++-------------
 fs/verity/verify.c           |  9 +++++----
 4 files changed, 21 insertions(+), 22 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 8a9189d479837..144483319f1a3 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -99,8 +99,8 @@ static int build_merkle_tree_level(struct file *filp, unsigned int level,
 			}
 		}
 
-		err = fsverity_hash_page(params, inode, req, src_page,
-					 &pending_hashes[pending_size]);
+		err = fsverity_hash_block(params, inode, req, src_page, 0,
+					  &pending_hashes[pending_size]);
 		put_page(src_page);
 		if (err)
 			return err;
diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index fc1c2797fab19..23ded939d649f 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -88,9 +88,9 @@ void fsverity_free_hash_request(struct fsverity_hash_alg *alg,
 				struct ahash_request *req);
 const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
 				      const u8 *salt, size_t salt_size);
-int fsverity_hash_page(const struct merkle_tree_params *params,
-		       const struct inode *inode,
-		       struct ahash_request *req, struct page *page, u8 *out);
+int fsverity_hash_block(const struct merkle_tree_params *params,
+			const struct inode *inode, struct ahash_request *req,
+			struct page *page, unsigned int offset, u8 *out);
 int fsverity_hash_buffer(struct fsverity_hash_alg *alg,
 			 const void *data, size_t size, u8 *out);
 void __init fsverity_check_hash_algs(void);
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index 6f8170cf4ae71..13fcf31be8441 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -220,35 +220,33 @@ const u8 *fsverity_prepare_hash_state(struct fsverity_hash_alg *alg,
 }
 
 /**
- * fsverity_hash_page() - hash a single data or hash page
+ * fsverity_hash_block() - hash a single data or hash block
  * @params: the Merkle tree's parameters
  * @inode: inode for which the hashing is being done
  * @req: preallocated hash request
- * @page: the page to hash
+ * @page: the page containing the block to hash
+ * @offset: the offset of the block within @page
  * @out: output digest, size 'params->digest_size' bytes
  *
- * Hash a single data or hash block, assuming block_size == PAGE_SIZE.
- * The hash is salted if a salt is specified in the Merkle tree parameters.
+ * Hash a single data or hash block.  The hash is salted if a salt is specified
+ * in the Merkle tree parameters.
  *
  * Return: 0 on success, -errno on failure
  */
-int fsverity_hash_page(const struct merkle_tree_params *params,
-		       const struct inode *inode,
-		       struct ahash_request *req, struct page *page, u8 *out)
+int fsverity_hash_block(const struct merkle_tree_params *params,
+			const struct inode *inode, struct ahash_request *req,
+			struct page *page, unsigned int offset, u8 *out)
 {
 	struct scatterlist sg;
 	DECLARE_CRYPTO_WAIT(wait);
 	int err;
 
-	if (WARN_ON(params->block_size != PAGE_SIZE))
-		return -EINVAL;
-
 	sg_init_table(&sg, 1);
-	sg_set_page(&sg, page, PAGE_SIZE, 0);
+	sg_set_page(&sg, page, params->block_size, offset);
 	ahash_request_set_callback(req, CRYPTO_TFM_REQ_MAY_SLEEP |
 					CRYPTO_TFM_REQ_MAY_BACKLOG,
 				   crypto_req_done, &wait);
-	ahash_request_set_crypt(req, &sg, out, PAGE_SIZE);
+	ahash_request_set_crypt(req, &sg, out, params->block_size);
 
 	if (params->hashstate) {
 		err = crypto_ahash_import(req, params->hashstate);
@@ -264,7 +262,7 @@ int fsverity_hash_page(const struct merkle_tree_params *params,
 
 	err = crypto_wait_req(err, &wait);
 	if (err)
-		fsverity_err(inode, "Error %d computing page hash", err);
+		fsverity_err(inode, "Error %d computing block hash", err);
 	return err;
 }
 
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index d2fcb6a21ea8e..44df06ddcc603 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -125,12 +125,13 @@ static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
 
 	want_hash = vi->root_hash;
 descend:
-	/* Descend the tree verifying hash pages */
+	/* Descend the tree verifying hash blocks. */
 	for (; level > 0; level--) {
 		struct page *hpage = hpages[level - 1];
 		unsigned int hoffset = hoffsets[level - 1];
 
-		err = fsverity_hash_page(params, inode, req, hpage, real_hash);
+		err = fsverity_hash_block(params, inode, req, hpage, 0,
+					  real_hash);
 		if (err)
 			goto out;
 		err = cmp_hashes(vi, want_hash, real_hash, index, level - 1);
@@ -142,8 +143,8 @@ static bool verify_page(struct inode *inode, const struct fsverity_info *vi,
 		put_page(hpage);
 	}
 
-	/* Finally, verify the data page */
-	err = fsverity_hash_page(params, inode, req, data_page, real_hash);
+	/* Finally, verify the data block. */
+	err = fsverity_hash_block(params, inode, req, data_page, 0, real_hash);
 	if (err)
 		goto out;
 	err = cmp_hashes(vi, want_hash, real_hash, index, -1);
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
