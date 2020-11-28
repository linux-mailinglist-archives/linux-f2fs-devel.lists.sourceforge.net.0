Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DFD452C7027
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 28 Nov 2020 18:41:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kj4EF-00017X-Mo; Sat, 28 Nov 2020 17:41:47 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <shacharr@gmail.com>) id 1kj4EE-00017P-5e
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Nov 2020 17:41:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=40L//mR7mpkTS3t1iaELnVbQvjPoARioHELJuLQ1ZOA=; b=Yy/K+hvSYzvW7+IeABSISAGIrt
 sws038PsdznN2hlysAS9RF1CdZGspXFLeyJEe9wkWEaH1PbSwesSwzeZplWgFupApXnvkL556rCSL
 9hKPFkSpHg3UWUzPZPkKgVQVoEwtfCNaIkMdj6Wrb+hxxBMlh+bF3a1F22er5jhLdiFo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=40L//mR7mpkTS3t1iaELnVbQvjPoARioHELJuLQ1ZOA=; b=C
 bliGMU40ue71A/aTKADDEZvHrpJ9JEIT8V31BKoS1o930PiXG3DisW5YgInK05supQ5O4Y4utbesM
 KqTPCyAIzLkxyv4N4P3FHXTnGexB7Qs8vA5ygvZAZc8Sypf+r0H5xv636moeOjiMIVZPcS5eYwVK1
 QJOUZF2v2PFvrR6I=;
Received: from mail-pl1-f193.google.com ([209.85.214.193])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kj4E3-003JRm-Pe
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 28 Nov 2020 17:41:46 +0000
Received: by mail-pl1-f193.google.com with SMTP id l1so4207314pld.5
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 28 Nov 2020 09:41:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=40L//mR7mpkTS3t1iaELnVbQvjPoARioHELJuLQ1ZOA=;
 b=pgCPDm1rOx/KGw+G2zsZ96CTC3/SsDRwhMm57nw4knrqMFbvKIDkQEzD0bDuGjFg06
 qrAQNqeRfIYRbWlprQf5fc3bWlgjxUPQIw1Sk5AbWwdhsu2VlbbYM7VFBBHKm90qyWzJ
 k8Dzm7PH1tvsACKQ48DXq/iB0GLHIzc5v0QPZipTdYGw9mxzBEdQnb2ckuV50+asQp15
 apeu0PQFPCRM6SUup8X+yJXrtjkUzrsmm4y7/vMa/YKAKb5u27GXWfLpnXkpHeqfk515
 opvXeZRjKkiRhDMm484VO1f0KKmdYKDb8nUujZ8DhFGoJ6p/USH8SB4BZh/j1YQfGDFw
 eTOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=40L//mR7mpkTS3t1iaELnVbQvjPoARioHELJuLQ1ZOA=;
 b=VttwpIcQFV2O3ryG8TJm1jZLChVofLRHYllfdVAioP8cv2j4pNUw+XO8etW67NSgt1
 Zlfy1BWwSYDIYfvZfXpXsSAk0ohGhZNi3ZuLB36Q/tH/0Qvy8ix6Gg0kXhjuqlCG5aCl
 1mWeV+FL0PQzPbAG5z+p0YRH6qHS1ieaN/AFiKaxNP3KrjQILDlb4yCOcvKvpIn1apEZ
 6L6+YFTZAdQmxhY1Y+vkw9IX0gC7Yiub/K8vtWneMxHjmEEQ9O609LXnJJYC4pzrTMdv
 PYMCKrBbypq5DMhMaFNHnvRJ5RDr5jnoSgrc0LWbjeV0WZ5JHi4VT/p6O14asaSbTDYP
 ihyw==
X-Gm-Message-State: AOAM530+4pacFKWKjYKJlSDhdks8Huab91x2lFX3FIhmVwAKa6RnX4of
 L9Qv+OF1Phr0kXx1BGGx9JB0Focf4ACPpj91
X-Google-Smtp-Source: ABdhPJwPOscNvx1pSiNFc6Cpt1i7blHZkozSHzGjS9avpj0QcYGA1CLtmW6e+ZzXXJU5kXMuNPx8ww==
X-Received: by 2002:a17:902:32d:b029:d9:d8a9:11e4 with SMTP id
 42-20020a170902032db02900d9d8a911e4mr11883997pld.6.1606585290184; 
 Sat, 28 Nov 2020 09:41:30 -0800 (PST)
Received: from hpilion.hsd1.wa.comcast.net
 (50-47-105-203.evrt.wa.frontiernet.net. [50.47.105.203])
 by smtp.gmail.com with ESMTPSA id gb4sm15610246pjb.30.2020.11.28.09.41.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 28 Nov 2020 09:41:29 -0800 (PST)
From: Shachar Raindel <shacharr@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, ebiggers@google.com,
 daehojeong@google.com, linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 28 Nov 2020 09:41:24 -0800
Message-Id: <20201128174124.22397-1-shacharr@gmail.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (shacharr[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.214.193 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.193 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kj4E3-003JRm-Pe
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

This deadlock is hitting Android users (Pixel 3/3a/4) with Magisk, due
to frequent umount/mount operations that trigger quota_sync, hitting
the race. See https://github.com/topjohnwu/Magisk/issues/3171 for
additional impact discussion.

In commit db6ec53b7e03, we added a semaphore to protect quota flags.
As part of this commit, we changed f2fs_quota_sync to call
f2fs_lock_op, in an attempt to prevent an AB/BA type deadlock with
quota_sem locking in block_operation.  However, rwsem in Linux is not
recursive. Therefore, the following deadlock can occur:

f2fs_quota_sync
down_read(cp_rwsem) // f2fs_lock_op
filemap_fdatawrite
f2fs_write_data_pages
...
                                   block_opertaion
				   down_write(cp_rwsem) - marks rwsem as
				                          "writer pending"
down_read_trylock(cp_rwsem) - fails as there is
                              a writer pending.
			      Code keeps on trying,
			      live-locking the filesystem.

We solve this by creating a new rwsem, used specifically to
synchronize this case, instead of attempting to reuse an existing
lock.

Signed-off-by: Shachar Raindel <shacharr@gmail.com>

Fixes: db6ec53b7e03 f2fs: add a rw_sem to cover quota flag changes
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
+	 * place where such recursion occurs.
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
