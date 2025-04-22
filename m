Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3174A9752A
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Apr 2025 21:12:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1u7J2E-00051Y-5J;
	Tue, 22 Apr 2025 19:11:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1u7J2B-00051Q-SS
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 19:11:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wKTihN516LJ0PJ64bQu6hhA9LAhCer0ZXXVQAo8No4Q=; b=QYmH0jLGAnDxBVPxSr04KneZGa
 cTAzB8Z6uZ3iynlCiXIMz9ByUfachgN8StrjS3edmabQJD5n3dKlc1IQUEoWuC3JkfhKFUGPO9rv4
 Bi/Ni5kkqgOnRllfnjEXlFiScxPCgPwgfSl48SVx2UGvghOPY373gfIz1RK1B2vgpdHs=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wKTihN516LJ0PJ64bQu6hhA9LAhCer0ZXXVQAo8No4Q=; b=g
 L0cuppCSOqSNBkpaxjx5fFwAasSutZE6/DEyZ52L6tQ3uH0XgTxBMU9wVcveMryzySKOsBPz32EqY
 //4PBdo+BN2CmlVaAsFF5GtSAb2bN4PsVBxo6HkIWP3ZZ1c3DUyl9FtoPaDmZCvc1ilG67SdzX1xZ
 ORX8vPKkKxiHVlw4=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1u7J1w-0000Ga-Iv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Apr 2025 19:11:56 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-739be717eddso4293380b3a.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 22 Apr 2025 12:11:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1745349095; x=1745953895; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=wKTihN516LJ0PJ64bQu6hhA9LAhCer0ZXXVQAo8No4Q=;
 b=kQswVxIFafYuYC5UZ24aFqn08/BbCxAFIVH74h4w2H8yeXWEluhmWfxF5HN/jBUS0S
 3u2sUaYLSbNU0Q4+V1nIwVSABGzjInpJxHrFMlr+j/EJGc+hYKPbKrer1RtlL6afHUbe
 fVGKNNbqv5Gh98p0VN0ds2iPeMU+uDkhq4ZfX/55W2ewBaHZ6zQmLAszviVTUEpkmtIv
 9JYuVkgkchsWSP1ImlUPzRpcIUFQANbSrqzNm42aSwH+0l6KNQmBZIimJt+LlK7VsBo5
 IEAnTJonNa1H0BYmFNPv8rREkiO+8bfraE6ESQc1htJZY/rFJg7OnfFtZixmjKgoRkoa
 V3pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745349095; x=1745953895;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=wKTihN516LJ0PJ64bQu6hhA9LAhCer0ZXXVQAo8No4Q=;
 b=txWUdWMczggOmKS3KwXKtwFCvnpDkYqU95g8eQMlbpjU7lEOk2L57k+F++Xhx/qC4s
 kLDQKLRqABnML0wtChhSOfmOLhcUvt0jYWqIf2nhBd9ESkpFa/yiguVqaS0kRL54Rllr
 hcRs4j/x3PaZW7BabMJclETUbTGCft3Z4hEbJB/V/1hVoRFo3pi7zhO3CAW/s4R9fMb5
 Ceu9OkUHZXYqc6MJEIOAf5tdgQl6Vm5WTI5LGrljheC84wOGkUhiXtAEuY7KyhU8hzgJ
 xLjeEsfFyVxMQ2X8A7jaGWSsWdJl6eNqYyg6mTgKKAd6+vYS7+H90nZTV5h+Fcy9tnku
 nuxQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWUPYHH/I/ikWMsl0YBS5WDXbw0ERGD0FCDREAyKf/dE9r0+ozna8ESRl1YPf3A47bWloh8QK4Xy0sTQxcQItnB@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzcAlQWkkbth8u0gBBquFLEDrRAHB5weA9m1hHPE1X4kdVU50WS
 kELUwQOqYVs+uc9Cimu8ZlcpqCqyg21e5z1Ru90DP2h82lVxzaCx
X-Gm-Gg: ASbGncv6+L8SixKO0RjVV5YRfbSVOicc0g4VyLA2Bq9hPS88zQdZUbnJHV/Xmvq/pAP
 k9884oYZarO4DSQOfHIvAJKrOBrtHMHLNJSUdnW+HgK7VLmbHE3FWe1cMQASQVu08aXy7UoaPcO
 N/SabnPTiRfqBeyhMY6lN3NR00RRrKZof7PZXNqJ+kWbhROsUD5688q59flhsWDGjyg83HueNMN
 WNgTaC3J8W/6RgydkCh5Yml8RGRbhtg0On1AkjjI+dl4P6RfWkhAdOXwLya8M0nscUyMztJ+Y9c
 t53KzFaHOmsEWqS1gS5CCKzT1JM0fHt/nCtUw4x5PYXR+JosBLUYUv3EivbJ+8oY7ymPmtUlntF
 DeGzCuOqrNGETPcPe0VmgnP76c9TS7q46KVuz1z/j
X-Google-Smtp-Source: AGHT+IELeYCox8pUMEvgPe7KvcZ5qh9tJ4MSDEqFRxHZRuMrXgnFrTLQ5vsxj1wEndQsJ2TPwFBM5A==
X-Received: by 2002:a05:6a00:e05:b0:736:8c0f:774f with SMTP id
 d2e1a72fcca58-73dc15d6751mr20881055b3a.22.1745349094784; 
 Tue, 22 Apr 2025 12:11:34 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:d927:9b9c:264:e35])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b0db13c1c40sm6150317a12.33.2025.04.22.12.11.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Apr 2025 12:11:34 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue, 22 Apr 2025 12:11:28 -0700
Message-ID: <20250422191128.1346260-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.805.g082f7c87e0-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong In cases of removing memory donation, we
 need to handle some error cases like ENOENT and EACCES (indicating the range
 already has been donated). Signed-off-by: Daeho Jeong --- fs/f2fs/f2fs.h
 | 1 + fs/f2fs/file.c | 21 ++++++++++++++------- fs/f2fs/shrinker.c | 5 +++++
 3 files changed, 20 insertions(+), 7 deletions(-) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.176 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.176 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1u7J1w-0000Ga-Iv
Subject: [f2fs-dev] [PATCH] f2fs: handle error cases of memory donation
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

In cases of removing memory donation, we need to handle some error cases
like ENOENT and EACCES (indicating the range already has been donated).

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/file.c     | 21 ++++++++++++++-------
 fs/f2fs/shrinker.c |  5 +++++
 3 files changed, 20 insertions(+), 7 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f1576dc6ec67..e4b39550f380 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -821,6 +821,7 @@ enum {
 	FI_ATOMIC_DIRTIED,	/* indicate atomic file is dirtied */
 	FI_ATOMIC_REPLACE,	/* indicate atomic replace */
 	FI_OPENED_FILE,		/* indicate file has been opened */
+	FI_PAGE_DONATED,	/* indicate pages of file has been donated */
 	FI_MAX,			/* max flag, never be used */
 };
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index abbcbb5865a3..0807f8e97492 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2464,19 +2464,20 @@ static int f2fs_ioc_shutdown(struct file *filp, unsigned long arg)
 	return ret;
 }
 
-static void f2fs_keep_noreuse_range(struct inode *inode,
+static int f2fs_keep_noreuse_range(struct inode *inode,
 				loff_t offset, loff_t len)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	u64 max_bytes = F2FS_BLK_TO_BYTES(max_file_blocks(inode));
 	u64 start, end;
+	int ret = 0;
 
 	if (!S_ISREG(inode->i_mode))
-		return;
+		return 0;
 
 	if (offset >= max_bytes || len > max_bytes ||
 	    (offset + len) > max_bytes)
-		return;
+		return 0;
 
 	start = offset >> PAGE_SHIFT;
 	end = DIV_ROUND_UP(offset + len, PAGE_SIZE);
@@ -2484,7 +2485,7 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 	inode_lock(inode);
 	if (f2fs_is_atomic_file(inode)) {
 		inode_unlock(inode);
-		return;
+		return 0;
 	}
 
 	spin_lock(&sbi->inode_lock[DONATE_INODE]);
@@ -2493,7 +2494,10 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		if (!list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_del_init(&F2FS_I(inode)->gdonate_list);
 			sbi->donate_files--;
-		}
+			if (is_inode_flag_set(inode, FI_PAGE_DONATED))
+				ret = -EACCES;
+		} else
+			ret = -ENOENT;
 	} else {
 		if (list_empty(&F2FS_I(inode)->gdonate_list)) {
 			list_add_tail(&F2FS_I(inode)->gdonate_list,
@@ -2505,9 +2509,12 @@ static void f2fs_keep_noreuse_range(struct inode *inode,
 		}
 		F2FS_I(inode)->donate_start = start;
 		F2FS_I(inode)->donate_end = end - 1;
+		clear_inode_flag(inode, FI_PAGE_DONATED);
 	}
 	spin_unlock(&sbi->inode_lock[DONATE_INODE]);
 	inode_unlock(inode);
+
+	return ret;
 }
 
 static int f2fs_ioc_fitrim(struct file *filp, unsigned long arg)
@@ -5236,8 +5243,8 @@ static int f2fs_file_fadvise(struct file *filp, loff_t offset, loff_t len,
 	     f2fs_compressed_file(inode)))
 		f2fs_invalidate_compress_pages(F2FS_I_SB(inode), inode->i_ino);
 	else if (advice == POSIX_FADV_NOREUSE)
-		f2fs_keep_noreuse_range(inode, offset, len);
-	return 0;
+		err = f2fs_keep_noreuse_range(inode, offset, len);
+	return err;
 }
 
 #ifdef CONFIG_COMPAT
diff --git a/fs/f2fs/shrinker.c b/fs/f2fs/shrinker.c
index 9c8d3aee89af..1fa6619db40f 100644
--- a/fs/f2fs/shrinker.c
+++ b/fs/f2fs/shrinker.c
@@ -186,8 +186,13 @@ static unsigned int do_reclaim_caches(struct f2fs_sb_info *sbi,
 
 		len = fi->donate_end - fi->donate_start + 1;
 		npages = npages < len ? 0 : npages - len;
+
+		inode_lock(inode);
 		invalidate_inode_pages2_range(inode->i_mapping,
 					fi->donate_start, fi->donate_end);
+		set_inode_flag(inode, FI_PAGE_DONATED);
+		inode_unlock(inode);
+
 		iput(inode);
 		cond_resched();
 	}
-- 
2.49.0.805.g082f7c87e0-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
