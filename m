Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8B19A76E47
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVj-0000ls-8m;
	Mon, 31 Mar 2025 20:13:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVQ-0000jQ-F1
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5TO7/DA6ZryrI/928EoouSfdKq6C9sdfSJyCSV0+amw=; b=FARzzOyC9SNZGKsINoWClH7Dxf
 gZnwtpRQCzYaDYkn55Q8yNP9ka/g9e4JnuzVAH+tKVhbMFkrjydAhKildrtZJLZ0vBmihyCbgoqOF
 qnXrwSANcRzML5t4wff9gdRJjPU/HXCkq5bmEtXj0DLdL+S75QGjxb/LSvxaisv5Cmxc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5TO7/DA6ZryrI/928EoouSfdKq6C9sdfSJyCSV0+amw=; b=Wb1kAvlxcLGT4tS9AQ7gnwQNRq
 DV7o2Gm5V4JF8iKtRVZn9Gh77e59yTZW+xWuF0ie/sxulWFvhiDsJFaFBYqZToUSyoE82AaUXt1PB
 +h5n0/8xpCdmxuw613jhfNqruLDusFkhAXBizoOC+0KyLfRKXzi0d8Zvqkb5PjYCXdLA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVQ-0003Ye-AK for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5TO7/DA6ZryrI/928EoouSfdKq6C9sdfSJyCSV0+amw=; b=txOmTcEIGTfSckvDs31dpKe+Uu
 qLTBzkSPVWwBj90uVlf1YtixysM+9M6SFVwmhFo73nOtOfqyg5DLaES1LcNm3LPerRS8GqmOWUFo7
 UcDM9tuc4bs0hf6hs6wKy/hTfWUiQI9qvJKi9AIm1uKTkhEpqAxMviqfJEbILLMwd4jplELsiLt1C
 nrkP5tE+1FWTEgkTsIkyZL0wMJ8pcPQ3Dnu5pjAqzccN6uH+a0iGHPUzUwBBg6wcoWyrVmMYiigMO
 zOK246uyJCeZr+31mJ7VwKSRnxTLNgNjf/EKNINPvsib9WTGcv1QQbb/5MhBDciqIVhAGt5C5QSin
 FH2LOrBA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVJ-00000004Rcc-3vYb;
 Mon, 31 Mar 2025 20:13:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:55 +0100
Message-ID: <20250331201256.1057782-36-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Get a folio instead of a page. Saves a hidden call to
 compound_head().
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/segment.c
 | 8 ++++---- 1 file changed, 4 insertions(+), 4 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVQ-0003Ye-AK
Subject: [f2fs-dev] [PATCH 035/153] f2fs: Use a folio in
 read_normal_summaries()
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
Cc: "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Get a folio instead of a page.  Saves a hidden call to compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 61888496eaa9..66d5dc15b281 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4277,7 +4277,7 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 	struct f2fs_checkpoint *ckpt = F2FS_CKPT(sbi);
 	struct f2fs_summary_block *sum;
 	struct curseg_info *curseg;
-	struct page *new;
+	struct folio *new;
 	unsigned short blk_off;
 	unsigned int segno = 0;
 	block_t blk_addr = 0;
@@ -4304,10 +4304,10 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 			blk_addr = GET_SUM_BLOCK(sbi, segno);
 	}
 
-	new = f2fs_get_meta_page(sbi, blk_addr);
+	new = f2fs_get_meta_folio(sbi, blk_addr);
 	if (IS_ERR(new))
 		return PTR_ERR(new);
-	sum = (struct f2fs_summary_block *)page_address(new);
+	sum = folio_address(new);
 
 	if (IS_NODESEG(type)) {
 		if (__exist_node_summaries(sbi)) {
@@ -4342,7 +4342,7 @@ static int read_normal_summaries(struct f2fs_sb_info *sbi, int type)
 	curseg->next_blkoff = blk_off;
 	mutex_unlock(&curseg->curseg_mutex);
 out:
-	f2fs_put_page(new, 1);
+	f2fs_folio_put(new, true);
 	return err;
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
