Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA7D29A433
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 27 Oct 2020 06:38:47 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kXHgs-0006ZV-In; Tue, 27 Oct 2020 05:38:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kXHgr-0006ZJ-FE
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 05:38:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tHlbJHPZJF+jvz6Frn6U6CsfnRsoYt7GUWGFIOxCyeA=; b=ddC6wt1aExt0RlMI+7bDP3CPy5
 GmHIVtuYTLUKVsKdMXzhCPlxdobObCLX6Sp0htLibyzwQuZy5R+Z8vSJ+DL0pf+eDZLnBsC9VJdwa
 1QfaqC41TLW+l/+uG5ulKmKYRhh8vRXyDK7SvWlI4w/20ZaAwun/9BWXarClOPieeTEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tHlbJHPZJF+jvz6Frn6U6CsfnRsoYt7GUWGFIOxCyeA=; b=VDyWmW9nC7d0VcV5nSd18v/8rX
 J9h+AhPZkFs9yxQIipDlR9lMbRiNno9YqE06wHJSdLX9BP64dX75PDUek26vvKqhRsVlgdy9wYVE3
 zPuaZ6eiOjomfoSKwObD583cV44/RR2VWbdsofXyg6mcZRs1GcDnBpg90trY/8j/a8vE=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kXHgn-00F8jZ-Ao
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 27 Oct 2020 05:38:37 +0000
Received: by mail-pg1-f195.google.com with SMTP id s22so123756pga.9
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 26 Oct 2020 22:38:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=tHlbJHPZJF+jvz6Frn6U6CsfnRsoYt7GUWGFIOxCyeA=;
 b=ZjI2+qGWlMTpcTdUHMKBqmp9KG73rxw/2nQUSSWvhqarxZy0jtz0SpZNeng2E5KbSO
 MVerpBTxv6xlWlDcFNU2h+MCVo58udVniS5m6PQNSK7C7MRHw3zDf0hGO6q3YTekvbyk
 JsDbRQKuBpSeDkvDtbyRNyVuqrvHt2qjNwFNNsZuPC553annEHtSLBYHBLav0r4xud8F
 yC/5lwJAEko7iF9ptQXVXMFfAli91r3EYonp14bFwGGdtrPU/GJL5RnmEW+aZD53QCY7
 ouQHAjJTPvTGeYw1h9zLFuwCvcUF3yvHu0mLrnlTWhcXAKBrDSgxyZLMgklryhZ93uuZ
 cRvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=tHlbJHPZJF+jvz6Frn6U6CsfnRsoYt7GUWGFIOxCyeA=;
 b=bjFTQGmxCAqy6DFFhRexrcDJYa0kghYUvXcHDuK53Y8jQhBk7PLP/VDEymSFkcR0Ys
 PWyLM7rg4Phb9GcHMynTmbX9WUzReN1mGWFmOpWdYH/gwMVxCm9KW2ujuiPZYPQTu6kT
 gF9uv0MFnfszHiiuieT/T1SaZnAyrgckXqzD8F/qVgmM7FexGKWa+/iv5MPxFsHtve4/
 ZmQfEGh0/1t/lSrdfscrevcxwvmPt8RPue0QAxaoM6K0qLhjo3YGHQJ3VYWXIOnlBrqd
 ifGaQOcjsxSEvKiIycNthPkginpm+PXndGULI6pVe6FYkljHZJSNQsbvQkZGmom6Qoxp
 HYOA==
X-Gm-Message-State: AOAM530EGetDLQCimbX1VsI1leacTAk142ztPv56Y6ykdNdvpKHpTK2K
 o7UJRJ0PO/uKSoE21KT0UPc=
X-Google-Smtp-Source: ABdhPJzFNSZbOJFmpbdNL6sYdPN5FHRj0Ny0x/zWYAU6lsNRKBQSSyxrOf11r+gPg7HNxjt7x+lRGg==
X-Received: by 2002:a63:44e:: with SMTP id 75mr441372pge.401.1603777107662;
 Mon, 26 Oct 2020 22:38:27 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id z10sm573029pff.218.2020.10.26.22.38.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Oct 2020 22:38:27 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 27 Oct 2020 14:38:18 +0900
Message-Id: <20201027053818.3291747-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.0.rc2.309.g374f81d7ae-goog
In-Reply-To: <20201027053818.3291747-1-daeho43@gmail.com>
References: <20201027053818.3291747-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: intel.com]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
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
X-Headers-End: 1kXHgn-00F8jZ-Ao
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
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

v4: changed commit message.
v3: changed the error number more specific.
    folded in fix for build breakage reported by kernel test robot
    <lkp@intel.com> and Dan Carpenter <dan.carpenter@oracle.com>.
v2: added ioctl description.
---
 fs/f2fs/compress.c |  5 +++++
 fs/f2fs/f2fs.h     |  7 +++++++
 fs/f2fs/file.c     | 52 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 64 insertions(+)

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
index 8922ab191a9d..8048b150e43b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3963,6 +3963,55 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
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
+			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE)
+		return -EINVAL;
+
+	if (!f2fs_is_compress_algorithm_ready(option.algorithm))
+		return -ENOPKG;
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
@@ -4053,6 +4102,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_sec_trim_file(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 		return f2fs_ioc_get_compress_option(filp, arg);
+	case F2FS_IOC_SET_COMPRESS_OPTION:
+		return f2fs_ioc_set_compress_option(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4224,6 +4275,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
+	case F2FS_IOC_SET_COMPRESS_OPTION:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.29.0.rc2.309.g374f81d7ae-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
