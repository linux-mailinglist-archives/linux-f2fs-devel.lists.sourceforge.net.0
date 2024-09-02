Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4815968486
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Sep 2024 12:21:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sl4BS-0004JG-GH;
	Mon, 02 Sep 2024 10:21:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivani.agarwal@broadcom.com>) id 1sl4BO-0004J8-Vh
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 10:21:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=; b=Rxbmwasd7Jk1S+kEtwgic4Kay0
 QtGjfZMB21A25zMFB8xGSa5AZzrbDUVq00kWAeiXLSekOYIvR12bOxuZmDqA2zqQcT7eM97TaWxXc
 dsCyKfN0CGxKiKazt+lXs1YDHvtLZm0IshELKB4+XOe1aIl2S5yLyZfEvxFE8sRercmE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=; b=D
 +Vvi8Q0m1pDq32RuxQvGU+x/IgJHUtoJzGy0ndsxjLAB8pSHPTaBdrZcW9wfBSu64GDSswS/qTU8G
 RhLfKbHE+odVp1iwQbYPQihTfjD1MNAevouNortRK8pmvauf+2GeiH0MhOhLeg8gqic2wD5esTliN
 g7bUdA7Nk6CmoIWg=;
Received: from mail-pl1-f180.google.com ([209.85.214.180])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1sl4BM-0003Ir-LB for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Sep 2024 10:21:14 +0000
Received: by mail-pl1-f180.google.com with SMTP id
 d9443c01a7336-1fc47abc040so31962525ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 02 Sep 2024 03:21:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=broadcom.com; s=google; t=1725272462; x=1725877262;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=;
 b=BBOKHHozQ7ypiRooTJAnPDHVTAefOCVFCWmpWMwKw2kXw79IcJJ4+YbzpBRPFdn2ms
 t3MJz4Z4gd0WTOvUNxqjlxxDwkfWST4S5HbcZftZdwC35tKMgee7MZeodPqjnz7IwZIh
 edJIpEclScQUQ53jBSMQGwf6AHjj4Em9XWadg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1725272462; x=1725877262;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=WGC2/wr/WrQEE/BTETF77jc4B4si+qDhZdrDFSYRq0o=;
 b=EdMsH4MBrgdz2sbEX/P/m2pILBwvpcZlQy8gCXR+QlWWSpEQUHw62osa7gXs9Alj1N
 qMNcKnNXalO57uI1kLdES0QuJ6/AGIbwpjAYKAOpnS6stL5QnnX7vXfpb2zrcqosWWgm
 Uve6KqBNgJhbnd6h5WBL4nklqD/oL8lF90gem/S8yQMyv7KsDDmjCQjTOonsVSylubQj
 mDKhcGprlDrkd9vCzupnRe9uKttuYGAHz17ZMrJ8bokqT87noglK4HbZcxnKuKbvH26l
 VEpwt4O9lBqoV9QQTif5WjW1B1FqyWZR5CCT2oKpQJglTGj8q4PxVQ4JPGU+WobsnvOo
 gpjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9HuUkSYy8CANZjVXo8oc/F6h2fEM9atJ4R4+FDnr6KBfNOCrjd8vvPaca/u7wVzBKV1SLf3C2NDUCtVhs9KWD@lists.sourceforge.net
X-Gm-Message-State: AOJu0YxVcWs75QrhuROQufB2Ajhhi4AiqX02O6Mwm6XIp8s3z8N9NBw1
 B+zVoil9/8T8fj7dBaQZn9rZNagJifr+PTmbMoxRqUIMf5gDE16jXpGZ3iKGZNTv2Bo9rDKGs8G
 PFtj1
X-Google-Smtp-Source: AGHT+IFFpNABbTR0Od9shAUxCDh79Vy9bj/kSc4NPnioHYER2337/NQN6V4/JU6s6tEeQo6iwe2zmw==
X-Received: by 2002:a17:90a:eb08:b0:2d8:d254:6cdd with SMTP id
 98e67ed59e1d1-2d8d2547050mr2801998a91.38.1725269184969; 
 Mon, 02 Sep 2024 02:26:24 -0700 (PDT)
Received: from shivania.eng.vmware.com ([66.170.99.1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2d82a6e0700sm7904747a91.1.2024.09.02.02.26.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Sep 2024 02:26:24 -0700 (PDT)
To: stable@vger.kernel.org,
	gregkh@linuxfoundation.org
Date: Mon,  2 Sep 2024 02:26:16 -0700
Message-Id: <20240902092616.5249-1-shivani.agarwal@broadcom.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Chao Yu <chao@kernel.org> [ Upstream commit
 298b1e4182d657c3e388adcc29477904e9600ed5
 ] chenyuwen reports a f2fs bug as below: 
 Content analysis details:   (-0.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.180 listed in list.dnswl.org]
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.180 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.1 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1sl4BM-0003Ir-LB
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
