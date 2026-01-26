Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EGbHJkTzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3153B83FEB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=meN5rnZlCX8ths3su8bvRqPst63OKWE4WZjIB5geyRY=; b=aEFdlXo4M+eDi0UfinE6CV+7Xn
	KkybjWL8jlO7wf0YKo9NNxvMH9nmN4F1vpfxuB2LgZuYwpwLafNZlfZNrrAHlA/cUuNh61a0YPHN9
	MOpskcfMNdW0n6iaShp/e07X6KqHnL2UvJYF6nmGgmaSOJ9pwsveOvW7Qy3m1xXmNTUg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEbK-0003eJ-3m;
	Mon, 26 Jan 2026 04:53:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEbJ-0003eB-FN for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=A3Sc/Ix6P+xjJUGd+uCi/ak9QfXa0EvxxoJM7QjJPn0=; b=miNkpZ1YxX2Qv3xRLBOasnstkP
 dbXKYUetQ8uokeBvLUaG68TedU3tug46V8hGfqtkK71prKgxHK8rHsgxeo1F69B1OaUQn+RkYT+Nc
 EZqlds9WqkZu6j+AZgTYWUtALL9MAx24GU1/dn3RBWY1FPSeCfQUMIyr1yGkwqDKPWic=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=A3Sc/Ix6P+xjJUGd+uCi/ak9QfXa0EvxxoJM7QjJPn0=; b=DK4fLoWmuEvAtvfwP3P6WUl7BX
 zDXLrprtmDimLRkC7VwuUlm/CQmoC2msFLdAfe/FP0sq1U11ecj3F7T2K6Q7cpWZyTfeOJ+JENl4t
 zxmIX/jo+fWdgCCHsl7Wr4ReZErpj8g9m++dK+lZg9VqaQm1zTZZycSYLbhWbFoC4JCI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEbJ-0001qR-Ic for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=A3Sc/Ix6P+xjJUGd+uCi/ak9QfXa0EvxxoJM7QjJPn0=; b=2aycWPVlg3PMo3+nU+8gRTMqLc
 mhtj0dd+w2vqerkD+mWZDRNgkVsIphTrf5W5jWCpmB1EIO14atq8ls7tUNd5wjlmWOygZJJr/NeFe
 q0zq4+lh6MD+bvrGtxfwuSK4T9L/sMOTrhM/ykfXDC//e3jZNg2ua/3lHvhWp3xkc7n0Zs4ZHeWns
 qfzEWRM0aZZdqbrwJfvHXXsqsgyFrtnpSouQZsHrbiTTMVAboN4LLA//zE4ykwhq/O/+X9fh/EpEk
 toF8UcObDOZfHCahc7VvHmPBZjDDQ0yEJu3j5/sRnDCADL2KJgwQKh1rlmvPo228bgjLdce3XAz/a
 G6xBbT0w==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEbB-0000000BuSk-39EM; Mon, 26 Jan 2026 04:53:14 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:55 +0100
Message-ID: <20260126045212.1381843-10-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260126045212.1381843-1-hch@lst.de>
References: <20260126045212.1381843-1-hch@lst.de>
MIME-Version: 1.0
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by
 bombadil.infradead.org. See http://www.infradead.org/rpr.html
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: struct fsverity_info contains information that is only read
 in the verification path. Apply the const qualifier to match various
 explicitly
 passed arguments. Signed-off-by: Christoph Hellwig <hch@lst.de> ---
 fs/verity/verify.c
 | 15 ++++++++------- 1 file changed, 8 insertions(+), 7 deletions(-) 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEbJ-0001qR-Ic
Subject: [f2fs-dev] [PATCH 09/16] fsverity: constify the vi pointer in
 fsverity_verification_context
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email]
X-Rspamd-Queue-Id: 3153B83FEB
X-Rspamd-Action: no action

struct fsverity_info contains information that is only read in the
verification path.  Apply the const qualifier to match various explicitly
passed arguments.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/verity/verify.c | 15 ++++++++-------
 1 file changed, 8 insertions(+), 7 deletions(-)

diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 32cadb71953c..881af159e705 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -21,7 +21,7 @@ struct fsverity_pending_block {
 
 struct fsverity_verification_context {
 	struct inode *inode;
-	struct fsverity_info *vi;
+	const struct fsverity_info *vi;
 
 	/*
 	 * This is the queue of data blocks that are pending verification.  When
@@ -84,8 +84,8 @@ EXPORT_SYMBOL_GPL(fsverity_readahead);
  * Returns true if the hash block with index @hblock_idx in the tree, located in
  * @hpage, has already been verified.
  */
-static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
-				   unsigned long hblock_idx)
+static bool is_hash_block_verified(const struct fsverity_info *vi,
+				   struct page *hpage, unsigned long hblock_idx)
 {
 	unsigned int blocks_per_page;
 	unsigned int i;
@@ -156,7 +156,8 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
  *
  * Return: %true if the data block is valid, else %false.
  */
-static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
+static bool verify_data_block(struct inode *inode,
+			      const struct fsverity_info *vi,
 			      const struct fsverity_pending_block *dblock)
 {
 	const u64 data_pos = dblock->pos;
@@ -315,7 +316,7 @@ static void
 fsverity_init_verification_context(struct fsverity_verification_context *ctx,
 				   struct inode *inode)
 {
-	struct fsverity_info *vi = *fsverity_info_addr(inode);
+	const struct fsverity_info *vi = *fsverity_info_addr(inode);
 
 	ctx->inode = inode;
 	ctx->vi = vi;
@@ -342,7 +343,7 @@ fsverity_clear_pending_blocks(struct fsverity_verification_context *ctx)
 static bool
 fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
 {
-	struct fsverity_info *vi = ctx->vi;
+	const struct fsverity_info *vi = ctx->vi;
 	const struct merkle_tree_params *params = &vi->tree_params;
 	int i;
 
@@ -372,7 +373,7 @@ static bool fsverity_add_data_blocks(struct fsverity_verification_context *ctx,
 				     struct folio *data_folio, size_t len,
 				     size_t offset)
 {
-	struct fsverity_info *vi = ctx->vi;
+	const struct fsverity_info *vi = ctx->vi;
 	const struct merkle_tree_params *params = &vi->tree_params;
 	const unsigned int block_size = params->block_size;
 	u64 pos = (u64)data_folio->index << PAGE_SHIFT;
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
