Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 691E2691035
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Feb 2023 19:18:52 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQBVP-0002cG-Sk;
	Thu, 09 Feb 2023 18:18:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1pQBVO-0002cA-Lz
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Feb 2023 18:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nAeDBd0vA/AYl78MX8JjIWV+4nG3ektN8r7tg/If92Q=; b=Rn2MGEqSw739ugrVuVfTgjF3vf
 EvCnJymqGXbTrkVPGOFdz06uasOGDZs3idF5WtlAlp3CyT6hXNszpgZgaF2QKBvt4LUn4bely1j1V
 +j2Ntfh7RuNqEImAH08+YCgQjFR5Ar0WR7iEftconhuVA8N1hFJxXPxBCHwyP0kihtNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nAeDBd0vA/AYl78MX8JjIWV+4nG3ektN8r7tg/If92Q=; b=U
 tt4B8+v6HrLo0sF5Purk5qotalPbKcFe6beWHLBU5OWkvSKcm5x29MJZQHmYR1SYawFOYH//3WOau
 vqU/wGskmBW6h9di47PYFHygQvVDNefK3YV14CUb2zuF7qu3Htet2yfWYCrLhio0DWMLXpPcaAjr+
 ELaAw44tPaFO591Q=;
Received: from mail-pj1-f44.google.com ([209.85.216.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1pQBVM-0002L7-2C for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Feb 2023 18:18:46 +0000
Received: by mail-pj1-f44.google.com with SMTP id d2so2860761pjd.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 09 Feb 2023 10:18:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=nAeDBd0vA/AYl78MX8JjIWV+4nG3ektN8r7tg/If92Q=;
 b=B21kTWqowO/PbsBG4oQYa5k7ppDue6cucLiZ8usX2aWquno63Djj7QNJstQjA4TTn2
 G+r/1tG2TbMxf3ZR8nNUS50P8XAgcBBRoNSmhyvoH/36ToZh/dORWoHtdho1Jopy/4gR
 p2csyen1RkJ/rcM1ZTavqs/7cYTulluZa/CYNoMhNcpYTROzEtfw4wlPY7sBFXBn1v0c
 R+YbEOosq2IXa/aX+ChM6R8x6yCdlV3dnijiqaUg7/x2WHAr49T+3IthXRyU+AFlUndz
 QyPoVW7NsNYtimG9Wqv/HKayYOWR85Yy46OS9cz08x/35csSfZz3GNZ0Jd6qHLhWHL94
 WR5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nAeDBd0vA/AYl78MX8JjIWV+4nG3ektN8r7tg/If92Q=;
 b=60AHbWkF8nFFG+SbUjHY7FFuuLwE937fvhnfDcIOD7RRmz/My+K3jNSwI3w3cZMN88
 bClSCS5rE4FWqv7EInXe+Xw2uSHbpE8WQL8mH+2F3by0P/Y4ESnSTn23PPa1fWT6PSkU
 NHNuLbPH/qj5bIrMaDimhDY7OTaPMsUo7t93nUUVJHQlt2jN9kIRDI0z/UJmbn5lDxdV
 BSMsgZniXKEWt2jQ1Phs5ZRUEY1R8NJ6mkwuuz3m1fAqLeAEX8wd9t0R/+BZufCd3f4P
 VOKcMrAIdtvNI9UPNwYoiJVeokXDkwnrnIvSNuQRKfjdmoA3cwmu4UPCS3miNAYvFoGQ
 hESg==
X-Gm-Message-State: AO0yUKX1wkfHiGohC6SA1tXz80uS8Zwt640zBSIVwkK5CHnFePfZE6Xz
 vLaGcqF88wsnqRyQJEJD/YA=
X-Google-Smtp-Source: AK7set+P2npQ1a/JK/swh8ouq/k2DBFIBqe3OM6rVnA3f3barCK3rWfDqW2H8UuaiPe96tf8HC7Q9Q==
X-Received: by 2002:a17:902:c40e:b0:196:8a80:4d91 with SMTP id
 k14-20020a170902c40e00b001968a804d91mr14339019plk.35.1675966719096; 
 Thu, 09 Feb 2023 10:18:39 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:15c:211:201:631d:24ac:71d7:d24b])
 by smtp.gmail.com with ESMTPSA id
 p11-20020a170902a40b00b0019460ac7c6asm1783819plq.283.2023.02.09.10.18.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Feb 2023 10:18:38 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu,  9 Feb 2023 10:18:19 -0800
Message-Id: <20230209181819.2333522-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.39.1.581.gbfd45094c4-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong To fix a race condition between atomic
 write
 aborts, I use the inode lock and make COW inode to be re-usable thoroughout
 the whole atomic file inode lifetime. Reported-by: 3db1de0e582c ("f2fs: change
 the current atomic write way") Signed-off-by: Daeho Jeong --- fs/f2fs/file.c
 | 44 +++++++++++++++++++++++++++++ fs/f2fs/inode.c | 11 +++++++ [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.44 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.44 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1pQBVM-0002L7-2C
Subject: [f2fs-dev] [PATCH] f2fs: synchronize atomic write aborts
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
Cc: Daeho Jeong <daehojeong@google.com>,
 syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Daeho Jeong <daehojeong@google.com>

To fix a race condition between atomic write aborts, I use the inode
lock and make COW inode to be re-usable thoroughout the whole
atomic file inode lifetime.

Reported-by: syzbot+823000d23b3400619f7c@syzkaller.appspotmail.com
Fixes: 3db1de0e582c ("f2fs: change the current atomic write way")
Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c    | 44 +++++++++++++++++++++++++++++---------------
 fs/f2fs/inode.c   | 11 +++++++++--
 fs/f2fs/segment.c |  3 ---
 fs/f2fs/super.c   |  2 --
 4 files changed, 38 insertions(+), 22 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 300eae8b5415..6436c52e7913 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1863,7 +1863,10 @@ static int f2fs_release_file(struct inode *inode, struct file *filp)
 			atomic_read(&inode->i_writecount) != 1)
 		return 0;
 
+	inode_lock(inode);
 	f2fs_abort_atomic_write(inode, true);
+	inode_unlock(inode);
+
 	return 0;
 }
 
@@ -1878,8 +1881,12 @@ static int f2fs_file_flush(struct file *file, fl_owner_t id)
 	 * before dropping file lock, it needs to do in ->flush.
 	 */
 	if (F2FS_I(inode)->atomic_write_task == current &&
-				(current->flags & PF_EXITING))
+				(current->flags & PF_EXITING)) {
+		inode_lock(inode);
 		f2fs_abort_atomic_write(inode, true);
+		inode_unlock(inode);
+	}
+
 	return 0;
 }
 
@@ -2085,19 +2092,28 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 		goto out;
 	}
 
-	/* Create a COW inode for atomic write */
-	pinode = f2fs_iget(inode->i_sb, fi->i_pino);
-	if (IS_ERR(pinode)) {
-		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-		ret = PTR_ERR(pinode);
-		goto out;
-	}
+	/* Check if the inode already has a COW inode */
+	if (fi->cow_inode == NULL) {
+		/* Create a COW inode for atomic write */
+		pinode = f2fs_iget(inode->i_sb, fi->i_pino);
+		if (IS_ERR(pinode)) {
+			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			ret = PTR_ERR(pinode);
+			goto out;
+		}
 
-	ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
-	iput(pinode);
-	if (ret) {
-		f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
-		goto out;
+		ret = f2fs_get_tmpfile(mnt_userns, pinode, &fi->cow_inode);
+		iput(pinode);
+		if (ret) {
+			f2fs_up_write(&fi->i_gc_rwsem[WRITE]);
+			goto out;
+		}
+
+		set_inode_flag(fi->cow_inode, FI_COW_FILE);
+		clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
+	} else {
+		/* Reuse the already created COW inode */
+		f2fs_do_truncate_blocks(fi->cow_inode, 0, true);
 	}
 
 	f2fs_write_inode(inode, NULL);
@@ -2105,8 +2121,6 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	stat_inc_atomic_inode(inode);
 
 	set_inode_flag(inode, FI_ATOMIC_FILE);
-	set_inode_flag(fi->cow_inode, FI_COW_FILE);
-	clear_inode_flag(fi->cow_inode, FI_INLINE_DATA);
 
 	isize = i_size_read(inode);
 	fi->original_i_size = isize;
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index 28c9c72dda2a..7bf660d4cad9 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -777,11 +777,18 @@ int f2fs_write_inode(struct inode *inode, struct writeback_control *wbc)
 void f2fs_evict_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	nid_t xnid = F2FS_I(inode)->i_xattr_nid;
+	struct f2fs_inode_info *fi = F2FS_I(inode);
+	nid_t xnid = fi->i_xattr_nid;
 	int err = 0;
 
 	f2fs_abort_atomic_write(inode, true);
 
+	if (fi->cow_inode) {
+		clear_inode_flag(fi->cow_inode, FI_COW_FILE);
+		iput(fi->cow_inode);
+		fi->cow_inode = NULL;
+	}
+
 	trace_f2fs_evict_inode(inode);
 	truncate_inode_pages_final(&inode->i_data);
 
@@ -866,7 +873,7 @@ void f2fs_evict_inode(struct inode *inode)
 	stat_dec_inline_inode(inode);
 	stat_dec_compr_inode(inode);
 	stat_sub_compr_blocks(inode,
-			atomic_read(&F2FS_I(inode)->i_compr_blocks));
+			atomic_read(&fi->i_compr_blocks));
 
 	if (likely(!f2fs_cp_error(sbi) &&
 				!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ead3f35f501d..719329c1808c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -192,9 +192,6 @@ void f2fs_abort_atomic_write(struct inode *inode, bool clean)
 	if (!f2fs_is_atomic_file(inode))
 		return;
 
-	clear_inode_flag(fi->cow_inode, FI_COW_FILE);
-	iput(fi->cow_inode);
-	fi->cow_inode = NULL;
 	release_atomic_write_cnt(inode);
 	clear_inode_flag(inode, FI_ATOMIC_COMMITTED);
 	clear_inode_flag(inode, FI_ATOMIC_REPLACE);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c11a161ba5be..aa55dc12aff2 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1427,8 +1427,6 @@ static int f2fs_drop_inode(struct inode *inode)
 			atomic_inc(&inode->i_count);
 			spin_unlock(&inode->i_lock);
 
-			f2fs_abort_atomic_write(inode, true);
-
 			/* should remain fi->extent_tree for writepage */
 			f2fs_destroy_extent_node(inode);
 
-- 
2.39.1.581.gbfd45094c4-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
