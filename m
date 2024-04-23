Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A79568AE3F2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 23 Apr 2024 13:31:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rzEMf-0004MP-1D;
	Tue, 23 Apr 2024 11:31:09 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1rzEMd-0004MI-4a
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 11:31:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JmCTpefieJRDInI6xnSs5CW3ict/+l2b5AU16ablbDI=; b=mxlhaFCXunFjW8XE/GNWDgSbhQ
 jmKSNHiF3/tZTzEMx+jkgg+TaXz49TVvu0b7Y/HhANoabxBVPn+0LoXbmaU+UaOCScx/UEyZkJ8in
 cvlJIjrrEmtBA+osZFMG/avaCd/qJ/tkrwpbmLEq7xmgB7v3Jxfx8qYxIU85rrt10Bos=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JmCTpefieJRDInI6xnSs5CW3ict/+l2b5AU16ablbDI=; b=A
 b4TdAP6OOrpJTEmUeIwbn04Q2eTIZuYeN5wuSTVWBzNqll2CqOFTH7ta/zBCsYN4hQReH/wiDSfiM
 9NWW9B57jHcGUgo9mXbQJvz3gCQ8ErSN9dcOUUieFF7HH2kkQLGf3Pv6vfjeLKOpiLhEuOQmK0gBx
 WUNhVYnnTWPp+q2U=;
Received: from mail-southeastasiaazon11011004.outbound.protection.outlook.com
 ([52.101.133.4] helo=SINPR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rzEMY-0001ZS-FO for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 23 Apr 2024 11:31:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XVVm5l5S2zr1+N/Lhm+6u3tvCkwJXysWi5m0cP0jNdUysAe9yaOtohok95KgzQ+LFIAQr6QKAhK2mr0tYSgm9jb9LIwTNNq3m3P90vRwdTN+LYNSVSlo45JXYY2pkX6sn4/x6qLFJhihR6RNG5VJ4wRHjygGtWygVAkBbrviDxerhn2lz7lCYf9g5W6aYY0MBl6aRrk5MYOBojpuB880CcjL8Pr72zPUp1UVqO41pM464Dv8Osi8fgsmS2N0issoSqoxqzfJimM+t93aghnSHmzi3zZYzO4AWCyusXRfyS/5FFNMR2NFM+esT4qURGB1JafvEOJTLsMFwUh286Kw4A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JmCTpefieJRDInI6xnSs5CW3ict/+l2b5AU16ablbDI=;
 b=PZNuvbsABIS4XEZnIxtJmATF9+uUe2tl65Ny699Ex6UC0uJdhmXPe+z14ALfGH9eIk5XEwpstKWuFNdCLGX612OvT+ID64Nox2yn5bZYMVkF5zcKmV29oCme43uIJmageiXa8w6/Pv/gpTkO/GqzeasSJpXR9fkESlF1g8g7ERnFFtpaZotL0IOexN6SCbnQtfrgYJd6vY6L0C2we7C4KA4QOXl1bk2e2Nb2lGow3nldgF53B58gvn+9tqepK7EoV3KIw7rtVKz01OXao3TtH3i/WYXn8heg8Wj6/vXMk6/1o6XG636I6VWfKnk2DSwtsHAy2wEpSXnQ6exkNeKrUg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JmCTpefieJRDInI6xnSs5CW3ict/+l2b5AU16ablbDI=;
 b=cm4aL/Cl1EKeRXHjjtgj8cA663KvpDQiiLzP2ldHk2aRLrqlD0ZD1T5KT2o1j6h0Wn8eRMxTqMP9m/aH1eOlfCbq1GjzNtjmFMfFpgAlPtS0+lUprsIG+9sLumNI4Cg3RgVj/bLQ5kbVku3DKzFPuaknFeMHp4EIbYZQcuGgYtE1jpEDgA9XP8SBUz4psI1A8yqqV+g0Ug/ZWNjPQDKl+BskDlF4nF1TBSBkzWMPNVuZUGTP4uMxTnP50lN4IbmPGWwGtg/VsZ+hWlO00V7cVel4UWHEDq4EcxFT4Vm3t0KP0c6qaDADL5h3uE8xIh88UuogIJPNxsqi36uA5TtDDw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SI2PR06MB5388.apcprd06.prod.outlook.com (2603:1096:4:1ef::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7472.44; Tue, 23 Apr
 2024 11:15:08 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7472.044; Tue, 23 Apr 2024
 11:15:08 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 23 Apr 2024 05:27:59 -0600
Message-Id: <20240423112759.4081008-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SGXP274CA0001.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::13)
 To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SI2PR06MB5388:EE_
X-MS-Office365-Filtering-Correlation-Id: 6bc88a35-c1aa-4f1a-2dfa-08dc6386a28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+vYvIv0Z2JGOb2inXli/xRottIH2PYgC4gXpbcwltoc9qEVtyEPF/HC0N3Ks?=
 =?us-ascii?Q?kY7wYhX36ZPlPv5lCVS4dNyDS0y7g3fJ9lCH4c/e79J7zL6f27Ff4w+gjK1y?=
 =?us-ascii?Q?6ZXPyWFs+SJSpqrejHvMuFhWTkRR3FhiR6JdYAePTu8FQF4ZLTrWTB1aK0kW?=
 =?us-ascii?Q?CeoJiZGfgJU4fuyDgJxq8RauGZn/kAHshDklIO7nScBHtEN8vFPVhofMx5tw?=
 =?us-ascii?Q?/prbsm7o2jhqxp6U9Ud9v5UnDGEUg3bWEiWIBJ4YmYaUp8hWCM+LlpNn8zlY?=
 =?us-ascii?Q?F9EMj+NszTyacGPrC4km9wzFUuadmo/b/G6MKqucOhZEs8SeXFEvMMbKO6fA?=
 =?us-ascii?Q?zm+LjnStJ8QVNqqc25+b9CT8qQJxG4JS+ZfNiIdI/rIFKUOWf2gF+/oqzbYA?=
 =?us-ascii?Q?6G84bkTn8rSsTa4HC4W7oyZWc8aDt3rxCKU6vWGVFth5JnlEnr2pnmCSQk+3?=
 =?us-ascii?Q?IaixFnaup0IN84TBE1+83rE9Mje5NT2E4LOEWmyMqhklyCqoO9SDynXKjhiD?=
 =?us-ascii?Q?fJZSzaYoliDCUEkzWHn1CJeypFaZylAu/aQ1d5S32Biu8wAOV5GGXE3rt0qG?=
 =?us-ascii?Q?peIWB37krfzu3ipE9eABYdmjZqCGh3DJ/Nfw8ltVKbwTPzigl+kUMARft5R4?=
 =?us-ascii?Q?UwTzIaHb78yPR0Ef0ZBVlX1cISbVnzXrM2YsAJmJde1Y/+1jOlcWu856ovPo?=
 =?us-ascii?Q?/d2XJJ/DqlQUGI1gNVEnW0MhFHPZupWY+niiinCvF1n+d6Y+H8h7jbU66k8r?=
 =?us-ascii?Q?nKCWVgYKWmPKpD259T39rzto13mSFVuf76pz86tFEgevBl7ar8J6jDxQNpza?=
 =?us-ascii?Q?7wmsZOSZSZORPZ+24Pr7ucCD/zbfC5RB37A1YCynorxBW8w8Uf6Zzv57cWHW?=
 =?us-ascii?Q?L8KZzPahvPQKZklbk7w8KOW9ayYiRQIbj/nQa+l4o/wnKs7Ver3IVabStQm1?=
 =?us-ascii?Q?DRdzaDr78D21FqZR7IauZRFc/QYVhR5ZTlAskUVA3yPh1J6ZO9uSmkeLaXlF?=
 =?us-ascii?Q?IUOhgX/m4JvVTCwlvhr1+7kG9aQR7PT91qsP4pQ9SGQoEPS7iln2T33RBR/s?=
 =?us-ascii?Q?gwkkuJ9QA9c3tp+lkkwRHZ1KMJ3SVZ4F3AfiYjKElTzK4ab5d5mKinZX9ZrY?=
 =?us-ascii?Q?KQ9nAn7OKxwjdJmF2yWLaNsfJl/zL7g9GE8whB86AvaCoBwxSxmZTWs/SJ+Z?=
 =?us-ascii?Q?nlHj0dPTPGv7kDK80L0AKBamA84ORYAizmRD+xmy8NLpyYWTnHPj2koKsNl7?=
 =?us-ascii?Q?M/qfsHeWcAlUYF3OwvWMMA8IspCgugoyHLaOIIwrIfrJhZvC1poFy3hGimt6?=
 =?us-ascii?Q?KpbThfTSx855vHaQbcSS2EIjC0oa3hPQjFsYKAyMtjHfxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(52116005)(1800799015)(366007)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Btd750/jtY53OIUXNijD+zZ0TLEZ7GQ7r9iNLGgx9toz3Qb9aBwbSoNDVAAl?=
 =?us-ascii?Q?k+FVCKQ5OI/Ys176Z7uBF+aS9eQK5Sd9BWSw5JymrhaqNuuI89d3PnD/U9cw?=
 =?us-ascii?Q?NOvbDiOAq7cU2Q3P54PdGxURMZgELqWQV+HMBmJV9+OZ2Lq7JOkp0euXKKZT?=
 =?us-ascii?Q?Z9TysgQFAPAOq+jKWgmXB6aDc3H6iDHez+sU5nPZhoyZ44c5PInf4bNBOAzS?=
 =?us-ascii?Q?0Y9XDXkNlVDSy6e3YURZGKaba9lJkijj0F9Zu1CaENluDUJUuidt6QWbdkxW?=
 =?us-ascii?Q?VN401Oopd1zlCcJgrbDQENvruOr9jXGYpbAZqcc0B6Nudrl8o+kVJlj4l60n?=
 =?us-ascii?Q?YMyJgT719lGiYfQ1ueKQ9pOPGINcCQgL7GSVwrqpXpgMxcuU6L23hyqN01jB?=
 =?us-ascii?Q?5/xoMjqa8NTjjHqGf3XadI4HEynzyqsEfFEmNnodjpWMzVGqrMcYURFle3Ly?=
 =?us-ascii?Q?GXzSpG8n7mIJeV8YFb2izSjjNJaX7iBwVruiyKKC4QdtZG/nunxGC5NHgfsG?=
 =?us-ascii?Q?+SH2o2p33Vo30gvYHu1nKqI6tgCrw4Dg+KfgZWgXOE90tULhVBNPK0jq+gkm?=
 =?us-ascii?Q?NSe5u/1uwUIWR+clssB3xZY2dyjv3c5jE1+GfJoXUH/3W308ZF93tr+GfGIW?=
 =?us-ascii?Q?amw5C4Z1LTvObN3adk1DjCimVFnGoVIAQYDkzuqL+ninxQUqZj1qh+UDYPV6?=
 =?us-ascii?Q?Vd2sGN2pg39MEFjULgbX4AYJhUQ+c0R2/r7kRGPfzcWDMMlSPpTMDESLFkOq?=
 =?us-ascii?Q?xTVLmIRaD0njXLDritDHU01foCFU1Exw0HSC3sgJz52GuOSjZyZii9/5i2f8?=
 =?us-ascii?Q?lkGNwYT2w8DgeG9DukJ9w9vIX1UiIXjAzVpmv2FcSoeMyadv1EMboiWG6WS3?=
 =?us-ascii?Q?JOfS2Mxrh5PcrE7qa5wn9aMMk3mx7UqVKj5sb/qF+nA0Z/1ELwaf6PQmKSWh?=
 =?us-ascii?Q?9JjuKhpfgWWY0uheQSpFPJBmD1qfD2qZ/4yZl3JGjlyBN8ksVdmrtPLP5wDU?=
 =?us-ascii?Q?Cy/eEYAn9S7F9gmIHR/gAghcKATpd6ACGeesqdxFlY+sL4SaaFD65VexFUYd?=
 =?us-ascii?Q?yPTq4LCqx91ZoYw/sqkDeYGb4AWY0yiiH7d0nEu5IyYn1few4i2ZP50UYRns?=
 =?us-ascii?Q?7AMBg+890SmFw86r0iGTeUDsq4JiVe0B18+WE1GUI1RFM7Gs5Cn2wo2Q3Iwg?=
 =?us-ascii?Q?wGLqy+1OEZVMZO2gEAorMWnzoIIKAbl4gRuw80sTg2idDo5lr24rJzrPxdEY?=
 =?us-ascii?Q?afLRvDogSA6GcHCiYgvUmPFZMj+fuAHLiRm7utmrWYLSwMurSFRUYQX/JJsu?=
 =?us-ascii?Q?HkDce8Q6Yaumpmsc8KL3xEwPih8OnjCx/QHN8S/chzZdp5eh5687ZwV+Kw5c?=
 =?us-ascii?Q?4UITJvJ3Wa0RPPB6L4o4ftxNOfWeebz+k5v4PRR645eWEH2VGSXRMXBHWGfS?=
 =?us-ascii?Q?9SK0fH3KkS3vrEpVJ2uA2uUg/FE66lxX3vua1Y/2enPtH4bKCtPs5BAT0YY5?=
 =?us-ascii?Q?KGlkouPuOdQSf8DyjtPd0KBTCLx8TNUfgNOa6oJb7jD3EIvF0uMMbbpzcIdR?=
 =?us-ascii?Q?eqvKbNiWAMuMcke2yVaBAFviHzNWohhcCimq5jX4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6bc88a35-c1aa-4f1a-2dfa-08dc6386a28a
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Apr 2024 11:15:08.5640 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZNSQdxMrzB7XoXxpKVAPFo4zzD6ugAh4CXXrDRLL2WuZ8ObQC6/YOdWgFJxHU+5FvS9gfKc1KXd2BvT6b/pKqQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5388
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To make code clean, use blk_zone_cond_str() to print debug
 information. Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/segment.c
 | 17 +++ 1 file changed, 3 insertions(+), 14 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [52.101.133.4 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.133.4 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1rzEMY-0001ZS-FO
Subject: [f2fs-dev] [PATCH] f2fs: use helper to print zone condition
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To make code clean, use blk_zone_cond_str() to print debug information.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/segment.c | 17 +++--------------
 1 file changed, 3 insertions(+), 14 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index f0da516ba8dc..22d56b99f930 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4961,17 +4961,6 @@ static int sanity_check_curseg(struct f2fs_sb_info *sbi)
 }
 
 #ifdef CONFIG_BLK_DEV_ZONED
-static const char *f2fs_zone_status[BLK_ZONE_COND_OFFLINE + 1] = {
-	[BLK_ZONE_COND_NOT_WP]		= "NOT_WP",
-	[BLK_ZONE_COND_EMPTY]		= "EMPTY",
-	[BLK_ZONE_COND_IMP_OPEN]	= "IMPLICIT_OPEN",
-	[BLK_ZONE_COND_EXP_OPEN]	= "EXPLICIT_OPEN",
-	[BLK_ZONE_COND_CLOSED]		= "CLOSED",
-	[BLK_ZONE_COND_READONLY]	= "READONLY",
-	[BLK_ZONE_COND_FULL]		= "FULL",
-	[BLK_ZONE_COND_OFFLINE]		= "OFFLINE",
-};
-
 static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 				    struct f2fs_dev_info *fdev,
 				    struct blk_zone *zone)
@@ -5002,7 +4991,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	if (IS_CURSEC(sbi, GET_SEC_FROM_SEG(sbi, zone_segno))) {
 		f2fs_notice(sbi, "Open zones: valid block[0x%x,0x%x] cond[%s]",
 				zone_segno, valid_block_cnt,
-				f2fs_zone_status[zone->cond]);
+				blk_zone_cond_str(zone->cond));
 		return 0;
 	}
 
@@ -5013,7 +5002,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	if (!valid_block_cnt) {
 		f2fs_notice(sbi, "Zone without valid block has non-zero write "
 			    "pointer. Reset the write pointer: cond[%s]",
-			    f2fs_zone_status[zone->cond]);
+			    blk_zone_cond_str(zone->cond));
 		ret = __f2fs_issue_discard_zone(sbi, fdev->bdev, zone_block,
 					zone->len >> log_sectors_per_block);
 		if (ret)
@@ -5031,7 +5020,7 @@ static int check_zone_write_pointer(struct f2fs_sb_info *sbi,
 	 */
 	f2fs_notice(sbi, "Valid blocks are not aligned with write "
 		    "pointer: valid block[0x%x,0x%x] cond[%s]",
-		    zone_segno, valid_block_cnt, f2fs_zone_status[zone->cond]);
+		    zone_segno, valid_block_cnt, blk_zone_cond_str(zone->cond));
 
 	nofs_flags = memalloc_nofs_save();
 	ret = blkdev_zone_mgmt(fdev->bdev, REQ_OP_ZONE_FINISH,
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
