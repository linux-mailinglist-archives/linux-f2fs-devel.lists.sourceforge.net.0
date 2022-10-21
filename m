Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E56606DA5
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:23:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olhgz-0001hJ-EF;
	Fri, 21 Oct 2022 02:23:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olhgx-0001h2-Qc
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:23:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xzMFxLeFKUbQzHCjgeZFy2Z3JsN/mOjM/Yn4m8OkMjM=; b=MXCOGGcX5aoGigg21N6VS4IHSR
 vqYp99er+MeB2RlokEf2tPUCdJKEdQmMvrrjWd2A4jX7jvv+q16Vd4jn9Z/aPhax35SdEMTqwuzSS
 1wMwn6tmQAWwJDZ393EBGhAP+m2HMeR633ihVpprVdrnDhTLUxf63RytPTve4tMttbNA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xzMFxLeFKUbQzHCjgeZFy2Z3JsN/mOjM/Yn4m8OkMjM=; b=HpTh5Fn7kzAWOH+fjub4dKJX5V
 /i80/axsfS2OndGx+NdKK5i0D6u22F7FgZ/SWXM3pJWvtFI+v0KaUAdbGFLr+L9Et/kyYaczP0aIM
 8H7lO0bSkcUGtoB7t5756etMguEwyvBeGmGQcveKoIxUcH7easRhs2RWvtxy9ez5itSo=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olhgx-0001ta-4W for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:23:23 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4Mtp6h64dWzVj27;
 Fri, 21 Oct 2022 10:18:36 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:45 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:44 +0800
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
Date: Fri, 21 Oct 2022 10:21:00 +0800
Message-ID: <20221021022102.2231464-10-yangyingliang@huawei.com>
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
 Content preview:  Inject fault while loading module, kset_register() may fail, 
 if it fails, but the refcount of kobject is not decreased to 0, the name
 allocated in kobject_set_name() is leaked. Fix this by calling kse [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1olhgx-0001ta-4W
Subject: [f2fs-dev] [PATCH 09/11] ocfs2: possible memory leak in
 mlog_sys_init()
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

Inject fault while loading module, kset_register() may fail,
if it fails, but the refcount of kobject is not decreased to
0, the name allocated in kobject_set_name() is leaked. Fix
this by calling kset_put(), so that name can be freed in
callback function kobject_cleanup().

unreferenced object 0xffff888100da9348 (size 8):
  comm "modprobe", pid 257, jiffies 4294701096 (age 33.334s)
  hex dump (first 8 bytes):
    6c 6f 67 6d 61 73 6b 00                          logmask.
  backtrace:
    [<00000000306e441c>] __kmalloc_node_track_caller+0x44/0x1b0
    [<000000007c491a9e>] kstrdup+0x3a/0x70
    [<0000000015719a3b>] kstrdup_const+0x63/0x80
    [<0000000084e458ea>] kvasprintf_const+0x149/0x180
    [<0000000091302b42>] kobject_set_name_vargs+0x56/0x150
    [<000000005f48eeac>] kobject_set_name+0xab/0xe0

Fixes: 34980ca8faeb ("Drivers: clean up direct setting of the name of a kset")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 fs/ocfs2/cluster/masklog.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/fs/ocfs2/cluster/masklog.c b/fs/ocfs2/cluster/masklog.c
index 563881ddbf00..7f9ba816d955 100644
--- a/fs/ocfs2/cluster/masklog.c
+++ b/fs/ocfs2/cluster/masklog.c
@@ -156,6 +156,7 @@ static struct kset mlog_kset = {
 int mlog_sys_init(struct kset *o2cb_kset)
 {
 	int i = 0;
+	int ret;
 
 	while (mlog_attrs[i].attr.mode) {
 		mlog_default_attrs[i] = &mlog_attrs[i].attr;
@@ -165,7 +166,11 @@ int mlog_sys_init(struct kset *o2cb_kset)
 
 	kobject_set_name(&mlog_kset.kobj, "logmask");
 	mlog_kset.kobj.kset = o2cb_kset;
-	return kset_register(&mlog_kset);
+	ret = kset_register(&mlog_kset);
+	if (ret)
+		kset_put(&mlog_kset);
+
+	return ret;
 }
 
 void mlog_sys_shutdown(void)
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
