Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B65D161A00
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Feb 2020 19:46:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j3lPh-0000IG-9P; Mon, 17 Feb 2020 18:46:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j3lPa-0000Ek-Ai
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WrDwJ8nFqwwFHCEUmvBtLvKI87rds+XByqpS5q3jL/I=; b=F2dvNDUBhbAH21Rfrtp5zQRBja
 UG6Omfcm/25rbR4rHJbpdywWbudiCvCdnnagyTikhT2ft7oTmlmkvkUAXl4laYHHFe019Cw9vkZNY
 auY+X6wQuY7ThOmE3X8P4HHJrydM6M6QwdylWljCPZ+NKpADom6PrMioJwhp87OSlpLk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WrDwJ8nFqwwFHCEUmvBtLvKI87rds+XByqpS5q3jL/I=; b=Uj9T/brLyArP38JX15YXvuFMYM
 pHupvbu5rUvwMEFD8brj0Cf+IZvx5Kq+8cseUVSAfHlTco1i1bjiBcbszA6vbAezPa7yFnGiChlK1
 +Furm1qyw7B/lvTDJh6Ji4zlqJr3cn/nNWCGdIoGcY4T4J71/PU3Teh80chXcH6ZqlBI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j3lPZ-006POm-9c
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 17 Feb 2020 18:46:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=WrDwJ8nFqwwFHCEUmvBtLvKI87rds+XByqpS5q3jL/I=; b=GGafPZiC2dFK8pvgk9y9yCNXsD
 t0X14/DAGwm8tumWtSBNeHlGs6pU6ofKY5h5T2Gumm8ttaGKXoy4XyguucHMdoPNkkbycBh7NXd+Q
 tqEGpO/clXINLbrqJrecx7BvcHhl1z5OI2SfDpbdKSLkhB+6NyJygLwzCV2MflDQLRjN9Cug6Ki/a
 w508YQJA+HlKekwrg2z2Xuj4HYd6w5RYDGoHeesibMKIZ1lka97LNuQSSPOtxcRcKgwFS9TVKYEja
 pJ50VSMbDhI8IbTMc9WqgWS3nLFTd8kdS6nl6gPlOEP/mMDkWBvrKPNCJARs3eGxQJ1ypqfnEkcwi
 F37yA4Tg==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j3lPM-0005DS-Ee; Mon, 17 Feb 2020 18:46:16 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Mon, 17 Feb 2020 10:46:10 -0800
Message-Id: <20200217184613.19668-30-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200217184613.19668-1-willy@infradead.org>
References: <20200217184613.19668-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1j3lPZ-006POm-9c
Subject: [f2fs-dev] [PATCH v6 16/16] mm: Use memalloc_nofs_save in readahead
 path
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
Cc: linux-xfs@vger.kernel.org, Michal Hocko <mhocko@suse.com>,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Cong Wang <xiyou.wangcong@gmail.com>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

Ensure that memory allocations in the readahead path do not attempt to
reclaim file-backed pages, which could lead to a deadlock.  It is
possible, though unlikely this is the root cause of a problem observed
by Cong Wang.

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reported-by: Cong Wang <xiyou.wangcong@gmail.com>
Suggested-by: Michal Hocko <mhocko@suse.com>
---
 mm/readahead.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/readahead.c b/mm/readahead.c
index 566693f4e539..ae8abab939a3 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -22,6 +22,7 @@
 #include <linux/mm_inline.h>
 #include <linux/blk-cgroup.h>
 #include <linux/fadvise.h>
+#include <linux/sched/mm.h>
 
 #include "internal.h"
 
@@ -157,6 +158,18 @@ void page_cache_readahead_limit(struct address_space *mapping,
 		._nr_pages = 0,
 	};
 
+	/*
+	 * Partway through the readahead operation, we will have added
+	 * locked pages to the page cache, but will not yet have submitted
+	 * them for I/O.  Adding another page may need to allocate memory,
+	 * which can trigger memory reclaim.  Telling the VM we're in
+	 * the middle of a filesystem operation will cause it to not
+	 * touch file-backed pages, preventing a deadlock.  Most (all?)
+	 * filesystems already specify __GFP_NOFS in their mapping's
+	 * gfp_mask, but let's be explicit here.
+	 */
+	unsigned int nofs = memalloc_nofs_save();
+
 	/*
 	 * Preallocate as many pages as we will need.
 	 */
@@ -210,6 +223,7 @@ void page_cache_readahead_limit(struct address_space *mapping,
 	if (readahead_count(&rac))
 		read_pages(&rac, &page_pool);
 	BUG_ON(!list_empty(&page_pool));
+	memalloc_nofs_restore(nofs);
 }
 EXPORT_SYMBOL_GPL(page_cache_readahead_limit);
 
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
