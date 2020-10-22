Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24D4E295702
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 Oct 2020 05:59:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kVRlC-0008N8-OA; Thu, 22 Oct 2020 03:59:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kVRlA-0008N1-VG
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 03:59:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2XryR24m3OAK6z3PvGa18+srF7jv0KqJptD9j21+0eA=; b=mj5lXip7EJCLMgZgjfpUdU6TbG
 3YFgro5h1s2+inXNtpRcFZIJqA8hijzPlri3e6sJ854h28L90NzJ0lfp/w0eph39A1KYl9PO3vXAR
 qmaWb3gAHRhWghpFT7/KLYFfOoL1kjAF2UaFNMIu5G+AxLIg+NfClHOvtVuP5S3CZB5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2XryR24m3OAK6z3PvGa18+srF7jv0KqJptD9j21+0eA=; b=QEuIS6mW+4NWgrX7QVjXP0/FQ9
 qUeZILwLyHE2bIPNM+os4CkipmoB1dnJKaUggoeBbhpxSthXluPeHw9FV5G6MTdBsT8ow31/bOeOa
 mj+UuwrASuM6w3qMak8xsYckt/BPZF5EvY+PpBmfedBSXqIv0LLeOLukVwssoeOHmChc=;
Received: from mail-pf1-f196.google.com ([209.85.210.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kVRl0-002AHE-20
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 22 Oct 2020 03:59:28 +0000
Received: by mail-pf1-f196.google.com with SMTP id 144so319150pfb.4
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 21 Oct 2020 20:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2XryR24m3OAK6z3PvGa18+srF7jv0KqJptD9j21+0eA=;
 b=ibtnbf+zU42Qm6yoZUkmeDfpbMqcjcDhrxAsWTHyxlMb1M5rcqixe71BplmRzbhvVx
 Gn4vX43SOy39UTRlRQrxD7jGhjce+Pa4ODp7hHXVGZH9jDquWPyQQhC5hKaMo/AeAisq
 6pui/CfDhxgXtuR792KsOi2RHvVw0HPavIHsObuZIdYVZBp/9wZijOGZ8Kv6VGvRP8i3
 bb30PFz4vnKXiuZz7Q594Nu86npJBpa1wZde3a1DnMKh5lmuxGaiYDxGFicJni+hUG5L
 IibXjYHjnr0aD2bOjOVDzsppNXjqeWQ1UNPRaWO2vPgwfQOflr6piC3vbjZDdtX7FrXB
 58Xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2XryR24m3OAK6z3PvGa18+srF7jv0KqJptD9j21+0eA=;
 b=tQSNTj1lI5eNdGB5pi3xBY3kkPH5MbUQxApAoRCi7J32iS/VvWn6z6fr71M/E2ilN3
 KthKYZz8pAHwGHeIsxNKgLW8EVjaerwPGXwwyOyhr49i2ux1jzK9XjmxtzqPPQ1/mn2x
 Wb/Snqw3S4sUED+Rg0Wq1Ujk7502XPeB6oA2ee7usUr8dBMWIf152F4G7cSZp1GEEoGr
 7qkBGwoeg3DX13EWRKHvf9ZW0S+XWlmL8lID1umdlzsWqBIPxwE7f3JHJFB9ozlgGLoA
 To2dp3ROc77mE3WCmEzP3OCTb5YYQL4S/43t77IAXjlWNps/g3EJfHISYdwyYZZK7IWB
 agdg==
X-Gm-Message-State: AOAM530KIM4FQjdt1WkxbASx3nXdqd7yMDYeiF+chKv/GwhJoJp9K7Js
 5cyzbjhsKrW5NWBzs/WbQ7s=
X-Google-Smtp-Source: ABdhPJwG0F31QZRMOXbUn0QhuoTvb9F/6+ZItveE396+y41sqnR1xrZW4M64iUTmDfAmoDZronfjQg==
X-Received: by 2002:a62:92c8:0:b029:152:1703:2da9 with SMTP id
 o191-20020a6292c80000b029015217032da9mr786782pfd.60.1603339145170; 
 Wed, 21 Oct 2020 20:59:05 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id q81sm276879pfc.36.2020.10.21.20.59.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Oct 2020 20:59:04 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 22 Oct 2020 12:58:48 +0900
Message-Id: <20201022035848.976286-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
In-Reply-To: <20201022035848.976286-1-daeho43@gmail.com>
References: <20201022035848.976286-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.196 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.196 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kVRl0-002AHE-20
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION
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
 fs/f2fs/compress.c |  5 +++++
 fs/f2fs/f2fs.h     |  7 +++++++
 fs/f2fs/file.c     | 48 ++++++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 60 insertions(+)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 7895186cc765..3b58a41223f8 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -514,6 +514,11 @@ bool f2fs_is_compress_backend_ready(struct inode *inode)
 	return f2fs_cops[F2FS_I(inode)->i_compress_algorithm];
 }
 
+bool f2fs_is_compress_algorithm_ready(unsigned char algorithm)
+{
+	return algorithm >= COMPRESS_MAX ? false : f2fs_cops[algorithm];
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
index 7e64259f6f5e..b18ef22e2d9d 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3963,6 +3963,51 @@ static int f2fs_ioc_get_compress_option(struct file *filp, unsigned long arg)
 	return 0;
 }
 
+static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_comp_option option;
+	int ret;
+
+	if (!f2fs_sb_has_compression(sbi))
+		return -EOPNOTSUPP;
+
+	if (!f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
+	if (copy_from_user(&option, (struct f2fs_comp_option __user *)arg,
+				sizeof(option)))
+		return -EFAULT;
+
+	if (option.log_cluster_size < MIN_COMPRESS_LOG_SIZE ||
+			option.log_cluster_size > MAX_COMPRESS_LOG_SIZE ||
+			!f2fs_is_compress_algorithm_ready(option.algorithm))
+		return -EINVAL;
+
+	file_start_write(filp);
+	inode_lock(inode);
+
+	if (f2fs_is_mmap_file(inode) ||
+			get_dirty_pages(inode) || inode->i_size) {
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
+	file_end_write(filp);
+
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -4053,6 +4098,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_sec_trim_file(filp, arg);
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 		return f2fs_ioc_get_compress_option(filp, arg);
+	case F2FS_IOC_SET_COMPRESS_OPTION:
+		return f2fs_ioc_set_compress_option(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4224,6 +4271,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
+	case F2FS_IOC_SET_COMPRESS_OPTION:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.29.0.rc1.297.gfa9743e501-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
