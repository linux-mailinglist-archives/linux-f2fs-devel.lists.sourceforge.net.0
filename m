Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A145BD97F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 20 Sep 2022 03:40:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaSFl-0007FK-MM;
	Tue, 20 Sep 2022 01:40:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oaSFk-0007FE-MK
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 01:40:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=z/jZBVKHrf7HtYZLUnYAd+Pe60b/PHa+auZtuaqhfT8=; b=O9DM8tdS8k7gAl4L4/JtUWBlir
 w46K7+WTZPpbu9NmX5xjKRO48k4aJd/isTj8NSQpF9z8xb0DaW/B3Jc5DzzNboQl189jnVGPa4Wwz
 nL4/XjY+0oEpKrWp5HVkonwc7Vx69KCA7w1W1wtPUJIJjC62CZvf+T2GBGffNV1sEfnc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=z/jZBVKHrf7HtYZLUnYAd+Pe60b/PHa+auZtuaqhfT8=; b=Q
 5/QgLWnkEF5/JzEYxfavQrqqHGQ8L3TngNSkYa15QfbE4gZ14kia+uENmvyGAbFsnJLxkW4W4VwQa
 a2pkp5Jb7Fm3zmoP8d+PURTyRVruU72TFRsYeSXhJHD9fBrX64FOcKbv3jMUWPrOAQFWlFocSBpPA
 o0HEA22ov1iI3ei4=;
Received: from mail-pj1-f50.google.com ([209.85.216.50])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oaSFi-00DwV8-Ja for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 20 Sep 2022 01:40:48 +0000
Received: by mail-pj1-f50.google.com with SMTP id fs14so1448589pjb.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 18:40:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=z/jZBVKHrf7HtYZLUnYAd+Pe60b/PHa+auZtuaqhfT8=;
 b=YfVBV3dzuD1D5wySYoRuLCSCFHAgvMu/0oUEoW8E5EGy1bi9bK/3Wo4IDRHrseDcDv
 W/BnA7LUSPjgN8CJQbNwANEPbw2Mmj8vPBXDDiYFm/y2fVdO1NjWULHz9+uLG7bSgK0W
 dE6UodGr9fxTNpSLBdsU+2gOHlLEH+yAW3ClkccRisO23vA0LoMFo3LbFc6lrN/zI8iF
 CRlFfRLPN/OGFDMO8qkoI1mqysNjROyiMxTAwFRkgCtAHHO5vl7Di03zcoLVmQKzUuhX
 ccya3Wf/L/Kf3h4H62q03Dtc37vCntslevOgjDV5k68MnZ0/WuhMMv4uZfPP9yjzB/ep
 Or0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=z/jZBVKHrf7HtYZLUnYAd+Pe60b/PHa+auZtuaqhfT8=;
 b=0H1bkHv9J/wshkjSwIZayy+VklEHHv8T8NEwEDZC2dWCJsThOeupwsTbXD+8cfB0Sp
 /gbOxui8jeBv2fJR+MNwFozKb8WcBOlDXq0uXB2tRhZUPNZ4cd7TdLmTvJ/2elBz64Mg
 a7unkzJDY7DZzJGThrwdygK2y1+ougk5df4F4OezIclSW2STmpKBpVS0u29fQNbZpF/5
 Wy/VMlvoN6xQgBrcLeTmP98jnl3UUvZ91vKwcPr2QufvpN9ERmxZhkaQ0FLmXVCN1Iov
 olEUn4EtMED6WVhZlp/z4yLL3+C/r6K6//OpXDbyDbKiJzo+yvoX1N6TEF33kHjbsftp
 zlgA==
X-Gm-Message-State: ACrzQf3Etik7h9gJK9Zr9kT5n+E1kcGOH2q7PzjX5eQ9QGau9uytN9ET
 C9WFoMno7hnaXb2G9coKDa3OwLeWhAg=
X-Google-Smtp-Source: AMsMyM6puk5qGOPpKHFJRYzBm3Kjz6m8fNSBs5uZYPPpy5nnA9/uOibSQbmN3KwPCAK1kEtTHF+hew==
X-Received: by 2002:a17:902:ab01:b0:178:fee:c607 with SMTP id
 ik1-20020a170902ab0100b001780feec607mr2497889plb.20.1663638041017; 
 Mon, 19 Sep 2022 18:40:41 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:720f:7de4:678:7fcb])
 by smtp.gmail.com with ESMTPSA id
 x7-20020a170902ec8700b00177e5d83d3esm62184plg.88.2022.09.19.18.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 18:40:40 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 19 Sep 2022 18:40:36 -0700
Message-Id: <20220920014036.2295853-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong introduce a new ioctl to replace the whole
 content of a file atomically, which means it induces truncate and content
 update at the same time. We can start it with F2FS_IOC_START_ATOMIC_REPLACE
 and com [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.50 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.50 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oaSFi-00DwV8-Ja
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE
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

introduce a new ioctl to replace the whole content of a file atomically,
which means it induces truncate and content update at the same time.
We can start it with F2FS_IOC_START_ATOMIC_REPLACE and complete it with
F2FS_IOC_COMMIT_ATOMIC_WRITE. Or abort it with
F2FS_IOC_ABORT_ATOMIC_WRITE.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: add undefined ioctl number reported by <lkp@intel.com>
---
 fs/f2fs/data.c            |  3 +++
 fs/f2fs/f2fs.h            |  1 +
 fs/f2fs/file.c            | 12 ++++++++++--
 fs/f2fs/segment.c         | 14 +++++++++++++-
 include/uapi/linux/f2fs.h |  1 +
 5 files changed, 28 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6cd29a575105..d3d32db3a25d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3438,6 +3438,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	else if (*blk_addr != NULL_ADDR)
 		return 0;
 
+	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
+		goto reserve_block;
+
 	/* Look for the block in the original inode */
 	err = __find_data_block(inode, index, &ori_blk_addr);
 	if (err)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 539da7f12cfc..2c49da12d6d8 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -764,6 +764,7 @@ enum {
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
+	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4f9b80c41b1e..4abd9d2a55b3 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1982,7 +1982,7 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
 	return put_user(inode->i_generation, (int __user *)arg);
 }
 
-static int f2fs_ioc_start_atomic_write(struct file *filp)
+static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 {
 	struct inode *inode = file_inode(filp);
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
@@ -2051,6 +2051,12 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	isize = i_size_read(inode);
 	fi->original_i_size = isize;
+	if (truncate) {
+		set_inode_flag(inode, FI_ATOMIC_REPLACE);
+		truncate_inode_pages_final(inode->i_mapping);
+		f2fs_i_size_write(inode, 0);
+		isize = 0;
+	}
 	f2fs_i_size_write(fi->cow_inode, isize);
 
 	spin_lock(&sbi->inode_lock[ATOMIC_FILE]);
@@ -4080,7 +4086,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
 	case FS_IOC_GETVERSION:
 		return f2fs_ioc_getversion(filp, arg);
 	case F2FS_IOC_START_ATOMIC_WRITE:
-		return f2fs_ioc_start_atomic_write(filp);
+		return f2fs_ioc_start_atomic_write(filp, false);
+	case F2FS_IOC_START_ATOMIC_REPLACE:
+		return f2fs_ioc_start_atomic_write(filp, true);
 	case F2FS_IOC_COMMIT_ATOMIC_WRITE:
 		return f2fs_ioc_commit_atomic_write(filp);
 	case F2FS_IOC_ABORT_ATOMIC_WRITE:
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 143b7ea0fb8e..c524538a9013 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -263,14 +263,26 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 					bool revoke)
 {
 	struct revoke_entry *cur, *tmp;
+	pgoff_t start_index = 0;
+	bool truncate = is_inode_flag_set(inode, FI_ATOMIC_REPLACE);
 
 	list_for_each_entry_safe(cur, tmp, head, list) {
-		if (revoke)
+		if (revoke) {
 			__replace_atomic_write_block(inode, cur->index,
 						cur->old_addr, NULL, true);
+		} else if (truncate) {
+			f2fs_truncate_hole(inode, start_index, cur->index);
+			start_index = cur->index + 1;
+		}
+
 		list_del(&cur->list);
 		kmem_cache_free(revoke_entry_slab, cur);
 	}
+
+	if (!revoke && truncate) {
+		f2fs_do_truncate_blocks(inode, start_index * PAGE_SIZE, false);
+		clear_inode_flag(inode, FI_ATOMIC_REPLACE);
+	}
 }
 
 static int __f2fs_commit_atomic_write(struct inode *inode)
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 3121d127d5aa..955d440be104 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -42,6 +42,7 @@
 						struct f2fs_comp_option)
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
+#define F2FS_IOC_START_ATOMIC_REPLACE	_IO(F2FS_IOCTL_MAGIC, 25)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.37.3.968.ga6b4b080e4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
