Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3FB522763EC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Sep 2020 00:39:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLDPw-000647-Sp; Wed, 23 Sep 2020 22:39:16 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kLDPu-00063l-Ut; Wed, 23 Sep 2020 22:39:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=; b=OBC6ptzid4EYEzZnKeM+FuuodM
 aKTJL1N1q7g5ioaNNoqcOD4RoA4U5mkl/Wg3k8wh2bLUYTOqCkkZk4uc08Og7p+AEe7q6lTmQw2/4
 1H2OvQCgYi8f5yFUzlAUV9RAgbW7hvs29dge3hT89DjgwGVedb+8lxh7O0KEnxNQn0Ek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=; b=B6Mz/YtdnubaG09W/o9Uhm2d6X
 hE1mdysRKJgCx5lUmIEzQxIuYKWduaAvHlVVbuX2uoR4p1EZUSsGQomB1OliV6KBYWYCpJus00AlD
 KUzvWLWMw/ed1hBGcPHrGNYSUfwH2hIIOtVo4oHCTeDQS83EFId4Ocm6jObGzVoWfIJs=;
Received: from mail-pj1-f66.google.com ([209.85.216.66])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLDPq-0038IV-Ty; Wed, 23 Sep 2020 22:39:14 +0000
Received: by mail-pj1-f66.google.com with SMTP id fa1so523146pjb.0;
 Wed, 23 Sep 2020 15:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=;
 b=VH6EOPQmKosAZfOq6MnV38EH2WAOAT2/ct907J+IN6F1/UzyBRymrfg8mu4toh/gHz
 dnCfW0Gwac94AqG3iX63bDY9gwaVeHHo1ws/CLHJtn8lqdccOMUGUAoO060nthG/xJFH
 ibtLlKqnHKZJrfnLzTVVGSCcnmd1Zey12yJOntQMEkyY8iQykMy73rFgZhMJ0Z844Oi0
 8C+RV0grr4N556T9lwPBbDMKtHQTX81iI9NawFSPBMSgHbxghwQyQbO38ko45bl9G61N
 mFNKN8Cm1lQRlg1NbJqz5u9DNc7Jc6EIJGu54UlJqThrXQkXc6wHz8e0PlIGQrGgR/uM
 idBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=;
 b=MP6A1rQj7/J5ckZzwniQqlhaDlqNoMipDKOS6YE31E5jSB8GbRQqZHWakhN1AyTR34
 ghyMGhKhmACgdStfMun2ZbPvkyhjpNT7IGNHEtWMO7mKDQsyDtbWwggH1NWICE8bbJrb
 DxdlEhrgOPgDtDEL8eSy+dKDvNC8DqLoh4G8xMweK7jHl5O68iGnfXmvxduMHYdGmxm9
 0vBM28YhjlSV415ktY77ccpuhqyV2XBm7R6OWYsVQv9HbAdtlxq0OBYXLycAzgCrve16
 S0StqMbB/K0CjNVCctkGnu2vmBPRxIYlfUYndz8KO3zHIFkh/+e/Txj4LiCXdvZy1hH7
 GChg==
X-Gm-Message-State: AOAM530GPZQuDk1c97hXT9T1zAoyBXk+KBtDBjWQfyiJHixR2U9zPufF
 8XgOLn7XrkTCRaQBZ2g6YdM=
X-Google-Smtp-Source: ABdhPJzDWI/mbcX42TC+/4O3aSHIBlfav2a3RWmG58FNqPe6MvKubUjLbH6Git2smBvBjQofx3aS6g==
X-Received: by 2002:a17:90a:6903:: with SMTP id
 r3mr1241734pjj.169.1600900745341; 
 Wed, 23 Sep 2020 15:39:05 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id d20sm417964pjv.39.2020.09.23.15.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 15:39:04 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 23 Sep 2020 15:42:02 -0700
Message-Id: <20200923224206.68968-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923224206.68968-1-nickrterrell@gmail.com>
References: <20200923224206.68968-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.66 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.66 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kLDPq-0038IV-Ty
Subject: [f2fs-dev] [PATCH v3 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
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
Cc: squashfs-devel@lists.sourceforge.net, Johannes Weiner <jweiner@fb.com>,
 Christoph Hellwig <hch@infradead.org>, Nick Terrell <nickrterrell@gmail.com>,
 Yann Collet <cyan@fb.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Move away from the compatibility wrapper to the zstd-1.4.6 API. This
code is functionally equivalent.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 fs/btrfs/zstd.c | 48 ++++++++++++++++++++++++++++--------------------
 1 file changed, 28 insertions(+), 20 deletions(-)

diff --git a/fs/btrfs/zstd.c b/fs/btrfs/zstd.c
index a7367ff573d4..6b466e090cd7 100644
--- a/fs/btrfs/zstd.c
+++ b/fs/btrfs/zstd.c
@@ -16,7 +16,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/zstd_compat.h>
+#include <linux/zstd.h>
 #include "misc.h"
 #include "compression.h"
 #include "ctree.h"
@@ -159,8 +159,8 @@ static void zstd_calc_ws_mem_sizes(void)
 			zstd_get_btrfs_parameters(level, ZSTD_BTRFS_MAX_INPUT);
 		size_t level_size =
 			max_t(size_t,
-			      ZSTD_CStreamWorkspaceBound(params.cParams),
-			      ZSTD_DStreamWorkspaceBound(ZSTD_BTRFS_MAX_INPUT));
+			      ZSTD_estimateCStreamSize_usingCParams(params.cParams),
+			      ZSTD_estimateDStreamSize(ZSTD_BTRFS_MAX_INPUT));
 
 		max_size = max_t(size_t, max_size, level_size);
 		zstd_ws_mem_sizes[level - 1] = max_size;
@@ -389,13 +389,23 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 	*total_in = 0;
 
 	/* Initialize the stream */
-	stream = ZSTD_initCStream(params, len, workspace->mem,
-			workspace->size);
+	stream = ZSTD_initStaticCStream(workspace->mem, workspace->size);
 	if (!stream) {
-		pr_warn("BTRFS: ZSTD_initCStream failed\n");
+		pr_warn("BTRFS: ZSTD_initStaticCStream failed\n");
 		ret = -EIO;
 		goto out;
 	}
+	{
+		size_t ret2;
+
+		ret2 = ZSTD_initCStream_advanced(stream, NULL, 0, params, len);
+		if (ZSTD_isError(ret2)) {
+			pr_warn("BTRFS: ZSTD_initCStream_advanced returned %s\n",
+					ZSTD_getErrorName(ret2));
+			ret = -EIO;
+			goto out;
+		}
+	}
 
 	/* map in the first page of input data */
 	in_page = find_get_page(mapping, start >> PAGE_SHIFT);
@@ -421,8 +431,8 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 		ret2 = ZSTD_compressStream(stream, &workspace->out_buf,
 				&workspace->in_buf);
 		if (ZSTD_isError(ret2)) {
-			pr_debug("BTRFS: ZSTD_compressStream returned %d\n",
-					ZSTD_getErrorCode(ret2));
+			pr_debug("BTRFS: ZSTD_compressStream returned %s\n",
+					ZSTD_getErrorName(ret2));
 			ret = -EIO;
 			goto out;
 		}
@@ -489,8 +499,8 @@ int zstd_compress_pages(struct list_head *ws, struct address_space *mapping,
 
 		ret2 = ZSTD_endStream(stream, &workspace->out_buf);
 		if (ZSTD_isError(ret2)) {
-			pr_debug("BTRFS: ZSTD_endStream returned %d\n",
-					ZSTD_getErrorCode(ret2));
+			pr_debug("BTRFS: ZSTD_endStream returned %s\n",
+					ZSTD_getErrorName(ret2));
 			ret = -EIO;
 			goto out;
 		}
@@ -557,10 +567,9 @@ int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 	unsigned long buf_start;
 	unsigned long total_out = 0;
 
-	stream = ZSTD_initDStream(
-			ZSTD_BTRFS_MAX_INPUT, workspace->mem, workspace->size);
+	stream = ZSTD_initStaticDStream(workspace->mem, workspace->size);
 	if (!stream) {
-		pr_debug("BTRFS: ZSTD_initDStream failed\n");
+		pr_debug("BTRFS: ZSTD_initStaticDStream failed\n");
 		ret = -EIO;
 		goto done;
 	}
@@ -579,8 +588,8 @@ int zstd_decompress_bio(struct list_head *ws, struct compressed_bio *cb)
 		ret2 = ZSTD_decompressStream(stream, &workspace->out_buf,
 				&workspace->in_buf);
 		if (ZSTD_isError(ret2)) {
-			pr_debug("BTRFS: ZSTD_decompressStream returned %d\n",
-					ZSTD_getErrorCode(ret2));
+			pr_debug("BTRFS: ZSTD_decompressStream returned %s\n",
+					ZSTD_getErrorName(ret2));
 			ret = -EIO;
 			goto done;
 		}
@@ -633,10 +642,9 @@ int zstd_decompress(struct list_head *ws, unsigned char *data_in,
 	unsigned long pg_offset = 0;
 	char *kaddr;
 
-	stream = ZSTD_initDStream(
-			ZSTD_BTRFS_MAX_INPUT, workspace->mem, workspace->size);
+	stream = ZSTD_initStaticDStream(workspace->mem, workspace->size);
 	if (!stream) {
-		pr_warn("BTRFS: ZSTD_initDStream failed\n");
+		pr_warn("BTRFS: ZSTD_initStaticDStream failed\n");
 		ret = -EIO;
 		goto finish;
 	}
@@ -667,8 +675,8 @@ int zstd_decompress(struct list_head *ws, unsigned char *data_in,
 		ret2 = ZSTD_decompressStream(stream, &workspace->out_buf,
 				&workspace->in_buf);
 		if (ZSTD_isError(ret2)) {
-			pr_debug("BTRFS: ZSTD_decompressStream returned %d\n",
-					ZSTD_getErrorCode(ret2));
+			pr_debug("BTRFS: ZSTD_decompressStream returned %s\n",
+					ZSTD_getErrorName(ret2));
 			ret = -EIO;
 			goto finish;
 		}
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
