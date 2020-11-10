Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B3FD2ACA6D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 02:26:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcIQJ-0003hY-Lq; Tue, 10 Nov 2020 01:26:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1kcIQG-0003h3-Ea
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 01:26:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qr/QSMCPvboUjVEUrIZp2agUcoZzH+bE5m9MPtmrGQU=; b=S75jqMOaSS8xGaSl/fB3HXA60s
 HEFPNIsIJgffnUPLROabx5gJbv+uiWOJe/9SNb4BuVKmETOLvECHjSI604uFYyqdt4fqqVYQUzzG9
 kj0ZT6us2qe+YDR6aZDcpCbhJYodcOYD1uTpBW54UmyD1DLByIzFWAiLzWQJ4k+re5IQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qr/QSMCPvboUjVEUrIZp2agUcoZzH+bE5m9MPtmrGQU=; b=fNwQlGSW8zH2vGyc7WWBcs+7+7
 p9ntBkfI3bfWYnxqxVVfTd6mozuLYbnkvQ8z3vgHAaK729lDC9vX9V13DlZAKTl3sUrwKlP6RNYy+
 aH+oTPlqaFKi/sus5yV6rFNx34pLguYtnTxhP2+IEgNYKN6lMGekfvOjnP0MSoBbbeQE=;
Received: from szxga07-in.huawei.com ([45.249.212.35])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kcIQ4-006E6h-5N
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 01:26:12 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4CVVYL1Mryz71B8;
 Tue, 10 Nov 2020 09:25:42 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS411-HUB.china.huawei.com (10.3.19.211) with Microsoft SMTP Server id
 14.3.487.0; Tue, 10 Nov 2020 09:25:39 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 10 Nov 2020 09:24:37 +0800
Message-ID: <20201110012437.26482-2-yuchao0@huawei.com>
X-Mailer: git-send-email 2.26.2
In-Reply-To: <20201110012437.26482-1-yuchao0@huawei.com>
References: <20201110012437.26482-1-yuchao0@huawei.com>
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
 [45.249.212.35 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kcIQ4-006E6h-5N
Subject: [f2fs-dev] [PATCH v5 2/2] f2fs: fix compat F2FS_IOC_{MOVE,
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
Cc: linux-kernel@vger.kernel.org, Eric Biggers <ebiggers@google.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Eric reported a ioctl bug in below link:

https://lore.kernel.org/linux-f2fs-devel/20201103032234.GB2875@sol.localdomain/

That said, on some 32-bit architectures, u64 has only 32-bit alignment,
notably i386 and x86_32, so that size of struct f2fs_gc_range compiled
in x86_32 is 20 bytes, however the size in x86_64 is 24 bytes, binary
compiled in x86_32 can not call F2FS_IOC_GARBAGE_COLLECT_RANGE successfully
due to mismatched value of ioctl command in between binary and f2fs
module, similarly, F2FS_IOC_MOVE_RANGE will fail too.

In this patch we introduce two ioctls for compatibility of above special
32-bit binary:
- F2FS_IOC32_GARBAGE_COLLECT_RANGE
- F2FS_IOC32_MOVE_RANGE

Reported-by: Eric Biggers <ebiggers@google.com>
Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
v5:
- avoid redundant cp-related check for clean up.
 fs/f2fs/file.c | 137 +++++++++++++++++++++++++++++++++++++------------
 1 file changed, 104 insertions(+), 33 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 22ae8ae0072f..be8db06aca27 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2480,26 +2480,19 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
+static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 {
-	struct inode *inode = file_inode(filp);
-	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	struct f2fs_gc_range range;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(file_inode(filp));
 	u64 end;
 	int ret;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
-
-	if (copy_from_user(&range, (struct f2fs_gc_range __user *)arg,
-							sizeof(range)))
-		return -EFAULT;
-
 	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
-	end = range.start + range.len;
-	if (end < range.start || range.start < MAIN_BLKADDR(sbi) ||
+	end = range->start + range->len;
+	if (end < range->start || range->start < MAIN_BLKADDR(sbi) ||
 					end >= MAX_BLKADDR(sbi))
 		return -EINVAL;
 
@@ -2508,7 +2501,7 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 		return ret;
 
 do_more:
-	if (!range.sync) {
+	if (!range->sync) {
 		if (!down_write_trylock(&sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
@@ -2517,20 +2510,30 @@ static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
 		down_write(&sbi->gc_lock);
 	}
 
-	ret = f2fs_gc(sbi, range.sync, true, GET_SEGNO(sbi, range.start));
+	ret = f2fs_gc(sbi, range->sync, true, GET_SEGNO(sbi, range->start));
 	if (ret) {
 		if (ret == -EBUSY)
 			ret = -EAGAIN;
 		goto out;
 	}
-	range.start += BLKS_PER_SEC(sbi);
-	if (range.start <= end)
+	range->start += BLKS_PER_SEC(sbi);
+	if (range->start <= end)
 		goto do_more;
 out:
 	mnt_drop_write_file(filp);
 	return ret;
 }
 
+static int f2fs_ioc_gc_range(struct file *filp, unsigned long arg)
+{
+	struct f2fs_gc_range range;
+
+	if (copy_from_user(&range, (struct f2fs_gc_range __user *)arg,
+							sizeof(range)))
+		return -EFAULT;
+	return __f2fs_ioc_gc_range(filp, &range);
+}
+
 static int f2fs_ioc_write_checkpoint(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -2867,9 +2870,9 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	return ret;
 }
 
-static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
+static int __f2fs_ioc_move_range(struct file *filp,
+				struct f2fs_move_range *range)
 {
-	struct f2fs_move_range range;
 	struct fd dst;
 	int err;
 
@@ -2877,11 +2880,7 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 			!(filp->f_mode & FMODE_WRITE))
 		return -EBADF;
 
-	if (copy_from_user(&range, (struct f2fs_move_range __user *)arg,
-							sizeof(range)))
-		return -EFAULT;
-
-	dst = fdget(range.dst_fd);
+	dst = fdget(range->dst_fd);
 	if (!dst.file)
 		return -EBADF;
 
@@ -2894,8 +2893,8 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 	if (err)
 		goto err_out;
 
-	err = f2fs_move_file_range(filp, range.pos_in, dst.file,
-					range.pos_out, range.len);
+	err = f2fs_move_file_range(filp, range->pos_in, dst.file,
+					range->pos_out, range->len);
 
 	mnt_drop_write_file(filp);
 err_out:
@@ -2903,6 +2902,16 @@ static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
 	return err;
 }
 
+static int f2fs_ioc_move_range(struct file *filp, unsigned long arg)
+{
+	struct f2fs_move_range range;
+
+	if (copy_from_user(&range, (struct f2fs_move_range __user *)arg,
+							sizeof(range)))
+		return -EFAULT;
+	return __f2fs_ioc_move_range(filp, &range);
+}
+
 static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -4017,13 +4026,8 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
-	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
-		return -EIO;
-	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(filp))))
-		return -ENOSPC;
-
 	switch (cmd) {
 	case FS_IOC_GETFLAGS:
 		return f2fs_ioc_getflags(filp, arg);
@@ -4114,6 +4118,16 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	}
 }
 
+long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
+{
+	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
+		return -EIO;
+	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(filp))))
+		return -ENOSPC;
+
+	return __f2fs_ioctl(filp, cmd, arg);
+}
+
 static ssize_t f2fs_file_read_iter(struct kiocb *iocb, struct iov_iter *iter)
 {
 	struct file *file = iocb->ki_filp;
@@ -4230,8 +4244,63 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 }
 
 #ifdef CONFIG_COMPAT
+struct compat_f2fs_gc_range {
+	u32 sync;
+	compat_u64 start;
+	compat_u64 len;
+};
+#define F2FS_IOC32_GARBAGE_COLLECT_RANGE	_IOW(F2FS_IOCTL_MAGIC, 11,\
+						struct compat_f2fs_gc_range)
+
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
+
+	return __f2fs_ioc_gc_range(file, &range);
+}
+
+struct compat_f2fs_move_range {
+	u32 dst_fd;
+	compat_u64 pos_in;
+	compat_u64 pos_out;
+	compat_u64 len;
+};
+#define F2FS_IOC32_MOVE_RANGE		_IOWR(F2FS_IOCTL_MAGIC, 9,	\
+					struct compat_f2fs_move_range)
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
+
+	return __f2fs_ioc_move_range(file, &range);
+}
+
 long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 {
+	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(file)))))
+		return -EIO;
+	if (!f2fs_is_checkpoint_ready(F2FS_I_SB(file_inode(file))))
+		return -ENOSPC;
+
 	switch (cmd) {
 	case FS_IOC32_GETFLAGS:
 		cmd = FS_IOC_GETFLAGS;
@@ -4242,6 +4311,10 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
@@ -4259,10 +4332,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
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
@@ -4285,7 +4356,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	default:
 		return -ENOIOCTLCMD;
 	}
-	return f2fs_ioctl(file, cmd, (unsigned long) compat_ptr(arg));
+	return __f2fs_ioctl(file, cmd, (unsigned long) compat_ptr(arg));
 }
 #endif
 
-- 
2.26.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
