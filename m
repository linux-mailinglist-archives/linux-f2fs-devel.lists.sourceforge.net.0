Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDB31C09AB
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Apr 2020 23:52:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jUH70-0003mr-HW; Thu, 30 Apr 2020 21:52:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jUH6y-0003mV-Sw
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 21:52:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VQtiN0YF68ouYEl0FBCwGef51NS629CikCik/xuB3mA=; b=UGYUQG3VGNy4jmM6bAcQtlhxdr
 DLoQj6vGw2Vt+YYqiaX4khYyZVoidgdlEfbkmu2+/S1H1gcMvr+L5Mt49ViHZUoQup+UuHPGrGkga
 E+SnQnqBRabxosZvDxKd0ZluG+juZb0IzMk7ukCFafetzl9HH1/wHnpYJM5FC5NfKraE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VQtiN0YF68ouYEl0FBCwGef51NS629CikCik/xuB3mA=; b=U7Sm9GzbfAKS442zOGH0AyQ6Ht
 d8xQRLnxbvXyc6C85tfIM6KYyfeHuDAe0xwVQKAWb240YJYmZhAvUpxzRNRFI3Vaprw5q5FkLkyqn
 FOZE+n8pvMUtymg3xtgiYrWkcrpbADQv+lcg/JyxxHDegdlTJvD8xcZq1SG/atOxS2Bc=;
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jUH6u-005ng4-Az
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 30 Apr 2020 21:52:52 +0000
Received: by mail-ed1-f66.google.com with SMTP id d16so5814921edv.8
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 30 Apr 2020 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=VQtiN0YF68ouYEl0FBCwGef51NS629CikCik/xuB3mA=;
 b=AUo5ie4M5LC6EyVTONtWCWaK6x9Glpt0fKqCXZVKpIls4fS+TQMg9AZVj57+ZKp657
 KxpTHzcmRADvXQhinXFVjaJFVsM9IuKylOT606jy/n3S8NWY7zE2X3rHDq7FW+dv5OL5
 1HMaxuBEfufCr2WCuB4rDNQOV8qEERy8iOyCbgO42UphAQhYWWLT2Kl7Ouklm/t3uF1a
 fBBUzA+7kF8C+npPOk3+v2AgOy9vTvhHtGfHdvNk/1rBbn6A5aQS1qjv/ZBpzIHD8l/5
 RK7vYHRT3JNA6f1tCk3T27BEPLr6hIdu7kSYpHu2/hF36qamf3WGbDphvY/vVIgJThmr
 9n9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=VQtiN0YF68ouYEl0FBCwGef51NS629CikCik/xuB3mA=;
 b=VI44BLj5fOvnfrApqujZLp8dRpo1woF0pONuqXV3QtCdUCMJ44k4SIBjLzTXIuchTw
 QK76y4IZaS1VLWTitb5SEvFwpcOkHv4yTrjyOSd+6sNq/J+ac5CCitbsBhfRhUOn69sR
 pmZra/bYXRoj1IFxoMEPMtTeJLWh4gMxkJvvtJp0SQVtC3pYTLOfqFyK5dL/SUO5log5
 Q5dYRYgVVkXkSWLGe8tDJA1W0s62teDHxMyhKLk+xpXpWpMOm2N3OHCA/8O62pqDZ0EW
 dZPxijTDwIxyQY7iXM2gMnn2AYzpcXhV+f9XEvV0Q7kvha1QyIEJDuHPEa4KN9JOb3y6
 RtZw==
X-Gm-Message-State: AGi0Pua43G/Z29aE2vZZuidI7VNMS0N6R0BBDR3IuFp93SkFJZo6DJVn
 pBBtG88NvFhgBz0mjMQEEKDF9Q==
X-Google-Smtp-Source: APiQypL49Bp/BPGNJL3rW/dArQDsk2UFazjTXaUNS6oloFuEsd404kXblrgA4wta20gl8BWTl2ZM7w==
X-Received: by 2002:a05:6402:286:: with SMTP id
 l6mr1062803edv.134.1588283561709; 
 Thu, 30 Apr 2020 14:52:41 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:b82f:dfc:5e2a:e7cc])
 by smtp.gmail.com with ESMTPSA id f13sm92022ejd.2.2020.04.30.14.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Apr 2020 14:52:40 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu, 30 Apr 2020 23:44:46 +0200
Message-Id: <20200430214450.10662-6-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
References: <20200430214450.10662-1-guoqing.jiang@cloud.ionos.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: ionos.com]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.208.66 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.208.66 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jUH6u-005ng4-Az
Subject: [f2fs-dev] [RFC PATCH V2 5/9] f2fs: use attach/clear_page_private
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
Cc: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>, david@fromorbit.com,
 willy@infradead.org, linux-f2fs-devel@lists.sourceforge.net, hch@infradead.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since the new pair function is introduced, we can call them to clean the
code in f2fs.h.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Acked-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
RFC -> RFC V2
1. change the name of new functions to attach/clear_page_private.

 fs/f2fs/f2fs.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ba470d5687fe..24d22bd7352d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3051,19 +3051,12 @@ static inline void f2fs_set_page_private(struct page *page,
 	if (PagePrivate(page))
 		return;
 
-	get_page(page);
-	SetPagePrivate(page);
-	set_page_private(page, data);
+	attach_page_private(page, (void *)data);
 }
 
 static inline void f2fs_clear_page_private(struct page *page)
 {
-	if (!PagePrivate(page))
-		return;
-
-	set_page_private(page, 0);
-	ClearPagePrivate(page);
-	f2fs_put_page(page, 0);
+	clear_page_private(page);
 }
 
 /*
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
