Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 623886E1523
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 13 Apr 2023 21:25:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pn2Zu-0003na-Bv;
	Thu, 13 Apr 2023 19:25:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1pn2Zt-0003nU-Kq
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 19:25:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IJJ4N7oeaIlN9D0Ak01I+nwIvLqVVeIRq3Uj4rSBJTs=; b=DF0p6mYdF23SiM+k6852YjYj2S
 fl5XBOcauLi6aZk6t6nXtvfVc1dAY+kzu7j+72lEKHQCSKA4c9jZNC89zyvgQwlDtb9DYTOm7+My1
 L9boP0cVvsCOHRssfw2QIpimD21LKoFXPOxp3PHm3Y4cQ3y/2YW98F7f9F7d9FDuERKo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IJJ4N7oeaIlN9D0Ak01I+nwIvLqVVeIRq3Uj4rSBJTs=; b=Qpy0XbYTsLJfdvw6xAwz1MRFVM
 YHQJO0H4CpypzM9oJMx56yclwYZRVEHQF18Pkv+VrWNgzDZYSZBJlPZ59fW3Ahm4BosF5IYY99aWo
 5NMfCj3V11QdMGvJUUZY/5cJfDRUrN+1CWQVewy1D9HBe95QKnSG0iArwSEG+WrDZ+eI=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pn2Zo-0005Bv-TU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 13 Apr 2023 19:25:52 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 60E4B6411E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 13 Apr 2023 19:25:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 86386C433EF;
 Thu, 13 Apr 2023 19:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681413942;
 bh=v2u5oYGNyJxsqoJq7fHElU/OCH8U1BXBn6+cfSORKYA=;
 h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
 b=UefcNkeBeZA2V7UO619RutpO7ZpB+ffNqzOa2ZR7QMMx560EHAdLqZjNKAc7gUqrJ
 8elF0zE6VUf7u7ti776W2wVRqsaj1ozhryqTuQxLaq3La2u1SO0yZPdYh5XUfQ3cBc
 cVPqnj4AgVZW+mj7rghuP2hWt0B2bOaWOWletfRCpit2cVb7XuCeLvhr1CyXBhrs9M
 QAHBaZmUcBI6OAWvxkTlXuyiGdCisetRvCkPaFAN3F64bVMWgJ6bUo3Tvc/gizm6Ww
 umzNAbfG202q1sJ+S0VdDW99ks0L4dnzp4fsSGj1rGKwroPgmmofkfGQvFTxJvwqWU
 lqzsmcOa+16sg==
Date: Thu, 13 Apr 2023 12:25:40 -0700
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: Chao Yu <chao@kernel.org>
Message-ID: <ZDhXNMkgnmjccIhF@google.com>
References: <20230324071028.336982-1-chao@kernel.org>
 <ZCyZGgf4RSEjyHTF@google.com>
 <a4e49177-3959-eb2b-996c-5d07b7390495@kernel.org>
 <ZC2aA+i5+HpdJ6M2@google.com>
 <f4ae2b3a-0aff-8941-4081-9dc53334c590@kernel.org>
 <ZDSaCsLSYLyzUxBQ@google.com>
 <6c9abd05-297a-ea4f-fd5c-9f4d9fb488ab@kernel.org>
 <ZDgmGoWx2bHNO1zP@google.com> <ZDgmvf6O488GG7tH@google.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ZDgmvf6O488GG7tH@google.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Fixed a xfstests failure. From
 400c722c2117660b83190c88e5442d63fbbffe6e
 Mon Sep 17 00:00:00 2001 From: Jaegeuk Kim <jaegeuk@kernel.org> Date: Mon,
 10 Apr 2023 14:48:50 -0700 Subject: [PATCH] f2fs: refactor f2fs_gc to call
 chec [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1pn2Zo-0005Bv-TU
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

Fixed a xfstests failure.

From 400c722c2117660b83190c88e5442d63fbbffe6e Mon Sep 17 00:00:00 2001
From: Jaegeuk Kim <jaegeuk@kernel.org>
Date: Mon, 10 Apr 2023 14:48:50 -0700
Subject: [PATCH] f2fs: refactor f2fs_gc to call checkpoint in urgent condition

The major change is to call checkpoint, if there's not enough space while having
some prefree segments in FG_GC case.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 27 +++++++++++++--------------
 1 file changed, 13 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index c748cdfb0501..ba5775dcade6 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1829,7 +1829,10 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 		goto stop;
 	}
 
-	if (gc_type == BG_GC && has_not_enough_free_secs(sbi, 0, 0)) {
+	/* Let's run FG_GC, if we don't have enough space. */
+	if (has_not_enough_free_secs(sbi, 0, 0)) {
+		gc_type = FG_GC;
+
 		/*
 		 * For example, if there are many prefree_segments below given
 		 * threshold, we can make them free by checkpoint. Then, we
@@ -1840,8 +1843,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			if (ret)
 				goto stop;
 		}
-		if (has_not_enough_free_secs(sbi, 0, 0))
-			gc_type = FG_GC;
 	}
 
 	/* f2fs_balance_fs doesn't need to do BG_GC in critical path. */
@@ -1868,19 +1869,15 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	if (seg_freed == f2fs_usable_segs_in_sec(sbi, segno))
 		sec_freed++;
 
-	if (gc_type == FG_GC)
+	if (gc_type == FG_GC) {
 		sbi->cur_victim_sec = NULL_SEGNO;
 
-	if (gc_control->init_gc_type == FG_GC ||
-	    !has_not_enough_free_secs(sbi,
-				(gc_type == FG_GC) ? sec_freed : 0, 0)) {
-		if (gc_type == FG_GC && sec_freed < gc_control->nr_free_secs)
-			goto go_gc_more;
-		goto stop;
-	}
-
-	/* FG_GC stops GC by skip_count */
-	if (gc_type == FG_GC) {
+		if (!has_not_enough_free_secs(sbi, sec_freed, 0)) {
+			if (!gc_control->no_bg_gc &&
+			    sec_freed < gc_control->nr_free_secs)
+				goto go_gc_more;
+			goto stop;
+		}
 		if (sbi->skipped_gc_rwsem)
 			skipped_round++;
 		round++;
@@ -1889,6 +1886,8 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 			ret = f2fs_write_checkpoint(sbi, &cpc);
 			goto stop;
 		}
+	} else if (!has_not_enough_free_secs(sbi, 0, 0)) {
+		goto stop;
 	}
 
 	__get_secs_required(sbi, NULL, &upper_secs, NULL);
-- 
2.40.0.634.g4ca3ef3211-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
