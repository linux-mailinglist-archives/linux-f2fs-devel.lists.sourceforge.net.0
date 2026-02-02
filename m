Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qFiFFF0/gGlJ5QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DC4EC87BA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ItpbQ53rLKVtq9C3wsRbsqVbg85WFP2u6otlMo7GxF0=; b=K/Ie2DcZjshfYuvdNLMYYOPGmB
	YowoiVFuRRIidWNQCEfEEIixjDxj62oYzIS1ekJQGrhVwrZjViCxVvbxpsNHHpZJ6OY2yI9uc+cBW
	7dgw80CdF50NU49vhMpfuiF67YJuijU7+B39yBM+ZcxFywcIHJ9SiqP3pBho4/8nKSSY=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmn6o-0002qu-Kb;
	Mon, 02 Feb 2026 06:08:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1250474bd6e1e3d30609+8198+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vmn6m-0002qo-PH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c3k3Gwc9ZRSVczER0BPphb8Viyntpzl9iwL7l9oD3eA=; b=MYAMc8mizqg/aetomzdKrYIQEz
 h4xQOIrQEW/UI6FyEFPsNRboUEHfVdsXQ6suzQQQMr2LBUhqS66/Xqcv/SF9jJtAT21RC/pG7RqRe
 6YN1dEaLWQsw2GstsVokBa4iixB0er23Sg9WcJxCVhJpVVJw7yiKw/5TCZrTU/BMVnb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=c3k3Gwc9ZRSVczER0BPphb8Viyntpzl9iwL7l9oD3eA=; b=nE/PXAKy2wx6KVXOitxrrOkxWX
 SW1J2cqXU+4CY0Es+J7mT4mQ32A/sI4guBpbSfIXeAh8XBYLscuy25YWO5JKVwNJzZMfupOnn4Y4x
 dD+kdOfZnTdk6VmGeiaBzzTfF0tjNejZyGBw1AaDLwOYFa+q7B0F461rmGqZe0pzauRE=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmn6m-0007oz-Ag for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=c3k3Gwc9ZRSVczER0BPphb8Viyntpzl9iwL7l9oD3eA=; b=xNYEGZzMos/EePCVcAUn10byLj
 Cyxg2rz279L3rnpqpL/xOqmt8y8kpTV1GdbD9NVa1PdS6q3Vg4pZUZMaWbQ/zN/9po6BcSygreMJ6
 svvJMiyi/fMjzaihxLWQBYgPo+cusTsxvtO5CKKAqEjeL1eENye6vbEh/AI7qWLNZHhFg3bAnMIre
 ubcsar7OMYj0/+OXgy8LrgM+NSC4RySN6H0zldaYKzD2tksLXehS3Fi2I0s9OATJZrZXfexu0HKYQ
 JjnlppFCI22UsvoMI5ZHwnjzcVpyJvYOp2IzkCt9tfPN6fWHNrtHBCEZfsCdoINrHZ+P8sm4v5WSC
 gjbaaabA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vmn6X-00000004Ujb-2kox; Mon, 02 Feb 2026 06:08:10 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Feb 2026 07:06:31 +0100
Message-ID: <20260202060754.270269-3-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260202060754.270269-1-hch@lst.de>
References: <20260202060754.270269-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Require the invalidate_lock to be held over calls to
 page_cache_ra_unbounded
 instead of acquiring it in this function. This prepares for calling
 page_cache_ra_unbounded
 from ->readahead for fsverity read-ahead. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vmn6m-0007oz-Ag
Subject: [f2fs-dev] [PATCH 02/11] readahead: push invalidate_lock out of
 page_cache_ra_unbounded
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
Cc: fsverity@lists.linux.dev, Christian Brauner <brauner@kernel.org>,
 Theodore Ts'o <tytso@mit.edu>, Andrey Albershteyn <aalbersh@redhat.com>,
 Matthew Wilcox <willy@infradead.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Al Viro <viro@zeniv.linux.org.uk>,
 Jaegeuk Kim <jaegeuk@kernel.org>, David Sterba <dsterba@suse.com>,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.39 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_TWELVE(0.00)[14];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 9DC4EC87BA
X-Rspamd-Action: no action

Require the invalidate_lock to be held over calls to
page_cache_ra_unbounded instead of acquiring it in this function.

This prepares for calling page_cache_ra_unbounded from ->readahead for
fsverity read-ahead.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/f2fs/file.c        |  2 ++
 fs/verity/pagecache.c |  7 +++++--
 mm/readahead.c        | 13 ++++++++-----
 3 files changed, 15 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index da029fed4e5a..c9b9fcdd0cae 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4418,7 +4418,9 @@ static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
 	pgoff_t redirty_idx = page_idx;
 	int page_len = 0, ret = 0;
 
+	filemap_invalidate_lock_shared(mapping);
 	page_cache_ra_unbounded(&ractl, len, 0);
+	filemap_invalidate_unlock_shared(mapping);
 
 	do {
 		folio = read_cache_folio(mapping, page_idx, NULL, NULL);
diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
index 1a88decace53..8e0d6fde802f 100644
--- a/fs/verity/pagecache.c
+++ b/fs/verity/pagecache.c
@@ -26,10 +26,13 @@ struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index,
 	    (!IS_ERR(folio) && !folio_test_uptodate(folio))) {
 		DEFINE_READAHEAD(ractl, NULL, NULL, inode->i_mapping, index);
 
-		if (!IS_ERR(folio))
+		if (!IS_ERR(folio)) {
 			folio_put(folio);
-		else if (num_ra_pages > 1)
+		} else if (num_ra_pages > 1) {
+			filemap_invalidate_lock_shared(inode->i_mapping);
 			page_cache_ra_unbounded(&ractl, num_ra_pages, 0);
+			filemap_invalidate_unlock_shared(inode->i_mapping);
+		}
 		folio = read_mapping_folio(inode->i_mapping, index, NULL);
 	}
 	if (IS_ERR(folio))
diff --git a/mm/readahead.c b/mm/readahead.c
index b415c9969176..25f81124beb6 100644
--- a/mm/readahead.c
+++ b/mm/readahead.c
@@ -204,7 +204,8 @@ static struct folio *ractl_alloc_folio(struct readahead_control *ractl,
  * not the function you want to call.  Use page_cache_async_readahead()
  * or page_cache_sync_readahead() instead.
  *
- * Context: File is referenced by caller.  Mutexes may be held by caller.
+ * Context: File is referenced by caller, and ractl->mapping->invalidate_lock
+ * must be held by the caller in shared mode.  Mutexes may be held by caller.
  * May sleep, but will not reenter filesystem to reclaim memory.
  */
 void page_cache_ra_unbounded(struct readahead_control *ractl,
@@ -228,9 +229,10 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
 	 */
 	unsigned int nofs = memalloc_nofs_save();
 
+	lockdep_assert_held_read(&mapping->invalidate_lock);
+
 	trace_page_cache_ra_unbounded(mapping->host, index, nr_to_read,
 				      lookahead_size);
-	filemap_invalidate_lock_shared(mapping);
 	index = mapping_align_index(mapping, index);
 
 	/*
@@ -300,7 +302,6 @@ void page_cache_ra_unbounded(struct readahead_control *ractl,
 	 * will then handle the error.
 	 */
 	read_pages(ractl);
-	filemap_invalidate_unlock_shared(mapping);
 	memalloc_nofs_restore(nofs);
 }
 EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
@@ -314,9 +315,9 @@ EXPORT_SYMBOL_GPL(page_cache_ra_unbounded);
 static void do_page_cache_ra(struct readahead_control *ractl,
 		unsigned long nr_to_read, unsigned long lookahead_size)
 {
-	struct inode *inode = ractl->mapping->host;
+	struct address_space *mapping = ractl->mapping;
 	unsigned long index = readahead_index(ractl);
-	loff_t isize = i_size_read(inode);
+	loff_t isize = i_size_read(mapping->host);
 	pgoff_t end_index;	/* The last page we want to read */
 
 	if (isize == 0)
@@ -329,7 +330,9 @@ static void do_page_cache_ra(struct readahead_control *ractl,
 	if (nr_to_read > end_index - index)
 		nr_to_read = end_index - index + 1;
 
+	filemap_invalidate_lock_shared(mapping);
 	page_cache_ra_unbounded(ractl, nr_to_read, lookahead_size);
+	filemap_invalidate_unlock_shared(mapping);
 }
 
 /*
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
