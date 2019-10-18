Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 882EADD1BA
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 19 Oct 2019 00:05:53 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iLaNc-0005gx-Cy; Fri, 18 Oct 2019 22:05:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <sashal@kernel.org>) id 1iLaNb-0005gH-0z
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 22:05:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iwYf+Bp2TPzYBSsSwmivwBOfArOuj4L4iMJ6uU7WMbA=; b=VZzXzZHskw3LdzliyRx2x33Agn
 vz+3/5i8ruSzZlKXaaVMvkudwcrvYlKWpfXxe/+V9g98q8z/6b/SCVfE8rTbaU2orOmGUnLGRQxXw
 NBcDm4foJ4tAuqyiGRCRT9IOc8s7ZEIAviozkNwj7yg0YPtPQMkfwJhnKKIiJAITxEys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iwYf+Bp2TPzYBSsSwmivwBOfArOuj4L4iMJ6uU7WMbA=; b=egtY4s+pQletJtbQuR9r5pujkl
 7DZ24N6KfIIcXHHVIOmmc1k0b7wVD3Mgrmd7Xfjt5CQAyYB1GU3xjTf/XfMi0H47SmnBtsD9ruhG7
 1VCXBFNJ039dxuiEDI0IGcfGWH2sSDaqfrTLtIR+7mimA93Hg6V9j4O7cmkeVzbn0Cig=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iLaNW-00DrXq-Th
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 18 Oct 2019 22:05:50 +0000
Received: from sasha-vm.mshome.net (c-73-47-72-35.hsd1.nh.comcast.net
 [73.47.72.35])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mail.kernel.org (Postfix) with ESMTPSA id 95D2B2245D;
 Fri, 18 Oct 2019 22:05:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=default; t=1571436336;
 bh=iSuchusAehub8/OSSTazSzsq4ZRiyFsHmrWUsdoSclw=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=laPB7R6wUcwUOPXyfRB/T8Q5RNFXyYsfYoQYs0gPEVsSQziQtKOmUnfRtBhlMoVUR
 i3DXhlM6AJ9pXfuCOyQM/c+Yps1waat+LlttuVysz1KsMnK4mbDazPHIMciLzzBw31
 nP5wr7JdkI11NaCxSyVUg5gdGnycStS+XgDO7Pdg=
From: Sasha Levin <sashal@kernel.org>
To: linux-kernel@vger.kernel.org,
	stable@vger.kernel.org
Date: Fri, 18 Oct 2019 18:03:52 -0400
Message-Id: <20191018220525.9042-7-sashal@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191018220525.9042-1-sashal@kernel.org>
References: <20191018220525.9042-1-sashal@kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-Spam-Score: -0.4 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - Whitelisted High sender
 -0.3 AWL AWL: Adjusted score from AWL reputation of From: address
X-Headers-End: 1iLaNW-00DrXq-Th
Subject: [f2fs-dev] [PATCH AUTOSEL 4.19 007/100] f2fs: fix to recover
 inode->i_flags of inode block during POR
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

[ Upstream commit 0c093b590efb5c1ccdc835868dc2ae94bd2e14dc ]

Testcase to reproduce this bug:
1. mkfs.f2fs /dev/sdd
2. mount -t f2fs /dev/sdd /mnt/f2fs
3. touch /mnt/f2fs/file
4. sync
5. chattr +a /mnt/f2fs/file
6. xfs_io -a /mnt/f2fs/file -c "fsync"
7. godown /mnt/f2fs
8. umount /mnt/f2fs
9. mount -t f2fs /dev/sdd /mnt/f2fs
10. xfs_io /mnt/f2fs/file

There is no error when opening this file w/o O_APPEND, but actually,
we expect the correct result should be:

/mnt/f2fs/file: Operation not permitted

The root cause is, in recover_inode(), we recover inode->i_flags more
than F2FS_I(inode)->i_flags, so fix it.

Signed-off-by: Chao Yu <yuchao0@huawei.com>
Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
 fs/f2fs/recovery.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 281ba46b5b359..2c3be4c3c626f 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -226,6 +226,7 @@ static void recover_inode(struct inode *inode, struct page *page)
 
 	F2FS_I(inode)->i_advise = raw->i_advise;
 	F2FS_I(inode)->i_flags = le32_to_cpu(raw->i_flags);
+	f2fs_set_inode_flags(inode);
 	F2FS_I(inode)->i_gc_failures[GC_FAILURE_PIN] =
 				le16_to_cpu(raw->i_gc_failures);
 
-- 
2.20.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
