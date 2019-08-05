Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8C23821F2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  5 Aug 2019 18:28:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hufqu-0004gF-HH; Mon, 05 Aug 2019 16:28:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hufqu-0004fs-7k
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7j6MckD8EhQBBSHx4YKIAyI1I0dYt6rrBrDl/5GTp+c=; b=g67RY7GX1qdTAioKcTJio7MySS
 VnEwoA6mmAuia8vtx7BRr19obCjnu9NHZMORl0XaNlq+n73tjKi0SZBPZu9y+F4lARUzDj9SCVFjP
 pZDEh8kaD7WqlCPsk23rZzyf4altOf0Oh2hrzT4kJJ2STk3+7wAcw3EsVHO36sfI1bvA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7j6MckD8EhQBBSHx4YKIAyI1I0dYt6rrBrDl/5GTp+c=; b=lGOY6oKJqVQXLnMfU/O1MI8Qov
 ci096Yc1ellGrue96dFUBNEzZDqKfIhv1wDU1cC55BCizvip8grTGrPQq3CL3+5y55/KWeCdDYYQ4
 +qMia3xQJuuxVNYifcbT9TAQ18ipfPRtxm+Umtx0vziBVg6lYytMPaBFO6mVYp0sSKFw=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hufqt-00BLzR-1s
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 05 Aug 2019 16:28:52 +0000
Received: from ebiggers-linuxstation.mtv.corp.google.com (unknown
 [104.132.1.77])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 18D1021880;
 Mon,  5 Aug 2019 16:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1565022519;
 bh=xKchlZBFSiXdWf9O42HALH837ZeFXH4QUnQ022O/qXE=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Vee5HW50wwi6C3beCaXmzx4s/nSY6BjK5nLyVT7O6ZJGTT4MDc1oFiuZZYv3EuhTg
 ukmVzCaEI/F67QcE/cD8qiEYDnvGNyeIlKxKFcDe+U5jFRHqRO8re2g3uy9L7GEuto
 f72YBqyW3aRYUeIK6NL6VugSrQ45EmfFw12hQNhk=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Mon,  5 Aug 2019 09:25:19 -0700
Message-Id: <20190805162521.90882-19-ebiggers@kernel.org>
X-Mailer: git-send-email 2.22.0.770.g0f2c4a37fd-goog
In-Reply-To: <20190805162521.90882-1-ebiggers@kernel.org>
References: <20190805162521.90882-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: 0.5 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 0.6 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hufqt-00BLzR-1s
Subject: [f2fs-dev] [PATCH v8 18/20] f2fs: wire up new fscrypt ioctls
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
Cc: Satya Tangirala <satyat@google.com>, Theodore Ts'o <tytso@mit.edu>,
 linux-api@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 keyrings@vger.kernel.org, linux-mtd@lists.infradead.org,
 linux-crypto@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-ext4@vger.kernel.org,
 Paul Crowley <paulcrowley@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Wire up the new ioctls for adding and removing fscrypt keys to/from the
filesystem, and the new ioctl for retrieving v2 encryption policies.

The key removal ioctls also required making f2fs_drop_inode() call
fscrypt_drop_inode().

For more details see Documentation/filesystems/fscrypt.rst and the
fscrypt patches that added the implementation of these ioctls.

Acked-by: Jaegeuk Kim <jaegeuk@kernel.org>
Reviewed-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/f2fs/file.c  | 58 +++++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/super.c |  2 ++
 2 files changed, 60 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 3e58a6f697dd8c..6a7349f9ac15ec 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2184,6 +2184,49 @@ static int f2fs_ioc_get_encryption_pwsalt(struct file *filp, unsigned long arg)
 	return err;
 }
 
+static int f2fs_ioc_get_encryption_policy_ex(struct file *filp,
+					     unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_get_policy_ex(filp, (void __user *)arg);
+}
+
+static int f2fs_ioc_add_encryption_key(struct file *filp, unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_add_key(filp, (void __user *)arg);
+}
+
+static int f2fs_ioc_remove_encryption_key(struct file *filp, unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_remove_key(filp, (void __user *)arg);
+}
+
+static int f2fs_ioc_remove_encryption_key_all_users(struct file *filp,
+						    unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_remove_key_all_users(filp, (void __user *)arg);
+}
+
+static int f2fs_ioc_get_encryption_key_status(struct file *filp,
+					      unsigned long arg)
+{
+	if (!f2fs_sb_has_encrypt(F2FS_I_SB(file_inode(filp))))
+		return -EOPNOTSUPP;
+
+	return fscrypt_ioctl_get_key_status(filp, (void __user *)arg);
+}
+
 static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
@@ -3092,6 +3135,16 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_get_encryption_policy(filp, arg);
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 		return f2fs_ioc_get_encryption_pwsalt(filp, arg);
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+		return f2fs_ioc_get_encryption_policy_ex(filp, arg);
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+		return f2fs_ioc_add_encryption_key(filp, arg);
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+		return f2fs_ioc_remove_encryption_key(filp, arg);
+	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
+		return f2fs_ioc_remove_encryption_key_all_users(filp, arg);
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
+		return f2fs_ioc_get_encryption_key_status(filp, arg);
 	case F2FS_IOC_GARBAGE_COLLECT:
 		return f2fs_ioc_gc(filp, arg);
 	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
@@ -3219,6 +3272,11 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SET_ENCRYPTION_POLICY:
 	case F2FS_IOC_GET_ENCRYPTION_PWSALT:
 	case F2FS_IOC_GET_ENCRYPTION_POLICY:
+	case FS_IOC_GET_ENCRYPTION_POLICY_EX:
+	case FS_IOC_ADD_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY:
+	case FS_IOC_REMOVE_ENCRYPTION_KEY_ALL_USERS:
+	case FS_IOC_GET_ENCRYPTION_KEY_STATUS:
 	case F2FS_IOC_GARBAGE_COLLECT:
 	case F2FS_IOC_GARBAGE_COLLECT_RANGE:
 	case F2FS_IOC_WRITE_CHECKPOINT:
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78a1b873e48ade..e15bd29bd45340 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -913,6 +913,8 @@ static int f2fs_drop_inode(struct inode *inode)
 		return 0;
 	}
 	ret = generic_drop_inode(inode);
+	if (!ret)
+		ret = fscrypt_drop_inode(inode);
 	trace_f2fs_drop_inode(inode, ret);
 	return ret;
 }
-- 
2.22.0.770.g0f2c4a37fd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
