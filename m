Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E52A0350CDB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Apr 2021 05:02:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lRnbM-0007Jf-Ro; Thu, 01 Apr 2021 03:02:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lRnbK-0007JX-Fk
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Apr 2021 03:02:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Lv0ZLmQtqRDmmRSe24lLojJqozv307ZWCEk/Xxe2SRQ=; b=QlA1JUYhlvNMwnR72AaYDiDywy
 DyEqCYT0lml+WZSdhC/2qPsIikH8yxNySfI6T6Tlw2Upo34SU/MQ2nWbL8UkHoLFtW//+NNNscvAN
 zvXnw3raMHACI8776sBPtLLtoCaj5RLWZhPPEiCN9MPO+7MeMOvRHShZ4KIMdkfhcHkU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Lv0ZLmQtqRDmmRSe24lLojJqozv307ZWCEk/Xxe2SRQ=; b=J
 5sDdJDn9gE+67veF54OAN5sF59dicN+G5eV7iZtnB2DkmvqsY0lajmpEXf9TYsFEOppXqVs3Xdelw
 1llnR2C27iMtQL61Eo+FxyVfRGtwPK/EkR1/bD+rdtAsb1ZFI/7WWC8pcw7pkpgaihl/TC2np3JUy
 Wo642GhCmPuSjmwA=;
Received: from szxga05-in.huawei.com ([45.249.212.191])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lRnbF-001cQJ-7K
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 01 Apr 2021 03:02:30 +0000
Received: from DGGEMS408-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4F9nwn3k1WzyNpJ;
 Thu,  1 Apr 2021 11:00:09 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS408-HUB.china.huawei.com (10.3.19.208) with Microsoft SMTP Server id
 14.3.498.0; Thu, 1 Apr 2021 11:02:05 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 1 Apr 2021 11:01:53 +0800
Message-ID: <20210401030153.39913-1-yuchao0@huawei.com>
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
X-Headers-End: 1lRnbF-001cQJ-7K
Subject: [f2fs-dev] [PATCH] f2fs: fix to avoid GC/mmap race with
 f2fs_truncate()
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

It missed to hold i_gc_rwsem and i_map_sem around f2fs_truncate()
in f2fs_file_write_iter() to avoid racing with background GC and
mmap, fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/file.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index dc79694e512c..f3ca63b55843 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4443,8 +4443,13 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		clear_inode_flag(inode, FI_NO_PREALLOC);
 
 		/* if we couldn't write data, we should deallocate blocks. */
-		if (preallocated && i_size_read(inode) < target_size)
+		if (preallocated && i_size_read(inode) < target_size) {
+			down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+			down_write(&F2FS_I(inode)->i_mmap_sem);
 			f2fs_truncate(inode);
+			up_write(&F2FS_I(inode)->i_mmap_sem);
+			up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+		}
 
 		if (ret > 0)
 			f2fs_update_iostat(F2FS_I_SB(inode), APP_WRITE_IO, ret);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
