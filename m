Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCFA26BAB6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 05:41:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIOJk-0006z4-1U; Wed, 16 Sep 2020 03:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kIOJf-0006yd-9c; Wed, 16 Sep 2020 03:41:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=; b=MaauTTEXT17sazY6KlJSVa0Sp6
 pliNUjsQstirNiFaFY47NAGkWfoizb9qkYiUYHC4fZPg+DMldSMlf+mjcmn4zzuxnwjRCKra4TY9Z
 jqE8I5iICvo5c0Lm8L5RJCZJJg3WUc+dtHnnnjT9vdlVsWpoY/SgFQF4hDxCGVyKrtjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=; b=W1ZlLVPGMTMC9zwaEAVSkFntz7
 gBFP7ke5PhwhNchZNHj/OXoW3IW1RWb6tbKOO0c5wNDqT58zx7e2LMJL+GYrmh8OnR88S0JAgwuL5
 sKr3sC729ZLOxJDb2j8Rlst8yz/2jL8Vcw/+BvaJDJI3yqyssSrwl42vwC2suLlmEHoM=;
Received: from mail-pj1-f68.google.com ([209.85.216.68])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kIOJY-00AlWQ-SL; Wed, 16 Sep 2020 03:41:07 +0000
Received: by mail-pj1-f68.google.com with SMTP id mm21so847272pjb.4;
 Tue, 15 Sep 2020 20:41:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=;
 b=MBMW6QMq9lCxZUAmvXVtcBYONHEPOCnbWNuKiZJWW65LC9wyrofhoWFzZBC+Y3HhOT
 G2pHeFDFBdqb3XeOD8673GkG54+crAqrHtMGfC5utUo7pGK0gwqJYwghKeqPJ7Fouqg9
 a1EW2ZbmQ9UtrHQoYRclmzQQgmQLxWA0humcihwtRQ0n+ad/2DwL/kuWTrC6Nea//9NG
 aeemwFijt+vriQZye/oGtrhD1P91DO8uUR/F8z93hCnSk8VWI+zujWiEUzstQQS4eknN
 TNO1ZT3oZk2XH5Nrr2r2YHgtTcth54B2w+48DKMsM50qMyTGtTKbwdXs07G4MauJuaw5
 cVUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=;
 b=ez/YybDSfoJb9T++y5as9Bmqc+HuXK4l+iV/cQq1tDpc1Mx+vAXbg5FUwz0N2raggQ
 VQ4Q0irwm8rHJXEGBMcu2DtuSAYAJ44SOZD4KPuPIXulRPSnCV+KeBjwWgphnmvxgDVU
 Sc2koybFzGuBg22hGOHTGp/A+kbRIAo+kojSitnaKzUrZVTiiOzJ4eu9s+9v4DcGjIUM
 Za+geMLK1ZdyyZEHyn0Ad+EemRcrZsEUm1eoIksuOXBEXLt/OFg9b5Tja7FOU+X72Ayi
 jm08kVwExzZMSd46avEH6tD7KgTzgQ53hTazps2kW3S5YWqoWojQV3oacK8dPpBObOTX
 4PBA==
X-Gm-Message-State: AOAM5328Rtx0S8Q7Ma1GjXBIP+vHfstwb0XdgtcAISXXXQ9vJw32AdtF
 q08ihEG73gL5X12m48htbkw=
X-Google-Smtp-Source: ABdhPJz2ijRe9DqZppb7/1KZROPtSsQuUb5Q6+cvVGIVbzAk2adBQ/IF8nSGzwaq7W3PsSJSEg2qxw==
X-Received: by 2002:a17:902:309:b029:d1:e5e7:ca3f with SMTP id
 9-20020a1709020309b02900d1e5e7ca3fmr4663933pld.43.1600227655314; 
 Tue, 15 Sep 2020 20:40:55 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id i20sm12856635pgk.77.2020.09.15.20.40.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 20:40:54 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 15 Sep 2020 20:42:57 -0700
Message-Id: <20200916034307.2092020-5-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916034307.2092020-1-nickrterrell@gmail.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1kIOJY-00AlWQ-SL
Subject: [f2fs-dev] [PATCH 4/9] crypto: zstd: Switch to zstd-1.4.6 API
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
code is functionally equivalent.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 crypto/zstd.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/crypto/zstd.c b/crypto/zstd.c
index dcda3cad3b5c..767fe2fbe009 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/net.h>
 #include <linux/vmalloc.h>
-#include <linux/zstd_compat.h>
+#include <linux/zstd.h>
 #include <crypto/internal/scompress.h>
 
 
@@ -24,16 +24,15 @@ struct zstd_ctx {
 	void *dwksp;
 };
 
-static ZSTD_parameters zstd_params(void)
-{
-	return ZSTD_getParams(ZSTD_DEF_LEVEL, 0, 0);
-}
-
 static int zstd_comp_init(struct zstd_ctx *ctx)
 {
 	int ret = 0;
-	const ZSTD_parameters params = zstd_params();
-	const size_t wksp_size = ZSTD_CCtxWorkspaceBound(params.cParams);
+	const size_t wksp_size = ZSTD_estimateCCtxSize(ZSTD_DEF_LEVEL);
+
+	if (ZSTD_isError(wksp_size)) {
+		ret = -EINVAL;
+		goto out_free;
+	}
 
 	ctx->cwksp = vzalloc(wksp_size);
 	if (!ctx->cwksp) {
@@ -41,7 +40,7 @@ static int zstd_comp_init(struct zstd_ctx *ctx)
 		goto out;
 	}
 
-	ctx->cctx = ZSTD_initCCtx(ctx->cwksp, wksp_size);
+	ctx->cctx = ZSTD_initStaticCCtx(ctx->cwksp, wksp_size);
 	if (!ctx->cctx) {
 		ret = -EINVAL;
 		goto out_free;
@@ -56,7 +55,7 @@ static int zstd_comp_init(struct zstd_ctx *ctx)
 static int zstd_decomp_init(struct zstd_ctx *ctx)
 {
 	int ret = 0;
-	const size_t wksp_size = ZSTD_DCtxWorkspaceBound();
+	const size_t wksp_size = ZSTD_estimateDCtxSize();
 
 	ctx->dwksp = vzalloc(wksp_size);
 	if (!ctx->dwksp) {
@@ -64,7 +63,7 @@ static int zstd_decomp_init(struct zstd_ctx *ctx)
 		goto out;
 	}
 
-	ctx->dctx = ZSTD_initDCtx(ctx->dwksp, wksp_size);
+	ctx->dctx = ZSTD_initStaticDCtx(ctx->dwksp, wksp_size);
 	if (!ctx->dctx) {
 		ret = -EINVAL;
 		goto out_free;
@@ -152,9 +151,8 @@ static int __zstd_compress(const u8 *src, unsigned int slen,
 {
 	size_t out_len;
 	struct zstd_ctx *zctx = ctx;
-	const ZSTD_parameters params = zstd_params();
 
-	out_len = ZSTD_compressCCtx(zctx->cctx, dst, *dlen, src, slen, params);
+	out_len = ZSTD_compressCCtx(zctx->cctx, dst, *dlen, src, slen, ZSTD_DEF_LEVEL);
 	if (ZSTD_isError(out_len))
 		return -EINVAL;
 	*dlen = out_len;
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
