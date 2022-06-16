Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 094C254EABC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Jun 2022 22:18:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1o1vwo-0000gt-OL; Thu, 16 Jun 2022 20:18:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <ebiggers@kernel.org>) id 1o1vwn-0000gj-Be
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UTsS95/tb2rzqgN0p6QPwSeFikU11Im49jTRXMTDEsE=; b=L8/V3kVuXFqmqLHUSsPGWloNYt
 gWm5uRaHIeXhL8wLSHDISnL5iA7DYCAhKa6yTQzFzQEc3fdzmndHJVRfMGMX5PDIQEhan999ZCc9Y
 8gEByVkArLvmVAbwBxJtXi78/igBoiuEeecrsojxjG4ns49nXZfo2bfGOM/ius8LRH5M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UTsS95/tb2rzqgN0p6QPwSeFikU11Im49jTRXMTDEsE=; b=T02vPXtWyKwBRdqJqj5PWapThg
 zOvUoZ6WTwyAB2zBlF1KH5rSWIrOU+uO0nTeCeak7Fed46CQEN0/DWunoIB7QMeVVZkKmFxk1wzcx
 vke6eXceak/39JXVcZktUYsMF9jfekixzzyyyBJcnMcvqRX+ncReJLogZWO+d9MT5xak=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1o1vwk-004Sqg-Dj
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Jun 2022 20:18:31 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0CCA361DB2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jun 2022 20:18:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33107C341C0;
 Thu, 16 Jun 2022 20:18:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1655410696;
 bh=YJVGyiBnqVoN0NLycfwd+Fncw9iF3+UgjvMpk8X7XgY=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=W/2tMJqJRdFsOIgfRCrD4gdTRs7tva0WGA9GjPlOIg2GLbHBnRjbr0ZfiYF3HyEyA
 R+ljC18pLifjmXLCY1wVyIREnZqDgvkN073/lxTPovIxFcXc+PVwYZUDadq9Pmf95e
 lg3S7sz83Cqg6k5Ur6e906fkK3Jr7CRX7htYfNRi7cLPs1fp4wPuhNHTYC/NjNV+PX
 2kx0XlFW2FelixfOz+gf0VvzZITezD+vjBZDAcAZyG0L1BQSS4LBuVqwuWVbLhnF1v
 2YRNKkMDT3Q4GgYh1mhFzYd3gci1lV3jdJtEG54YBK25beLuOH8+GXoJWgUbZDDkyW
 33uG3uFmfgvOg==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fsdevel@vger.kernel.org
Date: Thu, 16 Jun 2022 13:15:01 -0700
Message-Id: <20220616201506.124209-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.36.1
In-Reply-To: <20220616201506.124209-1-ebiggers@kernel.org>
References: <20220616201506.124209-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> To prepare for
 STATX_DIOALIGN
 support, make two changes to fscrypt_dio_supported(). First,
 remove the filesystem-block-alignment
 check and make the filesystems handle it instead. It previously made sense
 to have it in fs/crypto/; however, to support STATX_DIOALIGN the alignment
 restr [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1o1vwk-004Sqg-Dj
Subject: [f2fs-dev] [PATCH v3 3/8] fscrypt: change fscrypt_dio_supported()
 to prepare for STATX_DIOALIGN
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
Cc: linux-block@vger.kernel.org, linux-api@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fscrypt@vger.kernel.org,
 Keith Busch <kbusch@kernel.org>, linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

To prepare for STATX_DIOALIGN support, make two changes to
fscrypt_dio_supported().

First, remove the filesystem-block-alignment check and make the
filesystems handle it instead.  It previously made sense to have it in
fs/crypto/; however, to support STATX_DIOALIGN the alignment restriction
would have to be returned to filesystems.  It ends up being simpler if
filesystems handle this part themselves, especially for f2fs which only
allows fs-block-aligned DIO in the first place.

Second, make fscrypt_dio_supported() work on inodes whose encryption key
hasn't been set up yet, by making it set up the key if needed.  This is
required for statx(), since statx() doesn't require a file descriptor.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/crypto/inline_crypt.c | 48 +++++++++++++++++++++-------------------
 fs/ext4/file.c           |  9 ++++++--
 fs/f2fs/f2fs.h           |  2 +-
 include/linux/fscrypt.h  |  7 ++----
 4 files changed, 35 insertions(+), 31 deletions(-)

diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index 90f3e68f166e3..388e2330d6263 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -401,43 +401,45 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
 
 /**
- * fscrypt_dio_supported() - check whether a DIO (direct I/O) request is
- *			     supported as far as encryption is concerned
- * @iocb: the file and position the I/O is targeting
- * @iter: the I/O data segment(s)
+ * fscrypt_dio_supported() - check whether DIO (direct I/O) is supported on an
+ *			     inode, as far as encryption is concerned
+ * @inode: the inode in question
  *
  * Return: %true if there are no encryption constraints that prevent DIO from
  *	   being supported; %false if DIO is unsupported.  (Note that in the
  *	   %true case, the filesystem might have other, non-encryption-related
- *	   constraints that prevent DIO from actually being supported.)
+ *	   constraints that prevent DIO from actually being supported.  Also, on
+ *	   encrypted files the filesystem is still responsible for only allowing
+ *	   DIO when requests are filesystem-block-aligned.)
  */
-bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
+bool fscrypt_dio_supported(struct inode *inode)
 {
-	const struct inode *inode = file_inode(iocb->ki_filp);
-	const unsigned int blocksize = i_blocksize(inode);
+	int err;
 
 	/* If the file is unencrypted, no veto from us. */
 	if (!fscrypt_needs_contents_encryption(inode))
 		return true;
 
-	/* We only support DIO with inline crypto, not fs-layer crypto. */
-	if (!fscrypt_inode_uses_inline_crypto(inode))
-		return false;
-
 	/*
-	 * Since the granularity of encryption is filesystem blocks, the file
-	 * position and total I/O length must be aligned to the filesystem block
-	 * size -- not just to the block device's logical block size as is
-	 * traditionally the case for DIO on many filesystems.
+	 * We only support DIO with inline crypto, not fs-layer crypto.
 	 *
-	 * We require that the user-provided memory buffers be filesystem block
-	 * aligned too.  It is simpler to have a single alignment value required
-	 * for all properties of the I/O, as is normally the case for DIO.
-	 * Also, allowing less aligned buffers would imply that data units could
-	 * cross bvecs, which would greatly complicate the I/O stack, which
-	 * assumes that bios can be split at any bvec boundary.
+	 * To determine whether the inode is using inline crypto, we have to set
+	 * up the key if it wasn't already done.  This is because in the current
+	 * design of fscrypt, the decision of whether to use inline crypto or
+	 * not isn't made until the inode's encryption key is being set up.  In
+	 * the DIO read/write case, the key will always be set up already, since
+	 * the file will be open.  But in the case of statx(), the key might not
+	 * be set up yet, as the file might not have been opened yet.
 	 */
-	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
+	err = fscrypt_require_key(inode);
+	if (err) {
+		/*
+		 * Key unavailable or couldn't be set up.  This edge case isn't
+		 * worth worrying about; just report that DIO is unsupported.
+		 */
+		return false;
+	}
+	if (!fscrypt_inode_uses_inline_crypto(inode))
 		return false;
 
 	return true;
diff --git a/fs/ext4/file.c b/fs/ext4/file.c
index 109d07629f81f..26d7426208970 100644
--- a/fs/ext4/file.c
+++ b/fs/ext4/file.c
@@ -40,8 +40,13 @@ static bool ext4_dio_supported(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct inode *inode = file_inode(iocb->ki_filp);
 
-	if (!fscrypt_dio_supported(iocb, iter))
-		return false;
+	if (IS_ENCRYPTED(inode)) {
+		if (!fscrypt_dio_supported(inode))
+			return false;
+		if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter),
+				i_blocksize(inode)))
+			return false;
+	}
 	if (fsverity_active(inode))
 		return false;
 	if (ext4_should_journal_data(inode))
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d9bbecd008d22..7869e749700fc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4453,7 +4453,7 @@ static inline bool f2fs_force_buffered_io(struct inode *inode,
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int rw = iov_iter_rw(iter);
 
-	if (!fscrypt_dio_supported(iocb, iter))
+	if (!fscrypt_dio_supported(inode))
 		return true;
 	if (fsverity_active(inode))
 		return true;
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index e60d57c99cb6f..0f9f5ed5b34d3 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -763,7 +763,7 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
-bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
+bool fscrypt_dio_supported(struct inode *inode);
 
 u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
 
@@ -796,11 +796,8 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
 	return true;
 }
 
-static inline bool fscrypt_dio_supported(struct kiocb *iocb,
-					 struct iov_iter *iter)
+static inline bool fscrypt_dio_supported(struct inode *inode)
 {
-	const struct inode *inode = file_inode(iocb->ki_filp);
-
 	return !fscrypt_needs_contents_encryption(inode);
 }
 
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
