Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EFF57CC666C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 17 Dec 2025 08:46:57 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-ID:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2uv4umWG6L1UCWrEX6wvu8A8NC70basS+W2eQ8gnEI8=; b=kG3F7TvrOECcIXjUFeaBHSe3fJ
	RjMbEhsYamUt9snVDK3JosyRUZEriAC83zwEstU3Pw/Xc//kLTtXTDhmQZRg1kKtlwIsMs9MyfBOB
	IeSYmeYYtS9l+FufDID3uDNofnPNClFKsHxFphXaeNnhdPCzjgeBnCOshpz4ndcVza6s=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vVmFD-0004a9-5k;
	Wed, 17 Dec 2025 07:46:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Zhiguo.Niu@unisoc.com>) id 1vVmFB-0004a1-7O
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 07:46:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N2HTrVYim/QtAf4B2idR++dp72Ua8MMW9yOTDliLULU=; b=YEIBwNeBBh6TG2Y8GW3AQgzW2u
 Zt8WyxIyN2ltXzfoOwQ/mxgb75g5w9d0ePjCyCL3/tRq6S+clceWjwXC5bdsFUNpa/oiHwvCQ16hZ
 KkzOwsmpKyXLDiCymu02E1pR87OizjTxzHV1M4HT7DFqXOh/9pk4jM69U1BqndOIU90E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N2HTrVYim/QtAf4B2idR++dp72Ua8MMW9yOTDliLULU=; b=I
 umBtJgBKG+7Sj9GrykP8ZKWeLarEsiTMC9b9/qJ/V9NpciJkJa1vd4o/4TS/IB1HTeLlczoVh/nkm
 27vYgMhiBzcK3F/Ptl6SKe+m6T7BSy+/JsNs1Ajw9/34HZ5G8t8wfryA6ws33h89ztSdKUlEfP74V
 ZUE8+8nTTLnLV5bs=;
Received: from mx1.unisoc.com ([222.66.158.135] helo=SHSQR01.spreadtrum.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vVmFA-0004J5-0T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 17 Dec 2025 07:46:45 +0000
Received: from dlp.unisoc.com ([10.29.3.86])
 by SHSQR01.spreadtrum.com with ESMTP id 5BH7k4Gw072027;
 Wed, 17 Dec 2025 15:46:04 +0800 (+08)
 (envelope-from Zhiguo.Niu@unisoc.com)
Received: from SHDLP.spreadtrum.com (BJMBX02.spreadtrum.com [10.0.64.8])
 by dlp.unisoc.com (SkyGuard) with ESMTPS id 4dWQj92mRcz2LGQlt;
 Wed, 17 Dec 2025 15:41:33 +0800 (CST)
Received: from bj08434pcu.spreadtrum.com (10.0.73.87) by
 BJMBX02.spreadtrum.com (10.0.64.8) with Microsoft SMTP Server (TLS) id
 15.0.1497.48; Wed, 17 Dec 2025 15:46:02 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 17 Dec 2025 15:45:29 +0800
Message-ID: <1765957529-4285-1-git-send-email-zhiguo.niu@unisoc.com>
X-Mailer: git-send-email 1.9.1
MIME-Version: 1.0
X-Originating-IP: [10.0.73.87]
X-ClientProxiedBy: SHCAS03.spreadtrum.com (10.0.1.207) To
 BJMBX02.spreadtrum.com (10.0.64.8)
X-MAIL: SHSQR01.spreadtrum.com 5BH7k4Gw072027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=unisoc.com;
 s=default; t=1765957572;
 bh=N2HTrVYim/QtAf4B2idR++dp72Ua8MMW9yOTDliLULU=;
 h=From:To:CC:Subject:Date;
 b=uRjHHEXRSV6uDnxtscfFmZ/sr3QZ8nBLSWKCORbbea/tEco6VBOCUuiyUj1vuLGEp
 nwIoePOxgTf0e0I0zf+2oNSP2nyEXAo8j09cFWfkYeYL9QgCuFNMXuyewr3UkNd+T9
 lUyYtyfjqO/GSPZQ0ML0WVJhPJsln8sRwgWoXgHDBy/zYzQZ/m/VE64aq5mYjW8XNT
 H/RCq94pL2swFj3DJJnt48qQ2Utz6ryY2NfW1dUWktR1uFv41hV2YPAP24Nap3XVLV
 MbW5PFfbSazX7uz1/Oj9Nrj3+PMKcMlG/h5J9iHarIAzM2mx/7+KZUY84PikehDVqb
 o+uWhk4oqnl8g==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. qf_inum has been got and checked in its caller
 f2fs_enable_quotas
 2. f2fs_sb_has_quota_ino has bee checked in its all callers 3. use sbi cleanup
 F2FS_SB(sb) Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com> ---
 fs/f2fs/super.c
 | 16 ++++ 1 file changed, 4 insertions(+), 12 deletions(-) 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1vVmFA-0004J5-0T
Subject: [f2fs-dev] [PATCH] f2fs: remove some redundant codes in
 f2fs_quota_enable
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
From: Zhiguo Niu via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Zhiguo Niu <zhiguo.niu@unisoc.com>
Cc: ke.wang@unisoc.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, zhiguo.niu@unisoc.com,
 Hao_hao.Wang@unisoc.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. qf_inum has been got and checked in its caller f2fs_enable_quotas
2. f2fs_sb_has_quota_ino has bee checked in its all callers
3. use sbi cleanup F2FS_SB(sb)

Signed-off-by: Zhiguo Niu <zhiguo.niu@unisoc.com>
---
 fs/f2fs/super.c | 16 ++++------------
 1 file changed, 4 insertions(+), 12 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c4c225e..036ba9c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3222,19 +3222,12 @@ int f2fs_enable_quota_files(struct f2fs_sb_info *sbi, bool rdonly)
 }
 
 static int f2fs_quota_enable(struct super_block *sb, int type, int format_id,
-			     unsigned int flags)
+			     unsigned int flags, unsigned long qf_inum)
 {
 	struct inode *qf_inode;
-	unsigned long qf_inum;
 	unsigned long qf_flag = F2FS_QUOTA_DEFAULT_FL;
 	int err;
 
-	BUG_ON(!f2fs_sb_has_quota_ino(F2FS_SB(sb)));
-
-	qf_inum = f2fs_qf_ino(sb, type);
-	if (!qf_inum)
-		return -EPERM;
-
 	qf_inode = f2fs_iget(sb, qf_inum);
 	if (IS_ERR(qf_inode)) {
 		f2fs_err(F2FS_SB(sb), "Bad quota inode %u:%lu", type, qf_inum);
@@ -3267,7 +3260,7 @@ static int f2fs_enable_quotas(struct super_block *sb)
 		test_opt(sbi, PRJQUOTA),
 	};
 
-	if (is_set_ckpt_flags(F2FS_SB(sb), CP_QUOTA_NEED_FSCK_FLAG)) {
+	if (is_set_ckpt_flags(sbi, CP_QUOTA_NEED_FSCK_FLAG)) {
 		f2fs_err(sbi, "quota file may be corrupted, skip loading it");
 		return 0;
 	}
@@ -3279,14 +3272,13 @@ static int f2fs_enable_quotas(struct super_block *sb)
 		if (qf_inum) {
 			err = f2fs_quota_enable(sb, type, QFMT_VFS_V1,
 				DQUOT_USAGE_ENABLED |
-				(quota_mopt[type] ? DQUOT_LIMITS_ENABLED : 0));
+				(quota_mopt[type] ? DQUOT_LIMITS_ENABLED : 0), qf_inum);
 			if (err) {
 				f2fs_err(sbi, "Failed to enable quota tracking (type=%d, err=%d). Please run fsck to fix.",
 					 type, err);
 				for (type--; type >= 0; type--)
 					dquot_quota_off(sb, type);
-				set_sbi_flag(F2FS_SB(sb),
-						SBI_QUOTA_NEED_REPAIR);
+				set_sbi_flag(sbi, SBI_QUOTA_NEED_REPAIR);
 				return err;
 			}
 		}
-- 
1.9.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
