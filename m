Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C27F893CB1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Apr 2024 17:14:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrJMS-0003kt-67;
	Mon, 01 Apr 2024 15:14:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rrJMQ-0003kf-BV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Apr 2024 15:14:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T6eV7DdHQLbErWcw4Py5Jo8KIrVYa9EKXORI7ogMXuc=; b=ToDjdxQ9oZ0/4Ygongz+fZHx1w
 kGHdj8Sah5tG6kG2Km35TkyIaSynfjR71BOmgpXYN/629B0AgzeQH5OT3zC/D1sf8g6w14IeZBEe6
 k+4pay0sNzT7kIKSdrQPkdJpxB4N+pmjBf1vwUr2j+jI/CpZyUaOHHeTMYdmdyobaFLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=T6eV7DdHQLbErWcw4Py5Jo8KIrVYa9EKXORI7ogMXuc=; b=i
 AlitRtfrOVjsbu8eMjD1BthZ0NcPpYjQ/qAuMfTTh9qPJMgz/6IeSkgJxIjGTqFcCEglLLpYr5YQx
 PXypXoMaabS747wsLcaw+8NCGgoDU81tkRBPNvlvKEtbJZm1/Orz3Yxh/ZKfa8kamTpelafYkMxnC
 b6y9pcE4qYpfzJDs=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rrJML-0007J2-OL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Apr 2024 15:14:10 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6ea8a0d1a05so3143083b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Apr 2024 08:14:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711984435; x=1712589235; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=T6eV7DdHQLbErWcw4Py5Jo8KIrVYa9EKXORI7ogMXuc=;
 b=dxF2lmOm43aIagZW+iuLPnBdtmk165FDGe4vpJvig9W5vbf3kuT1jTAYLUVLBN7QFf
 3yfvgNI+PJkCZi/eGsFh4bmRTHeIWVk+fzgYrKq6ah4OqhQIuXLcZisBHNZfOx0vjPg+
 57yQIwnM3GGE3Q7WTO+hrJ51O25BE/gee/uFSm21XvUNpylPXCSvxuoE/IdTszTx610p
 ww58Ks0+398csyHIAU4ZZKTT91YzsPwx/iPbSG08JoOrjPWGxdJwINSFc/c7oHRP7GRZ
 VJ7fPhsZ/Deblaa56n/WSFx/EmYlk5tXtZUS5xstTATdMa73wunMjfhGR7b5p0zpNClr
 /PDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711984435; x=1712589235;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=T6eV7DdHQLbErWcw4Py5Jo8KIrVYa9EKXORI7ogMXuc=;
 b=u+agtVv5hRFbkUyjKsvLO9wubNIlQNzAtqGe+EZi9E6wb48QsAQ00nknWFr7JeVm8d
 rNLmIKO0DcxtF+D+QVgBJPZh8baGURiUv5ipju5TwyIHTMpslr0+0UUQ6UqcgMF1J8HP
 CKVljbc289xvaefEVKtuM8p2LL/Ux3JtYP/HgUZ3n0BIzkXgSbclr3Jg1e81ajpEQ264
 cT2+YWtGaiaxe0QBKmNGwJUP0ZVxgQtRVBEJHtlBskLDL8eCckypCbB+DiG5hUnksiGp
 iTFZR4jvnMR+hihFy3wFrwEImhwyO303Qf6yGzh800ET83oOvvHa5aJExdVox4o9BVO3
 rKcg==
X-Forwarded-Encrypted: i=1;
 AJvYcCU+XGyrzBWejgz6oMeBXQ/c1+CJR2f30LTPRy5d0/AJkqjmTzjmUzVUK4USt55UbwQbxkwFYmB2WQJilVGqer4t2sItEMnitJMOpdufzpm6bIEPUfOfxw==
X-Gm-Message-State: AOJu0YzFJA0LOpRb/LV0ceqnZQYBZ1ou8lFyW1uapQs1+SiNrKkMuX8t
 gl2x03nVRqkk/DA4BPttxpM+6epdyR2uTXWQQfMxBTPWADeKsLSH+0daTZfr
X-Google-Smtp-Source: AGHT+IEmFlhC9NyJVJJdqzncVigkcluv7g4mNSd+CY/mMhdMt51vTTo0EhfSAdIHc3/STEjaN5qzjQ==
X-Received: by 2002:a17:902:da8c:b0:1e0:d09d:ea59 with SMTP id
 j12-20020a170902da8c00b001e0d09dea59mr14532352plx.31.1711984435240; 
 Mon, 01 Apr 2024 08:13:55 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:b52c:9d5b:e7ea:d1ca])
 by smtp.gmail.com with ESMTPSA id
 z6-20020a170902708600b001e26191b9c2sm144738plk.67.2024.04.01.08.13.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 01 Apr 2024 08:13:54 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Mon,  1 Apr 2024 08:13:51 -0700
Message-ID: <20240401151351.248913-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.478.gd926399ef9-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In a case writing without fallocate(), we
 can't guarantee it's allocated in the conventional area for zoned stroage.
 To make it consistent across storage devices, we disallow it regardless of
 storage [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.169 listed in list.dnswl.org]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rrJML-0007J2-OL
Subject: [f2fs-dev] [PATCH v7] f2fs: prevent writing without fallocate() for
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
in the conventional area for zoned stroage. To make it consistent across
storage devices, we disallow it regardless of storage device types.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
v2: covered the direct io case
v3: covered the mkwrite case
v4: moved pin file check position in prepare_write_begin()
v5: removed unnecessary condition in f2fs_map_blocks() and disallowed
    pre-written inodes for file pinning
v6: check a hole for pinned files in mkwrite()
v7: changed data_blkaddr check condition in mkwrite()
---
 fs/f2fs/data.c | 20 ++++++++++++++++----
 fs/f2fs/file.c | 21 ++++++++++++---------
 2 files changed, 28 insertions(+), 13 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c21b92f18463..1b02a9291176 100644
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
+		    (f2fs_is_pinned_file(inode) &&
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
index 82277e95c88f..a8ac546b9abc 100644
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
 
@@ -114,19 +114,18 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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
+		if (f2fs_is_pinned_file(inode) &&
+		    !__is_valid_data_blkaddr(dn.data_blkaddr))
+			err = -EIO;
 	}
-#endif
+
 	if (err) {
 		unlock_page(page);
 		goto out_sem;
@@ -3235,7 +3234,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 		goto done;
 	}
 
-	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
+	if (F2FS_HAS_BLOCKS(inode)) {
 		ret = -EFBIG;
 		goto out;
 	}
@@ -4611,6 +4610,10 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
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
2.44.0.478.gd926399ef9-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
