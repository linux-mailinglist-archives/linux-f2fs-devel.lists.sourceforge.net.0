Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EE09431C64
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:21:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3wx-00011s-Nh; Sat, 01 Jun 2019 13:21:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3ww-00011i-9K
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2ox9E03lQKECfZmVeJSUyNix0n3awAI5Q0RxW1Xnqqs=; b=ByweML2qe00qqN8xvpTb9Ga7PK
 fTSv3whDpPDkqewZW8UmUxv3Ag7bRVATJlOsugTTWozZXJAE+i0LUKXzQo6/yVPk5o12eYHXSNeSX
 IXw/fGq/youuUUAiXx3xJHU84Qrs/IS75EY8AKkM15i8ULEcqQqyvQxA8DAFr8owy1W8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=2ox9E03lQKECfZmVeJSUyNix0n3awAI5Q0RxW1Xnqqs=; b=YUeNA4GyQk+K2T7Ecti0pSp95y
 tHjixCMBVCBsWdJBCDZWDrFV6D58+hKamLKds92Y+vh+gwy1S3XcKoEopApOZ3mD6bBuA5Ewz+TOs
 eLkm65HogZwonQRUZ7hxkp8WfIyZshwc0DLf24Lq+nUGfEe3fiFSDeVDFzIHvdiuGuTA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3wv-00EcGf-0h
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:21:30 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 438E527305;
 Sat,  1 Jun 2019 13:21:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395281;
 bh=jZhpcsnD6zOHBf7EioI2IaK5Nlroh8tY7lDaqqFF4z4=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=KHGxM0idEKYJachfsQyUDYEB53A4K3rmQ1iKLvuRDOyvsLclM0ptaf/Vg9WnJOaFB
 pwQpQhxEnYf8QIRQYtprsPd4FQcKtea1WbVIwN4BUDHVUuG9rHqfFNlplVcQNkY0Q/
 xLIFnFvlkwmJ8wdgLqaVouX2xr0f1F1pSi3fJfx4=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:17:17 -0400
Message-Id: <20190601131934.25053-45-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190601131934.25053-1-sashal@kernel.org>
References: <20190601131934.25053-1-sashal@kernel.org>
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
X-Headers-End: 1hX3wv-00EcGf-0h
Subject: [f2fs-dev] [PATCH AUTOSEL 5.0 045/173] f2fs: fix to clear dirty
 inode in error path of f2fs_iget()
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

[ Upstream commit 546d22f070d64a7b96f57c93333772085d3a5e6d ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203217

- Overview
When mounting the attached crafted image and running program, I got this error.
Additionally, it hangs on sync after running the program.

The image is intentionally fuzzed from a normal f2fs image for testing and I enabled option CONFIG_F2FS_CHECK_FS on.

- Reproduces
cc poc_test_05.c
mkdir test
mount -t f2fs tmp.img test
sudo ./a.out
sync

- Messages
 kernel BUG at fs/f2fs/inode.c:707!
 RIP: 0010:f2fs_evict_inode+0x33f/0x3a0
 Call Trace:
  evict+0xba/0x180
  f2fs_iget+0x598/0xdf0
  f2fs_lookup+0x136/0x320
  __lookup_slow+0x92/0x140
  lookup_slow+0x30/0x50
  walk_component+0x1c1/0x350
  path_lookupat+0x62/0x200
  filename_lookup+0xb3/0x1a0
  do_readlinkat+0x56/0x110
  __x64_sys_readlink+0x16/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

During inode loading, __recover_inline_status() can recovery inode status
and set inode dirty, once we failed in following process, it will fail
the check in f2fs_evict_inode, result in trigger BUG_ON().

Let's clear dirty inode in error path of f2fs_iget() to avoid panic.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inode.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index bec52961630b9..8c8d40e07ebaf 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -473,6 +473,7 @@ struct inode *f2fs_iget(struct super_block *sb, unsigned long ino)
 	return inode;
 
 bad_inode:
+	f2fs_inode_synced(inode);
 	iget_failed(inode);
 	trace_f2fs_iget_exit(inode, ret);
 	return ERR_PTR(ret);
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
