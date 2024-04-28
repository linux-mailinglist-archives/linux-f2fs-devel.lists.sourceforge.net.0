Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C15358B4B79
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 28 Apr 2024 13:16:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s12Vy-0000C1-4W;
	Sun, 28 Apr 2024 11:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1s12Vw-0000Bt-Er
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 11:16:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bMU87YWCmjz83FtStBkdo/ngsypV4KRejSdcm0EbsFM=; b=A/en6SPmqQ7nhdShPv86WGhY+E
 BxMFnIFUATZ/t04dS3qcFKuFQQ1O3dzclz0f3G1KJx0sC+a/TNtW+/2TefIIdUZogV4+7MNg6b+XO
 40X0PmuBe8uEHjMHyFjDI7XxYRgLlaOtJQoJgAfSssGA60tUUs2mm3ZA9tDCblcOzwcM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=bMU87YWCmjz83FtStBkdo/ngsypV4KRejSdcm0EbsFM=; b=g
 l88+006984sheeWOIFzn02IXxlxefo+Y4rshCraxevGdtNVkb2MBbaDLfEsbm5+wr2gI113rlIJ4s
 +VnxJHlWlFL+VW1vDR/7pcRf7cJALXCmuatbte3dyGF1ghFoIBiZysfzwsChtEyJhcY2wwx7GL5ni
 9gXunxy8ZjsaI1SU=;
Received: from mail-psaapc01on2079.outbound.protection.outlook.com
 ([40.107.255.79] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s12Vu-0007mO-R5 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 28 Apr 2024 11:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gJlmac62OM4+tx4yOtPIVhQbJirnw9Yi7PWP878Oi2MdaDUAKezw82tBqN1MtmcrLMEZotckRGHpi6fmz51238OvpKNNx2KCO95RLq7xOiKGj4vj6L1NXAykJ+LPDGCYtPCJLjq1tNMNj4MtKywpyT2I7RnHt+Z95DGhGFjAWf4DanHy+G2QdUm8iHTsLbgSK3IT0ugGEZXhrOpstkcfWR9u90rN2gx+FfsSgpOW4BedVtw/29yL6uZ/YB1D822wbJkY4zfEL2b5AS3Yyr8xpdD2yhyLRZg0XnpmTmeTr21ELP9SwE1cvmkGgy+pN8n9Kggz69ZuC5QSJXAHBIf3Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bMU87YWCmjz83FtStBkdo/ngsypV4KRejSdcm0EbsFM=;
 b=TfBevdCsSefnPlvucMKDWLEKcilnSRtDNylZP256PNuMhEfd+9uKUg/7ODNFamadTQwXg01AB96/zn9nLR8jTtU1ZR0wdAVFmu9/leGPMTsiOvXfZRLcl+a/9+353pQZojGvE98kOqkT6mXLc9jSXMr96k96yLtZzhTSqyYr91ErBtOKXYhqVXykQoVPMC9S7khCbCe3XaCye0DMV34O+V6EE1B2nwQwz3MhAuJlVgm761cFepJJVodgNFKaOK+xvpUqe8nJcmqa61k48VadQP+lVozTq2+6PHdsNvfTyuNgkab9xuz0/n+/hdyhqa266VmdJjGnmbWl2qCFuukG8w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bMU87YWCmjz83FtStBkdo/ngsypV4KRejSdcm0EbsFM=;
 b=quPq+IdU+pGaxCVHsiPYNxnUcEmxhH3QUXXvKveEpGUcROgMtDZ0TK+eUh5U74Qn4YNql6Z3wiSUVTs2vAHJsgC+S7No7gI+o96tPTCI0doE7O9CIX13TEzkMwId8JqUKtbmdYEk/qTidzRVzbhKHZZ9U792ahBagGSG7IkIioggauu+aWRyJlYRI/cLR3YJV0SN259GjOJRCOGpwZRe/aeLPvHD7kAwve+f+pp9vglOzteEDdc5rDDdYxVhjFEbi12IekmvZOSWruPU2ic9/EkiHeAy81UaL/lSsNi1z3hd/SIPx82iIuJgvXRwd7oDPoPqdKZYyv8uJIMF9vH25A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SI2PR06MB5266.apcprd06.prod.outlook.com (2603:1096:4:1e5::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.32; Sun, 28 Apr
 2024 11:16:02 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%6]) with mapi id 15.20.7519.031; Sun, 28 Apr 2024
 11:16:02 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 28 Apr 2024 19:14:57 +0800
Message-Id: <20240428111457.17224-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2P153CA0040.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::9)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SI2PR06MB5266:EE_
X-MS-Office365-Filtering-Correlation-Id: fb087850-05b7-4cba-14b6-08dc6774968e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|366007|52116005|1800799015|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?8fVKQvTRiA9gaF5KTT7bQ9k15iCTnONoRDoX0jk4GwF6cHwFyOizjmE7EMGJ?=
 =?us-ascii?Q?KFcDOkSSkG55CU5Z2cWm1XQ9dVRFBN4Ts5VqpsGpw8p27M8NRaR8XTgT8qJm?=
 =?us-ascii?Q?j4svFLHUf0PmR7LFrC0kTJtpHM0cjw500Vr1p1ErgGsYgS2GT+o4MWvrW3zi?=
 =?us-ascii?Q?tIwyrCxhPBAblDkvyxGHG/NfkWEONbwArk4XEVG1LCr5dIrGzRu5u0abdfs8?=
 =?us-ascii?Q?DMg8rf/FzXYMKX3sL3Ptp1RMANWU6aKu+wtShpTpKVscX3y+oSnCnH8jF5ei?=
 =?us-ascii?Q?9fJFk/312GlDAZGdhybIhwKYOsqXh0t9QWZhPdKWRplSGVYHeW0ldcn+Av3o?=
 =?us-ascii?Q?LsldUejZ5B1Tlq/MIydpLcdJdOl5aSmZqvdqf80uWwhuW90g4WMMgtAxM0eq?=
 =?us-ascii?Q?kPrd8rjtdwqqC6aV7KD9JQfjgj/p6DDIdivurepoHgcske+VFe47EkEtxF0I?=
 =?us-ascii?Q?R1Uml7DCsJJSCu1yEL1Jt424zQgNGRFurekEyvjLuYDpJpRUcxJgxT7yLnXt?=
 =?us-ascii?Q?8j4SwUnY6vB59rnvdZRMlknxw7H3lJUtrd19dyIjl4A33xF4AxXhruLOJOGI?=
 =?us-ascii?Q?SUUxUvzhQt5OZXg88DELzyqPtEXPGJ/DXzDi2wyslSsPv9XlgTkG5cuGuscB?=
 =?us-ascii?Q?7ni0uSBC4SKxgec2BEngpybJx0Aqn7C2aOi/rPcbEixe72ptDgFmw+cBNbWB?=
 =?us-ascii?Q?mxbXTuKQZ6AoZ+H9xUSDwcTa4aUGZeH9X4P/AJLo+kFl9JMLl/Ap6arqrmZm?=
 =?us-ascii?Q?QR6U+Z6HwqN+yrbvD0IqaNECDiQiiBZaXL7Qq98xCUHou0SgEjs6PmEhQDss?=
 =?us-ascii?Q?TBLhRn6Cyrvi+ay8voQzdU82zG76IeICSsk7A7U4FLWa+DK7Dn36dAn/xqp5?=
 =?us-ascii?Q?VJDz6bEswRIMKSrYt4QionBxofA4t1TWeCe69Jk5UDxT3Gv9FN0HunSPWWh/?=
 =?us-ascii?Q?OU5o9NMycPsHgimey1Da60K1iiH59aAcXMA2OWJtQRnua9IX//8IL+Dkq4QN?=
 =?us-ascii?Q?RzQd2w9g6clM5IKK3+w2t+dbk/MoITF3VcvRT44iuyUIwKWpPXu4woGNxj97?=
 =?us-ascii?Q?XT5pzQjcoh0w4rqgIXcFtkkDdmS7bexvkixNDaPWbW4pLEbC5dxyA6XHgEqq?=
 =?us-ascii?Q?+LVKkYUqZsbalkdE4dm5gfFwadYzNOokX60WflOhXnYddY6PxanyMOxXvja+?=
 =?us-ascii?Q?7khaU1kgawGA7ZUXrqCMUKyFsiHqO8ZJqrL2pGPvQDDv8bX7LvkL0l11ARab?=
 =?us-ascii?Q?SbYnZLpLaZiMLFiXDJ/yDaVbFtxcWn57aQqtI55U/k7sCajqNxplIEFAyA4T?=
 =?us-ascii?Q?fhOKOF99YLobu+UIGCiggvaudmWjsJObQKtI38iidYxCPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?paz1ZiQCAN00cKDjazTqNzSMBzItyK2r+ajRT0dMyKG4b3Q3ZTM405pjyD+p?=
 =?us-ascii?Q?fVXScpa5kE06qnTOP+ydhN/Z/VTo5dQz+/Y3k2WhyKQG7CzptcrPf/fQC1th?=
 =?us-ascii?Q?vwPHuMcmCURx7rt41rzdXUf7c9p9rRPAX2/zesceKGcCeLEIvimzQofWokqQ?=
 =?us-ascii?Q?s9pYi74JCf4U0kUFKRQSlAoQ7KadGXtgajQ2YU4lOzTIwNtcJD2085YQeVPJ?=
 =?us-ascii?Q?foxF9D6xeOy+5CJl2bcCxK2k/QmhSGcgqJrlABA9w+B6nERG/kAvaxpOZ8Lt?=
 =?us-ascii?Q?7RCJR42xbgMsaJrJpfxbYQjgyau8wv+Cdq8mdaiUB250xc3w/luBGKf0Bh0n?=
 =?us-ascii?Q?fIW7KMWiHDGZEWs6A6pAE/TI8b5Sob6p0k+H6mWNgq4k+GPF2IYF0WDI7Cu+?=
 =?us-ascii?Q?E1g7EwSh/DKwEaHrzKcISE4UyInu8wJHebopz0Et305lxkcdCCuWyJdiQRkm?=
 =?us-ascii?Q?x4YYIeH+xg9ZJ+uYv82cWXLEY0R/spe8AzuAufn5CVgw+JPs74J8KxVsbR/z?=
 =?us-ascii?Q?Au2wShX8OSiWgXCNWP/zRPFxPhrbi6Q+Dn4WpvlNvgIW5mOkCKxN7rMvoKbl?=
 =?us-ascii?Q?5olbpex19pf1YamwotyH8TY6PfGjdjjAXyBXsGxI9zlWC1+ZAamxLSKiTjTT?=
 =?us-ascii?Q?Bnesz6dk0erGGSGeia3wrH+FyjwcA1A4njIjZ/rWBqyqVaMnai3IaWwk3Qyy?=
 =?us-ascii?Q?H5U5r7bL1F82O/x4MikE6Fem55Bkfku/heuNZ9DfoDqnNs9RgMRCaUYuQvvx?=
 =?us-ascii?Q?rXPFfE0mWBU13ZP5TcwGc938+2jzKXsXTe/bIFoRe8apGDYZmoAWUToU4d5m?=
 =?us-ascii?Q?FgtU46VcF/IwYCyfUl8qXsruhiqI3zFLIBIGqc5gE9oT9LwVB+2+o1dKZBY2?=
 =?us-ascii?Q?6a/uUyu+R1lhY+lETWwM1UhwzHyUmj+1u/nej4D33HRLJzztpIBjar24FgKh?=
 =?us-ascii?Q?m0NEbxfrEi76GbhynLbQoR6WzBgn4SmhLbv0SMnjV0DdphF/0NikjimMOxey?=
 =?us-ascii?Q?Gaf5j9W78nrGn/q/IrAy7hhHPDasuqSaF9+wlB0CwcbfN9Quqqtt+iq6H2D5?=
 =?us-ascii?Q?t32sCUa9YJ8JlspCbrOXrCrMjJ/m1QcRGfMxXVvGUFWNoA4W4jKMATtAORF8?=
 =?us-ascii?Q?xSLfrzLvFLI2WqUb6rpG6pj0CKrZ3d220lhmT4kT0WFS6QHYP+w7RheczR7N?=
 =?us-ascii?Q?ncWThm5wklJMYp6PDQwAtcfkiu3VEF1LT3BPnB2GHLeMMeWG6qfEXB11TFfq?=
 =?us-ascii?Q?RLd86NKttmyvWi5LtRu5mZmWiB3sQcNodwQ+dsrPiumYf2+o39VOciDINZ5S?=
 =?us-ascii?Q?zVG8MZ9YwR5VWVVldwyHH32mK8QgYK8jpKYScY+wK3Sahsim1XpgQBOlgq4j?=
 =?us-ascii?Q?EdEegpWrqAUdgFU6NJXSad6Qn9DR+9Rtjc92uznYq0Is7qi2ddzkHzOOYnck?=
 =?us-ascii?Q?yCzf8iZ7NMiQGUrPYP46NiqpQqiKLE82AU87wzDhoClBmfc/LEe9tfJ2EL/O?=
 =?us-ascii?Q?Eya0oaZu7wtN8YEp7Z5/+AGdfSBj5yyUZnFXRhXJxsW73WR3XLKbRmMQcb2Z?=
 =?us-ascii?Q?pmFVTcfCdy0fC/Ctev6vxWVM0+Dm0hEcrJX/6ZcT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb087850-05b7-4cba-14b6-08dc6774968e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Apr 2024 11:16:02.1670 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /1b2ZjBW5eIwkNhUuU/voE76WeTq40TILDvFLvYRsRLF6H2frXJogM3pcP5MpVWvRDJsEszcioKUezlbDt/+Yg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5266
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For zoned-UFS, sector size may not aligned to pow2, so we
 need to remove the pow2 limitation. Signed-off-by: Liao Yuanhong
 <liaoyuanhong@vivo.com>
 --- drivers/md/dm-table.c | 4 ---- 1 file changed, 4 deletions(-) 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.255.79 listed in list.dnswl.org]
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 HK_RANDOM_FROM         From username looks random
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.79 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1s12Vu-0007mO-R5
Subject: [f2fs-dev] [PATCH] f2fs:remove the restriction on zone sector being
 align to pow2
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For zoned-UFS, sector size may not aligned to pow2, so we need to remove 
the pow2 limitation.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 drivers/md/dm-table.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/md/dm-table.c b/drivers/md/dm-table.c
index 41f1d731ae5a..823f2f6a2d53 100644
--- a/drivers/md/dm-table.c
+++ b/drivers/md/dm-table.c
@@ -1663,10 +1663,6 @@ static int validate_hardware_zoned(struct dm_table *t, bool zoned,
 		return -EINVAL;
 	}
 
-	/* Check zone size validity and compatibility */
-	if (!zone_sectors || !is_power_of_2(zone_sectors))
-		return -EINVAL;
-
 	if (dm_table_any_dev_attr(t, device_not_matches_zone_sectors, &zone_sectors)) {
 		DMERR("%s: zone sectors is not consistent across all zoned devices",
 		      dm_device_name(t->md));
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
