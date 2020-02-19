Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1953316508A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4WTG-0002Wv-TH; Wed, 19 Feb 2020 21:01:26 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4WTD-0002V3-DA
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=erFAlFt7URKao+s7h4ENpLN+DsCi0u0lEGbwZPr/bFo=; b=bXtHxVF9c/SlotdUtQvlZEjh6Y
 i9+tRm3YJRhTtHoIeeIFijBV/HjfaADaoDvEoNMtqrcY+bdLp90qlPYiDBvIjRuRcMO0IelQTlStG
 iNBuktQZM6PhK5jj5Xt098CkTIPw7jBd7giBpYNerzofscST6m9v9NqfIY7QchPnP4XU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=erFAlFt7URKao+s7h4ENpLN+DsCi0u0lEGbwZPr/bFo=; b=azWs/KnRbTQUnl6IgsDi74RVJh
 iHJmgE/KCpw8OZ29S8xox7JiCP4VAWMDfxAhbYNIWiyqRgE6uFKZRGnfy8fiNNWA8M1+JQEgRJba6
 H8E2qj5S0lLd3U9itDzmb+Le8UU26gOPLWXgRfIbtA5rw4Xizw/kwEf3wllnOqa2fygE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4WT8-0084md-AF
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=erFAlFt7URKao+s7h4ENpLN+DsCi0u0lEGbwZPr/bFo=; b=Ez8O6Ork4eM5HUZAaYjx52rH2y
 4lieoM83EpQuWgejFeMJRSD3vAz098TXGV3I4kOGIMPFYhkczKgk6r9ev9aYcBhMFWPV6Su87WcUF
 WzSqnxWhPQiSIvNFy5wvbWQhLCuGo9rdjXrglVVZc7aTNjzUc/1VxOBxvY8ksQWBNs/tDWxUValZ1
 zNq6IQcJoXKrO93oWsp6x6tqa7v5Isrcub5czeYkk+HLGrOV9JhvQ0pR1hBiIFm6SO1MVW4+xqzj5
 +lcM2cyaeBfGc9H2MieqJ+y/i/uohPEyQx9bwMAqtRJz0AdumNavA7uQpYKgL2AAcn9oHSYzFN/fi
 bCsNsoYg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4WSv-0008VK-Gt; Wed, 19 Feb 2020 21:01:05 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:01:00 -0800
Message-Id: <20200219210103.32400-22-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200219210103.32400-1-willy@infradead.org>
References: <20200219210103.32400-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: infradead.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j4WT8-0084md-AF
Subject: [f2fs-dev] [PATCH v7 21/24] iomap: Restructure iomap_readpages_actor
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
Cc: linux-xfs@vger.kernel.org, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

By putting the 'have we reached the end of the page' condition at the end
of the loop instead of the beginning, we can remove the 'submit the last
page' code from iomap_readpages().  Also check that iomap_readpage_actor()
didn't return 0, which would lead to an endless loop.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/iomap/buffered-io.c | 32 ++++++++++++++++++--------------
 1 file changed, 18 insertions(+), 14 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cb3511eb152a..31899e6cb0f8 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 		void *data, struct iomap *iomap, struct iomap *srcmap)
 {
 	struct iomap_readpage_ctx *ctx = data;
-	loff_t done, ret;
-
-	for (done = 0; done < length; done += ret) {
-		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
-			if (!ctx->cur_page_in_bio)
-				unlock_page(ctx->cur_page);
-			put_page(ctx->cur_page);
-			ctx->cur_page = NULL;
-		}
+	loff_t ret, done = 0;
+
+	while (done < length) {
 		if (!ctx->cur_page) {
 			ctx->cur_page = iomap_next_page(inode, ctx->pages,
 					pos, length, &done);
@@ -418,6 +412,20 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 		ret = iomap_readpage_actor(inode, pos + done, length - done,
 				ctx, iomap, srcmap);
+		done += ret;
+
+		/* Keep working on a partial page */
+		if (ret && offset_in_page(pos + done))
+			continue;
+
+		if (!ctx->cur_page_in_bio)
+			unlock_page(ctx->cur_page);
+		put_page(ctx->cur_page);
+		ctx->cur_page = NULL;
+
+		/* Don't loop forever if we made no progress */
+		if (WARN_ON(!ret))
+			break;
 	}
 
 	return done;
@@ -451,11 +459,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
 done:
 	if (ctx.bio)
 		submit_bio(ctx.bio);
-	if (ctx.cur_page) {
-		if (!ctx.cur_page_in_bio)
-			unlock_page(ctx.cur_page);
-		put_page(ctx.cur_page);
-	}
+	BUG_ON(ctx.cur_page);
 
 	/*
 	 * Check that we didn't lose a page due to the arcance calling
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
