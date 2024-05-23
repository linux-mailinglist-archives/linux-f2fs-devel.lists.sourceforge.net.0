Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E11B8CDCF7
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 May 2024 00:47:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sAHDO-0004Au-9L;
	Thu, 23 May 2024 22:47:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <3asdPZgYKAHESgdhTcVddVaT.Rdb@flex--drosen.bounces.google.com>)
 id 1sAHDN-0004Ao-2Q for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 22:47:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Message-ID:
 References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=tYSWFZlsHPFH8fDa5o3xDdSuHwsfIEAIGI4hrt6rJok=; b=ITHsdAs4uG/NgAJYq7blZvLuy7
 S/vreaRc/qH4FcHK1ibDEPicK8TGjlTkrxqwFyJMV6ELEsORQ5uq0M4rR9JN0NyFngiPHwrWaAEAK
 t2dcZc9q07Ncrx1Cjb+CGqy29q74OefV3UlK3MvQFZ2tg5Uk7uW9SASYmTnb5o/q1Ufg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Message-ID:References:Mime-Version:
 In-Reply-To:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=tYSWFZlsHPFH8fDa5o3xDdSuHwsfIEAIGI4hrt6rJok=; b=EK5k3eUF5Ay9uMCRJ8SOYf2heW
 guIe+9PcdrKsNt4L3a3sn7DO485MaqCb0qxMU4bQoSv9Qos0tOlcsKWGgC9jnhHprAxWuvFkJlGyL
 J7B6IqOKDhxz1gprqGseiRYl63Bf+9lrPRwDo2kz8S2ClUhu70rE+x2diDnsqXHeeels=;
Received: from mail-yw1-f201.google.com ([209.85.128.201])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sAHDN-0005je-Eu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 23 May 2024 22:47:13 +0000
Received: by mail-yw1-f201.google.com with SMTP id
 00721157ae682-627e4afa326so46333747b3.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 23 May 2024 15:47:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1716504427; x=1717109227;
 darn=lists.sourceforge.net; 
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:from:to:cc:subject:date:message-id:reply-to;
 bh=tYSWFZlsHPFH8fDa5o3xDdSuHwsfIEAIGI4hrt6rJok=;
 b=NDG2Y+1ofUj423p7yhyGygczN6gnhf8Ed4L5q9g8C4eV5wF4vF2KTrc46cuwdJ1KM9
 cYyhm6ZhOdvO0nLfbgf1m/O6maS6Tp5BcfY5o6JYH4M0P+3e0PlERBv6Bn3G6EDKGBPb
 pTaWmq+1P2+m5MR4E2cvz0hqqobU5978LebdbTcXjtc+VoYfo76ysneYd1FwGfa/Om8o
 wZGeZkRs11/qaTaDKZkJkVRKnwRTFgafOG48/BwclV6DC9qvFm6PmHUtDV6VRwGzUF8w
 2sd6S0Hfp/QocTUmqSK1OxvF2iJg37/m9Edlo/Y1Yw/in9VCKPtrDiIGizv2fzkOKEn2
 6QFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716504427; x=1717109227;
 h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
 :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=tYSWFZlsHPFH8fDa5o3xDdSuHwsfIEAIGI4hrt6rJok=;
 b=iAyR92Zs8CwFQ4VkpZ8z1DIf9R3Npf9qBzRjVTSKtvm7SISoXexZeSt0kuBpspjzWK
 O69J/DR0QFO3TAntuLVzn5T35aCXYRXJJJEoyGRDOLYXfBRt44a4FUlQJllGYQXzU817
 3O0vMl2H4iinhfxr5ysz1wYen6GSk5jccW0/8s+4B4xI2pi1sSwS7CzbpnDPmTAoa0Q2
 Gy6xWuOvI7DHavAr5tJy1acyQVyg2VMAsbhyntz09fknDmJJdsG5XsMaSBV3xBy7oE+O
 5OcqRUC+NwEhHREpWRwk0Xhwt7u84anELs1c0/LSTS5h2hfnmBkmBySij9aevnSUt3x5
 HdPQ==
X-Gm-Message-State: AOJu0YzBoYpoLv8TRZ7AHUEMOnvQpwiZBswBD5LwG1xOQyLrGykXoMVl
 HBiovVjxcfu87etQNKkG3YllR0JHH3qRZ2p3pUCe3vAJCss77vFfffgTyhJzKDu+52lOVyN1OV1
 SPS4LVUXnOCXzs6MfSkl63lAdmNV7vX7EqEoJeo6tSB/YSpR1qvQAvMYyaGmCFPDxVkPIQhC3gh
 doSK8xt5FFHW3IphP86Tk51F4Viu0dbLwF2DUUJT6R4D9kZ+UGUhV1yA==
X-Google-Smtp-Source: AGHT+IGJA3hwWZEopZSNPZUKF3ShgtMf2na7OvtKvEeynJiD3vZcQ6dI/j2+8wByqLpwttI7k/CMVOL/IxY=
X-Received: from drosen.mtv.corp.google.com
 ([2620:15c:211:201:3506:bc94:4f44:4a86])
 (user=drosen job=sendgmr) by 2002:a05:690c:25c8:b0:61b:e103:804d with SMTP id
 00721157ae682-62a08b258a8mr1273797b3.0.1716504426804; Thu, 23 May 2024
 15:47:06 -0700 (PDT)
Date: Thu, 23 May 2024 15:47:00 -0700
In-Reply-To: <20240523224700.265251-1-drosen@google.com>
Mime-Version: 1.0
References: <20240523224700.265251-1-drosen@google.com>
X-Mailer: git-send-email 2.45.1.288.g0e0cd299f1-goog
Message-ID: <20240523224700.265251-2-drosen@google.com>
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
 [209.85.128.201 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.128.201 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1sAHDN-0005je-Eu
Subject: [f2fs-dev] [PATCH v4 2/2] dump.f2fs: Fix xattr dumping
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
index fa68456..90e3e0e 100644
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
