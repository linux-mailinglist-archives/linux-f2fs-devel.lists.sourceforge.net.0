Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B5B332BA35
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  3 Mar 2021 20:28:45 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lHXAk-0004ml-Ex; Wed, 03 Mar 2021 19:28:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jaegeuk@kernel.org>) id 1lHXAj-0004ma-9w
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Mar 2021 19:28:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=In-Reply-To:Content-Type:MIME-Version:References:
 Message-ID:Subject:To:From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4p66JKbgaafykou5y4TLlXeDyf+4dJR6mJMc9OFCAsE=; b=DmIHeNTWghUSs9iqcXeXH8BS1z
 7Vtmqq/QIYMXRsJcDIVkbYdy1SXMcyOUtnNbu09cnB5iyH5oot+hj2QSGC2fuyk1Ig4to1mjiAwyZ
 FMQ0yRurBtfWZHHugeMdxcRSgsViOn/kF/fBi8R5t+qbkxSuYfTEwGM3hR/eb5wNaPQM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=In-Reply-To:Content-Type:MIME-Version:References:Message-ID:Subject:To:
 From:Date:Sender:Reply-To:Cc:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=4p66JKbgaafykou5y4TLlXeDyf+4dJR6mJMc9OFCAsE=; b=Oqst7JsUPjJrwVIUdRSJHtn6Ls
 mfjrGLRcc8XlaHnR+4jM4zrHrvTYXKnsUXcOX34dHxm+nqNPfiBoEQXo6nWxXrlg/h/Sitf88ehHq
 KxohXy3GwmJ4G7ijeWDaBsrDgxOKfW/iCYhOKr7bftq+7b42QAESP6Po+zd1GDiVMQBA=;
Received: from mail.kernel.org ([198.145.29.99])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lHXAa-0003Zt-1H
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 03 Mar 2021 19:28:37 +0000
Received: by mail.kernel.org (Postfix) with ESMTPSA id D73E264EF0;
 Wed,  3 Mar 2021 19:28:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1614799696;
 bh=8Ra0AMNh+KuCsZP9ZA7+W5cqVDNHMmMwTZByG6847LQ=;
 h=Date:From:To:Subject:References:In-Reply-To:From;
 b=aCdQ2lhI4R9ZSpnrwjYno/GIfUoYO1enl4eBCq7vBku02IvLiXfv9MSMJUQe5QYqP
 YsWHU5/eYaz8oV6qFTAu5aXuS7pqp672gmBL+LLZYSl8p54wZ5Pm/TyzGmpDZhqtuf
 yoGC1EXWp4h4MMrdlr0nfX8laVYhPAVOEjEt3r5XI7RfHslg2fhvOqHYn1Kf6g/1vA
 6l03ZXNEfiiFUWLiuTjZ7gGlAxA7/dM/hjyd1W34bLDWcWSn4O1RYT3QUHXH+J05D6
 zL/mp4zek9wWs7DF5tYAMXsoClH/ULKW0G+WsA+M8pYjJ3tnTLZYXhSQfdlx++gBl/
 hq9oYfSu/m9BA==
Date: Wed, 3 Mar 2021 11:28:14 -0800
From: Jaegeuk Kim <jaegeuk@kernel.org>
To: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 kernel-team@android.com
Message-ID: <YD/jTtjVqDklvoof@google.com>
References: <20210302054233.3886681-1-jaegeuk@kernel.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210302054233.3886681-1-jaegeuk@kernel.org>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lHXAa-0003Zt-1H
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: expose # of overprivision segments
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

This is useful when checking conditions during checkpoint=disable in Android.

Signed-off-by: Jaegeuk Kim <jaegeuk@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 5 +++++
 fs/f2fs/sysfs.c                         | 9 +++++++++
 2 files changed, 14 insertions(+)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9fa5a528cc23..4aa8f38b52d7 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -409,3 +409,8 @@ Description:	Give a way to change checkpoint merge daemon's io priority.
 		I/O priority "3". We can select the class between "rt" and "be",
 		and set the I/O priority within valid range of it. "," delimiter
 		is necessary in between I/O class and priority number.
+
+What:		/sys/fs/f2fs/<disk>/ovp_segments
+Date:		March 2021
+Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
+Description:	Shows the number of overprovision segments.
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index e38a7f6921dd..0c391ab2d8b7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -91,6 +91,13 @@ static ssize_t free_segments_show(struct f2fs_attr *a,
 			(unsigned long long)(free_segments(sbi)));
 }
 
+static ssize_t ovp_segments_show(struct f2fs_attr *a,
+		struct f2fs_sb_info *sbi, char *buf)
+{
+	return sprintf(buf, "%llu\n",
+			(unsigned long long)(overprovision_segments(sbi)));
+}
+
 static ssize_t lifetime_write_kbytes_show(struct f2fs_attr *a,
 		struct f2fs_sb_info *sbi, char *buf)
 {
@@ -629,6 +636,7 @@ F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
+F2FS_GENERAL_RO_ATTR(ovp_segments);
 F2FS_GENERAL_RO_ATTR(lifetime_write_kbytes);
 F2FS_GENERAL_RO_ATTR(features);
 F2FS_GENERAL_RO_ATTR(current_reserved_blocks);
@@ -715,6 +723,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(ckpt_thread_ioprio),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
+	ATTR_LIST(ovp_segments),
 	ATTR_LIST(unusable),
 	ATTR_LIST(lifetime_write_kbytes),
 	ATTR_LIST(features),
-- 
2.31.0.rc0.254.gbdcc3b1a9d-goog



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
