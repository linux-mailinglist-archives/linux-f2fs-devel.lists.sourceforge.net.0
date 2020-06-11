Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F47C1F6066
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Jun 2020 05:17:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jjDiI-0001Vx-Mh; Thu, 11 Jun 2020 03:17:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jjDiH-0001Vk-LE
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 03:17:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ehrgS32gMf6wPQo2vNkaEDhcW2sOAF2ZJzxzXWBGECE=; b=SOpzARDUcCD4uBRao8WlzQq0L7
 xeZ710ERuogwxswePRiGG1PCa9PsdPovE8lLc/B6S06Q0u7qFePKgppEVm6r/fuqnnpWnVGczsaGG
 jGnyt+NlTUCGrleokGJWMOSeSh4JHgZk89sDBZog1spiR/K0J8SW+R3UpqTWle5sRBtY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ehrgS32gMf6wPQo2vNkaEDhcW2sOAF2ZJzxzXWBGECE=; b=D
 WFq6A2KbguE4q2N2s/CRSHqpMgJASCCnTWkora6P0DY7el9PxluVPt2YGCpQAvSKaO/Ol8hWWa+0x
 wXSzv0VYrnCTakd6oEbIfp5s6122CvLugkURO2OViZIZoW60KccW3yLvhEbWOytg8vCaWTITHz0vD
 lpwA0upXNfE69YHY=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jjDiG-00GEqV-7m
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 11 Jun 2020 03:17:09 +0000
Received: by mail-pl1-f193.google.com with SMTP id bg4so1781604plb.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 10 Jun 2020 20:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ehrgS32gMf6wPQo2vNkaEDhcW2sOAF2ZJzxzXWBGECE=;
 b=iKUJ1gjmx8FK5WMjR56zqFzj41etGkG2tlvexAS1BxA0N1SRoPGOp5m9wMjUxUVhHM
 e/6LRxyGoBHD9/Aqdl1tMGsY+F5j+ffRerFV94peqdvE9F75WF7Mrsd/3gbYEUAR/qew
 FeFx2GO/IA18JN1L6Pok/AItEq+1QNPgEYTBjupNGfUCGOgxo6jNKhorCg+8hRjVHaRc
 UaHh5tAZY7kV/SiR7FIZyHH8V30nWkNr+Sp8+VjsLcy5OFOPsJSbVrlF8OI2EdIBI+W3
 ROo7VLAM0ZGJWfd3lRljqSvPwM7WL2Nbm6fELXUq6YkNhVMgv9EYgRzfXPyigP7SSLJq
 bqzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ehrgS32gMf6wPQo2vNkaEDhcW2sOAF2ZJzxzXWBGECE=;
 b=k8zbcojhnlsdzL+Fi9k70fb3a7QwhIQ0zhxgaHx3GVR2/aGzUKMG+QInWqFPTTZhLq
 2Wm10QrCarTx+vC/kvBDPNb8rZYM+lihGwc5rfZmTvS3r31B8oHeGJxw973T8ykm1vtn
 nVjnv0N++EbDkB/ZzlJWs77tpKPAocolJ4sSkN7p8qL2f+1rBpOVWQz0s1D1vmSOi0Dc
 +PiaPEj6JgHCDTcLOwSXtR76G237qAM1luvi9esghAjlDAHgwYBlqpsNpgaFjwgqBio3
 Wzj7Uch1QEgGMh7RSvbyy6lPq5PIxTg9yGzv0/EJRtoWLcz49OuYMJW4mkjKN39qZaXe
 etCw==
X-Gm-Message-State: AOAM530ZprMY7S84X4KjvcsWezRqwu5vvKPW8+Z9nMoYKy4HTVWogOu9
 AJTPZd4CZ3i6oPhv3CL+gv8=
X-Google-Smtp-Source: ABdhPJyDPKWdUfyRn5pMK+IZe7kCzETVF92zX9uGB5/fKJrv8fYInai60BZyyY8gd52GQcmwjnsDJA==
X-Received: by 2002:a17:90b:46ca:: with SMTP id
 jx10mr6247863pjb.3.1591845422545; 
 Wed, 10 Jun 2020 20:17:02 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id ha16sm1030196pjb.40.2020.06.10.20.17.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Jun 2020 20:17:01 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 11 Jun 2020 12:16:52 +0900
Message-Id: <20200611031652.200401-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.27.0.278.ge193c7cf3a9-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
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
X-Headers-End: 1jjDiG-00GEqV-7m
Subject: [f2fs-dev] [PATCH v2] f2fs: add F2FS_IOC_SEC_TRIM_FILE ioctl
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

Added a new ioctl to send discard commands or/and zero out
to whole data area of a regular file for security reason.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h |   8 +++
 fs/f2fs/file.c | 143 +++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 151 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index c812fb8e2d9c..ca139fac5a73 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -434,6 +434,7 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 					_IOR(F2FS_IOCTL_MAGIC, 18, __u64)
 #define F2FS_IOC_RESERVE_COMPRESS_BLOCKS				\
 					_IOR(F2FS_IOCTL_MAGIC, 19, __u64)
+#define F2FS_IOC_SEC_TRIM_FILE		_IOW(F2FS_IOCTL_MAGIC, 20, __u32)
 
 #define F2FS_IOC_GET_VOLUME_NAME	FS_IOC_GETFSLABEL
 #define F2FS_IOC_SET_VOLUME_NAME	FS_IOC_SETFSLABEL
@@ -453,6 +454,13 @@ static inline bool __has_cursum_space(struct f2fs_journal *journal,
 #define F2FS_GOING_DOWN_METAFLUSH	0x3	/* going down with meta flush */
 #define F2FS_GOING_DOWN_NEED_FSCK	0x4	/* going down to trigger fsck */
 
+/*
+ * Flags used by F2FS_IOC_SEC_TRIM_FILE
+ */
+#define F2FS_TRIM_FILE_DISCARD		0x1	/* send discard command */
+#define F2FS_TRIM_FILE_ZEROOUT		0x2	/* zero out */
+#define F2FS_TRIM_FILE_MASK		0x3
+
 #if defined(__KERNEL__) && defined(CONFIG_COMPAT)
 /*
  * ioctl commands in 32 bit emulation
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index dfa1ac2d751a..ba9b7ec5d6bf 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3749,6 +3749,146 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	return ret;
 }
 
+static int f2fs_secure_erase(struct block_device *bdev, block_t block,
+					block_t len, u32 flags)
+{
+	struct request_queue *q = bdev_get_queue(bdev);
+	sector_t sector = SECTOR_FROM_BLOCK(block);
+	sector_t nr_sects = SECTOR_FROM_BLOCK(len);
+	int ret = 0;
+
+	if (!q)
+		return -ENXIO;
+
+	if (flags & F2FS_TRIM_FILE_DISCARD)
+		ret = blkdev_issue_discard(bdev, sector, nr_sects, GFP_NOFS,
+						blk_queue_secure_erase(q) ?
+						BLKDEV_DISCARD_SECURE : 0);
+
+	if (!ret && (flags & F2FS_TRIM_FILE_ZEROOUT))
+		ret = blkdev_issue_zeroout(bdev, sector, nr_sects, GFP_NOFS, 0);
+
+	return ret;
+}
+
+static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
+{
+	struct inode *inode = file_inode(filp);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct address_space *mapping = inode->i_mapping;
+	struct block_device *prev_bdev = NULL;
+	pgoff_t index, pg_start = 0, pg_end;
+	block_t prev_block = 0, len = 0;
+	u32 flags;
+	int ret = 0;
+
+	if (!(filp->f_mode & FMODE_WRITE))
+		return -EBADF;
+
+	if (get_user(flags, (u32 __user *)arg))
+		return -EFAULT;
+	if (flags == 0 || (flags & ~F2FS_TRIM_FILE_MASK))
+		return -EINVAL;
+
+	if ((flags & F2FS_TRIM_FILE_DISCARD) && !f2fs_hw_support_discard(sbi))
+		return -EOPNOTSUPP;
+
+	file_start_write(filp);
+	inode_lock(inode);
+
+	if (!S_ISREG(inode->i_mode) || f2fs_is_atomic_file(inode) ||
+			f2fs_compressed_file(inode)) {
+		ret = -EINVAL;
+		goto err;
+	}
+
+	if (!inode->i_size)
+		goto err;
+	pg_end = DIV_ROUND_UP(inode->i_size, PAGE_SIZE);
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
+					ret = f2fs_secure_erase(prev_bdev,
+							prev_block, len, flags);
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
+		ret = f2fs_secure_erase(prev_bdev, prev_block, len, flags);
+out:
+	up_write(&F2FS_I(inode)->i_mmap_sem);
+	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+err:
+	inode_unlock(inode);
+	file_end_write(filp);
+
+	return ret;
+}
+
 long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 {
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(file_inode(filp)))))
@@ -3835,6 +3975,8 @@ long f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 		return f2fs_release_compress_blocks(filp, arg);
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
 		return f2fs_reserve_compress_blocks(filp, arg);
+	case F2FS_IOC_SEC_TRIM_FILE:
+		return f2fs_sec_trim_file(filp, arg);
 	default:
 		return -ENOTTY;
 	}
@@ -4004,6 +4146,7 @@ long f2fs_compat_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
 	case F2FS_IOC_GET_COMPRESS_BLOCKS:
 	case F2FS_IOC_RELEASE_COMPRESS_BLOCKS:
 	case F2FS_IOC_RESERVE_COMPRESS_BLOCKS:
+	case F2FS_IOC_SEC_TRIM_FILE:
 		break;
 	default:
 		return -ENOIOCTLCMD;
-- 
2.27.0.278.ge193c7cf3a9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
