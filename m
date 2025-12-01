Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A5E6C991F0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 01 Dec 2025 22:02:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=icJMUdIvcA/YPYHiX/9Sttmk9iDo9kajZfYU0rGqDtY=; b=Rvh9/O19W5r5uGUuTae6cyDqQY
	BvWBVCg9N5130Woco56IpvC21H9pxRkBmT0xYGbnXvT5tEKo5Uc69wABZLV1iCCYxhDiWP/3vjo/x
	CrcH6VzyMBSKOJiSpFVTHppt10Wg9ugwVe/bKsw7PUlmXgX45HX50QcvYTPX3RR+pRcE=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vQB28-0003Xi-4q;
	Mon, 01 Dec 2025 21:02:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1vQB26-0003XZ-0v
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:02:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dXCHX/vEyi2LagIxyejx0iZg20K612Kv4wKL/Gs/Vtk=; b=X2ltikda+Z8Psh5uOdtynrsMAR
 IIHzWzO2nRg7MHP4WYHFbUlJtHsaCSdtOG0Dyk1p83mr2a6kKszcZZmKD3wf5WKh513cJn/aadaDo
 u7/ZQaG5JNzNgzqYnVogyth2/osFwbGQEALxdyBk6nSn+2Ava6o+AmQs7zYwd3XEqM2A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dXCHX/vEyi2LagIxyejx0iZg20K612Kv4wKL/Gs/Vtk=; b=DgQsxI2Nm4W+6E/zeqY+MWTPIq
 rGzWnlp1pgmZuo5ipc694nI7N7PujJZC671PNQtALeHVGx/Vlrwg/bq8UTjg/nAzhqMn7gqTBqEfb
 MMogqsKTuDTX4COATE+JmyYijpG77g9QKDCeMPUNOPFGFwa0v6kt/S0n9sYV9k2yNQ5I=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vQB25-0001iM-AI for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Dec 2025 21:02:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 084CA443AD;
 Mon,  1 Dec 2025 21:02:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE767C4CEF1;
 Mon,  1 Dec 2025 21:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1764622919;
 bh=F8dsEH8LzOP5exYXTa3xg16NLIpugxfOznLwZuhVXug=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=f4YgigxadJvN2JMHsDU+R/BEtZ8bFGBGmBgXFIJPYiBvStYlK6M1cnXRFnegtigRu
 KUZiaTevjstN4jzw+2FZcBr56TnANRw/XzZtYQs621EuvKQF5QHPEDZZkXjwh9MhE1
 7eOh+UG1r6tY9FQfgiqtbUqV77zXc5OvXVH2wu4MlhxhBR9QXzJ8xL7E2DeTRz4E9l
 KgjY1RNz341yGIQm9+Yd7kIXgfpeA3winTyqz0YMZNdDxY21hUiDSPQqdu+VYvFPBx
 et4lbIvcnmeZVFRC3gJVGH3MzSG0xinYNzdQ4VZbRcy+ybLfo3ebh/AEz7u/8X0R7w
 QpmCBuWuG1cbw==
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-mm@kvack.org, Matthew Wilcox <willy@infradead.org>
Date: Mon,  1 Dec 2025 21:01:27 +0000
Message-ID: <20251201210152.909339-5-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.52.0.107.ga0afd4fd5b-goog
In-Reply-To: <20251201210152.909339-1-jaegeuk@kernel.org>
References: <20251201210152.909339-1-jaegeuk@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds a sysfs entry to change the folio order.
 Given
 ra_folio_order=9, we can see page_cache_ra_order getting order=9 when we
 submit readahead() as below. ==== folio_order=0 ==== f2fs_fadvise: dev = (252,
 16), ino = 14, i_size = 4294967296 offset:0, len:4294967296,
 advise:3 page_cache_sync_ra:
 dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_ [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vQB25-0001iM-AI
Subject: [f2fs-dev] [PATCH 4/4] f2fs: attach a_ops->ra_folio_order to
 allocate large folios for readahead
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

This patch adds a sysfs entry to change the folio order. Given ra_folio_order=9,
we can see page_cache_ra_order getting order=9 when we submit readahead() as
below.

==== folio_order=0 ====
 f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
 page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_size=0 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=0 order=0 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=2048 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=2048 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=4096 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=6144 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=6144 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=8192 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=8192 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=10240 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=10240 nr_to_read=2048 lookahead_size=0
 ...
 page_cache_ra_unbounded: dev=252:16 ino=e index=1042432 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=1044480 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=1044480 nr_to_read=2048 lookahead_size=0
 page_cache_sync_ra: dev=252:16 ino=e index=1046528 req_count=2048 order=0 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_unbounded: dev=252:16 ino=e index=1046528 nr_to_read=2048 lookahead_size=0

==== folio_order=9 ====
 f2fs_fadvise: dev = (252,16), ino = 14, i_size = 4294967296 offset:0, len:4294967296, advise:3
 page_cache_sync_ra: dev=252:16 ino=e index=0 req_count=2048 order=0 size=0 async_size=0 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=0 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=2048 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=2048 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=4096 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=4096 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=6144 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=6144 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=8192 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=8192 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=10240 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=10240 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=12288 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 ...
 page_cache_sync_ra: dev=252:16 ino=e index=1040384 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=1040384 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=1042432 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=1042432 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=1044480 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=1044480 order=9 size=2048 async_size=1024 ra_pages=2048
 page_cache_sync_ra: dev=252:16 ino=e index=1046528 req_count=2048 order=9 size=2048 async_size=1024 ra_pages=2048 mmap_miss=0 prev_pos=-1
 page_cache_ra_order: dev=252:16 ino=e index=1046528 order=9 size=2048 async_size=1024 ra_pages=2048

Cc: linux-mm@kvack.org
Cc: Matthew Wilcox (Oracle) <willy@infradead.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c  | 9 +++++++++
 fs/f2fs/f2fs.h  | 3 +++
 fs/f2fs/super.c | 1 +
 fs/f2fs/sysfs.c | 9 +++++++++
 4 files changed, 22 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7a4f0f2d60cf..addef5a1fdb1 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3995,6 +3995,14 @@ static bool f2fs_dirty_data_folio(struct address_space *mapping,
 	return false;
 }
 
+static unsigned int f2fs_ra_folio_order(struct address_space *mapping,
+				     unsigned int order)
+{
+	if (!mapping_large_folio_support(mapping))
+		return order;
+
+	return max(order, F2FS_M_SB(mapping)->ra_folio_order);
+}
 
 static sector_t f2fs_bmap_compress(struct inode *inode, sector_t block)
 {
@@ -4313,6 +4321,7 @@ const struct address_space_operations f2fs_dblock_aops = {
 	.dirty_folio	= f2fs_dirty_data_folio,
 	.migrate_folio	= filemap_migrate_folio,
 	.invalidate_folio = f2fs_invalidate_folio,
+	.ra_folio_order	= f2fs_ra_folio_order,
 	.release_folio	= f2fs_release_folio,
 	.bmap		= f2fs_bmap,
 	.swap_activate  = f2fs_swap_activate,
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d7600979218e..06f90d510a01 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1932,6 +1932,9 @@ struct f2fs_sb_info {
 	/* carve out reserved_blocks from total blocks */
 	bool carve_out;
 
+	/* enable large folio for readahead. */
+	unsigned int ra_folio_order;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ccb477086444..bae02ca96c1f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4287,6 +4287,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 			NAT_ENTRY_PER_BLOCK));
 	sbi->allocate_section_hint = le32_to_cpu(raw_super->section_count);
 	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
+	sbi->ra_folio_order = 0;
 	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
 	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
 	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index c42f4f979d13..2537a25986a6 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -906,6 +906,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "ra_folio_order")) {
+		if (t < 0 || t > MAX_PAGECACHE_ORDER)
+			return -EINVAL;
+		sbi->ra_folio_order = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1180,6 +1187,7 @@ F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
 F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
+F2FS_SBI_GENERAL_RW_ATTR(ra_folio_order);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
@@ -1422,6 +1430,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(reserved_pin_section),
 	ATTR_LIST(allocate_section_hint),
 	ATTR_LIST(allocate_section_policy),
+	ATTR_LIST(ra_folio_order),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.52.0.107.ga0afd4fd5b-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
