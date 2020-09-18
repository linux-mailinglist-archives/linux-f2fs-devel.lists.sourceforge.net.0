Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B690726EAED
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 18 Sep 2020 04:02:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kJ5jB-0006CZ-5O; Fri, 18 Sep 2020 02:02:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kJ5j9-0006CS-NG
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:02:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ms/ptj6XZJCmPueb+YU8qrGRZckP0M9bCZLn3juzJps=; b=ZFdjKO35KTY3rNXAL7gBRHCWpd
 WnCoK0QgCC4u2PgsiaRjKrUgxaFJIQOz0j9epBjgTOJ6hhooA2o2VB/1WLLvancLnT8srEr3Yii+6
 EPA9p+GqPWdJbLvmhV5wu2upqtziwCNuZPQ4Z6rfVSvDLyXyoU8xGEWL3O2plwMwRSdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ms/ptj6XZJCmPueb+YU8qrGRZckP0M9bCZLn3juzJps=; b=QHnY49ruy8gK+OaKLrsTpE7dxX
 Dd1Elzvq7WlSFYV0KvbSpnW/x9fRN4oFQyezFuUqud2CBpM67jrk666e5UR8me++9WYDR+xfvI7Pz
 /3O2l1bBg6btx08AM+SxO6BiQ0fIfrerXjoFTS1b7xo5wbIgG8jotmRdmqN0+OHLViHg=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kJ5ip-00DiMj-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Sep 2020 02:02:19 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6A4421D40;
 Fri, 18 Sep 2020 02:01:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1600394511;
 bh=mjqv7wUdu/UKWJ1MhLtoyR1ppjj1NWDzdFz091vcFS4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=IpNJ06cqrkCndteN1qMkqDOU02fRbfxaR0u6kuCCFui960QhxCAliC3z4ZGeFrv8P
 J97hLB1pofCVi8BflIhQOAx1iLJf6IEJFb55XRyP50E1vAYw2VXfqXDOm7554aw+30
 rWF3rTrCZcXJ7CagdAPu+RHGiy59K7kSiTxX74F8=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu, 17 Sep 2020 21:56:14 -0400
Message-Id: <20200918020110.2063155-34-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20200918020110.2063155-1-sashal@kernel.org>
References: <20200918020110.2063155-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 TIME_LIMIT_EXCEEDED    Exceeded time limit / deadline
X-Headers-End: 1kJ5ip-00DiMj-Dk
Subject: [f2fs-dev] [PATCH AUTOSEL 5.4 034/330] f2fs: avoid kernel panic on
 corruption test
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

From: Jaegeuk Kim <jaegeuk@kernel.org>

[ Upstream commit bc005a4d5347da68e690f78d365d8927c87dc85a ]

xfstests/generic/475 complains kernel warn/panic while testing corrupted disk.

Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/node.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index daeac4268c1ab..e6f1b1d0c3b68 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2350,7 +2350,6 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
 
 			if (ret) {
 				up_read(&nm_i->nat_tree_lock);
-				f2fs_bug_on(sbi, !mount);
 				f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
 				return ret;
 			}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
