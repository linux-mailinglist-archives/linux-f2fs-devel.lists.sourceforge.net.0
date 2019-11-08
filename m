Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 82E0EF45B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Nov 2019 12:31:28 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1iT2U7-0006ma-BA; Fri, 08 Nov 2019 11:31:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <stummala@codeaurora.org>) id 1iT2U6-0006mG-2K
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:31:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 MIME-Version:Content-Type:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZzNNsQ5c9TM7d+IZjGjTXCYk41ZZBnW8X6NIN3je2cI=; b=YsOD5QX069S/oihYQ/j6YcvIe4
 NhXOUWEQTm30SRHblKkV52RcY0rSc2w9UY+QDggzjTxd/OFAMh6UqI6BkdtfAIu59pkJWo3FbHqf1
 LSbdXE1INPZw5Yx4krSkhQr53HZRFY/FsJgU7USCou2/F+t0fks9knAhXsDFrZ03wgEo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:MIME-Version:
 Content-Type:Content-Transfer-Encoding:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ZzNNsQ5c9TM7d+IZjGjTXCYk41ZZBnW8X6NIN3je2cI=; b=JTALGFbkV/yASvJJKhGgGOAFKl
 Np+/QivpvvDerW/2bK7IqARJBPIfKc2RHb1NAVc1A97XmSkGeXGXQpSGPKrlVYqNbicFMiSttlnD9
 FNOEEHl4EowdUzwB7APkaj1Z0Gwrt2r2gpZTFxAP/IJBxKhuPTcX448XT4fwSfvcJhYQ=;
Received: from smtp.codeaurora.org ([198.145.29.96])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1iT2U3-006Tka-Ow
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 08 Nov 2019 11:31:22 +0000
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
 id 687A7602BD; Fri,  8 Nov 2019 11:04:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1573211052;
 bh=d85PiEzTKZnD4rW8ooec1lt7MpOUj9J4ixcs+n0zX9I=;
 h=From:To:Cc:Subject:Date:From;
 b=A8NLIWCigNLq8rWL3fhGp8qYpPpfNAQsUDH6Hvor1IKXBZPHwGOhrOidC9+NaUj3Y
 wm8NMY5+5Doi+ApMxd+ZACQjGn4gi08HpKJL/PHWzLWQmPyIbomje1uYeUcuB94hX/
 ESnVYf4t9g/3qAMHPly5aFHlg6d2cAQitpaGXSRE=
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 pdx-caf-mail.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.7 required=2.0 tests=ALL_TRUSTED,BAYES_00,
 DKIM_INVALID,DKIM_SIGNED,SPF_NONE autolearn=no autolearn_force=no
 version=3.4.0
Received: from codeaurora.org
 (blr-c-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.19.19])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
 (No client certificate requested)
 (Authenticated sender: stummala@smtp.codeaurora.org)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id 5021A602BD;
 Fri,  8 Nov 2019 11:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
 s=default; t=1573211050;
 bh=d85PiEzTKZnD4rW8ooec1lt7MpOUj9J4ixcs+n0zX9I=;
 h=From:To:Cc:Subject:Date:From;
 b=GfWqVwQoV9Amr3ZDWp0foiRawDLhM6EebifTzZYdkktLhfYQGun36efBNw3/s58BF
 Y2X2HnRxr7fjM1Yh+rax2UK3bW0Q09eAZPIQ56QOCTlWR9dm5RmZVfnOYeZUin5WYt
 Dm7rjxmKbcgR36Ig1Tg597wOO7kCvFKb7Vt6idyk=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 5021A602BD
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org;
 spf=none smtp.mailfrom=stummala@codeaurora.org
From: Sahitya Tummala <stummala@codeaurora.org>
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <yuchao0@huawei.com>,
 linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  8 Nov 2019 16:33:47 +0530
Message-Id: <1573211027-30785-1-git-send-email-stummala@codeaurora.org>
X-Mailer: git-send-email 1.9.1
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: codeaurora.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1iT2U3-006Tka-Ow
Subject: [f2fs-dev] [PATCH] f2fs: Fix deadlock under storage almost
 full/dirty condition
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
Cc: linux-kernel@vger.kernel.org
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There could be a potential deadlock when the storage capacity
is almost full and theren't enough free segments available, due
to which FG_GC is needed in the atomic commit ioctl as shown in
the below callstack -

schedule_timeout
io_schedule_timeout
congestion_wait
f2fs_drop_inmem_pages_all
f2fs_gc
f2fs_balance_fs
__write_node_page
f2fs_fsync_node_pages
f2fs_do_sync_file
f2fs_ioctl

If this inode doesn't have i_gc_failures[GC_FAILURE_ATOMIC] set,
then it waits forever in f2fs_drop_inmem_pages_all(), for this
atomic inode to be dropped. And the rest of the system is stuck
waiting for sbi->gc_mutex lock, which is acquired by f2fs_balance_fs()
in the stack above.

Signed-off-by: Sahitya Tummala <stummala@codeaurora.org>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index da830fc..335ec09 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -300,7 +300,8 @@ void f2fs_drop_inmem_pages_all(struct f2fs_sb_info *sbi, bool gc_failure)
 
 	if (inode) {
 		if (gc_failure) {
-			if (fi->i_gc_failures[GC_FAILURE_ATOMIC])
+			if (fi->i_gc_failures[GC_FAILURE_ATOMIC] ||
+				F2FS_I(inode)->inmem_task == current)
 				goto drop;
 			goto skip;
 		}
-- 
Qualcomm India Private Limited, on behalf of Qualcomm Innovation Center, Inc.
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum, a Linux Foundation Collaborative Project.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
