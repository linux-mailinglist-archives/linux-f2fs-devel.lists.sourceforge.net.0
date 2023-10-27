Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 765317D9D64
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Oct 2023 17:49:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qwP5m-0005Rk-EZ;
	Fri, 27 Oct 2023 15:49:46 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1qwP5l-0005Rb-8H
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Oct 2023 15:49:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTGZ3m1qe87c+NuEwbcQd6GcZq/RTlx8NPY386XZ8A4=; b=L4CRhavhK7r0Q/AdgnhH4zJmDM
 hB+oVPUm5uxErpQO7dxwyawMjNNA4usbeWHzuGOToT+/isPexmi6WYrrzpbdWY7xBfBsYqaVBcNLL
 bUhHlksZJOXxJSI3aMpkk3B0qaHdZGhgRqlcOeZ4v3jS2tIKAL9ElWE/NVN/owUBHKkI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cTGZ3m1qe87c+NuEwbcQd6GcZq/RTlx8NPY386XZ8A4=; b=Y
 M8+Kj2Iuc6Ox9d6s2JqgNoL4GHNQdtwWUG1S0c/gFHIp2Wu16jPMnJxFFHyYgMIxr5bam3rCaAs+j
 SLl3xfZX9So1BmO+8d3hmOh9hxTuC6CzDHrfWAgPTmV5/inNTzCmuY0B2birPI6SIhBAdZx0IzVN+
 TadN/jLvY4nEtVH4=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qwP5k-0007U6-Gg for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Oct 2023 15:49:45 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1cc2f17ab26so1041395ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Oct 2023 08:49:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1698421779; x=1699026579; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=cTGZ3m1qe87c+NuEwbcQd6GcZq/RTlx8NPY386XZ8A4=;
 b=kelhiiyygd6hHEWeLrdHr+wbrzRNHxQOtsqpEbwLRee1XgNZTdy7c9Gpe2fRynW6Ni
 5m9v8vxR7T4zZMbeekKGX/lbiSYowHHfrlJ15m9kn5eYGcUuHKwvEw/VlbUgaPZLV2o/
 tF8fPBEO4jaqBUa3FiV5Wtc6cGbYuHSBECZBc+OHsIMt0AOM7JB2ctrG6oFZYh+ToTB8
 7acmoCJf0q0s194KHOIFvWGrGDsCHOrDikStwj+cJKqE1ijklZN/2AI+nsb93A0MDHqo
 keyvHYuEFwOl5E2Tb3hiWVWFUeTV+UN0UYx2olWs6vGXEtfRd/pbFKdcQNkzi/UE5psG
 XVCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698421779; x=1699026579;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=cTGZ3m1qe87c+NuEwbcQd6GcZq/RTlx8NPY386XZ8A4=;
 b=a2PqWNduTYvsvk8vSgLBT8Z9MZ67/YbfkKmvZIhaFIjw0xsfb4gsnWSoImYhmskR0v
 cGzNq3vO3sQQrmVbDay+ZoMVeJy5kCixLqrrdMo4iIokCb6OQDTdRTi7qPt4UyzxF3aZ
 6twBUcIqAmDdYf9hFAy/wAstvCmzFUbbcm2+NG6bMb2hT4wHh6FXyMh3byR1iF+DIRry
 ZPAdYy0vHgBUD5ViCOz3bzfw3ldBOQnBLWoXR+O6+mZNUZYgFedPXv8Sfs0FwbnwiU7A
 /YAaLJsaVRnMzEg0EVJphqzk/QGb62d7Boe2zYkDW7OYkCKqimnr5+Zah6rP32akHjYv
 5Xeg==
X-Gm-Message-State: AOJu0Yy7yVv+ob8NQw2HuzL7zSX1Wu1NYpPLNdUxwwujoXJT/CQ28Nvh
 K5kN2tSLC1Bn1842s4erflp/SR0VDvE=
X-Google-Smtp-Source: AGHT+IEi2mKIu8CCQHQRZ4LhWQcFaEGyhRuU7oh3I4TTx3LqUhmfNK9pivak29Z0ZfsUW2WYTdREXA==
X-Received: by 2002:a17:902:f990:b0:1cc:1ee2:d41d with SMTP id
 ky16-20020a170902f99000b001cc1ee2d41dmr2091834plb.39.1698421778702; 
 Fri, 27 Oct 2023 08:49:38 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:d9fe:c408:7e52:ad85])
 by smtp.gmail.com with ESMTPSA id
 ij27-20020a170902ab5b00b001ca4c20003dsm1761412plb.69.2023.10.27.08.49.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Oct 2023 08:49:38 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 27 Oct 2023 08:49:35 -0700
Message-ID: <20231027154935.1384979-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.42.0.820.g83a721a137-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong If we write CP_UMOUNT_FLAG in fsck, f2fs
 will not do foll forward recovery even though it has to do. Signed-off-by:
 Daeho Jeong --- fsck/fsck.c | 3 ++- fsck/mount.c | 5 ++++- include/f2fs_fs.h
 | 1 + 3 files changed, 7 insertions(+), 2 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qwP5k-0007U6-Gg
Subject: [f2fs-dev] [PATCH] f2fs-tools: do not put CP_UMOUNT_FLAG for roll
 forward recovery
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

If we write CP_UMOUNT_FLAG in fsck, f2fs will not do foll forward recovery
even though it has to do.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fsck/fsck.c       | 3 ++-
 fsck/mount.c      | 5 ++++-
 include/f2fs_fs.h | 1 +
 3 files changed, 7 insertions(+), 2 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index f1a55db..126458c 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -2526,7 +2526,8 @@ static void fix_checkpoint(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	struct f2fs_checkpoint *cp = F2FS_CKPT(sbi);
 	unsigned long long cp_blk_no;
-	u32 flags = c.alloc_failed ? CP_FSCK_FLAG: CP_UMOUNT_FLAG;
+	u32 flags = c.alloc_failed ? CP_FSCK_FLAG :
+			(c.roll_forward ? 0 : CP_UMOUNT_FLAG);
 	block_t orphan_blks = 0;
 	block_t cp_blocks;
 	u32 i;
diff --git a/fsck/mount.c b/fsck/mount.c
index 3b02d73..805671c 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3218,7 +3218,7 @@ void write_checkpoint(struct f2fs_sb_info *sbi)
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	block_t orphan_blks = 0;
 	unsigned long long cp_blk_no;
-	u32 flags = CP_UMOUNT_FLAG;
+	u32 flags = c.roll_forward ? 0 : CP_UMOUNT_FLAG;
 	int i, ret;
 	uint32_t crc = 0;
 
@@ -3837,6 +3837,9 @@ static int record_fsync_data(struct f2fs_sb_info *sbi)
 	if (ret)
 		goto out;
 
+	if (c.func == FSCK && inode_list.next != &inode_list)
+		c.roll_forward = 1;
+
 	ret = late_build_segment_manager(sbi);
 	if (ret < 0) {
 		ERR_MSG("late_build_segment_manager failed\n");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index abd5abf..faa5d6b 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1513,6 +1513,7 @@ struct f2fs_configuration {
 	unsigned int feature;			/* defined features */
 	unsigned int quota_bits;	/* quota bits */
 	time_t fixed_time;
+	int roll_forward;
 
 	/* mkfs parameters */
 	int fake_seed;
-- 
2.42.0.820.g83a721a137-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
