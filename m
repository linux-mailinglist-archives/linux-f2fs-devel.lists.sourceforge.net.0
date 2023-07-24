Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C527875F2BD
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:19:11 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNsel-0008Qm-Gu;
	Mon, 24 Jul 2023 10:19:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNsei-0008Qa-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h5Pgz5o85vjRJX2NAYGHXGIfrVWxEYXMNean3UujJOE=; b=nU8pzlkAVREFjITjyd+JjIZn1f
 DL8HTudMnLr8FtIgvrHAOoy8IBEdJW/r9eur/36uYKBwHdGoddKZPeiREWbktlfx3PKNXTVnzb4al
 Ipc52w9dYksevDqH7/VrPfGRASrNtHmq23NzYIBaBRKwfHcY78lYgT0ysuVPzMssPOCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=h5Pgz5o85vjRJX2NAYGHXGIfrVWxEYXMNean3UujJOE=; b=IDwEyKinf4gY905NkXohCywdfB
 1GtwBkvheOC7L+ofIYThl9zaDUjoQr9v7faM8xOVMLGd3LTcAkcbXczBJk9mLayu7OdmO2jIpNsA7
 toCcE/7ieUOwQxl5FX3e6ZQ5JyYSZBf2VU0m/8yaU8JgSxeNPFgK8K5O1kZm4mMClkC0=;
Received: from mail-qv1-f45.google.com ([209.85.219.45])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNsee-000Q38-4K for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:19:07 +0000
Received: by mail-qv1-f45.google.com with SMTP id
 6a1803df08f44-63cf6f49a9fso2471686d6.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:19:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690193938; x=1690798738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h5Pgz5o85vjRJX2NAYGHXGIfrVWxEYXMNean3UujJOE=;
 b=QEKQ3FFYmJrU3EU12P3quf/qVwhkSRBpGNgxasTJ8rZqG3FSJ5ghrnCfwT7AxtiFkt
 TG7w6JgVRpnjOjVrPEGKA+qyQAB0IQ67KDJJu0wwNPNIcjd2C0bDk0/SSrTqB/vf/oma
 sjSQC/zPzXVYS9x9mabDb+hbdqGzJmE4YLopNDK4wxwve0Wj23N5YhmYSrD4amjy5++q
 /cqPAt9OC1ur2RU+YS2d0mCfEgjkSoeREdr49oJra5oE9ejVABw/CsNS9jRwldJ/+I4w
 UosCKmsfkqMtbWFnSYriHUXONNTlMBLhQ3PRpOS3UEYLz6fwApwAf4n7k/32PVWpYk/Y
 aiqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690193938; x=1690798738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=h5Pgz5o85vjRJX2NAYGHXGIfrVWxEYXMNean3UujJOE=;
 b=A1tw8qAWytpXltgolyC8XqPCmF8lF4/BzafA/Kgtcv2YE1b2Rw7SPwt2WTpujLcXSI
 x8bTJqRMeqozeL+hENkz8qasljS+CCiq9lxNqMvKcP7w2ZmHDyWLLYMjzJ3FHZOpQG/o
 WU42X0d9w/aC79emnZj0KAeE04f1Q5LfobUVNJLBUnlZtMa6anHLirRjBRMgEHtz1ZD2
 lSJqbSl+89gVBnroVuPqY0z0VZ4+PUuCM1olElQZsh3HtasAXkXpqDVDd7Q6MzrCHC/Q
 6us/+g/K9msIndT8WaUkXGt5QDxGoEMacaZyKycroz8K7WyZoMiwfkpqkEp8eeEryHVs
 QjWw==
X-Gm-Message-State: ABy/qLZUQCgMG38HdRNrEReunTcAu7i5iSGBYl63q7kpIFpitsWcNwmb
 ivkZiqCs3nY8i4H0psq2uSi4H3J9HxPy8q5yUlM=
X-Google-Smtp-Source: APBJJlEuFsN94AIprk7ia8ABwlM0Slt2XXWIAtSq+6lqm1qdEZFYXWzDVMuJVyeP2h9BJXp/48ZO1g==
X-Received: by 2002:a17:90a:5a4c:b0:263:1e82:2dc7 with SMTP id
 m12-20020a17090a5a4c00b002631e822dc7mr8465919pji.0.1690192230524; 
 Mon, 24 Jul 2023 02:50:30 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.50.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:50:30 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:34 +0800
Message-Id: <20230724094354.90817-28-zhengqi.arch@bytedance.com>
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
 Content preview:  In preparation for implementing lockless slab shrink, use
 new APIs to dynamically allocate the md-raid5 shrinker, so that it can be
 freed asynchronously using kfree_rcu(). Then it doesn't need to wait [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.219.45 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.219.45 listed in list.dnswl.org]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qNsee-000Q38-4K
Subject: [f2fs-dev] [PATCH v2 27/47] md/raid5: dynamically allocate the
 md-raid5 shrinker
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

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the md-raid5 shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct r5conf.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 drivers/md/raid5.c | 25 ++++++++++++++-----------
 drivers/md/raid5.h |  2 +-
 2 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/drivers/md/raid5.c b/drivers/md/raid5.c
index 85b3004594e0..12443dfb7aeb 100644
--- a/drivers/md/raid5.c
+++ b/drivers/md/raid5.c
@@ -7414,7 +7414,7 @@ static void free_conf(struct r5conf *conf)
 
 	log_exit(conf);
 
-	unregister_shrinker(&conf->shrinker);
+	shrinker_unregister(conf->shrinker);
 	free_thread_groups(conf);
 	shrink_stripes(conf);
 	raid5_free_percpu(conf);
@@ -7462,7 +7462,7 @@ static int raid5_alloc_percpu(struct r5conf *conf)
 static unsigned long raid5_cache_scan(struct shrinker *shrink,
 				      struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 	unsigned long ret = SHRINK_STOP;
 
 	if (mutex_trylock(&conf->cache_size_mutex)) {
@@ -7483,7 +7483,7 @@ static unsigned long raid5_cache_scan(struct shrinker *shrink,
 static unsigned long raid5_cache_count(struct shrinker *shrink,
 				       struct shrink_control *sc)
 {
-	struct r5conf *conf = container_of(shrink, struct r5conf, shrinker);
+	struct r5conf *conf = shrink->private_data;
 
 	if (conf->max_nr_stripes < conf->min_nr_stripes)
 		/* unlikely, but not impossible */
@@ -7718,18 +7718,21 @@ static struct r5conf *setup_conf(struct mddev *mddev)
 	 * it reduces the queue depth and so can hurt throughput.
 	 * So set it rather large, scaled by number of devices.
 	 */
-	conf->shrinker.seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
-	conf->shrinker.scan_objects = raid5_cache_scan;
-	conf->shrinker.count_objects = raid5_cache_count;
-	conf->shrinker.batch = 128;
-	conf->shrinker.flags = 0;
-	ret = register_shrinker(&conf->shrinker, "md-raid5:%s", mdname(mddev));
-	if (ret) {
-		pr_warn("md/raid:%s: couldn't register shrinker.\n",
+	conf->shrinker = shrinker_alloc(0, "md-raid5:%s", mdname(mddev));
+	if (!conf->shrinker) {
+		pr_warn("md/raid:%s: couldn't allocate shrinker.\n",
 			mdname(mddev));
 		goto abort;
 	}
 
+	conf->shrinker->seeks = DEFAULT_SEEKS * conf->raid_disks * 4;
+	conf->shrinker->scan_objects = raid5_cache_scan;
+	conf->shrinker->count_objects = raid5_cache_count;
+	conf->shrinker->batch = 128;
+	conf->shrinker->private_data = conf;
+
+	shrinker_register(conf->shrinker);
+
 	sprintf(pers_name, "raid%d", mddev->new_level);
 	rcu_assign_pointer(conf->thread,
 			   md_register_thread(raid5d, mddev, pers_name));
diff --git a/drivers/md/raid5.h b/drivers/md/raid5.h
index 97a795979a35..22bea20eccbd 100644
--- a/drivers/md/raid5.h
+++ b/drivers/md/raid5.h
@@ -670,7 +670,7 @@ struct r5conf {
 	wait_queue_head_t	wait_for_stripe;
 	wait_queue_head_t	wait_for_overlap;
 	unsigned long		cache_state;
-	struct shrinker		shrinker;
+	struct shrinker		*shrinker;
 	int			pool_size; /* number of disks in stripeheads in pool */
 	spinlock_t		device_lock;
 	struct disk_info	*disks;
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
