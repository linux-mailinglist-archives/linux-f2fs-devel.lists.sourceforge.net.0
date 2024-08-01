Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECCC79447F4
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  1 Aug 2024 11:19:01 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sZRxX-0000cR-T7;
	Thu, 01 Aug 2024 09:18:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <xirui.zhang@vivo.com>) id 1sZRxW-0000cA-3v
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 09:18:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xEZrSgpkopwBEyY/ie8+yzygZwxeaTm2ffGreL/Rv20=; b=lmeli3s/VK3FDrYg+LSpTMsAo8
 k++dSc7F6GAWh8cq7yHpNoMaMQdlgFod3t6ul3kvP0+rnYwbMjoeBWW0pcefCv+CfXl3yc1Qlw5ES
 +kI2TwRcM1SM1em4rpUB/iFaO2lNajBmDE8T1Jsb/J6umik/Fvbdk5AYDy+uyopjJFmQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=xEZrSgpkopwBEyY/ie8+yzygZwxeaTm2ffGreL/Rv20=; b=c
 iEk9Vthu1ChGR5YL57/FE3vl0pbWaV/4gEVHhcehLZGBvRsPHVT3rqz16iqcd4O2LfTmm4RFT3VkN
 kba3H6+avupCXTtT9DI10rnMEQnnflT1Fa69CaBQ//EqsKNLLxGwtKe6CyngX9th3jYsO9MaPK1uM
 4L4aiVgUUS3gbecA=;
Received: from mail-sgaapc01on2061.outbound.protection.outlook.com
 ([40.107.215.61] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sZRxV-00004q-5O for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 01 Aug 2024 09:18:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=RR3Ta0en6B5rw54xHlpvVLNKLu3Hp5MZE0uS5+jMacUlspfw//BNtVmVP8i6PltoXeek39GVy3MDS0VZB7Y1TNTgmuYaK/TDWak4dVFuK1+a2GXyBp3nFDDGwDqBxIu21k6T64okv3VuvjEKSTNwvaXw+Pdbf8Rrql+VB74rc3Z+kttZVSy8W8eTf6PTwaTueUoC78oqUcgT/gudZZ02G47bJ13y0YQzk7+M7M62sj0B1Sz5MjYcnpd/AKyRp/8kC5TMdyG/jsBGMbZu177d7y8dWzCWaWTdphNf5IYoU2j+2xXKPCiAfoxcVA7Y+08bv2IYb3jmRZ5eReJc/nvT0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xEZrSgpkopwBEyY/ie8+yzygZwxeaTm2ffGreL/Rv20=;
 b=jOSLFpjNgXq7YBWQg9vYipGmybhehxODPazzHxK21DuqYQrs77Bfzy8FLWWR9CHJMxb7m2sMIU7q+Ho6aUn4PR/7ye/4G4BaaSKU6NECbqstEASXLi5kvdIkne321YnsvQ4BJNG6tvBXkPNO1cQBDESPNR8kz7dIUjM6mJm0k2pliO4exEH5S1e23d0uS6RWkeXxI0xuX1M0NPM0wq5dLwUav46qWcJs1ytfMENGsEl2CYyP0E2bkk/Gf49vPbQooTK/kxhBvqGiExlZ2FWFrXkieNO/jJQqimZ6gHASomw60ocBFKZRERpPI0sS5Dcd5BJQ9hzNk9yLn9qpUkuBtA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xEZrSgpkopwBEyY/ie8+yzygZwxeaTm2ffGreL/Rv20=;
 b=TBmxMgkhl2I8tTLt+R7aIDOzlyaie/zg93fYCWHsEJyaHfNq3fgKhqJk5MoOAc1YZhuf9nIaPT3XvuyaTMksshRKDgjJQ0cG7sd2ShVRJ8/fNhFe6zsqJPtKn4SynuJZD3nHcSMINzeEMg2xBZvrdelFiWcaEB5BZT/SNbHC9UAdobJnxKWkiapI0vonauUpxMreX3gtAIdCpMH7JTIYm2i5Lj7na0Oi9eagfIJJ3TplvKsBHy6B7XgyDIPqYdILzwum7K2MjeWDKjdj6oR1WscCwztE+PMdkDgzZ+6MnU+ynRgd7snpVmuQ6HnuLfZJNM/XtTR4JOiynZAbg3t1Vw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com (2603:1096:400:1f7::12)
 by TY0PR06MB5441.apcprd06.prod.outlook.com (2603:1096:400:32e::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7807.27; Thu, 1 Aug
 2024 09:03:51 +0000
Received: from TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::f6de:c016:c33a:318]) by TYZPR06MB5178.apcprd06.prod.outlook.com
 ([fe80::f6de:c016:c33a:318%3]) with mapi id 15.20.7807.026; Thu, 1 Aug 2024
 09:03:51 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  1 Aug 2024 03:18:22 -0600
Message-Id: <20240801091822.3853678-1-xirui.zhang@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR01CA0147.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::27) To TYZPR06MB5178.apcprd06.prod.outlook.com
 (2603:1096:400:1f7::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5178:EE_|TY0PR06MB5441:EE_
X-MS-Office365-Filtering-Correlation-Id: 6242d77d-4e3a-4883-2659-08dcb208dce6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014|43062017; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?juzSiTlsNnbgo3O17bztuPvBsrV00kNbY4o3aOes5kNF3ao7db/a7J6Hd/+c?=
 =?us-ascii?Q?iD5+nEu+o1j0YkbbQ0qvcWqs+S5JXP1HoH/OoaACNwcEt/X53xS7ZUKrlXOy?=
 =?us-ascii?Q?9CM4DvS1Z1z4Ol4Z1d0xgrbBFtQYYBTxOBEZb6PIZ+7Qv5pJojpxFZLp3QlW?=
 =?us-ascii?Q?PJLCMFflS7sMBXU47Re1grKi2S81SLxHmnKjyLLEP/NzJHsN1iUjs4l77bfD?=
 =?us-ascii?Q?HAIoLGdcrblfPG452caGxxlSwoLxJzyy/6njRJ+Z+MfIg4KJFixvEhRGxL+O?=
 =?us-ascii?Q?SnKTzZQSvwvKXmfDRq+UnAPNUFRyWscmNZ5wajDluETuqrWEDHKwCL0U6CNB?=
 =?us-ascii?Q?J24AHSd4058zqpIiLSm4qh6qgP2jhTFD8LGxKP5Wqa0coi2JaZtVAS6m4QAJ?=
 =?us-ascii?Q?7IxVH0/mF437SsJPj6U/4QBPNinZjZGq1O9T4vp5rFu+QCpx+TgwNJFHTaD2?=
 =?us-ascii?Q?+Gz36elxWzHxugG3m3celKZG6f9X8fKFzz4LE+zcNg2nDYEQsKBk3xlc9y6B?=
 =?us-ascii?Q?IpNfqsuDWgIG0ZUUbItImQGh2PcurXZyky+70//aebjsUQ/ajlsFPEoQl6dX?=
 =?us-ascii?Q?Eery6+Ct1T8LhuEI4HfvDunrDtFq+uxdjiuFtHwChjoHX5zehpSOjp2/IRnJ?=
 =?us-ascii?Q?KeV+jkTMTTH3SLld5cdxqKX4LgJ6JprvoHJ6VdznPYdRQ7MhPw1fELi2eP8Q?=
 =?us-ascii?Q?vEGf5REcYAamEmZXNgAFPaZhxVfD+KoXASkkaenWZGBdcKagaDbSn5+O/Ujg?=
 =?us-ascii?Q?DQRwAAIgQi+9+qVe+78F29DjdfSr0CjyrfafNhs+662kGA+oR4Ry+0cplsYF?=
 =?us-ascii?Q?mGtbfPCYpEdmt37km5yNWBtThAbi17wrOXuM4ZmmNWcFY3J/VRXdekQd6FSU?=
 =?us-ascii?Q?p8ArCEfm9O5Q+NQ87pXoZDQRW50+Bvl9Ia1GLf+un+12jc50Zqv5SucTOr2U?=
 =?us-ascii?Q?B9htmWGOwqoK5aKylwXOw7TvZ19Hyagnah5M9n1qxEmZWIukWVkKlg7tH9/x?=
 =?us-ascii?Q?96adAkusCI3uLrqq/yzCYWjoNhbDCpriCrYVEzTUKINfV4CMBroZLqaiQlqv?=
 =?us-ascii?Q?DV4vghgyYsYkvWuEQKnYKRDD+6bfqEesPJGs3BGxYq2HUbLbGlY7voXmeef9?=
 =?us-ascii?Q?+mrBZcx4wSJhnKf6isIAMG2Q2eVVf/Mpkdw8dxiqZCtgOhuScY44IH+cwwfV?=
 =?us-ascii?Q?htqpCZi8NzRvvHveUKVJVKzgm1fjpwymvrZYiYvdbyd7R1NIO3EjAz8HT0zh?=
 =?us-ascii?Q?dXzAZrF8JFtdyCpnWV9wJImWurhtG65cwFUMOgFeyKJ9f//FnA5/xxB3rKxC?=
 =?us-ascii?Q?lAqist4dOwF7id7NJINasH7HXcrVkDt5tL85p3JP4Ryt4usioC8UFVSoCSLU?=
 =?us-ascii?Q?pLlqOlbB+3lVO+cVXAdZgLSlCSXNgWO01kiHqrsBR60DJn5O7Tsg4W1O97e3?=
 =?us-ascii?Q?pbcpe5lDBFk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5178.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014)(43062017);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3I9hMeOGtTBnA+l3xv8Vw8BpAFJsw4LkEZ/LTROA3bTH04caD3VuPOv2HMCV?=
 =?us-ascii?Q?YPMuDY4lR0jliwYh6+ZjBRyvi6IlqwXhun6Y2oPPAbgCVDpSQM7qqjEEhwAv?=
 =?us-ascii?Q?HVS1+vyClSa3CXUtBAEX3UrT+4y+F5KPv5yD+iK6rzVjor668ieTWTzLq70H?=
 =?us-ascii?Q?iReDax1trwr2j/3ACrC5oFr2ofkxi8tccujwp7dTPeFZ+0rY4LUFakoTU0E0?=
 =?us-ascii?Q?wKxBMZHBXkXVbpAZl3sYKzrq7NZePhT00cj+WjwDRxgUDzIxsSQ9Q0RymlvY?=
 =?us-ascii?Q?GLy7HK82ecNBQi6AmHLFa8+TfRDByyo+gcwr8aFKW8V11HCgIKPmikC+/GCI?=
 =?us-ascii?Q?8flf3Gj4wjsqXrK+SkRyc0YQy7pQ/uhnieWxy/usobn6sRQF66UlmUrpYLOD?=
 =?us-ascii?Q?vgktbgH3n+jGs+ODtWAGn5MR5niJzFTgn/W/uG+pIUwFY1iUZ7nVCP9nnFJi?=
 =?us-ascii?Q?Hn1mum96YLwFRcEJEF0Y5lFlEgbPWPCFV23r3KlSovTBK1dRaaf1334KP9le?=
 =?us-ascii?Q?WP5SjIf8wH//HGhhCtpbCpzMxVhd9SJVyfFGdrPKlNo79cXeBIMfBzXw+D3c?=
 =?us-ascii?Q?Nac9gslGhT9I0MhqzDD0c1P16B1zqpfT8omBOPYyzGQI5uHtvZ4DFWuq4icS?=
 =?us-ascii?Q?5iZVWkv0zf+tS55o9bhYrRg2E3zl7K9tK/5TuqpDRmawMxbyirMWztDNgbUs?=
 =?us-ascii?Q?yDlr9Z7hUvsNrFR0six0nbROYiQpY6PlvQ2A261fkTxSDU+IC5dVEyfxTAyk?=
 =?us-ascii?Q?fGYyCyWDuf3vuRu9hNGY3IMafmKpegNSr6P+2wSWPPFmlwO9U/vWRuRlX0lV?=
 =?us-ascii?Q?uI1mU/LZppUVpeYdAXzMoGIiddAl9zwOsSLAS/Qip4gSuX7G5UKPLMnUXfhh?=
 =?us-ascii?Q?IKH+dY3KvWxukdXsS+tUBag13uP36M6P1JfTHLiYzLu0AiCWtjLTZHYHk1pL?=
 =?us-ascii?Q?TzV8+j+pzRYAwsszZl6tMtYv2lyt+vTwoJKKGxY1bjd89P89Cib44671w2WR?=
 =?us-ascii?Q?6UJtIO8xTE9AOFPdeZM5+Sk2mmhpVTErVKvUE5DdMAhB4XqJe+rsR3Fai5Is?=
 =?us-ascii?Q?MRfwJm4mr/U8YWc0ehe2r7XNAFfujoKAZayM8l753Y7vgNlBYMMM/zQexm35?=
 =?us-ascii?Q?axWoozqNakYU3Kp4R/1yzRgT+2XaZVfDcuDc2LpYMIhbgPqmdgntNYWv9WUG?=
 =?us-ascii?Q?UQbsNNcbL2bQaLOS4e0WNmwNk6POfl0qE06Ux7JJUTLdYIotJLU8EaeDdy1f?=
 =?us-ascii?Q?FBtZxWxJxMXc8KIeo8Jh1oBMu7IxIYmOZs5jV5JFmv/bI9xxFfB0w6Lh9N0I?=
 =?us-ascii?Q?K9wwzmKE4aYWTQNp/57tXi1GAAGsEugn1nHBOotnwUjEujX+H5o2Hgf2p30+?=
 =?us-ascii?Q?DAZCxZ2gjQhiw9mrJ2zxFKe7TRfuyEKCjBEtwA2tW7FtTNu2UYDrCE5Z7lwm?=
 =?us-ascii?Q?k/fMx8pb/X47491iPOvGelBYaXgGkkPgeE7vhh9AeQZzVKwRrNeqOv94UEwy?=
 =?us-ascii?Q?Kiqn8LnEAcs2yT6Ftg4Un284CmESYhQJRRCT7lvXRWpdJ2m9ObcgS6sjCsL3?=
 =?us-ascii?Q?wpWKWeJIYATKACIDUCEBZ9RU9aX3sHE8/GG8hzsL?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6242d77d-4e3a-4883-2659-08dcb208dce6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5178.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2024 09:03:51.7180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3MHs2Z01yHgPRKYig7XLlR/N40qLR4vD5Q+G2JQWqGJNYE+4EhJkMRfYLmIf9wXleDZeAiRxyc/DIFERP1EEow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5441
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If overprov_segment_count < rsvd_segment_count will
 set_cp(overprov_segment_count) twice,
 reduce it. Signed-off-by: zhangxirui <xirui.zhang@vivo.com> ---
 mkfs/f2fs_format.c
 | 11 +++++------ 1 file changed, 5 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.61 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.61 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.61 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.61 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sZRxV-00004q-5O
Subject: [f2fs-dev] [PATCH] f2fs-tools: reduce overprov_segment_count set
 times
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
From: zhangxirui via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: zhangxirui <xirui.zhang@vivo.com>
Cc: zhangxirui <xirui.zhang@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If overprov_segment_count < rsvd_segment_count will
set_cp(overprov_segment_count) twice, reduce it.

Signed-off-by: zhangxirui <xirui.zhang@vivo.com>
---
 mkfs/f2fs_format.c | 11 +++++------
 1 file changed, 5 insertions(+), 6 deletions(-)

diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index e26a513..794ced5 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -764,10 +764,6 @@ static int f2fs_write_check_point_pack(void)
 			get_cp(rsvd_segment_count)) *
 			c.overprovision / 100);
 
-	if (!(c.conf_reserved_sections) &&
-	    get_cp(overprov_segment_count) < get_cp(rsvd_segment_count))
-		set_cp(overprov_segment_count, get_cp(rsvd_segment_count));
-
 	/*
 	 * If conf_reserved_sections has a non zero value, overprov_segment_count
 	 * is set to overprov_segment_count + rsvd_segment_count.
@@ -787,8 +783,11 @@ static int f2fs_write_check_point_pack(void)
 		set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
 				get_cp(rsvd_segment_count));
 	 } else {
-		set_cp(overprov_segment_count, get_cp(overprov_segment_count) +
-				overprovision_segment_buffer(sb));
+		/*
+		 * overprov_segment_count must bigger than rsvd_segment_count.
+		 */
+		set_cp(overprov_segment_count, max(get_cp(rsvd_segment_count),
+			get_cp(overprov_segment_count)) + overprovision_segment_buffer(sb));
 	 }
 
 	if (f2fs_get_usable_segments(sb) <= get_cp(overprov_segment_count)) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
