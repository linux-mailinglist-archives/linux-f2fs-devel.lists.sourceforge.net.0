Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4237335DBFE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Apr 2021 11:57:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lWFnM-00052N-GF; Tue, 13 Apr 2021 09:57:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuchao0@huawei.com>) id 1lWFnK-00052G-VK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 09:57:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rv8wT0ga653Wgb0OdTPegLRoViRgIOjtrVoav2J6kck=; b=V5IOolyPWbpnFkUn4mbCRN2zyc
 NlJAay5+aNqXboIZyI2I6tO5GCHrx0BK0qBRiqEvvcV2yWMMl4kbE/infqJDD67Nt1nvSqndjEE98
 4OEUCjsDf+IKM3F5wmFjWK93JiF7AVDhofyeKXoaDcGMd34CAzjdl7P0ynkKqtlO1560=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rv8wT0ga653Wgb0OdTPegLRoViRgIOjtrVoav2J6kck=; b=X
 ZnFxn9tJAppTFqpPtxMMwb5DfBdn5kfkfBEYA7WV+OtBpCnVJO1uQ6WljKmIZxx+mp7sKe6URxSbf
 FKiUXuWm5UVC+626UkP7pdHhjq8mqwQxRYbAnJ/wy52Nv/N1PZyM8C4ChTDEtO5KP4mjKNWAIXNBL
 gmhZtZf6PPsPkwQo=;
Received: from szxga06-in.huawei.com ([45.249.212.32])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lWFnJ-00F4oW-LK
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 13 Apr 2021 09:57:19 +0000
Received: from DGGEMS404-HUB.china.huawei.com (unknown [172.30.72.60])
 by szxga06-in.huawei.com (SkyGuard) with ESMTP id 4FKLZH0QPdzlXjF;
 Tue, 13 Apr 2021 17:55:19 +0800 (CST)
Received: from szvp000203569.huawei.com (10.120.216.130) by
 DGGEMS404-HUB.china.huawei.com (10.3.19.204) with Microsoft SMTP Server id
 14.3.498.0; Tue, 13 Apr 2021 17:57:01 +0800
From: Chao Yu <yuchao0@huawei.com>
To: <jaegeuk@kernel.org>
Date: Tue, 13 Apr 2021 17:56:53 +0800
Message-ID: <20210413095653.28231-1-yuchao0@huawei.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
X-Originating-IP: [10.120.216.130]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [45.249.212.32 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1lWFnJ-00F4oW-LK
Subject: [f2fs-dev] [PATCH] f2fs: document: add description about compressed
 space handling
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

User or developer may still be confused about why f2fs doesn't expose
compressed space to userspace, add description about compressed space
handling policy into f2fs documentation.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
---
 Documentation/filesystems/f2fs.rst | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 63c0c49b726d..992bf91eeec8 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -819,6 +819,14 @@ Compression implementation
   * chattr +c file
   * chattr +c dir; touch dir/file
   * mount w/ -o compress_extension=ext; touch file.ext
+  * mount w/ -o compress_extension=*; touch any_file
+
+- At this point, compression feature doesn't expose compressed space to user
+  directly in order to guarantee potential data updates later to the space.
+  Instead, the main goal is to reduce data writes to flash disk as much as
+  possible, resulting in extending disk life time as well as relaxing IO
+  congestion. Alternatively, we've added ioctl interface to reclaim compressed
+  space and show it to user after putting the immutable bit.
 
 Compress metadata layout::
 
-- 
2.29.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
