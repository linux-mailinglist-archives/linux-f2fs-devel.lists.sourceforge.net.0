Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C2CA76EAA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:14:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLWM-00018p-Ff;
	Mon, 31 Mar 2025 20:14:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVg-0000lS-50
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+fiOyWn9MTAv8znHI/tVKH1bECbcLscps/p1DGjHmEQ=; b=k8gdzf5D+zjosuiQHd4/4LkX0p
 ZXygVjWX46yc2j/JIboRpR4HB1itCvP/mmfLiRSPeJmbBxQ7+YGZEhGmtzUZ3SligUtQWfJXIDzWv
 uqgaWsUVVC74mhqYcXJetVoF3uX2wmWSRrFjKnYfTPZVuykMFiSpDzNfub03TwlDBxt8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=+fiOyWn9MTAv8znHI/tVKH1bECbcLscps/p1DGjHmEQ=; b=NWL/EG8FEweIoiJb2QPpFpuI/i
 Q8yW3ZoEjaW6anDLx2mCZeJHbPnw2rUCbQE5603s/NBV2zvFrm5Bywsl1Ay3rO+nlLdU4Y4lQ2uR2
 QlxUpzUnbkvOB/qrM75UMwZ3bdzrNVtXWzpGPLNPGjJWBoex7y10pKmTAS+5DrfGCqtM=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVW-0003Zy-1G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=+fiOyWn9MTAv8znHI/tVKH1bECbcLscps/p1DGjHmEQ=; b=rXb+DO3XvU48vRmhpIdOJ3ZqDR
 X/KDCxFJscVWLopJE9xsHrNv5DSH7EsJ77MX+ttGlBt4Cs8tFapTNO9In9DMa3gnDNTb7x8UHvo3a
 BF7mYXlFslbLGwOILDeVzpVVIQGm03psTJNcHAVBgWtstI1LTWKQheBzzKYvjOZfvDXSvpJFrpBE6
 QQ1nLopwtDU5xvB/K6Zsdf7xyzHBMGddaGd1rdeIqh7nQaOouVOekDG8Zvxa5ZahOiIVYgmEBOOfA
 zAq/yrAV+fzhjo0pARph+yW/OpwHReCHMDouciseLz5h9gKrI+tyv6LERWaCjl18mDFzfY0XN6yf1
 gWhkB7tA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVK-00000004Rdp-2iOK;
 Mon, 31 Mar 2025 20:13:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:59 +0100
Message-ID: <20250331201256.1057782-40-willy@infradead.org>
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
 Content preview: Convert f2fs_get_sum_page() to f2fs_get_sum_folio() and add
 a f2fs_get_sum_page() wrapper. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/f2fs.h | 8 +++++++- fs/f2fs/segment.c | 6 +++--- 2 files changed, 
 10 insertions(+), 4 deletions(-) 
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
X-Headers-End: 1tzLVW-0003Zy-1G
Subject: [f2fs-dev] [PATCH 039/153] f2fs: Add f2fs_get_sum_folio()
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

Convert f2fs_get_sum_page() to f2fs_get_sum_folio() and add a
f2fs_get_sum_page() wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/f2fs.h    | 8 +++++++-
 fs/f2fs/segment.c | 6 +++---
 2 files changed, 10 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 55fed88b79e1..55a161d39e4a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3807,7 +3807,7 @@ int f2fs_allocate_new_segments(struct f2fs_sb_info *sbi);
 int f2fs_trim_fs(struct f2fs_sb_info *sbi, struct fstrim_range *range);
 bool f2fs_exist_trim_candidates(struct f2fs_sb_info *sbi,
 					struct cp_control *cpc);
-struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno);
+struct folio *f2fs_get_sum_folio(struct f2fs_sb_info *sbi, unsigned int segno);
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi, void *src,
 					block_t blk_addr);
 void f2fs_do_write_meta_page(struct f2fs_sb_info *sbi, struct folio *folio,
@@ -3863,6 +3863,12 @@ static inline struct inode *fio_inode(struct f2fs_io_info *fio)
 	return page_folio(fio->page)->mapping->host;
 }
 
+static inline
+struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno)
+{
+	return &f2fs_get_sum_folio(sbi, segno)->page;
+}
+
 #define DEF_FRAGMENT_SIZE	4
 #define MIN_FRAGMENT_SIZE	1
 #define MAX_FRAGMENT_SIZE	512
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 2f88f9294ba9..a3d4903cfb0b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2675,13 +2675,13 @@ int f2fs_npages_for_summary_flush(struct f2fs_sb_info *sbi, bool for_ra)
 }
 
 /*
- * Caller should put this summary page
+ * Caller should put this summary folio
  */
-struct page *f2fs_get_sum_page(struct f2fs_sb_info *sbi, unsigned int segno)
+struct folio *f2fs_get_sum_folio(struct f2fs_sb_info *sbi, unsigned int segno)
 {
 	if (unlikely(f2fs_cp_error(sbi)))
 		return ERR_PTR(-EIO);
-	return &f2fs_get_meta_folio_retry(sbi, GET_SUM_BLOCK(sbi, segno))->page;
+	return f2fs_get_meta_folio_retry(sbi, GET_SUM_BLOCK(sbi, segno));
 }
 
 void f2fs_update_meta_page(struct f2fs_sb_info *sbi,
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
