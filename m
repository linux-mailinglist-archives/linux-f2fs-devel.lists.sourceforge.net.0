Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E14A32B28F4
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Nov 2020 00:03:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdi6j-0000zS-Gn; Fri, 13 Nov 2020 23:03:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1kdgVG-0001OR-FJ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sPm/eBfn+fUdWSqGftmkfpK/4niJbcAlC/4vcql8NQo=; b=hbpRcKBNssYReIcBibw5ysdklk
 Wt1TxkwQBE/o60ArE5rK9UgyrPIHxqqrIaYCgn5b3dtDimJxagl/H93IL28n4R3mHfXJhWL/5GtZZ
 71dv4VjAYvz4emuaT36BoqqYVkYDyQOBElu7PXGR4gd1KFb0wcGfy6oEPCexlGS9jHik=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sPm/eBfn+fUdWSqGftmkfpK/4niJbcAlC/4vcql8NQo=; b=gUFBFGz6r84UgFEks4h7z2sXAc
 8ZhtwZLPiub0Z9vqnAgLnAXi6eBs68oDKOUTrBQnZkarz5wYl3bUXSKS5hDepeB2i8UeeMFyXH9TQ
 ti30d4se9/MV2XV2EzM+swdnX+icoeOj8uuUfnZAcF4zxDh32wUUGeJM9srECfjOviJM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdgV3-002U0V-M2
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 21:21:06 +0000
Received: from sol.attlocal.net
 (172-10-235-113.lightspeed.sntcca.sbcglobal.net [172.10.235.113])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id F225A2224F;
 Fri, 13 Nov 2020 21:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1605302448;
 bh=w/nTbZglYrBVjolS7Ms76rddc3wMmSAqoGOpGR3b8Dc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ry2d6JWCePxGm5upYC1sIfWRITct15ffVig02OjJYP+/F2aZOxuMfg7Hz1rZSkGib
 g5o6qWgG7GxGOJnD3MhmEAaDEJah+mvLStgxAA1O3EvV+D3bfWk30ZPvZ3Ponglf74
 BfoRsBeeLGv1YOjjyPeezPvBlD47BqVTKWTJ4XCE=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 13 Nov 2020 13:19:15 -0800
Message-Id: <20201113211918.71883-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20201113211918.71883-1-ebiggers@kernel.org>
References: <20201113211918.71883-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: checkpatch.pl]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kdgV3-002U0V-M2
Subject: [f2fs-dev] [PATCH 1/4] fs-verity: remove filenames from file
 comments
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
Cc: Jes Sorensen <Jes.Sorensen@gmail.com>,
 Luca Boccassi <luca.boccassi@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net,
 Paul Lawrence <paullawrence@google.com>, linux-ext4@vger.kernel.org,
 Martijn Coenen <maco@android.com>, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Embedding the file path inside kernel source code files isn't
particularly useful as often files are moved around and the paths become
incorrect.  checkpatch.pl warns about this since v5.10-rc1.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/enable.c    | 2 +-
 fs/verity/hash_algs.c | 2 +-
 fs/verity/init.c      | 2 +-
 fs/verity/measure.c   | 2 +-
 fs/verity/open.c      | 2 +-
 fs/verity/signature.c | 2 +-
 fs/verity/verify.c    | 2 +-
 7 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 5ab3bbec81087..9c5b28c865226 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/enable.c: ioctl to enable verity on a file
+ * Ioctl to enable verity on a file
  *
  * Copyright 2019 Google LLC
  */
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index c37e186ebeb6c..71d0fccb6d4c4 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/hash_algs.c: fs-verity hash algorithms
+ * fs-verity hash algorithms
  *
  * Copyright 2019 Google LLC
  */
diff --git a/fs/verity/init.c b/fs/verity/init.c
index 94c104e00861d..c98b7016f446b 100644
--- a/fs/verity/init.c
+++ b/fs/verity/init.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/init.c: fs-verity module initialization and logging
+ * fs-verity module initialization and logging
  *
  * Copyright 2019 Google LLC
  */
diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index df409a5682edf..5300b8d385376 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/measure.c: ioctl to get a verity file's measurement
+ * Ioctl to get a verity file's measurement
  *
  * Copyright 2019 Google LLC
  */
diff --git a/fs/verity/open.c b/fs/verity/open.c
index bfe0280c14e49..a28d5be78a09c 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/open.c: opening fs-verity files
+ * Opening fs-verity files
  *
  * Copyright 2019 Google LLC
  */
diff --git a/fs/verity/signature.c b/fs/verity/signature.c
index b14ed96387ece..12794a4dd1585 100644
--- a/fs/verity/signature.c
+++ b/fs/verity/signature.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/signature.c: verification of builtin signatures
+ * Verification of builtin signatures
  *
  * Copyright 2019 Google LLC
  */
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index a8b68c6f663d1..0adb970f4e736 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -1,6 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0
 /*
- * fs/verity/verify.c: data verification functions, i.e. hooks for ->readpages()
+ * Data verification functions, i.e. hooks for ->readpages()
  *
  * Copyright 2019 Google LLC
  */
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
