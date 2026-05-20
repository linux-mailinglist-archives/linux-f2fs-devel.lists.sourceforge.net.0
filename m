Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id SCtfADarDWox1QUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:38:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A8B958DD9C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 May 2026 14:38:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UUCf7tENqygRSavYK9zgfLTpAKnZHvGKAV+3YQtk/fo=; b=jRdUS20S2C0Dw79ueY96iYDULP
	lO93XvDIeDwbBnyAvwbJ6VZ7ARACBWWzamxhxEcZtG9cOnYjniNPU8kJ4eObWD3rZF5BqOCnaECKu
	LsjCqm73If9JP+3TydxZthki3vNBTZ2eGVBo0vSwU9UrWSLHZV1lQfxzhipGNc02CJ3Q=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wPgBe-0001OZ-Cw;
	Wed, 20 May 2026 12:38:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wPgBJ-0001NA-Rj
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:37:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2W/huMs5akZB5W5rF4xsjMB8NN0kUDnKQc173nD7tcM=; b=j3JEtebI7p2eOJnlbDqwi7zLH1
 5MEbGXp4XARu6Wgz3z9nfbu1E5uuO6KE0MdR3/httsDN1t/KznSq8XEJHUC7VmRzSkingVgZIFeBt
 AzEEn4Dh02tQ582TvfrrbbWw0lMNqJVeSa80XNDAUi+4jZIHMJa97sS1JJeTwTApi+rI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2W/huMs5akZB5W5rF4xsjMB8NN0kUDnKQc173nD7tcM=; b=SuxEd9AaohdXaeq/XwZLo6s/0O
 8VUQDM6BjGWxg4kZ2YlEkBT0Gin4wH1hDeUNylKjGsxqTGFvwjGig0hniZiQSOzlAaCOAAJmDoBnI
 /yTAuayrK/9DOfkxvGHhfwO8kU/1RvDwHfdl/ftcIj3V+h0w4hoLja/6w24Ps/OdYQJA=;
Received: from tor.source.kernel.org ([172.105.4.254])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wPgBI-0006Yh-N1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 May 2026 12:37:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
 by tor.source.kernel.org (Postfix) with ESMTP id 9CFA3601FC;
 Wed, 20 May 2026 12:37:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 546551F000E9;
 Wed, 20 May 2026 12:37:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
 s=k20260515; t=1779280658;
 bh=2W/huMs5akZB5W5rF4xsjMB8NN0kUDnKQc173nD7tcM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References;
 b=Y49jq1xDXpkx5lth7cEu6Rnyxy1WAsb6OpI4S+ps/ssxvZvOAZEjHOLGJl/T0yv2j
 xFJF++hXx0WHof0IZJR0LCxGNDa9J3L7rpwMl/2L+vSUkzBBnuOEg5KCAqYtmVToWi
 8gVF44DEgxQ6fE3RZntO/sUmd4OUGCb9B9U3/uZEf4VdlJyad+O0bC4239T9RIumWA
 g1PBEwe1Wt21uA1539p2TxgHSGdVyrp+sgEcY3kxf3u105Kjy4FHTlYFpv1QDfsFmI
 7vNMPoWuVkBH1UkK354nry7Tvwdy28FNOH6cjlicjebm6fJWrljXG2EBRviEO/AhOx
 ctUAWKAObQH5g==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Wed, 20 May 2026 14:37:02 +0200
Message-ID: <20260520123722.405752-5-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260520123722.405752-1-aalbersh@kernel.org>
References: <20260520123722.405752-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compute the hash of one filesystem block's worth of zeros.
 A filesystem implementation can decide to elide merkle tree blocks containing
 only this hash and synthesize the contents at read time. Let's pretend that
 there's a file containing 131 data block and whose merkle tree looks roughly
 like this: 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1wPgBI-0006Yh-N1
Subject: [f2fs-dev] [PATCH v10 04/22] fsverity: generate and store
 zero-block hash
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
From: Andrey Albershteyn via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Andrey Albershteyn <aalbersh@kernel.org>
Cc: Andrey Albershteyn <aalbersh@kernel.org>, djwong@kernel.org,
 linux-unionfs@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-ext4@vger.kernel.org, hch@lst.de, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-unionfs@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20260515];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org];
	RCPT_COUNT_SEVEN(0.00)[11];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo]
X-Rspamd-Queue-Id: 8A8B958DD9C
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

Compute the hash of one filesystem block's worth of zeros. A filesystem
implementation can decide to elide merkle tree blocks containing only
this hash and synthesize the contents at read time.

Let's pretend that there's a file containing 131 data block and whose
merkle tree looks roughly like this:

root
 +--leaf0
 |   +--data0
 |   +--data1
 |   +--...
 |   `--data128
 `--leaf1
     +--data129
     +--data130
     `--data131

If data[0-128] are sparse holes, then leaf0 will contain a repeating
sequence of @zero_digest.  Therefore, leaf0 need not be written to disk
because its contents can be synthesized.

A subsequent xfs patch will use this to reduce the size of the merkle
tree when dealing with sparse gold master disk images and the like.

Note that this works only on the first-level (data holes). fsverity
doesn't store/generate zero_digest for any higher levels.

Add a helper to pre-fill folio with hashes of empty blocks. This will be
used by iomap to synthesize blocks full of zero hashes on the fly.

Signed-off-by: Darrick J. Wong <djwong@kernel.org>
Acked-by: Eric Biggers <ebiggers@kernel.org>
Signed-off-by: Andrey Albershteyn <aalbersh@kernel.org>
---
 fs/verity/fsverity_private.h |  3 +++
 fs/verity/measure.c          |  4 ++--
 fs/verity/open.c             |  3 +++
 fs/verity/pagecache.c        | 22 ++++++++++++++++++++++
 include/linux/fsverity.h     |  8 ++++++++
 5 files changed, 38 insertions(+), 2 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 6e6854c19078..881d46f25e08 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -53,6 +53,9 @@ struct merkle_tree_params {
 	u64 tree_size;			/* Merkle tree size in bytes */
 	unsigned long tree_pages;	/* Merkle tree size in pages */
 
+	/* the hash of an all-zeroes block */
+	u8 zero_digest[FS_VERITY_MAX_DIGEST_SIZE];
+
 	/*
 	 * Starting block index for each tree level, ordered from leaf level (0)
 	 * to root level ('num_levels - 1')
diff --git a/fs/verity/measure.c b/fs/verity/measure.c
index 6a35623ebdf0..818083507885 100644
--- a/fs/verity/measure.c
+++ b/fs/verity/measure.c
@@ -68,8 +68,8 @@ EXPORT_SYMBOL_GPL(fsverity_ioctl_measure);
  * @alg: (out) the digest's algorithm, as a FS_VERITY_HASH_ALG_* value
  * @halg: (out) the digest's algorithm, as a HASH_ALGO_* value
  *
- * Retrieves the fsverity digest of the given file.  The file must have been
- * opened at least once since the inode was last loaded into the inode cache;
+ * Retrieves the fsverity digest of the given file. The
+ * fsverity_ensure_verity_info() must be called on the inode beforehand;
  * otherwise this function will not recognize when fsverity is enabled.
  *
  * The file's fsverity digest consists of @raw_digest in combination with either
diff --git a/fs/verity/open.c b/fs/verity/open.c
index d32d0899df25..875e8850ccba 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -153,6 +153,9 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 		goto out_err;
 	}
 
+	fsverity_hash_block(params, page_address(ZERO_PAGE(0)),
+			    params->zero_digest);
+
 	params->tree_size = offset << log_blocksize;
 	params->tree_pages = PAGE_ALIGN(params->tree_size) >> PAGE_SHIFT;
 	return 0;
diff --git a/fs/verity/pagecache.c b/fs/verity/pagecache.c
index 1819314ecaa3..99f5f53eea98 100644
--- a/fs/verity/pagecache.c
+++ b/fs/verity/pagecache.c
@@ -2,6 +2,7 @@
 /*
  * Copyright 2019 Google LLC
  */
+#include "fsverity_private.h"
 
 #include <linux/export.h>
 #include <linux/fsverity.h>
@@ -56,3 +57,24 @@ void generic_readahead_merkle_tree(struct inode *inode, pgoff_t index,
 		folio_put(folio);
 }
 EXPORT_SYMBOL_GPL(generic_readahead_merkle_tree);
+
+/**
+ * fsverity_fill_zerohash() - fill folio with hashes of zero data block
+ * @folio:	folio to fill
+ * @offset:	offset in the folio to start
+ * @len:	length of the range to fill with hashes
+ * @vi:		fsverity info
+ */
+void fsverity_fill_zerohash(struct folio *folio, size_t offset, size_t len,
+			      struct fsverity_info *vi)
+{
+	size_t off = offset;
+
+	WARN_ON_ONCE(!IS_ALIGNED(offset, vi->tree_params.digest_size));
+	WARN_ON_ONCE(!IS_ALIGNED(len, vi->tree_params.digest_size));
+
+	for (; off < (offset + len); off += vi->tree_params.digest_size)
+		memcpy_to_folio(folio, off, vi->tree_params.zero_digest,
+				vi->tree_params.digest_size);
+}
+EXPORT_SYMBOL_GPL(fsverity_fill_zerohash);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 5562271bd628..3c3250f6f272 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -201,6 +201,8 @@ bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
 			    size_t len, size_t offset);
 void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
+void fsverity_fill_zerohash(struct folio *folio, size_t offset, size_t len,
+			    struct fsverity_info *vi);
 
 #else /* !CONFIG_FS_VERITY */
 
@@ -281,6 +283,12 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 	WARN_ON_ONCE(1);
 }
 
+static inline void fsverity_fill_zerohash(struct folio *folio, size_t offset,
+		size_t len, struct fsverity_info *vi)
+{
+	WARN_ON_ONCE(1);
+}
+
 #endif	/* !CONFIG_FS_VERITY */
 
 static inline bool fsverity_verify_folio(struct fsverity_info *vi,
-- 
2.51.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
