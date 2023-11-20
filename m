Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B01407F0C07
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Nov 2023 07:56:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r4yCO-0000O3-Rv;
	Mon, 20 Nov 2023 06:56:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <korotkov.maxim.s@gmail.com>) id 1r4yCM-0000Nx-RA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 06:55:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7BxKW61zXNgsHSoTkhj7NSmCpNOlxqY+pMZGJFFf+hU=; b=aNoWhwV00ILUBzESexDflaIT3j
 xm8gzZxqLlRsnTfYSGFS4Ym3zZxqTW2Xe2L0EL5eb5KT0Yg+3w7rda04AMvM6BRaldIDv6qAoZoRp
 Wd4iW2f24xJL9rNFYfPwhuYbnz0LuQ6lZvotNoS7tSbhjLUY2QtPh7tPCJiU0JWJ1rLw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7BxKW61zXNgsHSoTkhj7NSmCpNOlxqY+pMZGJFFf+hU=; b=E
 Gve97NSgnCPriqyLgba47efA9WzH9SqCb/GOlBUK3v42nNJiY748+P4zI+2xdVv2njJ6o6IZHWsmA
 /IWYPtLD3apJFsSjnfJkdZ2Kn/WaFrA+oCwNmNX5WrGXE0JxJJZtkudvT3AIwbgbLwQOw+Y+PvmtT
 sJLyc/vemp8WuvTE=;
Received: from mail-lj1-f171.google.com ([209.85.208.171])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1r4yCM-0007V3-7t for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Nov 2023 06:55:58 +0000
Received: by mail-lj1-f171.google.com with SMTP id
 38308e7fff4ca-2c509f2c46cso54848961fa.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Sun, 19 Nov 2023 22:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1700463351; x=1701068151; darn=lists.sourceforge.net;
 h=content-transfer-encoding:signed-off-by:fixes:mime-version
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7BxKW61zXNgsHSoTkhj7NSmCpNOlxqY+pMZGJFFf+hU=;
 b=mhMuU4eA5pG+6sui/Z72IpxflO36F4rUEdLRAy0tf38LDxvEEAJcxLlSU8767yY1ad
 P9fybbBgdBOcaB0f7tWaHXlJaTG13lG12Qg4EQQrP4AvFHzT9ah4dCe82t0LbBKpaR4u
 CGAycfc0LgDH6IN3KbERnedbYtr5rir9cp7x4hZMO+lsCLGELRwPxAnpLKG0cDAbztqT
 5YymiOwdorqP1Bg0sW5f+Y5c1bLU44ML+GLF7ef0mlSjVUzCUMKeMxFhs/l7s3lMnRxn
 tVwI+JQfYXJ0WlbjLiwYgSp98APQVyjT7l1R8JxIhnAbd6hZmypzt8eRtaYL9B0k41Bc
 IYOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700463351; x=1701068151;
 h=content-transfer-encoding:signed-off-by:fixes:mime-version
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7BxKW61zXNgsHSoTkhj7NSmCpNOlxqY+pMZGJFFf+hU=;
 b=WrS/hV5GMWjo/bGF9GyTWG8XBwMXZtY53jb8QMjV4rymudcdmodvNe6/o27uc94Jk2
 d3o/sJ0Jg0jXDsQXbZI2fCr47mTAqKHcxTbt3sRhm0lC/+MnssGYCn+Zd/XQE8CAP8KP
 exuJtQsg2buOy1oBEGUlgkKkIYtoGfjdB2JQjEZM6f/zv6vrIXIKDoWq99lkI18exZI9
 ZTVQ+ts/zwvJpmbJ4KGsJYP9RL7/OIIAoeLFdjXF4OPlHnkdG1q5l+66p46ruFOhR7mD
 zzFFb9Wckbicsn+a30C95Afv9eG4HKkwbswNa/PXHei4yeHktLFP3jxpefbPneosjR5G
 Accg==
X-Gm-Message-State: AOJu0Yy3851wm0M5FSHt7NT6wjJHdV/rvwMh2HHmPfRSLZ1P4JRqzjA0
 l+lQkbtBvbHHaWc5U70dcL4=
X-Google-Smtp-Source: AGHT+IGg2h6WIOJ62OWGtGjqR5jhJPE+nVqrQ0G2/e5u37WoslcXq/z0GXc2ug5ulkeiElbpGMU6hw==
X-Received: by 2002:a05:651c:2d1:b0:2c8:3571:b08c with SMTP id
 f17-20020a05651c02d100b002c83571b08cmr3184338ljo.53.1700463351066; 
 Sun, 19 Nov 2023 22:55:51 -0800 (PST)
Received: from localhost.localdomain ([212.22.67.162])
 by smtp.gmail.com with ESMTPSA id
 h15-20020a2e3a0f000000b002c596731419sm926414lja.23.2023.11.19.22.55.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 19 Nov 2023 22:55:50 -0800 (PST)
From: Maxim Korotkov <korotkov.maxim.s@gmail.com>
To: Aravind Ramesh <aravind.ramesh@wdc.com>
Date: Mon, 20 Nov 2023 09:55:07 +0300
Message-Id: <20231120065507.423065-1-korotkov.maxim.s@gmail.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Fixes: f8410857b7a8(f2fs-tools: zns zone-capacity support)
Signed-off-by: Maxim Korotkov <maskorotkov@rasu.ru>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c index
 56c97d1..81088af 100644 --- a/lib/libf2fs_zoned.c +++ b/lib/libf2fs_zoned.c
 @@ -293, 6 +293,
 7 @@ int f2fs_check_zones(int j) dev->zone_cap_blocks = malloc(dev->nr_zones
 * sizeof(size_t)); if (!dev->zone_cap_blocks) { + free(rep); ERR_MSG("No
 memory for zone capacity list.\n"); return -ENOMEM; } -- 2.34.1 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.208.171 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [korotkov.maxim.s[at]gmail.com]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.171 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1r4yCM-0007V3-7t
Subject: [f2fs-dev] [PATCH] f2fs-tools: fixed incorrect error handling
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
Cc: Jaegeuk Kim <jaegeuk@kernel.org>,
 Maxim Korotkov <korotkov.maxim.s@gmail.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 56c97d1..81088af 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -293,6 +293,7 @@ int f2fs_check_zones(int j)
 
 	dev->zone_cap_blocks = malloc(dev->nr_zones * sizeof(size_t));
 	if (!dev->zone_cap_blocks) {
+		free(rep);
 		ERR_MSG("No memory for zone capacity list.\n");
 		return -ENOMEM;
 	}
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
