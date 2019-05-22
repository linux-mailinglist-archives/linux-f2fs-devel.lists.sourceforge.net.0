Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BFC7826D65
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 22 May 2019 21:41:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTX7X-0004JP-LH; Wed, 22 May 2019 19:41:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hTX7V-0004JC-II
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 19:41:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LV5+m5n/0egpRnyJ5+TRDecuLQF6g1EQjJPzsrA9S0o=; b=Mt3AwV5QNlPEWjsAzYuOFuwFqn
 yCS5XluOBWa5oAJhiU9DLuV6Uz5pqQcr8zDfXEQru7uo0G3b54K5l2LhuGP8H9V2eyUfLTgfc8rPw
 4a3yabZ/pWdjbYfvC8mZs+oq26YOQiiG00ozD3HY+bHrEpOyTcqSfAMStOw5YFhSq3RY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LV5+m5n/0egpRnyJ5+TRDecuLQF6g1EQjJPzsrA9S0o=; b=H
 L2HUZQQhE7gTWbev2LvbxIqhoyDnx2lAwHTUht1+UnJi3uJInNzSqx17i1dpiENsy6wy92CvWquBP
 tQBrsXZuaXSosAqtR2Np+XiBVfuK2GVVrFXzpXgW+2xonvHuzIngfxefHpdIsgNXQCD0Vs1/7v1B+
 m1ZTRCJcNEsTlC3I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTX7U-000J9A-H6
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 22 May 2019 19:41:49 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id E422C20862;
 Wed, 22 May 2019 19:41:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558554103;
 bh=Gn79gsEw+C+uKXTsbHVOJmkRfKMYLPmdynktiMtRcYo=;
 h=From:To:Cc:Subject:Date:From;
 b=b7RNOSX9OW86yRimsa4XJPMNZezMIiU8mijepL5frM9HEx/m18GdizXimBUWmeo8z
 qvVTU3Jj8kSgrPYHEp90X0JAE+WLjQZdR2M2nZ7GYA2ZfSkVS3NhmvEKxPwWAEsyTT
 jOpkmfKDxq2eMEjm895jPqz2qYyzGsN14gNv4wKs=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 22 May 2019 12:41:41 -0700
Message-Id: <20190522194141.91216-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
X-Headers-End: 1hTX7U-000J9A-H6
Subject: [f2fs-dev] [PATCH] fsck.f2fs: show elapsed time of full scan
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces the elapsed time of fsck.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index d844820..9aca024 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -18,6 +18,7 @@
 #include "fsck.h"
 #include <libgen.h>
 #include <ctype.h>
+#include <time.h>
 #include <getopt.h>
 #include "quotaio.h"
 
@@ -745,6 +746,7 @@ int main(int argc, char **argv)
 {
 	struct f2fs_sb_info *sbi;
 	int ret = 0;
+	clock_t start = clock();
 
 	f2fs_init_configuration();
 
@@ -853,7 +855,7 @@ retry:
 	if (ret < 0)
 		return ret;
 
-	printf("\nDone.\n");
+	printf("\nDone: %lf secs\n", (clock() - start) / (double)CLOCKS_PER_SEC);
 	return 0;
 
 out_err:
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
