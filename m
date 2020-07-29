Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 212C9231F2D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 Jul 2020 15:22:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k0m2m-0003UW-2g; Wed, 29 Jul 2020 13:22:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <chao@kernel.org>) id 1k0m2k-0003UF-5o
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 13:22:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2Xz04eTIPQnx4IvluO0nM4yDEKqBUDXabOKBm+pyJs=; b=Dp1eW8QiTF+8VEqx0HYi3EQDPc
 N9E6akuAfKk0OeG48gc+ttP4/4kR3e7d3TylVB69Onc79bHVU/ckbqJIiH4vgu/r66TvPUus9g+dz
 vq2qNUG5VgIMfTnaLb7jPT0254pNVODIF0rR1cdH+zK1PyXdT3ys8Dc4bFWFF3Acdf1c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b2Xz04eTIPQnx4IvluO0nM4yDEKqBUDXabOKBm+pyJs=; b=g
 sh4iOzlhirgx5mW80e6nBqIlMs7Lgrss5JmYJxN1p13uEcaavsEEunX2HFbc7XRHQQPcd+HPC01cs
 2cuNHFCxa4agRpxefIISc8b08jLVQ+auVT3n+vmldr0qfyUR29Xb1oDHr04pjBcVCYz4UX50hlVYE
 dyF4GtgdmVM0dbSs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k0m2e-003EaC-4v
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 29 Jul 2020 13:22:50 +0000
Received: from localhost.localdomain (unknown [49.65.247.178])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id C049220809;
 Wed, 29 Jul 2020 13:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1596028951;
 bh=Phtwyl6TA4Aztd1IQmv6O6oOJmp4MMAckE8fKe9Vl4c=;
 h=From:To:Cc:Subject:Date:From;
 b=af4M7BI8cvABf6YStyR4IEEdIi13eHIZKeSO+OKlT/9ruFDgnJSDbOllN2rNmmv3F
 FdChXRnsBzTyi/XG+/sEL36+WzHvv0X0jaccvErdJYyk0gCCgzDnNoqBSvqbSFnXU0
 o70FoKmaXZ+BvX5jkjWiKaqfIJTAohNLVlXqsFBo=
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 29 Jul 2020 21:21:35 +0800
Message-Id: <20200729132136.11134-1-chao@kernel.org>
X-Mailer: git-send-email 2.22.0
MIME-Version: 1.0
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k0m2e-003EaC-4v
Subject: [f2fs-dev] [PATCH 1/2] f2fs: compress: add sanity check during
 compressed cluster read
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

In f2fs_read_multi_pages(), we don't have to check cluster's type
again, since overwrite or partial truncation need page lock in
cluster which has already been held by reader, so cluster's type
is stable, let's change check condition to sanity check.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bc89bc987513..c1b676be67b9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2170,9 +2170,7 @@ int f2fs_read_multi_pages(struct compress_ctx *cc, struct bio **bio_ret,
 	if (ret)
 		goto out;
 
-	/* cluster was overwritten as normal cluster */
-	if (dn.data_blkaddr != COMPRESS_ADDR)
-		goto out;
+	f2fs_bug_on(sbi, dn.data_blkaddr != COMPRESS_ADDR);
 
 	for (i = 1; i < cc->cluster_size; i++) {
 		block_t blkaddr;
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
