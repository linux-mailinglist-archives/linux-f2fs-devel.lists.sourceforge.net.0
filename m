Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE5CB2A5CAA
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  4 Nov 2020 03:20:05 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ka8P1-000795-2B; Wed, 04 Nov 2020 02:19:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1ka8Oz-00078r-T9
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 02:19:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YorWO18ZCK5TYD/OyiCiqHDqmvU27P72EEKydVYxfCk=; b=CChyBicCjL0AluPjOAKLFIxQCp
 udLcS5KSIlZ47AMuAAHQA2texQNy5tn5nySlPHRx+TdltyviPYxKLJ+6EYu+U9RjhjC2AZR8UCFg/
 i1r4a3oyix/TL+nSFvfBb76pq5TysVQ6CENj4aXc9DUKzOBdKqtHmBMSG8VtM06ZNSAI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YorWO18ZCK5TYD/OyiCiqHDqmvU27P72EEKydVYxfCk=; b=X
 6yXvufzXK1eiQ5srMkszYehYLz4QjivtwvM+uJ81NkFD7PGkLOIZ+qpX0Fu9ZE/LmB2ac2xEt1mjo
 FsjWMyfhvbi59dVd15Eltvz0VP0QO8KpYOOU9Vk9NUl6FAnCazMSh4d3ifFyh7KrPmt5ifBHGUCAm
 trXWDltdlef8krEE=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1ka8Oo-000hcp-Fo
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 04 Nov 2020 02:19:57 +0000
Received: from DGGEMS403-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CQr275BY5z15R4y;
 Wed,  4 Nov 2020 10:19:27 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS403-HUB.china.huawei.com (10.3.19.203) with Microsoft SMTP Server id
 14.3.487.0; Wed, 4 Nov 2020 10:19:19 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Wed, 4 Nov 2020 10:19:06 +0800
Message-ID: <20201104021906.108534-1-yuchao0@huawei.com>
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
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ka8Oo-000hcp-Fo
Subject: [f2fs-dev] [PATCH RFC] f2fs: fix compat F2FS_IOC_{MOVE,
 GARBAGE_COLLECT}_RANGE
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

Eric reported a ioctl bug in below link:

https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/

That said, on some 32-bit architectures, u64 has only 32-bit alignment,
notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
due to mismatched value of ioctl command in betweeen binary and f2fs
module, similarly, F2FS_IOC_MOVE_RANGE will fail too.

In this patch we introduce two ioctls for compatibility of above special
32-bit binary:
- F2FS_IOC32_GARBAGE_COLLECT_RANGE
- F2FS_IOC32_MOVE_RANGE

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---

Jaegeuk, Eric,

I have no 32-bit machine now, so I don't run any test on this patch,
please take a look at this RFC patch first.

 fs/f2fs/file.c            | 45 +++++++++++++++++++++++++++++++++++++--
 include/uapi/linux/f2fs.h | 25 ++++++++++++++++++++++
 2 files changed, 68 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 52417a2e3f4f..2e0a5469745a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4236,6 +4236,45 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 }
 
 #ifdef CONFIG_COMPAT
+static int f2fs_compat_ioc_gc_range(struct file *file, unsigned long arg)
+{
+	struct compat_f2fs_gc_range __user *urange;
+	struct f2fs_gc_range range;
+	int err;
+
+	urange = compat_ptr(arg);
+	err = get_user(range.sync, &urange->sync);
+	err |= get_user(range.start, &urange->start);
+	err |= get_user(range.len, &urange->len);
+	if (err)
+		return -EFAULT;
+	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(file)))))
+		return -EIO;
+	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(file))))
+		return -ENOSPC;
+	return f2fs_ioc_gc_range(file, (unsigned long)&range);
+}
+
+static int f2fs_compat_ioc_move_range(struct file *file, unsigned long arg)
+{
+	struct compat_f2fs_move_range __user *urange;
+	struct f2fs_move_range range;
+	int err;
+
+	urange = compat_ptr(arg);
+	err = get_user(range.dst_fd, &urange->dst_fd);
+	err |= get_user(range.pos_in, &urange->pos_in);
+	err |= get_user(range.pos_out, &urange->pos_out);
+	err |= get_user(range.len, &urange->len);
+	if (err)
+		return -EFAULT;
+	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(file)))))
+		return -EIO;
+	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(file))))
+		return -ENOSPC;
+	return f2fs_ioc_move_range(file, (unsigned long)&range);
+}
+
 long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -4248,6 +4287,10 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC32_GETVERSION:
 		cmd = FS_IOC_GETVERSION;
 		break;
+	case F2FS_IOC32_GARBAGE_COLLECT_RANGE:
+		return f2fs_compat_ioc_gc_range(file, arg);
+	case F2FS_IOC32_MOVE_RANGE:
+		return f2fs_compat_ioc_move_range(file, arg);
 	case F2FS_IOC_START_ATOMIC_WRITE:
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
 	case F2FS_IOC_START_VOLATILE_WRITE:
@@ -4265,10 +4308,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 	case FS_IOC_GET_ENCRYPTION_NONCE:
 	case F2FS_IOC_GARBAGE_COLLECT:
-	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
 	case F2FS_IOC_WRITE_CHECKPOINT:
 	case F2FS_IOC_DEFRAGMENT:
-	case F2FS_IOC_MOVE_RANGE:
 	case F2FS_IOC_FLUSH_DEVICE:
 	case F2FS_IOC_GET_FEATURES:
 	case FS_IOC_FSGETXATTR:
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index f00199a2e38b..8c14e88a9645 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -5,6 +5,10 @@
 #include <linux/types.h>
 #include <linux/ioctl.h>
 
+#ifdef __KERNEL__
+#include <linux/compat.h>
+#endif
+
 /*
  * f2fs-specific ioctl commands
  */
@@ -65,6 +69,16 @@ struct f2fs_gc_range {
 	__u64 len;
 };
 
+#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
+struct compat_f2fs_gc_range {
+	u32 sync;
+	compat_u64 start;
+	compat_u64 len;
+};
+#define F2FS_IOC32_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,\
+						struct compat_f2fs_gc_range)
+#endif
+
 struct f2fs_defragment {
 	__u64 start;
 	__u64 len;
@@ -77,6 +91,17 @@ struct f2fs_move_range {
 	__u64 len;		/* size to move */
 };
 
+#if defined(__KERNEL__) && defined(CONFIG_COMPAT)
+struct compat_f2fs_move_range {
+	u32 dst_fd;
+	compat_u64 pos_in;
+	compat_u64 pos_out;
+	compat_u64 len;
+};
+#define F2FS_IOC32_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
+					struct compat_f2fs_move_range)
+#endif
+
 struct f2fs_flush_device {
 	__u32 dev_num;		/* device number to flush */
 	__u32 segments;		/* # of segments to flush */
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
