Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4967221A80E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Jul 2020 21:48:12 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:References:Mime-Version:Message-Id:
	In-Reply-To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=p2tsW8Y+0fWtkiuAuQZ7fMYBWmMD9Jy5RT3WmXbFs/g=; b=I0oMNGU9TVdUleYF9R2VcC2oA
	tnmWqw7AqzOPlS1IUJVVmjConBNAF04VyRr5b6955IiChfvql4Xtt8+DK/L23b7WOWZu3EZB/WZ+i
	wxvAafRuQE74WgaHtJuT0k7ilCAauGA/IGys3HlYnZKPsIilt17lOqv1mQs1hYjOpXl7g=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jtcWb-00079Z-P7; Thu, 09 Jul 2020 19:48:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <3bXQHXwYKAHIiQjoQjWeeWbU.Sec@flex--satyat.bounces.google.com>)
 id 1jtcWa-00079R-9N
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:References:
 Mime-Version:Message-Id:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+/XxnKhf8VQXnWlmxkLfLTPJmNMo/X9aFiP13+Lo8YI=; b=EHS95aBfP7Uzuwm6Wr7K9jZ/0
 Q4CdXjIpcpq2JKnMDCR/vMLRUjO3y/BYqqPUOhRwnwBTH/0Cc/OLSaUgnbG3fFxLVAw8pCaiphj+A
 QLDR/AImspfECbCZLDiDAUxEAECYOT1/IQSV1sQTRUzGd7PTPStDQ0mz0CszxRHuYBe5s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:References:Mime-Version:Message-Id:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+/XxnKhf8VQXnWlmxkLfLTPJmNMo/X9aFiP13+Lo8YI=; b=e5XsHlSxSepcsRaG7pWvNCeqLu
 ojckJliIgwIk1HzpwYzelXVg7aiooOhPVlfcTqh49dT6hY7lWaAmp7EtqkSZ5bnArl367S/sgb7Fl
 H/FmJI07Sgabt34Dnl6kLj7fA1uyPFsPet9eKydHYWTm0n1NQSNvnrBtZTHypfRB66Eo=;
Received: from mail-pf1-f202.google.com ([209.85.210.202])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jtcWY-00FUFF-W9
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 09 Jul 2020 19:48:04 +0000
Received: by mail-pf1-f202.google.com with SMTP id y73so2037860pfb.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Jul 2020 12:48:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:in-reply-to:message-id:mime-version:references:subject:from:to
 :cc; bh=+/XxnKhf8VQXnWlmxkLfLTPJmNMo/X9aFiP13+Lo8YI=;
 b=h/H0yRKbuSfyI8puj/GfGNpcjE4q8yWyZ39S7u7IcbvSYgI4b91Twrik62nZGiY8/z
 vzOjVOI15upZpzR/91wpbk98WfhemXBOL8DnysODYMcDgtbDIUG7EO6XLwAxLx0SkTlF
 QuQjmm6XT0lnZviNNA1jOOUC2jD+UG5qvworuWF3RuQKUTvEWAjaiWPwi84RKPEfbi3m
 hFPycqByVMLVQymThzvU3TnnurvzfN7ul52dp57GX99wkXEEyn1d/4kXqFJDCSww1rkP
 NSAplp6KppOYzHSsEqJTRpsyYGTar0iKcIpip6VZw4atI9KNa17YKeOYmpjk2VYFGA+a
 1cjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:in-reply-to:message-id:mime-version
 :references:subject:from:to:cc;
 bh=+/XxnKhf8VQXnWlmxkLfLTPJmNMo/X9aFiP13+Lo8YI=;
 b=dN+0wMXJhlstAjXu6mfibpkjRXyvmTHwYlvN2/yNiI1O66f4tZdVqVSGpXCijYs4XB
 6MLlCPV11sQ424/NzzGrDuqLJpL3pB+lrmTfIFZixAGQIK2je3ksWe0HYz8AKHXcnsau
 d2ms2gBWDZigXckF1hFx3xgftcna26dVV8yxoWgR6KtZagzZrcVUR4UnFwUWWdn8CfV/
 /eTw+iRUjwfZnpDLJzPl2Uc5gMjcXQFcmWvol8wwwxzuUplFKg3JL8Cq4f7x+qiAoYuh
 0B2n7tdat5Mh60vKtRqruPfQXeF5VVTo2PLzHoUhJMJAuq7cfjJ6a/6pD+lNk28HO+zc
 4U/A==
X-Gm-Message-State: AOAM530dY4iQsPDso9ADzDOJyygjnnEgxVvY7FN0rktVRJ9iNuTvQeng
 mn6j6pjYlQJ2kB/gDB3TSPlpsgf+G6Y=
X-Google-Smtp-Source: ABdhPJxYeiQ2L/94mDwyv3mswoERkGf+Tmeckiw7ylTjL8M61t3axBfoCoxoXL00bXkKN7P/cwqndSOs1sQ=
X-Received: by 2002:aa7:9e4e:: with SMTP id z14mr31139029pfq.256.1594324077224; 
 Thu, 09 Jul 2020 12:47:57 -0700 (PDT)
Date: Thu,  9 Jul 2020 19:47:47 +0000
In-Reply-To: <20200709194751.2579207-1-satyat@google.com>
Message-Id: <20200709194751.2579207-2-satyat@google.com>
Mime-Version: 1.0
References: <20200709194751.2579207-1-satyat@google.com>
X-Mailer: git-send-email 2.27.0.383.g050319c2ae-goog
To: linux-fscrypt@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.202 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.202 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
X-Headers-End: 1jtcWY-00FUFF-W9
Subject: [f2fs-dev] [PATCH 1/5] fscrypt: Add functions for direct I/O support
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
Cc: Satya Tangirala <satyat@google.com>, Eric Biggers <ebiggers@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Introduce fscrypt_dio_supported() to check whether a direct I/O request
is unsupported due to encryption constraints, and
fscrypt_limit_dio_pages() to check how many pages may be added to a bio
being prepared for direct I/O.

The IV_INO_LBLK_32 fscrypt policy introduces the possibility that DUNs
in logically continuous file blocks might wrap from 0xffffffff to 0.
Bios in which the DUN wraps around like this cannot be submitted. This
is especially difficult to handle when block_size != PAGE_SIZE, since in
that case the DUN can wrap in the middle of a page.

For now, we add direct I/O support while using IV_INO_LBLK_32 policies
only for the case when block_size == PAGE_SIZE. When IV_INO_LBLK_32
policy is used, fscrypt_dio_supported() rejects the bio when
block_size != PAGE_SIZE. fscrypt_limit_dio_pages() returns the number of
pages that may be added to the bio without causing the DUN to wrap
around within the bio.

Signed-off-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Satya Tangirala <satyat@google.com>
---
 fs/crypto/crypto.c       |  8 +++++
 fs/crypto/inline_crypt.c | 72 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fscrypt.h  | 19 +++++++++++
 3 files changed, 99 insertions(+)

diff --git a/fs/crypto/crypto.c b/fs/crypto/crypto.c
index a52cf32733ab..b88d97618efb 100644
--- a/fs/crypto/crypto.c
+++ b/fs/crypto/crypto.c
@@ -69,6 +69,14 @@ void fscrypt_free_bounce_page(struct page *bounce_page)
 }
 EXPORT_SYMBOL(fscrypt_free_bounce_page);
 
+/*
+ * Generate the IV for the given logical block number within the given file.
+ * For filenames encryption, lblk_num == 0.
+ *
+ * Keep this in sync with fscrypt_limit_dio_pages().  fscrypt_limit_dio_pages()
+ * needs to know about any IV generation methods where the low bits of IV don't
+ * simply contain the lblk_num (e.g., IV_INO_LBLK_32).
+ */
 void fscrypt_generate_iv(union fscrypt_iv *iv, u64 lblk_num,
 			 const struct fscrypt_info *ci)
 {
diff --git a/fs/crypto/inline_crypt.c b/fs/crypto/inline_crypt.c
index d7aecadf33c1..86788ee2b206 100644
--- a/fs/crypto/inline_crypt.c
+++ b/fs/crypto/inline_crypt.c
@@ -16,6 +16,7 @@
 #include <linux/blkdev.h>
 #include <linux/buffer_head.h>
 #include <linux/sched/mm.h>
+#include <linux/uio.h>
 
 #include "fscrypt_private.h"
 
@@ -362,3 +363,74 @@ bool fscrypt_mergeable_bio_bh(struct bio *bio,
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
+ * fscrypt_limit_dio_pages() - limit I/O pages to avoid discontiguous DUNs
+ * @inode: the file on which I/O is being done
+ * @pos: the file position (in bytes) at which the I/O is being done
+ * @nr_pages: the number of pages we want to submit starting at @pos
+ *
+ * For direct I/O: limit the number of pages that will be submitted in the bio
+ * targeting @pos, in order to avoid crossing a data unit number (DUN)
+ * discontinuity.  This is only needed for certain IV generation methods.
+ *
+ * This assumes block_size == PAGE_SIZE; see fscrypt_dio_supported().
+ *
+ * Return: the actual number of pages that can be submitted
+ */
+int fscrypt_limit_dio_pages(const struct inode *inode, loff_t pos, int nr_pages)
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
index bb257411365f..9c65d949c611 100644
--- a/include/linux/fscrypt.h
+++ b/include/linux/fscrypt.h
@@ -559,6 +559,11 @@ bool fscrypt_mergeable_bio(struct bio *bio, const struct inode *inode,
 bool fscrypt_mergeable_bio_bh(struct bio *bio,
 			      const struct buffer_head *next_bh);
 
+bool fscrypt_dio_supported(struct kiocb *iocb, struct iov_iter *iter);
+
+int fscrypt_limit_dio_pages(const struct inode *inode, loff_t pos,
+			    int nr_pages);
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
+static inline int fscrypt_limit_dio_pages(const struct inode *inode, loff_t pos,
+					  int nr_pages)
+{
+	return nr_pages;
+}
 #endif /* !CONFIG_FS_ENCRYPTION_INLINE_CRYPT */
 
 /**
-- 
2.27.0.383.g050319c2ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
