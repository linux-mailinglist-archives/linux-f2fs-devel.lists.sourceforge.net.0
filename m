Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 915622F55DF
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 14 Jan 2021 02:42:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kzreP-0007lC-8S; Thu, 14 Jan 2021 01:42:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kzreN-0007kp-Ke
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 01:42:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kP982GQJZ/EoKBuwzb11gkUUu+V3Jas3oJDe/TaZKVA=; b=WwOaj7lF6/0CKDKmG3Sv8+rV0d
 hhHBPGMQqSuUHCG6e76TC+sU+Di2yPrlFBx4YCqR9dqtKhOUlavh1ptvd1TYiiMggI9EGgGyxTpSp
 OErYI66VL+1HAS1TK9O0DJu/o6kANyaBPZv+dWTlUqO1zEKwwggVnKaJfCqTO8jyuX60=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kP982GQJZ/EoKBuwzb11gkUUu+V3Jas3oJDe/TaZKVA=; b=Z
 vAaVPH6kv4CqMNpGaRkJpZdkaRTYO8TRac5wGEQxQK9JsGyXtS4vggeTEm2sUAwkseFNwLtfGk0Rr
 D2GfET+Sd3roYrw2nBRnoPnBFGWs+u9Hr7BwEXNhU04WkoYh7McfPHMcTflnZPtkEuEYbdPlR1qB+
 wBYCMDcLTPP5mKEk=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kzreE-0058Jj-S5
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 14 Jan 2021 01:42:11 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4DGRq31btxzj69R;
 Thu, 14 Jan 2021 09:41:03 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.498.0; Thu, 14 Jan 2021 09:41:45 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Thu, 14 Jan 2021 09:41:27 +0800
Message-ID: <20210114014127.54510-1-yuchao0@huawei.com>
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
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kzreE-0058Jj-S5
Subject: [f2fs-dev] [PATCH v5 5/5] f2fs: introduce sb_status sysfs node
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
status in real time as a hexadecimal value.

value           sb status macro                 description

0x1             SBI_IS_DIRTY,                   /* dirty flag for checkpoint */
0x2             SBI_IS_CLOSE,                   /* specify unmounting */
0x4             SBI_NEED_FSCK,                  /* need fsck.f2fs to fix */
0x8             SBI_POR_DOING,                  /* recovery is doing or not */
0x10            SBI_NEED_SB_WRITE,              /* need to recover superblock */
0x20            SBI_NEED_CP,                    /* need to checkpoint */
0x40            SBI_IS_SHUTDOWN,                /* shutdown by ioctl */
0x80            SBI_IS_RECOVERED,               /* recovered orphan/data */
0x100           SBI_CP_DISABLED,                /* CP was disabled last mount */
0x200           SBI_CP_DISABLED_QUICK,          /* CP was disabled quickly */
0x400           SBI_QUOTA_NEED_FLUSH,           /* need to flush quota info in CP */
0x800           SBI_QUOTA_SKIP_FLUSH,           /* skip flushing quota in current CP */
0x1000          SBI_QUOTA_NEED_REPAIR,          /* quota file may be corrupted */
0x2000          SBI_IS_RESIZEFS,                /* resizefs is in process */

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v5:
- fix compile warning reported by Stephen:
Documentation/ABI/testing/sysfs-fs-f2fs:382: WARNING: Malformed table.
 Documentation/ABI/testing/sysfs-fs-f2fs | 23 +++++++++++++++++++++++
 fs/f2fs/sysfs.c                         |  8 ++++++++
 2 files changed, 31 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3dfee94e0618..362803901614 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -377,3 +377,26 @@ Description:	This gives a control to limit the bio size in f2fs.
 		Default is zero, which will follow underlying block layer limit,
 		whereas, if it has a certain bytes value, f2fs won't submit a
 		bio larger than that size.
+
+What:		/sys/fs/f2fs/<disk>/stat/sb_status
+Date:		December 2020
+Contact:	"Chao Yu" <yuchao0@huawei.com>
+Description:	Show status of f2fs superblock in real time.
+
+		====== ===================== =================================
+		value  sb status macro       description
+		0x1    SBI_IS_DIRTY          dirty flag for checkpoint
+		0x2    SBI_IS_CLOSE          specify unmounting
+		0x4    SBI_NEED_FSCK         need fsck.f2fs to fix
+		0x8    SBI_POR_DOING         recovery is doing or not
+		0x10   SBI_NEED_SB_WRITE     need to recover superblock
+		0x20   SBI_NEED_CP           need to checkpoint
+		0x40   SBI_IS_SHUTDOWN       shutdown by ioctl
+		0x80   SBI_IS_RECOVERED      recovered orphan/data
+		0x100  SBI_CP_DISABLED       CP was disabled last mount
+		0x200  SBI_CP_DISABLED_QUICK CP was disabled quickly
+		0x400  SBI_QUOTA_NEED_FLUSH  need to flush quota info in CP
+		0x800  SBI_QUOTA_SKIP_FLUSH  skip flushing quota in current CP
+		0x1000 SBI_QUOTA_NEED_REPAIR quota file may be corrupted
+		0x2000 SBI_IS_RESIZEFS       resizefs is in process
+		====== ===================== =================================
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index bd1174ed2e6f..f39874d512ea 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -96,6 +96,12 @@ static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 				sbi->sectors_written_start) >> 1)));
 }
 
+static ssize_t sb_status_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%lx\n", sbi->s_flag);
+}
+
 static ssize_t features_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -702,7 +708,9 @@ static struct attribute *f2fs_feat_attrs[] = {
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
