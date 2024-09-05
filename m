Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 05CF696E4F1
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  5 Sep 2024 23:20:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1smJu3-0008Gx-So;
	Thu, 05 Sep 2024 21:20:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1smJu3-0008Gr-0f
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 21:20:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=EICMtzmuDmx4azx6nqR/Lg9QE5oH8hihUYWRQitwd5A=; b=ZZ21LAfaTAi4cOB7pfdpkGmP0k
 Z2NBv2b/TntxcDiB1yooYplV2Vvl8HNphNBIdxK74t4RRDCqTEi3drh8IRdHpH6SVOOp/9HbUXMAz
 FSG5aeW7yMpCHLCPOiDzvLq9AO5MFShxKBTZqhtpfl2frp+qVhXD9tIQ+uxdr6GVhWII=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=EICMtzmuDmx4azx6nqR/Lg9QE5oH8hihUYWRQitwd5A=; b=c
 HcZEn4cvWSE2JTzcW3krkg7ltlM4S/anX5raCucZAkmqYMXbP/gfwJ2yxIB82e/wgKKpr3ozny4PU
 R/rGGB6WYHprB88j1sD6yLeZjVdRtgDmPaE0NfiPhLxBHot7lE9ST/8kC5AJ/dHrg5XEM2Dr8Q8Wv
 eC2seS8c7ljfUUG4=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1smJu2-0001hf-9U for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Sep 2024 21:20:30 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-71788bfe60eso1094596b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 05 Sep 2024 14:20:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1725571219; x=1726176019; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=EICMtzmuDmx4azx6nqR/Lg9QE5oH8hihUYWRQitwd5A=;
 b=ZbcDgeV2j2h2p2/0or7s9ln0oGVksJ0A3g5WHBEqak4mZU+DYk0mnAZOAbm0XGspa6
 P9TNwHOEynDgK+SepE9hhH17jBBxR77M1Vxk6NfSLgqLBLg6ChfWnuejNKGCImP4WjHL
 G/pYZh8ApIdE35kLIFZfpDlFi6m/Q0X4Cnm6XbLB+CNDUB4d/HbxqomJo+LtDbRS9EFA
 6BkTJKHm8Bes+xCt092fk+JErFBb7j7smLPkqBmqJoHTLOF51uqPmCNhngCYzkPzQ12c
 Sy0b8Xf75Q+O+HdK6XnQzueEe9NbJdfj7pZm3RPporzqhOW5hU+/TdfWwgR8pfghcMpF
 o5jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725571219; x=1726176019;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=EICMtzmuDmx4azx6nqR/Lg9QE5oH8hihUYWRQitwd5A=;
 b=ryP8vMcMRz3196rP+HMdfnuwLjsQh7urQGvadY3w4H59FFh6JYKAwiY3TtRn3NxUo9
 AtCjm8yJv4TyISM6+2ZXaH+OTesXBYCcmU4DF2ROxZH7PmmgbYrnUyglnEM4roG0BCyN
 ActXtOAWNKOI/J5uF52wr0z5Six8r3XEz730tLMAboKQwjCEFht4UYw8UwaeP0F0hZlX
 hb7M1worhw3AH6W/XBFjec/eDhoXCTvIbEi3KxNq8dujNvWgVkCsXww8DblmypUZe3Ah
 lCmMEX2rVfwr9g5K/bH8XR8flBsUXjRcv4RfNbiuBGXqMlj17cdG1pNjDseQyVT+BAJI
 M98Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPwzx63SL6h+mG/fMzlcv8/KpSwQMaXwpNAePqtr6tJYQToHBD7pH1+jLghARaZx18Gsx/Uc5lK+f3THa39Cd7@lists.sourceforge.net
X-Gm-Message-State: AOJu0YwrEbeLXA5nXMPFVkhLQ9znfkL0sMXdW3WjR8gDUZr48GkLhvtc
 LPG2N+rlgod9ByMDwPC8EIl37gzmiYz5usiBVRQIn+19umAtwNzN
X-Google-Smtp-Source: AGHT+IE0z8rby9HTebFaHQq7GTIwjaG2HsDlavFj1bKPOpMg2b6IX3pXsRGbmnFKkWwPHIyglzTh5Q==
X-Received: by 2002:a05:6a21:9101:b0:1cc:9f25:54d4 with SMTP id
 adf61e73a8af0-1cce10979f6mr22060086637.38.1725571219412; 
 Thu, 05 Sep 2024 14:20:19 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:8558:9704:c017:560e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-718d6b23ec7sm70595b3a.25.2024.09.05.14.20.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Sep 2024 14:20:19 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  5 Sep 2024 14:20:14 -0700
Message-ID: <20240905212014.1094170-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.0.469.g59c65b2a67-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Fixed wrong endian conversions related to
 i_flags. Signed-off-by: Daeho Jeong --- fsck/node.c | 2 +- include/f2fs_fs.h
 | 2 +- mkfs/f2fs_format.c | 2 +- 3 files changed, 3 insertions(+),
 3 deletions(-)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1smJu2-0001hf-9U
Subject: [f2fs-dev] [PATCH] f2fs-tools: fix wrong endian conversion related
 to i_flags
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

Fixed wrong endian conversions related to i_flags.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/node.c        | 2 +-
 include/f2fs_fs.h  | 2 +-
 mkfs/f2fs_format.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/fsck/node.c b/fsck/node.c
index 7ee29ac..632151a 100644
--- a/fsck/node.c
+++ b/fsck/node.c
@@ -62,7 +62,7 @@ int f2fs_rebuild_qf_inode(struct f2fs_sb_info *sbi, int qtype)
 
 	raw_node->i.i_size = cpu_to_le64(1024 * 6);
 	raw_node->i.i_blocks = cpu_to_le64(1);
-	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
+	raw_node->i.i_flags = cpu_to_le32(F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL);
 
 	if (is_set_ckpt_flags(ckpt, CP_CRC_RECOVERY_FLAG))
 		cp_ver |= (cur_cp_crc(ckpt) << 32);
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4..fdbc25b 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -986,7 +986,7 @@ static_assert(sizeof(struct node_footer) == 24, "");
 #define file_enc_name(fi)        ((fi)->i_advise & FADVISE_ENC_NAME_BIT)
 
 #define F2FS_CASEFOLD_FL	0x40000000 /* Casefolded file */
-#define IS_CASEFOLDED(dir)     ((dir)->i_flags & F2FS_CASEFOLD_FL)
+#define IS_CASEFOLDED(dir)     ((dir)->i_flags & cpu_to_le32(F2FS_CASEFOLD_FL))
 
 /*
  * fsck i_compr_blocks counting helper
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 30d8e19..db1bc89 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -1414,7 +1414,7 @@ static int f2fs_write_qf_inode(int qtype)
 
 	raw_node->i.i_size = cpu_to_le64(1024 * 6);
 	raw_node->i.i_blocks = cpu_to_le64(1 + QUOTA_DATA);
-	raw_node->i.i_flags = F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL;
+	raw_node->i.i_flags = cpu_to_le32(F2FS_NOATIME_FL | F2FS_IMMUTABLE_FL);
 
 	node_blkaddr = alloc_next_free_block(CURSEG_HOT_NODE);
 	F2FS_NODE_FOOTER(raw_node)->next_blkaddr = cpu_to_le32(node_blkaddr + 1);
-- 
2.46.0.469.g59c65b2a67-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
