Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B1553F03E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  6 Jun 2022 22:41:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyJXb-00063z-Oc; Mon, 06 Jun 2022 20:41:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyJXW-000605-Ra; Mon, 06 Jun 2022 20:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xi6bfdZ9kew/Ht/n6wJe844q1fNiFHAUuQwBybhvWV8=; b=JKqMTY16PlzBpvIp2V1VL0ZGZj
 vsyyMJjLHeEMvuWssNYtTGVf1uELlUuidNaj2unqty8UK1Jqn0mNxxGQ95ZrpzdbenZRs+WTopSa0
 ladn3+dZabvRaAq1SyUH9pAGunRBaRscgFo0Ob2165+lwE1+g4idRh9ojQNmO42djN3Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xi6bfdZ9kew/Ht/n6wJe844q1fNiFHAUuQwBybhvWV8=; b=EG9SkWU/ZEkfKG4Ks8cAcLbgF2
 q8Q57slejh9ej6/4wFV2uca0LrT12w4SKPDrZpZhXiRSK1kUwg7vlZLPuN59TMt/v9YqJpc35dDPZ
 cy4YtpVTejM4DAVsOmnpzkc1lglQXsbViFNv1foWHM2bhwTBiFPvIkjdT7bteFt4ZcjA=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyJXW-007Q30-Ha; Mon, 06 Jun 2022 20:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=xi6bfdZ9kew/Ht/n6wJe844q1fNiFHAUuQwBybhvWV8=; b=SPlA9TQH81xoMoIY10n2YxKfFT
 FsYePoVkMqprqpv6ZpSb8LgcBJlPTx6ZiQnv9+DpcX1C8BhCoh731GzGv3vwXqOhVgpjWqAcZ9x5Q
 yXSG40C4z1zTwsHq25TqavEFM/aIkrZ74keXov/lJSFAeAlVFO92OjNCITHAZeey74UYtElj1IkQ9
 igzOLTZbXbr/H/xrC6wuD1gd2dEhozUsRpbKST11t4x3padiQWXP0MH6RjFWVF6lx2GnIIN77FMNF
 eqfhiP3IbavqdfjHnrPmIl/jNgL2ME2jYU2bFfEUdA0P2115AUzGiBLzXrUZQ116ZbPHL/l6z5/G3
 D9YuFHRg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyJWx-00B19m-P8; Mon, 06 Jun 2022 20:40:55 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon,  6 Jun 2022 21:40:45 +0100
Message-Id: <20220606204050.2625949-16-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220606204050.2625949-1-willy@infradead.org>
References: <20220606204050.2625949-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is little more than changing the types over; there's
 no real work being done in this function. Signed-off-by: Matthew Wilcox
 (Oracle)
 <willy@infradead.org> --- mm/balloon_compaction.c | 15 +++++++-------- 1
 file changed, 7 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyJXW-007Q30-Ha
Subject: [f2fs-dev] [PATCH 15/20] balloon: Convert to migrate_folio
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
Cc: linux-aio@kvack.org, linux-nfs@vger.kernel.org, cluster-devel@redhat.com,
 linux-ntfs-dev@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-mm@kvack.org, linux-mtd@lists.infradead.org, ocfs2-devel@oss.oracle.com,
 linux-ext4@vger.kernel.org, virtualization@lists.linux-foundation.org,
 linux-xfs@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is little more than changing the types over; there's no real work
being done in this function.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/balloon_compaction.c | 15 +++++++--------
 1 file changed, 7 insertions(+), 8 deletions(-)

diff --git a/mm/balloon_compaction.c b/mm/balloon_compaction.c
index 4b8eab4b3f45..3f75b876ad76 100644
--- a/mm/balloon_compaction.c
+++ b/mm/balloon_compaction.c
@@ -230,11 +230,10 @@ static void balloon_page_putback(struct page *page)
 
 
 /* move_to_new_page() counterpart for a ballooned page */
-static int balloon_page_migrate(struct address_space *mapping,
-		struct page *newpage, struct page *page,
-		enum migrate_mode mode)
+static int balloon_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
-	struct balloon_dev_info *balloon = balloon_page_device(page);
+	struct balloon_dev_info *balloon = balloon_page_device(&src->page);
 
 	/*
 	 * We can not easily support the no copy case here so ignore it as it
@@ -244,14 +243,14 @@ static int balloon_page_migrate(struct address_space *mapping,
 	if (mode == MIGRATE_SYNC_NO_COPY)
 		return -EINVAL;
 
-	VM_BUG_ON_PAGE(!PageLocked(page), page);
-	VM_BUG_ON_PAGE(!PageLocked(newpage), newpage);
+	VM_BUG_ON_FOLIO(!folio_test_locked(src), src);
+	VM_BUG_ON_FOLIO(!folio_test_locked(dst), dst);
 
-	return balloon->migratepage(balloon, newpage, page, mode);
+	return balloon->migratepage(balloon, &dst->page, &src->page, mode);
 }
 
 const struct address_space_operations balloon_aops = {
-	.migratepage = balloon_page_migrate,
+	.migrate_folio = balloon_migrate_folio,
 	.isolate_page = balloon_page_isolate,
 	.putback_page = balloon_page_putback,
 };
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
