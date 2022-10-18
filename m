Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E00FF602146
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Oct 2022 04:41:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1okcXY-00063q-T5;
	Tue, 18 Oct 2022 02:41:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1okcXY-00063f-9S
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 02:41:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=woTU1vTaasVCB49S87a8lgHW8KVFlWEuHp+ourE+QXw=; b=GSzMtCLX4i2z5VVWTvQNX/k8CD
 /idDMgqr34iQ7/rKuvVJPFJiRnv+Aski9JpaBIrjs2KQultHTOB593QRuR8qgqG2MbCkCw7jXXwrT
 Ey3D1eUkkY4h18t02QOCz0oQivcouPhnJd3oqAbxeM9hBSbJRhsoS7aTQTNisoqmZfQw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=woTU1vTaasVCB49S87a8lgHW8KVFlWEuHp+ourE+QXw=; b=H5MMesv7txU7xriG3+T+FfEccJ
 WK1QKzLqyV1piEb49y5KLGMl9Njinc3ghBvdtXt6ezTqfbVzsCJqAqhDnf+4nbgTaHh1VntaS6/3K
 ESRnidsCPxjfAgOTKLDxPx92H35FZ/jq02d+g61RVH1tRW0SKcXIwRCQBFp3h31FmVuU=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1okcXS-0002gT-6p for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Oct 2022 02:41:12 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.53])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MryfN5v7lzmVFS;
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
Date: Tue, 18 Oct 2022 10:45:32 +0800
Message-ID: <20221018024532.44184-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20221018024532.44184-1-zhangqilong3@huawei.com>
References: <20221018024532.44184-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Because the set/clear SBI_IS_RESIZEFS flag not between any
 locks, In the following case: thread1 thread2 ->ioctl(resizefs) ->set RESIZEFS
 flag ->ioctl(resizefs) ... ->set RESIZEFS flag ->clear RESIZEF [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1okcXS-0002gT-6p
Subject: [f2fs-dev] [PATCH] f2fs: Fix the race condition of resize flag
 between resizefs
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

Because the set/clear SBI_IS_RESIZEFS flag not between any locks,
In the following case:
  thread1			thread2
   ->ioctl(resizefs)
    ->set RESIZEFS flag		 ->ioctl(resizefs)
    ...                   	  ->set RESIZEFS flag
    ->clear RESIZEFS flag
    				  ->resizefs stream
				    # No RESIZEFS flag in the stream

Also before freeze_super, the resizefs not started, we should not set
the SBI_IS_RESIZEFS flag.

So move the set/clear SBI_IS_RESIZEFS flag between the cp_mutex and
gc_lock.

Fixes: b4b10061ef98 ("f2fs: refactor resize_fs to avoid meta updates in progress")
Signed-off-by: Zhang Xiaoxu <zhangxiaoxu5@huawei.com>
Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
v2:
- modify commit message
---
 fs/f2fs/gc.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 4546e01b2ee0..2a9d825b84f7 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2133,8 +2133,6 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	if (err)
 		return err;
 
-	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
-
 	freeze_super(sbi->sb);
 	f2fs_down_write(&sbi->gc_lock);
 	f2fs_down_write(&sbi->cp_global_sem);
@@ -2150,6 +2148,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	if (err)
 		goto out_err;
 
+	set_sbi_flag(sbi, SBI_IS_RESIZEFS);
 	err = free_segment_range(sbi, secs, false);
 	if (err)
 		goto recover_out;
@@ -2173,6 +2172,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 		f2fs_commit_super(sbi, false);
 	}
 recover_out:
+	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
 	if (err) {
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_err(sbi, "resize_fs failed, should run fsck to repair!");
@@ -2185,6 +2185,5 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	f2fs_up_write(&sbi->cp_global_sem);
 	f2fs_up_write(&sbi->gc_lock);
 	thaw_super(sbi->sb);
-	clear_sbi_flag(sbi, SBI_IS_RESIZEFS);
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
