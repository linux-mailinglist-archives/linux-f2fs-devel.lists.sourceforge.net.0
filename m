Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D395E65546F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8onA-0003R8-L8;
	Fri, 23 Dec 2022 20:37:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omy-0003Pk-Gz
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=x9+knnFzhP55odH/zxflOxdWuprPUFqwZMD4vLoY/Yw=; b=iLkROs5vqGvh4tlceeZ73NlY5S
 tuYHfosDuPUuBDloa+TM/9gflNC5agvj8iv2rruW7OtALJQFkq0UnhSoS6rN0O3KKLj5bKQ/jbfpx
 BlFkfPSwkqQ+UF64WM9/dkbAjaWcXCzOGu2kcUkFK6jWhwlY6iGrX04L+XWkSilAOz+c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=x9+knnFzhP55odH/zxflOxdWuprPUFqwZMD4vLoY/Yw=; b=hGCsaJXKpQjA9xZoFiu5c9UFB6
 9v4S3F7S6mjzk2UeXuMrD2FcfZ2aIavZbUBPq3I5QIHYo+j5CJyAMN2bs8WO4YyWAxtF0BZAbR+5x
 35jy4LdIOnwgsViyspafRC0H91mq/MjIn16k2rKIE46g9KWJorAY0Y0IPf/Ax4cfoxRc=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8omv-00088m-JC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:08 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by ams.source.kernel.org (Postfix) with ESMTPS id 828D0B82141;
 Fri, 23 Dec 2022 20:36:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8F55C433EF;
 Fri, 23 Dec 2022 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827817;
 bh=wN7s/A4toTfgS+KIXn99r7XJg8+e84l5l3auBwZ0mnc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=d+p4IyQ3t6U+M3aSYLY7BTKWPteCG8tVzna1JJQAIpse35DoJuLJVcnL9qLS4mzyh
 k7KwBMCk5nVGNNDuy2jvKNYRFsk5/nDWizFU+pzBPFBHk7xgCOw85MKqG17wjP18lX
 X8T9nGdOTH1z0NJ+Vos6/3qahMbaj5/jamCSA4XFqXx0oI+PtiZ/MgtUbJ2VNW1Rvo
 RCCMc80qeU3NmXJ6t9NCaBooCNzueEY61w6QyElnwELbfer37W5f7YGtJsKYPqErmQ
 41EyJ9E5j5WcBWIHGP00Uhg49JEFBe4CwecifaNHeN7+914nLOLfgCq/fZ5IsWLkaD
 dHUMnqCIZJZgw==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:30 -0800
Message-Id: <20221223203638.41293-4-ebiggers@kernel.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221223203638.41293-1-ebiggers@kernel.org>
References: <20221223203638.41293-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.4 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Eric Biggers <ebiggers@google.com> Add log_digestsize
 to struct merkle_tree_params so that it can be used in verify.c. Also save
 memory by using u8 for all the log_* fields. Signed-off-by: Eric Biggers
 <ebiggers@google.com> --- fs/verity/fsverity_private.h | 5 +++--
 fs/verity/open.c
 | 3 ++- fs/verity/verify.c | 2 +- 3 files changed, 6 insertions(+),
 4 deletions(-)
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 2.5 SUSPICIOUS_RECIPS      Similar addresses in recipient list
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1p8omv-00088m-JC
Subject: [f2fs-dev] [PATCH v2 03/11] fsverity: store log2(digest_size)
 precomputed
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
Cc: Andrey Albershteyn <aalbersh@redhat.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add log_digestsize to struct merkle_tree_params so that it can be used
in verify.c.  Also save memory by using u8 for all the log_* fields.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h | 5 +++--
 fs/verity/open.c             | 3 ++-
 fs/verity/verify.c           | 2 +-
 3 files changed, 6 insertions(+), 4 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 48b97f5d05569..fc1c2797fab19 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -42,8 +42,9 @@ struct merkle_tree_params {
 	unsigned int digest_size;	/* same as hash_alg->digest_size */
 	unsigned int block_size;	/* size of data and tree blocks */
 	unsigned int hashes_per_block;	/* number of hashes per tree block */
-	unsigned int log_blocksize;	/* log2(block_size) */
-	unsigned int log_arity;		/* log2(hashes_per_block) */
+	u8 log_digestsize;		/* log2(digest_size) */
+	u8 log_blocksize;		/* log2(block_size) */
+	u8 log_arity;			/* log2(hashes_per_block) */
 	unsigned int num_levels;	/* number of levels in Merkle tree */
 	u64 tree_size;			/* Merkle tree size in bytes */
 	unsigned long tree_pages;	/* Merkle tree size in pages */
diff --git a/fs/verity/open.c b/fs/verity/open.c
index e356eefb54d7b..ca8de73e5a0b8 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -76,7 +76,8 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 		err = -EINVAL;
 		goto out_err;
 	}
-	params->log_arity = params->log_blocksize - ilog2(params->digest_size);
+	params->log_digestsize = ilog2(params->digest_size);
+	params->log_arity = log_blocksize - params->log_digestsize;
 	params->hashes_per_block = 1 << params->log_arity;
 
 	/*
diff --git a/fs/verity/verify.c b/fs/verity/verify.c
index 4c57a1bd01afc..d2fcb6a21ea8e 100644
--- a/fs/verity/verify.c
+++ b/fs/verity/verify.c
@@ -35,7 +35,7 @@ static void hash_at_level(const struct merkle_tree_params *params,
 
 	/* Offset of the wanted hash (in bytes) within the hash block */
 	*hoffset = (position & ((1 << params->log_arity) - 1)) <<
-		   (params->log_blocksize - params->log_arity);
+		   params->log_digestsize;
 }
 
 static inline int cmp_hashes(const struct fsverity_info *vi,
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
