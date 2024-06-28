Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1010791B4AA
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tk-00033I-Db;
	Fri, 28 Jun 2024 01:32:43 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Te-00032p-MC
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1CZ5GZZ/IfmA17NR5n5b611q2/g9Zfy47NA+HpUf5Yc=; b=dYAPSl3dNUnWnXCigfbRgtmByL
 N6Z/uheolYMH9Yc67nkok8AwP2NhnWsf9MlKAwJY9sCjTEseY5p8N7qXdfTnQgUiwUACvSByDv9Vh
 nnyedooOM71BOXUIYbkGXoe2MQlIyHz+Puuj3DQRREBQvFVoS5/OLStgMx74GZyTvF5c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1CZ5GZZ/IfmA17NR5n5b611q2/g9Zfy47NA+HpUf5Yc=; b=AMV1AK0BzCualEf+qdOPL9hm2k
 IkRgVWfUPoDAz66L7QKmIvc/ZaUntN6CH1VPRL0BfRQFaqgDXKNIH5IggIRsO02vOcA+uj1fZZ0Xc
 g3gdObi83RhrelbUc+YoG3sS+Po9za5pFfQaIO7iErVxrGbUXH25xt+LGfXeWI1wlads=;
Received: from mail-tyzapc01on2065.outbound.protection.outlook.com
 ([40.107.117.65] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Td-0006Jd-UV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=CtyB8Z8MCKSppseo3mdgOWFLmC32Wlb+Cn6CRb9YU0/fOinevqwbZmiC6ZcdAOSM3Ex7WT6qa3EGqGlIQYBrweKcoTcAg/lEUe+jGH1RfBIDpl0pEpxrUi/Vwk0wIy9DEsRidFg825N8gxJm0+U1SuFkEfq+bGJ0nXocfelbPuztDHgbr4p4NwlR47CrQ23CG/0ngwZQ2ANMGNDETUdo48zWp115VqJQtB7JKoRCHHYsPzakRr+q8J4CNBRzkpqhcZBFOkkNj67Hm3v4ny6QcJf59Ov4Z18enFUwB0/ws1Udvky3C7/Ig6xIAl8PFIZTolKnApAiAdLtpUtM+qjnOg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1CZ5GZZ/IfmA17NR5n5b611q2/g9Zfy47NA+HpUf5Yc=;
 b=KmQhw7p2VXRV443j2a+CTG/ZHSu+RdwVfGzF57pbumhxXrWhigBPadBF+OcCunwvM3Z1Hy2trEdTEgZvQ2iQ7/uEy8RUzBPqQnxLxqYwD3x3t/0uDmwBbefnCzicZFcBWDRMrJaRN5XLof+Y2+KYQkTKY1TKpxP5+7ViZgWiFa+alI3lhX41VA9o2rOSjouzxVskyScpFdfmB159Nxbft2e18fP6x2Jz6V6yjBBznVL25h12Thfq6uZwJY+u1IifOP7kmwkcbLG/6+GvIn6E9tSdHUJvU3VxsTCANL9bOwiKfUh7ScpMwpemLRQCqJPy0Zfdx6XTVjHnU82Kxqqj2w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1CZ5GZZ/IfmA17NR5n5b611q2/g9Zfy47NA+HpUf5Yc=;
 b=Zt7N068ob2PJBiCy11MGWLOH+PpGcH/1XlKlI6rxCBKid8UmHYlWT4cciB0KhLTV0/G+iuojEyvgz4ics3wEk+iIP1V72dLvI+xNDB8BiYsp4qcs1CEfYbO0cC3TWm/Zt2WMZbCdevtaHQXiC6x8+NQyBpfxN7tY4PLoA4I8jJY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:28 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:28 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:39 +0800
Message-Id: <20240628013140.2444209-10-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: f81f2389-ec46-4169-7fee-08dc97122c24
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?NRvu3/4zJITrdE6sDa6RAX8j2Ygv8gVMquw9s6c0pY7yGJfnxAESfd40byB8?=
 =?us-ascii?Q?1S1Z1GemOzmPCC8FK9MI3C3WN8Dt/yp6DHNNcM09nCC3XuW7NG5TNkKPTnN2?=
 =?us-ascii?Q?YYzwmg6h3os1WjHeJfB13ameALasmutfSKe0F7MkQjwcAvVsCgzx2/Sqz5LA?=
 =?us-ascii?Q?5xr4C77XsHKkW9QpS1TiwpqqU2NoEvrQBQOFlm6yRASgedbF7SHzGx1bPzAq?=
 =?us-ascii?Q?Qvewm+iddIqXBrqfRV+i0C7h+/X6FaQ5dLshKP8NXle42VGwFaSQoTdGvtAV?=
 =?us-ascii?Q?Fqz56zzdAtUomZdtAlfF6VtZnyLH99IZUNnK+jvIxXN7YaRN3+euA5vyqxr6?=
 =?us-ascii?Q?92sLGFlyRCggDrFKkwJ64UDWvDVnlj+vV1Q5SIHDBhUx9mLVkNM+/Pu8USQD?=
 =?us-ascii?Q?UHAkarja4mYM3HUDGhajK0ZJ9t56aVCQFHc7d+nyqzFEbCUDXN4FeCVvg/W4?=
 =?us-ascii?Q?1R7yPuZz8ioUpXE517YVtmoR0dFJdWAaJd1pW7X3WXT7bQEHDDw+GL793BL6?=
 =?us-ascii?Q?O4VshplTij7UO6zAdINNAwGu0WOfd2mz95BZreEw74JFvB4bTJwN52T+MJPp?=
 =?us-ascii?Q?ppfq5TeATYxpCVdqyxkTWhFPXxxi/7RCs1m59BJJ0C5pYFu+cHs2yQEj1u8m?=
 =?us-ascii?Q?g7i2QDrlB5XiRM5/ZuVw4ZC2lCGlSE6JR09rAI6EYwASv+dBBxsP36VwCGys?=
 =?us-ascii?Q?EZTspmA0pGFJtsqzAMXLzA/VZE9PnSHHX3b8+yrECMsGMRtwHdk7t8e2fFNL?=
 =?us-ascii?Q?kxjrF6KbH/GjgIHH/jQR1eEA73huBe+X/POnOyhv5uJC4xZuPtYSvVZl3Z0V?=
 =?us-ascii?Q?SvabSduzxw1acq9CkpSf47uy2TRhvr+NcVLUGMqS+Y3hm0sWSWXJ5zck8/VF?=
 =?us-ascii?Q?yew626+Im4M1R8D7jCWe6FHBsq3+ouCsKCYqqhlxb6iD1hoOjCoDkY9OhYTp?=
 =?us-ascii?Q?R94O2vGT8XLZssSUymlmMbNLFeYXxpwOWijuTcg8NsB4u9JiQCFI4sCpUgrV?=
 =?us-ascii?Q?6RubxK86inbfsQgz9BnoOIqA6Je/xgaahiS7FjnoeQP9TGv8RYtczJwbzwGj?=
 =?us-ascii?Q?vV1ISzdPvVKLsXNq89NeQ2hQynKX7ouJ08J9PC2+1QbnZu+SHjcPMOdbxC/A?=
 =?us-ascii?Q?11Mos+GULKKNa8KL5zi0D5xx55xtINutgF85N9Md6gyrqGQ9ugJEfRcJYmiO?=
 =?us-ascii?Q?V5hsSVKSMr+IJUUdkV4gEOL0D1j+IU3KbAr9DNUtA87xSS2e6D6MaDE+l/u6?=
 =?us-ascii?Q?C7rt1zwT7weahqTZ2Bm+KTZBDKlJqLGjPIs28frHwFHEeAi++jPYralxTsLB?=
 =?us-ascii?Q?HCZsMu3kRIUAN7FO9cOOEHoJvCoh9qbjl/Rb7jCVp+FJiSK8xk+1oMNdg/46?=
 =?us-ascii?Q?3ijnv+pWiscTGRRXaLuFGEAKKEnz6dJUgDN9RPJPFtFmDolD5g=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?l4G63K3JvUz+V9PKnP5DmYCG+AJmQH+/CuTUh0kBHgTJkyFQN2xCfa51zZ5v?=
 =?us-ascii?Q?PhprEILivfzyHVeqCPtj9YqTx4O+gSX2TSTHrH2HlU6YVMU93LA//IRVNc8v?=
 =?us-ascii?Q?344msuv2wPDEQhasJTi6/z7uaFalq9j3mk0rVnq0tP5BgAnFxvODoHfHPZ94?=
 =?us-ascii?Q?JKmxGEXL8aifuhAqHbD7l/Uvpo3ws8Mr1sYastbVnHurSaTTw0Okm59gIwIE?=
 =?us-ascii?Q?ml+wsaRrmUvI8C2ebUrsUany/ZJyKAkGrJnaRZ1Ie/U/fvntr52QIrXXvfZA?=
 =?us-ascii?Q?8KlUE5P/kNTEkzw36iV+OAz/w/4hAeC5Us17NSaTwa9xuoRRkNLNXL2AgM3e?=
 =?us-ascii?Q?urTCThxo97hh3SYlmP6JSImnw3U87eYNyygUJKkIFYjYxqMm8Blxn+k0XCd1?=
 =?us-ascii?Q?KLT4d/t7fswOgS20mZIP9/oN10ZCiK0ZsGWY8akSdtiVg2ETSty4I25PJvEh?=
 =?us-ascii?Q?CoERRA2K81TSbuqA/bhzJHqkhI3cnOxDYgYU20JuU7ZDBisU4Ms8woq/zKg1?=
 =?us-ascii?Q?BVdKxKGRNxMFqCiOvgM7I3D020N7gje69KxUNsSk+a2xFMks784ErHqO9v5O?=
 =?us-ascii?Q?aJiYr1ljEzEYp5S7f/m6/MhuZ3b4sPZZvpymATMp6PNYrc1kSvRN3Ag6uY7G?=
 =?us-ascii?Q?LSEvP0DVFDAflxeLmH+F9qMMvWLFjSptQ8NczlEph/g5rSSOo5buE4IqkVwI?=
 =?us-ascii?Q?lFmv38ND8I9KTztWIdg/yReDwvrgj9wNBbxeAk8+yDLG2knxggKzUnBWU2Zh?=
 =?us-ascii?Q?RPyvry1N4hDTPrXSrzfWmRHTk+B8SX82sIFy68TI6+gDWletCn+SQXnvtxpw?=
 =?us-ascii?Q?T3VjOoCNl/rYg5xXwEgYQOZ5Fjms/3/gWhcsnr1IrUL/OtmPUJfLBC/cpyV1?=
 =?us-ascii?Q?1V53i2cSLiYWPCg9ApbeJpKn3vP2jgPInvYtAhXHcEAl/YNEMvG3wbrb6QhZ?=
 =?us-ascii?Q?ylevIVXFB8qptghhVmzwHxll714DiiEKlFRZ6Ni0kYrm8jSm4NvR604CEjy5?=
 =?us-ascii?Q?JTSEPZ5XDf36Y5UYGpEdvD1+95GNb5pnCflla0BEFOovyTrD2fdygVntIyT/?=
 =?us-ascii?Q?tkUyfmvCjxscJrP8xGVjyKhtJCoo6rD7l+hAfkEHCSA2O7RcXWz5rES26NKa?=
 =?us-ascii?Q?JAlY+X0YrcbqV6/eD89GF+GX9Zt472ums1y8X/VhM0KqFdU6JFwwMiy9R+VD?=
 =?us-ascii?Q?BegvIzpX0fUWcEI0jF2j3E40ySUcK6+RaB12IqD/YHVwkbxLY/Vn5arSz1Oi?=
 =?us-ascii?Q?dxfs5VGD43Uf0dPq6GXxYkXI6QSI9XKnPSf6TQjNU7SdKGSUydgRFqYi66PN?=
 =?us-ascii?Q?cfj6XKnlph+bGc2RSLleMKDaYwWQITN9r+qmLY6aOhqitChKZ/7J4n3rNhfA?=
 =?us-ascii?Q?w597VyVU3mZLi4cqMWTP+Hq4Qj8guLqHYT2A+VJmz7VzF9gdqZ5XslZk0PMM?=
 =?us-ascii?Q?xcuOoBNuI01RIdCHSnCVENTwmw8T1gUQUVgAm2lOZaz9Hq0c31W0GZ//J/0O?=
 =?us-ascii?Q?aHqOaVFTG4FJhO0DxS1zL69VxrEmklbBv9u2f4qc1Kna9aUORVWpT6Q+bzFH?=
 =?us-ascii?Q?KRX1l/KQnH47riSAEf4EGGD7w8S+0uMmTKIYwpHy?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f81f2389-ec46-4169-7fee-08dc97122c24
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:28.8246 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: N/zwK3/eLfU1WT5L9arl8OSyUnELle+MWLb8FSHfgshTd9wUj+l8RGCYzj/g6M/JpSx0JCWgPEKzzST6ShPpLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting dentry block or dir entry.
 print_raw_dentry_info()
 is added to show values of node footer. The meanings of options are: * dent:
 means dentry is injected. The members could be injected in cp contains: *
 d_bitmap: dentry block d_bitmap of nid * d_hash: dentry hash * d_ino: dentry
 ino * d_ftype: dentry ftype 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.65 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.65 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.65 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.65 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Td-0006Jd-UV
Subject: [f2fs-dev] [RFC PATCH v2 09/10] inject.f2fs: add dentry injection
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch enables injecting dentry block or dir entry.
print_raw_dentry_info() is added to show values of node footer.

The meanings of options are:
 * dent: means dentry is injected.

The members could be injected in cp contains:
 * d_bitmap: dentry block d_bitmap of nid
 * d_hash: dentry hash
 * d_ino: dentry ino
 * d_ftype: dentry ftype

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 179 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 180 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index c48728e..bae9afb 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -10,6 +10,7 @@
  */
 
 #include <getopt.h>
+#include "node.h"
 #include "inject.h"
 
 static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
@@ -74,6 +75,17 @@ static void print_node_footer_info(struct node_footer *footer)
 	DISP_u32(footer, next_blkaddr);
 }
 
+static void print_raw_dentry_info(struct f2fs_dir_entry *dentry)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(dentry, hash_code);
+	DISP_u32(dentry, ino);
+	DISP_u16(dentry, name_len);
+	DISP_u8(dentry, file_type);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -92,6 +104,7 @@ void inject_usage(void)
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --node --mb <name> --nid <nid> [--idx <index>] --val <value> inject node\n");
+	MSG(0, "  --dent --mb <name> --nid <ino> [--idx <index>] --val <value> inject ino's dentry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -186,6 +199,16 @@ static void inject_node_usage(void)
 	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
 }
 
+static void inject_dent_usage(void)
+{
+	MSG(0, "inject.f2fs --dent --mb <name> --nid <nid> [--idx <index>] --val <value> inject dentry\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  d_bitmap: inject dentry block d_bitmap of nid\n");
+	MSG(0, "  d_hash: inject dentry hash\n");
+	MSG(0, "  d_ino: inject dentry ino\n");
+	MSG(0, "  d_ftype: inject dentry ftype\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -205,6 +228,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"blk", required_argument, 0, 11},
 		{"ssa", no_argument, 0, 12},
 		{"node", no_argument, 0, 13},
+		{"dent", no_argument, 0, 14},
 		{0, 0, 0, 0}
 	};
 
@@ -280,6 +304,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			opt->node = true;
 			MSG(0, "Info: inject node\n");
 			break;
+		case 14:
+			opt->dent = true;
+			MSG(0, "Info: inject dentry\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -309,6 +337,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->node) {
 				inject_node_usage();
 				exit(0);
+			} else if (opt->dent) {
+				inject_dent_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -884,6 +915,152 @@ out:
 	return ret;
 }
 
+static int find_dir_entry(struct f2fs_dentry_ptr *d, nid_t ino)
+{
+	struct f2fs_dir_entry *de;
+	int slot = 0;
+
+	while (slot < d->max) {
+		if (!test_bit_le(slot, d->bitmap)) {
+			slot++;
+			continue;
+		}
+
+		de = &d->dentry[slot];
+		if (le32_to_cpu(de->ino) == ino && de->hash_code != 0)
+			return slot;
+		if (de->name_len == 0) {
+			slot++;
+			continue;
+		}
+		slot += GET_DENTRY_SLOTS(le16_to_cpu(de->name_len));
+	}
+
+	return -ENOENT;
+}
+
+static int inject_dentry(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct node_info ni;
+	struct f2fs_node *node_blk = NULL;
+	struct f2fs_inode *inode;
+	struct f2fs_dentry_ptr d;
+	void *inline_dentry;
+	struct f2fs_dentry_block *dent_blk = NULL;
+	block_t addr = 0;
+	void *buf = NULL;
+	struct f2fs_dir_entry *dent = NULL;
+	struct dnode_of_data dn;
+	nid_t pino;
+	int slot = -ENOENT, ret;
+
+	node_blk = malloc(F2FS_BLKSIZE);
+	ASSERT(node_blk != NULL);
+
+	/* get child inode */
+	get_node_info(sbi, opt->nid, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	pino = le32_to_cpu(node_blk->i.i_pino);
+
+	/* get parent inode */
+	get_node_info(sbi, pino, &ni);
+	ret = dev_read_block(node_blk, ni.blk_addr);
+	ASSERT(ret >= 0);
+	inode = &node_blk->i;
+
+	/* find child dentry */
+	if (inode->i_inline & F2FS_INLINE_DENTRY) {
+		inline_dentry = inline_data_addr(node_blk);
+		make_dentry_ptr(&d, node_blk, inline_dentry, 2);
+		addr = ni.blk_addr;
+		buf = node_blk;
+
+		slot = find_dir_entry(&d, opt->nid);
+		if (slot >= 0)
+			dent = &d.dentry[slot];
+	} else {
+		unsigned int level, dirlevel, nbucket;
+		unsigned long i, end;
+
+		level = le32_to_cpu(inode->i_current_depth);
+		dirlevel = le32_to_cpu(inode->i_dir_level);
+		nbucket = dir_buckets(level, dirlevel);
+		end = dir_block_index(level, dirlevel, nbucket) +
+						bucket_blocks(level);
+
+		dent_blk = malloc(F2FS_BLKSIZE);
+		ASSERT(dent_blk != NULL);
+
+		for (i = 0; i < end; i++) {
+			memset(&dn, 0, sizeof(dn));
+			set_new_dnode(&dn, node_blk, NULL, pino);
+			ret = get_dnode_of_data(sbi, &dn, i, LOOKUP_NODE);
+			if (ret < 0)
+				break;
+			addr = dn.data_blkaddr;
+			if (dn.inode_blk != dn.node_blk)
+				free(dn.node_blk);
+			if (addr == NULL_ADDR || addr == NEW_ADDR)
+				continue;
+			ret = dev_read_block(dent_blk, addr);
+			ASSERT(ret >= 0);
+
+			make_dentry_ptr(&d, node_blk, dent_blk, 1);
+			slot = find_dir_entry(&d, opt->nid);
+			if (slot >= 0) {
+				dent = &d.dentry[slot];
+				buf = dent_blk;
+				break;
+			}
+		}
+	}
+
+	if (slot < 0) {
+		ERR_MSG("dentry of ino %u not found\n", opt->nid);
+		ret = -ENOENT;
+		goto out;
+	}
+
+	if (!strcmp(opt->mb, "d_bitmap")) {
+		MSG(0, "Info: inject dentry bitmap of nid %u: 1 -> 0\n",
+		    opt->nid);
+		test_and_clear_bit_le(slot, d.bitmap);
+	} else if (!strcmp(opt->mb, "d_hash")) {
+		MSG(0, "Info: inject dentry d_hash of nid %u: "
+		    "0x%x -> 0x%x\n", opt->nid, le32_to_cpu(dent->hash_code),
+		    (u32)opt->val);
+		dent->hash_code = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "d_ino")) {
+		MSG(0, "Info: inject dentry d_ino of nid %u: "
+		    "%u -> %u\n", opt->nid, le32_to_cpu(dent->ino),
+		    (nid_t)opt->val);
+		dent->ino = cpu_to_le32((nid_t)opt->val);
+	} else if (!strcmp(opt->mb, "d_ftype")) {
+		MSG(0, "Info: inject dentry d_type of nid %u: "
+		    "%d -> %d\n", opt->nid, dent->file_type,
+		    (u8)opt->val);
+		dent->file_type = (u8)opt->val;
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		ret = -EINVAL;
+		goto out;
+	}
+
+	print_raw_dentry_info(dent);
+
+	if (inode->i_inline & F2FS_INLINE_DENTRY)
+		ret = update_inode(sbi, buf, &addr);
+	else
+		ret = update_block(sbi, buf, &addr, NULL);
+	ASSERT(ret >= 0);
+
+out:
+	free(node_blk);
+	free(dent_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -901,6 +1078,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_ssa(sbi, opt);
 	else if (opt->node)
 		ret = inject_node(sbi, opt);
+	else if (opt->dent)
+		ret = inject_dentry(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 9b14c31..43c21b5 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -32,6 +32,7 @@ struct inject_option {
 	int sit;		/* which sit pack */
 	bool ssa;
 	bool node;
+	bool dent;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
