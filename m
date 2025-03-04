Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B8651A4ED26
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  4 Mar 2025 20:21:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tpXp8-0001xs-EC;
	Tue, 04 Mar 2025 19:21:02 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1tpXp4-0001xb-Sw
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 19:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=W/dXSi6xRgwsWQ1SiZXMUsL2CPHZOkxLFICb2229Usk=; b=jPBwPNaPVZXLJervJBfjw+3Aum
 bixMyFMTnsrIPTXqF1lgADKxMTN7fXHw7a6tZd21326paWaWUlHkYFiuOnjk8+OiFTea5WwkKqnTe
 ALIljeFjFLGdTURTLprXSWeBBMnVDg2UmJfJCnyj5rEqVN6WbQKe+qtDzzyi+e9X8Ge0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=W/dXSi6xRgwsWQ1SiZXMUsL2CPHZOkxLFICb2229Usk=; b=X
 wXi7lXRxmBbhIk0HyQBJk4Cch6j+1ELvLAmwALrJZ3Ld3ut8eCVKQjA8wfrKa+d+T3KXEmomGEPFB
 c31eHjGRP2lI+uEvb9JQ1Uz3xXMJ9JwEDz9udqpOXAH9HoWl53am4Xfn2phQaaxN60xRVLEHqvwIu
 waM26fR1y9YO5M7Y=;
Received: from mail-pl1-f170.google.com ([209.85.214.170])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1tpXoz-00075u-8X for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 04 Mar 2025 19:20:58 +0000
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-2238d965199so57405765ad.2
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 04 Mar 2025 11:20:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1741116047; x=1741720847; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=W/dXSi6xRgwsWQ1SiZXMUsL2CPHZOkxLFICb2229Usk=;
 b=Wua7HCJwlGmqUk3hNNV3iu1UEixhrC7ZUlxa1HUPao8i6OYjiN9gbHg4J6s52cqjFF
 oyP5D03QvlQ575gCsSizz2dTzZ5xeYrYs7wq3PGPmDWnssJqf9KqeGBe4PQeJtbUHLMD
 pGsiBEtDs1kcyBRUTnqndJ420IleWC6YJXfYoOgHJWp/hKm/uiVbTcqTPoExInm6+olM
 6pQUUfCircMAsMjn5dPWvTkPHvC7BJ5MgKSYgd4bztvpz/i7lIBEXrZPX6M9jg26vFyw
 IYZN4L8yj36+hH1EvklMlWBmkUbuw29yjxP5zryXvnR2xcmAbK9fgQvuEURKjfzLghzd
 bDhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741116047; x=1741720847;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=W/dXSi6xRgwsWQ1SiZXMUsL2CPHZOkxLFICb2229Usk=;
 b=OtXNQ+uF0BjvNl84U3sGvPh0AY9kNPinEm7vQrKFECPICe5sniyXXG9HYbbfLxw82Q
 QBMPy7l7NvKI3zmhuuvzY4MnN64egMGnggwshBzuxf+5ZqpTE9IYIpLTKh0KYCJOSYL1
 Zw3qQKXIHxR8pF1X/n1vVjkD5c7v+H5nO9WrL1idWgYe9CnhRXNsHRZx0kfhw403UrSV
 TxB2C46byt3ajgXfUUOe6vYrI5et1jJGc1Uy64hIHtgevAy8YDVzNm3zlmm2VbhVyaBQ
 FqPx8VO72bojsEjSIhiUYhzWcOJvNvUjkQEzU+HMIKU+uUteQrWOZx4kjDhJtDeCE3rO
 mIeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV67IVOTuz52hTzWpsPdKDF22h39yWnwil1vLibCtWV27wiJedAUPxOdH+cJmiOX7Rxywh6k3exKAX8CNmbHHWI@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yx6bVSa2RBEKxNHa56JQZwmLF/6nyzZ/Gx5tWYDiHgHRBRGudxU
 DXUf/01dEMkAMmCj9qW6j677cMTV9jRkxlBvj5GJBFnFjP3TzjeJmTsbUQ==
X-Gm-Gg: ASbGnctkmBj8Krqv6K7DBI56NfJ0vt9HyIQnBpvJ4+2wplouspW5Rfl3azJVdAkLr++
 SG9I4+2r/fxSglOMWzD4U5R2Yo1u4GC9XdcSXMzNbNm2CWpfKDCYU56OkA1J/HmfrKGtTR0VBSh
 0zpaTUgyrFHFAXOWOVQaVz5fVKh9vl/vbG4rU8RhYwvsyxeHP+P54WRnz7PQGUt2INZR70zlN0X
 PerPLoSwLufTDl8cZeos/7Fhd2idjlnPoOk1vLdU05ZF61NejCLVG4RF77/st18xFD60n4xmiO9
 zSojM5iix8+iLU94mF9BFF6XKeOg0+MhnKtaRRGa51jEFyXggiaG6IqFF40MAkeee5ARJrcZYtn
 tJdU/EIYo4i98Kda8ReCLeO8efp7lpPh0/vhM
X-Google-Smtp-Source: AGHT+IE/izDo+2T2PoP2W0Zud9dEe4n8vIruh1o+XbAemCyGlSIAuwSw6HV5IvFQ+4u8lDGh5rcUkQ==
X-Received: by 2002:a17:902:dacf:b0:21f:93f8:ce16 with SMTP id
 d9443c01a7336-223f1ca9026mr4913365ad.31.1741116047417; 
 Tue, 04 Mar 2025 11:20:47 -0800 (PST)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:ae36:4619:1aa2:117b])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7363d97dcd0sm6602610b3a.54.2025.03.04.11.20.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Mar 2025 11:20:47 -0800 (PST)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Tue,  4 Mar 2025 11:20:41 -0800
Message-ID: <20250304192041.4048741-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.48.1.711.g2feabab25a-goog
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Daeho Jeong current_reserved_blocks is not allowed to
 utilize. For some zoned storage devices, vendors will provide extra space
 which was used for device level GC than specs and we will use this space
 for filesys [...] 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.170 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.170 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [209.85.214.170 listed in sa-trusted.bondedsender.org]
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.214.170 listed in wl.mailspike.net]
 -0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tpXoz-00075u-8X
Subject: [f2fs-dev] [PATCH] f2fs: subtract current_reserved_blocks from total
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

current_reserved_blocks is not allowed to utilize. For some zoned
storage devices, vendors will provide extra space which was used for
device level GC than specs and we will use this space for filesystem
level GC. This extra space should not be shown to users, otherwise,
users will see not standardized size number like 530GB, not 512GB.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
---
 fs/f2fs/super.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 19b67828ae32..c346dcc2518a 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1833,10 +1833,9 @@ static int f2fs_statfs(struct dentry *dentry, struct kstatfs *buf)
 	buf->f_type = F2FS_SUPER_MAGIC;
 	buf->f_bsize = sbi->blocksize;
 
-	buf->f_blocks = total_count - start_count;
-
 	spin_lock(&sbi->stat_lock);
 
+	buf->f_blocks = total_count - start_count - sbi->current_reserved_blocks;
 	user_block_count = sbi->user_block_count;
 	total_valid_node_count = valid_node_count(sbi);
 	avail_node_count = sbi->total_node_count - F2FS_RESERVED_NODE_NUM;
-- 
2.48.1.711.g2feabab25a-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
