Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 120672C7026
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Nov 2020 18:40:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kj4D7-00031J-9B; Sat, 28 Nov 2020 17:40:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shacharr@gmail.com>) id 1kj4D5-000311-T1
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Nov 2020 17:40:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o5M0Qk5wHG2QacembzBg5VIheheEu3YBTN3db8gj6qY=; b=XLReSyWjkn5RCjgVwnB+7Dwdxh
 uVakfCXwKybgK5xmlv8YD4vLP08vv/y7Xy8krUzi6dBkMt1mKhjCqn3s/Bco5TE2RfZdJuBFyxP3v
 SH1Lj3Y5Xr4ooRAzHw8ZMUk0yGbiIIf+DMgwYPxg5lGtRQSyPvlkJT5FFcCgC31y3mEc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=o5M0Qk5wHG2QacembzBg5VIheheEu3YBTN3db8gj6qY=; b=I
 ZLkww+DF9li6ccM3zDL5HnrzAvMqJgTUv3UUdWdbP9bSXe38KTzmpDrwaOzLql09jwRMM7dm70vkl
 JK2kr9Eh77d9dfIasGSattjFPx4yW5GJ5TXYb6aq/tFEE7v/Nl0GT8PwmODqXPlm7JvOZA3PStwHV
 k+KuCHeOst8tgx2s=;
Received: from mail-pl1-f194.google.com ([209.85.214.194])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kj4D1-008qIR-W8
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Nov 2020 17:40:35 +0000
Received: by mail-pl1-f194.google.com with SMTP id k5so4199926plt.6
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Nov 2020 09:40:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5M0Qk5wHG2QacembzBg5VIheheEu3YBTN3db8gj6qY=;
 b=XYeHz8VZPt56JJwlaQz3OfxTfaGeGURb9LOamoGaOMVgGH2KnHmYQLsFHcdEFvMqp+
 Am4yPx1+MpmrIx6g+fOnTymqPMrPdw06+9sfQf3pyuNN/Jl6FqXSmHT4Ki7VhwPfrzNd
 dbEny5yoS0sb3Nbt1Z/kxUC8m9LfFURHPgO5Z0mP+qyWWTJNOMhUmC/BfpRRU3dMF2IH
 CBLFkvUmqgLTprY55NoNpggd0w9YlYdMB9fwb8jd9FwDnmOorvm1gOcG4+f+BAX36e29
 Hugq3QIafEpOsIgEv86m4dFmz59ukcqc/YyyVLiPJcVaVytFl8LMLDdEkoxT64hCwKw2
 c2bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=o5M0Qk5wHG2QacembzBg5VIheheEu3YBTN3db8gj6qY=;
 b=CZmHzbCB9vtstVxd/mouGPbuaxxjb9jim/PhYm6J+uYNrGojsNZHrTD0vLPsoylrT8
 X4LJlryxZl3AbEjmph9uZruvnWGeZrcCw9F+xmTx/xzytKFOQUeo6DQdPH92aV1iadqv
 dPDBEweqUVdqZKLvaMpFXyzSCm3BGOrtuzto72RHKFX0Pggly0nvBcF+kQGAEREAKxkV
 zTUSgjNxVIp3ELl76rjCHX1FLKa4u3LzhRmv9w/EaGwUH3VSrlIWDgodx4Mqjh4cZ0KZ
 jRU5TEuXeCnUiC17hpEP/R4akEY0PTIoLPu2oaSyEpkBStWMrR8b9EywJ0kejo90cl8f
 Dyxg==
X-Gm-Message-State: AOAM531Lq1ZiVh/sroW/oxW4Q8t7bBck29jMRrxfQLywnijdfizZu0Ey
 r4Or1k4cBQHFW5Hcdm7xnp0=
X-Google-Smtp-Source: ABdhPJwMyHd0UGC8sDAuAM35fHi+FccXiEOE281/CXiUDGgdd4ce+UAFHU0RhzQNrCMcLxc3By1INQ==
X-Received: by 2002:a17:902:b408:b029:d6:d1e2:e1be with SMTP id
 x8-20020a170902b408b02900d6d1e2e1bemr11911471plr.34.1606585226332; 
 Sat, 28 Nov 2020 09:40:26 -0800 (PST)
Received: from hpilion.hsd1.wa.comcast.net
 (50-47-105-203.evrt.wa.frontiernet.net. [50.47.105.203])
 by smtp.gmail.com with ESMTPSA id y81sm11302246pfc.25.2020.11.28.09.40.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 09:40:25 -0800 (PST)
From: Shachar Raindel <shacharr@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, ebiggers@google.com,
 daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 28 Nov 2020 09:39:46 -0800
Message-Id: <20201128173946.22340-1-shacharr@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.194 listed in list.dnswl.org]
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (shacharr[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.194 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kj4D1-008qIR-W8
Subject: [f2fs-dev] [PATCH] f2fs: Fix deadlock between f2fs_quota_sync and
 block_operation
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
Cc: linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

f2fs_quota_sync is calling f2fs_lock_op, in an attempt to prevent
an AB/BA type deadlock with quota_sem locking in block_operation.
However, rwsem in Linux is not recursive. As a result, the following
deadlock may occur:

f2fs_quota_sync
down_read(cp_rwsem) // f2fs_lock_op
filemap_fdatawrite
f2fs_write_data_pages
...
                                       block_opertaion
				       down_write(cp_rwsem) - marks rwsem as "writer pending"
down_read_trylock(cp_rwsem) - fails as there is
                              a writer pending.
			      Code keeps on trying.

We solve this by creating a new rwsem, used specifically to
synchronize this case, instead of attempting to reuse an existing lock
for this
---
 fs/f2fs/f2fs.h  |  3 +++
 fs/f2fs/super.c | 13 +++++++++++--
 2 files changed, 14 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb700d797296..b3e55137be7f 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1448,6 +1448,7 @@ struct f2fs_sb_info {
 	struct inode *meta_inode;		/* cache meta blocks */
 	struct mutex cp_mutex;			/* checkpoint procedure lock */
 	struct rw_semaphore cp_rwsem;		/* blocking FS operations */
+	struct rw_semaphore cp_quota_rwsem;    	/* blocking quota sync operations */
 	struct rw_semaphore node_write;		/* locking node writes */
 	struct rw_semaphore node_change;	/* locking node change */
 	wait_queue_head_t cp_wait;
@@ -1961,12 +1962,14 @@ static inline void f2fs_unlock_op(struct f2fs_sb_info *sbi)
 
 static inline void f2fs_lock_all(struct f2fs_sb_info *sbi)
 {
+	down_write(&sbi->cp_quota_rwsem);
 	down_write(&sbi->cp_rwsem);
 }
 
 static inline void f2fs_unlock_all(struct f2fs_sb_info *sbi)
 {
 	up_write(&sbi->cp_rwsem);
+	up_write(&sbi->cp_quota_rwsem);
 }
 
 static inline int __get_cp_reason(struct f2fs_sb_info *sbi)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 00eff2f51807..5ce61147d7e5 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2209,8 +2209,16 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	 *  f2fs_dquot_commit
 	 *                            block_operation
 	 *                            down_read(quota_sem)
+	 *
+	 * However, we cannot use the cp_rwsem to prevent this
+	 * deadlock, as the cp_rwsem is taken for read inside the
+	 * f2fs_dquot_commit code, and rwsem is not recursive.
+	 *
+	 * We therefore use a special lock to synchronize
+	 * f2fs_quota_sync with block_operations, as this is the only
+	 * place where such recurrsion occurs.
 	 */
-	f2fs_lock_op(sbi);
+	down_read(&sbi->cp_quota_rwsem);
 
 	down_read(&sbi->quota_sem);
 	ret = dquot_writeback_dquots(sb, type);
@@ -2251,7 +2259,7 @@ int f2fs_quota_sync(struct super_block *sb, int type)
 	if (ret)
 		set_sbi_flag(F2FS_SB(sb), SBI_QUOTA_NEED_REPAIR);
 	up_read(&sbi->quota_sem);
-	f2fs_unlock_op(sbi);
+	up_read(&sbi->cp_quota_rwsem);
 	return ret;
 }
 
@@ -3599,6 +3607,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 	init_rwsem(&sbi->cp_rwsem);
 	init_rwsem(&sbi->quota_sem);
+	init_rwsem(&sbi->cp_quota_rwsem);
 	init_waitqueue_head(&sbi->cp_wait);
 	init_sb_info(sbi);
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
