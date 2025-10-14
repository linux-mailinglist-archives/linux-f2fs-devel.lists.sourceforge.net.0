Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4F666BD9436
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 14 Oct 2025 14:11:41 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4sE8sJKox3uD03C1Q+9fmeSoOZT7ax5KGAuO0WNZyjE=; b=IjHfkWZk50AI82/maFeM2bpcSt
	Z0//fTqxryE6oFQg8K7QudmWn2koc3yB3aiUNozvSs2vCOCDRlBk2MXPV6sFVVBpbWBWcsIcU6EZH
	1APJT9A7+7yt8m6eBRNmkar8yjqtSC7u7Y7JRQyi4fSXNWIpMfkv39eJw70EAUls+J5w=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v8dsS-0000m1-2b;
	Tue, 14 Oct 2025 12:11:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1v8dsP-0000la-3l
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dwBpUXQfG7i2fALdF6f1q8XsBcwMf2eGmUyV9zrLQHw=; b=YGGsQKm/epZQXMCt7Ab8PrpzDn
 XP5cvP+SGrTLxZhi+dcA1Xd8vlxoT3BtCWGdHJ8oOXXGCoZv8xJOzujrexJNujctPj9dPx665INpX
 KBdTza9d1VsQSF1hYC0y0DItF0fouroK5QiqyeeteY1Njoirr3aOKv4WKJ7bWMg6AFPo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dwBpUXQfG7i2fALdF6f1q8XsBcwMf2eGmUyV9zrLQHw=; b=TU9GkM45J9yQ8ai/9nISNOrC+k
 y/hp5Y5j1s2vzWulnst4Wkh5YP6Z6CQWCoHpZvLq6vZ6c+NJ2BPuUnddzK/f4xnPslswqLASAKnRW
 q7arN0mPDuDnq7QO7+bEHFWtecmz72RCOo6kIf2QfvEX1P0SJ//OSPsd+eKpqvbWNEds=;
Received: from mailout1.samsung.com ([203.254.224.24])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v8dsO-0001Pr-1i for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 14 Oct 2025 12:11:36 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout1.samsung.com (KnoxPortal) with ESMTP id
 20251014121124epoutp018ce62b7d28237ab4b656738b5d452016~uWmK5NzxM1200012000epoutp01D
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 14 Oct 2025 12:11:24 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.samsung.com
 20251014121124epoutp018ce62b7d28237ab4b656738b5d452016~uWmK5NzxM1200012000epoutp01D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1760443884;
 bh=dwBpUXQfG7i2fALdF6f1q8XsBcwMf2eGmUyV9zrLQHw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=HU1owRttA0sQRI1Z9TN9qM1ddUI4JJUFuaaQzl2wcJbmMM5rTkBDDZ0WzFIKMxaAA
 lI7GVfJew83fPS3YuYz7LV8eeCqvzI/jXQ+gvJ3c86LtMJFJmokaLIg8Z3HghP5TQW
 m569xP+4XDE2j2xY3S6/UNvzDpn6pRUL9ISvshKE=
Received: from epsnrtp04.localdomain (unknown [182.195.42.156]) by
 epcas5p1.samsung.com (KnoxPortal) with ESMTPS id
 20251014121123epcas5p1330df23fc6e704bfe3dacd803c760035~uWmKOQOu51962519625epcas5p1O;
 Tue, 14 Oct 2025 12:11:23 +0000 (GMT)
Received: from epcas5p1.samsung.com (unknown [182.195.38.94]) by
 epsnrtp04.localdomain (Postfix) with ESMTP id 4cmCk256b3z6B9m5; Tue, 14 Oct
 2025 12:11:22 +0000 (GMT)
Received: from epsmtip1.samsung.com (unknown [182.195.34.30]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20251014121122epcas5p3a01a79d090c3cca8caaf78c0f411e4c4~uWmIzFnPN0753207532epcas5p3L;
 Tue, 14 Oct 2025 12:11:22 +0000 (GMT)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20251014121118epsmtip14e669bdfec98f1f53a760340393d0778~uWmE96OG51256112561epsmtip1K;
 Tue, 14 Oct 2025 12:11:17 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, wangyufei@vivo.com
Date: Tue, 14 Oct 2025 17:38:42 +0530
Message-Id: <20251014120845.2361-14-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251014120845.2361-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-CMS-MailID: 20251014121122epcas5p3a01a79d090c3cca8caaf78c0f411e4c4
X-Msg-Generator: CA
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20251014121122epcas5p3a01a79d090c3cca8caaf78c0f411e4c4
References: <20251014120845.2361-1-kundan.kumar@samsung.com>
 <CGME20251014121122epcas5p3a01a79d090c3cca8caaf78c0f411e4c4@epcas5p3.samsung.com>
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The number of writeback contexts can be configured, with a
 valid range between 0 and the number of online CPUs. Inodes are then
 distributed
 across these contexts, enabling parallel writeback. Signed-off-by: Kundan
 Kumar <kundan.kumar@samsung.com> Signed-off-by: Anuj Gupta
 <anuj20.g@samsung.com>
 --- mm/backing-dev.c | 6 ++++++ 1 file changed, 6 insertions(+) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.24 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v8dsO-0001Pr-1i
Subject: [f2fs-dev] [PATCH v2 13/16] writeback: configure the num of
 writeback contexts between 0 and number of online cpus
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
Cc: linux-nfs@vger.kernel.org, gost.dev@samsung.com, anuj20.g@samsung.com,
 vishak.g@samsung.com, linux-f2fs-devel@lists.sourceforge.net,
 gfs2@lists.linux.dev, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org,
 kundan.kumar@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The number of writeback contexts can be configured, with a valid range
between 0 and the number of online CPUs. Inodes are then distributed
across these contexts, enabling parallel writeback.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 mm/backing-dev.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index 0a772d984ecf..0a3204a3a3a3 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1046,6 +1046,12 @@ int bdi_init(struct backing_dev_info *bdi)
 	bdi->min_ratio = 0;
 	bdi->max_ratio = 100 * BDI_RATIO_SCALE;
 	bdi->max_prop_frac = FPROP_FRAC_BASE;
+
+	/*
+	 * User can configure nr_wb_ctx using the newly introduced sysfs knob.
+	 * echo N > /sys/class/bdi/<maj>:<min>/nwritebacks
+	 * Filesystem can also increase same during mount.
+	 */
 	bdi->nr_wb_ctx = 1;
 	bdi->wb_ctx = kcalloc(bdi->nr_wb_ctx,
 				  sizeof(struct bdi_writeback_ctx *),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
