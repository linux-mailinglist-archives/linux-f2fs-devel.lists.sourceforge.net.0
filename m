Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 292956D6F15
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Apr 2023 23:39:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjoNZ-0005YV-DK;
	Tue, 04 Apr 2023 21:39:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pjoNX-0005YP-LG
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 21:39:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NvfEAsHzbjeeTV/OrFvmf7oy0NXcKkV9TsgZjTS4RuQ=; b=R2d48t+2LREvL1Cltz/CKcoavI
 ewPp0fUzgtxxGj7ovjVLJ8kGc1ZlJ748kewIPER0G7X5gz8z+2D7IpHtXnPyUkHDU/hEmB/kJGOuF
 w3Or0FAArgNwkqmskX7oEL2xrptC7n7E4gHZuVDJYqCDWZzrUv/RXR4ANy/ucpTsNn3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NvfEAsHzbjeeTV/OrFvmf7oy0NXcKkV9TsgZjTS4RuQ=; b=mikyOfrCfPWrIB+ZuADneA4yRr
 6rpJDpQGzy11A6Xfmh2DPraDakqA2rGPaC2tm/eJcxIi1T+y5GhlP65xpE4vmalMAIiNTchobKcVd
 RseezgL0xPZpgfoLsC0XF76Ss0JZRYh0E3Er1yIzncr7vZdK47OgpkQ5U/4YXTXSOwmE=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjoNW-00FN3e-5h for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Apr 2023 21:39:46 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id C506463A2B
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue,  4 Apr 2023 21:39:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E81CC433D2;
 Tue,  4 Apr 2023 21:39:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1680644380;
 bh=NHSIcpjoPf9wpAnrKABRpzgjh7hQvftgW9HZxw+Kxug=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=lzZHtbkpXSbyzyseVkhx0Ml4Tgti15LHBfISnTnRceP8Cu1omxpVMVfwTyGHFiYhc
 sNZ5HJmV+fPMzamV3cMDeNltsdCi8BBeQnRmZ/lGrVgwb9XrF3NuoAZDz+09obhfHY
 PKnWIPh32AYHxiobShzGPcCCXvJDj6G3c3kXXNLadY8AdjUvydUCjFcH8N6d5thjDi
 Jn/evoP6Mc2d/2Z0vLiY1MqqcbTM1y3uAKl3CPA3OmHI1RxQlnYMJJbgCvYaL2cKhy
 t67vRwQ4Y52Mi6nOgAI6Ptn6oMlOI75yHQtPTl8yt6GL4L8Q3ZRWaTk6BwpGdHPcl1
 xmrb7nxqtwBCQ==
Date: Tue, 4 Apr 2023 14:39:38 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZCyZGgf4RSEjyHTF@google.com>
References: <20230324071028.336982-1-chao@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20230324071028.336982-1-chao@kernel.org>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Can we do like this? From
 9a58f0e59364241aa31b555cfe793d278e39b0dc
 Mon Sep 17 00:00:00 2001 From: Jaegeuk Kim <jaegeuk@kernel.org> Date: Tue,
 4 Apr 2023 14:36:00 -0700 Subject: [PATCH] f2fs: do checkpoint when there's
 not [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pjoNW-00FN3e-5h
Subject: Re: [f2fs-dev] [PATCH] f2fs: fix to trigger a checkpoint in the end
 of foreground garbage collection
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

Can we do like this?

From 9a58f0e59364241aa31b555cfe793d278e39b0dc Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Tue, 4 Apr 2023 14:36:00 -0700
Subject: [PATCH] f2fs: do checkpoint when there's not enough free sections

We didn't do checkpoint in FG_GC case, which may cause losing to reclaim prefree
sctions in time.

Fixes: 6f8d4455060d ("f2fs: avoid fi->i_gc_rwsem[WRITE] lock in f2fs_gc")
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 24 +++++++++++-------------
 1 file changed, 11 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 56c53dbe05c9..f1d0dd9c5a6c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1806,6 +1806,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	};
 	unsigned int skipped_round = 0, round = 0;
 	unsigned int upper_secs;
+	bool stop_gc = false;
 
 	trace_f2fs_gc_begin(sbi->sb, gc_type, gc_control->no_bg_gc,
 				gc_control->nr_free_secs,
@@ -1876,19 +1877,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
 		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
 			goto go_gc_more;
-		goto stop;
-	}
-
-	/* FG_GC stops GC by skip_count */
-	if (gc_type == FG_GC) {
+		stop_gc = true;
+	} else if (gc_type == FG_GC) {
+		/* FG_GC stops GC by skip_count */
 		if (sbi->skipped_gc_rwsem)
 			skipped_round++;
 		round++;
 		if (skipped_round > MAX_SKIP_GC_COUNT &&
-				skipped_round * 2 >= round) {
-			ret = f2fs_write_checkpoint(sbi, &cpc);
-			goto stop;
-		}
+				skipped_round * 2 >= round)
+			stop_gc = true;
 	}
 
 	__get_secs_required(sbi, NULL, &upper_secs, NULL);
@@ -1901,12 +1898,13 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 				prefree_segments(sbi)) {
 		ret = f2fs_write_checkpoint(sbi, &cpc);
 		if (ret)
-			goto stop;
+			stop_gc = true;
 	}
 go_gc_more:
-	segno = NULL_SEGNO;
-	goto gc_more;
-
+	if (!stop_gc) {
+		segno = NULL_SEGNO;
+		goto gc_more;
+	}
 stop:
 	SIT_I(sbi)->last_victim[ALLOC_NEXT] = 0;
 	SIT_I(sbi)->last_victim[FLUSH_DEVICE] = gc_control->victim_segno;
-- 
2.40.0.348.gf938b09366-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
