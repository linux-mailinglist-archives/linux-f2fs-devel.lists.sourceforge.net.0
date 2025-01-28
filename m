Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC74A20231
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 28 Jan 2025 01:07:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tcZ8O-0001Lx-2f;
	Tue, 28 Jan 2025 00:07:16 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <mchehab+huawei@kernel.org>) id 1tcZ7q-0001LI-JT
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 00:06:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Sender:Content-Transfer-Encoding:MIME-Version:
 References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
 Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
 Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
 List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bVsBvDiCc9njfA1OXYC3dR1E4IlAyaCYirzdSCdjIBA=; b=cIbulXweo5ryKFuyPnpm3TKNI2
 vz9EV7d3oESn9BrQclUZ1j7qRWNxIsx46uGKo8DXcGtPjDa+4VoareOgND1lFbDTH0dqIk11JM7f9
 QKqnAo3UDpYjW16sdhbILViisPj0ZADMkzyOPyTuSVBjEvnJrA9+5OID0mgpY55HoVY8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Sender:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:
 Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bVsBvDiCc9njfA1OXYC3dR1E4IlAyaCYirzdSCdjIBA=; b=ba/MlurvvxV6IVha7WnI+WAQVW
 BIJX4KUerPhpTrJ/DQ5wYrEU1SsexdthMF3DuzyEqS1hG2tdOOURjO2QmICixWw8NALBIndiOagGl
 qnxxkf/AJFt4GzxK7hbL0zD6dfI46uyMHazWHVj2zZpTXPEq/l9cx5DRrtlYglQ7Y3Ak=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tcZ7p-0007rn-Tn for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 28 Jan 2025 00:06:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 2A5D3A415F1;
 Tue, 28 Jan 2025 00:04:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 995C3C4CEE0;
 Tue, 28 Jan 2025 00:06:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1738022795;
 bh=LI59JQtyPV/HF12ShAdqHJX2HFF3NXc8/5bk+IONPNM=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=UMbqCVZIhWUNOG6pwcxM3vV7QS3gmeUlDvAxwudM+XQlG18DYaJVCyQfHG5/8K/yj
 0GIssh6oORjjGHMP0vHmL8V8C1dvZIJvso/5PAJnnz3DGfuHKbrZ4EWK3Mb4j3lFFq
 GgUMPEszGBPpDJBXf7Y2jcHEyK6n8qL4hFO8oULBLoDgb6Wgqa9CkQfcDPLLItwBO1
 M4JSK2yrdbsqGO7qA35AMAWhnBoC2/YEB11g7SAxmxwQJTBid96VAp/cz5Xpj3ur/q
 cl2HpIegxB09n0IdEuR3u1C8kVPcwJDYdLcyGrYd9dWUXNGeIkDOhqc/mlxUIU37Ez
 SM0mJMidSzbdg==
Received: from mchehab by mail.kernel.org with local (Exim 4.98)
 (envelope-from <mchehab+huawei@kernel.org>)
 id 1tcZ7h-0000000DRL1-3WAU; Tue, 28 Jan 2025 01:06:33 +0100
To: Linux Doc Mailing List <linux-doc@vger.kernel.org>,
 Jonathan Corbet <corbet@lwn.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Tue, 28 Jan 2025 01:05:59 +0100
Message-ID: <380e21e11e5b1b9e7cc38ddb0c1e6695b3c69254.1738020236.git.mchehab+huawei@kernel.org>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <cover.1738020236.git.mchehab+huawei@kernel.org>
References: <cover.1738020236.git.mchehab+huawei@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -3.8 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Some date tags are missing colons. Add them to comply with
 ABI description and produce right results when converted to html/pdf.
 Signed-off-by:
 Mauro Carvalho Chehab <mchehab+huawei@kernel.org> ---
 Documentation/ABI/testing/sysfs-fs-f2fs
 | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(-) 
 Content analysis details:   (-3.8 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -1.3 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tcZ7p-0007rn-Tn
Subject: [f2fs-dev] [RFC v2 10/38] ABI: sysfs-fs-f2fs: fix date tags
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
From: Mauro Carvalho Chehab via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jaegeuk Kim <mchehab+huawei@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Some date tags are missing colons. Add them to comply with
ABI description and produce right results when converted to html/pdf.

Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 3e1630c70d8a..e44bb614964b 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -347,7 +347,7 @@ Description:	Used to control configure extension list:
 		- [c] means add/del cold file extension
 
 What:		/sys/fs/f2fs/<disk>/unusable
-Date		April 2019
+Date:		April 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	If checkpoint=disable, it displays the number of blocks that
 		are unusable.
@@ -355,7 +355,7 @@ Description:	If checkpoint=disable, it displays the number of blocks that
 		would be unusable if checkpoint=disable were to be set.
 
 What:		/sys/fs/f2fs/<disk>/encoding
-Date		July 2019
+Date:		July 2019
 Contact:	"Daniel Rosenberg" <drosen@google.com>
 Description:	Displays name and version of the encoding set for the filesystem.
 		If no encoding is set, displays (none)
-- 
2.48.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
