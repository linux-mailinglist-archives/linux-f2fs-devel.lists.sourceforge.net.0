Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A5FE526BAB3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 16 Sep 2020 05:40:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kIOJD-0002j7-Fu; Wed, 16 Sep 2020 03:40:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <nickrterrell@gmail.com>)
 id 1kIOJA-0002ic-Ai; Wed, 16 Sep 2020 03:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=; b=YxBFlFpwBP0XRCc97J/ri68suw
 n8l/CCcvvBF/cK3Kh9CK7Umj+mIMJW2+WlThXtUHMSxVZylbRy9mQHCGKiZo0cfHNF8+Pb53rSFoL
 1vXlZOjojSrRWLDOOhmq91qH1dbcL3LJC78P5SEFxXdoN/eE8kiPU5k/P0vTevqMDUYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=; b=EskPDs2AUMBVq2Nt+j/bf5Eoh2
 K39dmxpkE5avnKGa+YVu+jU7ni6WBwROTLv7hOzIfV9D8Ff2LPqJ8Y/7r3tQ0wWQ5RL7g1qfpUk4H
 sXmAnzK93rpmx8v9Q+OYmA8+myY70Hg1+IhlsvJpN5tH0A7xHHIYu0wNxmZEGqO/gbqA=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kIOJ4-00AlUx-BT; Wed, 16 Sep 2020 03:40:36 +0000
Received: by mail-pj1-f65.google.com with SMTP id fa1so860691pjb.0;
 Tue, 15 Sep 2020 20:40:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=;
 b=beGwVBILqaiGpiT+75iT50tdl4GOlO+U/RTraSf3f+81k3pMHTEARmVXl/HtPPMVzj
 T4bcclVyKBh7YNHecZ4ZQZsUSKdDuuP1drlk99lLR5udm5ltlTCtUWzp6CnCsVmwyu2q
 9KAPj6A8DE2/R6VoZOjy48UCYwM/gtitbgryTwCQgi42xbEQo1bZFcGv0VGhDqjehQMj
 kjCnzzHZeOT13zfrdOcMYLJ5Q/rEqgAmrp1UgQ3iN8bKpfH4wR+DN+jcm1weBggcXwm9
 oABmElw+TqYgkO7eiF9Pll2Zhj2KgyNXSuQpYOgXcMLbzGM2HeqcJYamsDKxj20BZmUg
 NIkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=981H7COrDglg2y2OsdhN4Ry4swXs13dJrOliSNOnl9g=;
 b=iqpa3qpgzbsF+YS0DRnuiV6nKMxkoMrc8pBozYuU0K6ZivXnfrhrZV7WLxGXkwVeSe
 jgCRLayOvuOOLcoqvgw7W01+8kSBjlUS1H20CCMOGIxMK0LNNKwxVYbmrF0bDbgnPaGs
 vfh1PjSD425c+LlDwK6PHPBOcYPFjYMPTRImHBgJ2x+wZnWQelQx6r7fp8bgUL9U4AMI
 zBxrmLJAAy060BgbQJtIaLVWIdeL4ZcoV1g/ZKQ2NiidgriBUNV9WyvzLjHZypqLM25X
 yNbbEQqdT5XSV1uCu7J0tbJU0V9baAuP2BGa8dTwkxekakvIV35EE5lt1RSmoQbYChcS
 RKVQ==
X-Gm-Message-State: AOAM530yQsIH/CFpEFDEo6v5GixBnCBy6ywPtcufwbjM6P3wOI5ixy7l
 OBurf5gqGXcW7oc4vbpu7Lk=
X-Google-Smtp-Source: ABdhPJzSQK/mccXT+Owi5SwS9HxQdQLIsp7WFSykJWpQoFEU50K6UTg3SvDO9HVvKqiZtT4pYwtTLg==
X-Received: by 2002:a17:902:9b91:b029:d1:cbfc:6319 with SMTP id
 y17-20020a1709029b91b02900d1cbfc6319mr10733775plp.3.1600227624748; 
 Tue, 15 Sep 2020 20:40:24 -0700 (PDT)
Received: from nickserv.localdomain (c-98-33-101-203.hsd1.ca.comcast.net.
 [98.33.101.203])
 by smtp.gmail.com with ESMTPSA id i20sm12856635pgk.77.2020.09.15.20.40.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Sep 2020 20:40:24 -0700 (PDT)
From: Nick Terrell <nickrterrell@gmail.com>
To: Herbert Xu <herbert@gondor.apana.org.au>
Date: Tue, 15 Sep 2020 20:42:55 -0700
Message-Id: <20200916034307.2092020-3-nickrterrell@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200916034307.2092020-1-nickrterrell@gmail.com>
References: <20200916034307.2092020-1-nickrterrell@gmail.com>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
X-Headers-End: 1kIOJ4-00AlUx-BT
Subject: [f2fs-dev] [PATCH 2/9] lib: zstd: Add decompress_sources.h for
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
