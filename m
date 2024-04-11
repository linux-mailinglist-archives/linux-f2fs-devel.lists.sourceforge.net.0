Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E70908A1CBD
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 11 Apr 2024 19:55:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ruydM-0001yi-KR;
	Thu, 11 Apr 2024 17:54:49 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1ruydH-0001y8-Oa
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 17:54:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=a4DDpn1Eq0nNcCdvrJFmNc0O+jMNIAuY67jvBBKAph0=; b=ISv0TylrGKp/tPNLD4saGQJ7x9
 Wp+ZEqmqXsi6idFmnn4CjHe/O+bGHp1gI7E/f9LjlGDmYKc+CxzWApGtcYtKby9DQoqjb5yIvRr5A
 Zh8VTFtdi3ceIGg2rWk57Pp0Bq2cFD7cj8dgppW7BLaLqGYFAfWrfn86aZZIIFxxyD4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=a4DDpn1Eq0nNcCdvrJFmNc0O+jMNIAuY67jvBBKAph0=; b=Q
 G1S8PNpuW3sTiQUNFMuIBnCpD5NgkAbmxZso9606ohpe+tVzv3lNBlWwd8THtn3+lMw9/2SU++4+l
 RMbdzZVte9Zpav1aaR5OteW7nNTJIdR49tX7YUKFeNO9kQdbLKG6x9nGPW7BNWI9kK5H3puIJIdzz
 dKNM0B08gq2Cgqnc=;
Received: from mail-pf1-f169.google.com ([209.85.210.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ruydH-0004l2-IS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 11 Apr 2024 17:54:44 +0000
Received: by mail-pf1-f169.google.com with SMTP id
 d2e1a72fcca58-6ed3cafd766so142995b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 11 Apr 2024 10:54:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1712858073; x=1713462873; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=a4DDpn1Eq0nNcCdvrJFmNc0O+jMNIAuY67jvBBKAph0=;
 b=P5T1GFfdOvl/2J3J686X/jBZf6K74VOcO5yMUZ7IA4iEmG2wY/0N0hhW6BM/njsQHK
 XbYLrGqhVmjHp2UCCLwWiRpeKx2Vx1y4PKMu8E6FeKnPZwrD3dKGndf/9HoJx+71+b7D
 y/J9UD9nsTnVaIkoEDykw3a+A4ltiae5HFB26vRaxmAW1wbGw9dHZ7IHX4zp3q/KCWab
 E3LW282FDfDelZK7r0a8+Y4Sj9t9LLPz6Gc6w3U6tpmAGZWWKaK166644P9ax/BRlSa9
 q1ySO3F0bSGk4SPxbw/Ojx9xBunShzntixifV9gQXyuWPt4XnQOz/QTcv3G5uNXfiecG
 3hjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712858073; x=1713462873;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=a4DDpn1Eq0nNcCdvrJFmNc0O+jMNIAuY67jvBBKAph0=;
 b=otMdFOsCBmzECpKQgUk13uXhGxs5zXFnrdixH/CeHSTLUrp+IW7GZJV8f1jGqKBVZ5
 IkfsbWvUKWu5QtCClpDTzWccBt/PC64DgLa64EXbxpMz+woTGmBMBDkZWxmtxUBRxfqM
 2NupbLC9zxtRokoqY3YsNKT8/taTG3H6ofK9dKfjz+ZWRoTj/X3Xkc2LLbYc77x5A+b5
 e4fgg2ZxsJOhuaom6jQFwUfw04/CU/B9Cg8DcOBEJnT7kqeeO1vfSce0HHJfHkbR4GV/
 fmKPZae14PliLYgOzmJpHL9l1fZby7UGNXhtyEnuYL8hMh8B+9+vgbDqW7M5OgKobHmd
 YEng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX3qVv0frbwSDP3sWSMvRSQy0DVo4Xt4X1Ep6+raG5mdh3aFrxA3Te+NU6BDkOfhObJcXWnaMWyXN5p3TheOqLb0Wg43TQgSQoLuF1mlt1VPoo0bdHvsA==
X-Gm-Message-State: AOJu0YwfKjlDYr4A2DDNLWF7Wgr153iQ/+mwX03PXSNJQZI+3WjzBq0c
 Pqar6gJgNlyJQV5uN3luSJlpG8NB03/J6FsPlCg4sfGWuO9Uj3LO
X-Google-Smtp-Source: AGHT+IH+Ydi5OoZ6JvRFdb+9Ii5yIhzKmvNDZeyMKRfOU8fdMRUFJ9zfqBVZ6EsrWL8GMc1frhzAYQ==
X-Received: by 2002:a17:902:ba94:b0:1e0:a3dd:82df with SMTP id
 k20-20020a170902ba9400b001e0a3dd82dfmr152048pls.38.1712858073005; 
 Thu, 11 Apr 2024 10:54:33 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:e309:9090:b8ac:35b1])
 by smtp.gmail.com with ESMTPSA id
 w14-20020a170902e88e00b001e0af9928casm1444843plg.55.2024.04.11.10.54.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Apr 2024 10:54:32 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 11 Apr 2024 10:54:10 -0700
Message-ID: <20240411175410.2406710-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
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
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [209.85.210.169 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1ruydH-0004l2-IS
Subject: [f2fs-dev] [PATCH 1/2] f2fs: prevent writing without fallocate()
 for pinned files
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
v8: replaced overwrite check parts with f2fs_overwrite_io()
---
 fs/f2fs/file.c | 25 ++++++++++++++++---------
 1 file changed, 16 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 1761ad125f97..3ee61bc82c6f 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -58,7 +58,7 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	struct inode *inode = file_inode(vmf->vma->vm_file);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct dnode_of_data dn;
-	bool need_alloc = true;
+	bool need_alloc = !f2fs_is_pinned_file(inode);
 	int err = 0;
 	vm_fault_t ret;
 
@@ -115,19 +115,18 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
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
@@ -3234,7 +3233,7 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 		goto done;
 	}
 
-	if (f2fs_sb_has_blkzoned(sbi) && F2FS_HAS_BLOCKS(inode)) {
+	if (F2FS_HAS_BLOCKS(inode)) {
 		ret = -EFBIG;
 		goto out;
 	}
@@ -4798,6 +4797,8 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 	bool dio;
 	bool may_need_sync = true;
 	int preallocated;
+	const loff_t pos = iocb->ki_pos;
+	const ssize_t count = iov_iter_count(from);
 	ssize_t ret;
 
 	if (unlikely(f2fs_cp_error(F2FS_I_SB(inode)))) {
@@ -4819,6 +4820,12 @@ static ssize_t f2fs_file_write_iter(struct kiocb *iocb, struct iov_iter *from)
 		inode_lock(inode);
 	}
 
+	if (f2fs_is_pinned_file(inode) &&
+	    !f2fs_overwrite_io(inode, pos, count)) {
+		ret = -EIO;
+		goto out_unlock;
+	}
+
 	ret = f2fs_write_checks(iocb, from);
 	if (ret <= 0)
 		goto out_unlock;
-- 
2.44.0.683.g7961c838ac-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
