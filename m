Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8LK9EljzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:44 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 92B9B8401D
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAcol9QdzXS+invHeOPY57+fEnCiXMcyx1JV2YwjChg=; b=SEkGF+ay2qSp5JO4mRROkJFM6w
	gfU5kX2maym/Mr1MfDlBudUz9s55bE/tINdVeRmLXhYuw24H/V3GEE6cD5qDHqCiC6iIzWOArm9zU
	82cfNs5zDH8yaVHgP4KWLxFeuM9fvedzQR3RVwWZo4lORL8RQ+YkoOn+EFjpx7uWyC24=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEbd-0001u3-IG;
	Mon, 26 Jan 2026 04:53:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEbc-0001tw-DR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uz7fpZnjUlMd/aGr9OL/OJaWWyGR47o6Wopw3Zb7zdM=; b=l51DyKN63TROW5ZU/T6i0wN2gN
 L3DeEzAevVkXmYyvNxvgtEVOD+/PjoXGNMbwG38boVR+nNc0/Si/0aPiXqKJ4zQ0BBJzov+gR8wGS
 Y7ppm4iUMsjfGcvPM1fCTekRGR8qeoqoWDoLUdOEA8872BxyBmo7Ba51OAxQIsDWLVL4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uz7fpZnjUlMd/aGr9OL/OJaWWyGR47o6Wopw3Zb7zdM=; b=l5Qy7p5VKejreLouvHGQpMd8er
 Uu/tYcKCh2Q1HDYmHCFYTB5eyTWp5JUnB+pbCX8X4125yCEHPC6N7F86C+INqNi6GMFZgX1o1+rX3
 EpZQ0wE27NTwFMLNLO+1rixobg2bi9rFHv4v1uuud3BVIuPVOy3Ruy05vpO8R1vRp4IQ=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEbb-0001rf-Vp for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Uz7fpZnjUlMd/aGr9OL/OJaWWyGR47o6Wopw3Zb7zdM=; b=HaN/7K18H5UcWW9LjTxQe7V5ZE
 L8zQ5P5ZzK50LdGM5MpuShnnX+exrcEA8UyaICyDMA4HbWj4EEVnsAPq7PH3R8vRyibNZ54jBlqFj
 9ZtNxAHNWyDZLlUsW0+SVWIQ4mHBk0ko7AIsHCsJ4M4vZbFBvxSl6dDQ9YBfmB6PUliFOvbbpF5UK
 8dpAuiXRlM4GgY+NjeXVludsvP49/Eg0bw0w8wkzxnA86h3ibKFJk8rtarZZNdV5b0EOTMK5DQQdc
 oM6iMGdNMarSGsbrOXlaYdRSgJcnZ4oK5x2bkhGVpLbdjLgdlOvjHY3TCl0sf1bHBENGqSqkV4CiU
 3Maxk5DA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEbU-0000000BuTu-0kqU; Mon, 26 Jan 2026 04:53:32 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:58 +0100
Message-ID: <20260126045212.1381843-13-hch@lst.de>
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
 Content preview:  Look up the fsverity_info once in end_buffer_async_read_io, 
 and then pass it along to the I/O completion workqueue in struct
 postprocess_bh_ctx.
 This amortizes the lookup better once it becomes less efficient. 
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEbb-0001rf-Vp
Subject: [f2fs-dev] [PATCH 12/16] fs: consolidate fsverity_info lookup in
 buffer.c
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
X-Rspamd-Queue-Id: 92B9B8401D
X-Rspamd-Action: no action

Look up the fsverity_info once in end_buffer_async_read_io, and then
pass it along to the I/O completion workqueue in
struct postprocess_bh_ctx.

This amortizes the lookup better once it becomes less efficient.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/buffer.c | 27 +++++++++++----------------
 1 file changed, 11 insertions(+), 16 deletions(-)

diff --git a/fs/buffer.c b/fs/buffer.c
index 3982253b6805..f4b3297ef1b1 100644
--- a/fs/buffer.c
+++ b/fs/buffer.c
@@ -302,6 +302,7 @@ static void end_buffer_async_read(struct buffer_head *bh, int uptodate)
 struct postprocess_bh_ctx {
 	struct work_struct work;
 	struct buffer_head *bh;
+	struct fsverity_info *vi;
 };
 
 static void verify_bh(struct work_struct *work)
@@ -309,25 +310,14 @@ static void verify_bh(struct work_struct *work)
 	struct postprocess_bh_ctx *ctx =
 		container_of(work, struct postprocess_bh_ctx, work);
 	struct buffer_head *bh = ctx->bh;
-	struct inode *inode = bh->b_folio->mapping->host;
 	bool valid;
 
-	valid = fsverity_verify_blocks(*fsverity_info_addr(inode), bh->b_folio,
-				       bh->b_size, bh_offset(bh));
+	valid = fsverity_verify_blocks(ctx->vi, bh->b_folio, bh->b_size,
+				       bh_offset(bh));
 	end_buffer_async_read(bh, valid);
 	kfree(ctx);
 }
 
-static bool need_fsverity(struct buffer_head *bh)
-{
-	struct folio *folio = bh->b_folio;
-	struct inode *inode = folio->mapping->host;
-
-	return fsverity_active(inode) &&
-		/* needed by ext4 */
-		folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
-}
-
 static void decrypt_bh(struct work_struct *work)
 {
 	struct postprocess_bh_ctx *ctx =
@@ -337,7 +327,7 @@ static void decrypt_bh(struct work_struct *work)
 
 	err = fscrypt_decrypt_pagecache_blocks(bh->b_folio, bh->b_size,
 					       bh_offset(bh));
-	if (err == 0 && need_fsverity(bh)) {
+	if (err == 0 && ctx->vi) {
 		/*
 		 * We use different work queues for decryption and for verity
 		 * because verity may require reading metadata pages that need
@@ -359,15 +349,20 @@ static void end_buffer_async_read_io(struct buffer_head *bh, int uptodate)
 {
 	struct inode *inode = bh->b_folio->mapping->host;
 	bool decrypt = fscrypt_inode_uses_fs_layer_crypto(inode);
-	bool verify = need_fsverity(bh);
+	struct fsverity_info *vi = NULL;
+
+	/* needed by ext4 */
+	if (bh->b_folio->index < DIV_ROUND_UP(inode->i_size, PAGE_SIZE))
+		vi = fsverity_get_info(inode);
 
 	/* Decrypt (with fscrypt) and/or verify (with fsverity) if needed. */
-	if (uptodate && (decrypt || verify)) {
+	if (uptodate && (decrypt || vi)) {
 		struct postprocess_bh_ctx *ctx =
 			kmalloc(sizeof(*ctx), GFP_ATOMIC);
 
 		if (ctx) {
 			ctx->bh = bh;
+			ctx->vi = vi;
 			if (decrypt) {
 				INIT_WORK(&ctx->work, decrypt_bh);
 				fscrypt_enqueue_decrypt_work(&ctx->work);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
