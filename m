Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 348092A3C74
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Nov 2020 07:02:50 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kZpP6-00084i-U7; Tue, 03 Nov 2020 06:02:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kZpP3-00083k-Ut; Tue, 03 Nov 2020 06:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z11dyIW9wYOT1WRGrY3n/HRYqfGSZJkJPYcfMlfSK1k=; b=cuXf3FWPACmdWCe64olUtY8uwi
 kIFAUuygf1KN45whl8PA5T3u1f+Bi2WhncTNkHivu1BUEsDNtwkzcqfwc/SFMKkjG66x9qaRKkPZC
 NrE/MScFUdyJDlQgvJN6tuS6h4TCvwc2CHHBVhZEYjQQi7Fbq+PkIwaagiGT9Wct2KTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z11dyIW9wYOT1WRGrY3n/HRYqfGSZJkJPYcfMlfSK1k=; b=OdzWdSL5x6Brk1O+1k0fFblGbc
 aRyehr6owJxLjkGVZWnXNJgEoO+umszC9IyVcOF2GNNse9aw7joNrVz4ie5zXES8CBpRg73DTZFS+
 Q8eVC/x1xFMGrueE+HMDE26zQyh6PGtsQZSaeZiNxv6+T2woiOt6HhXPBt1cXiDAQ1dg=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kZpOx-007Kju-Hw; Tue, 03 Nov 2020 06:02:45 +0000
Received: by mail-pg1-f193.google.com with SMTP id x13so12827809pgp.7;
 Mon, 02 Nov 2020 22:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=z11dyIW9wYOT1WRGrY3n/HRYqfGSZJkJPYcfMlfSK1k=;
 b=fqlEVbK35EPh+UkmbfTOML9wO/Yu6UWciXnYiqqdEFBWDytHVrYmbYSbG12dv3lj29
 ijQLun9BJcZFWXiFfb7KP6SyOle0F7XUCtEdyucxYLOXj8HjJeyih7omsHvYll7LqUXo
 Ezth8S3rW1LfHcLdV+yztMhArCw4MGetq8yF2xgV953ex+dYZdd95rMdMI/ZjReJM31v
 OLpBsuFM19OuIh9mQqk1Ibz47smDqth/3X5EdOHwsL24siNZb4S+19Bxoqf/gbZeNE66
 tS4lJIZ8sg6y5/BkJic3oQgWYhl+xHOgAJppgO4t86xw4TwHcW3qcydvarNH2ufdjq/e
 DuxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=z11dyIW9wYOT1WRGrY3n/HRYqfGSZJkJPYcfMlfSK1k=;
 b=CdI0Ls3GWOxRCYEBEmsvT/joy69sJMfpBc2WwRLpkT49QkOoV0oGzzHVqVg3cMd0wK
 w167fFf2KF+uRCbRodfHxShGbFH82pAPZ4ks+36F/xTGyNip2ntsjlBg5mBZQoZXof5N
 HYusebdscVWQMyL/V5neDFxAv9vGPhDV4Du6A1LZyYnWceSxsUVaK8n6WFM9ftzcRfSW
 1PPPDkGZJqu/NnUhwOXlk2W8mz1DMv6z/A/Qug1HCMZD+kwigoeplGTMTdrONeiIdYt2
 zS8PleQwGrsHJdP0KbPDRGVUlluAjEv7LfpRXIvUrID/Mctv8wriC/NT4D/GuAxv9y/Y
 tYwg==
X-Gm-Message-State: AOAM530NT5HndjgUx+8H9LDskaylVLZYJC6her3c20Po1mRwYxZ1i7UY
 4AvSHDGI6KvHbriXR+aoAcoa116IWrY=
X-Google-Smtp-Source: ABdhPJzczT8OSnH39dRzgGhVfqu8jd5/AMVdwt8aIEY9Xprsdx50dQXpPz4sAoL7yZ+FMm8SFeMYSw==
X-Received: by 2002:a62:4e0f:0:b029:156:13e0:efa7 with SMTP id
 c15-20020a624e0f0000b029015613e0efa7mr24248296pfb.73.1604383346862; 
 Mon, 02 Nov 2020 22:02:26 -0800 (PST)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id b16sm15647269pfp.195.2020.11.02.22.02.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 22:02:26 -0800 (PST)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon,  2 Nov 2020 22:05:34 -0800
Message-Id: <20201103060535.8460-9-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20201103060535.8460-1-nickrterrell@gmail.com>
References: <20201103060535.8460-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kZpOx-007Kju-Hw
Subject: [f2fs-dev] [PATCH v5 8/9] lib: unzstd: Switch to the zstd-1.4.6 API
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
 lib/decompress_unzstd.c | 40 ++++++++++++++--------------------------
 1 file changed, 14 insertions(+), 26 deletions(-)

diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
index 3c6ad01ffcd5..efbe66501b34 100644
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
@@ -234,36 +234,24 @@ static int INIT __unzstd(unsigned char *in_buf, long in_len,
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
