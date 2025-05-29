Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 444DBAC83A3
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 23:38:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-ID:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=+jk1ZN3b3Qd3iv6gB35FqkPlBloB5IRQjQue4eA2fX0=; b=HBr+OCVn/y+sMQvJtXN+5jwTxN
	uI7lUWTBz9IJDzN9vO7BOFnd+lVrVMO6b8SkrcINaCRUQraiTcnRnv5Q6HkRluXJfpPXWnbYA/9F3
	aub2P3vtF9CHyUGIRSP/OaguNJ5eY31wBKyG1a/rZ9TBxOhyPQXsKk38uO3oT9G8si64=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKkx2-0001oo-C5;
	Thu, 29 May 2025 21:38:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1uKkx1-0001oc-73
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 21:38:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=mqP4wvVgm10JM+a8NwlgAMzllqIFrJqqgUfwCFf2lHo=; b=gysMh3gE6UomYQqKdYp8QhGPwu
 SLu0mK7d7OH0X1dSkY/FAiufo8NyZDBRhVwQfLbHXVzNuPW4bfKRpXYWDuQq437yt5UkXr18R8gl3
 mOAGIibyBZ6PjWC/r5CzswmUUwEX/EOSoaYFQFYRtDNOt0tgsWBsfDazdMBmiuZgKtO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=mqP4wvVgm10JM+a8NwlgAMzllqIFrJqqgUfwCFf2lHo=; b=P
 F4G1MEZk1lfDxGwmNkH0ECCdEZKlKIfKcmGnVdn/AuG7bXB1a4XZgKkzeUeFkFzrcAj+TzMJZYaCS
 NbLC0jKXBWRVqDZ6I3OZ0MDxXa3e9oq8Anx1PlbUiLjIIbsZ7C5NTv1HKlVb5HeIP/CJf8NOmwi+0
 5ZP2MOuCk/VTcbvY=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1uKkx0-0001YL-IA for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 21:38:11 +0000
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7406c6dd2b1so2062905b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 14:38:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1748554680; x=1749159480; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqP4wvVgm10JM+a8NwlgAMzllqIFrJqqgUfwCFf2lHo=;
 b=ZFHH582Ej+m3Huj6pQBmGQBcImDj/0inYvvHd/xo8jBCF2a7vo+vfmVLsbrJdIp3O7
 fMC2X7w25T3EecLTx5Fu2vKS8zKluBqlZ2J6dRIomYtYIlqMt+WCA2H81agyo6mmUBdr
 4IPbNlGoEXeldPMn0iRIwibrfGHZl+hXHwjO98ZI6YWk3YS10ro7ts+1wFpPVCL5g7qW
 6pfpzNRC5E2DHRg8EsMTuWtZ3xg3NBJLg3Ss4YVrjWybv0kFuofnFQG/KK0r7XpI4Vfq
 /KsOomubGV0VLna0q0SJNmvhIGPZsyBM9Iuo2I2rDWnTgx4hMx1ea3ff8j23tI3FVOXv
 MOdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748554680; x=1749159480;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqP4wvVgm10JM+a8NwlgAMzllqIFrJqqgUfwCFf2lHo=;
 b=q9csD/3GjH2iApPqzbek9xE5SOUwDoR41fupqBL2r1hq4hVLe+BGfZXZoL5K5pxaQI
 aUqkdPrOJYr81mUDKbDC2fPYsxHqmVQl4nqirdlVSoI1HVFFJeTuiYMCbgd4xMzK+hWf
 hB7AIOw4zlMyhQdCvkyWArzbets2tsfD4irodkeNqInexojnwMpMoqZ6jk/4uJXNGJ2D
 3rbWSGdfsbhxDvHDMeYyMoZ9+nlQcL3IB3e1npMXycW2pkibi1i15jq1aHLmNBZzN0m2
 xdMY1jPl0sbArt2zNOd58+BTmuRt54Pgmy27eSRTxq3U05H2Pg2UtVdoqTG5Gfs6/1Rk
 EgEg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM3XBLAxkY6d26ovt4OrAGGj7N/1kk1iazOqG7JtE72OPjEUgLZJGn2nZixbQJiQcfOgWZlmN5g9WoACsIqjST@lists.sourceforge.net
X-Gm-Message-State: AOJu0YyTlNs5R4huJySQrLD6+Oq0SHhROwVa0H6Eii+MFzW0D4n5b1V8
 KyVDI9y1SYC9MyirufR4B0Gd2jFL9G4/YtR8JtmA4K299iSD83FqmSKz
X-Gm-Gg: ASbGncvvXnRNKPRkR2+8UA5wtNtXmNsvzA1i3O/iGEA8pS3Gxqd88QLrXWUXCdKn2/r
 Se9S4p3Gdy6JQrpELdTRETvTSjRh30Qxgwf/kL4IEogSG2P/YylZuIogrCx4RXvoLD4pnVvJRTq
 Twtz80n0Z8Mvuy+ZRf+Bk3v7bZkqH34DgszE5XELmJVQ+wxA0J89otJ8AS9o9pP9wO4dkScih4t
 oP5SYpGNuPti+p9ZHJDcRuigwp6563OxR2SQxS+HSMdxKpWaVCsC20ZOrCldAvR9UbNDPsbCCKq
 3lOW60ZPDxNVPbBUICNDty0gBKr4bsV6HSGp6B3sKncVMxp1vFylfkJGBYLpjJO79/XoXG+bIxZ
 K5dWrlvpLynLEWEugZJVArx0tSZ/4Tob9XYZPcFcagnk=
X-Google-Smtp-Source: AGHT+IFBuv+g34bmQWuVCb/OtmzFX0rA5tHGeOEftBT0F3jfs/WCM3yCBJpA+mSpwz6fYCAqQIkacA==
X-Received: by 2002:a05:6a20:728c:b0:215:d1dd:df4c with SMTP id
 adf61e73a8af0-21adb11c2d7mr1423707637.6.1748554679780; 
 Thu, 29 May 2025 14:37:59 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a46d:d724:4557:2a3e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afeab109sm1778187b3a.40.2025.05.29.14.37.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 May 2025 14:37:59 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Thu, 29 May 2025 14:37:50 -0700
Message-ID: <20250529213750.1068920-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.49.0.1204.g71687c7c1d-goog
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong one_time mode is only for background GC.
 So,
 we need to set it back to false when foreground GC is enforced. Signed-off-by:
 Daeho Jeong --- fs/f2fs/gc.c | 1 + 1 file changed, 1 insertion(+) 
 Content analysis details:   (0.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.176 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.210.176 listed in bl.score.senderscore.com]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.176 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
X-Headers-End: 1uKkx0-0001YL-IA
Subject: [f2fs-dev] [PATCH] f2fs: turn off one_time when forcibly set to
 foreground GC
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

one_time mode is only for background GC. So, we need to set it back to
false when foreground GC is enforced.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/gc.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 2b8f9239bede..f752dec71e45 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1893,6 +1893,7 @@ int f2fs_gc(struct f2fs_sb_info *sbi, struct f2fs_gc_control *gc_control)
 	/* Let's run FG_GC, if we don't have enough space. */
 	if (has_not_enough_free_secs(sbi, 0, 0)) {
 		gc_type = FG_GC;
+		gc_control->one_time = false;
 
 		/*
 		 * For example, if there are many prefree_segments below given
-- 
2.49.0.1204.g71687c7c1d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
