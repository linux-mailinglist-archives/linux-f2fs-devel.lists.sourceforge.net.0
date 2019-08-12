Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 775ED8AABC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Aug 2019 00:52:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hxJB1-0005pX-6m; Mon, 12 Aug 2019 22:52:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <qkrwngud825@gmail.com>) id 1hxJAz-0005pD-HM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:52:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v0FTapujsyUElhccRaz4C0E1NQnbsYT9j2cx1ikWN1A=; b=AhSmqv/VtcWCenshMjiC9Y1fUm
 kH+9uR9iDUchY31F2Qz4sbQ/Ferw3KlkQFrZ+1iywsB3lXahqUSA23RPsWpMX1sL3M5oG0t1PwdUE
 YjHjgiNGGTBccPKe8Dw14n8j1yZj3QiqI9ZR9u6/Y4QSGuN6iYa2GOPTVpeuR3RgopHo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v0FTapujsyUElhccRaz4C0E1NQnbsYT9j2cx1ikWN1A=; b=ImBC8FWjWvDpX5c+fyvheaVYAx
 Rtb4FDWdYUrhpv8+xB7i8dY0TezjFHtMNNP5P3nEizHcKN0vMhjZpY5X5rJBruk20ZDO+Vcp2Jbm+
 UDfSVph7NMygX3n0yEm/jQTKUNA/D+Hu0wEiH6kiH/W4g6Y/27dzLofXWHZvErv8k8Ho=;
Received: from mail-pg1-f195.google.com ([209.85.215.195])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.90_1)
 id 1hxJAx-003Gg8-Bu
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 12 Aug 2019 22:52:29 +0000
Received: by mail-pg1-f195.google.com with SMTP id r26so14264006pgl.10
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 12 Aug 2019 15:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=v0FTapujsyUElhccRaz4C0E1NQnbsYT9j2cx1ikWN1A=;
 b=kKDV/pRNMgdHwRfL27iTq3JxYgypyB+5GWL+lK4NCbHHRntMZV95l1rVY+A9sz01BI
 PS5YcrpnFTujtWiCmXHEsCqrs9YPDTe9pVMrt3vwjcXO6su36T+LkyLn0L6tKUU3TGRI
 Hv/wv9ryUWWTVYwOn4t71A8iK3NpHvaWlx1pHlu6OBLmSqST6OHp6xP4sXlhk5VjvogS
 Sf1qrVHDQYd8A86V4NIA5SXskLfVtgIyk0148sm7f2ECK/GeNweCwxfRuVBZ0PvQCnYc
 iHa2MeLiAVZsRG04M+/VNRtyJpuMVhjtDJ+b0/QXp2TA/oobSw8u9/DBnD5JVYSsVDxF
 gs5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=v0FTapujsyUElhccRaz4C0E1NQnbsYT9j2cx1ikWN1A=;
 b=Rfx9Ze3Lr1KnxtAlNa5ulmZ1Kgi7ucIQuCOO9yTUM80nnp20wo/ytI3Yb8sybUobtR
 WGnZQux99aN3ntwgi0RMly/eAsPOWrc3YzXnZA3Y4xCOz1170G70F523rtGGXTR0rBgl
 Qhv/8je9p3fDsO6kYYfj/Bu6CMdnK48g2vp4zEwuRueI9J963LRyiNzQ2yo7zjp0Z9p9
 Ht7vAWaTVEwun99duxDVzx0paEKx8KjtmK8G8vxDpWPAJxvd6G6DyQH84T/PWsaWKWWE
 ihRbHnkMrOM0ud/wxelejcL1Fzr+fjxff7rR5/Q/E2i4aQ2kVsfcIg+Zd7S932j3jTu2
 vtHg==
X-Gm-Message-State: APjAAAWRuZ5wsfAl750gTXy3mqdzwJA1c1I9TjKjquo8d6QZnQs1h2wd
 Y3ckKLDab3JfZF4GrrnrToh9eFQIFj2F4Q==
X-Google-Smtp-Source: APXvYqwbwiE7TtXY84uIC3G8kiAGyCrNXpubCF3e6ZFiDiw1XvwrUBla1gpC5BeH2NMN6I8QTjQUUQ==
X-Received: by 2002:a17:90a:fe5:: with SMTP id 92mr1433962pjz.35.1565650341232; 
 Mon, 12 Aug 2019 15:52:21 -0700 (PDT)
Received: from localhost.localdomain ([165.246.149.139])
 by smtp.gmail.com with ESMTPSA id 5sm45698246pgh.93.2019.08.12.15.52.19
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Mon, 12 Aug 2019 15:52:20 -0700 (PDT)
From: Park Ju Hyung <qkrwngud825@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 13 Aug 2019 07:52:11 +0900
Message-Id: <20190812225211.1737-2-qkrwngud825@gmail.com>
X-Mailer: git-send-email 2.22.0
In-Reply-To: <20190812225211.1737-1-qkrwngud825@gmail.com>
References: <20190812225211.1737-1-qkrwngud825@gmail.com>
MIME-Version: 1.0
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 1.0 HK_RANDOM_FROM         From username looks random
 0.6 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (qkrwngud825[at]gmail.com)
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.195 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (qkrwngud825[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1hxJAx-003Gg8-Bu
Subject: [f2fs-dev] [PATCH 2/2] mkfs.f2fs: add VM disk files to hot data
 types
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Similar to .db files, these are randomly updated extremely frequently.

Signed-off-by: Park Ju Hyung <qkrwngud825@gmail.com>
---
 mkfs/f2fs_format.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index 37d82c3..1c08e3e 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -94,6 +94,11 @@ const char *media_ext_lists[] = {
 
 const char *hot_ext_lists[] = {
 	"db",
+
+	/* Virtual machines */
+	"vmdk", // VMware or VirtualBox
+	"vdi", // VirtualBox
+	"qcow2", // QEMU
 	NULL
 };
 
-- 
2.22.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
