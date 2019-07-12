Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AF0967629
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2019 23:20:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hm2yJ-0007yN-Lk; Fri, 12 Jul 2019 21:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hm2yI-0007yB-Ma
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 21:20:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=QBvpQJl5fMW3ZjnXYjX3LuUBYFZycnl25TC/Fz2d20U=; b=LFoWTmANdhjS0kZiEeEIDqXTKz
 TykV8pk34elavvhVYaUvQJlo1Lcv6KyTg+j21Fy8s2OKUcG5Q7PFaBcQFTvFnBJtv1HpsEHZDaLFE
 F9zWMPPF5NrWahPsOKq8y+1d3J1ub7WaWiWLHokh7zM8WaPThTLZ3XniPPGK8m6Z3UYA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=QBvpQJl5fMW3ZjnXYjX3LuUBYFZycnl25TC/Fz2d20U=; b=B
 9RqXIrp81BqkGQ7cpgQafZ28+wRz1PrH7J2JSgMaLf4T1DncmjlP5tEYdR+FTwOTrR/izXAvS8q/e
 Uh7BBR45PPYyMzEzj/p6mvA7HPXns2zQMpuyyGUlkq7FLl6WWrXVfOcc1VuG5P6T0dhI09rWLvs4B
 RaS/MUvZwMVZgIkU=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hm2yE-00Gvew-Tv
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 12 Jul 2019 21:20:50 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9F39F217D4;
 Fri, 12 Jul 2019 21:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1562966439;
 bh=zc4cmsEGzmSzV/HsBnEet/fYgLVuQKs9G+1R5qnY2NY=;
 h=From:To:Cc:Subject:Date:From;
 b=Bw6DK3SpextzkH1JpuxSFDzlIpI3bT8nf42/KRDPastqJvDAAm5RyYotPqUnV06UX
 Shww6/b/6nuDHOjEaeaTvrpA4jXEaLnwPAlDxQqFsARWb1m4zFQbvB+sVoen4kbqgb
 K/Cvnfn98rGAmRmOnwFuHpTuXt8N66G4ij0YLdfQ=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 12 Jul 2019 14:20:37 -0700
Message-Id: <20190712212037.41820-1-jaegeuk@kernel.org>
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
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hm2yE-00Gvew-Tv
Subject: [f2fs-dev] [PATCH] f2fs_io: fix wrong buffered/dio option
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

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 tools/f2fs_io/f2fs_io.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 91f8cf2..7fd4425 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -194,9 +194,9 @@ static void do_write(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 
-	if (!strcmp(argv[5], "buffered")) {
+	if (!strcmp(argv[5], "dio")) {
 		flags |= O_DIRECT;
-	} else if (strcmp(argv[5], "dio")) {
+	} else if (strcmp(argv[5], "buffered")) {
 		fputs("Wrong IO type\n\n", stderr);
 		exit(1);
 	}
@@ -263,9 +263,9 @@ static void do_read(int argc, char **argv, const struct cmd_desc *cmd)
 		exit(1);
 	}
 	count = atoi(argv[3]);
-	if (!strcmp(argv[4], "buffered")) {
+	if (!strcmp(argv[4], "dio")) {
 		flags |= O_DIRECT;
-	} else if (strcmp(argv[4], "dio")) {
+	} else if (strcmp(argv[4], "buffered")) {
 		fputs("Wrong IO type\n\n", stderr);
 		exit(1);
 	}
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
