Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F42B606D94
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 04:23:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olhgZ-0003M8-TE;
	Fri, 21 Oct 2022 02:22:59 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <yangyingliang@huawei.com>) id 1olhgW-0003Li-Vy
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:22:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=anE6kFKk4KL8osB9HOW0knNDcuVxgwcI8Ym8jD8Lx2Y=; b=cb0BP+r06csqoA4aMxn8xjsRYu
 RRt7ddEomgTAOezMaiDX1rs7cdlzf17m25B8noViJn5onGBxS2bge8yltRVPreJnOC1ldCxtzpxoY
 LQBPJ1jX8KP5csBn+5431rVvyLgqUUyvFgpSJpF7yCVKN8vfuLUa8RvxYHS6LHHXQdCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=anE6kFKk4KL8osB9HOW0knNDcuVxgwcI8Ym8jD8Lx2Y=; b=eDVczbik9Y+Bifg+16bDDktKQ5
 55EEwOL5VdrBf6xVJgisnFaRkB6jcYaAk7Z0W8Xsuy9w81WjgvdkFSC21LACwgsaX8+ROuCPcHoQX
 lJACA+a0/nxfJYyKRRXlEKEA3AIbYdccJlWxZzfd9qkyDemTOliJkxrUmN8d0tHamhJY=;
Received: from szxga02-in.huawei.com ([45.249.212.188])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olhgW-0001rw-4q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 02:22:56 +0000
Received: from dggpemm500022.china.huawei.com (unknown [172.30.72.57])
 by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4MtpCN18FmzHvCF;
 Fri, 21 Oct 2022 10:22:40 +0800 (CST)
Received: from dggpemm500007.china.huawei.com (7.185.36.183) by
 dggpemm500022.china.huawei.com (7.185.36.162) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Fri, 21 Oct 2022 10:22:44 +0800
Received: from huawei.com (10.175.103.91) by dggpemm500007.china.huawei.com
 (7.185.36.183) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Fri, 21 Oct
 2022 10:22:43 +0800
To: <linux-kernel@vger.kernel.org>, <qemu-devel@nongnu.org>,
 <linux-f2fs-devel@lists.sourceforge.net>, <linux-erofs@lists.ozlabs.org>,
 <ocfs2-devel@oss.oracle.com>, <linux-mtd@lists.infradead.org>,
 <amd-gfx@lists.freedesktop.org>
Date: Fri, 21 Oct 2022 10:20:59 +0800
Message-ID: <20221021022102.2231464-9-yangyingliang@huawei.com>
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
X-Headers-End: 1olhgW-0001rw-4q
Subject: [f2fs-dev] [PATCH 08/11] erofs: fix possible memory leak in
 erofs_init_sysfs()
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

unreferenced object 0xffff888101d228c0 (size 8):
  comm "modprobe", pid 276, jiffies 4294722700 (age 13.151s)
  hex dump (first 8 bytes):
    65 72 6f 66 73 00 ff ff                          erofs...
  backtrace:
    [<00000000e2a9a4a6>] __kmalloc_node_track_caller+0x44/0x1b0
    [<00000000b8ce02de>] kstrdup+0x3a/0x70
    [<000000004a0e01d2>] kstrdup_const+0x63/0x80
    [<00000000051b6cda>] kvasprintf_const+0x149/0x180
    [<000000004dc51dad>] kobject_set_name_vargs+0x56/0x150
    [<00000000b30f0bad>] kobject_set_name+0xab/0xe0

Fixes: 168e9a76200c ("erofs: add sysfs interface")
Signed-off-by: Yang Yingliang <yangyingliang@huawei.com>
---
 fs/erofs/sysfs.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/erofs/sysfs.c b/fs/erofs/sysfs.c
index 783bb7b21b51..653b35001bc5 100644
--- a/fs/erofs/sysfs.c
+++ b/fs/erofs/sysfs.c
@@ -254,8 +254,10 @@ int __init erofs_init_sysfs(void)
 	kobject_set_name(&erofs_root.kobj, "erofs");
 	erofs_root.kobj.parent = fs_kobj;
 	ret = kset_register(&erofs_root);
-	if (ret)
+	if (ret) {
+		kset_put(&erofs_root);
 		goto root_err;
+	}
 
 	ret = kobject_init_and_add(&erofs_feat, &erofs_feat_ktype,
 				   NULL, "features");
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
