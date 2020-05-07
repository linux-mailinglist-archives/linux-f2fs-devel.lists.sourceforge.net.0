Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 649A51C9E47
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 May 2020 00:12:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jWol2-0004x8-4F; Thu, 07 May 2020 22:12:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <guoqing.jiang@cloud.ionos.com>) id 1jWokz-0004wz-Ou
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 22:12:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:In-Reply-To:Message-Id:Date:Subject:Cc:
 To:From:Sender:Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iMtexH+KHYg8WWtN7UTgX6eHTynYLEIBFReri4mWFCc=; b=bkGHAGy3Zw5gt4rHbWPzEFsVLw
 dI4ftSZmusvlOjzfK/rbf1OWR2oNAboE9S/qfBlj6tlxTXhrf3MnnlJ9CCKQy8Yy1ScgQ4Qw2QVhR
 teAIfyi/6d4TFjrcrGBmTrJWCq7smVwpnoYmliRNGikO1UHQ2B7Q8/E7RAHE1Mj0fk24=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To
 :MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iMtexH+KHYg8WWtN7UTgX6eHTynYLEIBFReri4mWFCc=; b=KY7MiV/QDyI6jS6Nks9MMrhsc9
 obfCqVYOVGxDBvibi0NeoIygTTxZrSH3xh/6gNWgTqvW6nFbQQlBebs7w5hUSDFSEeCWLr1ZDiKnx
 YvEtJB5BGBuuMyQaeaHtZe37JDYoyESgN2aeZZfRPY8sX7wlICUZL0jGTvxD/IWMLMxE=;
Received: from mail-ed1-f66.google.com ([209.85.208.66])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1jWoky-000qYs-65
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 07 May 2020 22:12:41 +0000
Received: by mail-ed1-f66.google.com with SMTP id t12so6820733edw.3
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 07 May 2020 15:12:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=cloud.ionos.com; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references;
 bh=iMtexH+KHYg8WWtN7UTgX6eHTynYLEIBFReri4mWFCc=;
 b=C+aZyE0ItmHGIBdvm5jWSFvyCmt2e6ZkOwlIWvu8b0H63W29ve2rOZlf8y+8y+gmld
 ZjG9Y4WWIGb+goXnokiWHdrsMqES5X7JaSrEV/fhpzmey1WTqsjlyk0dSmog8gabW9mV
 UifUcMmnYPlLhVxtwEmS61HoE/D4xiiq4QlqcisbD0nY3ghcTLtx9KUsW/ApbVwG1XCL
 ujtW37cAyL8CrSDZL+CIJvPXUHwNEt+up9VJjMd9AVr3Bfbx7+OXhE/qvfAsmb6BvPFi
 5D+Cv0iQNc/unewS64ruKoLL/NcwnOkWm8MpSRK5TxKVUIEp9V/+mR5uDMaRX7qMEtU2
 Xnbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references;
 bh=iMtexH+KHYg8WWtN7UTgX6eHTynYLEIBFReri4mWFCc=;
 b=EW//0QePUYMSRmn3spguEiIUikcIdZwDfNxXpFnPPCHLQ+5IWEt8D00GSsFb0HUXD8
 STKbKN9GWec/a/LHHMX2+ClzIjNVwbnYuNHwVKkmB9UP1csVfwLAjmgkAnhsTHZEc/Xh
 9J6qNxOvHvzT4mqEDu7vn23w53E4wIRWJ1o0yV2r1yYMqbG7XHCTSYRg+hi3efVc9dDp
 kZfgTSQSkDqtLChPwF1/3aRA4Mml7kBOO8J+7ExYn+e9vo090SIXVhKs0a38SJVP3bzK
 i58lEvHySmQpKmE3zafvYsNZOGQkUxCFT/5RNUqTnyBwZeRq1f6fAuD383oqaZTu2dIW
 W31Q==
X-Gm-Message-State: AGi0PuZIogsuFW6UJB1cDGag/TST+Vfmo5z/GtYM7UqaO49B0ttAiplu
 1gzTfGLT0GiAYaIFtKlEcIDwgcAFiSVjKQ==
X-Google-Smtp-Source: APiQypIlXXZdUeLWAD5u56J3xlbgzi0w5YqlZnrUpLQfikzSZE7i3StNg5L+SIQQChqhUCbofsEzFg==
X-Received: by 2002:a17:906:5608:: with SMTP id
 f8mr14610196ejq.190.1588887862357; 
 Thu, 07 May 2020 14:44:22 -0700 (PDT)
Received: from ls00508.pb.local ([2001:1438:4010:2540:a1ee:a39a:b93a:c084])
 by smtp.gmail.com with ESMTPSA id k3sm613530edi.60.2020.05.07.14.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 May 2020 14:44:21 -0700 (PDT)
From: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
To: linux-fsdevel@vger.kernel.org,
	linux-kernel@vger.kernel.org
Date: Thu,  7 May 2020 23:43:55 +0200
Message-Id: <20200507214400.15785-6-guoqing.jiang@cloud.ionos.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20200507214400.15785-1-guoqing.jiang@cloud.ionos.com>
References: <20200507214400.15785-1-guoqing.jiang@cloud.ionos.com>
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
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
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1jWoky-000qYs-65
Subject: [f2fs-dev] [RFC PATCH V3 05/10] f2fs: use attach/detach_page_private
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
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Acked-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Guoqing Jiang <guoqing.jiang@cloud.ionos.com>
---
RFC V2 -> RFC V3
1. rename clear_page_private to detach_page_private.

RFC -> RFC V2
1. change the name of new functions to attach/clear_page_private.

 fs/f2fs/f2fs.h | 11 ++---------
 1 file changed, 2 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index ba470d5687fe..6920d1a88289 100644
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
+	detach_page_private(page);
 }
 
 /*
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
