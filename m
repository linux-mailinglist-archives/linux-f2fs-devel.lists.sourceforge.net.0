Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 44C545C012
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Jul 2019 17:34:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hhyJr-0005r3-UL; Mon, 01 Jul 2019 15:34:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hhyJq-0005q1-AS
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 15:34:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xMPQK7htrgD38vMGwiB9CkeSf02WHaj6x/TfDhcGmqI=; b=lEr3i+x5fnXMMpKkMqlrI5j/R0
 ukURg4L+u0LxToFkluUnIBKD6y7gXayi8bl1F1VWgbXbXN5GyI8jpR0jGKE7S+08Uq6Ok34l7WvQK
 kgmqNBC+3sWkxujhLmI7UWv4Cl0AeERrewykm0wYXrg/HdDby/FCXPGXyHrN+XgOAqFI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xMPQK7htrgD38vMGwiB9CkeSf02WHaj6x/TfDhcGmqI=; b=jaWLQ6WJgCHxkfI8+Dk4sda37E
 H+oiA0i/cLWBfmJl/xe1sW5nWbsLfAfcofAe0j1KLiesYlUo7GLbhln4Il4nHQyzxjqIlCzubGrY0
 kRVMO7qpE7RkW3PPgnVcq/ZyS6iBgqcD2xnQQoAy1Zw1N6bMIAcoQwXJ9feBQqRJGsuc=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hhyJt-003EfN-Jq
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 01 Jul 2019 15:34:19 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 3778D2184E;
 Mon,  1 Jul 2019 15:34:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1561995248;
 bh=L+AIuRxIiUWphoWiVAD6FM91CwzKUITTDRCJ2I5wCbg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=aW7VNaWXsyY/K2A5tIChycsil7p1/Z2NfHMBaM4BBCX1cKxSA15G2BGeC4NdqexRK
 H4zG3M4XRD1EXD1fPhD1by+kc1nmFZnXZWsLoRiIKzrkrE+I70HF7vqCIVd2VbO/7q
 gMlIjKwS1x632kXbFUUP1B5n454bBoz/b9cdbV/A=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  1 Jul 2019 08:32:32 -0700
Message-Id: <20190701153237.1777-13-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190701153237.1777-1-ebiggers@kernel.org>
References: <20190701153237.1777-1-ebiggers@kernel.org>
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
X-Headers-End: 1hhyJt-003EfN-Jq
Subject: [f2fs-dev] [PATCH v6 12/17] fs-verity: add SHA-512 support
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
index eaa2b3b93bbf..02a547f0667c 100644
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
index c0457915ca10..27cbecb86be7 100644
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
index 57d1d7fc0c34..da0daf6c193b 100644
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
