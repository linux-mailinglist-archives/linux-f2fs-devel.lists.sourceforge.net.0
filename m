Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1DCE848719
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  3 Feb 2024 16:25:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rWHtR-0008TW-8E;
	Sat, 03 Feb 2024 15:25:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <qwjhust@gmail.com>) id 1rWHtQ-0008TM-CL
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Feb 2024 15:25:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c88lqSxqRhgcdBuXBMm8xLbio2cc1M+G+N4XYcCvLJA=; b=U2uA0wQzKDthYWdUXItmAVzYSX
 R7tiD4IuJfOd1VV9bN8gRlHDIOX9KwdQG8yYYryojqXlPUziB99ukyDeDf6j6NBWr9uUU68efnDpQ
 cYqMbpxYC8ANSGAa+Hj8y5ZqOgpJLkf1l+YLUWBBbhkN4SLnOeKTJuIdlrFFVAkeDOJo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c88lqSxqRhgcdBuXBMm8xLbio2cc1M+G+N4XYcCvLJA=; b=K
 Xh//3SwLPqfRMpvkha09rjDVb2E25TSK871eOAUuJhAjPUcn7OWlEyJO9Y+mAMXOxg4La4qtwvWrG
 SJdtwVlW7oEkfJF7G2cDeYqB/nP1T495qZmpYcP6n0FJD7ph/CtXLWiL8GFLS+aY1vOiDJYD41XfE
 ZrBD+VqebpUiEoY0=;
Received: from mail-pl1-f175.google.com ([209.85.214.175])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rWHtP-0002kk-FP for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 03 Feb 2024 15:25:20 +0000
Received: by mail-pl1-f175.google.com with SMTP id
 d9443c01a7336-1d944e8f367so26151425ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sat, 03 Feb 2024 07:25:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706973914; x=1707578714; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=c88lqSxqRhgcdBuXBMm8xLbio2cc1M+G+N4XYcCvLJA=;
 b=eNGgWv37kzrpt3BPzTDZ56y0Zz4XNvXtV3kxvuL08aNRbnj0zzT9BO+V6UHTbGiRoE
 ndugSYuQkby+CmHCkxAzCP7B29qjUyI1CNmZxoynjJ+Lnlj2iUnTkGBzFOMTBDzBJ3R+
 zZ/EI0beZwYg/6TVlRjc4crFvSJ0EkAsCrb630iaLhNHKqWvttGl+nUf6qI3/bTteJDD
 7Jof2wJHTTiR3XoU4bFpWBuOlEfij8XM3ZQFfqNJ01XqN+PWY8W1iPwwWvpqxMV8/Aoj
 QAdl5NrVZ4qbn+k5sa2DSoRLpLc7a7A6CIkGYtP/MSjGD3BElCL9kfDvQOxL+Ovo7Rit
 jNlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706973914; x=1707578714;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=c88lqSxqRhgcdBuXBMm8xLbio2cc1M+G+N4XYcCvLJA=;
 b=G/evMJR2gKoMKRq7kfIB4b+Nrkotwot/YTgpCnoJfe2QwC6T8zG/KrFdFIBZyQQ29+
 z0pHWoWTKrGPiTFd3Srvl0tka69FRIIQjXe7w85RfCf/uc07w/G9XVC9x+JbYCC/u1ei
 sj17rxDsNOqNdEBBsAyEQyxiXbJRSaiIr3SMbe0B1m4Fm2TFz0n714HMus+tQ82yHLdk
 ZJiIfOLDFI5ntYuGmJIld6GVjtAYrcQP/kbqAQNELsKrtT0LhQ8qP2ibo/6qDkPPr7kN
 fCIXdJ2/Z7PnrS2RbsY/DnL12kNFJkIx09KBJpd4jCSZUwBuCakh+EOC1Cn+qg82y/cB
 EpBA==
X-Gm-Message-State: AOJu0YwpFthQFR9yvBo0gGPCGs7y5FHtDoQXZcXa+wxqU8K4jT77uZhK
 ZQA30jcBx+ipVq82WsVzAkSZ7r8glDIJcLyY7OwrmteTDQuxFzJA
X-Google-Smtp-Source: AGHT+IG+kFYkVfFa0+0Ujxvkv+4qhG9681TjiX9T+aWgsnpdHjM1XP2I2bR9X6WyjKDoVmH6dQgTfQ==
X-Received: by 2002:a17:902:f545:b0:1d9:5d65:c1b with SMTP id
 h5-20020a170902f54500b001d95d650c1bmr7436906plf.41.1706973914367; 
 Sat, 03 Feb 2024 07:25:14 -0800 (PST)
X-Forwarded-Encrypted: i=0;
 AJvYcCUnaJiN3/oUVmOaXrf8A7R+Oc/J9rdZuq2hqa3OkuWuLiIUbcBwBO2NnGovu7VXgDk8iR2QXDi+ypeB0NGiZSA3yIp4tXmywVL5r/ZL7AeQPPOF9AAP5sZ3daQly/5/NcFpotuBCFavYnKgvhVGHiZxt96+cjL75gHi0HVp3fH+jb9RNNEBWut2/bo7ZxjWxr9QW2kqKsCCiiTSEZ8IHtZO9XnAb8VoAa6rZrEMfcF3Qg==
Received: from localhost.localdomain ([112.38.163.83])
 by smtp.gmail.com with ESMTPSA id
 ku12-20020a170903288c00b001d7284b9461sm3370081plb.128.2024.02.03.07.25.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Feb 2024 07:25:14 -0800 (PST)
From: Wenjie Qi <qwjhust@gmail.com>
To: jaegeuk@kernel.org, chao@kernel.org, yangyongpeng1@oppo.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org
Date: Sat,  3 Feb 2024 23:24:36 +0800
Message-ID: <20240203152436.1352-1-qwjhust@gmail.com>
X-Mailer: git-send-email 2.43.0.windows.1
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If the max open zones of zoned devices are less than the
 active
 logs of F2FS, the device may error due to insufficient zone resources when
 multiple active logs are being written at the same time. If t [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [qwjhust[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.175 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.175 listed in list.dnswl.org]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rWHtP-0002kk-FP
Subject: [f2fs-dev] [PATCH v4] f2fs: fix zoned block device information
 initialization
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
Cc: Wenjie Qi <qwjhust@gmail.com>, hustqwj@hust.edu.cn
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If the max open zones of zoned devices are less than
the active logs of F2FS, the device may error due to
insufficient zone resources when multiple active logs are
being written at the same time. If this value is 0,
there is no limit.

Signed-off-by: Wenjie Qi <qwjhust@gmail.com>
---
 fs/f2fs/f2fs.h  |  1 +
 fs/f2fs/super.c | 21 +++++++++++++++++++++
 2 files changed, 22 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 543898482f8b..161107f2d3bd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1558,6 +1558,7 @@ struct f2fs_sb_info {
 
 #ifdef CONFIG_BLK_DEV_ZONED
 	unsigned int blocks_per_blkz;		/* F2FS blocks per zone */
+	unsigned int max_open_zones;		/* max open zone resources of the zoned device */
 #endif
 
 	/* for node-related operations */
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 1b718bebfaa1..45e82d6016fc 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -2388,6 +2388,16 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 	if (err)
 		goto restore_opts;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (sbi->max_open_zones && sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
+		f2fs_err(sbi,
+			"zoned: max open zones %u is too small, need at least %u open zones",
+				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
+		err = -EINVAL;
+		goto restore_opts;
+	}
+#endif
+
 	/* flush outstanding errors before changing fs state */
 	flush_work(&sbi->s_error_work);
 
@@ -3930,11 +3940,22 @@ static int init_blkz_info(struct f2fs_sb_info *sbi, int devi)
 	sector_t nr_sectors = bdev_nr_sectors(bdev);
 	struct f2fs_report_zones_args rep_zone_arg;
 	u64 zone_sectors;
+	unsigned int max_open_zones;
 	int ret;
 
 	if (!f2fs_sb_has_blkzoned(sbi))
 		return 0;
 
+	max_open_zones = bdev_max_open_zones(bdev);
+	if (max_open_zones && (max_open_zones < sbi->max_open_zones || !sbi->max_open_zones))
+		sbi->max_open_zones = max_open_zones;
+	if (sbi->max_open_zones && sbi->max_open_zones < F2FS_OPTION(sbi).active_logs) {
+		f2fs_err(sbi,
+			"zoned: max open zones %u is too small, need at least %u open zones",
+				 sbi->max_open_zones, F2FS_OPTION(sbi).active_logs);
+		return -EINVAL;
+	}
+
 	zone_sectors = bdev_zone_sectors(bdev);
 	if (!is_power_of_2(zone_sectors)) {
 		f2fs_err(sbi, "F2FS does not support non power of 2 zone sizes\n");
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
