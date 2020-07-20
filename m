Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 927FC227321
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 Jul 2020 01:38:00 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=itpfZhR2Cw/THBYGF+GUDC1SqcWoLV2MPvB/hKt3CmM=; b=KmUuU2XB7LaLD0yU57tQMkuk+
	Rx7l++pHnjV9l45/OilJPvVLCHY9kqOaxJiw9LK5eJOPLZRz/nfuTJajZIXOT3TiQa+KjpNBnekiX
	Cn3ckc/Nwg6yS1HogRF+s4oJG4WF61G0ZX5ywJXw28AsP0U7Tqt14FkCj/s8XylfIkMiw=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jxfM2-0006kw-Et; Mon, 20 Jul 2020 23:37:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3xyoWXwYKAHQkSlqSlYggYdW.Uge@flex--satyat.bounces.google.com>)
 id 1jxfLy-0006kb-PW
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=78GCUtC2EJb5xFkhhGe6IF9iMHYw65a1BFMDAATd+tM=; b=KLa3pWlfJSIVssz13WXFi1Wrv
 1ZVddBuf9voebhKnqJ50463gncF4fud5+TdjCAL5IOHcoX6urFpZW3s6S0AtQ/fHBUdYsJLYWFfzd
 279UhIWfKJQi3oqbUJiRIxhNHmNp66CBBCdlrIOX7j5yjcsKlPPjo6uXN0WVRIABMcqO0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=78GCUtC2EJb5xFkhhGe6IF9iMHYw65a1BFMDAATd+tM=; b=Pf5BsCwotm9gBK6/htwRpcaSuK
 Qdh28UpuBjFDEJRAtPhyXJP40YqE4Eti/yj3eLunSEBep1PJ5SqWfBDG+S0K/EhiZUXU3hOd9gCvk
 TcsnPXhxcARUjOBorC6TiT+RbB2TuGagPo3QXmFb0lGxJ/9U+/86ufp9OcdjczcKr8bI=;
Received: from mail-pf1-f201.google.com ([209.85.210.201])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jxfLx-00BOmd-JM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 20 Jul 2020 23:37:50 +0000
Received: by mail-pf1-f201.google.com with SMTP id p127so13744079pfb.18
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 20 Jul 2020 16:37:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=78GCUtC2EJb5xFkhhGe6IF9iMHYw65a1BFMDAATd+tM=;
 b=lkpZaPPO0o9p4yIi3O6zslsFFa6VTPWtl9+t0qQhOOHEfjykofCGv4XWyGbTVGdZBG
 HzWDaEtN8698pdn2aTFpG8HuDPZfDac0Y/XH9WALkV4xMk4RcIO9bcz2ZXOpaY0Sfehx
 lP71p+Rta787ELUsWjbLhMHWDGiFThC9sMyjANfpSd26fX1QXddv9rX0t5wBFzIZSeR2
 s9T5O03polQpLellXjs1QFq90w68S3SdWsUozTPGniK/YZTIqHTdGkIloqhPUHAEMAV0
 2SPVD+fqQJyOQbl2r4Mid3U2Lt99zM2U41kXVxc4sPtt2HLgvlIFc0EXEWIxHiVJaQjD
 Mrgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=78GCUtC2EJb5xFkhhGe6IF9iMHYw65a1BFMDAATd+tM=;
 b=sxfLgZIWZjiPUYUPuFtaBiXbWT25swSGp4szDESb7IvCDkoIX+1GaNA9dzzHLYMhQQ
 5RKkN06WBEAoXbV3YCSPMwbGxvrC2rKFOrX9Ai6X52XZUhSmBs+jlFZkNQoTpd+1hUEs
 5ZQz5Ku1mo/huLAB6Tz7Dxbujo8Q3EI6vHK+izAP+vhugQ4Cf+WE0JIhM5+8/qpcszJG
 v6KJPbhuoKgK/hqQ015b1PJ4L+rcM7WmK9SM0xK48wI80+gVi/YZR8kMtujHgPPn3txo
 +6vlk7OZdPC6It09ukdSo23RgZAzGtyvm3gEHTP9xCj/U89HPp6l4A8g2DsNBdrZ4bhn
 PXsA==
X-Gm-Message-State: AOAM531yVG6WRXqGeewZzYJknuMkJwYjZ14eQrJKWMUnrUakJ5/sROkB
 Im2rPwvQunVAHcCdCwPGDZbcWHZnc5E=
X-Google-Smtp-Source: ABdhPJy7HvbL+o/wyQ1O2/q8SGQvr4PUhB7PDyMWpWlUU6ltb62Bb253HTRsPOHxSxZ+knnHL7Gb31iKEic=
X-Received: by 2002:a62:3741:: with SMTP id e62mr20982650pfa.127.1595288263980; 
 Mon, 20 Jul 2020 16:37:43 -0700 (PDT)
Date: Mon, 20 Jul 2020 23:37:33 +0000
In-Reply-To: <20200720233739.824943-1-satyat@google.com>
Message-Id: <20200720233739.824943-2-satyat@google.com>
Mime-Version: 1.0
References: <20200720233739.824943-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.105.gf9edc3c819-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -6.4 (------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.201 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.201 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 1.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jxfLx-00BOmd-JM
Subject: [f2fs-dev] [PATCH v4 1/7] fscrypt: Add functions for direct I/O
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
is unsupported due to encryption constraints.

Also introduce fscrypt_limit_io_pages() to limit how many pages can be
added to a bio being prepared for direct I/O. This is needed for the
iomap direct I/O implementation to avoid DUN wraparound in the middle of
a bio (which is possible with the IV_INO_LBLK_32 IV generation method).
Elsewhere fscrypt_mergeable_bio() is used for this, but iomap operates
on logical ranges directly and doesn't have a chance to call
fscrypt_mergeable_bio() on every block or page. So we need this function
which limits a logical range in one go.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/crypto/crypto.c       |  8 ++++
 fs/crypto/inline_crypt.c | 82 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 19 ++++++++++
 3 files changed, 109 insertions(+)

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
index d7aecadf33c1..578739712e00 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -16,6 +16,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
+#include <linux/uio.h>
 
 #include "fscrypt_private.h"
 
@@ -362,3 +363,84 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
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
+ * This is normally just @nr_pages, as normally the DUNs just increment along
+ * with the logical blocks.  (Or the file is not encrypted.)
+ *
+ * In rare cases, fscrypt can be using an IV generation method that allows the
+ * DUN to wrap around within logically continuous blocks, and that wraparound
+ * will occur.  If this happens, a value less than @nr_pages will be returned so
+ * that the wraparound doesn't occur in the middle of the bio.  Note that we
+ * only support block_size == PAGE_SIZE (and page-aligned DIO) in such cases.
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
