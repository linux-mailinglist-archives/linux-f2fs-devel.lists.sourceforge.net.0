Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DD5F64FDD9F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 13:28:06 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neEgm-0000Rg-DM; Tue, 12 Apr 2022 11:28:05 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1neEgj-0000RQ-MQ
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=50xlR4FpyQPxrNN9aGWo6TKW/LNL6gVyc2H0baY+Cxs=; b=KlrY40CL1lLbPJjKwfBrPPmTrR
 Y9wB+h2szd+lLH+e+oXRCxnLBO9Qe6ctARs/8wseLAmapH3kjSnHmO60sLVixmrT/GgW/gvkfZk3Q
 N+d55qiWpxyHQZ2K47QCpVqXUDYeQJxUL+yVi9wAIHpUT6bhCPYZv6GCbT9Sw2ram/Yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=50xlR4FpyQPxrNN9aGWo6TKW/LNL6gVyc2H0baY+Cxs=; b=k5kz8gWL7K3jtgnpW99HNQlrNv
 bYTIOnY/87NeTmTKtRZk5HtN+uSMs7OA2kyz3rE8PuYSn+iscQLpsRPmC7tXxuBwfTCeWse7rwIbw
 WfTIPBL0U49UGu8aDeuNGt5KJPbESftYJFO6kQ2ejuGZN45fXzkPzGNDTtM8YV9SWzWw=;
Received: from mailout1.w1.samsung.com ([210.118.77.11])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neEgf-00Dy23-BR
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:02 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412112750euoutp01914c95665b7b5421a568e9883ce1fb89~lIpbwlMeK0273802738euoutp01M
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 11:27:50 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com
 20220412112750euoutp01914c95665b7b5421a568e9883ce1fb89~lIpbwlMeK0273802738euoutp01M
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649762870;
 bh=50xlR4FpyQPxrNN9aGWo6TKW/LNL6gVyc2H0baY+Cxs=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=gSWyHsyUS03w+/tPAw5tS/zIVq6DYNd/ra8W8/24Ps5KFs70LHXIMvvbJh8n8yWAa
 xU1DvusGG7dKOQ89vVFcU7/K3eJOuVF08rX1M9hv9jr6BnbFQZsJnGlufpjO2DYZhc
 gCUACMFCPQQTi7zU2JvFoMnuwX67DVE5tlx11LJg=
Received: from eusmges3new.samsung.com (unknown [203.254.199.245]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTP id
 20220412112749eucas1p1f54477e86a46bf59180a761c3208426b~lIpbWy2Yi2064220642eucas1p1D;
 Tue, 12 Apr 2022 11:27:49 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges3new.samsung.com (EUCPMTA) with SMTP id 17.0D.10260.53265526; Tue, 12
 Apr 2022 12:27:49 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
 20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451~lIpbBfd1v0045600456eucas1p20;
 Tue, 12 Apr 2022 11:27:49 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412112749eusmtrp245a156ab3b49eba71ff8a2815470676e~lIpbA2ZeL1314913149eusmtrp2V;
 Tue, 12 Apr 2022 11:27:49 +0000 (GMT)
X-AuditID: cbfec7f5-bddff70000002814-9d-6255623573ea
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 34.76.09522.53265526; Tue, 12
 Apr 2022 12:27:49 +0100 (BST)
Received: from localhost (unknown [106.210.248.108]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220412112749eusmtip2ba7b7d1c60bfa0aeaada52c782b949e2~lIpavgwy81347413474eusmtip2a;
 Tue, 12 Apr 2022 11:27:49 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Apr 2022 13:27:45 +0200
Message-Id: <20220412112745.44108-4-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412112745.44108-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFupjleLIzCtJLcpLzFFi42LZduznOV3TpNAkg5mbNCxa278xWTy+85nd
 4uj/t2wWlxa5W9yY8JTR4vPSFnaLNTefsjiwe+ycdZfdY9OqTjaP3Qs+M3n0bVnF6NF+oJsp
 gDWKyyYlNSezLLVI3y6BK2Pn92nsBVe5K6a/sWtgnMLZxcjJISFgInHg7R/mLkYuDiGBFYwS
 MyafYIFwvjBK9Ow7xAjhfGaU2PjnCwtMy+rFE5hBbCGB5YwSc7c5QhS9ZJS4c+QFaxcjBweb
 gJZEYyc7SI0IkDmx4S/YIGaBmYwSB19MYwNJCAs4S8zbvxBsKIuAqsSSWXPBhvIKWEq8PLWP
 HWKZvMTMS9/BbE4BK4m531+xQNQISpyc+QTMZgaqad46G+wHCYEtHBLHXtxjhGh2kfj0uosJ
 whaWeHV8C9RQGYn/O+dDxaslnt74DdXcwijRv3M9G8gHEgLWEn1nckBMZgFNifW79CHKHSXO
 vP7PCFHBJ3HjrSDECXwSk7ZNZ4YI80p0tAlBVCtJ7Pz5BGqphMTlpjksECUeEqs6NScwKs5C
 8sssJL/MQli7gJF5FaN4amlxbnpqsXFearlecWJucWleul5yfu4mRmCSOf3v+NcdjCtefdQ7
 xMjEwXiIUYKDWUmEt189NEmINyWxsiq1KD++qDQntfgQozQHi5I4b3LmhkQhgfTEktTs1NSC
 1CKYLBMHp1QDU9yrTmvbaAcG6TfOnJunS8m8tnrxY17j5wYJtcfNJ9TEHopdOCUau4HPzddd
 7N8MxsbTR2M+nXc2Cr4yK+g7s9ThRdNPL3wSvEh0s647m86MG/0r7I5ea/dM0TNlCL7/3N/s
 UeDuIwUL7FqeHd+3fQvvP9ZFB36waC33ObB95/ReN6v3liu6+xXUmB6o/HFt/nrPadGRprtV
 SdUPPuy/cF/1fj5rvUXHPYfQh5787TfMtTefSY3a6GFjW6jsesLoRvM8xzsVJ07q3drhYqbP
 sDHoxpHuFR9KvBU42coaAkSvN/Au7Ajs0LkTJ+8QvscghG9O6+xjfcUqjYvXaDRlH0jsfql3
 6HDhrmDtz82mSizFGYmGWsxFxYkAReRc8qEDAAA=
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7qmSaFJBu+PCFq0tn9jsnh85zO7
 xdH/b9ksLi1yt7gx4SmjxeelLewWa24+ZXFg99g56y67x6ZVnWweuxd8ZvLo27KK0aP9QDdT
 AGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsbO
 79PYC65yV0x/Y9fAOIWzi5GTQ0LARGL14gnMXYxcHEICSxklvp/oZIdISEjcXtjECGELS/y5
 1sUGUfScUWLVsrVMXYwcHGwCWhKNEPUiQObEhr+MIDXMAvMZJY5Nvg6WEBZwlpi3fyELiM0i
 oCqxZNZcZhCbV8BS4uWpfVDL5CVmXvoOZnMKWEnM/f4KrF4IqObL/XWMEPWCEidnPgGLMwPV
 N2+dzTyBUWAWktQsJKkFjEyrGEVSS4tz03OLDfWKE3OLS/PS9ZLzczcxAmNi27Gfm3cwznv1
 Ue8QIxMH4yFGCQ5mJRHefvXQJCHelMTKqtSi/Pii0pzU4kOMpkB3T2SWEk3OB0ZlXkm8oZmB
 qaGJmaWBqaWZsZI4r2dBR6KQQHpiSWp2ampBahFMHxMHp1QDU5ekvFt8lyhnfHMOe31qfmd8
 0mPTS029yztWX5KY97V8TrN5b7RGxz+vuJN6dizrfz+PDgxcULxzmqfayXzRa7vmeScc+XLo
 UsuEy3csO5W1WU3Whb89ZHI5TrEx9rHenf3zCkoe/dx2aceLlmf3HM3ySkKYL6zNcLU63i2x
 24Gdy7qJPViubOKjW1vXa+VPZldKYy603/5RIZbZhS1du7IntGla/LSQbtVCFv41dqaazlw6
 3yISVfZzZwioPQ1bVVXLnrONTVpFacGxjkeTdkzfV3OvsrzbeG7trCO7xZ7+nLd9yVSD6xKT
 SiNXy7pld37W4p5+/MP5RK7U9xXyS9MqTnX9f1meszL4wXslluKMREMt5qLiRABrtoipEgMA
 AA==
X-CMS-MailID: 20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451
X-Msg-Generator: CA
X-RootMTR: 20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112749eucas1p28b82e6b3b563f2e25c78f479c1192451@eucas1p2.samsung.com>
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Luis Chamberlain <mcgrof@kernel.org> f2fs currently
 only work with zoned storage devices with a zone size which is a power of
 2 (PO2). So check if a non-power of 2 zone is device is found,
 and if so disallow its use. This prevents users [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.11 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.11 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neEgf-00Dy23-BR
Subject: [f2fs-dev] [PATCH 3/3] libf2fs: don't allow mkfs / fsck on zoned
 NPO2
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
Cc: Pankaj Raghav <p.raghav@samsung.com>, Damien.LeMoal@wdc.com,
 pankydev8@gmail.com, mcgrof@kernel.org, javier.gonz@samsung.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: Luis Chamberlain <mcgrof@kernel.org>

f2fs currently only work with zoned storage devices with a zone
size which is a power of 2 (PO2). So check if a non-power of 2
zone is device is found, and if so disallow its use. This prevents
users from incorrectly using these devices.

This is a non-issue today give today's kernel does not allow NPO2
zon devices to exist. But these devices do exist, and so proactively
put a stop-gap measure in place to prevent the from being assumed
to be used.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 lib/libf2fs.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 8fad1d7..a13ba32 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -882,6 +882,11 @@ static int open_check_fs(char *path, int flag)
 	return open(path, O_RDONLY | flag);
 }
 
+static int is_power_of_2(unsigned long n)
+{
+	return (n != 0 && ((n & (n - 1)) == 0));
+}
+
 int get_device_info(int i)
 {
 	int32_t fd = 0;
@@ -1043,6 +1048,13 @@ int get_device_info(int i)
 			return -1;
 		}
 
+		if (!dev->zone_size || !is_power_of_2(dev->zone_size)) {
+			MSG(0, "\tError: zoned: illegal zone size %lu (not a power of 2)\n",
+					dev->zone_size);
+			free(stat_buf);
+			return -1;
+		}
+
 		/*
 		 * Check zone configuration: for the first disk of a
 		 * multi-device volume, conventional zones are needed.
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
