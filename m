Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 342D5406085
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Sep 2021 02:16:47 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mOUDl-0005xY-IB; Fri, 10 Sep 2021 00:16:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1mOUDj-0005xB-7l
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:16:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XzMEQS0Mh8zylKn8lOPsM0xbPejTYmofSIzZ7y25NpA=; b=KJ8HvtqMpz3uzSfvEwd4qay0/l
 opyLBRfuEspLa/KW7B4oCY6HVqPABLBsVdQWIAcyoMPaggjHFvQc4tEzQ8bHSXCJE9DXey0GhIKoo
 8KUB2KXHs+r8o63xpkwtJjxVZ3B0bKk8P6rOPBXMz9cBN5Spf+sImMmbuAODqnc2qGwU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=XzMEQS0Mh8zylKn8lOPsM0xbPejTYmofSIzZ7y25NpA=; b=jO6ogPW/LryLhSbwg/33Ay2qxg
 kKXF5IKeqXeU+fwypES6/2s28KorbcepiG8vXFh11ayQ2hxuRC3hIzVEZuRYhTiY+ECF191dV68er
 j2qNLUgWstQEOxeXSjhyM2rp91l9MNrS97lJS2Jw2GKdGwoof4c9Zysdi1xS28/0zt3w=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mOUDi-005Rvc-Oh
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 10 Sep 2021 00:16:43 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id 1E243611CE;
 Fri, 10 Sep 2021 00:16:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1631232997;
 bh=M/ipGsOWicoW0FW6yQiyiamoAAv1ZnInQexwOjlw6Bg=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=lDk0hx4r6tVMT+mrFCHhQvzw9gOGeNN1yvtjXjxSAlQv+VntJZOJhiDgMXT+1wgUw
 ABDCIz9GtF7IWTsPKrutsxPa2+bUDhuQ/m6kAlnk7rA58thYxUG61V4Es0g3sPCe7Z
 TnNIN5KnpHSLqsy7fEfUbm1y7yfhwe+Nb4Z6LMnzCoufFSrdST/6g0F4leyu7uC8jR
 XQ2oiSR0GE+9W9wC/HroLMPug2dC3pbzkEeXb+uCX92cAtqSnrSfDUx18W7I/k6M4h
 noJbOFR0XtUMFPpboWIgQLJnlbFw9SJW6jV+4JRmwFOjKpzC7xFwWBw9acYOgrdwTH
 gHs+3R9wlEvrQ==
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Thu,  9 Sep 2021 20:14:47 -0400
Message-Id: <20210910001558.173296-28-sashal@kernel.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210910001558.173296-1-sashal@kernel.org>
References: <20210910001558.173296-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -5.6 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Laibin Qiu <qiulaibin@huawei.com> [ Upstream commit
 dc675a97129c4d9d5af55a3d7f23d7e092b8e032 ] F2FS have dirty page count control
 for batched sequential write in writepages, and get the value of min_seq_blocks
 by blocks_per_seg * segs_per_sec(segs_per_sec defaults to 1). But in some
 scenes we s [...] 
 Content analysis details:   (-5.6 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [198.145.29.99 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.4 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mOUDi-005Rvc-Oh
Subject: [f2fs-dev] [PATCH AUTOSEL 5.14 28/99] f2fs: fix min_seq_blocks can
 not make sense in some scenes.
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

From: Laibin Qiu <qiulaibin@huawei.com>

[ Upstream commit dc675a97129c4d9d5af55a3d7f23d7e092b8e032 ]

F2FS have dirty page count control for batched sequential
write in writepages, and get the value of min_seq_blocks by
blocks_per_seg * segs_per_sec(segs_per_sec defaults to 1).
But in some scenes we set a lager section size, Min_seq_blocks
will become too large to achieve the expected effect(eg. 4thread
sequential write, the number of merge requests will be reduced).

Signed-off-by: Laibin Qiu <qiulaibin@huawei.com>
Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 15cc89eef28d..2e543c7c1bc3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5159,7 +5159,7 @@ int f2fs_build_segment_manager(struct f2fs_sb_info *sbi)
 		sm_info->ipu_policy = 1 << F2FS_IPU_FSYNC;
 	sm_info->min_ipu_util = DEF_MIN_IPU_UTIL;
 	sm_info->min_fsync_blocks = DEF_MIN_FSYNC_BLOCKS;
-	sm_info->min_seq_blocks = sbi->blocks_per_seg * sbi->segs_per_sec;
+	sm_info->min_seq_blocks = sbi->blocks_per_seg;
 	sm_info->min_hot_blocks = DEF_MIN_HOT_BLOCKS;
 	sm_info->min_ssr_sections = reserved_sections(sbi);
 
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
