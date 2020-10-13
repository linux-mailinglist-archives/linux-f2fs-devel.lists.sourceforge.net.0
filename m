Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8D8A28C71D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 04:25:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kS9zw-0001Tj-Lr; Tue, 13 Oct 2020 02:25:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kS9zv-0001TZ-BH
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 02:25:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eEV/cWEF/JYPft5qQa3SDqcnDv+itkYtghzo7XBgFNs=; b=VVm4uucXwRG36NxMAzParyJ4hG
 OZ9NG6MNJKBbq6KDHTg/n701aNP7qQggJHGPFNMHvAO3K4HyOgPFBFBhejEUHuGWtkyo4DdydwPxQ
 xmurJRFfjWlCalC2IR3T0OdFzK6H3I0+Za1VZ1F/Ijmy0VPCXoysxGvQR8IBaThB+Wf0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=eEV/cWEF/JYPft5qQa3SDqcnDv+itkYtghzo7XBgFNs=; b=ezcE5faWmXlCWe3teumtTT7mFA
 QBBc6AZyZJOOowjqnW3F1CwOgsPTdq/+gUeb0MideyL31pDjrTZje9t1w5usbfxKtzCcI2GY+1pne
 sQ9YzNDekc3s8fpusNdvP2Wdel0IhMaYumtzJjoCWDZgneCGx8It0cyI6a7xakepKEVQ=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kS9zm-0089fV-4x
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 02:25:07 +0000
Received: by mail-pg1-f194.google.com with SMTP id q21so5175238pgi.13
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Oct 2020 19:24:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=eEV/cWEF/JYPft5qQa3SDqcnDv+itkYtghzo7XBgFNs=;
 b=GWOTVtAdo8DKLCg2sfVY/T+Lny64tP5ZynNSLR/cL67sSFaJyP6GD/dKjlhcsAyceo
 d3hNAVF5U5SwXvV5b4XPZG4+8CZRqeP4RUjKqRW1Y7Dk+Mq3BgVTfRi/FrP7w/A+pAHV
 0oW60V5PPlUMK8I6VxYREn5YzJHO9LTug1tiwOfNO6/YiNTFJAe8QbrGbUF1VhXLBA1v
 LTd56ImOOqEBn+OdQsG9FVG93lh9DJPSeReGva2hrAPQlqnq9dFKqcnKHe3DzCCb0Urw
 VmV/MnJM9QgEgrqjJ0ZhNGeNaHQcTQWrIxgUBfbEaq9iPp7K7a+YW455cueLbEaxufv6
 fF2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=eEV/cWEF/JYPft5qQa3SDqcnDv+itkYtghzo7XBgFNs=;
 b=kl6SKkIFkBjN4hDG7is8J4agWrzKPyE2tawXwQ9N2FgZlzG6OocHVkevEjhgC0yLc8
 /YT2Nw3tULzGzaE8P50C+yD+RhT1dPyTNRn0HbHvOAm/3ahSJ+mtzkNNuQ4P9ea2AeyD
 bvAlBi6vRrpdL0vH8t79eqPTu9/UmVTo2TOU3MfkJmD9BwyqDi2N6Mf1GhRaT0F37rFu
 2ln8eicQBpoe6CSF8GfbPEjGbGljvXXYTJGvdbPjQiMHvB7UgxXuV3fP0gFrZZFeVGMq
 Uz0UNM1pDjrDHoBcAwnbewbMuZs0tyUim7n1awpQcTiA2Ka4Wex48l6OtbORNf8uUGlF
 eUwQ==
X-Gm-Message-State: AOAM533Kj/Mna17gVEV+DWEtq/AA3Vhn9RfpolS5PBcKd17uzJrLnAFy
 C9H2Jt7kUAJkhlpSF7K4fcU=
X-Google-Smtp-Source: ABdhPJyZCW3khH+xOjDpor/Y+i/yJb2TjIDKDk0jJX4xd86Ae/x4Beb8doS1Lj5v6QMZNu/PcQ34lw==
X-Received: by 2002:a05:6a00:8c5:b029:142:2501:39e6 with SMTP id
 s5-20020a056a0008c5b0290142250139e6mr26902826pfu.53.1602555885313; 
 Mon, 12 Oct 2020 19:24:45 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id d194sm10581110pfd.172.2020.10.12.19.24.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 19:24:44 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 13 Oct 2020 11:24:29 +0900
Message-Id: <20201013022429.454161-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
In-Reply-To: <20201013022429.454161-1-daeho43@gmail.com>
References: <20201013022429.454161-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kS9zm-0089fV-4x
Subject: [f2fs-dev] [PATCH 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION ioctl
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
Cc: Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Added a new F2FS_IOC_SET_COMPRESS_OPTION ioctl to change file
compression option of a file.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h |  2 ++
 fs/f2fs/file.c | 56 ++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a33c90cf979b..5ee8a4859b62 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -435,6 +435,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 						struct f2fs_sectrim_range)
 #define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
 						struct f2fs_comp_option)
+#define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
+						struct f2fs_comp_option)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7e64259f6f5e..6c265c66ddd4 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3963,6 +3963,59 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 	return 0;
 }
 
+static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_comp_option option;
+	int ret;
+	int writecount;
+
+	if (!f2fs_sb_has_compression(sbi))
+		return -EOPNOTSUPP;
+
+	if (!f2fs_compressed_file(inode) || IS_IMMUTABLE(inode))
+		return -EINVAL;
+
+	if (f2fs_readonly(sbi->sb))
+		return -EROFS;
+
+	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
+				sizeof(option)))
+		return -EFAULT;
+
+	if (option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
+			option.algorithm >= COMPRESS_MAX)
+		return -EINVAL;
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	inode_lock(inode);
+
+	writecount = atomic_read(&inode->i_writecount);
+	if ((filp->f_mode & FMODE_WRITE && writecount != 1) ||
+			(!(filp->f_mode & FMODE_WRITE) && writecount)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (get_dirty_pages(inode) || inode->i_size) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
+	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
+	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
+	f2fs_mark_inode_dirty_sync(inode, true);
+out:
+	inode_unlock(inode);
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -4053,6 +4106,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_sec_trim_file(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 		return f2fs_ioc_get_compress_option(filp, arg);
+	case F2FS_IOC_SET_COMPRESS_OPTION:
+		return f2fs_ioc_set_compress_option(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4224,6 +4279,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
+	case F2FS_IOC_SET_COMPRESS_OPTION:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.28.0.1011.ga647a8990f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
