Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1FC1F81A080
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Dec 2023 15:00:12 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rFx7K-0001O4-HA;
	Wed, 20 Dec 2023 14:00:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1rFx7B-0001Ne-Dc
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 14:00:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jG1xYjeQFCncjaAKEpZbGnvc9Orum4R/wVy+dZd+s5k=; b=WS9HJp8a38IiL+VIPRULxqT+/S
 FBwG7loLDDna1sZLZVOEBg7J/a3+2lxtugWhtsIkbc8AV0PaAbHOA7dZyG8QC2ZAu3CYgg8YthiyM
 G9g2joPJj6RezMVF123mbkW15OhqTPJoECUlS4QBVzXAt93X/thUq0FuKLXS7laP7zbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jG1xYjeQFCncjaAKEpZbGnvc9Orum4R/wVy+dZd+s5k=; b=DciSQmMgKat1vlGbONNYzxMM6P
 W+5tReQ2DoCvfM8eY1nkEMvpZrboXl3ie41Jkl3N6a/sa85lKigtz/jBngvQvVqIQTK240Cg0gyyu
 n0Q+dTBMqodvVSFm0TpotrKa9kXwAqmEwA3TZaik2PDhwn0SOGZiD3b5CC/+IbVEb6Q4=;
Received: from ams.source.kernel.org ([145.40.68.75])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rFx77-0001K0-56 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Dec 2023 14:00:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by ams.source.kernel.org (Postfix) with ESMTP id D79A3B81D72
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 20 Dec 2023 13:59:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BF137C433C7;
 Wed, 20 Dec 2023 13:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1703080790;
 bh=a+Zr5UnD9JUAPNdpT3P1rGDjRu5/Oz4DN3bx1yho9co=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=p7AP1VMH72ySxKDNYPwmOKGF7q51vqQMEB1+DXpAwpCyC6g85zy8oN8ik0NtuGECt
 fw5/oI6jiG4jODCmtW47jZNlF0pSs44rma9TnkTgz4+Rn9VKUA0XdZCAbjTTqWg01s
 1Qe/SnxCpB7xpntmDxOOGwId82y/UnScwUQW/JoHkbw/UZ9V0qRiIdGRM0eexxPq+2
 YwSJkO5n7pQeyvWeF7tgDH+FLyXYB7cbJ3Xdx7yRW9PwI8Ss8zqIZLy96dglx3O8+0
 c/34qbSGUVjWs7wAi2hgltZ7HqAb6Ok3MFqvnR6HgZolU06+U4Vu5Pxk3uEynOOqL8
 M10J8RnmP5IDg==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Wed, 20 Dec 2023 21:59:33 +0800
Message-Id: <20231220135934.3471407-5-chao@kernel.org>
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
 Content preview: verify_blkaddr() will trigger panic once we inject fault into
 f2fs_is_valid_blkaddr(), fix to remove this unnecessary f2fs_bug_on(). Fixes:
 18792e64c86d ("f2fs: support fault injection for f2fs_is_valid_blkaddr()")
 Signed-off-by: Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 4 +--- 1 file
 changed, 1 insertion(+), 3 deletions(-) 
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
X-Headers-End: 1rFx77-0001K0-56
Subject: [f2fs-dev] [PATCH 5/6] f2fs: fix to remove unnecessary
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
index 541c52fe2872..9487581db08a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3489,11 +3489,9 @@ bool f2fs_is_valid_blkaddr(struct f2fs_sb_info *sbi,
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
