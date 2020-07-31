Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C6CF233EF9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Jul 2020 08:17:36 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1k1OMF-0005OU-Sx; Fri, 31 Jul 2020 06:17:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <yuyufen@huawei.com>) id 1k1OME-0005ON-D9
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 31 Jul 2020 06:17:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rdvq925GTZgGSWl2nu8DdenxxaIHsG4iOtUOsYOgtjM=; b=afNXwHNaoIWa/qZr0yYh4zXZA/
 KlGx3k9oNjCq+I8AGOqPqk6FG7jZ7mZLD1O7VXyyrifo8XQp+8ytEi70P6R+ec6JP6jqeNz76+ZxX
 5ItaCNkAIEDJTRMEa9AiDMV9lNmPVM+EKIdEsqalehR4bU6cGHtTW1gEYgbsx5wNNqRU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Rdvq925GTZgGSWl2nu8DdenxxaIHsG4iOtUOsYOgtjM=; b=R
 ZFpSml66ex4w7TzifsqgFzJNzR2U65ouvBHU0+B0gCt+S9qBixVjBI79sHTuMxnPtfxsUxuqBDZes
 +4xAKkX/AC9T2JyZh3PVEYnPihu58NxXx/CCuPaP4gU37ygHw0hkPDZTkQZn68SKUZ5uve1jHW9lp
 o/i0yaVH53wB4f3E=;
Received: from szxga05-in.huawei.com ([45.249.212.191] helo=huawei.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1k1OMC-00FZEI-KZ
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 31 Jul 2020 06:17:30 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by Forcepoint Email with ESMTP id E4D80A3D5BB9F914D8C6;
 Fri, 31 Jul 2020 14:17:18 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Fri, 31 Jul 2020
 14:17:17 +0800
From: Yufen Yu <yuyufen@huawei.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 31 Jul 2020 02:18:13 -0400
Message-ID: <20200731061813.3791834-1-yuyufen@huawei.com>
X-Mailer: git-send-email 2.25.4
MIME-Version: 1.0
X-Originating-IP: [10.175.101.6]
X-CFilter-Loop: Reflected
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [45.249.212.191 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1k1OMC-00FZEI-KZ
Subject: [f2fs-dev] [PATCH] f2fs: replace test_and_set/clear_bit() with
 set/clear_bit()
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
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since set/clear_inode_flag() don't need to return value to show
if flag is set, we can just call set/clear_bit() here.

Signed-off-by: Yufen Yu <yuyufen@huawei.com>
---
 fs/f2fs/f2fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b35a50f4953c..4723945626cd 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2649,7 +2649,7 @@ static inline void __mark_inode_dirty_flag(struct inode *inode,
 
 static inline void set_inode_flag(struct inode *inode, int flag)
 {
-	test_and_set_bit(flag, F2FS_I(inode)->flags);
+	set_bit(flag, F2FS_I(inode)->flags);
 	__mark_inode_dirty_flag(inode, flag, true);
 }
 
@@ -2660,7 +2660,7 @@ static inline int is_inode_flag_set(struct inode *inode, int flag)
 
 static inline void clear_inode_flag(struct inode *inode, int flag)
 {
-	test_and_clear_bit(flag, F2FS_I(inode)->flags);
+	clear_bit(flag, F2FS_I(inode)->flags);
 	__mark_inode_dirty_flag(inode, flag, false);
 }
 
-- 
2.25.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
