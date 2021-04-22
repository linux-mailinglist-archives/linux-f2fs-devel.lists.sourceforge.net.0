Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD016367E83
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Apr 2021 12:20:21 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lZWRQ-0004Yl-5K; Thu, 22 Apr 2021 10:20:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lZWRN-0004Yc-I7
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 10:20:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c5fF1DBmaD2NXCfQJuiX4u4cP4JYuOvuLumZcY9J2Vw=; b=kPp+SEQjAYEpbkDv1W4YwAtCmY
 oJNNikWmomm/WphE6BAPCdTd4ZL9atzog3wCbrvxfCAYmZCLFpXwZIJMZhjGGjDldGe9Jrs48FM4G
 rqT7/DLaJcefEWkdqcmMexCDN6ffhZ0xRJ7iXDzOc6yFhc2drijk18btywdkm9h6rBq8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c5fF1DBmaD2NXCfQJuiX4u4cP4JYuOvuLumZcY9J2Vw=; b=i
 +dovx2ZpxQIjcM/iMiQwDtohH4v3gHsKIA0HnpUhdUOccINiAcHl31qC8cdLmsSksZ/gkhs5k0Edv
 hjd2gXUo2v8cXsorxYb+7jY433wNXYNj/UcqNTtB6JsNPSJhHJ+FyZsVjFH635QVYKYlS8A1lZgSn
 P86Cnb6HJQG5oPh0=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lZWRB-0003np-5w
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Apr 2021 10:20:09 +0000
Received: from DGGEMS407-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4FQtcv0LT0zpZh0;
 Thu, 22 Apr 2021 18:16:47 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS407-HUB.china.huawei.com (10.3.19.207) with Microsoft SMTP Server id
 14.3.498.0; Thu, 22 Apr 2021 18:19:38 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 22 Apr 2021 18:19:25 +0800
Message-ID: <20210422101925.108345-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lZWRB-0003np-5w
Subject: [f2fs-dev] [PATCH] f2fs: drop inplace IO if fs status is abnormal
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

If filesystem has cp_error or need_fsck status, let's drop inplace IO
to avoid further corruption of fs data.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/segment.c | 17 ++++++++++++++++-
 1 file changed, 16 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 6e740ecf0814..3de119e5c934 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3551,7 +3551,13 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		set_sbi_flag(sbi, SBI_NEED_FSCK);
 		f2fs_warn(sbi, "%s: incorrect segment(%u) type, run fsck to fix.",
 			  __func__, segno);
-		return -EFSCORRUPTED;
+		err = -EFSCORRUPTED;
+		goto drop_bio;
+	}
+
+	if (is_sbi_flag_set(sbi, SBI_NEED_FSCK) || f2fs_cp_error(sbi)) {
+		err = -EIO;
+		goto drop_bio;
 	}
 
 	stat_inc_inplace_blocks(fio->sbi);
@@ -3565,6 +3571,15 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		f2fs_update_iostat(fio->sbi, fio->io_type, F2FS_BLKSIZE);
 	}
 
+	return err;
+drop_bio:
+	if (fio->bio) {
+		struct bio *bio = *(fio->bio);
+
+		bio->bi_status = BLK_STS_IOERR;
+		bio_endio(bio);
+		fio->bio = NULL;
+	}
 	return err;
 }
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
