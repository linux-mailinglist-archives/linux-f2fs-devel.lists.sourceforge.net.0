Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCA039DB278
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Nov 2024 06:20:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tGWwW-00080C-IW;
	Thu, 28 Nov 2024 05:19:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tGWwV-0007zy-Ev
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UZ7eeTM3jL+4AqsDmBAki6kUCktqtsseVplxJnGqLjk=; b=K9boW19rj1EjeumuEs5SIZmwy1
 Am/UzldIBZuhxVWqIehQRwcWolYN20IJ7sKx3xbnF+cPx/ZXjtCMddpSs50GJnItCseVymwh9E7vA
 hGNZuWZW1ZelVX8u9b+9STk2ceFFwrgrXnG8ksz39EgcQDjgAk5NSnqB++Zmv468IXoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UZ7eeTM3jL+4AqsDmBAki6kUCktqtsseVplxJnGqLjk=; b=OE0iNqZZ0DR/ZoITGn8ZXVXSQs
 /0/0U/SxnF9rZZiLIBvGNtMxPTbCh2rzjH6Vper4wT4yZzt/TM0mhxT+rz1g4VaosTISY0jKmv09a
 1TC00FLu3Qmg9Iqgn0rais+5RcYsyor3h0de2aaLXKSDNUQtZxc36GFqz4I3Bd84kAJU=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tGWwU-0004gm-U7 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Nov 2024 05:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=UZ7eeTM3jL+4AqsDmBAki6kUCktqtsseVplxJnGqLjk=; b=GwVx4uvcQTe/63mSWwPi3qgpEC
 N/zrf0+sR9dNI5fH74H8jMJpUXVsuPCZA6yrpFm+VsZH1QehXN5mUf+u5irX2ek85L6IHV5EpkmEh
 6RggWWe2+T2ApmaVyTKkpzq2BiNx5HWGGYCD6XFPBSbAxU329OqwwyM96yiJe7a1i1qAOJSDIP08G
 cRqY06QkrNXe4Qdv6v7/HepoOZ1ygZ4yIxpxeS201jp1tu0yXZW85lXfAB+w8TO2Z2clJpX4L4MjC
 tHI/rJJdTbu1dyGqAuJ5V8uvC/CTOgRb18m8SzS0OGBb5M48pr1rvxROK3G5WLn/1Mt41cq6n6ffE
 0qrFqSUA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tGWbq-00000002DFS-0xCg; Thu, 28 Nov 2024 04:58:34 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Thu, 28 Nov 2024 04:58:16 +0000
Message-ID: <20241128045828.527559-2-willy@infradead.org>
X-Mailer: git-send-email 2.47.0
In-Reply-To: <20241128045828.527559-1-willy@infradead.org>
References: <20241128045828.527559-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove references to page->index and use
 folio_test_uptodate()
 instead of PageUptodate(). Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- fs/f2fs/compress.c | 8 +++++--- 1 file changed, 5 insertions(+),
 3 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [90.155.50.34 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [90.155.50.34 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tGWwU-0004gm-U7
Subject: [f2fs-dev] [PATCH 01/11] f2fs: Use a folio in
 f2fs_all_cluster_page_ready()
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

Remove references to page->index and use folio_test_uptodate()
instead of PageUptodate().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7f26440e8595..9f8d0f4c8564 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -846,7 +846,7 @@ bool f2fs_cluster_can_merge_page(struct compress_ctx *cc, pgoff_t index)
 bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 				int index, int nr_pages, bool uptodate)
 {
-	unsigned long pgidx = pages[index]->index;
+	unsigned long pgidx = page_folio(pages[index])->index;
 	int i = uptodate ? 0 : 1;
 
 	/*
@@ -860,9 +860,11 @@ bool f2fs_all_cluster_page_ready(struct compress_ctx *cc, struct page **pages,
 		return false;
 
 	for (; i < cc->cluster_size; i++) {
-		if (pages[index + i]->index != pgidx + i)
+		struct folio *folio = page_folio(pages[index + i]);
+
+		if (folio->index != pgidx + i)
 			return false;
-		if (uptodate && !PageUptodate(pages[index + i]))
+		if (uptodate && !folio_test_uptodate(folio))
 			return false;
 	}
 
-- 
2.45.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
