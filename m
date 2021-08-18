Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EA53F3F0160
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Aug 2021 12:11:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.90_1)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mGIXq-0001hq-Ku; Wed, 18 Aug 2021 10:11:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.90_1)
 (envelope-from <jh80.chung@samsung.com>) id 1mGIXo-0001hf-Tc
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 10:11:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=s3f8xfwmEOfnGNXhCKirg6V+nRIYJlqZVMDvGyktGAQ=; b=BOZQXDTiBidNb5kqTwOyNa37qj
 UWd39INvaObUzduLepRMrR5gvNeGQ/YZCU8/KbWbIKFC9MqIdcjvleEwv92Lfx0lAYHMbQcVX+Plo
 d6XHYXftaPaJnYWs4FcGdFn/Hq88LNQ5UvforuYDyWGU/70TyUPfHPKeTUiBktmRLUpM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:Message-Id
 :Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:
 Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
 In-Reply-To:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=s3f8xfwmEOfnGNXhCKirg6V+nRIYJlqZVMDvGyktGAQ=; b=P
 Wo/20qnN0gllPxMiTPjPdZsKGT71tEUHRiBTfuGTccwS4HQbbHdacb6suAnG/duOKIyvVhPC4WRvk
 eJXYP1HO1bfo5/xRn1CJkOFCxTVD/UQoqjg3Qmxhw5jb3Se7K26eo+EbMZjGMGR0X8552E/x6PCKh
 6/fdJYyNn1tIkd0s=;
Received: from mailout3.samsung.com ([203.254.224.33])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mGIXm-0002wV-IH
 for linux-f2fs-devel@lists.sourceforge.net; Wed, 18 Aug 2021 10:11:36 +0000
Received: from epcas1p4.samsung.com (unknown [182.195.41.48])
 by mailout3.samsung.com (KnoxPortal) with ESMTP id
 20210818101120epoutp03023cb72a5a1ca5178702b3470c475738~cXt-ICCZl1396213962epoutp03Y
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Wed, 18 Aug 2021 10:11:20 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout3.samsung.com
 20210818101120epoutp03023cb72a5a1ca5178702b3470c475738~cXt-ICCZl1396213962epoutp03Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1629281480;
 bh=s3f8xfwmEOfnGNXhCKirg6V+nRIYJlqZVMDvGyktGAQ=;
 h=From:To:Cc:Subject:Date:References:From;
 b=VB1xfvv5uV2ZMxRwlqJK6/ZrAaht/mSVC/VYIQqSOuCEUt2826vvvCq4VRoeyQleN
 5JWsdUUSwzcROCYRgCdHft5bn5SrDG/PGJCRw0Gzd33wHHHDMZB15/gtEPvxgQIwfF
 h0C+u/qbj7Cc8RozHl1+f0D1UDNDoPJcH3b3cC0M=
Received: from epsnrtp3.localdomain (unknown [182.195.42.164]) by
 epcas1p1.samsung.com (KnoxPortal) with ESMTP id
 20210818101120epcas1p127ad79dbbebbacdd13d9f29edaff9636~cXt_1W4gb1176411764epcas1p12;
 Wed, 18 Aug 2021 10:11:20 +0000 (GMT)
Received: from epsmges1p3.samsung.com (unknown [182.195.40.156]) by
 epsnrtp3.localdomain (Postfix) with ESMTP id 4GqNw567XZz4x9Pr; Wed, 18 Aug
 2021 10:11:17 +0000 (GMT)
Received: from epcas1p3.samsung.com ( [182.195.41.47]) by
 epsmges1p3.samsung.com (Symantec Messaging Gateway) with SMTP id
 B1.A0.21710.5CCDC116; Wed, 18 Aug 2021 19:11:17 +0900 (KST)
Received: from epsmtrp2.samsung.com (unknown [182.195.40.14]) by
 epcas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20210818101117epcas1p29573157a85608e87255d1af3a389f174~cXt7_Di6B2486124861epcas1p22;
 Wed, 18 Aug 2021 10:11:17 +0000 (GMT)
Received: from epsmgms1p2.samsung.com (unknown [182.195.42.42]) by
 epsmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20210818101117epsmtrp25f08daeb2a515740612ac2765372ca2e~cXt78NOE20383503835epsmtrp2g;
 Wed, 18 Aug 2021 10:11:17 +0000 (GMT)
X-AuditID: b6c32a37-059ff700000154ce-4e-611cdcc5ccc6
Received: from epsmtip1.samsung.com ( [182.195.34.30]) by
 epsmgms1p2.samsung.com (Symantec Messaging Gateway) with SMTP id
 4F.91.32548.4CCDC116; Wed, 18 Aug 2021 19:11:16 +0900 (KST)
Received: from jaehoon-DeskTop.10.32.193.11 (unknown [10.113.113.235]) by
 epsmtip1.samsung.com (KnoxPortal) with ESMTPA id
 20210818101116epsmtip1c9bad9c551957d3cc59fb8487327f33e~cXt7wEzmF1551215512epsmtip1s;
 Wed, 18 Aug 2021 10:11:16 +0000 (GMT)
From: Jaehoon Chung <jh80.chung@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Wed, 18 Aug 2021 19:12:03 +0900
Message-Id: <20210818101203.28314-1-jh80.chung@samsung.com>
X-Mailer: git-send-email 2.29.0
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFnrEKsWRmVeSWpSXmKPExsWy7bCmvu7ROzKJBod+6lo8WT+L2eLGrzZW
 i0uL3B2YPTat6mTz2L3gM5NH35ZVjAHMUdk2GamJKalFCql5yfkpmXnptkrewfHO8aZmBoa6
 hpYW5koKeYm5qbZKLj4Bum6ZOUCLlBTKEnNKgUIBicXFSvp2NkX5pSWpChn5xSW2SqkFKTkF
 lgV6xYm5xaV56XrJ+blWhgYGRqZAhQnZGX+eLWAsOMlWcXjvD8YGxkWsXYycHBICJhJXN+xj
 7mLk4hAS2MEosez0YijnE6PEleb37BDOZ0aJQw8fM8O0NN+eClW1i1Fi/dtzTBDOb0aJKW1v
 2UGq2AR0JLZ/O84EYosIaElMbPjLCGIzC9hJnH2wgA3EFhZwlzh9bBfYVBYBVYktfV1gNq+A
 tcSKtxPZIbbJS/y53wMVF5Q4OfMJC8QceYnmrbOhLlrELvH1ShGE7SJx7ngf1HPCEq+Ob4Ga
 IyXx+d1eNgi7WmJX8xmwDyQEOhglbm1rYoJIGEvsXzoZyOYAWqApsX6XPkRYUWLn77lQ9/NJ
 vPvawwpSIiHAK9HRJgRRoiJx6fVLJphVd5/8hzrBQ+L3vXtgrUICsRKvD69kncAoPwvJN7OQ
 fDMLYfECRuZVjGKpBcW56anFhgXGyLG6iRGc2LTMdzBOe/tB7xAjEwfjIUYJDmYlEV51DqlE
 Id6UxMqq1KL8+KLSnNTiQ4ymwPCdyCwlmpwPTK15JfGGpkbGxsYWJoZmpoaGSuK8xb7SiUIC
 6YklqdmpqQWpRTB9TBycUg1MGx8nLHng8+dT41zb+U9mly6xnvX/Tl1d3bJfvzpktL8JTzeS
 7Vi9ZF+e7b1N8+yPOx/f0HAn7VYW57T6lZyqC5b5VR5fH/Rjt5ijKtOWnzrTNyvGvzxzSH82
 9+y65d7Xr7h9P8vOG7Lae0dDnG/liTnd17KMJ8+NKOh8FqPxbEKCQHhPf/fSjl1R+a81/Xw+
 8tk/nWv+zCD85E3PrcvvXZjMOfP3x8sTrvsWbFz9sv1uWK3gZA1W+cXPQ4v+pVuzC73JM1L8
 r7zB6JnMh/u6+9nfMz/lSX3evPfEWqO9Go9Yn/AvfJr17E/1z9KPuT2dy0J/ty3cYLMha8/k
 kM1HF0371d9ZWuuknVfySv/3VSclluKMREMt5qLiRACWxJTG9QMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupnluLIzCtJLcpLzFFi42LZdlhJTvfIHZlEgxOrrC2erJ/FbHHjVxur
 xaVF7g7MHptWdbJ57F7wmcmjb8sqxgDmKC6blNSczLLUIn27BK6MP88WMBacZKs4vPcHYwPj
 ItYuRk4OCQETiebbU5m7GLk4hAR2MEqcmruRBSIhJfH56VS2LkYOIFtY4vDhYoian4wSP1d/
 ZAKpYRPQkdj+7TiYLSKgJTGx4S8jSD2zgIPE911eIGFhAXeJ08d2MYPYLAKqElv6usBsXgFr
 iRVvJ7JDrJKX+HO/ByouKHFy5hOwE5iB4s1bZzNPYOSbhSQ1C0lqASPTKkbJ1ILi3PTcYsMC
 o7zUcr3ixNzi0rx0veT83E2M4DDT0trBuGfVB71DjEwcjIcYJTiYlUR41TmkEoV4UxIrq1KL
 8uOLSnNSiw8xSnOwKInzXug6GS8kkJ5YkpqdmlqQWgSTZeLglGpgOnJZaNLdYv2lRk/mv25Y
 XZJmJeAd1JTo5tppf0twncgC3Wm//kxLa5BZf6n+pHBxX5txxV+GqS+/JlYxl6z7a3AtgTWK
 qWt12lrXZTv5C2b6l8QdXyR2PjZfQr/BR+WKbL3yXG8v++YTFn8qn569ozbXcof0GWa/T18C
 Gd/OsOTYybX0kOz0aYEzJt2ZcEKmUf2gTP3Gj+UXJO32v59wtZFtcsG/7ReZrU3fherxGaR/
 iDPNjdnb1/BgcRq39mPt/MB1RbHz+f0EfeSLDx8/N/fA2k3CGZtrFj2c7mt1+PPlve7z/jRu
 87uw7hTDwR9KPnPLt/K2K3yVlk9f9I2ZZ4nfvg6uo8d3RTvumjxPRYmlOCPRUIu5qDgRADs2
 ouSiAgAA
X-CMS-MailID: 20210818101117epcas1p29573157a85608e87255d1af3a389f174
X-Msg-Generator: CA
X-Sendblock-Type: SVC_REQ_APPROVE
CMS-TYPE: 101P
DLP-Filter: Pass
X-CFilter-Loop: Reflected
X-CMS-RootMailID: 20210818101117epcas1p29573157a85608e87255d1af3a389f174
References: <CGME20210818101117epcas1p29573157a85608e87255d1af3a389f174@epcas1p2.samsung.com>
X-Spam-Score: -0.8 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: samsung.com]
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [203.254.224.33 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1mGIXm-0002wV-IH
Subject: [f2fs-dev] [PATCH] fsck.f2fs: Update the usage about option of
 preen mode
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
Cc: jaegeuk@kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Update the usage about option of preen mode.
It's difficult to know about preen mode 2, because there is no
description in usage.

Signed-off-by: Jaehoon Chung <jh80.chung@samsung.com>
---
 fsck/main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/main.c b/fsck/main.c
index 260ff29dcdd2..f45079a6ec30 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -74,7 +74,7 @@ void fsck_usage()
 	MSG(0, "  -l show superblock/checkpoint\n");
 	MSG(0, "  -M show a file map\n");
 	MSG(0, "  -O feature1[feature2,feature3,...] e.g. \"encrypt\"\n");
-	MSG(0, "  -p preen mode [default:0 the same as -a [0|1]]\n");
+	MSG(0, "  -p preen mode [default:0 the same as -a [0|1|2]]\n");
 	MSG(0, "  -S sparse_mode\n");
 	MSG(0, "  -t show directory tree\n");
 	MSG(0, "  -q preserve quota limits\n");
-- 
2.29.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
