Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A48DD75F2B1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:18:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNseD-0008N5-Hn;
	Mon, 24 Jul 2023 10:18:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNseB-0008My-VK
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SZ4CyloeMnj8DJaX3jH++Kh0s8L9fcE8HheaL79+C9E=; b=mDQ6WPphnOLsHJD5O7k1M376yQ
 cZmucIamDpVfwiEdqJAZfZ3lDF4PS8DsxCfbCxSEKeZhpofnQN826X7Gf6NUojSPc+59IM0wjVSGL
 UbONm2hpsPGcq6kEQwTFR6yPHfaGMOrvMku7EXMAa7aR16F+WEZ6ZAC6eBsXEYUUZwMw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SZ4CyloeMnj8DJaX3jH++Kh0s8L9fcE8HheaL79+C9E=; b=RxkD501vsQrJMjKZ7VWVqTLeFD
 DUPlOcZagJUYGXBnJn/BM3/RCkgTCumirA1deJAdAjMQGiuquXPcTx58CD9FXNYIO/Ib60cfGsRqy
 T9tAz5LPsYJ6zyucKMSoKBZcth2b1U7oaaQzYciMhpZ8B7baWPQ4mU4C5vkLAuqX72vc=;
Received: from mail-pj1-f53.google.com ([209.85.216.53])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNseA-0004uA-9U for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:34 +0000
Received: by mail-pj1-f53.google.com with SMTP id
 98e67ed59e1d1-2680edb9767so236427a91.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:18:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193908; x=1690798708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SZ4CyloeMnj8DJaX3jH++Kh0s8L9fcE8HheaL79+C9E=;
 b=auRifChFd4P8g06Uuq0xZFbNCkSwoI1RpTgMRT6gR3rHTdW9t8VN55PKR9xa5JO4Gg
 Yf2DUTCYSGVa8fWC4O8Mv9STkpzR/PwmislxQBtrbcVSfBJWD7y9VgY5LO94kWoKhIru
 iaZcYChFS9xo5+Abo9gBsMAbb0nmNuY25uSsIYW/i/Z6AfWpf9llz1ijn/vr0QcFy8B8
 QBm8YHl5TMVRI0HDfx+53JDfThT2rD1b/pYY5PzpAOK46bT5qBx3dj3kTWA20OaALYCY
 EmhkpGy5MhrKjtoEIR5tBE5JgbYl/DdetvUjpaMOkinJ59v+Y3zBR5YHtKmon7M2/vzf
 y4vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193908; x=1690798708;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SZ4CyloeMnj8DJaX3jH++Kh0s8L9fcE8HheaL79+C9E=;
 b=ZXAJwOapzY9MaKxVMwnSiHWBjC2t9ja4W/PHiAHXCz7fjCXGVTtzHnXEQ0bSkWrLfl
 RuGpXDr2ZGa1bJHxqo/kb4u177haYew+xMQhX7R1W5x/HWoydJe2Nxv7x5drvTdToJVO
 su36w0nvZTv5LCqpSfySm0b+a3wdbRIRbUwso/C4IsaXkx+OrYCUHIYzPCUM7OGikoZ/
 dc7yVGDcTNLcKjXnUPsX2btqjdbCkm40UAyEeKUWQHw7jFUyNZ6cZCSYBtgNHtVGFRzz
 BJSNu/aqLRvBFbGnpB5soBptlqvYB7ubOB8nAEKJdPOxhqu6vvppKuRfeFSsASmfS6fn
 yc4g==
X-Gm-Message-State: ABy/qLZ39tcqq+EHXvEryox8cnFYa8oNBdRJNi+OnHJw0fLDJ/Kfrbmj
 lnU63poYn83bjS/pP9HZW+UQ9ydEuDzJEQ/xTpo=
X-Google-Smtp-Source: APBJJlGdl4zR2tT8oeBRlnNa82kteJScCMEv7aXbUuimbAqUFJ617TPjzQL08XTMcGzg+wanNIE0AA==
X-Received: by 2002:a17:902:ecce:b0:1b8:b55d:4cff with SMTP id
 a14-20020a170902ecce00b001b8b55d4cffmr12423850plh.2.1690192122325; 
 Mon, 24 Jul 2023 02:48:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:48:41 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:25 +0800
Message-Id: <20230724094354.90817-19-zhengqi.arch@bytedance.com>
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
 Content preview: Use new APIs to dynamically allocate the rcu-kfree shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> --- kernel/rcu/tree.c
 | 21 +++++++++++++-------- 1 file changed, 13 insertions(+), 8 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.53 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNseA-0004uA-9U
Subject: [f2fs-dev] [PATCH v2 18/47] rcu: dynamically allocate the rcu-kfree
 shrinker
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

Use new APIs to dynamically allocate the rcu-kfree shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 kernel/rcu/tree.c | 21 +++++++++++++--------
 1 file changed, 13 insertions(+), 8 deletions(-)

diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
index 1449cb69a0e0..d068ce3567fc 100644
--- a/kernel/rcu/tree.c
+++ b/kernel/rcu/tree.c
@@ -3445,12 +3445,7 @@ kfree_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	return freed == 0 ? SHRINK_STOP : freed;
 }
 
-static struct shrinker kfree_rcu_shrinker = {
-	.count_objects = kfree_rcu_shrink_count,
-	.scan_objects = kfree_rcu_shrink_scan,
-	.batch = 0,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *kfree_rcu_shrinker;
 
 void __init kfree_rcu_scheduler_running(void)
 {
@@ -4958,8 +4953,18 @@ static void __init kfree_rcu_batch_init(void)
 		INIT_DELAYED_WORK(&krcp->page_cache_work, fill_page_cache_func);
 		krcp->initialized = true;
 	}
-	if (register_shrinker(&kfree_rcu_shrinker, "rcu-kfree"))
-		pr_err("Failed to register kfree_rcu() shrinker!\n");
+
+	kfree_rcu_shrinker = shrinker_alloc(0, "rcu-kfree");
+	if (!kfree_rcu_shrinker) {
+		pr_err("Failed to allocate kfree_rcu() shrinker!\n");
+		return;
+	}
+
+	kfree_rcu_shrinker->count_objects = kfree_rcu_shrink_count;
+	kfree_rcu_shrinker->scan_objects = kfree_rcu_shrink_scan;
+	kfree_rcu_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(kfree_rcu_shrinker);
 }
 
 void __init rcu_init(void)
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
