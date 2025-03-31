Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15812A76E63
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Mar 2025 22:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tzLVt-0005mF-DW;
	Mon, 31 Mar 2025 20:13:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tzLVf-0005bg-FZ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lR2CV0SBvKgFsb2FMVjRUSNWsWL/8TdvIC7wV5ATj1k=; b=Iy1iyRKUOyJ32xPQ23T96s70rr
 CEiWRzwAMdTi6XnqEKvRQUK9uM9y6uPRBStkGdRRvIDaPSBISSVFyrZjyrh+iVQmgi1KvvBkXMu3q
 IqAin3KZ9Bcm16HRBtODeAnRKM/fwDm620QtqtT++qdiHQW1yXpj1EmfUczPLd6KfZdk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=lR2CV0SBvKgFsb2FMVjRUSNWsWL/8TdvIC7wV5ATj1k=; b=AHwVcsXKlDle2k7zMfIX8ZEuyN
 POte98xmrDfybNjgU68rm2fhz9xbIRPOSxcnUl4U65/OKHTLwHPBH7+u8eGw2Nh9D9BxLM+k/2yEI
 Ql9mGDqyTrrrIh3anrDGfblT9wOW5m4BmbodTdZmvsIzDOLcc0EuVLR03ktKe3cgyzwQ=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tzLVU-0003ZV-8j for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Mar 2025 20:13:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=lR2CV0SBvKgFsb2FMVjRUSNWsWL/8TdvIC7wV5ATj1k=; b=rW1rE0XlLedU8HVgqj2X1NUm68
 JJF+KpgGD1BC1LxfolC88ER/5dBYZ7x9DkTEosMSeZ6Epr9sHeINjBVj5jPCA/9pUjtKD4EUr6A7s
 75KUOY0B1BTKir2Dp8Jdq7OHa+TIwcqx0yjBdClacf+Yt37OvH0nNNkwn1m0KjmK/DWYbCxRz+zJK
 xQGz2HQvRr02OA+CyqIEJLsCLt3diZRBWlQb6L1hFQWCp3/y4yiCVA9iuURqCsmjNi3a6Dw4+DHxv
 bFWWqBSaW/idjSvyqXF+/toOmdXnSy6nfKP0MY93b1gVzUthrBLeKT0ErMmkHjaG4+sAXLpmbVD+z
 UHmLEX+w==;
Received: from willy by casper.infradead.org with local (Exim 4.98.1 #2 (Red
 Hat Linux)) id 1tzLVI-00000004Raw-3aga;
 Mon, 31 Mar 2025 20:13:04 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon, 31 Mar 2025 21:10:47 +0100
Message-ID: <20250331201256.1057782-28-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250331201256.1057782-1-willy@infradead.org>
References: <20250331201256.1057782-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Convert f2fs_get_meta_page() to f2fs_get_meta_folio() and
 add f2fs_get_meta_page() as a wrapper. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org> --- fs/f2fs/checkpoint.c | 4 ++-- fs/f2fs/f2fs.h |
 8 +++++++- 2 files changed, 9 insertions(+), 3 deletions(-) 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tzLVU-0003ZV-8j
Subject: [f2fs-dev] [PATCH 027/153] f2fs: Add f2fs_get_meta_folio()
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

Convert f2fs_get_meta_page() to f2fs_get_meta_folio() and add
f2fs_get_meta_page() as a wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/checkpoint.c | 4 ++--
 fs/f2fs/f2fs.h       | 8 +++++++-
 2 files changed, 9 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 0b3dfe7397d0..50fc1bbb8685 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -107,9 +107,9 @@ static struct folio *__get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index,
 	return folio;
 }
 
-struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
+struct folio *f2fs_get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index)
 {
-	return &__get_meta_folio(sbi, index, true)->page;
+	return __get_meta_folio(sbi, index, true);
 }
 
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 0f2d7a6d6991..1f8a7338dc76 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3880,7 +3880,7 @@ void f2fs_stop_checkpoint(struct f2fs_sb_info *sbi, bool end_io,
 							unsigned char reason);
 void f2fs_flush_ckpt_thread(struct f2fs_sb_info *sbi);
 struct folio *f2fs_grab_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index);
-struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index);
+struct folio *f2fs_get_meta_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 struct page *f2fs_get_meta_page_retry(struct f2fs_sb_info *sbi, pgoff_t index);
 struct folio *f2fs_get_tmp_folio(struct f2fs_sb_info *sbi, pgoff_t index);
 bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
@@ -3922,6 +3922,12 @@ int f2fs_start_ckpt_thread(struct f2fs_sb_info *sbi);
 void f2fs_stop_ckpt_thread(struct f2fs_sb_info *sbi);
 void f2fs_init_ckpt_req_control(struct f2fs_sb_info *sbi);
 
+static inline
+struct page *f2fs_get_meta_page(struct f2fs_sb_info *sbi, pgoff_t index)
+{
+	return &f2fs_get_meta_folio(sbi, index)->page;
+}
+
 /*
  * data.c
  */
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
