Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C81860A517
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 14:20:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1omwRa-000858-PC;
	Mon, 24 Oct 2022 12:20:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1omwRZ-00084z-Uk
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 12:20:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h7exAZDWjbRIFFeWx1JcKusldiDakMz3AN/pwrODSNE=; b=iDhKS0E9mTO09udypYNJk/j8JH
 PS/gM0mGxf79DZZF0DvXZuZhVy9Wn2lbQWhxb9Jr9u6gHE4A/wqQqu3Xy96lEikqfLFqvMqD1+hxL
 prooxkOoj5GZQ32S+nDaxBYRCLlq70aHPaEovyI3OAp4rFQ9C0un2ngf5MfMP65TRQP0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h7exAZDWjbRIFFeWx1JcKusldiDakMz3AN/pwrODSNE=; b=Q
 UhcrYNR6Wvo1QJsKZEyo5b+j67423M4e9soOH8Q+Ksf/otxIMf149YYVvK1ybLMk42Y7N4MXE9XPZ
 xSoLTeFHR0U0KNBIwB4vHbcchGgRE1sFP3RhLvAPt7aTSTEfbPgHPMt4viMk2UhcqYjW0xsDc26RQ
 9b4B4xwmz/qKIzgk=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1omwRU-0004e4-Km for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 12:20:37 +0000
Received: from dggpemm500023.china.huawei.com (unknown [172.30.72.53])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MwvD90QZGzVhmf;
 Mon, 24 Oct 2022 20:15:37 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500023.china.huawei.com (7.185.36.83) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Mon, 24 Oct 2022 20:20:21 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Mon, 24 Oct
 2022 20:20:20 +0800
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
Date: Mon, 24 Oct 2022 20:19:10 +0800
Message-ID: <20221024121910.1169801-1-yangyingliang@huawei.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Originating-IP: [10.175.103.91]
X-ClientProxiedBy: dggems702-chm.china.huawei.com (10.3.19.179) To
 dggpemm500007.china.huawei.com (7.185.36.183)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Inject fault while loading module, kset_register() may fail.
 If it fails, the name allocated by kobject_set_name() which is called before
 kset_register() is leaked, because refcount of kobject is hold [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.188 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1omwRU-0004e4-Km
Subject: [f2fs-dev] [PATCH v2] kset: fix memory leak when kset_register()
 returns error
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

Inject fault while loading module, kset_register() may fail.
If it fails, the name allocated by kobject_set_name() which
is called before kset_register() is leaked, because refcount
of kobject is hold in kset_init().

As a kset may be embedded in a larger structure which needs
be freed in release() function or error path in callers, we
can not call kset_put() in kset_register(), or it will cause
double free, so just call kfree_const() to free the name and
set it to NULL.

With this fix, the callers don't need to care about the name
freeing and call an extra kset_put() if kset_register() fails.

Suggested-by: Luben Tuikov <luben.tuikov@amd.com>
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
v1 -> v2:
  Free name inside of kset_register() instead of calling kset_put()
  in drivers.
---
 lib/kobject.c | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/lib/kobject.c b/lib/kobject.c
index a0b2dbfcfa23..3409a89c81e5 100644
--- a/lib/kobject.c
+++ b/lib/kobject.c
@@ -834,6 +834,9 @@ EXPORT_SYMBOL_GPL(kobj_sysfs_ops);
 /**
  * kset_register() - Initialize and add a kset.
  * @k: kset.
+ *
+ * NOTE: On error, the kset.kobj.name allocated by() kobj_set_name()
+ * which is called before kset_register() in caller need be freed.
  */
 int kset_register(struct kset *k)
 {
@@ -844,8 +847,11 @@ int kset_register(struct kset *k)
 
 	kset_init(k);
 	err = kobject_add_internal(&k->kobj);
-	if (err)
+	if (err) {
+		kfree_const(k->kobj.name);
+		k->kobj.name = NULL;
 		return err;
+	}
 	kobject_uevent(&k->kobj, KOBJ_ADD);
 	return 0;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
