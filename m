Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE4D936BC28
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Apr 2021 01:42:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lbArb-0002H4-CS; Mon, 26 Apr 2021 23:42:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1lbArY-0002G6-N8; Mon, 26 Apr 2021 23:42:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zdyCdL1O6MHAZHMO3v3t2Hk2heeS+Nt7HrJ8IUq+ohk=; b=FrZejzgsGvZ4R1JhWuOD4VSlqi
 IyL5KIveBEvZbsnfjLsS1t8qFnjBlgT8a6otH1a+Fih1Vqn7DmzFQQjafsIUUqpI4eX0lVsdjfdMD
 tFXhQ8wpASYL0wBT1AV1nKB5g6ujZzwbHkD6B5hwx84U1iBmbCP0GcCH8Hvr+REo0Ifo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zdyCdL1O6MHAZHMO3v3t2Hk2heeS+Nt7HrJ8IUq+ohk=; b=PfCJmeIbG6Ynux1aTtag8f8U/N
 8XHcm4uSInTkiiXRslhh0eyVK6k+AD78Tm1Is30Glq/LYXVq1gvNpJXes28Xb8yT8VZJyHuJV4s1u
 TLrmc/sDAChT3B9UUsYt69pSlHBiwxezYhVqHrwIASIVNg8a4uYWV84EKeVDEjPFsR6c=;
Received: from mail-pf1-f177.google.com ([209.85.210.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.3)
 id 1lbArS-0006Uz-KC; Mon, 26 Apr 2021 23:41:59 +0000
Received: by mail-pf1-f177.google.com with SMTP id d124so40055109pfa.13;
 Mon, 26 Apr 2021 16:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zdyCdL1O6MHAZHMO3v3t2Hk2heeS+Nt7HrJ8IUq+ohk=;
 b=qG3AVIVOlh+jJAOJ/ofL/jF064Kdo+t1ZiyY6bwAW3+1Lc7RHlrWp+TJUJsEiP/YMb
 sX6Yq29euQNHsthnAyeGOC4Rorfs1B821jugW16rtBwkZi2FOVHInyRwY9p10HrNRuec
 x8tIHvo57UGYouJ31Fymm9TgAEbKcoXmlPxTPMxTgtbXiijTTQe5QromLPe4BmYVVd7g
 eNMMftuRueq/3z/ocASgs2oHugUz3eutvdih9+Ao2/IyBSi8nNY9ublhgFhzLFLH7r8h
 buUS4nltPkoh7Op69X12o4ghAJhj/uv5d0vh4hwRNkzg8qA9O6o4v4D0I2jmkBAN/nV1
 CzAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zdyCdL1O6MHAZHMO3v3t2Hk2heeS+Nt7HrJ8IUq+ohk=;
 b=EAh4oRWQD/o8syoKe4xysNR2haguAxlhRVmZQqnvtvHcA5WO7ZhsD1hbjhmpX60n3I
 z6W5o16fOpGFnA1tjlNPXwMY18tauA8oDp/tEKcaiLFfobduBJk6cousT1/URruKvIZK
 kMbCujTblglqfu0bQnjNcBKBQNpSGwqjgw91Pr7Xkp8kT6xJae6eSfXVqs2SRwsiN01c
 56aynscKErL0X/xhHWoYoV0PVLXBhTPuUmDvL9vi59FAXaDJIPRSuHiAOJ+n1dgXOC8d
 JSK3KHVBIrEtKWu9KM6sfmquqOcTdHnTa58e/T18xVsz8YdbawzNs6iAlNLQqZCmgHeb
 ijKg==
X-Gm-Message-State: AOAM532j7IV4FxnoaGHAs0awG7hyc2rMDprkpdJ7G+nEiSKk1mHQvr7R
 ae02SjllrT+xwJ/5X8NHWeI=
X-Google-Smtp-Source: ABdhPJwNMzveK5M3WOq6bGS5Dy35S6A+cXn6A21maNSg0rPzd/8N2wfhp/TFPPiKuoKq/hEF7DwaXQ==
X-Received: by 2002:a05:6a00:1a4a:b029:261:d9ed:fd80 with SMTP id
 h10-20020a056a001a4ab0290261d9edfd80mr20213974pfv.20.1619480509313; 
 Mon, 26 Apr 2021 16:41:49 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id m7sm640828pfc.218.2021.04.26.16.41.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Apr 2021 16:41:48 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Mon, 26 Apr 2021 16:46:19 -0700
Message-Id: <20210426234621.870684-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210426234621.870684-1-nickrterrell@gmail.com>
References: <20210426234621.870684-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.177 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.177 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lbArS-0006Uz-KC
Subject: [f2fs-dev] [PATCH v10 2/4] lib: zstd: Add decompress_sources.h for
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
Cc: squashfs-devel@lists.sourceforge.net, Eric Biggers <ebiggers@kernel.org>,
 Johannes Weiner <jweiner@fb.com>, Christoph Hellwig <hch@infradead.org>,
 Nick Terrell <nickrterrell@gmail.com>, Yann Collet <cyan@fb.com>,
 David Sterba <dsterba@suse.cz>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Petr Malat <oss@malat.biz>,
 Chris Mason <clm@fb.com>, Nick Terrell <terrelln@fb.com>,
 linux-crypto@vger.kernel.org, Felix Handte <felixh@fb.com>,
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
2.31.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
