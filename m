Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E3F51655469
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 23 Dec 2022 21:37:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p8on8-0004iV-MZ;
	Fri, 23 Dec 2022 20:37:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ebiggers@kernel.org>) id 1p8omx-0004ht-9a
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=B2r4/T1tUmv3fr1qrcqLg309McSqFijWf07I2550xJw=; b=U+SZEmdduhMlQS5A807r0cXXbB
 28Fnrbkx3suWt6wFSs0kxwiQZoTUe+/z1eGYOGy+zdJXPVNMIXxvuf0wMZjMrlkYEJTo8U4jkqn0s
 FdNVEJZY9TcMy3NY/bBPDFZOf1KnER2vy+KiUC51vILoXr3S3Pc+S2TptUYYwew+zS7Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=B2r4/T1tUmv3fr1qrcqLg309McSqFijWf07I2550xJw=; b=FuO+vPkkdd+dIDpxBjukSCVcHC
 P7YTb0PZPzuQMWBheuFHoYfIo9Ub5UM8UbftFM+BCt60dOB/goDAMYLVjkpkusyIqE+V9tBct1zve
 1uOfOcOBWCa7nMFl7fTrRMmar/2Po/Xcxzs3BfZHAB2oggIJyEW9/btRqNBWzjaAsPek=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p8oms-00088N-D4 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 23 Dec 2022 20:37:07 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 0454361EA5;
 Fri, 23 Dec 2022 20:36:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C4AAC433F0;
 Fri, 23 Dec 2022 20:36:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1671827816;
 bh=iUdBvdNiQeVKQXe2/6eUg98m/CYbzWe1kqf/gTptRGs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=o8C+LgP264e1gacZYiTziQL/GH12JCvASKiy5SXoD1HtZfRYZgkHJnfdt2sNMXL0v
 X34BZqbXGrrKNvyzK3y83BjWzbYzV5+Q1Is+CpOJXNGdxZDkXLyjDTQUga5Q2CZpCw
 OqVIOMlddULiPdjDnZ3AymdRzg1VekEkK3hxKn9z04fj6l6qHYAgUz5kgQN0f41Od9
 gAi0ffWHW59SXVPnfoc5xbsnhxtkkvYOI/9lYfpiJE0UuQWSj5+gwE6Mx9N32bmvLx
 gZsX1DoA4hCdVrVaOBmsJQJMOwKM95SYpLYribt5jmS/hpnI7h7Xb+DI4LHfKiL+mL
 ZLwS/xH9MtKVQ==
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Fri, 23 Dec 2022 12:36:28 -0800
Message-Id: <20221223203638.41293-2-ebiggers@kernel.org>
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
 Content preview:  From: Eric Biggers <ebiggers@google.com> fs/verity/ isn't
 consistent with whether Merkle tree block indices are 'unsigned long' or
 'u64'.
 There's no real point to using u64 for them, though, since (a) a Merkle tree
 with over ULONG_MAX blocks [...] 
 Content analysis details:   (-3.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
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
X-Headers-End: 1p8oms-00088N-D4
Subject: [f2fs-dev] [PATCH v2 01/11] fsverity: use unsigned long for
 level_start
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

fs/verity/ isn't consistent with whether Merkle tree block indices are
'unsigned long' or 'u64'.  There's no real point to using u64 for them,
though, since (a) a Merkle tree with over ULONG_MAX blocks would only be
needed for a file larger than MAX_LFS_FILESIZE, and (b) for reads, the
status of all Merkle tree blocks has to be tracked in memory.

Therefore, let's make things a bit more efficient on 32-bit systems by
using 'unsigned long[]' for merkle_tree_params::level_start, instead of
'u64[]'.  Also, to be extra safe, explicitly check that there aren't
more than ULONG_MAX Merkle tree blocks.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/fsverity_private.h |  2 +-
 fs/verity/open.c             | 20 +++++++++++++++-----
 2 files changed, 16 insertions(+), 6 deletions(-)

diff --git a/fs/verity/fsverity_private.h b/fs/verity/fsverity_private.h
index a16038a0ee67d..e8b40c8000be7 100644
--- a/fs/verity/fsverity_private.h
+++ b/fs/verity/fsverity_private.h
@@ -52,7 +52,7 @@ struct merkle_tree_params {
 	 * Starting block index for each tree level, ordered from leaf level (0)
 	 * to root level ('num_levels - 1')
 	 */
-	u64 level_start[FS_VERITY_MAX_LEVELS];
+	unsigned long level_start[FS_VERITY_MAX_LEVELS];
 };
 
 /*
diff --git a/fs/verity/open.c b/fs/verity/open.c
index e0ef1a6283943..83ccc3c137363 100644
--- a/fs/verity/open.c
+++ b/fs/verity/open.c
@@ -34,6 +34,7 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 	struct fsverity_hash_alg *hash_alg;
 	int err;
 	u64 blocks;
+	u64 blocks_in_level[FS_VERITY_MAX_LEVELS];
 	u64 offset;
 	int level;
 
@@ -94,17 +95,26 @@ int fsverity_init_merkle_tree_params(struct merkle_tree_params *params,
 		}
 		blocks = (blocks + params->hashes_per_block - 1) >>
 			 params->log_arity;
-		/* temporarily using level_start[] to store blocks in level */
-		params->level_start[params->num_levels++] = blocks;
+		blocks_in_level[params->num_levels++] = blocks;
 	}
-	params->level0_blocks = params->level_start[0];
+	params->level0_blocks = blocks_in_level[0];
 
 	/* Compute the starting block of each level */
 	offset = 0;
 	for (level = (int)params->num_levels - 1; level >= 0; level--) {
-		blocks = params->level_start[level];
 		params->level_start[level] = offset;
-		offset += blocks;
+		offset += blocks_in_level[level];
+	}
+
+	/*
+	 * Since the data, and thus also the Merkle tree, cannot have more than
+	 * ULONG_MAX pages, hash block indices can always fit in an
+	 * 'unsigned long'.  To be safe, explicitly check for it too.
+	 */
+	if (offset > ULONG_MAX) {
+		fsverity_err(inode, "Too many blocks in Merkle tree");
+		err = -EFBIG;
+		goto out_err;
 	}
 
 	params->tree_size = offset << log_blocksize;
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
