Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 661DD2CE013
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 21:50:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkvYa-0007K9-O2; Thu, 03 Dec 2020 20:50:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kkvYQ-0007J2-IX; Thu, 03 Dec 2020 20:50:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oICP2DQXRz8kl3Xw+I5CA1wnwdRsIw2lNW3EwvVVu50=; b=HrrL/zIzVWRve/bptzSKSH5suf
 Xr1DVyiqCu06iHLg+anb8OGkr9qCpEp94fzRFsybGDPQ/S6hIZLDNDP6v8Q/x5phpwVbplkx7OhCt
 PS8eeJvj/PV0xweIea7sqk1vCQ05zbNE0GESHj6F8eNjJFbZeRkpAZi2MduFyOYNPvIc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=oICP2DQXRz8kl3Xw+I5CA1wnwdRsIw2lNW3EwvVVu50=; b=kxo8Mo+Vg6C/4TrbZoi0jmqG4C
 hotlSEBezFOujTuE3/Z1Xf+v3XB7sxuPyG//BPubWb0+MaYOLK8XmJGeux+QAjRta7ffkbEfzAWNt
 MomJBQkafpOWv/OFYTkb3SKtFcSe64lTq//1IEfwPSlN5LvjI9oty3pfrHuhIGLvmCX8=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkvYO-000iZD-Jt; Thu, 03 Dec 2020 20:50:18 +0000
Received: by mail-pl1-f195.google.com with SMTP id t18so1849437plo.0;
 Thu, 03 Dec 2020 12:50:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=oICP2DQXRz8kl3Xw+I5CA1wnwdRsIw2lNW3EwvVVu50=;
 b=aHId6xA2iubISELUZk/324zK7BTZaQETDGqINUX2A2iZLmEQvZspp/hwZFliEp3cfS
 mGT0Ttge7bxjHp2ZBuaXVerSKvDvzLUEuqj4vL9Ep145emNtIVqorf7N+iaqYBkPn4s7
 sjX77mP6YI8N+aY/TGByh4w/SBOGMTbnhAKvxHVzHtkPYLpM9/XksS0CU3OajnV15lgh
 MeYey5ZtQmMZlxt5MIaaIS98kTYRBGmJrMXzKuTQXB5RQ+LNDu+8ePKfXnSmgEUYgJ7U
 oCGMvZXt/B36lPAKZo1dKIhEIgc+bkbpysqnISkdAKYtQIi/gde37hrBcxab7ab3wJtq
 G2wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=oICP2DQXRz8kl3Xw+I5CA1wnwdRsIw2lNW3EwvVVu50=;
 b=riP28gUCpeePT0m7/+JFZJPowPyfgCBdKh5Fxri+O3WsTJm0F1Hsd+ubOMd5gHQFln
 /xTc/8kR03ccY063/+O0/2g8le+LnSDeQHVjdbyM1TMpFfeyB5vbpgtb0ulePU3QLCY3
 zdfSQiadBJyjLalUkurxD0smKex0O3XsRShbS/GvkoIK4EZa2Tw0DBNkP4x1z5CC+uVa
 aBYjBEZ6p4LCq+KfoSGsvh+4OyoSMNMc4is8yfHgOnKFCz30dnd3xAe/bWMmXarSL/f+
 amQPA+Irp0GBpocJTLX2cfdqlDx1wt1dDhF6SjB2+6dh/tn66gUYhhzk8nHLTUYiiAhI
 caDg==
X-Gm-Message-State: AOAM533TR1aM7157XPFi2Q6TjK4+2KEVmMLlZEBQttkOyzzh/OnHDhX5
 mnezh6ireQyZCJic3L4GJ3o=
X-Google-Smtp-Source: ABdhPJxyTibG0ShhjkpVbPwQH8bIIH8MbkFKmMnx0qM8GSU5rDO9Ep5nPttliuie3dYyEhr4s1HTJw==
X-Received: by 2002:a17:902:a607:b029:d8:ba6e:9b54 with SMTP id
 u7-20020a170902a607b02900d8ba6e9b54mr764505plq.42.1607028610963; 
 Thu, 03 Dec 2020 12:50:10 -0800 (PST)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id s189sm2529151pfb.60.2020.12.03.12.50.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 03 Dec 2020 12:50:10 -0800 (PST)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Thu,  3 Dec 2020 12:51:13 -0800
Message-Id: <20201203205114.1395668-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201203205114.1395668-1-nickrterrell@gmail.com>
References: <20201203205114.1395668-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kkvYO-000iZD-Jt
Subject: [f2fs-dev] [PATCH v7 2/3] lib: zstd: Add decompress_sources.h for
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
 Yann Collet <cyan@fb.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Kernel Team <Kernel-team@fb.com>,
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
 lib/zstd/decompress_sources.h | 14 ++++++++++++++
 2 files changed, 15 insertions(+), 5 deletions(-)
 create mode 100644 lib/zstd/decompress_sources.h

diff --git a/lib/decompress_unzstd.c b/lib/decompress_unzstd.c
index dab2d55cf08d..e6897a5063a7 100644
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
index 000000000000..d2fe10af0043
--- /dev/null
+++ b/lib/zstd/decompress_sources.h
@@ -0,0 +1,14 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
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
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
