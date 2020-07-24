Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E02E222C500
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 14:19:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=01zmt5QCAIRkrHbT9yYGDfbvIpsziqCLUOAbPyvE76c=; b=c7HG08bHSzq5XpgiQEs+wT0EM
	9nn1dY6V4P9SC6CLVnku+/+rZCBf5hNjwxiOPo8Pm62ggriPm59sWYBBtcAkvXRB3ssWkw7KkVDxn
	nuzEsvClybO4YI4ofcQQaSp6NN3xdh3g1fLPyCQr2Q0ViAVTL6MXWTr9a6AJPOvhsJteA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jywfz-0003E8-Mj; Fri, 24 Jul 2020 12:19:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3BtAaXwYKABE9rAFrAx55x2v.t53@flex--satyat.bounces.google.com>)
 id 1jywfx-0003E0-DS
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4xTRuI3ukKx1mDSkufTvw87vWQHQ0dgTXmHXj781XZU=; b=AgTQTbeCV7UIXDabT6c4cG8yZ
 Ey0kBGnUPGGz6RIEkFJa4u7Yq/TZIOBUfagi/3MfxqoSwZypMDoEy2RJO0ohGoTmqZB0djgFAlLjl
 jm1kXft3xV8GlI6GrRFn8DGxIi6N2xlirVVaRa4+8jr6Nk7vXaFwoOKjIRti3wEXPmlxE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4xTRuI3ukKx1mDSkufTvw87vWQHQ0dgTXmHXj781XZU=; b=jT5FU+w2M4mUoOKJPsaA9feULz
 +dXidL01g71PehnKSA71Eb1CGTqMPRH0AmPvvJuEsOVBjXIpVm63KqqWw5iyHre83CJUH9+DmBaYT
 tgoph/zILi07RSpak9keiIlmKCK62kaJPErt0b9INVxTJvj5JO599S2CPk/e3Wh07HLc=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jywfv-00Fw8R-IU
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 12:19:45 +0000
Received: by mail-qv1-f74.google.com with SMTP id v10so5713904qvm.17
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 05:19:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=4xTRuI3ukKx1mDSkufTvw87vWQHQ0dgTXmHXj781XZU=;
 b=N35TMO4OE5kGfZVI5qQnSlReA8YO6TKhSrFFQsy+zHisRguZKA0D647ajrnQunN/zO
 2wQDoZqvZtkAk+XWhTyyxFng93mQolkeCib9MBocXXlXVMNLQhIAZHu0l11caFNvSt2B
 psJrEvBzsqSgCzpY64vuuaSg75wCN2glWHgTvDD3SLLN1K59mikEFaQo3NGJlA+0Sg5m
 cWMgANsw/QjmbXvUa7ebKP5ohSO/0RS/2ws/RHvtEulePdWZh+ts8WxG0gKy4SKqH9qO
 K4sPjKDxrOUYA+Gy9/CMT9GjbRYxQYjTPHv7kEHk9LJxiZrERYpeP4cH2m+zjt4GN4iK
 eDOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=4xTRuI3ukKx1mDSkufTvw87vWQHQ0dgTXmHXj781XZU=;
 b=hiS3kQoJqEJ4X1Enp28rIhpa5MCMZ3ApGBIY9nuUiQXRw2E84MYVrdlvqz1RfWs/nA
 QwjzU11xiGT3dbAZyHyBiL9/pdPuirJHASCyZoSQYbB9dExgRIJYS53gYNoaVM0WU045
 kRefvNzwmZi6ZdtiRilqOW8WnE8pt+mNsHFJJRj3oAzDisQyrCKWCM+6AN22Ixl6YtK1
 al0TccbC27v6O5127C7yBN+15nJyERukjhrxlVGsdfJV8AcSo3QZRxscV4DU5sXohvCA
 YRq2F+VcF3NYQcjMvdcYjGFYCkhG54H40Ml3sEw53Oms0aPgm4SXbwVtMfmFi7pe7y7I
 cOcQ==
X-Gm-Message-State: AOAM530kYYwR92L5ueeIHPA6/2G7rLHJd3+4KVRtmhPgA/EFNQ7pLeMO
 lr9+yuoqMFendJ1llfGQsuiCfTlXeZU=
X-Google-Smtp-Source: ABdhPJzQmAzL231qx4WpEAUhCmv3dBYfdDZAE2MV5FlcIdPxHxVXBkGNvZkUdE0gc+2cgccNhZoSHps7xrw=
X-Received: by 2002:aa7:9303:: with SMTP id 3mr8570871pfj.108.1595592710801;
 Fri, 24 Jul 2020 05:11:50 -0700 (PDT)
Date: Fri, 24 Jul 2020 12:11:37 +0000
In-Reply-To: <20200724121143.1589121-1-satyat@google.com>
Message-Id: <20200724121143.1589121-2-satyat@google.com>
Mime-Version: 1.0
References: <20200724121143.1589121-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jywfv-00Fw8R-IU
Subject: [f2fs-dev] [PATCH v5 1/7] fscrypt: Add functions for direct I/O
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
Cc: linux-xfs@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Introduce fscrypt_dio_supported() to check whether a direct I/O request
is unsupported due to encryption constraints.

Also introduce fscrypt_limit_io_blocks() to limit how many blocks can be
added to a bio being prepared for direct I/O. This is needed for
filesystems that use the iomap direct I/O implementation to avoid DUN
wraparound in the middle of a bio (which is possible with the
IV_INO_LBLK_32 IV generation method). Elsewhere fscrypt_mergeable_bio()
is used for this, but iomap operates on logical ranges directly, so
filesystems using iomap won't have a chance to call fscrypt_mergeable_bio()
on every block added to a bio. So we need this function which limits a
logical range in one go.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Co-developed-by: Satya Tangirala <satyat@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/crypto/crypto.c       |  8 +++++
 fs/crypto/inline_crypt.c | 75 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 19 ++++++++++
 3 files changed, 102 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index a52cf32733ab..d2e933eb98dd 100644
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
index d7aecadf33c1..2cac0da0bd04 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -16,6 +16,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
+#include <linux/uio.h>
 
 #include "fscrypt_private.h"
 
@@ -362,3 +363,77 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
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
+ * fscrypt_limit_io_blocks() - limit I/O blocks to avoid discontiguous DUNs
+ * @inode: the file on which I/O is being done
+ * @pos: the file position (in bytes) at which the I/O is being done
+ * @nr_blocks: the number of blocks we want to submit starting at @pos
+ *
+ * Determine the limit to the number of blocks that can be submitted in the bio
+ * targeting @pos without causing a data unit number (DUN) discontinuity.
+ *
+ * This is normally just @nr_blocks, as normally the DUNs just increment along
+ * with the logical blocks.  (Or the file is not encrypted.)
+ *
+ * In rare cases, fscrypt can be using an IV generation method that allows the
+ * DUN to wrap around within logically continuous blocks, and that wraparound
+ * will occur.  If this happens, a value less than @nr_blocks will be returned
+ * so that the wraparound doesn't occur in the middle of the bio.
+ *
+ * Return: the actual number of blocks that can be submitted
+ */
+int fscrypt_limit_io_blocks(const struct inode *inode, loff_t pos,
+			    unsigned int nr_blocks)
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
+	dun = ci->ci_hashed_ino + (pos >> inode->i_blkbits);
+
+	return min_t(u64, nr_blocks, (u64)U32_MAX + 1 - dun);
+}
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index bb257411365f..241266cba21f 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -559,6 +559,11 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
+bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
+
+int fscrypt_limit_io_blocks(const struct inode *inode, loff_t pos,
+			    unsigned int nr_blocks);
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
+static inline int fscrypt_limit_io_blocks(const struct inode *inode, loff_t pos,
+					  unsigned int nr_blocks)
+{
+	return nr_blocks;
+}
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 /**
-- 
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
