Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D44522763E2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Sep 2020 00:38:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLDPJ-0005xi-DL; Wed, 23 Sep 2020 22:38:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kLDPG-0005xI-Sn; Wed, 23 Sep 2020 22:38:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4G8NJ7gBvmk7nE2Yhc5f36mYV1caN+TA2ng5rrNJ52k=; b=AX4+11+gcjoOnbPf451nlVjUxT
 BlK/WKKfh/Pv0gV09t1dArC1TB7ki56zh5AhVZ80VqoMtmpmJGy+1pKNUEOJ7TnG7A3PFxBhG+9m8
 VcDnUpFHYENlKMiWrDevNfiRgxsiiMrOEVuIOy95Di7d2QXF5LXiMJqdL4iO3+XBbEGk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4G8NJ7gBvmk7nE2Yhc5f36mYV1caN+TA2ng5rrNJ52k=; b=l3qW2LGfJdIJ19RQYIkeJU7dyM
 uP1fTmXW6Y1sxXLEc9JefAesxkGj32XZDRsN0ZMkfL9efItQxWgYxuJRfPj5gETXQ/HGUSTaXmIkD
 OS7ZjaweeA0lyjTxGB+bDN/Br+TknnCflnesQ44hOfgbULk6RrkeAOPKc5ZTlPHAi15I=;
Received: from mail-pf1-f193.google.com ([209.85.210.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLDP6-0038FR-Oe; Wed, 23 Sep 2020 22:38:34 +0000
Received: by mail-pf1-f193.google.com with SMTP id x123so558209pfc.7;
 Wed, 23 Sep 2020 15:38:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=4G8NJ7gBvmk7nE2Yhc5f36mYV1caN+TA2ng5rrNJ52k=;
 b=e//6wWpVk1BhA/UC96AvTv1sS2ltuDncPv9BuvIZ7qfgG+YnwoWa30tPXYHbCTGg+i
 O9QPX513HroUDjhw7Dy2Y+xk0rVwlRJoC4u1iZQ39BrhQaZ6vpnjQTFon86bR/guIM6O
 8woIwJRZmoZ8TuHrEnEjGa7/eUyykHK4QtT/Zf9Yv4VxtrqXTyTD9LgyQe6pDgrkIREz
 I7HJ75c8hd6HBD2iB3aDgxqaTIyMeBkaqZ59KQfnO7wJUe/RrbEpZ7I3lTMBOVgnbeLY
 VJE+QhGQNqv3lAMQ9ObEg+c1JfmxEnM22uXYEUSGwoMC0th2JPVgfG7wImkSH8ddFnp6
 OH2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=4G8NJ7gBvmk7nE2Yhc5f36mYV1caN+TA2ng5rrNJ52k=;
 b=p4FZSYUEfuUviKknqAfgw9RSFKzBic9AWPZPYNoy5j4/5vpJjfB1fPObVGtWQKJCpr
 dWu0juiePUj9PTdQVaP4SZ66uYdDBPTwY3AwibCX0X9ZUCMcfTQ2gnTEyXPw6H9MwDin
 qHZ/zgEHz1pngEoyxXtNSJVruF7hBmbY4fpteDQU//jsUX+ZhAor9slPWM28X5SpEGee
 nm5bxddPvIM9UOApmhGaEIw8RcUThGYp/VayAcjrH3hF9exzLgcG5V2nEG5Vu4F9ihj5
 AOMTwAdhA1YFIgEhQ0I2j3GB7hoVxTlKOlw/YFLrIPVieWbR1gNiiidR8N/DqjonuDaD
 hp8A==
X-Gm-Message-State: AOAM5321Xz75TVgeAtrOlUVbfrbcxzRfDviqUjfYwwjs34vf8i6cSlfB
 RSOtde/VeC8RsQCm6vW7IKQ=
X-Google-Smtp-Source: ABdhPJy41mUkxsEETeLY/pxBipDkhGbonDSW6onkmuqg+MfsGtRLm1/vxSpgrsIX5HW7nVjcab94EA==
X-Received: by 2002:a62:7c43:0:b029:139:858b:8033 with SMTP id
 x64-20020a627c430000b0290139858b8033mr1801462pfc.3.1600900699124; 
 Wed, 23 Sep 2020 15:38:19 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id d20sm417964pjv.39.2020.09.23.15.38.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 15:38:18 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 23 Sep 2020 15:41:58 -0700
Message-Id: <20200923224206.68968-2-nickrterrell@gmail.com>
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
 trust [209.85.210.193 listed in list.dnswl.org]
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
 [209.85.210.193 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kLDP6-0038FR-Oe
Subject: [f2fs-dev] [PATCH v3 1/9] lib: zstd: Add zstd compatibility wrapper
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

Adds zstd_compat.h which provides the necessary functions from the
current zstd.h API. It is only active for zstd versions 1.4.6 and newer.
That means it is disabled currently, but will become active when a later
patch in this series updates the zstd library in the kernel to 1.4.6.

This header allows the zstd upgrade to 1.4.6 without changing any
callers, since they all include zstd through the compatibility wrapper.
Later patches in this series transition each caller away from the
compatibility wrapper. After all the callers have been transitioned away
from the compatibility wrapper, the final patch in this series deletes
it.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 crypto/zstd.c               |   2 +-
 fs/btrfs/zstd.c             |   2 +-
 fs/f2fs/compress.c          |   2 +-
 fs/squashfs/zstd_wrapper.c  |   2 +-
 include/linux/zstd_compat.h | 116 ++++++++++++++++++++++++++++++++++++
 lib/decompress_unzstd.c     |   2 +-
 6 files changed, 121 insertions(+), 5 deletions(-)
 create mode 100644 include/linux/zstd_compat.h

diff --git a/crypto/zstd.c b/crypto/zstd.c
index 1a3309f066f7..dcda3cad3b5c 100644
--- a/crypto/zstd.c
+++ b/crypto/zstd.c
@@ -11,7 +11,7 @@
 #include <linux/module.h>
 #include <linux/net.h>
 #include <linux/vmalloc.h>
-#include <linux/zstd.h>
+#include <linux/zstd_compat.h>
 #include <crypto/internal/scompress.h>
 
 
diff --git a/fs/btrfs/zstd.c b/fs/btrfs/zstd.c
index 9a4871636c6c..a7367ff573d4 100644
--- a/fs/btrfs/zstd.c
+++ b/fs/btrfs/zstd.c
@@ -16,7 +16,7 @@
 #include <linux/refcount.h>
 #include <linux/sched.h>
 #include <linux/slab.h>
-#include <linux/zstd.h>
+#include <linux/zstd_compat.h>
 #include "misc.h"
 #include "compression.h"
 #include "ctree.h"
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 1dfb126a0cb2..e056f3a2b404 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -11,7 +11,7 @@
 #include <linux/backing-dev.h>
 #include <linux/lzo.h>
 #include <linux/lz4.h>
-#include <linux/zstd.h>
+#include <linux/zstd_compat.h>
 
 #include "f2fs.h"
 #include "node.h"
diff --git a/fs/squashfs/zstd_wrapper.c b/fs/squashfs/zstd_wrapper.c
index b7cb1faa652d..f8c512a6204e 100644
--- a/fs/squashfs/zstd_wrapper.c
+++ b/fs/squashfs/zstd_wrapper.c
@@ -11,7 +11,7 @@
 #include <linux/mutex.h>
 #include <linux/bio.h>
 #include <linux/slab.h>
-#include <linux/zstd.h>
+#include <linux/zstd_compat.h>
 #include <linux/vmalloc.h>
 
 #include "squashfs_fs.h"
diff --git a/include/linux/zstd_compat.h b/include/linux/zstd_compat.h
new file mode 100644
index 000000000000..cda9208bf04a
--- /dev/null
+++ b/include/linux/zstd_compat.h
@@ -0,0 +1,116 @@
+/*
+ * Copyright (c) 2016-present, Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under the BSD-style license found in the
+ * LICENSE file in the root directory of https://github.com/facebook/zstd.
+ * An additional grant of patent rights can be found in the PATENTS file in the
+ * same directory.
+ *
+ * This program is free software; you can redistribute it and/or modify it under
+ * the terms of the GNU General Public License version 2 as published by the
+ * Free Software Foundation. This program is dual-licensed; you may select
+ * either version 2 of the GNU General Public License ("GPL") or BSD license
+ * ("BSD").
+ */
+
+#ifndef ZSTD_COMPAT_H
+#define ZSTD_COMPAT_H
+
+#include <linux/zstd.h>
+
+#if defined(ZSTD_VERSION_NUMBER) && (ZSTD_VERSION_NUMBER >= 10406)
+/*
+ * This header provides backwards compatibility for the zstd-1.4.6 library
+ * upgrade. This header allows us to upgrade the zstd library version without
+ * modifying any callers. Then we will migrate callers from the compatibility
+ * wrapper one at a time until none remain. At which point we will delete this
+ * header.
+ *
+ * It is temporary and will be deleted once the upgrade is complete.
+ */
+
+#include <linux/zstd_errors.h>
+
+static inline size_t ZSTD_CCtxWorkspaceBound(ZSTD_compressionParameters compression_params)
+{
+    return ZSTD_estimateCCtxSize_usingCParams(compression_params);
+}
+
+static inline size_t ZSTD_CStreamWorkspaceBound(ZSTD_compressionParameters compression_params)
+{
+    return ZSTD_estimateCStreamSize_usingCParams(compression_params);
+}
+
+static inline size_t ZSTD_DCtxWorkspaceBound(void)
+{
+    return ZSTD_estimateDCtxSize();
+}
+
+static inline size_t ZSTD_DStreamWorkspaceBound(unsigned long long window_size)
+{
+    return ZSTD_estimateDStreamSize(window_size);
+}
+
+static inline ZSTD_CCtx* ZSTD_initCCtx(void* wksp, size_t wksp_size)
+{
+    if (wksp == NULL)
+        return NULL;
+    return ZSTD_initStaticCCtx(wksp, wksp_size);
+}
+
+static inline ZSTD_CStream* ZSTD_initCStream_compat(ZSTD_parameters params, uint64_t pledged_src_size, void* wksp, size_t wksp_size)
+{
+    ZSTD_CStream* cstream;
+    size_t ret;
+
+    if (wksp == NULL)
+        return NULL;
+
+    cstream = ZSTD_initStaticCStream(wksp, wksp_size);
+    if (cstream == NULL)
+        return NULL;
+
+    /* 0 means unknown in old API but means 0 in new API */
+    if (pledged_src_size == 0)
+        pledged_src_size = ZSTD_CONTENTSIZE_UNKNOWN;
+
+    ret = ZSTD_initCStream_advanced(cstream, NULL, 0, params, pledged_src_size);
+    if (ZSTD_isError(ret))
+        return NULL;
+
+    return cstream;
+}
+#define ZSTD_initCStream ZSTD_initCStream_compat
+
+static inline ZSTD_DCtx* ZSTD_initDCtx(void* wksp, size_t wksp_size)
+{
+    if (wksp == NULL)
+        return NULL;
+    return ZSTD_initStaticDCtx(wksp, wksp_size);
+}
+
+static inline ZSTD_DStream* ZSTD_initDStream_compat(unsigned long long window_size, void* wksp, size_t wksp_size)
+{
+    if (wksp == NULL)
+        return NULL;
+    (void)window_size;
+    return ZSTD_initStaticDStream(wksp, wksp_size);
+}
+#define ZSTD_initDStream ZSTD_initDStream_compat
+
+typedef ZSTD_frameHeader ZSTD_frameParams;
+
+static inline size_t ZSTD_getFrameParams(ZSTD_frameParams* frame_params, const void* src, size_t src_size)
+{
+    return ZSTD_getFrameHeader(frame_params, src, src_size);
+}
+
+static inline size_t ZSTD_compressCCtx_compat(ZSTD_CCtx* cctx, void* dst, size_t dst_capacity, const void* src, size_t src_size, ZSTD_parameters params)
+{
+    return ZSTD_compress_advanced(cctx, dst, dst_capacity, src, src_size, NULL, 0, params);
+}
+#define ZSTD_compressCCtx ZSTD_compressCCtx_compat
+
+#endif /* ZSTD_VERSION_NUMBER >= 10406 */
+#endif /* ZSTD_COMPAT_H */
diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
index 0ad2c15479ed..dbc290af26b4 100644
--- a/lib/decompress_unzstd.c
+++ b/lib/decompress_unzstd.c
@@ -77,7 +77,7 @@
 
 #include <linux/decompress/mm.h>
 #include <linux/kernel.h>
-#include <linux/zstd.h>
+#include <linux/zstd_compat.h>
 
 /* 128MB is the maximum window size supported by zstd. */
 #define ZSTD_WINDOWSIZE_MAX	(1 << ZSTD_WINDOWLOG_MAX)
-- 
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
