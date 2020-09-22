Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 206F3274AC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Sep 2020 23:07:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKpV5-0001Sc-PB; Tue, 22 Sep 2020 21:06:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kKpV3-0001SB-G5; Tue, 22 Sep 2020 21:06:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sx8gkWC2/W3tgh9YK60ypbpCcfln3QjdLnGplGzjxCM=; b=aARblmjVwPy3eHEiBAe2BuROAi
 USr7Bw1I7np8VZN0b/dXYHbq/WfP8YtBvlwo5WIo3GasYPItDydY5r790CzL4ZqHkMoRy5U4BBP25
 DS/wD4gtU1QV8q+9VhMluU8vg7GFSlexMsfxPvufYfGEBD5LKQP7iazjSNQxxrZm+s+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sx8gkWC2/W3tgh9YK60ypbpCcfln3QjdLnGplGzjxCM=; b=UXNVY8AceyX1O/L7i4w+kk2pRL
 2M4QnohqrLLPdhOFfSO7H7Z7+zusz7nxdLhLe1yAgMr3aH1qM42rt48+Z0gYE29pJo/jg/PpfZYbR
 +BNDmlv7gNKEwkWTPoYD7WerqolaG7Z9DwNtK7In559vjOV9SkNPPeDH1iD9gVw4+Xoc=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKpUt-003eRT-UO; Tue, 22 Sep 2020 21:06:57 +0000
Received: by mail-pj1-f68.google.com with SMTP id bw23so2082480pjb.2;
 Tue, 22 Sep 2020 14:06:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=sx8gkWC2/W3tgh9YK60ypbpCcfln3QjdLnGplGzjxCM=;
 b=dlhwXa+ddz/K5+/21KTSdyU+5hEny4CZwlrEnxIFToKUE80GLrj66BAPt+i/yxR9bv
 YUjUV/Dpqkx6sDMC+UkGUqLvQVxS8cfqBBimU8O30a38OISQoCH/TAWTvXW+hk6s5JNm
 7XN71O1Dd0MmKi8iOPdRUlphVZm6b/ULj5nIs8d2K64TGWNacqtt5xudR3I+cKtz+K7x
 Hd/LAt7GPnuSyr8dSH9RWEuCndK+iqj3mqQ/6nQ9ZaEkoMzd8CaEtKxB9Z9GQ4r5ZEHw
 4r30ZF16UUHyD00l9x9OpXQaHCT/Bacd6mOOlL3yoHS7zPdZmB2Ti2ZrZwrdMdDK7SQp
 VYfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=sx8gkWC2/W3tgh9YK60ypbpCcfln3QjdLnGplGzjxCM=;
 b=NQ2wHYpvMFdjvWAYjlDuBCWKuTojPFAOTlue5Spz+XhP+ws4lYiw03ESXkc3bcPeMb
 Wzhru42L5rN7+Db24/hhBX7wIqZyt5fei3FTfaH1anhbzIROhf0ej93UDkGlB1GxSjCc
 DNSliT07BWu/zl9BI0nkAKD3LNiYXz5QZ8QMNJSKxjjwPGo5uIOqTdfejSKIgns3m4c7
 6NrnIWfLR35i/dQ5WqzL+oi46mAcScO3TslCujVKHtmfNg8D23BcOwoNOU8+gsGYAryG
 xCQUF7vhJUN/IzRGULldeDIgLbEdlNH/LPDyw4gzituAMbC8D/16J3ASkqxIcK313JCT
 kjkw==
X-Gm-Message-State: AOAM530JO/notxfvvWMdxTuTfsSglXGOK9lRs1eJngLDt/tSxQVVESDe
 uOMdN3rrntrFw1c1m4RPJmU=
X-Google-Smtp-Source: ABdhPJw4ZpvNaEkobsOFq4P3jAdu+iyAKrhE9tD8TX/t6I8kMuPrnP26y38++rRf+JhggvNzu/wzww==
X-Received: by 2002:a17:90a:d3cd:: with SMTP id
 d13mr5696241pjw.70.1600808800902; 
 Tue, 22 Sep 2020 14:06:40 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id i15sm16118945pfk.145.2020.09.22.14.06.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 14:06:40 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 22 Sep 2020 14:09:21 -0700
Message-Id: <20200922210924.1725-7-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200922210924.1725-1-nickrterrell@gmail.com>
References: <20200922210924.1725-1-nickrterrell@gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.68 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.68 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kKpUt-003eRT-UO
Subject: [f2fs-dev] [PATCH v2 6/9] f2fs: zstd: Switch to the zstd-1.4.6 API
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
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Kernel Team <Kernel-team@fb.com>, Niket Agarwal <niketa@fb.com>,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Move away from the compatibility wrapper to the zstd-1.4.6 API. This
code is more efficient because it uses the single-pass API instead of
the streaming API. The streaming API is not necessary because the whole
input and output buffers are available. This saves memory because we
don't need to allocate a buffer for the window. It is also more
efficient because it saves unnecessary memcpy calls.

Compression memory increases from 168 KB to 204 KB because upstream
uses slightly more memory. Decompression memory decreases from 1.4 MB
to 158 KB.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 fs/f2fs/compress.c | 102 +++++++++++++++++----------------------------
 1 file changed, 38 insertions(+), 64 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index e056f3a2b404..b79efce81651 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -11,7 +11,8 @@
 #include <linux/backing-dev.h>
 #include <linux/lzo.h>
 #include <linux/lz4.h>
-#include <linux/zstd_compat.h>
+#include <linux/zstd.h>
+#include <linux/zstd_errors.h>
 
 #include "f2fs.h"
 #include "node.h"
@@ -298,21 +299,21 @@ static const struct f2fs_compress_ops f2fs_lz4_ops = {
 static int zstd_init_compress_ctx(struct compress_ctx *cc)
 {
 	ZSTD_parameters params;
-	ZSTD_CStream *stream;
+	ZSTD_CCtx *ctx;
 	void *workspace;
 	unsigned int workspace_size;
 
 	params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, cc->rlen, 0);
-	workspace_size = ZSTD_CStreamWorkspaceBound(params.cParams);
+	workspace_size = ZSTD_estimateCCtxSize_usingCParams(params.cParams);
 
 	workspace = f2fs_kvmalloc(F2FS_I_SB(cc->inode),
 					workspace_size, GFP_NOFS);
 	if (!workspace)
 		return -ENOMEM;
 
-	stream = ZSTD_initCStream(params, 0, workspace, workspace_size);
-	if (!stream) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initCStream failed\n",
+	ctx = ZSTD_initStaticCCtx(workspace, workspace_size);
+	if (!ctx) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_inittaticCStream failed\n",
 				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
 				__func__);
 		kvfree(workspace);
@@ -320,7 +321,7 @@ static int zstd_init_compress_ctx(struct compress_ctx *cc)
 	}
 
 	cc->private = workspace;
-	cc->private2 = stream;
+	cc->private2 = ctx;
 
 	cc->clen = cc->rlen - PAGE_SIZE - COMPRESS_HEADER_SIZE;
 	return 0;
@@ -335,65 +336,48 @@ static void zstd_destroy_compress_ctx(struct compress_ctx *cc)
 
 static int zstd_compress_pages(struct compress_ctx *cc)
 {
-	ZSTD_CStream *stream = cc->private2;
-	ZSTD_inBuffer inbuf;
-	ZSTD_outBuffer outbuf;
-	int src_size = cc->rlen;
-	int dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
-	int ret;
-
-	inbuf.pos = 0;
-	inbuf.src = cc->rbuf;
-	inbuf.size = src_size;
-
-	outbuf.pos = 0;
-	outbuf.dst = cc->cbuf->cdata;
-	outbuf.size = dst_size;
-
-	ret = ZSTD_compressStream(stream, &outbuf, &inbuf);
-	if (ZSTD_isError(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compressStream failed, ret: %d\n",
-				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
-				__func__, ZSTD_getErrorCode(ret));
-		return -EIO;
-	}
-
-	ret = ZSTD_endStream(stream, &outbuf);
+	ZSTD_CCtx *ctx = cc->private2;
+	const size_t src_size = cc->rlen;
+	const size_t dst_size = src_size - PAGE_SIZE - COMPRESS_HEADER_SIZE;
+	ZSTD_parameters params = ZSTD_getParams(F2FS_ZSTD_DEFAULT_CLEVEL, src_size, 0);
+	size_t ret;
+
+	ret = ZSTD_compress_advanced(
+			ctx, cc->cbuf->cdata, dst_size, cc->rbuf, src_size, NULL, 0, params);
 	if (ZSTD_isError(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_endStream returned %d\n",
+		/*
+		 * there is compressed data remained in intermediate buffer due to
+		 * no more space in cbuf.cdata
+		 */
+		if (ZSTD_getErrorCode(ret) == ZSTD_error_dstSize_tooSmall)
+			return -EAGAIN;
+		/* other compression errors return -EIO */
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compress_advanced failed, err: %s\n",
 				KERN_ERR, F2FS_I_SB(cc->inode)->sb->s_id,
-				__func__, ZSTD_getErrorCode(ret));
+				__func__, ZSTD_getErrorName(ret));
 		return -EIO;
 	}
 
-	/*
-	 * there is compressed data remained in intermediate buffer due to
-	 * no more space in cbuf.cdata
-	 */
-	if (ret)
-		return -EAGAIN;
-
-	cc->clen = outbuf.pos;
+	cc->clen = ret;
 	return 0;
 }
 
 static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 {
-	ZSTD_DStream *stream;
+	ZSTD_DCtx *ctx;
 	void *workspace;
 	unsigned int workspace_size;
 
-	workspace_size = ZSTD_DStreamWorkspaceBound(MAX_COMPRESS_WINDOW_SIZE);
+	workspace_size = ZSTD_estimateDCtxSize();
 
 	workspace = f2fs_kvmalloc(F2FS_I_SB(dic->inode),
 					workspace_size, GFP_NOFS);
 	if (!workspace)
 		return -ENOMEM;
 
-	stream = ZSTD_initDStream(MAX_COMPRESS_WINDOW_SIZE,
-					workspace, workspace_size);
-	if (!stream) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initDStream failed\n",
+	ctx = ZSTD_initStaticDCtx(workspace, workspace_size);
+	if (!ctx) {
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_initStaticDCtx failed\n",
 				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
 				__func__);
 		kvfree(workspace);
@@ -401,7 +385,7 @@ static int zstd_init_decompress_ctx(struct decompress_io_ctx *dic)
 	}
 
 	dic->private = workspace;
-	dic->private2 = stream;
+	dic->private2 = ctx;
 
 	return 0;
 }
@@ -415,28 +399,18 @@ static void zstd_destroy_decompress_ctx(struct decompress_io_ctx *dic)
 
 static int zstd_decompress_pages(struct decompress_io_ctx *dic)
 {
-	ZSTD_DStream *stream = dic->private2;
-	ZSTD_inBuffer inbuf;
-	ZSTD_outBuffer outbuf;
-	int ret;
-
-	inbuf.pos = 0;
-	inbuf.src = dic->cbuf->cdata;
-	inbuf.size = dic->clen;
-
-	outbuf.pos = 0;
-	outbuf.dst = dic->rbuf;
-	outbuf.size = dic->rlen;
+	ZSTD_DCtx *ctx = dic->private2;
+	size_t ret;
 
-	ret = ZSTD_decompressStream(stream, &outbuf, &inbuf);
+	ret = ZSTD_decompressDCtx(ctx, dic->rbuf, dic->rlen, dic->cbuf->cdata, dic->clen);
 	if (ZSTD_isError(ret)) {
-		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_compressStream failed, ret: %d\n",
+		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD_decompressDCtx failed, err: %s\n",
 				KERN_ERR, F2FS_I_SB(dic->inode)->sb->s_id,
-				__func__, ZSTD_getErrorCode(ret));
+				__func__, ZSTD_getErrorName(ret));
 		return -EIO;
 	}
 
-	if (dic->rlen != outbuf.pos) {
+	if (dic->rlen != ret) {
 		printk_ratelimited("%sF2FS-fs (%s): %s ZSTD invalid rlen:%zu, "
 				"expected:%lu\n", KERN_ERR,
 				F2FS_I_SB(dic->inode)->sb->s_id,
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
