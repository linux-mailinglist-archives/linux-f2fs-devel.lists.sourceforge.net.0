Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6D031EF08F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  5 Jun 2020 06:28:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jh3xd-00045k-DT; Fri, 05 Jun 2020 04:28:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jh3xc-00045Z-7y
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 04:28:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C4gO2P4HM+S0K7NAiU9zSajGl6Mf1LW7417QDCiFsO0=; b=AiIv5/qo3oagIrdNBq3mE7prLf
 lRPwjJI/QiSYF0i0feDL9H0ga8sIUUii40bzQXcQvIgxdKpj5Ms5U4tv/up8iHwrdEP/nBDT3Tngv
 WjkiQg/mdGhs5sg4hhMp91kJSOD5AuROfroM6Cen/Ktd13U8UWzb2axJZJNro/+TxrP8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=C4gO2P4HM+S0K7NAiU9zSajGl6Mf1LW7417QDCiFsO0=; b=f
 E5hNEBVH39DRM5yTa2spAhGAAVUKp5fgfzYjXq/D+mn6AIeKO0+whqQqw4odAgH7cVjWOGxEpqiMB
 zAR9iQie0mQ3Itkr9AfKOqMsb3qpZKmepLrLg3/i3Tscxctlg89MxRYoa8Z+HEBjcyxiHOvjbWmqs
 Iaz4SiU/IGpZ6QJ8=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jh3xW-006MvD-T4
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 05 Jun 2020 04:28:04 +0000
Received: by mail-pg1-f195.google.com with SMTP id o8so4546067pgm.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 04 Jun 2020 21:27:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4gO2P4HM+S0K7NAiU9zSajGl6Mf1LW7417QDCiFsO0=;
 b=Cl3q2kBpre6ES1SBH7Q+x/Xxlz3bZfK3zZhzj5CyngUuu1ApZBHoYZc0QO4aFiM4YG
 j1uVW45ecr5nC+R5VHk3dCTdBvtyNyQwCam1yrWd9h846dVcgFoC5cIPx+pekhxchmwe
 tnCQd4Rp8aTtwSEZevwyD77oTMVtReG8Z/gr8Y5gGTCKVoKT4Xjd1I5D5Jrp1XGG18Zl
 OJO6hXIYhYERBW4uj7y3yF7xalnLsCujMQw+3EwWwkfzq4ji5OglQbI8XXeIarRD/buF
 NRdZw240GK8crOYxZ2Rb8NA2+d9SLIrXriuEn7E1hO9VkZ+W9jg3Z+Tjhod+rtc4Zftd
 El+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=C4gO2P4HM+S0K7NAiU9zSajGl6Mf1LW7417QDCiFsO0=;
 b=M7ftFDb66G/kmrzfNSZs059eN5sNUV2Dq5fiVkx8hx3ATkS4JsQ4PXiCiktARFqdTC
 tFFs3Iy0JeRDGYBGBOhfUmqdF1N0V3KugbOzMALuDGk6PCJ/O3qyiRYv1TFokjGBJlvh
 a1NNQEqs+EjXtjNP1f9AByBgtU/LeMlB6xufSUnOQO664l+v0HsdI5QFOdhGpFS/Xe3y
 5mm3TYkdaME0K63haMge263BYyHkVRDGgdY0CmLJi/QlFmiA830yIIJHbS5TdGXrnnwe
 DBIar1DyXgv9YZHeFi826owZlulaYSJsBgekCevRFOCVWWmBnUrbnG5NJbaCs35xmI8Y
 /wKw==
X-Gm-Message-State: AOAM533Z4fxmnAf69XrAR64CEYFG4Uqz4wes6kDJjVs5Re+ugtB0TsAw
 LeyKTN0KNC3FA99ogEddXBo=
X-Google-Smtp-Source: ABdhPJx+R+ErD2StoSMjRqvvvAhK6Sqh0XxoMWkhmdbu0Gnfu/0ZHEjnOj0wXOQ1afowPYxQcNQFcQ==
X-Received: by 2002:a62:4e8a:: with SMTP id c132mr7253898pfb.22.1591331273119; 
 Thu, 04 Jun 2020 21:27:53 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id x19sm5863627pfo.96.2020.06.04.21.27.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Jun 2020 21:27:52 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri,  5 Jun 2020 13:27:46 +0900
Message-Id: <20200605042746.201180-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jh3xW-006MvD-T4
Subject: [f2fs-dev] [PATCH] f2fs: add F2FS_IOC_TRIM_FILE ioctl
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

Added a new ioctl to send discard commands to whole data area of
a regular file for security reason.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h |   1 +
 fs/f2fs/file.c | 129 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 130 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c812fb8e2d9c..9ae81d0fefa0 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -434,6 +434,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
 #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
 					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
+#define F2FS_IOC_TRIM_FILE		_IO(F2FS_IOCTL_MAGIC, 20)
 
 #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
 #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index dfa1ac2d751a..58507bb5649c 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3749,6 +3749,132 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_trim_file(struct file *filp)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct address_space *mapping = inode->i_mapping;
+	struct bio *bio = NULL;
+	struct block_device *prev_bdev = NULL;
+	loff_t file_size;
+	pgoff_t index, pg_start = 0, pg_end;
+	block_t prev_block = 0, len = 0;
+	int ret = 0;
+
+	if (!f2fs_hw_support_discard(sbi))
+		return -EOPNOTSUPP;
+
+	if (!S_ISREG(inode->i_mode) || f2fs_is_atomic_file(inode) ||
+			f2fs_compressed_file(inode))
+		return -EINVAL;
+
+	if (f2fs_readonly(sbi->sb))
+		return -EROFS;
+
+	ret = mnt_want_write_file(filp);
+	if (ret)
+		return ret;
+
+	inode_lock(inode);
+
+	file_size = i_size_read(inode);
+	if (!file_size)
+		goto err;
+	pg_end = (pgoff_t)round_up(file_size, PAGE_SIZE) >> PAGE_SHIFT;
+
+	ret = f2fs_convert_inline_inode(inode);
+	if (ret)
+		goto err;
+
+	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	down_write(&F2FS_I(inode)->i_mmap_sem);
+
+	ret = filemap_write_and_wait(mapping);
+	if (ret)
+		goto out;
+
+	truncate_inode_pages(mapping, 0);
+
+	for (index = pg_start; index < pg_end;) {
+		struct dnode_of_data dn;
+		unsigned int end_offset;
+
+		set_new_dnode(&dn, inode, NULL, NULL, 0);
+		ret = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
+		if (ret)
+			goto out;
+
+		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		if (pg_end < end_offset + index)
+			end_offset = pg_end - index;
+
+		for (; dn.ofs_in_node < end_offset;
+				dn.ofs_in_node++, index++) {
+			struct block_device *cur_bdev;
+			block_t blkaddr = f2fs_data_blkaddr(&dn);
+
+			if (__is_valid_data_blkaddr(blkaddr)) {
+				if (!f2fs_is_valid_blkaddr(F2FS_I_SB(inode),
+					blkaddr, DATA_GENERIC_ENHANCE)) {
+					ret = -EFSCORRUPTED;
+					goto out;
+				}
+			} else
+				continue;
+
+			cur_bdev = f2fs_target_device(sbi, blkaddr, NULL);
+			if (f2fs_is_multi_device(sbi)) {
+				int i = f2fs_target_device_index(sbi, blkaddr);
+
+				blkaddr -= FDEV(i).start_blk;
+			}
+
+			if (len) {
+				if (prev_bdev == cur_bdev &&
+					blkaddr == prev_block + len) {
+					len++;
+				} else {
+					ret = __blkdev_issue_discard(prev_bdev,
+						SECTOR_FROM_BLOCK(prev_block),
+						SECTOR_FROM_BLOCK(len),
+						GFP_NOFS, 0, &bio);
+					if (ret)
+						goto out;
+
+					len = 0;
+				}
+			}
+
+			if (!len) {
+				prev_bdev = cur_bdev;
+				prev_block = blkaddr;
+				len = 1;
+			}
+		}
+
+		f2fs_put_dnode(&dn);
+	}
+
+	if (len)
+		ret = __blkdev_issue_discard(prev_bdev,
+					SECTOR_FROM_BLOCK(prev_block),
+					SECTOR_FROM_BLOCK(len),
+					GFP_NOFS, 0, &bio);
+out:
+	if (bio) {
+		ret = submit_bio_wait(bio);
+		bio_put(bio);
+	}
+
+	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+err:
+	inode_unlock(inode);
+	mnt_drop_write_file(filp);
+
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3835,6 +3961,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_release_compress_blocks(filp, arg);
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 		return f2fs_reserve_compress_blocks(filp, arg);
+	case F2FS_IOC_TRIM_FILE:
+		return f2fs_trim_file(filp);
 	default:
 		return -ENOTTY;
 	}
@@ -4004,6 +4132,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
+	case F2FS_IOC_TRIM_FILE:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.27.0.278.ge193c7cf3a9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
