Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8592F7720E3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Aug 2023 13:17:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qSyFJ-0008Ru-Ei;
	Mon, 07 Aug 2023 11:17:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qSyEw-0008PO-Dr
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:17:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=v5vYJ8kE3O6JXdLxdEEyUgUMjz4KJqSKKSB151wqkNo=; b=luakQ7zCyu8PtKcW9jbKypRt3d
 EsilTkHx2SYcUtR4t5H1DOMaibhVlupP9pJ5mKRR6DG9yJTiUCuzXtynS27xhn9XpSBr326KzQgd8
 1MS0N8fHrXilvCXKO+0P1zj10cn+VVykqIdAxP4qMdlrrPkJX8JIcn0Ldfu0VbU+XvFw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=v5vYJ8kE3O6JXdLxdEEyUgUMjz4KJqSKKSB151wqkNo=; b=Hxy0o8TShGiVZvGYwrDzwIsE1S
 8fXkMluLZPl98uFYVccITEGSWraOf7dtJF/mc4f298AwUl93RRFbDeNHnfxBhwVZpoQ2Al17tNxhw
 gHvCq98UjKIR1aIP0oToVMHSnZeTOt+4aaJuYhk8E/cB+914RkwUSpC8Me6Bah7rCgF8=;
Received: from mail-pg1-f170.google.com ([209.85.215.170])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qSyEt-00Frrt-IX for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 07 Aug 2023 11:17:33 +0000
Received: by mail-pg1-f170.google.com with SMTP id
 41be03b00d2f7-55b5a37acb6so362680a12.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 07 Aug 2023 04:17:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1691407046; x=1692011846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=v5vYJ8kE3O6JXdLxdEEyUgUMjz4KJqSKKSB151wqkNo=;
 b=SddB5W7TBGS4uOBB54oAwQadrL7fhf6DQuFGu8VJel4YD8JvtkF5mhOckA/6vdi9nq
 hlVTmdr/Kx1D4xlpvO2OSKYXB5RvVMiR6sESxeeh8/ktD09qDCXXwpDE4WqRU8hY11FY
 G6KR4LUZZolsNcExYWQgBloqrZSLljdTAa93b1m2N036gRwi9BwogxNRXUsItZlswdeV
 RttwDZcFyg1S8l+4ePFxtqYFv2AYsGXbvb/zq8emVyERgALeuEVi3b9ZjwWVeQ9iauxk
 xcZs9+wDP4Bgr5Tw0/5OxVGHY2k5SYNUfTOTk9l9GbDIx4PuLA8GEzMw0rmzVwGr35V7
 B6uQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691407046; x=1692011846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=v5vYJ8kE3O6JXdLxdEEyUgUMjz4KJqSKKSB151wqkNo=;
 b=VBP5iF4jFOEtXMBFeO1AN3crtLhcmCTBmT9ihaH9zPjipnBiV0wOwkeNbTzIp4xhoV
 gU9im8SIm12aaMfQosHzKNd2/hiuhFJGh2B775a/Rve8uM9pmBzRjaAYXvVJynQv3oms
 R4uwFRGv+G31PDSCnBb9IXw93IPl/9SSb/ftW5pPk6U2xICOh2x2mrWvkUnLHG0DnSSH
 9c1zrrlj/mgyLwvoCs0671oc9IYTWzTxjKTmW99LhyrWkivnJsUzuzWDKBTcAsDoRd7K
 ESUiJOsCfoKQMytSibuDtSg8Lr6Tc1TK5BZY3gPEEnhnxk0gnX/NPnegeoBAaAtiX78a
 zgYg==
X-Gm-Message-State: ABy/qLaEW9h/Wcu/g/bFrpnXfdRRFaccGnDLOuc2XErkaBV08ZvsczvM
 CUznQiux2eFNwWrUitwnwYWDsQ==
X-Google-Smtp-Source: APBJJlFyAF6s6JefOZNl/scuUGwKU5q0BmH7yK6Qf+JZ3E1mrAS2lh5NuGQm2RRGuEVfms4+14afyQ==
X-Received: by 2002:a17:90a:3f08:b0:268:1e3b:14c9 with SMTP id
 l8-20020a17090a3f0800b002681e3b14c9mr23486908pjc.2.1691407045970; 
 Mon, 07 Aug 2023 04:17:25 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.146])
 by smtp.gmail.com with ESMTPSA id
 y13-20020a17090aca8d00b0025be7b69d73sm5861191pjt.12.2023.08.07.04.17.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 07 Aug 2023 04:17:25 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev,
 simon.horman@corigine.com, dlemoal@kernel.org
Date: Mon,  7 Aug 2023 19:09:23 +0800
Message-Id: <20230807110936.21819-36-zhengqi.arch@bytedance.com>
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
 Content preview:  In preparation for implementing lockless slab shrink, use
 new APIs to dynamically allocate the nfsd-client shrinker, so that it can
 be freed asynchronously using kfree_rcu(). Then it doesn't need to w [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.215.170 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.215.170 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qSyEt-00Frrt-IX
Subject: [f2fs-dev] [PATCH v4 35/48] nfsd: dynamically allocate the
 nfsd-client shrinker
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
 Jeff Layton <jlayton@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-xfs@vger.kernel.org,
 Chuck Lever <chuck.lever@oracle.com>, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In preparation for implementing lockless slab shrink, use new APIs to
dynamically allocate the nfsd-client shrinker, so that it can be freed
asynchronously using kfree_rcu(). Then it doesn't need to wait for RCU
read-side critical section when releasing the struct nfsd_net.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
Acked-by: Chuck Lever <chuck.lever@oracle.com>
Acked-by: Jeff Layton <jlayton@kernel.org>
---
 fs/nfsd/netns.h     |  2 +-
 fs/nfsd/nfs4state.c | 20 ++++++++++++--------
 2 files changed, 13 insertions(+), 9 deletions(-)

diff --git a/fs/nfsd/netns.h b/fs/nfsd/netns.h
index ec49b200b797..f669444d5336 100644
--- a/fs/nfsd/netns.h
+++ b/fs/nfsd/netns.h
@@ -195,7 +195,7 @@ struct nfsd_net {
 	int			nfs4_max_clients;
 
 	atomic_t		nfsd_courtesy_clients;
-	struct shrinker		nfsd_client_shrinker;
+	struct shrinker		*nfsd_client_shrinker;
 	struct work_struct	nfsd_shrinker_work;
 };
 
diff --git a/fs/nfsd/nfs4state.c b/fs/nfsd/nfs4state.c
index 8534693eb6a4..9e401db8a6d2 100644
--- a/fs/nfsd/nfs4state.c
+++ b/fs/nfsd/nfs4state.c
@@ -4400,8 +4400,7 @@ static unsigned long
 nfsd4_state_shrinker_count(struct shrinker *shrink, struct shrink_control *sc)
 {
 	int count;
-	struct nfsd_net *nn = container_of(shrink,
-			struct nfsd_net, nfsd_client_shrinker);
+	struct nfsd_net *nn = shrink->private_data;
 
 	count = atomic_read(&nn->nfsd_courtesy_clients);
 	if (!count)
@@ -8149,12 +8148,17 @@ static int nfs4_state_create_net(struct net *net)
 	INIT_WORK(&nn->nfsd_shrinker_work, nfsd4_state_shrinker_worker);
 	get_net(net);
 
-	nn->nfsd_client_shrinker.scan_objects = nfsd4_state_shrinker_scan;
-	nn->nfsd_client_shrinker.count_objects = nfsd4_state_shrinker_count;
-	nn->nfsd_client_shrinker.seeks = DEFAULT_SEEKS;
-
-	if (register_shrinker(&nn->nfsd_client_shrinker, "nfsd-client"))
+	nn->nfsd_client_shrinker = shrinker_alloc(0, "nfsd-client");
+	if (!nn->nfsd_client_shrinker)
 		goto err_shrinker;
+
+	nn->nfsd_client_shrinker->scan_objects = nfsd4_state_shrinker_scan;
+	nn->nfsd_client_shrinker->count_objects = nfsd4_state_shrinker_count;
+	nn->nfsd_client_shrinker->seeks = DEFAULT_SEEKS;
+	nn->nfsd_client_shrinker->private_data = nn;
+
+	shrinker_register(nn->nfsd_client_shrinker);
+
 	return 0;
 
 err_shrinker:
@@ -8252,7 +8256,7 @@ nfs4_state_shutdown_net(struct net *net)
 	struct list_head *pos, *next, reaplist;
 	struct nfsd_net *nn = net_generic(net, nfsd_net_id);
 
-	unregister_shrinker(&nn->nfsd_client_shrinker);
+	shrinker_free(nn->nfsd_client_shrinker);
 	cancel_work(&nn->nfsd_shrinker_work);
 	cancel_delayed_work_sync(&nn->laundromat_work);
 	locks_end_grace(&nn->nfsd4_manager);
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
