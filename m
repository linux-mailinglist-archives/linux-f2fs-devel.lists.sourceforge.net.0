Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B14282A7B3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jan 2024 07:42:41 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rNolu-0001z1-0R;
	Thu, 11 Jan 2024 06:42:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rNols-0001yv-Cb
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:42:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o/Hjt8QVmUjJVU65RvLlgWrh6XXYJca6S1OGzEQQUgk=; b=SZ67TpDk17A/DRn7i8/MblTzUL
 MtaWpTd5lpYWcdP2TDVOaAmTzbEZXkbmc27ADn7H4qL5vYWKKodC8afGSpfoVHdw3ahkKzUAP83sj
 hn1nHPqRhyCSTIbquIk6s3UhuXusVodmBhvGf7VeSnkk9J266/7phZyLcqbThZcoL5Qo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o/Hjt8QVmUjJVU65RvLlgWrh6XXYJca6S1OGzEQQUgk=; b=XKIUb1+7xA+vyr9//dGp+GvJag
 evp/b6Ppcq/wxFJ1fKReNzVckQlAMUjYDqs5DLWfBS9msOVrRwWFUxZIW0i8kK2pzmEyOiEbN7O6z
 Hq3kTeGJM8e+gcXYjwYxqckD74X+BpkAs+Z/CjjlavMfZkZ+yss3D7QhuOnWxkEKGZD8=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rNolm-00078m-HC for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Jan 2024 06:42:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id 79303B81ED9;
 Thu, 11 Jan 2024 06:42:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C729C433C7;
 Thu, 11 Jan 2024 06:42:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1704955339;
 bh=MgTBqfpW4ceY7D/ZgQAK+Zn24N05AWu5xNXVmlv4Wws=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HGSnIZtanogh2vTawgkVs54ULVkfJNrwKWHxHZO1GhBgblXF6lpZFbS7qZfLcbB5w
 mYQLbUzmtUCliNZKpMHlBTErJC2m2vMRMLUoI02YCi8vuxu4JOyYbER7o6bZ2Ag+so
 +0h9lMJN5+Lwiz98J9oHs+59IlADjoAjLSxz861Ur97rIyhBqt24wLUUjPAfBZMD7B
 eEy6dcUOj7vxNeEMDJKQg9PNqNClf5BN/+64oeqFXrPy037EPFJPOVcugt8Z8CxqmK
 w3QzsTCUWo4oJ9xfy4UMhJJcIeNVuN0Rdwf/xcHMCzdqU8REdbZ0zrdyotHQNE2pFI
 kEElJyPKijATw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 11 Jan 2024 14:42:05 +0800
Message-Id: <20240111064208.2969599-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240111064208.2969599-1-chao@kernel.org>
References: <20240111064208.2969599-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -4.3 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong <shengyong@oppo.com> Compressed cluster may
 not be released due to we can fail in release_compress_blocks(), fix to handle
 reserved compressed cluster correctly in reserve_compress_blocks(). 
 Content analysis details:   (-4.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.68.75 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.8 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rNolm-00078m-HC
Subject: [f2fs-dev] [PATCH v4 3/6] f2fs: compress: fix to check unreleased
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
v4:
- merge check condition suggested by Daeho.
 fs/f2fs/file.c | 11 ++++++++++-
 1 file changed, 10 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 026d05a7edd8..80d9c4c096f0 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3624,7 +3624,13 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 				goto next;
 			}
 
-			if (__is_valid_data_blkaddr(blkaddr)) {
+			/*
+			 * compressed cluster was not released due to it
+			 * fails in release_compress_blocks(), so NEW_ADDR
+			 * is a possible case.
+			 */
+			if (blkaddr == NEW_ADDR ||
+				__is_valid_data_blkaddr(blkaddr)) {
 				compr_blocks++;
 				continue;
 			}
@@ -3633,6 +3639,9 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
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
