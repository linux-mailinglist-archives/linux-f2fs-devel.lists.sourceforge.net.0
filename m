Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 256079FCFD9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Dec 2024 04:39:56 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tR1CX-0007OR-GE;
	Fri, 27 Dec 2024 03:39:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <zangyangyang1@xiaomi.com>) id 1tR1CL-0007OB-So
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Dec 2024 03:39:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:Content-Transfer-Encoding:MIME-Version
 :Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=N8F0/SBGZUMn+FmEvZcioCfuOCEkyvSio6MV1ISvz+s=; b=V1p9rrULhkoAN0vPVS+TiVa1SD
 b9+DPhqWs57UE/R7vtldRMyV0z7ozeRmrH9dHZqwUz7N5RbI0qjVXltheeRDT/Nd0O4Q+KOOw79ui
 zT+XXIPaVD2bsm/64qZ+PNSZ1ZsWo5MyF2vLBuumB4Ri8IvyReL+NzFN4/SrhLbWivSQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
 Subject:CC:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=N8F0/SBGZUMn+FmEvZcioCfuOCEkyvSio6MV1ISvz+s=; b=F
 XIs0+qv08sJ954U5FgHaJ/ey/BvpG0raSKPqe3XgDzm/RYSfMCYR+IzuY1YwcU5E62YZ8B7z+AiDJ
 48owjl+Cu3gmfY0Fv8z1miYZQ4DwebJUyKLGEaOn7GDT0ghKpZpLptMq0LN2BgTslpLrAdZLBYObb
 m8FgcU12HGzKUdgg=;
Received: from outboundhk.mxmail.xiaomi.com ([207.226.244.122])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtp (Exim 4.95)
 id 1tR1CK-0005x3-Q9 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Dec 2024 03:39:37 +0000
X-CSE-ConnectionGUID: FtjdeTNWQTyTB8QVbN5RYQ==
X-CSE-MsgGUID: GeLu7PQ2Q3uj0+Z+yWIa0w==
X-IronPort-AV: E=Sophos;i="6.12,268,1728921600"; d="scan'208";a="129448166"
To: <chao@kernel.org>
Date: Fri, 27 Dec 2024 11:39:08 +0800
Message-ID: <20241227033908.2949683-1-zangyangyang1@xiaomi.com>
X-Mailer: git-send-email 2.43.2
MIME-Version: 1.0
X-Originating-IP: [10.237.88.13]
X-ClientProxiedBy: yz-mbx15.mioffice.cn (10.237.88.135) To
 bj-mbx11.mioffice.cn (10.237.8.131)
X-Spam-Score: 0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When f2fs_write_single_data_page fails,
 f2fs_write_cache_pages
 will use the last 'submitted' value incorrectly, which will cause 'nwritten'
 and 'wbc->nr_to_write' calculation errors Signed-off-by: zangyangyang1
 <zangyangyang1@xiaomi.com>
 --- V2: Initialize "submitted" in f2fs_write_single_data_page() ---
 fs/f2fs/data.c | 3 +++ 1 file changed, 3 insertions(+) 
 Content analysis details:   (0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.226.244.122 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [207.226.244.122 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [207.226.244.122 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1tR1CK-0005x3-Q9
Subject: [f2fs-dev] [PATCH V2] f2fs: fix using wrong 'submitted' value in
 f2fs_write_cache_pages
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
Content-Type: multipart/mixed; boundary="===============3569087695620218356=="
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

--===============3569087695620218356==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain

When f2fs_write_single_data_page fails, f2fs_write_cache_pages
will use the last 'submitted' value incorrectly, which will cause
'nwritten' and 'wbc->nr_to_write' calculation errors

Signed-off-by: zangyangyang1 <zangyangyang1@xiaomi.com>
---
V2: Initialize "submitted" in f2fs_write_single_data_page()
---
 fs/f2fs/data.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 94f7b084f601..f772fbc7f331 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2816,6 +2816,9 @@ int f2fs_write_single_data_page(struct folio *folio, =
int *submitted,

        trace_f2fs_writepage(folio, DATA);

+       if (submitted)
+               *submitted =3D 0;
+
        /* we should bypass data pages to proceed the kworker jobs */
        if (unlikely(f2fs_cp_error(sbi))) {
                mapping_set_error(folio->mapping, -EIO);
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


--===============3569087695620218356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


--===============3569087695620218356==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel

--===============3569087695620218356==--
