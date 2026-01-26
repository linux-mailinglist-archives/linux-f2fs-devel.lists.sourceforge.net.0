Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id COyRKWnzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:54:01 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 27CCB84053
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:54:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4Hez8yI5ISG5VDZeta0gsbpFqGxCKicAigEcHFtHDUo=; b=gOBdGHsEIodbYtru/JaJqu9I+5
	Yqm4SVaw/EIznbxdeykLWtpqDTPk3dWqppo7QUPkH948kVeC3S81yam5jJrsrvZz1FuUDjbUM+wqk
	+u61fcbGesUrwcW9VntoHy6W/11nVWF95ixh6AmOd7gkQkJvs6zVqC5jjk1ERY7MyEzU=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEbv-00020t-Rl;
	Mon, 26 Jan 2026 04:53:59 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEbu-00020i-7G for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x48TEdQsxZZuA/CWxR+pNtRwH5mvhXrSqa0LhyQ85U0=; b=cFW3L2YuA/BU6tmbOFzd3v3c+X
 LVntt7pZ+i0W2szk7zUkF1Yh8IGwGP5StXtSOxwIBSxgBjTihP89EPPH3tdaGHdagYgbqpUD14xV1
 AnM2THAzg31zL/fsJhktnns9c5A12a61ZwyFBOcKdZGsEEy9hrOeZC3pMvEf1uuiqZo4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x48TEdQsxZZuA/CWxR+pNtRwH5mvhXrSqa0LhyQ85U0=; b=PE13zbwocXfst9KMkAidxOt8tM
 csNOM6upgmQ9G545sk1tpdhSp63/yBTGqYznYiaczUJsEZ6yb++7S4X7B5NLVixLzqfjweAGtm0bg
 aT0LOK/GWCkcJL8Y72LEVK7nA+goFA3AXtkBRZp3GxV/j5itYY/nu0fucCSIhZJP2+rw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEbr-0001tk-Jz for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=x48TEdQsxZZuA/CWxR+pNtRwH5mvhXrSqa0LhyQ85U0=; b=IQHUTQmK80xVXXy9XktFtubls/
 liSbVXTmAnoB2EUEE9wHEI36zemahmSgcVrfYpkwDkTZAK28bzj5xQcJnAgtvxPubD9r8WrOJPO0W
 cyfvHWXOiJT6+2Y6QZf0tAvKp9X7T3KSehpRntJzTrUcbZu0IYxjLjPziKuHdXTZ7bijM8BWdXknS
 bYkI6hIYoD924aeEx8YLpIq6Kq1EZ0/lhUEMtBHOGtgaZfDIepAlQ3+pYI139GxMjClwbFFbhzWHt
 dAZneBetkNCinEGbszfNsuwMu6I+83qGF0OMKtLHIwABclog0pnOUA/KXDAy3ZOXbufASYZ0Z9f8D
 MoMGtpfg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEbj-0000000BuVk-1lGT; Mon, 26 Jan 2026 04:53:48 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:51:01 +0100
Message-ID: <20260126045212.1381843-16-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126045212.1381843-1-hch@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
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
 Content preview:  Look up the fsverity_info once in btrfs_do_readpage, and then
 use it for all operations performed there, and do the same in end_folio_read
 for all folios processed there. The latter is also changed to [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEbr-0001tk-Jz
Subject: [f2fs-dev] [PATCH 15/16] btrfs: consolidate fsverity_info lookup
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
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 27CCB84053
X-Rspamd-Action: no action

Look up the fsverity_info once in btrfs_do_readpage, and then use it
for all operations performed there, and do the same in end_folio_read
for all folios processed there.  The latter is also changed to derive
the inode from the btrfs_bio - while bbio->inode is optional, it is
always set for buffered reads.

This amortizes the lookup better once it becomes less efficient.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Acked-by: David Sterba <dsterba@suse.com>
---
 fs/btrfs/extent_io.c | 38 +++++++++++++++++++++++---------------
 1 file changed, 23 insertions(+), 15 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index 21430b7d8f27..fe96f060725a 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -476,26 +476,25 @@ void extent_clear_unlock_delalloc(struct btrfs_inode *inode, u64 start, u64 end,
 				end, page_ops);
 }
 
-static bool btrfs_verify_folio(struct folio *folio, u64 start, u32 len)
+static bool btrfs_verify_folio(struct fsverity_info *vi, struct folio *folio,
+			       u64 start, u32 len)
 {
 	struct btrfs_fs_info *fs_info = folio_to_fs_info(folio);
 
-	if (!fsverity_active(folio->mapping->host) ||
-	    btrfs_folio_test_uptodate(fs_info, folio, start, len) ||
-	    start >= i_size_read(folio->mapping->host))
+	if (!vi || btrfs_folio_test_uptodate(fs_info, folio, start, len))
 		return true;
-	return fsverity_verify_folio(*fsverity_info_addr(folio->mapping->host),
-			folio);
+	return fsverity_verify_folio(vi, folio);
 }
 
-static void end_folio_read(struct folio *folio, bool uptodate, u64 start, u32 len)
+static void end_folio_read(struct fsverity_info *vi, struct folio *folio,
+			   bool uptodate, u64 start, u32 len)
 {
 	struct btrfs_fs_info *fs_info = folio_to_fs_info(folio);
 
 	ASSERT(folio_pos(folio) <= start &&
 	       start + len <= folio_next_pos(folio));
 
-	if (uptodate && btrfs_verify_folio(folio, start, len))
+	if (uptodate && btrfs_verify_folio(vi, folio, start, len))
 		btrfs_folio_set_uptodate(fs_info, folio, start, len);
 	else
 		btrfs_folio_clear_uptodate(fs_info, folio, start, len);
@@ -575,14 +574,19 @@ static void begin_folio_read(struct btrfs_fs_info *fs_info, struct folio *folio)
 static void end_bbio_data_read(struct btrfs_bio *bbio)
 {
 	struct btrfs_fs_info *fs_info = bbio->inode->root->fs_info;
+	struct inode *inode = &bbio->inode->vfs_inode;
 	struct bio *bio = &bbio->bio;
+	struct fsverity_info *vi = NULL;
 	struct folio_iter fi;
 
 	ASSERT(!bio_flagged(bio, BIO_CLONED));
+
+	if (bbio->file_offset < i_size_read(inode))
+		vi = fsverity_get_info(inode);
+
 	bio_for_each_folio_all(fi, &bbio->bio) {
 		bool uptodate = !bio->bi_status;
 		struct folio *folio = fi.folio;
-		struct inode *inode = folio->mapping->host;
 		u64 start = folio_pos(folio) + fi.offset;
 
 		btrfs_debug(fs_info,
@@ -617,7 +621,7 @@ static void end_bbio_data_read(struct btrfs_bio *bbio)
 		}
 
 		/* Update page status and unlock. */
-		end_folio_read(folio, uptodate, start, fi.length);
+		end_folio_read(vi, folio, uptodate, start, fi.length);
 	}
 	bio_put(bio);
 }
@@ -1003,6 +1007,7 @@ static int btrfs_do_readpage(struct folio *folio, struct extent_map **em_cached,
 	struct extent_map *em;
 	int ret = 0;
 	const size_t blocksize = fs_info->sectorsize;
+	struct fsverity_info *vi = NULL;
 
 	ret = set_folio_extent_mapped(folio);
 	if (ret < 0) {
@@ -1010,6 +1015,9 @@ static int btrfs_do_readpage(struct folio *folio, struct extent_map **em_cached,
 		return ret;
 	}
 
+	if (start < last_byte)
+		vi = fsverity_get_info(inode);
+
 	if (folio_contains(folio, last_byte >> PAGE_SHIFT)) {
 		size_t zero_offset = offset_in_folio(folio, last_byte);
 
@@ -1030,16 +1038,16 @@ static int btrfs_do_readpage(struct folio *folio, struct extent_map **em_cached,
 		ASSERT(IS_ALIGNED(cur, fs_info->sectorsize));
 		if (cur >= last_byte) {
 			folio_zero_range(folio, pg_offset, end - cur + 1);
-			end_folio_read(folio, true, cur, end - cur + 1);
+			end_folio_read(vi, folio, true, cur, end - cur + 1);
 			break;
 		}
 		if (btrfs_folio_test_uptodate(fs_info, folio, cur, blocksize)) {
-			end_folio_read(folio, true, cur, blocksize);
+			end_folio_read(vi, folio, true, cur, blocksize);
 			continue;
 		}
 		em = get_extent_map(BTRFS_I(inode), folio, cur, end - cur + 1, em_cached);
 		if (IS_ERR(em)) {
-			end_folio_read(folio, false, cur, end + 1 - cur);
+			end_folio_read(vi, folio, false, cur, end + 1 - cur);
 			return PTR_ERR(em);
 		}
 		extent_offset = cur - em->start;
@@ -1116,12 +1124,12 @@ static int btrfs_do_readpage(struct folio *folio, struct extent_map **em_cached,
 		/* we've found a hole, just zero and go on */
 		if (block_start == EXTENT_MAP_HOLE) {
 			folio_zero_range(folio, pg_offset, blocksize);
-			end_folio_read(folio, true, cur, blocksize);
+			end_folio_read(vi, folio, true, cur, blocksize);
 			continue;
 		}
 		/* the get_extent function already copied into the folio */
 		if (block_start == EXTENT_MAP_INLINE) {
-			end_folio_read(folio, true, cur, blocksize);
+			end_folio_read(vi, folio, true, cur, blocksize);
 			continue;
 		}
 
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
