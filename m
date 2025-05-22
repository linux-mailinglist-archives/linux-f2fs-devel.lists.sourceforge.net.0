Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C5B92AC06AC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 22 May 2025 10:10:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=txqLy03dEtg6s+M5ZZzrmtiu8WF3Xt48bAElQ3Hsono=; b=is8tQV50jf5imoRHl0rz9pzzJJ
	h9OKb4P0fODnq1vEStwKGAEWmg8Vs0tjEqE/Mxpow2TZ1G+jYhmFPzSA+mDsNZCoQdJMMQI7co2gv
	sZYKKpnNtqKDiMHME3ACUPZAoBFl3s1Lm3dvOTNuefAIIGem/eFATI3gRALHVyroF+a0=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uI10P-00054c-PV;
	Thu, 22 May 2025 08:10:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1uI10I-00054Q-SF
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 08:10:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=dfte2lmkGqEmxgrxcyjhPV4ggKH+Xmwf2NiXr8Dd+FA=; b=THM45gRJawMHyd6vQwYgNtVYzE
 S+Ydp4s44Wrdm18jr8y01Oa5NokQP2FXZP591OKVeH4CwmHd8jhz81hfqOJqxzzohUd+CwMMIZgJA
 o2QbbMfo/fh5cAAH0qNEkhPqElJ6unYtUVgndJO2SR8ju37yqEGbDWI9IGdW/gNOPqkY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=dfte2lmkGqEmxgrxcyjhPV4ggKH+Xmwf2NiXr8Dd+FA=; b=F
 s16jltZ+M8huvgwlVD1BfxV70Uu2G0tPlE66x1n6Tj6Pdqv87bSnvDXB04eaQHn9NzoRgUdPbu/sw
 8wMP5hYomBZsSEvMHflOUPcviZvYCoculedMAl9KcBJ8dQ+e12NNdQzqBhGtAWlKhW4NBydLwCWBM
 MrBa4QKDZUslYVVY=;
Received: from mail-japanwestazon11012015.outbound.protection.outlook.com
 ([40.107.75.15] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uI10H-0004wU-O3 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 22 May 2025 08:10:14 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUHf5uPYZsZsISmCA2q/5YVRATU29GQTwlgBvRWgF2GiWPhd706i8I2bV20nQ7DZwWFsFayqDo0JPRnIqPSCeswiXkVpN241gJRX7+vTjin32JA7q5mOqMcm7UvR8Tm8WZ1ZAvXV5ga3QldJsdi8SF/jlYnDqFCesKZKrjPXOtJnmGUXKt2qZkPW5hNiFxKwG/KupAarBKjSUiklzawCHtFZl9ZB2a43pGKSWgTbnoCK5Gru6AJqXHZgf+iToBGNIZ3NpQnHcjhiAdZwTaF5xgcK+UAUAdnGniF7iqKVsjgXdTxFaDJ3SCo7a6IzDNTu0Cat2R+0uGtnJnzVuNPE0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=dfte2lmkGqEmxgrxcyjhPV4ggKH+Xmwf2NiXr8Dd+FA=;
 b=Yo+qgXJSm96CDp+YN89OhSc5k0SLABeS8vOWoW6EpXZegxM5AYpsnNGrA7Pes+6XGI7QRZZif15vafZoKXr1VKqx32Y+sqJ5M5YFwPP8KbGMmgthX+7wsCVaKwIzAUDkLWw9zR8ai9EsZTrLlwFS1aQm96/PPdooA+b5GpzeOQw8D2nmz7jHaRWglMO5ejdhVT6wplb5J3Gm4agwoNMkMFSZalRBXCLwLhpXv9m4J7Js8wI1TPCw+8dPzQ3pmGDEt1NeqP7tTInbXZ+dNwHEuDVZ1LC6HifwwEVGA8j7EgV/KgZt4wUnd1648dPNUWJvfzXMaf9y3bJgFjz8wYfJvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=dfte2lmkGqEmxgrxcyjhPV4ggKH+Xmwf2NiXr8Dd+FA=;
 b=qv4ZwR3+AtWw52K54NiYM5Y131VlbZ3IxmKeA7OQWaGHZigGqzsT+SoBlktonJNh6QkJ06vY4nrkQqSBix/b2KykF6QY6l+xrww1gbdxuiST5VSPLY07etEHMOVwjCCBaQ8jMRtB93ToGyCoEjRUh+AUpFTcMOMuTPuKbOd8WTttFp6p4ILKpynn5fr2uGEsgYn3W3wZL8JNm1Eg7Q4uluDM5ZHvPEN4/dcUemZEduxeJ1GaHKsDSmGkj8kyL1th0AlGfINZP4W/QahApsjjxsrx7i0oJxJnOqkBSnK/KquYyUbETnMMHsKNJfIj+RWwc18cDWCEpPoiOfq0SrKLXQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com (2603:1096:408::90e)
 by KL1PR0601MB5701.apcprd06.prod.outlook.com (2603:1096:820:9f::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8769.21; Thu, 22 May
 2025 07:36:49 +0000
Received: from TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::a0e8:c3a8:8f3f:825c]) by TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 ([fe80::a0e8:c3a8:8f3f:825c%5]) with mapi id 15.20.8722.031; Thu, 22 May 2025
 07:36:49 +0000
To: zlang@kernel.org,
	fstests@vger.kernel.org
Date: Thu, 22 May 2025 01:57:06 -0600
Message-Id: <20250522075706.1604641-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYAPR01CA0157.jpnprd01.prod.outlook.com
 (2603:1096:404:7e::25) To TY1PPF33E28B4E6.apcprd06.prod.outlook.com
 (2603:1096:408::90e)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY1PPF33E28B4E6:EE_|KL1PR0601MB5701:EE_
X-MS-Office365-Filtering-Correlation-Id: 4636e882-a048-4f4b-4a6b-08dd990369cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kROHjW7/eksZO2jusgF1VAMOXrVF/Pmw/tPaXKsEWjko6yFzWcCcxIdak5LN?=
 =?us-ascii?Q?y8/3oeVuswjCucKhyeXaRJvUN2t2cYMPl8VR4L+ek0FwUuPcAQpaPlPIpmws?=
 =?us-ascii?Q?Tcr2mo1IZsWSfpq1MmcQvTVy18hNr8MDbwN0tBU8lzHfnwR3znFsO3K9OeIt?=
 =?us-ascii?Q?bOVEehSQx1DZAYftyMwyJVMbuefu6BGI90fiYYmxfGDaqEJuG1Wdij2U1yro?=
 =?us-ascii?Q?+7xAlJjxj6f3x24UUfJQOk6BIDHFgrUTqNT1qabweRtZxuSGYNXc2EOJ59zn?=
 =?us-ascii?Q?JF2CCf+fsDk0uZIiQv0BHtnrKejAfPYc40hLQ+6GLwyJpL1lnLcCcLLitxeV?=
 =?us-ascii?Q?Bf1NyBs+ELynjkel3eDqHNoZWWpwuaW5cNzkTde8lf77o61owaSH3tz6jKXd?=
 =?us-ascii?Q?GJAK+6JfyPuOW05BKGHyvcS4LWXpSZ/Q64EZpj0RJ0m9IpvELw4kH1tzH26N?=
 =?us-ascii?Q?Xaq0To/Z0ju/FlgafupIQCm7KOrUawAcRjDnRKuShzwGvUKuumWxIVA4LnmA?=
 =?us-ascii?Q?HVPs+rSAjMCut+jz8EJM6TZb7GTAT/4ra7wKNzSSl8O04B0BIL4bsgh5YHpM?=
 =?us-ascii?Q?e1rWd+K761TdXhdTadBt2El4ev3z1R4pgOunSKu9h5pwpvwVQA3gU0VGaIHZ?=
 =?us-ascii?Q?nVq/jzjdKLGOXTYItqhEZvd69q57y1KCYl2Npwcwqyo8PkSNhg+RvTKVkaA5?=
 =?us-ascii?Q?mrBYjmP5BLaDvgAVxwIaX0Obb7ao+UYz3N7XEFrqBbT6VLCQoMP/Z7ZzQ9sR?=
 =?us-ascii?Q?KxIyIxaxduwCsom/3xHRzn1/kNQdqT1jQ1qr1/p5GZzgyRwU4bxKgATBPTfa?=
 =?us-ascii?Q?c5GSCEZzSiNLiJpg2eeQ3pj5UAcl0CtwNGebLamAjDPqdQTx7ENBVGHTnGQ7?=
 =?us-ascii?Q?1YvTOEHy//RNldAXHzAljmNSg7GTMaoWR1qeB661aE3V3tl7lo8PjbeZB/8C?=
 =?us-ascii?Q?xeTK8jQa8JBphIB/yC20DVwCjz/u48sjc1MfWfQL+M8srTIc7VwLPTeZHT2g?=
 =?us-ascii?Q?i7DjpD0/BXkIp+zWqtcRT1RMKbo4jwqFuhWCxCzmwUv4dLaadBcmlJeLech1?=
 =?us-ascii?Q?WtQHkTPXmCu1BLA9VKk8SCok9L9y7ad4yjpwWCfp1J+QBJ9rgJ6cFVu7fFUY?=
 =?us-ascii?Q?qUef137IQwTsyUQDWADQe13URZFsvx1J/SXyanK97uBkNWCR56A861cy8l8b?=
 =?us-ascii?Q?hRthc22llT15f6HZYltThcPPg6BbqoW/86Q4opRxuUPR1g9twdtrwzeOTH1p?=
 =?us-ascii?Q?UR4NZqHlEEP17dk8uc//+aEenGWUbbChGg08VzS4BO6vFbkFc66ygeioyeb8?=
 =?us-ascii?Q?wDXLo4H4ui/cjB6qTAR9eMAunmbrohztikMfcG90kGGUYChuInvPZQJnYpIE?=
 =?us-ascii?Q?JDRSgG1JInBn0t/qiiNPYmvvwjmB/u41qNjI6h0OXzJY05mWzXOrIwTKw8/z?=
 =?us-ascii?Q?KDUHdGCqa0u/ta9T40wjUHFilWF0meJMaDAL7wG2xnI8CvkdUEs6AQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY1PPF33E28B4E6.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?buARRX7FehXWhRZo2UbB4wBj0w3WZN0W2OQOD5PuVKJh+WsshFohvbL+COcm?=
 =?us-ascii?Q?CI0X6mXB1FHL2GSx2XV7SqxrbB78ueXs1hILsY1NbqPvLpK//jrslJNT5ovP?=
 =?us-ascii?Q?DiQoRhVTl3Ew4NDKMX1LkIdQlVwocIv1/mueh8Q0rKF6Zis1zDikT7h0lIaQ?=
 =?us-ascii?Q?0VePWapSiVP+kJO2zglCPmG2wOD9pwP69XEtMjFkwwCqerO6IUBAa+NppQ21?=
 =?us-ascii?Q?VKLH9GwcsDzBgUfDG+K1d+LfQywvsA9YifXvAN8oq/KnLcuseTiaMyxLiZwD?=
 =?us-ascii?Q?7Ikb3bQb1Y2WIBRRLzMqtr69V23IHMLsC6NXB4Bxs9+1NsbjIryf3CB4d7HA?=
 =?us-ascii?Q?hUVL950a96SeKBFgbnGtsJ5KUrNXNZruyPOLmFOzaiOHEgG0/RN3xKaFRpl7?=
 =?us-ascii?Q?C4XT/kF9TU2n0vinxrpht8JIeM7hMXVVeXDCbExIKlhGdtQab2hWVYHfa+B5?=
 =?us-ascii?Q?8iZnELirxerJMp6kq5lEinp/j1cIamWTwOFBnNjtFcurEObt02I/NcT3w/kk?=
 =?us-ascii?Q?t7EYJwDSlEA4GUyblREfcG0rG8bBYbWEMexpssQx52rYygXd2PKnIbbBAJ2N?=
 =?us-ascii?Q?CNhVJqWZxXuz2NPIFt0BoLJe60LJa03PKN20EN3hKZPALS9GtbDNpOjtDeN/?=
 =?us-ascii?Q?QOWvWKviQMcPiGBCSgcFgmVEytVoC7FmRgBW6k/InSzC2wYRQS/CmqfgRJG3?=
 =?us-ascii?Q?QzriC0aCd515HG9I2nz22jEQSk6TJ260Pg3QX79SJ4WbhjS7wJNoILWDy2jm?=
 =?us-ascii?Q?mHMj+a5zcEZwAeqhhNTLFLeXfmNeX3hEOhN34nUzIEIhjGxy6EfbiZ/dEd2y?=
 =?us-ascii?Q?VZ2FB8oAe9QrPnwfc16urLiNfQA5vuZwk3GCXux/4Zz0y+A9rpTrve1ogysg?=
 =?us-ascii?Q?QcqRkqXbmJ6mv9xxw9l9ymAKF3OD+X+Ar45LAG7HWZ4m+RhRYCC/G/jj7L6L?=
 =?us-ascii?Q?sWK8+JGVFw/uOpdaHvNLyh2ltwdfd76GQXA5aUslUAqnGv+BjnfCvDk6f/lG?=
 =?us-ascii?Q?R1n5/Upiq5/X53VyhzZP56BiqAM0LD33qTpWWrbugHg05s0KtSfT4E0YgTcP?=
 =?us-ascii?Q?Cbv81z6kAeASaQUff4585mCz60mJ0kMWk5lyItPE5vMYcRYWYrZCEGyw5pC+?=
 =?us-ascii?Q?xIGtL+180hsgiQky2inDn5chB10HpoftfeeD2NNoc3Dv+MtdiobUqbULzlrJ?=
 =?us-ascii?Q?i2BB5uNkhwTHj70jFcApo+lB5W/7seYdguaMf25Hv8OfdpWUBtY89o5xvWCz?=
 =?us-ascii?Q?xZB4XJ4WjtxlsVAE0Wu6nzRgz+mY5gvcybx9P71QR/jOqbsPZp3zdkDknmSf?=
 =?us-ascii?Q?r4X2zLQLA9jj5imzDVCAw3KfUFceY7ObsoGk23/G/P568psa0tTJ2oHAPPSk?=
 =?us-ascii?Q?jR8scYes33Ez8EM7SDLXjIEfnGNR55RM3sbyIoYCvM71uRum+YcIyasQhao6?=
 =?us-ascii?Q?OS7Y6x16unrcxy/7jh4+gyVFmzMoRc8pErcmSQ7DbMEg+swbi0Hu9OjIoBp1?=
 =?us-ascii?Q?CG+17U7fixPM/AGwGNEqmn8nebJHRsdtoJ9yPhTjyGggvkWrc+3nL7eflwvJ?=
 =?us-ascii?Q?2vHqTUVkL6RkOU0LCODN5r3WhTCmZuy+KK2I/jG5?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4636e882-a048-4f4b-4a6b-08dd990369cb
X-MS-Exchange-CrossTenant-AuthSource: TY1PPF33E28B4E6.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 May 2025 07:36:49.7609 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GNtus2eG/1c2uGj15OU1ad1uCb6lRS0+Mgl29HZYep1ThNWzjt1xnV/p7CTZrl7GLKIGYrmlX9z4FY1st3BXRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5701
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is a regression test case to verify whether the
 CP_TRIMMED_FLAG
 is properly set after performing the following steps: 1. mount the f2fs
 filesystem
 2. create a file, write data to it, then delete [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.75.15 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.75.15 listed in bl.score.senderscore.com]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.15 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.75.15 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1uI10H-0004wU-O3
Subject: [f2fs-dev] [PATCH v2] f2fs/014: test for missing 'trimmed' flag
 issue
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: jaegeuk@kernel.org, Chunhai Guo <guochunhai@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is a regression test case to verify whether the CP_TRIMMED_FLAG is
properly set after performing the following steps:
1. mount the f2fs filesystem
2. create a file, write data to it, then delete the file
3. unmount the filesystem
4. verify that the 'trimmed' flag is set in the checkpoint state

We should apply the commit ("f2fs: fix missing discard for active
segments") to resolve the issue where the 'trimmed' flag is missing.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v2:
  - Skip this test case if discard is not supported.
  - Renumber this test case from 012 to 014.
v1:
  https://lore.kernel.org/linux-f2fs-devel/20250521064952.1373690-1-guochunhai@vivo.com/
---
 tests/f2fs/014     | 41 +++++++++++++++++++++++++++++++++++++++++
 tests/f2fs/014.out |  2 ++
 2 files changed, 43 insertions(+)
 create mode 100755 tests/f2fs/014
 create mode 100644 tests/f2fs/014.out

diff --git a/tests/f2fs/014 b/tests/f2fs/014
new file mode 100755
index 000000000000..f72d53e65292
--- /dev/null
+++ b/tests/f2fs/014
@@ -0,0 +1,41 @@
+#! /bin/bash
+# SPDX-License-Identifier: GPL-2.0
+# Copyright (c) 2025 Guo Chunhai.  All Rights Reserved.
+#
+# FS QA Test No. f2fs/014
+#
+# This is a regression test case to verify whether the CP_TRIMMED_FLAG is
+# properly set after performing the following steps:
+# 1. mount the f2fs filesystem
+# 2. create a file, write data to it, then delete the file
+# 3. unmount the filesystem
+# 4. verify that the 'trimmed' flag is set in the checkpoint state
+# We should apply the commit ("f2fs: fix missing discard for active
+# segments") to resolve the issue where the 'trimmed' flag is missing.
+#
+. ./common/preamble
+_begin_fstest auto quick
+
+_fixed_by_kernel_commit 21263d035ff2 \
+	"f2fs: fix missing discard for active segments"
+
+_require_scratch
+_require_xfs_io_command "pwrite"
+_require_command "$DUMP_F2FS_PROG" dump.f2fs
+
+_scratch_mkfs >> $seqres.full
+_scratch_mount >> $seqres.full
+
+_require_batched_discard $SCRATCH_MNT
+
+foo=$SCRATCH_MNT/foo
+$XFS_IO_PROG -c "pwrite 0 1m" -c "fsync" -f $foo >> $seqres.full
+sync
+
+rm $foo
+_scratch_unmount >> $seqres.full 2>&1
+
+$DUMP_F2FS_PROG $SCRATCH_DEV | grep "checkpoint state" | grep -o trimmed
+
+status=0
+exit
diff --git a/tests/f2fs/014.out b/tests/f2fs/014.out
new file mode 100644
index 000000000000..cb0c9447d675
--- /dev/null
+++ b/tests/f2fs/014.out
@@ -0,0 +1,2 @@
+QA output created by 014
+trimmed
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
