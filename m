Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A00CE167A33
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Feb 2020 11:10:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1j55Fp-0000w4-GS; Fri, 21 Feb 2020 10:09:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1j55Fl-0000vd-SA
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 10:09:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EcZdJ2x8ZpWsrCVUtgqhgCZXPPaTxsMx3HqrzXsSh9k=; b=fxUShAyfG0lZtCLwEpigx+qR97
 7IfphgNG+SiyyUgHALWcVS7ogU9DnPbNObF72TjV/AThGO28dPTGGfpPcYsGa24/EnNQXgcB8/Qqf
 744UIULm6RTT+ro3y8JgSbX/iYWbZX2mkJEL38hsR0zMCVeYC2pHvgFqP4thgUoVk47w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EcZdJ2x8ZpWsrCVUtgqhgCZXPPaTxsMx3HqrzXsSh9k=; b=X
 c4tWQDkkA+O6dF92VDJflLuwo5lumkWJjrPwz5LjoEpgW3jVSAXHNE2dHN1cCbgD4AUKuAB4GyPcC
 yqHEcMLVaQjs1hGEmr/ol+Q0OPCeNRq0CAfnAeDnYZ0+lduSAgw+sAa7IGcpHrABksyXURljSmM6R
 PXs1UgdrKzyG1g5Y=;
Received: from szxga07-in.huawei.com ([45.249.212.35] helo=huawei.com)
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1j55Fh-000YRB-LD
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 21 Feb 2020 10:09:49 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.58])
 by Forcepoint Email with ESMTP id 85D1C5816F81FCDBA610;
 Fri, 21 Feb 2020 18:09:34 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.439.0; Fri, 21 Feb 2020 18:09:25 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Fri, 21 Feb 2020 18:09:21 +0800
Message-ID: <20200221100922.16781-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.18.0.rc1
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1j55Fh-000YRB-LD
Subject: [f2fs-dev] [RFC PATCH 1/2] f2fs: introduce
 F2FS_IOC_GET_COMPRESS_BLOCKS
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

With this newly introduced interface, user can get block
number compression saved in target inode.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 fs/f2fs/f2fs.h |  1 +
 fs/f2fs/file.c | 18 ++++++++++++++++++
 2 files changed, 19 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 5d047c0bbbbb..15199df5d40a 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -426,6 +426,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_IOC_GET_PIN_FILE		_IOR(F2FS_IOCTL_MAGIC, 14, __u32)
 #define F2FS_IOC_PRECACHE_EXTENTS	_IO(F2FS_IOCTL_MAGIC, 15)
 #define F2FS_IOC_RESIZE_FS		_IOW(F2FS_IOCTL_MAGIC, 16, __u64)
+#define F2FS_IOC_GET_COMPRESS_BLOCKS	_IOR(F2FS_IOCTL_MAGIC, 17, __u64)
 
 #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
 #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index efca4ed17b7d..235708c892af 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3401,6 +3401,21 @@ static int f2fs_set_volume_name(struct file *filp, unsigned long arg)
 	return err;
 }
 
+static int f2fs_get_compress_blocks(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	__u64 blocks;
+
+	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+		return -EOPNOTSUPP;
+
+	if (!f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	blocks = F2FS_I(inode)->i_compr_blocks;
+	return put_user(blocks, (u64 __user *)arg);
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3479,6 +3494,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_get_volume_name(filp, arg);
 	case F2FS_IOC_SET_VOLUME_NAME:
 		return f2fs_set_volume_name(filp, arg);
+	case F2FS_IOC_GET_COMPRESS_BLOCKS:
+		return f2fs_get_compress_blocks(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -3636,6 +3653,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC_MEASURE_VERITY:
 	case F2FS_IOC_GET_VOLUME_NAME:
 	case F2FS_IOC_SET_VOLUME_NAME:
+	case F2FS_IOC_GET_COMPRESS_BLOCKS:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.18.0.rc1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
