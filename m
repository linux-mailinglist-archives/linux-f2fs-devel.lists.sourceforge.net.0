Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 17854E8309
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2019 09:16:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=pMrkfMJMRnRiLNpYSkOIijpyYV+YxSUC5MFfMDJkvXg=; b=e6rRHay/e7lPO37bhnNQNFa/aD
	HdD/j6b1Yb8WaZp1UY4J0JR3yR+ijpFa1b7c+kDVEEzjHUzDj5f76q75G/OTY7LUag7Q4An/A55gE
	KFdSUJk3n52rmG37kgCYX5TGnhP4dFbHF3c5qBXacxpGaOpO1/1t7/znRoODfyhyz7iA=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iPMgJ-0006y3-Nq; Tue, 29 Oct 2019 08:16:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3sO63XQgKAGEQNAHMGRTFNNFKD.BNL@flex--robinhsu.bounces.google.com>)
 id 1iPMgI-0006xD-Gl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:16:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uQ+VfXHw941Qt2IfQmDs/KJlks9L5fWtJCzf+hKT0sI=; b=iMU/TZDkWM99rDf3cdkWHoNLmI
 BHZr6DAVVzh6HMIJyu2ZxfYvPfEv/fUdWrPmtwqYRMInYZ7eVkBZmoliH5D/usWLHBPMBV38DiFWI
 W28s+UC6BJp0dzyqDke6BSSlZmdHdqTUK+oX0xGe34hT7mUszqiadPBuxMrsOQpJJrYs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=uQ+VfXHw941Qt2IfQmDs/KJlks9L5fWtJCzf+hKT0sI=; b=O
 Zv81jDCaaW2cls/gJ4pJU1jjihF2aE3FWe3kJzwlG+y7OnXwEa/Gx72OYNAbY9o3gwfi7/AlzhYAs
 DpBk4XyIqHOqFmeo2EZWYDNnKkXWUJrzyw7WmRC7N80BuTsu+ZM/21SD3ktpBWheFJCeQvY9EAKiO
 /p0kNO3HbogNQVBM=;
Received: from mail-qt1-f202.google.com ([209.85.160.202])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1iPMgH-005Y11-4R
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 29 Oct 2019 08:16:46 +0000
Received: by mail-qt1-f202.google.com with SMTP id t16so13576176qtp.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Oct 2019 01:16:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=date:message-id:mime-version:subject:from:to:cc;
 bh=uQ+VfXHw941Qt2IfQmDs/KJlks9L5fWtJCzf+hKT0sI=;
 b=G0l8sOkPbXyLHwlpxt/7VvImboSKd37p3QVbKBMlD1gHAGMSiesF8bmcktjirjGAHB
 7EL0LB2ino9xrhh37iHiK6YRNl+ApaXD++c0mLkl9U2fE7aU6QrAOFjg89+5W2O7ENaJ
 8QnGtmULflOr+n1uLqYWZK/+mUZSxnQ0xuu1KBsWWi4vBXEUcSbBhDV133rCfyz1UEaf
 fO8nhpfvzpsXuJQiPsLiGNbE363p+nk34BvafLMM2QkZbbsb4xUw8Um4cDsbuW8JvmzO
 26hRmWxR+U9oD+hHqbIHm/tuo3rq0+aGXiNBzMZ33MVwIVWa0PjBVgq2cKsUrGXJ9TrX
 wMLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:message-id:mime-version:subject:from:to:cc;
 bh=uQ+VfXHw941Qt2IfQmDs/KJlks9L5fWtJCzf+hKT0sI=;
 b=M5g4WtE5s2AW7uV0eYR4kCmV3xh2mdbDZm+pSP+E/SaGjQPkmVd1wu4His72jROlTi
 tpQ6Wub9BjqqydZuuO/vX4XlTnD7djuNUK9WWEXjg+kZCBHWIGgbbBHHqVpMSuG2x73Z
 Fml0JmHl3zx2HS/uVOgPqreaFjQ5bRAtH1uXKHEDyt0Mi6RxvG/0PpM7ySzMfgAMeOlX
 +RtfQ3bcC6SeJ8c9NFhzMyK9I2fAUOWmYIiOeu1Hre566ws7qZKP6qAvq542y4GH6rP3
 jy8WBTLSCJ+IsWw9UY5PBLVrI/yMvW7qreQPqnCKgPRw3iragKbBzerJYVoRIFBRdFdd
 K3ow==
X-Gm-Message-State: APjAAAVZKMMAUOO9/ZyJXYWta7WdR6SHZPib555d7O8ArUf3ympg2BO1
 bTW994bxTtj1HP1fmCSXASnc7iwm7jWqtw==
X-Google-Smtp-Source: APXvYqxQy7hRtHS5Lcr98ntXyTn9K7vgNSIKEqbmJMojZpOokoGl8xhDQrtuKPHmetvnD2QCrD5hw/qS2cW1wQ==
X-Received: by 2002:a63:1812:: with SMTP id y18mr10982593pgl.302.1572335280130; 
 Tue, 29 Oct 2019 00:48:00 -0700 (PDT)
Date: Tue, 29 Oct 2019 15:47:53 +0800
Message-Id: <20191029074753.173665-1-robinhsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.24.0.rc0.303.g954a862665-goog
To: jaegeuk@kernel.org, yuchao0@huawei.com, 
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.160.202 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.202 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium sender
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iPMgH-005Y11-4R
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
From: Robin Hsu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Robin Hsu <robinhsu@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Added command line options -c <num_cache_entry> and -m <max_hash_collision>
to activate cache for fsck.  It may significantly speed up fsck.

Signed-off-by: Robin Hsu <robinhsu@google.com>
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
2.24.0.rc0.303.g954a862665-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
