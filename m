Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2AA27771FC2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:12:15 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSy9m-0007wu-18;
	Mon, 07 Aug 2023 11:12:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSy9k-0007we-6i
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:12:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2qNGhCyBYRkIC+KqhUj1bienmPbnCoyI88yux10rL0c=; b=fFHQA2VT75fw4APKKIrngead38
 /ZC+jbK/RIxVhU5cE1O7+PymmCUAwJjojQbLrbP6IUTO8pLtQXJ4Ic0yUJrdNd0kpFPh9KqOqtMZ7
 mMR4KANIcO7wP9M9Z8FodOQPQpuoE7s+j3wN6gPz2yHOHYrZTHdlZPqWEOpunYimK4do=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2qNGhCyBYRkIC+KqhUj1bienmPbnCoyI88yux10rL0c=; b=E/Nr/k0Ai5jONEVAWQs8GG1lsX
 o5arQmwX5XARAR7fJ090EHoqcAHTWJl9c9PS0yy5E+6DI9tGvaeI44j5YB0LLVt3kaaXxZTxc5Oef
 KwOtHKtJRi6gbkgMYSzMCsVzseeheMnd/ZMkiQOblWv8r0ayB5esNufpVaTmaYseiMgk=;
Received: from mail-pg1-f169.google.com ([209.85.215.169])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSy9i-00FrZP-9k for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:12:10 +0000
Received: by mail-pg1-f169.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so361941a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691406725; x=1692011525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2qNGhCyBYRkIC+KqhUj1bienmPbnCoyI88yux10rL0c=;
 b=Xc/b9RVeZGabBZRzbFnLG60A3XcuysnQbX8QDB63xQh9Qsy33GgzK9r54ssZ8BRYsv
 Zo1icyrpegHwV8KMFlNuxd6Vv7rJh2g9STB5A/Cyu6q4WM+YLxsvvmbNVVdkSntCluNl
 It/PLVMY+sHjh9niVg4dAEeIOr6EcMWhtMnuFdCY7H6/MC8Iz/ZfTZnLr8OJnSIA36e9
 mmNGX7xKmI8VWlsJYDncO9Zq/rF2h1OiOCACwI0xXgbsWIREHFfM5CkS8NCDLLHpFGlK
 JETB4OwnLh2lGmaSIFNM9gd2qMpLx0zP9hut1e08UtN8MQU5ZK62c3ni+xnuk2sIAfG7
 kkXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691406725; x=1692011525;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2qNGhCyBYRkIC+KqhUj1bienmPbnCoyI88yux10rL0c=;
 b=AmZDiTQ/SDv/MdBeChyzdnIHYVsXz38o4yuw4IBsBzTNVP5CFllMdguot8NdQ1PUx2
 LHvx9Z+TnAzLikMZNiH+3t20puJlJY3ZrS/EqtXKLmldzvgg+5L1M3WcfO8d+U3NEkIw
 wdL/HA+PWjRm9CPQXhtqx3MrebfcKmvvxqbIoxwKt3JK+cSF+rya0YkHOlUS706NC1FM
 Blrkb6FmbQmj6x+ybYNEJxHettfPxHOGzOZKhbCK79ODy6exwZfACs/l0znz7sAiPMkd
 me0+Tscm/vhcLOnScIAJY1/6d3IMyzq27zyMnIxfoO8qe8GkZNh9ZiHvLAbgF56uWLE5
 dgwg==
X-Gm-Message-State: AOJu0YwB/8QzSmQrxrPaTv0GsjLPS7PMa4FJy6uFJp8h7xDqhjKRRgxi
 SiRi18T9JaxJlhfkDchiodS3zQ==
X-Google-Smtp-Source: AGHT+IH0i+Trkswf5ZN/Zo/hyk0nSAkeHBCb5cnTJePkF3I+vCqNyDS8fjeM0LPIBtSn2h3E1rmPDQ==
X-Received: by 2002:a17:90a:2909:b0:269:5bf7:d79c with SMTP id
 g9-20020a17090a290900b002695bf7d79cmr2210453pjd.1.1691406724771; 
 Mon, 07 Aug 2023 04:12:04 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:12:04 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:08:58 +0800
Message-Id: <20230807110936.21819-11-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
References: <20230807110936.21819-1-zhengqi.arch@bytedance.com>
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
 --- fs/f2fs/super.c | 32 ++++++++++++++++++++++++-------- 1 file changed,
 24 insertions(+), 8 d [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.169 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.169 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSy9i-00FrZP-9k
Subject: [f2fs-dev] [PATCH v4 10/48] f2fs: dynamically allocate the
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

Use new APIs to dynamically allocate the f2fs-shrinker.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Reviewed-by: Muchun Song <songmuchun@bytedance.com>
---
 fs/f2fs/super.c | 32 ++++++++++++++++++++++++--------
 1 file changed, 24 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index aa1f9a3a8037..9092310582aa 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -83,11 +83,27 @@ void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
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
+	f2fs_shrinker_info->seeks = DEFAULT_SEEKS;
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
@@ -4940,7 +4956,7 @@ static int __init init_f2fs_fs(void)
 	err = f2fs_init_sysfs();
 	if (err)
 		goto free_garbage_collection_cache;
-	err = register_shrinker(&f2fs_shrinker_info, "f2fs-shrinker");
+	err = f2fs_init_shrinker();
 	if (err)
 		goto free_sysfs;
 	err = register_filesystem(&f2fs_fs_type);
@@ -4985,7 +5001,7 @@ static int __init init_f2fs_fs(void)
 	f2fs_destroy_root_stats();
 	unregister_filesystem(&f2fs_fs_type);
 free_shrinker:
-	unregister_shrinker(&f2fs_shrinker_info);
+	f2fs_exit_shrinker();
 free_sysfs:
 	f2fs_exit_sysfs();
 free_garbage_collection_cache:
@@ -5017,7 +5033,7 @@ static void __exit exit_f2fs_fs(void)
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
