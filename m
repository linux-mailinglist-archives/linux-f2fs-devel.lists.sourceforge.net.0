Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 069532AD18D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Nov 2020 09:44:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:To:Mime-Version:Message-Id:Date:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=50dw0NhOf3TqZbBEJdXxFobe7Sk3GzDjGwrH86DtCeg=; b=RK0YSd8c0/hFYtJ9kl+H8XPU4T
	7iOizYAJ1nCxxdYxF4tlXEpCkcft8LeNKnARpx9uyBi3AT4HUw52AFgOz+vxEKoHlUzDgCn/y02Ao
	h+gtjFlFOkl0hwWhSAChI6+1qSxRFNRFvJEGBTFIuQLXT5F/EfRDvSAT7V5sCKeOai8g=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kcPGU-0003Qr-AF; Tue, 10 Nov 2020 08:44:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from
 <3OEuqXwgKAHsqnahmgrtfnnfkd.bnl@flex--robinhsu.bounces.google.com>)
 id 1kcOzp-0002i1-6X
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 08:27:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Cc:To:From:Subject:Mime-Version:
 Message-Id:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YleeopDaCgXcJmdy4XOEQs2LFG2krgZZ0q7A6+K5Zb4=; b=edcTCyJCmj1Fv8Ycsz9wNmA/B6
 SymLN6ysFmlw61Fn1PQvF6bx/JLA9bXr+I+ANLPs+ivGiMjFcFU/R+ixhXR2R9HzY+oI/G3gXFGyN
 NxMU5jLrgq3v3CRCgZCNi66xXkU7rGKdYroRqyhuTz1Jn9IvwLKh2qdWzloWyPgcKSLI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Cc:To:From:Subject:Mime-Version:Message-Id:Date:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YleeopDaCgXcJmdy4XOEQs2LFG2krgZZ0q7A6+K5Zb4=; b=e
 /x5O06McbMTUMnU/0xkC88KKusYGgNnB82JQCkFr58o2KPf/pw/EUVK6IoogZDb+GWFKkv7RzsaKL
 jXiTd9Z9Rrj5LVGY8+kUfafSjUCV54IxMDa/KminVHuY0pwm3Nyi0Aq3PTAzcxLtinr+t91eJ6rOt
 sPN60K74S0OZ2sCg=;
Received: from mail-qv1-f74.google.com ([209.85.219.74])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.92.2)
 id 1kcOkg-00FCQA-G7
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 10 Nov 2020 08:11:56 +0000
Received: by mail-qv1-f74.google.com with SMTP id t13so7556419qvm.14
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 10 Nov 2020 00:11:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=20161025;
 h=sender:date:message-id:mime-version:subject:from:to:cc;
 bh=YleeopDaCgXcJmdy4XOEQs2LFG2krgZZ0q7A6+K5Zb4=;
 b=r9GxOzmAmzQQaWAt/+yFLYbYHyhxxLRGGimYAU20+AVeE8DakDhPbv6BD81yZlmwAV
 aWijN3T/Oe/5LaZMduyilZWCPgqw79cloIqB9l6RW8L8LBUJuXNTmxsK3XVghP1etkon
 MDPuXpq42XCNDizGM9rPg7t1Veo16QDQqlPNdM8idYbG171Av02C5zgl052gC8pBtsTp
 CJayAsLpURbvTMotciq/6Onx7fzYk/SbweHDPIdB+lnEg/4wb1JAEY3N+WXib33+DUDE
 xvKGw6DknZT+3MsBgWD/aQ++X9ogR8lL1V7NGbPxqgEAzb7KY0GZYqrNq3/2R4Nyfd7W
 cRFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:message-id:mime-version:subject:from
 :to:cc;
 bh=YleeopDaCgXcJmdy4XOEQs2LFG2krgZZ0q7A6+K5Zb4=;
 b=dLtcDG0NP4FKpHNUd16MoF9iqF/nKt4/zswC89LUYLP3uEyvMvIpCejw+FhnKV9fS5
 ZyKtpRtoktOaWXEPqo1JhiVe99LTHjgFVYEH/LLEa2mvVWDvh6CrTz31gZxTkfTDbjWD
 EFtjPHXs9UPH6aah4TUFbF2iUON/UW5NIozOZLJR188Qrrdk2szOFqIAVmcX3awTZHcg
 IcFOCoQrQgFJtvi+9hjK27WZtUVCHQsmv2dl0FLUF0vKyl+/Yy5yXRHZCxsfCAJ8OB1Y
 Ex1ofIs+OuHKaR5E0vI5yM1ei2Mj20pGIYhPvx5YmzkNthLLs1PgjcUaQHsQplNbnznH
 rSJw==
X-Gm-Message-State: AOAM531/keAt7IQM3MFVrgD1ojA9vHp4rnQtlaM2JuMxj8yKal0KxcG6
 UcGTkydNdY3jPRuaJpzBZ/Eo0ZzXt9Ft0nkZucNCBzP4x9vL3Bt49LUsIxt/dkA/PW+cm0l9i5g
 P6ii2BmIBREr2LWtRUFHq27RAyP7VkrvtmO4oUpUXQV1d+akry8ihj5NQ7tLsErCuOKZlYhXTD8
 tXHhgt/7VRYBYM
X-Google-Smtp-Source: ABdhPJx7IBluQ2rlpM3bGLDjEkqpkA+rySsTjs0NgAafboWL1131VYeWnhmBg69RW8wIFx83Tw6yfEaV7LNxaQ==
X-Received: from robinhsu-p520.ntc.corp.google.com
 ([2401:fa00:fc:202:1ea0:b8ff:fe77:fe45])
 (user=robinhsu job=sendgmr) by 2002:a0c:e0c9:: with SMTP id
 x9mr18369611qvk.56.1604995896460; Tue, 10 Nov 2020 00:11:36 -0800 (PST)
Date: Tue, 10 Nov 2020 16:10:39 +0800
Message-Id: <20201110081038.261786-1-robinhsu@google.com>
Mime-Version: 1.0
X-Mailer: git-send-email 2.29.2.222.g5d2a92d10f8-goog
To: linux-f2fs-devel@lists.sourceforge.net, jaegeuk@kernel.org, 
 chao@kernel.org
X-Spam-Score: -7.6 (-------)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [209.85.219.74 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.74 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -7.5 USER_IN_DEF_DKIM_WL    From: address is in the default DKIM white-list
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_MED          DKIMwl.org - Medium trust sender
X-Headers-End: 1kcOkg-00FCQA-G7
Subject: [f2fs-dev] [PATCH] f2fs-tools: skipped to end on error syntax error
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
From: Robin Hsu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Robin Hsu <robinhsu@google.com>
Cc: linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When error were found, we won't need to do any initialization but
just quit.

Signed-off-by: Robin Hsu <robinhsu@google.com>
---
 fsck/main.c | 24 +++++++++++++-----------
 1 file changed, 13 insertions(+), 11 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 32559f1..e70048b 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -597,20 +597,22 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	}
 
-	add_default_options();
+	if (err == NOERROR) {
+		add_default_options();
 
-	if (optind >= argc) {
-		MSG(0, "\tError: Device not specified\n");
-		error_out(prog);
-	}
+		if (optind >= argc) {
+			MSG(0, "\tError: Device not specified\n");
+			error_out(prog);
+		}
 
-	c.devices[0].path = strdup(argv[optind]);
-	if (argc > (optind + 1)) {
-		c.dbg_lv = 0;
-		err = EUNKNOWN_ARG;
+		c.devices[0].path = strdup(argv[optind]);
+		if (argc > (optind + 1)) {
+			c.dbg_lv = 0;
+			err = EUNKNOWN_ARG;
+		}
+		if (err == NOERROR)
+			return;
 	}
-	if (err == NOERROR)
-		return;
 
 	/* print out error */
 	switch (err) {
-- 
2.29.2.222.g5d2a92d10f8-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
