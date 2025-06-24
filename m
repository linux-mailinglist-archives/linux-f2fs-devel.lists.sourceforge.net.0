Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 32DC0AE5AAF
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Jun 2025 06:00:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	List-Subscribe:List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Subject:MIME-Version:References:In-Reply-To:Message-ID:Date:To:From:Sender:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MFHuERywfaK5BCOoTDNTFCDvU0Odsl3iT4Q0lHgCIzQ=; b=GUbUBvu4/oFQx2f7umzCeXbL4h
	4EMAdRdFIgy3UKmuQ0wGibkKlQWg8ksiS0zGh0knVWZpOGclAnNK9lV5ZoySrogcDIHgXYRkt7upn
	YmvrIpwI5sRQ8k+kbyejHuo+0Pn/+D3UbfIyJF+e9cqJUbVK5dtDiEkN7L3M6adU/w+E=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uTupJ-00017X-KM;
	Tue, 24 Jun 2025 04:00:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangzijie1@honor.com>) id 1uTup4-00016V-Ef
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 03:59:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l1ZcQDXvI7Ev/PQpwbZkK/cEsfyIhE+dGx1XnQ8TbhQ=; b=ltSOerTvocKpyTXcCYUWWA9f+9
 1Pez3jDup4IMGCSh5FdUa5K2zf8Zp89s4PaRiK8ChS5OyhcoOUNfxIUgPW45ZrUeGncxYIkSP0FkI
 sPui8Skfd0c3f0MLWfN5ndBBqVtHpGa6RhdaE2ff1e4/PZRc/0ghpl2JtuuWKrF/gTTA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=l1ZcQDXvI7Ev/PQpwbZkK/cEsfyIhE+dGx1XnQ8TbhQ=; b=lu0JKWLnrVIdk0KsGEZ9iOoC0I
 UXqhAnoNgqt6UjVfsVEPqeWb/tIAT86CclUJh7ORWqTSdsTnJg2xhF/FvCcXWHCgvKLkgVHsns6l0
 qk1Z++E6opYg8dpDI9PBhmx3j3QOYpfzUsenBEZ8yxybFaif/Aj/Ar8WYZ66scxvDM4A=;
Received: from mta21.honor.com ([81.70.160.142] helo=mta21.hihonor.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uTup3-0008KE-Mi for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Jun 2025 03:59:50 +0000
Received: from w003.hihonor.com (unknown [10.68.17.88])
 by mta21.hihonor.com (SkyGuard) with ESMTPS id 4bRB3n0cNCzYkxsh;
 Tue, 24 Jun 2025 11:57:25 +0800 (CST)
Received: from a011.hihonor.com (10.68.31.243) by w003.hihonor.com
 (10.68.17.88) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 11:59:41 +0800
Received: from localhost.localdomain (10.144.23.14) by a011.hihonor.com
 (10.68.31.243) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Tue, 24 Jun
 2025 11:59:41 +0800
From: wangzijie <wangzijie1@honor.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 24 Jun 2025 11:59:38 +0800
Message-ID: <20250624035938.3176350-2-wangzijie1@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250624035938.3176350-1-wangzijie1@honor.com>
References: <20250624035938.3176350-1-wangzijie1@honor.com>
MIME-Version: 1.0
X-Originating-IP: [10.144.23.14]
X-ClientProxiedBy: w010.hihonor.com (10.68.28.113) To a011.hihonor.com
 (10.68.31.243)
X-Spam-Score: 0.4 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
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
X-Headers-End: 1uTup3-0008KE-Mi
Subject: [f2fs-dev] [PATCH v4 2/2] f2fs: don't allow unaligned truncation to
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

Signed-off-by: wangzijie <wangzijie1@honor.com>
---
v4:
- convert sbi first and apply change
---
 fs/f2fs/file.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 209f43653..4809f0fd6 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1048,6 +1048,17 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 			!IS_ALIGNED(attr->ia_size,
 			F2FS_BLK_TO_BYTES(fi->i_cluster_size)))
 			return -EINVAL;
+		/*
+		 * To prevent scattered pin block generation, we don't allow
+		 * smaller/equal size unaligned truncation for pinned file.
+		 * We only support overwrite IO to pinned file, so don't
+		 * care about larger size truncation.
+		 */
+		if (f2fs_is_pinned_file(inode) &&
+			attr->ia_size <= i_size_read(inode) &&
+			!IS_ALIGNED(attr->ia_size,
+			F2FS_BLK_TO_BYTES(CAP_BLKS_PER_SEC(sbi))))
+			return -EINVAL;
 	}
 
 	err = setattr_prepare(idmap, dentry, attr);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
