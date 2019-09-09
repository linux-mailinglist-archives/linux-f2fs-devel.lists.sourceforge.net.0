Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 22708AD183
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  9 Sep 2019 03:25:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1i78RE-0000Mt-F5; Mon, 09 Sep 2019 01:25:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1i78RA-0000M4-NJ
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 01:25:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kBVGNDcTKPZVznvFRf5crqHiUXKlbunngo6Cw0m5plo=; b=XX2pWm0g4HyMCR+nINRtdkI6cZ
 SJE1vpLykT1Uymx/t4nt8aqk8J6GR8RKEd784xHMCTtJnH307g3Qn6IWqJw9VNCdT6D7zNLGG9a/8
 ZG4b3R4IxiWFdA06xBTPs3uLJM3XagF0yX7PjZZk6+IoNqT5WlqfMcvDRPWdeKD6TgGM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kBVGNDcTKPZVznvFRf5crqHiUXKlbunngo6Cw0m5plo=; b=N
 Wu6GKbjEpGHUSij5oNFPLj/XiBcczJObDohJxU0axbXSf/3cdx047jhRC+KrWnHhGwRIvYLzSfpHO
 uAokP1H9KKcW0nXkHj9QTZWiL53BNssKCRjg+78pUc2EgqenXb/GpEVtMHdUYlTwlrYPaTtUfmwOY
 fi/EkjYpjAsonQ4g=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1i78R6-00Eak1-AD
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 09 Sep 2019 01:25:48 +0000
Received: from localhost (unknown [148.69.85.38])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B2F562086D;
 Mon,  9 Sep 2019 01:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1567992336;
 bh=E2cqUMgnAApDs9Dsnc3TkUoWZaykQ41wUr7ucx5cits=;
 h=From:To:Cc:Subject:Date:From;
 b=U+XjKg5BZeMQiD3PXoW/UEPCmrQK8Q0NPiqdpxHOERHwJI9vfsVDlXvDI/pCc3ckO
 PQques6ArVn5mc8J/Jf6suYB6L4roUtEABY/k+NfQlNwZUIgvav6B5FPdgAvQzN+Fl
 QTFKL6XoELbN8HFR3CSohe0uvu5YCDxnR0a443LM=
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  9 Sep 2019 02:25:31 +0100
Message-Id: <20190909012532.20454-1-jaegeuk@kernel.org>
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
X-Headers-End: 1i78R6-00Eak1-AD
Subject: [f2fs-dev] [PATCH 1/2] f2fs: do not select same victim right again
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

GC must avoid select the same victim again.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/gc.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e88f98ddf396..15ca8bbb0b22 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -274,6 +274,9 @@ static unsigned int get_cb_cost(struct f2fs_sb_info *sbi, unsigned int segno)
 static inline unsigned int get_gc_cost(struct f2fs_sb_info *sbi,
 			unsigned int segno, struct victim_sel_policy *p)
 {
+	if (sbi->cur_victim_sec == GET_SEC_FROM_SEG(sbi, segno))
+		return UINT_MAX;
+
 	if (p->alloc_mode == SSR)
 		return get_seg_entry(sbi, segno)->ckpt_valid_blocks;
 
@@ -1326,9 +1329,6 @@ int f2fs_gc(struct f2fs_sb_info *sbi, bool sync,
 		round++;
 	}
 
-	if (gc_type == FG_GC)
-		sbi->cur_victim_sec = NULL_SEGNO;
-
 	if (sync)
 		goto stop;
 
-- 
2.19.0.605.g01d371f741-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
