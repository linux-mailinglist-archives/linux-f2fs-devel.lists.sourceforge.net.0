Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BD181B1D171
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  7 Aug 2025 06:21:16 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F8dVGt4MMRGKz4FFJX+3xJwCXzzgEmBWfeZEMqwAA9M=; b=bqRJhbA6ozZLxCGQdTsdAB6cDZ
	Ds6CiFuZu7caAMnqFJCczsizxLWz1fEXjFC9v/am0VTvDh/Nr6V85et0XyDeBDHcI8f+h+hNuddpo
	R5cRQSiUWsIiKM/D/Kt5vVsdmInxxJ4cU2r7Z0vDWuMCw2NE4mNNcYbPk9qY64kn5dyU=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujs7r-0007Fw-HK;
	Thu, 07 Aug 2025 04:21:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1ujs7p-0007Fo-QG
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 04:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nssn9q/+OVGutpgpUwtDSjHfLTE1Q0i65p/5vYiw9qg=; b=j/oDo16oZBk7nwESgSLPfkqH89
 Mnd5iLazAtHHr2FfuExEv8jZjPRyPVMY8Yn03GK7iGE/RpOL4IhRUA2O6u3ghqZYnlsE8WPcJNo80
 26WMo5oIe5gLqLY2dvPYUcO+mBjAtPUghHeO1L0msMlm/FZBLXJhCChSFVVrX6p3IT84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nssn9q/+OVGutpgpUwtDSjHfLTE1Q0i65p/5vYiw9qg=; b=D
 SuSoXpaqfrq4uUUTMk9y2F3xNLNN3pXU4VZz5S+EQ569YTozu9egMHl2vPsSxa1Be5V/nnBP9p9Wq
 FWCk5fXS88p4iUbXT9oJN76DsUrxf3gL9SilcQxbaJRnV7e6ocP1jnaSqw7hax3KjhcuHZfyUlpnw
 uwh3njHDD10RylS8=;
Received: from mail-koreacentralazon11013044.outbound.protection.outlook.com
 ([40.107.44.44] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujs7l-0001cV-VS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 07 Aug 2025 04:21:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JiydaGnMklqCHVHCUTe2tcckF5ZOhR8/fFF/nrXfNx/7t9CQC+GxiSzFlR1KP6nUhQAg8RnBY0XZortM1xE7FxrU0c8zVvmLCK9TE3cbo6H2aUzshT9oc1UjbgM5IDmc/69N14amMD/QQkjicnNGjOIyu6MT1BxRy/9P6k2kXLSNeeylg+VcGIbBuQHoQFFivU1e5t8acJq6u9tyaDX4dRpsNGucEbGIL3ZADw0U4f++vTzhtlthNbX/KGwBgUOGbaVK4KgRQl5M1UptUm6Dp1t7iemMYZGSJ15M1FynsJzayvDpnjz8fP1fV7qNxf3I3GyWZj+vcdFeDXP+lpegVw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nssn9q/+OVGutpgpUwtDSjHfLTE1Q0i65p/5vYiw9qg=;
 b=h7iyfEyCLms8yHRhK4fBah5wMsLlRZifdquXEkd5G0gkhqCYUqdLFY6BQdl+zkjEYOEVGhdzs1L7YJbCzi6PA0coEFBbPwn9V5ADXCgr5LDph0cVXldYerJiysg/wbRPFMqy55yKDvz2+ixEXVX1xSg0sOdcfg2PeWzl8EiTZ/SlMBfA2MdgFSvTGKZ+nv2douhCdJaAp2DCJCShuKxJqsvY7Cy5Ryraslcoi5JaHD6bSaRqNVuvDm0TVqwdVhlPcG576npFnl7FYzq1YNnexR7QGVpvuHDGSVT0NVYBIvpia0Dd5sdMNG0AwSkTPFfCkhfG78gqA7fYgPnv2/3j5g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nssn9q/+OVGutpgpUwtDSjHfLTE1Q0i65p/5vYiw9qg=;
 b=pnlAujie5+xHf9KpBrJAWG2dOmZKG+OZi0bdCn6RnF8YdHWLH//unIrYsesJiryvqJYFnIkl1vrPI4ilwNriAK9uLAHkCCYXVHXvUtydeR3fENb6XTYBng44lf8xiGjFoCmTFy52tO06QZBbmpKl+7QH5NgY035QRJQ/MbdEIJIyh9PuCsdjr977P0+A4NHSOoWtvRbAwCHBwoHAYHqOs5gkstEhrhWoqqXaEi9y1p2ccdtnZuycR0wn/7AU3Bx0PetiPSl5cy8McHQuvYdoGB3WQofu5p/DaJtwZGc4uVNX+o1dJhfNtpAeBEb3CbOawy9+XpQgZVpUGbaM6yi/nQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by SE2PPF0834FDB97.apcprd06.prod.outlook.com (2603:1096:108:1::7c5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.15; Thu, 7 Aug
 2025 04:20:49 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.9009.013; Thu, 7 Aug 2025
 04:20:49 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  7 Aug 2025 12:20:35 +0800
Message-Id: <20250807042035.631350-1-wangxiaojun@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYAPR01CA0114.jpnprd01.prod.outlook.com
 (2603:1096:404:2a::30) To KL1PR06MB6845.apcprd06.prod.outlook.com
 (2603:1096:820:10d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6845:EE_|SE2PPF0834FDB97:EE_
X-MS-Office365-Filtering-Correlation-Id: b3dbe50a-c0ac-4ae8-8415-08ddd569ca04
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?aN1RnTy8LhKsmComeQboYV0Avy8yCaUS22YzhMSQUnvy5LqHsyySbkmSlCvl?=
 =?us-ascii?Q?lbBE9rKKm+E7vOHhb34VG1l5bgZPjhBowNLSdZkToyfz4Od3TN2WlOLBhau/?=
 =?us-ascii?Q?jx7DZ4BKoHKv6FOOnXi/ZetaI1X8lVL7FfIIyH6jJSA+kGnyiU9BNFDQl0OP?=
 =?us-ascii?Q?EqP00QXDynZ87sLK1GlfISOHKgYOTPpCd2pqmx+osT1XxhGR7yiiG7xwsfu7?=
 =?us-ascii?Q?lR4fE931M3z99uqdqQG6xy15jMYX6YF6icBlNG5m8HB7lzDHhB75sW9OsvNO?=
 =?us-ascii?Q?Soa0HfuUrzzQnSrvIM6g78baQFeP7XfKRaujjSOLc5dkXtq21bsulF33Y/5f?=
 =?us-ascii?Q?IpGvwJnUT0gW965mjoo7oZGNx0xQTlMNt9WSnmlD64CKwX++j634h2VALupg?=
 =?us-ascii?Q?q8R18yjQMRMvHg0w6jl4mzxwg2YorokMTakFYaqwla+0/NiZ4j3MTJICrq/P?=
 =?us-ascii?Q?AFios7hxJKcS9/va70z9lDGfI+z6U2FLXpZeY6wU/4wvfHtQLbdiYo6X09st?=
 =?us-ascii?Q?X1tzqlzjgmps8JW1Y0EY0TsvbhUC5NFhkCiCT5tGxQdxTj6KAcfskr4RPR61?=
 =?us-ascii?Q?FawLWWTVo5HNpAJUgH8yG3a5MkE6QbhS2m8X7Q26manSn8MySa+sBQn4/QD9?=
 =?us-ascii?Q?3L0APtnyJTD91Ftnnh/tbNoIvrQLzeBt0TVJOLqrdPEkg6LKL1u7n2dyFUmV?=
 =?us-ascii?Q?zExFb7sT5FGPcwgI4SuDbZYHUTvAXqc3DsgEy5pRs0MnUiEbIqeTJ0AOveaD?=
 =?us-ascii?Q?RPZKIry37EN/Wzuws2JREl+6SAZitiamVx4omWcp+elTl++DT5Q07jp8p2Xt?=
 =?us-ascii?Q?pELmHu6f2lr0OdmmShIyURpOQtnQjCAG5O1oLYd2GhQEtt/uhwVSmsnCkJqY?=
 =?us-ascii?Q?BPUx+hxh4fxqFmc5wUIlfhoh33m80mYC9TWYO1MsALpkM2ZbXhLQHTFZJnqw?=
 =?us-ascii?Q?cP08dJ2tRklEPbIoTQxTzTVCSiQfncYjQIJy0PD5O05AAEctR27E/7r58qzm?=
 =?us-ascii?Q?Tw0KVCcwD08FWoMkyDiiERjT0WwmPfBxcHXT8lrB0JHcYFnUqL77Y9zOZJiA?=
 =?us-ascii?Q?7smP4WqRTI77AQqfBtJAwiMNM6nI9llwpxiFN7LQnL4/rXHCUhqaR4bU/k6H?=
 =?us-ascii?Q?WrzOiuSeyt5z2J5g14TGGuw3ARwE+ZUboC3vUgFwQlP5OT/e5qRl9UvjXiFK?=
 =?us-ascii?Q?xzurI+S6X73DbfOr1jmBE+pxMLBwMjRfNxtopE3sCxRU5v4L8Tikv4mxnqo7?=
 =?us-ascii?Q?fDX6mOu946kepvAknbvTwVFEa6xImmnF6fUhJux5kKPaGT63NoAzhd0Ph6PR?=
 =?us-ascii?Q?9PTFzxSm+SSPXEnD6uEC4WxVYjcqsyTrb2X9bRMY3Gb3zalnzhSiv/49zKQz?=
 =?us-ascii?Q?2IjWIRTdjge1xs+GBfd6StM9rBY+ZMuY0dtREQKt36+g9YT8MjIrQQ2lPQ/b?=
 =?us-ascii?Q?shSOe6ut5AZ+ycD2Iie2YEZl2lGmtHjLEczCp07T4+HPvCaZeCHhsQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tbKoLWZvC91CNGT4oNx7MesDMW5GQpmLUekTuGRTkT/XGDeijy4NxIB7QI0W?=
 =?us-ascii?Q?4B9QAkhgsCwXwT9rajJSOPnQRPEjzf+kfgFOB3u3maYk53IdBxfFbGXlFWxV?=
 =?us-ascii?Q?ektQ9y+BbmNWKJF0Sx/yL6DSDn2R6bQ+FgLPbeVdBYiyTZwI3D4W1TyiNrj+?=
 =?us-ascii?Q?gq2SHupOUTExCl56yrBn33SZuvqZknJy7jxxV+RmkKL3rityP3e/8XhL8ZWP?=
 =?us-ascii?Q?Mdazkif7P4WjHDvOw0VM88Y83q6jrEk4P661h3vob8kyzulY5bgZrQHJBM6J?=
 =?us-ascii?Q?/zYR9tDPr1ukgHtqh83r8av6MS5+2dNgxN2bGVZQwOQll9S9rjTPZbSmq3GN?=
 =?us-ascii?Q?iPIlC3zOlKkpZ3JnWMMz8SuhYKY6z8tCE1S1xlYKgBTUSLm8TBy66bNmWtIp?=
 =?us-ascii?Q?7NMdXg9zIzTTLR7uVzE2znDb3EX5aB2TUYltdOskp7XFdVTWNc/EMeDzKAkK?=
 =?us-ascii?Q?9qu1+i7osM/3uxyl+GFvI5GKr8h9UPK1d1/g+9VRpYjAn33z/LjekJQLk/8i?=
 =?us-ascii?Q?0YagQz7HfFrF3uYOL7Gs6EQntEmTh9gp+894FeS8At3X+HebKQ9Ub7sY1QfX?=
 =?us-ascii?Q?F6ol7XMQwdBpeC2f3bfUXjaGDcrJ7oWBcSa2KQTdTUohiZ6tN2HnTFTLfyI1?=
 =?us-ascii?Q?GQjYDFhqtUdwlcKMQcLUAzlAMtQtyB1+BosnOpcaMBLYz4EqVEM7LD+cy5tQ?=
 =?us-ascii?Q?qs3TZDGviEE6uNECyhlS0XY5nyD4B/KzQFsCz/trrMF6woSajXBoPgK5Lk/+?=
 =?us-ascii?Q?adTJA78aUKokby3K7BXLGxFuNhqb5+NVWXCvdI1MhbYMAPIwapIMCfGJ6bmX?=
 =?us-ascii?Q?npgWegv62BYWbShFhKD5nFEFE+g+FwIRCBnF+v/oEwn78ISkXFdiYDDPIxAE?=
 =?us-ascii?Q?nPtpMT4P/4BA+0TO3H3jr/Fh+M+eRgv26pgpQpnJ5ShCpwAYFSY81zcza9bs?=
 =?us-ascii?Q?7F7JRD43XYGHsq7Z8mMqxhm+gpl+Su/3eL0Lmb7BLD0EE+cdosPwjziOckwO?=
 =?us-ascii?Q?9t8HI1E6MWvDNMf3PNNHSQH23o4LqfveEofNS2R5SkSnEk3oTWMT4f7a8vTp?=
 =?us-ascii?Q?u+NOar7PYIkPFarr+vL6oTxqs02120hAITE4qyMVGjL4dmWoKfa3tJT6Xstw?=
 =?us-ascii?Q?e/CLiBFIVRfbSqpvDsQZNbv945jQH/RV7iLhGR9Qk4WWCOBENS6CccilCGqf?=
 =?us-ascii?Q?u4khliHv+82pNF7K26zi0uf1CcyiFOHCMIsP7+G+ZkYGzTDH1k6zw2XOilS+?=
 =?us-ascii?Q?hGhw96SxyVND3TG6kU9HqeIxz3gwBbd48iZGZZ46EBiO4JbIPY2toLMUhY7v?=
 =?us-ascii?Q?CNJ7LYrCkETvbzDKQb4aFJ+qe6XYE9piqqfRONlRQBBXbCyUJYX/y82S+hPf?=
 =?us-ascii?Q?bgMozmqt+KHIPvL3mn5YANGgsvh6bKxn5L+E0bqMSpeYw2zoYQZWXQ8wUAwn?=
 =?us-ascii?Q?1Mf46BcYG1qKCpqhE6PlrST6n7iWl7mDBiktYxvhIYZD3I8NNbZwzL5SxBKf?=
 =?us-ascii?Q?4rSUfUO0/z11DZhjcEmXiaZsUXhjIA7AekYS82lSEHVpGDH+TP1L4+hhlonc?=
 =?us-ascii?Q?jO74+ITIZcQcW6y2UAOxqjjhmgq2jSjGkk3gZJkg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b3dbe50a-c0ac-4ae8-8415-08ddd569ca04
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 07 Aug 2025 04:20:49.6123 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bGOuj0GjAOBLJTgvaD8v404JN7dyBwFBZgIl8cRMcT0zVwT/fgY7BO5aR9ndkwHAPh6I1l01NbascFxfe1ZD9w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SE2PPF0834FDB97
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
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
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.44 listed in wl.mailspike.net]
X-Headers-End: 1ujs7l-0001cV-VS
Subject: [f2fs-dev] [PATCH v2] f2fs:fix missing space reclamation during the
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

Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>
---
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
