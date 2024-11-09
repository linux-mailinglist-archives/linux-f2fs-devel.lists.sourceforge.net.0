Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BA85F9C2944
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  9 Nov 2024 02:39:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t9aR6-0004sO-HL;
	Sat, 09 Nov 2024 01:38:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <danielyangkang@gmail.com>) id 1t9aR5-0004s8-3c
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 01:38:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bawIuU92Q74ggWk5pYR+Z5wr5o+e7Od2yBJHvPe/cZk=; b=j3SwFGJxXyKrzy0M60EWj3yaeQ
 83uOQOxg2ZK7eH/m1Ci4bXAy/OtCGQqVZe69xqaSUTxAYhoZNBcURypj5GQOHevZy3U1GN0Y8Z0mT
 iaOoSo3IwcEd8RoNpV8GhUGxKEsxwolv4pNY0zFa4nI96exVHAnS8YEyKy8WBZeKtj54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bawIuU92Q74ggWk5pYR+Z5wr5o+e7Od2yBJHvPe/cZk=; b=B
 zM5aruZoKIzuEiC/iNTlrPuqDB2zO+B6IDZjeLjKiSjOZyJQvuRcgj4sqN8IGXh7hSeseiK41jOjR
 Z37vBBc5ateR/lSC9hFyJGvq9pNMQxBmLU7WycUz1QUE2nBtHQgXHH0nwWAmMhqvzKB/iv0tKTWoO
 cnBgxo1eVYIzTTsE=;
Received: from mail-pl1-f176.google.com ([209.85.214.176])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1t9aR4-00019V-7W for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 09 Nov 2024 01:38:47 +0000
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-20cdbe608b3so29775605ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 08 Nov 2024 17:38:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1731116320; x=1731721120; darn=lists.sourceforge.net;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=bawIuU92Q74ggWk5pYR+Z5wr5o+e7Od2yBJHvPe/cZk=;
 b=e/sbzf0lEcZKZQFFOWPZccdjo159jbi6HLXKaAKloHVHAinvVOd7ohfYc9lyVel/rf
 9ZpOmYaeiLfGKG0oy98Q9LUAOljnizaIlPhMYspCrHsQU3pZyI4lonKZ2ya7xvzc14vr
 BLlDc/2zzxBz6fQ7eDwp4XtxKZjQUzyHeGPoJoLMjhw1wmpYgja56iExqBWuopWDg5nU
 vc8rwhcWqmW2YfNz//ikmL4Sgsgdl8PxKrCddDRPleZOb5utEYfoOq8Toyx7heDXGHap
 ZdnjX2NPtHiIbExgqmluA1ptqvrwP51Nu3rsUi6RUG5zmGF/a5XX9EieXtHSO/3sT0lp
 7IPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731116320; x=1731721120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=bawIuU92Q74ggWk5pYR+Z5wr5o+e7Od2yBJHvPe/cZk=;
 b=CfKV8wNhXLu7vvgvIcQ71cKa7z0XVsN+dukZtI416oLwaQ+MqeUcdAbvJ8sopVaZKs
 x1yZPrNrY6s+ZxOdmPCcdYiHapXiVhSIsOwvrdKCYLx5yA00tQc1lmkr0d/okNrxP84P
 kgKsdYzx18MePmDCQ5AVkNlVuOFUCEhfnQBqbAjDOC0JmOfvSxgZKVmeCWTojTm2CnVG
 cCCpntiItgEWz2Hdlyru3gEQYyY7BdYXlnpLKpc02toc/jTKEzsDIcxbvxRtsA2Cfm6e
 cfkPe2Lye6JXWOPfEUxkieq53RFf8zhCpd4Mc3qsjhPy4CHAUEZ0b0r//cB2r7GhAUG+
 7M5A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXBwt1T6qGjSdUD2NbVfOWJuDvCDVWdNghskhz0nLdw+hrbKfqLlVs3SDxB9IZUTxlvo/jBRcTEkqZO+GXKbIIB@lists.sourceforge.net
X-Gm-Message-State: AOJu0Yz4yPEwMfNVUSKb5HNeYoEF8W0Xtowu9U3jbUTmCAaRAY4u7vs1
 YbCcRdHuBkRcQcIX2MRVUJQwlxDecXpqiY6PP86hXgMuRdbUxhdi
X-Google-Smtp-Source: AGHT+IHjZCAp37vub2/la0ETYlZdowHlKQwip3eiKMZwcVF2lsyB0zO1XdQqTFMxsXDWTDJ75SGn8g==
X-Received: by 2002:a17:902:ced1:b0:207:15f9:484a with SMTP id
 d9443c01a7336-211835506c4mr59901975ad.15.1731116320486; 
 Fri, 08 Nov 2024 17:38:40 -0800 (PST)
Received: from debian.resnet.ucla.edu (s-169-232-97-87.resnet.ucla.edu.
 [169.232.97.87]) by smtp.googlemail.com with ESMTPSA id
 d9443c01a7336-21177e458bdsm37474515ad.133.2024.11.08.17.38.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Nov 2024 17:38:40 -0800 (PST)
From: Daniel Yang <danielyangkang@gmail.com>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Fri,  8 Nov 2024 17:38:19 -0800
Message-Id: <20241109013819.5952-1-danielyangkang@gmail.com>
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
 Daniel Yang --- V1 -> V2: handle strscpy errors, changed prefix to f2fs 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 FREEMAIL_FROM          Sender email is commonly abused enduser mail
 provider [danielyangkang[at]gmail.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.176 listed in list.dnswl.org]
X-Headers-End: 1t9aR4-00019V-7W
Subject: [f2fs-dev] [PATCH v2] f2fs: replace deprecated strcpy with strscpy
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
V1 -> V2: handle strscpy errors, changed prefix to f2fs

 fs/f2fs/super.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 87ab5696b..4721a8a8f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -5,6 +5,7 @@
  * Copyright (c) 2012 Samsung Electronics Co., Ltd.
  *             http://www.samsung.com/
  */
 #include <linux/module.h>
 #include <linux/init.h>
 #include <linux/fs.h>
@@ -1158,7 +1159,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				break;
 			}
 
-			strcpy(ext[ext_cnt], name);
+			if (strscpy(ext[ext_cnt], name) == -E2BIG) {
+				kfree(name);
+				return -EINVAL;
+			}
 			F2FS_OPTION(sbi).compress_ext_cnt++;
 			kfree(name);
 			break;
@@ -1187,7 +1191,10 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 				break;
 			}
 
-			strcpy(noext[noext_cnt], name);
+			if (strscpy(noext[noext_cnt], name) == -E2BIG) {
+				kfree(name);
+				return -EINVAL;
+			}
 			F2FS_OPTION(sbi).nocompress_ext_cnt++;
 			kfree(name);
 			break;
-- 
2.39.5



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
