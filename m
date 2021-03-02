Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 49ABA3295BB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Mar 2021 04:22:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lGvc5-0001Yr-0R; Tue, 02 Mar 2021 03:22:21 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sunjy516@gmail.com>) id 1lGvc2-0001Yb-SK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 03:22:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vq2wfygbCpdz9NZDMGKqtTNVj3V6bNF/kELLZ481Bg0=; b=AiaeeC4nIA8l4gsJ6wognHVCtF
 Ep1CEze1x3oMqO18jrKy7iJo7koN47dRL2zz5j1QMAJyqhz6HfGD3sm0pLwgWRR//PqwZ6i2zM+mM
 xOXQBkzbqFHxYnHGJy1kKHpWYW0yREbhwESwRkQbpcULkDJifflVsev0X1FPYIHMvOIo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=vq2wfygbCpdz9NZDMGKqtTNVj3V6bNF/kELLZ481Bg0=; b=A+iatv2xQupLLuA9kMinaEti9p
 oBQNpq2Oy9ogAd7R9TROLIzmEl5jnU58VwGTmKVOHqJ7UNZyMywG4ks39/cTN+mPvTB6KcQdFpkdt
 qdge78Dz9+clGu4yRsl9ssFFepq1PRWU9sdu/N42SDSFHJKZwNBRASq0YMAEPUZoTBjY=;
Received: from mail-pf1-f176.google.com ([209.85.210.176])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1lGvbq-00AhGF-Rl
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 02 Mar 2021 03:22:18 +0000
Received: by mail-pf1-f176.google.com with SMTP id q20so12913113pfu.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 01 Mar 2021 19:22:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id;
 bh=vq2wfygbCpdz9NZDMGKqtTNVj3V6bNF/kELLZ481Bg0=;
 b=bTRU20dHNlH3fHiXPT69Hdl8QcnabkGQ3JNMaXxqAaPU15CxbwiabkUNruhWTw13y9
 2RIUVi9a1+hRECUGE+8QnNXK+eJzsNuYWsgpqXsPoaKccDm7oWS6eC2+8eVHlIbvmaTU
 TBc1HwGUoTHRWTu5w0Ph5YUQZCHsRS4JOk7BFNc7EG51grcJb6QMoZT5HHTls/YfF5HU
 1kkF96EWeoe+xBX39/MkqFOAPYAGjYDWm5/Ax1gyx79aDwK7QrvH8iS5dbq8X8oxQ+aa
 X2dJEW1y9oOrDWLmqC+cA0ywKuqdmIdE3BHl008UQHhia2eXMxoyEOHqyfwuMhIGKWQf
 XIiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id;
 bh=vq2wfygbCpdz9NZDMGKqtTNVj3V6bNF/kELLZ481Bg0=;
 b=M4f0Le5sbzLJ4Y0+p8gKGqzqcyMdH2lxKd4oN+dmUCEfeh3yEzzrB74eo1yaqHcW10
 CmqfbFsjNoBkg2ywmo3XDOBnzh6jTfb3qpoyFMIJ2yeXQ/P06kIi4hwDXWWBf7peEyvk
 A84kYJObUUMjQEYFPBaxpilctq18iCZCGcfyZCzcuFHYNDgVc5bC7R8wW6/d0Lq7Z8gg
 Ud2RIPTn/aM+gs6BKz+5hkPLvf2eCUQd964wX1yQmRT4DW86VOVe3VPic0Wr8apY+PIL
 N8o25GV6YE4+4V/f+nnxs1vbJ7FQiSS4os4n29adPUBd3Dims7QvtCKfSWdD3T5xYJnf
 H/8Q==
X-Gm-Message-State: AOAM532LoywkgEHcLIL2QTv7o+v0A7rNymNN6O+BWBP4GQdMfhHr6vhw
 47EqndNUtQZ0iSOxitHcrVQ9PFkm8+vjQR78
X-Google-Smtp-Source: ABdhPJyoETk3Hp/AQUUwaxA/4XZ2B1k0ksZrAYVpoo/qgs6XPjRJfW5+01Vc67mn3nkVELdOfEJGEQ==
X-Received: by 2002:a63:f209:: with SMTP id v9mr9720873pgh.97.1614655321087;
 Mon, 01 Mar 2021 19:22:01 -0800 (PST)
Received: from localhost ([43.224.245.180])
 by smtp.gmail.com with ESMTPSA id i15sm903795pjl.54.2021.03.01.19.22.00
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 01 Mar 2021 19:22:00 -0800 (PST)
From: Junyong Sun <sunjy516@gmail.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue,  2 Mar 2021 11:21:55 +0800
Message-Id: <1614655315-29067-1-git-send-email-sunjy516@gmail.com>
X-Mailer: git-send-email 2.7.4
X-Spam-Score: 0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (sunjy516[at]gmail.com)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.2 FREEMAIL_ENVFROM_END_DIGIT Envelope-from freemail username ends in
 digit (sunjy516[at]gmail.com)
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.176 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.210.176 listed in list.dnswl.org]
X-Headers-End: 1lGvbq-00AhGF-Rl
Subject: [f2fs-dev] [PATCH] libf2fs: fix memory leak caused by get_rootdev()
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
Cc: sunjunyong@xiaomi.com, Junyong Sun <sunjy516@gmail.com>, jaegeuk@google.com
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

memory which malloc for uevent don't free at get_rootdev(),
it would cause memory leak, so free it before return.

Signed-off-by: Junyong Sun <sunjy516@gmail.com>
---
 lib/libf2fs.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 55fa391..85107ee 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -637,20 +637,25 @@ char *get_rootdev()
 
 	ptr = strstr(uevent, "DEVNAME");
 	if (!ptr)
-		return NULL;
+		goto out_free;
 
 	ret = sscanf(ptr, "DEVNAME=%s\n", buf);
 	if (strlen(buf) == 0)
-		return NULL;
+		goto out_free;
 
 	ret = strlen(buf) + 5;
 	rootdev = malloc(ret + 1);
 	if (!rootdev)
-		return NULL;
+		goto out_free;
 	rootdev[ret] = '\0';
 
 	snprintf(rootdev, ret + 1, "/dev/%s", buf);
+	free(uevent);
 	return rootdev;
+
+out_free:
+	free(uevent);
+	return NULL;
 #endif
 }
 
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
