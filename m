Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id fPTIJMtlO2osXQgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:19 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 289086BB592
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 24 Jun 2026 07:06:19 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=Rdaznj6X;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=QVQLn3W5;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=m55FCNWC;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=h9lkcUK2;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zX2nb+bimrqBDelbyGdCjRclwpDD4RR4ZvoyTrl1GVA=; b=Rdaznj6X2oWycAx6YRzs5qp5fm
	JXDF/nlEi1NpifXRxmjspTQf8H4otywexc8jpDy9D6nxaVuvKjMb99Ov6XZLB3q6QHJd50OpbmCe5
	pfGraBoGomFX/ZSE4ZBRArgNFXI2/jq2i4bmKFL1l68ELHHq7uBIonOnC52j1Dr8SIIU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wcFoQ-0000uy-O1;
	Wed, 24 Jun 2026 05:06:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wcFoP-0000uq-Is
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Nj2Af/j0EhHtcq1Ksqiq7SAcVvgpLtQbzFu58yJbnR0=; b=QVQLn3W5GJ16w75wII5BHeckkv
 1A/i/1HJYvmu4qoITMllQMS8vL7iCnOUM5IxkVf7IROrmP/PQaxKlgn/lPsRyJYrfUnbt/eFFWP53
 BPKHy0u1MarRvNGb1mbW/BxGVyug6GqqmXrW1H583M+X8Lj+0Fan1Xq0aE4SBPhtfPQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Nj2Af/j0EhHtcq1Ksqiq7SAcVvgpLtQbzFu58yJbnR0=; b=m55FCNWCqXJ5K09m+ghsCXvIIP
 10A9xYvCsHr8zc2rMD7YxhyY7I//qw6opTpS5OoINZna2EdJ7iF4rSLkGVUf10GgA9YXJYq4+wfcP
 KgnoF0SKuc9hkf4GMYWt1zU66SYeJyMH0Vwh2kKl92pvV2zESodbruob0tgYFsYCSk6o=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wcFoO-0004mN-3c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 24 Jun 2026 05:06:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 4584644515;
 Wed, 24 Jun 2026 05:06:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A09661F00A3E;
 Wed, 24 Jun 2026 05:06:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1782277563;
 bh=Nj2Af/j0EhHtcq1Ksqiq7SAcVvgpLtQbzFu58yJbnR0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=h9lkcUK27+4wvHd3rKEG3WsCji9PlsuxWErNKhCQhV5KcPpFHTBs0PoBOg4AfWB3H
 gTv819iXb6LI87ukWiZAg4NW3vOR7zv5ETm/AB9Lw61pVvx/o3EM2GJei4qREoRJPL
 jmUaVKhC1MpQuqN4x5TOAzIX4nxnzFSUFlhegbHlHHav8blHo2VCJj8ZzW6RlaFsQx
 vQhtas5uK/KDWbkNRxkr44Ysja9L6O1r8XUzXUauDBiS9NUrdvcUW8cJ++mhdXOb7K
 kIO0lbE4CyfBopGy5DBMNIIev/KI2uu+hU8xFHik+LoGmBAB+Yp3dxnfW78mg+C4EB
 vstHRmDaYkodA==
To: linux-fscrypt@vger.kernel.org
Date: Tue, 23 Jun 2026 22:03:25 -0700
Message-ID: <20260624050334.124606-8-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260624050334.124606-1-ebiggers@kernel.org>
References: <20260624050334.124606-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Since the fs-layer file contents encryption implementation
 was removed, ext4_bio_write_folio() now always returns 0. Change it to return
 void, and likewise for its caller mpage_submit_folio(). Signed-off-by: Eric
 Biggers <ebiggers@kernel.org> --- fs/ext4/ext4.h | 2 +- fs/ext4/inode.c |
 31 ++++++++ fs/ext4/page-io.c | 6 ++---- 3 files changed, 11 insertions(+),
 28 dele [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1wcFoO-0004mN-3c
Subject: [f2fs-dev] [PATCH 07/16] ext4: Make ext4_bio_write_folio() return
 void
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
From: Eric Biggers via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Eric Biggers <ebiggers@kernel.org>
Cc: Ritesh Harjani <ritesh.list@gmail.com>, Theodore Ts'o <tytso@mit.edu>,
 Zhang Yi <yi.zhang@huawei.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-block@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 Ojaswin Mujoo <ojaswin@linux.ibm.com>, Baokun Li <libaokun@linux.alibaba.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-fsdevel@vger.kernel.org,
 Jan Kara <jack@suse.cz>, linux-ext4@vger.kernel.org,
 Christoph Hellwig <hch@lst.de>, Eric Biggers <ebiggers@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:linux-fscrypt@vger.kernel.org,m:ritesh.list@gmail.com,m:tytso@mit.edu,m:yi.zhang@huawei.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:adilger.kernel@dilger.ca,m:ojaswin@linux.ibm.com,m:libaokun@linux.alibaba.com,m:jaegeuk@kernel.org,m:linux-fsdevel@vger.kernel.org,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:ebiggers@kernel.org,m:riteshlist@gmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,mit.edu,huawei.com,lists.sourceforge.net,vger.kernel.org,dilger.ca,linux.ibm.com,linux.alibaba.com,kernel.org,suse.cz,lst.de];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[ebiggers@kernel.org];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	FORGED_SENDER_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 289086BB592

Since the fs-layer file contents encryption implementation was removed,
ext4_bio_write_folio() now always returns 0.  Change it to return void,
and likewise for its caller mpage_submit_folio().

Signed-off-by: Eric Biggers <ebiggers@kernel.org>
---
 fs/ext4/ext4.h    |  2 +-
 fs/ext4/inode.c   | 31 ++++++++-----------------------
 fs/ext4/page-io.c |  6 ++----
 3 files changed, 11 insertions(+), 28 deletions(-)

diff --git a/fs/ext4/ext4.h b/fs/ext4/ext4.h
index b37c136ea3ab..920a8ec1b948 100644
--- a/fs/ext4/ext4.h
+++ b/fs/ext4/ext4.h
@@ -3943,11 +3943,11 @@ extern int ext4_put_io_end(ext4_io_end_t *io_end);
 extern void ext4_put_io_end_defer(ext4_io_end_t *io_end);
 extern void ext4_io_submit_init(struct ext4_io_submit *io,
 				struct writeback_control *wbc);
 extern void ext4_end_io_rsv_work(struct work_struct *work);
 extern void ext4_io_submit(struct ext4_io_submit *io);
-int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *page,
+void ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *page,
 		size_t len);
 extern struct ext4_io_end_vec *ext4_alloc_io_end_vec(ext4_io_end_t *io_end);
 extern struct ext4_io_end_vec *ext4_last_io_end_vec(ext4_io_end_t *io_end);
 
 /* mmp.c */
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 8eb2af481129..c6faa7c751ca 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2062,15 +2062,14 @@ static void mpage_folio_done(struct mpage_da_data *mpd, struct folio *folio)
 	mpd->start_pos += folio_size(folio);
 	mpd->wbc->nr_to_write -= folio_nr_pages(folio);
 	folio_unlock(folio);
 }
 
-static int mpage_submit_folio(struct mpage_da_data *mpd, struct folio *folio)
+static void mpage_submit_folio(struct mpage_da_data *mpd, struct folio *folio)
 {
 	size_t len;
 	loff_t size;
-	int err;
 
 	WARN_ON_ONCE(folio_pos(folio) != mpd->start_pos);
 	folio_clear_dirty_for_io(folio);
 	/*
 	 * We have to be very careful here!  Nothing protects writeback path
@@ -2088,13 +2087,11 @@ static int mpage_submit_folio(struct mpage_da_data *mpd, struct folio *folio)
 	size = i_size_read(mpd->inode);
 	len = folio_size(folio);
 	if (folio_pos(folio) + len > size &&
 	    !ext4_verity_in_progress(mpd->inode))
 		len = size & (len - 1);
-	err = ext4_bio_write_folio(&mpd->io_submit, folio, len);
-
-	return err;
+	ext4_bio_write_folio(&mpd->io_submit, folio, len);
 }
 
 #define BH_FLAGS (BIT(BH_Unwritten) | BIT(BH_Delay))
 
 /*
@@ -2167,20 +2164,18 @@ static bool mpage_add_bh_to_extent(struct mpage_da_data *mpd, ext4_lblk_t lblk,
  * Walk through page buffers from @bh upto @head (exclusive) and either submit
  * the page for IO if all buffers in this page were mapped and there's no
  * accumulated extent of buffers to map or add buffers in the page to the
  * extent of buffers to map. The function returns 1 if the caller can continue
  * by processing the next page, 0 if it should stop adding buffers to the
- * extent to map because we cannot extend it anymore. It can also return value
- * < 0 in case of error during IO submission.
+ * extent to map because we cannot extend it anymore.
  */
 static int mpage_process_page_bufs(struct mpage_da_data *mpd,
 				   struct buffer_head *head,
 				   struct buffer_head *bh,
 				   ext4_lblk_t lblk)
 {
 	struct inode *inode = mpd->inode;
-	int err;
 	ext4_lblk_t blocks = (i_size_read(inode) + i_blocksize(inode) - 1)
 							>> inode->i_blkbits;
 
 	if (ext4_verity_in_progress(inode))
 		blocks = EXT_MAX_BLOCKS;
@@ -2199,13 +2194,11 @@ static int mpage_process_page_bufs(struct mpage_da_data *mpd,
 			break;
 		}
 	} while (lblk++, (bh = bh->b_this_page) != head);
 	/* So far everything mapped? Submit the page for IO. */
 	if (mpd->map.m_len == 0) {
-		err = mpage_submit_folio(mpd, head->b_folio);
-		if (err < 0)
-			return err;
+		mpage_submit_folio(mpd, head->b_folio);
 		mpage_folio_done(mpd, head->b_folio);
 	}
 	if (lblk >= blocks) {
 		mpd->scanned_until_end = 1;
 		return 0;
@@ -2331,13 +2324,11 @@ static int mpage_map_and_submit_buffers(struct mpage_da_data *mpd)
 			 * So we return to call further extent mapping.
 			 */
 			if (err < 0 || map_bh)
 				goto out;
 			/* Page fully mapped - let IO run! */
-			err = mpage_submit_folio(mpd, folio);
-			if (err < 0)
-				goto out;
+			mpage_submit_folio(mpd, folio);
 			mpage_folio_done(mpd, folio);
 		}
 		folio_batch_release(&fbatch);
 	}
 	/* Extent fully mapped and matches with page boundary. We are done. */
@@ -2406,11 +2397,10 @@ static int mpage_map_one_extent(handle_t *handle, struct mpage_da_data *mpd)
 static int mpage_submit_partial_folio(struct mpage_da_data *mpd)
 {
 	struct inode *inode = mpd->inode;
 	struct folio *folio;
 	loff_t pos;
-	int ret;
 
 	folio = filemap_get_folio(inode->i_mapping,
 				  mpd->start_pos >> PAGE_SHIFT);
 	if (IS_ERR(folio))
 		return PTR_ERR(folio);
@@ -2421,25 +2411,22 @@ static int mpage_submit_partial_folio(struct mpage_da_data *mpd)
 	pos = ((loff_t)mpd->map.m_lblk) << inode->i_blkbits;
 	if (WARN_ON_ONCE((folio_pos(folio) == pos) ||
 			 !folio_contains(folio, pos >> PAGE_SHIFT)))
 		return -EINVAL;
 
-	ret = mpage_submit_folio(mpd, folio);
-	if (ret)
-		goto out;
+	mpage_submit_folio(mpd, folio);
 	/*
 	 * Update start_pos to prevent this folio from being released in
 	 * mpage_release_unused_pages(), it will be reset to the aligned folio
 	 * pos when this folio is written again in the next round. Additionally,
 	 * do not update wbc->nr_to_write here, as it will be updated once the
 	 * entire folio has finished processing.
 	 */
 	mpd->start_pos = pos;
-out:
 	folio_unlock(folio);
 	folio_put(folio);
-	return ret;
+	return 0;
 }
 
 /*
  * mpage_map_and_submit_extent - map extent starting at mpd->lblk of length
  *				 mpd->len and submit pages underlying it for IO
@@ -2722,13 +2709,11 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
 			 * location before possibly journalling it again which
 			 * is desirable when the page is frequently dirtied
 			 * through a pin.
 			 */
 			if (!mpd->can_map) {
-				err = mpage_submit_folio(mpd, folio);
-				if (err < 0)
-					goto out;
+				mpage_submit_folio(mpd, folio);
 				/* Pending dirtying of journalled data? */
 				if (folio_test_checked(folio)) {
 					err = mpage_journal_page_buffers(handle,
 						mpd, folio);
 					if (err < 0)
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 557f44178d87..0236b6b9785a 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -457,11 +457,11 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 		goto submit_and_retry;
 	wbc_account_cgroup_owner(io->io_wbc, folio, bh->b_size);
 	io->io_next_block++;
 }
 
-int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
+void ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 		size_t len)
 {
 	struct inode *inode = folio->mapping->host;
 	unsigned block_start;
 	struct buffer_head *bh, *head;
@@ -531,11 +531,11 @@ int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 		 * We have nothing to submit. Just cycle the folio through
 		 * writeback state to properly update xarray tags.
 		 */
 		__folio_start_writeback(folio, keep_towrite);
 		folio_end_writeback(folio);
-		return 0;
+		return;
 	}
 
 	bh = head = folio_buffers(folio);
 
 	__folio_start_writeback(folio, keep_towrite);
@@ -544,8 +544,6 @@ int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 	do {
 		if (!buffer_async_write(bh))
 			continue;
 		io_submit_add_bh(io, inode, folio, bh);
 	} while ((bh = bh->b_this_page) != head);
-
-	return 0;
 }
-- 
2.54.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
