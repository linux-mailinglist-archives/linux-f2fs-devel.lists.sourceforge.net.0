Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 827B19BDD61
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Nov 2024 03:59:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t8WGH-0006oj-Gt;
	Wed, 06 Nov 2024 02:59:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <danielyangkang@gmail.com>) id 1t8WGG-0006oa-6c
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:59:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aewHjfrZ6LdC32tAimnrPMNKi9I3ZmUsMUDWVZFlpnQ=; b=E+LrZ7bJ7hb/1gj0HgbKvnVaWY
 b3S6d683SSo46J24aTz2H6spfx+9Pyy6RfHxs/skte1C3sFOlbl7iJ7bOBMA7+I5/a48q2bk/NX4R
 A3Ri6QlsjhgEe8MmQuopvrGP7DYeXEm9cESS0N5HlkXLwlQkMAY2eHjWP2t0/SwwrAac=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aewHjfrZ6LdC32tAimnrPMNKi9I3ZmUsMUDWVZFlpnQ=; b=M
 M8q4vpTHo+WwE2e0JeJK9D5JuhGOc4StyUfI2Fr/Z+D+RNdFpjBvgews+cpjvj45y063/1A4ELmM6
 iLSAmziUX/YUTes4MDwWS/QJneA+tdtTOommMZGyAAI3tBfZooDySUh03Rq9LxPrhQ7i38QfB+vnr
 gdCOKuFqXhVkiqjo=;
Received: from mail-pg1-f182.google.com ([209.85.215.182])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t8WGE-0003DK-HA for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Nov 2024 02:59:12 +0000
Received: by mail-pg1-f182.google.com with SMTP id
 41be03b00d2f7-7ee020ec76dso5102141a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 05 Nov 2024 18:59:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1730861945; x=1731466745; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=aewHjfrZ6LdC32tAimnrPMNKi9I3ZmUsMUDWVZFlpnQ=;
 b=e2SBLw9j/HQ5dpTbThhVfeL0qZUwJ3O1PgtF+wTUNmGz2JQ9Xx45TYOhAEyu3vofEb
 ADeWIBE0+46jhIUADn0Y3lDiFuSwLinbnJOSjLT6Y2Rd0eWghGWLa97cjToOqmGGoQg9
 BOWn5Hxfcxe1rH/7O4pvWi4qK3OP4VwNcoC5qytnMUYsJwCGDTzLth9A8nA/Cezc3UcY
 X9fvqgFS9R/v8pB6jCzt6n8adxKkJ0fLoctkBrIJCnIpz6PpxXoeNM8gzKYHzcRVusNh
 iRRBaw6TC4eqIwYZD7G+1XGufIaSWA+jIMWFW+04pB7LfkyRQQvjN3DQFZsu2jNOqnT0
 +d2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1730861945; x=1731466745;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=aewHjfrZ6LdC32tAimnrPMNKi9I3ZmUsMUDWVZFlpnQ=;
 b=gG5k61FcYjOtI8YjI6d6sKov3PMbSLXwiiCIVxVjFWgzVLt9U1znYF1iiu0vnwI4h9
 vVx4Yg6UaZ+PVzO4aDzYrNlZLv1kSaX+qxxIAcw2sF2I2Y6GSwklxCGvs/3qAnIyokem
 IO6fZ8gFIdIrsL4HnaMN8A5UrxskNTYYWpn93O3ls/l4XYBgdaZ14YXUdcfY4y2RH2dR
 AyZ2cHOCj5iQDasMdaL19PZCyCv6v/9/PSg6855G5j/KrASXFDNhLHt9fMvga2SrLsS3
 aLxYIrHRaAkahc2l//IDYpj99HDujzlnB5L/R5aR4BjI7kx7uV/+I41KVc8I5L0kXone
 +Uzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWXN8xmAZnZWpGmIz6AyO1o55Ki2MFJ+PbzkwIwmVSVGpAsImxm1VkLM1YlJVaKDcvAEI8ivJ2+/qpUcuOSFmvV@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz3xporUkblULKGdpDAJoc3taLVmvSrnImbZjgk14RI5z8biOm7
 YdOV9rgOB0CDLkr1wk8u98GH0YhLsHqOm8yzkoRkQ9eW1Rt/FNE9
X-Google-Smtp-Source: AGHT+IFdajRjrww28Kj6g8apacq729YapnE+XxbuyZl2dP3cf++buuS2ltWTyb28xBmyhhmYLCwozg==
X-Received: by 2002:a05:6a21:7895:b0:1db:ef18:d3d2 with SMTP id
 adf61e73a8af0-1dbef19ab02mr6658449637.26.1730861944721; 
 Tue, 05 Nov 2024 18:59:04 -0800 (PST)
Received: from debian.resnet.ucla.edu (s-169-232-97-87.resnet.ucla.edu.
 [169.232.97.87]) by smtp.googlemail.com with ESMTPSA id
 d2e1a72fcca58-720bc2c4bc9sm10586996b3a.108.2024.11.05.18.59.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Nov 2024 18:59:04 -0800 (PST)
From: Daniel Yang <danielyangkang@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Tue,  5 Nov 2024 18:58:58 -0800
Message-Id: <20241106025858.495458-1-danielyangkang@gmail.com>
X-Mailer: git-send-email 2.39.5
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: strcpy is deprecated. Kernel docs recommend replacing strcpy
 with strscpy. The function strcpy() return value isn't used so there shouldn't
 be an issue replacing with the safer alternative strscpy. Signed-off-by:
 Daniel Yang --- fs/f2fs/super.c | 4 ++-- 1 file changed, 2 insertions(+),
 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [danielyangkang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.182 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.182 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1t8WGE-0003DK-HA
Subject: [f2fs-dev] [PATCH] parse_options(): replace deprecated strcpy with
 strscpy
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
Cc: Daniel Yang <danielyangkang@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

strcpy is deprecated. Kernel docs recommend replacing strcpy with
strscpy. The function strcpy() return value isn't used so there
shouldn't be an issue replacing with the safer alternative strscpy.

Signed-off-by: Daniel Yang <danielyangkang@gmail.com>
---
 fs/f2fs/super.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696b..ee8861b95 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1158,7 +1158,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				break;
 			}
 
-			strcpy(ext[ext_cnt], name);
+			strscpy(ext[ext_cnt], name);
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
@@ -1187,7 +1187,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				break;
 			}
 
-			strcpy(noext[noext_cnt], name);
+			strscpy(noext[noext_cnt], name);
 			F2FS_OPTION(sbi).nocompress_ext_cnt++;
 			kfree(name);
 			break;
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
