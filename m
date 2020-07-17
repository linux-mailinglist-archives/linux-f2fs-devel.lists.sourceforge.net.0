Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31C93223112
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 17 Jul 2020 04:13:28 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=dUoZHg8giF0Z0oox3o7RVuribtruPDzBexHLCdQa/k8=; b=QMjOpSjBK6sUFnz0wqhOxHodV
	JlmcUAt8UwicVJ+39zaf2Utq+I+whpa4dlejw6S30TQ2Dxa/aJixNnhIt/BPLzJOG7VtgCiJakW8J
	vnv/xDZP7x7GuUcyenMVg2cr6xKLZFXRjjd+BAIHrZ0FXEykH2NWbI+tGCGHFCCqExQhU=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jwFsJ-0004ee-T1; Fri, 17 Jul 2020 02:13:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3yQIRXwYKABIAsBGsBy66y3w.u64@flex--satyat.bounces.google.com>)
 id 1jwFsI-0004eX-Oj
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 02:13:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B0x0K0LAx9+Y7Q8FXBFUwx+eU4+ad8NV7ubLsxeFaf4=; b=RDE8+5yEKi9fU5E6XPYAB1gFY
 VGU1E1jo031L7kbLkiZrbGKYi0n7e09o/ScCjS5y1poxxscKPTKlnDHTgfmALA+TfjM7xBrggVG66
 e0+q0LfhfmD+LRJk5KTkG6J+RbXc771T2R9V+hvsl4RPQCctBf8vb+U7Zb5SrevrIBkJM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B0x0K0LAx9+Y7Q8FXBFUwx+eU4+ad8NV7ubLsxeFaf4=; b=WpxgF39qMBi1hpCm1GGXmrq+AL
 I3UNFyoFVWnaTLcRSs4ExP8oet7xgXTunH3omZcSfWcozuPCSADpqsC4g5MXWsU4vpM7NM++zbNlb
 9jZYQ2eGZpDMEgrdZrY3NqzFkGURLss+qsF3WoGJOaRbgd6taogZ8LkY8byYJogUsiAI=;
Received: from mail-ot1-f74.google.com ([209.85.210.74])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jwFsF-006mXq-Io
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 17 Jul 2020 02:13:22 +0000
Received: by mail-ot1-f74.google.com with SMTP id l13so3639362otf.16
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 16 Jul 2020 19:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=B0x0K0LAx9+Y7Q8FXBFUwx+eU4+ad8NV7ubLsxeFaf4=;
 b=NgLVdFfzPI8rniPtNm8DqUu4McExuVBrHsycos4sDr8HsIC6inA/SB0isGbUmdBmO7
 G/OrVuLZvnL13Tu1mu21s4F7Ileup0x4d6uYiJ/kRc/SQmxDVcl9ygK9eVQ7wsjmIqNo
 eElNu+LzNt9T9mDuksME3/2KwYx+iFpkfHnqd+pwMaw4jxdcWmmUK78AYXj+/Kf9MXkh
 86ClwUljjM8zN95NX5YUb5jda8EvPewsTfVBDH6wUOZej4e/FczD89ejdlyqv5g+4dbU
 6Cz7coqFDmzebNg2T0T8MZ6p/kLm5A96Fi28C012iOqXi7l4A7sD3rqk2EZ5Xxa58Gh/
 WOWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=B0x0K0LAx9+Y7Q8FXBFUwx+eU4+ad8NV7ubLsxeFaf4=;
 b=t+LTCe0hInwVBtL7wI+31l/B3Gwy03uAXYehWgkykoDtVfQfsGLj9VyWledobcj8UY
 G3BZ+SQBfjHF2NC9pnVVxYxdmZckMUfTOCmxrJZO5kbIZ/q+jgZv0EH3pzKnqmKBU6Zr
 ZD7YmcoCv/ZG1TI5OWTvQDK10J0MA73/XkCaswGYvfcWbJ73RrZvHFpyk8VOPqaKEa7j
 JHGMr49rwQgMz2hw4I/W5UZQulWdf74wZMhzV8qr2/iTqPL0EkY72+16C3iE0sNJSAsK
 WYpk7SmTtwMUL4XRKklP33maRLdclk8WxNgaLE2D0Onf2SONyuRUCeEAY4syonWZdyHG
 es6Q==
X-Gm-Message-State: AOAM531IEm6LdBowfKegngDQYoAjBzgvKis8d68fWMDbPAfLwuDhcT3T
 eETNlAHTzcsY/So7cQHFgQsk2xMEsWM=
X-Google-Smtp-Source: ABdhPJx6iODqkhaKqJfQZ6FjelMNp9N/V3wUMH1/G/neMrWU0AXc+o65/W6IN7lPQnmGBJARaC+27IB1sHQ=
X-Received: by 2002:a17:90a:cc03:: with SMTP id
 b3mr6955247pju.80.1594950345389; 
 Thu, 16 Jul 2020 18:45:45 -0700 (PDT)
Date: Fri, 17 Jul 2020 01:45:34 +0000
In-Reply-To: <20200717014540.71515-1-satyat@google.com>
Message-Id: <20200717014540.71515-2-satyat@google.com>
Mime-Version: 1.0
References: <20200717014540.71515-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.2 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.74 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.4 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jwFsF-006mXq-Io
Subject: [f2fs-dev] [PATCH v3 1/7] fscrypt: Add functions for direct I/O
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
From: Satya Tangirala via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Satya Tangirala <satyat@google.com>
Cc: linux-xfs@vger.kernel.org, Satya Tangirala <satyat@google.com>,
 Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Introduce fscrypt_dio_supported() to check whether a direct I/O request
is unsupported due to encryption constraints, and
fscrypt_limit_io_pages() to check how many pages may be added to a bio
being prepared for direct I/O.

The IV_INO_LBLK_32 fscrypt policy introduced the possibility that DUNs
in logically continuous file blocks might wrap from 0xffffffff to 0.
Since this was particularly difficult to handle when block_size !=
PAGE_SIZE, fscrypt only supports blk-crypto en/decryption with
the IV_INO_LBLK_32 policy when block_size == PAGE_SIZE, and ensures that
the DUN never wraps around within any submitted bio.
fscrypt_limit_io_pages() can be used to determine the number of logically
contiguous blocks/pages that may be added to the bio without causing the
DUN to wrap around within the bio. This is an alternative to calling
fscrypt_mergeable_bio() on each page in a range of logically contiguous
pages.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/crypto/crypto.c       |  8 ++++
 fs/crypto/inline_crypt.c | 80 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 19 ++++++++++
 3 files changed, 107 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index a52cf32733ab..fb34364360b3 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -69,6 +69,14 @@ void fscrypt_free_bounce_page(struct page *bounce_page)
 }
 EXPORT_SYMBOL(fscrypt_free_bounce_page);
 
+/*
+ * Generate the IV for the given logical block number within the given file.
+ * For filenames encryption, lblk_num == 0.
+ *
+ * Keep this in sync with fscrypt_limit_io_pages().  fscrypt_limit_io_pages()
+ * needs to know about any IV generation methods where the low bits of IV don't
+ * simply contain the lblk_num (e.g., IV_INO_LBLK_32).
+ */
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 			 const struct fscrypt_info *ci)
 {
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index d7aecadf33c1..f5af6a63e04c 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -16,6 +16,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
+#include <linux/uio.h>
 
 #include "fscrypt_private.h"
 
@@ -362,3 +363,82 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
 	return fscrypt_mergeable_bio(bio, inode, next_lblk);
 }
 EXPORT_SYMBOL_GPL(fscrypt_mergeable_bio_bh);
+
+/**
+ * fscrypt_dio_supported() - check whether a direct I/O request is unsupported
+ *			     due to encryption constraints
+ * @iocb: the file and position the I/O is targeting
+ * @iter: the I/O data segment(s)
+ *
+ * Return: true if direct I/O is supported
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
+	/* We only support direct I/O with inline crypto, not fs-layer crypto */
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return false;
+
+	/*
+	 * Since the granularity of encryption is filesystem blocks, the I/O
+	 * must be block aligned -- not just disk sector aligned.
+	 */
+	if (!IS_ALIGNED(iocb->ki_pos | iov_iter_alignment(iter), blocksize))
+		return false;
+
+	return true;
+}
+EXPORT_SYMBOL_GPL(fscrypt_dio_supported);
+
+/**
+ * fscrypt_limit_io_pages() - limit I/O pages to avoid discontiguous DUNs
+ * @inode: the file on which I/O is being done
+ * @pos: the file position (in bytes) at which the I/O is being done
+ * @nr_pages: the number of pages we want to submit starting at @pos
+ *
+ * Determine the limit to the number of pages that can be submitted in the bio
+ * targeting @pos without causing a data unit number (DUN) discontinuity.
+ *
+ * For IV generation methods that can't cause DUN wraparounds
+ * within logically continuous data blocks, the maximum number of pages is
+ * simply @nr_pages. For those IV generation methods that *might* cause DUN
+ * wraparounds, the returned number of pages is the largest possible number of
+ * pages (less than @nr_pages) that can be added to the bio without causing a
+ * DUN wraparound within the bio.
+ *
+ * Return: the actual number of pages that can be submitted
+ */
+int fscrypt_limit_io_pages(const struct inode *inode, loff_t pos, int nr_pages)
+{
+	const struct fscrypt_info *ci = inode->i_crypt_info;
+	u32 dun;
+
+	if (!fscrypt_inode_uses_inline_crypto(inode))
+		return nr_pages;
+
+	if (nr_pages <= 1)
+		return nr_pages;
+
+	if (!(fscrypt_policy_flags(&ci->ci_policy) &
+	      FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32))
+		return nr_pages;
+
+	/*
+	 * fscrypt_select_encryption_impl() ensures that block_size == PAGE_SIZE
+	 * when using FSCRYPT_POLICY_FLAG_IV_INO_LBLK_32.
+	 */
+	if (WARN_ON_ONCE(i_blocksize(inode) != PAGE_SIZE))
+		return 1;
+
+	/* With IV_INO_LBLK_32, the DUN can wrap around from U32_MAX to 0. */
+
+	dun = ci->ci_hashed_ino + (pos >> inode->i_blkbits);
+
+	return min_t(u64, nr_pages, (u64)U32_MAX + 1 - dun);
+}
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index bb257411365f..c205c214b35e 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -559,6 +559,11 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
+bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
+
+int fscrypt_limit_io_pages(const struct inode *inode, loff_t pos,
+			   int nr_pages);
+
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
@@ -587,6 +592,20 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
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
+static inline int fscrypt_limit_io_pages(const struct inode *inode, loff_t pos,
+					 int nr_pages)
+{
+	return nr_pages;
+}
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 /**
-- 
2.28.0.rc0.105.gf9edc3c819-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
