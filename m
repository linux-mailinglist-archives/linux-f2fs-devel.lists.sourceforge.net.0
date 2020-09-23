Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C52763E4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Sep 2020 00:38:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kLDPS-0005nH-2K; Wed, 23 Sep 2020 22:38:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kLDPP-0005mz-Ge; Wed, 23 Sep 2020 22:38:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=; b=OdvvQqTSlCfBbxh0wKubrveUty
 ocerNToaKEmGXpTCs1kw2lEg9FriuQKo36x/IJaSFFyabTd+iLSCF+AoaJS8C+p0iSzQv7kY7gomz
 30an8R3UL2Oi3bBCuhTXFzFThHJyyQC9K1K3V2QEhfFXSEjF4VCax00k/ZcEeNTk7w3s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=; b=IueRrRgOjBB6D6Hyuo34Qhk/MV
 wLHuuEn/bqXaNI7xKTWYl2kx7QkJ4ewV2BayGYeawxg4DMCxpahnGnAV1fTNqqlHBFHJonN6R4/J2
 VNzr9He9s9Elze0WsD9XGMB1gtfC3SnQHfAWWOtPFdsE+nFs/NAvoXgruTOA8LoLai/o=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kLDPK-005Cxo-B8; Wed, 23 Sep 2020 22:38:42 +0000
Received: by mail-pg1-f193.google.com with SMTP id t14so602146pgl.10;
 Wed, 23 Sep 2020 15:38:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=;
 b=kXDCaLmCHlCSpz3GfLkhMgqT2UiSchxs5QLNNey72m88X40FqFzAB8d/lJuk2hihzl
 dugC0DuxKytS6WI6Dm1OOBaT9MPLn74HBXdmdLC5ZGdJVr14cZeKMwxY39NIefmex8sd
 AhrMes9dESnY9cXs18acSyeaXkrtGwFCbVr7BpU1NN0JalwShqwlXanMvQb3cycVmmP+
 0LeBnNffCVSRyt89wEY+V3H/hi+2e83ENuJbk5mQQjaPyydLEtQzGAluQ3+2oQgGHoRI
 h6vqo3AW3SgDNBiu8M4V4bw/rlHyURk6q9Sn0zaLz29ntujQc/H1MXR/rQsrqWEX8TsK
 6g4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=;
 b=cp11SleATw4xqV+sNRaUkCpI8crw9+FnvR+i3vSBumQQSHtIfTYctWfEXWEkmKPzKC
 fWwoC+x7PstujDzAcik95ABgV5InCxJnCikvN6aV8zVKkK2DrdVZhCOxaIRcdp5902Wn
 CzcoYa+kcqVjQrrQAnmZ/SnFPWInbEBmVfhpdtFynL+eq7g07sejCD1ublp4FSdF5+va
 QEmbrDLUkJRf/QSNGM/YbxE3teRpTIypEI3vR4yFwbAatlOg/ScMYM19+M9fRnrC41cg
 DKWlQqxsorTxyU0+ovpo8zDgr2CCNzgHQ9uuSWec5dxIbUvRd6TOqSKe+vreIyfr+Gt6
 oWFw==
X-Gm-Message-State: AOAM530zRRg2cT34DiPPEok6Y87/qqM6qyZ0tuLO0A6ECk/a70kXTz0r
 TRUHt8IdkT5udRdH35oUqyE=
X-Google-Smtp-Source: ABdhPJxRaooL2/Pt/x6Pz7ecJvtE3gZiEyaO6muoljDlIAGEiDU0hFyUt5AftFnqj1HWMnKgVTYpWQ==
X-Received: by 2002:a63:384f:: with SMTP id h15mr1576492pgn.144.1600900705185; 
 Wed, 23 Sep 2020 15:38:25 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id d20sm417964pjv.39.2020.09.23.15.38.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Sep 2020 15:38:24 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Wed, 23 Sep 2020 15:41:59 -0700
Message-Id: <20200923224206.68968-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200923224206.68968-1-nickrterrell@gmail.com>
References: <20200923224206.68968-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (nickrterrell[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: fb.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kLDPK-005Cxo-B8
Subject: [f2fs-dev] [PATCH v3 2/9] lib: zstd: Add decompress_sources.h for
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
