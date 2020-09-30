Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E93F27E1B4
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Sep 2020 08:49:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kNVw1-0007go-0w; Wed, 30 Sep 2020 06:49:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kNVvw-0007bK-AP; Wed, 30 Sep 2020 06:49:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=; b=cH+wTGdimGe8q9DYIqMegWoYCT
 AAD0Q/N+V+XRt40hOtDH8CqUjTfGiQyQS4ar/XrkzK+Eyuer91hOz0GmZH2uSV71C7ZpjQ3h9jHak
 kGvi605pSB6fK9q4h44o54g9JSvEssSpvVm8yj7TlWSLk+ihRuCw+heSg9PEQOTL8Ld8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=; b=KmavlY0pYuZBjhU9kobiN9IWGj
 GWgnlLSKm4hBDN1nikHuytijueEYARtiB0HJjvvx3E7NZPMMEQo5YLvv8KLRHbuuaIja8yrdoOoT0
 TyVVEFunxNaaYvtgCxMGXJ35eDsqEOMeAZ89kmCs0hodtQ4PvpgPn/sBNlol5bWHDXkc=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kNVvt-00B18l-J5; Wed, 30 Sep 2020 06:49:48 +0000
Received: by mail-pg1-f194.google.com with SMTP id 34so465282pgo.13;
 Tue, 29 Sep 2020 23:49:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=;
 b=VTD6SCyZPXt/5nIAOEqALhGagetdiFPpYbIX86qlGxbocho1y+f/mpB80lXEz+tm7C
 WPqAJDixQU0DnytgSTNpm86PRzC4bTyHZxzdH07dQaxcBmAC98P4JRlPQytUlDnujCYw
 VCsdX6QF1B02CM23+AJV8X7BVrHIXixUbS0yeeRHhIkH1zwu1ShforEv739Ju+sB6gmL
 31LGEumu0hEvVb7seUGzaCvZaOBZYnzRUnxV4oYPoH3oI0utmkBBYtWHKCu+Jf5K4clj
 sHMtq1TgNfc44BNLwIcegLpJB66wA/8eIYjaBs0sYHw5Mv6rRakjsuEcif2kLmaWxV7L
 Dhfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=;
 b=RDV7C6tGgieBiAsPl0CrVjw7+cR1/fCK/rh73nIVN9xQ7Iy8/PHjxYjKG9Ui/zrR0x
 BdPssYr0Sp6K6T2IXJtxiCRjeFMRlw2wWoOnKxwPvM2eaV8AUelAAo6Vxdb00Z6ceTla
 lohnMeTfUS3mAHMQlcOgWR5mGeSrAukE1ov/iy+VnTBb/6dlOjNYSe3NkGRa9loZoc3W
 9ukcOEakERFP23NaHztR9DPleepCDxmcRY9jC3rSSAZriqno1kbxGYQEOMph7nT3aCCa
 cJky4ZUD9TJucqmz55miodg3qBRqWLT4iDV5NvfoXtNb52k/8pwTrdXMcH7yYrek2pjV
 BF7w==
X-Gm-Message-State: AOAM533ljHBprGsc518Mw4XBm/X9HrzVa40MrPsU9qhQjGiNMDaRtsCe
 c8LNc7ilQMxyx8u/q/1PsWK5Ty0Imko=
X-Google-Smtp-Source: ABdhPJw9Vmlwv8qFlV+Os7mUuWY82swGcHqlIj/BIfXkC1jOiYDEGvYsgv1t43sX4UNIWOFDU2oM8Q==
X-Received: by 2002:a65:5bcf:: with SMTP id o15mr1054550pgr.126.1601448579954; 
 Tue, 29 Sep 2020 23:49:39 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id 190sm1100865pfy.22.2020.09.29.23.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Sep 2020 23:49:39 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 29 Sep 2020 23:53:11 -0700
Message-Id: <20200930065318.3326526-3-nickrterrell@gmail.com>
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
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kNVvt-00B18l-J5
Subject: [f2fs-dev] [PATCH v4 2/9] lib: zstd: Add decompress_sources.h for
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
index dbc290af26b4..a79f705f236d 100644
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
index 000000000000..ccb4960ea0cd
--- /dev/null
+++ b/lib/zstd/decompress_sources.h
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: GPL-2.0-only
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
2.28.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
