Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0CA070D55D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 May 2023 09:40:26 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q1Md3-0003Sv-DI;
	Tue, 23 May 2023 07:40:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang1@xiaomi.com>) id 1q1Md1-0003Sp-Py
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 07:40:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hGkgWwdGS2lQsUCPaaiIco3ZrH7KtKTxLVwrJM7u7vo=; b=Cm5wVcvCF7MY/ZRMRyuT21qMhL
 u8IiZPLI1S6AXTrUgFSytkgduPLzsWcqenhIBARsRnLe0jgpCCHMFrFVsUqOSSbxGJwcBHZ7ZDN8x
 zg8wIbYMbSV/+RWPj/6IVXpSKZ8fA4t7EReoACPRfA4XBrzcNx4vIRH4OdU8VSHsifa8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=hGkgWwdGS2lQsUCPaaiIco3ZrH7KtKTxLVwrJM7u7vo=; b=G
 trRyezHLM7do4oaewWA4Ak7HPRzhmOlzB1y6765isBsAbEARkV2o0tVLgyEI89xnUtywtIj6lO0Ye
 nvR5Dr5ErVhBKqQFzwu/sMC7xwlGom3hxE8cy4rsxw1V41ZN3DaFkqiLi3Im6TdD/jeDjc3oqi8KF
 1VPxn7lgibwlylxA=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.88])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1q1Mcx-0003ZS-Ig for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 May 2023 07:40:17 +0000
X-IronPort-AV: E=Sophos;i="6.00,185,1681142400"; d="scan'208";a="55840531"
Received: from hk-mbx03.mioffice.cn (HELO xiaomi.com) ([10.56.8.123])
 by outboundhk.mxmail.xiaomi.com with ESMTP; 23 May 2023 15:24:36 +0800
Received: from BJ-MBX12.mioffice.cn (10.237.8.132) by HK-MBX03.mioffice.cn
 (10.56.8.123) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 23 May
 2023 15:24:35 +0800
Received: from zyy.mioffice.cn (10.237.8.11) by BJ-MBX12.mioffice.cn
 (10.237.8.132) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.986.41; Tue, 23 May
 2023 15:24:34 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Tue, 23 May 2023 15:24:21 +0800
Message-ID: <20230523072421.1616607-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.40.1
MIME-Version: 1.0
X-Originating-IP: [10.237.8.11]
X-ClientProxiedBy: BJ-MBX06.mioffice.cn (10.237.8.126) To BJ-MBX12.mioffice.cn
 (10.237.8.132)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When using fiemap to obtain the block address of files larger
 than 2GB ((2147483647+1) bytes), an integer multiplication overflow error
 will occur. This issue is caused by the following code: start = [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [118.143.206.88 listed in wl.mailspike.net]
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q1Mcx-0003ZS-Ig
Subject: [f2fs-dev] [PATCH] f2fs_io: Fix integer multiplication overflow
 error in fiemap
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
From: zangyangyang1 via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zangyangyang1 <zangyangyang1@xiaomi.com>
Cc: zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============6607608142964966331=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============6607608142964966331==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When using fiemap to obtain the block address of files
larger than 2GB ((2147483647+1) bytes), an integer
multiplication overflow error will occur.
This issue is caused by the following code:
    start =3D atoi(argv[1]) * F2FS_BLKSIZE;
    length =3D atoi(argv[2]) * F2FS_BLKSIZE;

Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
---
 tools/f2fs_io/f2fs_io.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 5bc0baf..ad6b5f0 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -809,15 +809,15 @@ static void do_fiemap(int argc, char **argv, const st=
ruct cmd_desc *cmd)
        }

        memset(fm, 0, sizeof(struct fiemap));
-       start =3D atoi(argv[1]) * F2FS_BLKSIZE;
-       length =3D atoi(argv[2]) * F2FS_BLKSIZE;
-       fm->fm_start =3D start;
-       fm->fm_length =3D length;
+       start =3D atoll(argv[1]);
+       length =3D atoll(argv[2]);
+       fm->fm_start =3D start * F2FS_BLKSIZE;
+       fm->fm_length =3D length * F2FS_BLKSIZE;

        fd =3D xopen(argv[3], O_RDONLY | O_LARGEFILE, 0);

        printf("Fiemap: offset =3D %"PRIu64" len =3D %"PRIu64"\n",
-                               start / F2FS_BLKSIZE, length / F2FS_BLKSIZE=
);
+                               start, length);
        if (ioctl(fd, FS_IOC_FIEMAP, fm) < 0)
                die_errno("FIEMAP failed");

--
2.40.1

#/******=B1=BE=D3=CA=BC=FE=BC=B0=C6=E4=B8=BD=BC=FE=BA=AC=D3=D0=D0=A1=C3=D7=
=B9=AB=CB=BE=B5=C4=B1=A3=C3=DC=D0=C5=CF=A2=A3=AC=BD=F6=CF=DE=D3=DA=B7=A2=CB=
=CD=B8=F8=C9=CF=C3=E6=B5=D8=D6=B7=D6=D0=C1=D0=B3=F6=B5=C4=B8=F6=C8=CB=BB=F2=
=C8=BA=D7=E9=A1=A3=BD=FB=D6=B9=C8=CE=BA=CE=C6=E4=CB=FB=C8=CB=D2=D4=C8=CE=BA=
=CE=D0=CE=CA=BD=CA=B9=D3=C3=A3=A8=B0=FC=C0=A8=B5=AB=B2=BB=CF=DE=D3=DA=C8=AB=
=B2=BF=BB=F2=B2=BF=B7=D6=B5=D8=D0=B9=C2=B6=A1=A2=B8=B4=D6=C6=A1=A2=BB=F2=C9=
=A2=B7=A2=A3=A9=B1=BE=D3=CA=BC=FE=D6=D0=B5=C4=D0=C5=CF=A2=A1=A3=C8=E7=B9=FB=
=C4=FA=B4=ED=CA=D5=C1=CB=B1=BE=D3=CA=BC=FE=A3=AC=C7=EB=C4=FA=C1=A2=BC=B4=B5=
=E7=BB=B0=BB=F2=D3=CA=BC=FE=CD=A8=D6=AA=B7=A2=BC=FE=C8=CB=B2=A2=C9=BE=B3=FD=
=B1=BE=D3=CA=BC=FE=A3=A1 This e-mail and its attachments contain confidenti=
al information from XIAOMI, which is intended only for the person or entity=
 whose address is listed above. Any use of the information contained herein=
 in any way (including, but not limited to, total or partial disclosure, re=
production, or dissemination) by persons other than the intended recipient(=
s) is prohibited. If you receive this e-mail in error, please notify the se=
nder by phone or email immediately and delete it!******/#


--===============6607608142964966331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6607608142964966331==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============6607608142964966331==--
