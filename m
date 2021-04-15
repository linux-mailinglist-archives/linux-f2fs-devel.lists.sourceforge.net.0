Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DE56B36164B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Apr 2021 01:32:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lXBTS-000055-QK; Thu, 15 Apr 2021 23:32:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <jh80.chung@samsung.com>) id 1lXBTQ-00004v-MU
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Apr 2021 23:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BJE8PuHZnUrE4JRZla2hGg+ygVsKLG+nVFrG6xZTNAo=; b=X4TwVzlfUjR5StIQrbJFKSENYq
 5QzuD6QonwFbBXodHom1BfehnGShbRrqPnYTs3xDy0GdidLLR2BcwGEus81KE04WtfjFK99WvlVjA
 HXQivs3QS4eSS6IXIhm+UDeLXwuaWme8W0WFIObW/LA3EOaL6rn54djHPV/VSb7WuBCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BJE8PuHZnUrE4JRZla2hGg+ygVsKLG+nVFrG6xZTNAo=; b=m
 Le1g8f6ZYn7k/yclfXvKzHtjG3/TQ/AwnSLrIS6buNIyXNv7gzZdZIJAuqitJ2RsNcdQfP3NH7DyP
 h06sR3TI6Q5SGv3WdB+W6uj4kWErDj6snfcTh0YoW42/AH0sQFTixLKAxoPll3BsA0Ln/ICkH9xb8
 //UNakvg44/WQKEk=;
Received: from mailout4.samsung.com ([203.254.224.34])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1lXBTE-0007kM-V1
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 15 Apr 2021 23:32:36 +0000
Received: from epcas1p3.samsung.com (unknown [182.195.41.47])
 by mailout4.samsung.com (KnoxPortal) with ESMTP id
 20210415233213epoutp04ded2e1643e41c7e4678b07cedc28f6a5~2LAj5sDOA1666416664epoutp04U
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Thu, 15 Apr 2021 23:32:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout4.samsung.com
 20210415233213epoutp04ded2e1643e41c7e4678b07cedc28f6a5~2LAj5sDOA1666416664epoutp04U
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1618529533;
 bh=BJE8PuHZnUrE4JRZla2hGg+ygVsKLG+nVFrG6xZTNAo=;
 h=From:To:Cc:Subject:Date:References:From;
 b=PbXrxOp2bfcgi1OxzJxHPYn2koREmWl7oXWZMZe2+q+vuxNbSU7n6OuA7WJNqiCu9
 KFf+MQ0tmZ6voe+8X7B7MqWSirzeh5YkLqHTGDHOyICLeZB7F5VrJhR19yJsQkvM1Q
 hcIrxbXsVDCgSgiQgLdsU0M6QhSv57D7f/3LuKj4=
Received: from epsnrtp1.localdomain (unknown [182.195.42.162]) by
 epcas1p4.samsung.com (KnoxPortal) with ESMTP id
 20210415233212epcas1p42221edf2537c9ddc4da0f4ee9c7441c7~2LAjn9oZm1281112811epcas1p4Y;
 Thu, 15 Apr 2021 23:32:12 +0000 (GMT)
Received: from epsmges1p1.samsung.com (unknown [182.195.40.153]) by
 epsnrtp1.localdomain (Postfix) with ESMTP id 4FLwbs4f4gz4x9Q7; Thu, 15 Apr
 2021 23:32:09 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p1.samsung.com (Symantec Messaging Gateway) with SMTP id
 B7.6F.07927.9FCC8706; Fri, 16 Apr 2021 08:32:09 +0900 (KST)
Received: from epsmtrp1.samsung.com (unknown [182.195.40.13]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20210415233209epcas1p1e0a4c41f11000e373227bf847219db14~2LAgImTfx1660516605epcas1p1v;
 Thu, 15 Apr 2021 23:32:09 +0000 (GMT)
Received: from epsmgms1p1new.samsung.com (unknown [182.195.42.41]) by
 epsmtrp1.samsung.com (KnoxPortal) with ESMTP id
 20210415233209epsmtrp11a85dcc4c74377af117c068ed02dd10e~2LAgH8vkY2015720157epsmtrp1U;
 Thu, 15 Apr 2021 23:32:09 +0000 (GMT)
X-AuditID: b6c32a35-9bbff70000011ef7-b3-6078ccf97a96
Received: from epsmtip2.samsung.com ( [182.195.34.31]) by
 epsmgms1p1new.samsung.com (Symantec Messaging Gateway) with SMTP id
 53.EA.33967.8FCC8706; Fri, 16 Apr 2021 08:32:09 +0900 (KST)
Received: from jaehoon-DeskTop.10.32.193.11 (unknown [10.113.113.235]) by
 epsmtip2.samsung.com (KnoxPortal) with ESMTPA id
 20210415233208epsmtip2c85faed8563f9fdb19f686a04da0672c~2LAf4a5dT1012510125epsmtip2Y;
 Thu, 15 Apr 2021 23:32:08 +0000 (GMT)
From: Jaehoon Chung <jh80.chung@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Fri, 16 Apr 2021 08:32:56 +0900
Message-Id: <20210415233256.29122-1-jh80.chung@samsung.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrMKsWRmVeSWpSXmKPExsWy7bCmvu7PMxUJBr3flS2erJ/FbHHjVxur
 xaVF7g7MHptWdbJ57F7wmcmjb8sqxgDmqGybjNTElNQihdS85PyUzLx0WyXv4HjneFMzA0Nd
 Q0sLcyWFvMTcVFslF58AXbfMHKBFSgpliTmlQKGAxOJiJX07m6L80pJUhYz84hJbpdSClJwC
 ywK94sTc4tK8dL3k/FwrQwMDI1OgwoTsjPWr3rIWPGCteDPzBEsD4yWWLkZODgkBE4mF896w
 dzFycQgJ7GCUuPxsKZTziVHi4sblzBDON0aJno43zDAtPT0HmSASexklGraehXJ+M0rcW/iT
 EaSKTUBHYvu340wgtoiAlsTEhr9gcWYBO4mzDxawgdjCAv4SO67PYAWxWQRUJRYe2MwOYvMK
 WEss6utlgtgmL/Hnfg8zRFxQ4uTMJywQc+QlmrfOBjtPQmARu8Tj7wegPnKRmP12OtSpwhKv
 jm9hh7ClJF72t0HZ1RK7ms9ANXcwStza1gS1zVhi/9LJQDYH0AZNifW79CHCihI7f8+FeoBP
 4t3XHlaQEgkBXomONiGIEhWJS69fMsGsuvvkPyuE7SHRcxoSckICsRJvZkxnnsAoPwvJO7OQ
 vDMLYfECRuZVjGKpBcW56anFhgWGyNG6iRGc2rRMdzBOfPtB7xAjEwfjIUYJDmYlEV7jzooE
 Id6UxMqq1KL8+KLSnNTiQ4ymwACeyCwlmpwPTK55JfGGpkbGxsYWJoZmpoaGSuK8SQYP4oUE
 0hNLUrNTUwtSi2D6mDg4pRqYko5rTlj00vvEtn7tuMo/3b693PfZzSZL/THYaXJiv3PSl0U8
 z+NufTLQM3uh/6eqxCXmc3Lah1P3GI9ZhH3d2nF+jurOLSuEzEULRT7dPeIQbPskK4nRLNm9
 Jj+05ZlBrdal03HsdrVXRJW7V95LtFLRYGj70cRgHtNxOsP0rLxI7s590a3Hmk45HPZlVXf4
 5aLk2v1A+dr7plWlLEulE5u2HXHv3+GTPOlnqQTbwQ3fw258XrpYd/OOJYGi/2RFFqcWHW1X
 9H/DuUx5j/HNJEXJ40+dAsMcPU/MPfqhwH7R/awDHRnKgZGLXRN22l94eVtG/nw979/ku69Y
 Ms/vcGSt+Xtp90SfqYJrpOOVWIozEg21mIuKEwH69DV19gMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjluLIzCtJLcpLzFFi42LZdlhJXvfnmYoEg123mSyerJ/FbHHjVxur
 xaVF7g7MHptWdbJ57F7wmcmjb8sqxgDmKC6blNSczLLUIn27BK6M9aveshY8YK14M/MESwPj
 JZYuRk4OCQETiZ6eg0xdjFwcQgK7GSUebelmhkhISXx+OpWti5EDyBaWOHy4GKLmJ6PEh5s7
 mEBq2AR0JLZ/Ow5miwhoSUxs+MsIUs8s4CDxfZcXiCks4Cvxb44KSAWLgKrEwgOb2UFsXgFr
 iUV9vUwQm+Ql/tzvYYaIC0qcnPkE7DRmoHjz1tnMExj5ZiFJzUKSWsDItIpRMrWgODc9t9iw
 wDAvtVyvODG3uDQvXS85P3cTIzjItDR3MG5f9UHvECMTB+MhRgkOZiURXuPOigQh3pTEyqrU
 ovz4otKc1OJDjNIcLErivBe6TsYLCaQnlqRmp6YWpBbBZJk4OKUamA5+fPD0heKVFfu8G8ve
 FH1dtyHL0vF7scWExMdeLzQtFvPlSOlOTfQ6seX91JUi14IKHRoS51sUGfvYFssy/ig9/Hl6
 T26Xo2Plw9Lks5Icqy7Mu5PX79Tz3GVlnOk0LVuZb0kO6Vb/FU6Lc6pw62t9s1ghPzfr7uGr
 TtsaJWxbLvQ6rKxZuD56VajtjgPmZ2rtUq7/m/SXi/NHOaf/IhVOfQmnKZPm6k89q9RUEm3u
 qvlDuefZNavHSwSFIvl3bJ8jOc0wy4jRUcagyG7G4qVaF8MPqh2ZeJGBwaexsTmU7ZPG8S2L
 Jyf5zSgMLMizvXNhV5F9afWC+3/7pKtrlVZl1U6sVV199lPmKndzJZbijERDLeai4kQAv8Xu
 FaECAAA=
X-CMS-MailID: 20210415233209epcas1p1e0a4c41f11000e373227bf847219db14
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210415233209epcas1p1e0a4c41f11000e373227bf847219db14
References: <CGME20210415233209epcas1p1e0a4c41f11000e373227bf847219db14@epcas1p1.samsung.com>
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.34 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1lXBTE-0007kM-V1
Subject: [f2fs-dev] [PATCH] f2fs-tool: increase debug level from 0 to 1 in
 migrate_block
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
Cc: Jaehoon Chung <jh80.chung@samsung.com>, jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Increase debug level from 0 to 1 in migrate_block.
It seems that doesn't need to display debug message by default.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 fsck/defrag.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index 347363752eea..a630a78f4899 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -53,7 +53,7 @@ static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
 	else
 		update_nat_blkaddr(sbi, 0, le32_to_cpu(sum.nid), to);
 
-	DBG(0, "Migrate %s block %"PRIx64" -> %"PRIx64"\n",
+	DBG(1, "Migrate %s block %"PRIx64" -> %"PRIx64"\n",
 					IS_DATASEG(type) ? "data" : "node",
 					from, to);
 	free(raw);
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
