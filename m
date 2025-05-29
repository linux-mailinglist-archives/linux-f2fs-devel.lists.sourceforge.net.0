Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BFE4AC7D60
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:49:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iBDAG9QzO/Bzv4IdeEwSK7MfmWsUVddOsEsrh35reMs=; b=NooouAfeqnfUPvsTZMJHwN4nwE
	6RIvnpgxJd2I5xkiC3YoTbvki4n2jDmwxJs9JpvAt20DxDuf4tKqORZinIsPhhA4HDj0wPwXqE+9/
	NjPIvE5T0wjPmO5NQPe8RZpSKcteMqwCX3gdPaOG9ZoAk2ih/VqHuKgnXf4jkbd/R3HA=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKblK-0001wO-K3;
	Thu, 29 May 2025 11:49:30 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKblI-0001wI-Sf
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=C+GkTvY8D+25yzgyaUuIRcKdgNOM65N4VuaT+9A3U20=; b=QHFkb33uu6lV5zzIRlaCQsYS9L
 OUL547y2tfep+VVMg8Oc4h3JfC3bGmxN1SnbBp/vbGcYv1ns/RfioILhI4iG3CyoJ8m9WHVfrhMUt
 UxXq7goU+VregI/z98j6Yvr0vb+dTgf9c9PCEzN0huU2v8T9TfiF/93baLl8yKD+8jw0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=C+GkTvY8D+25yzgyaUuIRcKdgNOM65N4VuaT+9A3U20=; b=lF9uvHbKcuL4xsHzScP4zIjYxY
 YB6rCl06wYoaDkmhu0XgGU//c1hKel13JTLs1l+yzNCzjEczS5WZW2q6cG5DONiAaIGZVv6TiSdsk
 r8cofyeemj/joaON55cmR52wYDJEkdgJNCfvTgSaWUNVPlAp/NP7pIPZVkCDkITlbyFo=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKblH-0000tJ-Bf for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:49:28 +0000
Received: from epcas5p4.samsung.com (unknown [182.195.41.42])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20250529113334epoutp01a24bf1200b171554fc1fc96abedf0811~D-Dvs7lhH2482424824epoutp01a
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:33:34 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20250529113334epoutp01a24bf1200b171554fc1fc96abedf0811~D-Dvs7lhH2482424824epoutp01a
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518414;
 bh=C+GkTvY8D+25yzgyaUuIRcKdgNOM65N4VuaT+9A3U20=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=M0Dd8EwAQCPVy6eDoA4GBnmyRNl3UzEn0tKLYWgdBq/xpXX68gwjrxvB/EjRHqiUi
 GDD1ITPIzQ3IJSbQivWQXzvMbbT3iLF5JUIJ9xUSR0uZgxLmfj1pAiWDg5TlJE78y6
 2YT2jn40umUcI2PnySYqvInYEYiJcH1j+dNk7/hs=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p2.samsung.com (KnoxPortal) with ESMTPS id
 20250529113333epcas5p25fabe3ac0cd0719ee03e87bb5e07bf7a~D-DvEukTO0067100671epcas5p23;
 Thu, 29 May 2025 11:33:33 +0000 (GMT)
Received: from epcas5p4.samsung.com (unknown [182.195.38.183]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4b7PQ44jtzz6B9mB; Thu, 29 May
 2025 11:33:32 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPA id
 20250529113228epcas5p1db88ab42c2dac0698d715e38bd5e0896~D-Cx47Ddm1656216562epcas5p14;
 Thu, 29 May 2025 11:32:28 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113228epsmtrp2808b8d9371493c789a9bbd52ec76c111~D-Cx3omtG3187631876epsmtrp2K;
 Thu, 29 May 2025 11:32:28 +0000 (GMT)
X-AuditID: b6c32a29-55afd7000000223e-21-683845cc5b4a
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 5B.D0.08766.CC548386; Thu, 29 May 2025 20:32:28 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113224epsmtip2211a0716625a96f0108b68b63ae02743~D-CuAx6332456924569epsmtip2I;
 Thu, 29 May 2025 11:32:23 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:44:54 +0530
Message-Id: <20250529111504.89912-4-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrOIsWRmVeSWpSXmKPExsWy7bCSvO4ZV4sMg+09XBbb1u1mt5izfg2b
 xYV1qxktWnf+Z7FomvCX2WL13X42i9eHPzFanJ56lsliyyV7i/eXtzFZrL65htFiy7F7jBaX
 n/BZ7J7+j9Xi5oGdTBYrVx9lspg9vZnJ4sn6WcwWW798ZbW4tMjdYs/ekywW99b8Z7W4cOA0
 q8WNCU8ZLZ7t3shs8XlpC7vFwVMd7Baf5gINOf/3OKvF7x9z2BzkPE4tkvDYOesuu8fmFVoe
 l8+Wemxa1cnmsenTJHaPEzN+s3i82DyT0WP3gs9MHrtvNrB5nLtY4fF+31U2j74tqxg9ps6u
 9ziz4Ai7x4ppF5kChKK4bFJSczLLUov07RK4MrZtNyu4xF9xYotVA+NTni5GTg4JAROJKU9n
 sHUxcnEICexmlFhydzILREJGYvfdnawQtrDEyn/P2SGKPjJKbJvYApTg4GAT0JX40RQKEhcR
 uMksce7sGbAGZoF/jBK7X+mA1AgLREvs2FkDEmYRUJXY3HGPEcTmFbCV+La5nx1ivrzEzEvf
 wWxOATuJRUu+gtUIAdUsvbmWBaJeUOLkzCcsEOPlJZq3zmaewCgwC0lqFpLUAkamVYySqQXF
 uem5xYYFhnmp5XrFibnFpXnpesn5uZsYwWlBS3MH4/ZVH/QOMTJxMB5ilOBgVhLhbbI3yxDi
 TUmsrEotyo8vKs1JLT7EKM3BoiTOK/6iN0VIID2xJDU7NbUgtQgmy8TBKdXAxDF/zyENzwxX
 U1nz9ifb/Y/80FU4U7SrJ6x9+YcHbv/rnVtmfVBbWCF08HNluNwLrnWy3bcvZPOfcuTN6grl
 WeP4trE+LuFHya/tvW+9bPLX5S825D0gaDRT1/1BbRyDZk7V9hnWclaZWbw8B94mif5If1lR
 9fTQOebk3I/WhZ3tCb/2SnQfT0hg3xV3+FjN1rZvXQcbH92Skd84T36n8Z18f2bdK39dVinF
 82mnlWrrbNfZ+fOc+cR5B/vWVUfcv9KktYDrv8SH/YZX4lYU+N81ypi37OmToJXxSnt+JspP
 OKUnrNtUw/Y2aoqG+8UHqn6bldfOT52Won7O3Thn+7fOVa8fFb6P33B2cdYzJZbijERDLeai
 4kQAd51hDnoDAAA=
X-CMS-MailID: 20250529113228epcas5p1db88ab42c2dac0698d715e38bd5e0896
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113228epcas5p1db88ab42c2dac0698d715e38bd5e0896
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113228epcas5p1db88ab42c2dac0698d715e38bd5e0896@epcas5p1.samsung.com>
X-Spam-Score: -5.4 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Introduce a bdi_writeback_ctx field in bdi_writeback. This
 helps in fetching the writeback context from the bdi_writeback. Signed-off-by:
 Kundan Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj Gupta
 <anuj20.g@samsung.com>
 --- mm/backing-dev.c | 13 +++++++------ 1 file changed, 7 insertions(+),
 6 deletions(-) 
 Content analysis details:   (-5.4 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.24 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [203.254.224.24 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -2.9 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1uKblH-0000tJ-Bf
Subject: [f2fs-dev] [PATCH 03/13] writeback: link bdi_writeback to its
 corresponding bdi_writeback_ctx
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com,
 Anuj Gupta <anuj20.g@samsung.com>, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 Kundan Kumar <kundan.kumar@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduce a bdi_writeback_ctx field in bdi_writeback. This helps in
fetching the writeback context from the bdi_writeback.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 mm/backing-dev.c | 13 +++++++------
 1 file changed, 7 insertions(+), 6 deletions(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index adf87b036827..5479e2d34160 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -513,15 +513,16 @@ static void wb_update_bandwidth_workfn(struct work_struct *work)
  */
 #define INIT_BW		(100 << (20 - PAGE_SHIFT))
 
-static int wb_init(struct bdi_writeback *wb, struct backing_dev_info *bdi,
-		   gfp_t gfp)
+static int wb_init(struct bdi_writeback *wb,
+		   struct bdi_writeback_ctx *bdi_wb_ctx,
+		   struct backing_dev_info *bdi, gfp_t gfp)
 {
 	int err;
 
 	memset(wb, 0, sizeof(*wb));
 
 	wb->bdi = bdi;
-	wb->bdi_wb_ctx = bdi->wb_ctx_arr[0];
+	wb->bdi_wb_ctx = bdi_wb_ctx;
 	wb->last_old_flush = jiffies;
 	INIT_LIST_HEAD(&wb->b_dirty);
 	INIT_LIST_HEAD(&wb->b_io);
@@ -698,7 +699,7 @@ static int cgwb_create(struct backing_dev_info *bdi,
 		goto out_put;
 	}
 
-	ret = wb_init(wb, bdi, gfp);
+	ret = wb_init(wb, bdi_wb_ctx, bdi, gfp);
 	if (ret)
 		goto err_free;
 
@@ -843,7 +844,7 @@ static int cgwb_bdi_init(struct backing_dev_info *bdi)
 		mutex_init(&bdi->cgwb_release_mutex);
 		init_rwsem(&bdi_wb_ctx->wb_switch_rwsem);
 
-		ret = wb_init(&bdi_wb_ctx->wb, bdi, GFP_KERNEL);
+		ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
 		if (!ret) {
 			bdi_wb_ctx->wb.memcg_css = &root_mem_cgroup->css;
 			bdi_wb_ctx->wb.blkcg_css = blkcg_root_css;
@@ -1000,7 +1001,7 @@ static int cgwb_bdi_init(struct backing_dev_info *bdi)
 	for_each_bdi_wb_ctx(bdi, bdi_wb_ctx) {
 		int ret;
 
-		ret = wb_init(&bdi_wb_ctx->wb, bdi, GFP_KERNEL);
+		ret = wb_init(&bdi_wb_ctx->wb, bdi_wb_ctx, bdi, GFP_KERNEL);
 		if (ret)
 			return ret;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
