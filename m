Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A69A25B89F
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Sep 2020 04:15:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kDeml-0001e3-5f; Thu, 03 Sep 2020 02:15:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kDemi-0001dr-Ox
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 02:15:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iUJr+RWgFGUDUU9y3dcy1tsnmOca4eVSu+g7KHmJvHw=; b=JOWOAI/mgdutX5sUBAD9h5rT+y
 ZPUU4YJWRn7uSwXh/a3bbZeVAIVxtRH1ZLJCLv1LmA7CeoGwISSBO5jqSH9ZXcHiCIgV/uijEuAge
 2Zte2HkMtAGBvmV+U+6ZZxWy8fGItPIZ4GnwK+GPav3jrDHQLOpHbVO66YrL0SiDhS20=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iUJr+RWgFGUDUU9y3dcy1tsnmOca4eVSu+g7KHmJvHw=; b=g
 NrqfaeazLWBqkxKGyNhndzfTTnr70sRhuEi8CI0tZ8AyR8DaD5eBh1mtgX4/DOdSdwUtBgAFfhllQ
 +piraJDh19DYw2kr7uR8LCX3E493wlFynWI5FTB3CdB3yxKRWr8xXtDYDgHFX0f9Ff55qCcELzb3I
 K5Ix6w7hkRwxxVA0=;
Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kDemd-00ArOm-NK
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Sep 2020 02:15:32 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 8C1F6282EE4D954215D6;
 Thu,  3 Sep 2020 10:15:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS414-HUB.china.huawei.com (10.3.19.214) with Microsoft SMTP Server id
 14.3.487.0; Thu, 3 Sep 2020 10:15:12 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 3 Sep 2020 10:14:41 +0800
Message-ID: <20200903021441.100226-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
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
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kDemd-00ArOm-NK
Subject: [f2fs-dev] [PATCH] f2fs: ignore compress mount option on image w/o
 compression feature
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
Cc: Kyungmin Park <kyungmin.park@samsung.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

to keep consistent with behavior when passing compress mount option
to kernel w/o compression feature, so that mount may not fail on
such condition.

Reported-by: Kyungmin Park <kyungmin.park@samsung.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/super.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index ae0b351671f4..9d4da2d13ab4 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -871,8 +871,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		case Opt_compress_algorithm:
 			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_err(sbi, "Compression feature if off");
-				return -EINVAL;
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
 			}
 			name = match_strdup(&args[0]);
 			if (!name)
@@ -897,8 +897,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			break;
 		case Opt_compress_log_size:
 			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_err(sbi, "Compression feature is off");
-				return -EINVAL;
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
 			}
 			if (args->from && match_int(args, &arg))
 				return -EINVAL;
@@ -912,8 +912,8 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 			break;
 		case Opt_compress_extension:
 			if (!f2fs_sb_has_compression(sbi)) {
-				f2fs_err(sbi, "Compression feature is off");
-				return -EINVAL;
+				f2fs_info(sbi, "Image doesn't support compression");
+				break;
 			}
 			name = match_strdup(&args[0]);
 			if (!name)
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
