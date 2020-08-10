Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B75B22404DD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Aug 2020 12:39:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k55D9-0004uA-Ot; Mon, 10 Aug 2020 10:39:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1k55D7-0004tq-JY
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 10:39:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q+/qq8n7xpfriYAYGcXAa4s7z/LGvzsmbwutdOAli2U=; b=Kx4yERkpTmav3GZkMbtK9Vzh4L
 qeKAI2ilkm0KETAce4qlah5bI9wDgISz4Poza6Nse2wB/KDoWNhtmLTHk89WTR3IskGDkx/ARhFNA
 uLBtLLo5ClIgMpKwc+uD4ibpjtfhlS8GPDNJ1/qlgEkvmDRFTHSqzEfGy0agRQmVAY4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Q+/qq8n7xpfriYAYGcXAa4s7z/LGvzsmbwutdOAli2U=; b=B
 H8AEown9Yx8PlCfdJn7CHWqWxuVRoZWeUsJV4ooRxfiYq5ChkSdWtFXZlrBnJ4Cj8tMIS0KHeFUUy
 FHcRlkNaLe0QdMtuo/y+wW4Kt102KoV5dzac9A9DtO4ePWEwoa86nEfYWzEtU/1ySfIVuLLPYoB8D
 vQQy28e8bqwcCR6M=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k55D4-00FPVi-Lu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 10 Aug 2020 10:39:21 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id CA3FDE0191CA346124EE;
 Mon, 10 Aug 2020 18:38:59 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.487.0; Mon, 10 Aug 2020 18:38:49 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 10 Aug 2020 18:38:45 +0800
Message-ID: <20200810103845.37649-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1k55D4-00FPVi-Lu
Subject: [f2fs-dev] [PATCH] f2fs: fix compile warning
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
Cc: kernel test robot <lkp@intel.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes below compile warning reported by LKP
(kernel test robot)

cppcheck warnings: (new ones prefixed by >>)

>> fs/f2fs/file.c:761:9: warning: Identical condition 'err', second condition is always false [identicalConditionAfterEarlyExit]
    return err;
           ^
   fs/f2fs/file.c:753:6: note: first condition
    if (err)
        ^
   fs/f2fs/file.c:761:9: note: second condition
    return err;

Reported-by: kernel test robot <lkp@intel.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8a422400e824..f16120352f0c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -753,11 +753,14 @@ int f2fs_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		return err;
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (from != free_from)
+	if (from != free_from) {
 		err = f2fs_truncate_partial_cluster(inode, from, lock);
+		if (err)
+			return err;
+	}
 #endif
 
-	return err;
+	return 0;
 }
 
 int f2fs_truncate(struct inode *inode)
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
