Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B29B9E00CF
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  2 Dec 2024 12:42:30 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tI4om-0007Jr-2p;
	Mon, 02 Dec 2024 11:42:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chao@kernel.org>) id 1tI4ok-0007Ji-4O
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 11:42:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sfLImZliAtQ2xqtddQtNfmurxMyPvCtcE9/ZcmKbqBk=; b=Mb8ayQROGLuK9eZsTbYaUHPZBs
 CWnUmNK2dMWAazCUxz7Aj98lK1ml2TGCiUJ0ghA5v25qx9rsCRQk8HVROn6wYbeNE/jYLG8SCDC6a
 YN4DGkgUUvrWIVpqaAveBT4klXr3rDSYz0LwhsxRbeYnQ+qzbk6Y5neOKQ0EiHb9uO14=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-Id:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sfLImZliAtQ2xqtddQtNfmurxMyPvCtcE9/ZcmKbqBk=; b=KGD4yW9A/NhdanbTUbVIa30ENI
 F/+Agq4ynFvelW+WONIX7o/uZsS6GZe2Nc8bluovFuOXfJbtnsbNXTfum2y7WEZltfzTKZq7GkQ7U
 gGLY4NJwkJg4j0U7JzcH6IF23+SU+L6U2iquXwcLIQdzfCqzG9Ft9ICh9p7MW6fd7FF8=;
Received: from nyc.source.kernel.org ([147.75.193.91])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tI4ok-00061q-3q for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 02 Dec 2024 11:42:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
 by nyc.source.kernel.org (Postfix) with ESMTP id 17E98A40B4E
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon,  2 Dec 2024 11:40:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB3B1C4CEDD;
 Mon,  2 Dec 2024 11:42:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1733139727;
 bh=gT73+r3iRtpdaPhRPXnrCCxqCie1FPAeMy25xabr5gI=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=DK5ou1z4LGDidXGl4rA4bV+whDsf//NnVxVuToFebVFXvOyMDUN+tA8Xqulhs+jYl
 WO0j9ro+2TsbE5fIpSPxvQF8/WN1WSiDuZxNzS90tBtei0Qd/25IAUlSvN2mOWOyYI
 k1CJTkpJ4xUtYIDDAepES1/vbwJWXtUoQtPIGpbwxP3qw+vW3gM3iiGpXxOW4aGrM6
 06ZwLFYXpIEsv6jR17kM8Ljp2w4QepygtHgYYBL817LlwR18MxEO+F02pjJHCxUjFN
 V2XA95FhjqUXFQvr6PUyOcAGNIa6OtfGvS4QO+X5l9SNFIhyZuzcVOA6aog00r1QBh
 5dfQDMHllVRJw==
To: Zorro Lang <zlang@kernel.org>,
	fstests@vger.kernel.org
Date: Mon,  2 Dec 2024 19:41:48 +0800
Message-Id: <20241202114149.2666-2-chao@kernel.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241202114149.2666-1-chao@kernel.org>
References: <20241202114149.2666-1-chao@kernel.org>
MIME-Version: 1.0
X-Spam-Score: -5.5 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The bug related to this regression testcase has been fixed
 by commit 1acd73edbbfe ("f2fs: fix to account dirty data in
 __get_secs_required()"), 
 let's update commit id in _fixed_by_kernel_commit line. 
 Content analysis details:   (-5.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [147.75.193.91 listed in bl.score.senderscore.com]
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [147.75.193.91 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -3.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1tI4ok-00061q-3q
Subject: [f2fs-dev] [PATCH 2/3] f2fs/006: update commit id in
 _fixed_by_kernel_commit line
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
From: Chao Yu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chao Yu <chao@kernel.org>
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The bug related to this regression testcase has been fixed by commit
1acd73edbbfe ("f2fs: fix to account dirty data in __get_secs_required()"),
let's update commit id in _fixed_by_kernel_commit line.

Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Signed-off-by: Chao Yu <chao@kernel.org>
---
 tests/f2fs/006 | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tests/f2fs/006 b/tests/f2fs/006
index a9c823c1..c1f8d4ff 100755
--- a/tests/f2fs/006
+++ b/tests/f2fs/006
@@ -16,7 +16,7 @@
 . ./common/preamble
 _begin_fstest auto quick
 
-_fixed_by_kernel_commit xxxxxxxxxxxx \
+_fixed_by_kernel_commit 1acd73edbbfe \
 	"f2fs: fix to account dirty data in __get_secs_required()"
 
 _require_scratch
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
