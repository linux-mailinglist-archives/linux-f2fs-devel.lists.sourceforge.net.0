Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A6F6975F290
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:16:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNscF-0007Px-JJ;
	Mon, 24 Jul 2023 10:16:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNscA-0007Pq-Mw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:16:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8oqpenbl7KoJJhQpMWpio5jwf7tXqseO0h4l218M5aA=; b=Hjiob6L994+C/vk+sfIiVbZKln
 FaxK5CvlWki+EVhcRaAhsqdHnBDKRZ7QpmjK43t7gj6le5c2GTaay6Rc3B6j6UnpLvWk4AH7A+3T0
 esya8WUamwUMJ8789qnAksK7Ke6X/OBSsjBUP+PdaxYQxtr6XP9cV/BIBaouaEwspWn0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8oqpenbl7KoJJhQpMWpio5jwf7tXqseO0h4l218M5aA=; b=mIbteXnG+wYog79kYj/uFWf5gZ
 H4hAybU8xNbGn+tDMoIzT4aNGEuflzcpbZ0bMcNrWqhCir+eBrnvrmIfJBbGjyV0gKqcTAup9UOBv
 B4fpJiIABYazPa9MbjOXEYkKIahdNml0tk7J6I/IbA3YVV9nQGZE+OCZ2IoB1ZEIWli4=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsc4-000Pvy-3E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:16:29 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1bb85ed352bso2294745ad.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:16:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193778; x=1690798578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=8oqpenbl7KoJJhQpMWpio5jwf7tXqseO0h4l218M5aA=;
 b=lXtGIRf8ylH6+EV/B5TbpPzhzKmePXtVaSsAxZLHl+b2FsRuw5nux5zW+MSLqb1mHx
 lTjKCM8ahwORX71jpQBP3yb9AlEHpsPOzgpZywWnblhm0Nis3g+PagG7v0cQh0V0U/Zm
 N/5jQyHvxvR/9UEPoGzm4nDwoCi9Iv2q8GvjO4p7QOnVyWj2gnK85QhOUaxM/L8Mvt6t
 LnOUILCMtLO8e9J5UVw2qnEUu2Kk5P6k5zDHRPkqfv6zWVZLAG617HE9fCiwPJleKYng
 qJpXnz5NEMmdTpwV/sgL5m0ahgKFnGhvtnmQqI/KOR1JBfMvtDE9RyEKiJxMjMIVofmd
 NbgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193778; x=1690798578;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8oqpenbl7KoJJhQpMWpio5jwf7tXqseO0h4l218M5aA=;
 b=ZR5FDSutzqAA6TRhGjQhPLAje0skdbQNapogu4CBH8FCPXe7+SHjuANhcMwEXJ2Ef+
 EfcxCpngmAa0ygsmDpHUaJG01xBxoP6fuB5S7P7TmheiUQbKlIX7uDsN7Rl03V2+oJMy
 Nfc2BXlPPqcgtqminHlb9umcPrQeDA3IV+WcFVZSM/L3K+XmTAZFV8DeVkaVKe5YS633
 zyM/KFhylH76oeE4JvJXdvT2N/NR/KU4ngxxUfy+hahqZYdX4mnMA9ZBYgcRMtbJbR3s
 qudSHmLJyEBzAK0Lf0eRz7HzbUqnhlSI/ZjQ4+fBkBuXX+P1CnY+JPrcuvIXXF136YYJ
 8JWA==
X-Gm-Message-State: ABy/qLaOiboo8ulEPUJfU+cKLJXvR3WbuJniLhU6vQX/6VgR59K52S8l
 DTWNeq5OTMyFYjDoyPUsOaSncexOy1WCezmRo7E=
X-Google-Smtp-Source: APBJJlFv5Kl04F8rp2naJTMNzHe6rYzFJJPXcSejcs04WaV/YhAbklIOobqPbsV/O0Fdd5o/IKlERw==
X-Received: by 2002:a17:902:d484:b0:1b8:a27d:f591 with SMTP id
 c4-20020a170902d48400b001b8a27df591mr12259746plg.5.1690192110449; 
 Mon, 24 Jul 2023 02:48:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.48.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:48:30 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:24 +0800
Message-Id: <20230724094354.90817-18-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
References: <20230724094354.90817-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the rcu-lazy shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> ---
 kernel/rcu/tree_nocb.h
 | 19 +++++++++++-------- 1 file changed, 11 insertions(+), 8 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
X-Headers-End: 1qNsc4-000Pvy-3E
Subject: [f2fs-dev] [PATCH v2 17/47] rcu: dynamically allocate the rcu-lazy
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

Use new APIs to dynamically allocate the rcu-lazy shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 kernel/rcu/tree_nocb.h | 19 +++++++++++--------
 1 file changed, 11 insertions(+), 8 deletions(-)

diff --git a/kernel/rcu/tree_nocb.h b/kernel/rcu/tree_nocb.h
index 43229d2b0c44..919f17561733 100644
--- a/kernel/rcu/tree_nocb.h
+++ b/kernel/rcu/tree_nocb.h
@@ -1397,12 +1397,7 @@ lazy_rcu_shrink_scan(struct shrinker *shrink, struct shrink_control *sc)
 	return count ? count : SHRINK_STOP;
 }
 
-static struct shrinker lazy_rcu_shrinker = {
-	.count_objects = lazy_rcu_shrink_count,
-	.scan_objects = lazy_rcu_shrink_scan,
-	.batch = 0,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *lazy_rcu_shrinker;
 #endif // #ifdef CONFIG_RCU_LAZY
 
 void __init rcu_init_nohz(void)
@@ -1436,8 +1431,16 @@ void __init rcu_init_nohz(void)
 		return;
 
 #ifdef CONFIG_RCU_LAZY
-	if (register_shrinker(&lazy_rcu_shrinker, "rcu-lazy"))
-		pr_err("Failed to register lazy_rcu shrinker!\n");
+	lazy_rcu_shrinker = shrinker_alloc(0, "rcu-lazy");
+	if (!lazy_rcu_shrinker) {
+		pr_err("Failed to allocate lazy_rcu shrinker!\n");
+	} else {
+		lazy_rcu_shrinker->count_objects = lazy_rcu_shrink_count;
+		lazy_rcu_shrinker->scan_objects = lazy_rcu_shrink_scan;
+		lazy_rcu_shrinker->seeks = DEFAULT_SEEKS;
+
+		shrinker_register(lazy_rcu_shrinker);
+	}
 #endif // #ifdef CONFIG_RCU_LAZY
 
 	if (!cpumask_subset(rcu_nocb_mask, cpu_possible_mask)) {
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
