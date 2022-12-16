Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3BBF764E606
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 16 Dec 2022 03:45:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p60jB-0002lN-Tl;
	Fri, 16 Dec 2022 02:45:37 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p60jA-0002lC-5N
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 02:45:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DJRIeGppwo7Mr5928wii4L3Lv7c2ElSW98Xo2Joi4NA=; b=hkBmifswY/Ofwcf0VT+e9zdI4r
 Tu0tsauJNaOcLgHjeoysWfo0FaXfBCgrVeRd4DYQsqvvbliaIgkEcgjPQfMAlPDlw8PwOUvmdVm7R
 p1fx9QhLfVkIK/HQf8GeCQyf0wTwAixFJcJJ8qjIarioe90vduXH/zzeMw870wEGPwrg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DJRIeGppwo7Mr5928wii4L3Lv7c2ElSW98Xo2Joi4NA=; b=Z
 HLBRqJBVDykMFQgZDG+HmDDjPDdRzA3G3LqurVo300RovIaqJoiK4RkT6AGjUJfb15Yoj2RT6dShI
 MLdwZ+60bmFJ/tmDoGtX/8basaXTToFUQr71u6rN4bwKH8gpFMLXtPSf4Mlr6oakGmkgDYjYPEwyA
 nk70EAGfB3WQkH7U=;
Received: from mail-tyzapc01on2116.outbound.protection.outlook.com
 ([40.107.117.116] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p60j3-000xob-2m for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 16 Dec 2022 02:45:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HG1njk35k7XbtFNpXHKyBjiH0ejWSF5Npi8Tud1rGGv+T3ej1n8NLnjc3fatC+qtW9KSmb3DnIS7jOND7gFyitn8dPVYF4FZ+diidzMrqFXwiokSPV678dpIklIuGWk2B+uR52ZtF7ZzIHIp0g97tQvSlDQ/00huCIYANc8UgtwK2A9zeDv3RqGmV+x4VgSuMl5mT+2sn4Ci8R7Wo9hW13EGfGF+Tf0f0cjVknTBlgey4bdbhnWweF8PWKXm7wIV5yBghYo77ADjWTArfT15HGRL/azWll7FEIqDiqb2qTh/0DGIA0XcaJg8zubepjDzFU0G/DvRFAxL5ktNYHTkwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DJRIeGppwo7Mr5928wii4L3Lv7c2ElSW98Xo2Joi4NA=;
 b=XlnA1lfK1sSgWyHi54NOpEHmgoYTgBoqNgG5Mhb2F+yhX0SJCNvZJ3nwoOOeDqLgMmx+iYAOPLYL6hZBcpXdmo6UmjSTHmvFka3J9IA1B7gfWH/FghHEHrB9b/3W6HpV9tBDxe+s/RgBjLMWJIZ35jL3eoVGLylwT3YqsktNc5xV1+wKCTdHpOUD/s9DU5GLzGNeI0uhQt9dV4Dl4lZy7nPFNnkLEzs0KKFplDAilJK+iy0anasNFZ3oTIbnxH/yMmZJWCYBpP5E6qxXF10W/cjy+YsUj+Z7H9YRfMRJw6E3jq+dN8IB/7puqS5Zp6e4fxjaOF485t3WRF58gb5iMw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DJRIeGppwo7Mr5928wii4L3Lv7c2ElSW98Xo2Joi4NA=;
 b=O3CuOGifOx5idKgnKMbLO+ISrmKt7TZ770MzWCgv2Y/dK7fXO/bnvUF+mLTzhB7HP/YRSISZKJ2Fvww3XiZ1/uRmPdu3AZC2+z7wA5MATApP03FhypdgiLTz/FepG/HQjIOcx4jw/Vrw++KxNX7PGRoZekrDYTs47638k/oQQiPEqnE7ZTVYUbjHUilJtvCm0qIrl+UbTXO19tNHrew3XcRM4OylbGy0sCDFhWUzuBDcQZl5KnRbzLLYY2Jh/J71enrepRBb+tpNcoCVIxVn0oJ0UlXpwnJJB1qHRyXLADSAaQUIztwQ2sB4VL1kDe2u3fMC3/SYUSEyttyLjT/QBg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4481.apcprd06.prod.outlook.com (2603:1096:820:72::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.15; Fri, 16 Dec
 2022 02:45:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.011; Fri, 16 Dec 2022
 02:45:17 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 16 Dec 2022 10:45:06 +0800
Message-Id: <20221216024506.77048-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0023.APCP153.PROD.OUTLOOK.COM (2603:1096:4:190::6)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4481:EE_
X-MS-Office365-Filtering-Correlation-Id: 5c4ba58c-34f3-47ea-7d71-08dadf0f90c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CT0U8Z8n7g18ZyrMZ8djmBx18044LxdaP54qqN67n8COaMrtx0EQsVbeajJ0YuqoYT1hHtyjGGI372GgvnwfJVpo5d3gcgmF9c6z5kLgQDXCQNixJJB/bPIzexXQDr+NLNW4CGz2+TDu+eJV39MI45cKWhaxHemiNDaG7TwJP03GoY6Z52x5/kcjuMgXCtPYvZT36ZdpQewYs01VCe/p5NskOGNvvxDNqguRPuruW2H23Ovulg+pGTH4WkekFcygSs0E/wgJPF+NJ69NLYDWyaKXbSWU88t37Dt1AY9gAMJ0xCyhn/uiYA7e/uQ1EFHIy7tuJvIy3eR2c+JnkQiFBgXvxVQ5ooVh8/YQzgLWsusm4ZorzXbhSPAtfUdRjKADjisBYGIlvL/aHCBBt45zosjXH+VFC/G9rUT2dY/MF30POEGmsIM/XAelWCw4sZI3046aneeeGkMfHPh0WWsOAo/I49qgb3mwzHoryNt9EgAlS5VfwIUBqMG24er3CBTT1TpUFO6LRDI9w4RWRa53tajnBxV2SfcyZLDj9k+xDSds7hR01jV758VKe4C3k6xb3/3n/T0gBDjU1DX9rDLHWegA3mZx0eECltOdYvnSoxSVJz5A9PplGpHRXr7bzyc472tW5Oi/51QCdvozIJ+kEwmaDcGdL+UzUTUZisAzOTmCZt9mxF2bfKrQwPTJmoD4dWxeq3dR3iJzEYGsv3hiQB69J7NzC7yrHzjt9FAAbZk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(396003)(366004)(346002)(451199015)(5660300002)(8676002)(4326008)(8936002)(66556008)(66476007)(4744005)(66946007)(41300700001)(1076003)(966005)(6486002)(52116002)(478600001)(36756003)(316002)(2906002)(186003)(86362001)(6666004)(107886003)(26005)(2616005)(6506007)(6512007)(83380400001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?9C3Pz+d7XeSezE92vZ1kFUsgzhcTqLy/piEqs2FmJJkEckvreqvThQToQVuc?=
 =?us-ascii?Q?TDu589RO4x4XyfXWHiB9we/S8rmLHYE1oBlBHd7IW9XYZK1f7WsRAKrcKEf9?=
 =?us-ascii?Q?/dO7pyR42rEArVQJ3G0JiiqYzHAXpYskTBQ2LptxAZPJCajAYM//MzaaTW0e?=
 =?us-ascii?Q?k5HTefgeD7heL3RcoDT8uCGmINEv240BVFHYdMFCW4TC3LopKueNHIpuhYov?=
 =?us-ascii?Q?CfKYd67+oKfqGxW+j3QFDj59alb2V5zu/NeOtsPkUBQ/A1BJK6EoiRGBXKc4?=
 =?us-ascii?Q?wUn0tV8Axs/lkUVMvB2mj2EgFfaRBN2vJxx4BL1eoXgWuQ5bGZXL+5yz5mYq?=
 =?us-ascii?Q?aTi6WiunZe/eliavs+J8FKmdySXK5uj+tCTwx9Z42+hGtFj+C+Nyr5Wf2F3a?=
 =?us-ascii?Q?VC0dH8RO5Nk4Dmvc5QhZ1xeiZ0Kj/EEnwjhpKsnruNE7vDgBHZ0GdUOfTMMY?=
 =?us-ascii?Q?+1i/813+HH3MKPF/uEE/ynZRZ2Bjg5ZTlgHb9tUf5PfpcNpRjGAHcV8uRsCu?=
 =?us-ascii?Q?DBajeN6txHSNZ6vXfbQt8/nwy6w1xkQdOoaLfQWw31eyHrNKrLk7SZM8UMmT?=
 =?us-ascii?Q?E6gAgy9G+XPnuGOZ0Od1sGMNQoGB2QKABKoZ5tzsNv3hTqZotLG0k50pjnAU?=
 =?us-ascii?Q?K5GA3U+BsqLM10d/wtY0Lhtsx9C6PCc7Lu3bBFUVZ34RKRZ9b6tWie3+7MxS?=
 =?us-ascii?Q?6G8L/sChieMPw7v1pkBCze2giGW92F+yW3TU6GYsj1Qq7k+RVkC+Wl8V70Yp?=
 =?us-ascii?Q?SvxP9zOfS/6R9c6xTS8XGcscHkHHi9TYigFKwG6jQ8f5j8lfBf3L3ebdzCie?=
 =?us-ascii?Q?RprLnQgaJ5S8ro00nZ6h+MSrFHiZwbScccTKIiYnBUg9hZiPnyWNyzasLSv1?=
 =?us-ascii?Q?l0xAaaVmhXz4pPvsYp/3/hY8RERroyeZm4jA5uSfpGuDeYIC9+VoDOwax6mI?=
 =?us-ascii?Q?wK9HHGGYCaFpdDpC0wCC0osZo/CWSN4M8tK/HuUNSe9N4P8N1RBhLPD3htgf?=
 =?us-ascii?Q?879VeUO4qnpn/kgxFzL8/dUUHjbpEHBOQAk1EFll0C2zNB2UOR236mh4N6QR?=
 =?us-ascii?Q?FIiI+iTDcTfO6+lWvjAkLJtASKEGXc2ym+Klyqh0yNhCibTFXn7xQDP6K+9G?=
 =?us-ascii?Q?hEh5WJx6mqB0QQnedqmQE/dRXPaqxwX1q3H02QQcb89duH08HECtLRAe+eZe?=
 =?us-ascii?Q?T5A6aodqBE7AAEPJnxjfhA8Tky9OVXza30BBe0IY2TBxtulKL+RG8mMH0I1/?=
 =?us-ascii?Q?59y2NVOmVmKWDWiqXqpYHxOMLkFjA46bfcS/Lbpo2ExkStk9ctrig4BE2kBy?=
 =?us-ascii?Q?rc1tYk1vozaQ2ADaKbgTKMDyfZOxtm8sHoIHGFj9F4ebpIjEKX3gvgD4cljg?=
 =?us-ascii?Q?jMFt4Odd9lqIIiDYP/OqWzxOP4sMBM/mp5fnD+jZo3tqQQMIW8l5RmVEARek?=
 =?us-ascii?Q?P5R5BERIysbrFkGbjEdS+O0zJCQI+vTZW/Eq7JEAhUfw25USfDuZF20N4VqO?=
 =?us-ascii?Q?XKFjrdxWY4UnNDhDEP4PtWJw54CVFL0CZV3cfwErrZy3SCmQteB4enQBgr7W?=
 =?us-ascii?Q?14ki+UXteh4TC+FHUZFZQMAjZ3yx+yndO/MP9Md7?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5c4ba58c-34f3-47ea-7d71-08dadf0f90c3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Dec 2022 02:45:17.5080 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mOCKAoewSLUMHaXasIMuI2wbLkHfUgB2YX6ycRV1VZaMjXf8RgWp67//SvrfJg1A1J/LYLpRMnP+f6m6obf0vg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4481
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From now on, f2fs also has its own patchwork link, thanks
 to Jaegeuk for starting this tool! Let's update it to f2fs entry.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- MAINTAINERS | 1 + 1 file changed,
 1 insertion(+)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.116 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.116 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p60j3-000xob-2m
Subject: [f2fs-dev] [PATCH] MAINTAINERS: Add f2fs's patchwork
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From now on, f2fs also has its own patchwork link, thanks to Jaegeuk
for starting this tool!

Let's update it to f2fs entry.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a608f19da3a9..d1fbe7d15d86 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7889,6 +7889,7 @@ M:	Chao Yu <chao@kernel.org>
 L:	linux-f2fs-devel@lists.sourceforge.net
 S:	Maintained
 W:	https://f2fs.wiki.kernel.org/
+Q:	https://patchwork.kernel.org/project/f2fs/list/
 B:	https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=f2fs
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git
 F:	Documentation/ABI/testing/sysfs-fs-f2fs
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
