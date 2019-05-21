Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E2A072573F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 21 May 2019 20:06:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hT99n-0001g1-4S; Tue, 21 May 2019 18:06:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1hT99m-0001fr-G0
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 18:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XFJeaV9KtbkO8046Am5eCuj/bSxCPsTP2hJD6Hfdg78=; b=dZPVZCp8kaHww/Rp7OFVr12Jz5
 pqPfiVpJdSb2gdKQlRA6l0Pkfp326Yye2l92xq3+Goq0mckuuYIvGbgodt8LBqMEW+yGRhQWTqSPx
 jKBFtWeExVTaUWH4PegtIC5aUm+10KllGr3ncaI1F+fhgib8onDIDQ5hbk3IaoowSMQg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XFJeaV9KtbkO8046Am5eCuj/bSxCPsTP2hJD6Hfdg78=; b=brAu3EBPi1HWG9tt6gBMCWXN2O
 Cfql3rbndG9VMZXXFOAi3xhKiTiD44HxEfE95OYrldxKjI7ojv1H/0icdPG+G1zvSfstocFn6cW76
 bEocpeqtBN7csSv28YSyALtghqhFgphU7eQIb7qZz3JJVwGWe6pZsDW4I4AQKWIQSDyk=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hT99l-00Eo2N-Eb
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 21 May 2019 18:06:34 +0000
Received: from localhost (unknown [104.132.1.68])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id CA036217D9;
 Tue, 21 May 2019 18:06:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558461987;
 bh=LrTl2rHkLKG/Z0EywGv7rApN2wATqjxr8QL5bVuf8yw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hb5uSo+BF8rXr2ggilNGd0Jh7cMrqh0GnNCsrlzqJ0Ey9vlqXBEJmkJH2ysmT5uex
 3qQ2ZwwTaqavcn9GWwPU+Q2K7l2pl7XzELj6a1nUDNkSB4yD7rhFdU5GO2bgbRy+bb
 H30N2LdMhfMTz7QnywXiVCTPXiYbqlh3oL2Omet0=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 21 May 2019 11:06:25 -0700
Message-Id: <20190521180625.10562-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.19.0.605.g01d371f741-goog
In-Reply-To: <20190521180625.10562-1-jaegeuk@kernel.org>
References: <20190521180625.10562-1-jaegeuk@kernel.org>
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
X-Headers-End: 1hT99l-00Eo2N-Eb
Subject: [f2fs-dev] [PATCH 2/2] f2fs: allow ssr block allocation during
 checkpoint=disable period
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

This patch allows to use ssr during checkpoint is disabled.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 963fb4571fd9..1e029da26053 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -387,7 +387,8 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 			goto next;
 		/* Don't touch checkpointed data */
 		if (unlikely(is_sbi_flag_set(sbi, SBI_CP_DISABLED) &&
-					get_ckpt_valid_blocks(sbi, segno)))
+					get_ckpt_valid_blocks(sbi, segno) &&
+					p.alloc_mode != SSR))
 			goto next;
 		if (gc_type == BG_GC && test_bit(secno, dirty_i->victim_secmap))
 			goto next;
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
