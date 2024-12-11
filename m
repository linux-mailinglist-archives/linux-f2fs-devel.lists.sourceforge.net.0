Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EB559EC540
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 08:00:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLGi7-00048Z-TZ;
	Wed, 11 Dec 2024 07:00:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tLGi0-00048M-6K
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 07:00:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=BeCfMvzT2ut2Jl1Wrzj7+xcecLJNaDaJlcFtlve+l/Y=; b=HGuBuXa+heo54+rbhKSvK5Uq7q
 DF5LplK6VMCgMAdkm33bKzfzwSaxY7Vg7pyNO4s+5zjKRaqgUT7zVwktB6GHfR2CSksrrWaTTfNdJ
 zpHLsSC3XuKcQmiP4WDnqNCkmADsFu9gdzu9VjrRcoVKb2WGwQ2/ECkHalbd7BkFpd3M=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=BeCfMvzT2ut2Jl1Wrzj7+xcecLJNaDaJlcFtlve+l/Y=; b=d
 Xw9fifNUxpATl2YQuLYs5rgDoUrQEzrikmu39dJs8jOAhWBCErs3rGRM1b9Dr6vX1m48wCxY72PNe
 PQ18hybJ4YFOv1MewzqjqGaxspQMwr12+R+NSwP7WGI1SN+yEYCiVLxfWkxq6W8qs/nusgRVEutuC
 pWHTDpFimObLQyA4=;
Received: from mail-tyzapc01on2048.outbound.protection.outlook.com
 ([40.107.117.48] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLGhy-0005xI-UJ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 07:00:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wzc7bF6mL9O5L8h137bm++46qkAZ3wt4wLQjwIAyu7nKMDfnP/lo76o7g6cQR36nBYjF6ZPHD3WwXmCt3KxF8wotht0bZVAm8n+9sHDL2bDCJGfidSKNMwiU4N3HaTEKBo+GUBKIMdfzrROinBp/8Rt+FCUlMUKHuPM4hxw8msp++ME31uTlNqAOkqGSBM/GP786kQJcflsQsa5ubuvgGQLECIQJ0DNfpYA9IeLg7IK7SGWZMEYeVi6zdgUEPqjY1A6dDjL7auWuWw8fBiTtgDYdzGU71xmZVOKJkZQ0NXneSZLdUwuVSSishjViISSmxTAEUKfjUvhVkqSlwv3vIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=BeCfMvzT2ut2Jl1Wrzj7+xcecLJNaDaJlcFtlve+l/Y=;
 b=qE/C1XcbjmHPHzysH7v6HK1Ll+cDKxt4tbrfrWwu/IaGm24Dfm41/mPwkgA3Om+nS/ag18I7Wh6hqpAorhdm7pV0M79yjcb4PVz/q0xnHSkgXqXXxf/F5bQe0LAn+vz0Mv5zNDK9lNbLE4bYOw99hzmu8VGgDweMyOnMpTbQbriWE1Kd3neUnCj+u0tihnDzzHb1IDm1vi/eZ11zTXzET+U19/9dMwZhWszNmJ1bAHZPd8GeMBljfqgYeq5o9qt4hw3i6Q6MiHQaqDf1xysZM1EQKYXcg2lCAZy/w+R0IaQK3eLWNOvZCJrEcBRXEDqVs+lCmlFlkC7z6DPtBt+y7w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=BeCfMvzT2ut2Jl1Wrzj7+xcecLJNaDaJlcFtlve+l/Y=;
 b=c9ecpCaH/DYypDmtKt4dn9hWvsuB6j+LAQCOaHMSTc3WDm0e09KTXaYMpyuc41I6hL/P/CuVAjKSK7Lu94XJezDwab4uQcgutPOfw34NFeI6dRhAtCGIDsWLq1Cr9L3D8R8Tm4Yy+CJnNJtLyurMUvHJVkgOaGXwLIATDJgddM8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by SEYPR02MB5797.apcprd02.prod.outlook.com (2603:1096:101:5d::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.18; Wed, 11 Dec
 2024 07:00:22 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 07:00:22 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 11 Dec 2024 14:58:39 +0800
Message-Id: <20241211065838.4129061-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR06CA0220.apcprd06.prod.outlook.com
 (2603:1096:4:68::28) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|SEYPR02MB5797:EE_
X-MS-Office365-Filtering-Correlation-Id: b1b4fe7e-9c33-4f18-8b0b-08dd19b17b54
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uXjak9tXT4VWSONiov0mSWUA8707u1S58SOrUtwL0HGqYNIMxX8r9oyPCzWl?=
 =?us-ascii?Q?lULFrtf5wHPT2aa5FKM+q7lXbwzFRkjY0HIJCilYjibblLOKOI6rBMqBvswm?=
 =?us-ascii?Q?bdrjeO1NUsvNlL3JQM1qaO7wyPg8/L5JSSTo783kvztPkCW495xsAZy70XT+?=
 =?us-ascii?Q?9a/Zg7QwooF5uaD+dvaTblRro/vY5zcb0HN+0nQSBsjB1KAe/13z7U8KfyUn?=
 =?us-ascii?Q?SwCLELibqw1YHLvPfVfxSAm8PGZrKj9tOMhkeObFP0zE8Ae9Isl/NCSL9z54?=
 =?us-ascii?Q?g7t5VO+BCVKsMKxKtnaXmEBRR5/BvFth/r3viid5ouolwt+R21r0PTvC4RP4?=
 =?us-ascii?Q?TXEG41nPrPH4QHnddj5+oJHb3VqlllFUsl3UiWFXS/pum7UX75WjRSwx7Dw9?=
 =?us-ascii?Q?0uMkZuIcyuCTnMA0jmKw4hNJDa3ElG2g6baEwjIQr3EGX7CZjDd/tdMByczv?=
 =?us-ascii?Q?8QFisZ4p1ufereY2QFVRCM8VbXiJh8GBSuJv0BMC3x5Zo7nbt/V3+W/8cx8c?=
 =?us-ascii?Q?no5piX9OEBITxu/Ger4PIXuBLWogMLdq0gC9zWmHjkNOhkWaGiJZyPrPg243?=
 =?us-ascii?Q?VBOQ08M6US+Q7CXsnUIQQ1AGVHrANIEDlG7V1B7/ToVDdFMv1YM+Cz/yTwkm?=
 =?us-ascii?Q?PGZ/bm/3P+7eeW28JdTR47T83xMnWKeZunBCdnKa3ls3oJS0Lh7wAQtxpouP?=
 =?us-ascii?Q?YFGSsnMhHsVbej61ZFfoMRw6I8BVzaqbSY4KwcIT9ANT9Ct/y446CvMpiENq?=
 =?us-ascii?Q?9GlYE3Ee1C/Lryr1rHXiUkMgxHNEEJk+SWF+DCHO+Y9VMZb7fRNLCp48QxuX?=
 =?us-ascii?Q?WRtI+qNEdjAZv/jANvRoSI1vP4R5E48OTLjJnqTSCY8ml+81VYZSLkuRWTum?=
 =?us-ascii?Q?ZjO9shHEwZcsAS82zhZi3ffGhwnqs65AaAMgYxPul3PL2F+hm3cwbWPcd5Hx?=
 =?us-ascii?Q?IdAG5fZLcLlZEmawOVcO94mL5NN72etXE+af/WeRTHG6wHM82De6Fl81rhKs?=
 =?us-ascii?Q?I2lsQlQRJfOYmDYy8LITpTLHDNZKX7F8BLtHMOOyqI4PnjbSXa0sdIq+ERtN?=
 =?us-ascii?Q?qkCqqqrqTDDeBZMqLmtqTHdO4GJk39iofcVPU98YM733+Kasnshf2etAb6nj?=
 =?us-ascii?Q?QQNYBs8oACM6J65dHfzduQ8V9IOkaFlYfFWaUXpxzp3zh8PMkxid5raCj0TH?=
 =?us-ascii?Q?7KFzvp1wAT2nO7DEdPB98NEqUIWykIe3/sLTuCEp+tH+sXaA74B8R9l0ADqa?=
 =?us-ascii?Q?YPtHWiIpyMXgy28Il+l00KOuZvN+nnOmStJPPsUr8sipbN+BfA9AdyJL7PO4?=
 =?us-ascii?Q?T/A0FThLeULi6Pl8nUXFY+8dNrN+D9B83ddWWJIaWBNgBg1wIvQDYTZxOMZH?=
 =?us-ascii?Q?+dNUFfcahZEOIxUO+Z7i9nsAwQgsLqzzH9xU/PyL5Y35pztgxA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QRR4bWGEWtw26RCJAwGU4rHxbDasUwLOkOG75mIjwDTUITEHfxgy9H8unMlw?=
 =?us-ascii?Q?i3qukeBU6DfgxpZMlCyIGP0LjWW35tnG6PjI1wOhv2pyJHix+6W6brKqk50e?=
 =?us-ascii?Q?iV4NGbL5JT3ht0xaTZ1SJhgH3qs4lyIwadnko9lT1RTW1Bu+OQBder9hhUNT?=
 =?us-ascii?Q?b2M19VAMoQs1TAutuOWqsbrgYgvyFpYw7yE8AzwTYTdkDnmlVVLJXCL9DfYh?=
 =?us-ascii?Q?3+P8zYeERp9WuRcnuOtMlY8Ygw7ZBEj8reus9g75mGcJbPJCDO4UKaNsQadY?=
 =?us-ascii?Q?jh8CYV0MSjJqAPThnTICVow9H5elSvUSpWO6hUldI9GlwoV9uVefWO1Bzv30?=
 =?us-ascii?Q?h6y8eCUffAJ7rS4/sKCSkd+9l978KbsyV+RZgSZGf8JGWJFMRoJzffRsD32K?=
 =?us-ascii?Q?mZIoOn/m2NkbR8gNiCjH6CjMQ29Dodl0ybOdeVP0GdZGD69DlsS3HzWjiaJZ?=
 =?us-ascii?Q?zdeABFJHYBUP4NLzi34Q2tlT46f+F3cyKq1CRzJRpEC8rP3p17GS4uWi/mfB?=
 =?us-ascii?Q?bU+9m21UR5/zSbYWJrf6K/lZRMWuRMrwJ+Pu5sYQCnWaq4e680/xrDKiBj66?=
 =?us-ascii?Q?EYp/KxN2caqlPDBb4SPkYutdNi8e1cpX95Y6INwys3x9NuSzz5cL3gNhVnMO?=
 =?us-ascii?Q?aRN7wf2aim1oGB3UaaTz7U2uZztrJTslPqFzJT67P6TO2IxBmarLdw94evQC?=
 =?us-ascii?Q?LT+BPoJNHz8TpRcvE9t9Z/ngz9Robu3FZXcdGBOxfNvhhCcp1zHASq96l+7z?=
 =?us-ascii?Q?U947ZPHZ6H3X4e4CHK/ofcWU/sOKAFlE2DCg3IBpfjp2YiOdNls3OyRRb//W?=
 =?us-ascii?Q?z7WtGVWA7zgP0LTg4J8AyY8UcgQojfLEFqNbiTLgaHIaQt8QMlv04MN2yqCB?=
 =?us-ascii?Q?cIkKIhxJDTjYjN3bkT09huIS+Y1OFDNSGC3c+0AVszHu7Vm+6IL8W6x0fnSt?=
 =?us-ascii?Q?xSPIc/cQ8rd06g0fwWX4fyJJaPa7srtvGdshByZRFmFwbs7QZ1G409zPMJIV?=
 =?us-ascii?Q?lM7bnglrmSrjhlDAKzVWNIx6a9VotiAde5SLJ6dkkqGCVhRevmESHTVKrrkV?=
 =?us-ascii?Q?93FvwqiJqckmd/pAeQRgcJQJJ6/hU3nA88SpifhzAvRkIzGktz4QA1LMXueS?=
 =?us-ascii?Q?9Tm/zqIF1cAGbkO7D1zIjaONvCFiFlg82d6fZ5HjAgbc0/DWS4LixV7Urnmz?=
 =?us-ascii?Q?+pGSzQKUEtaAcIbKoy/o6Xjt2QPVwg0jAGPc9H+SCQrya3/5V3CvXguq1g8/?=
 =?us-ascii?Q?0JFUNq4AP63X7LHeeYn187E3MCHPNhSFuL40da/W44Wc8ZGpFAVWNoGlfdSz?=
 =?us-ascii?Q?99QBvNLb1FAmwOzBz2VUEwPdSzBw+lb2WaOWBEy+GnmpIS6VBPagXGGPkYjv?=
 =?us-ascii?Q?1hFjgUKLfYpnqdOJdcKiuPaFkbSOr9Edj70XASdOJVvVdtIodKDg+R7VlbHu?=
 =?us-ascii?Q?n+AyVkFtNfBRK8j4FOjh6RXJbhQRW2aP6cIbhMYTNaNjZN0CGp0QHvbsMG1A?=
 =?us-ascii?Q?lnw+e0nKz5stCRypHDk5h6tC9Z0/0q4ym+VVAoRINrqRwJDSkt2FJI+gya/e?=
 =?us-ascii?Q?XP/rTedfSeZxyVLmGiEDXNJ68cifvuWbJ8kepJCA?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1b4fe7e-9c33-4f18-8b0b-08dd19b17b54
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 07:00:22.7695 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZCqIbp9+eMLK3TnrDyKoZpBBM98OGQ47LCJssDSrDxoZLp8Kgho8nV5aYPdbCYN3EOJpYGGpJakMuj5tl9/cg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB5797
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: 1. Use the same buffer in the same call cycle of
 f2fs_defragment; 
 2. Pass se and offset as arguments to the migrate_block;
 Signed-off-by: LongPing
 Wei <weilongping@oppo.com> --- v2: avoid memory leak in v1 --- fsck/defrag.c
 | 28 ++++++++++++++ 1 file changed, 14 insertions(+), 14 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.48 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.48 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.48 listed in wl.mailspike.net]
X-Headers-End: 1tLGhy-0005xI-UJ
Subject: [f2fs-dev] [PATCH v2] f2fs-tools: avoid meaningless repetition in
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

1. Use the same buffer in the same call cycle of f2fs_defragment;
2. Pass se and offset as arguments to the migrate_block;

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
v2: avoid memory leak in v1
---
 fsck/defrag.c | 28 ++++++++++++++--------------
 1 file changed, 14 insertions(+), 14 deletions(-)

diff --git a/fsck/defrag.c b/fsck/defrag.c
index 9889b70..791f435 100644
--- a/fsck/defrag.c
+++ b/fsck/defrag.c
@@ -9,28 +9,21 @@
  */
 #include "fsck.h"
 
-static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
+static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to,
+			 void *raw, struct seg_entry *se, u64 offset)
 {
-	void *raw = calloc(F2FS_BLKSIZE, 1);
-	struct seg_entry *se;
 	struct f2fs_summary sum;
-	u64 offset;
 	int ret, type;
 
-	ASSERT(raw != NULL);
-
 	/* read from */
 	ret = dev_read_block(raw, from);
 	ASSERT(ret >= 0);
 
-	/* get segment type */
-	se = get_seg_entry(sbi, GET_SEGNO(sbi, from));
 	/* write to */
 	ret = dev_write_block(raw, to, f2fs_io_type_to_rw_hint(se->type));
 	ASSERT(ret >= 0);
 
 	/* update sit bitmap & valid_blocks && se->type */
-	offset = OFFSET_IN_SEG(sbi, from);
 	type = se->type;
 	se->valid_blocks--;
 	f2fs_clear_bit(offset, (char *)se->cur_valid_map);
@@ -57,7 +50,6 @@ static int migrate_block(struct f2fs_sb_info *sbi, u64 from, u64 to)
 	DBG(1, "Migrate %s block %"PRIx64" -> %"PRIx64"\n",
 					IS_DATASEG(type) ? "data" : "node",
 					from, to);
-	free(raw);
 	return 0;
 }
 
@@ -65,6 +57,10 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 {
 	struct seg_entry *se;
 	u64 idx, offset;
+	void *raw = calloc(F2FS_BLKSIZE, 1);
+	int ret = 0;
+
+	ASSERT(raw != NULL);
 
 	/* flush NAT/SIT journal entries */
 	flush_journal_entries(sbi);
@@ -80,12 +76,14 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 
 		if (find_next_free_block(sbi, &target, left, se->type, false)) {
 			MSG(0, "Not enough space to migrate blocks");
-			return -1;
+			ret = -1;
+			goto out_err;
 		}
 
-		if (migrate_block(sbi, idx, target)) {
+		if (migrate_block(sbi, idx, target, raw, se, offset)) {
 			ASSERT_MSG("Found inconsistency: please run FSCK");
-			return -1;
+			ret = -1;
+			goto out_err;
 		}
 	}
 
@@ -99,5 +97,7 @@ int f2fs_defragment(struct f2fs_sb_info *sbi, u64 from, u64 len, u64 to, int lef
 
 	write_checkpoint(sbi);
 
-	return 0;
+out_err:
+	free(raw);
+	return ret;
 }
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
