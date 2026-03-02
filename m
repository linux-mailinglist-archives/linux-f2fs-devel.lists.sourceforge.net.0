Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gC7BA4acpWmfEwYAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:50 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A08F51DA993
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Mar 2026 15:19:49 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mGhe0mQ3CQ+R2uLluPgJb+urGtINuXmwS1ZlDFDn9sA=; b=fJnPrBdsVh9kYh9I5N+TCpimFk
	cXUCgRWFNlEj1zziyZDTU7LlfogPDMoXdIUT0zCbg5nm/DAoOsR6pweoGVATWQLLVfqlXNYVe67qB
	eOUNKkhX20UaGvd2IaBQ68oELPBrQJxDV4p9dOHcbqg7vuBJRMVruokWHfVH2zYU6okM=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vx47g-0002Gb-AM;
	Mon, 02 Mar 2026 14:19:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+ce5019daea4c3780914a+8226+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vx47d-0002GI-77 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eLjGK7IWGAcBMQnMUjvBRs0k7XXMOQi2JJHsMlMBoE4=; b=G0xXPKN93oRJfkmbkgZho4n9Xu
 ejW6VsfS/Y3oC6BNGX/nViRTv6ekZ0ntAbrV9l0l9zb1Bs9qIuZQQdMxzUSp5frWLernOxqnGBw68
 x8lIyvQNofP0CVxHD4xIBVibHTuKgcLpCj9s9JhEmrPLQAxuoIoBpmN2H4s4I6guxnH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eLjGK7IWGAcBMQnMUjvBRs0k7XXMOQi2JJHsMlMBoE4=; b=W3MmGZXQ/1rkUA2ieFAftTi2W0
 X/Jats7NUcAPP07S9gKkajwDPsk0SU3cXPBPl++1+OgEWpf1SgPJdNW2C04rcf1IMAC4dCEEdGXie
 x+lE/34ni8YAc2YFL6l1W0wODl1E6jICxfv8IM1dMGHHiwes0EewkQ9vpA2izJpiKTWk=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vx47c-0001UG-QR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Mar 2026 14:19:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=eLjGK7IWGAcBMQnMUjvBRs0k7XXMOQi2JJHsMlMBoE4=; b=K0b2ahEKH3jaHPbt9ekfLMUIom
 Lyl1rkQo08KVUDOJXLgZWWIZlbLqIiQTN2oatQaSLDd0z5c9gdLQRxqVYt5PZgAQ0rCB9YMVll5L6
 v5zHMTfAqlfLfwYkIDccIRIWmXMv518kqSc2V0blugQBv/UuzOpYbjBl9v8ZRtoIi9WJC0uaNgzLP
 eDY9683WvpZ73FiQX2eU2YkfIHzXNqgztuGzU737hk25GvHzBRQ+PQRo83nqBDv9l5SWoakCpwiLm
 0Q9yWuOh104dye070X5m6UPzIu1IZV1iJpQ3b7dqRUsqGdzk7TitZTeZnZPiOmizCFWrMDvi495JT
 JjLHd3xA==;
Received: from [2604:3d08:797f:2840::9d5f] (helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vx47W-0000000DDUR-3Lb6; Mon, 02 Mar 2026 14:19:38 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Mar 2026 06:18:19 -0800
Message-ID: <20260302141922.370070-15-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260302141922.370070-1-hch@lst.de>
References: <20260302141922.370070-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Replace the next_block variable that is in units of file
 system
 blocks and incorretly uses the sector_t type with a byte offset, as that
 is what both users want. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/ext4/readpage.c | 11 +++++------ 1 file changed, 5 insertions(+),
 6 deletions(-)
 Content analysis details:   (0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.2 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vx47c-0001UG-QR
Subject: [f2fs-dev] [PATCH 14/14] ext4: use a byte granularity cursor in
 ext4_mpage_readpages
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
Cc: Christian Brauner <brauner@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 "Darrick J. Wong" <djwong@kernel.org>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fscrypt@vger.kernel.org, Andreas Dilger <adilger.kernel@dilger.ca>,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-ext4@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fscrypt@vger.kernel.org,m:adilger.kernel@dilger.ca,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:linux-ext4@vger.kernel.org,s:lists@lfdr.de];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FROM_HAS_DN(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: A08F51DA993
X-Rspamd-Action: no action

Replace the next_block variable that is in units of file system blocks
and incorretly uses the sector_t type with a byte offset, as that is
what both users want.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/ext4/readpage.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/fs/ext4/readpage.c b/fs/ext4/readpage.c
index fbfa4d830d9a..6ec503bde00b 100644
--- a/fs/ext4/readpage.c
+++ b/fs/ext4/readpage.c
@@ -215,11 +215,11 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 	sector_t last_block_in_bio = 0;
 	const unsigned blkbits = inode->i_blkbits;
 	const unsigned blocksize = 1 << blkbits;
-	sector_t next_block;
 	sector_t block_in_file;
 	sector_t last_block;
 	sector_t last_block_in_file;
 	sector_t first_block;
+	loff_t pos;
 	unsigned page_block;
 	struct block_device *bdev = inode->i_sb->s_bdev;
 	int length;
@@ -249,7 +249,8 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 
 		blocks_per_folio = folio_size(folio) >> blkbits;
 		first_hole = blocks_per_folio;
-		block_in_file = next_block = EXT4_PG_TO_LBLK(inode, folio->index);
+		pos = folio_pos(folio);
+		block_in_file = pos >> blkbits;
 		last_block = EXT4_PG_TO_LBLK(inode, folio->index + nr_pages);
 		last_block_in_file = (ext4_readpage_limit(inode) +
 				      blocksize - 1) >> blkbits;
@@ -342,8 +343,7 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 		 * BIO off first?
 		 */
 		if (bio && (last_block_in_bio != first_block - 1 ||
-			    !fscrypt_mergeable_bio(bio, inode,
-				(loff_t)next_block << blkbits))) {
+			    !fscrypt_mergeable_bio(bio, inode, pos))) {
 		submit_and_realloc:
 			blk_crypto_submit_bio(bio);
 			bio = NULL;
@@ -355,8 +355,7 @@ static int ext4_mpage_readpages(struct inode *inode, struct fsverity_info *vi,
 			 */
 			bio = bio_alloc(bdev, bio_max_segs(nr_pages),
 					REQ_OP_READ, GFP_KERNEL);
-			fscrypt_set_bio_crypt_ctx(bio, inode,
-					(loff_t)next_block << blkbits, GFP_KERNEL);
+			fscrypt_set_bio_crypt_ctx(bio, inode, pos, GFP_KERNEL);
 			ext4_set_bio_post_read_ctx(bio, inode, vi);
 			bio->bi_iter.bi_sector = first_block << (blkbits - 9);
 			bio->bi_end_io = mpage_end_io;
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
