Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B0EF09DB274
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:19:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWvx-0007w1-6P;
	Thu, 28 Nov 2024 05:19:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWvt-0007vZ-TF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iYZGvaxFuKDg9b09KhV0iM1YZejH6hOFdqKxNiu6a2k=; b=AobYGQxwAUd2PtVYeSqb2Kg1yh
 9RoqZ/oDHuc4job+uYVz0z3AqmyCbUw1ejD5SeX5/7vg6tomNzHXROxGQiXaQxvqwKALr4ZRC2EGa
 d0r6Z3v9pGlRs8j/pdtCeVaRDvaMbAaRlL0vZj94IesIOgBhERoxVpzFuZoR7YXDZU4g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iYZGvaxFuKDg9b09KhV0iM1YZejH6hOFdqKxNiu6a2k=; b=dC619BIPgTYn5ccKW43xYd2s+h
 o7o+gbXEMNYpri7FKdSVk1pVRMIrzS/XxwZZYTaRZQQB+IEBS65UeunezCvMgvWIANeICBEjPHWpj
 0fOfezV+WH3mBhAKhtRWGyOQjD4KU2s3yVXwy60Ky4lLBYDhR+4s+tcTtNlu/sJX25NY=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWvr-0004d6-W4 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=iYZGvaxFuKDg9b09KhV0iM1YZejH6hOFdqKxNiu6a2k=; b=Az1m3dC4041vs92Lq3oCRomdoV
 9XPejKCD5ROvR0cFZftUyOGKM8pQoWyUxTuDRJ3G0cE/TeEM27qReCZYGxsVpW4C1qGFR3XUeVlvI
 fT8NgBNc0RQHnV0XSmcVUOQ+6tl3Ak5YrWFsyS+QecOaDa71CpohHq8GsFQKCanGObz+q2BkLcsEi
 Zlb91zb+EAAK4jVO5C3DTHUT3WXFPx8Bj0Gw/iesAL72D+UEdHJWfMe1yjsbiEKcIrTs3jwS1Dyq3
 qL1lLMlsbhP38jKmlFAU+DlifLHzRHQupG+MerIvs/g/GSijyP31JhP2rmku+NgamQz+J7wl/hP0z
 3ojoYYrA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbr-00000002DGN-2GPF; Thu, 28 Nov 2024 04:58:35 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:26 +0000
Message-ID: <20241128045828.527559-12-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: All folios that f2fs sees belong to f2fs and not to the
 swapcache
 so it can dereference folio->mapping directly like all other filesystems
 do. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/data.c
 | 2 +- fs/f2fs/inline.c | 2 +- include/trace/events/f2fs.h | 9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(- [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tGWvr-0004d6-W4
Subject: [f2fs-dev] [PATCH 11/11] f2fs: Remove calls to folio_file_mapping()
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

All folios that f2fs sees belong to f2fs and not to the swapcache
so it can dereference folio->mapping directly like all other
filesystems do.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/data.c              | 2 +-
 fs/f2fs/inline.c            | 2 +-
 include/trace/events/f2fs.h | 9 ++++-----
 3 files changed, 6 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index e68a4dd9bc17..0657f731d4b7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2455,7 +2455,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 static int f2fs_read_data_folio(struct file *file, struct folio *folio)
 {
-	struct inode *inode = folio_file_mapping(folio)->host;
+	struct inode *inode = folio->mapping->host;
 	int ret = -EAGAIN;
 
 	trace_f2fs_readpage(folio, DATA);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 005babf1bed1..cbd2a0d34804 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -81,7 +81,7 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 
 void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 {
-	struct inode *inode = folio_file_mapping(folio)->host;
+	struct inode *inode = folio->mapping->host;
 
 	if (folio_test_uptodate(folio))
 		return;
diff --git a/include/trace/events/f2fs.h b/include/trace/events/f2fs.h
index 3253f45508e8..eb3b2f1326b1 100644
--- a/include/trace/events/f2fs.h
+++ b/include/trace/events/f2fs.h
@@ -1322,12 +1322,11 @@ DECLARE_EVENT_CLASS(f2fs__folio,
 	),
 
 	TP_fast_assign(
-		__entry->dev	= folio_file_mapping(folio)->host->i_sb->s_dev;
-		__entry->ino	= folio_file_mapping(folio)->host->i_ino;
+		__entry->dev	= folio->mapping->host->i_sb->s_dev;
+		__entry->ino	= folio->mapping->host->i_ino;
 		__entry->type	= type;
-		__entry->dir	=
-			S_ISDIR(folio_file_mapping(folio)->host->i_mode);
-		__entry->index	= folio_index(folio);
+		__entry->dir	= S_ISDIR(folio->mapping->host->i_mode);
+		__entry->index	= folio->index;
 		__entry->dirty	= folio_test_dirty(folio);
 		__entry->uptodate = folio_test_uptodate(folio);
 	),
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
