Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id o6jiIQC1SmocGgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 05 Jul 2026 21:48:16 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D0EF70B1FA
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 05 Jul 2026 21:48:16 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=HcTunqoX;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=MOPa1mk5;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=dQwRgnQX;
	dkim=fail ("body hash did not verify") header.d=kernel.org header.s=k20260515 header.b=EO2QHNjD;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UihAjYBtHVSxWPOWb/uEYSzALajhzZvoYfxSVdxX9E4=; b=HcTunqoXDy4alYkqZrkFt1qp7H
	VX/LwhH7+uL8tRYI4zD1K3TaEJEn2qif7Hb0zeblGFmOFDF+h491S0f9eeeBp/Yj6uSvX+98bxk0J
	0RfDuJ/Usf1Wce1MmCnCq1oxNze9IuGMC7UAxGx1nw4dRVDGOnXNVZ+0TX8wX09FifKE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wgSoz-0003vO-Dr;
	Sun, 05 Jul 2026 19:48:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1wgSow-0003uU-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 05 Jul 2026 19:48:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0GgHhPTKYJ8Yn2rSYbQYuL4pWTLt6yCuvPM4NNDv1+8=; b=MOPa1mk5mh6HLgLz8nUhVHNedt
 5VPRN0V/NHtkUIowD1ZeZZqN69z0c/w4No+K4uMT6OdQ7+db5bCZtjxxMb2RQGWfiOujqJ/mWoQiK
 2ClAOryJ7nJs15dtrSjAFoS/SSepB1O0Sx/4VEF/70SKAQm92aTQVGf2ucIeEKbdRcwA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=0GgHhPTKYJ8Yn2rSYbQYuL4pWTLt6yCuvPM4NNDv1+8=; b=dQwRgnQXksSqHf24eo1fjzsVx2
 5/TyzPIWB0m27zRYgIu+/+eDmYdstT7QgioSJ3UG0xe/g48pWZ+yq/Ma6NL/xJAI+szh/XBvDbZ8p
 20cKpkFt/WT/hdyKjH6j7HMZOn7avSE/MdkLoHi2xQ85ZTSHrSzPHfYo4KGMc9tW32Ng=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wgSou-0001ES-5f for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 05 Jul 2026 19:48:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by sea.source.kernel.org (Postfix) with ESMTP id 63F0142DA7;
 Sun,  5 Jul 2026 19:47:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 323B11F00A3D;
 Sun,  5 Jul 2026 19:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1783280874;
 bh=0GgHhPTKYJ8Yn2rSYbQYuL4pWTLt6yCuvPM4NNDv1+8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=EO2QHNjDvu+ulBGImBtUs+3k+YXgxGcD1GV7KIw1JiJa+LwE0y/x2+vqwmQ/1QNMU
 Yd3XON5FJYLYddZIw+AHTpVcUr+ZsRPq61oCOG0slUnzYTQUog1Wl7nRSAbF9nluyr
 lUFoiqaFjDYCJeDcnchAQxFmjb7K2AuGBroqTa8VQn36ToZLxCVhLJbXdkAz9PNgWp
 jdxwvpVF2/+79A1KhOq6gPij34AHYGVI5xyeJNIgTMlLq3VmaBx4rIjGKpajmipXgl
 2ywnzBU7v6nJxAQo6tOwRexVB/ZRAE2hMVi72mH4qgeVA3P8PpWMKRuli+I+8vSKMS
 fl5xkZ0POtsKg==
To: linux-fscrypt@vger.kernel.org
Date: Sun,  5 Jul 2026 12:45:45 -0700
Message-ID: <20260705194555.75030-9-ebiggers@kernel.org>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260705194555.75030-1-ebiggers@kernel.org>
References: <20260705194555.75030-1-ebiggers@kernel.org>
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
 void, and likewise for its caller mpage_submit_folio(). Reviewed-by: Christoph
 Hellwig <hch@lst.de> Signed-off-by: Eric Biggers <ebiggers@kernel.org> ---
 fs/ext4/ext4.h | 2 +- fs/ext4/inode.c | 31 ++++++++ fs/ext4/page-io.c | 6
 ++--- [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wgSou-0001ES-5f
Subject: [f2fs-dev] [PATCH v2 08/17] ext4: Make ext4_bio_write_folio()
 return void
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:email]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 1D0EF70B1FA

Since the fs-layer file contents encryption implementation was removed,
ext4_bio_write_folio() now always returns 0.  Change it to return void,
and likewise for its caller mpage_submit_folio().

Reviewed-by: Christoph Hellwig <hch@lst.de>
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
@@ -3945,7 +3945,7 @@ extern void ext4_io_submit_init(struct ext4_io_submit *io,
 				struct writeback_control *wbc);
 extern void ext4_end_io_rsv_work(struct work_struct *work);
 extern void ext4_io_submit(struct ext4_io_submit *io);
-int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *page,
+void ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *page,
 		size_t len);
 extern struct ext4_io_end_vec *ext4_alloc_io_end_vec(ext4_io_end_t *io_end);
 extern struct ext4_io_end_vec *ext4_last_io_end_vec(ext4_io_end_t *io_end);
diff --git a/fs/ext4/inode.c b/fs/ext4/inode.c
index 8eb2af481129..c6faa7c751ca 100644
--- a/fs/ext4/inode.c
+++ b/fs/ext4/inode.c
@@ -2064,11 +2064,10 @@ static void mpage_folio_done(struct mpage_da_data *mpd, struct folio *folio)
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
@@ -2090,9 +2089,7 @@ static int mpage_submit_folio(struct mpage_da_data *mpd, struct folio *folio)
 	if (folio_pos(folio) + len > size &&
 	    !ext4_verity_in_progress(mpd->inode))
 		len = size & (len - 1);
-	err = ext4_bio_write_folio(&mpd->io_submit, folio, len);
-
-	return err;
+	ext4_bio_write_folio(&mpd->io_submit, folio, len);
 }
 
 #define BH_FLAGS (BIT(BH_Unwritten) | BIT(BH_Delay))
@@ -2169,8 +2166,7 @@ static bool mpage_add_bh_to_extent(struct mpage_da_data *mpd, ext4_lblk_t lblk,
  * accumulated extent of buffers to map or add buffers in the page to the
  * extent of buffers to map. The function returns 1 if the caller can continue
  * by processing the next page, 0 if it should stop adding buffers to the
- * extent to map because we cannot extend it anymore. It can also return value
- * < 0 in case of error during IO submission.
+ * extent to map because we cannot extend it anymore.
  */
 static int mpage_process_page_bufs(struct mpage_da_data *mpd,
 				   struct buffer_head *head,
@@ -2178,7 +2174,6 @@ static int mpage_process_page_bufs(struct mpage_da_data *mpd,
 				   ext4_lblk_t lblk)
 {
 	struct inode *inode = mpd->inode;
-	int err;
 	ext4_lblk_t blocks = (i_size_read(inode) + i_blocksize(inode) - 1)
 							>> inode->i_blkbits;
 
@@ -2201,9 +2196,7 @@ static int mpage_process_page_bufs(struct mpage_da_data *mpd,
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
@@ -2333,9 +2326,7 @@ static int mpage_map_and_submit_buffers(struct mpage_da_data *mpd)
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
@@ -2408,7 +2399,6 @@ static int mpage_submit_partial_folio(struct mpage_da_data *mpd)
 	struct inode *inode = mpd->inode;
 	struct folio *folio;
 	loff_t pos;
-	int ret;
 
 	folio = filemap_get_folio(inode->i_mapping,
 				  mpd->start_pos >> PAGE_SHIFT);
@@ -2423,9 +2413,7 @@ static int mpage_submit_partial_folio(struct mpage_da_data *mpd)
 			 !folio_contains(folio, pos >> PAGE_SHIFT)))
 		return -EINVAL;
 
-	ret = mpage_submit_folio(mpd, folio);
-	if (ret)
-		goto out;
+	mpage_submit_folio(mpd, folio);
 	/*
 	 * Update start_pos to prevent this folio from being released in
 	 * mpage_release_unused_pages(), it will be reset to the aligned folio
@@ -2434,10 +2422,9 @@ static int mpage_submit_partial_folio(struct mpage_da_data *mpd)
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
@@ -2724,9 +2711,7 @@ static int mpage_prepare_extent_to_map(struct mpage_da_data *mpd)
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
diff --git a/fs/ext4/page-io.c b/fs/ext4/page-io.c
index 557f44178d87..0236b6b9785a 100644
--- a/fs/ext4/page-io.c
+++ b/fs/ext4/page-io.c
@@ -459,7 +459,7 @@ static void io_submit_add_bh(struct ext4_io_submit *io,
 	io->io_next_block++;
 }
 
-int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
+void ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 		size_t len)
 {
 	struct inode *inode = folio->mapping->host;
@@ -533,7 +533,7 @@ int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
 		 */
 		__folio_start_writeback(folio, keep_towrite);
 		folio_end_writeback(folio);
-		return 0;
+		return;
 	}
 
 	bh = head = folio_buffers(folio);
@@ -546,6 +546,4 @@ int ext4_bio_write_folio(struct ext4_io_submit *io, struct folio *folio,
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
