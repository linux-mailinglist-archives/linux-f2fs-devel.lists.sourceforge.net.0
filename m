Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oOhJFHzecWk+MgAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 09:23:24 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E390D63013
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Jan 2026 09:23:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tAcol9QdzXS+invHeOPY57+fEnCiXMcyx1JV2YwjChg=; b=PCyIkG1NDll3ZWvQNaIKxyNjMB
	TllWIYMH5WRG+9GLkaPS464POr/YJFi7mL6WLPEpWXbuO7dGalzmaumwf0a2XD+9Ujb2SkRwS68rj
	2ar2m3r9nWjwyYPJ2ebAEBi5bIDNCqGPDDrQo2hvYqm7aDcm6YZ76hdQaEoWrjWUsIVg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vipyL-0001sf-RE;
	Thu, 22 Jan 2026 08:23:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+561f00ef1fac768e3611+8187+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vipyI-0001s7-CL for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 08:23:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Uz7fpZnjUlMd/aGr9OL/OJaWWyGR47o6Wopw3Zb7zdM=; b=m03MqU5qkOFbfAGOZkYgbLcE4y
 SHMP4KChHNP2TdE4OcF/84QNHXgQso8DfPkkpVifR5cuCzVXQCrL54bZuL4V6si9EL70lhjIHZdJv
 RoNvxEOugTxUyJRemWghspqEr5jU4TdKLhI56FR8feBAOj0bYwUij4HtHBEmVJ37oh5Y=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Uz7fpZnjUlMd/aGr9OL/OJaWWyGR47o6Wopw3Zb7zdM=; b=fgZbBmumiFn8+IxpIV/EzRTzyS
 J3MoWCttbb92ikD8Xg1Q+TP2pWVCo9icxam63mfEpNWO3ZJ7MbjoUG/4GzB9jg4h7IfmTlkP9676c
 w04LZCznT2TuYzjLN+yxLu3iDPmXLewsRJDUwEqKPBL2Kqyp8FidQeFY1YU0AnOxN1vI=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vipyH-0005I2-En for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 Jan 2026 08:23:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Uz7fpZnjUlMd/aGr9OL/OJaWWyGR47o6Wopw3Zb7zdM=; b=WN+gg7r8VVeZUsfkGpEY+bVNIR
 pPQE7vV6wEEJ91SJdSOlr31GM924930lgYaKOWoMR24hiORPnakfIYVOUSK47hbaIuWi5cu7d1aD9
 850a1dCW9DRw+v8bBa8mcFLgdVJN+2hygDwW3oF2jsO5CIUtY6Ppzequej/JC+qUsT2r4TAPl8U1u
 rEAcKxFjpJIbqYxqcieX/UbUAbQqvGHD4AtvhN9A4kYbZZ86GK7r6JEzSo/sW5vxuMr4OVKlepJLH
 RZOMt/45XpxBSR94DU/b+1s4Eq8O1UC/inOYgVR0WZ1oVEcYHiiwrlHsiAV7VwD3tdvZ6TDjAI3nm
 qUOgUxhA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vipy4-00000006dvK-3tHV; Thu, 22 Jan 2026 08:23:05 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Thu, 22 Jan 2026 09:22:03 +0100
Message-ID: <20260122082214.452153-8-hch@lst.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260122082214.452153-1-hch@lst.de>
References: <20260122082214.452153-1-hch@lst.de>
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
X-Headers-End: 1vipyH-0005I2-En
Subject: [f2fs-dev] [PATCH 07/11] fs: consolidate fsverity_info lookup in
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
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Al Viro <viro@zeniv.linux.org.uk>, Jaegeuk Kim <jaegeuk@kernel.org>,
 David Sterba <dsterba@suse.com>, Jan Kara <jack@suse.cz>,
 linux-ext4@vger.kernel.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.01 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_NEQ_ENVFROM(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,infradead.org:s=bombadil.20210309];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	TO_DN_SOME(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lst.de:mid,lst.de:email,lists.sourceforge.net:dkim,lists.sourceforge.net:helo,lists.sourceforge.net:rdns]
X-Rspamd-Queue-Id: E390D63013
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
