Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DD71705F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 22 Jul 2019 18:54:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hpbZe-00008K-AL; Mon, 22 Jul 2019 16:54:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hpbZc-00007o-6l
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=t3Cy9bJJAPBVTjn/HZPxZ4rMRtczwHLgdRFZnO1FYzI=; b=bo8JBC3uT6JdYCuoOvnJDAVibz
 Sx4K6Eb9PkJAgWLiCEN0j2XDsoZuMyiws/B4yiXGy6FapU2Pn8w6+o7lOfy2kXSJTpbPR7kMoPzrz
 0nhdZ3iDjNn9sbw8chlQieUotmVX2yadv4S6DLwzV1C40+JNPITCizyX1SNyHmFn3kOE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=t3Cy9bJJAPBVTjn/HZPxZ4rMRtczwHLgdRFZnO1FYzI=; b=IcXk+SmUc7l3lGEiYdSjoLHrDG
 nKm69PeMcvgAdQ53eRu7h/+tl4YPLee7jW/Ack33/N//HI7DHLa+l4RY80ohk/2kI1k7yXa+KZZWm
 B38Kw6wMs79AKA6ZdjsC1m5f2sSZmJbHZGWfuQOg6BtRCP4zEZcJPdwOM7hiJ0TL+XwM=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hpbZa-00AyRf-D6
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 22 Jul 2019 16:54:04 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 97DA62238B;
 Mon, 22 Jul 2019 16:53:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1563814435;
 bh=MtgVL37HoieBzfwCF9QKMfV3RzqX01u5pulUzyh1zjs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=dl+X0Jhd8vUnGd4wD7CdFlZ3y+5VijX1Ud7MZcREThYG+qqhAUDdMp9gty2ulXMPM
 ZWfzynUL/ZHFFDCQD/gUZx8SMioc8FTYbZlhAacfHqaolrdhdBQf7HgFqDBA3dWCXw
 94bUdq2dtmr57kFq3N2hm6X8yErmXKLTNvfxLmWo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon, 22 Jul 2019 09:50:56 -0700
Message-Id: <20190722165101.12840-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190722165101.12840-1-ebiggers@kernel.org>
References: <20190722165101.12840-1-ebiggers@kernel.org>
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
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hpbZa-00AyRf-D6
Subject: [f2fs-dev] [PATCH v7 12/17] fs-verity: add SHA-512 support
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>,
 "Darrick J . Wong" <darrick.wong@oracle.com>, linux-api@vger.kernel.org,
 Dave Chinner <david@fromorbit.com>, linux-f2fs-devel@lists.sourceforge.net,
 linux-fsdevel@vger.kernel.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-integrity@vger.kernel.org, linux-ext4@vger.kernel.org,
 Linus Torvalds <torvalds@linux-foundation.org>, Christoph Hellwig <hch@lst.de>,
 Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add SHA-512 support to fs-verity.  This is primarily a demonstration of
the trivial changes needed to support a new hash algorithm in fs-verity;
most users will still use SHA-256, due to the smaller space required to
store the hashes.  But some users may prefer SHA-512.

Reviewed-by: Theodore Ts'o <tytso@mit.edu>
Reviewed-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h  | 2 +-
 fs/verity/hash_algs.c         | 5 +++++
 include/uapi/linux/fsverity.h | 1 +
 3 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index eaa2b3b93bbf6..02a547f0667c1 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -29,7 +29,7 @@ struct ahash_request;
  * Largest digest size among all hash algorithms supported by fs-verity.
  * Currently assumed to be <= size of fsverity_descriptor::root_hash.
  */
-#define FS_VERITY_MAX_DIGEST_SIZE	SHA256_DIGEST_SIZE
+#define FS_VERITY_MAX_DIGEST_SIZE	SHA512_DIGEST_SIZE
 
 /* A hash algorithm supported by fs-verity */
 struct fsverity_hash_alg {
diff --git a/fs/verity/hash_algs.c b/fs/verity/hash_algs.c
index 7df1d67742b84..31e6d7d2389ab 100644
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
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
