Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F39DF45E486
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Nov 2021 03:30:51 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mqR0e-0006Hp-LH; Fri, 26 Nov 2021 02:30:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <sashal@kernel.org>) id 1mqR0d-0006Hi-2Y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 02:30:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jFPiRgm2XP8XIvqtBJ0fr7DPeXdLT9s2P7HCvGD3cq0=; b=NICUwTpkHArnkEU4DrlUaOUHT7
 TRSCVYmqvTJE2oPr9kVx28MSqciuHWq1SjYtFMrYmiajS3StFqlaVb3sSgC7Ioof69r+PJTk8uU2+
 EkZgQQ+Ww8jxAkYabZBbYFMHxop0UfW96NzPpUFAX6HB5g3robAaq/hEX5mLHtWNeqBo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=jFPiRgm2XP8XIvqtBJ0fr7DPeXdLT9s2P7HCvGD3cq0=; b=G
 MJysWYvFcBYFSh29Big4XJbRUxjKcXYahIXK1SVvKsUIht2rLg3ui5vydNVdFpV6kODe681WN8Hfc
 CHwzTjwPIK6+X6tWhKDrMTNqRpfaNE+zAsoeG0t6P9r2Haj2EQrReXDkr2guw/kkD991xV/1Zp9k3
 8pvOTbt+LT23rHC0=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mqR0c-009XYR-Gw
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 26 Nov 2021 02:30:42 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 7443F61154;
 Fri, 26 Nov 2021 02:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1637893837;
 bh=JyLokz3uTX1psmva6XXCGWuAqkaTiwTqi+lVRfFS/O8=;
 h=From:To:Cc:Subject:Date:From;
 b=ErqPXU3E+clUwbGsxGi25omWapVNnGema8fA/AHdCpnCDcPaTlqbgSOtVSi+eIXfB
 4364uQPz8AVIqv3/sKnhdBfxhgHfJG0JDwDP5pXssdWjtOEOMsjXWc+gP01SlaWBLB
 ThvWV0nEp765BXQ+lCIKDkewROeD52kedkVgNqRo2CMgXwY9ZD/fdMKEl1qyRLn79v
 YQwsjx1N0fHsv14kOHtv13yZ3t93QDkBDKZpnRNTCyVd7tNLBlTyMFv9wv/l2QdZgU
 fUgizkRd8FSvUPrPpoQzjkmeUM4a8IRjAJjs9gxa9VO4mJpQiTrhEMwvHZd17omRJk
 KDxD9mtFHmtDg==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 25 Nov 2021 21:30:31 -0500
Message-Id: <20211126023034.440961-1-sashal@kernel.org>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Weichao Guo <guoweichao@oppo.com> [ Upstream commit
 6663b138ded1a59e630c9e605e42aa7fde490cdc ] Inconsistent node block will cause
 a file fail to open or read, which could make the user process crashes or
 stucks. Let's mark SBI_NEED_FSCK flag to trigger a fix at next fsck time.
 After unlinking t [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mqR0c-009XYR-Gw
Subject: [f2fs-dev] [PATCH AUTOSEL 5.10 1/4] f2fs: set SBI_NEED_FSCK flag
 when inconsistent node block found
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Weichao Guo <guoweichao@oppo.com>

[ Upstream commit 6663b138ded1a59e630c9e605e42aa7fde490cdc ]

Inconsistent node block will cause a file fail to open or read,
which could make the user process crashes or stucks. Let's mark
SBI_NEED_FSCK flag to trigger a fix at next fsck time. After
unlinking the corrupted file, the user process could regenerate
a new one and work correctly.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 597a145c08ef5..7e625806bd4a2 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1389,6 +1389,7 @@ static struct page *__get_node_page(struct f2fs_sb_info *sbi, pgoff_t nid,
 			  nid, nid_of_node(page), ino_of_node(page),
 			  ofs_of_node(page), cpver_of_node(page),
 			  next_blkaddr_of_node(page));
+		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		err = -EINVAL;
 out_err:
 		ClearPageUptodate(page);
-- 
2.33.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
