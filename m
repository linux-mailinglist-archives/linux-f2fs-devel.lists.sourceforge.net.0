Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1CFB7893BBC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  1 Apr 2024 16:06:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rrIIm-0000sk-Ey;
	Mon, 01 Apr 2024 14:06:20 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <prvs=08143c772c=wangzijie1@honor.com>)
 id 1rrIIl-0000sc-Nm for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Apr 2024 14:06:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GGUK1Npp8kgsVWFnmRMXyxkGaZA35gMzVcnLs6UZXdU=; b=jzlErAUaj5IIiFZIOzCru9FpNb
 OFB9bfSCehYJ6raXte0+sARbruyIvIhOFSA+8gK0zMhkr2G5HAiEoA0igNidjBBxn2wmDwzbD4aEG
 diefiOC4TwiL4hYSGQB2L8NxLkxYXQQSfTh6nK86Ssi2CwB55GgwdKEoW+xABJcF//54=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GGUK1Npp8kgsVWFnmRMXyxkGaZA35gMzVcnLs6UZXdU=; b=h
 s/LSgBjs+nLOxv8hUnO+zGcKas+PalfBE5+0mvbUXcLHsA4/YGQf1nRX2mXHdUe5g9syXFiYf0CjY
 qo8gRmOvKP7AGXPz6ifq6iZHLS8xFzrkdmSHpFKmc+TxgIoR34GeHdFXeG4rXKGKFdmnomKBaYDCV
 AlqliNo2jc7n7VfE=;
Received: from mta20.hihonor.com ([81.70.206.69])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rrIIi-0002JX-2B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 01 Apr 2024 14:06:20 +0000
Received: from w011.hihonor.com (unknown [10.68.20.122])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4V7XQf2SNQzYxDsy;
 Mon,  1 Apr 2024 21:48:10 +0800 (CST)
Received: from a006.hihonor.com (10.68.23.242) by w011.hihonor.com
 (10.68.20.122) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 1 Apr
 2024 21:48:20 +0800
Received: from a011.hihonor.com (10.68.31.243) by a006.hihonor.com
 (10.68.23.242) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1258.25; Mon, 1 Apr
 2024 21:48:20 +0800
Received: from a011.hihonor.com ([fe80::78ac:4faf:25dd:3496]) by
 a011.hihonor.com ([fe80::78ac:4faf:25dd:3496%7]) with mapi id 15.02.1258.025; 
 Mon, 1 Apr 2024 21:48:20 +0800
From: wangzijie <wangzijie1@honor.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>
Thread-Topic: [PATCH] [f2fs-dev] f2fs: use f2fs_get_node_page when write
 inline data
Thread-Index: AdqEOdZMrsI3iA2JQyKLGLQGeOfhFw==
Date: Mon, 1 Apr 2024 13:48:20 +0000
Message-ID: <2073e8995f5444aeaf7133b87ec07de8@honor.com>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [10.163.20.97]
MIME-Version: 1.0
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Zijie Wang <wangzijie1@honor.com> Date: Mon, 1 Apr 2024
 21:24:08 +0800 Subject: [PATCH] [f2fs-dev] f2fs: use f2fs_get_node_page when
 write inline data We just need inode page when write inline data,
 use f2fs_get_node_page()
 to get it instead of using dnode_of_data, which can eliminate unnecessary
 struct use. 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [81.70.206.69 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1rrIIi-0002JX-2B
Subject: [f2fs-dev] [PATCH] f2fs: use f2fs_get_node_page when write inline
 data
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
Cc: "wangbintian\(BintianWang\)" <bintian.wang@honor.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Zijie Wang <wangzijie1@honor.com>
Date: Mon, 1 Apr 2024 21:24:08 +0800
Subject: [PATCH] [f2fs-dev] f2fs: use f2fs_get_node_page when write inline data

We just need inode page when write inline data, use
f2fs_get_node_page() to get it instead of using dnode_of_data,
which can eliminate unnecessary struct use.

Signed-off-by: Zijie Wang <wangzijie1@honor.com>
---
 fs/f2fs/inline.c | 23 +++++++++++------------
 1 file changed, 11 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index ac00423f117b..6e20d8e7affc 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -242,33 +242,32 @@ int f2fs_convert_inline_inode(struct inode *inode)
 
 int f2fs_write_inline_data(struct inode *inode, struct page *page)
 {
-	struct dnode_of_data dn;
-	int err;
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct page *ipage;
 
-	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	err = f2fs_get_dnode_of_data(&dn, 0, LOOKUP_NODE);
-	if (err)
-		return err;
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
 
 	if (!f2fs_has_inline_data(inode)) {
-		f2fs_put_dnode(&dn);
+		f2fs_put_page(ipage, 1);
 		return -EAGAIN;
 	}
 
 	f2fs_bug_on(F2FS_I_SB(inode), page->index);
 
-	f2fs_wait_on_page_writeback(dn.inode_page, NODE, true, true);
-	memcpy_from_page(inline_data_addr(inode, dn.inode_page),
+	f2fs_wait_on_page_writeback(ipage, NODE, true, true);
+	memcpy_from_page(inline_data_addr(inode, ipage),
 			 page, 0, MAX_INLINE_DATA(inode));
-	set_page_dirty(dn.inode_page);
+	set_page_dirty(ipage);
 
 	f2fs_clear_page_cache_dirty_tag(page);
 
 	set_inode_flag(inode, FI_APPEND_WRITE);
 	set_inode_flag(inode, FI_DATA_EXIST);
 
-	clear_page_private_inline(dn.inode_page);
-	f2fs_put_dnode(&dn);
+	clear_page_private_inline(ipage);
+	f2fs_put_page(ipage, 1);
 	return 0;
 }
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
