Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 691C25435DA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  8 Jun 2022 17:03:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nyxDM-00037Y-3W; Wed, 08 Jun 2022 15:03:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <willy@infradead.org>)
 id 1nyxDJ-00036z-9i; Wed, 08 Jun 2022 15:03:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rXRIRcK5aBVZ2wBOi68suVknWfPexbmGif0IEKfZsbs=; b=PilGlpxF4rdPMq2kt4bu1PUTgK
 iuL1/a6C6AMpAoP71Y4NJm2qVkc00Eo4EYMcHQBXPN9swEXDRIszL5ZrLJUo8HnFZuJ7+Gu2p5f9M
 iSaCwWdr1vhNq8b6qHMk4WwHWiBg2i5Wieh3k4+EMsF31QbwCWwH9AZZltlGpeuERQyc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rXRIRcK5aBVZ2wBOi68suVknWfPexbmGif0IEKfZsbs=; b=kSVib1WWdUN2BrXpM319rprZ6y
 ygIpHz8IZ0azZv7JEmnS8ICOQYMLfF7hIRd/C5Qq7T0qXAeN9GrEQ9qPsx9VJ90K3qzi725L/OICO
 5oFffh2m+sQzCphvVQPHAymZgQ0SVIabLK7lmvzzfhY3Rew7UmoqcNpegvTNRJk26k3M=;
Received: from casper.infradead.org ([90.155.50.34])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nyxDH-009xyv-DL; Wed, 08 Jun 2022 15:03:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-Type:Content-ID:Content-Description;
 bh=rXRIRcK5aBVZ2wBOi68suVknWfPexbmGif0IEKfZsbs=; b=lsRn9gaO5tAEYD/OWJOs5+zBTI
 NCwTDYynMk1lnd9OTbJ4EfJRYdVl+3dODL7tzXJVPHXM+7SlQHXOVlUsUboFXhSdXz3aSmA3UKZ6F
 L5v7sh+GECC4njYbIAGlnHpfB8UwcWrwo0wyP4BhZlRei7kEvvdyW2VaiPkXgO55R9kKQgx/YjEqw
 tYFIlMpDyJj5vqIZK5lcNkMFc7QTZ02ItadvJCgbfwAGx5UGipfrdrSUQujOmia2pjwzdNOAWZ616
 V6c9pTOiEz7pLpSwn0iaK2fRQggU3GplOvlDyjFYnosAScOy2AdneQp1BzdO4NPq9SyDvONshsH4r
 X68Lp0aw==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red
 Hat Linux)) id 1nyxCt-00CjFG-OC; Wed, 08 Jun 2022 15:02:51 +0000
From: "Matthew Wilcox (Oracle)" <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed,  8 Jun 2022 16:02:31 +0100
Message-Id: <20220608150249.3033815-2-willy@infradead.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220608150249.3033815-1-willy@infradead.org>
References: <20220608150249.3033815-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The isolate_page operation is never called for filesystems, 
 only for device drivers which call SetPageMovable. Signed-off-by: Matthew
 Wilcox (Oracle) <willy@infradead.org> --- mm/secretmem.c | 6 ------ 1 file
 changed, 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1nyxDH-009xyv-DL
Subject: [f2fs-dev] [PATCH v2 01/19] secretmem: Remove isolate_page
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

The isolate_page operation is never called for filesystems, only
for device drivers which call SetPageMovable.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
---
 mm/secretmem.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/mm/secretmem.c b/mm/secretmem.c
index 206ed6b40c1d..1c7f1775b56e 100644
--- a/mm/secretmem.c
+++ b/mm/secretmem.c
@@ -133,11 +133,6 @@ static const struct file_operations secretmem_fops = {
 	.mmap		= secretmem_mmap,
 };
 
-static bool secretmem_isolate_page(struct page *page, isolate_mode_t mode)
-{
-	return false;
-}
-
 static int secretmem_migratepage(struct address_space *mapping,
 				 struct page *newpage, struct page *page,
 				 enum migrate_mode mode)
@@ -155,7 +150,6 @@ const struct address_space_operations secretmem_aops = {
 	.dirty_folio	= noop_dirty_folio,
 	.free_folio	= secretmem_free_folio,
 	.migratepage	= secretmem_migratepage,
-	.isolate_page	= secretmem_isolate_page,
 };
 
 static int secretmem_setattr(struct user_namespace *mnt_userns,
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
