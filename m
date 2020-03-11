Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46111181E41
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2020 17:49:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1jC4Xe-0002pH-Df; Wed, 11 Mar 2020 16:49:10 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <artur@juraszek.xyz>) id 1jC4Xc-0002p9-JL
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 16:49:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=oV5+mVTLKgitGy1k9Dd0HBZea7uQGarFhSGo7wMDp2c=; b=QP4aov1pzHiDoRx3LCeVEarBYX
 cbHGcM3kfujo+H1OLUDxneKYWL8htwA+bAsClI2/rq/X8p73+OYtlIr1UCgDJb+vo6nEFkjbgugRl
 AibZKw/2DT/GroMNpSZD3ZgdguXdpwqC7NjUxUSJ1In9njjZpCMhcPOa7zR2PdeQBGUc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-Id:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=oV5+mVTLKgitGy1k9Dd0HBZea7uQGarFhSGo7wMDp2c=; b=O
 rJyXg6ufmi3K3KYjqp+PfDeWMEY5vCnFb2KiApCp0rw3IigzvZgC5FCuQLQ3rESU3SQ9CGLs+cMTa
 UW7BivxaAY47e01p0WxIoX/Pn+gI/iX14YMO01HVlLOvDFVJGPPtnNro6uA4towfv6UxwLA2G3cjP
 WeJ8vHa6/ZN/mWv4=;
Received: from h1.fbrelay.privateemail.com ([131.153.2.42])
 by sfi-mx-4.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1jC4XS-008Zrw-HP
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 11 Mar 2020 16:49:08 +0000
Received: from MTA-05-3.privateemail.com (mta-05.privateemail.com
 [198.54.127.60])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by h1.fbrelay.privateemail.com (Postfix) with ESMTPS id 51F9E8134C
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 11 Mar 2020 12:36:13 -0400 (EDT)
Received: from MTA-05.privateemail.com (localhost [127.0.0.1])
 by MTA-05.privateemail.com (Postfix) with ESMTP id 8BBBC60056;
 Wed, 11 Mar 2020 12:35:57 -0400 (EDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=juraszek.xyz;
 s=default; t=1583944557;
 bh=jUmHCuadOjADh9i9U4Kngw44/tBcaOYcVlo6zsIT8hw=;
 h=From:To:Cc:Subject:Date:From;
 b=ostQfCh8HXBmbtL2gFztLhT7iZiAoCJIsTneiUm6dViHCVaozqdjYjDci+3XYNDvX
 mrLRu/Dh4K9GI+Cd9MKtEkthMrnHRPRYZBStPeRvfVB0oMwm6WRILVNRhg+zvbB4y5
 VhbMKl1D/Uqpn064sbmHWNrMTpok0oRVM9sfHoF4=
Received: from opera-juraszek.service.osa (unknown [10.20.151.236])
 by MTA-05.privateemail.com (Postfix) with ESMTPA id 6E10460055;
 Wed, 11 Mar 2020 16:35:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=juraszek.xyz;
 s=default; t=1583944557;
 bh=jUmHCuadOjADh9i9U4Kngw44/tBcaOYcVlo6zsIT8hw=;
 h=From:To:Cc:Subject:Date:From;
 b=ostQfCh8HXBmbtL2gFztLhT7iZiAoCJIsTneiUm6dViHCVaozqdjYjDci+3XYNDvX
 mrLRu/Dh4K9GI+Cd9MKtEkthMrnHRPRYZBStPeRvfVB0oMwm6WRILVNRhg+zvbB4y5
 VhbMKl1D/Uqpn064sbmHWNrMTpok0oRVM9sfHoF4=
From: Artur Juraszek <artur@juraszek.xyz>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 11 Mar 2020 17:35:46 +0100
Message-Id: <20200311163546.1843-1-artur@juraszek.xyz>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Virus-Scanned: ClamAV using ClamSMTP
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/, no
 trust [131.153.2.42 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: juraszek.xyz]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1jC4XS-008Zrw-HP
Subject: [f2fs-dev] [PATCH] mkfs.f2fs: Slightly improve the manpage wording
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

Signed-off-by: Artur Juraszek <artur@juraszek.xyz>
---
 man/mkfs.f2fs.8 | 21 ++++++++++-----------
 1 file changed, 10 insertions(+), 11 deletions(-)

diff --git a/man/mkfs.f2fs.8 b/man/mkfs.f2fs.8
index f9484eb..7d16930 100644
--- a/man/mkfs.f2fs.8
+++ b/man/mkfs.f2fs.8
@@ -93,8 +93,8 @@ Specify the level of debugging options.
 The default number is 0, which shows basic debugging messages.
 .TP
 .BI \-e " extension-list"
-Specify a file extension list in order f2fs to treat them as cold files.
-The data of files having those extensions will be stored to the cold log.
+Specify a list of file extensions which f2fs will treat as cold files, i.e.
+data of files having those extensions will be written to the cold log.
 The default list includes most of multimedia file extensions such as jpg, gif,
 mpeg, mkv, and so on.
 .TP
@@ -107,22 +107,21 @@ there is a filesystem or partition table on the device already.
 Specify the volume label to the partition mounted as F2FS.
 .TP
 .BI \-m
-Specify f2fs filesystem to supports the block zoned feature.
-Without it, the filesystem isn't supports the feature.
+Turn on the block zoned feature support.
+Without this flag the filesystem won't support it.
 .TP
 .BI \-o " overprovision-ratio-percentage"
-Specify the percentage over the volume size for overprovision area. This area
-is hidden to users, and utilized by F2FS cleaner. If not specified, the best
-number will be assigned automatically accoring to the partition size.
+Specify the percentage of the volume size that will be used for overprovision area.
+This area is hidden to users, and utilized by F2FS cleaner. If not specified, the best
+number will be assigned automatically, according to the partition size.
 .TP
 .BI \-O " feature-list"
-Specify a feature list like feature1[feature2,feature3,...] in order f2fs
-filesystem will supports.
+Specify a feature list like feature1[,feature2,feature3,...] which the
+filesystem will support.
 e.g "encrypt" and so on.
 .TP
 .BI \-q
-Quiet mode.
-With it, mkfs.f2fs does not show any messages include the basic messages.
+Quiet mode - do not show any messages.
 .TP
 .BI \-R
 Give root_owner option for initial uid/gid assignment.
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
