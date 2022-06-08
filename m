Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 801B35435DB
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 17:03:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyxDJ-0004EY-HP; Wed, 08 Jun 2022 15:03:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyxDG-0004E4-Cg; Wed, 08 Jun 2022 15:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z93Cnt+g7bn8Rks2qPHkqYOXC3V0vuJ4otfYMlwXMI0=; b=cEnJWLed4GcyYD++n7H/6HpcbP
 a4sUSwX4M0of5rijl8goQrBq31hw8/dgIugY1+p/2EfogKUOgATMlAgnEJilYHDAPERRjC26lwjfG
 3kyN7Ktiu0+H4H+CspGynALa+b6euSN2v8FK7FsiF+f6Pbpc0D1BHKyEOaG2VzeubNRc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=z93Cnt+g7bn8Rks2qPHkqYOXC3V0vuJ4otfYMlwXMI0=; b=ZyBG0uFY7LSBlHzEiU947qAfbH
 r80TLPCZOt5f5OQgR3GefSOYs1jPzRfuYSRwZA/8pe2cJa29n/d7/tj8aZl4X+Cvy8vFngW4A5J/n
 fH2CS5p82ZybyfXuL3AF/OEBeyaG2/mWnRxcgDub+6BsgJmBcVH9YMqrxF9Xc9BNG8R0=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyxDF-009xyi-VF; Wed, 08 Jun 2022 15:03:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=z93Cnt+g7bn8Rks2qPHkqYOXC3V0vuJ4otfYMlwXMI0=; b=A8DhNIxJJ669f/qkcLeDGf72ZN
 VH8LAA48msbBnAVr0E+7FelEvxIN6WeTVVsY3+XbJ3JFz8o4YxHui00x1Y70h4ocWwm1rEhwBIjKN
 KqmXwNooNqQHQTU0PGaJX9VSpy4TIudFD2m7wXi5brVUZ9sATYKFon0A8unvko2wdijgsEP55z5gw
 LICUf+6yA08O9mkZ2CoaqXjq3c6UpqxZ4JALyMMrvUsNOS/irI5NCXGs3fXnIssRB78QjoY8+rsu6
 2JldLt7koSxVP03aOcqMPx4vsCCm76xYnTTjxDObf8Wn4Fx8tpZC1OJvSXomcGoxR7FYaLBgr8kSN
 KwIQrhwQ==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCv-00CjFm-8u; Wed, 08 Jun 2022 15:02:53 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:47 +0100
Message-Id: <20220608150249.3033815-18-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220608150249.3033815-1-willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
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
 <willy@infradead.org> --- mm/secretmem.c | 7 +++---- 1 file changed,
 3 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1nyxDF-009xyi-VF
Subject: [f2fs-dev] [PATCH v2 17/19] secretmem: Convert to migrate_folio
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
 mm/secretmem.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 1c7f1775b56e..658a7486efa9 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -133,9 +133,8 @@ static const struct file_operations secretmem_fops = {
 	.mmap		= secretmem_mmap,
 };
 
-static int secretmem_migratepage(struct address_space *mapping,
-				 struct page *newpage, struct page *page,
-				 enum migrate_mode mode)
+static int secretmem_migrate_folio(struct address_space *mapping,
+		struct folio *dst, struct folio *src, enum migrate_mode mode)
 {
 	return -EBUSY;
 }
@@ -149,7 +148,7 @@ static void secretmem_free_folio(struct folio *folio)
 const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
-	.migratepage	= secretmem_migratepage,
+	.migrate_folio	= secretmem_migrate_folio,
 };
 
 static int secretmem_setattr(struct user_namespace *mnt_userns,
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
