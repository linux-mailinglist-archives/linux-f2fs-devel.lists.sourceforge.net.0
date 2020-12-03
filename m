Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47BC42CCFE4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  3 Dec 2020 07:57:06 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kkiY3-0003FI-1q; Thu, 03 Dec 2020 06:57:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kkiXc-0003EE-SE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:56:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=lc7bOrg/2FPLXC69S/OBOmR0G1J50Q697SgCANI/bBs=; b=kcNjHCswIcaNiGSv/ID+M+ezoj
 yeIAKshciPCohMdBJhpgEN2gFgYPZIuERHQLYpK7qXWch3kJweXif1Kn5KKjWBEZi+GrImgXBFGKj
 PEbc2t52qqjIoPP7XB8GSYXWSXYiT82jOsnIHZgYq7X6hYk4IsL8GxSBe8dL7fJTO1rU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=lc7bOrg/2FPLXC69S/OBOmR0G1J50Q697SgCANI/bBs=; b=l
 bA+6dOktaUtDgKwozOPGJcZvmKvlevw+sH9cxzJDanoxqhUWO/EMzjSML+R50uSxHp5GALEIAwYFb
 FLLtjzb/Gvh/z7LXANqwS6N4LDXjia5taXbeonIFdKZJyVfVtVTTaXSUfchG3SrqZDbbNpfbkXqtp
 fRtj4Ik9ZzT3UpOA=;
Received: from mail-pj1-f65.google.com ([209.85.216.65])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kkiXU-00HFiC-Uv
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 03 Dec 2020 06:56:36 +0000
Received: by mail-pj1-f65.google.com with SMTP id iq13so582546pjb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 02 Dec 2020 22:56:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lc7bOrg/2FPLXC69S/OBOmR0G1J50Q697SgCANI/bBs=;
 b=QQ9ZUZ84N4fy6aMyDjIfHfgqPPGjv53vw1SQLLrNnZb5YU2D+jaaH8GUYCCyGEpPr/
 UDrE0j+T5G4nPfsYN0dDIlIO38AD3xaxobQ2xiR7eK33kfSiQcv5LvKcT8mDaSUZJYAF
 JaYJfdQu0o57sZaSdAgnA0JTBvOTQ640EZOEsVGeS8AZjoLkkOcqRFROi2Qd1vnL7fzg
 9281Blg9eZTDyUH/zxyjY1+ZjYOItGg5bylRrPhbXYw0UNFFmmI2zrgGrRtWKV+G8pZf
 f5a6w8wgMsVtbWr18IujwTH+lm3xoqbxiLdKD45ftLIq+xlX+kkg9ivt39DS/gwjAjcH
 +sww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=lc7bOrg/2FPLXC69S/OBOmR0G1J50Q697SgCANI/bBs=;
 b=DmpDherYg2tGzsNG0gKkizLqYFfDX/Imk9Nk37AgPgXgpJ7yzQg0RVhAgJ9rim+/Mg
 hi53CAhOiPBWdfbmfuXYfUKjEEFUqy6mYwEs3Lb+cxYYgJGPMTxLgQTKTqVTRy6WS77g
 kv7DUt3jUZtKaZ7U/PfK+11xMB/Z5L4JZ/TGmYrXCeJTOTZq8S7tWbDJm75x3mloIUGi
 qOAWN5JlOiL/wwwRNjH8WHSnnC6a9ooRyN/p0A7CejFB7i6LNy1qHXaQkGhvZ54DbDHY
 uPiIrgBbr5VmAzlcwjgQtx/CCTUpnaJjxAz8UCcaHk03NAoh8HWcZBNX6ELRqdEaxAJM
 OE2w==
X-Gm-Message-State: AOAM531ERzYnbQeycIDrZJCeSpUvH102jgCFUUQWg8+BIURJepCKe4xv
 BDvaPlZUyPalC1EzZa5UbeM=
X-Google-Smtp-Source: ABdhPJzEZ2uZ4dnP4N+fcWX96To1xyNjRf0eSHN3fFkdvGVmHHaFGFHV31Issgu0wU4cctRtTG9rtg==
X-Received: by 2002:a17:902:44e:b029:da:b944:b798 with SMTP id
 72-20020a170902044eb02900dab944b798mr1906507ple.6.1606978583225; 
 Wed, 02 Dec 2020 22:56:23 -0800 (PST)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id c66sm637885pfa.0.2020.12.02.22.56.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Dec 2020 22:56:22 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  3 Dec 2020 15:56:15 +0900
Message-Id: <20201203065615.402494-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.2.576.ga3fc446d84-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.65 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.216.65 listed in list.dnswl.org]
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
X-Headers-End: 1kkiXU-00HFiC-Uv
Subject: [f2fs-dev] [PATCH v3] f2fs: add F2FS_IOC_DECOMPRESS_FILE and
 F2FS_IOC_COMPRESS_FILE
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

Added two ioctl to decompress/compress explicitly the compression
enabled file in "compress_mode=user" mount option.

Using these two ioctls, the users can make a control of compression
and decompression of their files.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v3: changed error condition and use get_dirty_pages for flush routine
v2: reformed codes based on comments and put gradual flush routine
---
 fs/f2fs/file.c            | 185 ++++++++++++++++++++++++++++++++++++++
 include/uapi/linux/f2fs.h |   2 +
 2 files changed, 187 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index be8db06aca27..3678e25ed17a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4026,6 +4026,185 @@ static int f2fs_ioc_set_compress_option(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int redirty_blocks(struct inode *inode, pgoff_t page_idx, int len)
+{
+	DEFINE_READAHEAD(ractl, NULL, inode->i_mapping, page_idx);
+	struct address_space *mapping = inode->i_mapping;
+	struct page *page;
+	pgoff_t redirty_idx = page_idx;
+	int i, page_len = 0, ret = 0;
+
+	page_cache_ra_unbounded(&ractl, len, 0);
+
+	for (i = 0; i < len; i++, page_idx++) {
+		page = read_cache_page(mapping, page_idx, NULL, NULL);
+		if (IS_ERR(page)) {
+			ret = PTR_ERR(page);
+			break;
+		}
+		page_len++;
+	}
+
+	for (i = 0; i < page_len; i++, redirty_idx++) {
+		page = find_lock_page(mapping, redirty_idx);
+		if (!page)
+			ret = -ENOENT;
+		set_page_dirty(page);
+		f2fs_put_page(page, 1);
+		f2fs_put_page(page, 0);
+	}
+
+	return ret;
+}
+
+static int f2fs_ioc_decompress_file(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	pgoff_t page_idx = 0, last_idx;
+	unsigned int blk_per_seg = sbi->blocks_per_seg;
+	int cluster_size = F2FS_I(inode)->i_cluster_size;
+	int count, ret;
+
+	if (!f2fs_sb_has_compression(sbi) ||
+			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
+		return -EOPNOTSUPP;
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
+	if (!f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	f2fs_balance_fs(F2FS_I_SB(inode), true);
+
+	file_start_write(filp);
+	inode_lock(inode);
+
+	if (!f2fs_is_compress_backend_ready(inode)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (f2fs_is_mmap_file(inode)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
+	if (ret)
+		goto out;
+
+	if (!atomic_read(&fi->i_compr_blocks))
+		goto out;
+
+	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+
+	count = last_idx - page_idx;
+	while (count) {
+		int len = min(cluster_size, count);
+
+		ret = redirty_blocks(inode, page_idx, len);
+		if (ret < 0)
+			break;
+
+		if (get_dirty_pages(inode) >= blk_per_seg)
+			filemap_fdatawrite(inode->i_mapping);
+
+		count -= len;
+		page_idx += len;
+	}
+
+	if (!ret)
+		ret = filemap_write_and_wait_range(inode->i_mapping, 0,
+							LLONG_MAX);
+
+	if (ret)
+		f2fs_warn(sbi, "%s: The file might be partially decompressed "
+				"(errno=%d). Please delete the file.\n",
+				__func__, ret);
+out:
+	inode_unlock(inode);
+	file_end_write(filp);
+
+	return ret;
+}
+
+static int f2fs_ioc_compress_file(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	pgoff_t page_idx = 0, last_idx;
+	unsigned int blk_per_seg = sbi->blocks_per_seg;
+	int cluster_size = F2FS_I(inode)->i_cluster_size;
+	int count, ret;
+
+	if (!f2fs_sb_has_compression(sbi) ||
+			F2FS_OPTION(sbi).compress_mode != COMPR_MODE_USER)
+		return -EOPNOTSUPP;
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
+	if (!f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	f2fs_balance_fs(F2FS_I_SB(inode), true);
+
+	file_start_write(filp);
+	inode_lock(inode);
+
+	if (!f2fs_is_compress_backend_ready(inode)) {
+		ret = -EOPNOTSUPP;
+		goto out;
+	}
+
+	if (f2fs_is_mmap_file(inode)) {
+		ret = -EBUSY;
+		goto out;
+	}
+
+	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
+	if (ret)
+		goto out;
+
+	set_inode_flag(inode, FI_ENABLE_COMPRESS);
+
+	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
+
+	count = last_idx - page_idx;
+	while (count) {
+		int len = min(cluster_size, count);
+
+		ret = redirty_blocks(inode, page_idx, len);
+		if (ret < 0)
+			break;
+
+		if (get_dirty_pages(inode) >= blk_per_seg)
+			filemap_fdatawrite(inode->i_mapping);
+
+		count -= len;
+		page_idx += len;
+	}
+
+	if (!ret)
+		ret = filemap_write_and_wait_range(inode->i_mapping, 0,
+							LLONG_MAX);
+
+	clear_inode_flag(inode, FI_ENABLE_COMPRESS);
+
+	if (ret)
+		f2fs_warn(sbi, "%s: The file might be partially compressed "
+				"(errno=%d). Please delete the file.\n",
+				__func__, ret);
+out:
+	inode_unlock(inode);
+	file_end_write(filp);
+
+	return ret;
+}
+
 static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	switch (cmd) {
@@ -4113,6 +4292,10 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_ioc_get_compress_option(filp, arg);
 	case F2FS_IOC_SET_COMPRESS_OPTION:
 		return f2fs_ioc_set_compress_option(filp, arg);
+	case F2FS_IOC_DECOMPRESS_FILE:
+		return f2fs_ioc_decompress_file(filp, arg);
+	case F2FS_IOC_COMPRESS_FILE:
+		return f2fs_ioc_compress_file(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4352,6 +4535,8 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_SEC_TRIM_FILE:
 	case F2FS_IOC_GET_COMPRESS_OPTION:
 	case F2FS_IOC_SET_COMPRESS_OPTION:
+	case F2FS_IOC_DECOMPRESS_FILE:
+	case F2FS_IOC_COMPRESS_FILE:
 		break;
 	default:
 		return -ENOIOCTLCMD;
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index f00199a2e38b..352a822d4370 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -40,6 +40,8 @@
 						struct f2fs_comp_option)
 #define F2FS_IOC_SET_COMPRESS_OPTION	_IOW(F2FS_IOCTL_MAGIC, 22,	\
 						struct f2fs_comp_option)
+#define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
+#define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.29.2.576.ga3fc446d84-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
