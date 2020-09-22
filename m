Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C85C274AAB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Sep 2020 23:06:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kKpUk-0001NV-EV; Tue, 22 Sep 2020 21:06:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kKpUi-0001N8-MC; Tue, 22 Sep 2020 21:06:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=; b=P/YDFS7xv+oPP49AdXeaSrTHGx
 yAv+13aRm+XdRA6PRett2eM9k3/aUVMdwISMsKvyA5pMB6Dv0GDVS5t6BNlEEkFsclUvB3VOta5J8
 K3O4ON4gvB0dFCoyoU6cKOHwLqrTb9TXozHJ+ntaI2QoBf1LzRUyfcA64M8VmVnuP2WM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=; b=YocPMLTQEUHjx5WMXqZ8jgn9x8
 z8a4s2CQkd/Ds2o8vSARrcKTRh+CT3f90fhUG+Wz/6kU2Rjv6atRMX3mslK2SuOOhU1jn4USYPZRC
 M+PVr/39zDAfofpIcJz6bp89RpkWxtcM9zLYhFjhXGHV/bd38sISct7DlrWdkK+lPzA4=;
Received: from mail-pj1-f67.google.com ([209.85.216.67])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kKpUg-003eQW-Tm; Tue, 22 Sep 2020 21:06:36 +0000
Received: by mail-pj1-f67.google.com with SMTP id v14so2036515pjd.4;
 Tue, 22 Sep 2020 14:06:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=;
 b=VRnjbhaR7u9Ns94IhEs7xpF9rCvZP/sm8ZtuC2hiGWNyBU5tXf+QSFQ8I0G4DjB5xC
 qDtgHGeKqCSWhFG8djLjeMnW8cFhirccyxDMwJPsX2vr67u5OpinvTkMg6Wn/4VIXevz
 ldZxz0mKv7SZ8al4MvEsKIljAGH3E5rDJZGVIq9N4zU8crSgNWLENnGFwRL2LWXdTO9k
 EMvSnwUANSC7UZmHeMmeYSG0VxtlBve0n7AxG2+VqfcPILKrEbRPAwmtydEdYKb+29Ck
 hJuLuR4rd6WG/q2Qh36hB4UYMfRaW/6hmC5NwoL2Yzw8/zCSFOeVPdK6YZ+S9y/s+czm
 JnnQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=5fKNeZSsXX3F75uWAvoclig0FCLwLLfStaZMUpC2Nwo=;
 b=Ig4V69Awgx0flv6blv3GTyNuE8qSaGgEHOyZfO8W0WpzJCzHR9ErS3iG5hY4x/sVZz
 QTccL6gaa1XbllRxKQB8S8QTkJ0bA05uQgzSGsvSwEBJmCF13ob/XH2mYFi9Ct/sVRPR
 zUx6k32n+wwwAAAzeSf1GZjagVBeJs3G2S3mMhwf8ffeo2fD3V2fathL9s2oHd7Q7BWy
 U9SYWI6wcI0PkjZsYc2qLwa6LZtyGq+mHi3Bgnak4n00CYfXj+uoVSXNY5icfjvxlWlQ
 QGttlCv0/AREtycBawmobRaBMz54HrdayPSKTnWXp+zz+IBul+R4EXShHdmyhdNA+vYz
 gBAA==
X-Gm-Message-State: AOAM531vPMtOdnwKMlj1Ks0JbdvzDfMaCYQ6jFlvWpb1OpT5OblBpEtm
 3y3h9JnuJ4dW0/Yqbc8cfGs=
X-Google-Smtp-Source: ABdhPJxHNlmwtyEyY3QaIV8vUtWmW8GG7n0PfB1SNTU3deVbHxrNSzwE43B7Y8Qf8j7SkAAUpzLrkQ==
X-Received: by 2002:a17:90a:d812:: with SMTP id
 a18mr5422822pjv.228.1600808789298; 
 Tue, 22 Sep 2020 14:06:29 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id i15sm16118945pfk.145.2020.09.22.14.06.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Sep 2020 14:06:28 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 22 Sep 2020 14:09:19 -0700
Message-Id: <20200922210924.1725-5-nickrterrell@gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.67 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.67 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kKpUg-003eQW-Tm
Subject: [f2fs-dev] [PATCH v2 4/9] crypto: zstd: Switch to zstd-1.4.6 API
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
