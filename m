Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D08C107C1F
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 23 Nov 2019 01:45:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iYJXk-000512-PI; Sat, 23 Nov 2019 00:44:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1iYJXj-00050u-AF
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Nov 2019 00:44:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5eaZ8M6ljIq5oIEHzX/fnBs5dQuOMUEMspVVAjymyd8=; b=NaCa25vSojL7RHlJ6cvcPudW0z
 U1bQSfxvQUJUM3QA6f3VtetjsmFKeLQGmc0nfX50pYb9KnumZF10I69MAFYrPijucG/4OI4kDVCjG
 BhZ7Qe1KreuHOJ9RkxpD44wgEBTxBoRY6mOQo/mfMOgco5gq6VFYd2ohTWIR5hXDBgjA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5eaZ8M6ljIq5oIEHzX/fnBs5dQuOMUEMspVVAjymyd8=; b=XCfRK8NwJUNExmIpcDtqtxX9DJ
 4pDezW4tLh0gs+i12ngNwVxy5iafufo3bhh1SOTiwzynkaB4QW+ENuhy0Rk/jUeUPeTngGGTpQWD/
 ITE//+zPEafvktz7uU3FINuHC/ZXWTWrENk5+7pcVUnBLc7OeCp7/YrB+r6FE8JbCAsM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iYJXh-00B39N-EU
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 23 Nov 2019 00:44:55 +0000
Received: from localhost (unknown [104.132.0.81])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id BDF6E2071C;
 Sat, 23 Nov 2019 00:44:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1574469887;
 bh=8GDWRYa40KJwgt0zJB9ze+0Ie0DnQLC/TcBFXY8zj6I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=ahob4dfSzommGd8Tm50XwooH8wCHXjFFODtp8cAoRlvHQmpiK4eShQ8GU34qTBd4E
 fFgCVl8crCWVywOLv4haDdgStjmrwR5HMco5b76GyiBE9x5pgiW/3Ln6df64Ct1a3U
 gqJFYKp/hKxMTgdpahXV78QAWqcLVkZ3wb5alHpw=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 22 Nov 2019 16:44:44 -0800
Message-Id: <20191123004444.99166-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20191123004444.99166-1-jaegeuk@kernel.org>
References: <20191123004444.99166-1-jaegeuk@kernel.org>
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
X-Headers-End: 1iYJXh-00B39N-EU
Subject: [f2fs-dev] [PATCH 2/2] fsck.f2fs: Enable user-space cache
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

From: Robin Hsu <robinhsu@google.com>

Added command line options -c <num_cache_entry> and -m <max_hash_collision>
to activate cache for fsck.  It may significantly speed up fsck.

Signed-off-by: Robin Hsu <robinhsu@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fsck/main.c | 27 +++++++++++++++++++++++++--
 1 file changed, 25 insertions(+), 2 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 8c62a14..8edb177 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -10,6 +10,9 @@
  *   Liu Shuoran <liushuoran@huawei.com>
  *   Jaegeuk Kim <jaegeuk@kernel.org>
  *  : add sload.f2fs
+ * Copyright (c) 2019 Google Inc.
+ *   Robin Hsu <robinhsu@google.com>
+ *  : add cache layer
  *
  * This program is free software; you can redistribute it and/or modify
  * it under the terms of the GNU General Public License version 2 as
@@ -20,6 +23,7 @@
 #include <ctype.h>
 #include <time.h>
 #include <getopt.h>
+#include <stdbool.h>
 #include "quotaio.h"
 
 struct f2fs_fsck gfsck;
@@ -54,7 +58,12 @@ void fsck_usage()
 	MSG(0, "\nUsage: fsck.f2fs [options] device\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -a check/fix potential corruption, reported by f2fs\n");
-	MSG(0, "  -C encoding[:flag1,flag2] Set options for enabling casefolding\n");
+	MSG(0, "  -c <num-cache-entry>  set number of cache entries"
+			" (default 0)\n");
+	MSG(0, "  -m <max-hash-collision>  set max cache hash collision"
+			" (default 16)\n");
+	MSG(0, "  -C encoding[:flag1,flag2] Set options for enabling"
+			" casefolding\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -f check/fix entire partition\n");
 	MSG(0, "  -g add default options\n");
@@ -66,6 +75,7 @@ void fsck_usage()
 	MSG(0, "  -y fix all the time\n");
 	MSG(0, "  -V print the version number and exit\n");
 	MSG(0, "  --dry-run do not really fix corruptions\n");
+	MSG(0, "  --debug-cache to debug cache when -c is used\n");
 	exit(1);
 }
 
@@ -187,15 +197,18 @@ void f2fs_parse_options(int argc, char *argv[])
 	}
 
 	if (!strcmp("fsck.f2fs", prog)) {
-		const char *option_string = ":aC:d:fg:O:p:q:StyV";
+		const char *option_string = ":aC:c:m:d:fg:O:p:q:StyV";
 		int opt = 0, val;
 		char *token;
 		struct option long_opt[] = {
 			{"dry-run", no_argument, 0, 1},
+			{"debug-cache", no_argument, 0, 2},
 			{0, 0, 0, 0}
 		};
 
 		c.func = FSCK;
+		c.cache_config.max_hash_collision = 16;
+		c.cache_config.dbg_en = false;
 		while ((option = getopt_long(argc, argv, option_string,
 						long_opt, &opt)) != EOF) {
 			switch (option) {
@@ -203,10 +216,20 @@ void f2fs_parse_options(int argc, char *argv[])
 				c.dry_run = 1;
 				MSG(0, "Info: Dry run\n");
 				break;
+			case 2:
+				c.cache_config.dbg_en = true;
+				break;
 			case 'a':
 				c.auto_fix = 1;
 				MSG(0, "Info: Fix the reported corruption.\n");
 				break;
+			case 'c':
+				c.cache_config.num_cache_entry = atoi(optarg);
+				break;
+			case 'm':
+				c.cache_config.max_hash_collision =
+						atoi(optarg);
+				break;
 			case 'g':
 				if (!strcmp(optarg, "android"))
 					c.defset = CONF_ANDROID;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
