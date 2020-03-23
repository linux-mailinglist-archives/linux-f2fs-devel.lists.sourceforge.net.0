Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F04EE18FEB4
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 23 Mar 2020 21:23:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jGTbU-00045U-1z; Mon, 23 Mar 2020 20:23:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1jGTbQ-00044J-Tf
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lc2x7VErpz8frUilxWdYkzAv1z74llWH8NCvh1AsjI4=; b=SlxVzuE/rJ4S6XjL/tFCVEdTfY
 SBaRZ7ZxiaMzOaA9Y/4c2IS5UA7EoaxUE9bv8eKX3wTt8ijR8wmy0DiXMEJ3LN8TC9pPQWZhovxTY
 4MOzLl3IdJ+5lGZQjj2BmH7oCZdT/eI/nPcjYcgiVQOU4ATesDXuVXh9Z3qEosBJ1EP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Lc2x7VErpz8frUilxWdYkzAv1z74llWH8NCvh1AsjI4=; b=cgZ7hs2pvnZn7kSgPWWdmYGA8E
 03HX/b0kXTr6CviTB8sf8Fr8WOzS5OPcKkRpqbSgFxxKtHRlZRpJ4KwuLTCSe+60jaf3fpvsqURIo
 hX5Y1fE33HRqA4ubAL9Nf1OLyHkm27bcpRLvnBQ/TcNqEN+kCi4L+afH2VXTWuFISUtg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jGTbP-001Hcx-3Y
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 23 Mar 2020 20:23:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Lc2x7VErpz8frUilxWdYkzAv1z74llWH8NCvh1AsjI4=; b=OCqwAs8gWk8moYj+LDYAgnWNAH
 t5/NKYmt3+SR3/wx+zFgX2g93PKItZMY4t+ZlktHqiRKCUaT+0BQ+OD5m8+q0b21PtJVr6eRIcase
 coap6FvntuTtV2v2TUrj+ZzK3VLwWTieamolenBguach8qjCeGe6JJ4ZN4k/4eyxCK+yq35DsQ8+X
 /opsa7hT3ETSTKyeTfaQpFE7wMZae+k8lJ4Z2f2Mf0z0UZCytJdmMCg2+CbA+d2OlWVRTbY7R5/mC
 FxdkpQDVVPxzy5prWby2DTFxQqCNKCJ/sQno0fKowRcPoPK6OluFusTBONzTctJ+ovOw2AUyMN4kz
 YQpvLD9A==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1jGTbB-0003VP-SE; Mon, 23 Mar 2020 20:23:01 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Andrew Morton <akpm@linux-foundation.org>
Date: Mon, 23 Mar 2020 13:22:49 -0700
Message-Id: <20200323202259.13363-16-willy@infradead.org>
X-Mailer: git-send-email 2.21.1
In-Reply-To: <20200323202259.13363-1-willy@infradead.org>
References: <20200323202259.13363-1-willy@infradead.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: suse.com]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jGTbP-001Hcx-3Y
Subject: [f2fs-dev] [PATCH v10 15/25] mm: Use memalloc_nofs_save in
 readahead path
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
 William Kucharski <william.kucharski@oracle.com>, linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
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
Reviewed-by: William Kucharski <william.kucharski@oracle.com>
---
 mm/readahead.c | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/mm/readahead.c b/mm/readahead.c
index 73cb59ed5cff..3c9a8dd7c56c 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -22,6 +22,7 @@
 #include <linux/mm_inline.h>
 #include <linux/blk-cgroup.h>
 #include <linux/fadvise.h>
+#include <linux/sched/mm.h>
 
 #include "internal.h"
 
@@ -185,6 +186,18 @@ void page_cache_readahead_unbounded(struct address_space *mapping,
 	};
 	unsigned long i;
 
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
@@ -229,6 +242,7 @@ void page_cache_readahead_unbounded(struct address_space *mapping,
 	 * will then handle the error.
 	 */
 	read_pages(&rac, &page_pool, false);
+	memalloc_nofs_restore(nofs);
 }
 EXPORT_SYMBOL_GPL(page_cache_readahead_unbounded);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
