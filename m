Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1A597B3967A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 28 Aug 2025 10:12:20 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=6poJTu3IQOSZ51laNEwd4z6RXSboCwO6KjFwIJlxxOk=; b=D3BduDmUN1KLYR/2i4SPJyno9P
	R8Ku8MT6KOTBU42uDdbWRESGSX35CE0xCHqWINgZ9K3+yQP+4XCkleTlnMk3JgxjaR+nY3kg2xLQE
	sWAkJHO3fQI3qwIONTmDuCAUJanzEzeeMMxogt/f0FlFIm3brBDySoXHj6Fg54si6AQk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1urXjr-0005hi-73;
	Thu, 28 Aug 2025 08:12:08 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1urXjo-0005hL-AQ
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 08:12:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Mh8h1xd0L1uDfLaxzVzomh4ilwumZ24ynF0oiYh3bqQ=; b=glp93cMiJEPYuttGoRRNXKWFi9
 KsR3Pb7wd0Wmw7qnW0JKYfUo0NfVXEJ9+h5a1LcFk0CKsTfma3La5in6EeTTYyNHvYWjA6xFl/DPI
 MfWw2f1MDSZpIKXQku68lnGAv1/qe2M0DvxKx1FCeKhm+sgJXtA1N+Uakojc3KzUKhys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Mh8h1xd0L1uDfLaxzVzomh4ilwumZ24ynF0oiYh3bqQ=; b=k
 eHesackTEIo8I7FGhVg2VaiTACpJguRUNC/Pnw/qGR7JgUbnIkQuhdg/6jdoWIlvf6GWPXBceIas4
 Kr3abd3yHBywh/cxqQHCXTL6mYdNvb1jF7OgWf3xtbsu0D03Zb4KR8uSv1qZawknGu/oLcvAwfUot
 FznzAEqS0ks2fWt4=;
Received: from mail-japaneastazon11013005.outbound.protection.outlook.com
 ([52.101.127.5] helo=TYDPR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1urXjo-0002k0-3V for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 28 Aug 2025 08:12:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=XIiFHQL9NVJHP7QqeEQYSrEWOQbh1hQTs1X1wV+/PM+ZvoRknUIuZYo1Z81xJe2n5O2x2PezOFckRzPcJx7cMoOrJhvL6mzgWbYqV8rGr4TS8u63iI/IoIb40+VaGa+6bOsOg0PROa4lehhpGMptA0/6OiuCW0Ypy2VX5qaHO5WcjovhHZ+XIcWmUzewZc2oETABgjaORyYgYfgkbALmMJ95Wgivv1GGVE0Yv6vmwxLxXwQi3+xsSu0snHYfSU6A2mhyw4Zgh/nC7+nkYUv0sTd+7Zs73uPjP1Q3L+WTN9E/+G2p8HTqed2/fjrc4FcrVReQxAz17pC5gxbDUImKQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Mh8h1xd0L1uDfLaxzVzomh4ilwumZ24ynF0oiYh3bqQ=;
 b=vP8gOTwLZJem8pgPaumoZLijtYXTUwLA8FN2idqhzA3S94Bx1CNylLMnJcFZnIOZxsw7B48m6JRTI51ULQ3rPPw2DP+vALQtpY3C4ium+W9dNPHPK5C+OR3Ye0d9qPQNUq2fuF9qvjf1X7qHcd0GCwcj2ITNfsCEsRY5eT3IT/WRTOWdJtexZz+ZImfwbL91KEEdaubWNxK8jlro+sUVjM0EeZLWMFCYof700fswTQKIY3vUVA5IU9blhTf5npJDx3BSQ8uSJ7vKJ/yXXU9DEJfYM10mZCYl8B1Uz+4iWyD4QR5OAo7Fw5GWF07VLEC9cyOSrQhEJtnRimHedGX3Xg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Mh8h1xd0L1uDfLaxzVzomh4ilwumZ24ynF0oiYh3bqQ=;
 b=B7mFKTbnM6ZlbkedX5AH0LZqyGRnGHIs7I+NIlBQWiKGhx85vGw4hRNMKsONuZNl5XHgIs5CpJh52cs3dGm99zvvR3dgSXvboETlqiTFFqpnfmTyM9gtU/uQ50S7CXsjAFaQ20D4M2kk/sPmD5zVuq8tUkmCReD8ZUd4u1sx3+tICjKsxNAgYrhM3Q29BjB5/bWOwzpocHsVQHx6rSQVH4YD2SyuxBOQz44u854XoegIWtR7Cx8c+ZBED7eG4Li6dfLxTwv3g/Ammm8U3cmgSz24xHCzRQ+hOHnJACK+otFrmjjR+3ySwWlsBBbxGWdAlWHBXsnqVkleLri1ycQJsQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB6615.apcprd06.prod.outlook.com (2603:1096:101:172::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9073.16; Thu, 28 Aug
 2025 08:11:48 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%7]) with mapi id 15.20.9073.014; Thu, 28 Aug 2025
 08:11:48 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Thu, 28 Aug 2025 16:11:30 +0800
Message-Id: <20250828081130.392736-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR01CA0192.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::21) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB6615:EE_
X-MS-Office365-Filtering-Correlation-Id: 7fe74cfa-d74c-4977-b3aa-08dde60a8924
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EnecyzuIjJ4cZ4204VCpn4EGWrpK67OaGKnKXscEhHvFycqjZWF5sgDLBwIu?=
 =?us-ascii?Q?k1MYT9uPJL8pQZCyDqsjDWjKYKURQZEzcAlbojU9/eh4TPP8WeS7OKrw/j2C?=
 =?us-ascii?Q?LXI8fjaTe5W62yDQLSlNwrR9J1SaOmkA3y4yz6FK49swPKJgPIyBIqtm/bps?=
 =?us-ascii?Q?cgS3T8tiofd7Q5CaTELzRAehgDys1SrQNYYSmcrdAC4uJxloJzA5GapKxJ9z?=
 =?us-ascii?Q?vBunu/AR41BozqhDjFqcXiEDxrf9vDofljuyXuCPnnnWhM30X4IIWiIqypm6?=
 =?us-ascii?Q?Fkly1gp+2stibpqrH1oXAoHUYSN/6A3NLf40Y8l/aJCgCoaECssORc3qLmKx?=
 =?us-ascii?Q?TaEOjeCGWI+sqvj1O3iV5f3mU2xbjtFSYoECSlxKU8KZeLEUxTEOB30ifSsE?=
 =?us-ascii?Q?y77drB9SvRoQeh35qNoqp/VQW8VxpdyY1Q2A5wmBjGlT5Z+7cn6sYXiiGmtf?=
 =?us-ascii?Q?bzxrCRIAthX86okyCkQah+3aFs4Vtpc47Br8hzoLoLLo9bP/BkUEfuqTfO31?=
 =?us-ascii?Q?2E7b9zFLonsi9Qz9O5WnhKg04R7f0nnHKpnbajIWMTVeE3+dzKuyIVj91h0K?=
 =?us-ascii?Q?ZkLeFY+etnXPz6wU1EgIxIHtt6hfsjR/iwG0uV9drATbifXbmva9raRvxXrq?=
 =?us-ascii?Q?YHEQePECJFxT7syEFfYW4TLft5HruWrdhXwb3+96B6OgEEXOX+X3Tdr+26Al?=
 =?us-ascii?Q?9FM5nustCJHMjY6nXR0VtJ2SomvhAvoxqm6yblIORfRDr7BobZIsNwKsdREQ?=
 =?us-ascii?Q?Q5PUlIjo2ULUOy9R1uhYmxISxR6u/qBRzJVk0xvM0a7HJjU7mvw0pMAqRinz?=
 =?us-ascii?Q?d5uK77vavyN5VnYtS2zcbxJRZFfqSktRxX7T0dQDXiuEkgr9hBcBZwavBPbn?=
 =?us-ascii?Q?Prj3AIUGxKKxvl6kkQQIaTSQ88cHZUbSKQI1Ys36/S/yzzQNmJ8lwZKYdQlN?=
 =?us-ascii?Q?u4xoSlnq16Ln32JE9BxQpXd/oDO/J3Flm3RErrH2ZhKbm/BemgUJNUDMYUSF?=
 =?us-ascii?Q?wSlNo3uZOlhUr5nI9s51TI1BVZi9dwHPAG4v5J5JkOWIzi7QTYdAfk7hVzdG?=
 =?us-ascii?Q?bx7UFxKHYGDaORAeWEsPu1cvTLXa8GuhypLVQCFIb0stalw5ZTAaBHW15rrP?=
 =?us-ascii?Q?KPdMmPaeN4bhIca8N7rF9bSMSXxa/0ux4Ig3tY7W6TEtXWqMS9t8tAGs56Kd?=
 =?us-ascii?Q?eTTTEd7yHTP6BbGQcjMaw77XLepkbk9U/RDgQT1jFsAMluzh4bz2z18ZjcEn?=
 =?us-ascii?Q?mUGa9nSRZAbeTZLizqjWnH13g73DepgU5k1QoI0sg7q/uCRKzEMIwthYuPVd?=
 =?us-ascii?Q?dSrLfPFMPFiZWdFoWP5G5KsbxsaRiHSM7gMsl51BljcrtmBgW+T9ZhKjzGn+?=
 =?us-ascii?Q?hbfjJlWUk2e9ZK6JuFizbf8I/lQR+C/jODp7t4oMX+Uj7m3vI0FJq4On2UQy?=
 =?us-ascii?Q?1O6aj01PDrgKVJqa7acM2M4RqREcpCNvlkegr/lefEmiAFOpYp9SFg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jltlbmqGTNh2Bwc8UtxFIZ4nKo0/2EC98D4OquxWrThfoDiA8yrKExI1AijL?=
 =?us-ascii?Q?zhH0BPRHmdC/4xpXn4lBP5fIZsvzK0ff4wQn4G6kG9T+1Sxyhw9O1sJCnoxl?=
 =?us-ascii?Q?EIKkzCfO5fGTOnJz60/ajphsolF4aGKRPOF8B8EO7+mEV818bZqlhsEfuBgE?=
 =?us-ascii?Q?AOls1h5q+0lus8aOWZ3vgY7udosUhcssrJS2Px4fwl4+6v2tzOQ3hlH/nyB/?=
 =?us-ascii?Q?Aba3D/wVJ+yCDHn4VH6NGYaOg3u+MO/L2Ns5srO03zJo135OFdVc2B49vj+Y?=
 =?us-ascii?Q?xUwy53NmPRPbexSzyjHkwZhFzkRkApYjDnjqxi2CySx0lRo7jficLvEYy9Yr?=
 =?us-ascii?Q?qL1pBsSCNJ3em+SH6zLpFP5hNEqa8v/xXR/bqvtrFQwB3H7XNh6UsXlDMzfZ?=
 =?us-ascii?Q?1tb7Gp8JWTIQASNrDLiaMRUzhiDOaAdVhAVkwJx/L9h01UqdQzfHGIypw54N?=
 =?us-ascii?Q?443ET8n3iw9bwUZuaTuumYihbR6EDrS7IeOk+gQrkmxnGc2bZrH6eO7i9DKF?=
 =?us-ascii?Q?2B96mn6tIgAIUFsh6ocndiO2JJloHJTPB5mNPsUu+Nijw94GAzXIKTmJ8+pE?=
 =?us-ascii?Q?ZQs2m6ih2OpV6N/hons5LdIA4dwtKJamIdaAmtSsHcvGNkEJwq6icHblsA/4?=
 =?us-ascii?Q?F0BEKzCu0ztmQj21BPN1zA82zFdrvKt4osVPf9SqdEwmGYA9wOmSE+cWSuDQ?=
 =?us-ascii?Q?fmaOo26mWqMRFSJWdik0qg8SxeKRW7jrN8zqlF0IGdPN7plTbVKve10RWce8?=
 =?us-ascii?Q?SshBh83g7FzGJlWzNYD9fCPrbhLmZPu5bXu3tI2ytgCCoR+H2/qGviL7hfS1?=
 =?us-ascii?Q?tjHOnZrvcv2HPD0Z6C1MgR9xTDQ+zwx2qbYEQC0vRgewFVNGSKrJ1tiJa6ZA?=
 =?us-ascii?Q?QyvjpFMBSniKtaNN7a74v1BUzSTREFJzH4V7qk1W/vm9c4CpvQhOGjF619vw?=
 =?us-ascii?Q?57bIaV9LghuTOvqlF17qXpepxJbi5gSK7Sevlz5dLlkM0OLj7lJSyNk1Z3+v?=
 =?us-ascii?Q?UGt+vKUoDBcXzmcTG3KRN9NOcdBuFC41xi1Nv55jKln/wnhrndMxjI+ys0BC?=
 =?us-ascii?Q?bDyhRW7QKrGQxoE4jGYbx+0ThfoRJ8pea+Rx6Lllxiyno253TX4WxtYquV0f?=
 =?us-ascii?Q?IFHgZutFFEgfHS+8vvoPYw4WvL7EGD+SoCUtcveQ1ydI/DHfMpwgJqKOfZ5l?=
 =?us-ascii?Q?++UvAQJJGg2RcMtlXMPaOygbNOFRt3djBltm4sSRArplrRZnUMO6EGjd+b1J?=
 =?us-ascii?Q?86CZpshBUilAnqugAXZpwGUF8X+oyKJLFW7C7FKX1gaiJoxnw06GaNtV6eqS?=
 =?us-ascii?Q?qX/iZW976RM9dgePQ9JQDrBj42QGKrvFAHVoBuJnQ+7MzN1RzbUPvRkvoMky?=
 =?us-ascii?Q?FNXjMvutPkiyouYh4G4FoCkzVrcqXFRgo0KRFP/HBQR+A/Z7tLIf8vmDYJnT?=
 =?us-ascii?Q?3vROu4M0ixSmYcjxHRb7UhKIQL9q5hrYNhVIRB+auJC29q3O09opqbDjPVHg?=
 =?us-ascii?Q?xJys5uQrtYNHmMCwKHJ06YA1HSJYo2t1Cu0o7E3QbTOy9DjegL9oGrUemLb4?=
 =?us-ascii?Q?w/8LXLFoUAq4FLZ6nMCJDgjCSiMcy9TvdnlWUIvC?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7fe74cfa-d74c-4977-b3aa-08dde60a8924
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Aug 2025 08:11:48.3438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W9v1abVObp1LJhyxTo/2nhN6sHUfBNcHiTqRiHmz5fjW+M6ZmsAgYeusM4d398V6edUsk9WoJPjTqv/5yWbZaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6615
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
 [52.101.127.5 listed in wl.mailspike.net]
X-Headers-End: 1urXjo-0002k0-3V
Subject: [f2fs-dev] [PATCH v4] f2fs: Use allocate_section_policy to control
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
Changes in v4:
	- Adjusted the initialization position of allocate_section_policy, now
	initialized in init_sb_info().
	- Use local variables instead of direct references to avoid race
	conditions.

Changes in v3:
	- Refactored the implementation logic of allocate_section_policy in
	get_new_segment(). The current version has a more coherent and readable
	logic while maintaining nearly the same functionality.
	- Added a validity check for allocate_section_hint in get_new_segment()
	to prevent potential conflicts that MAIN_SECS() might cause.
	- Adjusted the initialization position of allocate_section_hint, now
	initialized in init_sb_info().

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
 fs/f2fs/segment.c                       | 17 +++++++++++++++++
 fs/f2fs/super.c                         |  4 ++++
 fs/f2fs/sysfs.c                         | 18 ++++++++++++++++++
 6 files changed, 74 insertions(+)

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
index 6cde72fce74e..7c6bfee81c61 100644
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
@@ -1856,6 +1862,8 @@ struct f2fs_sb_info {
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
index 04b0a3c1804d..e4d71755a60f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2774,6 +2774,8 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	unsigned int total_zones = MAIN_SECS(sbi) / sbi->secs_per_zone;
 	unsigned int hint = GET_SEC_FROM_SEG(sbi, *newseg);
 	unsigned int old_zoneno = GET_ZONE_FROM_SEG(sbi, *newseg);
+	unsigned int alloc_policy = sbi->allocate_section_policy;
+	unsigned int alloc_hint = sbi->allocate_section_hint;
 	bool init = true;
 	int i;
 	int ret = 0;
@@ -2807,6 +2809,21 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 	}
 #endif
 
+	/*
+	 * Prevent allocate_section_hint from exceeding MAIN_SECS()
+	 * due to desynchronization.
+	 */
+	if (alloc_policy != ALLOCATE_FORWARD_NOHINT &&
+		alloc_hint > MAIN_SECS(sbi))
+		alloc_hint = MAIN_SECS(sbi);
+
+	if (alloc_policy == ALLOCATE_FORWARD_FROM_HINT &&
+		hint < alloc_hint)
+		hint = alloc_hint;
+	else if (alloc_policy == ALLOCATE_FORWARD_WITHIN_HINT &&
+			hint >= alloc_hint)
+		hint = 0;
+
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e288b7be3131..bb57c54007a3 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4238,6 +4238,8 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->total_node_count = SEGS_TO_BLKS(sbi,
 			((le32_to_cpu(raw_super->segment_count_nat) / 2) *
 			NAT_ENTRY_PER_BLOCK));
+	sbi->allocate_section_hint = le32_to_cpu(raw_super->section_count);
+	sbi->allocate_section_policy = ALLOCATE_FORWARD_NOHINT;
 	F2FS_ROOT_INO(sbi) = le32_to_cpu(raw_super->root_ino);
 	F2FS_NODE_INO(sbi) = le32_to_cpu(raw_super->node_ino);
 	F2FS_META_INO(sbi) = le32_to_cpu(raw_super->meta_ino);
@@ -4752,6 +4754,8 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
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
