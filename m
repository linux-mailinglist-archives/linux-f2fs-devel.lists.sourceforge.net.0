Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D210606D9B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:23:04 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olhga-0003MG-8M;
	Fri, 21 Oct 2022 02:23:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olhgW-0003Lj-W1
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:22:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dyGVpi/cxfdKsPC0auDFM0qgMAIU47NidVfdyPK5ykE=; b=hJulLIRRGqmruZHZrySmiJCgB9
 mckk67+UtGXEbUN/dOuRclBH2keqFzmjYeNe+s2tJHZyxLoYVRUG2M15esCfcdK/i1c+ene7FN+is
 N+oALU8RoPLkA+96wkUicuJcL/vYc/YA5FC7H36Z6UCUTOEDYwRlPfT+/4Y18jEqAu+8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=dyGVpi/cxfdKsPC0auDFM0qgMAIU47NidVfdyPK5ykE=; b=gRyLpLO0UvTeRuwWi+xuwDjRau
 afKP6elOkmZdKGxZeJ416PAmJhQmv1/i5N5ouj2HWWquX8HHSGRTlO98CSmFJhCr2zlnE1iPPZJzj
 UPLmmTZgd4njtMxUgTnDNAE8uSmUdqBo9ff9sb7ql0rOXCNuIcKC42ZUQDs4mqEI+KlU=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olhgW-0001rt-5R for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:22:56 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtpCN0WmtzHvCB;
 Fri, 21 Oct 2022 10:22:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:40 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:36 +0800
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
Date: Fri, 21 Oct 2022 10:20:52 +0800
Message-ID: <20221021022102.2231464-2-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221021022102.2231464-1-yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: kset_register() is currently used in some places without
 calling
 kset_put() in error path, because the callers think it should be kset internal
 thing to do, but the driver core can not know what calle [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1olhgW-0001rt-5R
Subject: [f2fs-dev] [PATCH 01/11] kset: fix documentation for kset_register()
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
From: Yang Yingliang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yang Yingliang <yangyingliang@huawei.com>
Cc: alexander.deucher@amd.com, richard@nod.at, mst@redhat.com,
 gregkh@linuxfoundation.org, somlo@cmu.edu, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, luben.tuikov@amd.com, jlbec@evilplan.org,
 hsiangkao@linux.alibaba.com, rafael@kernel.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, mark@fasheh.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

kset_register() is currently used in some places without calling
kset_put() in error path, because the callers think it should be
kset internal thing to do, but the driver core can not know what
caller doing with that memory at times. The memory could be freed
both in kset_put() and error path of caller, if it is called in
kset_register().

So make the function documentation more explicit about calling
kset_put() in the error path of caller.

Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 lib/kobject.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/lib/kobject.c b/lib/kobject.c
index a0b2dbfcfa23..6da04353d974 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
 /**
  * kset_register() - Initialize and add a kset.
  * @k: kset.
+ *
+ * If this function returns an error, kset_put() must be called to
+ * properly clean up the memory associated with the object.
  */
 int kset_register(struct kset *k)
 {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
