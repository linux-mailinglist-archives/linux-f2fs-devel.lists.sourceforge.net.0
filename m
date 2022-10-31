Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EEFB613E2C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 31 Oct 2022 20:24:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1opaOj-0001If-8W;
	Mon, 31 Oct 2022 19:24:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1opaOh-0001IZ-OL
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 19:24:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=es/0kWvvQxEpWUALVTo4G3gGn6qEo4PAzN7S5DlZtZc=; b=gftYB1IkF/FZkey+GEWGB5DyIV
 sWNtFt/T/mxyZSsV9EJJ3QRF1D20oTw0gLpZ/45TCEnwtOcVd+WzZCTS24Hq6GepBu4qX04cssQP5
 4BYbBUXfHmve1b5oQ8mxTkJg0yPK15XwXM1wNyfTAPdKkESnkRqIBe+erpvWITHsQhUA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=es/0kWvvQxEpWUALVTo4G3gGn6qEo4PAzN7S5DlZtZc=; b=grT6I+lnmRoLaCxiCOm1WW7wh3
 DW2jVAkOD6YD+eu7pAd0aZ0kH3ckpVriOudJs4LdyTPj5Hf/wpnIslEy/MHUZ/BgmcANkw6ARDQxy
 xqDhe0ls/M4O+jGH0fDmU56IuzQkzBXYVjQqdMS6JEoDBNKJwE7RExSpIfCqwSp85jXw=;
Received: from mail-pg1-f178.google.com ([209.85.215.178])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1opaOc-0001jj-GZ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 31 Oct 2022 19:24:35 +0000
Received: by mail-pg1-f178.google.com with SMTP id g129so11532627pgc.7
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 31 Oct 2022 12:24:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=es/0kWvvQxEpWUALVTo4G3gGn6qEo4PAzN7S5DlZtZc=;
 b=NzFvo3fTSk/jdPwbm7bOJ99+KIFmYROJ9EOzeCc6qjy0CQCXx9RXavb4qDZIKFfgQV
 uDA/PNGEHbwhjR6zdtzuhq8PmIBebvcCOudD09W7Iukh5d7GbFOjivEK2Qxere6J/VPc
 WejJk13gNI5hFc8jgdjTZaI0Dd/GbagbVkKx5KwptxQtTmbIlD9BqswfUTPskbBLmJwh
 CjO/cjoZZeb5zl0yT2VKCLRzkbXZexxuGJLRw3pM6G/GtNkJlFpKPJb1kg11dMGUL8Ha
 hxucXzQAojJcJqqh2679+Tteo9hi5UagfDl1QhU7j4eIyHHO7p8ZQOApvMuKAIVNQ0HA
 z9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=es/0kWvvQxEpWUALVTo4G3gGn6qEo4PAzN7S5DlZtZc=;
 b=dw1YBAVou6o/ww1JiW7T53ZLOHDa1ezylaRRP8B6G2PV6z8UKC02yNODx2iKSqgRpS
 BIzUgWx8fymySBDv86jdPVIQk23Zquqb4YuY/YI5jMdAfKAmSt5c2oyi403rpd+uoyyk
 paU9fZQAyqDFQqdoqWcwdFvcPxEDZO6+J/WtM+wuFoaBmtGO3a0nFsFkGOrVrabZ1vkd
 Q8ldRB0u2h5B5FeTCdJVOvMvPD4kHY2khbTZVBH2pS/yRnYlRpnJmhTbivxZ6GGtrNO8
 sx+nhHgjBzFmoAu8plWoH5TwGk4g6Ml9u11p6dZH07cD3f41ClHcrW8bIp84Mcl5dOsl
 dooA==
X-Gm-Message-State: ACrzQf3Uln3PtmgIktn7Wn94GLPmTLI2dLiIM30IIk+Ro/iIv6VDrB/J
 FTMegLq7xGvvUhUsSm+3Rd0=
X-Google-Smtp-Source: AMsMyM7jVdA9xD4GBwm93f9Y8o6pYjy0rhZWd/Htp/CAcygwG1AHLNPs8cefLPsJUpApg+3yz/zlrg==
X-Received: by 2002:a65:58cf:0:b0:46f:ba32:2eb9 with SMTP id
 e15-20020a6558cf000000b0046fba322eb9mr6960074pgu.590.1667244264833; 
 Mon, 31 Oct 2022 12:24:24 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:769d:1a73:1fb:944e])
 by smtp.gmail.com with ESMTPSA id
 r11-20020aa7988b000000b0056babe4fb8asm4950466pfl.49.2022.10.31.12.24.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 31 Oct 2022 12:24:24 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 31 Oct 2022 12:24:16 -0700
Message-Id: <20221031192416.32917-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.38.1.273.g43a17bfeac-goog
In-Reply-To: <20221031192416.32917-1-daeho43@gmail.com>
References: <20221031192416.32917-1-daeho43@gmail.com>
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
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.178 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.178 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1opaOc-0001jj-GZ
Subject: [f2fs-dev] [PATCH v6 2/2] f2fs: introduce
 F2FS_IOC_START_ATOMIC_REPLACE
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
v3: move i_size change after setting atomic write flag
v2: add undefined ioctl number reported by <lkp@intel.com>
---
 fs/f2fs/data.c            |  3 +++
 fs/f2fs/f2fs.h            |  1 +
 fs/f2fs/file.c            | 20 ++++++++++++++------
 fs/f2fs/segment.c         | 14 +++++++++++++-
 include/uapi/linux/f2fs.h |  1 +
 5 files changed, 32 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5f895ddcd64a..bce4dcc3ad78 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3457,6 +3457,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	else if (*blk_addr != NULL_ADDR)
 		return 0;
 
+	if (is_inode_flag_set(inode, FI_ATOMIC_REPLACE))
+		goto reserve_block;
+
 	/* Look for the block in the original inode */
 	err = __find_data_block(inode, index, &ori_blk_addr);
 	if (err)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e29f9adf60ca..d513ecd17550 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -765,6 +765,7 @@ enum {
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
 	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
+	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 7ce629c95f4a..7b2d956bc52f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1984,7 +1984,7 @@ static int f2fs_ioc_getversion(struct file *filp, unsigned long arg)
 	return put_user(inode->i_generation, (int __user *)arg);
 }
 
-static int f2fs_ioc_start_atomic_write(struct file *filp)
+static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 {
 	struct inode *inode = file_inode(filp);
 	struct user_namespace *mnt_userns = file_mnt_user_ns(filp);
@@ -2053,10 +2053,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 
 	f2fs_write_inode(inode, NULL);
 
-	isize = i_size_read(inode);
-	fi->original_i_size = isize;
-	f2fs_i_size_write(fi->cow_inode, isize);
-
 	stat_inc_atomic_inode(inode);
 
 	set_inode_flag(inode, FI_ATOMIC_FILE);
@@ -2064,6 +2060,16 @@ static int f2fs_ioc_start_atomic_write(struct file *filp)
 	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 	f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
 
+	isize = i_size_read(inode);
+	fi->original_i_size = isize;
+	if (truncate) {
+		set_inode_flag(inode, FI_ATOMIC_REPLACE);
+		truncate_inode_pages_final(inode->i_mapping);
+		f2fs_i_size_write(inode, 0);
+		isize = 0;
+	}
+	f2fs_i_size_write(fi->cow_inode, isize);
+
 	f2fs_update_time(sbi, REQ_TIME);
 	fi->atomic_write_task = current;
 	stat_update_max_atomic_write(inode);
@@ -4089,7 +4095,9 @@ static long __f2fs_ioctl(struct file *filp, unsigned int cmd, unsigned long arg)
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
index 9cbf88092c78..7f62118cbe6e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -261,14 +261,26 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
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
2.38.1.273.g43a17bfeac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
