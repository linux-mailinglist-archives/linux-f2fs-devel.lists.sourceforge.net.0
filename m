Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 055E129A434
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 06:38:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXHh6-0007ya-Jy; Tue, 27 Oct 2020 05:38:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kXHh3-0007yJ-1s
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 05:38:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Y88FdVXAgfg5w8PyflknRqNxB6/N6fKsnjWxZd+03NM=; b=GE/oUodjH2tdS06HQvuTCIEbAN
 B0UJOFOt33hKn94k1TKbEnyBYEuCzaO2+kfHPs3+BCe1FMz+bN/uMGPuYIK5s7Nl6+CYgYhJX8Nda
 mfyh5bHC92ryy1BZj7BOax2OxMNaQ/gHM6AJrhiI73jWqn4dMS/HACCCq3sdON1xKWqc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Y88FdVXAgfg5w8PyflknRqNxB6/N6fKsnjWxZd+03NM=; b=L
 U6V7Gi3ZTfhR2qPQ+PMt0XtFScdhqBIHy/fNSsrS6Y6g2yCvb5Wi3U68WE4FOkfyLcF+HbYvyiB0T
 5pIqK/rM4nEvMnrX3zClCXcnyro1Ksu74RgBulvL1LzlVr8G1WbGxvyd+tpeq06mPE9LIu2JhOHmi
 UP0khmw/JiBql4sE=;
Received: from mail-pl1-f195.google.com ([209.85.214.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kXHgr-008OuG-Fg
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 05:38:49 +0000
Received: by mail-pl1-f195.google.com with SMTP id h2so160773pll.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Oct 2020 22:38:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y88FdVXAgfg5w8PyflknRqNxB6/N6fKsnjWxZd+03NM=;
 b=Ueh7Hse2bmKx46Y6BDGHFuX3F9o4sLgKwhpQ+5wTCBm7sBnNy0MBuNHCo7tIAjrwmC
 f3zFPYMUohNPlD71bm8dQ8sKaSIFHZrXyU6CyyktrId62npDXV/8a9igN+R1sOcinvIS
 F5Y3i2psZFaVJiMbtpCJlPCRkroZdRBjYIo0YTLB5v3qq/8wOncpfd9U2JF5jorYYlMb
 X2zWp2jFTdAzYyuKi5DlSKYUfjm9+S//e1rsrBtFjcAeFgrKQOv6zHgvUTSYk2lRHzRD
 h/ybJKwmLyjws40OiVuk0iVmrLCz004erYmuZV8etUwghc/vJpHsNLPp/oQRsfa+vKSn
 9dmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Y88FdVXAgfg5w8PyflknRqNxB6/N6fKsnjWxZd+03NM=;
 b=gpkGS9G0tGud8g1WrVQCLDh0pHtn58RmQt7vl1Z8/y2PLSV71DHxbQPp1z3b2N/guQ
 c1/oAZs1brycePkPI9RsumQsElJKBU2EdglXDBn9O/uZtNbfmXWZ5xO6LDsLUd47lV0F
 h4P1/1M5a7vK1YwIAa/nwvPR5lYaRXrqyKwcRH0ZHz0LkusDvP3DgLZ8q6WA7tEOaaYW
 CHDiqXUyOslBfBeQlf967l/m5dJ8X1rqK2obc8rZSjYCYU/1hE3twM/nHwqZnHemMATg
 aO+Cl/rKdCnHfxV2q8LWtGnu3wf3yuo/vo5tWXm05vLL/8qYCJ7i3edOG4xETST1HSRc
 MVnw==
X-Gm-Message-State: AOAM530LK4flvrvSTPAXM0aUmt827nc4VdyRGxDbNt1KUlggsbunRViW
 5B0X8Zbh1bZ4M4/rgdLbU1s=
X-Google-Smtp-Source: ABdhPJxkU1FVe/JpOzzQ4tK9icFWX/K30mbP10klXX4Q3uuhlVNI6rXChsh44ijI2FQ7j2cA8M95aw==
X-Received: by 2002:a17:90a:f206:: with SMTP id
 bs6mr484281pjb.214.1603777104571; 
 Mon, 26 Oct 2020 22:38:24 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id z10sm573029pff.218.2020.10.26.22.38.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 22:38:23 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 27 Oct 2020 14:38:17 +0900
Message-Id: <20201027053818.3291747-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.195 listed in wl.mailspike.net]
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
X-Headers-End: 1kXHgr-008OuG-Fg
Subject: [f2fs-dev] [PATCH v4 1/2] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION
 ioctl
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

Added a new F2FS_IOC_GET_COMPRESS_OPTION ioctl to get file compression
option of a file.

struct f2fs_comp_option {
    u8 algorithm;         => compression algorithm
                          => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
    u8 log_cluster_size;  => log scale cluster size
                          => 2 ~ 8
};

struct f2fs_comp_option option;

ioctl(fd, F2FS_IOC_GET_COMPRESS_OPTION, &option);

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---

v4: changed commit message.
v3: changed the error number more specific.
v2: added ioctl description.
---
 fs/f2fs/f2fs.h |  7 +++++++
 fs/f2fs/file.c | 30 ++++++++++++++++++++++++++++++
 2 files changed, 37 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 53fe2853579c..a33c90cf979b 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -433,6 +433,8 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
 #define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20,	\
 						struct f2fs_sectrim_range)
+#define F2FS_IOC_GET_COMPRESS_OPTION	_IOR(F2FS_IOCTL_MAGIC, 21,	\
+						struct f2fs_comp_option)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
@@ -481,6 +483,11 @@ struct f2fs_sectrim_range {
 	u64 flags;
 };
 
+struct f2fs_comp_option {
+	u8 algorithm;
+	u8 log_cluster_size;
+};
+
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
 static inline int get_extra_isize(struct inode *inode);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index ef5a844de53f..8922ab191a9d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3936,6 +3936,33 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_comp_option option;
+
+	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
+		return -EOPNOTSUPP;
+
+	inode_lock(inode);
+
+	if (!f2fs_compressed_file(inode)) {
+		inode_unlock(inode);
+		return -ENODATA;
+	}
+
+	option.algorithm = F2FS_I(inode)->i_compress_algorithm;
+	option.log_cluster_size = F2FS_I(inode)->i_log_cluster_size;
+
+	inode_unlock(inode);
+
+	if (copy_to_user((struct f2fs_comp_option __user *)arg, &option,
+				sizeof(option)))
+		return -EFAULT;
+
+	return 0;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -4024,6 +4051,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_reserve_compress_blocks(filp, arg);
 	case F2FS_IOC_SEC_TRIM_FILE:
 		return f2fs_sec_trim_file(filp, arg);
+	case F2FS_IOC_GET_COMPRESS_OPTION:
+		return f2fs_ioc_get_compress_option(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4194,6 +4223,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 	case F2FS_IOC_SEC_TRIM_FILE:
+	case F2FS_IOC_GET_COMPRESS_OPTION:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.29.0.rc2.309.g374f81d7ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
