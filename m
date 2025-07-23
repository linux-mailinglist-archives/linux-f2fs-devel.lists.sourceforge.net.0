Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 18227B0EDA5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Jul 2025 10:51:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3cc2z4NCYLgi9LnfIMXVSKuOopOOkvXODsDTQ5nrfKw=; b=OijCeijgdAVUnrYnEwKfToSV6S
	eXdU2FhFWS4G3KQAZ4fJkNje1M5dBZgPxzcDlEL030w2kg1l6Yu62YstLBhPXezhrpaxVv/vr6urM
	F3gX6vrEHJzTIg6b3YhxD/FBEQzLLNWSdvI70SMKX6DP4TZNMNZ8E6CL5yMKcoNoocUk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ueVBa-000389-Kq;
	Wed, 23 Jul 2025 08:50:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ueVBY-000381-Ms
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 08:50:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PBFzimSwK4Ypxh0dM59JbV0gbypShiXC0zPpSM+F0CQ=; b=TmOsNc2yG33IbZu++TWHgVCy0l
 hoB+1NyuJxKdZtr0kFIKSSyhB3/8WfiGgpKWjmtkJL740r+gv/KptgKa+PvgIuh4G8mCWTZtZrwxm
 M7zPQmWz87BTYdpv1v+67R7yi0azIoKp3xbGkdopwrAmiOl78AaJuddrOeG+x+49nE+4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=PBFzimSwK4Ypxh0dM59JbV0gbypShiXC0zPpSM+F0CQ=; b=A
 TlWK8zn9phL+QbT+tBsa2ZWeQhtBWyHLXWX47lMzTF4cF22l5IAjlG1GwM44pNyUcONk+xLCcGScW
 jMe2tfYOYZbz5NQZ6oUgIc806TEni9u2uypMTfdcF5sftF4mmjPfNohdgzGhJNp9bn/6rv2halZoF
 tbIKi8l8Raaq0E9U=;
Received: from mail-japanwestazon11012046.outbound.protection.outlook.com
 ([40.107.75.46] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ueVBY-0002DX-1C for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Jul 2025 08:50:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GdaRrnDOvavyGoyoFMrP38cjVsd9YiBYX9PK21kRnkNQY42kROK+cPI1g8NvRsJua9perfwQsaaHWI/pVvq1eTsKOg8MOOY5lz9KVm0rad9kFQE7Quo/XccmKV+fA6vBRvrDL90pneyTXrgnYYVJ52DskTKx5sZiCvgFkCD6eUjDYh+yHrHYHjU/iaZqNq8z7StD4zf65rZ4cUP7EGeNhp58IcjCV+vfNLUnrPPtWVCyAvefRADTq3cqRJjpo97ttwnS6bQRkViuv7AyfD+mK0xQv42oa0kXKqKaL7kCPp90AOo69XPZDpwYv6iASRCYm12Yx1FeJTpp5TWIMaf3rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PBFzimSwK4Ypxh0dM59JbV0gbypShiXC0zPpSM+F0CQ=;
 b=mrIYhnNA9DbiuTTGwXEQjiNk/Eu02LDZCwN61kZaEBjSsIpI1WfSo5kFjhkTmfLAwY2KME7P0jYrBx6ewRa+fb/heh2na0ha2un3KWYpu7yc6YvuEP3NXqdRoewWQpijTXuGcfysOtqwUb/tkX3BPu6PXgRxzZ96iQprvK3hSIN3q9x4tv7z1SQUceYBu+C2WufYvk2PoP+9ySOe36/hBz/HSRh+cnpmxL9V/Jiqc+XmBn6wiV/3ARo/XZB52DadKsUhJyq9jmfUxFvhDNUO0IUIMFloOIvMHE2C2jRFjJH9ucbElYbi4e9tPNwmmaYv/QAAD74Bt4H1LKhkCDgiTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PBFzimSwK4Ypxh0dM59JbV0gbypShiXC0zPpSM+F0CQ=;
 b=LbDE4GCzUVzBAwvTayBhf4e2+XABeW07OIMmVLo1UV7Kb2q7vL8j/bxAB4siucOx/VwUvvBX15WOlYvIKG7X62zdLgaU6Scr+vRc6eEEc0pPrv0C80V6IgsEKqNWW9C9jvJrN6s2FYIUQcnkX+ogkX/MvfsbeLTTrXB2pIrXrfLuP9d4FgoWjYmuqsVWYowOfuYBDqizG6pn1go1gzxnei8WxYOUxjW9l7Obp/LPWaRBiajzqJG8DA/P4OLS3zV7J3w75jSHVsK+Q/XJG9ZSQHYggdEhFEvKIvVuw6EulOYN8eNa9u+Gvwl1FUva30JXgSp173AO4xpVOBpSYC4lhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB6081.apcprd06.prod.outlook.com (2603:1096:101:d6::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8943.30; Wed, 23 Jul
 2025 08:50:35 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8943.029; Wed, 23 Jul 2025
 08:50:35 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 23 Jul 2025 16:49:55 +0800
Message-Id: <20250723084955.547901-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2PR02CA0016.apcprd02.prod.outlook.com
 (2603:1096:4:194::9) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB6081:EE_
X-MS-Office365-Filtering-Correlation-Id: 11031677-cba6-49ae-12ad-08ddc9c5fd79
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?uRqA9GwOhBfobJoGiMZ8t3asILlh4m7swa8QLqqoCdWnWyCIjfzGYcSQ249G?=
 =?us-ascii?Q?J5tvdvCPSgwoTW0R4yY4xANlNaaSMfiAPd8ct6QUwfrhjc7SlELEC4mZ23Sy?=
 =?us-ascii?Q?8bpM2DnEbk6H+1YpJkv3qObCeoN1HVKujqWH63IYkSdVJiDYBbrBx3wQyri5?=
 =?us-ascii?Q?Rd+5foOO2+Lq10a6RtfyjTlleWcrinW1k3H68aX+JUSppf40/jS7n9oQoXTP?=
 =?us-ascii?Q?XsMpCrKjT/+dclsPpmtZUsxqJsYw4hpgAkrDP92+S8TyPTs7wFrci2A4mKMK?=
 =?us-ascii?Q?cDeRa0et9RVBSwq0NolclokPyVor0o/cpKlUgomUt8mw62x4jlN5arvtUEDg?=
 =?us-ascii?Q?sfvDCJh2V98bKaMQNGZbvJAsNOu8gi2jJZjJz0J/av5EY4QlKhCyKcgHCnJa?=
 =?us-ascii?Q?QF9dQzxYCyXGMlsHXZJf08Gauq31IG3qKbkzj+nj97s2hR7hCO8+NmDPzbrl?=
 =?us-ascii?Q?Td3OsDRniRWsSYMlCl1P9o/fVG5I06SQB1upokGoUk8joGDlkt67y1zskCwy?=
 =?us-ascii?Q?ItsYS8FVeD3IarTyfOiTG1FmLgzhAPzxWcGmsxSOKVrlM2ZJqoQMQfuP3MJY?=
 =?us-ascii?Q?ccBhuIX4mTyGRZ6BY8d28HNMogvabrHPjRc/9OMZXc6fcQGjnmT6x1dAC0MG?=
 =?us-ascii?Q?HeSfUzJwd8WoMgLKwe2YtZYUCd5QWu/KGAxpAjAuGS20etP9ntBHx8IgDLuP?=
 =?us-ascii?Q?y1K5Xq4+kQRCD0vdnIzTXnjnMt7T9yX1oPHbv1zr3FoRTzGNJ8VhWHpMbgI1?=
 =?us-ascii?Q?uQMlVlDLFz1BmmDCsZHc/TT/EcyP0JBzaeBJMklhXseQnTA9WhWT4/4APAhr?=
 =?us-ascii?Q?fPeOv8wO3Er7eEG0+oUxZ5wCg5eSciooHA0QmCQd/bJ/XaAArkfVVeWxaJjh?=
 =?us-ascii?Q?rvL3PANecwulhnHi+9d7EgOK9xmyIV7bpuaPTlRUupDN+ScSLe+pzXi8oqNT?=
 =?us-ascii?Q?tRtNiRMG9vh4xh/T2dYMBH/Kk9JWMwRJjHHtXqX0PATsWJ/+B25z342YA82D?=
 =?us-ascii?Q?ELMAQ7SkG/RXU/0ft23C5mzOUamr4GAvgNsfZYqxmDYqAgPtF7w9Imz17VFi?=
 =?us-ascii?Q?L+cAuJIJyxIwUk9xpcVBJDJRiWSyPtmUB2GsWFPrLrt6yF2WvJHBPxVIqfNQ?=
 =?us-ascii?Q?JWM19cTpa39LV55/K4Kw2AxWdlxukPuPEvRlcr55jpTbkDIyv7pc2rjTBOTD?=
 =?us-ascii?Q?bH61nXNkrWwXRd0XUw7+zmA+AgKQqj1Okx/K7pd4fnO9W4Bv5/ZbcR1i88nj?=
 =?us-ascii?Q?adq+wsA82bF+HMOmZQ4GVvkX1CGSqcMsEKJscuSXmjWA+zoU9+sN8BXwLRN+?=
 =?us-ascii?Q?RHGHe25iwbP72wwRfCnX6OHFqmvDQtA2uHcbq6u1TwibsQXDTh2Aq/0TwkeS?=
 =?us-ascii?Q?h+XPhFbrKhPTs2QT3o7wCbT6qCaCk6RCDLAAbB/EoBpTJAJ88Yf2W2r477vV?=
 =?us-ascii?Q?MQ8n4nfgpai2UqsV53fVWcbFrHeuSdHDCI7kNWEQRE92b6aev2Qjdg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iEm7VcpoAVxSrX2rwWwhal+4j1Zv/HFUUo904HzwX28rqitE9WeBHunhAB4r?=
 =?us-ascii?Q?KoDu/bRmva/yQLx3G8C9Kf/Iso83BlBpptpt9/wKLLhxKWtrtiqsr9voC5C3?=
 =?us-ascii?Q?TphgQyLVQZCjXI9rH0KqJZ9yMY5/h0nI9Y5/BIGh75wo9Vm3vR9yEkYq/qzU?=
 =?us-ascii?Q?aGBLMSJzQQCZ2pfTvEZBV89qAwyEDiVR76EK+RtvQERBOWIur01UOoJlSUJI?=
 =?us-ascii?Q?xBkWpsSn0MHBqvqzaDv81YD4RGqSaP7VekimbuAyimJqKxHMc7+wlYirIpQk?=
 =?us-ascii?Q?hmFer7OmCN1xmOOzU6gomMkk43+Bp5oWVaKwya8gNA/UH8oxfR6qJhS6xck5?=
 =?us-ascii?Q?uVaTpUFIVG4X50E8l6m2N5SUtnpkWxFnIx2dVYNUv1F8hLnk/ngTQwDXrKUT?=
 =?us-ascii?Q?c7qpi316hjvbcIrOGZmVLZBsyffzZeYuRF/dsqu65uD6Mm6RUh6c6Pmgquuq?=
 =?us-ascii?Q?U0QtxeH4KjsFgIa0yCGn8K6j2WKROKnU5PE6ORT2jdtE4ssHHrFG6VZlm+YT?=
 =?us-ascii?Q?kNH5aXmxtiXkivsgAVsMvfeYqlp+Yi3hYSxREOsaSxgO7p+roBYeh2jwq4vR?=
 =?us-ascii?Q?hfrHeHGWOJMbFbuiQw5DhcLDGC5EPnMQS2dNnHBm2Y9+5ACA00q83MjbuuE+?=
 =?us-ascii?Q?lfp7f0dKhmd22Dn6CBRNB+geHo7C544VFuyKNOSOArJNGBvU3UQoFjSu8ikt?=
 =?us-ascii?Q?aPQb6S/JmnylrcFKSNJXyzN2Mpk3ipGVA4xdz8dADVi7Uz3WGVprYckAbZpA?=
 =?us-ascii?Q?buaZ08C11yl8laSdbHNJbfbEnLYvzWGcfXRn6y6xmukbOxQLi2/2zuq8RRYY?=
 =?us-ascii?Q?+mSn49jtnt5znrJRSSp0TkL09uJu17w0xesZT1Tbz+dQ99GoMCGXLY+3zAeB?=
 =?us-ascii?Q?/8z1KmeNXRjNswRSZYCTYhIo+tJoAyFqQJLowjaygmwtwlkYWXD8sv6U5SBU?=
 =?us-ascii?Q?Y8Ggg0eRWvACzQZ890WlA180ddQSNeKjm7X/0M1hyOzxqepLFLGa+qlTIgDJ?=
 =?us-ascii?Q?BfbLFxuogUFqFOSwCw7HM5MmRaBSkL+pC4QWm3Kg53twHEnDFTJoIXHr1d/s?=
 =?us-ascii?Q?ZNgR0c5HZBH/U0970JGGjA1zUx5Tsu5QUxZOjv6gKF6O1PyU6Dsh6FSa1lpN?=
 =?us-ascii?Q?ly0CLd24Mond5hKlSSqLSsPKUOr2lL3RzLxn+6HGpSzscWLJ9RK3Nj+itO6R?=
 =?us-ascii?Q?fJO+XNUDziCh+f+rYPRZbT4DEkU/LEM/oRF/RbBT044a7E6WY+uGMbQgLtcJ?=
 =?us-ascii?Q?F9AcDyO2FArNVXaJDGm28nGH8QhuGk1KX1hqKrYyeRXQaoOsf156rT/yirYX?=
 =?us-ascii?Q?XSAI6mVOrIHSSQdHOUPJ6HmbUxmcftq2YgwAtODUpikSle0Fcd5h6JqlPopZ?=
 =?us-ascii?Q?XvtMs4TkG/qo0KdSjLcNTfzmcFfJDGiIBvkqGAV9Pq814QFfM39SyTynrgiZ?=
 =?us-ascii?Q?sGiIzBcYUmmfAItFfJmh53qZO+hHmBM5c5EPUw824DOSdsVcHQxL3kepJH0K?=
 =?us-ascii?Q?bRXEPqLthl5mmBHLa3SXhZtZIXES7sB33IdELUB0BsYeJrqHyEJcklfRXhPc?=
 =?us-ascii?Q?KkM8ioNnyG8mtSatyAjiZ0/txcw1oSi8JKupdSjJ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11031677-cba6-49ae-12ad-08ddc9c5fd79
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jul 2025 08:50:35.6792 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NG5SXf1AmLzvgfsFHQbcJbXLr24DvLsG/XyMx3FecryMVz781k+OC8j0GMr39Q6ZPVc3Ut0KzaQJ2ANEdsNn4w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6081
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During the development process, we encounter the following
 two issues: 1.In a multi-device scenario, it's likely that two devices exhibit
 inconsistent performance, causing fluctuations in performance and making
 usage and testing inconvenient. Under normal circumstances, [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.46 listed in wl.mailspike.net]
X-Headers-End: 1ueVBY-0002DX-1C
Subject: [f2fs-dev] [PATCH] f2fs:Add adjustable write endpoints for multiple
 devices
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

During the development process, we encounter the following two issues:

1.In a multi-device scenario, it's likely that two devices exhibit
inconsistent performance, causing fluctuations in performance and making
usage and testing inconvenient. Under normal circumstances, we hope to
prioritize the use of the device with better performance and consider the
device with poorer performance when space is insufficient. Using reuse
mode can solve some of the issues, but tests reveal that the fragmentation
degree in reuse mode is significantly higher than in default mode, which
poses performance risks.

2.We need to examine the differences in data placement for different sizes
of storage devices under specific write patterns. Currently, this
comparison can only be made by switching storage devices.

To address the above issues, I am considering adding a last_secno node. By
adjusting this node, we can change the end of the addressing in
get_new_segment so that it readdresses from 0 once the set value is
reached. The default value of the node is the maximum number of sections
for the current storage device, so making no modifications will not affect
the current logic. If the space before the set value is already filled with
valid data, it will normally write into the free area after the set value.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 8 ++++++++
 fs/f2fs/f2fs.h                          | 1 +
 fs/f2fs/segment.c                       | 4 ++--
 fs/f2fs/super.c                         | 1 +
 fs/f2fs/sysfs.c                         | 9 +++++++++
 5 files changed, 21 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c2a233f2a085..e5ad8dc70cb6 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -870,3 +870,11 @@ Description:	This threshold is used to control triggering garbage collection whi
 		reserved section before preallocating on pinned file.
 		By default, the value is ovp_sections, especially, for zoned ufs, the
 		value is 1.
+
+What:		/sys/fs/f2fs/<disk>/last_secno
+Date:		July 2025
+Contact:	"Yuanhong Liao" <liaoyuanhong@vivo.com>
+Description:	This node is used to adjust the addressing end of f2fs when writing.
+		The default value is the maximum number of sections in the storage. If the
+		frontend space is full after adjusting the address, it will still address to
+		the back of the address until reaching the end of the memory.
\ No newline at end of file
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6dcd7e6f47c..7d93d8671033 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1802,6 +1802,7 @@ struct f2fs_sb_info {
 	spinlock_t dev_lock;			/* protect dirty_device */
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
+	unsigned int last_secno;		/* for adjust the end of target device */
 
 	/* For write statistics */
 	u64 sectors_written_start;
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cc82d42ef14c..192619bb2034 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2811,7 +2811,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
 
 #ifdef CONFIG_BLK_DEV_ZONED
-	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
+	if (secno >= sbi->last_secno && f2fs_sb_has_blkzoned(sbi)) {
 		/* Write only to sequential zones */
 		if (sbi->blkzone_alloc_policy == BLKZONE_ALLOC_ONLY_SEQ) {
 			hint = GET_SEC_FROM_SEG(sbi, sbi->first_seq_zone_segno);
@@ -2827,7 +2827,7 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	}
 #endif
 
-	if (secno >= MAIN_SECS(sbi)) {
+	if (secno >= sbi->last_secno) {
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
 		if (secno >= MAIN_SECS(sbi)) {
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 30c038413040..5b7de0734da7 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3859,6 +3859,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
 	secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	total_sections = le32_to_cpu(raw_super->section_count);
+	sbi->last_secno = total_sections;
 
 	/* blocks_per_seg should be 512, given the above check */
 	blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index bdef926b3377..a4ab5c38e883 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -649,6 +649,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "last_secno")) {
+		if (t < 0 || t > MAIN_SECS(sbi))
+			return -EINVAL;
+		sbi->last_secno = t;
+		return count;
+	}
+
 #ifdef CONFIG_F2FS_IOSTAT
 	if (!strcmp(a->attr.name, "iostat_enable")) {
 		sbi->iostat_enable = !!t;
@@ -1122,6 +1129,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
+F2FS_SBI_GENERAL_RW_ATTR(last_secno);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
@@ -1285,6 +1293,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_idle_interval),
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
+	ATTR_LIST(last_secno),
 #ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
