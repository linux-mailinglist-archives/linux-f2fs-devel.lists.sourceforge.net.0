Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A05216DC2A1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Apr 2023 04:20:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1plh8z-0004ef-ER;
	Mon, 10 Apr 2023 02:20:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1plh8u-0004eZ-VY
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:20:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L22VA8wyXhaH46f3Y7JGoCdAtQNOn1kgfzKE3dW4TgE=; b=PJ8sSItiXam9QYbY2zT70DE6oG
 MCdM8xwnb+8qP+1quE5zNy5/BAlTrriS6+b4ctppaKTNf/IxLs8RwaBQL3EQyD9lcrbr8hjA754nw
 TApX3cBgC7inCMlhZQwuYy59zNsUVM2S5hnh8eu1FfHWmBZZh+UDbnnSLRygI415hqS0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=L22VA8wyXhaH46f3Y7JGoCdAtQNOn1kgfzKE3dW4TgE=; b=V
 sRQKxM/64tDYh52iwpLFsJnKNjfFUc2ipcI+I7JNk722QEn+IMTxQEh9lajiVe/KOHm7YUsmZzRoE
 pcDgzDdItYItGmSQp/aLTfy7r/4B+/HZjvT2/lGjg7znT7lm70gp2WKNzzoeDofMEUr3JSh6yvIo0
 9nd6sslpHnApkHSM=;
Received: from dfw.source.kernel.org ([139.178.84.217])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1plh8t-002VFL-J1 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Apr 2023 02:20:28 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 3863E60F85
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 10 Apr 2023 02:20:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61513C433D2;
 Mon, 10 Apr 2023 02:20:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1681093221;
 bh=HwCOx5xRy3GdD+M/EnsNjrEY2Cu6MG8VzpDDAD4BMUU=;
 h=From:To:Cc:Subject:Date:From;
 b=Dh2D5sgNAfWB0M966BgWaici/0xOyy4b9b4KM0EyKesTAx4HMLa0OPU0pf73J6c5g
 OLZBeSSMJjNU+Bw4zc1TJdZJ+ubO23vf+5JQovX27Y3vWt+BrMSpvby4tRtBy2qkH7
 wqVqDT0zWlbfVkRQo5qlTxqg4iEeG+jd6ITrmcs7tfQjcltPt01TOFZfyKnRwje+ID
 lwVpJXYqGMGMh8tT+mm2XEVXy3p4hy3UFiq8tK8GnRxfqQObDCoINKqeDuTU9CYEI1
 lRwV2WmSG8fNnxcdfddY4CxJS59ZGbERxTCd6DCYpgjsb6/h6EMt9eM37hvV4BepFy
 sRhYcCI7qNj8A==
From: Chao Yu <chao@kernel.org>
To: jaegeuk@kernel.org
Date: Mon, 10 Apr 2023 10:20:12 +0800
Message-Id: <20230410022012.1839127-1-chao@kernel.org>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  i_crtime will never change after inode creation, so we don't
 need to copy it into f2fs_inode_info.i_disk_time[3], and monitor its change
 to decide whether updating inode page, remove related stuff. Signed-off-by:
 Chao Yu <chao@kernel.org> --- fs/f2fs/f2fs.h | 5 +---- fs/f2fs/inode.c |
 1 - 2 files changed, 1 insertion(+), 5 deletions(-) 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [139.178.84.217 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1plh8t-002VFL-J1
Subject: [f2fs-dev] [PATCH] f2fs: remove unneeded in-memory i_crtime copy
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

i_crtime will never change after inode creation, so we don't need
to copy it into f2fs_inode_info.i_disk_time[3], and monitor its
change to decide whether updating inode page, remove related stuff.

Signed-off-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/f2fs.h  | 5 +----
 fs/f2fs/inode.c | 1 -
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 7d9c5a65f974..e78cbc8a6248 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -844,7 +844,7 @@ struct f2fs_inode_info {
 	kprojid_t i_projid;		/* id for project quota */
 	int i_inline_xattr_size;	/* inline xattr size */
 	struct timespec64 i_crtime;	/* inode creation time */
-	struct timespec64 i_disk_time[4];/* inode disk times */
+	struct timespec64 i_disk_time[3];/* inode disk times */
 
 	/* for file compress */
 	atomic_t i_compr_blocks;		/* # of compressed blocks */
@@ -3290,9 +3290,6 @@ static inline bool f2fs_is_time_consistent(struct inode *inode)
 		return false;
 	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 2, &inode->i_mtime))
 		return false;
-	if (!timespec64_equal(F2FS_I(inode)->i_disk_time + 3,
-						&F2FS_I(inode)->i_crtime))
-		return false;
 	return true;
 }
 
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bb5b365a195d..cf4327ad106c 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -326,7 +326,6 @@ static void init_idisk_time(struct inode *inode)
 	fi->i_disk_time[0] = inode->i_atime;
 	fi->i_disk_time[1] = inode->i_ctime;
 	fi->i_disk_time[2] = inode->i_mtime;
-	fi->i_disk_time[3] = fi->i_crtime;
 }
 
 static int do_read_inode(struct inode *inode)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
