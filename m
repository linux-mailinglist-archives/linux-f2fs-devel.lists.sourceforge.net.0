Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4726216508D
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Feb 2020 22:01:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j4WTH-0002XS-2i; Wed, 19 Feb 2020 21:01:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <willy@infradead.org>) id 1j4WTF-0002Ve-AZ
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0plDwDk1qrRVYfteD+bNdGxMrdBat4pqPVYwNSP5AJk=; b=Wtk+ufJ+FfOPifTJSA7H+dHiN1
 W45lxGj2jpNJ7WsJGa2uPIiJd7kUaCXx5dF979SbLVI7/NapBF7mB7uL5FwRXZSttMxQW2vEJAXpK
 MBLMCg90t81dPF1TtX7bgxbeVT2/XeoEdL9k0s6RHjI3FmWjO6NAe02//S939qBSbfMM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0plDwDk1qrRVYfteD+bNdGxMrdBat4pqPVYwNSP5AJk=; b=TvHGM9ytx06ghFCauSMI18SxN0
 AZQxQyUR2vysul4GOCMBwqauW/xwVIcFA+G1pKPT49TjsmmgLG/5cME+Lni3UpOR7vTcdvp7Yzk+c
 GkhzdfABr/1ye5Q9I6MFfzxEMxvIax2rZWAccX0Ciwck1wxZAQPRFnCUlkjdhtqmSYE8=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j4WTE-000Gjs-2R
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 19 Feb 2020 21:01:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20170209; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=0plDwDk1qrRVYfteD+bNdGxMrdBat4pqPVYwNSP5AJk=; b=lpY8UU0a27DYgPHNCDbqbfFeBu
 j1zcJzrpWZV2gyZt1PaCbEW2Qv6LIii40DQ8lIy5HGw51I0MSbUNbKDx6lh4fwu2t9nVnfa31SRzT
 dWvP5iWSGdZYTrkJk1OQrh4+T7n9UZ4lp/vG7MOUNS7NG1zS9eRIoc/C5n0ZPYxxLtaD/T8r/R+ZF
 Wi1LokRB4GBbcL7remCQx7b+NQTeXraOEvy7/vC4oOo6pl52sKy2oEeue4OTNuwMjvymhX3YUYPGL
 A+ac+TBjloZDc4+HDMhwSo3g0OZeTykQW5cpL+lZPrPQjQ3e6cvD5AZq+p3ObD79LvOXe37mbSqiX
 GKe1Csrw==;
Received: from willy by bombadil.infradead.org with local (Exim 4.92.3 #3 (Red
 Hat Linux)) id 1j4WSu-0008TK-QN; Wed, 19 Feb 2020 21:01:04 +0000
From: Matthew Wilcox <willy@infradead.org>
To: linux-fsdevel@vger.kernel.org
Date: Wed, 19 Feb 2020 13:00:41 -0800
Message-Id: <20200219210103.32400-3-willy@infradead.org>
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
X-Headers-End: 1j4WTE-000Gjs-2R
Subject: [f2fs-dev] [PATCH v7 02/24] mm: Return void from various readahead
 functions
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
Cc: linux-xfs@vger.kernel.org, John Hubbard <jhubbard@nvidia.com>,
 linux-kernel@vger.kernel.org,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, cluster-devel@redhat.com,
 linux-mm@kvack.org, ocfs2-devel@oss.oracle.com,
 Dave Chinner <dchinner@redhat.com>, linux-ext4@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: "Matthew Wilcox (Oracle)" <willy@infradead.org>

ondemand_readahead has two callers, neither of which use the return value.
That means that both ra_submit and __do_page_cache_readahead() can return
void, and we don't need to worry that a present page in the readahead
window causes us to return a smaller nr_pages than we ought to have.

Similarly, no caller uses the return value from force_page_cache_readahead().

Signed-off-by: Matthew Wilcox (Oracle) <willy@infradead.org>
Reviewed-by: Dave Chinner <dchinner@redhat.com>
Reviewed-by: John Hubbard <jhubbard@nvidia.com>
---
 mm/fadvise.c   |  4 ----
 mm/internal.h  | 12 ++++++------
 mm/readahead.c | 31 +++++++++++++------------------
 3 files changed, 19 insertions(+), 28 deletions(-)

diff --git a/mm/fadvise.c b/mm/fadvise.c
index 3efebfb9952c..0e66f2aaeea3 100644
--- a/mm/fadvise.c
+++ b/mm/fadvise.c
@@ -104,10 +104,6 @@ int generic_fadvise(struct file *file, loff_t offset, loff_t len, int advice)
 		if (!nrpages)
 			nrpages = ~0UL;
 
-		/*
-		 * Ignore return value because fadvise() shall return
-		 * success even if filesystem can't retrieve a hint,
-		 */
 		force_page_cache_readahead(mapping, file, start_index, nrpages);
 		break;
 	case POSIX_FADV_NOREUSE:
diff --git a/mm/internal.h b/mm/internal.h
index 83f353e74654..15aaebebd768 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -49,20 +49,20 @@ void unmap_page_range(struct mmu_gather *tlb,
 			     unsigned long addr, unsigned long end,
 			     struct zap_details *details);
 
-int force_page_cache_readahead(struct address_space *, struct file *,
+void force_page_cache_readahead(struct address_space *, struct file *,
 		pgoff_t index, unsigned long nr_to_read);
-extern unsigned int __do_page_cache_readahead(struct address_space *mapping,
-		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
+void __do_page_cache_readahead(struct address_space *, struct file *,
+		pgoff_t index, unsigned long nr_to_read,
 		unsigned long lookahead_size);
 
 /*
  * Submit IO for the read-ahead request in file_ra_state.
  */
-static inline unsigned long ra_submit(struct file_ra_state *ra,
+static inline void ra_submit(struct file_ra_state *ra,
 		struct address_space *mapping, struct file *filp)
 {
-	return __do_page_cache_readahead(mapping, filp,
-					ra->start, ra->size, ra->async_size);
+	__do_page_cache_readahead(mapping, filp,
+			ra->start, ra->size, ra->async_size);
 }
 
 /*
diff --git a/mm/readahead.c b/mm/readahead.c
index 2fe72cd29b47..41a592886da7 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -149,10 +149,8 @@ static int read_pages(struct address_space *mapping, struct file *filp,
  * the pages first, then submits them for I/O. This avoids the very bad
  * behaviour which would occur if page allocations are causing VM writeback.
  * We really don't want to intermingle reads and writes like that.
- *
- * Returns the number of pages requested, or the maximum amount of I/O allowed.
  */
-unsigned int __do_page_cache_readahead(struct address_space *mapping,
+void __do_page_cache_readahead(struct address_space *mapping,
 		struct file *filp, pgoff_t offset, unsigned long nr_to_read,
 		unsigned long lookahead_size)
 {
@@ -166,7 +164,7 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
 	gfp_t gfp_mask = readahead_gfp_mask(mapping);
 
 	if (isize == 0)
-		goto out;
+		return;
 
 	end_index = ((isize - 1) >> PAGE_SHIFT);
 
@@ -211,23 +209,21 @@ unsigned int __do_page_cache_readahead(struct address_space *mapping,
 	if (nr_pages)
 		read_pages(mapping, filp, &page_pool, nr_pages, gfp_mask);
 	BUG_ON(!list_empty(&page_pool));
-out:
-	return nr_pages;
 }
 
 /*
  * Chunk the readahead into 2 megabyte units, so that we don't pin too much
  * memory at once.
  */
-int force_page_cache_readahead(struct address_space *mapping, struct file *filp,
-			       pgoff_t offset, unsigned long nr_to_read)
+void force_page_cache_readahead(struct address_space *mapping,
+		struct file *filp, pgoff_t offset, unsigned long nr_to_read)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
 	struct file_ra_state *ra = &filp->f_ra;
 	unsigned long max_pages;
 
 	if (unlikely(!mapping->a_ops->readpage && !mapping->a_ops->readpages))
-		return -EINVAL;
+		return;
 
 	/*
 	 * If the request exceeds the readahead window, allow the read to
@@ -245,7 +241,6 @@ int force_page_cache_readahead(struct address_space *mapping, struct file *filp,
 		offset += this_chunk;
 		nr_to_read -= this_chunk;
 	}
-	return 0;
 }
 
 /*
@@ -378,11 +373,10 @@ static int try_context_readahead(struct address_space *mapping,
 /*
  * A minimal readahead algorithm for trivial sequential/random reads.
  */
-static unsigned long
-ondemand_readahead(struct address_space *mapping,
-		   struct file_ra_state *ra, struct file *filp,
-		   bool hit_readahead_marker, pgoff_t offset,
-		   unsigned long req_size)
+static void ondemand_readahead(struct address_space *mapping,
+		struct file_ra_state *ra, struct file *filp,
+		bool hit_readahead_marker, pgoff_t offset,
+		unsigned long req_size)
 {
 	struct backing_dev_info *bdi = inode_to_bdi(mapping->host);
 	unsigned long max_pages = ra->ra_pages;
@@ -428,7 +422,7 @@ ondemand_readahead(struct address_space *mapping,
 		rcu_read_unlock();
 
 		if (!start || start - offset > max_pages)
-			return 0;
+			return;
 
 		ra->start = start;
 		ra->size = start - offset;	/* old async_size */
@@ -464,7 +458,8 @@ ondemand_readahead(struct address_space *mapping,
 	 * standalone, small random read
 	 * Read as is, and do not pollute the readahead state.
 	 */
-	return __do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+	__do_page_cache_readahead(mapping, filp, offset, req_size, 0);
+	return;
 
 initial_readahead:
 	ra->start = offset;
@@ -489,7 +484,7 @@ ondemand_readahead(struct address_space *mapping,
 		}
 	}
 
-	return ra_submit(ra, mapping, filp);
+	ra_submit(ra, mapping, filp);
 }
 
 /**
-- 
2.25.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
