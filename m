Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97A26289326
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  9 Oct 2020 21:52:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kQyRE-0006Ct-CV; Fri, 09 Oct 2020 19:52:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ira.weiny@intel.com>)
 id 1kQyR9-0006Bb-87; Fri, 09 Oct 2020 19:52:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dknWcm7c825gFo6AiPtKV1AeuwXGqKan4NTnElau3io=; b=bTW4WxyL8gaB+TzZtpYqNKdBn2
 xX/KNMRJqW5o4lB6bdHNa7/fEmPvv70741dJ1VbjRwSYzOjKII6X0JMtJWav0eEBK+koHCd3lsFWJ
 vhPsMRFHXR1rUz+qN/8hsxtsCiuVt+jLmOF2n96ZkvaOY23G+hbVSV+/3ilM6jJ6Fwu0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dknWcm7c825gFo6AiPtKV1AeuwXGqKan4NTnElau3io=; b=jnYY/83oZUaENUaQ+3deCSA2Xo
 NGZh9eG1dh1SB9q0RxIRgKOcH1Skpi0cKOYB96yPvvcu5ipM/M3VEKl/GPrJtOan4QD+BqTMmkUfB
 AiONSlb+4FP0YA5bKxa09iUg1KwXqDka761qXB4rGdZdUQh3RVLMuOMv4fPfh6tMEYh8=;
Received: from mga17.intel.com ([192.55.52.151])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kQyR3-004aNW-E7; Fri, 09 Oct 2020 19:52:19 +0000
IronPort-SDR: +6BJ2OtWxcZaCuEq2SCG7DlaZ3RwXHICf6uV48nmdrK/G2zCREjzDctWs1ZZsHAiFSlLswmZ3h
 84clt56gBe8g==
X-IronPort-AV: E=McAfee;i="6000,8403,9769"; a="145397366"
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="145397366"
X-Amp-Result: SKIPPED(no attachment in message)
X-Amp-File-Uploaded: False
Received: from orsmga005.jf.intel.com ([10.7.209.41])
 by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:55 -0700
IronPort-SDR: vmw0BK7OYY8h0fZsnTgtJRpvmXsWJvpJiZ/O3ONyZujh0oi54UYOLunW4B1xesRkeTs3uxMx1d
 pOHAzA+ZEWzg==
X-IronPort-AV: E=Sophos;i="5.77,355,1596524400"; d="scan'208";a="529053305"
Received: from iweiny-desk2.sc.intel.com (HELO localhost) ([10.3.52.147])
 by orsmga005-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384;
 09 Oct 2020 12:51:54 -0700
From: ira.weiny@intel.com
To: Andrew Morton <akpm@linux-foundation.org>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Andy Lutomirski <luto@kernel.org>,
 Peter Zijlstra <peterz@infradead.org>
Date: Fri,  9 Oct 2020 12:49:54 -0700
Message-Id: <20201009195033.3208459-20-ira.weiny@intel.com>
X-Mailer: git-send-email 2.28.0.rc0.12.gb6a658bd00c9
In-Reply-To: <20201009195033.3208459-1-ira.weiny@intel.com>
References: <20201009195033.3208459-1-ira.weiny@intel.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kQyR3-004aNW-E7
Subject: [f2fs-dev] [PATCH RFC PKS/PMEM 19/58] fs/hfsplus: Utilize new
 kmap_thread()
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
Cc: linux-aio@kvack.org, linux-efi@vger.kernel.org, kvm@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-mmc@vger.kernel.org,
 Dave Hansen <dave.hansen@linux.intel.com>, dri-devel@lists.freedesktop.org,
 linux-mm@kvack.org, target-devel@vger.kernel.org,
 linux-mtd@lists.infradead.org, linux-kselftest@vger.kernel.org,
 samba-technical@lists.samba.org, Ira Weiny <ira.weiny@intel.com>,
 ceph-devel@vger.kernel.org, drbd-dev@lists.linbit.com,
 devel@driverdev.osuosl.org, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, linux-scsi@vger.kernel.org,
 linux-nvdimm@lists.01.org, linux-rdma@vger.kernel.org, x86@kernel.org,
 amd-gfx@lists.freedesktop.org, linux-afs@lists.infradead.org,
 cluster-devel@redhat.com, linux-cachefs@redhat.com,
 intel-wired-lan@lists.osuosl.org, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>,
 linux-um@lists.infradead.org, intel-gfx@lists.freedesktop.org,
 ecryptfs@vger.kernel.org, linux-erofs@lists.ozlabs.org,
 reiserfs-devel@vger.kernel.org, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, Dan Williams <dan.j.williams@intel.com>,
 io-uring@vger.kernel.org, linux-nfs@vger.kernel.org,
 linux-ntfs-dev@lists.sourceforge.net, netdev@vger.kernel.org,
 kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 bpf@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Ira Weiny <ira.weiny@intel.com>

The kmap() calls in this FS are localized to a single thread.  To avoid
the over head of global PKRS updates use the new kmap_thread() call.

Signed-off-by: Ira Weiny <ira.weiny@intel.com>
---
 fs/hfsplus/bitmap.c |  20 ++++-----
 fs/hfsplus/bnode.c  | 102 ++++++++++++++++++++++----------------------
 fs/hfsplus/btree.c  |  18 ++++----
 3 files changed, 70 insertions(+), 70 deletions(-)

diff --git a/fs/hfsplus/bitmap.c b/fs/hfsplus/bitmap.c
index cebce0cfe340..9ec7c1559a0c 100644
--- a/fs/hfsplus/bitmap.c
+++ b/fs/hfsplus/bitmap.c
@@ -39,7 +39,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 		start = size;
 		goto out;
 	}
-	pptr = kmap(page);
+	pptr = kmap_thread(page);
 	curr = pptr + (offset & (PAGE_CACHE_BITS - 1)) / 32;
 	i = offset % 32;
 	offset &= ~(PAGE_CACHE_BITS - 1);
@@ -74,7 +74,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			}
 			curr++;
 		}
-		kunmap(page);
+		kunmap_thread(page);
 		offset += PAGE_CACHE_BITS;
 		if (offset >= size)
 			break;
@@ -84,7 +84,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			start = size;
 			goto out;
 		}
-		curr = pptr = kmap(page);
+		curr = pptr = kmap_thread(page);
 		if ((size ^ offset) / PAGE_CACHE_BITS)
 			end = pptr + PAGE_CACHE_BITS / 32;
 		else
@@ -127,7 +127,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			len -= 32;
 		}
 		set_page_dirty(page);
-		kunmap(page);
+		kunmap_thread(page);
 		offset += PAGE_CACHE_BITS;
 		page = read_mapping_page(mapping, offset / PAGE_CACHE_BITS,
 					 NULL);
@@ -135,7 +135,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 			start = size;
 			goto out;
 		}
-		pptr = kmap(page);
+		pptr = kmap_thread(page);
 		curr = pptr;
 		end = pptr + PAGE_CACHE_BITS / 32;
 	}
@@ -151,7 +151,7 @@ int hfsplus_block_allocate(struct super_block *sb, u32 size,
 done:
 	*curr = cpu_to_be32(n);
 	set_page_dirty(page);
-	kunmap(page);
+	kunmap_thread(page);
 	*max = offset + (curr - pptr) * 32 + i - start;
 	sbi->free_blocks -= *max;
 	hfsplus_mark_mdb_dirty(sb);
@@ -185,7 +185,7 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count)
 	page = read_mapping_page(mapping, pnr, NULL);
 	if (IS_ERR(page))
 		goto kaboom;
-	pptr = kmap(page);
+	pptr = kmap_thread(page);
 	curr = pptr + (offset & (PAGE_CACHE_BITS - 1)) / 32;
 	end = pptr + PAGE_CACHE_BITS / 32;
 	len = count;
@@ -215,11 +215,11 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count)
 		if (!count)
 			break;
 		set_page_dirty(page);
-		kunmap(page);
+		kunmap_thread(page);
 		page = read_mapping_page(mapping, ++pnr, NULL);
 		if (IS_ERR(page))
 			goto kaboom;
-		pptr = kmap(page);
+		pptr = kmap_thread(page);
 		curr = pptr;
 		end = pptr + PAGE_CACHE_BITS / 32;
 	}
@@ -231,7 +231,7 @@ int hfsplus_block_free(struct super_block *sb, u32 offset, u32 count)
 	}
 out:
 	set_page_dirty(page);
-	kunmap(page);
+	kunmap_thread(page);
 	sbi->free_blocks += len;
 	hfsplus_mark_mdb_dirty(sb);
 	mutex_unlock(&sbi->alloc_mutex);
diff --git a/fs/hfsplus/bnode.c b/fs/hfsplus/bnode.c
index 177fae4e6581..62757d92fbbd 100644
--- a/fs/hfsplus/bnode.c
+++ b/fs/hfsplus/bnode.c
@@ -29,14 +29,14 @@ void hfs_bnode_read(struct hfs_bnode *node, void *buf, int off, int len)
 	off &= ~PAGE_MASK;
 
 	l = min_t(int, len, PAGE_SIZE - off);
-	memcpy(buf, kmap(*pagep) + off, l);
-	kunmap(*pagep);
+	memcpy(buf, kmap_thread(*pagep) + off, l);
+	kunmap_thread(*pagep);
 
 	while ((len -= l) != 0) {
 		buf += l;
 		l = min_t(int, len, PAGE_SIZE);
-		memcpy(buf, kmap(*++pagep), l);
-		kunmap(*pagep);
+		memcpy(buf, kmap_thread(*++pagep), l);
+		kunmap_thread(*pagep);
 	}
 }
 
@@ -82,16 +82,16 @@ void hfs_bnode_write(struct hfs_bnode *node, void *buf, int off, int len)
 	off &= ~PAGE_MASK;
 
 	l = min_t(int, len, PAGE_SIZE - off);
-	memcpy(kmap(*pagep) + off, buf, l);
+	memcpy(kmap_thread(*pagep) + off, buf, l);
 	set_page_dirty(*pagep);
-	kunmap(*pagep);
+	kunmap_thread(*pagep);
 
 	while ((len -= l) != 0) {
 		buf += l;
 		l = min_t(int, len, PAGE_SIZE);
-		memcpy(kmap(*++pagep), buf, l);
+		memcpy(kmap_thread(*++pagep), buf, l);
 		set_page_dirty(*pagep);
-		kunmap(*pagep);
+		kunmap_thread(*pagep);
 	}
 }
 
@@ -112,15 +112,15 @@ void hfs_bnode_clear(struct hfs_bnode *node, int off, int len)
 	off &= ~PAGE_MASK;
 
 	l = min_t(int, len, PAGE_SIZE - off);
-	memset(kmap(*pagep) + off, 0, l);
+	memset(kmap_thread(*pagep) + off, 0, l);
 	set_page_dirty(*pagep);
-	kunmap(*pagep);
+	kunmap_thread(*pagep);
 
 	while ((len -= l) != 0) {
 		l = min_t(int, len, PAGE_SIZE);
-		memset(kmap(*++pagep), 0, l);
+		memset(kmap_thread(*++pagep), 0, l);
 		set_page_dirty(*pagep);
-		kunmap(*pagep);
+		kunmap_thread(*pagep);
 	}
 }
 
@@ -142,24 +142,24 @@ void hfs_bnode_copy(struct hfs_bnode *dst_node, int dst,
 
 	if (src == dst) {
 		l = min_t(int, len, PAGE_SIZE - src);
-		memcpy(kmap(*dst_page) + src, kmap(*src_page) + src, l);
-		kunmap(*src_page);
+		memcpy(kmap_thread(*dst_page) + src, kmap_thread(*src_page) + src, l);
+		kunmap_thread(*src_page);
 		set_page_dirty(*dst_page);
-		kunmap(*dst_page);
+		kunmap_thread(*dst_page);
 
 		while ((len -= l) != 0) {
 			l = min_t(int, len, PAGE_SIZE);
-			memcpy(kmap(*++dst_page), kmap(*++src_page), l);
-			kunmap(*src_page);
+			memcpy(kmap_thread(*++dst_page), kmap_thread(*++src_page), l);
+			kunmap_thread(*src_page);
 			set_page_dirty(*dst_page);
-			kunmap(*dst_page);
+			kunmap_thread(*dst_page);
 		}
 	} else {
 		void *src_ptr, *dst_ptr;
 
 		do {
-			src_ptr = kmap(*src_page) + src;
-			dst_ptr = kmap(*dst_page) + dst;
+			src_ptr = kmap_thread(*src_page) + src;
+			dst_ptr = kmap_thread(*dst_page) + dst;
 			if (PAGE_SIZE - src < PAGE_SIZE - dst) {
 				l = PAGE_SIZE - src;
 				src = 0;
@@ -171,9 +171,9 @@ void hfs_bnode_copy(struct hfs_bnode *dst_node, int dst,
 			}
 			l = min(len, l);
 			memcpy(dst_ptr, src_ptr, l);
-			kunmap(*src_page);
+			kunmap_thread(*src_page);
 			set_page_dirty(*dst_page);
-			kunmap(*dst_page);
+			kunmap_thread(*dst_page);
 			if (!dst)
 				dst_page++;
 			else
@@ -202,27 +202,27 @@ void hfs_bnode_move(struct hfs_bnode *node, int dst, int src, int len)
 
 		if (src == dst) {
 			while (src < len) {
-				memmove(kmap(*dst_page), kmap(*src_page), src);
-				kunmap(*src_page);
+				memmove(kmap_thread(*dst_page), kmap_thread(*src_page), src);
+				kunmap_thread(*src_page);
 				set_page_dirty(*dst_page);
-				kunmap(*dst_page);
+				kunmap_thread(*dst_page);
 				len -= src;
 				src = PAGE_SIZE;
 				src_page--;
 				dst_page--;
 			}
 			src -= len;
-			memmove(kmap(*dst_page) + src,
-				kmap(*src_page) + src, len);
-			kunmap(*src_page);
+			memmove(kmap_thread(*dst_page) + src,
+				kmap_thread(*src_page) + src, len);
+			kunmap_thread(*src_page);
 			set_page_dirty(*dst_page);
-			kunmap(*dst_page);
+			kunmap_thread(*dst_page);
 		} else {
 			void *src_ptr, *dst_ptr;
 
 			do {
-				src_ptr = kmap(*src_page) + src;
-				dst_ptr = kmap(*dst_page) + dst;
+				src_ptr = kmap_thread(*src_page) + src;
+				dst_ptr = kmap_thread(*dst_page) + dst;
 				if (src < dst) {
 					l = src;
 					src = PAGE_SIZE;
@@ -234,9 +234,9 @@ void hfs_bnode_move(struct hfs_bnode *node, int dst, int src, int len)
 				}
 				l = min(len, l);
 				memmove(dst_ptr - l, src_ptr - l, l);
-				kunmap(*src_page);
+				kunmap_thread(*src_page);
 				set_page_dirty(*dst_page);
-				kunmap(*dst_page);
+				kunmap_thread(*dst_page);
 				if (dst == PAGE_SIZE)
 					dst_page--;
 				else
@@ -251,26 +251,26 @@ void hfs_bnode_move(struct hfs_bnode *node, int dst, int src, int len)
 
 		if (src == dst) {
 			l = min_t(int, len, PAGE_SIZE - src);
-			memmove(kmap(*dst_page) + src,
-				kmap(*src_page) + src, l);
-			kunmap(*src_page);
+			memmove(kmap_thread(*dst_page) + src,
+				kmap_thread(*src_page) + src, l);
+			kunmap_thread(*src_page);
 			set_page_dirty(*dst_page);
-			kunmap(*dst_page);
+			kunmap_thread(*dst_page);
 
 			while ((len -= l) != 0) {
 				l = min_t(int, len, PAGE_SIZE);
-				memmove(kmap(*++dst_page),
-					kmap(*++src_page), l);
-				kunmap(*src_page);
+				memmove(kmap_thread(*++dst_page),
+					kmap_thread(*++src_page), l);
+				kunmap_thread(*src_page);
 				set_page_dirty(*dst_page);
-				kunmap(*dst_page);
+				kunmap_thread(*dst_page);
 			}
 		} else {
 			void *src_ptr, *dst_ptr;
 
 			do {
-				src_ptr = kmap(*src_page) + src;
-				dst_ptr = kmap(*dst_page) + dst;
+				src_ptr = kmap_thread(*src_page) + src;
+				dst_ptr = kmap_thread(*dst_page) + dst;
 				if (PAGE_SIZE - src <
 						PAGE_SIZE - dst) {
 					l = PAGE_SIZE - src;
@@ -283,9 +283,9 @@ void hfs_bnode_move(struct hfs_bnode *node, int dst, int src, int len)
 				}
 				l = min(len, l);
 				memmove(dst_ptr, src_ptr, l);
-				kunmap(*src_page);
+				kunmap_thread(*src_page);
 				set_page_dirty(*dst_page);
-				kunmap(*dst_page);
+				kunmap_thread(*dst_page);
 				if (!dst)
 					dst_page++;
 				else
@@ -502,14 +502,14 @@ struct hfs_bnode *hfs_bnode_find(struct hfs_btree *tree, u32 num)
 	if (!test_bit(HFS_BNODE_NEW, &node->flags))
 		return node;
 
-	desc = (struct hfs_bnode_desc *)(kmap(node->page[0]) +
+	desc = (struct hfs_bnode_desc *)(kmap_thread(node->page[0]) +
 			node->page_offset);
 	node->prev = be32_to_cpu(desc->prev);
 	node->next = be32_to_cpu(desc->next);
 	node->num_recs = be16_to_cpu(desc->num_recs);
 	node->type = desc->type;
 	node->height = desc->height;
-	kunmap(node->page[0]);
+	kunmap_thread(node->page[0]);
 
 	switch (node->type) {
 	case HFS_NODE_HEADER:
@@ -593,14 +593,14 @@ struct hfs_bnode *hfs_bnode_create(struct hfs_btree *tree, u32 num)
 	}
 
 	pagep = node->page;
-	memset(kmap(*pagep) + node->page_offset, 0,
+	memset(kmap_thread(*pagep) + node->page_offset, 0,
 	       min_t(int, PAGE_SIZE, tree->node_size));
 	set_page_dirty(*pagep);
-	kunmap(*pagep);
+	kunmap_thread(*pagep);
 	for (i = 1; i < tree->pages_per_bnode; i++) {
-		memset(kmap(*++pagep), 0, PAGE_SIZE);
+		memset(kmap_thread(*++pagep), 0, PAGE_SIZE);
 		set_page_dirty(*pagep);
-		kunmap(*pagep);
+		kunmap_thread(*pagep);
 	}
 	clear_bit(HFS_BNODE_NEW, &node->flags);
 	wake_up(&node->lock_wq);
diff --git a/fs/hfsplus/btree.c b/fs/hfsplus/btree.c
index 66774f4cb4fd..74fcef3a1628 100644
--- a/fs/hfsplus/btree.c
+++ b/fs/hfsplus/btree.c
@@ -394,7 +394,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 
 	off += node->page_offset;
 	pagep = node->page + (off >> PAGE_SHIFT);
-	data = kmap(*pagep);
+	data = kmap_thread(*pagep);
 	off &= ~PAGE_MASK;
 	idx = 0;
 
@@ -407,7 +407,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 						idx += i;
 						data[off] |= m;
 						set_page_dirty(*pagep);
-						kunmap(*pagep);
+						kunmap_thread(*pagep);
 						tree->free_nodes--;
 						mark_inode_dirty(tree->inode);
 						hfs_bnode_put(node);
@@ -417,14 +417,14 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 				}
 			}
 			if (++off >= PAGE_SIZE) {
-				kunmap(*pagep);
-				data = kmap(*++pagep);
+				kunmap_thread(*pagep);
+				data = kmap_thread(*++pagep);
 				off = 0;
 			}
 			idx += 8;
 			len--;
 		}
-		kunmap(*pagep);
+		kunmap_thread(*pagep);
 		nidx = node->next;
 		if (!nidx) {
 			hfs_dbg(BNODE_MOD, "create new bmap node\n");
@@ -440,7 +440,7 @@ struct hfs_bnode *hfs_bmap_alloc(struct hfs_btree *tree)
 		off = off16;
 		off += node->page_offset;
 		pagep = node->page + (off >> PAGE_SHIFT);
-		data = kmap(*pagep);
+		data = kmap_thread(*pagep);
 		off &= ~PAGE_MASK;
 	}
 }
@@ -490,7 +490,7 @@ void hfs_bmap_free(struct hfs_bnode *node)
 	}
 	off += node->page_offset + nidx / 8;
 	page = node->page[off >> PAGE_SHIFT];
-	data = kmap(page);
+	data = kmap_thread(page);
 	off &= ~PAGE_MASK;
 	m = 1 << (~nidx & 7);
 	byte = data[off];
@@ -498,13 +498,13 @@ void hfs_bmap_free(struct hfs_bnode *node)
 		pr_crit("trying to free free bnode "
 				"%u(%d)\n",
 			node->this, node->type);
-		kunmap(page);
+		kunmap_thread(page);
 		hfs_bnode_put(node);
 		return;
 	}
 	data[off] = byte & ~m;
 	set_page_dirty(page);
-	kunmap(page);
+	kunmap_thread(page);
 	hfs_bnode_put(node);
 	tree->free_nodes++;
 	mark_inode_dirty(tree->inode);
-- 
2.28.0.rc0.12.gb6a658bd00c9



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
