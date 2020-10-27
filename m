Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 36E86299DC0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 01:10:04 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXCYs-0002DH-Ff; Tue, 27 Oct 2020 00:10:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1kXCYq-0002Cw-Dh
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 00:10:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OyXoLvxn4Dcy6gkicpUIBg37Y0Hs3aHVd1rINg0DnWE=; b=kBQRaOFde/VRDe5T6P0GNGpGlQ
 bzLxz0O/NxamBZEvCdf3pWecv+suYJjU0R2Bj8PY5N9yAKCJBl9KBlfEq1VQdfMw/ZMoJ+btwpxoE
 O+XSjx2XkvXE3Bdn5UP+3SSvHoTL4whRFThwpiv23RBEtuO+CyLAF2snbT525mizing8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OyXoLvxn4Dcy6gkicpUIBg37Y0Hs3aHVd1rINg0DnWE=; b=Qcu15Rem7m2q56HtcvZDtQBDxy
 5YeJy9J6aQkm10/BhxpqhF+nYDTieJMqTeb8q8p1FFFUlMuGteJgTMlzMQVf56en8iUHc2e3/10Cz
 tWTzS5Gn3hJ2+yuuJQGpCR9EOi5qSxEJMyKXKM5ueFb72qSGnQAMIRI3r4tfqY/mGfqs=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kXCYn-008D80-CT
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 00:10:00 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 470B220882;
 Tue, 27 Oct 2020 00:09:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1603757392;
 bh=5S1rs6NOrOWMe2uOzaXWV/lIDXcLcthwTI1R72Whxt4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=mJl97OoKMI1XKXRJhYsmaZUrlBxEFgzh19DkgFp8050gTUuT1e4gAAt8XCiSSoqLB
 O+rcLNHyrIsUShx9i3ae3akAgGuMjsyK8lTGwR3ly8tRed25ZBm/42zA3Wd6ypGqtu
 nSU8gqFG6ltYPjfhDBQF2XqNFmRsfN1TRnQSBJJc=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Mon, 26 Oct 2020 20:09:03 -0400
Message-Id: <20201027000946.1026923-4-sashal@kernel.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201027000946.1026923-1-sashal@kernel.org>
References: <20201027000946.1026923-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1kXCYn-008D80-CT
Subject: [f2fs-dev] [PATCH AUTOSEL 4.14 04/46] f2fs: add trace exit in
 exception path
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
 Zhang Qilong <zhangqilong3@huawei.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zhang Qilong <zhangqilong3@huawei.com>

[ Upstream commit 9b66482282888d02832b7d90239e1cdb18e4b431 ]

Missing the trace exit in f2fs_sync_dirty_inodes

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/checkpoint.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 170423ff27210..eab37a7dca5f5 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -942,8 +942,12 @@ int sync_dirty_inodes(struct f2fs_sb_info *sbi, enum inode_type type)
 				get_pages(sbi, is_dir ?
 				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
 retry:
-	if (unlikely(f2fs_cp_error(sbi)))
+	if (unlikely(f2fs_cp_error(sbi))) {
+		trace_f2fs_sync_dirty_inodes_exit(sbi->sb, is_dir,
+				get_pages(sbi, is_dir ?
+				F2FS_DIRTY_DENTS : F2FS_DIRTY_DATA));
 		return -EIO;
+	}
 
 	spin_lock(&sbi->inode_lock[type]);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
