Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BE8E9764A0C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 27 Jul 2023 10:06:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qOw0u-0008Fr-9j;
	Thu, 27 Jul 2023 08:06:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhengqi.arch@bytedance.com>) id 1qOw0s-0008Fa-F9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:06:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=; b=f0BUwSdCfhvDL9D3MjpoZSSg1h
 rui6K+fcvoI94+aDuxBswX+25VGv3WgbamCpQhndeFhMZCLVfx/ZMTLuDm1XxawXqPj4KG/tYmL13
 kH6DFjz2xc1vceCUGP93fLaIMUb8cF7h5jvq/Kw/iVNHWTaZvQZpq2ROMP9wH9HygrTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=; b=MUdXRX8+lC6J2KjJtXLFz7+T1L
 0d+VGtaadMkGK6i91whvhuo5De1/kPLR9DNnF6Fq7KH6PBYbTReTApuv4EtenYb+3WhdUV9bYUv79
 LnxGzQvfnQoq0d8rqGFuH/h81upQ4ANH1heHlKcyELf6BzqyoeIGoS9fA/uHy/v5FEQs=;
Received: from mail-pf1-f172.google.com ([209.85.210.172])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES128-GCM-SHA256:128) (Exim 4.95)
 id 1qOw0n-004LLR-MK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 27 Jul 2023 08:06:21 +0000
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-6748a616e17so182224b3a.1
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 27 Jul 2023 01:06:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=bytedance.com; s=google; t=1690445172; x=1691049972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=;
 b=AHxGvLfHLl40j8B2JJRU5s4VfBVIfkKAsI0cQEyx34RUKm+kvHJrB2iQzGzRnBcS3v
 6USwrAVD49Q91VdWL412Beuc1lh9luLsvseTAfwZXNQFTlfXj/44XL3QSDLO3kE477UK
 PuQisTQDtaTenLhmz9UxJrWIk76t/9C2sGl3AoIFTG0F/GG2DtEXlZsFxPta58HNNxGh
 nuotqk/EcRuGp6B6DpQqHvzB1OaU8/LVfrpsdfcpoHM2+LjVOOXNlq+MDZzMAY0XeOby
 XoS1N9oa25ZJEGOvTPLqpEaa/2bkazEZHcopiam72Y0TXS5KlF1vjQrUn3lGIfR4Oiwn
 FzZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690445172; x=1691049972;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hMz0NiXWW4aad/y0uXjwCFa/Ag/H17CXQFU4sIH/+zs=;
 b=TINsSGkRUF9ggZWzkVK3xlxY2bnlM18TGeyYaRtItlZtKPNrXX319khcLInhO4mudW
 i8UrIGyOvtrVGkvuUtJpvo8ySohnM/883pFE9QGZ/3EsARf5jFZ0nO5pAuoFMsf7GryY
 s4oCmfku+clLyiltEu4t+LAprRrnpM6CJTh7CeUu0dcWkGM/AnJTJJ6gAzAc/pipqFmA
 PTmGemfJjjAX2RiEvvqiTZY1bQ/+BmOwrUxgclEYmE9iDowFFU3lUGp9oWZuCPMn+zGn
 UcWLtTgzS4h/D6QOOr9qnTYreZahRguRvsrzYhU3MOAdLSce+TmJJXYO9ZNRF7UbPnn1
 QPJw==
X-Gm-Message-State: ABy/qLYrWn0azAYk0nxeri6n3nXz7DDtBFa9Em6XZYHUU4Avf98VWQMx
 OxjmccZZEsIBbweyhbEX8HW88w==
X-Google-Smtp-Source: APBJJlELtr5cWJQ0To//AtRPEOYgFBMbhSo+p4MsXdX0IoPp5bJSVuIL2HKgeywTxbzsVW+qtVe8tQ==
X-Received: by 2002:a05:6a00:4792:b0:668:834d:4bd with SMTP id
 dh18-20020a056a00479200b00668834d04bdmr4674312pfb.0.1690445172123; 
 Thu, 27 Jul 2023 01:06:12 -0700 (PDT)
Received: from C02DW0BEMD6R.bytedance.net ([203.208.167.147])
 by smtp.gmail.com with ESMTPSA id
 j8-20020aa78d08000000b006828e49c04csm885872pfe.75.2023.07.27.01.06.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 01:06:11 -0700 (PDT)
To: akpm@linux-foundation.org, david@fromorbit.com, tkhai@ya.ru,
 vbabka@suse.cz, roman.gushchin@linux.dev, djwong@kernel.org,
 brauner@kernel.org, paulmck@kernel.org, tytso@mit.edu,
 steven.price@arm.com, cel@kernel.org, senozhatsky@chromium.org,
 yujie.liu@intel.com, gregkh@linuxfoundation.org, muchun.song@linux.dev
Date: Thu, 27 Jul 2023 16:04:15 +0800
Message-Id: <20230727080502.77895-3-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
References: <20230727080502.77895-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The following functions are only used inside the mm subsystem,
 so it's better to move their declarations to the mm/internal.h file. 1.
 shrinker_debugfs_add()
 2. shrinker_debugfs_detach() 3. shrinker_debugfs_remove() 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [209.85.210.172 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [209.85.210.172 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qOw0n-004LLR-MK
Subject: [f2fs-dev] [PATCH v3 02/49] mm: move some shrinker-related function
 declarations to mm/internal.h
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

The following functions are only used inside the mm subsystem, so it's
better to move their declarations to the mm/internal.h file.

1. shrinker_debugfs_add()
2. shrinker_debugfs_detach()
3. shrinker_debugfs_remove()

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/shrinker.h | 19 -------------------
 mm/internal.h            | 28 ++++++++++++++++++++++++++++
 2 files changed, 28 insertions(+), 19 deletions(-)

diff --git a/include/linux/shrinker.h b/include/linux/shrinker.h
index 224293b2dd06..8dc15aa37410 100644
--- a/include/linux/shrinker.h
+++ b/include/linux/shrinker.h
@@ -106,28 +106,9 @@ extern void free_prealloced_shrinker(struct shrinker *shrinker);
 extern void synchronize_shrinkers(void);
 
 #ifdef CONFIG_SHRINKER_DEBUG
-extern int shrinker_debugfs_add(struct shrinker *shrinker);
-extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-					      int *debugfs_id);
-extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-				    int debugfs_id);
 extern int __printf(2, 3) shrinker_debugfs_rename(struct shrinker *shrinker,
 						  const char *fmt, ...);
 #else /* CONFIG_SHRINKER_DEBUG */
-static inline int shrinker_debugfs_add(struct shrinker *shrinker)
-{
-	return 0;
-}
-static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
-						     int *debugfs_id)
-{
-	*debugfs_id = -1;
-	return NULL;
-}
-static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
-					   int debugfs_id)
-{
-}
 static inline __printf(2, 3)
 int shrinker_debugfs_rename(struct shrinker *shrinker, const char *fmt, ...)
 {
diff --git a/mm/internal.h b/mm/internal.h
index 5a03bc4782a2..8aeaf16ae039 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -1135,4 +1135,32 @@ struct vma_prepare {
 	struct vm_area_struct *remove;
 	struct vm_area_struct *remove2;
 };
+
+/*
+ * shrinker related functions
+ */
+
+#ifdef CONFIG_SHRINKER_DEBUG
+extern int shrinker_debugfs_add(struct shrinker *shrinker);
+extern struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+					      int *debugfs_id);
+extern void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+				    int debugfs_id);
+#else /* CONFIG_SHRINKER_DEBUG */
+static inline int shrinker_debugfs_add(struct shrinker *shrinker)
+{
+	return 0;
+}
+static inline struct dentry *shrinker_debugfs_detach(struct shrinker *shrinker,
+						     int *debugfs_id)
+{
+	*debugfs_id = -1;
+	return NULL;
+}
+static inline void shrinker_debugfs_remove(struct dentry *debugfs_entry,
+					   int debugfs_id)
+{
+}
+#endif /* CONFIG_SHRINKER_DEBUG */
+
 #endif	/* __MM_INTERNAL_H */
-- 
2.30.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
