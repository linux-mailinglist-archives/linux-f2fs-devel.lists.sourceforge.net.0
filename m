Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 298A827E1C6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Sep 2020 08:50:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNVwY-0007tj-E1; Wed, 30 Sep 2020 06:50:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kNVwV-0007tK-Em; Wed, 30 Sep 2020 06:50:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=; b=Nrq1E1rFpYGyMDX4co0PQ7wvEv
 /mFIrt9cj+MXQ1sKGq0y/Ws0FyGuFH67JTxb9uDw1PDs/djlAjzPNYjZ/DbKo2HW3H86ayuH4YtOD
 hyVeAEhbwoKrbo/WZ668wCO1WuSDzDMYV5ZPVh0PN3flkCBCq9gGyK5Nqom6FR1N3pI8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=; b=AdBaRoDq7CokyGkBxYS0IfV/uN
 ZHGEF8ObQlKEXF5NxTXQDMbcuM5EqQ8AprV2+8ESAne3LUKOwIHzHRockNznyr0V/BjJcoGFyjmBQ
 S9ThZHuIea7wFMSttWpqeGE/56COamNMKS0FXGxUiMc48B8llSe5C1lXWDLWgkDWsWzM=;
Received: from mail-pl1-f196.google.com ([209.85.214.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kNVwR-00B19v-6L; Wed, 30 Sep 2020 06:50:23 +0000
Received: by mail-pl1-f196.google.com with SMTP id bb1so420790plb.2;
 Tue, 29 Sep 2020 23:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=;
 b=quExN3Iu3Mb6d/UbSzvBc9+cO4HZkGevMkWHJJ7W1q2osihKIEitmFTUS7S4DC/a8B
 Djq2RRxKptwhCyVnDAAKLhiLPhj6j70fqz5FZ1O8s+TP499yKjY9uweY3C1DUsHsEmxr
 Wj8OhKdZ4gvV2O2CcWu3A5CEKTA42mJ82M2LoegMyBjduowXfl4Tb/lU/q57++1a0czJ
 xUJPCpEKzzjTPW1b7ccAGvQKY0SRaT//CVcuJ6iVa7JVmy0OAVbV2V5VZXsltNjr2nK8
 YTxNeKVOSAjLdde08BBUN82CxzAoHJqym4o8/Ir/ErgsyYrdHeBIAv5j/EpU8icjiihI
 A2uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=290Bo0sJTh/t678nA8yWOfHRoSh5E7Ekj1ME0hd0Klk=;
 b=V9VaNkLZ7vsTLAIM5K3XWoUJSmwS7Wx5AIV/zH62C8LESvYx7c6T8XFnEFGuNPVm4X
 yrEc/AFQiWhZV2fpyXbU1lbUwmvo27WS8rQ9e+WaSw5zh+tDb6mHqpEOGreJTAWq5SPq
 xC196zVUauLRss4HtvPxcusqg99y8VQz6TlYzKQMm1zXMT+x4Rg7kOBCT8OU9R/n4fP/
 oZDt13E+JOcjaa06TU5pYVK5wID34Pc6nwqJeumo5UivV/TadIbg66syoEp+2JkdKO7u
 EIbsXmGzdtD+GuuRWVwZ9MJJW+mMOWcanNtvAqBYvKxGZBq1DCCRz88crtvDv4j9DYPS
 TrXg==
X-Gm-Message-State: AOAM5307RuEeKoddgiV8rvGvcQPVQIHSROx0NE2SloIx0D/ZpLnRXGYK
 nyYS+Sn6AqbXzpA45ylGbFfRi0Kz8w8=
X-Google-Smtp-Source: ABdhPJwZAqxnVJJGlifdOFLWl5NCGkwvpGyckSZ7o9lTNGIZUmlSvZKrTdsofp7uNXk7hCIRx3HFew==
X-Received: by 2002:a17:902:7890:b029:d3:782e:8a8e with SMTP id
 q16-20020a1709027890b02900d3782e8a8emr687882pll.70.1601448613562; 
 Tue, 29 Sep 2020 23:50:13 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id 190sm1100865pfy.22.2020.09.29.23.50.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 23:50:12 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 29 Sep 2020 23:53:16 -0700
Message-Id: <20200930065318.3326526-8-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200930065318.3326526-1-nickrterrell@gmail.com>
References: <20200930065318.3326526-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.196 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.196 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kNVwR-00B19v-6L
Subject: [f2fs-dev] [PATCH v4 7/9] squashfs: zstd: Switch to the zstd-1.4.6
 API
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
 fs/squashfs/zstd_wrapper.c | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/fs/squashfs/zstd_wrapper.c b/fs/squashfs/zstd_wrapper.c
index f8c512a6204e..add582409866 100644
--- a/fs/squashfs/zstd_wrapper.c
+++ b/fs/squashfs/zstd_wrapper.c
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/bio.h>
 #include <linux/slab.h>
-#include <linux/zstd_compat.h>
+#include <linux/zstd.h>
 #include <linux/vmalloc.h>
 
 #include "squashfs_fs.h"
@@ -34,7 +34,7 @@ static void *zstd_init(struct squashfs_sb_info *msblk, void *buff)
 		goto failed;
 	wksp->window_size = max_t(size_t,
 			msblk->block_size, SQUASHFS_METADATA_SIZE);
-	wksp->mem_size = ZSTD_DStreamWorkspaceBound(wksp->window_size);
+	wksp->mem_size = ZSTD_estimateDStreamSize(wksp->window_size);
 	wksp->mem = vmalloc(wksp->mem_size);
 	if (wksp->mem == NULL)
 		goto failed;
@@ -71,7 +71,7 @@ static int zstd_uncompress(struct squashfs_sb_info *msblk, void *strm,
 	struct bvec_iter_all iter_all = {};
 	struct bio_vec *bvec = bvec_init_iter_all(&iter_all);
 
-	stream = ZSTD_initDStream(wksp->window_size, wksp->mem, wksp->mem_size);
+	stream = ZSTD_initStaticDStream(wksp->mem, wksp->mem_size);
 
 	if (!stream) {
 		ERROR("Failed to initialize zstd decompressor\n");
@@ -122,8 +122,7 @@ static int zstd_uncompress(struct squashfs_sb_info *msblk, void *strm,
 			break;
 
 		if (ZSTD_isError(zstd_err)) {
-			ERROR("zstd decompression error: %d\n",
-					(int)ZSTD_getErrorCode(zstd_err));
+			ERROR("zstd decompression error: %s\n", ZSTD_getErrorName(zstd_err));
 			error = -EIO;
 			break;
 		}
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
