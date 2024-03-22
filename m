Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0794D887223
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 22 Mar 2024 18:50:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rnj1n-0007pi-NP;
	Fri, 22 Mar 2024 17:50:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rnj1m-0007pa-OF
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 17:50:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=yfoeq+6cUg1dwSHsoYFFrThY/ANh42EGrvYWQB15MVo=; b=W2XdWFfRsk3H3LhRBvo+UB1Al6
 i9tyyAfnRPgDMPKiZcO8Kl4PLQotXIqgsrrhocHER1h+zfQqfZYXMGUQdiu5/uybHPHSKrJ0pHopo
 yFV9fZmDOaWmtTY6T9B6ptVZmr2FzwhZXS7PqQPYfIRN4Uew8EURMbQ7Q/UVR1JIuanw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=yfoeq+6cUg1dwSHsoYFFrThY/ANh42EGrvYWQB15MVo=; b=L
 xeQ7Iiok9dusubVTyqjpO68NdMdGGAbXu/1Yas6Oq3z584j3vr+RfLAjKgQJ/TPCpB7tagCf9NsnA
 s1rP5gaNwFie4GrCxNbfZstpHcCac5PnV2QfWVCC5i1/zQEom1mKVWAaGx2QtGOa7xE+mz1N5Ueqw
 x8cpxLQPDzBd1n5U=;
Received: from mail-pf1-f182.google.com ([209.85.210.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rnj1i-00022d-LJ for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 22 Mar 2024 17:50:02 +0000
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-6ea838bf357so598310b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 22 Mar 2024 10:49:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711129788; x=1711734588; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=yfoeq+6cUg1dwSHsoYFFrThY/ANh42EGrvYWQB15MVo=;
 b=lPvV4v9B6KITR+vWGJiWuTMa9IWDePU/n1nHif4JN8O+7MYdvGRLxztafcpfxfaASs
 12l/MNcdV4gIVyc8xP1OutTSHGhcTQDVq/cAovEIuendODjBOwF51wqukinqM1A7Qn+Y
 fZcSWx5lcC0NTIzrsPrudbdyD5CfyBi6wS32OkPp5nbyTW6Q+GUqAZobbh80KdMidEk2
 PrLPbVtFCRAjuarCNtVzWyITMDbVOZbZ/g36hv1YiaXnkFdpGAZ/0QwfMKGEo92mYi9e
 5hmRfgZDmwzTmaZmVpMLiIwOF9caSK6DE8f4WjVLKMgManY1E1VWGxXyyFGgDKExnG/t
 A/qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711129788; x=1711734588;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=yfoeq+6cUg1dwSHsoYFFrThY/ANh42EGrvYWQB15MVo=;
 b=B5WdyFa08IgDyuX/CjUWYUT3lu8isq40zzZ3FXJgM1zfH4MJoMhGV4JMMUzzknWFDK
 bJyXEpFD1j3tI5qYGY99dwg95mKWN093eCIWLzRZ1RDcCRw/rcFxUC8s9jY+l0z/WWg1
 CgP5xJWWZFx+CxnLxQbjfHpU61H47LMuyDoJDOSPEYc7J5IjasJNNBe8rfPICSG0/lj9
 VIoOtCJzfIuVRUPchPSyzHOB2xD6YQHQ4ciNeHuuY1sOgIyC38drANdf3TNfxbmIMYN8
 4CiojSi4v7Y1MtCW8xPz5DYGJUTl9wyzMYEW4XXTzvjlck0f6Pxe7GtPjOg6e1yrDor4
 cAQA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXZpohpqO1ouFOhyJ8sjoHwjwSJnvxD0yDqYl3nff4T8ZORAHZCQ7WE6NjNg93yhkoJO8KHzI5qmXqwSQRn1+ZLJ+8uJcXnY7+QGOeCyH2C4OQyXlwT+A==
X-Gm-Message-State: AOJu0YzZ49r1oNpBAbCECWQMEX+yvsMynW90ovrwcDdC4Jere1cqFat7
 6nIZHBIsXtv31+kndFJ7P3en5zV046dIRoVcrLw0+a+6Fnu0/uL3
X-Google-Smtp-Source: AGHT+IHBSlzdL28oxOsi0qLLtLmepKBeRoliIAW4D4Xdq2dsDZAjxf8EhlE4bkXQ1af/N3YqWA+R2g==
X-Received: by 2002:a17:903:40c2:b0:1e0:1174:6360 with SMTP id
 t2-20020a17090340c200b001e011746360mr529213pld.14.1711129787822; 
 Fri, 22 Mar 2024 10:49:47 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:cd6c:4747:ed85:6091])
 by smtp.gmail.com with ESMTPSA id
 t9-20020a170902e84900b001dbcfa0f1acsm2061plg.83.2024.03.22.10.49.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 22 Mar 2024 10:49:47 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 22 Mar 2024 10:49:43 -0700
Message-ID: <20240322174944.1460441-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.396.g6e790dbe36-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In a case writing without fallocate(), we
 can't guarantee it's allocated in the conventional area for zoned stroage.
 Signed-off-by: Daeho Jeong --- v2: covered the direct io case v3: covered
 the mkwrite case v4: moved pin file check position in prepare_write_begin()
 --- fs/f2fs/data.c | 20 ++++++++++++++++---- fs/ [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.182 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.182 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rnj1i-00022d-LJ
Subject: [f2fs-dev] [PATCH v4] f2fs: prevent writing without fallocate() for
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
v4: moved pin file check position in prepare_write_begin()
---
 fs/f2fs/data.c | 20 ++++++++++++++++----
 fs/f2fs/file.c | 16 ++++++++--------
 2 files changed, 24 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c21b92f18463..88896989bb28 100644
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
@@ -3414,8 +3419,15 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 		/* hole case */
 		err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
-		if (!err && dn.data_blkaddr != NULL_ADDR)
-			goto out;
+		if (!err) {
+			if (dn.data_blkaddr != NULL_ADDR) {
+				goto out;
+			} else if (f2fs_is_pinned_file(inode)) {
+				err = -EIO;
+				goto out;
+			}
+		}
+
 		f2fs_put_dnode(&dn);
 		f2fs_map_lock(sbi, F2FS_GET_BLOCK_PRE_AIO);
 		WARN_ON(flag != F2FS_GET_BLOCK_PRE_AIO);
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
2.44.0.396.g6e790dbe36-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
