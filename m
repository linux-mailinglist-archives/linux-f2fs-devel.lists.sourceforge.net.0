Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CDB729861F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Oct 2020 05:17:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kWtwh-00078U-2M; Mon, 26 Oct 2020 04:17:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1kWtwg-00078M-Dk
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 04:17:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TgJnVhZ++DLjTZN2JC7MwIDGm1rQwn+cwIsU1CQlwyM=; b=fDY9XyNR1MMpk/5++zwdCMaPbr
 yh1+oiKSkqwdw5HBu0wZiaz94wR8ZvaJetxbjD3TjPSrL/L+zoFhsmemAjB21dj+PhFVb7Sws3gtX
 4j+sg2q0tGowtFM6lyFljpHb2oQTclAYn6ld6YmsH7VqohQOkjgQz8TqLJTiTY1qluIQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TgJnVhZ++DLjTZN2JC7MwIDGm1rQwn+cwIsU1CQlwyM=; b=N
 631Uj+10Xe1XbyNMLbHpg4LCTkxl/od/cNzQS3T0j4TrjhFN5ckK1Dwl+faatgb0DasN1IO9k/oBc
 J0NanKO9u+3Fm8t0vXptZnf47F6QytK36mVP3LFVK+bUquOwQI8Hq8LkCMqPm3QjDFnJj/bGH5BlV
 LS82rLq+dRQEkTsk=;
Received: from mail-pf1-f195.google.com ([209.85.210.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kWtwW-00Dl1K-Tg
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 26 Oct 2020 04:17:22 +0000
Received: by mail-pf1-f195.google.com with SMTP id e15so5481395pfh.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 25 Oct 2020 21:17:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgJnVhZ++DLjTZN2JC7MwIDGm1rQwn+cwIsU1CQlwyM=;
 b=UhZECgGbXap75eC+90RNG+ayMieTzqzLAxsgnvjP/BXWrZWPtXHQlqCH8qy4FKnpYP
 9ny4zO2unSSfxqUxwhO5L09yKPMJraJtuMeWRy8DQahJ1htARl0DhsQgmDXtvs/yekQz
 lM7I1J0dMg6kmExe7ugMSASqC/xrD6BqY8oVTB8lAMepHED4MppbwCj7TGYYNOUWpJHr
 7CmSkzvCpovxLCQAUnFqnfXholQtnBWMsWkBBtrbz9wRjKRi0rHl7uE6QrVWAtcq5bXY
 Ez6eKc4NLe+gP2r+5BDbPKsdlXV7ufQKIumLACbfUExrDXq8LJw5noxpbRuZe3lWkhnU
 l5+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TgJnVhZ++DLjTZN2JC7MwIDGm1rQwn+cwIsU1CQlwyM=;
 b=QiHtzEKtxD7L4GvGj24HVHeaH2uO7TCLxdFYAyJpZwfzwsbCWuPcJRxJCe/Z1UFmb5
 JiwAXzlrh45XGWA7zJE5CTdUQ+dpx1cQLMzxXfeybJeekqYpgn4iQzPatmUtRXtdTs1z
 PzPdE4NZYs9O5MDTGlRn4Xjom3htpnFPD9AVMtYxt/rOTUNNfYj3n5O/4CuzeJ+qbtF2
 wwsRK6T9612I6UZsYUa5TMXcFbqtM5cyF3vdVgS8BArTzjGZhScVj4UuE79mzmAhasqY
 CN9ARPyu18zlpZdgUGoEZeHolvdxkNNcClTqqrtaQeoHH4NBRcV8G/mGmL0NoesBAWb2
 0URg==
X-Gm-Message-State: AOAM530CEZBakRSQfV+3ycWEkWpmbRF/hXadIKq34CkH7r2icyvZclC2
 GqQMg3uAjG6Wlm1t0tQACNI=
X-Google-Smtp-Source: ABdhPJwI+ywh+mS+mgkh5h/tjgWrBuqpNGniIBdB8tSsk839l0YQL1c30rwkC/PcrkjxSlrvHoLWsQ==
X-Received: by 2002:a63:f40a:: with SMTP id g10mr12532875pgi.66.1603685827217; 
 Sun, 25 Oct 2020 21:17:07 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:11:a6ae:11ff:fe18:6ce2])
 by smtp.gmail.com with ESMTPSA id b20sm10030627pft.55.2020.10.25.21.17.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Oct 2020 21:17:06 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 26 Oct 2020 13:16:55 +0900
Message-Id: <20201026041656.2785980-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.29.0.rc1.297.gfa9743e501-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.195 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.195 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kWtwW-00Dl1K-Tg
Subject: [f2fs-dev] [PATCH v3 1/2] f2fs: add F2FS_IOC_GET_COMPRESS_OPTION
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
Cc: Eric Biggers <ebiggers@kernel.org>, Daeho Jeong <daehojeong@google.com>
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
Reviewed-by: Eric Biggers <ebiggers@kernel.org>
---

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
2.29.0.rc1.297.gfa9743e501-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
