Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AF6FC06FCC
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 24 Oct 2025 17:33:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uRAqj5c06WHsfL9nEs4dN+IaFbXAn2WPECOxz1PakCo=; b=DFtaDD1qxmhcSxcunVh9yL+aO4
	4FmKPWOEtf/Kdf+INtD4J2CHISR2Bz2vaWA1c0CvMMg1mjj/WVBlMpi8niCooLHwigMZf0a8UTUPz
	y1oLtXzjk0tzM+wt3J8ONbAajPLFb5nuv0FxJVt7IleZbEClPWXACCCse7ulUazA+Q5A=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vCJmq-0001kI-62;
	Fri, 24 Oct 2025 15:33:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyongpeng.storage@gmail.com>) id 1vCJmo-0001jw-DW
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Oct 2025 15:33:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=E3IO9KqZDzN+YMgB/uiJJFtsMJ2mvcwiXW4mmfzfOSY=; b=Pmc45eqvn0sOiuLbWe3G6p9PhG
 NNWdkdgnjkuR/NYzPHY2srygFAJTicX6PUQPbtc2NGDlCQkqakCFopsZAEPrr6t7wzoRwBJIQlNfo
 p4Ex2H5RCpb5zQCvlutOiEFxLSDKk5ripz9MHBgOs3sC/Kggic9L29HzGyW00UjhE6Dk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=E3IO9KqZDzN+YMgB/uiJJFtsMJ2mvcwiXW4mmfzfOSY=; b=k
 2a8KKy5TclLgPk4oyvxZ7dEO0Y17b1waKcHGKiTz3NDP33zobj8ZUMDUlVe414tAdIEWfjQmgRizP
 8smoNMXGxXH/ZKRigbw2jsNNTFzvMfKX4S8gAvZmqDSU8eLc5dg/NJtr8atT76uUPs1niohZb1Z+9
 LXfiuRk3u53FD1ls=;
Received: from mail-ua1-f44.google.com ([209.85.222.44])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1vCJmn-0006oe-TH for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 24 Oct 2025 15:33:02 +0000
Received: by mail-ua1-f44.google.com with SMTP id
 a1e0cc1a2514c-89018e9f902so1841231241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 24 Oct 2025 08:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1761319976; x=1761924776; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=E3IO9KqZDzN+YMgB/uiJJFtsMJ2mvcwiXW4mmfzfOSY=;
 b=fHTI6DZEcSepuGLKxtjkmfqVgyTRl2YK2i+UbzNdsxH/51DnuGyIEfk8szGWzycpw5
 f7mJY99bqdKWayygMflMLqBMh1jd0ltj1xegyMxKA7PkU2JfEI02zn4ytcCeVNK6SrRU
 jL0nDlSuBSQAt/UOsAYVqwLdhwL2czO53PgRFdjHrXE+NNHl9V8SzCyddDTOViZ/eOoW
 QNYsCfHQ0yV08VrxUOvTt1a76/glXkQJ+YHtLLIX4ugnzbBDBAYlsl6q4GHmA9Zn55ax
 wBPhGwthwiUijLgL2ioQHI0gmYohh9xqCgIuNVDKTBn/CmM7d4UV1QumLvbEs3sjhnCZ
 m+3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761319976; x=1761924776;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=E3IO9KqZDzN+YMgB/uiJJFtsMJ2mvcwiXW4mmfzfOSY=;
 b=t347caFbSlt3fCIAy4YZC6fXDQtdzHyFBtQ7boHSQRzkalWrWNprCqoikjanYrueHq
 1Qb0G8uEi4DfBUrYdP1hTUnoC60/i45kGEqotCdkJ9I/3c3VhfJUvCe5yGm97ck5vBAT
 UlH/fm1wwKBxCsci7WG456nv8J2FA7aPtpMJGQrE8rGRc2qV2yEn7KidKdQysi9WDtNH
 Bp/OqmG6Rix7/CnbuSKyRgjGD4B0ePh2QAjoIE13ewQANzgIQLKk5X7BT5L3kHeTgIRO
 qfapKWmCYZhZH5XwRW/7uom75vYsmzqWXk3h5D4NLvU6nZ8TtgIYkFgymuLnEoHzMgSC
 LdQw==
X-Gm-Message-State: AOJu0YwgpDWwKWAzO0pXuj9qVrypXyUAGwu1Z9IWUkeTaq2yvA6KoN7L
 0f3942+GRXiUu46n7fa1TIakZtkq2Cjp7InJv3zCXLthSEt4TOS0hlV2cHTkibV3vVI=
X-Gm-Gg: ASbGncugiVdD2LUNDNQEqBSsKqoLgOw9Z6bGEICpSrN3+Wykp1AHabJuDoOcxFpWV5/
 JsHGKYUzLVJujzhTpZh4KkgqaUoI6MWp1Ve8xVqbY403fiP0wxIe64fOr1cNbD7d8WYCV1dA+Y1
 039bLcwRzU8+gJs6zsnFrjwoHX7O62FzMv4vFsy7kHeBNSZuJbwzRRmBzLbF+8VGXfoQfClQdDL
 /AXzW0Y+4ZkQxI0HmoCKri3wO9uMz7R6id7o5Q4Ts6GC3xuRfZ5NwYNA7WR+VEVoOz8o2eJm0Bv
 7vHwsEqgbMoswnDzc4QPZ7Od6izmDAiMcQ2OgBQLocasl3BJA/OLUPehD1XZ2WT7IfWu5nmfmHc
 bCW5itr5vAu2EjlH2lWKsjBAqI3KVxbuLs/FTYheXusgvPzNgCvzIab9VT8xhMGSQMya9+ldo6D
 5473dPnt5XghboHRWMDhQrupIm24nQlmUkRwJ/nJk67yZY4Oc=
X-Google-Smtp-Source: AGHT+IGG1xz13rTxCUR5CAHSwlRq4v0hEIP0YGYmqbQZ8x7tQptw5WL5VEnh3z/Z+aIe2dTcUR44eQ==
X-Received: by 2002:a17:903:46cd:b0:28e:7fd3:57f2 with SMTP id
 d9443c01a7336-290cb65ca5emr370943205ad.49.1761316670785; 
 Fri, 24 Oct 2025 07:37:50 -0700 (PDT)
Received: from xiaomi-ThinkCentre-M760t.mioffice.cn ([43.224.245.241])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946dda577csm57886955ad.13.2025.10.24.07.37.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Oct 2025 07:37:50 -0700 (PDT)
From: Yongpeng Yang <yangyongpeng.storage@gmail.com>
To: Chao Yu <chao@kernel.org>,
	Jaegeuk Kim <jaegeuk@kernel.org>
Date: Fri, 24 Oct 2025 22:37:46 +0800
Message-ID: <20251024143746.187140-1-yangyongpeng.storage@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Yongpeng Yang When F2FS uses multiple block devices,
 each device may have a different discard granularity. The minimum trim
 granularity
 must be at least the maximum discard granularity of all devices, excluding
 zon [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.44 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [yangyongpeng.storage(at)gmail.com]
X-Headers-End: 1vCJmn-0006oe-TH
Subject: [f2fs-dev] [PATCH] f2fs: ensure minimum trim granularity accounts
 for all devices
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
Cc: Yongpeng Yang <yangyongpeng@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Yongpeng Yang <yangyongpeng@xiaomi.com>

When F2FS uses multiple block devices, each device may have a
different discard granularity. The minimum trim granularity must be
at least the maximum discard granularity of all devices, excluding
zoned devices. Use max_t instead of the max() macro to compute the
maximum value.

Signed-off-by: Yongpeng Yang <yangyongpeng@xiaomi.com>
---
 fs/f2fs/f2fs.h | 12 ++++++++++++
 fs/f2fs/file.c | 12 ++++++------
 2 files changed, 18 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 32fb2e7338b7..064bdbf463f7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4762,6 +4762,18 @@ static inline bool f2fs_hw_support_discard(struct f2fs_sb_info *sbi)
 	return false;
 }
 
+static inline unsigned int f2fs_hw_discard_granularity(struct f2fs_sb_info *sbi)
+{
+	int i = 1;
+	unsigned int discard_granularity = bdev_discard_granularity(sbi->sb->s_bdev);
+
+	if (f2fs_is_multi_device(sbi))
+		for (; i < sbi->s_ndevs && !bdev_is_zoned(FDEV(i).bdev); i++)
+			discard_granularity = max_t(unsigned int, discard_granularity,
+						bdev_discard_granularity(FDEV(i).bdev));
+	return discard_granularity;
+}
+
 static inline bool f2fs_realtime_discard_enable(struct f2fs_sb_info *sbi)
 {
 	return (test_opt(sbi, DISCARD) && f2fs_hw_support_discard(sbi)) ||
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 6d42e2d28861..ced0f78532c9 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2588,14 +2588,14 @@ static int f2fs_keep_noreuse_range(struct inode *inode,
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
-	struct super_block *sb = inode->i_sb;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct fstrim_range range;
 	int ret;
 
 	if (!capable(CAP_SYS_ADMIN))
 		return -EPERM;
 
-	if (!f2fs_hw_support_discard(F2FS_SB(sb)))
+	if (!f2fs_hw_support_discard(sbi))
 		return -EOPNOTSUPP;
 
 	if (copy_from_user(&range, (struct fstrim_range __user *)arg,
@@ -2606,9 +2606,9 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 	if (ret)
 		return ret;
 
-	range.minlen = max((unsigned int)range.minlen,
-			   bdev_discard_granularity(sb->s_bdev));
-	ret = f2fs_trim_fs(F2FS_SB(sb), &range);
+	range.minlen = max_t(unsigned int, range.minlen,
+			f2fs_hw_discard_granularity(sbi));
+	ret = f2fs_trim_fs(sbi, &range);
 	mnt_drop_write_file(filp);
 	if (ret < 0)
 		return ret;
@@ -2616,7 +2616,7 @@ static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
 	if (copy_to_user((struct fstrim_range __user *)arg, &range,
 				sizeof(range)))
 		return -EFAULT;
-	f2fs_update_time(F2FS_I_SB(inode), REQ_TIME);
+	f2fs_update_time(sbi, REQ_TIME);
 	return 0;
 }
 
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
