Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B768F8CDC17
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 23 May 2024 23:28:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sAFys-0006dX-Vm;
	Thu, 23 May 2024 21:28:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3NLNPZgYKABMwA7Bx6z77z4x.v75@flex--drosen.bounces.google.com>)
 id 1sAFyr-0006dI-M9 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 21:28:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mp+obKuKF8ZV1nddH/uj38nuZGLM9hBpS0yCFoNPV1U=; b=NQz86gE5ObygIo3mbnyQNuCEP6
 gdO51+O1NjkbGR0IG0IN532+X++OiXC6YMCZpQsV0V1MIoG0g3fyIVDrzszFQAYjz/sEIfGrYuvFh
 6vMARoZsRWIxU8ONjLomTQnUWGvehROuP/5n6q+gJO/Aw7CuVICCwotWNfo2sClh4omw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Mp+obKuKF8ZV1nddH/uj38nuZGLM9hBpS0yCFoNPV1U=; b=Xv+nfwn+FaY6W1cTSA/daLHmrG
 XNWf2ZnVCeWv6FcM17dBHqjN2rDBeAWcjg/Cfvow93fuvJ3VVZELCxWgA0LKdRYMH15lIajPdrS/W
 CxS1XQYjfk36kpIMcoAqfVjrR9wIc7jnjjfmLgxYChF3FUmpE3JtAlpns/B6bzrhhS28=;
Received: from mail-qk1-f202.google.com ([209.85.222.202])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sAFyr-00023u-W5 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 21:28:09 +0000
Received: by mail-qk1-f202.google.com with SMTP id
 af79cd13be357-794aaf57a38so21492785a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 14:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716499683; x=1717104483;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=Mp+obKuKF8ZV1nddH/uj38nuZGLM9hBpS0yCFoNPV1U=;
 b=Xqpq0O/MSWx7xtaRXnjfGj4IRExI6Sksdkr0YnzLT0OP3Ec2O+1u0/7TrT5KOaRki6
 jSFKb4SyQFNfXx0ohCRIo56IrFBzehvQYSBBTBIgPhBNyO7usYtAXaXt1CnJER1BejT/
 x6CRPYtBGlEioHs/Ig3hKCm/uEdwha1Zq3QIXFX89/034LB0WbcBw/QsPH+RN8vliFXM
 zoNId4Tx+kU0bJQSXAy5BhipTo12muKku737fvW1Lepz1JH0F4JVWl9SUrBRfEeDlu8M
 2F0T5W3jJgLSfPm1vHWY1lwYSfpsn2rxPfmQn0GeAqx4OPpR1gf4q2nAmx0C7utN/UoB
 vKrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716499683; x=1717104483;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Mp+obKuKF8ZV1nddH/uj38nuZGLM9hBpS0yCFoNPV1U=;
 b=MJcErPywG1T5syxv7r0hQPyQZzm8s4avxQCNHEfEH6nRQbNbrZzwhHArHabpXI7qS8
 OgE9+YvzHYn8xK5MxgKuJAeKlzkofExS8FcjrmrS4kWhYVIYMwWgppckNh/Ybtczxe8K
 SVLTL5ktd/vXHW9rXhOytpjdYSuA1pDoknQQVIM3sLM9Jmk7knMJeLtQQTzJT39PvU8g
 x3W7b/EaiLa0/pqzxNyoSus+x8rPtE0fcHIc3Qr2ZD2GX0SSVkQ3wHpyKXgXsrA+ax5Z
 /IQcH4oEnoAzPITwnnM718c0/q/3cCGIiQ+EzFYqs1Kql5Vg/lWuwZ222myDQnA/JUfR
 7shw==
X-Gm-Message-State: AOJu0YwPg+8j/NR1d0pJbdOXRNw8KXT8/NvqSeqJVbp/wRsqyTY3Vk90
 3PMs3AWLt4MHuiugWfZo7PJwE8pCj3fcqGEdJDNesp4ddtAUDsJMmrVo11k4hLAQ+T302htcqvu
 wP/jmjDzhmdCgsfASJQWNpApkcsohLZL2nlGciH47brGJ7uRM13dPjWzQVE696R77LZj5ZwNsQi
 Ok0NGgeJleyNPnUSdh6/YGvRRIthXq70A2KuwcObLYFxlVLhA7ZePBBg==
X-Google-Smtp-Source: AGHT+IEftHJ+hSe5/LH53aa44DP+zumTPQ0k+PAFnzrBoiIjyD8qdpbhMX0Sw0e9Mh5HSKuzKb2GwVvaMNU=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:a8c9:5272:5c18:de65])
 (user=drosen job=sendgmr) by 2002:a05:6902:2b12:b0:de5:3003:4b64 with SMTP id
 3f1490d57ef6-df772149c96mr39114276.1.1716499252810; Thu, 23 May 2024 14:20:52
 -0700 (PDT)
Date: Thu, 23 May 2024 14:20:32 -0700
In-Reply-To: <20240523212032.137615-1-drosen@google.com>
Mime-Version: 1.0
References: <20240523212032.137615-1-drosen@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240523212032.137615-2-drosen@google.com>
To: linux-f2fs-devel@lists.sourceforge.net
X-Spam-Score: -7.7 (-------)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Xattrs for files with inline data were being skipped. This
 dumps those, as well as xattrs for folders. Signed-off-by: Daniel Rosenberg
 <drosen@google.com> Reviewed-by: Daeho Jeong <daehojeong@google.com> ---
 fsck/dump.c | 39 +++++++++++++++++++++++++++ 1 file changed, 27 insertions(+), 
 12 d [...] 
 Content analysis details:   (-7.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM
 welcome-list
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.202 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sAFyr-00023u-W5
Subject: [f2fs-dev] [PATCH v3 2/2] dump.f2fs: Fix xattr dumping
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
From: Daniel Rosenberg via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Daniel Rosenberg <drosen@google.com>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, kernel-team@android.com,
 Daeho Jeong <daehojeong@google.com>, Daniel Rosenberg <drosen@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Xattrs for files with inline data were being skipped. This dumps those,
as well as xattrs for folders.

Signed-off-by: Daniel Rosenberg <drosen@google.com>
Reviewed-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/dump.c | 39 +++++++++++++++++++++++++++------------
 1 file changed, 27 insertions(+), 12 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 1a733f8..dd5a02f 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -377,7 +377,7 @@ static void dump_node_blk(struct f2fs_sb_info *sbi, int ntype,
 }
 
 #ifdef HAVE_FSETXATTR
-static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
+static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk, int is_dir)
 {
 	void *xattr;
 	void *last_base_addr;
@@ -431,12 +431,24 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 
 		DBG(1, "fd %d xattr_name %s\n", c.dump_fd, xattr_name);
 #if defined(__linux__)
-		ret = fsetxattr(c.dump_fd, xattr_name, value,
-				le16_to_cpu(ent->e_value_size), 0);
+		if (is_dir) {
+			ret = setxattr(".", xattr_name, value,
+							le16_to_cpu(ent->e_value_size), 0);
+		} else {
+			ret = fsetxattr(c.dump_fd, xattr_name, value,
+							le16_to_cpu(ent->e_value_size), 0);
+		}
+
 #elif defined(__APPLE__)
-		ret = fsetxattr(c.dump_fd, xattr_name, value,
-				le16_to_cpu(ent->e_value_size), 0,
-				XATTR_CREATE);
+		if (is_dir) {
+			ret = setxattr(".", xattr_name, value,
+					le16_to_cpu(ent->e_value_size), 0,
+					XATTR_CREATE);
+		} else {
+			ret = fsetxattr(c.dump_fd, xattr_name, value,
+					le16_to_cpu(ent->e_value_size), 0,
+					XATTR_CREATE);
+		}
 #endif
 		if (ret)
 			MSG(0, "XATTR index 0x%x set xattr failed error %d\n",
@@ -449,7 +461,7 @@ static void dump_xattr(struct f2fs_sb_info *sbi, struct f2fs_node *node_blk)
 }
 #else
 static void dump_xattr(struct f2fs_sb_info *UNUSED(sbi),
-				struct f2fs_node *UNUSED(node_blk))
+				struct f2fs_node *UNUSED(node_blk), int UNUSED(is_dir))
 {
 	MSG(0, "XATTR does not support\n");
 }
@@ -462,13 +474,15 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	u64 ofs = 0;
 	u32 addr_per_block;
 	bool is_dir = S_ISDIR(le16_to_cpu(node_blk->i.i_mode));
+	int ret = 0;
 
 	if ((node_blk->i.i_inline & F2FS_INLINE_DATA)) {
 		DBG(3, "ino[0x%x] has inline data!\n", nid);
 		/* recover from inline data */
 		dev_write_dump(((unsigned char *)node_blk) + INLINE_DATA_OFFSET,
 						0, MAX_INLINE_DATA(node_blk));
-		return -1;
+		ret = -1;
+		goto dump_xattr;
 	}
 
 	if ((node_blk->i.i_inline & F2FS_INLINE_DENTRY)) {
@@ -480,7 +494,8 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 		DBG(3, "ino[0x%x] has inline dentries!\n", nid);
 		/* recover from inline dentry */
 		dump_folder_contents(sbi, d.bitmap, d.dentry, d.filename, d.max);
-		return -1;
+		ret = -1;
+		goto dump_xattr;
 	}
 
 	c.show_file_map_max_offset = f2fs_max_file_offset(&node_blk->i);
@@ -516,9 +531,9 @@ static int dump_inode_blk(struct f2fs_sb_info *sbi, u32 nid,
 	}
 	/* last block in extent cache */
 	print_extent(true);
-
-	dump_xattr(sbi, node_blk);
-	return 0;
+dump_xattr:
+	dump_xattr(sbi, node_blk, is_dir);
+	return ret;
 }
 
 static void dump_file(struct f2fs_sb_info *sbi, struct node_info *ni,
-- 
2.45.1.288.g0e0cd299f1-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
