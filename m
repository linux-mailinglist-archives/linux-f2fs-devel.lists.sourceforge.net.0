Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B3EE97C84F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 13 Oct 2023 13:50:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qrGg2-0003xr-6R;
	Fri, 13 Oct 2023 11:49:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1qrGfz-0003xi-Ta
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Oct 2023 11:49:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mogbi/2oqpyAyBS1J5rCe6n6lYblpP0L0ZK8pevYaPE=; b=HeTphTlVhb3RvukDwHbajr5qGg
 SbpQgAfMKbdIbdnauGmMrnJCNkKeW6aVjoCuif4JO/1RtzX/9dlPk4cl36cpq/jbfAOyuQW+lssrq
 9a4bCCcbafqhSDAYlKf/PA+TbLILt7kYwKmXgq5Iu2vHcQt3OgWY3aTvVwq+TptqjGx8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mogbi/2oqpyAyBS1J5rCe6n6lYblpP0L0ZK8pevYaPE=; b=i
 IFg7VDj+0ZiIQmfU7HbUbZtamm6cDDkjlQLJ+QgESjkEyBNfvl8haK/uhZEfsXQ8rFJj+800sB7BJ
 FmA2QO6b0vmfxRiTJTnB+8kGlcvKT+acpIQ7lJ7xaclyaxvBSdu1wFHYrGZy/gbYbeI9gXmSbezv9
 QDXPf3z7KH0ZPB/0=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qrGfu-0006tn-MP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 13 Oct 2023 11:49:54 +0000
Received: from SHSQR01.spreadtrum.com (localhost [127.0.0.2] (may be forged))
 by SHSQR01.spreadtrum.com with ESMTP id 39DAxZ30021149
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri, 13 Oct 2023 18:59:35 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 39DAworm019695;
 Fri, 13 Oct 2023 18:58:50 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (bjmbx01.spreadtrum.com [10.0.64.7])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4S6NgW2XMhz2KWZZn;
 Fri, 13 Oct 2023 18:54:47 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX01.spreadtrum.com (10.0.64.7) with Microsoft SMTP Server (TLS) id
 15.0.1497.23; Fri, 13 Oct 2023 18:58:49 +0800
From: Zhiguo Niu <zhiguo.niu@unisoc.com>
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Fri, 13 Oct 2023 18:58:23 +0800
Message-ID: <1697194703-21371-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS01.spreadtrum.com (10.0.1.201) To
 BJMBX01.spreadtrum.com (10.0.64.7)
X-MAIL: SHSQR01.spreadtrum.com 39DAworm019695
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: SBI_NEED_FSCK should be set for fsck has a chance to repair
 in case of scan_nat_page fail in run time. Signed-off-by: Zhiguo Niu
 <zhiguo.niu@unisoc.com>
 --- fs/f2fs/node.c | 5 ++++- 1 file changed, 4 insertions(+), 1 deletion(-)
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
X-Headers-End: 1qrGfu-0006tn-MP
Subject: [f2fs-dev] [PATCH] f2fs: fix error path of __f2fs_build_free_nids
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
Cc: zhiguo.niu@unisoc.com, niuzhiguo84@gmail.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

SBI_NEED_FSCK should be set for fsck has a chance to
repair in case of scan_nat_page fail in run time.

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/node.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ee2e1dd..d9e6087 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2499,12 +2499,15 @@ static int __f2fs_build_free_nids(struct f2fs_sb_info *sbi,
 				ret = PTR_ERR(page);
 			} else {
 				ret = scan_nat_page(sbi, page, nid);
+				if (ret && !mount) {
+					set_sbi_flag(sbi, SBI_NEED_FSCK);
+					f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
+				}
 				f2fs_put_page(page, 1);
 			}
 
 			if (ret) {
 				f2fs_up_read(&nm_i->nat_tree_lock);
-				f2fs_err(sbi, "NAT is corrupt, run fsck to fix it");
 				return ret;
 			}
 		}
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
