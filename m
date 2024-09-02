Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CB42996838C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 11:48:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sl3fl-0005lf-1q;
	Mon, 02 Sep 2024 09:48:33 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivani.agarwal@broadcom.com>) id 1sl3fi-0005lY-Rr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 09:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=; b=WDcZeVWyVvPPX8h6xLS/2Tbfhb
 YL9DVaEFAipUXzmrY4/jPyT9B3359qVUIUWfPgQfNVBs4oIGMKb54eMrLanhnC+LdkV0vWMezlPdo
 efrMGgE3KLlaK42zvqJGYp0dJcAHGVE9qbW2cU2XMtyU6wiZ6jQWkZC7a4pahfjDqYeM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=; b=A
 tbUA9hnMYXKX0lScwVb8UCXA1V1s2rQn+GUTug2t7dAnkFwAHc+Yn2BK5JZkb1wk0fyTsZajbLsGE
 O49z1n6BDnHM4YZFgN6YTQgnrsyygqEoWZSfUzekQY+ZvIVDbytqVPog4bCAu19Q/4xzRlz42xR2k
 bCkEEZEVenHkJmg4=;
Received: from mail-qv1-f49.google.com ([209.85.219.49])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sl3fh-0000OW-VB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 09:48:30 +0000
Received: by mail-qv1-f49.google.com with SMTP id
 6a1803df08f44-6c352bcb569so12196526d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Sep 2024 02:48:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725270499; x=1725875299;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=;
 b=W5vgcTQ8VAc0KmQNNf3M9mz5thEEMIzKEIGyLWj39Hv2xlpD8EWuKEemW9+DoiXKjN
 /dSnRNGA4MMadGRsSx1kkJHlei1r1OcOvlAML/Rc/RqGfmqiJsOeB8TnPcsQhEskEt8D
 Va4AQeCigexIoPiFVOlPLescge6bM7u+8LP+o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725270499; x=1725875299;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=;
 b=N7fIe06k9l7hQjS7+Hx+Ob8B1sdvpLopUqBgnxWqyver3KZtl2CbxGFL5XNUlZe+Ba
 TI6uCsHEtOFdrIh16eAjX8QfpCCzjzVCYDXkSOVGPXCAb+JSYpjgWQedMxJ94IrsobXF
 SivOBF4h3/LBe/BWfwoR1C1CM+M8W4zl3nvrolCAeS50/ht+DKKQZLtsmOFYMvJLLf7h
 vhUXbfYYz5f3jSIZQnYf72fj5sJX0F66/z06AzH9RE3vdX6hzyjDwhhhSwjjuOgoS7tx
 E8E1vuRHPbQTu39EEOuiz5kId4BhgcXIUU/Fus8q7usr/499+0Oq+iFQwmf6wEUlsqhh
 dCZg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSAYyiL89eI2X71wofZcGsTyK/GQkGmnxu+cDkfBzZTSOVmI+nqQBKMMmpxQJ+UAwXEpF2xMLeHZia1c2mKnBW@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyCk3i+LWsF0s0kFP6axS2ds20OvTpnHibQeOAQA/ilRDOiiLTw
 9o39qkujbfMfNlFGNguf6mA6XZgXVoVw6z2y6tGWigSryME4SJ2z/AfB/4H5v1ggiUx2F2zxMTX
 mQQza
X-Google-Smtp-Source: AGHT+IHvDWC+orccoTAH9Nz3IAZQPy84jFzwKssu8xWtUujKJAW/7Ch2F+6bGNdqKjZicYipFJdvnQ==
X-Received: by 2002:a17:903:22ce:b0:202:3a75:ec89 with SMTP id
 d9443c01a7336-205466f906dmr67691635ad.31.1725268943866; 
 Mon, 02 Sep 2024 02:22:23 -0700 (PDT)
Received: from shivania.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-205152cd65esm62705985ad.77.2024.09.02.02.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 02:22:23 -0700 (PDT)
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Date: Mon,  2 Sep 2024 02:22:13 -0700
Message-Id: <20240902092213.4982-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 298b1e4182d657c3e388adcc29477904e9600ed5
 ] chenyuwen reports a f2fs bug as below: 
 Content analysis details:   (-0.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.49 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.49 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sl3fh-0000OW-VB
Subject: [f2fs-dev] [PATCH v6.1] f2fs: fix to truncate preallocated blocks
 in f2fs_file_open()
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
From: Shivani Agarwal via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Shivani Agarwal <shivani.agarwal@broadcom.com>
Cc: Sasha Levin <sashal@kernel.org>, ajay.kaher@broadcom.com,
 linux-kernel@vger.kernel.org, alexey.makhalov@broadcom.com,
 vasavi.sirnapalli@broadcom.com, chenyuwen <yuwen.chen@xjmz.com>,
 Shivani Agarwal <shivani.agarwal@broadcom.com>, jaegeuk@kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <chao@kernel.org>

[ Upstream commit 298b1e4182d657c3e388adcc29477904e9600ed5 ]

chenyuwen reports a f2fs bug as below:

Unable to handle kernel NULL pointer dereference at virtual address 0000000000000011
 fscrypt_set_bio_crypt_ctx+0x78/0x1e8
 f2fs_grab_read_bio+0x78/0x208
 f2fs_submit_page_read+0x44/0x154
 f2fs_get_read_data_page+0x288/0x5f4
 f2fs_get_lock_data_page+0x60/0x190
 truncate_partial_data_page+0x108/0x4fc
 f2fs_do_truncate_blocks+0x344/0x5f0
 f2fs_truncate_blocks+0x6c/0x134
 f2fs_truncate+0xd8/0x200
 f2fs_iget+0x20c/0x5ac
 do_garbage_collect+0x5d0/0xf6c
 f2fs_gc+0x22c/0x6a4
 f2fs_disable_checkpoint+0xc8/0x310
 f2fs_fill_super+0x14bc/0x1764
 mount_bdev+0x1b4/0x21c
 f2fs_mount+0x20/0x30
 legacy_get_tree+0x50/0xbc
 vfs_get_tree+0x5c/0x1b0
 do_new_mount+0x298/0x4cc
 path_mount+0x33c/0x5fc
 __arm64_sys_mount+0xcc/0x15c
 invoke_syscall+0x60/0x150
 el0_svc_common+0xb8/0xf8
 do_el0_svc+0x28/0xa0
 el0_svc+0x24/0x84
 el0t_64_sync_handler+0x88/0xec

It is because inode.i_crypt_info is not initialized during below path:
- mount
 - f2fs_fill_super
  - f2fs_disable_checkpoint
   - f2fs_gc
    - f2fs_iget
     - f2fs_truncate

So, let's relocate truncation of preallocated blocks to f2fs_file_open(),
after fscrypt_file_open().

Fixes: d4dd19ec1ea0 ("f2fs: do not expose unwritten blocks to user by DIO")
Reported-by: chenyuwen <yuwen.chen@xjmz.com>
Closes: https://lore.kernel.org/linux-kernel/20240517085327.1188515-1-yuwen.chen@xjmz.com
Signed-off-by: Chao Yu <chao@kernel.org>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
Signed-off-by: Shivani Agarwal <shivani.agarwal@broadcom.com>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/file.c  | 42 +++++++++++++++++++++++++++++++++++++++++-
 fs/f2fs/inode.c |  8 --------
 3 files changed, 42 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index a02c74875..2b540d878 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -788,6 +788,7 @@ enum {
 	FI_ALIGNED_WRITE,	/* enable aligned write */
 	FI_COW_FILE,		/* indicate COW file */
 	FI_ATOMIC_COMMITTED,	/* indicate atomic commit completed except disk sync */
+	FI_OPENED_FILE,         /* indicate file has been opened */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c6fb179f9..62f2521cd 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -538,6 +538,42 @@ static int f2fs_file_mmap(struct file *file, struct vm_area_struct *vma)
 	return 0;
 }
 
+static int finish_preallocate_blocks(struct inode *inode)
+{
+	int ret;
+
+	inode_lock(inode);
+	if (is_inode_flag_set(inode, FI_OPENED_FILE)) {
+		inode_unlock(inode);
+		return 0;
+	}
+
+	if (!file_should_truncate(inode)) {
+		set_inode_flag(inode, FI_OPENED_FILE);
+		inode_unlock(inode);
+		return 0;
+	}
+
+	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+	filemap_invalidate_lock(inode->i_mapping);
+
+	truncate_setsize(inode, i_size_read(inode));
+	ret = f2fs_truncate(inode);
+
+	filemap_invalidate_unlock(inode->i_mapping);
+	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
+
+	if (!ret)
+		set_inode_flag(inode, FI_OPENED_FILE);
+
+	inode_unlock(inode);
+	if (ret)
+		return ret;
+
+	file_dont_truncate(inode);
+	return 0;
+}
+
 static int f2fs_file_open(struct inode *inode, struct file *filp)
 {
 	int err = fscrypt_file_open(inode, filp);
@@ -554,7 +590,11 @@ static int f2fs_file_open(struct inode *inode, struct file *filp)
 
 	filp->f_mode |= FMODE_NOWAIT;
 
-	return dquot_file_open(inode, filp);
+	err = dquot_file_open(inode, filp);
+	if (err)
+		return err;
+
+	return finish_preallocate_blocks(inode);
 }
 
 void f2fs_truncate_data_blocks_range(struct dnode_of_data *dn, int count)
diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index ff4a4e92a..5b672df19 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -549,14 +549,6 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	}
 	f2fs_set_inode_flags(inode);
 
-	if (file_should_truncate(inode) &&
-			!is_sbi_flag_set(sbi, SBI_POR_DOING)) {
-		ret = f2fs_truncate(inode);
-		if (ret)
-			goto bad_inode;
-		file_dont_truncate(inode);
-	}
-
 	unlock_new_inode(inode);
 	trace_f2fs_iget(inode);
 	return inode;
-- 
2.39.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
