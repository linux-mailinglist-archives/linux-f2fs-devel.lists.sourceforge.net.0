Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50276A76E27
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVY-0003lT-Ry;
	Mon, 31 Mar 2025 20:13:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVS-0003kU-2L
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5vorQL2g0VQl0i6lVpGKtRHdXvC4PUyoz3P5jT5s7Go=; b=HD8LfVw3s0MBbiPg9RFwWt1sBw
 VDce7CZmUUlv/i5hWIm0H7JD9Ya7XN9Iw11zvsPQWuSLKEr0LDIq6zgv62/CrcQqeOjO6BIjUkrQ1
 MrOYn9Smu6CwF6gBRMLw3MjKBRFhmtvhBz4pC2CudnuyracH4m+4OX+nUieArS8Scqyo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5vorQL2g0VQl0i6lVpGKtRHdXvC4PUyoz3P5jT5s7Go=; b=URq8pZPZaoOyFCurlmpU+wbion
 HV+hN3jjIzsVnxbZ/Tdb56Yq7qxQC7vP8OuPpuVviJqrDc8djtuvu7DEDsJu6e03Nqoo2hctY05yF
 eQJY18CcdzFUGJMVyso583vmDj1g6KzSZ40p04bHlTKL7jmMmdoWusLmg9jnmecTjm+c=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVR-0003Yj-CP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=5vorQL2g0VQl0i6lVpGKtRHdXvC4PUyoz3P5jT5s7Go=; b=ReD1LSL7dmke46l3+/C2V8dXTk
 65irrCHHrrqdWU+BSu5cFYm+Uyc8CaR/GqiT8PBK2JyNWEjaXHnNTzysaHEsq/GIr0k0OzdCHmZy2
 ArcSof6NEZjL+NroVwY3ziTUkWNYMjB7ncOXGmtbYeuuuRs0KZ5RFF6SN6XkthLj57wx78F6/nnRw
 NfXjqBYg1DWU1wF/WjODqdPzsv/MEUJaM23WHJ9pKWoJCdymqzzeqcMDsSXhk72OQMCh2OOOIv5+Y
 RMjbGz6j4pf4/6LxvKRR8xaciasKxCgUvTcluH9Zt4JHc1lf/pdSAqVUxszYHf9QP9Gn/xMd6xTbP
 kbrf6/Gg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVK-00000004ReP-41cY;
 Mon, 31 Mar 2025 20:13:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:11:01 +0100
Message-ID: <20250331201256.1057782-42-willy@infradead.org>
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
 Content preview: Get a folio instead of a page and operate on it. Saves a call
 to compound_head(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/recovery.c | 13 +++++++------ 1 file changed, 7 insertions(+),
 6 deletions(-) 
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
X-Headers-End: 1tzLVR-0003Yj-CP
Subject: [f2fs-dev] [PATCH 041/153] f2fs: Use a folio in
 check_index_in_prev_nodes()
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

Get a folio instead of a page and operate on it.  Saves a call to
compound_head().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/recovery.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index a29bd82de93b..4b2c09d63bbf 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -494,7 +494,8 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 	unsigned short blkoff = GET_BLKOFF_FROM_SEG0(sbi, blkaddr);
 	struct f2fs_summary_block *sum_node;
 	struct f2fs_summary sum;
-	struct page *sum_page, *node_page;
+	struct folio *sum_folio;
+	struct page *node_page;
 	struct dnode_of_data tdn = *dn;
 	nid_t ino, nid;
 	struct inode *inode;
@@ -516,12 +517,12 @@ static int check_index_in_prev_nodes(struct f2fs_sb_info *sbi,
 		}
 	}
 
-	sum_page = f2fs_get_sum_page(sbi, segno);
-	if (IS_ERR(sum_page))
-		return PTR_ERR(sum_page);
-	sum_node = (struct f2fs_summary_block *)page_address(sum_page);
+	sum_folio = f2fs_get_sum_folio(sbi, segno);
+	if (IS_ERR(sum_folio))
+		return PTR_ERR(sum_folio);
+	sum_node = folio_address(sum_folio);
 	sum = sum_node->entries[blkoff];
-	f2fs_put_page(sum_page, 1);
+	f2fs_folio_put(sum_folio, true);
 got_it:
 	/* Use the locked dnode page and inode */
 	nid = le32_to_cpu(sum.nid);
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
