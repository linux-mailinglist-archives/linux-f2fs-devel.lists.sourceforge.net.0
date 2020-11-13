Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3042D2B146A
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Nov 2020 03:47:15 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kdP78-0005wh-2V; Fri, 13 Nov 2020 02:47:02 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <koulihong@huawei.com>) id 1kdP76-0005wM-BB
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 02:47:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=R6qMYEMLy0etosWz87Irv4oxRjmVNCHN5HYbGL3H3ik=; b=FEyY7kcuzCNbe8/3/xNFYOhYRb
 OcKT5GdkRBbPe4NlC39a9LRIljGYfTg+0rHeXfwVL3G16Ku/P//dqVwy/q4kOo5xp/GA0a2sB4zts
 IXBLtVV6bBnradAK8+rOwTqL3We5whDwPSGHKhhU4rpBfIcfFQLmvIMNni1I4kWZX39Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=R6qMYEMLy0etosWz87Irv4oxRjmVNCHN5HYbGL3H3ik=; b=F
 sn0uThpVjMA+yobSFkcAys2gTtPrwtvYWWUTyCvsOaztm5qwlC3pm7ai/4p6z4H8KML34XeCyDXS1
 FP9m00Dky3mrwHqov3QKrAhuKrk8orwIuv980IOGfY7lgwSHGlx+vrFFNGEWkGTYjw6A470jxfdIG
 JV6LKf1o6W+rM4ws=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kdP6t-009zlA-CE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 13 Nov 2020 02:47:00 +0000
Received: from DGGEMS411-HUB.china.huawei.com (unknown [172.30.72.58])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CXNC2593szkh27;
 Fri, 13 Nov 2020 10:46:22 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS411-HUB.china.huawei.com
 (10.3.19.211) with Microsoft SMTP Server id 14.3.487.0; Fri, 13 Nov 2020
 10:46:30 +0800
From: Lihong Kou <koulihong@huawei.com>
To: <yuchao0@huawei.com>, <jaegeuk@kernel.org>
Date: Fri, 13 Nov 2020 11:43:48 +0800
Message-ID: <20201113034348.12131-1-koulihong@huawei.com>
X-Mailer: git-send-email 2.17.1
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
 [45.249.212.190 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1kdP6t-009zlA-CE
Subject: [f2fs-dev] [PATCH] f2fs: fix the bug in f2fs_direct_IO with inline
 encryption
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

Now we have inline encrytion and fs layer encrption in the kernel, when we
choose inline encryption, we should not use bufferd IO instead of direct IO.

Signed-off-by: Lihong Kou <koulihong@huawei.com>
---
 fs/f2fs/f2fs.h | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index cb700d797296..ccc5c9734f55 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3889,8 +3889,8 @@ static inline void f2fs_set_encrypted_inode(struct inode *inode)
  */
 static inline bool f2fs_post_read_required(struct inode *inode)
 {
-	return f2fs_encrypted_file(inode) || fsverity_active(inode) ||
-		f2fs_compressed_file(inode);
+	return (f2fs_encrypted_file(inode) && fscrypt_inode_uses_fs_layer_crypto(inode))
+		|| fsverity_active(inode) || f2fs_compressed_file(inode);
 }
 
 /*
-- 
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
