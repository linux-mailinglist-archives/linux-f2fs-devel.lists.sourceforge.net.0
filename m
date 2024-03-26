Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A7F488D008
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Mar 2024 22:29:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rpEMN-0000Tw-QV;
	Tue, 26 Mar 2024 21:29:32 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rpEML-0000Tf-PV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 21:29:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oWIpvUmmuUd4IVbU7Iw4AFY1pG5K7APNMP8l68hu9ho=; b=HIsfRK77hMmLMSrGOp8WbGb/gW
 HnjAYFBv/7ZdKVF19VM7lSCkE0U1XUUifY6jXsB8uw5NpB9VQ19egjKf4Kmyxjusr3LfyomBNSGno
 tCbfsBAP7WQRo/AVQx1mHBClKNTCotIJQ7Aevx0xgjR5vwtkPi4+r7OqxnBWo7hvtdpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oWIpvUmmuUd4IVbU7Iw4AFY1pG5K7APNMP8l68hu9ho=; b=R
 B+8EzGMjShx3TVVQhVB09fcgy5/qbs0i+NcPJJJclfSc6NmmBcRNqGVSmvCnKfcpfd4D84/TResxv
 VvjYULGsA9D8J8T7GocHx/aabHyjL3yIfVQ/4xKsIUl3A0CUir9mapfenooq5HUfb+0jt4h2kol2m
 QvPgBJmjmMpYqrxY=;
Received: from mail-yb1-f172.google.com ([209.85.219.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rpEMI-0002sE-Im for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Mar 2024 21:29:30 +0000
Received: by mail-yb1-f172.google.com with SMTP id
 3f1490d57ef6-dc6dcd9124bso5880748276.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 26 Mar 2024 14:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1711488556; x=1712093356; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=oWIpvUmmuUd4IVbU7Iw4AFY1pG5K7APNMP8l68hu9ho=;
 b=PXPKH3c53LaWiD5nY6kfrCw8yWSMcEph/tqZb82+dg0Bd0q+Pfvm7FjsEJh8lVtacc
 bhOXvMiIbK/L/sGoH91mTcmn8QaFcc2ALh90Ge6pNQloxHYAtu/Snqnv6c5wuyj37HoH
 v8cOY67KyZhY8jLtEbDnNHOsnSVbfU9vx+LmLGsgSZk2g6Kt67FlX0P4PKuapypLlIh2
 1gEjH7D+6UfwPs4aCh+uNlFdDPV0uadxEHVMDWEcA2IMquZ5zLzMNeUTugi+hLFxVAHw
 sKZxI+Gn/m/9FpyORkFWCD37IGo3NrOHVn3/alZ+4ndAaqWmoQz+wCH1+MXT5Wh2yAm1
 tMcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711488556; x=1712093356;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=oWIpvUmmuUd4IVbU7Iw4AFY1pG5K7APNMP8l68hu9ho=;
 b=udYpEZyFvAAXU8zSoLqkEOyeFCAwAsX1+jWyz8RcnVFEaYHyYKTFWMy06ugovh7SjJ
 pwy52SvuSKSa8WJpr2v/jD20EE8Ib4gFlzs5MVlwkR8r0jkpiJ52G2aqjUDIdLizm6mx
 H2rz2+fIVDzSLIDnyzvBHxZtzPysb731CSj21A62iN8fU/y+GgB3FBd3QSEcyh+WDRAc
 Q3VF8S5tBNUwQ5ZckWETI5UmV+yFQanArvLWUeKoxR0pLjMdlE10EojMOvjycdx73EC0
 OuMvvdJxjONXRLGERv0/wW3uv5lVwycZDN/CjsKO6evqNviYgKjE5s/ZLguC3U0q8RDx
 sbyw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXyMk0uAD+CMmTfmVrtJjnCuCuzfpom7tkx1a/9LS5dOWjeRndO+laq/WtVxdfSlKz1Zv/OmWj/rXwEMQ7Mr3jSaKZ5abX94uTtVjCUgKkFZ79THBLlNQ==
X-Gm-Message-State: AOJu0YwCDnH57xEJdBN9dH7d+zuBFbFzSTbkts7JkBTtIxoLbWgvdpUe
 gRH3W7qcXgPug5E+5Z2SSfX9Ow7XHV/60tdefVmvDGfmzjaYJ6PgX7H5wJ3W
X-Google-Smtp-Source: AGHT+IFvFxp511Ppefu6lB/2hF5JJHC2DrMBwr+oLjF2vHyJWwQlH/ghml9tDaCKjUMnMtZTyYhbmw==
X-Received: by 2002:a05:6a00:ad5:b0:6ea:7468:1f31 with SMTP id
 c21-20020a056a000ad500b006ea74681f31mr997043pfl.30.1711485093309; 
 Tue, 26 Mar 2024 13:31:33 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:6e7a:7c1d:ebf:951e])
 by smtp.gmail.com with ESMTPSA id
 k9-20020aa79d09000000b006e535bf8da4sm6364595pfp.57.2024.03.26.13.31.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Mar 2024 13:31:32 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 26 Mar 2024 13:31:30 -0700
Message-ID: <20240326203130.85748-1-daeho43@gmail.com>
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
 To make it consistent across storage devices, we disallow it regardless of
 storage [...] 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.172 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1rpEMI-0002sE-Im
Subject: [f2fs-dev] [PATCH v5] f2fs: prevent writing without fallocate() for
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
---
 fs/f2fs/data.c | 20 ++++++++++++++++----
 fs/f2fs/file.c | 18 +++++++++---------
 2 files changed, 25 insertions(+), 13 deletions(-)

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
index 82277e95c88f..7aa53cf553a1 100644
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
@@ -3235,7 +3231,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 		goto done;
 	}
 
-	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
+	if (F2FS_HAS_BLOCKS(inode)) {
 		ret = -EFBIG;
 		goto out;
 	}
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
