Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wEeiMnQS5mnUrAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 13:48:04 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 69AB142A10E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Apr 2026 13:48:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tsKghE+lS8FpmMedu0TJDa8B4WUuxBRfCjTWhYR9jTE=; b=CfabiggzbWKgQPtSBuMZ+KBmEB
	A/+6dsQile5kJCw8ZF/Pq0FNqUC7P1O3uT7CTtpjrtdJg06c6nXCfuCvv7nw7H5nSNkvX67Hp6Oza
	apu7FvXS26dtY1hMmn2F9Fn1wzpn+cC81c5mPB9drVBRGJ1bOo7isno3IfoHVwuOP/0I=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wEn6h-00014A-3C;
	Mon, 20 Apr 2026 11:48:03 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wEn6e-00013m-U2
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 11:48:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=f7IHxWQpkPA2/qLRHVWoyq7+c0bPN2ca23hVV4DXnjk=; b=O8TP7AaKTKRXFYJxcL78dZM/hw
 LhtX8ugvadfBqLFAtZmZfDb3NbAho6QYHV18MVPEkW3NOmJsk/gQqtpqFncfRMSe+yMjYDhn+XKs9
 ZIqsxbXOQ3hO/T8t4X30ujYVN4J8vDPtV7iGMwWbHCOGqEaOR3/0UrNNevqsrxn0F0Wg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=f7IHxWQpkPA2/qLRHVWoyq7+c0bPN2ca23hVV4DXnjk=; b=gCsblTiWWAwHtAuLOhBCAb3R9T
 APPtQDvThoD8k67N27z0zc5EvtAXDrkIF8t734uy03NWppnIZIsth5Idv0B/dvJ9fOsjh/uk03+9r
 PNU/ft31O5Bmwgw+OhwTT/cVrmxzSZ5j255bi+fofQGLzt2aJpU5RG4KxPpO9GtfcEWY=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wEn6c-0007Dx-GC for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Apr 2026 11:47:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 3AD9544557;
 Mon, 20 Apr 2026 11:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0543C2BCB6;
 Mon, 20 Apr 2026 11:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1776685673;
 bh=z/3roTCD1Ne1/qpsmQCo6JII54WvnylPhblXVUf/ZIA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=c5N/UzbG2GzRXDMmN6s2o+86u0pUhHcZh1Lkyrdfl15Mvewz7zLcMxAusZ4QqDmZx
 /Ny1xh/UDvP1/hVbuknwrpdxEfnZBjJGFt02Rc/pe/N+Sj1d3xFKZ4p55ty7nExHQ7
 7nZYjOgCmz6x6w4nhQHIWql8APqPhLC8uSWOEDqPLuq/k01HR5uU4i1FZNsK1bscDb
 dwxfxSVWZsEKarje3RMPghwcF7eMeTV8vLf73yB4hPqf+zzawhoDUFZx258QloKRED
 FeQpEAKoMUi/4fBl7mYWmsibm9560SASgaM1pzbR99lxuLqMxlq0NnSctYM/oNR5Rc
 TGbiKgB2dOfZA==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Mon, 20 Apr 2026 13:46:53 +0200
Message-ID: <20260420114714.1621982-7-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260420114714.1621982-1-aalbersh@kernel.org>
References: <20260420114714.1621982-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This is the same function to read from pageache. XFS will
 also need this,
 so move this to core fsverity. Note that f2fs and ext4 functions
 diverged a bit, as ext4 operated over folios and f2fs operated over pages.
 The common one will operate over folios. 
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
X-Headers-End: 1wEn6c-0007Dx-GC
Subject: [f2fs-dev] [PATCH v8 06/22] fsverity: hoist pagecache_read from
 f2fs/ext4 to fsverity
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lst.de:email]
X-Rspamd-Queue-Id: 69AB142A10E
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

This is the same function to read from pageache. XFS will also need
this, so move this to core fsverity.

Note that f2fs and ext4 functions diverged a bit, as ext4 operated over
folios and f2fs operated over pages. The common one will operate over
folios.

Reviewed-by: Darrick J. Wong <djwong@kernel.org>
Reviewed-by: Christoph Hellwig <hch@lst.de>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/ext4/verity.c         | 32 +++-----------------------------
 fs/f2fs/verity.c         | 30 +-----------------------------
 fs/verity/pagecache.c    | 33 +++++++++++++++++++++++++++++++++
 include/linux/fsverity.h |  2 ++
 4 files changed, 39 insertions(+), 58 deletions(-)

diff --git a/fs/ext4/verity.c b/fs/ext4/verity.c
index 347945ac23a4..ac5c133f5529 100644
--- a/fs/ext4/verity.c
+++ b/fs/ext4/verity.c
@@ -34,32 +34,6 @@ static inline loff_t ext4_verity_metadata_pos(const struct inode *inode)
 	return round_up(inode->i_size, 65536);
 }
 
-/*
- * Read some verity metadata from the inode.  __vfs_read() can't be used because
- * we need to read beyond i_size.
- */
-static int pagecache_read(struct inode *inode, void *buf, size_t count,
-			  loff_t pos)
-{
-	while (count) {
-		struct folio *folio;
-		size_t n;
-
-		folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT,
-					 NULL);
-		if (IS_ERR(folio))
-			return PTR_ERR(folio);
-
-		n = memcpy_from_file_folio(buf, folio, pos, count);
-		folio_put(folio);
-
-		buf += n;
-		pos += n;
-		count -= n;
-	}
-	return 0;
-}
-
 /*
  * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
  * kernel_write() can't be used because the file descriptor is readonly.
@@ -311,8 +285,8 @@ static int ext4_get_verity_descriptor_location(struct inode *inode,
 		goto bad;
 	desc_size_pos -= sizeof(desc_size_disk);
 
-	err = pagecache_read(inode, &desc_size_disk, sizeof(desc_size_disk),
-			     desc_size_pos);
+	err = fsverity_pagecache_read(inode, &desc_size_disk,
+				      sizeof(desc_size_disk), desc_size_pos);
 	if (err)
 		return err;
 	desc_size = le32_to_cpu(desc_size_disk);
@@ -352,7 +326,7 @@ static int ext4_get_verity_descriptor(struct inode *inode, void *buf,
 	if (buf_size) {
 		if (desc_size > buf_size)
 			return -ERANGE;
-		err = pagecache_read(inode, buf, desc_size, desc_pos);
+		err = fsverity_pagecache_read(inode, buf, desc_size, desc_pos);
 		if (err)
 			return err;
 	}
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index b3b3e71604ac..5ea0a9b40443 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -36,34 +36,6 @@ static inline loff_t f2fs_verity_metadata_pos(const struct inode *inode)
 	return round_up(inode->i_size, 65536);
 }
 
-/*
- * Read some verity metadata from the inode.  __vfs_read() can't be used because
- * we need to read beyond i_size.
- */
-static int pagecache_read(struct inode *inode, void *buf, size_t count,
-			  loff_t pos)
-{
-	while (count) {
-		size_t n = min_t(size_t, count,
-				 PAGE_SIZE - offset_in_page(pos));
-		struct page *page;
-
-		page = read_mapping_page(inode->i_mapping, pos >> PAGE_SHIFT,
-					 NULL);
-		if (IS_ERR(page))
-			return PTR_ERR(page);
-
-		memcpy_from_page(buf, page, offset_in_page(pos), n);
-
-		put_page(page);
-
-		buf += n;
-		pos += n;
-		count -= n;
-	}
-	return 0;
-}
-
 /*
  * Write some verity metadata to the inode for FS_IOC_ENABLE_VERITY.
  * kernel_write() can't be used because the file descriptor is readonly.
@@ -248,7 +220,7 @@ static int f2fs_get_verity_descriptor(struct inode *inode, void *buf,
 	if (buf_size) {
 		if (size > buf_size)
 			return -ERANGE;
-		res = pagecache_read(inode, buf, size, pos);
+		res = fsverity_pagecache_read(inode, buf, size, pos);
 		if (res)
 			return res;
 	}
diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
index 99f5f53eea98..9d82e6b74ba1 100644
--- a/fs/verity/pagecache.c
+++ b/fs/verity/pagecache.c
@@ -78,3 +78,36 @@ void fsverity_fill_zerohash(struct folio *folio, size_t offset, size_t len,
 				vi->tree_params.digest_size);
 }
 EXPORT_SYMBOL_GPL(fsverity_fill_zerohash);
+
+/**
+ * fsverity_pagecache_read() - read page and copy data to buffer
+ * @inode:	copy from this inode's address space
+ * @buf:	buffer to copy to
+ * @count:	number of bytes to copy
+ * @pos:	position of the folio to copy from
+ *
+ * Read some verity metadata from the inode.  __vfs_read() can't be used because
+ * we need to read beyond i_size.
+ */
+int fsverity_pagecache_read(struct inode *inode, void *buf, size_t count,
+			  loff_t pos)
+{
+	while (count) {
+		struct folio *folio;
+		size_t n;
+
+		folio = read_mapping_folio(inode->i_mapping, pos >> PAGE_SHIFT,
+					 NULL);
+		if (IS_ERR(folio))
+			return PTR_ERR(folio);
+
+		n = memcpy_from_file_folio(buf, folio, pos, count);
+		folio_put(folio);
+
+		buf += n;
+		pos += n;
+		count -= n;
+	}
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsverity_pagecache_read);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index a5645ec07aa8..a2ae5cc649ad 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -328,5 +328,7 @@ void fsverity_cleanup_inode(struct inode *inode);
 struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
 void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 				   unsigned long nr_pages);
+int fsverity_pagecache_read(struct inode *inode, void *buf, size_t count,
+			    loff_t pos);
 
 #endif	/* _LINUX_FSVERITY_H */
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
