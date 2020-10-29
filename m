Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7D2FC29E334
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 Oct 2020 05:16:22 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXzMK-0001Ol-Va; Thu, 29 Oct 2020 04:16:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kXzMJ-0001OV-4z
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 04:16:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OS3kiFj7hguFNZ5QHdoV/+kAclT8nIay1b5YHWIjNmQ=; b=BlT1P9AKaza1Xd3OyygfEyBtai
 iQRAbsUA7eZ42G/UjELGd1wUVa5C6uOgz+jWRKjdEbOImzWz2f41qiQdGvEJRFglGFLvNVrJ029X9
 bG0eGZPErKCiRmKgHGv/GPtxlhiuvZ7mhZmvPF+SJobBvY6ZUagwmsXF5R52fzvyC544=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OS3kiFj7hguFNZ5QHdoV/+kAclT8nIay1b5YHWIjNmQ=; b=k7ZsJJ491CDeLkkaVammDSDiV3
 i/ur23rtmTLSE+nNDV6ZYJaN6mK09U0NBSXPXY6F2z6dwb+6kN5JyNvtMNg7vSXqspcY45zXwOf0Q
 EgNlTziprYo4WO7o/4oNwT/pCIlnTUQ1dqiEU2jqMFIDWcekQxGb6qcpPnmuwBoNVCYI=;
Received: from mail-pg1-f193.google.com ([209.85.215.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kXzM6-000XDH-Eh
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 29 Oct 2020 04:16:19 +0000
Received: by mail-pg1-f193.google.com with SMTP id o3so1270115pgr.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 28 Oct 2020 21:16:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=OS3kiFj7hguFNZ5QHdoV/+kAclT8nIay1b5YHWIjNmQ=;
 b=hUzJ7O8yv79mHDP41mSpHL/IfyDtvtF3wy4mxB94JX2XvwBtDsktIzlUmIedsnkYoe
 lQo/mvM9l71gp5WyrI9jKOQ7ymgJLOCSko5n18VttQpP9+P6hzYT9KyFkcEs5/Kull3f
 C+Ur5utEU73t4hr6AjrEiK51A1Ga9TF/2+LQ3b3qDsG8EhCI8fuZMKKIabas7D56JhAH
 CVqr+gNI1NzpgsycsI8PWbeRml9YWi7KiCgEdIGjXzQvE3Ku0gxUmP1s8MzF6Wlie/W+
 D+3WZnzIhnA0vVycGMbIGWvrugB/lPimmW+sEO85yUhXUEZFkvFY+fWSe6SmtxRaOfE1
 Kk9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=OS3kiFj7hguFNZ5QHdoV/+kAclT8nIay1b5YHWIjNmQ=;
 b=jy8L71dV45Acgp+kEKGqRygm/hBQw3HA1rFD24V0ZuEetesgzbGAz+yBodj+TRo2wt
 0qqzG54mOJXjMDviU/ABYI193EZoI9I6733lP4f7kQvlBRni25/Hss2owS20qiUeD1P2
 J80lMhODUXIGC39T6BqEenpCOnn0sSi0U4awrN1NckcM2JFhyIx3vUvlYJWuRRx+tYcA
 LQC4Cz6h4vvhlcAaZpJuwI8R6s6CbLXTYc5KevZuVW2rw9357Jn/0ftyJ8E54g3QqBJ6
 NlshdHB9LLmXtDL1YqL/UnzsRM9Yz6/z0dDA9InWK6SqEAu+klps9lHc0MJ36nRdBGCI
 903A==
X-Gm-Message-State: AOAM530raYgkt8B2lxpUZCMWTlLsQzYRLYksn2dvCKYFH8FV0rsshcOY
 wp7mZnDPNFI20hvg5kiXFsjwzXfsSC0=
X-Google-Smtp-Source: ABdhPJxU1JklH4uGyIG80yvHBF7BDi3MgXP0+8x1yAWvZjz2pPPsa9wutUAnauMxMPwT0R6ka13LUw==
X-Received: by 2002:a63:490e:: with SMTP id w14mr2364677pga.275.1603944953524; 
 Wed, 28 Oct 2020 21:15:53 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id d186sm1116261pfa.76.2020.10.28.21.15.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Oct 2020 21:15:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 Oct 2020 13:15:38 +0900
Message-Id: <20201029041538.4165209-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.1.341.ge80a0c044ae-goog
In-Reply-To: <20201029041538.4165209-1-daeho43@gmail.com>
References: <20201029041538.4165209-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.193 listed in wl.mailspike.net]
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
X-Headers-End: 1kXzM6-000XDH-Eh
Subject: [f2fs-dev] [PATCH v5 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
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

Added a new F2FS_IOC_SET_COMPRESS_OPTION ioctl to change file
compression option of a file.

struct f2fs_comp_option {
    u8 algorithm;         => compression algorithm
                          => 0:lzo, 1:lz4, 2:zstd, 3:lzorle
    u8 log_cluster_size;  => log scale cluster size
                          => 2 ~ 8
};

struct f2fs_comp_option option;

option.algorithm = 1;
option.log_cluster_size = 7;

ioctl(fd, F2FS_IOC_SET_COMPRESS_OPTION, &option);

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---

v5: allowed to set algorithm which is not currently enabled by kernel
v4: changed commit message.
v3: changed the error number more specific.
    folded in fix for build breakage reported by kernel test robot
    <lkp@intel.com> and Dan Carpenter <dan.carpenter@oracle.com>.
v2: added ioctl description.
---
 fs/f2fs/compress.c |  5 +++++
 fs/f2fs/f2fs.h     |  7 ++++++
 fs/f2fs/file.c     | 54 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 66 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7895186cc765..816d7adc914c 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -514,6 +514,11 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
+bool f2fs_is_compress_algorithm_ready(unsigned char algorithm)
+{
+	return algorithm < COMPRESS_MAX && f2fs_cops[algorithm] != NULL;
+}
+
 static mempool_t *compress_page_pool;
 static int num_compress_pages = 512;
 module_param(num_compress_pages, uint, 0444);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a33c90cf979b..cc38afde6c04 100644
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
@@ -3915,6 +3917,7 @@ bool f2fs_compress_write_end(struct inode *inode, void *fsdata,
 int f2fs_truncate_partial_cluster(struct inode *inode, u64 from, bool lock);
 void f2fs_compress_write_end_io(struct bio *bio, struct page *page);
 bool f2fs_is_compress_backend_ready(struct inode *inode);
+bool f2fs_is_compress_algorithm_ready(unsigned char algorithm);
 int f2fs_init_compress_mempool(void);
 void f2fs_destroy_compress_mempool(void);
 void f2fs_decompress_pages(struct bio *bio, struct page *page, bool verity);
@@ -3945,6 +3948,10 @@ static inline bool f2fs_is_compress_backend_ready(struct inode *inode)
 	/* not support compression */
 	return false;
 }
+static inline bool f2fs_is_compress_algorithm_ready(unsigned char algorithm)
+{
+	return false;
+}
 static inline struct page *f2fs_compress_control_page(struct page *page)
 {
 	WARN_ON_ONCE(1);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 8922ab191a9d..a0f31d8ebcfd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3963,6 +3963,57 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 	return 0;
 }
 
+static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_comp_option option;
+	int ret = 0;
+
+	if (!f2fs_sb_has_compression(sbi))
+		return -EOPNOTSUPP;
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
+	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
+				sizeof(option)))
+		return -EFAULT;
+
+	if (!f2fs_compressed_file(inode) ||
+			option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
+			option.algorithm >= COMPRESS_MAX)
+		return -EINVAL;
+
+	file_start_write(filp);
+	inode_lock(inode);
+
+	if (f2fs_is_mmap_file(inode) || get_dirty_pages(inode)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	if (inode->i_size != 0) {
+		ret = -EFBIG;
+		goto out;
+	}
+
+	F2FS_I(inode)->i_compress_algorithm = option.algorithm;
+	F2FS_I(inode)->i_log_cluster_size = option.log_cluster_size;
+	F2FS_I(inode)->i_cluster_size = 1 << option.log_cluster_size;
+	f2fs_mark_inode_dirty_sync(inode, true);
+
+	if (!f2fs_is_compress_algorithm_ready(option.algorithm))
+		f2fs_warn(sbi, "compression algorithm is successfully set, "
+			"but current kernel doesn't support this algorithm.");
+out:
+	inode_unlock(inode);
+	file_end_write(filp);
+
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -4053,6 +4104,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_sec_trim_file(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 		return f2fs_ioc_get_compress_option(filp, arg);
+	case F2FS_IOC_SET_COMPRESS_OPTION:
+		return f2fs_ioc_set_compress_option(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4224,6 +4277,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
+	case F2FS_IOC_SET_COMPRESS_OPTION:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.29.1.341.ge80a0c044ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
