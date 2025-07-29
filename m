Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C932EB150CD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Jul 2025 18:04:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:Message-Id:Date:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DFFaDC+ve6SopkqV91eMxzIJFHjah9x7nQFqsuX8HhA=; b=EU2sgrViYAgc1l9p0zC5UJ/X7+
	iw3UEbi1AvN4q9GCSZLTCwH32r8tldvUm/oY1Cz02TlqOsPss+ihkL7fR35nJ+DRnb6p2iKpyDXXl
	4CHOPqsxlLL3lMl4TyWlm4T/WKd7z9zSeGu9njRp/LoSi3kD6/ptgwuFj0ZgtFj0wtww=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ugmoF-0004ie-0Y;
	Tue, 29 Jul 2025 16:04:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <gxxa03070307@gmail.com>) id 1ugmoE-0004iY-9G
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 16:04:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ji8gqgnwKvApP60qqe4UQjw37JMxLmNrj4jvz+/nEPs=; b=mR0PG1DBQ5U6xxKOCKJbKiGwFc
 YOnP1IvYrv/jE9aSOsAEpxG5R7ocNPBAo0AQWWvXBoYuDx2j5dDzUYidtXBYUZHipU4U+nD/yNSDR
 9rGu2LxGlnOIRwQvATpoY0RMytxt2Hne+Cx3e5qEEIxKbFJ5ilGLqsdlAUuZLjJ8n2A4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ji8gqgnwKvApP60qqe4UQjw37JMxLmNrj4jvz+/nEPs=; b=I
 4KYweT7AnPc5PMBNRndE5aBOTPHYdvibynTJSXxByqGto1tINpT1aDQ7IYgeFyBwZQq4aDidnLJY8
 CenjuBUC/pCWJ5aIU7Bkz89Ei4OX2JWWO5dxHQybsUseyLkQbfFsuuJmXD3w6EYaBNs3EC/aLU59N
 qDLaKT+ucgkwfopw=;
Received: from mail-pl1-f171.google.com ([209.85.214.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1ugmoD-0001dI-15 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Jul 2025 16:04:10 +0000
Received: by mail-pl1-f171.google.com with SMTP id
 d9443c01a7336-2403df11a2aso17480615ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 29 Jul 2025 09:04:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1753805038; x=1754409838; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ji8gqgnwKvApP60qqe4UQjw37JMxLmNrj4jvz+/nEPs=;
 b=DniAuNb0ybqduP/n8h+5tHarGI79CBoW1Wylz82Pfipg0bmCnHf1l7MjnHA6ioWqLm
 WEP87Xb4sLFHRNFFrODExUQ4A/PKaHHZqxBNbjYXVHiDlmTZSx8u6dhtg/HlK/fZ+JR+
 CZII921S/fnxgSYcKwq1bKJHu04+OZj+PkxZh3I3tcT3jE/NHPCOUzDnZrwavICEQqep
 Vzf9uZhgicH3YsXddHGV+6WM5jHeJcuZ0dOwWg4+1QghfEkKaG03Pi/5Ph3SKscwCAVB
 CJ//H3XKzjQOrvSCg6q/HHgMTNonYsh4YOZ/j6cRlypJqzRER7llKBOJ/5cJxbBIeC1C
 9Jcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753805038; x=1754409838;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ji8gqgnwKvApP60qqe4UQjw37JMxLmNrj4jvz+/nEPs=;
 b=YXID+S7mFOIyNrALiu5k/ya+Hbg0plGQRSr8ZVF5vwuEdN2IuTxjCFHBEy5HtkNWIf
 O7HV/7mYw9NrvkTKVKGVOS1JiUMhjRNpHWtc3XS95CSWnJLK8wspbvFOCIk22Zr22LLv
 wcwy/4zpG5YwXoEJhmxSfat+1uJXdUVRmBrVAhvwQMWAPPjpsq8Y2m+867bMy1Dnzm/R
 lOKmTKoLTXSx/kiufhpFPilv4Ub20f7RDFD5NMC+mgqCQVLYKX/1x/lSV/UC9OhD+8Gy
 i4Qv2bTQyzbjBVrud1SzYw2vkMFfFcrsG0y4sQRwSpRc/fxMLsgSEhVl3qaHPMY0Twmt
 Claw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVx9YCQyQbVn0w8nhWhowP/vh6Bv6OP5hk3MrbLiy3ycyUKUdsd1D3WjT0qAYXdD3yYEVRagSRmwiHGcERH48y/@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzPiScZbN8qqbkX86Yzy+pFI8ntoqShbOOXEP9jP3x9AO/XuUKx
 To44WtRZssTuS37pAeudF/HGH3hdkXWZZjp5WFPhJ1Kr9YLBZyYOxP29
X-Gm-Gg: ASbGnct0WAhBc6d1paKkUQsOpjMz+/q5hp6Hrzx6z3y/wsy5MshchKkquOfMggZjTi7
 w84a8zes3sXBFgYLTAwg37vWGGuJfzgeQtRAb7pfRFozqs+rwTPEPH5l0mzQC/MGvisk0V1058I
 5Bmomjq3U2yRYqZDIhKKWtuKPInYXrs+gC5h2AsS4Uz13g3lCaBPTuIBnc0n3N2Xop5Z15+Tsau
 8QGChFVu4zAW57G1zqzL7iOWTm0bbwSm49KYls2B2JKoEdha8aKJNo/cP3w87tONIS7gkP7az8z
 1ljl0hC9LOjcmvcyXEc3woXrXRMZAH+zV6vs8JQ0470JyXkCmGHmq4xtqNoQcf+BhL6acsUd/r3
 nWaAQd8Yz0bzesWdUKsp73q2z6Qqez6qmN7PXGgM9CLzrFBndyoYiws/UpMXf0c+H
X-Google-Smtp-Source: AGHT+IF2YF2QDEglhuLMoAr96j5ir2UTPTBBPs1aaoRRyIFfSuC6c0BXof1vMXReChNuvBDBfeQLKg==
X-Received: by 2002:a17:903:2a8e:b0:23f:adc0:8cc2 with SMTP id
 d9443c01a7336-23fb30b2f8cmr228342725ad.27.1753805038042; 
 Tue, 29 Jul 2025 09:03:58 -0700 (PDT)
Received: from bj-kjy-standalone-gaoxiang17.mioffice.cn ([43.224.245.244])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24025f5a3ecsm51173795ad.136.2025.07.29.09.03.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 09:03:57 -0700 (PDT)
From: Xiang Gao <gxxa03070307@gmail.com>
To: James.Bottomley@HansenPartnership.com, martin.petersen@oracle.com,
 jaegeuk@kernel.org, chao@kernel.org
Date: Wed, 30 Jul 2025 00:03:45 +0800
Message-Id: <20250729160345.3420908-1-gxxa03070307@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: gaoxiang17 Signed-off-by: gaoxiang17 ---
 drivers/ufs/core/ufshcd.c
 | 2 ++ fs/f2fs/checkpoint.c | 2 ++ fs/f2fs/file.c | 3 +++ fs/f2fs/gc.c |
 3 +++ 4 files changed, 10 insertions(+) diff --git a/drivers/ufs/core/ufshcd.c
 b/drivers/ufs/core/ufshcd.c index 50adfb8b335b..4035b958057e 100644 ---
 a/drivers/ufs/core/ufshcd.c
 +++ b/drivers/ufs/core/ufshcd.c @@ -41,6 +41,8 @@ #define CRE [...] 
 Content analysis details:   (0.1 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 [gxxa03070307(at)gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit [gxxa03070307(at)gmail.com]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.171 listed in wl.mailspike.net]
X-Headers-End: 1ugmoD-0001dI-15
Subject: [f2fs-dev] [PATCH] fs: export some tracepoints for iotrace
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
Cc: gaoxiang17 <gaoxiang17@xiaomi.com>, quic_nguyenb@quicinc.com,
 bvanassche@acm.org, linux-scsi@vger.kernel.org, mani@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 avri.altman@wdc.com, peter.wang@mediatek.com, alim.akhtar@samsung.com,
 beanhuo@micron.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: gaoxiang17 <gaoxiang17@xiaomi.com>

Signed-off-by: gaoxiang17 <gaoxiang17@xiaomi.com>
---
 drivers/ufs/core/ufshcd.c | 2 ++
 fs/f2fs/checkpoint.c      | 2 ++
 fs/f2fs/file.c            | 3 +++
 fs/f2fs/gc.c              | 3 +++
 4 files changed, 10 insertions(+)

diff --git a/drivers/ufs/core/ufshcd.c b/drivers/ufs/core/ufshcd.c
index 50adfb8b335b..4035b958057e 100644
--- a/drivers/ufs/core/ufshcd.c
+++ b/drivers/ufs/core/ufshcd.c
@@ -41,6 +41,8 @@
 #define CREATE_TRACE_POINTS
 #include "ufs_trace.h"
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(ufshcd_command);
+
 #define UFSHCD_ENABLE_INTRS	(UTP_TRANSFER_REQ_COMPL |\
 				 UTP_TASK_REQ_COMPL |\
 				 UFSHCD_ERROR_MASK)
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index f149ec28aefd..83982977e9ec 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -21,6 +21,8 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(f2fs_write_checkpoint);
+
 #define DEFAULT_CHECKPOINT_IOPRIO (IOPRIO_PRIO_VALUE(IOPRIO_CLASS_RT, 3))
 
 static struct kmem_cache *ino_entry_slab;
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index c677230699fd..44e1294a3e69 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -35,6 +35,9 @@
 #include <trace/events/f2fs.h>
 #include <uapi/linux/f2fs.h>
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(f2fs_sync_file_enter);
+EXPORT_TRACEPOINT_SYMBOL_GPL(f2fs_sync_file_exit);
+
 static void f2fs_zero_post_eof_page(struct inode *inode, loff_t new_size)
 {
 	loff_t old_size = i_size_read(inode);
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 3cb5242f4ddf..ae153b41058d 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -23,6 +23,9 @@
 #include "iostat.h"
 #include <trace/events/f2fs.h>
 
+EXPORT_TRACEPOINT_SYMBOL_GPL(f2fs_gc_begin);
+EXPORT_TRACEPOINT_SYMBOL_GPL(f2fs_gc_end);
+
 static struct kmem_cache *victim_entry_slab;
 
 static unsigned int count_bits(const unsigned long *addr,
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
