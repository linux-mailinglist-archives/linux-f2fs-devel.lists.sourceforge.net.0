Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83AEE34AF21
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Mar 2021 20:15:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lPrvO-0002y6-7o; Fri, 26 Mar 2021 19:15:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lPruv-0002vP-OA; Fri, 26 Mar 2021 19:14:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=3eZ1XyrRmWI9aSyLAK6XW+5gukvn2M+SvfUE70SUpDQ=; b=F67L02LrDmm2JcKIsGUegJ87yX
 UbvZkq/m2RX27o9ob8iHjk02kfuihw8NpcnHVqz/iep63tK8EH/sacQ8lvX12xIRkzTGox7skAz3z
 SbqxQdYGaNksFRu20i/FWz1RNomXC+veLw/EJOV8/7yehBat3+uTVq7puPCZdt6G2tc4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=3eZ1XyrRmWI9aSyLAK6XW+5gukvn2M+SvfUE70SUpDQ=; b=nA6+QSJQHoJCYNXqhj73zJLBDe
 69Og/49dAkF2JlOlJ+jVYk30oz61Q1s8jDppIO958lyKyuHTT/nlRc+wOgDT+N8QmDVjlXJhdSB5o
 L9wQlc67BAHsKesvxKfLFpOWfGYsdLAOAHpPPDktzTFKuzPmRgcpDEluhDxn4k5N5sxQ=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lPrub-00F4Po-8e; Fri, 26 Mar 2021 19:14:43 +0000
Received: by mail-pl1-f175.google.com with SMTP id v8so1380764plz.10;
 Fri, 26 Mar 2021 12:14:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3eZ1XyrRmWI9aSyLAK6XW+5gukvn2M+SvfUE70SUpDQ=;
 b=Jl6NIyEEkokUTYkrd5gDZszVhtnDTLPQZnzzowtNmfnfe/k/eDnmFmtOdCwNtQEfOz
 ASHjeC7TO3Q6WqVBlLuahcUDTayqS70gvIV1DQOL5ssz59nP3pdzSS2Rq7m8WT4COuAn
 2n6QEwqMIRdrxW4edFPe6EauqlbjPA5VPxjCGu/fWdHzslSe02Ec1LcwC48GuOQEbzyk
 /xLbpj93pniQTBqj9RXjL2mZ9l9mgvLQ5yXYbWd53pQn+sPlLBbjxN2mdskdKBj8kd2H
 PfNwnOSplZ8gAjjwfqFNDhzvHLjypauL9hXKgGKRKoJfhf8JK1JuulpxNJjDV62GH/NA
 nXfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3eZ1XyrRmWI9aSyLAK6XW+5gukvn2M+SvfUE70SUpDQ=;
 b=NrGLQ00VKWtrnJF0yw7QdAGYHZSMWiUEK12tw1eVklNR1ghmfi8kScg5umxzrY216z
 qQpoK0mA9GhcGFTcCEmBQy1ZT442os6pBLUFvSchBegdHqFT7tr8ym4EVHKbig3HMvTq
 HT7o0AtMf/ojZMoUfaFUmT7HS8K2MhC2vAqUeAfAh6+Wgs9bm5+QA5mozwXld89TNawj
 cohgUGLMI6cu6RSJ7TJ5yK1mOz37en0bTiv28ld9xwXFR4CB3Aau7FEQpzDhfUDnKob8
 qhZr9V8NloJ/hMSiZ0OpEkQ4AzF4LZG68BVz57bAkMDWQa7QLfjnvUoS32dx3ZY33d42
 xyFw==
X-Gm-Message-State: AOAM531MJbI6XvhDSVnusb94wMZ/rhdzzccpPMzpgj+xSFpYzhx6JHrK
 l6Y4yILT6BdCAkhWtRTFUzqhh262lnHiGw==
X-Google-Smtp-Source: ABdhPJwC5GQ5QiIvjxNM+oEQ5vB0p6D7E7m6FIhXTLkEZ1knmX0LiYX6gLmUXgQ0AlQ2xFoFn/C5eA==
X-Received: by 2002:a17:902:ead2:b029:e5:ba7a:a232 with SMTP id
 p18-20020a170902ead2b02900e5ba7aa232mr16732246pld.19.1616786059579; 
 Fri, 26 Mar 2021 12:14:19 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id j20sm13113765pji.3.2021.03.26.12.14.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Mar 2021 12:14:19 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Fri, 26 Mar 2021 12:18:58 -0700
Message-Id: <20210326191859.1542272-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20210326191859.1542272-1-nickrterrell@gmail.com>
References: <20210326191859.1542272-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.175 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1lPrub-00F4Po-8e
Subject: [f2fs-dev] [PATCH v8 2/3] lib: zstd: Add decompress_sources.h for
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
2.31.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
