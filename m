Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B31282DC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2019 18:20:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hTqSb-0000cU-9N; Thu, 23 May 2019 16:20:53 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <ebiggers@kernel.org>) id 1hTqSZ-0000bZ-2s
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PoyU5cYRjPWmNIZTn/N+eDbgEwJB4v+GkURTX4g91oY=; b=B9t2MAH4DCR06MXAIHMc26Ub+9
 NrAttBgOCW4R0/ESNGLWaSZZ5ugPszrHouG8qD4poTu9lOGdqPcXFscljieE6zMI37LQUNh6mErqN
 13tDFdu2wqLDOHLVZXzo/YMmtz/0gATAegMQ1Eubck7kikGBW5QEQLGNCYogziFpF8xg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PoyU5cYRjPWmNIZTn/N+eDbgEwJB4v+GkURTX4g91oY=; b=TUneFJ3fq/ehyk2VUIm9GuadZZ
 KbEPehqcgdDzJxL2+Y63VLhRy0+ppkt391dOBoULoFmTG9FIL75qRP0MZuNnP8AtRIKiJD/taSgfN
 odfHYyD9rzgBP1w2gQCn5fTRb2LqGsYUaiP3fCezJgs+ftjXbEb3zdTqkG16w+arqV+k=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hTqSX-009b47-Mb
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 23 May 2019 16:20:50 +0000
Received: from sol.localdomain (c-24-5-143-220.hsd1.ca.comcast.net
 [24.5.143.220])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 9E5A421855;
 Thu, 23 May 2019 16:20:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1558628438;
 bh=IypddWdgpGQW98s/1LmMIKN+E0awwoanRr5vpkgTF8c=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=MAMyc0xNHquD9YW6+5HzRcneZT9WqRTjjzjI/g+EHazOH1ftZvl6WWXnNGuV6TMgf
 G7uqtVpqRLIDLms9VIw+gzOAJ1/8v7DHS4tbXBOtnCzAkCVcq6ca9rYJe4ipVvXCBD
 /vKRsIibnwrgWLcqcBwMZuWWqXRiBHwUh6kMdku8=
From: Eric Biggers <ebiggers@kernel.org>
To: linux-fscrypt@vger.kernel.org
Date: Thu, 23 May 2019 09:18:06 -0700
Message-Id: <20190523161811.6259-11-ebiggers@kernel.org>
X-Mailer: git-send-email 2.21.0
In-Reply-To: <20190523161811.6259-1-ebiggers@kernel.org>
References: <20190523161811.6259-1-ebiggers@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 0.0 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hTqSX-009b47-Mb
Subject: [f2fs-dev] [PATCH v3 10/15] fs-verity: implement
 FS_IOC_MEASURE_VERITY ioctl
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
Cc: "Theodore Y . Ts'o" <tytso@mit.edu>, linux-api@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-integrity@vger.kernel.org,
 linux-ext4@vger.kernel.org, Victor Hsieh <victorhsieh@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Eric Biggers <ebiggers@google.com>

Add a function for filesystems to call to implement the
FS_IOC_MEASURE_VERITY ioctl.  This ioctl retrieves the file measurement
that fs-verity calculated for the given file and is enforcing for reads;
i.e., reads that don't match this hash will fail.  This ioctl can be
used for authentication or logging of file measurements in userspace.

See the "FS_IOC_MEASURE_VERITY" section of
Documentation/filesystems/fsverity.rst for the documentation.

Signed-off-by: Eric Biggers <ebiggers@google.com>
---
 fs/verity/Makefile       |  1 +
 fs/verity/measure.c      | 57 ++++++++++++++++++++++++++++++++++++++++
 include/linux/fsverity.h | 11 ++++++++
 3 files changed, 69 insertions(+)
 create mode 100644 fs/verity/measure.c

diff --git a/fs/verity/Makefile b/fs/verity/Makefile
index 04b37475fd280..6f7675ae0a311 100644
--- a/fs/verity/Makefile
+++ b/fs/verity/Makefile
@@ -3,5 +3,6 @@
 obj-$(CONFIG_FS_VERITY) += enable.o \
 			   hash_algs.o \
 			   init.o \
+			   measure.o \
 			   open.o \
 			   verify.o
diff --git a/fs/verity/measure.c b/fs/verity/measure.c
new file mode 100644
index 0000000000000..f29557c0ee3da
--- /dev/null
+++ b/fs/verity/measure.c
@@ -0,0 +1,57 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * fs/verity/measure.c: ioctl to get a verity file's measurement
+ *
+ * Copyright 2019 Google LLC
+ */
+
+#include "fsverity_private.h"
+
+#include <linux/uaccess.h>
+
+/**
+ * fsverity_ioctl_measure() - get a verity file's measurement
+ *
+ * Retrieve the file measurement that the kernel is enforcing for reads from a
+ * verity file.  See the "FS_IOC_MEASURE_VERITY" section of
+ * Documentation/filesystems/fsverity.rst for the documentation.
+ *
+ * Return: 0 on success, -errno on failure
+ */
+int fsverity_ioctl_measure(struct file *filp, void __user *_uarg)
+{
+	const struct inode *inode = file_inode(filp);
+	struct fsverity_digest __user *uarg = _uarg;
+	const struct fsverity_info *vi;
+	const struct fsverity_hash_alg *hash_alg;
+	struct fsverity_digest arg;
+
+	vi = get_verity_info(inode);
+	if (!vi)
+		return -ENODATA; /* not a verity file */
+	hash_alg = vi->tree_params.hash_alg;
+
+	/*
+	 * The user specifies the digest_size their buffer has space for; we can
+	 * return the digest if it fits in the available space.  We write back
+	 * the actual size, which may be shorter than the user-specified size.
+	 */
+
+	if (get_user(arg.digest_size, &uarg->digest_size))
+		return -EFAULT;
+	if (arg.digest_size < hash_alg->digest_size)
+		return -EOVERFLOW;
+
+	memset(&arg, 0, sizeof(arg));
+	arg.digest_algorithm = hash_alg - fsverity_hash_algs;
+	arg.digest_size = hash_alg->digest_size;
+
+	if (copy_to_user(uarg, &arg, sizeof(arg)))
+		return -EFAULT;
+
+	if (copy_to_user(uarg->digest, vi->measurement, hash_alg->digest_size))
+		return -EFAULT;
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(fsverity_ioctl_measure);
diff --git a/include/linux/fsverity.h b/include/linux/fsverity.h
index 9a84fe4bcfc88..df0b620c6897f 100644
--- a/include/linux/fsverity.h
+++ b/include/linux/fsverity.h
@@ -110,6 +110,10 @@ struct fsverity_operations {
 
 extern int fsverity_ioctl_enable(struct file *filp, const void __user *arg);
 
+/* measure.c */
+
+extern int fsverity_ioctl_measure(struct file *filp, void __user *arg);
+
 /* open.c */
 
 extern int fsverity_file_open(struct inode *inode, struct file *filp);
@@ -132,6 +136,13 @@ static inline int fsverity_ioctl_enable(struct file *filp,
 	return -EOPNOTSUPP;
 }
 
+/* measure.c */
+
+static inline int fsverity_ioctl_measure(struct file *filp, void __user *arg)
+{
+	return -EOPNOTSUPP;
+}
+
 /* open.c */
 
 static inline int fsverity_file_open(struct inode *inode, struct file *filp)
-- 
2.21.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
