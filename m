Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 581CCB2D620
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 20 Aug 2025 10:22:22 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Bq1Tw8fRnSXDylL046FJshQm+m4Ub25hEfYHZCW7AXo=; b=VLEgeQ5xM3wghSk5fxp49UbblD
	OwAMRNOyPokbsYjZEzEkV7k+g4iOzsDpdmkCZbjrc2rVVJ/8VlU6CI0PcraQQcdufkMkj1ZVit29T
	8IXUUq47iAjkyQsPeJfJy7Y0UjvjAs89ka7fqBhKEl1FVnQMVOJU0pI1p+vEuiwDDwiE=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uoe5F-0003t5-EK;
	Wed, 20 Aug 2025 08:22:13 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uoe5A-0003rc-Qa
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 08:22:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cpfUdXSIGI8pUTfZ9/F2e9aFyu6/vAMmN+j0/cjbsP0=; b=Km/xfxHGSzOT2FjQOgf7JsJdZA
 K46CH28GJjqGQPDZG95bxE9kaq2UTC/OdPUgLqwxHxPPAnDu00+Jbx/p+OKyOtpA24ZutxiQMDf6b
 VPFfxDIzpDmxxce3v73646SexYNG8Vs4N2HTtIzGLn8EJ1a54ssTeBs5DBe+2zWMMgTM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cpfUdXSIGI8pUTfZ9/F2e9aFyu6/vAMmN+j0/cjbsP0=; b=J
 ulw/tIIj9JcFGdZkwFjgMUOilFZDzPVSWejAVCTS8ZsFlzM3fu8q0fo1cYyjtvNlOLgm+Twok3dD4
 vhKf7J4U6A4uc1ZLGGVOidct/hJ7GyO+OnBpjMaVDS2ZURHTyI0jKQdecTuNgwrk20YwtZP+CG/Pf
 RPthUH8pwsnxcBhQ=;
Received: from mail-japanwestazon11012034.outbound.protection.outlook.com
 ([40.107.75.34] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uoe59-0001fi-UM for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 20 Aug 2025 08:22:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lQfIiu8eQXiusjP/ahfubHwywB7uB5yir1NmxTMuKBgbwLu27jYNc36OuYNTbFiSsRJSbcMJdHyiCk7nY+NTgk5HnA11WMNgCNlnps+pCL1N3ohcnq/Md1yqrGwOoFYdvx+3960vmlCn1KERIiBr8kd1LkgTo8KZqSGSA5JJQQCWMXorUCnhbj8E7WRdNbQpOgw28wJLgD1uKva5+MSjPhvKMVQu0O89dDPLl4M9jLryJUB+bjSenxmP3hrH5mYtv+WH7W9o/R09Qqfl5EerwfdbapVbwjtqxSPC5CsD+4x5DthlfyetVl6Yu8SwUvaJFUFyQPeqedR0/KakD55zsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cpfUdXSIGI8pUTfZ9/F2e9aFyu6/vAMmN+j0/cjbsP0=;
 b=G7aDC9hmQWgSBFSBhk7AOL55a53Sox5q2VGb6aBzKJyAXSURguNSJZ6VkAHjCE1P9jr5gHcWTKeJL7AFRWcg9NbHNhtOqw63KjBFeY+LYmg02tkGwaW4BZxVbFTE5Z2lChMlY+3MaNYxEV57d1DPuR/svGLfAETPJICfo37s8AAPIeA2t4SXHVaCkuBFTgS4bp1eOU2gjz+jQLlt0AGmm59lxFmlKGue7zNHW6+XpSbXeYQCa3Qi7EMsIpSwrkXdk/i1aEJDHbOgmrZu1HdOQ7ReF7auYkLLgTKNQ8Fg7d+GASMTxX9WHPSVtlF+ds2zgNn0ewss/LqEgVMyCtd7Zg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cpfUdXSIGI8pUTfZ9/F2e9aFyu6/vAMmN+j0/cjbsP0=;
 b=NJqXD+FHWMbEmbXGP/oZfFiITEhKK+som6QZ2XFyxV5IiVVahXyM17Ovg7P1S56Kas+7cRoeMNMJDs40DPvaxpMvCkKS4CaVUzXJURuSlL41lqQ48eyamQao/FEGI+QnIofUbia/VcMqnOB6eZeqa31s9AYPwrGDuhodAjhJFN91ycxgos4RojyIGrXr/52sdhom4/l2aWe4XQ8kwweokug7LZ7iCMhVs005t7sKBZdHQnfX88/9QQafDLBkD8zRG9WQlkF2C49W6+dIjFWD68BEowD+3WAGodsa9l3RmT5kQ5js0q2zO7LfMw4AaHxNiUaVkgVp9IeIPaVdPCcWjg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by SEYPR06MB5985.apcprd06.prod.outlook.com (2603:1096:101:de::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9052.13; Wed, 20 Aug
 2025 08:21:57 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%5]) with mapi id 15.20.9031.023; Wed, 20 Aug 2025
 08:21:57 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Wed, 20 Aug 2025 16:21:40 +0800
Message-Id: <20250820082142.388237-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0207.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:385::20) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|SEYPR06MB5985:EE_
X-MS-Office365-Filtering-Correlation-Id: 96f6e33c-060f-43aa-ada5-08dddfc2a07c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SyKDQEzbJvOhyusbkUwDNLCx/YN6872p8fU58Xohcga+32diMaR5H7xunVPq?=
 =?us-ascii?Q?ADQqTedOrsLLYvXy/etfLhALpWxuMUSKX3Z9Wb6g8FR5DiFm3fIHwhJ7QaKy?=
 =?us-ascii?Q?Db8smNsIUV4KrysIQHOXCZkpT/Y31e6/UX3eDAZ5dGPWohCUyYAOdqjb3mDT?=
 =?us-ascii?Q?e4rY0CF++Y4OJ5YIQcyqeliO3IRpBaAP/wjtoMX+cYJixcvaWKo7baNGT0Zo?=
 =?us-ascii?Q?o3+Gb/uiqqbn9JzxQGC13c+zZ0xrIX09U0vkWKSTcLaLkkGWCUqHCFRenqG0?=
 =?us-ascii?Q?ytGp2i5zVwec66XeIVmVoCGod5Rj835YX9NqRG7f7rqt7vhPv5plDbpLfv7q?=
 =?us-ascii?Q?CUVccP2zBKkQFxnAv7TWYpnbaGLprRGy9yspnxKFHPBdrXlp/0A6LtN3wYub?=
 =?us-ascii?Q?Iif5FkvXTKNvDFebJgeShRxGj8ij6GDGzhwAh3sY+gFSqucDDyklHE4Jq77w?=
 =?us-ascii?Q?yBSoE3IG/IWwVKqP7Cg7EsN3AX9tqrk82KJFNgvrmkh6rLuo59db7fhldAym?=
 =?us-ascii?Q?SC6aZIDT/uEjkZqfHfYAI5/Q7gObo+7+Z0k/cJZ+7o3xlweN1BVxxk2chS9A?=
 =?us-ascii?Q?v2UK/vr/g1cbglgMNeT4GsFHT6mI2T5+5PlFGih8vqO4p1+x9wxnSUmfKIXV?=
 =?us-ascii?Q?X7TUPqCouLqSnnv3lP1hN8dRAMKVAi7puaNIOuDSRPakTqk9uDbrizcKpzbV?=
 =?us-ascii?Q?H7Qd8BjXCAc55mn2e8HaqTJtCjmDPooCHJt7PsfPTQx48KYIo9QL2YDL6yen?=
 =?us-ascii?Q?jcrO6vcsY9bckCQ+fdhO3Fx+P9W2IQn/5bIZRcqBLgxgCwNie0STzqwYmCZt?=
 =?us-ascii?Q?NpWPW9Z5TrMxGcB2D3pp5b3782AbVa8oFnl0LJEzGNKp/SE4wMqYKn30rPUQ?=
 =?us-ascii?Q?F0ejbcyoGc9G3HrdSM+ew2H6naksAWQMRTKo3rAnn3YytPGCBfN3duCdbxVE?=
 =?us-ascii?Q?GKSOTr70Jy6tBHkaKdqcsqj/T+uE3mqhZ+OSMAjS0HLfwMZRGJ0Yaz1+gjbM?=
 =?us-ascii?Q?0x3PzL4aglxi/XiSOMYaWl1JNqhj3GbPaWeT9YRzgRugW/WvzbWISZOzqC3B?=
 =?us-ascii?Q?mTi/5P4ZVhkZ6EYLD1VsIGBArSFaNUVPHv0A2/JdKxRKeqkvTsjnPJOkIqDo?=
 =?us-ascii?Q?Jxh2idujuQBv2dDcsaOhLMIsD7dOC/NkZcP9RMXf88KwDzgoCSxD2eT8EkMC?=
 =?us-ascii?Q?BN8sFWtZA6LEeyEGz1Ctdjk0ce5YaJdnLkI6VtjUXAk7+hcSMdETFrozdcbg?=
 =?us-ascii?Q?9Mnu6D1kwJeE55UE9vi7PBrLSF0Jt6ClapL6xlZgHnWbs23nfC1P05D6bFqn?=
 =?us-ascii?Q?xi5fKvT5GdztqLYtCninIWHWPTIYFAvEUjNMSsfRxBgzXDvzrgdUG+TY29ST?=
 =?us-ascii?Q?21Jr6mjr4BN2QcKbgW+itfkby0dbjIR5sLO0K09vfBsK8TbsYD/4UsPT+G5B?=
 =?us-ascii?Q?TS30EupwVkV1jPIh8g7YaCBKXf+5UOF67yLdQpW0guloMHhIpv/ytQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JBYwnhBBMe1/lILijUt/VHnKrbJpmTHazxEwUAZUyghaaV1HAVkshl6WU3AG?=
 =?us-ascii?Q?X7siB+qngVTUiXhPmlTDwo69ZlchpN0PeaT6By6DNG66edQ1RyE291PYpc0h?=
 =?us-ascii?Q?Pnl+eXrU8cHCv7d+HS0Fj5VV/anj22GDMtMAWX9NwAtomQDpVd7lp8Pc45aj?=
 =?us-ascii?Q?DN6V4BDzTP9I3YNbHsT8cE5TKkSGXW1QPU43cN8u33AmRZoom/5ZZ/n5csfU?=
 =?us-ascii?Q?D+PC/TPi8Jo3aQPbB3/1dIdKfXMDyQHI/FVM+aXrM6vyCQK2mBwmWAJBrjL9?=
 =?us-ascii?Q?YSd2y6yYbHqu3gbmrbrfX66l+sts4ob6xeHhDn5ZwzSw25Rfnwnb3hlr8dJm?=
 =?us-ascii?Q?oC1qMtvbAn4QJZHFBUt8fSJuPwdtOoSudptZ4AyQMjRfIstQYSq5QExPBjum?=
 =?us-ascii?Q?ZacZShMe6mJ324E7uPAuoFDEjAAWZeFDQEDtRDJ1m+6IH5MC8xBoolEbYPXX?=
 =?us-ascii?Q?S4pnb5adoJrg7+ZQiOFVaEmO+VZkHyT8/de2b6TUTa4U0qegoK3K8YGyoqGu?=
 =?us-ascii?Q?xYLyAugykAsvFdcD4s2afaupASku54RPe8p9MBAqVLdP36wBGh4kcoyepkGL?=
 =?us-ascii?Q?dzDXdasGibhcOP48L6fqN/caS7/dUB9aOeprRrwZNb/LOe3NVuzNhk3e5jPB?=
 =?us-ascii?Q?ENbT3PxGAC2PUo2wowlW7ZzFUdJ2z9H7Ay1hGOOjBEzVP9mAdoB+1cAAaYF3?=
 =?us-ascii?Q?cd/dnuhShYcMccpUXalg6urdBRIa5ovR54kclowyiZXX/aOcNf2D19j3rRs6?=
 =?us-ascii?Q?ajmimRpdUcJySu9dn157j2MjGQJVtVQRH8IaCUJCZT+daDj/B++30kS9se6U?=
 =?us-ascii?Q?Ajif+X9k6pUaUpke1zl8LQbswShTAN3dMAoxxS2xE7SxR/2x/rrg9gcWmptn?=
 =?us-ascii?Q?UNlS9cWK/sF+T83rrR7AYCQqrffHo4c6b57dhTUmxdtAFEkJqN9Dt0JKz6jt?=
 =?us-ascii?Q?5H0T98ifRjSZLcTR7DneGKV8ZK3e/8/h4pOo8lPBI8zeEXC+X137Hfj+tllJ?=
 =?us-ascii?Q?tLl0PlHt+LIIHIRXM3hl9UW6jajaBpw6bHRBzYByszJTh5MxW+3a9PrOLV/M?=
 =?us-ascii?Q?bMggJhfL+PRM9/obLjZp0jo66HLWunVJnmm8A33tcC2s4uvOtGctGleCK0KW?=
 =?us-ascii?Q?4os4tx/sD+Tigyo4kknF2LQbBEY7cW3HYPX/podukQu5NI0k09jPdSGHrgQV?=
 =?us-ascii?Q?SFsU0MnHAaQLN1lUrNbNiWVrtV3IXXRxjG3Uw2FqYkZ7qGb0c7empils6qoR?=
 =?us-ascii?Q?GiCCn+Mqk2due355e3Dg8DQPIZlNbBLZLZSZ+3SHcVdzUW7XX7Zm6Zo67pP7?=
 =?us-ascii?Q?UAQw5hbEy42e32b2FRB8Uaqn7+sHR9Na/HACsDAl8JKp7QKjTZn0jgMmLjWy?=
 =?us-ascii?Q?P+LiEmwNpgi1vNLme5vOBjl8x44+NFK7q0/m3ozAlbomq4GdQe/rUQCoKc/i?=
 =?us-ascii?Q?0/qCGNSheuuqH83QIag+27aqAhTMzfsc8K1Joijk27SeWMLYjtPsChHCbEWZ?=
 =?us-ascii?Q?8zb13EeSZZ2TcoJi7mwFHx3zUzICAfElwXb7qbv/ZPI1dF2Yzb6EcLGaue+8?=
 =?us-ascii?Q?I1aEVNV4i5wEAmv79ExhIFrsLB4kA+Ui3DyoE74w?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 96f6e33c-060f-43aa-ada5-08dddfc2a07c
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Aug 2025 08:21:56.8500 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SmsxkL+2F23fH0C4jaMfwPiIj56iseUSaY5zZpab7SJ9nPrI7Qnkac/KVf7iP4aEyWnP3MC56cnm+2aZ+Y+eng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5985
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Introduces two new sys nodes: allocate_section_hint and
 allocate_section_policy.
 The allocate_section_hint identifies the boundary between devices, measured
 in sections; it defaults to the end of the [...] 
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
 [40.107.75.34 listed in wl.mailspike.net]
X-Headers-End: 1uoe59-0001fi-UM
Subject: [f2fs-dev] [PATCH v2] f2fs: Use allocate_section_policy to control
 write priority in multi-devices setups
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
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Introduces two new sys nodes: allocate_section_hint and
allocate_section_policy. The allocate_section_hint identifies the boundary
between devices, measured in sections; it defaults to the end of the device
for single storage setups, and the end of the first device for multiple
storage setups. The allocate_section_policy determines the write strategy,
with a default value of 0 for normal sequential write strategy. A value of
1 prioritizes writes before the allocate_section_hint, while a value of 2
prioritizes writes after it.

This strategy addresses the issue where, despite F2FS supporting multiple
devices, SOC vendors lack multi-devices support (currently only supporting
zoned devices). As a workaround, multiple storage devices are mapped to a
single dm device. Both this workaround and the F2FS multi-devices solution
may require prioritizing writing to certain devices, such as a device with
better performance or when switching is needed due to performance
degradation near a device's end. For scenarios with more than two devices,
sort them at mount time to utilize this feature.

When using this feature with a single storage device, it has almost no
impact. However, for configurations where multiple storage devices are
mapped to the same dm device using F2FS, utilizing this feature can provide
some optimization benefits. Therefore, I believe it should not be limited
to just multi-devices usage.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
Changes in v2:
	- Updated the feature naming to better reflect its actual functionality.
	- Appended patch description to clarify whether the usage should be
	limited to multi-devices.
	- Improved the code style.
	- Fixed typo.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 22 ++++++++++++++++++++++
 fs/f2fs/f2fs.h                          |  8 ++++++++
 fs/f2fs/gc.c                            |  5 +++++
 fs/f2fs/segment.c                       | 18 +++++++++++++++++-
 fs/f2fs/super.c                         |  4 ++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 6 files changed, 74 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index ee3acc8c2cb8..b590809869ca 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -911,3 +911,25 @@ Description:	Used to adjust the BG_GC priority when pending IO, with a default v
 		bggc_io_aware = 1   skip background GC if there is pending read IO
 		bggc_io_aware = 2   don't aware IO for background GC
 		==================  ======================================================
+
+What:		/sys/fs/f2fs/<disk>/allocate_section_hint
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Indicates the hint section between the first device and others in multi-devices
+		setup. It defaults to the end of the first device in sections. For a single storage
+		device, it defaults to the total number of sections. It can be manually set to match
+		scenarios where multi-devices are mapped to the same dm device.
+
+What:		/sys/fs/f2fs/<disk>/allocate_section_policy
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Controls write priority in multi-devices setups. A value of 0 means normal writing.
+		A value of 1 prioritizes writing to devices before the allocate_section_hint. A value of 2
+		prioritizes writing to devices after the allocate_section_hint. The default is 0.
+
+		===========================  ==========================================================
+		value					     description
+		allocate_section_policy = 0  Normal writing
+		allocate_section_policy = 1  Prioritize writing to section before allocate_section_hint
+		allocate_section_policy = 2  Prioritize writing to section after allocate_section_hint
+		===========================  ==========================================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index d6a49de1b7e9..5ce9bf6be462 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -162,6 +162,12 @@ enum bggc_io_aware_policy {
 	AWARE_NONE,			/* don't aware IO for background GC */
 };
 
+enum device_allocation_policy {
+	ALLOCATE_FORWARD_NOHINT,
+	ALLOCATE_FORWARD_WITHIN_HINT,
+	ALLOCATE_FORWARD_FROM_HINT,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1850,6 +1856,8 @@ struct f2fs_sb_info {
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
 	unsigned int bggc_io_aware;		/* For adjust the BG_GC priority when pending IO */
+	unsigned int allocate_section_hint;	/* the boundary position between devices */
+	unsigned int allocate_section_policy;	/* determine the section writing priority */
 
 	/* For write statistics */
 	u64 sectors_written_start;
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 098e9f71421e..b57b8fd64747 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -2182,6 +2182,8 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	SM_I(sbi)->segment_count = (int)SM_I(sbi)->segment_count + segs;
 	MAIN_SEGS(sbi) = (int)MAIN_SEGS(sbi) + segs;
 	MAIN_SECS(sbi) += secs;
+	if (sbi->allocate_section_hint > MAIN_SECS(sbi))
+		sbi->allocate_section_hint = MAIN_SECS(sbi);
 	FREE_I(sbi)->free_sections = (int)FREE_I(sbi)->free_sections + secs;
 	FREE_I(sbi)->free_segments = (int)FREE_I(sbi)->free_segments + segs;
 	F2FS_CKPT(sbi)->user_block_count = cpu_to_le64(user_block_count + blks);
@@ -2189,6 +2191,9 @@ static void update_fs_metadata(struct f2fs_sb_info *sbi, int secs)
 	if (f2fs_is_multi_device(sbi)) {
 		int last_dev = sbi->s_ndevs - 1;
 
+		sbi->allocate_section_hint = FDEV(0).total_segments /
+					SEGS_PER_SEC(sbi);
+
 		FDEV(last_dev).total_segments =
 				(int)FDEV(last_dev).total_segments + segs;
 		FDEV(last_dev).end_blk =
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 04b0a3c1804d..e0f6589c6a1c 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2807,6 +2807,10 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	}
 #endif
 
+	if (sbi->allocate_section_policy == ALLOCATE_FORWARD_FROM_HINT &&
+		hint < sbi->allocate_section_hint)
+		hint = sbi->allocate_section_hint;
+
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
 
@@ -2828,13 +2832,25 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 #endif
 
 	if (secno >= MAIN_SECS(sbi)) {
-		secno = find_first_zero_bit(free_i->free_secmap,
+		if (sbi->allocate_section_policy == ALLOCATE_FORWARD_FROM_HINT) {
+			secno = find_next_zero_bit(free_i->free_secmap,
+							MAIN_SECS(sbi), sbi->allocate_section_hint);
+			if (secno >= MAIN_SECS(sbi))
+				secno = find_first_zero_bit(free_i->free_secmap,
+								MAIN_SECS(sbi));
+		} else {
+			secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
+		}
 		if (secno >= MAIN_SECS(sbi)) {
 			ret = -ENOSPC;
 			f2fs_bug_on(sbi, !pinning);
 			goto out_unlock;
 		}
+	} else if (sbi->allocate_section_policy == ALLOCATE_FORWARD_WITHIN_HINT &&
+				secno >= sbi->allocate_section_hint) {
+		secno = find_first_zero_bit(free_i->free_secmap,
+							MAIN_SECS(sbi));
 	}
 	segno = GET_SEG_FROM_SEC(sbi, secno);
 	zoneno = GET_ZONE_FROM_SEC(sbi, secno);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 5aa9d650512d..fa38a3e6b9cd 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3942,6 +3942,7 @@ static int sanity_check_raw_super(struct f2fs_sb_info *sbi,
 	segs_per_sec = le32_to_cpu(raw_super->segs_per_sec);
 	secs_per_zone = le32_to_cpu(raw_super->secs_per_zone);
 	total_sections = le32_to_cpu(raw_super->section_count);
+	sbi->allocate_section_hint = total_sections;
 
 	/* blocks_per_seg should be 512, given the above check */
 	blocks_per_seg = BIT(le32_to_cpu(raw_super->log_blocks_per_seg));
@@ -4713,6 +4714,7 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
 	sbi->bggc_io_aware = AWARE_ALL_IO;
+	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
@@ -4744,6 +4746,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 					SEGS_TO_BLKS(sbi,
 					FDEV(i).total_segments) - 1 +
 					le32_to_cpu(raw_super->segment0_blkaddr);
+				sbi->allocate_section_hint = FDEV(i).total_segments /
+							SEGS_PER_SEC(sbi);
 			} else {
 				FDEV(i).start_blk = FDEV(i - 1).end_blk + 1;
 				FDEV(i).end_blk = FDEV(i).start_blk +
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 1ffaf9e74ce9..81b99c2a02a9 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -889,6 +889,20 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "allocate_section_hint")) {
+		if (t < 0 || t > MAIN_SECS(sbi))
+			return -EINVAL;
+		sbi->allocate_section_hint = t;
+		return count;
+	}
+
+	if (!strcmp(a->attr.name, "allocate_section_policy")) {
+		if (t < ALLOCATE_FORWARD_NOHINT || t > ALLOCATE_FORWARD_FROM_HINT)
+			return -EINVAL;
+		sbi->allocate_section_policy = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1161,6 +1175,8 @@ F2FS_SBI_GENERAL_RW_ATTR(max_victim_search);
 F2FS_SBI_GENERAL_RW_ATTR(migration_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(migration_window_granularity);
 F2FS_SBI_GENERAL_RW_ATTR(dir_level);
+F2FS_SBI_GENERAL_RW_ATTR(allocate_section_hint);
+F2FS_SBI_GENERAL_RW_ATTR(allocate_section_policy);
 #ifdef CONFIG_F2FS_IOSTAT
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
@@ -1398,6 +1414,8 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(max_read_extent_count),
 	ATTR_LIST(carve_out),
 	ATTR_LIST(reserved_pin_section),
+	ATTR_LIST(allocate_section_hint),
+	ATTR_LIST(allocate_section_policy),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
