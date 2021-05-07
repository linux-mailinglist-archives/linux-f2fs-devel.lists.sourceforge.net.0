Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C32B2376452
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  7 May 2021 13:09:59 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1leyMo-0000Bb-0n; Fri, 07 May 2021 11:09:58 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <sw0312.kim@samsung.com>) id 1leyMl-0000BQ-RE
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 11:09:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l2PO2O1mNCyWTDvw4ULpOWi9veFuk56983ljENJwuV8=; b=ZxxGoPSJmTssO61lidAmCO9kzh
 BP4ZiMyfWAFTTWojtet/fsLphHbn2Rz5yxOn5/3NkUdbEn+D7ZNmxbRy1GVFFHwgG/ZtbjITfsJZX
 rv3Us/KZRLpLMioOF3kfAdp8ktkj6U957vMoiYap/jpkYg7aTb9rXQ3yIsn0nN11QqrY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l2PO2O1mNCyWTDvw4ULpOWi9veFuk56983ljENJwuV8=; b=V
 c/Mk+zZUu0oTI7AzuQS/FtQh0VnqLIqbs9WuhVVnbxu/XCU40b1LwJ2/rHvtVVCgsE1v0QnOvI9MZ
 oO8eHq3oKjEA/NZmRmxBxwnhQpkNd5rsa/qQA83De0NryRRm+cKv2D9kVHW8JleNTkofWRW0nC1c0
 SuDDhEa/bRcw1Ek0=;
Received: from mailout2.samsung.com ([203.254.224.25])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1leyMc-009Ylx-A0
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 07 May 2021 11:09:56 +0000
Received: from epcas1p2.samsung.com (unknown [182.195.41.46])
 by mailout2.samsung.com (KnoxPortal) with ESMTP id
 20210507110936epoutp02eb2cac1989cefdbb347363dc999d5664~8xEc4_Aos2295622956epoutp021
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Fri,  7 May 2021 11:09:36 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.samsung.com
 20210507110936epoutp02eb2cac1989cefdbb347363dc999d5664~8xEc4_Aos2295622956epoutp021
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1620385776;
 bh=l2PO2O1mNCyWTDvw4ULpOWi9veFuk56983ljENJwuV8=;
 h=From:To:Cc:Subject:Date:References:From;
 b=Yx43/NENLsmTLjY1d3rA7md8s6X/5sMG9sugo6+8gMGfRfA1JeQsh1QE4kFf5la4G
 RLc8T0GG2Op3CdtfjTpVVRLbCVwBOAVSzj0KA7ACZG83nKN+xU10daF/gn62BQleNw
 XVp9ayVsuZrCM7UjB8KjGa8gBfZG44qSi3zewgBA=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p3.samsung.com (KnoxPortal) with ESMTP id
 20210507110932epcas1p3f5a6385a9354a179a22147a6ad3a21f9~8xEZDreD00277802778epcas1p3P;
 Fri,  7 May 2021 11:09:32 +0000 (GMT)
Received: from epsmges1p2.samsung.com (unknown [182.195.40.158]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4Fc74n3tYnz4x9Ps; Fri,  7 May
 2021 11:09:29 +0000 (GMT)
Received: from epcas1p4.samsung.com ( [182.195.41.48]) by
 epsmges1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 B9.AA.09701.9EF15906; Fri,  7 May 2021 20:09:29 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210507110917epcas1p13e027d5e0319629c255524c8c6f6461b~8xELpN04e1582315823epcas1p1E;
 Fri,  7 May 2021 11:09:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210507110917epsmtrp1859932ca66496b70432e520acdaef19a~8xELonzHm2530025300epsmtrp1X;
 Fri,  7 May 2021 11:09:17 +0000 (GMT)
X-AuditID: b6c32a36-647ff700000025e5-13-60951fe979f1
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 D9.DD.08163.DDF15906; Fri,  7 May 2021 20:09:17 +0900 (KST)
Received: from localhost.localdomain (unknown [10.113.221.223]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210507110917epsmtip2e5d823a447628681de0f92045ff3dd74~8xELatYnb2768827688epsmtip25;
 Fri,  7 May 2021 11:09:17 +0000 (GMT)
From: Seung-Woo Kim <sw0312.kim@samsung.com>
To: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net
Date: Fri,  7 May 2021 20:12:23 +0900
Message-Id: <20210507111224.29887-1-sw0312.kim@samsung.com>
X-Mailer: git-send-email 2.19.2
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrAKsWRmVeSWpSXmKPExsWy7bCmge5L+akJBic6pS1OTz3LZPFk/Sxm
 i0uL3C0u75rDZjFj8ks2B1aPTas62Tx2L/jM5NG3ZRWjx+dNcgEsUdk2GamJKalFCql5yfkp
 mXnptkrewfHO8aZmBoa6hpYW5koKeYm5qbZKLj4Bum6ZOUBrlRTKEnNKgUIBicXFSvp2NkX5
 pSWpChn5xSW2SqkFKTkFlgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGQf3TmAueMNSseHuB+YG
 xh/MXYycHBICJhIfL69j6WLk4hAS2MEocejdBkYI5xOjxJ/V36Aynxkl9je+ZYVpObf4MRtE
 YhejxPqXR6GcL4wSD759YQOpYhPQkdi/5DdYh4iAncSMC8eA4hwczAKeEgsmRYCEhQWCJW7s
 XcIIYrMIqEq8at/BAmLzClhLtB25CHWfvMSFDbdYIeKCEidnPgGrYQaKN2+dzQyyV0JgE7vE
 lOtPoK5zkZizfTcjhC0s8er4FnYIW0riZX8bO0RDM6PE0iW/WCCcHkaJOYtuQ3UbS+xfOpkJ
 4lJNifW79CHCihI7f89lhNjMJ/Huaw8rSImEAK9ER5sQRImKxM6jk9ggwlISszYEQ4Q9JP78
 vgH2i5BArMSkH1NZJzDKz0Lyziwk78xC2LuAkXkVo1hqQXFuemqxYYERcqxuYgQnPS2zHYyT
 3n7QO8TIxMF4iFGCg1lJhPf0oskJQrwpiZVVqUX58UWlOanFhxhNgQE8kVlKNDkfmHbzSuIN
 TY2MjY0tTAzNTA0NlcR5052rE4QE0hNLUrNTUwtSi2D6mDg4pRqYtJ5MXTvz+nz2f7e7he/U
 LF1i4ao70fFQakTdopPSN2dlR+1brr9Q7lBtziJu2UntlYcvVwjyarA8W5/61yZAakPl/nOb
 xEK4Hj5O982tzWw+kFb5b+7qn1ufJ73gPD79fYZHRsOlOcmnBOvC/kTp1nId/xg276GnUtRm
 W02N4oXfw9v13Ze1Tf2WKBS2uXHp8TAGKeFv2zkc2/L1tk64eXPKu9V7Q7Y6CtjsijzYJTBN
 Ztnb7Dj2X2e/t5s+DlMLyzM/4BA99epr5j8W1bkTfl2fW/j7p/LKww9XpAbPE5ducuv9+OLS
 xGN/svVLF9ucVAxbnq9QE3MsycZedl3SmSPTeEv9nv671sRyY6FeqhJLcUaioRZzUXEiAIbF
 cssDBAAA
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprDLMWRmVeSWpSXmKPExsWy7bCSvO5d+akJBrtuyFmcnnqWyeLJ+lnM
 FpcWuVtc3jWHzWLG5JdsDqwem1Z1snnsXvCZyaNvyypGj8+b5AJYorhsUlJzMstSi/TtErgy
 Du6dwFzwhqViw90PzA2MP5i7GDk5JARMJM4tfswGYgsJ7GCUuDAxAyIuJTH323bGLkYOIFtY
 4vDhYoiST4wS66YLgdhsAjoS+5f8ZgWxRQQcJFZs28ICYjML+EpMe7oSbKSwQKBE76tpTCA2
 i4CqxKv2HWA1vALWEm1HLkKdIC9xYcMtVoi4oMTJmU+g5shLNG+dzTyBkW8WktQsJKkFjEyr
 GCVTC4pz03OLDQuM8lLL9YoTc4tL89L1kvNzNzGCA1BLawfjnlUf9A4xMnEwHmKU4GBWEuE9
 vWhyghBvSmJlVWpRfnxRaU5q8SFGaQ4WJXHeC10n44UE0hNLUrNTUwtSi2CyTBycUg1MpUe+
 uhx+/Wg907uPzXPn/m8w/8Ax1bLivXgA3xR9/ZarbSLPunP//219xuSx+MQDG67mMzWLNxob
 Cz4PKn4htFiQP/VhZOFypqlf3+qf9eD9KPOZ90zUxgQLywPffiyTmjW7e5PBsv3/HiZ5bFc0
 W99hca/rycYlsosOrZ/luaVxWbVUZIu+/TN1tp2cpV2r6u/xuilE7xZUiOlgjU1nbDxXeMAi
 JnCpYsv17MiVrZFOrXwNmpzruNbb6nBuZF+//WPVj2bDxds6c7/vqt9mVXcwe6ndrQliggtL
 LfQvrtGu75soFJtv3Nbg3vHZpehuanhlfONl2TV/d051VXgvtXbCr787lb+acIvr3pmoxFKc
 kWioxVxUnAgAbX8FrK8CAAA=
X-CMS-MailID: 20210507110917epcas1p13e027d5e0319629c255524c8c6f6461b
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210507110917epcas1p13e027d5e0319629c255524c8c6f6461b
References: <CGME20210507110917epcas1p13e027d5e0319629c255524c8c6f6461b@epcas1p1.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [203.254.224.25 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1leyMc-009Ylx-A0
Subject: [f2fs-dev] [RESEND][PATCH 1/2] resize.f2fs: fix memory leak caused
 by migrate_nat()
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
Cc: sw0312.kim@samsung.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Alloced nat_block doesn't freed from migrate_nat(). Fix to free
nat_block.

Signed-off-by: Seung-Woo Kim <sw0312.kim@samsung.com>
---
 fsck/resize.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/fsck/resize.c b/fsck/resize.c
index b043cd984dc6..78d578ec2cc1 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -383,6 +383,7 @@ static void migrate_nat(struct f2fs_sb_info *sbi,
 		ASSERT(ret >= 0);
 		DBG(3, "Write NAT: %lx\n", block_addr);
 	}
+	free(nat_block);
 	DBG(0, "Info: Done to migrate NAT blocks: nat_blkaddr = 0x%x -> 0x%x\n",
 			old_nat_blkaddr, new_nat_blkaddr);
 }
-- 
2.19.2



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
