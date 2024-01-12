Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BCEB182C946
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 13 Jan 2024 04:57:43 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rOV9P-0003sR-8H;
	Sat, 13 Jan 2024 03:57:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rOV9M-0003s9-Q4
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 03:57:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HUUR43amUC8jwyxGEGINJMRoyp5HU6PI866HjxWnqtE=; b=lEuksIXAfJHsQj8Yipx541rOOZ
 gHiWEXJikwGkTS1AR3rcLIkfgEAuEudKqmOwqovH7FYo3xuqjJtyQtu4aeOoq4hONX30TkLiB8Lt/
 RRXk0CLr7LdBdC9Am1MEST/ChtJPJ26DvITvyFVTlA4zUzQFzw+mt3INq+JsMWAnprAk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=HUUR43amUC8jwyxGEGINJMRoyp5HU6PI866HjxWnqtE=; b=TNar+WTL7XBpJxkYgBSngbJh5v
 FepZOUdMYqLnSFVhcGbve4vdWVa/rXrCnKZG7+muuXKpjSYEJ+zSJ9pWML0c/Ed5mt0llOEybR766
 S2xHhg/NTyvPrOB9Jshvlf7vDDha0TtZSTmgD191q7DVX0Qd3Fbgk7wnLtW3773aAjpk=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rOV9L-0003oa-JK for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 13 Jan 2024 03:57:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id B45B161ED0;
 Sat, 13 Jan 2024 03:57:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78372C43330;
 Sat, 13 Jan 2024 03:57:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1705118245;
 bh=RQ/5bYxkS3MyNG96Qf/wOP3mhXKTcQQqJW6nVAGR5yE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=syf/atgsKYI3WxMH06ywnV/Te/ggAxXMNSL4DKHuokLI71CB4OwWpBcIULcF+qcU2
 fe28JdWhS0wGi29VFqMPcUzHiCDGofP9ZlpJXuZ3japDp8q3LYxzfEBK7FJBQUfkoP
 9SzmGPqL9uyjV3Sa+gY1NAMoNGxfugggb5ubfC7rVxEDAedZP3dvjjj0IdiLzrOmFk
 HOxJnBIkX+PAloeuTF9rtEBs7BBCGY9VnUUoH8KBtE4oqTzfmAQ3ulQCvLdMou6hYE
 hL8fIb/Yc39UIsnzqjNcHj114X1NpTDJq1vNLvFFQyIUF0AhiIcS0x+XA5HesD/Klb
 2PZr3VULR85Pw==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Sat, 13 Jan 2024 03:41:29 +0800
Message-Id: <20240112194132.25637-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240112194132.25637-1-chao@kernel.org>
References: <20240112194132.25637-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -6.2 (------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong <shengyong@oppo.com> Compressed cluster may
 not be released due to we can fail in release_compress_blocks(), fix to handle
 reserved compressed cluster correctly in reserve_compress_blocks(). 
 Content analysis details:   (-6.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 1.1 DATE_IN_PAST_06_12     Date: is 6 to 12 hours before Received: date
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rOV9L-0003oa-JK
Subject: [f2fs-dev] [PATCH v5 3/6] f2fs: compress: fix to check unreleased
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
v5:
- fix wrong condition pointed out by Daeho.
 fs/f2fs/file.c | 13 ++++++++++++-
 1 file changed, 12 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 026d05a7edd8..4aef2310395f 100644
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
@@ -3633,6 +3639,11 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		}
 
 		reserved = cluster_size - compr_blocks;
+
+		/* for the case all blocks in cluster were reserved */
+		if (reserved == 1)
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
