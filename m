Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E999B5BD1DA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 19 Sep 2022 18:07:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oaJIc-0008UZ-05;
	Mon, 19 Sep 2022 16:07:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1oaJIa-0008UO-OM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 16:07:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r8zfkAXa2GKKEYYW7+6/PELncFtCutbORvDm0JXbNZg=; b=SI3zzSWXTAVBZN8Giyp+gFrghq
 VVZ3l5jdAVS5Q27CRAM4HaY9+JEbfLd2NsmWQhZ542eV0YBep+hj444eaMhO4y55w3yhKYnWenAZJ
 iYUvhsY4DYJb8fYCNe+5EYRssNUHjgKc6jmYb6G939qVjESeHs7jYCvIBCo3yMRoBNfM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r8zfkAXa2GKKEYYW7+6/PELncFtCutbORvDm0JXbNZg=; b=ehSr8uJUPCtccguBOyr/1r/MfA
 Z4kg4+t2yrKxbRXJf+QHodE+ik6MztgeRT1JPMGgbuVxJ/oOuK6VH3dS+QQE3ul1KEyLE+wCILigp
 YoT00Y274MQqt+27Bma+Bf2pWN5nwZfgRzs8CfF6LU3cNszg9CFg18+xoNs5RsMyjoQI=;
Received: from mail-pg1-f177.google.com ([209.85.215.177])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1oaJIV-0003bj-GH for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 19 Sep 2022 16:07:08 +0000
Received: by mail-pg1-f177.google.com with SMTP id f193so2978071pgc.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 19 Sep 2022 09:07:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=r8zfkAXa2GKKEYYW7+6/PELncFtCutbORvDm0JXbNZg=;
 b=GHCWKl4bARlseA2oq7fLW35pCMM9MaQXNzIvvIIZoKX8SvZA8ioa8O434o+aMN9Tmh
 JPj3+MdwxY26UapozZAPsyuFC0nYaqHl6R0LJDuG8c4Spu6SFCijUWIvsNnscIxpOVTm
 MT39pWxbHx36DGUDccLknTYx+nMq/bSNEZXGaVqMg1byIF+jQ2ivjTpINTKCmr5uinUb
 0J5IOlSZHUe5+M0NHiNNqH75EM8edVbK5HibHRelfqGwk5rbm57x6ASJ9BDZXQDRdLuZ
 EMm17cHAPa2awyWRVawRSC0CZxmCcUVm9TCvc5NOuKiUI2GC3tGm0dtAFmewB0SMMxCk
 T0YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=r8zfkAXa2GKKEYYW7+6/PELncFtCutbORvDm0JXbNZg=;
 b=VlQKm7vYayZgUcqLvw1oiNQSoA5tdS9SjfRaJzgtv0MssAuthRl1mky+XPYzvhw9j7
 Zqbn4UyUWnyyEslIU93lmFb0KVtK4BtVN9IzC7J1dUG8VBmUtnNFxIGkX2aoRLaCvNtv
 bDbaHc3u3/sN4OIZn4dAQAzwKrQA82wOFfzZAnVDdKY//j8WUWD+B0SvEXqPA8MCOrjr
 uBUBx90pBcuVIdDmarE9xA3IqLDok1mVxjw/tWLRkkhin93WcaYMreIFjeOewO+kMMyo
 QrGPO6umdPmZwKtA1Qlnz+Kf7ToRdBucq0vSAUdWjZYGu14yOl4aj7e0uZbjnXiVG9L8
 stcg==
X-Gm-Message-State: ACrzQf03gi3jGxQZlcQZkR8xge9ZtQzw64e3QJO4IbfxEQGB0th/N3LA
 koNwVBxyw/QcLQD96P/dObY=
X-Google-Smtp-Source: AMsMyM4kX3o1Gm3DmW8VhCSdr/ZXcH7nbxczW6ZZB54aj1UNhHaQxTJf60gB0Ygg8eYstnMxfPRwVA==
X-Received: by 2002:a63:e118:0:b0:438:7603:8d6e with SMTP id
 z24-20020a63e118000000b0043876038d6emr16504079pgh.72.1663603617870; 
 Mon, 19 Sep 2022 09:06:57 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:8958:94cc:1777:6efd])
 by smtp.gmail.com with ESMTPSA id
 4-20020a631944000000b00419b66846fcsm18667682pgz.91.2022.09.19.09.06.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Sep 2022 09:06:57 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon, 19 Sep 2022 09:06:44 -0700
Message-Id: <20220919160644.2219088-2-daeho43@gmail.com>
X-Mailer: git-send-email 2.37.3.968.ga6b4b080e4-goog
In-Reply-To: <20220919160644.2219088-1-daeho43@gmail.com>
References: <20220919160644.2219088-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.177 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.177 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1oaJIV-0003bj-GH
Subject: [f2fs-dev] [PATCH 2/2] f2fs: introduce F2FS_IOC_START_ATOMIC_REPLACE
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
 fs/f2fs/data.c            |  3 +++
 fs/f2fs/f2fs.h            |  1 +
 fs/f2fs/file.c            | 12 ++++++++++--
 fs/f2fs/segment.c         | 14 +++++++++++++-
 include/uapi/linux/f2fs.h |  2 ++
 5 files changed, 29 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6cd29a575105..eef798b3e941 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3438,6 +3438,9 @@ static int prepare_atomic_write_begin(struct f2fs_sb_info *sbi,
 	else if (*blk_addr != NULL_ADDR)
 		return 0;
 
+	if (is_inode_flag_set(inode, FI_ATOMIC_TRUNCATED))
+		goto reserve_block;
+
 	/* Look for the block in the original inode */
 	err = __find_data_block(inode, index, &ori_blk_addr);
 	if (err)
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 539da7f12cfc..79e7bed009bc 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -764,6 +764,7 @@ enum {
 	FI_COMPRESS_RELEASED,	/* compressed blocks were released */
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
+	FI_ATOMIC_TRUNCATED,	/* indicate truncated atomic write */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4f9b80c41b1e..905810c62d47 100644
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
+		set_inode_flag(inode, FI_ATOMIC_TRUNCATED);
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
index 143b7ea0fb8e..18aeec957ec9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -263,14 +263,26 @@ static void __complete_revoke_list(struct inode *inode, struct list_head *head,
 					bool revoke)
 {
 	struct revoke_entry *cur, *tmp;
+	pgoff_t start_index = 0;
+	bool truncate = is_inode_flag_set(inode, FI_ATOMIC_TRUNCATED);
 
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
+		clear_inode_flag(inode, FI_ATOMIC_TRUNCATED);
+	}
 }
 
 static int __f2fs_commit_atomic_write(struct inode *inode)
diff --git a/include/uapi/linux/f2fs.h b/include/uapi/linux/f2fs.h
index 3121d127d5aa..224d98731f22 100644
--- a/include/uapi/linux/f2fs.h
+++ b/include/uapi/linux/f2fs.h
@@ -42,6 +42,8 @@
 						struct f2fs_comp_option)
 #define F2FS_IOC_DECOMPRESS_FILE	_IO(F2FS_IOCTL_MAGIC, 23)
 #define F2FS_IOC_COMPRESS_FILE		_IO(F2FS_IOCTL_MAGIC, 24)
+#define F2FS_IOC_START_TRUNC_ATOMIC_WRITE				\
+					_IO(F2FS_IOCTL_MAGIC, 25)
 
 /*
  * should be same as XFS_IOC_GOINGDOWN.
-- 
2.37.3.968.ga6b4b080e4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
