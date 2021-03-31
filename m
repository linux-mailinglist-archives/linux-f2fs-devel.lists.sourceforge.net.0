Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F53334F74F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 31 Mar 2021 05:17:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRRLx-0003HI-5j; Wed, 31 Mar 2021 03:17:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lRRLv-0003HA-K7
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 03:17:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Ole0OM51NYl58kg7qTcFy6N4TB0Sdhy/SlR5ZtrwInQ=; b=EeHwRKtogYKN1I+mp9lYgrXKRr
 WzDG99wSCclMly0MPRBHG1ZxWKYoj5Ev6OOdh6eqv5mv/tw0PICi7yM5jqbTFe78mBy0Vi5R4Eklt
 lINjKOyq1RwRfoXJ0IybZLiTLAcETLeCFtrnYCyUVUk6iodbY/V8BA1RlWumhXgnUJw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Ole0OM51NYl58kg7qTcFy6N4TB0Sdhy/SlR5ZtrwInQ=; b=j
 5hnkoOKA5ea0b9iOHUFk5ePW+qu+Ab/Bw21DOVhbb1fu/QQSY+SuButrGR9SXtVvqyP5ylwERFQyy
 33NuvRnCCFHDZsWyFwGtsCRdplNY0dUQwmDTBEIf/o/FMk9p7l0xVMB0rtKqtNAoZb09Yo0q6mChW
 zZXdNT/xNJRC0DHk=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lRRLo-00FK6i-CK
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 31 Mar 2021 03:17:07 +0000
Received: from DGGEMS405-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9BJ557BLzyNPQ;
 Wed, 31 Mar 2021 11:14:45 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS405-HUB.china.huawei.com (10.3.19.205) with Microsoft SMTP Server id
 14.3.498.0; Wed, 31 Mar 2021 11:16:43 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 31 Mar 2021 11:16:32 +0800
Message-ID: <20210331031632.76800-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lRRLo-00FK6i-CK
Subject: [f2fs-dev] [PATCH] f2fs: fix to restrict mount condition on
 readonly block device
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

When we mount an unclean f2fs image in a readonly block device, let's
make mount() succeed only when there is no recoverable data in that
image, otherwise after mount(), file fsyned won't be recovered as user
expected.

Fixes: 938a184265d7 ("f2fs: give a warning only for readonly partition")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 16 ++++++++++++----
 1 file changed, 12 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 954b1fe97d67..14239e2b7ae7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3966,10 +3966,18 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 		 * previous checkpoint was not done by clean system shutdown.
 		 */
 		if (f2fs_hw_is_readonly(sbi)) {
-			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG))
-				f2fs_err(sbi, "Need to recover fsync data, but write access unavailable");
-			else
-				f2fs_info(sbi, "write access unavailable, skipping recovery");
+			if (!is_set_ckpt_flags(sbi, CP_UMOUNT_FLAG)) {
+				err = f2fs_recover_fsync_data(sbi, true);
+				if (err > 0) {
+					err = -EROFS;
+					f2fs_err(sbi, "Need to recover fsync data, but "
+						"write access unavailable, please try "
+						"mount w/ disable_roll_forward or norecovery");
+				}
+				if (err < 0)
+					goto free_meta;
+			}
+			f2fs_info(sbi, "write access unavailable, skipping recovery");
 			goto reset_checkpoint;
 		}
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
