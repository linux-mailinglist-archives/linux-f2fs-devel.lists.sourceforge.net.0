Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C7EF3BB6C0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Jul 2021 07:22:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1m0H45-0001vC-HL; Mon, 05 Jul 2021 05:22:41 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jaegeuk@kernel.org>) id 1m0H43-0001v4-Qj
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 05:22:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HBzNbo+94ovv/kZ+iiMvdunnhXRkT8myUf8Fh0Xeij0=; b=aLE6zDDvRgMA4Tybcc/nCXbg1x
 6Ue1FN9bnCAzNng9JmeXZJbNOKSFoZgJxZck+RKvbUiEwvX6A7NOPY+vZDZ/YiT+Df14shHdC/Qnq
 Mv+87KuxWvSOmILIEqkWUVzcWilY3m1bVR9b59vMm7pnHVGs3MWpjPOU+ABTpPEhwKE0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HBzNbo+94ovv/kZ+iiMvdunnhXRkT8myUf8Fh0Xeij0=; b=R
 hPkGRVmWUJRGgRnEZgjFSZDYbQ8tv9x+brYAACxjj0YdVyn/H1qzuY4ipy7hryXWY1i1IPmNxt23a
 l4l8O+VKK6IuHS8swaU59bcEAmz40jtzuWFoAFIZiekbJxfNzY2d58b5GOw2Ong1YlyH4v4ioFWbj
 o/DhL/09Ie/N9uSE=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1m0H3u-00AVUc-Qp
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Jul 2021 05:22:39 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 95FCA613E2;
 Mon,  5 Jul 2021 05:22:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1625462539;
 bh=vZYGv/E1tXW+mr7nAYMJFnoN1LWBW/rm/2P3TYvvKZQ=;
 h=From:To:Cc:Subject:Date:From;
 b=YAPSQ4s6aUeWp+YHgh//SLHpLvV6IAKmTv6J8UBd0+XopqffpHHNu64ujbhwrJSDq
 dAsJP+mw/oB0xMPRpm17y5dyuwcqB0DIRchjgSKPibmSNwfiRrUVU/dOM2+H6/e/Yc
 qQIOUMVK5vRnhlaPATR9spHrDe2Oa9aUV7XBj2SH1+FlzyrnEZcRuX21HDB4gH6A4a
 ffrLUb6gXvtB0SVJ666m8RGUW+Ap/G+7WmsSDKlotq8Z3NTC15I0LIBcYV3UV+3wn2
 zx7OpPkOTRI8L7jqWSVZgcPQZ5hWJ1r1E1zDG/L2IfWU2PD3J66IdL28XXFrbfgJh6
 NHCvh0gYA0yog==
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Sun,  4 Jul 2021 22:22:16 -0700
Message-Id: <20210705052216.831989-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.32.0.93.g670b81a890-goog
MIME-Version: 1.0
X-Spam-Score: -1.5 (-)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -1.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1m0H3u-00AVUc-Qp
Subject: [f2fs-dev] [PATCH] f2fs: initialize page->private when using for
 our internal use
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We need to guarantee it's initially zero. Otherwise, it'll hurt entire flag
operations.

Fixes: b763f3bedc2d ("f2fs: restructure f2fs page.private layout")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 2 ++
 fs/f2fs/f2fs.h | 5 ++++-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 3a01a1b50104..d2cf48c5a2e4 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3819,6 +3819,8 @@ int f2fs_migrate_page(struct address_space *mapping,
 		get_page(newpage);
 	}
 
+	/* guarantee to start from no stale private field */
+	set_page_private(newpage, 0);
 	if (PagePrivate(page)) {
 		set_page_private(newpage, page_private(page));
 		SetPagePrivate(newpage);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 65befc68d88e..ee8eb33e2c25 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1331,7 +1331,8 @@ enum {
 #define PAGE_PRIVATE_GET_FUNC(name, flagname) \
 static inline bool page_private_##name(struct page *page) \
 { \
-	return test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
+	return PagePrivate(page) && \
+		test_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)) && \
 		test_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
 }
 
@@ -1341,6 +1342,7 @@ static inline void set_page_private_##name(struct page *page) \
 	if (!PagePrivate(page)) { \
 		get_page(page); \
 		SetPagePrivate(page); \
+		set_page_private(page, 0); \
 	} \
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page)); \
 	set_bit(PAGE_PRIVATE_##flagname, &page_private(page)); \
@@ -1392,6 +1394,7 @@ static inline void set_page_private_data(struct page *page, unsigned long data)
 	if (!PagePrivate(page)) {
 		get_page(page);
 		SetPagePrivate(page);
+		set_page_private(page, 0);
 	}
 	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
 	page_private(page) |= data << PAGE_PRIVATE_MAX;
-- 
2.32.0.93.g670b81a890-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
