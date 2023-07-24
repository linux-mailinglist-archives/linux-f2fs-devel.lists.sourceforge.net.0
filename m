Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0079275F2B0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:18:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNse6-0008MN-SG;
	Mon, 24 Jul 2023 10:18:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNse3-0008MF-Vo
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4zTxasxXedNYwr5HiD+ktCpinG7wwpmHx5iR9IBn5EM=; b=Su77jC4ugTQlYRr7dNoyU0GXtH
 kHH3PMHCeH4E4B1LD/8ARfB/7AypiMArYIWBYVY53Md1a4G2vs2vStUApS/8fKeHHJP8ok0TheBsS
 s6ZHjjAhYDsL5k1yh9A1L2BEmhYUm/8iw4oPajMSrjTerY8tnQd4sVt0gvnMtX8ff+tI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4zTxasxXedNYwr5HiD+ktCpinG7wwpmHx5iR9IBn5EM=; b=CJ0cOCVLlxT/N5CweJDrMSS50z
 hYSIJswlYd9lzTwh93fNZ9okOS8Sg4NvpywSjOyRY/Mp7c576rUxN2S80qz23pmNKI37DUZpPPJD6
 VoRegXTvVkTxC+NtL6y/5t0h+siWfIc3qLoTSviQmuo4kJDmFL5vqhv/WPFOY1nR+qhQ=;
Received: from mail-qv1-f42.google.com ([209.85.219.42])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNse0-0004tq-Tc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:26 +0000
Received: by mail-qv1-f42.google.com with SMTP id
 6a1803df08f44-63c82f9094bso9131306d6.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:18:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193899; x=1690798699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4zTxasxXedNYwr5HiD+ktCpinG7wwpmHx5iR9IBn5EM=;
 b=EvQufrH9OaGUtA5AlwsezNzos3iLuQtQrxcBe1kwZYeo0aZJZ/t6o60hy6xHAO2ohR
 Pr4eEsrX+vznCYRGfcF4Grl7QKtywp37/5VdwO+nmQpisHYTweABrFnx+TTj7L/yeQB6
 /lxVGbYYPjmXZ/Wl2JfiJnBUBCwep7G5Ua9zXSnhRPC4KdujhBhEdR7m/RROBNX12n4Z
 E3wDjQcLQHITwC46alZ63NDIfmRx7L8gslypw3qkuQpIq8udvMrVmVNu1OLZVGz+8HrR
 tXIByPfMQJj5lajDlR8UZIt3hWTcXYRWEjAXwrZawp6sDdOfC+aRpdRx7wV4hHh7/69w
 /Jvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193899; x=1690798699;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4zTxasxXedNYwr5HiD+ktCpinG7wwpmHx5iR9IBn5EM=;
 b=dlVPQL6Aj5XLWvf9YYAZFJX4hAE7OtgRHEQa/Q1eqbobNp+DoDw4R40+Yw7oQ8nm59
 cdYMwePfTgNXt3Z8WEJbTqr4u3c/57jaJqpkM+QeP17VOme9K2yYHFUzV/Bm3DoIvr9O
 8sBVan/6R+sCZioc1JZK9AcVmVtKxQWQbLDOuSHPn/AhMG+W5obmS4rnmAfwYuFHWFhI
 KKKbWN42nJY1k/KssoiZzM5VA98FCu+lKUBHmc7rAvU4p+4Y3z8IHuW1YsVNHFBS2Meu
 wOu7sWtsdCeKsw+9dyri0MMItmxzmb3jNhAQ75aBQCbqqTfcvMvqTsfoGR5gya1zSkXV
 P6CQ==
X-Gm-Message-State: ABy/qLbTGND5sB3lZ00zHfSwuSt5M3u2B0gcrDowpAKHX/ll8+R7StUh
 b/6UMFETW2s+ubwgmCvuHm9T3fcWwsqk58BAgpg=
X-Google-Smtp-Source: APBJJlEIhnQwoFDHuweIAHt2tJcWGI0d+r3I5wbhweuAT0TQly4d+VEILSYdnjVlMqhcbUSPWrZO+w==
X-Received: by 2002:a17:903:41c9:b0:1b8:17e8:547e with SMTP id
 u9-20020a17090341c900b001b817e8547emr12196517ple.1.1690192002389; 
 Mon, 24 Jul 2023 02:46:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.46.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:46:42 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:15 +0800
Message-Id: <20230724094354.90817-9-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the erofs-shrinker.
 Signed-off-by:
 Qi Zheng <zhengqi.arch@bytedance.com> --- fs/erofs/utils.c | 20
 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.42 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.42 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qNse0-0004tq-Tc
Subject: [f2fs-dev] [PATCH v2 08/47] erofs: dynamically allocate the
 erofs-shrinker
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
From: Qi Zheng via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Zheng <zhengqi.arch@bytedance.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 virtualization@lists.linux-foundation.org, linux-mm@kvack.org,
 dm-devel@redhat.com, linux-mtd@lists.infradead.org, x86@kernel.org,
 cluster-devel@redhat.com, xen-devel@lists.xenproject.org,
 linux-ext4@vger.kernel.org, linux-arm-msm@vger.kernel.org, rcu@vger.kernel.org,
 linux-bcache@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the erofs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/erofs/utils.c | 20 +++++++++++++-------
 1 file changed, 13 insertions(+), 7 deletions(-)

diff --git a/fs/erofs/utils.c b/fs/erofs/utils.c
index cc6fb9e98899..389de06e1065 100644
--- a/fs/erofs/utils.c
+++ b/fs/erofs/utils.c
@@ -270,19 +270,25 @@ static unsigned long erofs_shrink_scan(struct shrinker *shrink,
 	return freed;
 }
 
-static struct shrinker erofs_shrinker_info = {
-	.scan_objects = erofs_shrink_scan,
-	.count_objects = erofs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *erofs_shrinker_info;
 
 int __init erofs_init_shrinker(void)
 {
-	return register_shrinker(&erofs_shrinker_info, "erofs-shrinker");
+	erofs_shrinker_info = shrinker_alloc(0, "erofs-shrinker");
+	if (!erofs_shrinker_info)
+		return -ENOMEM;
+
+	erofs_shrinker_info->count_objects = erofs_shrink_count;
+	erofs_shrinker_info->scan_objects = erofs_shrink_scan;
+	erofs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(erofs_shrinker_info);
+
+	return 0;
 }
 
 void erofs_exit_shrinker(void)
 {
-	unregister_shrinker(&erofs_shrinker_info);
+	shrinker_unregister(erofs_shrinker_info);
 }
 #endif	/* !CONFIG_EROFS_FS_ZIP */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
