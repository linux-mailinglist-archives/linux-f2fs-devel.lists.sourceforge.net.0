Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43C4B81F921
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Dec 2023 15:32:37 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rIrR1-0000q1-Ci;
	Thu, 28 Dec 2023 14:32:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rIrQv-0000pY-5D
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 14:32:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gbqBjB9dGO5DNoWz4hJSaL4wOc8782Hf6wNDj7ZMkLo=; b=K8Z5IriwMzHDDZrN9KW9H2KMk7
 GN8OLCV9/j5lTdaXn75vAg49ZUBmqt6bu580GgqIGVyE5JRnATWCi1bAp8sca/YuYncnNLtWl/hr6
 rNUtgTIlZ2QinG2hzyu8ZF9lqndhZdFnKQMjL6Lw+5nV5Cwo3J5e2hEUpoyekZVNB6JI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gbqBjB9dGO5DNoWz4hJSaL4wOc8782Hf6wNDj7ZMkLo=; b=Kt9APBaiLBPexKRlJu15syO8R2
 gp86MAYG2MMt3PqHnJTQiEHPyIr8H8FamBSs6HlnznsDFe+av8dDa9bXkbQujq8kUc52acWUzWxBt
 4cOEfWR/Y7lF97mAwalroISwrtOT67z51/vUAMCfm6NLP8G0vUz6dqMYJ72ANu5Uxpuo=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rIrQt-0000zh-SX for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Dec 2023 14:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by dfw.source.kernel.org (Postfix) with ESMTP id 5B7EB6108A
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 28 Dec 2023 14:32:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BE7F4C433CB;
 Thu, 28 Dec 2023 14:32:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703773932;
 bh=gbX4YWfRwjVnF49sDXj1O3cCSmmOzMm5S1M/X7oiEXI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=fu+2B5Sq02Xg1h4uTwh2tBRcfPL99jE72HLiZkQA49ZS7hwV6im12C6h5G2Ztxyy6
 /AXp5YbuBLvEPyB7GOrM47fnIZlPSkhMDvC5DJDl6G9a08tlDRY3q5tNWfS2WSp2FH
 vhP+0obirrQqsexCUkyd7/cNLNKzH636PdPyjQuklPqa9kvQobqAgrCKViaUXAiz3l
 LW9Y1qbs2ns/qqTz2KJCZD2WuUq+C035C7jB/6hRLyZb8z7ynQFSONQSXZXpGFWXqN
 qzI155cPbVZHwPcwKVmpPvPH+R8Lhd56vrQKUzrrfm+Yrn1LBWhyUVwLmIoqWTTrm0
 pPxC0ghvG1XxA==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Thu, 28 Dec 2023 22:31:51 +0800
Message-Id: <20231228143152.1543509-5-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20231228143152.1543509-1-chao@kernel.org>
References: <20231228143152.1543509-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -8.2 (--------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: verify_blkaddr() will trigger panic once we inject fault into
 f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on(). Fixes:
 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 4 +--- 1 file
 changed, 1 insertion(+), 3 deletions(-) 
 Content analysis details:   (-8.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1rIrQt-0000zh-SX
Subject: [f2fs-dev] [PATCH v3 5/6] f2fs: fix to remove unnecessary
 f2fs_bug_on() to avoid panic
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

verify_blkaddr() will trigger panic once we inject fault into
f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on().

Fixes: 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 69e71460a950..ab710bb6d8b3 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3470,11 +3470,9 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
 static inline void verify_blkaddr(struct f2fs_sb_info *sbi,
 					block_t blkaddr, int type)
 {
-	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type)) {
+	if (!f2fs_is_valid_blkaddr(sbi, blkaddr, type))
 		f2fs_err(sbi, "invalid blkaddr: %u, type: %d, run fsck to fix.",
 			 blkaddr, type);
-		f2fs_bug_on(sbi, 1);
-	}
 }
 
 static inline bool __is_valid_data_blkaddr(block_t blkaddr)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
