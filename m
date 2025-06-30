Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 37FE8AED922
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 30 Jun 2025 11:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7ITSQnR4y9t9wjRYd78crETXfwuYM950ibFHm6wSuQM=; b=BMEScOQ9LAcb08V9OipsPSd0ii
	0zv9IxXcAGBlFWhU4VKGzNEORr2H2hFNvJu0JSatvXxceoMB0ZzECvjEzWnFJb+JZ3dBHTUacYcUL
	lDWQZeaN9g1votXkaZ4kb9JJUcbxBGIBcLIuhYJ/nNDNpkYJNwBI/aRNUm7Sk7QLcyXI=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uWBFM-00081l-GA;
	Mon, 30 Jun 2025 09:56:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uWBEs-00080h-76
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 09:55:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Pdo2qXwX95QY/xdSVx2Z587vBgfKLCbCO4ndYV3rZPE=; b=GF0dn30fWb2OfjrPTDGAiqtdeR
 kxJo7apl+3dGtOtGYPThjYv/ZlvifZe2+sni8Bo8NAfv3aK0D0LeGN3ak2IiEACNlOE2hMHK01fN0
 4fLRSgkpaGnyM2zbqs3qRBIbo1rjfTPDaxFjH/JN7OR+uPNGcuK/h21LT54n72v43HFA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Pdo2qXwX95QY/xdSVx2Z587vBgfKLCbCO4ndYV3rZPE=; b=fRg/kSovaQirMYcKsYnP4Yeyi/
 h46uHbuuS5QbcrimDDuUBXdKMmvgXwygKrKWaPvlYDgwaDBTg4a8D6Zory9B45gRV3QYwpu2Hv3Jd
 AQk+mnyCsxyHz4cZc0UsKYnR15PAhzeYrnx+i5B8k4aFFtW8AmqQEyTJ4uWVN4zByaos=;
Received: from mta20.honor.com ([81.70.206.69] helo=mta20.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uWBEr-00029j-MQ for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 30 Jun 2025 09:55:50 +0000
Received: from w013.hihonor.com (unknown [10.68.26.19])
 by mta20.hihonor.com (SkyGuard) with ESMTPS id 4bW1fZ2zjvzYmN1Q;
 Mon, 30 Jun 2025 17:52:22 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w013.hihonor.com
 (10.68.26.19) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 17:54:58 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Mon, 30 Jun
 2025 17:54:57 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Mon, 30 Jun 2025 17:54:54 +0800
Message-ID: <20250630095454.3912441-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250630095454.3912441-1-wangzijie1@honor.com>
References: <20250630095454.3912441-1-wangzijie1@honor.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To prevent scattered pin block generation,
 don't allow non-section
 aligned truncation to smaller or equal size on pinned file. But for truncation
 to larger size, after commit 3fdd89b452c2("f2fs: preve [...] 
 Content analysis details:   (0.4 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.4 KHOP_HELO_FCRDNS       Relay HELO differs from its IP's reverse DNS
X-Headers-End: 1uWBEr-00029j-MQ
Subject: [f2fs-dev] [PATCH v5 2/2] f2fs: don't allow unaligned truncation to
 smaller/equal size on pinned file
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
Cc: feng.han@honor.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, wangzijie <wangzijie1@honor.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To prevent scattered pin block generation, don't allow non-section aligned truncation
to smaller or equal size on pinned file. But for truncation to larger size, after
commit 3fdd89b452c2("f2fs: prevent writing without fallocate() for pinned files"),
we only support overwrite IO to pinned file, so we don't need to consider
attr->ia_size > i_size case.
In addition, xfstests #494 assumes truncation on active swapfile(pinned) will return
ETXTBSY by setattr_prepare() -> inode_newsize_ok(), so we relocate this check after
setattr_prepare().

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v5:
- fix xfstests #494 fail
---
 fs/f2fs/file.c | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 78368b793..d4feea44b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1070,6 +1070,23 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (err)
 		return err;
 
+	/*
+	 * To prevent scattered pin block generation, we don't allow
+	 * smaller/equal size unaligned truncation for pinned file.
+	 * We only support overwrite IO to pinned file, so don't
+	 * care about larger size truncation.
+	 * We need to check this after setattr_prepare() because xfstests
+	 * #494 assumes truncation on active swapfile(pinned) will
+	 * return ETXTBSY by setattr_prepare() -> inode_newsize_ok().
+	 */
+	if (attr->ia_valid & ATTR_SIZE) {
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size <= i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+			return -EINVAL;
+	}
+
 	err = fscrypt_prepare_setattr(dentry, attr);
 	if (err)
 		return err;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
