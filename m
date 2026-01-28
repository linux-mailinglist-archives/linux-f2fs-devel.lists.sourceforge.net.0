Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OJA1ERAremmi3gEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:28:16 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 52F17A3CE6
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 28 Jan 2026 16:28:10 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ttRMSR+XselrXQvu8qDTMIYc0FgdPgbe5Q7voYmTYl8=; b=mXDbq/AemA0vDq2uTvllt+hVX8
	3/NeTIXGnwDtsACP7gj9/BVv/wKgplNlj5KLeITleOGP/vDuYqq6qk+bXsPwjSdazatK//p63ma8b
	39W5W06jVO0UG3/USn7UBVqYRWFlD8O971cqqYu6lOhbehCBk96XvwvqcmSyJAsfKjG4=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vl7Sh-0006yY-Ie;
	Wed, 28 Jan 2026 15:28:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+97ec6e74097c8d3e794e+8193+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vl7Sg-0006yO-EC for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NQGnXqZ80E8oPeuCnBxzJAvzukflyjmBA+GLzdhvtxM=; b=nRtAI5JfkRXSg7CAuH+Baxzbyv
 1JkkRTLnR8qzk1UsUECMc4nXi8OqOBCO3S0k3OPvT/3HOc6/aCd57FsL2Jpw+5XZhWVrZbQR5nrty
 /7m+sncULonnMUcnzpDN1TJJIgjLDec8mG1orHhciWnpg8OoJwnWYaFIEngEHw4RZses=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NQGnXqZ80E8oPeuCnBxzJAvzukflyjmBA+GLzdhvtxM=; b=b/WwXubeHS6tFcPsbsMsItWX7W
 7iAyRo/aBxZ12WJVijLZaGRnwrg93PNxhO6YAziP/CqfHvifAqwDapXVBliIpHk47bxb3LV9gG2Ib
 g2eceHScIGUCgP6FWtN8qfEv0KD8AMtnsvpM2+OklbmHbEPQWnA+kjFxzPxmiakL0rPw=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vl7Se-0002VP-IY for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 28 Jan 2026 15:28:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=NQGnXqZ80E8oPeuCnBxzJAvzukflyjmBA+GLzdhvtxM=; b=K5fBAbMsc1/Sre5FYFQf1/jujq
 BhAthSj6D28bvDbaCC3emja4d3qHnYUOOBq+Th2a+SkxoTgj6YAJ75KvYsNcn4uxccvqmE1hCNEMn
 /GlmpvNzISrFkDRL1BNDqW+TmwvJ95uVACZrDILUTOMR98fSIzafEPzSm9mYXGQjemaCdLpBn1aPB
 Ufta2oJalwbstItQ+4xa0RIxLLDfPtT13WO9z3YJpMS1RccHGZjoHsMAXtdh3PHr3NziEfS39nBoK
 gaPV5pwUG0HHcHxvad7ML6kK4UNrGW9YmFr6Jdd+klSRO8bexAcBTD5/7g+q3I+e1BqeYhFfelZbr
 dU5FkEeg==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vl7SQ-0000000GHX8-0DWQ; Wed, 28 Jan 2026 15:27:51 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Wed, 28 Jan 2026 16:26:22 +0100
Message-ID: <20260128152630.627409-11-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260128152630.627409-1-hch@lst.de>
References: <20260128152630.627409-1-hch@lst.de>
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
 Content preview: Pass a struct fsverity_info to the verification and readahead
 helpers, and push the lookup into the callers. Right now this is a very dumb
 almost mechanic move that open codes a lot of fsverity_info_a [...] 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vl7Se-0002VP-IY
Subject: [f2fs-dev] [PATCH 10/15] fsverity: push out fsverity_info lookup
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
 Theodore Ts'o <tytso@mit.edu>, "Darrick J. Wong" <djwong@kernel.org>,
 Andrey Albershteyn <aalbersh@redhat.com>, Matthew Wilcox <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
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
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[15];
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
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,lst.de:mid,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: 52F17A3CE6
X-Rspamd-Action: no action

Pass a struct fsverity_info to the verification and readahead helpers,
and push the lookup into the callers.  Right now this is a very
dumb almost mechanic move that open codes a lot of fsverity_info_addr()
calls int the file systems.  The subsequent patches will clean this up.

This prepares for reducing the number of fsverity_info lookups, which
will allow to amortize them better when using a more expensive lookup
method.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
Acked-by: David Sterba <dsterba@suse.com> [btrfs]
---
 fs/btrfs/extent_io.c     |  3 ++-
 fs/buffer.c              |  4 +++-
 fs/ext4/readpage.c       | 10 +++++++---
 fs/f2fs/compress.c       |  4 +++-
 fs/f2fs/data.c           | 15 +++++++++++----
 fs/verity/verify.c       | 23 ++++++++++++-----------
 include/linux/fsverity.h | 31 ++++++++++++++++++++++---------
 7 files changed, 60 insertions(+), 30 deletions(-)

diff --git a/fs/btrfs/extent_io.c b/fs/btrfs/extent_io.c
index a4b74023618d..21430b7d8f27 100644
--- a/fs/btrfs/extent_io.c
+++ b/fs/btrfs/extent_io.c
@@ -484,7 +484,8 @@ static bool btrfs_verify_folio(struct folio *folio, u64 start, u32 len)
 	    btrfs_folio_test_uptodate(fs_info, folio, start, len) ||
 	    start >= i_size_read(folio->mapping->host))
 		return true;
-	return fsverity_verify_folio(folio);
+	return fsverity_verify_folio(*fsverity_info_addr(folio->mapping->host),
+			folio);
 }
 
 static void end_folio_read(struct folio *folio, bool uptodate, u64 start, u32 len)
diff --git a/fs/buffer.c b/fs/buffer.c
index 838c0c571022..3982253b6805 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -309,9 +309,11 @@ static void verify_bh(struct work_struct *work)
 	struct postprocess_bh_ctx *ctx =
 		container_of(work, struct postprocess_bh_ctx, work);
 	struct buffer_head *bh = ctx->bh;
+	struct inode *inode = bh->b_folio->mapping->host;
 	bool valid;
 
-	valid = fsverity_verify_blocks(bh->b_folio, bh->b_size, bh_offset(bh));
+	valid = fsverity_verify_blocks(*fsverity_info_addr(inode), bh->b_folio,
+				       bh->b_size, bh_offset(bh));
 	end_buffer_async_read(bh, valid);
 	kfree(ctx);
 }
diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index e99072c8a619..bf65562da9c2 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -96,6 +96,7 @@ static void verity_work(struct work_struct *work)
 	struct bio_post_read_ctx *ctx =
 		container_of(work, struct bio_post_read_ctx, work);
 	struct bio *bio = ctx->bio;
+	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
 
 	/*
 	 * fsverity_verify_bio() may call readahead() again, and although verity
@@ -108,7 +109,7 @@ static void verity_work(struct work_struct *work)
 	mempool_free(ctx, bio_post_read_ctx_pool);
 	bio->bi_private = NULL;
 
-	fsverity_verify_bio(bio);
+	fsverity_verify_bio(*fsverity_info_addr(inode), bio);
 
 	__read_end_io(bio);
 }
@@ -245,7 +246,8 @@ int ext4_mpage_readpages(struct inode *inode,
 
 		if (first_folio) {
 			if (ext4_need_verity(inode, folio->index))
-				fsverity_readahead(folio, nr_pages);
+				fsverity_readahead(*fsverity_info_addr(inode),
+						folio, nr_pages);
 			first_folio = false;
 		}
 
@@ -337,7 +339,9 @@ int ext4_mpage_readpages(struct inode *inode,
 					  folio_size(folio));
 			if (first_hole == 0) {
 				if (ext4_need_verity(inode, folio->index) &&
-				    !fsverity_verify_folio(folio))
+				    !fsverity_verify_folio(
+						*fsverity_info_addr(inode),
+						folio))
 					goto set_error_page;
 				folio_end_read(folio, true);
 				continue;
diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 40a62f1dee4d..3de4a7e66959 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -1814,7 +1814,9 @@ static void f2fs_verify_cluster(struct work_struct *work)
 		if (!rpage)
 			continue;
 
-		if (fsverity_verify_page(rpage))
+		if (fsverity_verify_page(
+				*fsverity_info_addr(rpage->mapping->host),
+				rpage))
 			SetPageUptodate(rpage);
 		else
 			ClearPageUptodate(rpage);
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 49bdc7e771f2..bca1e34d327a 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -185,15 +185,19 @@ static void f2fs_verify_bio(struct work_struct *work)
 
 		bio_for_each_folio_all(fi, bio) {
 			struct folio *folio = fi.folio;
+			struct fsverity_info *vi =
+				*fsverity_info_addr(folio->mapping->host);
 
 			if (!f2fs_is_compressed_page(folio) &&
-			    !fsverity_verify_page(&folio->page)) {
+			    !fsverity_verify_page(vi, &folio->page)) {
 				bio->bi_status = BLK_STS_IOERR;
 				break;
 			}
 		}
 	} else {
-		fsverity_verify_bio(bio);
+		struct inode *inode = bio_first_folio_all(bio)->mapping->host;
+
+		fsverity_verify_bio(*fsverity_info_addr(inode), bio);
 	}
 
 	f2fs_finish_read_bio(bio, true);
@@ -2121,7 +2125,9 @@ static int f2fs_read_single_page(struct inode *inode, struct folio *folio,
 zero_out:
 		folio_zero_segment(folio, 0, folio_size(folio));
 		if (f2fs_need_verity(inode, index) &&
-		    !fsverity_verify_folio(folio)) {
+		    !fsverity_verify_folio(
+				*fsverity_info_addr(folio->mapping->host),
+				folio)) {
 			ret = -EIO;
 			goto out;
 		}
@@ -2386,7 +2392,8 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 		if (first_folio) {
 			if (f2fs_need_verity(inode, folio->index))
-				fsverity_readahead(folio, nr_pages);
+				fsverity_readahead(*fsverity_info_addr(inode),
+						folio, nr_pages);
 			first_folio = false;
 		}
 
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 6248d25a1f89..98685bbb21f6 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -39,6 +39,7 @@ static struct workqueue_struct *fsverity_read_workqueue;
 
 /**
  * fsverity_readahead() - kick off readahead on fsverity hashes
+ * @vi:			fsverity_info for the inode to be read
  * @folio:		first file data folio that is being read
  * @nr_pages:		number of file data pages to be read
  *
@@ -49,10 +50,10 @@ static struct workqueue_struct *fsverity_read_workqueue;
  * ensure that the hashes are already cached on completion of the file data
  * read if possible.
  */
-void fsverity_readahead(struct folio *folio, unsigned long nr_pages)
+void fsverity_readahead(struct fsverity_info *vi, struct folio *folio,
+			unsigned long nr_pages)
 {
 	struct inode *inode = folio->mapping->host;
-	const struct fsverity_info *vi = *fsverity_info_addr(inode);
 	const struct merkle_tree_params *params = &vi->tree_params;
 	u64 start_hidx = (u64)folio->index << params->log_blocks_per_page;
 	u64 end_hidx = (((u64)folio->index + nr_pages) <<
@@ -314,11 +315,9 @@ static bool verify_data_block(struct fsverity_info *vi,
 
 static void
 fsverity_init_verification_context(struct fsverity_verification_context *ctx,
-				   struct inode *inode)
+				   struct fsverity_info *vi)
 {
-	struct fsverity_info *vi = *fsverity_info_addr(inode);
-
-	ctx->inode = inode;
+	ctx->inode = vi->inode;
 	ctx->vi = vi;
 	ctx->num_pending = 0;
 	if (vi->tree_params.hash_alg->algo_id == HASH_ALGO_SHA256 &&
@@ -398,6 +397,7 @@ static bool fsverity_add_data_blocks(struct fsverity_verification_context *ctx,
 
 /**
  * fsverity_verify_blocks() - verify data in a folio
+ * @vi: fsverity_info for the inode to be read
  * @folio: the folio containing the data to verify
  * @len: the length of the data to verify in the folio
  * @offset: the offset of the data to verify in the folio
@@ -408,11 +408,12 @@ static bool fsverity_add_data_blocks(struct fsverity_verification_context *ctx,
  *
  * Return: %true if the data is valid, else %false.
  */
-bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset)
+bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
+			    size_t len, size_t offset)
 {
 	struct fsverity_verification_context ctx;
 
-	fsverity_init_verification_context(&ctx, folio->mapping->host);
+	fsverity_init_verification_context(&ctx, vi);
 
 	if (fsverity_add_data_blocks(&ctx, folio, len, offset) &&
 	    fsverity_verify_pending_blocks(&ctx))
@@ -425,6 +426,7 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
 #ifdef CONFIG_BLOCK
 /**
  * fsverity_verify_bio() - verify a 'read' bio that has just completed
+ * @vi: fsverity_info for the inode to be read
  * @bio: the bio to verify
  *
  * Verify the bio's data against the file's Merkle tree.  All bio data segments
@@ -437,13 +439,12 @@ EXPORT_SYMBOL_GPL(fsverity_verify_blocks);
  * filesystems) must instead call fsverity_verify_page() directly on each page.
  * All filesystems must also call fsverity_verify_page() on holes.
  */
-void fsverity_verify_bio(struct bio *bio)
+void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio)
 {
-	struct inode *inode = bio_first_folio_all(bio)->mapping->host;
 	struct fsverity_verification_context ctx;
 	struct folio_iter fi;
 
-	fsverity_init_verification_context(&ctx, inode);
+	fsverity_init_verification_context(&ctx, vi);
 
 	bio_for_each_folio_all(fi, bio) {
 		if (!fsverity_add_data_blocks(&ctx, fi.folio, fi.length,
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index bade511cf3aa..1d70b270e90a 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -197,12 +197,20 @@ int fsverity_ioctl_read_metadata(struct file *filp, const void __user *uarg);
 
 /* verify.c */
 
-bool fsverity_verify_blocks(struct folio *folio, size_t len, size_t offset);
-void fsverity_verify_bio(struct bio *bio);
+bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
+			    size_t len, size_t offset);
+void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
 
 #else /* !CONFIG_FS_VERITY */
 
+/*
+ * Provide a stub to allow code using this to compile.  All callsites should be
+ * guarded by compiler dead code elimination, and this forces a link error if
+ * not.
+ */
+struct fsverity_info **fsverity_info_addr(const struct inode *inode);
+
 static inline struct fsverity_info *fsverity_get_info(const struct inode *inode)
 {
 	return NULL;
@@ -251,14 +259,16 @@ static inline int fsverity_ioctl_read_metadata(struct file *filp,
 
 /* verify.c */
 
-static inline bool fsverity_verify_blocks(struct folio *folio, size_t len,
+static inline bool fsverity_verify_blocks(struct fsverity_info *vi,
+					  struct folio *folio, size_t len,
 					  size_t offset)
 {
 	WARN_ON_ONCE(1);
 	return false;
 }
 
-static inline void fsverity_verify_bio(struct bio *bio)
+static inline void fsverity_verify_bio(struct fsverity_info *vi,
+				       struct bio *bio)
 {
 	WARN_ON_ONCE(1);
 }
@@ -270,14 +280,16 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 
 #endif	/* !CONFIG_FS_VERITY */
 
-static inline bool fsverity_verify_folio(struct folio *folio)
+static inline bool fsverity_verify_folio(struct fsverity_info *vi,
+					 struct folio *folio)
 {
-	return fsverity_verify_blocks(folio, folio_size(folio), 0);
+	return fsverity_verify_blocks(vi, folio, folio_size(folio), 0);
 }
 
-static inline bool fsverity_verify_page(struct page *page)
+static inline bool fsverity_verify_page(struct fsverity_info *vi,
+					struct page *page)
 {
-	return fsverity_verify_blocks(page_folio(page), PAGE_SIZE, 0);
+	return fsverity_verify_blocks(vi, page_folio(page), PAGE_SIZE, 0);
 }
 
 /**
@@ -319,7 +331,8 @@ static inline int fsverity_file_open(struct inode *inode, struct file *filp)
 }
 
 void fsverity_cleanup_inode(struct inode *inode);
-void fsverity_readahead(struct folio *folio, unsigned long nr_pages);
+void fsverity_readahead(struct fsverity_info *vi, struct folio *folio,
+		unsigned long nr_pages);
 
 struct page *generic_read_merkle_tree_page(struct inode *inode, pgoff_t index);
 void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
