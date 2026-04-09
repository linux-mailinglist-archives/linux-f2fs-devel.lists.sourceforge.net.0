Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id cD+IBD2m12lfQwgAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 15:14:37 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A31623CADDB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 09 Apr 2026 15:14:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qFuOOhtFGPW/uf/jJO4lJxw18AunmObsA6sxLGFcNZk=; b=K2B/VCHSVvvkwsU20L4w96hEXQ
	pQLNc0ePEfTQZTBxqHEfrKBmIcm4YZy2epfK+Pt/KptzkMZadGw0aVsP06Pf2BACyg/f7U+fXnyXs
	6o4UKiCDydrdS8XpI841u7d4a7vUbxdCypv/TB4KSJyEpPc5hWEIBdjfPDELG2kQF0eI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wApDP-0000T1-Be;
	Thu, 09 Apr 2026 13:14:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <aalbersh@kernel.org>) id 1wApDN-0000So-Uv
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 13:14:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NvBByjh2VJQ7E47QHKQUXSYu2um1tWZGSXmhmufwQ6A=; b=HA+DcVTcIuA8edPBEkHEb12uPt
 fO1mOTvHbQiHEKzbjpxtkrWmCIPYoZtx61T4QDaFZ0DXsqY9OaRyOYpBexD8ECjGuDV0dJDhZGy1e
 f43BNS9AhHfd97kHXVAETMXuqFfCQ6rmAOyj7gwEkQU+PCqIP6MZ3/nb1NTzNVRowpTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NvBByjh2VJQ7E47QHKQUXSYu2um1tWZGSXmhmufwQ6A=; b=jMYVSbJWos67eeUoCqmbVECCpO
 cTOMX/m1vOgD+QO4hjmBBwtg5HNJXK2uKRrd8GBCEy4XFYnC66dRg0VjhN2Z7fPFIAe49B5atGrDL
 odqno6G7bRDMvLCJgcweq+xkPjR0cIwbN+14Lm/yOC/cPwICAqttbxnfNtPyg++qI21s=;
Received: from sea.source.kernel.org ([172.234.252.31])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wApDN-0002Pa-Cp for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Apr 2026 13:14:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sea.source.kernel.org (Postfix) with ESMTP id 1E61E4342F;
 Thu,  9 Apr 2026 13:14:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C29CC4CEF7;
 Thu,  9 Apr 2026 13:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1775740463;
 bh=R9xmYqpzgIFigojr0fKbrRlBCOLoFi0C2ZAyyNYRUGM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=N+4GpqYMpCa77QHI2jc01o/xgt9IIbE6WntWpjngj5XLvNAKvBbnc/H1Mbv46iwyS
 Br4UJyOzX+fMFRHgADyerQHz3H5JyLpnQw8msI2tBWd4MQWOqfngWFnf95NS8JUJpU
 b1h9KNoNDX6viKe5IW6vkocmLP8FAqGn5lFDBYUuDpcPQt+GBByLaOOAQ+yrpPFb3G
 RddDtW/p2Fx23jKUGJ3lsUKX+krQkr8Iv0XIkiuhCsm9EHIDqHCX0MqxN921KPD2cA
 dzL59lstSBuq1yp0XHqouaPDu+3bVU9HlmCr+K0MbdIzBhQM+XA1Qn1mb/yHpK1bVg
 oOYKqix9G0vLQ==
To: linux-xfs@vger.kernel.org, fsverity@lists.linux.dev,
 linux-fsdevel@vger.kernel.org, ebiggers@kernel.org
Date: Thu,  9 Apr 2026 15:13:36 +0200
Message-ID: <20260409131404.1545834-5-aalbersh@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20260409131404.1545834-1-aalbersh@kernel.org>
References: <20260409131404.1545834-1-aalbersh@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Compute the hash of one filesystem block's worth of zeros.
 A filesystem implementation can decide to elide merkle tree blocks containing
 only this hash and synthesize the contents at read time. Let's pretend that
 there's a file containing 131 data block and whose merkle tree looks roughly
 like this: 
 Content analysis details:   (-0.7 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.5 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1wApDN-0002Pa-Cp
Subject: [f2fs-dev] [PATCH v7 04/22] fsverity: generate and store zero-block
 hash
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
 linux-f2fs-devel@lists.sourceforge.net, linux-ext4@vger.kernel.org, hch@lst.de,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-8.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_RECIPIENTS(0.00)[m:linux-xfs@vger.kernel.org,m:fsverity@lists.linux.dev,m:linux-fsdevel@vger.kernel.org,m:ebiggers@kernel.org,m:aalbersh@kernel.org,m:djwong@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-ext4@vger.kernel.org,m:hch@lst.de,m:linux-btrfs@vger.kernel.org,s:lists@lfdr.de];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,kernel.org:s=k20201202];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,kernel.org:-];
	RCVD_COUNT_FIVE(0.00)[5];
	NEURAL_HAM(-0.00)[-0.999];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	HAS_REPLYTO(0.00)[aalbersh@kernel.org]
X-Rspamd-Queue-Id: A31623CADDB
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
index 5562271bd628..e4503312d114 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -201,6 +201,8 @@ bool fsverity_verify_blocks(struct fsverity_info *vi, struct folio *folio,
 			    size_t len, size_t offset);
 void fsverity_verify_bio(struct fsverity_info *vi, struct bio *bio);
 void fsverity_enqueue_verify_work(struct work_struct *work);
+void fsverity_fill_zerohash(struct folio *folio, size_t poff, size_t plen,
+			      struct fsverity_info *vi);
 
 #else /* !CONFIG_FS_VERITY */
 
@@ -281,6 +283,12 @@ static inline void fsverity_enqueue_verify_work(struct work_struct *work)
 	WARN_ON_ONCE(1);
 }
 
+static inline void fsverity_fill_zerohash(struct folio *folio, size_t poff,
+		size_t plen, struct fsverity_info *vi)
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
