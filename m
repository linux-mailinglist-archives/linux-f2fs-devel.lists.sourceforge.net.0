Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7EECB75F3A9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jul 2023 12:43:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qNt1z-0001LH-7K;
	Mon, 24 Jul 2023 10:43:11 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qNt1x-0001LA-5w
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:43:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DaxJS65ntPERL7le+nmtmDDoPHIKL7Svp/IgETL6ZeE=; b=h0gmGWu56SLz4bvcA9KL0GxQQk
 zkEoy34af49r8LbbOaPMtLDabXwRBiwQ0VsK8ivy5H2Lxanj1voHk0D036of/4dWcDp2uOoLZ2URC
 uAcrso1mM3Ih+oWxnLZdzJll+ByWpoX2jrnzG8HcBFNvH/CB5PdcNUSPdFX50tt3Zmew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=DaxJS65ntPERL7le+nmtmDDoPHIKL7Svp/IgETL6ZeE=; b=kKEVTEVhuB5DHvHiZS9YG+Gbrs
 S+A11gE9hq3fw15eRpbKIq1uBtRrkTn24eLjfLXrsSizLC0qNl6utNUdy4SHnkVV9Q6m/91GPQHLA
 zvjUcQZ1EMoUW79KKXP2JPjn+M2lnSoU+zG8Qn3xVPdC99WatFUxkXOlF9J5P1nW9b1o=;
Received: from mail-ot1-f43.google.com ([209.85.210.43])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qNt1v-000R8U-JO for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jul 2023 10:43:09 +0000
Received: by mail-ot1-f43.google.com with SMTP id
 46e09a7af769-6b947f8269eso986350a34.0
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 24 Jul 2023 03:43:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690195382; x=1690800182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DaxJS65ntPERL7le+nmtmDDoPHIKL7Svp/IgETL6ZeE=;
 b=KakRJjwI7Qz/Whk05ilAHAfj97qiFZY91sNjRzNdg3ZTp4pe80DOf3HEnJEXhk2VXZ
 yaaJcH2MsSdua1Tx27ZSN22ht/iUq1eAeR+F4Flr8Ig5AOJjuj42b5eq8r5z3lAu2Izz
 EbxOmBHaVVFJKF+W/eZhkHQrif3x/o4hqgYqHr9HIMK3ChzjDIPGMP1i98CHFEwCf+gx
 hWgZJnQRqTi/GbbVHt758x7kpiUAFV7hqx4BDUFGYK9QPjmDdzqW7IQIUim9G+pLX+j9
 LBeR346JeNn4g1xQs4jcovpm7oQIuGZPQrv1eyMGp2oGx8uaE/JMIaJfD2iZ3AZVjBNe
 Se6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690195382; x=1690800182;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DaxJS65ntPERL7le+nmtmDDoPHIKL7Svp/IgETL6ZeE=;
 b=hECsqsVwCYl2Vkbyp+C4HBS0COyKwTyKHu4v/U8IMTsEf1BGTEYsA7p33auMJGmaaN
 //g/7mAnW5VlfyS+RzMBA4ckgtxEpCfq560x+kijAiiDdfb3D/aJWQajl4pe7m3zPuB8
 fAgIQfsX43AWqBMq42584ziY4c0Tt5uZit39q+rDbQkdUnHS22ubOwuOEepwVVC64Bjx
 IMYcLD/DrjOuWfNJGDKYHw6lu0hBM0FbS9Cvn+l7I2MdZwV4JQ88g1v+DaQh+TJnONJw
 VJjrKHYRbXXGXuwIFunrmj41lB0ggRQW/UwFlmKfiEzAmPMImmFUaI+D2U+/zFHzkKe5
 fzaQ==
X-Gm-Message-State: ABy/qLaAW0hJ5Cq2u6CDPQgFq8Y5HmNLgR+cKL1GxSDSOTjR2zVITwQA
 xQmCmXicQGdfC8Qqa7jHAotOS6B16sfEXr2QvJw=
X-Google-Smtp-Source: APBJJlGWwe+Wn5SAE9CC225imGBvK3oJNP2MQHqUiC6fnoUxBGqj3ofPftHC2Yw9p8SUIC56L+2IOQ==
X-Received: by 2002:a17:903:2305:b0:1b8:b0c4:2e3d with SMTP id
 d5-20020a170903230500b001b8b0c42e3dmr12236473plh.4.1690191942806; 
 Mon, 24 Jul 2023 02:45:42 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 d5-20020a170902c18500b001bb20380bf2sm8467233pld.13.2023.07.24.02.45.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Jul 2023 02:45:42 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Mon, 24 Jul 2023 17:43:10 +0800
Message-Id: <20230724094354.90817-4-zhengqi.arch@bytedance.com>
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
 Content preview:  Currently, the shrinker instances can be divided into the
 following three types: a) global shrinker instance statically defined in the
 kernel,
 such as workingset_shadow_shrinker. b) global shrinker instance statically
 defined in the kernel modules, such as mmu_shrinker in x86. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.43 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [209.85.210.43 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1qNt1v-000R8U-JO
Subject: [f2fs-dev] [PATCH v2 03/47] mm: shrinker: add infrastructure for
 dynamically allocating shrinker
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

Currently, the shrinker instances can be divided into the following three
types:

a) global shrinker instance statically defined in the kernel, such as
   workingset_shadow_shrinker.

b) global shrinker instance statically defined in the kernel modules, such
   as mmu_shrinker in x86.

c) shrinker instance embedded in other structures.

For case a, the memory of shrinker instance is never freed. For case b,
the memory of shrinker instance will be freed after synchronize_rcu() when
the module is unloaded. For case c, the memory of shrinker instance will
be freed along with the structure it is embedded in.

In preparation for implementing lockless slab shrink, we need to
dynamically allocate those shrinker instances in case c, then the memory
can be dynamically freed alone by calling kfree_rcu().

So this commit adds the following new APIs for dynamically allocating
shrinker, and add a private_data field to struct shrinker to record and
get the original embedded structure.

1. shrinker_alloc()

Used to allocate shrinker instance itself and related memory, it will
return a pointer to the shrinker instance on success and NULL on failure.

2. shrinker_free_non_registered()

Used to destroy the non-registered shrinker instance.

3. shrinker_register()

Used to register the shrinker instance, which is same as the current
register_shrinker_prepared().

4. shrinker_unregister()

Used to unregister and free the shrinker instance.

In order to simplify shrinker-related APIs and make shrinker more
independent of other kernel mechanisms, subsequent submissions will use
the above API to convert all shrinkers (including case a and b) to
dynamically allocated, and then remove all existing APIs.

This will also have another advantage mentioned by Dave Chinner:

```
The other advantage of this is that it will break all the existing
out of tree code and third party modules using the old API and will
no longer work with a kernel using lockless slab shrinkers. They
need to break (both at the source and binary levels) to stop bad
things from happening due to using uncoverted shrinkers in the new
setup.
```

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h |   6 +++
 mm/shrinker.c            | 113 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 119 insertions(+)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 961cb84e51f5..296f5e163861 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -70,6 +70,8 @@ struct shrinker {
 	int seeks;	/* seeks to recreate an obj */
 	unsigned flags;
 
+	void *private_data;
+
 	/* These are for internal use */
 	struct list_head list;
 #ifdef CONFIG_MEMCG
@@ -98,6 +100,10 @@ struct shrinker {
 
 unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 			  int priority);
+struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...);
+void shrinker_free_non_registered(struct shrinker *shrinker);
+void shrinker_register(struct shrinker *shrinker);
+void shrinker_unregister(struct shrinker *shrinker);
 
 extern int __printf(2, 3) prealloc_shrinker(struct shrinker *shrinker,
 					    const char *fmt, ...);
diff --git a/mm/shrinker.c b/mm/shrinker.c
index 0a32ef42f2a7..d820e4cc5806 100644
--- a/mm/shrinker.c
+++ b/mm/shrinker.c
@@ -548,6 +548,119 @@ unsigned long shrink_slab(gfp_t gfp_mask, int nid, struct mem_cgroup *memcg,
 	return freed;
 }
 
+struct shrinker *shrinker_alloc(unsigned int flags, const char *fmt, ...)
+{
+	struct shrinker *shrinker;
+	unsigned int size;
+	va_list __maybe_unused ap;
+	int err;
+
+	shrinker = kzalloc(sizeof(struct shrinker), GFP_KERNEL);
+	if (!shrinker)
+		return NULL;
+
+#ifdef CONFIG_SHRINKER_DEBUG
+	va_start(ap, fmt);
+	shrinker->name = kvasprintf_const(GFP_KERNEL, fmt, ap);
+	va_end(ap);
+	if (!shrinker->name)
+		goto err_name;
+#endif
+	shrinker->flags = flags;
+
+	if (flags & SHRINKER_MEMCG_AWARE) {
+		err = prealloc_memcg_shrinker(shrinker);
+		if (err == -ENOSYS)
+			shrinker->flags &= ~SHRINKER_MEMCG_AWARE;
+		else if (err == 0)
+			goto done;
+		else
+			goto err_flags;
+	}
+
+	/*
+	 * The nr_deferred is available on per memcg level for memcg aware
+	 * shrinkers, so only allocate nr_deferred in the following cases:
+	 *  - non memcg aware shrinkers
+	 *  - !CONFIG_MEMCG
+	 *  - memcg is disabled by kernel command line
+	 */
+	size = sizeof(*shrinker->nr_deferred);
+	if (flags & SHRINKER_NUMA_AWARE)
+		size *= nr_node_ids;
+
+	shrinker->nr_deferred = kzalloc(size, GFP_KERNEL);
+	if (!shrinker->nr_deferred)
+		goto err_flags;
+
+done:
+	return shrinker;
+
+err_flags:
+#ifdef CONFIG_SHRINKER_DEBUG
+	kfree_const(shrinker->name);
+	shrinker->name = NULL;
+err_name:
+#endif
+	kfree(shrinker);
+	return NULL;
+}
+EXPORT_SYMBOL(shrinker_alloc);
+
+void shrinker_free_non_registered(struct shrinker *shrinker)
+{
+#ifdef CONFIG_SHRINKER_DEBUG
+	kfree_const(shrinker->name);
+	shrinker->name = NULL;
+#endif
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE) {
+		down_write(&shrinker_rwsem);
+		unregister_memcg_shrinker(shrinker);
+		up_write(&shrinker_rwsem);
+	}
+
+	kfree(shrinker->nr_deferred);
+	shrinker->nr_deferred = NULL;
+
+	kfree(shrinker);
+}
+EXPORT_SYMBOL(shrinker_free_non_registered);
+
+void shrinker_register(struct shrinker *shrinker)
+{
+	down_write(&shrinker_rwsem);
+	list_add_tail(&shrinker->list, &shrinker_list);
+	shrinker->flags |= SHRINKER_REGISTERED;
+	shrinker_debugfs_add(shrinker);
+	up_write(&shrinker_rwsem);
+}
+EXPORT_SYMBOL(shrinker_register);
+
+void shrinker_unregister(struct shrinker *shrinker)
+{
+	struct dentry *debugfs_entry;
+	int debugfs_id;
+
+	if (!shrinker || !(shrinker->flags & SHRINKER_REGISTERED))
+		return;
+
+	down_write(&shrinker_rwsem);
+	list_del(&shrinker->list);
+	shrinker->flags &= ~SHRINKER_REGISTERED;
+	if (shrinker->flags & SHRINKER_MEMCG_AWARE)
+		unregister_memcg_shrinker(shrinker);
+	debugfs_entry = shrinker_debugfs_detach(shrinker, &debugfs_id);
+	up_write(&shrinker_rwsem);
+
+	shrinker_debugfs_remove(debugfs_entry, debugfs_id);
+
+	kfree(shrinker->nr_deferred);
+	shrinker->nr_deferred = NULL;
+
+	kfree(shrinker);
+}
+EXPORT_SYMBOL(shrinker_unregister);
+
 /*
  * Add a shrinker callback to be called from the vm.
  */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
