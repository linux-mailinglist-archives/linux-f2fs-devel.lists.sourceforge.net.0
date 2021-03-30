Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F2DF734F47B
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 00:46:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRN86-0007oR-OC; Tue, 30 Mar 2021 22:46:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lRN83-0007nx-9e; Tue, 30 Mar 2021 22:46:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JXAaMKABaV2jajtKsKxGYYT+hHSjapVgGR5gnAv4wPY=; b=TJi6vZMiQ9VHwafUnkpbTtpP/J
 FHO7t0Z0zuOYbRjmiLVuoP0l8O9sFi8B4DFu9BednX/7JPqoXP6zU0kx7VbG0d6REh0oqqVEp4Iyw
 1gLql+/l0+UhKi++ZNUdzIwd3y5yWILJsXkvAGgVzNeCmFEJ4TEC/QYIIjLlVt9MrjrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=JXAaMKABaV2jajtKsKxGYYT+hHSjapVgGR5gnAv4wPY=; b=KmpXG6dGp/7PSkySnv7xzcjlgn
 yvyPSLBHNiYMszUWkTY7E5sqtsxmWXpBg1f0xAILPG0lMnSmoidfUh+UJ2+9ioear9VaQUkoWXZeZ
 buQD1Z/Pg2nPONNCbPgbx1Aa6vFMERddVFHzeLx62z51OA0qQdM9+bu4LY76bbtc7st4=;
Received: from mail-pj1-f49.google.com ([209.85.216.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lRN7w-0003gH-9p; Tue, 30 Mar 2021 22:46:31 +0000
Received: by mail-pj1-f49.google.com with SMTP id
 k23-20020a17090a5917b02901043e35ad4aso167981pji.3; 
 Tue, 30 Mar 2021 15:46:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=JXAaMKABaV2jajtKsKxGYYT+hHSjapVgGR5gnAv4wPY=;
 b=rpG4RHEUrKUL6vWLsoj95XHwN2l0nQLe4AAc8HhYTS8iauHIrun2MGyTAmgQbOhmJC
 WZWrL/YFsAL6U1Gc7+PrZOfsRKKkkygUbOsLM0pChao5wo9Oy1r9tOQzPkVu4Rv9Rtnk
 oABxDCZz+2hIQYOhZdZdVKFyOzGFLrDJ2dJMMkYryx6WBzGiXxbO6/2RYlHOF7UyRq8E
 u1LZWOjVtmS9EZA6/onhpk99mJUYA1VCu0PYRjCaClpn5fDxNGDlDUO5PgNILTG/5gfY
 xsz4T5W4nMnY2aX9NzMwdy5edsXDfOF6Xsc8tJH4mkkbxrzQWJrCLMARlM0HvIxgb64O
 lGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=JXAaMKABaV2jajtKsKxGYYT+hHSjapVgGR5gnAv4wPY=;
 b=YgxNVqqfB0hAaVc+PbN97+rQAeZUkoAWyeyQx+Ttp2v6w7Gxd5ho/X7suUrLd4fSW5
 y7WpdaftGIBEAWlQiOZcA+Cq5eY8Z713VmyuDWtrG5dTs5/vyfQqwaRVusYRCzSELkUJ
 c2wIFzuMCVOxQDXF7Iv049smr89CNztDuQRdYxyT5QXQ+Ug/X7kRmobW3l/KLzToiZcw
 Vd0OQRu59dNyyZMul7H+KXXuzWjbHtN5G/Qj4DemFhcM7KbQmr/8j8wIuYQJVKp0YgWu
 98XOGggGP2hEh/4CmV2yYIvnJbjXAGgJZYQ6WHlzz3m0auAWURtMAvh7tX6n+73Z+alT
 2EhA==
X-Gm-Message-State: AOAM5336d74idGTnZotXB8lYx0/QVfD8mpPT9pQIFNKsv6d1ZFLOA/N5
 7JELdCLv5U8mE9xiWA1PZ01orZ+x9ARVpw==
X-Google-Smtp-Source: ABdhPJyGgru2+ezHpj1LM0whxIWM74Z/P76Hr1X70Q5Zuk8tI0sLvMZTLt5Q2qm8vHnHsPgLWsJMfQ==
X-Received: by 2002:a17:902:8685:b029:e6:5ff6:f7df with SMTP id
 g5-20020a1709028685b02900e65ff6f7dfmr517568plo.40.1617144377869; 
 Tue, 30 Mar 2021 15:46:17 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id t12sm227780pga.85.2021.03.30.15.46.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 30 Mar 2021 15:46:17 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 30 Mar 2021 15:51:11 -0700
Message-Id: <20210330225112.496213-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210330225112.496213-1-nickrterrell@gmail.com>
References: <20210330225112.496213-1-nickrterrell@gmail.com>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.49 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lRN7w-0003gH-9p
Subject: [f2fs-dev] [PATCH v9 2/3] lib: zstd: Add decompress_sources.h for
 decompress_unzstd
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
 Yann Collet <cyan@fb.com>, David Sterba <dsterba@suse.cz>,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Petr Malat <oss@malat.biz>, Chris Mason <clm@fb.com>,
 Nick Terrell <terrelln@fb.com>, linux-crypto@vger.kernel.org,
 Oleksandr Natalenko <oleksandr@natalenko.name>,
 Kernel Team <Kernel-team@fb.com>,
 =?UTF-8?q?Micha=C5=82=20Miros=C5=82aw?= <mirq-linux@rere.qmqm.pl>,
 Niket Agarwal <niketa@fb.com>, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Nick Terrell <terrelln@fb.com>

Adds decompress_sources.h which includes every .c file necessary for
zstd decompression. This is used in decompress_unzstd.c so the internal
structure of the library isn't exposed.

This allows us to upgrade the zstd library version without modifying any
callers. Instead we just need to update decompress_sources.h.

Signed-off-by: Nick Terrell <terrelln@fb.com>
---
 lib/decompress_unzstd.c       |  6 +-----
 lib/zstd/decompress_sources.h | 23 +++++++++++++++++++++++
 2 files changed, 24 insertions(+), 5 deletions(-)
 create mode 100644 lib/zstd/decompress_sources.h

diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
index c88aad49e996..6e5ecfba0a8d 100644
--- a/lib/decompress_unzstd.c
+++ b/lib/decompress_unzstd.c
@@ -68,11 +68,7 @@
 #ifdef STATIC
 # define UNZSTD_PREBOOT
 # include "xxhash.c"
-# include "zstd/entropy_common.c"
-# include "zstd/fse_decompress.c"
-# include "zstd/huf_decompress.c"
-# include "zstd/zstd_common.c"
-# include "zstd/decompress.c"
+# include "zstd/decompress_sources.h"
 #endif
 
 #include <linux/decompress/mm.h>
diff --git a/lib/zstd/decompress_sources.h b/lib/zstd/decompress_sources.h
new file mode 100644
index 000000000000..d82cea4316f5
--- /dev/null
+++ b/lib/zstd/decompress_sources.h
@@ -0,0 +1,23 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+/*
+ * Copyright (c) Facebook, Inc.
+ * All rights reserved.
+ *
+ * This source code is licensed under both the BSD-style license (found in the
+ * LICENSE file in the root directory of this source tree) and the GPLv2 (found
+ * in the COPYING file in the root directory of this source tree).
+ * You may select, at your option, one of the above-listed licenses.
+ */
+
+/*
+ * This file includes every .c file needed for decompression.
+ * It is used by lib/decompress_unzstd.c to include the decompression
+ * source into the translation-unit, so it can be used for kernel
+ * decompression.
+ */
+
+#include "entropy_common.c"
+#include "fse_decompress.c"
+#include "huf_decompress.c"
+#include "zstd_common.c"
+#include "decompress.c"
-- 
2.31.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
