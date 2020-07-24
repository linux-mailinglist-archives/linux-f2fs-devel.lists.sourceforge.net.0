Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A73622CE06
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Jul 2020 20:45:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=rCU30qgE1CH9mKxg6kPIA3W1srKMf7vcI3+Hmms+KC0=; b=J2KzybHWZwx0hPNZ9yMR4HNEH
	qGLainyjZ9WZp7/t3omr86c+CGZPggpBZh+Of587Vnsu4psCzTeWrAEZ5VrTkElVx+ZK+44S365ZU
	kKt/CXHnucQHU1/d42Sa65N0JNteqny6njI53QuH/li5nm+P4WO4II2N8qxWESX7Ke3PQ=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jz2h2-0007j1-1m; Fri, 24 Jul 2020 18:45:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3MywbXwYKAPYqYrwYremmejc.amk@flex--satyat.bounces.google.com>)
 id 1jz2h1-0007ir-48
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e3QQnyJEAo5uWrYUDsDCPQeAxWHqtOZ6h6W8L9vv5Ok=; b=jphmuPUYL8q4DmferAIOX3fH5
 nGIP/FJb1Wm0/FDTkQxw1qWRnNpniUfZLlm6KHzjkQnjPqgySBjjm8knkRiRsoay431I58q/vcbn3
 Oe25R/5BNKnO1lP4PBLuHyMIQUEt4qFUUN6NR83eD8dXW7WuX7dQbrAiMElMc482OZoWM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=e3QQnyJEAo5uWrYUDsDCPQeAxWHqtOZ6h6W8L9vv5Ok=; b=JmaVa4MFaV8SjauuhALgKBallb
 kbkHCynlA1IR2JQxgcUrd1uglMVesaGzz4NDeTRRFrIklbFAx5VqvnDxmwa6QnDe/y+iOxkUAo/pC
 h3Djcn5A4Teos8VETOyRRL2SBGlhLcP5mH1ttZ0J+fGSVxD0vTqJTthDS4Tjx+l68KCM=;
Received: from mail-yb1-f202.google.com ([209.85.219.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jz2gz-001epW-Lc
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 24 Jul 2020 18:45:15 +0000
Received: by mail-yb1-f202.google.com with SMTP id a14so2913581ybm.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Jul 2020 11:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=e3QQnyJEAo5uWrYUDsDCPQeAxWHqtOZ6h6W8L9vv5Ok=;
 b=fiwV9W1rn8xIx3eZin4HllP1i3QSz+XUBPdewpcOoRimkQuoOrFrKuu38oLKdxH/DL
 vjPZdSY437ObQqT07i4flLI+1fCaVT7Ymuca2SmUy4H+CrkIrxGI6jsA4EgPZZauHHUt
 w/Tg2NAvoP98hkyUVK+5yBTBUA/3l8/6rYlDlWHfAmPIHHvKIXtSVukfxFwkMujd4Zv2
 aD16Gnr0+DPz3kaVcz9meN+oEqmVMDwbCt7HOOFTt1XvP0x1pFx5ASr/LQ43SiIqmiEF
 dJNIHgPR6/zhiU7zn6P9EKElVptiQsjVOLZRH9RuAggnZ6iX8hjjZSEwMbuHQegF+4MK
 IBnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=e3QQnyJEAo5uWrYUDsDCPQeAxWHqtOZ6h6W8L9vv5Ok=;
 b=lttNAoYjYemHEEKiZ215GOzjvxGRL3ekAZNaFqFhkjRSUxdZ7zeWRocb4p3rBQK3tO
 3rEAoIE7s/nowHbwYmP5sQPWUboqd23bpDUG/zn2F0iC4RBLnP9Bxjr1S8NmQ5m4eul/
 MZjVXbUR8uiA0lYjor5VIAIpd5cmspmNbSrtymQ1ne4bUpAHLMI+48+zx0X2rpZtacca
 u7Lmqh8FjccMNmESOo3oNi0+f6Pguzt1rv6fsK/uA39CAAQBB+iwoBdVUrnwGsIO6NcP
 cnuBxJMNBTj6mPmLRUu9jnssD/Cc7NE3RZI9oHF9MeunpURPc2HEZNx41bCeXSSSJvs0
 0TRQ==
X-Gm-Message-State: AOAM533kkgk6G4f8M5RaQfAZ/u8F4xW6R5V3kX6ObveNEiWDAT35OrCj
 9E6cBezC5AXHXfF8VNEJu7hMLLlXo7s=
X-Google-Smtp-Source: ABdhPJwl1gKyF3pfJ5ie868kPXKBua9doUzwDRqGLr8lKTqxr1HHAMw3xL4wn/F/CGySesYoXqUp4cD0u0I=
X-Received: by 2002:a25:2417:: with SMTP id k23mr15167611ybk.300.1595616307826; 
 Fri, 24 Jul 2020 11:45:07 -0700 (PDT)
Date: Fri, 24 Jul 2020 18:44:55 +0000
In-Reply-To: <20200724184501.1651378-1-satyat@google.com>
Message-Id: <20200724184501.1651378-2-satyat@google.com>
Mime-Version: 1.0
References: <20200724184501.1651378-1-satyat@google.com>
X-Mailer: git-send-email 2.28.0.rc0.142.g3c755180ce-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.3 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.202 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.202 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jz2gz-001epW-Lc
Subject: [f2fs-dev] [PATCH v6 1/7] fscrypt: Add functions for direct I/O
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
---
 fs/crypto/crypto.c       |  8 +++++
 fs/crypto/inline_crypt.c | 74 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 18 ++++++++++
 3 files changed, 100 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index 9212325763b0..f72f22a718b2 100644
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
index d7aecadf33c1..4cdf807b89b9 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -16,6 +16,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
+#include <linux/uio.h>
 
 #include "fscrypt_private.h"
 
@@ -362,3 +363,76 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
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
+ * @lblk: the block at which the I/O is being started from
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
diff --git a/include/linux/fscrypt.h b/include/linux/fscrypt.h
index bb257411365f..5de122ec0464 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -559,6 +559,10 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
+bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
+
+u64 fscrypt_limit_io_blocks(const struct inode *inode, u64 lblk, u64 nr_blocks);
+
 #else /* CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 static inline bool __fscrypt_inode_uses_inline_crypto(const struct inode *inode)
@@ -587,6 +591,20 @@ static inline bool fscrypt_mergeable_bio_bh(struct bio *bio,
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
2.28.0.rc0.142.g3c755180ce-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
