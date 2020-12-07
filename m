Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B6EED2D0CF1
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  7 Dec 2020 10:24:09 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1kmCkY-0002Co-Fq; Mon, 07 Dec 2020 09:24:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jack.qiu@huawei.com>) id 1kmCkS-0002Ao-PU
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:24:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=fd7+ZQSH8qYBbxTeO3zwVM0XhK5jXjk28WnIHHFUoHg=; b=PR7FjzedL0Gb8j+QmVMPH+FYMc
 od4SpMcLx8iJTMPF7/XB420DtGSRTV03uWmeBk7MdRskRoDZwP6vLQXe5ds7E2uujUJVQDNL+g1lG
 QtTrcv0Ada3tXUKxw6LvdbqZgi9wr0rk7W0mrs6By8+561QrmGCy9eL1lRHiI05Iax4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:
 To:From:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=fd7+ZQSH8qYBbxTeO3zwVM0XhK5jXjk28WnIHHFUoHg=; b=KfHMy922ciD8hZOjmz/cwouvbq
 jheN0sdcKTTZvmr6J0HSTLgtwOcFUxoJBCextdO+rZk0tXYScg+pXJ8//S56qDw21XN20Z8mGLPk/
 QeBilPSsFagG1+i9KoHQFojCgbKfhQSt5x5f4SGVloOKP0MD4A0a8evZCYE8fWYvJxQc=;
Received: from szxga04-in.huawei.com ([45.249.212.190])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1kmCkK-0059Gn-PP
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 07 Dec 2020 09:24:00 +0000
Received: from DGGEMS414-HUB.china.huawei.com (unknown [172.30.72.59])
 by szxga04-in.huawei.com (SkyGuard) with ESMTP id 4CqHsr5HnCz15Ydw
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  7 Dec 2020 17:23:12 +0800 (CST)
Received: from huawei.com (10.175.101.6) by DGGEMS414-HUB.china.huawei.com
 (10.3.19.214) with Microsoft SMTP Server id 14.3.487.0; Mon, 7 Dec 2020
 17:23:41 +0800
From: Jack Qiu <jack.qiu@huawei.com>
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Mon, 7 Dec 2020 18:24:07 +0800
Message-ID: <20201207102407.25154-4-jack.qiu@huawei.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201207102407.25154-1-jack.qiu@huawei.com>
References: <20201207102407.25154-1-jack.qiu@huawei.com>
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
X-Headers-End: 1kmCkK-0059Gn-PP
Subject: [f2fs-dev] [PATCH v2 3/3] f2fs: inline: fix wrong inline inode stat
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Miss to stat inline inode in f2fs_recover_inline_data.

Signed-off-by: Jack Qiu <jack.qiu@huawei.com>
---
 fs/f2fs/inline.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 0a8f7eefca7d..c37747f7028c 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -297,6 +297,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 		if (IS_ERR(ipage))
 			return PTR_ERR(ipage);
 		f2fs_truncate_inline_inode(inode, ipage, 0);
+		stat_dec_inline_inode(inode);
 		clear_inode_flag(inode, FI_INLINE_DATA);
 		f2fs_put_page(ipage, 1);
 	} else if (ri && (ri->i_inline & F2FS_INLINE_DATA)) {
@@ -305,6 +306,7 @@ int f2fs_recover_inline_data(struct inode *inode, struct page *npage)
 		ret = f2fs_truncate_blocks(inode, 0, false);
 		if (ret)
 			return ret;
+		stat_inc_inline_inode(inode);
 		goto process_inline;
 	}
 	return 0;
--
2.17.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
