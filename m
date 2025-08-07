Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D0AFB1D468
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 10:45:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=5ctdoltUKW7nJu2fqxm5HBnJQyO0/UfoLA7JWqbYLvg=; b=WZHtKrGr77CZbHJp56WiMgfK+5
	9VeHZVOV8T4sZrCv8PjBAhpaxFF5dOiD9PQB5oh3U+eIIXAOtc7RdZTIDXMywshcGJ7OKifOEHmpe
	9RgG+zftpE/m5NyuQsj2AlAj96kJtxcqGDebNlCU6O37l8shPJb3xR7NpYSO92CpSHuw=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujwFK-0004ma-U3;
	Thu, 07 Aug 2025 08:45:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1ujwFD-0004mN-KV
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 08:45:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=DHi1ll+7fq9+6qRdMPz6XaEJKLQRxcXwV/GyH7McuSw=; b=YirGcIIrNTsjyRM1NtLKpT7AN7
 n5ozPbb0sARibcd+v9Y0tMz7YpmAaraA8giwAeLPgnoyo3uBBgW2QB6+LfoQd75hHQiyQXvw1TQ/e
 fFjNi1C42x+avAsIg91C38WArL3daAldrFtOpv2ouljmSHXjLiLk2dWl5lXmf+zH9XNc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=DHi1ll+7fq9+6qRdMPz6XaEJKLQRxcXwV/GyH7McuSw=; b=l
 lIGAQqh+LeGB7zJbWur6sRXSjao2Br2KnoT08zQOTWU4h1JMC0MxvOm5VeVt912o1jxGELo5oyk1Y
 1EAKh2JNAhobir2Bphg6WNpD0YvdhmTHthroVzccVYMp5qnYA+cDrl3+Y6c0kMWkyyxbxSK67NTyd
 8Lxk73oBj73WNQCw=;
Received: from mail-japaneastazon11012039.outbound.protection.outlook.com
 ([52.101.126.39] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujwFC-0007sY-0w for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 08:45:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Utt79U1UAkEqis8lvnyC/pSY1YJO2ja4Ag4j00xQYuq1/wg5KUR3+lAPGcui+PIu54C4PL7awp0DSZ38Anf2p5N6nnC8TqG58EregeNXewwBkNQKPvfOVj7DBbeKEtfVR7DjA/QGCEbnUKCeTbXWlGhI7GoYVgz2paRZJKOI96WsP5K5yi6uR2xXWOcORLFihZmAzd6YWC4tTh8EKsW6ZXHcT9YlzuF1EAqDyP7IbCIDUucxA6vIdME4zfV2V8BkuMKG554IXA8iV7JyiqkgkWkmws7GfNUjfNpO6XjuZNVdGc3O1sJmkhLA3wUir/4Jf025obbRTpftEKm6bqV0jg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=DHi1ll+7fq9+6qRdMPz6XaEJKLQRxcXwV/GyH7McuSw=;
 b=pXeV3vXqDdeh/Y8wnjE6w5I/IHrVIlYZ3K5CkC/r7fzc2jhuzmCYBGV/ibt4bxBVnTp85gyUAqFxw99A1+9umxZzCvEhZg8yLvUbPFYsTDjodQg7BGM5DGi9qHPOx8Y6JJIeM2AnRYyZgL0TiN+pKut7SXeKYHypQih395roP1seZK2YsQzBcaCxWjk7/nQVQW++GRdkbhjNHPOusyhskXToWdYE9RHAUZ2OXq5wnxKEswI9BlxqpsnpkirFn/69TQ9s0aDYoWRcRKS741PQDTVvgCEzY8jMPjGENqnn8stvSNQaGs1uH5DNjmOcHXMjXnfqNkzzUe1+Ulgyze9c5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=DHi1ll+7fq9+6qRdMPz6XaEJKLQRxcXwV/GyH7McuSw=;
 b=lUSRxYhWekQwf2rsWo9IRcoV8zsXLS2lLUF+pFJ6QzLMUZoixEjJvysQYbu11OmCfvXNEqJ3VKCN9C3QLj99wofzxpJg5AHSstDaD3Jksd8ZbX2EdxMcT0ECsyKW8EuSAYCeaTiLkGNvrAvT6W0ZTkqpLxFmbymKbqDO3RLWAUHPkI9kU908jSnFUS/rSb7LEq2FPCV3zvlLaAO3hl5fruRo5STVu9MwCkdkqCDhkCg3/THruu1QLulxhBxuqT46Hymq05IsoDouBSuzHE4iTQqUSPXmSOTIRMTKuC3ixUXrZtM57RhNXegzwFttCvGgSciI8lXKqLnlxHCRtxnipg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by SEYPR06MB5086.apcprd06.prod.outlook.com (2603:1096:101:56::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Thu, 7 Aug
 2025 08:44:54 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 08:44:53 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  7 Aug 2025 16:44:42 +0800
Message-Id: <20250807084442.422751-1-wangxiaojun@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYAPR01CA0102.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::18) To KL1PR06MB6845.apcprd06.prod.outlook.com
 (2603:1096:820:10d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6845:EE_|SEYPR06MB5086:EE_
X-MS-Office365-Filtering-Correlation-Id: 572be58a-ffc6-4988-b27d-08ddd58eadea
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TKwY0XK8MosXOiWiA98DWwtTvTajUXLEm7mVLmRQTcXshZ5+23s3X5sJ7HCg?=
 =?us-ascii?Q?qH9MvDg7lMCPqn8cnV8XwFlwcQwv1v1DSLTNH+ygnQX17cXgbJ82/GQE7PVh?=
 =?us-ascii?Q?BdIq1WeYywaXIL81y+4NHLtv6guhY9JFdZk01mgXhPLRJ79SogwgUNT6KgYC?=
 =?us-ascii?Q?Y3oMJ8HtmV8Tbd2DVcA29rGL+gSFtW03h2qtpQwMb53aSilMOVZN1GK3+cdn?=
 =?us-ascii?Q?QPpu8x7dhnQ4AhZBu3k6YECsIkyNy9ESJv+XsfANJn3olIXrRouK+RYUZd3V?=
 =?us-ascii?Q?4yIjiWT/4b61NB9ahDmVCq/mApTXjSxdhy6Vmw71NgLBQ96DGNjXEPGTXu6N?=
 =?us-ascii?Q?VNaqCzJvQ2P4Lq+rhUbMb1dw1e6O6IgXoXlwPnvPG95rLxmV36yX8i/Ui3eJ?=
 =?us-ascii?Q?NM1Jx6phef4LHS4nuyfjOGg1wV4o7ZGWKGCwZwW3n68tJiPSJDnl2H6llM7z?=
 =?us-ascii?Q?+iQIHD0ftUWqWsrZq4Hx2bhIUAceA4AbhQC2X4S8sNWEcEG3+X1zsvpoJzCD?=
 =?us-ascii?Q?baUh3WauGkltfLVF1qx/3rj7raa61zzbDFnClQm0oItV52WJ//AthqH1vuSg?=
 =?us-ascii?Q?YhZe30dcht0TlFzD5ODdOCpPCxuypUjJ4PHBNfOc5PxeJtLWfp/FMkMGG6qd?=
 =?us-ascii?Q?kr/Vs5+vYlTNoVN0fFwrfZ9c6GzzkdT9U7bHdXE8qlFFFIPnshwE6bKj1tmy?=
 =?us-ascii?Q?0dWGbq8mLtQ0JW7WwW8YQeWKThU960cO2t8/DOWeJ8IefYrjYNThIIzoGsYa?=
 =?us-ascii?Q?h+XQ2fXyIx8+hRi+3iNuyzJS7UJ9KfCPfkaNpoyTP2N0gV1FoDPSyyGfBlaK?=
 =?us-ascii?Q?Hy2fQHXpq7frx77usj60+Ivm77oL6iktheoQMydfNeThyY6qDpTyEgsx1mIL?=
 =?us-ascii?Q?3eOU67UVf9OQXh8zagobClu3WWT7KonHC3R86Yb63qI8YbW9itLk9dEWVY/g?=
 =?us-ascii?Q?J8wbpiSpW6PMsrjDbzP48Zi7qLOuy11uYSmdHhXKIU40HMvQ94Vqii6UGpxn?=
 =?us-ascii?Q?EMj6I3czJ5MZQBemq0R5tv5ZKy/n8MFJZhs/qtcCjn5HKUgcOpV6iX/icaPZ?=
 =?us-ascii?Q?pP2rPkqCoc+zFJICbHfy9wEoSW3w8mZftd8lZbrmoAP/bnsmCqpSaZm3ysR8?=
 =?us-ascii?Q?d3fbbhmRV11V71u5IQJFqpEtUu8AzDoKCt7aDc/OyuaP+DszWAhMcwsO0Bdo?=
 =?us-ascii?Q?N7sBCaAL9l9HGRYBHxL0N8iHbyR3PWLLJVO3QI9CEQjN78erIPU+m+chbkoL?=
 =?us-ascii?Q?DO9D7I4wWYUw3HRGU7b99PQ82V0nRQAaWjfm3llPI0ZqbSlGMWrXBfDdNJah?=
 =?us-ascii?Q?abkgjPfsIWare33MXjPX/mTG1M+zDdN3KdM74zmmsMWEHGyD0Zz0xxzjqvH/?=
 =?us-ascii?Q?6caL2lU6gh8L71mPH2axez+YtkyA1fxVMGqTjwRY+jTKu3oKilyUN0SAioJT?=
 =?us-ascii?Q?IlATNo7ytioJdkvyFWN24XqWPGy/l1pvWt1Kg7snqzgyhDFtuQd2eQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PM9VsJ3U/KfX0huKQeK4El3vSe/ECASbeMNZD5vu4T2Lj5kAveklmxdXsf7S?=
 =?us-ascii?Q?eL+fUumNaZFzUFjg5nUAmfVlKVzwk4VfA2EOyiMIV6BSJmjPrCx4N9RumXqN?=
 =?us-ascii?Q?rI5GSRWdein4n2IbK2U7NXzOnF5qTCNZX/K9OXnRJmUBd0XFFyIdxQ9QjU78?=
 =?us-ascii?Q?mrRVrW3ih+Nts+yETtT1iTWYfcG2ZCdrAM16rbj+Bc82+pmtkvcCVhgAeQg4?=
 =?us-ascii?Q?gYhSmchX7VgxB1EBO1SSjgpLuVNL8BArWMfeoGtoa/74SnLxQCFkxsaHUomE?=
 =?us-ascii?Q?1HWZfDchnbKivOiS3YfmmbevnclrjgS96o+27p2FuBPj6afF6EwT+bvUrpL6?=
 =?us-ascii?Q?JMFwYHhHT+tXm9nRTpuOgJQhMAcUD+lENA+sIn1eOcRV28tGTC3c+6sRN2K9?=
 =?us-ascii?Q?Lpso0N+X1MUH95+SLiLiWl2wl6UL9SjacugoI3AIhbq1MN2Tc9T1uQZIVMld?=
 =?us-ascii?Q?RC+pmtVPPwJHxBZOUg/4YXQoU5ebLZb0rI4ybgYfS6gvAyq0E2rhvS/ZHZZC?=
 =?us-ascii?Q?VLtbsCJDwmTWmMxAwP6eXOKLgYbXvU5lTrSq9roam/KFlcNnY+BR+0SoK/Jz?=
 =?us-ascii?Q?tPTGot3dWA4qiWejc8CW2rUk1HUaV/uJlo1TEzskA2c196mV+AZ27pY0BCVC?=
 =?us-ascii?Q?PKaKZn1CGVT5u9BdWam7oBvXX+/MhIPyHS9/HOWgT9y7BshPlARhJylDfaA7?=
 =?us-ascii?Q?TOvfxm6Y6vSm6+diTgjj32xKTiw4qQaOeppD9bKQlsQ9sWJ11i3k2WPLSkm2?=
 =?us-ascii?Q?ttXYYi79p5vUSlzGocyMvRxsEtBSvFHXB+NQt2ZjWiX3ODOxWJdczAUIXSA/?=
 =?us-ascii?Q?avQM0TxGcXfU2Iw1MT0YS6LB17QNIh4xi31qSuiJ3Q+mrdERl9z+UX60VCF+?=
 =?us-ascii?Q?+qBLrDAIHMEZUae/PYarOAdjWQflrx/unsxEwzcUtmqbOdZf6iNP3FiHqsGm?=
 =?us-ascii?Q?v2iBMLM2rA8pVvkN6RiN5X8F/J64EiQyW43ser4V+b2weXuka0/vy7v85VMh?=
 =?us-ascii?Q?eo/sUNU1j9Fidky7N5Pw/zSx5bnKkZomhS6MkVqCTXTJWsJA4h0ad2a1O+9y?=
 =?us-ascii?Q?V8M5DqoVKt9wBs/Qj/23mnhApJEXvyNp2stsR/YJxN1yBYW0s/7UadJBvZIT?=
 =?us-ascii?Q?QPJ4dH5aiOIdfPXT9C7i3RTuUj+GtS3XXiOAFuqlLfdeg8J3F1PdJYAQZ2M6?=
 =?us-ascii?Q?w5tHZewhyOdm29YOVBTEirHvwLB6EWhBQqCHI5H2vL38lO4h8yZGrWV0XFwZ?=
 =?us-ascii?Q?nDzeH48PtAjWgW/1Qf6mAiCchEwp6IN4X1fJWU2Ioq6NUh5N+IS2YHCUVYNn?=
 =?us-ascii?Q?wVSgqlVgVYue0YZvY9NPQ9JBYxlZWAfrPFuqkmYIYFLEbWijGB3Wsi02vDdP?=
 =?us-ascii?Q?FPBjG6+pQC/U3FqMqzxwjXu99u7qF4a3DwyNfoicaYKFFWkqNvbJzo/jslXV?=
 =?us-ascii?Q?Jp1tdXsIhC9EldCwFAcy8xn+vYFvhZvvNDn89AEVpDwfjy196d9iQUPjQX8o?=
 =?us-ascii?Q?uorZ6iKgMVGwlmJQH3voMcV7c0I5U3hyc/llQgZM7YmRnHckJqhXxjvh1dy6?=
 =?us-ascii?Q?izN+wNqgyBCpX5jz+Gm7RUQxqUIZV50ba7I8g6oU?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 572be58a-ffc6-4988-b27d-08ddd58eadea
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 08:44:53.8781 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: d/2jmIBzhJlN3VxcKSywXF3CFSrNuhO77+4/mDrI+A9HVtrPnXC7YSfNe9Jt4FY/p+wOv9oLlGDQ9ZschHuaCg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5086
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch fixes missing space reclamation during the
 recovery
 process. In the following scenarios, F2FS cannot reclaim truncated space.
 case 1: write file A, size is 1G | CP | truncate A to 1M | fsyn [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
X-Headers-End: 1ujwFC-0007sY-0w
Subject: [f2fs-dev] [PATCH v3] f2fs:fix missing space reclamation during the
 recovery process
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
From: Wang Xiaojun via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Xiaojun <wangxiaojun@vivo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch fixes missing space reclamation during the recovery process.
In the following scenarios, F2FS cannot reclaim truncated space.
case 1:
write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO

case 2:
CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO

During the recovery process, F2FS will recover file A,
but the 1M-1G space cannot be reclaimed.

Fixes: d624c96fb3249 ("f2fs: add recovery routines for roll-forward")

Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>
---
v3: Add a Fixes line.
v2: Apply Chao's suggestion from v1. No logical changes.
v1: Fix missing space reclamation during the recovery process.  
---
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/recovery.c | 18 +++++++++++++++++-
 2 files changed, 18 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..28fce59198ce 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -459,6 +459,7 @@ struct fsync_inode_entry {
 	struct inode *inode;	/* vfs inode pointer */
 	block_t blkaddr;	/* block address locating the last fsync */
 	block_t last_dentry;	/* block address locating the last dentry */
+	loff_t max_i_size;	/* previous max file size for truncate */
 };
 
 #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4cb3a91801b4..68b62c8a74d3 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -95,6 +95,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
 	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
 					GFP_F2FS_ZERO, true, NULL);
 	entry->inode = inode;
+	entry->max_i_size = i_size_read(inode);
 	list_add_tail(&entry->list, head);
 
 	return entry;
@@ -796,6 +797,7 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 	while (1) {
 		struct fsync_inode_entry *entry;
 		struct folio *folio;
+		loff_t i_size;
 
 		if (!f2fs_is_valid_blkaddr(sbi, blkaddr, META_POR))
 			break;
@@ -828,6 +830,9 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				break;
 			}
 			recovered_inode++;
+			i_size = i_size_read(entry->inode);
+			if (entry->max_i_size < i_size)
+				entry->max_i_size = i_size;
 		}
 		if (entry->last_dentry == blkaddr) {
 			err = recover_dentry(entry->inode, folio, dir_list);
@@ -844,8 +849,19 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		}
 		recovered_dnode++;
 
-		if (entry->blkaddr == blkaddr)
+		if (entry->blkaddr == blkaddr) {
+			i_size = i_size_read(entry->inode);
+			if (entry->max_i_size > i_size) {
+				err = f2fs_truncate_blocks(entry->inode,
+							i_size, false);
+				if (err) {
+					f2fs_folio_put(folio, true);
+					break;
+				}
+				f2fs_mark_inode_dirty_sync(entry->inode, true);
+			}
 			list_move_tail(&entry->list, tmp_inode_list);
+		}
 next:
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
 					next_blkaddr_of_node(folio));
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
