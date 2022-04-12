Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 43A594FDDA2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 12 Apr 2022 13:28:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1neEgo-00048S-7p; Tue, 12 Apr 2022 11:28:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <p.raghav@samsung.com>) id 1neEgn-00048B-0V
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=References:Content-Type:Content-Transfer-Encoding:
 MIME-Version:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FFKhY/dOwlDM7K6U00woVTIwnAtfl4SgWhcQ1xNlyuQ=; b=kRjK9B71KRb0uJ1kBv0ria5ywa
 vzDhoL5yQFYKlwRqiUMsLTYArMAh4slelvxwAVnjlb165iuGchtEctg28xKTk8RTPD9Z9U5meRjup
 29vFTgjFydB45CCpF0agFLRqZD7xdcEnH/q/2j0aXzP+CXcGO1upI8BHYmoho95SfKD4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=References:Content-Type:Content-Transfer-Encoding:MIME-Version:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=FFKhY/dOwlDM7K6U00woVTIwnAtfl4SgWhcQ1xNlyuQ=; b=kZVZ9pP0rcdXwmY3GeZDNVIXKy
 bKFF5/7LdKptIBsvxC1cMDvdYGugyANco3U5Lz3Ig3jp1FZx8YU4XOH3Pk7l+gUElkB7MIGukvEEA
 HRxsdnaxEs2VIM0oUFZBKfomxxmM2Qs1yOa5sCjwwUpOQjgPzzojvqQgjh2CiQkXWB8Q=;
Received: from mailout2.w1.samsung.com ([210.118.77.12])
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1neEgh-00Dy1y-6Z
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 12 Apr 2022 11:28:02 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
 by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id
 20220412112749euoutp027d3952622b83d99ae7c488d467a670b1~lIpbESgnY1521215212euoutp02k
 for <linux-f2fs-devel@lists.sourceforge.net>;
 Tue, 12 Apr 2022 11:27:49 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com
 20220412112749euoutp027d3952622b83d99ae7c488d467a670b1~lIpbESgnY1521215212euoutp02k
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
 s=mail20170921; t=1649762869;
 bh=FFKhY/dOwlDM7K6U00woVTIwnAtfl4SgWhcQ1xNlyuQ=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=OiHnAQobJF76gq3rmI5CGeiXPc1Q83R1AXCpqnD/+gsTopbRH3wWacTNKFuLil3zu
 u+4NT0NU6g0SuHr5xJb+CnEi+6dFRbLhEO4l4FqfzrIkjdyvA6c6iNtJsrifp/fp1W
 +avCLJUeqvjQCoBk7YNw5NlopFtXbIVPZDXxryHU=
Received: from eusmges2new.samsung.com (unknown [203.254.199.244]) by
 eucas1p2.samsung.com (KnoxPortal) with ESMTP id
 20220412112748eucas1p20a4e6648fa78ea0824bfb2e1b6bd5ad8~lIpahdqBm0045600456eucas1p2y;
 Tue, 12 Apr 2022 11:27:48 +0000 (GMT)
Received: from eucas1p1.samsung.com ( [182.198.249.206]) by
 eusmges2new.samsung.com (EUCPMTA) with SMTP id CA.E3.09887.43265526; Tue, 12
 Apr 2022 12:27:48 +0100 (BST)
Received: from eusmtrp2.samsung.com (unknown [182.198.249.139]) by
 eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
 20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31~lIpaF49oT1427114271eucas1p1a;
 Tue, 12 Apr 2022 11:27:48 +0000 (GMT)
Received: from eusmgms1.samsung.com (unknown [182.198.249.179]) by
 eusmtrp2.samsung.com (KnoxPortal) with ESMTP id
 20220412112748eusmtrp2957bdbf7ef45f1b04d0d4e04fc2378d6~lIpaFLyRE1299712997eusmtrp2i;
 Tue, 12 Apr 2022 11:27:48 +0000 (GMT)
X-AuditID: cbfec7f4-471ff7000000269f-dd-625562342627
Received: from eusmtip2.samsung.com ( [203.254.199.222]) by
 eusmgms1.samsung.com (EUCPMTA) with SMTP id 73.76.09522.43265526; Tue, 12
 Apr 2022 12:27:48 +0100 (BST)
Received: from localhost (unknown [106.210.248.108]) by eusmtip2.samsung.com
 (KnoxPortal) with ESMTPA id
 20220412112748eusmtip25b580e415f0cb7cf77608ee2ce8914be~lIpZw5MSN1347413474eusmtip2Z;
 Tue, 12 Apr 2022 11:27:48 +0000 (GMT)
From: Pankaj Raghav <p.raghav@samsung.com>
To: linux-f2fs-devel@lists.sourceforge.net
Date: Tue, 12 Apr 2022 13:27:44 +0200
Message-Id: <20220412112745.44108-3-p.raghav@samsung.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20220412112745.44108-1-p.raghav@samsung.com>
MIME-Version: 1.0
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFprAKsWRmVeSWpSXmKPExsWy7djPc7omSaFJBv3bDS1a278xWTy+85nd
 4uj/t2wWlxa5W9yY8JTR4vPSFnaLNTefsjiwe+ycdZfdY9OqTjaP3Qs+M3n0bVnF6NF+oJsp
 gDWKyyYlNSezLLVI3y6BK2PJzM/MBX/4K74vXc3YwPiMp4uRk0NCwETiw9Rm1i5GLg4hgRWM
 Ems+7GYDSQgJfGGUmN/MDpH4zCjx5MRENpiOJ5fWMkIkljNKnDk2hRnCeckoMaXrGpDDwcEm
 oCXR2MkO0iACZE5s+AvWwCwwk1Hi4ItpYJOEBWwljszexgJiswioSqw/sZwRxOYVsJSY+eMy
 K8Q2eYmZl76DDeIUsJKY+/0VC0SNoMTJmU/AbGagmuats8GOkBDYwSHxZvMmqGYXiSWf2tkh
 bGGJV8e3QNkyEv93zmeCsKslnt74DdXcwijRv3M9G8gHEgLWEn1nckBMZgFNifW79CHKHSU+
 7gUZD1LBJ3HjrSDECXwSk7ZNZ4YI80p0tAlBVCtJ7Pz5BGqphMTlpjksELaHxPf+GWwTGBVn
 IXlmFpJnZiHsXcDIvIpRPLW0ODc9tdgoL7Vcrzgxt7g0L10vOT93EyMw0Zz+d/zLDsblrz7q
 HWJk4mA8xCjBwawkwtuvHpokxJuSWFmVWpQfX1Sak1p8iFGag0VJnDc5c0OikEB6Yklqdmpq
 QWoRTJaJg1Oqganq/jM+tgsxTyWnMEecf/o1qbRyYUp9yf1NxhMjLVwWX3j7/HKJn1JZ29I+
 Tj3+kgsxszcnFeanp7UFCirz24UffXXjwT2xFO0jyS3yavOnrn52JXna/6Ybj+SOLfqYFdj3
 JWhNeGK/lp5fxpprQn9mmQXdXu/DJHBZ/f8nE6+97b8rXEy2rHl82fnSllNHV/XW6fIuDqq+
 kSlmLKrukjdvpnOAueTl7o0fuj5Y5bmZTXubyqAbt+tOcvA5noVPdONCH9+SnNxb3zt9mVXy
 uxvP2W71T+bQnys6d+ZE9h2rT2ms4dtofl0h99Wr6rnHfmn7tk6aXrv+dmU6m8aJD/YdRvEh
 IVXxyseCspNj7yqxFGckGmoxFxUnAgDnXEHYowMAAA==
X-Brightmail-Tracker: H4sIAAAAAAAAA+NgFvrPLMWRmVeSWpSXmKPExsVy+t/xe7omSaFJBjuXClm0tn9jsnh85zO7
 xdH/b9ksLi1yt7gx4SmjxeelLewWa24+ZXFg99g56y67x6ZVnWweuxd8ZvLo27KK0aP9QDdT
 AGuUnk1RfmlJqkJGfnGJrVK0oYWRnqGlhZ6RiaWeobF5rJWRqZK+nU1Kak5mWWqRvl2CXsaS
 mZ+ZC/7wV3xfupqxgfEZTxcjJ4eEgInEk0trGUFsIYGljBInb4hCxCUkbi9sYoSwhSX+XOti
 62LkAqp5zijxpPsXexcjBwebgJZEYyc7SI0IkDmx4S8jSA2zwHxGiWOTr4MlhAVsJY7M3sYC
 YrMIqEqsP7EcbCivgKXEzB+XWSEWyEvMvPQdrJ5TwEpi7vdXLBAHWUp8ub8Oql5Q4uTMJ2Bx
 ZqD65q2zmScwCsxCkpqFJLWAkWkVo0hqaXFuem6xoV5xYm5xaV66XnJ+7iZGYExsO/Zz8w7G
 ea8+6h1iZOJgPMQowcGsJMLbrx6aJMSbklhZlVqUH19UmpNafIjRFOjuicxSosn5wKjMK4k3
 NDMwNTQxszQwtTQzVhLn9SzoSBQSSE8sSc1OTS1ILYLpY+LglGpgCoxWDNuynvvyDK3b30UV
 OCe6XVzVc8HMPzLw/I4r/f6pH6TXnmrP/6MjXtq6Q4O3/Vob0/3naxz7mEXO8m0oXmTIfq3M
 SebPnvoHEX94997UE4v7rP5k3fZ7f7+JSkfnfHX8EZK261ncmw93y+aeOeItt1H9oaL2+wKG
 3bJa3ziPKR06sklJKe/6SuMn89unbnT8+jzBzclEyXTnBy6liSv3hatt2mAxY7LXnrlf19mv
 +mhccqqAY6en9XmBSNO1cxsTeoy+n6vfvcn9lZLe4exl5SbHzE2yuU7M5yzRNN+2ed+fisVO
 8layywy48kuuXNZzSy58WvL+xKatz0uZuVea1vfa/Wis6bfm8szqVWIpzkg01GIuKk4EAC31
 iGgSAwAA
X-CMS-MailID: 20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31
X-Msg-Generator: CA
X-RootMTR: 20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31
X-EPHeader: CA
CMS-TYPE: 201P
X-CMS-RootMailID: 20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31
References: <20220412112745.44108-1-p.raghav@samsung.com>
 <CGME20220412112748eucas1p19a9e013fa04d5a82abd5364604a8ad31@eucas1p1.samsung.com>
X-Spam-Score: -5.9 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: Luis Chamberlain <mcgrof@kernel.org> Expand
 get_device_info()
 to report the zone size. This is now important give power of 2 zone sizees
 (PO2) can exist, and so can non power of 2 zones sizes (NPO2), and we should
 be aware of the differe [...] 
 Content analysis details:   (-5.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [210.118.77.12 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H3      RBL: Good reputation (+3)
 [210.118.77.12 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
 -0.7 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1neEgh-00Dy1y-6Z
Subject: [f2fs-dev] [PATCH 2/3] libf2fs: add support to report zone size
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

Expand get_device_info() to report the zone size.
This is now important give power of 2 zone sizees (PO2)
can exist, and so can non power of 2 zones sizes (NPO2),
and we should be aware of the differences in terms of
support.

This will be used more in subsequent patch.

Signed-off-by: Luis Chamberlain <mcgrof@kernel.org>
Signed-off-by: Pankaj Raghav <p.raghav@samsung.com>
---
 include/f2fs_fs.h   | 1 +
 lib/libf2fs.c       | 5 +++--
 lib/libf2fs_zoned.c | 5 +++--
 3 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index d236437..83c5b33 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -386,6 +386,7 @@ struct device_info {
 	u_int32_t nr_zones;
 	u_int32_t nr_rnd_zones;
 	size_t zone_blocks;
+	uint64_t zone_size;
 	size_t *zone_cap_blocks;
 };
 
diff --git a/lib/libf2fs.c b/lib/libf2fs.c
index 420dfda..8fad1d7 100644
--- a/lib/libf2fs.c
+++ b/lib/libf2fs.c
@@ -1055,8 +1055,9 @@ int get_device_info(int i)
 		MSG(0, "Info: Host-%s zoned block device:\n",
 				(dev->zoned_model == F2FS_ZONED_HA) ?
 					"aware" : "managed");
-		MSG(0, "      %u zones, %u randomly writeable zones\n",
-				dev->nr_zones, dev->nr_rnd_zones);
+		MSG(0, "      %u zones, %lu zone size: %u randomly writeable zones\n",
+				dev->nr_zones, dev->zone_size,
+				dev->nr_rnd_zones);
 		MSG(0, "      %lu blocks per zone\n",
 				dev->zone_blocks);
 	}
diff --git a/lib/libf2fs_zoned.c b/lib/libf2fs_zoned.c
index 1447181..0acae88 100644
--- a/lib/libf2fs_zoned.c
+++ b/lib/libf2fs_zoned.c
@@ -189,8 +189,9 @@ int f2fs_get_zone_blocks(int i)
 	if (!sectors)
 		return -1;
 
-	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - 9);
-	sectors = (sectors << 9) / c.sector_size;
+	dev->zone_size = sectors << SECTOR_SHIFT;
+	dev->zone_blocks = sectors >> (F2FS_BLKSIZE_BITS - SECTOR_SHIFT);
+	sectors = dev->zone_size / c.sector_size;
 
 	/*
 	 * Total number of zones: there may
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
