Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD2DC2E2DE5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 26 Dec 2020 11:08:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kt6Uc-0005tx-8N; Sat, 26 Dec 2020 10:08:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kt6Ua-0005tM-Tt
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Dec 2020 10:08:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VZ+O1CD7fnCsE/avWhN+qGIPpixMWkXQWuNKHB4Jb4A=; b=gfpxLU2n9qfRFNAkAUM2vCVylD
 vIMYChmsEvQ93Kfju7hQMPBDbHXU10Cx4wh8QRP/HBUKZDUte4Iur3AA6TmoK6JOgrtAAE/ldauEf
 cEaFsqCySqCOfuwbzBEg0dgohK92TtOpNQK7/teH2sx+fdNkoOosp/X7nz8mR1O/Tkds=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=VZ+O1CD7fnCsE/avWhN+qGIPpixMWkXQWuNKHB4Jb4A=; b=D
 YRMvoXu1q7r2e9NiHiGqo37BfnbxwNWccmhC4vYsqVyq8ooeXl9uTpr9fXu5ubcmvuM/xcgY34ulA
 kob8dWLfKs2KKtl0o9f08uyZ0Ypz51+hjtB6R7HPPJGwJH8mEQrIgizaU5qQTK28pTmruYnBIP7vl
 jky9599eO/bSwwr8=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kt6UV-00058P-Rg
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 26 Dec 2020 10:08:08 +0000
Received: from DGGEMS401-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4D2zxl62b9zhvX6;
 Sat, 26 Dec 2020 18:07:07 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS401-HUB.china.huawei.com (10.3.19.201) with Microsoft SMTP Server id
 14.3.498.0; Sat, 26 Dec 2020 18:07:47 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Sat, 26 Dec 2020 18:07:41 +0800
Message-ID: <20201226100741.30307-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1kt6UV-00058P-Rg
Subject: [f2fs-dev] [PATCH] f2fs: relocate f2fs_precache_extents()
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

Relocate f2fs_precache_extents() in prior to check_swap_activate(),
then extent cache can be enabled before its use.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/data.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index baa9ccf84e2c..3a6d848b7e38 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4129,12 +4129,13 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (!f2fs_disable_compressed_file(inode))
 		return -EINVAL;
 
+	f2fs_precache_extents(inode);
+
 	ret = check_swap_activate(sis, file, span);
 	if (ret < 0)
 		return ret;
 
 	set_inode_flag(inode, FI_PIN_FILE);
-	f2fs_precache_extents(inode);
 	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
 	return ret;
 }
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
