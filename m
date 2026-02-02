Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qMYlOWg/gGk65QIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:40 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 60E43C87EE
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 02 Feb 2026 07:08:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aw97sCWjfR+EUo8tgvJwkLaEr2ykjrZvt+Z5i2V1z7s=; b=mDa+eJ4qm+67HGTT0mx6DHYdbE
	WL18c3hnDlDzIRjGcHGqwrTa5zLdEw4S6NhOZ60Ot18DufCwiNjzliwCIcI/t5OF7EvDenffq52ut
	Gv88WPQZKXrJCKeJW3cJ7xk6j4IW89ONYV/Resa28l8Xwdc30wG9YKR/c7Xb857v44qE=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vmn70-0004t0-9m;
	Mon, 02 Feb 2026 06:08:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95) (envelope-from
 <BATV+1250474bd6e1e3d30609+8198+infradead.org+hch@bombadil.srs.infradead.org>)
 id 1vmn6y-0004sl-Rx for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1aUYwg7LuL+2OQnTsRXeUx2rKpMAyIXFooShlg2uRJ0=; b=A+kFkw/F81LBUhUIjVn9xuddE1
 1qnoDCXgOdFcsbRlt3Ub1PdmDVx0UqBtg3Xh0H9DdGVYeFTLAY5o69MSEMazE8RKq4NrwYDJcbsOh
 ZoSc/njIyXlWk4VtVo1gh+le6XQbP54NQ/IePeWZDxEwMumvNpPjLxcmOilvUVd9UCYM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1aUYwg7LuL+2OQnTsRXeUx2rKpMAyIXFooShlg2uRJ0=; b=MssPs3pG6ICy7ItEku639/IGpE
 awL2297zT+r/CFLEAn+xQIQnXbqIewqocPBfSnpW9lNNZTwHmpW3EKsKZh+a5RdAYz82xFcFTwCrq
 gebgzzMmGtrVUVQurV0pww1VZWzKwL6nYHXkPD4RxPM6zcGGhGx3qvm4dtdq/xssBdng=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vmn6z-0007qM-8C for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Feb 2026 06:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender
 :Reply-To:Content-Type:Content-ID:Content-Description;
 bh=1aUYwg7LuL+2OQnTsRXeUx2rKpMAyIXFooShlg2uRJ0=; b=dduNA+cILUbo3gcQb9pOM0WS/r
 0DINhas3jXg8D/mE9yRAEirmJI+E+ZCKr9vCtiS72nfG/rZS4yrrIoksmSAfhBg8N5DYw6ft0DaGN
 /60jHQR4K9PneEhwlrdljkAGeC4ENNcgLg+4MRUGqMhx3nls+eyHVAGpxC5BEmuQIf3clCbk3T+ht
 DXp8iCWxZoCSqigmduI9smvah9jGXDRPeCcXOmqurY6jBsJaAUFlp5cZEHPu10i5hLZ3FZ6NbfB1d
 bWijQTrz8kTloh3kLwPGPXefXMIVMa7rlc1hxdcYXTLrAu7aQauFR7Ju7feeA4dK307c17AkYHEue
 FuFt87NA==;
Received: from
 2a02-8389-2341-5b80-d601-7564-c2e0-491c.cable.dynamic.v6.surfer.at
 ([2a02:8389:2341:5b80:d601:7564:c2e0:491c] helo=localhost)
 by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
 id 1vmn6m-00000004UkL-1iqZ; Mon, 02 Feb 2026 06:08:24 +0000
From: Christoph Hellwig <hch@lst.de>
To: Eric Biggers <ebiggers@kernel.org>
Date: Mon,  2 Feb 2026 07:06:34 +0100
Message-ID: <20260202060754.270269-6-hch@lst.de>
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
 Content preview: A lot of file system code expects a non-const inode pointer.
 Dropping the const qualifier here allows using the inode pointer in
 verify_data_block
 and prepares for further argument reductions. Signed-off-by: Christoph Hellwig
 <hch@lst.de> Reviewed-by: "Darrick J. Wong" <djwong@kernel.org> ---
 fs/verity/fsverity_private.h
 | 4 ++-- fs/verity/open.c | 2 +- fs/verity/verify.c | 5 +++-- 3 files [...]
 Content analysis details:   (0.0 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 HEADER_FROM_DIFFERENT_DOMAINS From and EnvelopeFrom 2nd level mail
 domains are different
X-Headers-End: 1vmn6z-0007qM-8C
Subject: [f2fs-dev] [PATCH 05/11] fsverity: deconstify the inode pointer in
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
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	DMARC_POLICY_SOFTFAIL(0.10)[lst.de : SPF not aligned (relaxed), DKIM not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:ebiggers@kernel.org,m:fsverity@lists.linux.dev,m:brauner@kernel.org,m:tytso@mit.edu,m:djwong@kernel.org,m:aalbersh@redhat.com,m:willy@infradead.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-fsdevel@vger.kernel.org,m:viro@zeniv.linux.org.uk,m:jaegeuk@kernel.org,m:dsterba@suse.com,m:jack@suse.cz,m:linux-ext4@vger.kernel.org,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[hch@lst.de,linux-f2fs-devel-bounces@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,infradead.org:-];
	RCPT_COUNT_TWELVE(0.00)[15];
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
X-Rspamd-Queue-Id: 60E43C87EE
X-Rspamd-Action: no action

A lot of file system code expects a non-const inode pointer.  Dropping
the const qualifier here allows using the inode pointer in
verify_data_block and prepares for further argument reductions.

Signed-off-by: Christoph Hellwig <hch@lst.de>
Reviewed-by: "Darrick J. Wong" <djwong@kernel.org>
---
 fs/verity/fsverity_private.h | 4 ++--
 fs/verity/open.c             | 2 +-
 fs/verity/verify.c           | 5 +++--
 3 files changed, 6 insertions(+), 5 deletions(-)

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
index dac004f2a1a0..0de55c8e4217 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -157,9 +157,10 @@ static bool is_hash_block_verified(struct fsverity_info *vi, struct page *hpage,
  *
  * Return: %true if the data block is valid, else %false.
  */
-static bool verify_data_block(struct inode *inode, struct fsverity_info *vi,
+static bool verify_data_block(struct fsverity_info *vi,
 			      const struct fsverity_pending_block *dblock)
 {
+	struct inode *inode = vi->inode;
 	const u64 data_pos = dblock->pos;
 	const struct merkle_tree_params *params = &vi->tree_params;
 	const unsigned int hsize = params->digest_size;
@@ -362,7 +363,7 @@ fsverity_verify_pending_blocks(struct fsverity_verification_context *ctx)
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
