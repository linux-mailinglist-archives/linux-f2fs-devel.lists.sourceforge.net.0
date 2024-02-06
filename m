Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87D2084C016
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Feb 2024 23:33:26 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rXU0I-0005mg-Gf;
	Tue, 06 Feb 2024 22:33:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rXU0G-0005ma-Ri
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 22:33:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wX4f3WxNax0yrGD3k4jTwh/vCGQc2wn1RTN07jtNKD0=; b=ICwTLbvPbB+rsnYvi8XDjFaO41
 kf/WcKL4SIVHYx7PDOjtRd1Qc/QZ/ihNKJ2xUh6BVkMQdqAUEOpgdJZHxyOiJa93JwmavOgAmWmp1
 qojX0Wa6ohRIotWTkEnPjGpfwOSnjVNjmjHEoJoqbXGepb21kKgZwVGkRYerS3slG3oM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=wX4f3WxNax0yrGD3k4jTwh/vCGQc2wn1RTN07jtNKD0=; b=k89hwxIKETBYPU/6DK0Vx2ZgUh
 LbjP1pk24Qv0xI3ohdNjNUC8W6alw+H5+Jn8hRNiTenbEfuXh4DBKUGTY3AcA1gG0ls7ArNo9anjV
 2dNLQtGYND1pWxbUSJBx3XQh9bOPU4da3R8fDBST/zwyJTvuRMiii8pvSqLkhNHQ1EJ4=;
Received: from mail-pl1-f179.google.com ([209.85.214.179])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rXU0D-00041s-Hg for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Feb 2024 22:33:21 +0000
Received: by mail-pl1-f179.google.com with SMTP id
 d9443c01a7336-1d93ddd76adso229065ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 06 Feb 2024 14:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1707258787; x=1707863587; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=wX4f3WxNax0yrGD3k4jTwh/vCGQc2wn1RTN07jtNKD0=;
 b=CCOx0gNPSsmCLqEPtkCLQKzUNgTnkfvRaOUWNSPmeFAQJBJ5w9fk3VZqlUXLV19T20
 joCMx8S41KPanjD6UFvBvIa9OhO/lnqYCfpjKRWdb2nNPkA66nuJoxQyC55qd3dBNpWt
 cues3ygUY+439ZsBcTi8CiT/JPO7v1Od9WEj3x0B7P9z2cvWbVpo5nhEB2co05hhliSm
 qnrX4zJ6w20WbSoh1w9LdJ7uRGpx0rhNBhz4eNx7eYxtcm/RVKM5Z8rX0KGDhdaR0x3T
 RD6ThxfZWggOi0YMfIvfPRPCeC9GXHOYhbnZqqzbCrNatlH1jJCszVSzyGJzXetUZ4l6
 CY6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707258787; x=1707863587;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wX4f3WxNax0yrGD3k4jTwh/vCGQc2wn1RTN07jtNKD0=;
 b=oqIHBRB6/laGhbzIb/iblLfEJKc21XHMAnmcQZQYkPGbNp+7ATOsRelD92RUFuF0SI
 a/A78KC52IgL6YZppQduLWS1kWUbLjm/MJid9eO6LmN49xVN5hGbfzJNNWNdKccYulQr
 mejr8/yqfKBvfmxYhVtIM4yVQgkD/yz7WslXiTzJEx49VE16PDZXebykbPZPBGIbpQF3
 Ufhg5khW3eDBJy1NGLaKCEUB3Rb387g61HNjaBtE1CXT67xVXT3xORq0Bc+S2Pr3FiWX
 LHevUD3dVkt8BKEagDPVA0yFkeJPzaDFSGVtRcQGuwm5aTB3IixVUEXNavoR25xmYRdu
 qAnA==
X-Gm-Message-State: AOJu0Yw5BlefCpcdVpBnrb0JinAN4YN08I2ecHsBNZvhYQOTs/qFY6e7
 EJhM5u8E9O6lc0r8xRbwBFRo8fjbmDb45p9PFIQcBYlCghhhpLDn
X-Google-Smtp-Source: AGHT+IHfgJmvmNrZmd4aXfeVQ89FIAnMw/1SID/bJpZjM5E3+xKmKxuoA6/aiTxv2qPGZnjPba45gw==
X-Received: by 2002:a17:903:2384:b0:1d9:8082:4577 with SMTP id
 v4-20020a170903238400b001d980824577mr3344088plh.17.1707258787618; 
 Tue, 06 Feb 2024 14:33:07 -0800 (PST)
X-Forwarded-Encrypted: i=1;
 AJvYcCWNOpv8rOlo8TCfKwGJroovU1eMRu/KL1OCxn0n6wFaqz2gpI03/r7Ik9ituO9iOkDmBfExo3HmdF8WGKPcQlzMfLaUKv2vKHK0FNi2YE712lJG3vIPdR2lz8FWF9XBbyAsJDN4/lSxOkQiHWVPb9smRXq3yc5MitIO5BvQiwkX8yBcfg==
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:6e38:9e6f:4818:7d04])
 by smtp.gmail.com with ESMTPSA id
 n3-20020a170902dc8300b001d6f091ca04sm32371pld.13.2024.02.06.14.33.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Feb 2024 14:33:07 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  6 Feb 2024 14:32:57 -0800
Message-ID: <20240206223257.3461359-3-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.594.gd9cf4e227d-goog
In-Reply-To: <20240206223257.3461359-1-daeho43@gmail.com>
References: <20240206223257.3461359-1-daeho43@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong Support swap file pinning for zoned devices
 Signed-off-by: Daeho Jeong Signed-off-by: Jaegeuk Kim --- fs/f2fs/data.c
 | 54 ++++++++++++++++++++++++++++++++ 1 file changed, 35 insertions(+), 19
 deletions(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.179 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.179 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rXU0D-00041s-Hg
Subject: [f2fs-dev] [PATCH 3/3] f2fs: support swap file pinning for zoned
 devices
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>, Daeho Jeong <daehojeong@google.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

Support swap file pinning for zoned devices

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 fs/f2fs/data.c | 54 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 35 insertions(+), 19 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 05158f89ef32..5d8ee6e73dbe 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3905,28 +3905,40 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 							unsigned int blkcnt)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct f2fs_map_blocks map = { .m_next_pgofs = NULL,
+		.m_next_extent = NULL, .m_seg_type = CURSEG_COLD_DATA_PINNED,
+		.m_may_create = true };
 	unsigned int blkofs;
 	unsigned int blk_per_sec = BLKS_PER_SEC(sbi);
 	unsigned int secidx = start_blk / blk_per_sec;
-	unsigned int end_sec = secidx + blkcnt / blk_per_sec;
+	unsigned int end_sec;
 	int ret = 0;
 
+	if (!blkcnt)
+		return 0;
+	end_sec = secidx + (blkcnt - 1) / blk_per_sec;
+
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(inode->i_mapping);
 
 	set_inode_flag(inode, FI_ALIGNED_WRITE);
 	set_inode_flag(inode, FI_OPU_WRITE);
 
-	for (; secidx < end_sec; secidx++) {
+	for (; secidx <= end_sec; secidx++) {
+		unsigned int blkofs_end = secidx == end_sec ?
+			(blkcnt - 1) % blk_per_sec : blk_per_sec - 1;
+
 		f2fs_down_write(&sbi->pin_sem);
 
-		f2fs_lock_op(sbi);
-		f2fs_allocate_new_section(sbi, CURSEG_COLD_DATA_PINNED, false);
-		f2fs_unlock_op(sbi);
+		ret = f2fs_allocate_pinning_section(sbi);
+		if (ret) {
+			f2fs_up_write(&sbi->pin_sem);
+			break;
+		}
 
 		set_inode_flag(inode, FI_SKIP_WRITES);
 
-		for (blkofs = 0; blkofs < blk_per_sec; blkofs++) {
+		for (blkofs = 0; blkofs <= blkofs_end; blkofs++) {
 			struct page *page;
 			unsigned int blkidx = secidx * blk_per_sec + blkofs;
 
@@ -3944,6 +3956,12 @@ static int f2fs_migrate_blocks(struct inode *inode, block_t start_blk,
 		clear_inode_flag(inode, FI_SKIP_WRITES);
 
 		ret = filemap_fdatawrite(inode->i_mapping);
+		if (!ret && blkofs != blk_per_sec) {
+			map.m_lblk = secidx * blk_per_sec + blkofs;
+			map.m_len = blk_per_sec - blkofs;
+			ret = f2fs_map_blocks(inode, &map,
+					F2FS_GET_BLOCK_PRE_DIO);
+		}
 
 		f2fs_up_write(&sbi->pin_sem);
 
@@ -4015,19 +4033,17 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		nr_pblocks = map.m_len;
 
 		if ((pblock - SM_I(sbi)->main_blkaddr) & sec_blks_mask ||
-				nr_pblocks & sec_blks_mask) {
+				nr_pblocks & sec_blks_mask ||
+				!f2fs_valid_pinned_area(sbi, pblock)) {
 			not_aligned++;
 
 			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
 			if (cur_lblock + nr_pblocks > sis->max)
 				nr_pblocks -= blks_per_sec;
 
-			if (!nr_pblocks) {
-				/* this extent is last one */
-				nr_pblocks = map.m_len;
-				f2fs_warn(sbi, "Swapfile: last extent is not aligned to section");
-				goto next;
-			}
+			/* this extent is last one */
+			if (!nr_pblocks)
+				nr_pblocks = last_lblock - cur_lblock;
 
 			ret = f2fs_migrate_blocks(inode, cur_lblock,
 							nr_pblocks);
@@ -4035,7 +4051,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 				goto out;
 			goto retry;
 		}
-next:
+
 		if (cur_lblock + nr_pblocks >= sis->max)
 			nr_pblocks = sis->max - cur_lblock;
 
@@ -4073,17 +4089,17 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 				sector_t *span)
 {
 	struct inode *inode = file_inode(file);
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	int ret;
 
 	if (!S_ISREG(inode->i_mode))
 		return -EINVAL;
 
-	if (f2fs_readonly(F2FS_I_SB(inode)->sb))
+	if (f2fs_readonly(sbi->sb))
 		return -EROFS;
 
-	if (f2fs_lfs_mode(F2FS_I_SB(inode))) {
-		f2fs_err(F2FS_I_SB(inode),
-			"Swapfile not supported in LFS mode");
+	if (f2fs_lfs_mode(sbi) && !f2fs_sb_has_blkzoned(sbi)) {
+		f2fs_err(sbi, "Swapfile not supported in LFS mode");
 		return -EINVAL;
 	}
 
@@ -4102,7 +4118,7 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 
 	stat_inc_swapfile_inode(inode);
 	set_inode_flag(inode, FI_PIN_FILE);
-	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+	f2fs_update_time(sbi, REQ_TIME);
 	return ret;
 }
 
-- 
2.43.0.594.gd9cf4e227d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
