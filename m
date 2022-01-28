Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D6094A0466
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 29 Jan 2022 00:40:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nDaqm-0000fL-9k; Fri, 28 Jan 2022 23:40:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1nDaqk-0000fE-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 23:40:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QxEJ40AeoBw6DRo7qVtMWD5cO+NHKKecr+L233EH/as=; b=knRC2sv8rsOuhTOt5OASXZC3x3
 F6vK/vry1rKvB3WIB38yQzAbAIGN0m3igh6p/ByQWCVw7PUJphkCNDQfUrMicBX5TLhC1mI2AHSMo
 4rrAsxWR31C8YOqsrvjyLtHdYHipxuAuHcZbAbZ5cR4ZjOLamvkdsyOwRbLI70PcUfeE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=QxEJ40AeoBw6DRo7qVtMWD5cO+NHKKecr+L233EH/as=; b=FB6IiQYQfWsK+ODus76RV+iAbk
 Qhv+VQpWWtZkn/rMHJcr2vj7GHfMeJvcdgLFhZnF38KrVuxY28EWySn2GgEpdjlTMUAH3HLVNC1lT
 AMGgF/dC2wLy3yYgKmh9sK+K2HDQ3khkDYYAmuAKDDopa87XPNopVoWcWDA4D58Xask8=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nDaqh-0002Hd-TQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 28 Jan 2022 23:40:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id CC89D61F3B;
 Fri, 28 Jan 2022 23:40:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 03707C340E8;
 Fri, 28 Jan 2022 23:40:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1643413202;
 bh=yiJ5auAF7JlzipXtd7lawfYtaCcPGJqBWUK7WtxVTJs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=XdMaShpIV4mcMhEEUMQ+vmfTLdENDgUwM4qV149wNeY7xw8aE6S5zgQ1DNLvS2He+
 JXLPtrbLOwALBQtzm45D58Dco9sOCUgIVINqAW9unbiplh6y4ATbb+S8FphWg06v3G
 sm8TgSoft6a/6d3UqG0gJBmSudZrHHCREL/4bFe+L32I9MANMQE5L24lElKTiEV2L8
 ZkM2V9txAiN3jkZDU0Jklr/7y62Z9skQgDd66R92uKE1GzkYHOnMFYzJdmihTO9quC
 dr83hY4EzsmkedIW1PMg7KHDFgd6sl3jYVtwA4JCiiAghr+odI786ET/Hba2HUz4lh
 T+ZAs3Dq0CKqg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 28 Jan 2022 15:39:36 -0800
Message-Id: <20220128233940.79464-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.35.0
In-Reply-To: <20220128233940.79464-1-ebiggers@kernel.org>
References: <20220128233940.79464-1-ebiggers@kernel.org>
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
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1nDaqh-0002Hd-TQ
Subject: [f2fs-dev] [PATCH v11 1/5] fscrypt: add functions for direct I/O
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 "Darrick J . Wong" <djwong@kernel.org>, Dave Chinner <david@fromorbit.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org, Christoph Hellwig <hch@lst.de>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Encrypted files traditionally haven't supported DIO, due to the need to
encrypt/decrypt the data.  However, when the encryption is implemented
using inline encryption (blk-crypto) instead of the traditional
filesystem-layer encryption, it is straightforward to support DIO.

In preparation for supporting this, add the following functions:

- fscrypt_dio_supported() checks whether a DIO request is supported as
  far as encryption is concerned.  Encrypted files will only support DIO
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
 fs/crypto/inline_crypt.c | 93 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 18 ++++++++
 3 files changed, 119 insertions(+)

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
index c57bebfa48fea..93c2ca8580923 100644
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
@@ -363,3 +368,91 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 	return fscrypt_mergeable_bio(bio, inode, next_lblk);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
+
+/**
+ * fscrypt_dio_supported() - check whether a DIO (direct I/O) request is
+ *			     supported as far as encryption is concerned
+ * @iocb: the file and position the I/O is targeting
+ * @iter: the I/O data segment(s)
+ *
+ * Return: %true if there are no encryption constraints that prevent DIO from
+ *	   being supported; %false if DIO is unsupported.  (Note that in the
+ *	   %true case, the filesystem might have other, non-encryption-related
+ *	   constraints that prevent DIO from actually being supported.)
+ */
+bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
+{
+	const struct inode *inode = file_inode(iocb->ki_filp);
+	const unsigned int blocksize = i_blocksize(inode);
+
+	/* If the file is unencrypted, no veto from us. */
+	if (!fscrypt_needs_contents_encryption(inode))
+		return true;
+
+	/* We only support DIO with inline crypto, not fs-layer crypto. */
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return false;
+
+	/*
+	 * Since the granularity of encryption is filesystem blocks, the file
+	 * position and total I/O length must be aligned to the filesystem block
+	 * size -- not just to the block device's logical block size as is
+	 * traditionally the case for DIO on many filesystems.
+	 *
+	 * We require that the user-provided memory buffers be filesystem block
+	 * aligned too.  It is simpler to have a single alignment value required
+	 * for all properties of the I/O, as is normally the case for DIO.
+	 * Also, allowing less aligned buffers would imply that data units could
+	 * cross bvecs, which would greatly complicate the I/O stack, which
+	 * assumes that bios can be split at any bvec boundary.
+	 */
+	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(fscrypt_dio_supported);
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
+ * cause encryption/decryption to produce wrong results.
+ *
+ * Return: the actual number of blocks that can be submitted
+ */
+u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks)
+{
+	const struct fscrypt_info *ci;
+	u32 dun;
+
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return nr_blocks;
+
+	if (nr_blocks <= 1)
+		return nr_blocks;
+
+	ci = inode->i_crypt_info;
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
index 91ea9477e9bd2..50d92d805bd8c 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -714,6 +714,10 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
+bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
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
+static inline bool fscrypt_dio_supported(struct kiocb *iocb,
+					 struct iov_iter *iter)
+{
+	const struct inode *inode = file_inode(iocb->ki_filp);
+
+	return !fscrypt_needs_contents_encryption(inode);
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
2.35.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
