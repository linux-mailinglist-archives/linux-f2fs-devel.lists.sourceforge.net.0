Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BED27E1BF
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Sep 2020 08:50:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNVwT-0002KC-2c; Wed, 30 Sep 2020 06:50:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kNVwR-0002Jz-Ol; Wed, 30 Sep 2020 06:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=; b=BiCEP3bxFUCJSqwKwGB3apGnGU
 J+QAclQLeFzZmlfdk7+d5s5dea+DTLIVhy3bJaZU7oRq3+nGiioURW+PbAVNPg5v6xBkeDUrcKNdb
 6956ZBLvf/wVMzcy0x0QnE9QnhnMlWHgGX7SP9WXO3IoiaDx/tJtKvSWgSvleprtupGU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=; b=VuNKdqIpH0K5iREtITAYy3/cHg
 2EMGa4coQ8oZRe4+JSxcEXjXBwwSBZhn0JP1DSN5miHSMkRovmqj6rjE6YoOWLOJWTsG9yVqwxmEI
 sPJWSeWtzqfvUThc6aTDXl1oSF2I39XpOI34vDCzD/q4/oijsRqXEseGCbABs/OZRcWo=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kNVwJ-00B19i-89; Wed, 30 Sep 2020 06:50:19 +0000
Received: by mail-pg1-f193.google.com with SMTP id 197so485277pge.8;
 Tue, 29 Sep 2020 23:50:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=;
 b=bx6G1V8+FQodu/hCJFLTVBYsNHoLZUsLaIOHSJ8Ppa+7aPpJsde92+pD3gGT7yAT10
 O0CxG8HBpLf16k8DkjDHiLNm97yrhL6DnuRC4QTEvmnr28g09+aqi/jN+qY6G6NLpDXU
 hebvfuDkxNuS5xnEeGJs3alkM4qRJbmlgnBZqR4Dm4E27s8VWCzav/msUs7y/o/ogxSO
 +UMTZnXSNOkxV1HWUUVvFbqou7YqhHXZAJeK+eKX8SPW028odqJNDnECZhiNvaMORu9H
 6QJCeMkj5qjkMb8nZXogigMgpXnX4zCqBLGdDFbjEo6/YnBbYhArVNvk+xVWyQA3yIB+
 sk4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2E/IwoJzArQOI0tLeIWcAV63W6gwJ92+ohjyeEw8pg8=;
 b=Cx+leLEG+Z57e/0jWS66+888YLaF8HwbMyoEjG6XXWFNQrqlLH7uUshTc4CTCdZiEK
 CxEkplVEfgez1oKuu6MrRbUaDkvNYWERlufSBG69mAxxDBH7UDogibkIevLGfC0mG1x3
 knYWWa6yNbFsQO/TsWalwfLZ1zU7bXfcQQ+D8qfdGnbW1Gs3Hkso+Za7tTK3ZOE9p9A5
 2RhUtEqzhNbYvKlw+4Jpy7W2iHOY/oj/eQe/NBClgLPcq0V4wVQVDJPtzhj63szBTlYV
 yA7IGv4vWo41PQmS5e+1I3NUeLlxZCpAD1ngNatIoHHK0+1gj2iXR/K9eJv+o+VPUPAU
 5YbA==
X-Gm-Message-State: AOAM530jAHHA+Lrh6y+MDV/nxfIxn9xlmWJK1CxWKLEgp4rT122g/hRG
 4EDfQ71Gl3nth1SraerUpg0=
X-Google-Smtp-Source: ABdhPJzb4+pKVFANraBU2qyubhVYWvRaXnT+h66sMPI6vDGQZCJME36TZc6rDrWAPVbJKtEviE/Hvg==
X-Received: by 2002:a63:4142:: with SMTP id o63mr1029677pga.337.1601448605631; 
 Tue, 29 Sep 2020 23:50:05 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id 190sm1100865pfy.22.2020.09.29.23.50.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 23:50:05 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 29 Sep 2020 23:53:14 -0700
Message-Id: <20200930065318.3326526-6-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930065318.3326526-1-nickrterrell@gmail.com>
References: <20200930065318.3326526-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kNVwJ-00B19i-89
Subject: [f2fs-dev] [PATCH v4 5/9] btrfs: zstd: Switch to the zstd-1.4.6 API
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
