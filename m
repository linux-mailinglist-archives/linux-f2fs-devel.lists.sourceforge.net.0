Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DA54F1CA723
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 11:29:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWzK5-00045U-6M; Fri, 08 May 2020 09:29:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <daeho43@gmail.com>) id 1jWzK4-00045N-4f
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 09:29:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ldGaH/i5o6GoX20vOdk2WWYTa7ZaAt0UIe0wBFqIoo0=; b=UqSksSKJUz0vyTG166zSXFAl2u
 MyJAWXf4WC3AzyzX7h/QXB8nOkbUm3izDc3cjuhJdhZORJQr40kCy2n98IXjgEAr0mrtsHsry4tdw
 Ut6tJC5zYAnOLn3nLnMW8oSXHRbOttT/iXbeEyiqTnIgBuu/Akpcd/dHbK7HmAaQXhhs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ldGaH/i5o6GoX20vOdk2WWYTa7ZaAt0UIe0wBFqIoo0=; b=A
 hDpDJbQxUyJ9QkkXl2yLZ3mqCKtv4JFeW7kWD7vb4DPU+CPMGxOKTx5vZIJr2nPEUcdfDtgYKFIBg
 /VCl13T10j5dgHTo5aYp+IzUCrGFGyLVkyYCMxHZLbwPWieRc7alodekp16yBxhCKef27lsYyY3Up
 smktto43hcar5wZg=;
Received: from mail-pg1-f196.google.com ([209.85.215.196])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWzK2-00CJBl-6g
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 May 2020 09:29:36 +0000
Received: by mail-pg1-f196.google.com with SMTP id d22so625639pgk.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 May 2020 02:29:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldGaH/i5o6GoX20vOdk2WWYTa7ZaAt0UIe0wBFqIoo0=;
 b=hXEgvu6XerQec+yDHT+Xzid0SQOXR+dv+CWwBLmzcXibODZXAyIBEUn9baPX6zeewt
 BG6QcmM94vJG/ODLNCayffiB9FQl8HUZOfHk4iJen2x9UN0IxYBpaD9P9dy3nss6aAN9
 AYooASKy/NsfRzi1fjIoP2BD8agejwibtgjuWcT+wt0DqYCZOBEYpFyv5Nj/edt+mp0D
 Ad8tQMxuU37A4DvSsZPMS3ssAy78JJvwS7INRNR6JGS8H+kjjsPa8FxJcrkDnEsdHaPs
 n+EKfNx7lsSqWcvjb8DRq1BdrnZOKlFa3xRZ0Ea5sllYvNjLZpXEdiK054BSU2JITFtA
 QYdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=ldGaH/i5o6GoX20vOdk2WWYTa7ZaAt0UIe0wBFqIoo0=;
 b=OUWOv/cgUkQSXf5yr/7r1JCzy1A7t2/E57db97qPGokwux0qPX1hn6Cwof9xHC3WSU
 sX56/GbgCeygkC9g0eAsAkRy4EjkQD7ORsE1JFKzCVr6/5CzadvWXdlZrQSFAsN9nJQJ
 yvyS5L8pUoUUlpNYx+BzblHbortG5cV3DnND0DTscwTjT+Ye/MU2ptyG4adOEfcBuQV4
 VPSN32S5c3gQyWRM0UL6QSGjEtSnxyMT6nFLmHmUdERNVCpxF9WBeGHH4aCnLus/PHPT
 DG6mOaOljbiEqC7cs+QPlWxrryGFlNfxB0XIctBgjqSKBIF3Klv00fEEpMC40n323hE9
 0huw==
X-Gm-Message-State: AGi0PuaRmFF0XL85d3M3WTgFeKB4tYL/ckr17CpnlonbJWiuDKVlaX4u
 OigpZ7bmng6UXmIzCIckyow=
X-Google-Smtp-Source: APiQypLIwVEcBhwZSbpvnl7V3h25O/m4ffXBeoQOGFB9qxplaAn8T0fJActxNq2mQT+UYoq9xctO0A==
X-Received: by 2002:a63:1103:: with SMTP id g3mr1449989pgl.206.1588930168385; 
 Fri, 08 May 2020 02:29:28 -0700 (PDT)
Received: from daehojeong1.seo.corp.google.com
 ([2401:fa00:d:1:b8f4:bbde:37ba:20bd])
 by smtp.gmail.com with ESMTPSA id 4sm1248292pff.18.2020.05.08.02.29.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 May 2020 02:29:27 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com, jaegeuk@kernel.org, yuchao0@huawei.com
Date: Fri,  8 May 2020 18:29:21 +0900
Message-Id: <20200508092921.208447-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.26.2.645.ge9eca65c58-goog
MIME-Version: 1.0
X-Spam-Score: 0.2 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.196 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (daeho43[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.196 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (daeho43[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1jWzK2-00CJBl-6g
Subject: [f2fs-dev] [PATCH] f2fs: remove race condition in releasing cblocks
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

Now, if writing pages and releasing compress blocks occur
simultaneously, and releasing cblocks is executed more than one time
to a file, then total block count of filesystem and block count of the
file could be incorrect and damaged.

We have to execute releasing compress blocks only one time for a file
without being interfered by writepages path.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/file.c | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 4aab4b42d8ba..f7de2a1da528 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3488,6 +3488,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int released_blocks = 0;
 	int ret;
+	int writecount;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
 		return -EOPNOTSUPP;
@@ -3502,20 +3503,33 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	if (!F2FS_I(inode)->i_compr_blocks)
-		goto out;
-
 	f2fs_balance_fs(F2FS_I_SB(inode), true);
 
 	inode_lock(inode);
 
-	if (!IS_IMMUTABLE(inode)) {
-		F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
-		f2fs_set_inode_flags(inode);
-		inode->i_ctime = current_time(inode);
-		f2fs_mark_inode_dirty_sync(inode, true);
+	writecount = atomic_read(&inode->i_writecount);
+	if ((filp->f_mode & FMODE_WRITE && writecount != 1) || writecount) {
+		ret = -EBUSY;
+		goto out;
 	}
 
+	if (IS_IMMUTABLE(inode)) {
+		ret = -EINVAL;
+		goto out;
+	}
+
+	ret = filemap_write_and_wait_range(inode->i_mapping, 0, LLONG_MAX);
+	if (ret)
+		goto out;
+
+	if (!F2FS_I(inode)->i_compr_blocks)
+		goto out;
+
+	F2FS_I(inode)->i_flags |= F2FS_IMMUTABLE_FL;
+	f2fs_set_inode_flags(inode);
+	inode->i_ctime = current_time(inode);
+	f2fs_mark_inode_dirty_sync(inode, true);
+
 	down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	down_write(&F2FS_I(inode)->i_mmap_sem);
 
@@ -3554,9 +3568,9 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	up_write(&F2FS_I(inode)->i_mmap_sem);
-
-	inode_unlock(inode);
 out:
+	inode_unlock(inode);
+
 	mnt_drop_write_file(filp);
 
 	if (ret >= 0) {
-- 
2.26.2.645.ge9eca65c58-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
