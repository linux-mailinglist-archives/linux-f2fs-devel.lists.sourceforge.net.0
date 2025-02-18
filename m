Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAC7BA39326
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Feb 2025 06:52:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tkGWy-0006ah-Fl;
	Tue, 18 Feb 2025 05:52:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1tkGWn-0006ZM-Ep
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8eCp/aYOgC7traLzeBHZGcZTwEdZmKw2uvFSR9Kleuc=; b=QA+GxwXlheIFRYKkz536PIZZhl
 0mToWqEWYpqceuejd2aJHTLCpdKMWr2GKUqzssTiBUJVgCPcDEQkKAM2YQNHEEf8XZHVHBOib0FtC
 9/4/GAo6QHzcDCc/WZn+DXTj2Le+3drR34scXnCS7/IKBZuOlvWNdzgSJnGtEK5JgYqU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8eCp/aYOgC7traLzeBHZGcZTwEdZmKw2uvFSR9Kleuc=; b=Geu4IqtFQUPJDXW3SCW3kfOpob
 H6YBBJii673i2WhhO552YwaBKAuMc9XJmYTFXuVlkCwN4/larcSWfdOUvGzA65OEy6zW6qELFG2Ju
 G9YeepBkOZYZezq3XRvnACVyJHKEdQWAubVtiZ1KP7hQA+NwBbBc7ncM2ZjXN0Kg+ek0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tkGWm-0007c2-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Feb 2025 05:52:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=8eCp/aYOgC7traLzeBHZGcZTwEdZmKw2uvFSR9Kleuc=; b=Em2r42koRd2AWlroXM3Gw+K6mU
 e9N5HW1/MIO6enKgzVwxbhWHB6LsdLDi47g3G+oeRXF/2Jx3vWVKz9vxT/bhWI4KPlXBp/q98LB3N
 +pf/DUXvD1dZx5bpp+Z73rIkpnoyIIQOjVPEzJuW9JntA8Qiu2i6qLGI05mODkE+yfUo5A0hNAQm7
 724EzKq0O0ex9tZCLxNvlIwI0NlwQeGjEtC+4FAKe6Z4WGmRklGQxuJRdFWv3XtaTkXcGnuN6w8Xp
 SfgRLQv3bDl/RCNZDfm2c0ygTWVNProN5hnjtX4mY1lBFrLjS5QgB4elUgqcdkDwEJmAzoBodEe8k
 U/ayr+WA==;
Received: from willy by casper.infradead.org with local (Exim 4.98 #2 (Red Hat
 Linux)) id 1tkGWb-00000002Tr0-1wIX; Tue, 18 Feb 2025 05:52:05 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 18 Feb 2025 05:51:36 +0000
Message-ID: <20250218055203.591403-3-willy@infradead.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250218055203.591403-1-willy@infradead.org>
References: <20250218055203.591403-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The last caller has been converted to call
 folio_wait_stable(), 
 so we can remove this wrapper. Signed-off-by: Matthew Wilcox (Oracle)
 <willy@infradead.org>
 --- include/linux/pagemap.h | 1 - mm/folio-compat.c | 6 ------ 2 files changed,
 7 deletions(-) 
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
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1tkGWm-0007c2-S5
Subject: [f2fs-dev] [PATCH 02/27] mm: Remove wait_for_stable_page()
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

The last caller has been converted to call folio_wait_stable(), so
we can remove this wrapper.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 include/linux/pagemap.h | 1 -
 mm/folio-compat.c       | 6 ------
 2 files changed, 7 deletions(-)

diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 47bfc6b1b632..a19d8e334194 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -1256,7 +1256,6 @@ void folio_wait_writeback(struct folio *folio);
 int folio_wait_writeback_killable(struct folio *folio);
 void end_page_writeback(struct page *page);
 void folio_end_writeback(struct folio *folio);
-void wait_for_stable_page(struct page *page);
 void folio_wait_stable(struct folio *folio);
 void __folio_mark_dirty(struct folio *folio, struct address_space *, int warn);
 void folio_account_cleaned(struct folio *folio, struct bdi_writeback *wb);
diff --git a/mm/folio-compat.c b/mm/folio-compat.c
index 1d1832e2a599..5766d135af1e 100644
--- a/mm/folio-compat.c
+++ b/mm/folio-compat.c
@@ -28,12 +28,6 @@ void wait_on_page_writeback(struct page *page)
 }
 EXPORT_SYMBOL_GPL(wait_on_page_writeback);
 
-void wait_for_stable_page(struct page *page)
-{
-	return folio_wait_stable(page_folio(page));
-}
-EXPORT_SYMBOL_GPL(wait_for_stable_page);
-
 void mark_page_accessed(struct page *page)
 {
 	folio_mark_accessed(page_folio(page));
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
