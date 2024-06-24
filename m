Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15AFC914F49
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 15:56:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkAx-00026d-D6;
	Mon, 24 Jun 2024 13:56:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkAw-00026M-2D
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9GkPvUNVsdFXB93WA+bb+Fjm+hmAqDXEKGA+foASdLQ=; b=XeEH/v3k+42pLZdjSXRZGZhQas
 ABtaivk5LYpVrNKtb9X5CsGFIFRBcaV4iXDLm0y1nLUAadJNdmxqPbCUKx2xQzbSmIOaqFiSK0NyE
 gLbJ6CJj8rhEHVsMTpOs740mn4gUjmq+Kf5nigbaxQmhJYqGTb4gjbuQxXYBaXGw7bFY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9GkPvUNVsdFXB93WA+bb+Fjm+hmAqDXEKGA+foASdLQ=; b=Z
 EZU6aVt+Yp+OI6tI1SxqUEBdGtWLJX4J/4i/1jrxMMiMnraKmDveQ0tLRB2LEjAhEr7vvYquMWiXO
 Qo4s/M/yx505GYGndIt8/ERs2frkVMGTjzCsx3FYrA5FYNmwthHmrfYr7ZuiE3ts6wG3Xin0UJhVD
 pkFw8qi7BmBqB+G4=;
Received: from mail-sgaapc01on2083.outbound.protection.outlook.com
 ([40.107.215.83] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkAt-00018a-1S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=VT+vDwD/+r1gJV3nqWKDu+kI7ZeL3QA6UpGj7+MHsWrNbSFMwpNPHQdpXINTYl1ulx/vBtXQTLxZkdmW1nIYFdejqCOmoXceslTSY07alSPa6iaJQ5yMGuzZYyJouXSVQhiGzGcd4QtxXUQDS99/7C8Ci2MwvU1COq8fx/jPHi3lUdkXV7gNiYOtjdSu72t58FxDwcy+M+zUqHniKqE5m7bipsEv3WmNqz7D/WUNZ+qAD8y0LLOAUf6VZbIsto8+1Mf5fCawh8uQQZG4W2BY++rPoK6NHdHSYfkoKdCnL18pHrOqHGkYDHfjnWghIh9u5r/EJkY/9IEhVBoSxPa3LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9GkPvUNVsdFXB93WA+bb+Fjm+hmAqDXEKGA+foASdLQ=;
 b=m7tXp/uJjA30QyV4kmZ0o9zAksEwc5DIcpNCi5ELcKhTgdqT0ST414WAF2dZfiQEXkxNtQxfesk76Rxlcd5F1D1s0bIaIaARBDAa6jjUVckzRbseMQgrZFc68Kz08R5OIiSgBk0uA9ClPg117uVIhmvK0fs+Kle4P79e6W2juw3yhO4iEy6BtdGlpk0Bi+y//EmTVkzqTZrSdIiuwD268V6cwFvGYr70FTFB21DdGLH842QOC7rbRtLseQbbwJTqioAf9LFExB2uiKoaGDJ09Xg+S+GvSJTPW/ZmgtRzBCcThjgCXQjBEGZygrVQXzH8OJAgSzIpySPAfZ1Q5acHKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9GkPvUNVsdFXB93WA+bb+Fjm+hmAqDXEKGA+foASdLQ=;
 b=LDDmUSUaanAR/qVvq30l6acRF2XGpvrdf9OZBZt2mwqtQ7xSWxUaJPtupZZcem4c2YS4vEIi9E4jWYVwp/FDApi+xwkWFSG2N9UjNlsg5VuAKe5S+BYdqnCi3bliZZEI/SGbtbc/gSbWDKFu3MsetG7ZPl5vJf2D3rBA/PUc+pI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7438.apcprd02.prod.outlook.com (2603:1096:101:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:55:53 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:55:53 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:23 +0800
Message-Id: <20240624135532.3330136-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 36957d1f-77ec-46f5-a034-08dc94555ce5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|376011|1800799021|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?H1t+FFtyOfPpKP7uS2iwCGTfclw80jh4tOJo5STRhql6KvxwaadlHNjNx9ve?=
 =?us-ascii?Q?Qxmn4W4gGsQmcKbgGZFDkNie+GS2X92SxloApTaUtlLG4hx4SzI1x2QQ2BjE?=
 =?us-ascii?Q?+zcUvOJBvHtAn+tyOZf3BXVscxoRjpiWNZbbEfrWJBEGozpS97Z38L0yn/cH?=
 =?us-ascii?Q?tFnTasq5fgCS/jygXlkooRERR2tLnuOLQrGhvTEKE/oh02M1IzZoC7y8I8zW?=
 =?us-ascii?Q?YlIQmB9+ftTJbT8yMMeqoPo9xV1mRrRzDOlnn2mm5euZ4mKwnJUOj9eHMQeF?=
 =?us-ascii?Q?MIwo2yvjT3keooxtN1IyEk+tzPlncCM5Z0xgjv60OtekeXidyZH83bCL8B0C?=
 =?us-ascii?Q?fT1Z311mvHIthV+q+/C4eaCyPQnhxwCFeGNj5yh9wuFSg5+9ovdORxgkmT/T?=
 =?us-ascii?Q?BTTAQFosCAyz3oTmAhQ8PRPZBt05pv3LhtF09cs35o0djtBFWMRuz6kEyy19?=
 =?us-ascii?Q?nitRRwu5FydhP0Ac3jVkl9BMBpCJYNEq+uPhsbz3IQQHh/QnSETtbqPnr/Be?=
 =?us-ascii?Q?pJZK/ySBYZuQiMIFG35Ki58Sf3tcgiWbfQ/QdmR7FP8HFPI74eNEPlkaZAgU?=
 =?us-ascii?Q?aLybMZcFk/FJ71fqPV8423pkJ5TqqVayufbcHA7IB8K0IJs0boia9sGsp+H4?=
 =?us-ascii?Q?S32w2G5HS1XBtLz/0fnZ+m0/UAv3gwebh4ep2PTKw0qrwLrCKq2tv6CdpfCs?=
 =?us-ascii?Q?kv4gsijq5mH4rWNKVGo94Ad46MxoTO+LAkABF1bDNaVLBr2p3yxS5HgAyQhT?=
 =?us-ascii?Q?il2CSle1CrxPjR31DH2wG6jckuhxi3+2hG/8s88Ihf/HDTRKo5NA0z5w0eky?=
 =?us-ascii?Q?K++WRUr2pU7MYXSDhPonbFk6ZA+RiQ1j+JT4UIf6nlmDCqMDYD57ADjer+PK?=
 =?us-ascii?Q?LfDvrk+ZjPib9Ld9UZA4ATB84VqvqXdSdjNAgD8CozJlavxhlFEFSSYcp1Cn?=
 =?us-ascii?Q?9DXugGR8O9cleXlcynsF5WLmvgSs7wH/Ly4VuIOmq4pYRaJOz7gxQM2pSawd?=
 =?us-ascii?Q?gknuQ+lhM7E79AKKS9JXl9r2IoNokZSfpoMXQE8kYCkHthSl2fPsCoD2vAd0?=
 =?us-ascii?Q?VJ4zhkV8X9FstF7qbh/wO4fp4CU/9ZWx68LJQl3BU9oWjy41gIgovfw45/2X?=
 =?us-ascii?Q?STsZWMc1CbqwOX6T0u6HVgfH4gDpEtySJ4zL4/EQQROFV4NgNZHhxuY6VOOO?=
 =?us-ascii?Q?/4vLXl1gkioTnhnXn1xuETqTxWknMaUGtTJawXSyRRQ4uUO8DLysw3i9slzX?=
 =?us-ascii?Q?XkSEz8zuxeoiBvJsbPSxgnhjXlbVH7t87/8pxjlensdstYUXG97s2xTBrM/y?=
 =?us-ascii?Q?m1IQXpndqJzicWu9dKLouiNxum6UbE6IFRdGWNHD/hEx/zXvxUKGbqvuy9Gf?=
 =?us-ascii?Q?UNEqmWA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rhmmfmuU52TzwXWNV+pxzsNgx9iscdzamtS+Lkj5z7caRMq4xGTSpG2IEhT9?=
 =?us-ascii?Q?AbTm3NUwOcDFpsEi0MgQJAcXBs8THSlG/gUKS2cFYFTGmz3aNudc1+T0XEmf?=
 =?us-ascii?Q?H9Bi2Otf4pIzN35WpwOe086VCcY8DVMyJWNvVMPyCQ4DESx4XN5kmnOpEerX?=
 =?us-ascii?Q?zN7KDCms/xMbq7wVCPbeqSr0VtnOy+gtOR1Hmd1lB+8Mc6VQEXB6RHYNZ995?=
 =?us-ascii?Q?daqDs3afq/64fNSMIA/+EEIpvDFEKtTGjfB0lFQMFUCTvvTNkeIM1FptOVfn?=
 =?us-ascii?Q?cibJis0PWiHg5DeNtw/xIJayzzS08OQPch1x8Ny0ocYxCrJPPusvmuooETnJ?=
 =?us-ascii?Q?h3nLt0HvA3SEGBs+OkAWClm4jUT3FuVRwNjMo6u1OWhZKN2ePNG6G8GIS4m8?=
 =?us-ascii?Q?nfB5FRGJCpifLWYPoLgfhTIBWPvjQMA/SmaRG+t+W3Jaf7pxQOLt8NwgrODi?=
 =?us-ascii?Q?9/DR/Z1dkU+x8wq2vNJ/yIqYUIBkhl3hLTv+RSPMrH5ESSmncGrXwStmESEc?=
 =?us-ascii?Q?pY91o2ytlyovICr6HJsgwvvymCZqDzULm82eTRWMCTgvHN9HaDE5Va4wyonn?=
 =?us-ascii?Q?+WsL/Rf/iLLWC5yN68eU9fh+wVpFQuBWaQiB4YmZn7othR9faIrP40MNLq7p?=
 =?us-ascii?Q?jTKJGX8cMxhDZJ0h8HN25KimmiuMbihXYMSNAvd4JewXxCPd5FYX8cQqPar/?=
 =?us-ascii?Q?clPXDF0nVW7CN6yj4MY1OBKvLRleN/Hhk35LuAFEA+QK8UtEppHVonRVmb9C?=
 =?us-ascii?Q?LosnHZ0Isk7951sDLTCXwYb6J3tMs+2B48sgXx6xJfKoay+mPolNDKhpn7P/?=
 =?us-ascii?Q?MY4VW6KMqsJ2FU12r+EyQj8X7W2FPAIQW59zS/WZ0OH9+pPwVpmL/x1Sn0Y8?=
 =?us-ascii?Q?7w2j3VIRPJkhnMwIrZ5USkNKgFU7igfvGWQTsTxhjk1gISCXmwdohradfckd?=
 =?us-ascii?Q?0j1fPxN/PgnxQLBrwUJzFP5KNCachmkG1bsVsE1InpxWrYAxrU21JOj22kWn?=
 =?us-ascii?Q?KcN5aS2NMvU51YLJaNW9EmeWJ7DIREYB4NUVZqhrsqv9xmthXvxUs5nHIWzY?=
 =?us-ascii?Q?gJTXfZlKY39idYGJzNey//4frsS/AC89xjQMbxjK7G5q7nbSSEslJF4YBTxH?=
 =?us-ascii?Q?jUYeFN505EAMdvvC5nK/tER5g/29eDGQUYQphtbFLrxX6DLNpEmpoNObVDHL?=
 =?us-ascii?Q?Sy3m892p31/si1lhByNP18mS98rX4PoqGNpmgvaVsG3a5zGgHgb0tR3yRikI?=
 =?us-ascii?Q?LBpJpHOo97Y6aAxEPpZldfL3AMOhaUz1dbrUf8jIgiuXtd3WZwlFQk9jgb+C?=
 =?us-ascii?Q?8EuuVKSpGnX0CpqOK/iEn7qgwmrtnD0CO6IkFpIz6bpo965NjYFx2Tt5F/bH?=
 =?us-ascii?Q?SU9Z1hLU5n6jlfD/AL3KOa8GsfnfvmHX/5eCVHGYKMEtkwaNrNswEfIJhVqK?=
 =?us-ascii?Q?OHG9x6bxaBtf9YodYPpne9TbFBOiMIoRso9WHFKf6Zy6BofsKcm5mFfO6zBv?=
 =?us-ascii?Q?zqbm39lDfLSKxjFl5uYNSOrtG3PXg+BCv/pyRizuFhenYXLH/rhWSuJZR/Pw?=
 =?us-ascii?Q?Y8QsB0W4JuNFY0Xqyd2afE2goxwDMhvFqz2HacBd?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36957d1f-77ec-46f5-a034-08dc94555ce5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:55:53.3412 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KjHGcopfG5gjPpYjP+C8kdDnOKcQPyyqRALrOy/URYfmCqjW/yIl6Y3pCG1HaaDsZlTnpl5EOTpDgclll9v6Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7438
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patchset introduces a new tool inject.f2fs to modify
 metadata or data (directory entry) of f2fs image offline flexibly. With
 inject.f2fs, 
 it is easier to generate a corrupted f2fs image, which can help verify fsck
 or reproduce userspace behaviors of some a fault. If option `--dry-run' is
 used, nothing really gets chang [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.83 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.83 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.83 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.83 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkAt-00018a-1S
Subject: [f2fs-dev] [RFC PATCH 00/10] f2fs-tools: introduce inject.f2fs
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

This patchset introduces a new tool inject.f2fs to modify metadata or
data (directory entry) of f2fs image offline flexibly.

With inject.f2fs, it is easier to generate a corrupted f2fs image, which
can help verify fsck or reproduce userspace behaviors of some a fault.
If option `--dry-run' is used, nothing really gets changed, and that
could be used to get the value of a specified field.

inject.f2fs allows injecting some members in sb, cp, nat, sit, ssa, node
and dentry for now. For example,

Inject sb's magic
=================
inject.f2fs --sb 0 --mb magic --val 0x12345 $DEV

Info: inject sb auto
Info: inject member magic
Info: inject value 74565 : 0x12345
[...]
Info: inject magic of sb 1: 0xf2f52010 -> 0x12345
[update_superblock: 890] Info: Done to update superblock

Inject cp's cur_data_segno
==========================
inject.f2fs --cp 0 --mb cur_data_segno --idx 1 --val 0x12345 $DEV

Info: inject cp pack auto
Info: inject member cur_data_segno
Info: inject slot index 1
Info: inject value 74565 : 0x12345
[...]
Info: inject cur_data_segno[1] of cp 1: 0x4 -> 0x12345
Info: write_checkpoint() cur_cp:2

Inject nat's ino
================
inject.f2fs --nat 0 --mb ino --nid $INO --val 0x12345 $DEV

Info: inject nat pack auto
Info: inject nid 4 : 0x4
Info: inject member ino
Info: inject value 74565 : 0x12345
[...]
Info: inject nat entry ino of nid 4 in pack 1: 4 -> 74565

Inject ssa's nid
================
inject.f2fs --ssa --blk $BLK --mb nid --val 0x12345 $DEV

Info: inject ssa
Info: inject blkaddr 7511 : 0x1d57
Info: inject member nid
Info: inject value 74565 : 0x12345
[...]
Info: auto idx = 343
Info: inject summary entry nid of block 0x1d57: 0x4 -> 0x12345

Inject inode's i_addr
=====================
inject.f2fs --node --nid $INO --mb i_addr --idx 100 --val 0x12345 $DEV

Info: inject node
Info: inject nid 4 : 0x4
Info: inject member i_addr
Info: inject slot index 100
Info: inject value 74565 : 0x12345
[...]
Info: inject inode i_addr[100] of nid 4: 0x20864 -> 0x12345

Inject inode's dentry hash
==========================
inject.f2fs --dent --nid $INO --mb d_hash --val 0x12345 $DEV

Info: inject dentry
Info: inject nid 4 : 0x4
Info: inject member d_hash
Info: inject value 74565 : 0x12345
[..]
Info: inject dentry d_hash of nid 4: 0xc77b804e -> 0x12345

Sheng Yong (10):
  f2fs-tools: export is_digits
  inject.f2fs: introduce inject.f2fs
  inject.f2fs: add sb injection
  inject.f2fs: add cp injection
  inject.f2fs: add nat injection
  inject.f2fs: add sit injection
  inject.f2fs: add ssa injection
  inject.f2fs: add node injection
  inject.f2fs: add dentry injection
  man: add inject.f2fs man page

 fsck/Makefile.am  |    5 +-
 fsck/fsck.h       |    5 +
 fsck/inject.c     | 1049 +++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h     |   41 ++
 fsck/main.c       |   38 +-
 fsck/mount.c      |    6 +
 include/f2fs_fs.h |    2 +
 man/Makefile.am   |    2 +-
 man/inject.f2fs.8 |  225 ++++++++++
 9 files changed, 1369 insertions(+), 4 deletions(-)
 create mode 100644 fsck/inject.c
 create mode 100644 fsck/inject.h
 create mode 100644 man/inject.f2fs.8

-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
