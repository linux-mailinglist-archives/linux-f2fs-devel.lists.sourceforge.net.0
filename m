Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 91DA1606D8F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:22:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olhgW-0003LT-Im;
	Fri, 21 Oct 2022 02:22:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olhgU-0003LI-RU
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:22:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=WSEXmwx0N4x8ur/qaN3uPQl5/rYkkcR4UAdgcwqWvX0=; b=S3199BLAH4vtHik34JXkRllTRi
 KYK4XEcroxSd3lMkRM4J3dBHLOS9SufaWqnTtAg6NXgUswpz7x68SXsIC+IGbYplSLtcpi0wZXY3v
 whsdgvsAnX44L+6KzsXfk/W/oeM2Fe0uW3+KNr6Lia1O+UnyHRMFaO1D9rC7aT0wnxQY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=WSEXmwx0N4x8ur/qaN3uPQl5/rYkkcR4UAdgcwqWvX0=; b=IqO2fW7rdGnlxNSdUsligTXP7i
 Ro8PO/ye4JfS/Zt/XDPvn9vXxi/Fnym5OGlK+xjY5bL3Z6w3jO7CHjcBowrL3NGILw2+nGNZqqIWT
 XBOTn5xs6k+e7R+vr1isabi/Pt3fHMbEhs/WVJ62hlv7jyhP1FifxDJY6xg42FHzTIeg=;
Received: from szxga08-in.huawei.com ([45.249.212.255])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olhgP-0001rd-GR for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:22:53 +0000
Received: from dggpemm500024.china.huawei.com (unknown [172.30.72.57])
 by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4Mtp5w3XNvz1P7D4;
 Fri, 21 Oct 2022 10:17:56 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500024.china.huawei.com (7.185.36.203) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:42 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:41 +0800
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
Date: Fri, 21 Oct 2022 10:20:57 +0800
Message-ID: <20221021022102.2231464-7-yangyingliang@huawei.com>
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
 allocated in kobject_set_name() is leaked. To fix this by calling [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.255 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1olhgP-0001rd-GR
Subject: [f2fs-dev] [PATCH 06/11] firmware: qemu_fw_cfg: fix possible memory
 leak in fw_cfg_build_symlink()
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

Inject fault while loading module, kset_register() may fail, if
it fails, but the refcount of kobject is not decreased to 0, the
name allocated in kobject_set_name() is leaked. To fix this by
calling kset_put(), so that name can be freed in callback function
kobject_cleanup() and 'subdir' is freed in kset_release().

unreferenced object 0xffff88810ad69050 (size 8):
  comm "swapper/0", pid 1, jiffies 4294677178 (age 38.812s)
  hex dump (first 8 bytes):
    65 74 63 00 81 88 ff ff                          etc.....
  backtrace:
    [<00000000a80c7bf1>] __kmalloc_node_track_caller+0x44/0x1b0
    [<000000003f0167c7>] kstrdup+0x3a/0x70
    [<0000000049336709>] kstrdup_const+0x41/0x60
    [<00000000175616e4>] kvasprintf_const+0xf5/0x180
    [<000000004bcc30f7>] kobject_set_name_vargs+0x56/0x150
    [<000000004b0251bd>] kobject_set_name+0xab/0xe0
    [<00000000700151fb>] fw_cfg_sysfs_probe+0xa5b/0x1320

Fixes: 246c46ebaeae ("firmware: create directory hierarchy for sysfs fw_cfg entries")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 drivers/firmware/qemu_fw_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/firmware/qemu_fw_cfg.c b/drivers/firmware/qemu_fw_cfg.c
index a69399a6b7c0..d036e69cabbb 100644
--- a/drivers/firmware/qemu_fw_cfg.c
+++ b/drivers/firmware/qemu_fw_cfg.c
@@ -544,7 +544,7 @@ static int fw_cfg_build_symlink(struct kset *dir,
 			}
 			ret = kset_register(subdir);
 			if (ret) {
-				kfree(subdir);
+				kset_put(subdir);
 				break;
 			}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
