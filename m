Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AA9E449481F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 20 Jan 2022 08:16:35 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nARgQ-0005Wh-QM; Thu, 20 Jan 2022 07:16:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nARgO-0005WO-N9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 07:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=pSkZPVDs0XSccbrEQ7V/aR6FJRpSIQtINBNy95c5A2A=; b=Uo1fL9ztGwh+N8sB5cL22evFp3
 ZQGAlXfYtTEbVmyz+PRkTUsT+t7idXsmCZzy/AF8K2PUgTnr6k5zH6nPdcp1mXL6StfgpAAb8pBqt
 BBRQuos/wELPs3CHsvNhUtB8sH0NaWFICM7fBQCmNqOsm4sKBz3obk8kQiOV6xVp2Rsg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=pSkZPVDs0XSccbrEQ7V/aR6FJRpSIQtINBNy95c5A2A=; b=b1Nvp4CLnYyGZlf8SqgQFIu/l2
 4ZigfRMp6qgvCe03ZiYaw/E1mreb03HJR23EvmypaDnErNKur9TksTPZViWVDKLKyySXGBsNwuaqS
 8N6DqnDrNM9O5l5iz2yxry6Q3f/Z/2Zd2DjKobnAZe3PvA+nRDLAYSIF+92xfPPcggEw=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1nARgJ-0002k4-RJ
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 20 Jan 2022 07:16:29 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by sin.source.kernel.org (Postfix) with ESMTPS id 61A76CE1FFC;
 Thu, 20 Jan 2022 07:16:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B7C0C340E9;
 Thu, 20 Jan 2022 07:16:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1642662974;
 bh=AisQShPpFV3Eliyeb/P+Zfoyyi9GVLa7kPFiEZALl0g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IHAvIpo1+755z5fv7ooM7Nesr4mQJSyaBUqw8X6GRahDTVAr1bAMg5yTVoE+3z8Xq
 Eb2PU+2Mq4r6EUCZayEIC7VKcw/9UJovPV8pt1f/K2jRVa2KGSTYVmzUdS/RZw7mdX
 NDUz3XkTnhsSfwHJWuuctR3i9DPzzEd9x8KhMwD9b/uerU6kCSD5NO/RN8satfzmQ6
 u+NF61eQFHva2iPADFlVLnjoSQ1G4/z1HBfUexL8UPjIuDC7xcj4zFcSAeBoxbdTN8
 YeNlqI95xW6mPlzucXxAdGclB62r0wc/TyJSDNeyawGapMu4LwmbAIwBl8qA1x60fI
 ZFUpTsHtfOIGA==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Wed, 19 Jan 2022 23:12:11 -0800
Message-Id: <20220120071215.123274-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220120071215.123274-1-ebiggers@kernel.org>
References: <20220120071215.123274-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Encrypted files
 traditionally
 haven't supported DIO, due to the need to encrypt/decrypt the data. However,
 when the encryption is implemented using inline encryption (blk-crypto)
 instead of the tradit [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.73.55 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nARgJ-0002k4-RJ
Subject: [f2fs-dev] [PATCH v10 1/5] fscrypt: add functions for direct I/O
 support
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
Cc: Christoph Hellwig <hch@infradead.org>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Encrypted files traditionally haven't supported DIO, due to the need to
encrypt/decrypt the data.  However, when the encryption is implemented
using inline encryption (blk-crypto) instead of the traditional
filesystem-layer encryption, it is straightforward to support DIO.

In preparation for supporting this, add the following functions:

- fscrypt_dio_unsupported() checks whether a DIO request is unsupported
  due to encryption constraints.  Encrypted files will only support DIO
  when inline encryption is used and the I/O request is properly
  aligned; this function checks these preconditions.

- fscrypt_limit_io_blocks() limits the length of a bio to avoid crossing
  a place in the file that a bio with an encryption context cannot
  cross due to a DUN discontiguity.  This function is needed by
  filesystems that use the iomap DIO implementation (which operates
  directly on logical ranges, so it won't use fscrypt_mergeable_bio())
  and that support FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32.

Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/crypto.c       |  8 ++++
 fs/crypto/inline_crypt.c | 90 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 18 ++++++++
 3 files changed, 116 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 4ef3f714046aa..4fcca79f39aeb 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -69,6 +69,14 @@ void fscrypt_free_bounce_page(struct page *bounce_page)
 }
 EXPORT_SYMBOL(fscrypt_free_bounce_page);
 
+/*
+ * Generate the IV for the given logical block number within the given file.
+ * For filenames encryption, lblk_num == 0.
+ *
+ * Keep this in sync with fscrypt_limit_io_blocks().  fscrypt_limit_io_blocks()
+ * needs to know about any IV generation methods where the low bits of IV don't
+ * simply contain the lblk_num (e.g., IV_INO_LBLK_32).
+ */
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 			 const struct fscrypt_info *ci)
 {
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index c57bebfa48fea..304ae414cbbf2 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -17,6 +17,7 @@
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
 #include <linux/slab.h>
+#include <linux/uio.h>
 
 #include "fscrypt_private.h"
 
@@ -315,6 +316,10 @@ EXPORT_SYMBOL_GPL(fscrypt_set_bio_crypt_ctx_bh);
  *
  * fscrypt_set_bio_crypt_ctx() must have already been called on the bio.
  *
+ * This function isn't required in cases where crypto-mergeability is ensured in
+ * another way, such as I/O targeting only a single file (and thus a single key)
+ * combined with fscrypt_limit_io_blocks() to ensure DUN contiguity.
+ *
  * Return: true iff the I/O is mergeable
  */
 bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
@@ -363,3 +368,88 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 	return fscrypt_mergeable_bio(bio, inode, next_lblk);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
+
+/**
+ * fscrypt_dio_unsupported() - check whether a DIO (direct I/O) request is
+ *			       unsupported due to encryption constraints
+ * @iocb: the file and position the I/O is targeting
+ * @iter: the I/O data segment(s)
+ *
+ * Return: true if DIO is unsupported
+ */
+bool fscrypt_dio_unsupported(struct kiocb *iocb, struct iov_iter *iter)
+{
+	const struct inode *inode = file_inode(iocb->ki_filp);
+	const unsigned int blocksize = i_blocksize(inode);
+
+	/* If the file is unencrypted, no veto from us. */
+	if (!fscrypt_needs_contents_encryption(inode))
+		return false;
+
+	/* We only support DIO with inline crypto, not fs-layer crypto. */
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return true;
+
+	/*
+	 * Since the granularity of encryption is filesystem blocks, the file
+	 * position and total I/O length must be aligned to the filesystem block
+	 * size -- not just to the block device's logical block size as is
+	 * traditionally the case for DIO on many filesystems (not including
+	 * f2fs, which only allows filesystem block aligned DIO anyway).
+	 *
+	 * We also require that the user-provided memory buffers be block
+	 * aligned too.  It is simpler to have a single alignment value required
+	 * for all properties of the I/O, as is normally the case for DIO.
+	 * Also, allowing less aligned buffers would also imply that a data unit
+	 * could cross bvecs, which would greatly complicate the I/O stack,
+	 * which assumes that bios can be split at any bvec boundary.
+	 */
+	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
+		return true;
+
+	return false;
+}
+EXPORT_SYMBOL_GPL(fscrypt_dio_unsupported);
+
+/**
+ * fscrypt_limit_io_blocks() - limit I/O blocks to avoid discontiguous DUNs
+ * @inode: the file on which I/O is being done
+ * @lblk: the block at which the I/O is being started from
+ * @nr_blocks: the number of blocks we want to submit starting at @lblk
+ *
+ * Determine the limit to the number of blocks that can be submitted in a bio
+ * targeting @lblk without causing a data unit number (DUN) discontiguity.
+ *
+ * This is normally just @nr_blocks, as normally the DUNs just increment along
+ * with the logical blocks.  (Or the file is not encrypted.)
+ *
+ * In rare cases, fscrypt can be using an IV generation method that allows the
+ * DUN to wrap around within logically contiguous blocks, and that wraparound
+ * will occur.  If this happens, a value less than @nr_blocks will be returned
+ * so that the wraparound doesn't occur in the middle of a bio, which would
+ * cause encryption/decryption to produce the wrong results.
+ *
+ * Return: the actual number of blocks that can be submitted
+ */
+u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks)
+{
+	const struct fscrypt_info *ci = inode->i_crypt_info;
+	u32 dun;
+
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return nr_blocks;
+
+	if (nr_blocks <= 1)
+		return nr_blocks;
+
+	if (!(fscrypt_policy_flags(&ci->ci_policy) &
+	      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
+		return nr_blocks;
+
+	/* With IV_INO_LBLK_32, the DUN can wrap around from U32_MAX to 0. */
+
+	dun = ci->ci_hashed_ino + lblk;
+
+	return min_t(u64, nr_blocks, (u64)U32_MAX + 1 - dun);
+}
+EXPORT_SYMBOL_GPL(fscrypt_limit_io_blocks);
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index 91ea9477e9bd2..87ec5f63b0a82 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -714,6 +714,10 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
+bool fscrypt_dio_unsupported(struct kiocb *iocb, struct iov_iter *iter);
+
+u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
+
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
@@ -742,6 +746,20 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
 {
 	return true;
 }
+
+static inline bool fscrypt_dio_unsupported(struct kiocb *iocb,
+					   struct iov_iter *iter)
+{
+	const struct inode *inode = file_inode(iocb->ki_filp);
+
+	return fscrypt_needs_contents_encryption(inode);
+}
+
+static inline u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk,
+					  u64 nr_blocks)
+{
+	return nr_blocks;
+}
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 /**
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
