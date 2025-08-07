Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8F4BB1D3A2
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 09:44:59 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FNYOBhFPopl/zVVjPy8iUXho5YNAOc+5A0Q5krYqvio=; b=BoJYUjguImc3GcW28EdJdbL5CH
	N+dzjU3qLPb1NXGvrxcMi17XC1CbLLoXxHjwpSSupdKY4VbSp/VvLhJ3NwnJUeXyvZbP6elWUBJJV
	UHli7QL9y+uGbdDY85wcfUksN5X9uMHyUzYW4NhgqpJ2rrUGokfuMZ8gErMZv6bW4gSc=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujvIv-0004yI-4d;
	Thu, 07 Aug 2025 07:44:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ujvIr-0004yA-SN
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 07:44:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9zNosMjRJgs1JBlZrjtDGHdmEJ9Tufo7d/Qbz8EccmE=; b=dVwnrBJ+l/rOZN5Q49m3ttD4+J
 ClpKrizaFsCl7hekuh46RViR8xVoRrMnmVfK8tcM//Qbucxo1Uh3TqKbliEyNynMa968MuiF49ktg
 eZjHN3s/MN28qwWEzpocJAkB1QAZU5iPIg4B+eBvozmAj3ws89H/8lFdsKhQdP39URJc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9zNosMjRJgs1JBlZrjtDGHdmEJ9Tufo7d/Qbz8EccmE=; b=SDhw/SaZYrpvof8P/xgL41jzAP
 /9eLAt3NaIrWcqAZ+AUmgI/PaTdk5K8tuk9Gvd+8J0ogRGWELsxHlweRKRqsHKSmU4OCX1mp4sFwP
 shNAodc4hW/spHBr5ItLAP9spn7NHwWJx56zaoS764IH4slcS7kA1b2i0D7VNG22FCRg=;
Received: from mail-japaneastazon11012009.outbound.protection.outlook.com
 ([52.101.126.9] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujvIr-000342-0t for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 07:44:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=l5yGhOXENZ1bujcJs1kAJMwbdGp/VfZju81kpQJ5uuyIyvRLN0ZGCAPvXeXQnN6d2eptpheImYbJd60BYutOZGNUOZQOvO6PKPAj7C4HT+N21M3MovxUybvVXKliLdnEyQIiCt6uI6riEdPJ3hfm7SFrsP8J/Su+PNMkX4Uxn1PCdpM8BziBBAo03obmxRVIJhCd2Py20NYR4da7dPTa1UbIoIDXRxJw8Wz32+zw5CkiP5HwKcr4BVN5M0vsE2IHO0kDfJX7VGAjmrsfRofEOuNnUQmBguwWm2PM55V/AHwHt4pwkrhSFSkre8LZOPVv9uYKYNHNGGSILkDzxFGh+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9zNosMjRJgs1JBlZrjtDGHdmEJ9Tufo7d/Qbz8EccmE=;
 b=RxBNZyeStSsdveH9bPEZElYHzON1MMZ92f8E9hqM4LogkR6+psRAWACkxL+zTOR/KyLBUqWMTQoD5cAa7pVKRLpkqtfg/ng/kHJZGuayIMlTXgRCWDzi1mY6x7Lf6ARSuxGRzFw9ceQTvbcj3CUYFiKUdaBKXmFwURENob3Bvl/4pA3bE4kDfHKPwgKiLZSFUw6qQAAOuWiC117Lc/hwF7goVGqrBfHDQVmnTs5N1QSwXbNdhNAZiOFmpnz5uEa/upZGNLJJGuQXC8XcVN0A49g0rULqMEk1bZJtU2SIAWlgmo94fd4OR9oP/iB2okmeRfxBp9/Hm0wNdl4wPPSKuQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9zNosMjRJgs1JBlZrjtDGHdmEJ9Tufo7d/Qbz8EccmE=;
 b=XGB1bkfFfb+C65j/IYs7GpWjeYqeAqjEvhdn3+BIpwdpaONrX6vai+HHI5OVLbfTzvPvw167UUYZAW2MaCqZ2Q37zQ7FzyQLouw3GjiI/h7Ji6FG1b4BTjVlTDfklbC6Gj+Fym17QLMeYzLh05Ek4X3grINZ6E6ZTv1149/cOc47o7TUbGtb6cyoL1uaWXQCIaWbp4y/oRE/qYMzMuGH1c0l4u9FiNu3yN5Z9fBv6E3tqeaw405t7ZOptCi4LRXPHaChfjkQd7IhTkmxBSzYHz5DbHcKeY1EME7DIuy5kPYOuWzm6RYqMfjIVC7dyGAU6L6oUY/R8MqOQoWVOkcvDQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SE1PPFF973AF9A5.apcprd06.prod.outlook.com (2603:1096:108:1::431)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 07:44:34 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 07:44:34 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  7 Aug 2025 15:44:15 +0800
Message-Id: <20250807074415.387181-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805132208.486601-1-liaoyuanhong@vivo.com>
References: <20250805132208.486601-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TYAPR01CA0151.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::19) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SE1PPFF973AF9A5:EE_
X-MS-Office365-Filtering-Correlation-Id: 567ecef4-da3b-4414-1ed1-08ddd586409e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rcrCz1O95+4wFEG12IMadUpMCG6gpT7kelYRZZTMWcEQVCe5N+LfTYRiLCQA?=
 =?us-ascii?Q?JCrlauE/J8qEm+Fa+Nhrl2SohygnJ62qTDzS2ntrOe0loWfK0j7cCBI1pBwp?=
 =?us-ascii?Q?sb+POSeEbBtnpWWpXlDpKywRO5iCFCnCPfe4gajJcPFFuv8yskbuUwPoqvIc?=
 =?us-ascii?Q?NhpVumooQxlC3Qud5BC1HbaioiJCRqRsQMKhVmZzWF2MDBY0k/TOqipEH0tW?=
 =?us-ascii?Q?jdk7q/sN+M+3WzLfMZUxUgzJ+7JFvN8zo/PqYTql+cSUPGsMExjo572EiW6V?=
 =?us-ascii?Q?ma75T7fhbVcUfvGTJeL56p+k58Ao6kthi2TWXlWIFukidoxpmqCM2Kdmxkbh?=
 =?us-ascii?Q?tJiGC45YeYP42+CZ7QGQdKKW1zfPki1yvn/CVsVF4O9l5rGlewOlXQVzt6gF?=
 =?us-ascii?Q?9Auksg6z+K+2fnOp0r3ozypTwVknDGYqas6DtJCmR05kDw65MgHR6yHPbKf/?=
 =?us-ascii?Q?8V2lM516nayJRYjgJgBoQJ/1wXIW6d1JiO4QsTLms2T6O7pQmcRsP1SBehas?=
 =?us-ascii?Q?SFeBJdeFIWDBW1fWhYv3pw3G2myGHDyfO/8YHUkwCMdog2H1TAP441oez0Gt?=
 =?us-ascii?Q?Q1jkAodU7fWAJMkcK6YyBV2HH2a8TSUVtxCOekLWoKZmBODRLjD85wFkrQSn?=
 =?us-ascii?Q?BnN8vEmGqUI1fRI3ym2hKDYOaINO3KqTZzqkZqQNRgx5Tkd0QPG2kR1kzVs9?=
 =?us-ascii?Q?IZkVBY++rNoA4lmPK9g1aEEd0Rzv/Vbx2muVeJCp7xcEXYe2zb7xpNVT+DCy?=
 =?us-ascii?Q?7SCKFRQFeH32PGiBTJyzruF8zvprzN7qwZjqI4Cs5J1bC3wyUSR+ATfaATAx?=
 =?us-ascii?Q?pDBU/7YPzZMzTLUSciUlwxy6XDl/1jSXMj8mmDOUl/Sl5NljHTrQBUsIHYud?=
 =?us-ascii?Q?pw0qwpFlNysjFs9AE4xI4DnCjE4n2Fj0j9vekyIf8b7WYPtLhqW+R5FtAJA1?=
 =?us-ascii?Q?tDLVsfZkXoA97oHXbV8XJo3nYeLErhsWoCR/TMtp0AJvYql7v7V1ZVywHkh+?=
 =?us-ascii?Q?sUz4NUbZ07BVQAXU0VFP7kZLVR4/ClMhnQ9uGfppJJldQkn5U/lM0cN2uSO1?=
 =?us-ascii?Q?EBUnsB8wekl2kvang7e37yMLq/KPFOqF8a+nS/193FBZvIpmsAz4c2bFOcie?=
 =?us-ascii?Q?/tANxeRmquH8M+8cq2LrGEFdwZH9nhn2OBT1z/IrcVu+T5EdvKc4lgtoRnSO?=
 =?us-ascii?Q?ZaRUrv7fUaAoluxO0xI/bIYljgf/lXrAx6aBPHANnvuNxK6QRom6bXir4ALK?=
 =?us-ascii?Q?Z8zMxXMPSFp2Xh9Ioi4wFxigQhMGDMhafHP8XtF/UaYXyLAHUKA8WMrn+INf?=
 =?us-ascii?Q?DIMPpmza+jTLTaBli+jCCE+GFEltIh9m81AOj+oqqpi5YealzphsobSlre0A?=
 =?us-ascii?Q?dn0i3F/W4IJY9DsXYOR5HySeutASfhRB8o3u2KfrYeFvAXXhTO5n0mY2SkWd?=
 =?us-ascii?Q?KhRRgMEJobXWXIV33EZz8fNhuk6/lwpd3NV8wQcx0pfn9rfhcoWImA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?E1ndwLoOf0hqEYwFASJzvb55xb90Yp7sCQGAu7cZV0GGcOw7jz2G1MVVJNqc?=
 =?us-ascii?Q?aSVuSu/e4J4bXuRnz0vn9S0vBR8USooLXu1n3YwIcpNra/cY7niM3b1ufOcg?=
 =?us-ascii?Q?nTwuqDCrvtdsGskmdom/YRct0AVnab6Eqj32ShUhqeBmRu/lme5wLID75H7D?=
 =?us-ascii?Q?vZ3poHmZMalYME44EAvPqqTzschSaU/J5imSK/gdgRCUgTmFIscJp3J4k0WR?=
 =?us-ascii?Q?lMvfxrPQq859PMnLgXDa/9e9He/BXJUp8NCk1BRUqxwxOpLQSdK6mGTrWs5E?=
 =?us-ascii?Q?RYsCvRgE60U3oiRWtcVA7VW148jUtob9AeBM4Q+QegXQ0x4CrXc5WeWEzKnL?=
 =?us-ascii?Q?3ltwZCz80eYIgCpUCQUmNfqqDs+vEweOppe935ugPvU0k8B2DeUgZ7HLHnXS?=
 =?us-ascii?Q?HuSCw4OTc0iw+kB15OCDqt/Pu1roiVmXwINQh+4inXQM0zLOI6QRJDBiV1go?=
 =?us-ascii?Q?XroaBu5v0uMPZmK8Ri6OBw2ybQSbmdwjcv61pCkCwTI/w4UCK9GC5gRwNMEK?=
 =?us-ascii?Q?gofgij20fbagUn0SMjUXp4AHtbjFqjAvbfXxMQLsJmgbOWgZoSodpxnt/gjY?=
 =?us-ascii?Q?kNRRxGpayj6yGAaAjDSSokX7wRc8VrGhMG4vLIp/jN94CQIwzNL8x2TOKAA7?=
 =?us-ascii?Q?7ZXalQ8uuM8EJ8HYiKvKnShH4I+0DSP4873mnEcf5feXwTfBcuNNSm9cTTO3?=
 =?us-ascii?Q?puH5I84GVp/LM6tgqagp+rSJR/AVDrcdPuya1arh5csBwEhDnCQFqIp2Ac6U?=
 =?us-ascii?Q?0rZU8lrWSMyY3qTvCqNNYsFUPyNQvxyLK7sqwkPWQzBuAB1sT4DBFdq4Lgxn?=
 =?us-ascii?Q?M/g0x9j/blwQWZToB9+99XhuT8l1yHPEEfm658FVe5e0ZmLll4eyxIFXM4Sd?=
 =?us-ascii?Q?53voP2Brl0WHHoStwNOOB4AVJ9E2xj/+o0L6Tie5vAlRBiIQTkW2Dtn5ekuW?=
 =?us-ascii?Q?8NoN7oBjo61mClyuOBajsSW6oStyFgspdeMEzwwtBq2Ds7Tul1mv1pPJiRlZ?=
 =?us-ascii?Q?lnv1eP/HLeDl9JpeBLp5wYz9SaHyPsY81ZzF3wKGJb0X7a5xXrFqpa3BQZF9?=
 =?us-ascii?Q?fWUc56ys4UNwGOMwwLlP09sBpbtdE2zs7/aizjopLBgs4cvweqhwUJFjCkEU?=
 =?us-ascii?Q?ho2BpxDCG5qYZ6R61X8W2bAE3dSd21qo6q30FgmKn+TAmwc8TGDcouYmjBhr?=
 =?us-ascii?Q?VL/sj/kODcr0RDj/+Vp6JINO1CDPdU5YJZxjBTiBw1RA0BM7HvzhQyjy+RbF?=
 =?us-ascii?Q?qoHtjfGsC4UbCCQVwgfu97BQFDdQNObtQO+ta71SBkj0KKFih5RfVEBGXdxr?=
 =?us-ascii?Q?gAF8+ucLx+qyglAkrtCvYBkmtV+lqItWN4YGhwY3pROuFmAzd2AAehthHnfG?=
 =?us-ascii?Q?Gmd762CygrenCTfwzzlgex4dQEcCUEzjOJMBPxpc0qFZiIifPj9eyqjE9Tc8?=
 =?us-ascii?Q?KItyQIo2xkz667c+VXOcilYrWc+AXCokzFMiZfokAGQfEClPTKPsKGojqHz/?=
 =?us-ascii?Q?gE9dlm5KcqoMl3LyROR6acuphCd+0UJ9Iluyk23ppePI2ZKXpYOmOhSP2Yur?=
 =?us-ascii?Q?5TkR13yHm6S0cJn9b3aU1uAwR95zRN3b/ianNogK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 567ecef4-da3b-4414-1ed1-08ddd586409e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 07:44:34.5224 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/opkVUIbT1FGZBV6AyPxTSa7K2TcdbgY6SOzsNKfSjj2RexKjKboW+a3euukvQMKF0tyK5X5PmetGo1wcO0PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE1PPFF973AF9A5
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 we have encountered some issues while testing ZUFS.
 In situations near the storage limit (e.g., 50GB remaining),
 and after simulating
 fragmentation by repeatedly writing and deleting data, [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.9 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1ujvIr-000342-0t
Subject: [f2fs-dev] [PATCH v3] f2fs: Add bggc_block_io to adjust the
 priority of BG_GC when issuing IO
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
Cc: linux-kernel@vger.kernel.org, Liao Yuanhong <liaoyuanhong@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we have encountered some issues while testing ZUFS. In
situations near the storage limit (e.g., 50GB remaining), and after
simulating fragmentation by repeatedly writing and deleting data, we found
that application installation and startup tests conducted after idling for
a few minutes take significantly longer several times that of traditional
UFS. Tracing the operations revealed that the majority of I/Os were issued
by background GC, which blocks normal I/O operations.

Under normal circumstances, ZUFS indeed requires more background GC and
employs a more aggressive GC strategy. However, I aim to find a way to
minimize the impact on regular I/O operations under these near-limit
conditions. To address this, I have introduced a bggc_block_io feature,
which controls the prioritization of background GC in the presence of I/Os.
This switch can be adjusted at the framework level to implement different
strategies. If set to ALL_IO_PRIOR, all background GC operations will be
skipped during active I/O issuance. The default option remains consistent
with the current strategy, ensuring no change in behavior.
---
Changes in v3:
	Modified the issue where it does not work after closing
	CONFIG_BLK_DEV_ZONED.

Changes in v2:
	Non ZUFS can also be adjusted through this option.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/f2fs.h                          | 18 +++++++++++-------
 fs/f2fs/super.c                         |  2 ++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..12fda11d4da5 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,16 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/bggc_block_io
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Used to adjust the BG_GC priority when issuing IO, with a default value
+		of 1.
+
+		==================  =============================================
+		value				description
+		bggc_block_io = 0   Prioritize background GC
+		bggc_block_io = 1   Stop background GC only when issuing read I/O
+		bggc_block_io = 2   Stop background GC when issuing I/O
+		==================  =============================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..fe41b733fbc2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
 	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
 };
 
+enum bggc_block_io_policy {
+	BGGC_PRIOR,
+	READ_IO_PRIOR,
+	ALL_IO_PRIOR,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1804,6 +1810,7 @@ struct f2fs_sb_info {
 	spinlock_t dev_lock;			/* protect dirty_device */
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
+	unsigned int bggc_block_io;		/* For adjust the BG_GC priority when issuing IO */
 
 	/* For write statistics */
 	u64 sectors_written_start;
@@ -2998,13 +3005,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 
-	if (zoned_gc) {
-		if (is_inflight_read_io(sbi))
-			return false;
-	} else {
-		if (is_inflight_io(sbi, type))
-			return false;
-	}
+	if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
+		return false;
+	if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
+		return false;
 
 	if (sbi->gc_mode == GC_URGENT_MID)
 		return true;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c2..a21cecc5424e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4629,9 +4629,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
+	sbi->bggc_block_io = ALL_IO_PRIOR;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
+	sbi->bggc_block_io = READ_IO_PRIOR;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..381f29ae90fc 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -866,6 +866,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "bggc_block_io")) {
+		if (t < BGGC_PRIOR || t > ALL_IO_PRIOR)
+			return -EINVAL;
+		sbi->bggc_block_io = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1175,6 +1182,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
+F2FS_SBI_GENERAL_RW_ATTR(bggc_block_io);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1303,6 +1311,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_idle_interval),
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
+	ATTR_LIST(bggc_block_io),
 #ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
