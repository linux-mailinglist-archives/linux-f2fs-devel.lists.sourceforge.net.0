Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D74A078465
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Jul 2019 07:21:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hry5q-0003W1-Qu; Mon, 29 Jul 2019 05:21:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1hry5p-0003Vt-FD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 05:21:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LkTjUfmQDq8uMDFINyNdIgkyee+pL/ShRxiQCY5zjOY=; b=CdmzA7Z3ICejf2xXK7cGMWJOHJ
 MNmn4p4eav9ZTqIxLZUg2x7pzCvPnjFV34GMQtusnzCAjtCYEI9TShvXchX3OFzQRb/GqP4O49qr+
 MvFZtwWVobsOyIlm0NoKYLCmwgbw+DmH2U+zRoeTZH/iXrt2CDlGMAgLGdURO3X2/loc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LkTjUfmQDq8uMDFINyNdIgkyee+pL/ShRxiQCY5zjOY=; b=DoRIJria4Hxy5sZSwJFKmDu1YS
 ktMvdgijV6+JgBwZboA1VKXbC/sQScG8QU/siS9V58XZl8D79R5i9EkB4d5qdoPqyVCIuHIHaxPGk
 YX5q2T5GgMJO7r8dHHSqA5vkMzwkbKRYdbj1liUDJVZjcOHpO52G10RKI0N4XwV2hgdo=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hry5m-00Czfk-7V
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 29 Jul 2019 05:21:05 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 833A3602B7; Mon, 29 Jul 2019 05:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1564377656;
 bh=nn4l3B+Tf7YJji7ydB+5u0cuzi2/Yx4Dzyvf35VIPO8=;
 h=From:To:Cc:Subject:Date:From;
 b=h8jFmrSePKbG9gt57DG3JtGI2HdMWMa7N6SaBfPf4YAdjuiKtgZGvFKWFo64VDlmw
 uDmnAdeidhgDmcWiKJ3wabDbMVmZxJeBIfQzk0YIIQluYT2JQV6WWia4TwnhNkNfEo
 n7BJr/KEagkqnrOtWG3kABeD6OyyZk3rrovyA3/k=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 3A327602B7;
 Mon, 29 Jul 2019 05:20:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1564377655;
 bh=nn4l3B+Tf7YJji7ydB+5u0cuzi2/Yx4Dzyvf35VIPO8=;
 h=From:To:Cc:Subject:Date:From;
 b=MoVOvdoMsDTX6km6I4LYGbfkxBkA2gaHNqg7J9xiJDVjdSzrH7DaCWI6oiqFHSk/N
 ab+Nwsfa+68RPogtLX/4oHZnN7r27IU/Yf5NjYARul53+pIx3vh1OSaNxFWdwXTfNj
 d4gntsIaM7gI7GLAQG4Yuo+yKONkMAN67PoMRQOc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 3A327602B7
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Mon, 29 Jul 2019 10:50:26 +0530
Message-Id: <1564377626-12898-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
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
X-Headers-End: 1hry5m-00Czfk-7V
Subject: [f2fs-dev] [PATCH] f2fs: Fix indefinite loop in f2fs_gc()
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Policy - foreground GC, LFS mode and greedy GC mode.

Under this policy, f2fs_gc() loops forever to GC as it doesn't have
enough free segements to proceed and thus it keeps calling gc_more
for the same victim segment.  This can happen if the selected victim
segment could not be GC'd due to failed blkaddr validity check i.e.
is_alive() returns false for the blocks set in current validity map.

Fix this by not resetting the sbi->cur_victim_sec to NULL_SEGNO, when
the segment selected could not be GC'd. This helps to select another
segment for GC and thus helps to proceed forward with GC.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 8974672..7bbcc4a 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1303,7 +1303,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		round++;
 	}
 
-	if (gc_type == FG_GC)
+	if (gc_type == FG_GC && seg_freed)
 		sbi->cur_victim_sec = NULL_SEGNO;
 
 	if (sync)
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
