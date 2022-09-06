Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 437F95AEDA8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  6 Sep 2022 16:50:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oVZuJ-000562-T0;
	Tue, 06 Sep 2022 14:50:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oVZuI-00055u-Fz
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 14:50:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1b4xvSwc28HsiZCnnBnmGSRFKQlDXoqjK+kDt0CPOxA=; b=Mwhc0biB8Dggx9YN8SdvzWjRTH
 Vj/CryaKBs88it9MQPWh1oYrbNhrVsp3qrTXGxNvTcKqhLHxXFJ0Z8tDbFeDKfl5t76F9nZK+hn3S
 XqD1wnCvNnVQP4GRIMaAmguN1Mn8lPlc96x/lYrJlck9//cXl6bbIcYgoKfV6u107rmc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1b4xvSwc28HsiZCnnBnmGSRFKQlDXoqjK+kDt0CPOxA=; b=Ktu5aNcTtqKSDZ2A53n+62bdDy
 mliy6Zphf+E7oHlTKzEwhVt3DjiSwIKRFuwGXsC3jvuIrSRG2yfEKU+aPVJcByQFCxJJwVWjy58bv
 JbBJe12ap2S+O5uLJZNFIDvKGAKlwAk20PIqX1LEjyNEk8x87XUn5bDnyrCN2E2KvjBI=;
Received: from szxga03-in.huawei.com ([45.249.212.189])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oVZuE-0003I5-V0 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 06 Sep 2022 14:50:30 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.56])
 by szxga03-in.huawei.com (SkyGuard) with ESMTP id 4MMStY42LVzrS2B;
 Tue,  6 Sep 2022 22:48:21 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.24; Tue, 6 Sep 2022 22:50:15 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.24; Tue, 6 Sep
 2022 22:50:14 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 6 Sep 2022 22:53:47 +0800
Message-ID: <20220906145347.87915-2-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
In-Reply-To: <20220906145347.87915-1-zhangqilong3@huawei.com>
References: <20220906145347.87915-1-zhangqilong3@huawei.com>
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems703-chm.china.huawei.com (10.3.19.180) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: We can start freeing cluster page(s) from which compression
 is not used. It will get better performance. Signed-off-by: Zhang Qilong
 <zhangqilong3@huawei.com> --- fs/f2fs/compress.c | 4 +--- 1 file changed,
 1 insertion(+), 3 deletions(-) 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.189 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1oVZuE-0003I5-V0
Subject: [f2fs-dev] [PATCH -next] f2fs:start freeing cluster pages from the
 unused number
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
From: Zhang Qilong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhang Qilong <zhangqilong3@huawei.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

We can start freeing cluster page(s) from which compression
is not used. It will get better performance.

Signed-off-by: Zhang Qilong <zhangqilong3@huawei.com>
---
 fs/f2fs/compress.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/fs/f2fs/compress.c b/fs/f2fs/compress.c
index 6baaff4c52ba..a2d02a1848a2 100644
--- a/fs/f2fs/compress.c
+++ b/fs/f2fs/compress.c
@@ -693,9 +693,7 @@ static int f2fs_compress_pages(struct compress_ctx *cc)
 	vm_unmap_ram(cc->cbuf, cc->nr_cpages);
 	vm_unmap_ram(cc->rbuf, cc->cluster_size);
 
-	for (i = 0; i < cc->nr_cpages; i++) {
-		if (i < new_nr_cpages)
-			continue;
+	for (i = new_nr_cpages; i < cc->nr_cpages; i++) {
 		f2fs_compress_free_page(cc->cpages[i]);
 		cc->cpages[i] = NULL;
 	}
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
