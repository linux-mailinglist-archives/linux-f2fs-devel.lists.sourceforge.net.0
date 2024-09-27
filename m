Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C871C9888BA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2024 18:07:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1suDUr-0000m5-22;
	Fri, 27 Sep 2024 16:07:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <daeho43@gmail.com>) id 1suDUp-0000lz-3n
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Sep 2024 16:07:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0e2OQQno5G2t7eZ3Z7x4q0N4c7RNB1RIrrucMjojTeU=; b=jJNo7iIGcJy+xB+KSuFXi42sBy
 KGJZaPWJluMuk7U2QrZrRIadanFQFzuVBXRHWG9CvDPTIQA9CqyieYeCFeolLy/WNMT6YBAxqc/8F
 xgmPbPgnrXvcfngiue+QDqOkh/8083RCYRi3KTvvmYAWgEpumqFRwXSDC4VqgD0m4Ge0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0e2OQQno5G2t7eZ3Z7x4q0N4c7RNB1RIrrucMjojTeU=; b=V
 QzAwpf6H2mjTd6JwdlanR26+dlnoP4WuGuTQctIeTCli54m7vTc2FENbTURKhCUvp0m5ID+247Ja9
 WyC5eiUqQfsH+ncE5Pk3FEZ0rj1w4GMF3ERBajxo/mFkW+JyoCrw0a6kZG43Ui0HlvDsewlAQaZ9u
 j7QW5FCcffvb6j1c=;
Received: from mail-pg1-f172.google.com ([209.85.215.172])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1suDUp-0000m8-26 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Sep 2024 16:07:07 +0000
Received: by mail-pg1-f172.google.com with SMTP id
 41be03b00d2f7-7ae3d7222d4so1926649a12.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 27 Sep 2024 09:07:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1727453221; x=1728058021; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=0e2OQQno5G2t7eZ3Z7x4q0N4c7RNB1RIrrucMjojTeU=;
 b=VyI5eGrWrcp74PVqDVj4hj6qc13A5/rLddfXQXbPv2+ogp0yNsYtTaKHQFcFzkfELj
 /fxhNpdjDY6RYta/302nPuQbbwRr70RDSPq4xoW5DN5m1QDvgfDrQDJWOEKFE7biNKIf
 LhpZOZ7BALhicyNAEjGYpM6Iqx6Ki4pxohX4J8TkP7kjRDmNQGX938pz4d47Tx+yoize
 gJNv13PPpuPMUEvhcj7UbhLMOHJ8yQZ1/pzN3DAs0RfwJrDbrro8D48bAVXIFeNm/rXk
 xOuz+9tJkjCg+toaaF8LJj7hxEb0E+HgTjbEGs2WPB/WAx9Dhqb3L5cKelxF7xjVtWgY
 DTTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1727453221; x=1728058021;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0e2OQQno5G2t7eZ3Z7x4q0N4c7RNB1RIrrucMjojTeU=;
 b=IVup/fpFLWr4rSVogiKwxGRoL8N0U+eSP7P82bfQm095eyu+iiWXnSDcmrZ2rIHxD9
 rqOfvApzVyTw7nUjvHdMKTECY9nxk2KY37s5NBnVubcGFvcQyF48YUYQUAW8cFoQ7GaI
 pEind0+9lponJj1qPFEB6fwjgnN8QRXkzjCW70kbMPXYg/Vtt86xDcICLbsnXTdLhfO5
 f2r9BEwTtv/hNJDJ2XWrs34+xMs6fReBApPPVKfYhk3gk+K8j/y7suXbppx3aep5o/af
 dJMEEtMKsHU/5vvWjG9NVYAHGWHDhgqenOLWwxJrPWlNo5VR19zOf64LIsOBjxe+ii5p
 H+YQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCW4pzMksXQbPgcIZElEKVCZTmeXM0/3GtXrW/KAR5z/HXJIU49ZnDX27RMEv5banL5n6Z2v1ViznsVcq7OvARnj@lists.sourceforge.net
X-Gm-Message-State: AOJu0YzBN4HEDzl83utEzZiU/JsEKtYRzdmAMngJ0pfxJ7vn56BKxZ4I
 D4i/oHA2WRjKv6WKH33u0itDQ+yOyYuWHN9hukB8roGyShh6/Ej3
X-Google-Smtp-Source: AGHT+IHdtJuVx0zJqlZh5r+D43Yo+UQqo+2/vP9AXMexE6REGrD3V/syTYTFY60GaMLMSZKKNfJJHA==
X-Received: by 2002:a05:6a20:cf8f:b0:1d4:e4eb:73e2 with SMTP id
 adf61e73a8af0-1d4fa687debmr4966021637.13.1727453221177; 
 Fri, 27 Sep 2024 09:07:01 -0700 (PDT)
Received: from daehojeong-desktop.mtv.corp.google.com
 ([2a00:79e0:2e14:7:a574:73a2:d5e7:da6e])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-71b26529d6csm1752546b3a.166.2024.09.27.09.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 27 Sep 2024 09:07:00 -0700 (PDT)
From: Daeho Jeong <daeho43@gmail.com>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Date: Fri, 27 Sep 2024 09:06:54 -0700
Message-ID: <20240927160655.3594366-1-daeho43@gmail.com>
X-Mailer: git-send-email 2.46.1.824.gd892dcdcdd-goog
MIME-Version: 1.0
X-Spam-Score: -0.7 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Daeho Jeong Current description confuses users like
 they can add addtional devices with one -c option using commas(, ) at the same
 time. Signed-off-by: Daeho Jeong Reviewed-by: Chao Yu ---
 mkfs/f2fs_format_main.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.8 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.215.172 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [daeho43[at]gmail.com]
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends
 in digit [daeho43[at]gmail.com]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1suDUp-0000m8-26
Subject: [f2fs-dev] [PATCH v3 1/2] mkfs.f2fs: change -c option description
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

Current description confuses users like they can add addtional devices
with one -c option using commas(,) at the same time.

Signed-off-by: Daeho Jeong <daehojeong@google.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 mkfs/f2fs_format_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mkfs/f2fs_format_main.c b/mkfs/f2fs_format_main.c
index d9cdd61..b6785cd 100644
--- a/mkfs/f2fs_format_main.c
+++ b/mkfs/f2fs_format_main.c
@@ -50,7 +50,7 @@ static void mkfs_usage()
 	MSG(0, "\nUsage: mkfs.f2fs [options] device [sectors]\n");
 	MSG(0, "[options]:\n");
 	MSG(0, "  -b filesystem block size [default:4096]\n");
-	MSG(0, "  -c device1[,device2,...] up to 7 additional devices, except meta device\n");
+	MSG(0, "  -c [device_name] up to 7 additional devices, except meta device\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -e [cold file ext list] e.g. \"mp3,gif,mov\"\n");
 	MSG(0, "  -E [hot file ext list] e.g. \"db\"\n");
-- 
2.46.1.824.gd892dcdcdd-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
