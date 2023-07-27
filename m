Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EF092764A6E
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:09:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw40-0000WI-HO;
	Thu, 27 Jul 2023 08:09:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw3y-0000W9-MC
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:09:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=; b=HhHZiaFXfJyMyFVtl0VvHl3vmX
 maeT7nmiApCz5ROUL8s5cKn3PsXqrtYFoJGVxRPJXMZxoA4sTHJWsgUI2tfIUPu5gcufPpbLPDdFk
 44/e7Pib7/zOdekWVEXMb4lybVVpjcUwwjxUgsFX+U846v8XsaRJsruzFK7Uz1jbv76s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=; b=fapfClHi2Dy76fMg+GtY6C/CtT
 4z7jHhAgDHvgD42SMdXQmuzcdCLBsNneudRGY1h2H0doyXtpxOQHzAKq5ReXIZYDL8zICj5gw2Q4K
 BKB3/e9FmqbkeJNvow08Rp4cVx00CtJNcOBecQeYoqFJXIRfucdNY6Gp+bCh1Vq+C3Ww=;
Received: from mail-pf1-f178.google.com ([209.85.210.178])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw3z-004LWs-23 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:09:35 +0000
Received: by mail-pf1-f178.google.com with SMTP id
 d2e1a72fcca58-682b1768a0bso174993b3a.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:09:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445369; x=1691050169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=;
 b=ZArGb8yz+8ycxhYpd3TfnObsbskAktwxKp/LK6E+gx1lOsm2QqxHLjO1qFt766mx4G
 4UOFzMb5rOBT3wq7QpcOo/50dqnABPqLouzBdNx69dJP3kndLHofbdJgcQSOE87tIEP3
 gOFIB0th/ApJ4utKzdT3r6irRm20AGsjylo629bfexLkXBuL+hMcZdtnwSmPAtxRA7F8
 l3r/R789CkvCTacsaPitu2Mn9fHBZCoAT7Xd7Py97lY3Lp4c0X3H7O8uSS1JwsanI4Cy
 Pf3LZprk/pnZjQej6Xzx3T3CJ+QGRGxZd7LUmSV8XGImv+0X4BPv+EIagOcfGqekhivR
 Bv+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445369; x=1691050169;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=et7oKjMo2RpAm9eGe6PO8KzXkO6yMET8jj6KuxhxE1o=;
 b=cVG9UMoiBa73cOmzkxnxfV4L0CVGkfkUj/ER6uwFyr/seNvX49tVVaercogcU29+Gx
 +JiVKneUbtEs6F1bJT5CnKZIOozKgorYNkSX/L02aHqp/9ypJKtJ+yQOYKaaCU5PuwL6
 sLPRKEeM+R2XtRxYhO8q90RPltfTRS7/PkrhxvOK3OHERw4RqKBq9w0whB2mt4D0RvRZ
 sOVCN6ftuYDBW5VAQldfWTuKS+uNLDhGseUuJ4EmFfxBvHD3CNEEcET1Y9v/xJSjEj5b
 BPFwtXlfmcqBhoEhdgJCI2sgnWuKWx7xJKJZW5yJoPUTdcTMD4txjNYpbCZXnmOkT2hI
 8U5w==
X-Gm-Message-State: ABy/qLaaZuzRvZvIfZk/yFxjhfw107c1pOWfmauv41lw3gURD+XWQiMz
 fl5MgiZG7vwJoAl82kD8hvM7wA==
X-Google-Smtp-Source: APBJJlGUbAM65UTyBU06poLXl/mtaX6EX5YDf65AxeW9rsxnsdAR4xxA054nRzBMt6Eu4ihj5O0Oaw==
X-Received: by 2002:a05:6a20:7da5:b0:137:3941:17b3 with SMTP id
 v37-20020a056a207da500b00137394117b3mr5573135pzj.6.1690445369382; 
 Thu, 27 Jul 2023 01:09:29 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.09.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:09:28 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:31 +0800
Message-Id: <20230727080502.77895-19-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the ubifs-slab shrinker.
 Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun
 Song <songmuchun@bytedance.com> --- fs/ubifs/super.c | 22 ++++++++++++ 1 file
 changed, 12 insertions(+), 10 deletions [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.178 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.178 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qOw3z-004LWs-23
Subject: [f2fs-dev] [PATCH v3 18/49] ubifs: dynamically allocate the
 ubifs-slab shrinker
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

Use new APIs to dynamically allocate the ubifs-slab shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/ubifs/super.c | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/fs/ubifs/super.c b/fs/ubifs/super.c
index b08fb28d16b5..c690782388a8 100644
--- a/fs/ubifs/super.c
+++ b/fs/ubifs/super.c
@@ -54,11 +54,7 @@ module_param_cb(default_version, &ubifs_default_version_ops, &ubifs_default_vers
 static struct kmem_cache *ubifs_inode_slab;
 
 /* UBIFS TNC shrinker description */
-static struct shrinker ubifs_shrinker_info = {
-	.scan_objects = ubifs_shrink_scan,
-	.count_objects = ubifs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *ubifs_shrinker_info;
 
 /**
  * validate_inode - validate inode.
@@ -2373,7 +2369,7 @@ static void inode_slab_ctor(void *obj)
 
 static int __init ubifs_init(void)
 {
-	int err;
+	int err = -ENOMEM;
 
 	BUILD_BUG_ON(sizeof(struct ubifs_ch) != 24);
 
@@ -2439,10 +2435,16 @@ static int __init ubifs_init(void)
 	if (!ubifs_inode_slab)
 		return -ENOMEM;
 
-	err = register_shrinker(&ubifs_shrinker_info, "ubifs-slab");
-	if (err)
+	ubifs_shrinker_info = shrinker_alloc(0, "ubifs-slab");
+	if (!ubifs_shrinker_info)
 		goto out_slab;
 
+	ubifs_shrinker_info->count_objects = ubifs_shrink_count;
+	ubifs_shrinker_info->scan_objects = ubifs_shrink_scan;
+	ubifs_shrinker_info->seeks = DEFAULT_SEEKS;
+
+	shrinker_register(ubifs_shrinker_info);
+
 	err = ubifs_compressors_init();
 	if (err)
 		goto out_shrinker;
@@ -2467,7 +2469,7 @@ static int __init ubifs_init(void)
 	dbg_debugfs_exit();
 	ubifs_compressors_exit();
 out_shrinker:
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 out_slab:
 	kmem_cache_destroy(ubifs_inode_slab);
 	return err;
@@ -2483,7 +2485,7 @@ static void __exit ubifs_exit(void)
 	dbg_debugfs_exit();
 	ubifs_sysfs_exit();
 	ubifs_compressors_exit();
-	unregister_shrinker(&ubifs_shrinker_info);
+	shrinker_free(ubifs_shrinker_info);
 
 	/*
 	 * Make sure all delayed rcu free inodes are flushed before we
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
