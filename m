Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3860D30BB35
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Feb 2021 10:40:48 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1l6sAq-00006d-FK; Tue, 02 Feb 2021 09:40:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1l6sAo-00006Q-9c
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fOe/P78qoS6er6vlaltRCqqR9L1H4TgVThpxn6+MHu4=; b=lT7WvBs4fLddw+g6kBiPZhPJAX
 67rBL96/PlDX23hjFObRfapgUPb/05CcnT9FPUlgrdr4OB85jKE4tXR4OxDVG4Af+LgjyohdtAQ2B
 19Qt14+dXXc6quhKmS6W4g9M8tIv/EJNp0AlWZYzVG5rVkwqgZEMnJu+rT6HzsPFRDGQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=fOe/P78qoS6er6vlaltRCqqR9L1H4TgVThpxn6+MHu4=; b=l
 AVFFQUZBnznCEMtOIob0a/1KzPC1w4ayG2RxY9VeZA8o48K9rM21lmBig7zBDVWWR8XPtatmlQ6fn
 bTfpoGZ6YYq4sVaOZrqgYTKYJUTzFxOIjB0xHpvYVdrAY0zD1skCDt4/9/f4AIC//U/sLf1p4RbMQ
 X8jq0UlUgiIMRgrk=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1l6sAe-00EAMf-6u
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Feb 2021 09:40:38 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4DVKWq2QL5z162cM;
 Tue,  2 Feb 2021 17:39:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Tue, 2 Feb 2021 17:40:10 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 2 Feb 2021 17:39:22 +0800
Message-ID: <20210202093922.64273-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1l6sAe-00EAMf-6u
Subject: [f2fs-dev] [PATCH] f2fs: fix a wrong condition in __submit_bio
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

From: Dehe Gu <gudehe@huawei.com>

We should use !F2FS_IO_ALIGNED() to check and submit_io directly.

Fixes: 8223ecc456d0 ("f2fs: fix to add missing F2FS_IO_ALIGNED() condition")
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Dehe Gu <gudehe@huawei.com>
Signed-off-by: Ge Qiu <qiuge@huawei.com>
---
 fs/f2fs/data.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 38476d0d3916..1ee966a63df9 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -470,7 +470,7 @@ static inline void __submit_bio(struct f2fs_sb_info *sbi,
 		if (f2fs_lfs_mode(sbi) && current->plug)
 			blk_finish_plug(current->plug);
 
-		if (F2FS_IO_ALIGNED(sbi))
+		if (!F2FS_IO_ALIGNED(sbi))
 			goto submit_io;
 
 		start = bio->bi_iter.bi_size >> F2FS_BLKSIZE_BITS;
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
