Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83F76AFD463
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Jul 2025 19:05:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AMaYeVRhnOMaj7XCSVenL3XYjBfqdZ9LhfJTJNRTO6U=; b=a+BWKFS0JKpuQ5TYndnPccKYub
	7zaEnrAgQOiktgee/Wm0B0Tmr3KrcBA/awsrsPdSRuB0D8FgrM+p4M/Sqy0tuol54+ik3cA5Qz73u
	M/bSmSIlGZH7+GGblfketdro943kM114IPJnNaAOnssArutZfR0K7rFfi7FTJcV2URcI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uZBkx-000367-CO;
	Tue, 08 Jul 2025 17:05:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <willy@infradead.org>) id 1uZBjy-0002qq-El
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vh5r9BXllTB23hUwbaVsi/GBzqkUD8h07mS8Xx5CJig=; b=ixsSRXcOh766OQdAi3/9JTB3jq
 N/W0JOGJOQWFeMMtWv4/MrIbz6aPRUyNAciYWCgwxFyFlnBeFvUKXn2lOBkrEZBGIQdGU7IX5eZNQ
 j8YYL+QwbepdPxnFoe7dWfVgXiVfJqp+c5D4AvH91Tv9IuKkau4nSD+UdtUFmuNkRksY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vh5r9BXllTB23hUwbaVsi/GBzqkUD8h07mS8Xx5CJig=; b=LLilCHaGDx8ORXLZR6+LgY0NCU
 +L6/C6k48Tu6xjWXXhPOCkeft/tfhmYWVK/iZSELfrHVtvpbfKwt8UVkd/1KuxnTm3VHVKjzg7ZQK
 cvb4hgvHeIm9YryjWYz8e7rn+rXUFIfELVTYwvKEqZy8MoCwq41xPmwHoS5tNHWsxOFk=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uZBju-0006Fq-SL for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 08 Jul 2025 17:04:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=Vh5r9BXllTB23hUwbaVsi/GBzqkUD8h07mS8Xx5CJig=; b=RxSau9Icg4/gV9H32ZDttBn6G7
 7HjRyzGcZ8Opuwgn9Bf+fRMIJhFCjMIrNR8TZIGrEe8QnGlKq6l/yGJe3xLYgRmyZ7cxyt0w19NJW
 f6CpvawdTkEG/n8Pq3224zvJL7eBpbDPVvLHckaTEYOm5ijYMuEY3tued77leqTruKkjlULF/KJna
 1teZ0yUXZCy3y489jUoW0yPjdTfb2cpvgUG3poNIwT0V1RIbkmEhPltpVQCAvycDxc7ZsE8qmT1HJ
 CbqoAX/eyda/tBWtcTRH6XVMdsWIavL5RjBUPSqBT1YxO/JK0VVNCt0wTzouUi/m9fkQwuDGFZntM
 PUPlBKcg==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red
 Hat Linux)) id 1uZBjj-00000000T7K-1H7j;
 Tue, 08 Jul 2025 17:04:07 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  8 Jul 2025 18:03:37 +0100
Message-ID: <20250708170359.111653-41-willy@infradead.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708170359.111653-1-willy@infradead.org>
References: <20250708170359.111653-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The only caller has a folio, so pass it in and operate on
 it. Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org> ---
 fs/f2fs/compress.c
 | 2 +- fs/f2fs/f2fs.h | 12 +++++++----- 2 files changed, 8 insertions(+),
 6 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
X-Headers-End: 1uZBju-0006Fq-SL
Subject: [f2fs-dev] [PATCH 40/60] f2fs: Convert set_page_private_data() to
 folio_set_f2fs_data()
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

The only caller has a folio, so pass it in and operate on it.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 fs/f2fs/compress.c |  2 +-
 fs/f2fs/f2fs.h     | 12 +++++++-----
 2 files changed, 8 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 5be1a4396f80..d7346c1fcd62 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1953,7 +1953,7 @@ void f2fs_cache_compressed_page(struct f2fs_sb_info *sbi, struct page *page,
 		return;
 	}
 
-	set_page_private_data(&cfolio->page, ino);
+	folio_set_f2fs_data(cfolio, ino);
 
 	memcpy(folio_address(cfolio), page_address(page), PAGE_SIZE);
 	folio_mark_uptodate(cfolio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 065f53006a82..142cbf8bc8f3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2537,12 +2537,14 @@ static inline unsigned long get_page_private_data(struct page *page)
 	return data >> PAGE_PRIVATE_MAX;
 }
 
-static inline void set_page_private_data(struct page *page, unsigned long data)
+static inline void folio_set_f2fs_data(struct folio *folio, unsigned long data)
 {
-	if (!PagePrivate(page))
-		attach_page_private(page, (void *)0);
-	set_bit(PAGE_PRIVATE_NOT_POINTER, &page_private(page));
-	page_private(page) |= data << PAGE_PRIVATE_MAX;
+	data = (1UL << PAGE_PRIVATE_NOT_POINTER) | (data << PAGE_PRIVATE_MAX);
+
+	if (!folio_test_private(folio))
+		folio_attach_private(folio, (void *)data);
+	else
+		folio->private = (void *)((unsigned long)folio->private | data);
 }
 
 static inline void clear_page_private_data(struct page *page)
-- 
2.47.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
