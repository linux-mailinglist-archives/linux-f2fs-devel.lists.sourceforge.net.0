Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D0B997985
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Oct 2024 02:09:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sygkH-00008i-Mo;
	Thu, 10 Oct 2024 00:09:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jaegeuk@kernel.org>) id 1sygkG-00008Z-6a
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 00:09:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gwu7MHDaf7IfIPrux+XuASfy5MVBRBxYfIMLwt2v+R8=; b=gsneYmbEWtEubmSLqYLM/YsPsE
 Zd4AgerXYbR5BioNZCnqtinb2rdSedJajJ+suuvVmWoKgt8BZJXdcr0nxq2m+P5X8FM4BYXmxUuIy
 +pN8BlAF44Ga9j+LhMMq5uE5JpX1M58Hl7zPIWuxja+qn2oAvyzlg6ZAttJqsA4lj/rg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Gwu7MHDaf7IfIPrux+XuASfy5MVBRBxYfIMLwt2v+R8=; b=M
 YYBTTexIjAx5F433KjqSiwxeml4aEug6QuVPy2HDVI53RaZV4CZWH46pOJTm25xj9Wk5Yghae5nog
 q6b2T2yMF+O278nnZj4dNFTMcfbCNIpJsXHyVW2dL/EHePKIkEQdA4t3CqUOn02QK1tFEoLe6ExK2
 P0ChR5nbQ5oVYxa4=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sygkF-0003gZ-Hg for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Oct 2024 00:09:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 10E35A4481C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 10 Oct 2024 00:09:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1CB22C4CEC3;
 Thu, 10 Oct 2024 00:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1728518965;
 bh=OtpXj8J4F6+wI9FEKWHzOxE+ev3W7YLJgXZJCUcNHkI=;
 h=From:To:Cc:Subject:Date:From;
 b=VKxhkrmceFXbrQGe2EM3+5ozAmEvcs98O/cTrqvpUFwnfKhq85+P62O+1GgSfO1Mw
 44d4QqF38ygZAdWir/cUetQ6ZKcDr6s1zC5Novp4RvrsXjH9jbCpU3IH8ANnXKyg7U
 yfVYBbB2x2Z5+Pp9H/nLbhPaeSfPK1o3yyes3Nso2jRtLMHpGCrOd5DB6zHg/zHKkH
 Ex5+ytzcyBl9b+/Y9/hGr3GtMF2Xt8XWWr3/SjnmuEkHuaJFywfcG0IS4nwi2T9Ks7
 3VLBS/BNaGXnrKRb9NTg2LtkvjkPQ/isKFjTVyd9wjYXUDsI9fVgFPx4thyAgKLxQI
 LbSfGzVujT6rw==
To: linux-kernel@vger.kernel.org,
	linux-f2fs-devel@lists.sourceforge.net
Date: Thu, 10 Oct 2024 00:09:23 +0000
Message-ID: <20241010000923.1278817-1-jaegeuk@kernel.org>
X-Mailer: git-send-email 2.47.0.rc1.288.g06298d1525-goog
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This fixes a regression which prevents parallel DIO reads.
 Fixes: 0cac51185e65 ("f2fs: fix to avoid racing in between read and OPU dio
 write") Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org> --- fs/f2fs/file.c
 | 3 ++- 1 file changed, 2 insertions(+), 1 deleti [...] 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.2 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sygkF-0003gZ-Hg
Subject: [f2fs-dev] [PATCH] f2fs: allow parallel DIO reads
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
From: Jaegeuk Kim via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This fixes a regression which prevents parallel DIO reads.

Fixes: 0cac51185e65 ("f2fs: fix to avoid racing in between read and OPU dio write")
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/file.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 71d5ded9eeda..adc7d64a6f47 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4647,7 +4647,8 @@ static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *to)
 					iov_iter_count(to), READ);
 
 	/* In LFS mode, if there is inflight dio, wait for its completion */
-	if (f2fs_lfs_mode(F2FS_I_SB(inode)))
+	if (f2fs_lfs_mode(F2FS_I_SB(inode)) &&
+	    get_pages(F2FS_I_SB(inode), F2FS_DIO_WRITE))
 		inode_dio_wait(inode);
 
 	if (f2fs_should_use_dio(inode, iocb, to)) {
-- 
2.47.0.rc1.288.g06298d1525-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
