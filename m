Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3A174CC2A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 10 Jul 2023 07:23:51 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qIjN8-0004WR-6M;
	Mon, 10 Jul 2023 05:23:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <rdunlap@infradead.org>) id 1qIjN7-0004WL-5u
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 05:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Transfer-Encoding:MIME-Version:Message-ID:
 Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=b4wp0T94ukygtF3+ZxeOKxtu70Cl8ugqjCLk5Qld0yw=; b=jY/PurGyWobrNaUdB2RTFhGZaS
 ZdQ4kISJn31QCmbxDuaFZLU9HptiVJJg92370+bxV/iKEmf1UIQQaJqB0j2hL10tU/Ha2dD6Uophs
 AqMmUZ9qbw15kDmkyqQPt8h690dKVck+DeBDvzxaPrjdGwvyNCIH6PktdftcUzXgSgCE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From
 :Sender:Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=b4wp0T94ukygtF3+ZxeOKxtu70Cl8ugqjCLk5Qld0yw=; b=K
 dPzoQucsy1qndh9YQ8QRLJ3xv4v60FQ8ok56TUfeYR5/5+NhwWo3PZcsSYFHVN/MbQZotLoAwkLAN
 BainkykJoKmKGF7989gaz8SiA0pzzz80082N1OLwHZTrxps+YWaeX9+opDkzPk8weIzU1IttdBlVi
 r6VcGymHunJ+14kg=;
Received: from bombadil.infradead.org ([198.137.202.133])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qIjN7-0008VK-HL for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 10 Jul 2023 05:23:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
 MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
 Content-ID:Content-Description:In-Reply-To:References;
 bh=b4wp0T94ukygtF3+ZxeOKxtu70Cl8ugqjCLk5Qld0yw=; b=YgFnHSjwCvvwxrl+b2hHUq+/rR
 DOzNFg59vjjd3TGu3ibWVTT0HIvzmzL6DTMPAQeNs+JIpr1RL3HFxRZVvnHPWKyg1i/4a1PlWvazI
 tLqZ4Hii7nKQ9u3KebBFgIPh4v2fXBMV3w6Hx9ky1sIVDEFiDbabDekAHCrMlOmWkZbdm+L89ElYK
 GAHGZcdhJ8fk4aNQ4k1Kb3o0zD+COciCHHx6muWLOYqXCKTcWWFxTVIUA3aqvanTWBiCwTc3Utahc
 qM4xf8XtYcsDhgEy4Ijrj1m7BKz7dpXRF5j/dHasfzNM9as3uUx7z/miORdutE15/8ddZGoDFcH5Z
 qkC/tK1w==;
Received: from [2601:1c2:980:9ec0::2764] (helo=bombadil.infradead.org)
 by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
 id 1qIjMr-00AT15-0I; Mon, 10 Jul 2023 05:23:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-kernel@vger.kernel.org
Date: Sun,  9 Jul 2023 22:23:24 -0700
Message-ID: <20230710052324.2857-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.41.0
MIME-Version: 1.0
X-Spam-Score: -2.5 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Correct spelling problems as identified by codespell. Fixes:
 9e615dbba41e ("f2fs: add missing description for ipu_policy node") Fixes:
 b2e4a2b300e5 ("f2fs: expose discard related parameters in sysfs") Fixes:
 846ae671ad36 ("f2fs: expose extension_list sys [...] 
 Content analysis details:   (-2.5 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [198.137.202.133 listed in list.dnswl.org]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 SPF_NONE               SPF: sender does not publish an SPF Record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1qIjN7-0008VK-HL
Subject: [f2fs-dev] [PATCH] f2fs: fix spelling in ABI documentation
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
Cc: Yangtao Li <frank.li@vivo.com>, Randy Dunlap <rdunlap@infradead.org>,
 linux-f2fs-devel@lists.sourceforge.net, Konstantin Vyshetsky <vkon@google.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Correct spelling problems as identified by codespell.

Fixes: 9e615dbba41e ("f2fs: add missing description for ipu_policy node")
Fixes: b2e4a2b300e5 ("f2fs: expose discard related parameters in sysfs")
Fixes: 846ae671ad36 ("f2fs: expose extension_list sysfs entry")
Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Jaegeuk Kim <jaegeuk@kernel.org>
Cc: Chao Yu <chao@kernel.org>
Cc: linux-f2fs-devel@lists.sourceforge.net
Cc: Yangtao Li <frank.li@vivo.com>
Cc: Konstantin Vyshetsky <vkon@google.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |    8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff -- a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -54,9 +54,9 @@ Description:	Controls the in-place-updat
 		0x00  DISABLE         disable IPU(=default option in LFS mode)
 		0x01  FORCE           all the time
 		0x02  SSR             if SSR mode is activated
-		0x04  UTIL            if FS utilization is over threashold
+		0x04  UTIL            if FS utilization is over threshold
 		0x08  SSR_UTIL        if SSR mode is activated and FS utilization is over
-		                      threashold
+		                      threshold
 		0x10  FSYNC           activated in fsync path only for high performance
 		                      flash storages. IPU will be triggered only if the
 		                      # of dirty pages over min_fsync_blocks.
@@ -117,7 +117,7 @@ Date:		December 2021
 Contact:	"Konstantin Vyshetsky" <vkon@google.com>
 Description:	Controls the number of discards a thread will issue at a time.
 		Higher number will allow the discard thread to finish its work
-		faster, at the cost of higher latency for incomming I/O.
+		faster, at the cost of higher latency for incoming I/O.
 
 What:		/sys/fs/f2fs/<disk>/min_discard_issue_time
 Date:		December 2021
@@ -334,7 +334,7 @@ Description:	This indicates how many GC
 		state. 2048 trials is set by default.
 
 What:		/sys/fs/f2fs/<disk>/extension_list
-Date:		Feburary 2018
+Date:		February 2018
 Contact:	"Chao Yu" <yuchao0@huawei.com>
 Description:	Used to control configure extension list:
 		- Query: cat /sys/fs/f2fs/<disk>/extension_list


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
