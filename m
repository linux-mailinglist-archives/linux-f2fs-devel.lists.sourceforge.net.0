Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F37A5B729F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Sep 2022 17:02:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oY7R2-0007E3-3s;
	Tue, 13 Sep 2022 15:02:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oY7Qy-0007Di-WA
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 15:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=AoSn0PzDIJkD2yfvTX5JM/JA73Zo2+7jMmvN3UvcAs4=; b=J6Z2qk8bO/iDBVlhgFXpXFSCfw
 lQaME3vxhj4qJeD1+zgh0ZiRLHWl8hyoAzwagBLGbE3HhKDWLfqPdYxrwZLH9+fBRAoQrNX/OqhY7
 2j+cdd6CcKtLcH3dg8l6uCBvK95LItzMnVH/UUn9UV+JfnqKzIkCg9Bdf5OsPgKRo7X4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=AoSn0PzDIJkD2yfvTX5JM/JA73Zo2+7jMmvN3UvcAs4=; b=EO7VCAV5VlfUfCUehnkl/DfqGR
 zV6hNsrJbmW/u3gcsssA/8u32ywM82mErVMaTl2Tmp2n/uAYIHY/BC2LBXCE1fdbSRs+RaSPJaRvI
 k/99uIxx89iSPUeHBvHGHE86dQpsgExuB3ED6wZYeDfztlWwCxC8NCrsVYMTfmpW7d0E=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oY7Qw-0004bB-Im for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Sep 2022 15:02:44 +0000
Received: from dggemv711-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MRmnP0qc1zmVPy;
 Tue, 13 Sep 2022 22:58:49 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv711-chm.china.huawei.com (10.1.198.66) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 13 Sep 2022 23:02:33 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Tue, 13 Sep
 2022 23:02:32 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 13 Sep 2022 23:06:02 +0800
Message-ID: <20220913150604.45447-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220913150604.45447-1-zhangqilong3@huawei.com>
References: <20220913150604.45447-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: ERROR: spaces required around that ':' Signed-off-by: Zhang
 Qilong <zhangqilong3@huawei.com> --- fs/f2fs/data.c | 2 +- fs/f2fs/debug.c
 | 2 +- fs/f2fs/file.c | 2 +- 3 files changed, 3 insertions(+), 3 deletions(-)
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oY7Qw-0004bB-Im
Subject: [f2fs-dev] [PATCH -next 1/3] f2fs: insert a space around colon
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

ERROR: spaces required around that ':'

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/data.c  | 2 +-
 fs/f2fs/debug.c | 2 +-
 fs/f2fs/file.c  | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 7d656bf51c52..8b1814c80c30 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -725,7 +725,7 @@ int f2fs_submit_page_bio(struct f2fs_io_info *fio)
 		wbc_account_cgroup_owner(fio->io_wbc, page, PAGE_SIZE);
 
 	inc_page_count(fio->sbi, is_read_io(fio->op) ?
-			__read_io_type(page): WB_DATA_TYPE(fio->page));
+			__read_io_type(page) : WB_DATA_TYPE(fio->page));
 
 	__submit_bio(fio->sbi, bio, fio->type);
 	return 0;
diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 88231d393b7c..951f4212380b 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -348,7 +348,7 @@ static int stat_show(struct seq_file *s, void *v)
 
 		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
 			si->sbi->sb->s_bdev, i++,
-			f2fs_readonly(si->sbi->sb) ? "RO": "RW",
+			f2fs_readonly(si->sbi->sb) ? "RO" : "RW",
 			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
 			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
 		if (si->sbi->s_flag) {
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6306c081e0be..3970273e0fd2 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4662,7 +4662,7 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 skip_write_trace:
 		/* Do the actual write. */
 		ret = dio ?
-			f2fs_dio_write_iter(iocb, from, &may_need_sync):
+			f2fs_dio_write_iter(iocb, from, &may_need_sync) :
 			f2fs_buffered_write_iter(iocb, from);
 
 		if (trace_f2fs_datawrite_end_enabled())
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
