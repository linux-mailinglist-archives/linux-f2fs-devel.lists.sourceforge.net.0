Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 793BA2B00C8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 12 Nov 2020 09:02:33 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kd7Yn-0004nV-Dw; Thu, 12 Nov 2020 08:02:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <hyeongseok@gmail.com>) id 1kd7Yl-0004nO-Mo
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 08:02:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9+waUlGtlkBgYWb7wXp9DIAiajCHd+frNRohqWw+nsc=; b=ZEPsYn1/S+DPpXg+dDBoCCuVPc
 3U5oHc2gxrA6kabXqf16GZSAu+kxUKg4zZoilnsNg1HfkKkcjXG94mkDctX19LGH/fJ4dayPu9jFn
 pJ4aOWhXN7Ws1lCye8enkUU3rLJ9sMx664ASlo1AoSQHhOsSte1mGsfRuPuGCSvqUVb0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9+waUlGtlkBgYWb7wXp9DIAiajCHd+frNRohqWw+nsc=; b=m
 cCvbg23A3EKGfTEleSe/QBQS4BjBZoHtzXqDBIFsrWbI2gPx5K5CnxH0QBBHd+lNbXpI0qcQj79/V
 PdIUDmxdVJPm8q8v0+bHwOYU+Jy5SnxYaKvBxLRl/DvL+w0TO32L05RpYpPxKGI80TqTy0nDA5eRK
 lovuPc2udg6BJ6v4=;
Received: from mail-pg1-f194.google.com ([209.85.215.194])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kd7Yc-000ENV-AL
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 12 Nov 2020 08:02:23 +0000
Received: by mail-pg1-f194.google.com with SMTP id r186so3537106pgr.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 12 Nov 2020 00:02:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+waUlGtlkBgYWb7wXp9DIAiajCHd+frNRohqWw+nsc=;
 b=micFsx3gaYn9qWYO35vPKHvVOSN9JaU5O4K8vZ2zd8v/uIbHy1aH0L+HoFWPbcss41
 Npv61Fv22oZzvOkg4mg14PZrrhCrSLunNF07UL7jhGSIrL1qgxvGIAJ3xQ/LzAcf+utn
 HT+/pfrf7DS+uC9DzfkLg0NJYOibf0sFVlM7Z/JjfkETcsHKTA9s8WB+/1T4gBdDWExD
 9ve+Czsa64lU+Jix22YQefE1Bnfozlb4r1x0c1aYA+HtkU80Q93gJfIEQeWcFj4bZhI8
 rU0Q5EnXJ961Aqi8M4pGnP1c629ANhd5olXRQrnxQneN0AIcZYXS2xVBtnV0Y9xzWqW6
 fYzQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9+waUlGtlkBgYWb7wXp9DIAiajCHd+frNRohqWw+nsc=;
 b=SXXTytUQOtZpi0I/l3la2ZTAt2zbJswCbHPML+UCbs8gw8rEIgELGqWD7QmHydfiTY
 LyoyuJvNBi+Mw+53MloiqopkmF+Pr8pTvbDLOm0S4y2NXlRtoKLWVmcBqXrjhb026vjH
 Hhc6j4COYCa1uR4/iXyDaQdwGFmqq5n5ZdXkCAN1vD6v/xtSXNONnLGz2Gush7Wyt8jg
 BbjwDqwzdgbzgZ0TqjCqr5QBYPdWquXcftn5lMhVt9n+HKtoZM1dxclWCjQgqQKQ8+gS
 jEIinFdFQYZnQVVqnPi9nl8hM+3hVKKZzDC/VR7Iczr7LW63Aw2BxGHkITNUJv0WQeDV
 YeUw==
X-Gm-Message-State: AOAM532f0GNFlMTTBp1XwLijXqfBWf/OeCSlKZDXyJ8Xjmex2EmBO4Rl
 qaaFQMihnkd9RwAFxIzsays=
X-Google-Smtp-Source: ABdhPJwiNKBQvpl1OTw2k5oq8Hv8NrhoMZj7izp+r2mER1uzorFMs+LuXuXpTIalBkPcKOg1Ha5juw==
X-Received: by 2002:a05:6a00:212b:b029:18b:ad77:1a27 with SMTP id
 n11-20020a056a00212bb029018bad771a27mr25806979pfj.40.1605168128615; 
 Thu, 12 Nov 2020 00:02:08 -0800 (PST)
Received: from localhost.localdomain ([27.122.242.75])
 by smtp.gmail.com with ESMTPSA id v3sm5170553pfn.215.2020.11.12.00.02.05
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 12 Nov 2020 00:02:08 -0800 (PST)
From: Hyeongseok Kim <hyeongseok@gmail.com>
To: yuchao0@huawei.com,
	jaegeuk@kernel.org
Date: Thu, 12 Nov 2020 17:02:01 +0900
Message-Id: <20201112080201.149359-1-hyeongseok@gmail.com>
X-Mailer: git-send-email 2.27.0.83.g0313f36
MIME-Version: 1.0
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail provider
 (hyeongseok[at]gmail.com)
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.194 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.215.194 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kd7Yc-000ENV-AL
Subject: [f2fs-dev] [PATCH] f2fs: fix double free of unicode map
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
Cc: linux-fsdevel@vger.kernel.org, Hyeongseok Kim <hyeongseok@gmail.com>,
 hyeongseok.kim@lge.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In case of retrying fill_super with skip_recovery,
s_encoding for casefold would not be loaded again even though it's
already been freed because it's not NULL.
Set NULL after free to prevent double freeing when unmount.

Signed-off-by: Hyeongseok Kim <hyeongseok@gmail.com>
---
 fs/f2fs/super.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 00eff2f51807..fef22e476c52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3918,6 +3918,7 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 
 #ifdef CONFIG_UNICODE
 	utf8_unload(sb->s_encoding);
+	sb->s_encoding = NULL;
 #endif
 free_options:
 #ifdef CONFIG_QUOTA
-- 
2.27.0.83.g0313f36



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
