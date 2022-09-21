Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 009305BF858
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Sep 2022 09:54:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oauYe-0005x3-L7;
	Wed, 21 Sep 2022 07:54:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zhangqilong3@huawei.com>) id 1oauYX-0005wt-Nf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 07:54:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kEbB861awV/dE20IdOL150JHpv+Y7FlMiLM0a7wfpt4=; b=Q37olw/6N8cijcLbTVzxH1VuEk
 0Oi/n8Y9v3iBN/1ww31spaWIbjSiju9sRehoGZZlnNS285llTN/TP6vWoj+eCzHldnYY4wrpxIlwV
 gviavVg3FRVQgC9WedJPCyRFnaPbofYszdCL1fe7xBmpWZGib3UJnwOAHcLN4MrZWWZw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kEbB861awV/dE20IdOL150JHpv+Y7FlMiLM0a7wfpt4=; b=H
 jSqwMdlsIt5IBRm3jOu8jaykrsftuU5kaEVfH5+DnoUsMmMt9YjnICUED3PYfeDxK6ZYH+1FizVlg
 PeF7x5sX7N12thucM5oX7BCh3gOOM1orRoeCs3cELEgOlbZYrXXk+7uDXdAW8uTvcq8fggIeN/P4v
 FNDjtsj3LySw5nZ0=;
Received: from szxga01-in.huawei.com ([45.249.212.187])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oauYh-0004gZ-JJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Sep 2022 07:54:18 +0000
Received: from dggemv703-chm.china.huawei.com (unknown [172.30.72.54])
 by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4MXVtw0cj9zlWm1;
 Wed, 21 Sep 2022 15:50:00 +0800 (CST)
Received: from kwepemm600014.china.huawei.com (7.193.23.54) by
 dggemv703-chm.china.huawei.com (10.3.19.46) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Wed, 21 Sep 2022 15:54:07 +0800
Received: from huawei.com (10.90.53.225) by kwepemm600014.china.huawei.com
 (7.193.23.54) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2375.31; Wed, 21 Sep
 2022 15:54:06 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 21 Sep 2022 15:57:33 +0800
Message-ID: <20220921075737.36708-1-zhangqilong3@huawei.com>
X-Mailer: git-send-email 2.26.0.106.g9fadedd
MIME-Version: 1.0
X-Originating-IP: [10.90.53.225]
X-ClientProxiedBy: dggems704-chm.china.huawei.com (10.3.19.181) To
 kwepemm600014.china.huawei.com (7.193.23.54)
X-CFilter-Loop: Reflected
X-Spam-Score: -2.3 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For readonly format image,
 we first rebuild the code of updating
 extent, and then support caching extent for no-compressed file. Its idea
 is almost same with original design. At last we remove the lim [...] 
 Content analysis details:   (-2.3 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [45.249.212.187 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
X-Headers-End: 1oauYh-0004gZ-JJ
Subject: [f2fs-dev] [PATCH -next 0/4] rebuild compressed extent and support
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

For readonly format image, we first rebuild the code of updating
extent, and then support caching extent for no-compressed file.
Its idea is almost same with original design. At last we remove
the limit for no-compressed file that enable it use extent.

Zhang Qilong (4):
  f2fs: rebuild compressed extent cache update code for readonly-fs
  f2fs: extent cache: support extent for no-compressed file
  f2fs: rename f2fs_update_extent_tree_range_compressed
  f2fs: remove the limit and no-compressed file could use extent

 fs/f2fs/compress.c     | 24 -------------
 fs/f2fs/extent_cache.c | 80 ++++++++++++++++++++++++++++++++++++++++--
 fs/f2fs/f2fs.h         | 11 ++----
 fs/f2fs/node.c         | 20 ++---------
 4 files changed, 83 insertions(+), 52 deletions(-)

-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
