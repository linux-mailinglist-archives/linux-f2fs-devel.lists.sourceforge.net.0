Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A15602147
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 04:41:17 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okcXX-0004zw-WC;
	Tue, 18 Oct 2022 02:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1okcXW-0004zq-QR
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 02:41:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ADllmvyb7NPWxp1dy6NQsaxgvtX3ApXmFCMVKW311wI=; b=I4DmJVVpU49DxiAck4BWKhAVLX
 pNq+tG7zlrSaWdBPcLo/20FMldL+c60ZyI5ARd/82dwhaCP2pdu8DGGCVdUQYIWN9dSV3YGwww1h+
 cDOVfxtWQath5BK84o6DGIASaK48XFxHqIheEKOOt/0gX2UpPRn65W558SUdLY9BYSck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ADllmvyb7NPWxp1dy6NQsaxgvtX3ApXmFCMVKW311wI=; b=n
 DAPS6aDGQToLncKBW5rhGE2kEFEHNIayK3ERUHDsuy+tjtH0+j1/SEC3/AFv9Jgytgl/9iIG4On+D
 M/l5cl7hkxz2eVhQa0+eZsydL/NDGLbKPNlZhKYyeLgcWnqXAmTBz00xWHG9QRWOlGAp6zhYn1HfA
 M16xzQ2jYOGNdZkY=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okcXR-007mYA-7R for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 02:41:10 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MryfN5hVPzmVFN;
 Tue, 18 Oct 2022 10:36:12 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 18 Oct 2022 10:40:27 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 18 Oct
 2022 10:40:27 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 18 Oct 2022 10:45:31 +0800
Message-ID: <20221018024532.44184-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In the following case: process 1 process 2 ->open A ->mmap
 ->read # the first time ->ioctl w/h F2FS_IOC_MOVE_RANGE # (range A->B) ->read
 # the second time We will read old data at the second time. The root cause
 is that user still can see the previous source data after being moved. We
 fix it by adding truncating after __exchange_data_block. 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1okcXR-007mYA-7R
Subject: [f2fs-dev] [PATCH] f2fs: Fix data consistency in
 f2fs_move_file_range()
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In the following case:
process 1			process 2
 ->open A
  ->mmap
   ->read # the first time
   				 ->ioctl w/h F2FS_IOC_MOVE_RANGE
				        	# (range A->B)
   ->read # the second time

We will read old data at the second time. The root cause is that
user still can see the previous source data after being moved. We
fix it by adding truncating after __exchange_data_block.

Fixes: 4dd6f977fc77 ("f2fs: support an ioctl to move a range of data blocks")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- moving truncating to the range of f2fs_lock_op()

v3:
- modify the title and commit message
---
 fs/f2fs/file.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82cda1258227..e9dfa41baf9e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2824,6 +2824,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 			goto out_src;
 	}
 
+	filemap_invalidate_lock(src->i_mapping);
 	f2fs_lock_op(sbi);
 	ret = __exchange_data_block(src, dst, pos_in >> F2FS_BLKSIZE_BITS,
 				pos_out >> F2FS_BLKSIZE_BITS,
@@ -2835,7 +2836,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		else if (dst_osize != dst->i_size)
 			f2fs_i_size_write(dst, dst_osize);
 	}
+	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
 	f2fs_unlock_op(sbi);
+	filemap_invalidate_unlock(src->i_mapping);
 
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
