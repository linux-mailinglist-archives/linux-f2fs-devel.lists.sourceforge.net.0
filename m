Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D127F8803A1
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 19 Mar 2024 18:40:19 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rmdRa-0003jp-O0;
	Tue, 19 Mar 2024 17:40:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rmdRY-0003jj-U4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 17:40:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FbVTZraF0QJZsJx7Z45tBr7Rj39spiA67Pwo/WgWCSA=; b=BvRcPEpWtLahqNRQcAB+LQHrLT
 c3evuQQTCLh8lWAkH8Htj5T4/HCR1Yx0MB2zUwCgT1XCoxg94befF/aymFEGaKOlIAGvLINpzb5T+
 6VqZEN4fKk8VXkhNWDaU0QA/s5rvm77bEfpYBg+Ubc9IHCqv3lKZU/f3moHozAtrjYUE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FbVTZraF0QJZsJx7Z45tBr7Rj39spiA67Pwo/WgWCSA=; b=R
 KySz0GtJ7nhj7wQFRHQH2GvlnixsUQYmtI1in8mUn+Ldga/PSJMNe0SIb8dnHa8ua/G75Kn0BGNke
 QidNajOlNKKIlTm9oEaemMSWh0Rl9EXcxTaFAtiHCxyCyLgA5gmqfN6i7JpaZkHNGRXYy229WaWmg
 YUfAGo3qlCs+PfFY=;
Received: from mail-pf1-f180.google.com ([209.85.210.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rmdRN-00061N-HZ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 19 Mar 2024 17:40:09 +0000
Received: by mail-pf1-f180.google.com with SMTP id
 d2e1a72fcca58-6e6fb9a494aso3187561b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 19 Mar 2024 10:40:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1710869999; x=1711474799; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FbVTZraF0QJZsJx7Z45tBr7Rj39spiA67Pwo/WgWCSA=;
 b=dGwNi4HBkXCISiakmS8d7SYgWTbgikfxzq7uQ/KXf5faWH9Nte/3WnXgggKItRHqrW
 Aw3MW9c6Mc8uTANtflRFgwZTpDBr7l0v8t9/5q9E+ZyclZPwS4qTZl3YQADFPT+EUfIg
 p8oOR2oA+grgAlE6/wYUvREmp+jL/NK+xKAP+G/zFaLiqlYR2atk5UNBYTgWW4LXxI6Y
 NY4qIC3qdyxpEHcHKxHclk4yqAPHagLaj9qLDrOUhLKhKPCfTQSImT38oqZosnpH3MAp
 6xsF/ef40KhG/A2avqVPqYsZH/t1BS22zeu/iGO7kTPUA6kl2Om+3Dy+taJc2BinxkKB
 85Vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710869999; x=1711474799;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=FbVTZraF0QJZsJx7Z45tBr7Rj39spiA67Pwo/WgWCSA=;
 b=qRoXqZUqmKnSfXGLGoKp1YftU2wBrwYwG3wuj0SHJlbzK0KFrruTgpsWsCngiWZgqI
 3tYuqDLYTO2DdLzcSFD3NM62yn1drKDs6biQOPhd/tVghriLUxVJ2a/gle0Ozlf8Iudt
 ZDym6IerEl4JBQrGx8s2CC5x9qxKkz/Upps69mhpbyw9dZb3i6DsBi7ywJZuaDGM42T0
 ILYuz8XhSiMJM0sADuIcMi+g+fRAzH5W9WWsKyHxxI+9xiYMXaU0O2O5Zugg+KmwYmFR
 M01QfJQ/2JNC/D6Sv0NtJ1/dT22spjukHeTFI81GOecKXsm75DqrEXZqTi5fixR+1Um+
 uh0A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBLYsVZrU7bWUmYFk9Oqve2K/0UqRAVeCWIKmCC/GZl+tLklmzzWgbdaeDbpHEvRzvw/i1QYULcIWd2Am+RZpkmISHSdLjMmvg01jxee5Mf4JeUYxIWw==
X-Gm-Message-State: AOJu0Yy64XwGJTaUw5fiRlO9ndWdmm49gh9FkKzQ9RbqJ+sP7jvGLKtn
 tldQz5Yjzo3KWfyWUEkyf88c4R0Hvzo88jMYri/Uvy6VvJw9dsiE
X-Google-Smtp-Source: AGHT+IFYhLc2hSKuMQw5BZW+1ji9lDf9Uyhy39Hk8kaH5hAfZNyyBimblILB6SQU1QfwvKgTXE6xpQ==
X-Received: by 2002:a05:6a20:94cf:b0:1a3:6ee9:305 with SMTP id
 ht15-20020a056a2094cf00b001a36ee90305mr4484410pzb.2.1710869999244; 
 Tue, 19 Mar 2024 10:39:59 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:ce48:f01a:1f52:5e0a])
 by smtp.gmail.com with ESMTPSA id
 i185-20020a62c1c2000000b006e583a649b4sm10392921pfg.210.2024.03.19.10.39.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Mar 2024 10:39:58 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 19 Mar 2024 10:39:55 -0700
Message-ID: <20240319173955.4090079-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.291.gc1ea87d7ee-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In a case writing without fallocate(), we
 can't guarantee it's allocated in the conventional area for zoned stroage.
 Signed-off-by: Daeho Jeong --- v2: covered the direct io case v3: covered
 the mkwrite case --- fs/f2fs/data.c | 14 ++++++++++++-- fs/f2fs/file.c |
 16 ++++++++-------- 2 files changed, 20 insertions( [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.180 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.180 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rmdRN-00061N-HZ
Subject: [f2fs-dev] [PATCH v3] f2fs: prevent writing without fallocate() for
 pinned files
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

In a case writing without fallocate(), we can't guarantee it's allocated
in the conventional area for zoned stroage.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: covered the direct io case
v3: covered the mkwrite case
---
 fs/f2fs/data.c | 14 ++++++++++++--
 fs/f2fs/file.c | 16 ++++++++--------
 2 files changed, 20 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c21b92f18463..d3e5ab2736a6 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1584,8 +1584,11 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map, int flag)
 
 	/* use out-place-update for direct IO under LFS mode */
 	if (map->m_may_create &&
-	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO))) {
-		if (unlikely(f2fs_cp_error(sbi))) {
+	    (is_hole || (f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+			 !f2fs_is_pinned_file(inode)))) {
+		if (unlikely(f2fs_cp_error(sbi)) ||
+		    (f2fs_is_pinned_file(inode) && is_hole &&
+		     flag != F2FS_GET_BLOCK_PRE_DIO)) {
 			err = -EIO;
 			goto sync_out;
 		}
@@ -3378,6 +3381,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
+		if (f2fs_is_pinned_file(inode))
+			return -EIO;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
@@ -3407,6 +3412,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
+		if (f2fs_is_pinned_file(inode)) {
+			err = -EIO;
+			goto out;
+		}
+
 		if (locked) {
 			err = f2fs_reserve_block(&dn, index);
 			goto out;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 82277e95c88f..4db3b21c804b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -57,7 +57,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
-	bool need_alloc = true;
+	bool need_alloc = !f2fs_is_pinned_file(inode);
 	int err = 0;
 	vm_fault_t ret;
 
@@ -114,19 +114,15 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 		goto out_sem;
 	}
 
+	set_new_dnode(&dn, inode, NULL, NULL, 0);
 	if (need_alloc) {
 		/* block allocation */
-		set_new_dnode(&dn, inode, NULL, NULL, 0);
 		err = f2fs_get_block_locked(&dn, page->index);
-	}
-
-#ifdef CONFIG_F2FS_FS_COMPRESSION
-	if (!need_alloc) {
-		set_new_dnode(&dn, inode, NULL, NULL, 0);
+	} else {
 		err = f2fs_get_dnode_of_data(&dn, page->index, LOOKUP_NODE);
 		f2fs_put_dnode(&dn);
 	}
-#endif
+
 	if (err) {
 		unlock_page(page);
 		goto out_sem;
@@ -4611,6 +4607,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
+	/* For pinned files, it should be fallocate()-ed in advance. */
+	if (f2fs_is_pinned_file(inode))
+		return 0;
+
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
-- 
2.44.0.291.gc1ea87d7ee-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
