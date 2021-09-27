Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 39236418EE2
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 27 Sep 2021 08:07:14 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mUjn9-0005Q5-6D; Mon, 27 Sep 2021 06:07:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <keosung.park@samsung.com>) id 1mUjn6-0005Pz-BM
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Sep 2021 06:07:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 Date:Message-ID:CC:To:From:Sender:Reply-To:Subject:Mime-Version:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=arZ5Z5z9yCYJLYv6BmzcDUc6j2jcFI4JwqTbvTfJDHc=; b=PAQOGvY02sgqs0Yl/V4qSsQB9O
 iqs0UIjo9JcbIQPdW17Jvw19KExLn8bI6AdYdzsAdOp3A5eTZdNW3eLyLDbJqx24w/u6Y/mUjAFvl
 TSAUc/8/JjaSMPJlMO9X+ELaIWVG9DOrjzRZacxIxXd/2RhR7/sIaUi4uIXs/3s/fetk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:Date:Message-ID:CC:To:
 From:Sender:Reply-To:Subject:Mime-Version:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=arZ5Z5z9yCYJLYv6BmzcDUc6j2jcFI4JwqTbvTfJDHc=; b=f
 e3xmZWsAly/iWsYZEgNCybQoBFAl3bS3azHf0AuxTmfxW7niy9iOseDqlbIOeHLk/0ttP67ZS60fj
 jbxq6KxiMweImt7Y1X3mfP/ZmfZ5piwCR9VnuNz8/pvdzhBvyIcbbQ3IQQrKmhheE3c8F6+DDUxYB
 A1T6BPkCVA42bcIU=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mUjn3-0003gs-RN
 for linux-f2fs-devel@lists.sourceforge.net; Mon, 27 Sep 2021 06:07:04 +0000
Received: from epcas2p3.samsung.com (unknown [182.195.41.55])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210927060651epoutp026ef5645ee537eb0e02b7c90ec7eb813f~omL8z3oa82441124411epoutp02m
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Mon, 27 Sep 2021 06:06:51 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210927060651epoutp026ef5645ee537eb0e02b7c90ec7eb813f~omL8z3oa82441124411epoutp02m
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1632722811;
 bh=arZ5Z5z9yCYJLYv6BmzcDUc6j2jcFI4JwqTbvTfJDHc=;
 h=Subject:Reply-To:From:To:CC:Date:References:From;
 b=DLK2WntUwoXO9xRj+QvJ00m7Fh8ZuPujv0VktjGPnelUKm2f7mS8oIqxZFhRkF6/O
 0UKwhilrdisYQDJLbdHlOBtGwJWK1sLGMbKAB/dNPrEtJAXtwYnBlCUl2ilUpr4ouz
 CEhWFR9y9B9ITcI4eJeE8AENDsP6882/XVIz7lrk=
Received: from epsnrtp4.localdomain (unknown [182.195.42.165]) by
 epcas2p3.samsung.com (KnoxPortal) with ESMTP id
 20210927060651epcas2p3c2d70f0365b5e788ec4076101340e276~omL8SLJl32960229602epcas2p3E;
 Mon, 27 Sep 2021 06:06:51 +0000 (GMT)
Received: from epsmges2p1.samsung.com (unknown [182.195.40.187]) by
 epsnrtp4.localdomain (Postfix) with ESMTP id 4HHsbZ0g8Jz4x9QY; Mon, 27 Sep
 2021 06:06:50 +0000 (GMT)
X-AuditID: b6c32a45-4c1ff700000025f5-b2-61515f791519
Received: from epcas2p2.samsung.com ( [182.195.41.54]) by
 epsmges2p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 EC.6E.09717.97F51516; Mon, 27 Sep 2021 15:06:49 +0900 (KST)
Mime-Version: 1.0
From: Keoseong Park <keosung.park@samsung.com>
To: "jaegeuk@kernel.org" <jaegeuk@kernel.org>, "chao@kernel.org"
 <chao@kernel.org>, "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>, "linux-kernel@vger.kernel.org"
 <linux-kernel@vger.kernel.org>
X-Priority: 3
X-Content-Kind-Code: NORMAL
X-CPGS-Detection: blocking_info_exchange
X-Drm-Type: N,general
X-Msg-Generator: Mail
X-Msg-Type: PERSONAL
X-Reply-Demand: N
Message-ID: <20210927060648epcms2p4fb042fab3a79cdffba4bf995e1270831@epcms2p4>
Date: Mon, 27 Sep 2021 15:06:48 +0900
X-CMS-MailID: 20210927060648epcms2p4fb042fab3a79cdffba4bf995e1270831
X-Sendblock-Type: AUTO_CONFIDENTIAL
X-CPGSPASS: Y
X-CPGSPASS: Y
CMS-TYPE: 102P
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFmpmk+LIzCtJLcpLzFFi42LZdljTTLcyPjDR4P53LovTU88yWbw8pGmx
 6kG4RW//VjaLJ+tnMVtcWuRucXnXHDaLzulrWBw4PDat6mTz2L3gM5NH35ZVjB6fN8kFsETl
 2GSkJqakFimk5iXnp2TmpdsqeQfHO8ebmhkY6hpaWpgrKeQl5qbaKrn4BOi6ZeYA3aCkUJaY
 UwoUCkgsLlbSt7Mpyi8tSVXIyC8usVVKLUjJKTA0LNArTswtLs1L10vOz7UyNDAwMgWqTMjJ
 +P3lIWvBS/aKjVMuszYwHmfrYuTkkBAwkbjy+jQ7iC0ksINR4tvuwi5GDg5eAUGJvzuEQcLC
 AjoSK/bvZIIoUZLoWriVGSJuILFu+h4wm01AT2LK7zuMILaIwCtGiTOrRbsYuTiYBZoYJW6t
 7YXaxSsxo/0pC4QtLbF9+VZGCFtD4seyXmYIW1Ti5uq37DD2+2PzoWpEJFrvnYWqEZR48HM3
 I8idEgKSEmcOu0KEyyUWnl/GDrJXQqCDUeL19wVQc/QlrnVsBNvLK+Ar8eTeWzCbRUBV4vzS
 FqgaF4nvzRvBnmQWkJfY/nYOM8h8ZgFNifW79CFWKUscucUC80nDxt/s6GxmAT6JjsN/4eI7
 5j1hgrDVJB4t2MIKYctIXJxzjnkCo9IsREDPQrJ3FsLeBYzMqxjFUguKc9NTi40KDJGjdhMj
 ODVque5gnPz2g94hRiYOxkOMEhzMSiK8wSz+iUK8KYmVValF+fFFpTmpxYcYTYE+nsgsJZqc
 D0zOeSXxhqZGZmYGlqYWpmZGFkrivHP/OSUKCaQnlqRmp6YWpBbB9DFxcEo1MGU8F400kGAp
 +vP3u++d58qrjqvNs4w9+nvx5qC9JWah9990SZ/j2voofsrrC7+meXO9tTAtUUwVSNAxs7sk
 X1FkUxZztGOuTHKOgszuhatLTjVmii/e+2/WwVOr1rQfad8ktOKoloXp653v3Yo//mq7Pd+9
 Pk9c1Xfj+m87bBge9h17+LBXzmlFb+PT1avb97YHRPZuOx0Ut9ZHPdfOa/ap2XO2aS85Fae7
 P8vglOiU6fyfN9VPWNg9mzOY+47zq47Ljt8KvizilHBSdFh/rOleqahNuvUNXe4Xt6/WZrpV
 PUk+8EudPX0JR8myV6UXIkSDjngKRJi/lSpZa2oYeFRnBaeQaXXkZpEPube00pRYijMSDbWY
 i4oTAW/0q4AWBAAA
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210927060648epcms2p4fb042fab3a79cdffba4bf995e1270831
References: <CGME20210927060648epcms2p4fb042fab3a79cdffba4bf995e1270831@epcms2p4>
X-Spam-Score: -3.2 (---)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Since active_logs can be set to 2 or 4 or
 NR_CURSEG_PERSIST_TYPE(6), 
 it cannot be set to NR_CURSEG_TYPE(8). That is, whint_mode is always off.
 Therefore,
 the condition is changed from NR_CURSEG_TYPE to NR_CURSEG_PERSIST_TYPE.
 Content analysis details:   (-3.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -2.3 RCVD_IN_DNSWL_MED      RBL: Sender listed at https://www.dnswl.org/,
 medium trust [203.254.224.25 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mUjn3-0003gs-RN
Subject: [f2fs-dev] [PATCH] f2fs: fix to use WHINT_MODE
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
Reply-To: keosung.park@samsung.com
Cc: Sung-Jun Park <sungjun07.park@samsung.com>,
 Jinyoung CHOI <j-young.choi@samsung.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Since active_logs can be set to 2 or 4 or NR_CURSEG_PERSIST_TYPE(6),
it cannot be set to NR_CURSEG_TYPE(8).
That is, whint_mode is always off.

Therefore, the condition is changed from NR_CURSEG_TYPE to NR_CURSEG_PERSIST_TYPE.

Cc: Chao Yu <chao@kernel.org>
Signed-off-by: Keoseong Park <keosung.park@samsung.com>
---
 fs/f2fs/super.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 78ebc306ee2b..86eeb019cc52 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1292,7 +1292,7 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 	/* Not pass down write hints if the number of active logs is lesser
 	 * than NR_CURSEG_PERSIST_TYPE.
 	 */
-	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_TYPE)
+	if (F2FS_OPTION(sbi).active_logs != NR_CURSEG_PERSIST_TYPE)
 		F2FS_OPTION(sbi).whint_mode = WHINT_MODE_OFF;
 
 	if (f2fs_sb_has_readonly(sbi) && !f2fs_readonly(sbi->sb)) {
-- 
2.17.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
