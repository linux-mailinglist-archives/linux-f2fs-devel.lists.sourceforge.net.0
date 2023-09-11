Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E456079A6DB
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 11 Sep 2023 11:46:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qfdUt-0008Rp-Vb;
	Mon, 11 Sep 2023 09:46:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qfdUr-0008Ri-8U
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Sep 2023 09:46:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=r2z5ZP0td7rQio33ZrusFB6X25vGZrzEp4fIJ4zc7l4=; b=cykTlOOVr5n9Gsb8ACwmk58YV4
 2Nv7fYrcpiY8zwqGItrpC0MZilIxHy9cReDVNcS4ouA1G30uYqqWoLIs6T++l8AxWlvHVlzeJcU3r
 Bl3rG9CU6mBWXtviF9eWMItoMMwUOQpmjU7tOgU4DbukvrH0PhdpusdkcCcUxz5vHYec=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=r2z5ZP0td7rQio33ZrusFB6X25vGZrzEp4fIJ4zc7l4=; b=TGM+gDFGDHziF7svp2dDP2Qjp5
 kyTocF7p9oe4ZEaZZJXOb20/tj1pXWgftPLO85Ga5DdlnRv9cIuwsZY7sPS/kB5HM1Adn/KnsVk+7
 xTm1psNBSDZIvzg7c7mi13jdzLfGK2J2DJOCfwOPdQ+jVi/Ktdl+ywAW65sYy3/+Jtg8=;
Received: from mail-pl1-f172.google.com ([209.85.214.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qfdUm-0009ev-Ra for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 11 Sep 2023 09:46:22 +0000
Received: by mail-pl1-f172.google.com with SMTP id
 d9443c01a7336-1c3aa44c0faso1780545ad.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 11 Sep 2023 02:46:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1694425571; x=1695030371;
 darn=lists.sourceforge.net; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=r2z5ZP0td7rQio33ZrusFB6X25vGZrzEp4fIJ4zc7l4=;
 b=T7Q4u1DsWw0R2giD9o9NA74glH2UOQA4AyLr3wnMJCHAcUMF3PQ8dL2stT6A4o40Oc
 Ktj1sUB6gXxrkDHk5QZBwC9CZc0sMOiz1j16bFRb9BwDa0FIR4YJbXkF0uTAYX2+3BJK
 4MAVjlQif5+qm2IN883g53m60kcZEt4pJ6+GHFFVQjFjYIeR1fUnXawBQUO1IPfS7MJh
 f46oiNIF97yRUyyJESPNxpwdLn8AXP9KRGvoWIBXrwUWlIj4yZ3IF6QohFgXvnMbm9oE
 iMIWJKcK/S09mF65TEG0n790bBoyBlJFXC0sVPRvxu68DH4U5PIZQX2YHCIBSL6lD9EH
 5+Wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694425571; x=1695030371;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=r2z5ZP0td7rQio33ZrusFB6X25vGZrzEp4fIJ4zc7l4=;
 b=b3nnwWvgIlmPEfv+bL6/5LR3gEQ2sYUb+H3t/GBsx+Lih3JiBe4ofC06lxz9821EmE
 ep5CkwHuYH/sgSSWOhB9AFbnBK7it6jGmC2wjnEValLkrhl+vFcObX3YlA4sdWqynLKX
 Dpk2PVIE4tEUM4vt7irF9N60mQZoM+kVj7jhNA3mL3GInO92VDQ47GaQ5nLFRNAw6rbf
 CPBhPd83OdxxVepH+XIh3mtPLIqXjQFhtv8KKGLM5EowpwgpwH88uz/QyjIrFexneRKS
 Xf6bucbg5FT4f42PSQlkoXWpR3pvwSXlCoIfNKVXM8bW2Vc5AK6IUoVr5Agw05jpo6NO
 PgIA==
X-Gm-Message-State: AOJu0Ywkgio8c0yGBNJFWrgfOzMgm9vmk4iGItxsCwkxV/1w5hd1/M3l
 Mz5/i4VUQspeIiM4YIs1hbE2SQ==
X-Google-Smtp-Source: AGHT+IGMazOb/vYj+YAbB56aNimJAjHvQ95oEZj3vNPDNUhDjsPyS/sjYbZ6xZxadrVaoBmmMuhKhg==
X-Received: by 2002:a17:902:da92:b0:1b8:2ba0:c9a8 with SMTP id
 j18-20020a170902da9200b001b82ba0c9a8mr11823440plx.2.1694425571312; 
 Mon, 11 Sep 2023 02:46:11 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 az7-20020a170902a58700b001bdc2fdcf7esm5988188plb.129.2023.09.11.02.46.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Sep 2023 02:46:10 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 11 Sep 2023 17:44:06 +0800
Message-Id: <20230911094444.68966-8-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
References: <20230911094444.68966-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use new APIs to dynamically allocate the f2fs-shrinker.
 Signed-off-by:
 Qi Zheng <zhengqi.arch@bytedance.com> Reviewed-by: Muchun Song
 <songmuchun@bytedance.com>
 Reviewed-by: Chao Yu <chao@kernel.org> CC: Jaegeuk Kim <jaegeuk@kernel.org>
 CC: linux-f2fs-deve [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.214.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.214.172 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1qfdUm-0009ev-Ra
Subject: [f2fs-dev] [PATCH v6 07/45] f2fs: dynamically allocate the
 f2fs-shrinker
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
Cc: linux-kernel@vger.kernel.org, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org,
 Muchun Song <songmuchun@bytedance.com>, linux-fsdevel@vger.kernel.org,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use new APIs to dynamically allocate the f2fs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>
CC: linux-f2fs-devel@lists.sourceforge.net
---
 fs/f2fs/super.c | 31 +++++++++++++++++++++++--------
 1 file changed, 23 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index a8c8232852bb..fe25ff9cebbe 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -83,11 +83,26 @@ void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
 #endif
 
 /* f2fs-wide shrinker description */
-static struct shrinker f2fs_shrinker_info = {
-	.scan_objects = f2fs_shrink_scan,
-	.count_objects = f2fs_shrink_count,
-	.seeks = DEFAULT_SEEKS,
-};
+static struct shrinker *f2fs_shrinker_info;
+
+static int __init f2fs_init_shrinker(void)
+{
+	f2fs_shrinker_info = shrinker_alloc(0, "f2fs-shrinker");
+	if (!f2fs_shrinker_info)
+		return -ENOMEM;
+
+	f2fs_shrinker_info->count_objects = f2fs_shrink_count;
+	f2fs_shrinker_info->scan_objects = f2fs_shrink_scan;
+
+	shrinker_register(f2fs_shrinker_info);
+
+	return 0;
+}
+
+static void f2fs_exit_shrinker(void)
+{
+	shrinker_free(f2fs_shrinker_info);
+}
 
 enum {
 	Opt_gc_background,
@@ -4944,7 +4959,7 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_sysfs();
 	if (err)
 		goto free_garbage_collection_cache;
-	err = register_shrinker(&f2fs_shrinker_info, "f2fs-shrinker");
+	err = f2fs_init_shrinker();
 	if (err)
 		goto free_sysfs;
 	err = register_filesystem(&f2fs_fs_type);
@@ -4989,7 +5004,7 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
 free_shrinker:
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 free_sysfs:
 	f2fs_exit_sysfs();
 free_garbage_collection_cache:
@@ -5021,7 +5036,7 @@ static void __exit exit_f2fs_fs(void)
 	f2fs_destroy_post_read_processing();
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 	f2fs_exit_sysfs();
 	f2fs_destroy_garbage_collection_cache();
 	f2fs_destroy_extent_cache();
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
