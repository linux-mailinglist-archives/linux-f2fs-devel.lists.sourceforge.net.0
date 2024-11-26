Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F17E9D91E4
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 26 Nov 2024 07:45:49 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tFpKK-0000wD-AN;
	Tue, 26 Nov 2024 06:45:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang1@xiaomi.com>) id 1tFpKI-0000w5-Bm
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 06:45:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GhNpY+7MNd2l/d5pwlgHNlDYChihSGkx/yYj3rMp66E=; b=jc8Q4iqgNvzGyBztLXybTPpaQN
 aGQBPLppJVzd4SMBW9++uMOxd7cuyA1+8kBSvg23Z62s40QQavRNhIPLwxHb0TlLvAd8KkFtPbkHA
 FTnltyMhOkE9gPqXj5F08ZySStEpOStKanhJPzHetGDkNOouphklGqrMR0FrhT+KhPoE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GhNpY+7MNd2l/d5pwlgHNlDYChihSGkx/yYj3rMp66E=; b=C
 AmF3YCZI3hwukd2I2Y6U+hczDMxliKiCgtbUkvBelx7X9Pluyxl6B/DS9ItWbbPbzyQK3W6umQToa
 yUVS4SJtHAU2TcAkpiWcQeeSKA9rKOvnoh+sKsM+NkYf0apnXJzNQy4EEBl4gkSdby//TzqIL3MUA
 mlfTWSceLEixi1+o=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tFpKH-0000We-1N for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 26 Nov 2024 06:45:34 +0000
X-CSE-ConnectionGUID: NAOGOMEdRR2KbOMDMuw3nw==
X-CSE-MsgGUID: q4lfMYyeTwGT4piHzTcbDQ==
X-IronPort-AV: E=Sophos;i="6.12,185,1728921600"; d="scan'208";a="101749439"
To: <chao@kernel.org>
Date: Tue, 26 Nov 2024 14:45:09 +0800
Message-ID: <20241126064509.3943768-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Originating-IP: [10.149.44.251]
X-ClientProxiedBy: yz-mbx13.mioffice.cn (10.237.88.133) To
 bj-mbx11.mioffice.cn (10.237.8.131)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch supports to map continuous holes to improve
 performace
 of lookuping mapping info during fiemap. [testcase] truncate -s 1m hole &&
 fsync hole f2fs_io fiemap 0 256 hole [before] f2fs_map_blocks: dev = (254, 54),
 ino = 18563, file offset = 0, start blkaddr = 0x0, len = 0x0, flags = 0,
 seg_type = 8, may_create = 0, multidevice = 0, flag = 1,
 err = 0 f2fs_map_blocks: dev [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [118.143.206.90 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [118.143.206.90 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tFpKH-0000We-1N
Subject: [f2fs-dev] [PATCH] f2fs: fiemap support to map continuous holes
 address
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
Cc: jaegeuk@kernel.org, zangyangyang1 <zangyangyang1@xiaomi.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: multipart/mixed; boundary="===============6762588960135831795=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============6762588960135831795==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This patch supports to map continuous holes to improve
performace of lookuping mapping info during fiemap.

[testcase]
truncate -s 1m hole && fsync hole
f2fs_io fiemap 0 256 hole

[before]
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 0, start =
blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =3D 0=
, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 1, start =
blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =3D 0=
, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 2, start =
blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =3D 0=
, multidevice =3D 0, flag =3D 1, err =3D 0
......
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 863, star=
t blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =3D=
 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 864, star=
t blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =3D=
 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 1882, sta=
rt blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 2900, sta=
rt blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 1039224, =
start blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create=
 =3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 18563, file offset =3D 2075548, =
start blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create=
 =3D 0, multidevice =3D 0, flag =3D 1, err =3D 0

[after]
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 0, start =
blkaddr =3D 0x0, len =3D 0x100, flags =3D 0, seg_type =3D 8, may_create =3D=
 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 256, star=
t blkaddr =3D 0x0, len =3D 0x100, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 512, star=
t blkaddr =3D 0x0, len =3D 0x100, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 768, star=
t blkaddr =3D 0x0, len =3D 0x60, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 1882, sta=
rt blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 2900, sta=
rt blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create =
=3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 1039224, =
start blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create=
 =3D 0, multidevice =3D 0, flag =3D 1, err =3D 0
f2fs_map_blocks: dev =3D (254,54), ino =3D 19959, file offset =3D 2075548, =
start blkaddr =3D 0x0, len =3D 0x0, flags =3D 0, seg_type =3D 8, may_create=
 =3D 0, multidevice =3D 0, flag =3D 1, err =3D 0

Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
---
 fs/f2fs/data.c | 17 +++++++++--------
 1 file changed, 9 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index ee5614324df0..a7e82994e230 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1526,7 +1526,7 @@ static bool map_is_mergeable(struct f2fs_sb_info *sbi=
,
                return true;
        if (flag =3D=3D F2FS_GET_BLOCK_PRE_DIO)
                return true;
-       if (flag =3D=3D F2FS_GET_BLOCK_DIO &&
+       if ((flag =3D=3D F2FS_GET_BLOCK_DIO || flag =3D=3D F2FS_GET_BLOCK_F=
IEMAP) &&
                map->m_pblk =3D=3D NULL_ADDR && blkaddr =3D=3D NULL_ADDR)
                return true;
        return false;
@@ -1648,11 +1648,8 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs=
_map_blocks *map, int flag)
                        map->m_pblk =3D 0;
                        goto sync_out;
                case F2FS_GET_BLOCK_FIEMAP:
-                       if (blkaddr =3D=3D NULL_ADDR) {
-                               if (map->m_next_pgofs)
-                                       *map->m_next_pgofs =3D pgofs + 1;
-                               goto sync_out;
-                       }
+                       if (blkaddr =3D=3D NULL_ADDR && map->m_next_pgofs)
+                               *map->m_next_pgofs =3D pgofs + 1;
                        break;
                case F2FS_GET_BLOCK_DIO:
                        if (map->m_next_pgofs)
@@ -1676,8 +1673,12 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs=
_map_blocks *map, int flag)
                /* reserved delalloc block should be mapped for fiemap. */
                if (blkaddr =3D=3D NEW_ADDR)
                        map->m_flags |=3D F2FS_MAP_DELALLOC;
-               /* DIO READ and hole case, should not map the blocks. */
-               if (!(flag =3D=3D F2FS_GET_BLOCK_DIO && is_hole && !map->m_=
may_create))
+               /*
+                * DIO READ with hole case and fiemap with NULL address cas=
e,
+                * should not map the blocks.
+                */
+               if (!((flag =3D=3D F2FS_GET_BLOCK_DIO && is_hole && !map->m=
_may_create) ||
+                   (flag =3D=3D F2FS_GET_BLOCK_FIEMAP && blkaddr =3D=3D NU=
LL_ADDR)))
                        map->m_flags |=3D F2FS_MAP_MAPPED;

                map->m_pblk =3D blkaddr;
--
2.43.2

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


--===============6762588960135831795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============6762588960135831795==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============6762588960135831795==--
