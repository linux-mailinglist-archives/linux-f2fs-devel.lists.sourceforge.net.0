Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3CFA7282DA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:20:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSZ-0002CD-Ul; Thu, 23 May 2019 16:20:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSZ-0002Bj-Fa
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=uRsH7kJvqW297taDsoJD6ZNDEy6i2WrQLEXx+XmF03M=; b=Lrm63dwpifWMhF1JDNlXa8lUhN
 XwIIOFbUr11Tuvz/G4howCwYskX5C4WLcUi3PcfmJzLMQ5cyDGc05s6sJ41OlR2aLzGnqtl9noNT6
 aliLV0HBbLypOGwEW6UfLpbfPmWpp6ROYGrjhvH+A8rC/eKSXp4ttJ9VobnWvFOM8J1s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=uRsH7kJvqW297taDsoJD6ZNDEy6i2WrQLEXx+XmF03M=; b=hSET2FVoKFerLYoHA8Yf2xREMd
 T12HNiqa/fmgFH6NOaY8Dx9Ld4xOL7fzie59rS/k9lBCi3Smwzg2iL/fWlv66EH4fc2flrGbKVANA
 RDyUZsHxhEDgPhV8VX+uHYSM4SRKJYfbRnsOsU4ZyDydnUZeVBO5/4uNmYX6Vr+Xpvyg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSY-00355V-10
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:51 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 0DEC821850;
 Thu, 23 May 2019 16:20:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628439;
 bh=orQpc2Xz3R2tuxw4FKZyiEuFe+qzuslAy4KaeYFzr7I=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hKEKBAB2icXk/CpAjSKNQJ/ncdh5G54YzhlgI4NQqI0gqAblH25O3TlmivM8xJwxx
 fA0yqRSEgfLnM9vIC9o8k1NDkv0eBvR13c48kWmfxSyBIDtDWfP5sCW+2ixuuT1Bil
 E43bUOTdnnMbjLsoDU1xdPLDoximMrdYOmDBpwbU=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:07 -0700
Message-Id: <20190523161811.6259-12-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523161811.6259-1-ebiggers@kernel.org>
References: <20190523161811.6259-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hTqSY-00355V-10
Subject: [f2fs-dev] [PATCH v3 11/15] fs-verity: add SHA-512 support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add SHA-512 support to fs-verity.  This is primarily a demonstration of
the trivial changes needed to support a new hash algorithm in fs-verity;
most users will still use SHA-256, due to the smaller space required to
store the hashes.  But some users may prefer SHA-512.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h  | 2 +-
 fs/verity/hash_algs.c         | 5 +++++
 include/uapi/linux/fsverity.h | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index 9db64f4d178c7..f5c616f4d4c04 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -31,7 +31,7 @@ struct ahash_request;
  * Largest digest size among all hash algorithms supported by fs-verity.
  * Currently assumed to be <= size of fsverity_descriptor::root_hash.
  */
-#define FS_VERITY_MAX_DIGEST_SIZE	SHA256_DIGEST_SIZE
+#define FS_VERITY_MAX_DIGEST_SIZE	SHA512_DIGEST_SIZE
 
 /* A hash algorithm supported by fs-verity */
 struct fsverity_hash_alg {
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index 1d7dcd3cec406..4561022e0261d 100644
--- a/fs/verity/hash_algs.c
+++ b/fs/verity/hash_algs.c
@@ -17,6 +17,11 @@ struct fsverity_hash_alg fsverity_hash_algs[] = {
 		.digest_size = SHA256_DIGEST_SIZE,
 		.block_size = SHA256_BLOCK_SIZE,
 	},
+	[FS_VERITY_HASH_ALG_SHA512] = {
+		.name = "sha512",
+		.digest_size = SHA512_DIGEST_SIZE,
+		.block_size = SHA512_BLOCK_SIZE,
+	},
 };
 
 /**
diff --git a/include/uapi/linux/fsverity.h b/include/uapi/linux/fsverity.h
index 57d1d7fc0c345..da0daf6c193b4 100644
--- a/include/uapi/linux/fsverity.h
+++ b/include/uapi/linux/fsverity.h
@@ -14,6 +14,7 @@
 #include <linux/types.h>
 
 #define FS_VERITY_HASH_ALG_SHA256	1
+#define FS_VERITY_HASH_ALG_SHA512	2
 
 struct fsverity_enable_arg {
 	__u32 version;
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
