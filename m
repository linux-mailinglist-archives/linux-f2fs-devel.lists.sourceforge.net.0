Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1879B28C71C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Oct 2020 04:25:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kS9zl-0001Sa-Ez; Tue, 13 Oct 2020 02:24:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kS9zk-0001SP-6u
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 02:24:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s5asbHEXOVzz3KY0nwEzagtPhdb/NuvhbToUoYEnsfg=; b=Q0oMEFZB/UrE1NtNzeyyOIjef0
 xWhZhSggXaavY/Iiwpv1aLfE2hLtFMBE7LqM60BHvUXwkiIRL/Nx52/ckZMj6OIAes/BtItTZFTYS
 8DVSYOAY45PouqNEnkK+ZqwyqZAr/LmPazhzqfUJ58zzzKWIBTNon0v7nYTPBpfMaDIU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s5asbHEXOVzz3KY0nwEzagtPhdb/NuvhbToUoYEnsfg=; b=R
 edYXrtHSGSv7Byb9rISIP7d+OnfTRwCVg/wJQ/F+XY8z4v7P0Dmt0hQMFOJ1AbvVcBmYeAr0HpOT1
 Gxu/BWs9rrIWMHGaNMqVEFo5bIsw+08yKfpWg48shRUys2fZgEExlEftiJBjUSX/2ApSy5ZyqdeZ6
 rgLs8vd5fgmYCPrE=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kS9zZ-0089f1-Qk
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Oct 2020 02:24:56 +0000
Received: by mail-pg1-f195.google.com with SMTP id o3so6392332pgr.11
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Oct 2020 19:24:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5asbHEXOVzz3KY0nwEzagtPhdb/NuvhbToUoYEnsfg=;
 b=WkgVHQGOeM7r/o0qnnDRFFZnzNkzTsnpK+MIc3bNt/s2RdULSgIQA74WP6KBoPQlwD
 8hbEiqvcENmWYe51UJqlI4JuDQ/Di4InhZ7+mu6ye6wVuzrvUfJ3esRm5YuW1GdInWua
 XtSyOrCfEuZA6v5IYPhmYzEN+s9PmGcHPa0deTkiu986kHh9Pf7BbXdqG7Bu9N7cxEV0
 epNTn9K9osF9fjOXBRssQdhNxBprsaronaZ3Ddh4+hRtxES6kqjvNefH4mxp98QQGqzu
 mBgCFAZLwbbikuKRAtH4NQJdXJkHv0gGXoOzaKdxADoS9e4M/LBZQDFFi5mEelvf0PH/
 6ubw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s5asbHEXOVzz3KY0nwEzagtPhdb/NuvhbToUoYEnsfg=;
 b=mRd6X14CyHp246qnX8Lhkobiq16ED0Lkkkk+sTMbeRvI3BGmjPMw2Yls9BL8Hp5b3T
 h/hUgPw+hAVP8D13Rgxz/w9TpbbF7Ia/bzNzgx3f6KaMtRlvIbxWJIANyagJYehc1pSl
 xPOPCwXguUeCYjMnE4RQP9RLAHeSQzyvyxrKtlqRhUfyZvgtNcJrXDif785rSyrLzaeB
 GqFTmAUa9pM9+Xml3mmZlK8gzUD6ABzqHXcku+Yu9f6Blsj4wvmrB4Tijq1hR1QBFZa3
 e3V6++LayT45g+bzB1IIcrw/+dLE9uF2C3RQnitqzFK5oSy2Mmp8/3iCnmLuFV5NO8Cx
 oDNQ==
X-Gm-Message-State: AOAM533oYKKv2RkjuU38UOy2Lv9lVZUApH/YgrOHwgT9K775+mra0mYx
 e3E1oZ5ZAtd+twttMHrtxyk=
X-Google-Smtp-Source: ABdhPJx0t8zTOmfObjOqfTTfSf717fNFPX2PMEkJ9ekbnUlvasAMRR4wPqYuUdxrOAMqHwJUISqTXw==
X-Received: by 2002:a62:7cd4:0:b029:154:f9ee:320b with SMTP id
 x203-20020a627cd40000b0290154f9ee320bmr26690911pfc.26.1602555880156; 
 Mon, 12 Oct 2020 19:24:40 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id d194sm10581110pfd.172.2020.10.12.19.24.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Oct 2020 19:24:39 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 13 Oct 2020 11:24:28 +0900
Message-Id: <20201013022429.454161-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.28.0.1011.ga647a8990f-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.195 listed in wl.mailspike.net]
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
X-Headers-End: 1kS9zZ-0089f1-Qk
Subject: [f2fs-dev] [PATCH 1/2] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION ioctl
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

Signed-off-by: Daeho Jeong <daehojeong@google.com>
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
index ef5a844de53f..7e64259f6f5e 100644
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
+		return -EINVAL;
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
2.28.0.1011.ga647a8990f-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
