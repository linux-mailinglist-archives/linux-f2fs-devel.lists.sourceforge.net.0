Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KDx0J0vzdmkzZgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:31 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15DE084000
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jan 2026 05:53:31 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wXTRRh5MdHvaWQpLr1EgNjAM3V3KBeqYsgT8QONkmao=; b=PQMm2zZuuDdSvr9D416TuM1JMH
	z5oPMg2cp4C4M1tnE1MCGhO94zdUTz+KSoYBLfuvUtra06s6x4dIvG1DHb+fzbwlWQyWVvfn4y4Af
	JYx2/sC1WbCgpIesWh176pYgnfHCNsI1V3Po1uqpxkTOGG8b7taa7mw59lapWnG+sL6c=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vkEbR-0004DP-PL;
	Mon, 26 Jan 2026 04:53:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+12afb9bb7a5ef89fcdd0+8191+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vkEbQ-0004DD-EP for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Baqfeh51OjRK6HV70ZlkvyjNBgHNFVZMHUq9K/EvHmE=; b=AtVBmaCrm+Izs9fGRGU/sKjcoF
 I4ba7a983+5MQQXRWm6VQ4IkRfO8r6W7vpzrNnHXC5fMd8wf+N4/yIDwA4oBFIqKgeILY4zr6V53V
 Lj9k7oH6shXV1NHzg1nwBahg5f6vzw1SpyF/zxAjjIFGAxH1WY/1SwvuXxqm788KWEcs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Baqfeh51OjRK6HV70ZlkvyjNBgHNFVZMHUq9K/EvHmE=; b=hp2GeqrGfw3nIPBr3JpHWbcTKK
 OoesRR2JERQd+J7q9ncfUzplNzK6BjYsGcYdsbXNhSmWoGIttgFvX47ym4FpnCLOdCjmwdjE9jUnF
 TDP29jm1WKPpMZAWOFpXAXgynBJO1m+kSIaUgYwuz4GwQitLB/sHV2afnN/BEutvYLkM=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vkEbP-0001qs-Q6 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jan 2026 04:53:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=Baqfeh51OjRK6HV70ZlkvyjNBgHNFVZMHUq9K/EvHmE=; b=36i8DIzCQLF8pmg3reAtEbJ9sG
 wcJTE1jDQYLnsLttdxp10J2byuHQUOP9gMi9jTq5zjQMBiG4KSxECj54nsmbtK9aE/+0Q9U01o+N5
 D5kxWT9EYPA5Vmw50BOPmkcPJX3OhwSefv2ntcAZrc/bCSrWqCQ4+YkjmuyPUdWIDkRD1L1I69nB1
 2E2Di2YB0DnVI5CTpC9cgYtn5WeGmJKSmY29k3CBUeykc+T+3Q/JvRAe4BTYAqqoi7PvHHEq+6Zcv
 PiQbjjJpKZbTb1p5kmfNOWeck1HbO9wqdqsBU61SJC2LfOUJhrJRLBwY9ULYZ0Ae1cMnm/qW9qcaG
 68OVsN7A==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vkEbH-0000000BuT6-3zvi; Mon, 26 Jan 2026 04:53:20 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon, 26 Jan 2026 05:50:56 +0100
Message-ID: <20260126045212.1381843-11-hch@lst.de>
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
 Content preview: A lot of file system code expects a non-const inode pointer.
 Dropping the const qualifier here allows using the inode pointer in
 verify_data_block
 and prepares for further argument reductions. Signed-off-by: Christoph Hellwig
 <hch@lst.de> --- fs/verity/fsverity_private.h | 4 ++-- fs/verity/open.c |
 2 +- fs/verity/verify.c | 6 +++--- 3 files changed, 6 insertions(+),
 6 deletions(-)
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vkEbP-0001qs-Q6
Subject: [f2fs-dev] [PATCH 10/16] fsverity: deconstify the inode pointer in
 struct fsverity_info
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
X-Rspamd-Queue-Id: 15DE084000
X-Rspamd-Action: no action

A lot of file system code expects a non-const inode pointer.  Dropping
the const qualifier here allows using the inode pointer in
verify_data_block and prepares for further argument reductions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
---
 fs/verity/fsverity_private.h | 4 ++--
 fs/verity/open.c             | 2 +-
 fs/verity/verify.c           | 6 +++---
 3 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index dd20b138d452..f9f3936b0a89 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -73,7 +73,7 @@ struct fsverity_info {
 	struct merkle_tree_params tree_params;
 	u8 root_hash[FS_VERITY_MAX_DIGEST_SIZE];
 	u8 file_digest[FS_VERITY_MAX_DIGEST_SIZE];
-	const struct inode *inode;
+	struct inode *inode;
 	unsigned long *hash_block_verified;
 };
 
@@ -124,7 +124,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 				     unsigned int log_blocksize,
 				     const u8 *salt, size_t salt_size);
 
-struct fsverity_info *fsverity_create_info(const struct inode *inode,
+struct fsverity_info *fsverity_create_info(struct inode *inode,
 					   struct fsverity_descriptor *desc);
 
 void fsverity_set_info(struct inode *inode, struct fsverity_info *vi);
diff --git a/fs/verity/open.c b/fs/verity/open.c
index 090cb77326ee..128502cf0a23 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -175,7 +175,7 @@ static void compute_file_digest(const struct fsverity_hash_alg *hash_alg,
  * appended builtin signature), and check the signature if present.  The
  * fsverity_descriptor must have already undergone basic validation.
  */
-struct fsverity_info *fsverity_create_info(const struct inode *inode,
+struct fsverity_info *fsverity_create_info(struct inode *inode,
 					   struct fsverity_descriptor *desc)
 {
 	struct fsverity_info *vi;
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 881af159e705..55f1078c645a 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -156,10 +156,10 @@ static bool is_hash_block_verified(const struct fsverity_info *vi,
  *
  * Return: %true if the data block is valid, else %false.
  */
-static bool verify_data_block(struct inode *inode,
-			      const struct fsverity_info *vi,
+static bool verify_data_block(const struct fsverity_info *vi,
 			      const struct fsverity_pending_block *dblock)
 {
+	struct inode *inode = vi->inode;
 	const u64 data_pos = dblock->pos;
 	const struct merkle_tree_params *params = &vi->tree_params;
 	const unsigned int hsize = params->digest_size;
@@ -362,7 +362,7 @@ fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
 	}
 
 	for (i = 0; i < ctx->num_pending; i++) {
-		if (!verify_data_block(ctx->inode, vi, &ctx->pending_blocks[i]))
+		if (!verify_data_block(vi, &ctx->pending_blocks[i]))
 			return false;
 	}
 	fsverity_clear_pending_blocks(ctx);
-- 
2.47.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
