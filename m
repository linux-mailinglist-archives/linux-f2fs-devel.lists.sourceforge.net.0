Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 798CA75F247
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:11:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsXO-0007L8-5Z;
	Mon, 24 Jul 2023 10:11:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsXN-0007L2-9a
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:11:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jmPwAlPL0TnDBmalzCzATtOPmfxfqu3Q+7XaFZclAtg=; b=MVf3goTQX/2qLDAfwMa/4e6BDu
 9yOqkXCLHjq+q273efeeso18BQSg2gh2X7vP5ER8/cs4zYF863tb5lVRWG+jI3Y+ow5etX1eYa7u+
 EgEYjk51zjPifFQrVKCAQZDGilMdvJw8Keuy2inzG/4LVUQyIPgsC6vesdJ5fCyRfgUk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jmPwAlPL0TnDBmalzCzATtOPmfxfqu3Q+7XaFZclAtg=; b=MMJ3VyOhEV/MmSAfRMmkQOSKa7
 BhCTpPa0W5TPTaU3k/XsZqVS3nqm5x0OcvnE+EaQVFR98joFOqznWK0xqVWKojCU3H0xthXqTjiSD
 NOZtO99NOs+aLkY90cTbtPBP6zHXQxKNwFybOVMEqmbXL/ayhEIr81J63MKlhQoxtq8A=;
Received: from mail-qt1-f174.google.com ([209.85.160.174])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsXL-000Pca-S5 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:11:33 +0000
Received: by mail-qt1-f174.google.com with SMTP id
 d75a77b69052e-406966843bcso2640731cf.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193486; x=1690798286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jmPwAlPL0TnDBmalzCzATtOPmfxfqu3Q+7XaFZclAtg=;
 b=ElpI1OICTYievkd1IsY8bb39zQHahnQyZvzcDaLv+h2pVZA8gve4XVeuPrny7ThZIt
 zwq4oR7YaW6bRYPivEGtjZY6s0Lypa11ZGxAdvnfsKv+s+CfksD4oSwrv0cFkaBxF0nY
 rMdlDOSadEQxzb+0C/LPk7oQG+uBk3E8ODKDB+aRVb6t6pQjbRlK7a/c+yoxsOdjbrhi
 j2RShoa4nwxLJBWhFRxmjKv8tdsDziIB/dG6RaGfPFIzHeMVB6xhXNq9DRnjr11iwKKn
 1AWSrn4CZqkzxW2wgNdibkRHgXJ4pvcQsAIbqo7OvStnaJPYCZHPPREC6oJM/oaOPdw+
 wDqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193486; x=1690798286;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jmPwAlPL0TnDBmalzCzATtOPmfxfqu3Q+7XaFZclAtg=;
 b=iFj77VDgxE+OyX5VbN2MoTSs2eKx2KjgB20mPzgS1wrp3Vh5fci0X2YCZFtQ16WVzs
 eEkM+t1WOHP8VOyxpJvWWJGcI7dM/TRQpmtjYLePvZXglZfeDojQknRms7slmPCNfNPp
 saN2Elk/lUMu6tbx03nGBXuKgz2NZTb5akKEHaDSNLSEqdrBWYFglYyXJkWkQELFDH6c
 VM+d4rFEKSaWKngMesc9hJmMC1cxm03jOzMC8TlH/Kgfy+o1yFMOlbX5dVjXx07ptCcE
 XJ74raXsg9jWWhK4iClAwMekKN1/2EFgyuLywxQg4+v8Cfji4gz0FqfUGKITNICqYGoZ
 3N3w==
X-Gm-Message-State: ABy/qLaA24O7twsWfOypx1syO+nOKNvj9UBf3ERSJN9PpazKu9rRfkQe
 h/Hc1F3b2jVq+DUZnHS5K/T1xy6OrZcVdlBzfPA=
X-Google-Smtp-Source: APBJJlHDY1qhgSa+H4mr70oj6h44PLP3QUTUzXb3MsGg4I77oDNLLFWrtOaIhBAmIAnOXFQDdEVBFw==
X-Received: by 2002:a17:902:d4cb:b0:1b1:9272:55e2 with SMTP id
 o11-20020a170902d4cb00b001b1927255e2mr12365119plg.3.1690191954835; 
 Mon, 24 Jul 2023 02:45:54 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:45:54 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:11 +0800
Message-Id: <20230724094354.90817-5-zhengqi.arch@bytedance.com>
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
 Content preview:  Use new APIs to dynamically allocate the x86-mmu shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> ---
 arch/x86/kvm/mmu/mmu.c
 | 18 ++++++++++-------- 1 file changed, 10 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.160.174 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.160.174 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNsXL-000Pca-S5
Subject: [f2fs-dev] [PATCH v2 04/47] kvm: mmu: dynamically allocate the
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
 linux-raid@vger.kernel.org, linux-nfs@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the x86-mmu shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 arch/x86/kvm/mmu/mmu.c | 18 ++++++++++--------
 1 file changed, 10 insertions(+), 8 deletions(-)

diff --git a/arch/x86/kvm/mmu/mmu.c b/arch/x86/kvm/mmu/mmu.c
index ec169f5c7dce..ab405e0a8954 100644
--- a/arch/x86/kvm/mmu/mmu.c
+++ b/arch/x86/kvm/mmu/mmu.c
@@ -6847,11 +6847,7 @@ static unsigned long mmu_shrink_count(struct shrinker *shrink,
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
@@ -6984,10 +6980,16 @@ int kvm_mmu_vendor_module_init(void)
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
@@ -7009,7 +7011,7 @@ void kvm_mmu_vendor_module_exit(void)
 {
 	mmu_destroy_caches();
 	percpu_counter_destroy(&kvm_total_used_mmu_pages);
-	unregister_shrinker(&mmu_shrinker);
+	shrinker_unregister(mmu_shrinker);
 }
 
 /*
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
