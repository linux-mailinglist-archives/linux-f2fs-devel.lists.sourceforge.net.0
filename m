Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39A0F81A07A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 15:00:07 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFx78-0000tH-Ip;
	Wed, 20 Dec 2023 13:59:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFx76-0000t8-HW
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 13:59:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PG5vzWF2/Zst7Rv4M9EAEkwmGP1h2Y/muDmldfhvo/c=; b=BC/tvC/Klc3yWWFVd0TUHyDkhF
 cJR3bbgAybL0ejTk7t1oZKOxtw5y71iw4tTdSNdzlRW5AvJuLTy3+TdWYrhZx9VZ6kTnlFs4PFLz1
 J4+W577r+FVU986pTOVQ9xrtZfuxQkkbF1FlIiB6nX3FvE7/HNUCOgUTnJczKglAXCH4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PG5vzWF2/Zst7Rv4M9EAEkwmGP1h2Y/muDmldfhvo/c=; b=kLQBSnZNMIKKjW7ZaK12+yHpWq
 DPG8UH3vDvl8QYInjirF6xh2Sc2s+c45Wg4GQ1pb2D3X0o6qbz8BDZlbpTaJ5ETk7pVSJANsud7WD
 jfDqdHATgUmOI7rV+lHqg4mv24+/JIErq4KCvFGf5PPHlF+9aqfifYybA7PiEgJ8+70g=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFx72-0001Jj-Pm for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 13:59:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 80107B81D6D;
 Wed, 20 Dec 2023 13:59:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8229AC433C9;
 Wed, 20 Dec 2023 13:59:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703080786;
 bh=v4LG7qKqe/M+w+R9MpQa9X4bJKEDltOmx7SXeOQu0+g=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OL7AZ7SRexIAReodySDXML3iH2ENLvevRKCZBxFla/XCSj4J9zJLC1wtYmtdpbRlk
 gw89uKyBFqkPsyV4hoNrqupk4BsEgh5LsguNh4j3c2o21x/mEzvpCvKSmmqQdwl0B1
 xvVuzC23KncXqWNCUTWuY1Qa9RzkARpusQnqsCPKN1dYS4LT/8CzWncLobPQYMEfMJ
 54ptx4MbXrSvaUFIXL6OZoAkmy/1YRQYAYX5vKtZxl87pWshX/cXjQsdNxZhlQblsB
 BuKQ+8HAbPp+PHB/iQ9snsIiVZLFvg45E3XPIGxrhOlpVOS6tjB7aqL9aMNHS9phbn
 50aZGm6QlwLDA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 20 Dec 2023 21:59:31 +0800
Message-Id: <20231220135934.3471407-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231220135934.3471407-1-chao@kernel.org>
References: <20231220135934.3471407-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -2.6 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong <shengyong@oppo.com> Compressed cluster may
 not be released due to we can fail in release_compress_blocks(), fix to handle
 reserved compressed cluster correctly in reserve_compress_blocks(). 
 Content analysis details:   (-2.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rFx72-0001Jj-Pm
Subject: [f2fs-dev] [PATCH 3/6] f2fs: compress: fix to check unreleased
 compressed cluster
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Sheng Yong <shengyong@oppo.com>

Compressed cluster may not be released due to we can fail in
release_compress_blocks(), fix to handle reserved compressed
cluster correctly in reserve_compress_blocks().

Fixes: 4c8ff7095bef ("f2fs: support data compression")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/file.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c5e681fc1d58..c200b4c81baf 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3643,6 +3643,15 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 				goto next;
 			}
 
+			/*
+			 * compressed cluster was not released due to
+			 * it fails in release_compress_blocks().
+			 */
+			if (blkaddr == NEW_ADDR) {
+				compr_blocks++;
+				continue;
+			}
+
 			if (__is_valid_data_blkaddr(blkaddr)) {
 				compr_blocks++;
 				continue;
@@ -3652,6 +3661,9 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		}
 
 		reserved = cluster_size - compr_blocks;
+		if (!reserved)
+			goto next;
+
 		ret = inc_valid_block_count(sbi, dn->inode, &reserved);
 		if (ret)
 			return ret;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
