Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8CBBAA39322
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWx-0006Zs-B0;
	Tue, 18 Feb 2025 05:52:27 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWl-0006Z4-2n
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=H7K6EgfIuRiAX6QHX/BrtdqUN7aF97jkMBhws3XTybU=; b=Z5iVDEZKV5HcOszdyRbYnZctRc
 eR4obtAITGkrIihMXGByg9C+/I+Qi5rnbVcjTvjRsf6PlpHHbrfsuFDysPfgjOEHvsmb0lHv1bbGI
 +FT3XdOxUIoMLl5qQQKG4p1ot40QUAA69gBxdM5yMe5cgrvopbic2nlb72u5LEI1rZgk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=H7K6EgfIuRiAX6QHX/BrtdqUN7aF97jkMBhws3XTybU=; b=YshqLFVWJEGquriCkcRs4H/qBD
 Zi0c5o0vmKlaW3m4JovRPIxZP26WNqp6824sxtiJMmbMKzvVfQ3cj0IWyF79COyS+AZib5oPXv6EV
 sqgvv3e3KdUVkxETndyvrDPmPLsjpdTxZGnQldGYTTT2fAv53PhY+Hctcra017ef9OkU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWj-0007bV-DE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=H7K6EgfIuRiAX6QHX/BrtdqUN7aF97jkMBhws3XTybU=; b=H8av33G5aXoCXRyGOWcXbPS/Cq
 IkFprusrFl1Wry6Fv3WjSyxf0hDovUt15KTNu14XZAen0BxBztBQz+1Mz6hisgjhdPd02vP3PtQHU
 A6I0rU+LteCkg/0pOkyG8etBmR9V714sJnKEGB3+EjmH3y00c2cFt50stDwU+/kh9EGxUp89sRawu
 0ueoQkj5zXe2O70vJiBmP1t1RAzGyoWNwaYUl1Lt1wSK27rFf2yTKcbx5AZLvKw1055k8r8BRwxJ1
 qp9l7cn0D0G8gQ05wd8JmyMnEfdoEEcWL2T/dJZS+6jLtWvBkCXzCx0PnZh0cHy0kz7lfUlT2xOTz
 6Mqa28Rg==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWc-00000002TsC-3jwt; Tue, 18 Feb 2025 05:52:06 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:46 +0000
Message-ID: <20250218055203.591403-13-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Retrieve a folio from the page cache and use it throughout.
 Saves six hidden calls to compound_head() and removes a reference to
 page->mapping.
 Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/node.c
 | 36 ++++++++++++++++++ 1 file changed, 18 insertions(+), 18 deletions(-)
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWj-0007bV-DE
Subject: [f2fs-dev] [PATCH 12/27] f2fs: Use a folio in __get_node_page()
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
Cc: linux-fsdevel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Retrieve a folio from the page cache and use it throughout.  Saves six
hidden calls to compound_head() and removes a reference to page->mapping.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/node.c | 36 ++++++++++++++++++------------------
 1 file changed, 18 insertions(+), 18 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 1bd151d71b6b..db97624e30b3 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1452,7 +1452,7 @@ void f2fs_ra_node_page(struct f2fs_sb_info *sbi, nid_t nid)
 static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 					struct page *parent, int start)
 {
-	struct page *page;
+	struct folio *folio;
 	int err;
 
 	if (!nid)
@@ -1460,11 +1460,11 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 	if (f2fs_check_nid_range(sbi, nid))
 		return ERR_PTR(-EINVAL);
 repeat:
-	page = f2fs_grab_cache_page(NODE_MAPPING(sbi), nid, false);
-	if (!page)
-		return ERR_PTR(-ENOMEM);
+	folio = f2fs_grab_cache_folio(NODE_MAPPING(sbi), nid, false);
+	if (IS_ERR(folio))
+		return ERR_CAST(folio);
 
-	err = read_node_page(page, 0);
+	err = read_node_page(&folio->page, 0);
 	if (err < 0) {
 		goto out_put_err;
 	} else if (err == LOCKED_PAGE) {
@@ -1475,40 +1475,40 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 	if (parent)
 		f2fs_ra_node_pages(parent, start + 1, MAX_RA_NODE);
 
-	lock_page(page);
+	folio_lock(folio);
 
-	if (unlikely(page->mapping != NODE_MAPPING(sbi))) {
-		f2fs_put_page(page, 1);
+	if (unlikely(folio->mapping != NODE_MAPPING(sbi))) {
+		f2fs_folio_put(folio, true);
 		goto repeat;
 	}
 
-	if (unlikely(!PageUptodate(page))) {
+	if (unlikely(!folio_test_uptodate(folio))) {
 		err = -EIO;
 		goto out_err;
 	}
 
-	if (!f2fs_inode_chksum_verify(sbi, page)) {
+	if (!f2fs_inode_chksum_verify(sbi, &folio->page)) {
 		err = -EFSBADCRC;
 		goto out_err;
 	}
 page_hit:
-	if (likely(nid == nid_of_node(page)))
-		return page;
+	if (likely(nid == nid_of_node(&folio->page)))
+		return &folio->page;
 
 	f2fs_warn(sbi, "inconsistent node block, nid:%lu, node_footer[nid:%u,ino:%u,ofs:%u,cpver:%llu,blkaddr:%u]",
-			  nid, nid_of_node(page), ino_of_node(page),
-			  ofs_of_node(page), cpver_of_node(page),
-			  next_blkaddr_of_node(page));
+			  nid, nid_of_node(&folio->page), ino_of_node(&folio->page),
+			  ofs_of_node(&folio->page), cpver_of_node(&folio->page),
+			  next_blkaddr_of_node(&folio->page));
 	set_sbi_flag(sbi, SBI_NEED_FSCK);
 	f2fs_handle_error(sbi, ERROR_INCONSISTENT_FOOTER);
 	err = -EFSCORRUPTED;
 out_err:
-	ClearPageUptodate(page);
+	folio_clear_uptodate(folio);
 out_put_err:
 	/* ENOENT comes from read_node_page which is not an error. */
 	if (err != -ENOENT)
-		f2fs_handle_page_eio(sbi, page_folio(page), NODE);
-	f2fs_put_page(page, 1);
+		f2fs_handle_page_eio(sbi, folio, NODE);
+	f2fs_folio_put(folio, true);
 	return ERR_PTR(err);
 }
 
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
