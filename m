Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2A82D2185
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  8 Dec 2020 04:41:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmTsM-0003t2-68; Tue, 08 Dec 2020 03:41:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kmTsJ-0003su-Tu
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 03:41:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KcZuF+/B4GAWkfGWtv6VwrBjnUMJ7HIM0YYISEbfkr8=; b=PBkfxlswwBJ+dksIF2fcuB/DLg
 c+fozNeBOIuHOZ4KcZ4PuUDRZLV2SWY0kSW8UDmF0kLk71FV+mU9aH6ZUrw0y2du0sRUYZPXHXYDx
 mU0vP9u1mPAQUmsbYBh7wBznaDdpl/qHKrXsYr48h8ZdSfpwO0hMFv3XaZ5I33PQNZwE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=KcZuF+/B4GAWkfGWtv6VwrBjnUMJ7HIM0YYISEbfkr8=; b=X
 CU3a/L+PNP8OEZ7hNg0ghgn7NLcLzpV4C4xMIXMWXlKIrq9cdUMbqXx1SFqPSzCCSWdwlQBcApGnk
 kWE9KmuOSs1QEzU7xVUgQkx3vB2Vg2IsWdsLm4/3fnBj9OW9O3Kxo/+uqGlW7/8skVXsIvDOyZxWy
 eDrujUhHn0umd70s=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmTsA-0067Ok-PP
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 08 Dec 2020 03:41:15 +0000
Received: from DGGEMS413-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqmCl3KNDzkmkY;
 Tue,  8 Dec 2020 11:40:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS413-HUB.china.huawei.com (10.3.19.213) with Microsoft SMTP Server id
 14.3.487.0; Tue, 8 Dec 2020 11:40:52 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 8 Dec 2020 11:40:40 +0800
Message-ID: <20201208034040.67658-1-yuchao0@huawei.com>
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
X-Headers-End: 1kmTsA-0067Ok-PP
Subject: [f2fs-dev] [PATCH] f2fs: introduce sb_status sysfs node
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

Introduce /sys/fs/f2fs/<devname>/stat/sb_status to show superblock
status in real time.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  5 ++++
 fs/f2fs/sysfs.c                         | 36 +++++++++++++++++++++++++
 2 files changed, 41 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3dfee94e0618..57ab839dc3a2 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -377,3 +377,8 @@ Description:	This gives a control to limit the bio size in f2fs.
 		Default is zero, which will follow underlying block layer limit,
 		whereas, if it has a certain bytes value, f2fs won't submit a
 		bio larger than that size.
+
+What:		/sys/fs/f2fs/<disk>/stat/sb_status
+Date:		December 2020
+Contact:	"Chao Yu" <yuchao0@huawei.com>
+Description:	Show status of f2fs superblock in real time.
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index ebca0b4961e8..1b85e6d16a94 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -101,6 +101,40 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 				sbi->sectors_written_start) >> 1)));
 }
 
+#define	SB_STATUS(s)	(s ? "yes" : "no")
+static ssize_t sb_status_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "IS_DIRTY:		%s\n"
+				"IS_CLOSE:		%s\n"
+				"IS_SHUTDOWN:		%s\n"
+				"IS_RECOVERED:		%s\n"
+				"IS_RESIZEFS:		%s\n"
+				"NEED_FSCK:		%s\n"
+				"POR_DOING:		%s\n"
+				"NEED_SB_WRITE:		%s\n"
+				"NEED_CP:		%s\n"
+				"CP_DISABLED:		%s\n"
+				"CP_DISABLED_QUICK:	%s\n"
+				"QUOTA_NEED_FLUSH:	%s\n"
+				"QUOTA_SKIP_FLUSH:	%s\n"
+				"QUOTA_NEED_REPAIR:	%s\n",
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_DIRTY)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_CLOSE)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_SHUTDOWN)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_RECOVERED)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_IS_RESIZEFS)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_FSCK)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_POR_DOING)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_SB_WRITE)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_NEED_CP)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_CP_DISABLED)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_CP_DISABLED_QUICK)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_NEED_FLUSH)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)),
+			SB_STATUS(is_sbi_flag_set(sbi, SBI_QUOTA_NEED_REPAIR)));
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -711,7 +745,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 };
 ATTRIBUTE_GROUPS(f2fs_feat);
 
+F2FS_GENERAL_RO_ATTR(sb_status);
 static struct attribute *f2fs_stat_attrs[] = {
+	ATTR_LIST(sb_status),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_stat);
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
