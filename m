Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD26D89485
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 11 Aug 2019 23:37:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hwvWj-0003B8-5E; Sun, 11 Aug 2019 21:37:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hwvWi-0003At-2o
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Zn+1QKRYPENvLMZj8xiUykCOVKOOEUeCz0J64rPkYaM=; b=XuO6jYFKc7D9YoWCNXLCBHVpPU
 v8z/nr62X4SXcnEJZQh/bP7Hlaz0+WDj/uPM/WwUg+41wOS6wuv1HXISZ9Jkldj31yALWpBkuv8Y3
 Pir8eVUpjf/cGk4by45lmHxa4Mc5CQZ//wekTcisZSSEW6Wp7Mw1MgyxTiUdntjLDJLo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Zn+1QKRYPENvLMZj8xiUykCOVKOOEUeCz0J64rPkYaM=; b=QBW5z/jV4aUHIfoCIk4e8Xxt9C
 hWEUeHiWla3SZDoyFOI1jIiya1kX4DPeOb/6ShRSC3q2xVZir2Yjyqmyozfi9v51o2VAFPvjrZ/ta
 GRS+l4IqAwBbypp/+z8TwxG7TOwL5k59kefDNhn7dvYiXy+q3m8xFsYq4e6fDiUkUnc4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hwvWg-000YlC-5Z
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 11 Aug 2019 21:37:20 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 6B08F2085A;
 Sun, 11 Aug 2019 21:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565559432;
 bh=swoMgo/n2caW8yJE4pfd10ANnvVz7VhP4yS8JJAp8jA=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=jjl93+AdEy/Khgm0sMNr6vNO8vy8+xtaJ1FK03uu8Hf21CqlupuirV1lgPjpC3eNP
 j+mTgk8XFhCfbLOy7kGcp4S1eFQLrYp4GRpbcPes0lSBHhMTW696YwxCNtGfdaz31s
 NC8T+kUaShHNtQ9bCRN/9r60OPepWkiFcKwiowmo=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Sun, 11 Aug 2019 14:35:52 -0700
Message-Id: <20190811213557.1970-2-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190811213557.1970-1-ebiggers@kernel.org>
References: <20190811213557.1970-1-ebiggers@kernel.org>
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
X-Headers-End: 1hwvWg-000YlC-5Z
Subject: [f2fs-dev] [PATCH 1/6] fs-verity: fix crash on read error in
 build_merkle_tree_level()
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
Cc: linux-ext4@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

In build_merkle_tree_level(), use a separate fsverity_err() statement
when failing to read a data page, rather than incorrectly reusing the
one for failure to read a Merkle tree page and accessing level_start[]
out of bounds due to 'params->level_start[level - 1]' when level == 0.

Fixes: 248676649d53 ("fs-verity: implement FS_IOC_ENABLE_VERITY ioctl")
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/enable.c | 24 ++++++++++++++++--------
 1 file changed, 16 insertions(+), 8 deletions(-)

diff --git a/fs/verity/enable.c b/fs/verity/enable.c
index 3371d51563962..eabc6ac199064 100644
--- a/fs/verity/enable.c
+++ b/fs/verity/enable.c
@@ -43,19 +43,27 @@ static int build_merkle_tree_level(struct inode *inode, unsigned int level,
 			pr_debug("Hashing block %llu of %llu for level %u\n",
 				 i + 1, num_blocks_to_hash, level);
 
-		if (level == 0)
+		if (level == 0) {
 			/* Leaf: hashing a data block */
 			src_page = read_mapping_page(inode->i_mapping, i, NULL);
-		else
+			if (IS_ERR(src_page)) {
+				err = PTR_ERR(src_page);
+				fsverity_err(inode,
+					     "Error %d reading data page %llu",
+					     err, i);
+				return err;
+			}
+		} else {
 			/* Non-leaf: hashing hash block from level below */
 			src_page = vops->read_merkle_tree_page(inode,
 					params->level_start[level - 1] + i);
-		if (IS_ERR(src_page)) {
-			err = PTR_ERR(src_page);
-			fsverity_err(inode,
-				     "Error %d reading Merkle tree page %llu",
-				     err, params->level_start[level - 1] + i);
-			return err;
+			if (IS_ERR(src_page)) {
+				err = PTR_ERR(src_page);
+				fsverity_err(inode,
+					     "Error %d reading Merkle tree page %llu",
+					     err, params->level_start[level - 1] + i);
+				return err;
+			}
 		}
 
 		err = fsverity_hash_page(params, inode, req, src_page,
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
