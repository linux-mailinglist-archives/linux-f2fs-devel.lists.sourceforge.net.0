Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC9DE830FE5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 18 Jan 2024 00:01:02 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rQEty-0005nF-1y;
	Wed, 17 Jan 2024 23:00:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1rQEtx-0005n9-1X
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 23:00:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7m0N7t1XW7ex4DXEj0WY/wok48BDAnOfTPeDrj1R5vg=; b=Eai5xnJAmBCLINN57QFTmLyHZF
 TAZR78z9XV4WQx6F0KlIR3/ui8V9KPlsFUnny7mJjpa4GyQKMyEOfriCcudP8RdnRKcApBAJwZCG1
 A41hfXv+DoVMrw28Fa6mEj5JnwCDJYw/HBwNEi5kYr0XDRwOelWNybrnqD1MWk+NHiys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7m0N7t1XW7ex4DXEj0WY/wok48BDAnOfTPeDrj1R5vg=; b=e
 B3dzTaIPJPjUWhSls+0fXDCSi1smCRzFcsI3mhdQhs/3gO14MO0LVswb2BLnuz1nUswTzsR5svziQ
 MB9PUw776sOnruyAtvibS0xQh3zrFY1/8LZDoPuSkd3nMf6jTwGiWXI6XcnqW56lCYuqc20pnBrxN
 /SFPAyCpsgpiE2OI=;
Received: from mail-pl1-f169.google.com ([209.85.214.169])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1rQEtr-0004WW-4c for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Jan 2024 23:00:52 +0000
Received: by mail-pl1-f169.google.com with SMTP id
 d9443c01a7336-1d3f29fea66so68126705ad.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 17 Jan 2024 15:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1705532437; x=1706137237; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=7m0N7t1XW7ex4DXEj0WY/wok48BDAnOfTPeDrj1R5vg=;
 b=G5uiSOf2/coXXJxLO1JauF01UcqQ3DIi7Nwjqg1Y4Z0/Qljr4PBjzXesvrhFhbCIrP
 a8+PVD5a5CLOzB0wGuI1vHkddVWB6W2ebOno+QLd5avbg1R+PFZZbSm1JQkRfroOppt3
 tV3fnoQkspIpk2lUIqynCgBSSjt5OTk/I1TTccIF3jR4bFNgH3yU5tDANZYb77kIThLr
 yF4g4xukr29rBcJbhfZ5M4efBJXf0otCZGUu46sapSoEkgyYevZEwSyb1EAFf8q9cZLj
 d3hpEwx28LaDXM7ECpGYlt93FFNflYEGVudx6VIft+LeMo8fGFEBWtWiRa3po8cE7ahO
 Ll4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1705532437; x=1706137237;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=7m0N7t1XW7ex4DXEj0WY/wok48BDAnOfTPeDrj1R5vg=;
 b=YF4rHXD0m3ElknQx4NZ5p20dSrncinjzIbWDh2MYBVPV2yTb66zW1iK23O5nf4RYFh
 90wWOFYWd6Bvv9VM9TsjYxmIs813jtxs63g42SIaxu4MYfISkiCHOy1afXPy25SuOy0x
 tqyVtq3LqH+gJAo1t+BZMS5iBNOHOptHczPrQu9zv1ya9T6vllqhgpOtYvjDr3tjq9kZ
 g6ktPtJ8Mp+l533v0S9gX+37KAiUzBicZTUONZloUEtTg+Skpvu2ST+2owgNwmi87KTQ
 J9BMZ/rXka6mPQacPNOOyn0287vJcB1ruD8JcAhOWV+uya+BXN4aE5mLkSXWlGLBG2gT
 AUuQ==
X-Gm-Message-State: AOJu0YxBInDSCmpklVKPGkLe5dbOzkv+bV2+GAdBA10g+4XR0qBQWq1k
 mnYxJpnqPBJbxOlUhX/jsFylpAxc/7mJnN5osEsWVEyX48SzwOLh
X-Google-Smtp-Source: AGHT+IFNBgUAqSpqdp6LHvt4RyUJrX42pQdx+maDN9Bq2jOF4HQOREnS0fyNSrZDosS3tCc+gKtx6w==
X-Received: by 2002:a17:902:db06:b0:1d0:a9fa:5939 with SMTP id
 m6-20020a170902db0600b001d0a9fa5939mr1446plx.111.1705532436888; 
 Wed, 17 Jan 2024 15:00:36 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2620:0:1000:8411:9c1b:9344:efbd:adc1])
 by smtp.gmail.com with ESMTPSA id
 e2-20020a170902744200b001d5f5887ae8sm167964plt.10.2024.01.17.15.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Jan 2024 15:00:36 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Wed, 17 Jan 2024 15:00:32 -0800
Message-ID: <20240117230032.2312067-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.43.0.381.gb435a96ce8-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Make to allocate logs after conventional
 area for HM zoned devices to spare them for file pinning support.
 Signed-off-by:
 Daeho Jeong --- mkfs/f2fs_format.c | 3 ++- 1 file changed, 2 insertions(+),
 1 deletion(-) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rQEtr-0004WW-4c
Subject: [f2fs-dev] [PATCH] f2fs-tools: allocate logs after conventional
 area for HM zoned devices
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

Make to allocate logs after conventional area for HM zoned devices to
spare them for file pinning support.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 mkfs/f2fs_format.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index f2840c8..91a7f4b 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -557,7 +557,8 @@ static int f2fs_prepare_super_block(void)
 		c.cur_seg[CURSEG_COLD_DATA] = 0;
 		c.cur_seg[CURSEG_WARM_DATA] = next_zone(CURSEG_COLD_DATA);
 	} else if (c.zoned_mode) {
-		c.cur_seg[CURSEG_HOT_NODE] = 0;
+		c.cur_seg[CURSEG_HOT_NODE] = c.zoned_model == F2FS_ZONED_HM ?
+			c.devices[0].total_segments : 0;
 		c.cur_seg[CURSEG_WARM_NODE] = next_zone(CURSEG_HOT_NODE);
 		c.cur_seg[CURSEG_COLD_NODE] = next_zone(CURSEG_WARM_NODE);
 		c.cur_seg[CURSEG_HOT_DATA] = next_zone(CURSEG_COLD_NODE);
-- 
2.43.0.381.gb435a96ce8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
