Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 16A4D75F2B2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:18:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNseD-0000ze-SC;
	Mon, 24 Jul 2023 10:18:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNseB-0000zX-Ki
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=; b=DPiofC2Vj5KVyIU/WzKzeLaINt
 ZZuFIEx294B+3+NfZbn8DoS/o6OvPuPXUEE/ikjj2A+QsoXe7C/aX4yw13HBOA6niXXScvFeatmoj
 M3+EGEfCtS7MPJXrE/S70e4vVtaSxqkkfI+2lIQ85CqRVLuSNVW/1UPsAz7h/MrZGtVE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=; b=emCHUyceQodZ1OyYawTz/HqUW8
 OKUXP813cJ+2r9ivIlufjeUCr8XXXL0m1gM81BrVx4lkIFtdITyoYN2++n2dBXiRymKN2Cx9tIa7x
 PrpOtCyFLoS5wkTl+OpU6fMRFJ65mDFJQDNJeOkMWwHVlwLWmiOx46GQdcwLurTbVryc=;
Received: from mail-ua1-f45.google.com ([209.85.222.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNseB-000Q1z-3p for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:18:35 +0000
Received: by mail-ua1-f45.google.com with SMTP id
 a1e0cc1a2514c-796dc361d3cso430894241.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:18:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193909; x=1690798709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=;
 b=fo2YLIyxmGokoRpEH1wSSDK0JQdAN8NRVXWzS6+dU37JoAPT5g+JpQhWU1VZdMfwUm
 V/Kv5BfVB4aRS89sCGHJLdJjOhnoEieoVT/8TUW9YPqN3HH0foKtHCCeWd86NM2pggt4
 vZq2fqfGjVp/5xrsgsdFoiirbCTaqNfHlHjcWTaODI5pYwQIqcMOzOmYGfKRi3SLDNUB
 Kwzg9GOULtPn/E70SxFA0J91anksJaLmYc322zTgfFFCrFZtZh5S277Y33AdUASiTKjM
 CfKv8O9ZxTCUUBSkAMnuyTv1U8i6+j9rkKWpaUFgxwAJVDU4pPTaz1YrJifL0iNV4DNJ
 2IcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193909; x=1690798709;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rzRsL3uPXf8EtZhij3twpf+iuH9MzH4dVPBmPqsS5Og=;
 b=JC/rTJ/C83KAHIdPPSsGGuvRRYvxQz7emAXR0xROWU8X086X7TY9zAHjtoXOB08NYn
 U3EHgJSH/z1aw8sKvrxPOXjL4XInIkAW/rrT1cz6KD9swsMPthkR3CXU/sMddDxu40dz
 JeRwIJ5Fq5Ccw8C+yDAUomXj9El/EHUorY05sDfKdgcDhz/usHyeI6Gcf9Gb8Gsdby06
 1hWR+Ad8Zri9q8cx9bjLIpzAomBxG9pxFDtS/F1yReZVoiJp2LWvdUamZuDyUz+IPijJ
 CXovfOyK5NR5ZiPMWb1DpMVdxjoQ3owb3f0peMSkwiz+mhsT2fe61/xPVTCoPgnXwOE1
 Omqg==
X-Gm-Message-State: ABy/qLbEfRNEjgsli88A+SrViKtKZAnUrgdwNHoav3R9ZOCfMADh522a
 koVqynFLDkVFmU2Ikn8442QbmJYDOGwS9RyI2/8=
X-Google-Smtp-Source: APBJJlE2hlcoboYUdUaSOoRiDnmiId7r6Wv5DYfSEbrHd1JPgB9nwdB4ObCAMGW7eL9gTiY+r7GrFA==
X-Received: by 2002:a17:902:d508:b0:1a6:6bdb:b548 with SMTP id
 b8-20020a170902d50800b001a66bdbb548mr12141350plg.1.1690192062448; 
 Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.47.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:47:42 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:20 +0800
Message-Id: <20230724094354.90817-14-zhengqi.arch@bytedance.com>
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
 Content preview:  Use new APIs to dynamically allocate the nfs-acl shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> --- fs/nfs/super.c |
 20 ++++++++++++-------- 1 file changed, 12 insertions(+), 8 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.222.45 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.222.45 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qNseB-000Q1z-3p
Subject: [f2fs-dev] [PATCH v2 13/47] nfs: dynamically allocate the nfs-acl
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

Use new APIs to dynamically allocate the nfs-acl shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 fs/nfs/super.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/fs/nfs/super.c b/fs/nfs/super.c
index 2284f749d892..a90b12593383 100644
--- a/fs/nfs/super.c
+++ b/fs/nfs/super.c
@@ -129,11 +129,7 @@ static void nfs_ssc_unregister_ops(void)
 }
 #endif /* CONFIG_NFS_V4_2 */
 
-static struct shrinker acl_shrinker = {
-	.count_objects	= nfs_access_cache_count,
-	.scan_objects	= nfs_access_cache_scan,
-	.seeks		= DEFAULT_SEEKS,
-};
+static struct shrinker *acl_shrinker;
 
 /*
  * Register the NFS filesystems
@@ -153,9 +149,17 @@ int __init register_nfs_fs(void)
 	ret = nfs_register_sysctl();
 	if (ret < 0)
 		goto error_2;
-	ret = register_shrinker(&acl_shrinker, "nfs-acl");
-	if (ret < 0)
+
+	acl_shrinker = shrinker_alloc(0, "nfs-acl");
+	if (!acl_shrinker)
 		goto error_3;
+
+	acl_shrinker->count_objects = nfs_access_cache_count;
+	acl_shrinker->scan_objects = nfs_access_cache_scan;
+	acl_shrinker->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(acl_shrinker);
+
 #ifdef CONFIG_NFS_V4_2
 	nfs_ssc_register_ops();
 #endif
@@ -175,7 +179,7 @@ int __init register_nfs_fs(void)
  */
 void __exit unregister_nfs_fs(void)
 {
-	unregister_shrinker(&acl_shrinker);
+	shrinker_unregister(acl_shrinker);
 	nfs_unregister_sysctl();
 	unregister_nfs4_fs();
 #ifdef CONFIG_NFS_V4_2
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
