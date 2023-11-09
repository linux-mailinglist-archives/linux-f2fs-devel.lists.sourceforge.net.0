Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 50D077E6B1B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Nov 2023 14:17:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1r14u5-0006t0-AZ;
	Thu, 09 Nov 2023 13:17:01 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang1@xiaomi.com>) id 1r14u4-0006su-8c
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 13:17:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=plj85F9WLioXkxP9SfvyWC1tRgkaQ+khbwC9ufMW280=; b=TrrbdLOnk3eXTb55n+vwXi5z5c
 LH0/TaAhFuR432QL3K39Y19cdo3U4hci6MyWqvszFq9I9A6RUWy2Tmqki0uxOyLjqVJABuI2azep+
 EScal4hPY9aufySvcTAZf4v1BDcl9u8tP8higxhtcS4wAtDmnIQicGXH6FkPDt1ZpJbo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:
 In-Reply-To:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=plj85F9WLioXkxP9SfvyWC1tRgkaQ+khbwC9ufMW280=; b=goOJkUouhgLM8B+gPMZX7RlrIB
 UyZoJulndiv6bPswTeWFMGy/WmKbx/jEO9bVV6vf6eTqQZJSlatcCb8S+MI0QcMABtaWW34SZNOeS
 9B+22NmvqdyXQFHXOzj2CVT95QYddhBOT1IEdoxbjYGHeCwsrP66pP74Tc6fgDiAoljQ=;
Received: from outboundhk.mxmail.xiaomi.com ([118.143.206.90])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1r14tz-000pKm-Ux for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Nov 2023 13:17:00 +0000
X-IronPort-AV: E=Sophos;i="6.03,289,1694707200"; d="scan'208";a="70295410"
To: <linux-f2fs-devel@lists.sourceforge.net>
Date: Thu, 9 Nov 2023 21:00:04 +0800
Message-ID: <20231109130004.261931-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230523122720.1628122-1-zangyangyang1@xiaomi.com>
References: <20230523122720.1628122-1-zangyangyang1@xiaomi.com>
MIME-Version: 1.0
X-Originating-IP: [10.237.8.18]
X-ClientProxiedBy: BJ-MBX14.mioffice.cn (10.237.8.134) To BJ-MBX12.mioffice.cn
 (10.237.8.132)
X-Spam-Score: 0.9 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This issue comes from a static code scanning tool. When
 c.sparse_mode
 is 1, stat_buf will not be initialized, but it will be used next. If this
 issue does not require modification, please ignore this [...] 
 Content analysis details:   (0.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [118.143.206.90 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.9 SPF_HELO_SOFTFAIL      SPF: HELO does not match SPF record (softfail)
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1r14tz-000pKm-Ux
Subject: [f2fs-dev] [PATCH V2] libf2fs: Fix using uninitialized variables
 error in get_device_info()
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
Cc: zangyangyang1@xiaomi.com, jaegeuk@kernel.org
Content-Type: multipart/mixed; boundary="===============4149022107736820605=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============4149022107736820605==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

This issue comes from a static code scanning tool.
When c.sparse_mode is 1, stat_buf will not be initialized,
but it will be used next.
If this issue does not require modification, please ignore this commit.

Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
---
Changes since v1:
- Use calloc() instead of malloc()
---
 lib/libf2fs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 995e42d..47d4e49 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -931,7 +931,7 @@ int get_device_info(int i)
                }
        }

-       stat_buf =3D malloc(sizeof(struct stat));
+       stat_buf =3D calloc(1, sizeof(struct stat));
        ASSERT(stat_buf);

        if (!c.sparse_mode) {
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


--===============4149022107736820605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============4149022107736820605==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============4149022107736820605==--
