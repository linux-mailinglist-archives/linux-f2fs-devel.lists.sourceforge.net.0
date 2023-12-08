Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ADB9809E9D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Dec 2023 09:52:38 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rBWax-0000UO-Px;
	Fri, 08 Dec 2023 08:52:28 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1rBWaw-0000UF-M3
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Dec 2023 08:52:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8DMWOhAUdaqeHH4nSC7+MNYiSfyh0fu2NqFG1FVS5qI=; b=Iuhgi5YSmV9nYJWeSCO7D9dgNo
 M26Y5HXFIu9fl+WFZphLye9/kd5w3nr0mMiO+UXpjO2Yod6ovMg/HPs7mdiChrSX0xC0yGa/JDpW9
 d4YuF5itiw6SjUDLjFIu13M2tDK7KoBn5IpsvvZR4pTFFtLzXv7oyDrHR8A8WopqCyuc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=8DMWOhAUdaqeHH4nSC7+MNYiSfyh0fu2NqFG1FVS5qI=; b=b
 OAnCHtae1j/I2+yGo1n/UpgN1DJ1irPHTdQ9apRsY4y0ZACUikDbH6qoeYZKrMY/ufVsE/S5NNfNr
 5oD4400MXtzqmND45y2SvNpkCIaFksahFaRYEIbAlVM2l12MM6eUMEoLBiheAbNAbtw99XwoEteOy
 Aplqf97zqdF9UXDA=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rBWat-0004Nb-0s for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Dec 2023 08:52:27 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 3B88pNQw053793;
 Fri, 8 Dec 2023 16:51:23 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4Sml8W4CP1z2PBfby;
 Fri,  8 Dec 2023 16:45:31 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 8 Dec 2023 16:51:21 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 8 Dec 2023 16:50:33 +0800
Message-ID: <1702025433-5860-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 3B88pNQw053793
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Should check return value of f2fs_recover_xattr_data in
 __f2fs_setxattr
 rather than doing invalid retry if error happen. Also just do set_page_dirty
 in f2fs_recover_xattr_data when page is changed really. 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1rBWat-0004Nb-0s
Subject: [f2fs-dev] [PATCH] f2fs: fix to check return value of
 f2fs_recover_xattr_data
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
Cc: ke.wang@unisoc.com, zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Should check return value of f2fs_recover_xattr_data in
__f2fs_setxattr rather than doing invalid retry if error happen.

Also just do set_page_dirty in f2fs_recover_xattr_data when
page is changed really.

Fixes: 50a472bbc79f ("f2fs: do not return EFSCORRUPTED, but try to run online repair")
Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/node.c  |  6 +++---
 fs/f2fs/xattr.c | 12 +++++++-----
 2 files changed, 10 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e50a093..93bf724 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2754,11 +2754,11 @@ int f2fs_recover_xattr_data(struct inode *inode, struct page *page)
 	f2fs_update_inode_page(inode);
 
 	/* 3: update and set xattr node page dirty */
-	if (page)
+	if (page) {
 		memcpy(F2FS_NODE(xpage), F2FS_NODE(page),
 				VALID_XATTR_BLOCK_SIZE);
-
-	set_page_dirty(xpage);
+		set_page_dirty(xpage);
+	}
 	f2fs_put_page(xpage, 1);
 
 	return 0;
diff --git a/fs/f2fs/xattr.c b/fs/f2fs/xattr.c
index 47e88b4..de92891 100644
--- a/fs/f2fs/xattr.c
+++ b/fs/f2fs/xattr.c
@@ -660,11 +660,13 @@ static int __f2fs_setxattr(struct inode *inode, int index,
 	here = __find_xattr(base_addr, last_base_addr, NULL, index, len, name);
 	if (!here) {
 		if (!F2FS_I(inode)->i_xattr_nid) {
-			f2fs_notice(F2FS_I_SB(inode),
-				"recover xattr in inode (%lu)", inode->i_ino);
-			f2fs_recover_xattr_data(inode, NULL);
-			kfree(base_addr);
-			goto retry;
+			error = f2fs_recover_xattr_data(inode, NULL);
+			if (!error) {
+				f2fs_notice(F2FS_I_SB(inode),
+					"recover xattr in inode (%lu)", inode->i_ino);
+				kfree(base_addr);
+				goto retry;
+			}
 		}
 		f2fs_err(F2FS_I_SB(inode), "set inode (%lu) has corrupted xattr",
 								inode->i_ino);
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
