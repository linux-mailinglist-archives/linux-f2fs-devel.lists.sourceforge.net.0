Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C19F31CA9
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  1 Jun 2019 15:23:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1hX3ys-0003kf-03; Sat, 01 Jun 2019 13:23:30 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1hX3yr-0003kJ-Bo
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:23:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6zDu8pq+H3cUd9o5w7HWnDeVMNSFjb+N2P5NmMZBPPg=; b=HYYghS379Fm07yTQ4cuSmJhpwD
 LO7JibP0FtqCeuiPDmAs1Z3yl4h+77xrD2loaSCp56pCtjiGgM2bRQgNH15AnFWm2/ZLqxKwmxYWJ
 RozlsASExX/nYDhV/0te2aMuLnAdZbLt5RO8rq2Kq14eXDBAG4sSOtp9tuOy27N/rNq4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6zDu8pq+H3cUd9o5w7HWnDeVMNSFjb+N2P5NmMZBPPg=; b=T3BGcYByI3INYGCm9k1MhuHYON
 TT0Q5mqsC1VRrkXwh1FEcYAAeSDmN5BBMguxQKGbIlJw5W8S4etwRbTQ5GRHFmJ90rZotGq0ToyiQ
 0/eKSdFjM4fcZ+IaIAz04B6Od672KcJehtQJkVsSUnGs1Heubpz6TYN6pBDtOjal//4I=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-3.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 id 1hX3yp-00EcSQ-Ve
 for linux-f2fs-devel@lists.sourceforge.net; Sat, 01 Jun 2019 13:23:29 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id B6CD82735D;
 Sat,  1 Jun 2019 13:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1559395402;
 bh=k17Lp8xMMs48wQry6d4ecDUX9+JEYa7cX8OlwhMb2Qo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=Arhvi7UQWi9fNoXEkzWJqzGTWVZp9GYETd/QT3w2knTM56jXPNK2YfYTGDt9WfFvL
 Q79BAGC/tiEqIEXsUL3e5EK1ZyDMz+aKF/2tTrPAEwEC/ni89jrRrSp0/vABQaK9hf
 CHhvRFozIKKm7UgJLGGno2IN2nXILzrcpmT9MY5k=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Sat,  1 Jun 2019 09:20:18 -0400
Message-Id: <20190601132158.25821-42-sashal@kernel.org>
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
X-Headers-End: 1hX3yp-00EcSQ-Ve
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 042/141] f2fs: fix to do checksum
 even if inode page is uptodate
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

[ Upstream commit b42b179bda9ff11075a6fc2bac4d9e400513679a ]

As Jungyeon reported in bugzilla:

https://bugzilla.kernel.org/show_bug.cgi?id=203221

- Overview
When mounting the attached crafted image and running program, this error is reported.

The image is intentionally fuzzed from a normal f2fs image for testing and I enabled option CONFIG_F2FS_CHECK_FS on.

- Reproduces
cc poc_07.c
mkdir test
mount -t f2fs tmp.img test
cp a.out test
cd test
sudo ./a.out

- Messages
 kernel BUG at fs/f2fs/node.c:1279!
 RIP: 0010:read_node_page+0xcf/0xf0
 Call Trace:
  __get_node_page+0x6b/0x2f0
  f2fs_iget+0x8f/0xdf0
  f2fs_lookup+0x136/0x320
  __lookup_slow+0x92/0x140
  lookup_slow+0x30/0x50
  walk_component+0x1c1/0x350
  path_lookupat+0x62/0x200
  filename_lookup+0xb3/0x1a0
  do_fchmodat+0x3e/0xa0
  __x64_sys_chmod+0x12/0x20
  do_syscall_64+0x43/0xf0
  entry_SYSCALL_64_after_hwframe+0x44/0xa9

On below paths, we can have opportunity to readahead inode page
- gc_node_segment -> f2fs_ra_node_page
- gc_data_segment -> f2fs_ra_node_page
- f2fs_fill_dentries -> f2fs_ra_node_page

Unlike synchronized read, on readahead path, we can set page uptodate
before verifying page's checksum, then read_node_page() will trigger
kernel panic once it encounters a uptodated page w/ incorrect checksum.

So considering readahead scenario, we have to do checksum each time
when loading inode page even if it is uptodated.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/inode.c | 4 ++--
 fs/f2fs/node.c  | 7 ++++---
 2 files changed, 6 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/inode.c b/fs/f2fs/inode.c
index fae9570e6860e..0f31df01e36c6 100644
--- a/fs/f2fs/inode.c
+++ b/fs/f2fs/inode.c
@@ -179,8 +179,8 @@ bool f2fs_inode_chksum_verify(struct f2fs_sb_info *sbi, struct page *page)
 
 	if (provided != calculated)
 		f2fs_msg(sbi->sb, KERN_WARNING,
-			"checksum invalid, ino = %x, %x vs. %x",
-			ino_of_node(page), provided, calculated);
+			"checksum invalid, nid = %lu, ino_of_node = %x, %x vs. %x",
+			page->index, ino_of_node(page), provided, calculated);
 
 	return provided == calculated;
 }
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index 34c3f732601c3..e2d9edad758cd 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1282,9 +1282,10 @@ static int read_node_page(struct page *page, int op_flags)
 	int err;
 
 	if (PageUptodate(page)) {
-#ifdef CONFIG_F2FS_CHECK_FS
-		f2fs_bug_on(sbi, !f2fs_inode_chksum_verify(sbi, page));
-#endif
+		if (!f2fs_inode_chksum_verify(sbi, page)) {
+			ClearPageUptodate(page);
+			return -EBADMSG;
+		}
 		return LOCKED_PAGE;
 	}
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
