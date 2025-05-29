Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B1A7AC7D81
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 29 May 2025 13:59:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:References:MIME-Version:In-Reply-To:Message-Id:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jGdbn3Xgp/cKqN4ZQAN+Y35naUSlouLF62pbsZ5YA8Y=; b=c6GWcxWwiw4wUcTMst9SqqFBFA
	/QEyl3UD1FZTGhipIRZm6xSjZFymQ1kz+xi52M2DvAEvuritNCdFUURBMKf17BuGDcDwHRH38fTm1
	xjInb8OOm15VoU3RxfByaBzU5Miqcau+keV/rRySnwPbAtafmG/d7cwTkLSbOCkJezwE=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uKbv1-0001fa-DV;
	Thu, 29 May 2025 11:59:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <kundan.kumar@samsung.com>) id 1uKbuz-0001fU-SW
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5UKmqLXR0SIvc4dfCdeb83oafI/Njtr5UdFaODU7FB8=; b=cWoxKo4XHjGQ731Vut+rOm3R1J
 8edd2lV64hq+2KWJAX2FtGWCgJj5eXqeHGi/mbU9M8lS7xPXDjkFJodFZ2GWzID0MgOBNqBq785hD
 UpQJbS2vAoadPfp0pk4n2h6PrmoalIjpVW+Mf2dMg2FL/Zk9fptGVU3PMw9gyDpqkNr4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5UKmqLXR0SIvc4dfCdeb83oafI/Njtr5UdFaODU7FB8=; b=QK3Dvv5Cvd2bz0xm6BO8BrG/2l
 8y9SOSuBUwGZBiOW31a8+JY2PKrj8An26X3DUCF7H/MTqRbAqw6QMIsoSwmdgFyInb8a/lYBtafzn
 PMFryx0PLz6+OWZAFe1Z/PNzoEJ0+TYgQ18NRTCfm7GoBKz6OyarqpZio9bdbjy9BcAY=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uKbux-0002Ts-TU for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 29 May 2025 11:59:28 +0000
Received: from epcas5p3.samsung.com (unknown [182.195.41.41])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20250529113418epoutp02be0fbc07add5bba9db20ae0c3d33f4a1~D-EYRc3WW2407724077epoutp02W
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 29 May 2025 11:34:18 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20250529113418epoutp02be0fbc07add5bba9db20ae0c3d33f4a1~D-EYRc3WW2407724077epoutp02W
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1748518458;
 bh=5UKmqLXR0SIvc4dfCdeb83oafI/Njtr5UdFaODU7FB8=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=qFu2RBvNXHWNmiq01V1MxikIMwpwRLJDr99QjFrNaJle0RwlD47xRGi73FOWrTqUU
 +O9QGnz3eG+0v8rRxXuSFyTWWV4s1KrPxU3XWjqMpIuL8GgyjVV8mADambr26uqOMS
 6ttAJRXZfcuBtqZdCgt7zSEueb8zo1I78m1nH6oY=
Received: from epsnrtp01.localdomain (unknown [182.195.42.153]) by
 epcas5p4.samsung.com (KnoxPortal) with ESMTPS id
 20250529113417epcas5p4913bfcdebcbf40173aa088f75116ecc8~D-EXr8ISM1596915969epcas5p4A;
 Thu, 29 May 2025 11:34:17 +0000 (GMT)
Received: from epcas5p2.samsung.com (unknown [182.195.38.175]) by
 epsnrtp01.localdomain (Postfix) with ESMTP id 4b7PQw1Fqdz6B9m5; Thu, 29 May
 2025 11:34:16 +0000 (GMT)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas5p3.samsung.com (KnoxPortal) with ESMTPA id
 20250529113311epcas5p3c8f1785b34680481e2126fda3ab51ad9~D-DZugUHF0980809808epcas5p3Y;
 Thu, 29 May 2025 11:33:11 +0000 (GMT)
Received: from epsmgmcp1.samsung.com (unknown [182.195.42.82]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20250529113310epsmtrp24c693352404dc8921ffaebdb46d76e3c~D-DZoI3zJ3201832018epsmtrp2U;
 Thu, 29 May 2025 11:33:10 +0000 (GMT)
X-AuditID: b6c32a52-41dfa70000004c16-96-683845f61a79
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgmcp1.samsung.com (Symantec Messaging Gateway) with SMTP id
 80.A2.19478.6F548386; Thu, 29 May 2025 20:33:10 +0900 (KST)
Received: from localhost.localdomain (unknown [107.99.41.245]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20250529113306epsmtip27b8bc9c2fd5f4139f51a8dda75df7888~D-DVgb9KP2456924569epsmtip2m;
 Thu, 29 May 2025 11:33:06 +0000 (GMT)
From: Kundan Kumar <kundan.kumar@samsung.com>
To: jaegeuk@kernel.org, chao@kernel.org, viro@zeniv.linux.org.uk,
 brauner@kernel.org, jack@suse.cz, miklos@szeredi.hu, agruenba@redhat.com,
 trondmy@kernel.org, anna@kernel.org, akpm@linux-foundation.org,
 willy@infradead.org, mcgrof@kernel.org, clm@meta.com, david@fromorbit.com,
 amir73il@gmail.com, axboe@kernel.dk, hch@lst.de, ritesh.list@gmail.com,
 djwong@kernel.org, dave@stgolabs.net, p.raghav@samsung.com,
 da.gomez@samsung.com
Date: Thu, 29 May 2025 16:45:04 +0530
Message-Id: <20250529111504.89912-14-kundan.kumar@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250529111504.89912-1-kundan.kumar@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrKIsWRmVeSWpSXmKPExsWy7bCSvO43V4sMg0nLDS22rdvNbjFn/Ro2
 iwvrVjNatO78z2LRNOEvs8Xqu/1sFq8Pf2K0OD31LJPFlkv2Fu8vb2OyWH1zDaPFlmP3GC0u
 P+Gz2D39H6vFzQM7mSxWrj7KZDF7ejOTxZP1s5gttn75ympxaZG7xZ69J1ks7q35z2px4cBp
 VosbE54yWjzbvZHZ4vPSFnaLg6c62C0+zQUacv7vcVaL3z/msDnIeZxaJOGxc9Zddo/NK7Q8
 Lp8t9di0qpPNY9OnSeweJ2b8ZvF4sXkmo8fuBZ+ZPHbfbGDzOHexwuP9vqtsHn1bVjF6TJ1d
 73FmwRF2jxXTLjIFCEVx2aSk5mSWpRbp2yVwZVy+q11wja1iZe9RlgbGo6xdjJwcEgImEq+v
 fGDqYuTiEBLYzijxYeUzZoiEjMTuuzuhioQlVv57zg5R9JFR4tqKiWxdjBwcbAK6Ej+aQkHi
 IgI3mSXOnT0D1sAs8I9RYvcrHRBbWCBG4uz6RjYQm0VAVWL28RtgNbwCdhJNZ19CLZOXmHnp
 OzuIzQkUX7TkKyOILSRgK7H05loWiHpBiZMzn7BAzJeXaN46m3kCo8AsJKlZSFILGJlWMYqm
 FhTnpucmFxjqFSfmFpfmpesl5+duYgSnBK2gHYzL1v/VO8TIxMF4iFGCg1lJhLfJ3ixDiDcl
 sbIqtSg/vqg0J7X4EKM0B4uSOK9yTmeKkEB6YklqdmpqQWoRTJaJg1OqgSn3nsKHdUEZXB3/
 31+61rnj3FbLW0wfYp0aEl+cOzgrpXP/vyyBDMZFqwIuXN4T1fzt47t21nnG6oI6273rj1/U
 DW/rWWKvP+PuUY7HZw8dW9YTcfFDntJn+4dPrB4ahc88cSpSZMnVutsmAT5Zn+/E6i38t85q
 W3z45H+s4TfU+Rb16/942v1BvFkr7qNY7JmNH57aqPPyvP5krnZAe/ZryUeV199mzU00bf08
 +4BReOTT+l1+f6fZZqr/6n5ZqvZXd2rr/+KA5zktbmcndev81jXurtj4hW257O7dDE3u5yaL
 lR6QbkxOftwuv7UvXT9tzes9allf/UOMNVNSjP5skMiP6rI45q7YVKbMOUWJpTgj0VCLuag4
 EQASq0MleAMAAA==
X-CMS-MailID: 20250529113311epcas5p3c8f1785b34680481e2126fda3ab51ad9
X-Msg-Generator: CA
X-Sendblock-Type: REQ_APPROVE
CMS-TYPE: 105P
cpgsPolicy: CPGSC10-542,Y
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20250529113311epcas5p3c8f1785b34680481e2126fda3ab51ad9
References: <20250529111504.89912-1-kundan.kumar@samsung.com>
 <CGME20250529113311epcas5p3c8f1785b34680481e2126fda3ab51ad9@epcas5p3.samsung.com>
X-Headers-End: 1uKbux-0002Ts-TU
Subject: [f2fs-dev] [PATCH 13/13] writeback: set the num of writeback
 contexts to number of online cpus
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

We create N number of writeback contexts, N = number of online cpus. The
inodes gets distributed across different writeback contexts, enabling
parallel writeback.

Signed-off-by: Kundan Kumar <kundan.kumar@samsung.com>
Signed-off-by: Anuj Gupta <anuj20.g@samsung.com>
---
 mm/backing-dev.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/backing-dev.c b/mm/backing-dev.c
index d416122e2914..55c07c9be4cd 100644
--- a/mm/backing-dev.c
+++ b/mm/backing-dev.c
@@ -1046,7 +1046,7 @@ int bdi_init(struct backing_dev_info *bdi)
 	bdi->min_ratio = 0;
 	bdi->max_ratio = 100 * BDI_RATIO_SCALE;
 	bdi->max_prop_frac = FPROP_FRAC_BASE;
-	bdi->nr_wb_ctx = 1;
+	bdi->nr_wb_ctx = num_online_cpus();
 	bdi->wb_ctx_arr = kcalloc(bdi->nr_wb_ctx,
 				  sizeof(struct bdi_writeback_ctx *),
 				  GFP_KERNEL);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
