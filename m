Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F32B3ED68C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 16 Aug 2021 15:23:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mFcZx-0007Kr-3B; Mon, 16 Aug 2021 13:23:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <frank.li@vivo.com>) id 1mFcZw-0007Kg-1k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 13:23:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q14BlxwR4PhLL3juB3nbMUh9WWDQeHUCfmsNv0T5chE=; b=kipdy8s4RRE4oxmjCvCD89Qu+a
 x1zK4LWjjvdPPX95qlTRfuh/hyWjZlpMe5uZtNenfUTbS/GStlkTnAeE4qc57tmOUBky7EarJQaKY
 AyAp2JrAG3lwKTCDxmyXiGW/Qhwk+A2rBnZ3ZFlC+YZ3Eyyv9ZLdqErKsJWUVbVg8pmw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q14BlxwR4PhLL3juB3nbMUh9WWDQeHUCfmsNv0T5chE=; b=J
 V2NO/UgmxBmDfv5QFF41uQkyfkpGrWYEXGfWvX7Vt1It4rTKK/C6zVfksNbYApewuGBt1GhwK+Gzd
 S3q/jFoVU0uG8gSUzklNyDuyQ85lWEEAxXGbJD8GjJ0skMEoyklHtcw4c3UaKDnDw7ygSnKhd30ma
 i7SGhyzqYkD6a9xM=;
Received: from mail-m17636.qiye.163.com ([59.111.176.36])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mFcZs-0004kc-QX
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 16 Aug 2021 13:22:59 +0000
Received: from comdg01144022.vivo.xyz (unknown [218.104.188.165])
 by mail-m17636.qiye.163.com (Hmail) with ESMTPA id 491E5C40261;
 Mon, 16 Aug 2021 21:22:49 +0800 (CST)
From: Yangtao Li <frank.li@vivo.com>
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 16 Aug 2021 21:22:48 +0800
Message-Id: <20210816132248.276865-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-HM-Spam-Status: e1kfGhgUHx5ZQUtXWQgPGg8OCBgUHx5ZQUlOS1dZCBgUCR5ZQVlLVUtZV1
 kWDxoPAgseWUFZKDYvK1lXWShZQUhPN1dZLVlBSVdZDwkaFQgSH1lBWUJKGkNWHU9NGE0ZGElKSE
 geVRMBExYaEhckFA4PWVdZFhoPEhUdFFlBWU9LSFVKSktISkNVS1kG
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MjY6PSo6Mz9JNRwzLBkSF08N
 SRMaCypVSlVKTUlCSklLSk1CQ05PVTMWGhIXVR0JGhUQVRcSOw0SDRRVGBQWRVlXWRILWUFZSUpD
 VUpLT1VKQ0NVSk1OWVdZCAFZQUpNQ0k3Bg++
X-HM-Tid: 0a7b4f2105efd996kuws491e5c40261
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [59.111.176.36 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1mFcZs-0004kc-QX
Subject: [f2fs-dev] [PATCH] f2fs: always call f2fs_issue_checkpoint() in
 f2fs_sync_fs()
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Sync is always 1, so delete the check of the value.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/super.c | 6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 98727e04d271..b823c7e3f303 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1553,7 +1553,6 @@ static void f2fs_put_super(struct super_block *sb)
 int f2fs_sync_fs(struct super_block *sb, int sync)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(sb);
-	int err = 0;
 
 	if (unlikely(f2fs_cp_error(sbi)))
 		return 0;
@@ -1565,10 +1564,7 @@ int f2fs_sync_fs(struct super_block *sb, int sync)
 	if (unlikely(is_sbi_flag_set(sbi, SBI_POR_DOING)))
 		return -EAGAIN;
 
-	if (sync)
-		err = f2fs_issue_checkpoint(sbi);
-
-	return err;
+	return f2fs_issue_checkpoint(sbi);
 }
 
 static int f2fs_freeze(struct super_block *sb)
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
