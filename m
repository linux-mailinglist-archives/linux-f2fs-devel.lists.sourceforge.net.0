Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44E29C98D4D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 20:20:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2iYDNKYlZz7y8PAGhOEkHA8fPdUsFRH2lOtzGZV+Dtk=; b=gP1pFIdsUTIieSmYSSAgQDU6IB
	81nxmotp07rhG8wV1U+VPs0NZrOc7v0OIw/y0eUo4IjfMTqee9nRf8wJGBm8XN3I5YxAPV3PKUBQA
	BW67VrF8YTnbKpdPvRAjUagKKP6JtDSG2PtzCWd6yqPBW3R2sb4MyKjBSx20Y1HytiTY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQ9RF-0001Ia-9f;
	Mon, 01 Dec 2025 19:19:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQ9RD-0001IN-6P
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 19:19:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zpm2yK9mjreEgJL6r30xA5zOTYqas3FAsFQtfNHmihs=; b=d7suGCAVqvWA3YJnNCC/FrHN/7
 hNKgvsveIkWg1MD+epbvM5Yjwhsi4qRRKfIpj3YPcSojzllQrrXzyNKzbQLu7mI5ig2RheZvk3M7W
 0BT7p4HMCCnHqDY70pai+GGnQ0OJnvA8lBKhNz3QnvBIcQv4AALilE5yfmZzlcjvlGj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zpm2yK9mjreEgJL6r30xA5zOTYqas3FAsFQtfNHmihs=; b=EoGYIJkfRS3E8PhCT8fiR5RNvl
 o1Xz3bYF6pYpZ2yYkAudXBU9LeynM7g5gOtW6THnOXwNNc6UbusKsOfKuOjga/U9RorElmZho1GLz
 ww6FX+8CPfitfOsPgJMvJdNffPI3oymANlt83yiw5BgDJx9uHp2H3Nkcq9X4h/K+G+lg=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQ9RC-0005oL-G0 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 19:19:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by tor.source.kernel.org (Postfix) with ESMTP id E755060195
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  1 Dec 2025 19:19:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A7681C116C6;
 Mon,  1 Dec 2025 19:19:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764616788;
 bh=hLiZPx00tRWaVP/AA9DfLW8w9fvFgdJ/7VwS1ejjbNc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=t3I9vyYSRB2Ap/OdoeOwNfg/bFwkto2/sQ4mMFGbpeFFBK5l7AqXrc3U/BjB3g7GW
 a+LJk8jQPfq+//ojKRZxSmhSMkYVdVhUxPNQSPG8goZPnm0NYjQpqIeGW0ZbFWYSPa
 86OAPZR1UMd1kaoC8fViWo6k3XVz3g9z9BpKtPi6qAsRqiyMkqKQqsx5gTpLk85VQE
 h7aL6lIpZR08zRB42nPm/aDutjUIobYvjQrUiYmBHIVnumg4DjftlJXAIVXSu+0wxG
 l6YScH5QxW0mRxc8WXneKazp7w12nz60ErXHxbTvkhHRf0d0tI/955WWPcMHW3o7iW
 7++/UQqcIUlfA==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Mon,  1 Dec 2025 19:16:15 +0000
Message-ID: <20251201191940.883657-4-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201191940.883657-1-jaegeuk@kernel.org>
References: <20251201191940.883657-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch introduces a new address operation,
 a_ops->ra_folio_order(), 
 which proposes a new folio order based on the adjusted order for
 page_cache_sync_ra.
 Hence, each filesystem can set the desired minimum order of folio allocation
 when requesting fadvise(POSIX_FADV_WILLNEED). 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQ9RC-0005oL-G0
Subject: [f2fs-dev] [PATCH 3/4] mm/readahead: add a_ops->ra_folio_order to
 get a desired folio order
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch introduces a new address operation, a_ops->ra_folio_order(), which
proposes a new folio order based on the adjusted order for page_cache_sync_ra.

Hence, each filesystem can set the desired minimum order of folio allocation
when requesting fadvise(POSIX_FADV_WILLNEED).

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 include/linux/fs.h      |  4 ++++
 include/linux/pagemap.h | 12 ++++++++++++
 mm/readahead.c          |  6 ++++--
 3 files changed, 20 insertions(+), 2 deletions(-)

diff --git a/include/linux/fs.h b/include/linux/fs.h
index c895146c1444..ddab68b7e03b 100644
--- a/include/linux/fs.h
+++ b/include/linux/fs.h
@@ -472,6 +472,10 @@ struct address_space_operations {
 	void (*is_dirty_writeback) (struct folio *, bool *dirty, bool *wb);
 	int (*error_remove_folio)(struct address_space *, struct folio *);
 
+	/* Min folio order to allocate pages. */
+	unsigned int (*ra_folio_order)(struct address_space *mapping,
+			unsigned int order);
+
 	/* swapfile support */
 	int (*swap_activate)(struct swap_info_struct *sis, struct file *file,
 				sector_t *span);
diff --git a/include/linux/pagemap.h b/include/linux/pagemap.h
index 09b581c1d878..e1fe07477220 100644
--- a/include/linux/pagemap.h
+++ b/include/linux/pagemap.h
@@ -476,6 +476,18 @@ mapping_min_folio_order(const struct address_space *mapping)
 	return (mapping->flags & AS_FOLIO_ORDER_MIN_MASK) >> AS_FOLIO_ORDER_MIN;
 }
 
+static inline unsigned int
+mapping_ra_folio_order(struct address_space *mapping, unsigned int order)
+{
+	if (!IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE))
+		return 0;
+
+	if (!mapping->a_ops->ra_folio_order)
+		return order;
+
+	return mapping->a_ops->ra_folio_order(mapping, order);
+}
+
 static inline unsigned long
 mapping_min_folio_nrpages(const struct address_space *mapping)
 {
diff --git a/mm/readahead.c b/mm/readahead.c
index 5beaf7803554..8c7d08af6e00 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -592,8 +592,10 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 	 * A start of file, oversized read, or sequential cache miss:
 	 * trivial case: (index - prev_index) == 1
 	 * unaligned reads: (index - prev_index) == 0
+	 * if filesystem sets high-order allocation
 	 */
-	if (!index || req_count > max_pages || index - prev_index <= 1UL) {
+	if (!index || req_count > max_pages || index - prev_index <= 1UL ||
+	    mapping_ra_folio_order(ractl->mapping, 0)) {
 		ra->start = index;
 		ra->size = get_init_ra_size(req_count, max_pages);
 		ra->async_size = ra->size > req_count ? ra->size - req_count :
@@ -627,7 +629,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
 	ra->size = min(contig_count + req_count, max_pages);
 	ra->async_size = 1;
 readit:
-	ra->order = 0;
+	ra->order = mapping_ra_folio_order(ractl->mapping, 0);
 	ractl->_index = ra->start;
 	page_cache_ra_order(ractl, ra);
 }
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
