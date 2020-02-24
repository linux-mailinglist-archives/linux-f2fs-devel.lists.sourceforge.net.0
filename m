Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18A8616A4C8
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Feb 2020 12:20:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j6Bn8-0005Up-Kf; Mon, 24 Feb 2020 11:20:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j6Bn7-0005Ui-0k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kSW3sNtayiKJHKvzLlHlaBKPW54fXoSDJsJRFMoYDtc=; b=FNvYGnvQD3DjUgARPApOWHhd8z
 n9jgJ16z/LwfIKOCBUYI63xfV1DEB8n1diZdMo0l0Z3nGyOHDJedKgBojKj9iih2cseRbcLT9JDFn
 h8efM2EHRdsMpnEx9LqcjNDkjAWqrTOYmyCUSlq5kyEjjpLvdYEKuxxpbNY2y0/efjA4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kSW3sNtayiKJHKvzLlHlaBKPW54fXoSDJsJRFMoYDtc=; b=j9jrG/5F0gU/Wkv2OsL1C8ZD9K
 aqAP0Q3M0MFf1FihXL5VDgkckZFkCCoHGvUU+mIVdg2CkXDzDJ8MxBqw186ddVsjXVYSl9sClJ9ZT
 /P6nIWtq6kzT/SRACQc4fVe4nGreP5+kzAeBUwu6awlAYG7aqxpWYykOvw0nEDN5pBZc=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j6Bn3-0056fP-EG
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 24 Feb 2020 11:20:48 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.60])
 by Forcepoint Email with ESMTP id 792044D98C522702459D;
 Mon, 24 Feb 2020 19:20:36 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.439.0; Mon, 24 Feb 2020 19:20:26 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Mon, 24 Feb 2020 19:20:16 +0800
Message-ID: <20200224112019.93829-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
In-Reply-To: <20200224112019.93829-1-yuchao0@huawei.com>
References: <20200224112019.93829-1-yuchao0@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j6Bn3-0056fP-EG
Subject: [f2fs-dev] [PATCH 2/5] f2fs: fix to avoid potential deadlock
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

Using f2fs_trylock_op() in f2fs_write_compressed_pages() to avoid potential
deadlock like we did in f2fs_write_single_data_page().

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/compress.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index b1bc057ee266..4ba65a3b0456 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -772,7 +772,6 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 		.encrypted_page = NULL,
 		.compressed_page = NULL,
 		.submitted = false,
-		.need_lock = LOCK_RETRY,
 		.io_type = io_type,
 		.io_wbc = wbc,
 		.encrypted = f2fs_encrypted_file(cc->inode),
@@ -785,9 +784,10 @@ static int f2fs_write_compressed_pages(struct compress_ctx *cc,
 	loff_t psize;
 	int i, err;
 
-	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
+	if (!f2fs_trylock_op(sbi))
+		return -EAGAIN;
 
-	f2fs_lock_op(sbi);
+	set_new_dnode(&dn, cc->inode, NULL, NULL, 0);
 
 	err = f2fs_get_dnode_of_data(&dn, start_idx, LOOKUP_NODE);
 	if (err)
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
