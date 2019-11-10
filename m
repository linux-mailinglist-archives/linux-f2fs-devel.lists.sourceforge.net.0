Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32357F62A9
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 10 Nov 2019 03:44:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iTdDQ-0006YT-VV; Sun, 10 Nov 2019 02:44:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iTdDP-0006YL-VA
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Nov 2019 02:44:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iWVE8xj6VLYXd1KA1XtkWjAZav45bRTiIZlGFVp/ujU=; b=UaXKy4cjFHGmrQ4CFbMajY9BfR
 SqXm9jX61e5wEpll1JR5pplvfQmaAAWwzjkDrky//TJdJ5yLOErAha6E3FFhi4MTF5FQ+L/XNr6i9
 TifKME/mqG8XaBI5jAjvRgvba+wuR5St4LUYc4Q6c4FcKeJ+xHfQCQPjf/4pjoScHhhg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iWVE8xj6VLYXd1KA1XtkWjAZav45bRTiIZlGFVp/ujU=; b=Vi+N1cMSapgZOLR26Dktg9r4rB
 oGrQceAnb802Zrufy/kEaBoYKn7stU05cjos0ODP2mUo591p7lGMR//Zps1V3e1rQ+DMRncvZIIJr
 nPsPjw4R2Y2Mc8jTZHVe626NzZIKZo9ZiViNOJ31qHjCXpDvgfhb+XC5b7/qzXwzQoe4=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iTdDO-00AAFP-AP
 for linux-f2fs-devel@lists.sourceforge.net; Sun, 10 Nov 2019 02:44:35 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B49CC21D7E;
 Sun, 10 Nov 2019 02:44:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1573353868;
 bh=CtT6uTW0IPM2Nq6HBc1wilGUrLZyI4sUEyoHHr7e/+0=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hp/tn0Tc9sQassthkEyE/CIEDFZ5oRVgov07rDa/jsa/E1yGzi16GxrJR8VFBlqjr
 amJZGto+zW8Fdo+yWSMeseI42fJ+tVCSgmQG/bSdmnswapO/lYEdB4BWF6ldAvK7qc
 +TgiqG2rryOkPRIB0fkyJW4pZw9dytrlT09eFWk4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  9 Nov 2019 21:39:30 -0500
Message-Id: <20191110024013.29782-148-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191110024013.29782-1-sashal@kernel.org>
References: <20191110024013.29782-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.6 (/)
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
 -0.5 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iTdDO-00AAFP-AP
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 148/191] f2fs: mark inode dirty
 explicitly in recover_inode()
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

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 4a1728cad6340bfbe17bd17fd158b2165cd99508 ]

Mark inode dirty explicitly in the end of recover_inode() to make sure
that all recoverable fields can be persisted later.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/recovery.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 01636d996ba41..733f005b85d65 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -247,6 +247,8 @@ static void recover_inode(struct inode *inode, struct page *page)
 
 	recover_inline_flags(inode, raw);
 
+	f2fs_mark_inode_dirty_sync(inode, true);
+
 	if (file_enc_name(inode))
 		name = "<encrypted>";
 	else
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
