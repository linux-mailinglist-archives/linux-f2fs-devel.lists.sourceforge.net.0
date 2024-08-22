Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D30F595AA37
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Aug 2024 03:29:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sgweC-0002vK-3m;
	Thu, 22 Aug 2024 01:29:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <lizetao1@huawei.com>) id 1sgweA-0002v8-Bw
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1AcXvX91u9nuVp+ZWFW4c2c9NJg7RiMV+HHd3BwD344=; b=Vtm0h8oe8vRIKDQleBJZ5KKf5O
 hMnqINmubKAwGpafI6ViEwdsnl4l+DH1EVexDRul3Ndh34I9CjMs7DHM/x9svMCiCB3uo3BlGHWrC
 QTKaQXWMkl5R4ULzn6ZzEewXji3vhu0kp1bhzHKKviI2vdz11KMeN6h9qbbPuzGXlgXI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1AcXvX91u9nuVp+ZWFW4c2c9NJg7RiMV+HHd3BwD344=; b=er7g6ZDaOsSgem/AyR29vQKfDn
 HmTmV+iAMs+OG+u3Olwoq9WiuIpL5HeAJEw7UZOW8tifC9L92+V50+WlwCgqd76GO9jzOeP6aodPL
 QC9voycKZt5gJis5Og+7O/Z1AUieXm/TwdOg8QCLBZKLmOy5Ui33LT3VxbeEsbNg9KdA=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sgwe9-0006c3-2h for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Aug 2024 01:29:54 +0000
Received: from mail.maildlp.com (unknown [172.19.163.252])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4Wq5Fn2Kl5zpVYq;
 Thu, 22 Aug 2024 09:29:01 +0800 (CST)
Received: from kwepemd500012.china.huawei.com (unknown [7.221.188.25])
 by mail.maildlp.com (Postfix) with ESMTPS id 5BF4C1800D3;
 Thu, 22 Aug 2024 09:29:41 +0800 (CST)
Received: from huawei.com (10.90.53.73) by kwepemd500012.china.huawei.com
 (7.221.188.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.34; Thu, 22 Aug
 2024 09:29:40 +0800
To: <clm@fb.com>, <josef@toxicpanda.com>, <dsterba@suse.com>, <terrelln@fb.com>
Date: Thu, 22 Aug 2024 09:37:06 +0800
Message-ID: <20240822013714.3278193-7-lizetao1@huawei.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20240822013714.3278193-1-lizetao1@huawei.com>
References: <20240822013714.3278193-1-lizetao1@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.73]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd500012.china.huawei.com (7.221.188.25)
X-Spam-Score: -5.0 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The old page API is being gradually replaced and converted
 to use folio to improve code readability and avoid repeated conversion between
 page and folio. Moreover, use folio_pos() instend of page_offs [...] 
 Content analysis details:   (-5.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.187 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.187 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [45.249.212.187 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [45.249.212.187 listed in bl.score.senderscore.com]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1sgwe9-0006c3-2h
Subject: [f2fs-dev] [PATCH 06/14] btrfs: convert submit_eb_subpage() to take
 a folio
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
From: Li Zetao via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Li Zetao <lizetao1@huawei.com>
Cc: linux-btrfs@vger.kernel.org, willy@infradead.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The old page API is being gradually replaced and converted to use folio
to improve code readability and avoid repeated conversion between page
and folio. Moreover, use folio_pos() instend of page_offset(),
which is more consistent with folio usage.

Signed-off-by: Li Zetao <lizetao1@huawei.com>
---
 fs/btrfs/extent_io.c | 19 +++++++++----------
 1 file changed, 9 insertions(+), 10 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index a0102b9b67ff..ca458237ac35 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -1818,12 +1818,11 @@ static noinline_for_stack void write_one_eb(struct extent_buffer *eb,
  * Return >=0 for the number of submitted extent buffers.
  * Return <0 for fatal error.
  */
-static int submit_eb_subpage(struct page *page, struct writeback_control *wbc)
+static int submit_eb_subpage(struct folio *folio, struct writeback_control *wbc)
 {
-	struct btrfs_fs_info *fs_info = page_to_fs_info(page);
-	struct folio *folio = page_folio(page);
+	struct btrfs_fs_info *fs_info = folio_to_fs_info(folio);
 	int submitted = 0;
-	u64 page_start = page_offset(page);
+	u64 folio_start = folio_pos(folio);
 	int bit_start = 0;
 	int sectors_per_node = fs_info->nodesize >> fs_info->sectorsize_bits;
 
@@ -1838,21 +1837,21 @@ static int submit_eb_subpage(struct page *page, struct writeback_control *wbc)
 		 * Take private lock to ensure the subpage won't be detached
 		 * in the meantime.
 		 */
-		spin_lock(&page->mapping->i_private_lock);
+		spin_lock(&folio->mapping->i_private_lock);
 		if (!folio_test_private(folio)) {
-			spin_unlock(&page->mapping->i_private_lock);
+			spin_unlock(&folio->mapping->i_private_lock);
 			break;
 		}
 		spin_lock_irqsave(&subpage->lock, flags);
 		if (!test_bit(bit_start + fs_info->subpage_info->dirty_offset,
 			      subpage->bitmaps)) {
 			spin_unlock_irqrestore(&subpage->lock, flags);
-			spin_unlock(&page->mapping->i_private_lock);
+			spin_unlock(&folio->mapping->i_private_lock);
 			bit_start++;
 			continue;
 		}
 
-		start = page_start + bit_start * fs_info->sectorsize;
+		start = folio_start + bit_start * fs_info->sectorsize;
 		bit_start += sectors_per_node;
 
 		/*
@@ -1861,7 +1860,7 @@ static int submit_eb_subpage(struct page *page, struct writeback_control *wbc)
 		 */
 		eb = find_extent_buffer_nolock(fs_info, start);
 		spin_unlock_irqrestore(&subpage->lock, flags);
-		spin_unlock(&page->mapping->i_private_lock);
+		spin_unlock(&folio->mapping->i_private_lock);
 
 		/*
 		 * The eb has already reached 0 refs thus find_extent_buffer()
@@ -1912,7 +1911,7 @@ static int submit_eb_page(struct page *page, struct btrfs_eb_write_context *ctx)
 		return 0;
 
 	if (page_to_fs_info(page)->nodesize < PAGE_SIZE)
-		return submit_eb_subpage(page, wbc);
+		return submit_eb_subpage(folio, wbc);
 
 	spin_lock(&mapping->i_private_lock);
 	if (!folio_test_private(folio)) {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
