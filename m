Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3678115F63E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 14 Feb 2020 19:59:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j2gB7-0006H8-W2; Fri, 14 Feb 2020 18:59:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1j2gB6-0006Gm-IQ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b2qJTgZKMKQixAvFyMxnoapoUdu8/RT0hYcDeidaS60=; b=H2AeC6Mbi+taRjJTJ7zJvp15XL
 OS96xKk4YrBlvcb49aQv1etH/MEHBDt2671/snRSsOJFOZCVpAsqyqzm14Yfrmp4Og+v0LjbpqLKk
 bV55Dxcrp6YayrIY8Jy6HoelvXfYsFwkIp6RvXAJBde2gjUCnrtHi6k3glZizGtCAcMU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=b2qJTgZKMKQixAvFyMxnoapoUdu8/RT0hYcDeidaS60=; b=AsYwiWdULwT6LBDRBqJwiFyyR/
 FsmHWRMHja+xKrVKUVoUOriL9txbkb0Aax3311q8KN3pVqUIWwYi91pWx4dwWKSBtLtah3RFtIsTA
 jvDWsQ46irn/k80fhq6UCTQ9NjT0mEvC9uMntzr68ezZaPm1IPtG8i/+EGvDsNCb/MNA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j2gB5-0042yP-Hk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 14 Feb 2020 18:59:04 +0000
Received: from localhost (unknown [104.132.1.66])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id D354022314;
 Fri, 14 Feb 2020 18:58:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1581706737;
 bh=rDuZDiF8LTia0x0F357avgt8TEOw/x+rB4MF/F1tReE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=H3/JM0B4pLm2N/iLytENA9CoC5JNNY7xiTbNXgPklcwuJ136fxZO1GjfqWLQjSyjU
 q9m6F0ra6RcWGlwc8Iq+PfxHKIgVxpDud1ViYpAwbkhyOuRqMDN5EO1eoM/bpyPXL4
 T8qjYBwcRzWP/RITcUqxsqkNUxDKIVTHrzaUht70=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 14 Feb 2020 10:58:54 -0800
Message-Id: <20200214185855.217360-2-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.25.0.265.gbab2e86ba0-goog
In-Reply-To: <20200214185855.217360-1-jaegeuk@kernel.org>
References: <20200214185855.217360-1-jaegeuk@kernel.org>
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
X-Headers-End: 1j2gB5-0042yP-Hk
Subject: [f2fs-dev] [PATCH 2/3] f2fs: add migration count iff migration
 happens
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

If first segment is empty and migration_granularity is 1, we can't move this
at all.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 65c0687ee2bb..bbf4db3f6bb4 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1233,12 +1233,12 @@ static int do_garbage_collect(struct f2fs_sb_info *sbi,
 							segno, gc_type);
 
 		stat_inc_seg_count(sbi, type, gc_type);
+		migrated++;
 
 freed:
 		if (gc_type == FG_GC &&
 				get_valid_blocks(sbi, segno, false) == 0)
 			seg_freed++;
-		migrated++;
 
 		if (__is_large_section(sbi) && segno + 1 < end_segno)
 			sbi->next_victim_seg[gc_type] = segno + 1;
-- 
2.25.0.265.gbab2e86ba0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
