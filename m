Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1463A27E1CA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Sep 2020 08:50:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNVwg-00081H-Rs; Wed, 30 Sep 2020 06:50:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kNVwe-0007yI-Tm; Wed, 30 Sep 2020 06:50:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=krGpYOVpUat0gERMlMR1P1lhK//ROWK8HUHnVTxyKd4=; b=U3SH44D0hx5EVe+qHHGHLrQGtF
 k+gguImrIPokPe+eQCA1mOUyfcJ+YnNfI0ZUjMfO4CZSo/NlMxQJeuZQQwu1Bj5fO2n2aMiES8xyR
 gTHcodA2CPqJf3LJ4j2Q+4PVz0AA94nY/NHBQisw0rXi1ZUMfs+nZvkcsLNKjI58VAL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=krGpYOVpUat0gERMlMR1P1lhK//ROWK8HUHnVTxyKd4=; b=G3h4TpsROyhrVE7UHTh8EPmF6Q
 M+TouKfexi0OVRk71ST5LaHevrS0q0zAIIU5yHHdaI5cHJA2N1d7+vDwxX75RJJ48MHp6kttMWm6q
 klkDM+F/5FXt6R+UGAVrzD+IapHXs5Ir3SkPGj0UvRs8Qwb69me+fthFXQAyH/jkR/QE=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kNVwU-00B1A0-GM; Wed, 30 Sep 2020 06:50:32 +0000
Received: by mail-pj1-f65.google.com with SMTP id q4so332861pjh.5;
 Tue, 29 Sep 2020 23:50:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=krGpYOVpUat0gERMlMR1P1lhK//ROWK8HUHnVTxyKd4=;
 b=Wu1wW7kGVUX2hnBN6KUwy3RNOwJdKCSWkRfqt1BdsxEV1wgVF6VdZ8NL/HbGwWmxHw
 AdAXq8grvCkSPFY+1tDKWNvtsGuzSzgeuPhxb1wFZYdMsiAq9SID+Pql3YPWUloILMJf
 fcUgmzRPqruLLP93zxemu5YuwJIqfYbUJwWg4cfweSSj6P+zHCTe7pWXONkForHoTIUb
 RMvm4XvDYv4ejTDvAOt+BCRBzgm2Q97XU1LRQvw2P9NOmrBsJd0sCY7wgBy71PLCEqLB
 Ek484Owhn5P/s0GF9eKQUFYGK2LO7RhES17Vo4zbqACdtEKX26qKGsx+lV1bKUlbxuEI
 J6OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=krGpYOVpUat0gERMlMR1P1lhK//ROWK8HUHnVTxyKd4=;
 b=HEMKKsI6F/VeCkN7aylhbV5EMuvJ+LDnt+xd3YBr5rKLANXeswvVD3KE5LTLbzqw9A
 QVI6lrbXvrytvE9klt+13PTs24VKoxr3GswL8t3RuyBCJgPl8Dn+S7sexthjSc0xiPHS
 SJhCCyo+GiksWHIFH6jbm0MZyw4foJPpp3glsBW9U36RCoSmO1j3zx5W7aSgiCzhAY7O
 odqD+tp/0xQmaOLGB3C2VTvJ7w+zP6MkUMR3Llm4eAZnyxtOvQoQvSrGe9X6L+o1jQV+
 W1zWlOfsqoRaEtfi92Kp+7vbGdB0a1Djh8OxJWPeAs3U+sq6ln5QnV9SiadHhINZ4UQe
 nXAw==
X-Gm-Message-State: AOAM533JDt3eYOVsyAeO7c9Z3WPC9uJupMV5ppCz5WJ1UgYu09crtVJc
 7tsGXhvFGuGJt4y81d3tljs=
X-Google-Smtp-Source: ABdhPJxc5RwMM9+nVdS8pkuhMEUvsg+HwSRqEGKdOiO7375+3pYB55ceWSEbfhp0KE1MZXbDtDiXOA==
X-Received: by 2002:a17:902:ee06:b029:d1:8c50:b1ba with SMTP id
 z6-20020a170902ee06b02900d18c50b1bamr1160641plb.35.1601448616906; 
 Tue, 29 Sep 2020 23:50:16 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id 190sm1100865pfy.22.2020.09.29.23.50.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 23:50:16 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 29 Sep 2020 23:53:17 -0700
Message-Id: <20200930065318.3326526-9-nickrterrell@gmail.com>
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kNVwU-00B1A0-GM
Subject: [f2fs-dev] [PATCH v4 8/9] lib: unzstd: Switch to the zstd-1.4.6 API
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
 lib/decompress_unzstd.c | 40 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
index a79f705f236d..d4685df0e120 100644
--- a/lib/decompress_unzstd.c
+++ b/lib/decompress_unzstd.c
@@ -73,7 +73,8 @@
 
 #include <linux/decompress/mm.h>
 #include <linux/kernel.h>
-#include <linux/zstd_compat.h>
+#include <linux/zstd.h>
+#include <linux/zstd_errors.h>
 
 /* 128MB is the maximum window size supported by zstd. */
 #define ZSTD_WINDOWSIZE_MAX	(1 << ZSTD_WINDOWLOG_MAX)
@@ -120,9 +121,9 @@ static int INIT decompress_single(const u8 *in_buf, long in_len, u8 *out_buf,
 				  long out_len, long *in_pos,
 				  void (*error)(char *x))
 {
-	const size_t wksp_size = ZSTD_DCtxWorkspaceBound();
+	const size_t wksp_size = ZSTD_estimateDCtxSize();
 	void *wksp = large_malloc(wksp_size);
-	ZSTD_DCtx *dctx = ZSTD_initDCtx(wksp, wksp_size);
+	ZSTD_DCtx *dctx = ZSTD_initStaticDCtx(wksp, wksp_size);
 	int err;
 	size_t ret;
 
@@ -165,7 +166,6 @@ static int INIT __unzstd(unsigned char *in_buf, long in_len,
 {
 	ZSTD_inBuffer in;
 	ZSTD_outBuffer out;
-	ZSTD_frameParams params;
 	void *in_allocated = NULL;
 	void *out_allocated = NULL;
 	void *wksp = NULL;
@@ -229,36 +229,24 @@ static int INIT __unzstd(unsigned char *in_buf, long in_len,
 	out.size = out_len;
 
 	/*
-	 * We need to know the window size to allocate the ZSTD_DStream.
-	 * Since we are streaming, we need to allocate a buffer for the sliding
-	 * window. The window size varies from 1 KB to ZSTD_WINDOWSIZE_MAX
-	 * (8 MB), so it is important to use the actual value so as not to
-	 * waste memory when it is smaller.
+	 * Zstd determines the workspace size from the window size written
+	 * into the frame header. This ensures that we use the minimum value
+	 * possible, since the window size varies from 1 KB to ZSTD_WINDOWSIZE_MAX
+	 * (1 GB), so it is very important to use the actual value.
 	 */
-	ret = ZSTD_getFrameParams(&params, in.src, in.size);
+	wksp_size = ZSTD_estimateDStreamSize_fromFrame(in.src, in.size);
 	err = handle_zstd_error(ret, error);
 	if (err)
 		goto out;
-	if (ret != 0) {
-		error("ZSTD-compressed data has an incomplete frame header");
-		err = -1;
-		goto out;
-	}
-	if (params.windowSize > ZSTD_WINDOWSIZE_MAX) {
-		error("ZSTD-compressed data has too large a window size");
+	wksp = large_malloc(wksp_size);
+	if (wksp == NULL) {
+		error("Out of memory while allocating ZSTD_DStream");
 		err = -1;
 		goto out;
 	}
-
-	/*
-	 * Allocate the ZSTD_DStream now that we know how much memory is
-	 * required.
-	 */
-	wksp_size = ZSTD_DStreamWorkspaceBound(params.windowSize);
-	wksp = large_malloc(wksp_size);
-	dstream = ZSTD_initDStream(params.windowSize, wksp, wksp_size);
+	dstream = ZSTD_initStaticDStream(wksp, wksp_size);
 	if (dstream == NULL) {
-		error("Out of memory while allocating ZSTD_DStream");
+		error("ZSTD_initStaticDStream failed");
 		err = -1;
 		goto out;
 	}
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
