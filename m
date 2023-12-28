Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F9A881F91F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 15:32:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIrR1-0003Za-RA;
	Thu, 28 Dec 2023 14:32:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIrQy-0003ZS-7P
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 14:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KsSgDPeE3D2PWDe+9Cjxa1TXEgtZW4xW4czqHA4SKmM=; b=edw7VE/koXf8xyEesTO6U8Ht/L
 x3xziZBdrKuHCKVhzSc8ut4K+Bv4RlWYtZN9ljY6mTl6363keCQJVxeD1qONu6r/Q/BNvqc1EJ5+4
 wzhr9+46ogBy70uHgRziN/bkS2EmCUMHRdZqpSxEyMYJOK07fTJRjXmWpI7xlw4XagRo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KsSgDPeE3D2PWDe+9Cjxa1TXEgtZW4xW4czqHA4SKmM=; b=kD0KOQ/Mes+D5C4L6WLDpzxJaV
 QJMhaHSIZxoy1AhhVB/88pBOQgdTohdJpp/TyN/qp0sDGnL28G9Iask+MuE+hg27hHlAt3jNSkG5a
 63f0ihtAMLdzTYnJ6bquxS3D3PshA9uEYArJdUJTTpCzBLAL/gyt+/BctFKpep1CEuRA=;
Received: from sin.source.kernel.org ([145.40.73.55])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIrQv-0000zb-TX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 14:32:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by sin.source.kernel.org (Postfix) with ESMTP id A1D05CE140E;
 Thu, 28 Dec 2023 14:32:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90591C433C9;
 Thu, 28 Dec 2023 14:32:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703773928;
 bh=PlqlUk5bd+3fk4WKcXVwPKIXLZLKGpamNP0JtbEVizc=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=r3UmvBckldbFBMtcyi3xBTx28VUw1mf8I7YeImoXPWLb1YsrbuwkMEUL8dHxnC/QH
 tUu+7M+5kN1T0M4IQWEo3M7Y31SJeeLGc4v5jIjFOLbTPH0LcGSA8fbhA57yX4bn2f
 vaIzuIfnzXCGIZoKJiqwpLSdjxsv86uofKZ6zMVLqFa1II3ycsn+HRNzIc+LI3tY8L
 PuQR6tWdMqErdbCa9J1nfYVRfE9OTooB4PYZO8hoXRRvie7f3FIJxJJcBH7hR+ANRD
 v2/3CMDmlDZy4h6wHZhIa73FxBCl0vCtSSQV8y6ppQlUyHejH+382f2nMTCExoHAhP
 inT/5EXcK82aA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 28 Dec 2023 22:31:49 +0800
Message-Id: <20231228143152.1543509-3-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231228143152.1543509-1-chao@kernel.org>
References: <20231228143152.1543509-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Sheng Yong <shengyong@oppo.com> Compressed cluster may
 not be released due to we can fail in release_compress_blocks(), fix to handle
 reserved compressed cluster correctly in reserve_compress_blocks(). 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [145.40.73.55 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIrQv-0000zb-TX
Subject: [f2fs-dev] [PATCH v3 3/6] f2fs: compress: fix to check unreleased
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
index 026d05a7edd8..782ae3be48f6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3624,6 +3624,15 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
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
@@ -3633,6 +3642,9 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
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
