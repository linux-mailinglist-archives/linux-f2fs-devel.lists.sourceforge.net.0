Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1DDD85B65F0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 05:02:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oXwBm-0002Gi-Jm;
	Tue, 13 Sep 2022 03:02:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oXwBh-0002Gb-IN
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:02:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DUjQl2hHgyOSfSX875xyaJq1fSOY34d/K8q3jpqDrfw=; b=VYVcg/ofBFPhPug0aPUCUqkrzS
 wd/zzrT1iZtyDFEqLUXHa2Pltt+alkX5bknTqvrqX9bmHVW7NuKDj3nAQ+kQkYZmxjekxJADw0uvv
 umNjw6aCk9zAZchPQ4Cj2Yh6kNRDM2ijvzIG+Bmod3Lbq9PiLFLdSMgqTTJTK+Xh8FeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DUjQl2hHgyOSfSX875xyaJq1fSOY34d/K8q3jpqDrfw=; b=X
 /sf86WwBWnBnTXhOJhNSfvkrzmNLfNf+QHed0dfEWuieW6nO4GNnQqy7MGCCyzdWeuV3uaxRrFi2C
 rwf952X2fTw5jaGW9veMGOugbxlpAPXZIDcKV0C23PGrDVzOAvylukvIXFjN22Rl/WJOafo34BYmo
 r2DROMfSqTBJZtjU=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oXwBc-006UAK-38 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 03:02:13 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4MRSnk0Stqz14QZx;
 Tue, 13 Sep 2022 10:58:02 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 11:01:57 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 11:01:57 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 13 Sep 2022 11:05:29 +0800
Message-ID: <20220913030529.3944-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If we do not truncate source page cache, user can still see
 the previous source data after being moved. We fix it by adding truncating
 after __exchange_data_block. Fixes:4dd6f977fc778 ("f2fs: support an ioctl
 to move a range of data blocks") Signed-off-by: Zhang Qilong
 <zhangqilong3@huawei.com>
 --- fs/f2fs/file.c | 4 ++++ 1 file changed, 4 insertions(+) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oXwBc-006UAK-38
Subject: [f2fs-dev] [PATCH -next] f2fs: adding truncate page cache after
 being moved
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

If we do not truncate source page cache, user can still
see the previous source data after being moved. We fix
it by adding truncating after __exchange_data_block.

Fixes:4dd6f977fc778 ("f2fs: support an ioctl to move a range of data blocks")
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/file.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 771f1f7f3690..e3ff648aa496 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2789,6 +2789,10 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	}
 	f2fs_unlock_op(sbi);
 
+	filemap_invalidate_lock(src->i_mapping);
+	truncate_pagecache_range(src, pos_in, pos_in + len - 1);
+	filemap_invalidate_unlock(src->i_mapping);
+
 	if (src != dst)
 		f2fs_up_write(&F2FS_I(dst)->i_gc_rwsem[WRITE]);
 out_src:
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
