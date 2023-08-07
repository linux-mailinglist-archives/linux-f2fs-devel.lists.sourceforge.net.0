Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D87C9771F9B
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:11:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSy8y-0003v2-3V;
	Mon, 07 Aug 2023 11:11:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSy8g-0003uZ-3i
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:11:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gw0136sZs5r00/aJ54ocs9PBikYP7lRbXpwQPAfPTOc=; b=KPTmYBgvxSa3iysfu+kSkItXGM
 jNBio9llH/uBNbqyG/mDz9bIW6lZ6A+RkeV43ZuSfLdcNPKUlTaZi5n9qwQdzmu/tW3/q2bK2cC7w
 /lTpyVWjWXeH6JptBQ6HM5f1hvg+sDCf285WKcgjd0+oNZo367uebwVcFHjlnkhu+ZKU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gw0136sZs5r00/aJ54ocs9PBikYP7lRbXpwQPAfPTOc=; b=XHCAEDRD8Ur3mLrvNmd5PI2ScC
 0nk3o2NwSxnsiSWErX/1ngxm5/7vFexzcEohumPHQpT1bBDiryoVCTzxPqU3MYnNFdGk7be52CPid
 yflI2VPrPEJRuS+p+CQ9aUKu9Tab2+IIGQlgmrSgH5kgVbtJ9hcRtTMh8ty6pvo7JMlI=;
Received: from mail-pj1-f45.google.com ([209.85.216.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSy8f-00FrWa-Uj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:11:06 +0000
Received: by mail-pj1-f45.google.com with SMTP id
 98e67ed59e1d1-2690803a368so590289a91.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:11:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406660; x=1692011460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=gw0136sZs5r00/aJ54ocs9PBikYP7lRbXpwQPAfPTOc=;
 b=Gyvrq2nfyAR2gtiKV5zvL8Xhj+SCDDvYcDtn1XMvCOK2WxV+VSYbUnzAoQjYyvGt5+
 PHTlpGahxelrDvlDYfQpwR6LaV4hFOqIXHRHdsrciNy+7qVINos9dShQ72ovzklZpuaN
 tBKHGkUe3hFlhdPUgFyU1ktgofOKrrDExvQw3WHpY26rCW0nNqj3a0s5WCQXQ9Bd9I93
 TEwgyMogZ1mPzKBfTbunK1McubgsswcAT76vheTTNvE/WuA1UFNnV1+1CWE/ou902ykn
 9hSF0PrzcrYBFpqGd0qLFTJvVM4g/FWHVeqzvA2yGx34iIfgBZSGKt0JN+J335S8BL/2
 72/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406660; x=1692011460;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=gw0136sZs5r00/aJ54ocs9PBikYP7lRbXpwQPAfPTOc=;
 b=gBnLxXcqPzww6hP018FcqPgc7futYidpQ1HeHbzP0TAl0rNk/XQp7uICvGNoSOY6BX
 wxBRxiYa6ehetNL4Rbm4APz0WpLPzy29+BIuytTZ033xhOpEKj9DWmpiVvYxKJYESuzG
 WcMkcxxNTouc8k0Gdi0HEdhavTq441RD9FgR2NbkomKWpztUkumHVuQ4/G9mpLRyPuHl
 tppGVd8DS3/bu/YQZHwe/hUsKt4uQGThN1VvIrcY6hN0rwdU0xE6vUyS2oC6nwtE00lP
 BeFRVKTmjBfWGroeA61nG7Q9rC2elBhiR7V9VQw/UMEpzVcovx+ZKa7WO+gRi282h2Yy
 YOHA==
X-Gm-Message-State: ABy/qLYKm7Jp9cd3x18zlfqqFxyRLR/OOWYzl0E3H/Gqj6Q6L+1uyUMU
 U1gETfFIUUr2gNrojdcM/lFXXg==
X-Google-Smtp-Source: APBJJlEPLwCkyM2NxjgH9xwMvzhNNiNlagu6lRBAbkDAEcDSA5oH2sSREkdo5fvCbnVAS1DDWMCKvg==
X-Received: by 2002:a17:90a:4104:b0:25c:1ad3:a4a1 with SMTP id
 u4-20020a17090a410400b0025c1ad3a4a1mr24588690pjf.1.1691406660379; 
 Mon, 07 Aug 2023 04:11:00 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:10:59 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:08:53 +0800
Message-Id: <20230807110936.21819-6-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Use new APIs to dynamically allocate the x86-mmu shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun
 Song <songmuchun@bytedance.com> --- arch/x86/kvm/mmu/mmu.c | 18
 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletion [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.216.45 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.216.45 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSy8f-00FrWa-Uj
Subject: [f2fs-dev] [PATCH v4 05/48] kvm: mmu: dynamically allocate the
 x86-mmu shrinker
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
 Muchun Song <songmuchun@bytedance.com>, linux-raid@vger.kernel.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the x86-mmu shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/x86/kvm/mmu/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index 9e4cd8b4a202..0386d5ec97b0 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6804,11 +6804,7 @@ static unsigned long mmu_shrink_count(struct shrinker *shrink,
 	return percpu_counter_read_positive(&kvm_total_used_mmu_pages);
 }
 
-static struct shrinker mmu_shrinker = {
-	.count_objects = mmu_shrink_count,
-	.scan_objects = mmu_shrink_scan,
-	.seeks = DEFAULT_SEEKS * 10,
-};
+static struct shrinker *mmu_shrinker;
 
 static void mmu_destroy_caches(void)
 {
@@ -6941,10 +6937,16 @@ int kvm_mmu_vendor_module_init(void)
 	if (percpu_counter_init(&kvm_total_used_mmu_pages, 0, GFP_KERNEL))
 		goto out;
 
-	ret = register_shrinker(&mmu_shrinker, "x86-mmu");
-	if (ret)
+	mmu_shrinker = shrinker_alloc(0, "x86-mmu");
+	if (!mmu_shrinker)
 		goto out_shrinker;
 
+	mmu_shrinker->count_objects = mmu_shrink_count;
+	mmu_shrinker->scan_objects = mmu_shrink_scan;
+	mmu_shrinker->seeks = DEFAULT_SEEKS * 10;
+
+	shrinker_register(mmu_shrinker);
+
 	return 0;
 
 out_shrinker:
@@ -6966,7 +6968,7 @@ void kvm_mmu_vendor_module_exit(void)
 {
 	mmu_destroy_caches();
 	percpu_counter_destroy(&kvm_total_used_mmu_pages);
-	unregister_shrinker(&mmu_shrinker);
+	shrinker_free(mmu_shrinker);
 }
 
 /*
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
