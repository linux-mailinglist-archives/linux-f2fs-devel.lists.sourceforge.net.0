Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 309FD31CA7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:23:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3yq-0001Dt-T0; Sat, 01 Jun 2019 13:23:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3yp-0001Dg-CZ
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:23:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=m3KpwA0S9Kpag2yRABm5wg+RQujTIZC0jDFEf9sCHos=; b=TSlkbC9vXtsbg1zG60pu7j26wk
 venKPmakKLsTlVVIvXtB+vyFYEugqPm8+zSL6jJxsLa2GqGdjw2A8yi63/Zv/I6NPoCW43sbLQOOR
 6vyNLgwu8S0en/U60ClPSjFubmko+gEb+TlIXuKBUkrjq2IjBFZLaxpfC2mpHVJAXLg8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=m3KpwA0S9Kpag2yRABm5wg+RQujTIZC0jDFEf9sCHos=; b=dYrb3UYJkA+2KIoUYQDg2OIwWU
 VU9Qetf489Qxa3tiOAmFrQYA8NQNM63S994IVSmaOtVkVT/ZMcRiwNRS30D/o233JM5yn7MUd7Qmw
 gt8qK5hz1uiDaEFNH5xWyecKVZRFM6pcPZHlqIdB5EQdJ29mm/ZX2Ci39tjHpU0RE7ks=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3yo-00ECZ2-6b
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:23:27 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 8F58A27357;
 Sat,  1 Jun 2019 13:23:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395400;
 bh=Alw0lthfCLmtbgTfq7jRYqausoeIl0hgDtrnSur8zhs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=hp4cRQ1NB9mu2T2Pg8OFkplQ8dUVNqVzbo7aCFURKMW5ZqnJ6LoNFBO7G908HfgGY
 PfCWF6XpSQxdczDYRkpgJLNpriK43TTvClXb3B1ORhvgBXFIdeugM1Jrw+sGnNmoCv
 nScT5/E0JZcrJJ0dOtRnpypV2nsP0DCtx+FyNd4c=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:20:16 -0400
Message-Id: <20190601132158.25821-40-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601132158.25821-1-sashal@kernel.org>
References: <20190601132158.25821-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.3 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: huawei.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 T_DKIMWL_WL_HIGH       DKIMwl.org - Whitelisted High sender
 -0.2 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1hX3yo-00ECZ2-6b
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 040/141] f2fs: fix to use inline
 space only if inline_xattr is enable
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
Cc: Sasha Levin <sashal@kernel.org>, Jaegeuk Kim <jaegeuk@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Chao Yu <yuchao0@huawei.com>

[ Upstream commit 622927f3b8809206f6da54a6a7ed4df1a7770fce ]

With below mkfs and mount option:

MKFS_OPTIONS  -- -O extra_attr -O project_quota -O inode_checksum -O flexible_inline_xattr -O inode_crtime -f
MOUNT_OPTIONS -- -o noinline_xattr

We may miss xattr data with below testcase:
- mkdir dir
- setfattr -n "user.name" -v 0 dir
- for ((i = 0; i < 190; i++)) do touch dir/$i; done
- umount
- mount
- getfattr -n "user.name" dir

user.name: No such attribute

The root cause is that we persist xattr data into reserved inline xattr
space, even if inline_xattr is not enable in inline directory inode, after
inline dentry conversion, reserved space no longer exists, so that xattr
data missed.

Let's use inline xattr space only if inline_xattr flag is set on inode
to fix this iusse.

Fixes: 6afc662e68b5 ("f2fs: support flexible inline xattr size")
Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/f2fs.h | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 1f3bf039a90e8..51eea636719a2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -2486,7 +2486,9 @@ static inline void *inline_xattr_addr(struct inode *inode, struct page *page)
 
 static inline int inline_xattr_size(struct inode *inode)
 {
-	return get_inline_xattr_addrs(inode) * sizeof(__le32);
+	if (f2fs_has_inline_xattr(inode))
+		return get_inline_xattr_addrs(inode) * sizeof(__le32);
+	return 0;
 }
 
 static inline int f2fs_has_inline_data(struct inode *inode)
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
