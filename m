Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CC7568FE0D
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  9 Feb 2023 04:41:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pPxoA-0005Ac-Jo;
	Thu, 09 Feb 2023 03:41:13 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pPxo8-0005AV-Q0
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Feb 2023 03:41:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=wTsRyVXDSJozcQItyZLb/gVxFITVvQ07LjSkuohuDSQ=; b=lo+rkavFO4wO/pd+lhmPCNq7TI
 d2ufbpIpRIVqRADqbQ3CjTDp61nbvMmVb+P9cXWqXZ8vVXozK/kWiGqh//g0CbHN7aZq2EyG2ytal
 mqTEbvUmFELq230E2N93YBzUW8gIWfl6ijOv+zHPl2WMlw+c0+bug07iN1amA6lbm1XY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=wTsRyVXDSJozcQItyZLb/gVxFITVvQ07LjSkuohuDSQ=; b=I
 p2wwqhsKQ/hPJq8xAuVu8ytbfb+phCP2jgHrOtvDcOFvX/9vRcpEdEynkl9wf0aRrF9aipUu50p9Z
 2+RrS+zj2k4EHfro4NRuj8TsagN4OX2KEZ6glTlZV71sfgdskzxvnFrKhcIUZXdMyN6R4NrYRHq7a
 mvqyCdo+Z25xjyWc=;
Received: from mail-psaapc01on2101.outbound.protection.outlook.com
 ([40.107.255.101] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pPxnz-0007FE-Lu for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 09 Feb 2023 03:41:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QzhrMxfyNNlP/E0m6wpcIJPqdfyoceHnJej2Plv+OvTkCZggPbl7jUjMIJaGFnv6gI/aA+7cxbHJbWNMqQPZ0YZLfhz0QDkwxOWvz2dM0vT2qqXGd7mf+Z9686HspxPZd/Q0ne14IE+LqJp/AlWG4TcqPfSG0EOqBjALVOA/cnwMdC0scqj5YWLFS70AbS1cxIsmAW322Y72RkP1JMvyveiIzXuv60iqLebvR3Ba11KTybLpRNANnxSkCld4AWuis6ukG7M4HIZOanNJoezi6xFF+J0IGGbFDQJ8Aiinp63Ro2A4sfUFfr1MBHY9YiflsOQEZS0Zx2hVQI1ah7Mhjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wTsRyVXDSJozcQItyZLb/gVxFITVvQ07LjSkuohuDSQ=;
 b=WbBmpMso8r9oV4EH1SJ062vU++qfGKGka+oW5FlUYykicSYDQu+2Ue1XgcnM+s5xVck2eRvusAhbC90dz8TE7BvWiJb1Tpz9cBzRpteM1aXTvaop05qf9+4yO7S3d655xxCx7WnPrODOg2WMpzlY/DfmGnvn9jXMvifwHlBhKvbjvOgZDgFg64MAon03wni1GvFurUre8X8tzhnvaNplU2IJQ5cv4ftae5BX6kJp0STmr6+Iw6C+SXkbNWsGGCFr/bWMewck+RKerMm4o2b7ITFSlh9OhKOIcYELc+dc7+M0i9oL8W3Nzqg7+IZnBK3gAnmpgtTHePj4pANpb0E/pQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wTsRyVXDSJozcQItyZLb/gVxFITVvQ07LjSkuohuDSQ=;
 b=miD+nGzug86vuq9AXEDY1f/pkfTT0KsuDQfmdnoDsRtXgsoGhSGBGXQ5hp/yfnmd3mqOKG8bFn2P4G2/KlA74i4KP4I5e/krDKcfaDj+O9kHRJB+UyL9ZzIUrXwS9oO+niRVy3iJm2e2vuOMinoUzx+rNrqObkSSaoDMxXt8vHm4iq3DtGnidJuviN4jRhIYi9GLm7yRDJ5n8Q+lVLjgQv8lzJiZ0epyggOwFNKRNhb5Dz0idXFT1SMr/kznlXgP0vji7DpgNCVByUAs6PSTpaYH9E9xDCzzL9Oooy95fBpIDLHUrjWA9D1LRtPJa+McTXil3ze9YP/YTXbFbv5uRQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB4547.apcprd06.prod.outlook.com (2603:1096:301:a6::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6086.17; Thu, 9 Feb
 2023 03:40:55 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6086.011; Thu, 9 Feb 2023
 03:40:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  9 Feb 2023 11:40:44 +0800
Message-Id: <20230209034044.22072-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0135.apcprd02.prod.outlook.com
 (2603:1096:4:188::23) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB4547:EE_
X-MS-Office365-Filtering-Correlation-Id: ef4be5aa-5b54-4a94-993e-08db0a4f72f0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: smvSyAQt4B2iniEPrpUoEhZi7htAcHVMwmtSn9R7C+Q0TcWCGkQAW3IXkv1mxe/ZW7Si0qolzwvOBJoJf5olzqSyFu4EEGXEuMwV2N5yA4iPn3DexPGtJcpVhikoYqFCQTe9kUTcLcnqPbVh0Y7IVAnBLxIw3NV47PgxcD4AhRGinoM9NdXr2PQhiP19C0q0P6pL+feyLkhcZUB+f+7DP8pamPBSZYxTk1Sy5rt7SbvJhmYqpavTrIWyNwrIACT07aAXEbW7HI+CvClj+zlM1Gihs4wDuC2bvoY2ukxb6eExZHegngN0EkcC4rrHBY+5vSJVYJqdV2Mb2DqxCq9rx/Kn9TKwZD3sE8Z83V+TJDXjFHDjjq618YySWZmxpQ8y6Pa/qklANAbQftRlVcVTMY0FWWmgyxAKebpZrABV13xtqZbsXxyvIYMLQGxAO46kn26Nf/G0AN5Oqy1+RtrcwUDWXJhbWj2oqLt1mbKAI/f9InVaYoPRpYkrAKmEkztiNLw60h70/erWS4sEQS63jgLZsTpm4+01aoRBEN8C6Spv7KQ5a8VV+YmyfE5KXq5wmLjzJyaeEh0Ylt/C9T/Gcf7DzDvNdH8B94AtpuOSoIvhF0D0I0NMh4BpKJ23CTIxd2IGXzmsO1JQ2ESrzoWoDcVWNq8/PT6GfW6HnIkJ5PCJstVvyCSJCvB9173v8sbCjr/QZMPewCJnqcmP4geTDQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(136003)(366004)(39860400002)(396003)(346002)(451199018)(26005)(6512007)(186003)(1076003)(6506007)(2906002)(6666004)(36756003)(107886003)(5660300002)(478600001)(6486002)(41300700001)(8936002)(52116002)(2616005)(8676002)(4326008)(66946007)(66476007)(66556008)(83380400001)(86362001)(316002)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3LIrcYSP+kCwwz7UOLzCMU6LhvXUhJ60NzWkEFFRZFciHIdhgFZwINuAjxQQ?=
 =?us-ascii?Q?Yxx63GEHt9FP48pLYpncEPfCuastJ2Rq4SN0gWOkmQJRLu6SnYUQ3g2YmDNS?=
 =?us-ascii?Q?S/n3FZJ/P+HWYEVi9AKo+48jD2hloP5NRnPJhOhOA8StANJQzXhEmKG+ybGB?=
 =?us-ascii?Q?OyWThuT5FzyUnu1SkUqtkVcxF90vC90diohdrM7Id7x48ZNl7773sSMNAUYb?=
 =?us-ascii?Q?DSdxfEm1ScWsFbwiluaZTpxY54F5Ty8tc4Xx6/8Bkt44ZZ1aoQRbhPCRgEdJ?=
 =?us-ascii?Q?CR0hk9603J0w+gwhgr/0V+2S7UL3tDjiDqI5sieJa4mIj/NVenIDTfKxp6rK?=
 =?us-ascii?Q?rkk90xZLg4Glw43Vsa3g3gUG/1MiE39QQjI2lAl+MHZzTdg9nFCPa7GLGc/P?=
 =?us-ascii?Q?smI3Zf0jsx8sswwES9RZrjQpB71fMYuWnQJ3x647DU8YknNQCkw3hCBzlP2t?=
 =?us-ascii?Q?EdSC5ogIcLbdTE+wBhITVSaRsIloAuv8OhfpGLXJjv9aui/CVB89TWC0Cv94?=
 =?us-ascii?Q?yuIG5T2ar4vcyNlJRUl+S2/G1E1oT9/s4YqxUnoYKrqkhrIJqxKbFyeO08sr?=
 =?us-ascii?Q?OcFZjr5lHy4Ju1PetdVl7eO7IFu19oS3F1stVrNlsPNtR8OYJphM0Vw7rnFN?=
 =?us-ascii?Q?hEKkUSnrT9DJnGjpIHqd0QrrfmCr/JhxLRnA0lshc+YSvSW5V8/WuUKfVV9I?=
 =?us-ascii?Q?IvMfEzT+lqRLGWx2qb6DiCjIyP6yjyG1Z9b334TEw7ACq0DOdvrIlOiPJvtr?=
 =?us-ascii?Q?JkfBm7lxR58TyxfNcvhFkbLaRz64JoQnbQfa13hzhkcwY/ki33zK1znW5GOY?=
 =?us-ascii?Q?JS7XuksJxbsQCULWP1pN+NKHv5gtHeHptolCZf6RHiuqoFMFWkFy6HoXztQW?=
 =?us-ascii?Q?R5edGfB8+BR5+6FavFizI3t9sUpESa1GAEonCMOy/kq0cha8ZSA6KfAzqP4E?=
 =?us-ascii?Q?O5bXpwUCTN7DCN4Wf1yDC4a8dn2CaEbE69CIQZeguS+UGaG1YPOTrezekhaR?=
 =?us-ascii?Q?qcZDi1j9oqctBNW/agXa605ZzLA7vG3RqksMAE2THj4aX+vCbH5YyXbyryAx?=
 =?us-ascii?Q?xnI6XK2Y4wWuNS6NtiA0r18YervbTKuyNCTZERD6gvMR60XWOR3+TvI7eIIV?=
 =?us-ascii?Q?lWuvNAAME2B+N+Bxy12VH6TzrVwhzUSdPOLceBKaghJ0GjkGiWpPKEZ+3BFA?=
 =?us-ascii?Q?N0JfEeq2V4gsj0zGC8Dow3E9J+X4I5NDYENmjIIVnxzhQxN/UdG4zn52G2G2?=
 =?us-ascii?Q?SZ42UCYeyKe0RTx3sMVPzzbG0yggst9umKwHi94fDj+ZeccHDXqaFmn4PRph?=
 =?us-ascii?Q?87k1o4gK+D3/bLTife0dTX+V9/ZOPXJbLtM6x7Y+xBnjFfPi3x0sNdpHdMhV?=
 =?us-ascii?Q?8+/7AxQakj99kwYpE+5qbVnk9K9xwGLrU7efzekKgS+gjL9eraKPMhfCOrC/?=
 =?us-ascii?Q?lv8+GFHWf7SMiv8tijIyxd+CJVJ/WbX96yNWbOYRtcYSMofAbq1raj+VmV2t?=
 =?us-ascii?Q?2iigzDBgKNDno40KhpLQdT3Sq4MZk3PAGZAS2ia01FGwO8Csn9d5a6gBx3Zc?=
 =?us-ascii?Q?o/a7EfY/3KfiR9a/IJ5eGPs6uX08I0K/HkE2FtFB?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef4be5aa-5b54-4a94-993e-08db0a4f72f0
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Feb 2023 03:40:55.2136 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: blcsm1Uc0jGd+cfbD04ZGCN+0lg4BdQIkCYXdnyf+J7UoSXjxr5mfNaDH3nKwL5vlLWsY1nDKEpcJI2nJ7QU0Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4547
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Export ipu_policy as a string in debugfs for better
 readability
 and it can help us better understand some strategies of the file system.
 Since we use ipu_policy as a bitmap, and the bitmap API parameter is unsigned
 long type data, let's change ipu_policy to unsigned long type. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.101 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.101 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pPxnz-0007FE-Lu
Subject: [f2fs-dev] [PATCH] f2fs: export ipu policy in debugfs
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

Export ipu_policy as a string in debugfs for better readability and
it can help us better understand some strategies of the file system.

Since we use ipu_policy as a bitmap, and the bitmap API parameter is
unsigned long type data, let's change ipu_policy to unsigned long type.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/debug.c   | 64 ++++++++++++++++++++++++++++++++---------------
 fs/f2fs/f2fs.h    |  4 +--
 fs/f2fs/segment.h |  1 +
 fs/f2fs/sysfs.c   |  2 +-
 4 files changed, 48 insertions(+), 23 deletions(-)

diff --git a/fs/f2fs/debug.c b/fs/f2fs/debug.c
index 32af4f0c5735..d50dc8e6abfd 100644
--- a/fs/f2fs/debug.c
+++ b/fs/f2fs/debug.c
@@ -354,6 +354,17 @@ static char *s_flag[] = {
 	[SBI_IS_FREEZING]	= " freezefs",
 };
 
+static const char *ipu_mode_names[F2FS_IPU_MAX] = {
+	[F2FS_IPU_FORCE]	= "FORCE",
+	[F2FS_IPU_SSR]		= "SSR",
+	[F2FS_IPU_UTIL]		= "UTIL",
+	[F2FS_IPU_SSR_UTIL]	= "SSR_UTIL",
+	[F2FS_IPU_FSYNC]	= "FSYNC",
+	[F2FS_IPU_ASYNC]	= "ASYNC",
+	[F2FS_IPU_NOCACHE]	= "NOCACHE",
+	[F2FS_IPU_HONOR_OPU_WRITE]	= "HONOR_OPU_WRITE",
+};
+
 static int stat_show(struct seq_file *s, void *v)
 {
 	struct f2fs_stat_info *si;
@@ -362,18 +373,20 @@ static int stat_show(struct seq_file *s, void *v)
 
 	raw_spin_lock_irqsave(&f2fs_stat_lock, flags);
 	list_for_each_entry(si, &f2fs_stat_list, stat_list) {
-		update_general_status(si->sbi);
+		struct f2fs_sb_info *sbi = si->sbi;
+
+		update_general_status(sbi);
 
 		seq_printf(s, "\n=====[ partition info(%pg). #%d, %s, CP: %s]=====\n",
-			si->sbi->sb->s_bdev, i++,
-			f2fs_readonly(si->sbi->sb) ? "RO" : "RW",
-			is_set_ckpt_flags(si->sbi, CP_DISABLED_FLAG) ?
-			"Disabled" : (f2fs_cp_error(si->sbi) ? "Error" : "Good"));
-		if (si->sbi->s_flag) {
+			sbi->sb->s_bdev, i++,
+			f2fs_readonly(sbi->sb) ? "RO" : "RW",
+			is_set_ckpt_flags(sbi, CP_DISABLED_FLAG) ?
+			"Disabled" : (f2fs_cp_error(sbi) ? "Error" : "Good"));
+		if (sbi->s_flag) {
 			seq_puts(s, "[SBI:");
-			for_each_set_bit(j, &si->sbi->s_flag, 32)
+			for_each_set_bit(j, &sbi->s_flag, 32)
 				seq_puts(s, s_flag[j]);
-			seq_puts(s, "]\n");
+			seq_puts(s, "]\n\n");
 		}
 		seq_printf(s, "[SB: 1] [CP: 2] [SIT: %d] [NAT: %d] ",
 			   si->sit_area_segs, si->nat_area_segs);
@@ -383,8 +396,19 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->overp_segs, si->rsvd_segs);
 		seq_printf(s, "Current Time Sec: %llu / Mounted Time Sec: %llu\n\n",
 					ktime_get_boottime_seconds(),
-					SIT_I(si->sbi)->mounted_time);
-		if (test_opt(si->sbi, DISCARD))
+					SIT_I(sbi)->mounted_time);
+
+		seq_puts(s, "Policy:\n");
+		seq_puts(s, "  - IPU: [");
+		if (IS_F2FS_IPU_DISABLE(sbi)) {
+			seq_puts(s, " DISABLE\n");
+		} else {
+			for_each_set_bit(j, &SM_I(sbi)->ipu_policy, F2FS_IPU_MAX)
+				seq_printf(s, " %s", ipu_mode_names[j]);
+		}
+		seq_puts(s, " ]\n");
+
+		if (test_opt(sbi, DISCARD))
 			seq_printf(s, "Utilization: %u%% (%u valid blocks, %u discard blocks)\n",
 				si->utilization, si->valid_count, si->discard_blks);
 		else
@@ -491,15 +515,15 @@ static int stat_show(struct seq_file *s, void *v)
 		seq_printf(s, "  - node segments : %d (%d)\n",
 				si->node_segs, si->bg_node_segs);
 		seq_puts(s, "  - Reclaimed segs :\n");
-		seq_printf(s, "    - Normal : %d\n", si->sbi->gc_reclaimed_segs[GC_NORMAL]);
-		seq_printf(s, "    - Idle CB : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_CB]);
+		seq_printf(s, "    - Normal : %d\n", sbi->gc_reclaimed_segs[GC_NORMAL]);
+		seq_printf(s, "    - Idle CB : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_CB]);
 		seq_printf(s, "    - Idle Greedy : %d\n",
-				si->sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
-		seq_printf(s, "    - Idle AT : %d\n", si->sbi->gc_reclaimed_segs[GC_IDLE_AT]);
+				sbi->gc_reclaimed_segs[GC_IDLE_GREEDY]);
+		seq_printf(s, "    - Idle AT : %d\n", sbi->gc_reclaimed_segs[GC_IDLE_AT]);
 		seq_printf(s, "    - Urgent High : %d\n",
-				si->sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
-		seq_printf(s, "    - Urgent Mid : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_MID]);
-		seq_printf(s, "    - Urgent Low : %d\n", si->sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
+				sbi->gc_reclaimed_segs[GC_URGENT_HIGH]);
+		seq_printf(s, "    - Urgent Mid : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_MID]);
+		seq_printf(s, "    - Urgent Low : %d\n", sbi->gc_reclaimed_segs[GC_URGENT_LOW]);
 		seq_printf(s, "Try to move %d blocks (BG: %d)\n", si->tot_blks,
 				si->bg_data_blks + si->bg_node_blks);
 		seq_printf(s, "  - data blocks : %d (%d)\n", si->data_blks,
@@ -565,7 +589,7 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->ndirty_imeta);
 		seq_printf(s, "  - fsync mark: %4lld\n",
 			   percpu_counter_sum_positive(
-					&si->sbi->rf_node_block_count));
+					&sbi->rf_node_block_count));
 		seq_printf(s, "  - NATs: %9d/%9d\n  - SITs: %9d/%9d\n",
 			   si->dirty_nats, si->nats, si->dirty_sits, si->sits);
 		seq_printf(s, "  - free_nids: %9d/%9d\n  - alloc_nids: %9d\n",
@@ -592,12 +616,12 @@ static int stat_show(struct seq_file *s, void *v)
 			   si->block_count[LFS], si->segment_count[LFS]);
 
 		/* segment usage info */
-		f2fs_update_sit_info(si->sbi);
+		f2fs_update_sit_info(sbi);
 		seq_printf(s, "\nBDF: %u, avg. vblocks: %u\n",
 			   si->bimodal, si->avg_vblocks);
 
 		/* memory footprint */
-		update_mem_info(si->sbi);
+		update_mem_info(sbi);
 		seq_printf(s, "\nMemory: %llu KB\n",
 			(si->base_mem + si->cache_mem + si->page_mem) >> 10);
 		seq_printf(s, "  - static: %llu KB\n",
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 44f2d76525bf..b699ed74f438 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1070,7 +1070,7 @@ struct f2fs_sm_info {
 
 	struct list_head sit_entry_set;	/* sit entry set list */
 
-	unsigned int ipu_policy;	/* in-place-update policy */
+	unsigned long ipu_policy;	/* in-place-update policy */
 	unsigned int min_ipu_util;	/* in-place-update threshold */
 	unsigned int min_fsync_blocks;	/* threshold for fsync */
 	unsigned int min_seq_blocks;	/* threshold for sequential blocks */
@@ -1322,7 +1322,7 @@ enum {
 	MAX_TIME,
 };
 
-/* Note that you need to keep synchronization with this gc_mode_names array */
+/* Modification on enum should be synchronized with gc_mode_names array */
 enum {
 	GC_NORMAL,
 	GC_IDLE_CB,
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 8ee5e5db9287..92c8be00d396 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -672,6 +672,7 @@ static inline int utilization(struct f2fs_sb_info *sbi)
 
 #define F2FS_IPU_DISABLE	0
 
+/* Modification on enum should be synchronized with ipu_mode_names array */
 enum {
 	F2FS_IPU_FORCE,
 	F2FS_IPU_SSR,
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 6082e132257a..228df201f6d4 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -711,7 +711,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 		if (t && f2fs_lfs_mode(sbi))
 			return -EINVAL;
-		SM_I(sbi)->ipu_policy = (unsigned int)t;
+		SM_I(sbi)->ipu_policy = t;
 		return count;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
