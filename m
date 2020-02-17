Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BF6981619F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lPd-00036g-JU; Mon, 17 Feb 2020 18:46:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lPY-00035c-CC
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TRd7Ps5bWxlwa3OWn+vpade7IP4m4k5O05zkXvvMr5Y=; b=b02S32GgyXIAm5aNmvI56Si2ek
 AXlJUqmSjFOd7F6unvDwSJok1NZQo0YarUZq9Vup4w8Ich8N6pINVlEFqLZkMowsj43n8sdNkVqCr
 A2OC34O79SGiFmq+3Rg+E3nA6MoFW4ocYEW6NUZ3UFr2Yeaws/fApkiUsRWkqw5GHD+M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TRd7Ps5bWxlwa3OWn+vpade7IP4m4k5O05zkXvvMr5Y=; b=Ujst5Qef5J3swUQ4hM1YOdHEsE
 PfWny7bb/BDQlZ/d356gBzLjF8DoaOIBx2qn2pR9JWS2Kk39yRtenGHFw7AVJe49lVxfj3FYnEUP9
 Hwe5TsLt4XR6m2bPjbk5yHK2Z8MWhk/r7vySsLe+8UpJiJX20KPU+QgsKWNzd0Astr6A=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lPX-00Flis-6c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=TRd7Ps5bWxlwa3OWn+vpade7IP4m4k5O05zkXvvMr5Y=; b=KoRhZEZYO5r+aVQxWky2Sj5cKV
 x5KBRIm9HCvfLDRhcpo8BUshp6Yq45beYscHHQdrq+ozwaUlWGWSSBKc50p/2rxrcZknOWpduMgh4
 xti2jXe2tmFQgy25MwHLfu5E0Fezg/REcQJUwOvzgiH+Lp1MafCFPWO4LTpJ9BSxXFIQHqmqBHFOl
 4wIYMJ/6quo6hrkQKaq/0UogZI/X/vzR2t6osdUETyioAtrQegqbLstedpDQB5HdRdJ9OLJofEZ2c
 i3h+QbctO+ZRIYJgDEdD1xU6PVDrLqT0z+SIF3TRqfiy0Tb5zunZiVX4aOH6WZ0LMoDpDsSPlhkij
 pVaN5kew==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lPM-0005Dk-G5; Mon, 17 Feb 2020 18:46:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:46:11 -0800
Message-Id: <20200217184613.19668-31-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3lPX-00Flis-6c
Subject: [f2fs-dev] [PATCH v6 17/19] iomap: Restructure iomap_readpages_actor
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
 fs/iomap/buffered-io.c | 25 ++++++++++++-------------
 1 file changed, 12 insertions(+), 13 deletions(-)

diff --git a/fs/iomap/buffered-io.c b/fs/iomap/buffered-io.c
index cb3511eb152a..44303f370b2d 100644
--- a/fs/iomap/buffered-io.c
+++ b/fs/iomap/buffered-io.c
@@ -400,15 +400,9 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 		void *data, struct iomap *iomap, struct iomap *srcmap)
 {
 	struct iomap_readpage_ctx *ctx = data;
-	loff_t done, ret;
+	loff_t ret, done = 0;
 
-	for (done = 0; done < length; done += ret) {
-		if (ctx->cur_page && offset_in_page(pos + done) == 0) {
-			if (!ctx->cur_page_in_bio)
-				unlock_page(ctx->cur_page);
-			put_page(ctx->cur_page);
-			ctx->cur_page = NULL;
-		}
+	while (done < length) {
 		if (!ctx->cur_page) {
 			ctx->cur_page = iomap_next_page(inode, ctx->pages,
 					pos, length, &done);
@@ -418,6 +412,15 @@ iomap_readpages_actor(struct inode *inode, loff_t pos, loff_t length,
 		}
 		ret = iomap_readpage_actor(inode, pos + done, length - done,
 				ctx, iomap, srcmap);
+		if (WARN_ON(ret == 0))
+			break;
+		done += ret;
+		if (offset_in_page(pos + done) == 0) {
+			if (!ctx->cur_page_in_bio)
+				unlock_page(ctx->cur_page);
+			put_page(ctx->cur_page);
+			ctx->cur_page = NULL;
+		}
 	}
 
 	return done;
@@ -451,11 +454,7 @@ iomap_readpages(struct address_space *mapping, struct list_head *pages,
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
