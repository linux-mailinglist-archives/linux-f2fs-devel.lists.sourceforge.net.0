Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3E2C3BF048
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  7 Jul 2021 21:31:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m1DGP-0005IO-9Y; Wed, 07 Jul 2021 19:31:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1m1DGD-0005HG-4B
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 19:31:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2e2vI8OFotAHRwxQhsUAwsU31NWnSuHyIiqH5UHX7nQ=; b=IY6JssGIXJ7LsQgD7pYWUdw0BY
 ExhzSMXGmd6RJ6dIWa2wO6uCOPJJz4sd4GQzD05zZBext4MWXdh0w+9prEJLnH3RASUMu8EHGtAfK
 xbAdu6tjnzA0S2puQLQ4ispFkki4crH267F17rlPArj6ac60pK6HiCy/lmnHIheRGGY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2e2vI8OFotAHRwxQhsUAwsU31NWnSuHyIiqH5UHX7nQ=; b=L
 9yFfUSRLPJE8GF6ERPvJeRHs3iLfiqQIjwnuMiATouBhmjM4W0oOKM7uFaxm4cnMGURX6ejkX4kge
 mRicw2wo4Qs7adoEPpsKKXnDSG1H4g8sEZFblt/i9NEIivweY8N4orC8iIFKX4Ua+usM/onQQ36a8
 y0OfmRVuMrr3idSw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m1DG5-00EeQv-Gy
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 07 Jul 2021 19:31:05 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 08D8661C6D;
 Wed,  7 Jul 2021 19:30:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625686252;
 bh=3pODlJmfBdRZUct1Nd+7/oWJuLC7tASVT2444KEehJA=;
 h=From:To:Cc:Subject:Date:From;
 b=jW49LuE5IDef38qMg2fJPfUyoUapV9yA8K76i0BmqMaLxTujkLYshGo++CxDhuC1s
 TlOoxvFV+rXcX2AzlaAxUdPOPQCmMDyuQNiPPp9qG9rkULA/X7jk7QTPX7tA9N7waN
 Oh6uBao8oal91hfx+oEeMxPzQgL4bzaygVH/fVCkwc3iNGAU8w15Qo+EfOqWMCTEZP
 UKitmWIhbisTePb64ayH4DAkW7MI5vKDwjkbSZP9YmpgvoxhBsnjQPOlixzkPcdI4q
 11kWrpEY72K4q3j35hCPxFwNKrp2t2TdmEZOfmMchAJul7mat+C1VCNI1FIWakaMDe
 X9TrtiXqvCzXA==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Wed,  7 Jul 2021 12:30:43 -0700
Message-Id: <20210707193043.969238-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [198.145.29.99 listed in wl.mailspike.net]
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m1DG5-00EeQv-Gy
Subject: [f2fs-dev] [PATCH] f2fs: drop dirty node pages when cp is in error
 status
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

Otherwise, writeback is going to fall in a loop to flush dirty inode forever
before getting SBI_CLOSING.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/node.c | 11 ++++-------
 1 file changed, 4 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index dd611efa8aa4..0be9e2d7120e 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1549,13 +1549,10 @@ static int __write_node_page(struct page *page, bool atomic, bool *submitted,
 	trace_f2fs_writepage(page, NODE);
 
 	if (unlikely(f2fs_cp_error(sbi))) {
-		if (is_sbi_flag_set(sbi, SBI_IS_CLOSE)) {
-			ClearPageUptodate(page);
-			dec_page_count(sbi, F2FS_DIRTY_NODES);
-			unlock_page(page);
-			return 0;
-		}
-		goto redirty_out;
+		ClearPageUptodate(page);
+		dec_page_count(sbi, F2FS_DIRTY_NODES);
+		unlock_page(page);
+		return 0;
 	}
 
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
-- 
2.32.0.93.g670b81a890-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
