Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 983D49697EE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:55:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPJq-00011h-2g;
	Tue, 03 Sep 2024 08:55:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPJk-00011C-6X
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:55:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=; b=YcDQewBSFoUWeVFXNNvjnGCykB
 G22Dg3ZvEUvp/XTVh1b8r74+nuzHjhRgBVvjjF+fGeNMZb4criJwFORMb5Y9nRsgdmkFrZg2ZdFeb
 +ZsUzmzb4xTsXPOlVZ5OU75oVmCmewV6O4d5CY11h5ObweH8Tr7kCJWkzFbDBOaAZqoU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=; b=iytMo5eiQQtojH3jj+Au1m1BQa
 bgEYZSKe/U7+cw2PrsS1B8r5J/yAUSVLnjPR2g75j3/3gso4aE7ugcf2Py1YD4GYZffurjHFUOWph
 WFh02TFaaIQBVP3Wm/27xV5ybiGzUeriW+r9GuTX+5zfJ6mpiisXIvNYrm7L32KZhap8=;
Received: from mail-sgaapc01on2052.outbound.protection.outlook.com
 ([40.107.215.52] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPJj-0001R4-0E for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:55:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=eXxZ9o+EJWPK7oQ+YJIpQymhwq/fjP2epwg+Icp/f/HZAw6T71CHsnQuO4T303Y/hB22bo7vdmj9vm/ytRKZpn38O3oBmydVHpCrI1FdARoBcZ1MtEdBCns0Dbgo+UzeH7xZ3hpOtieqoq4HHt8RwSx7CRAiAob0hOUcX1ljemEjL/ecUmNv8IP2R/kdmaQ3wRL1ZdeTWzU7zUkr+VobV0zARWK4nz+yytNTlXXXbVIVm3/mD+cEivcvXN83ru5fCTJVIxfPOSqNPOiIarr4lQG0wGre5Qq/lJs6K9Ra6b3Blb4OerC24BbxPtH+jud4X/x/ROrzBay/IdhKJJvAYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=;
 b=HfKoMX1jaigEPyiCDyRCn0j6vBvdYKzK7PUczSZFRsoLYEPRG/jV80Y/y1KjXrtBDL85NtfJk7NItBqErY7vL1luDVf5CEJ2TLk92izlX2YdSRgg4ytGOeeLl89rJ4JnM5NsZmsLQ2vZKf+wvtRqaVI4P/uEnOThrfq6Hagr50C+q2dNwzTsWem5tGjrD3pVOZR2CUtYk1+Ipfh3NA6/zRj/r5SrH8W1hqR3l3f45SfFU8QlDvXdhv0nEFQCr6MbWvIFxeScdJSft8VSuXGbrMetWHVdJhow7mJy+37ISJlhULPm8FbMtstC/5CS33+vBRPrvd6l4Z8mwnwU3hArOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jKRdl5s09iCG/1hRn+pGFaA9OVaf3V4M//GwCRvnKxk=;
 b=Rr3jGNy2rxhmeqva3k0yr4pwtPi0+2senbJgiRtHOI/tjuGI+9xQzcv9SZk46210baoJvS4PoHogvEXNY+aQa0Tr1ZY1eV06YJrdJ5G1yb6Nu77RwVb1VUILalUP2IBAA74JlIyjSU8AaeYVkCsx+caf7Odatx4zIbQ4ugUAJeMhMNZX5SEGSrnKrEL+ohn/b7Fzm80HdTFGrjGgLxcDFAjUzERUeaqloyweBfY/0S1KV1m0h8dG4K14E070o8FvLNLWK77HfQ8ER6G1t9YyjtUtkzDgtXhkZdBl28vGKP9JlWIxr6uvMTDpi7nD7urYcWtjM/B6PvUAtHoJkvUbSQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:49 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:49 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:47 -0600
Message-Id: <395c6a887a35a5e3d396cf002914d236a288b235.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ead4d76-14ec-48ab-2783-08dccbf41c8d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IDqs7k9p7qWkg82VOi3yWha2PauXCmTe6U1BAnpdfq6uRkdzYQSOuMOLc+Wp?=
 =?us-ascii?Q?jLIrqsF/bYrSyYfk0pjvcMbePXoT1pD7TTrj/QbwANQfyenGsQfft5voDh8G?=
 =?us-ascii?Q?a2usqo6CkFfiJqdzPjwsAib6FOyvY853b+yQ01dQtyrgxKpHMe9NCqVPfxdL?=
 =?us-ascii?Q?FcI2nMX54PkZWxP/cnO90v0K0dBxe1tm0KvlnndcDqfXxZqPM4e7vvRwBKpv?=
 =?us-ascii?Q?X73nN5d8af+bvtDeFalITgdWgRZECwMCf2uxvaXhD4BSai9lJr5U9JUh6KW9?=
 =?us-ascii?Q?C83bEWvdsP9cfQmUrKs+ogU+bxemhVFdhf1I1Otihf6upME+yzTJGKPQVynt?=
 =?us-ascii?Q?ujRDakEK0Q36JZC9JB2yOmvUIlfK+R/ZCcYQjuqk2AZa4Z5tXahpMyD0Th5o?=
 =?us-ascii?Q?8iY64jmgbWua/IuU5g5tt2Iru+fcww8xydICjdTfpr1Ug+Hx6PsJmYdAwSi8?=
 =?us-ascii?Q?eFhrI0f5M4F0L+YhOUqFZf6W623jawRNCM+LQ4x+fk6IodeZ/Wom+Pz6dVM1?=
 =?us-ascii?Q?+d7HwxqW8mEi3vLV88Ifu8C8+h9wxM9aSkf8Vn/+hn4jXTdBMlt7UcLncU7g?=
 =?us-ascii?Q?FbSsSLqr65S87zjFtvu7a0hhJSFZTKzdY2och1KMG4A982LsKEmvR5Aw/a5r?=
 =?us-ascii?Q?zaCK2fh1N1tI+oyH9lfZv7Fn28ztNf/fibB8YJGP3PBtHNmqFNwfb9EGARZB?=
 =?us-ascii?Q?31yCOwBrpbUU2M4iic5HClmYApCNJ3uSWBM8XFIBtm9fZCfTs+Q++wlS7Hfm?=
 =?us-ascii?Q?TONtJl8GKvDGXkw8sEI6tS7+i4sw9kQGNoUtyB45I4B9Dz7zjePtazF2eqT1?=
 =?us-ascii?Q?Bdk/HrzzKSCZ94OFxewfhg5zYZMrGZnP2F+GER/gkDbMQUkX0MejgwE2vuaR?=
 =?us-ascii?Q?MYfl/66ZgYab01i5hwT1tdotdMUN5kMWrKHU6IqZFWbrlFyB/IkWmRCCOB9p?=
 =?us-ascii?Q?+bCj0y9cFBaiBcuo5vu11p3vtm9wATgxCxcrBdqjHeoRQyX58+hpKyHP2Zqb?=
 =?us-ascii?Q?jYZKVCgpdOSQImxTL1h+lD27238mxtED1Fsl+klwsX42saw3o88G/+WDSz+T?=
 =?us-ascii?Q?hTo6HVh0wDifRQI/xsulkaIS04h0h2S4o9FCilcTyX9ENu2PcN2fOC2r+eOo?=
 =?us-ascii?Q?pQPfUZsGg3xLdveWdHPfJBjYyk82xkqY8Y1vFaKhvNnnynIcgfw/Lah3jzkb?=
 =?us-ascii?Q?WRVj/hjNyY+kKYgMzq+60TWBvE0aE3/QxnpYJ4DH2sNJHBNBNGB9OsE3K7+o?=
 =?us-ascii?Q?Aobyihnvaf797M1xE+TXkEoIbkDGKaaF9USkRfWiEr2G+Tf9J4/Hzu+BnADo?=
 =?us-ascii?Q?x11TKBOHpWoxwOrM9Y2F7rIDKN4XToOWNdvuwM51yPY/yTRm2r1zhYQ2yg77?=
 =?us-ascii?Q?OU6mc1XRAjPHRXo5R4I+M8ilVePghKIrrAAfvs14isUCM+txJw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zReNn32ph/2UO7QHVWw9ATNMIpb4wFT8sH1evRfWenxJE3ST9FvnyQ6uzlYq?=
 =?us-ascii?Q?X8wEqB1aiQynAJuEw0YkwoUtWeMyhDAEPBMsmm2lH9/gX8lRO/9AC52KBGD5?=
 =?us-ascii?Q?udV6HyRzejHUAYH81mEFw3u289XxZRq+pcZb/Mfg6ExD7kwNsXuI/q2c2hBB?=
 =?us-ascii?Q?EesYX2bH2y0jYEvoO6vK3H2fuzpfaFdwJSQiVByW41vy5LFemSDDrDLuqI+8?=
 =?us-ascii?Q?mqvk0GDq44wbaPN9NhWqdxAktyT1bk50uijIyPEHsWNYa4j4VwrLGejVugk1?=
 =?us-ascii?Q?M4npPqWATKrQeApqeIbt4JRCxQsKPscX71zwf+U9b+Bd32kmj0ZqPyRebHoR?=
 =?us-ascii?Q?YN3f2+TtDMWrbjVDp08ouopVvOptuORp3mCTbhLh+OWbJhhtx/mDhD4tmnXr?=
 =?us-ascii?Q?jOpJJB07jv4g4k/Wnhxg39JK5tcWyT7ZHWEbqYXtfPLS0z81m3YTqseN3rpf?=
 =?us-ascii?Q?A8Uwkn3isyWfl2UzOTkxJisCi4XzN50AkLPnS/VMvTxCyYyPc2cqx5Cwfa6M?=
 =?us-ascii?Q?v46NVaKIBAvOaa+HN4cPW7i/uwd9qSLqnRb5C3yjbaFdS/OuDwy60Qi9wsoB?=
 =?us-ascii?Q?JozrHYydVZnRIBNCLZKzcd1xmr2JoL5Fz4efEX/lgYRea+Y65jLdUzwAsByk?=
 =?us-ascii?Q?DT2oDoGwphLNpOfT6glcMdCU7UVtu7UOTJC+eFuNa7GIRRY2IeBxRtCdYEtJ?=
 =?us-ascii?Q?/AbWqLYZw1eRzneTldsIkalWO29hnM4Sm1+P00b07kLUCMZsC9sOkS94ry3S?=
 =?us-ascii?Q?+3iFmy7kPlzQaD8bb+Y5JqZHnDWfU3jTV1EFtRVJxIM0gUoS/jgsTtwUtQ3N?=
 =?us-ascii?Q?Eh6VtELci/L5LPnFv6djyu5+Oz5x6vBoqFs5gKSgbJbmhfHiNnSuXQJSndnt?=
 =?us-ascii?Q?skzp6Fry6Ec/5G1En39/Fp9a/BLQQp+0wwXoBAtnrfWjOazLmBIJp+2oU2+Q?=
 =?us-ascii?Q?OGhJenUaXBpzCoGR2eHFE4Lq/kn99NZB0T5WdEJXs6duh3M+OyZAA6QL/gRN?=
 =?us-ascii?Q?alRki+SA2EmPtXeeWLcskG/fBxpMf/6HCUPpp+pILhzw78mKlxmD6jsx5LDw?=
 =?us-ascii?Q?8BepCoV8Tvk0sFfgz9hhKYXrb/Olpo7a6YY7PKShHFWqxyRnUXOX8EuGGpT/?=
 =?us-ascii?Q?jx1ki35GzzbXaxbzE458OaaHtmRz9OVOwPiuGIdYvl6Tibp/vnJdDCG87JzS?=
 =?us-ascii?Q?WmvnSQKQZyBKCLZtdPweQiKWKrRRa34I+U/sZldjV+CpxWQthQQkWeQCsyIh?=
 =?us-ascii?Q?ifmlYQLkZIkQJPDzc1ew95p1u5osrJcJPxxAMDLy1gUNCpivubtIignGzNiV?=
 =?us-ascii?Q?CJTHW3rwQOWxv+mw57Xg6qpwqM34VIL0KeNvI3ZrnW83Bvq8lFgBRWMQrPke?=
 =?us-ascii?Q?HGn8rZckluFXZy9M3GqV+V8k+KHHWskmG25EmzHdfa6989G828JEpPTJ7FAj?=
 =?us-ascii?Q?Y9TpWIT7f6/fVn+LuVfX18Dc1sJee8MdH2/asxdOXBvawbhcUgNxtPz5+ukh?=
 =?us-ascii?Q?4NnfirGkc0/cVx76+b6heXeqttxWupx08LLTpEGFByx3WC7sXa2GelohONm3?=
 =?us-ascii?Q?9RiYz/EO4yyQ1SEn+j3aI9BFtIpxuq5BSTCiUq/C?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ead4d76-14ec-48ab-2783-08dccbf41c8d
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:49.2515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aC+AfFVNNqpEcEZAEHXppB49ePs7e1CW168XCrUZlSlT6cBS2TH2qZUlnmvsnfNdmvD7jMerepjf7Tl95aPqKQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs inline data is a special case of inline tail, we can
 expand inline tail based on inline data. If file tail can inline to inode
 block, not bother to pre-allocate block at write begin. When tail page writing
 back, inline it or normally write it if the tail is oversize. And when inode
 page writin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.52 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPJj-0001R4-0E
Subject: [f2fs-dev] [PATCH 03/13] f2fs: implement inline tail write &
 truncate
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As f2fs inline data is a special case of inline tail, we can expand
inline tail based on inline data.

If file tail can inline to inode block, not bother to pre-allocate block
at write begin. When tail page writing back, inline it or normally write
it if the tail is oversize.
And when inode page writing back, update inline data from tail page.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 30 ++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h   | 16 ++++++++++++++++
 fs/f2fs/file.c   | 10 ++++++++++
 fs/f2fs/inline.c | 38 +++++++++++++++++++++++++++++++-------
 fs/f2fs/node.c   |  6 +++++-
 5 files changed, 92 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6457e5bca9c9..cd13b5703228 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2776,6 +2776,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
 	unsigned offset = 0;
 	bool need_balance_fs = false;
+	bool need_clear_tail = false;
 	bool quota_inode = IS_NOQUOTA(inode);
 	int err = 0;
 	struct f2fs_io_info fio = {
@@ -2867,6 +2868,16 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 			goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode) && page->index == end_index) {
+		if (support_tail_inline(inode, i_size)) {
+			err = f2fs_write_inline_data(inode, page);
+			if (!err)
+				goto out;
+		} else {
+			need_clear_tail = true;
+		}
+	}
+
 	if (err == -EAGAIN) {
 		err = f2fs_do_write_data_page(&fio);
 		if (err == -EAGAIN) {
@@ -2889,6 +2900,11 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	if (err && err != -ENOENT)
 		goto redirty_out;
 
+	if (need_clear_tail) {
+		err = f2fs_clear_inline_tail(inode, false);
+		if (err)
+			goto redirty_out;
+	}
 out:
 	inode_dec_dirty_pages(inode);
 	if (err) {
@@ -3393,6 +3409,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
+	} else if (f2fs_has_inline_tail(inode)) {
+		if (!support_tail_inline(inode, pos + len)) {
+			f2fs_map_lock(sbi, flag);
+			locked = true;
+		}
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
 		f2fs_map_lock(sbi, flag);
 		locked = true;
@@ -3421,6 +3442,15 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode)) {
+		if (support_tail_inline(inode, pos + len)) {
+			f2fs_do_read_inline_data(page_folio(page), ipage);
+			if (inode->i_nlink)
+				set_page_private_inline(ipage);
+			goto out;
+		}
+	}
+
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
 		if (locked) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e02a6619b90a..2e0530b55e74 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3322,6 +3322,21 @@ static inline int f2fs_has_inline_dentry(struct inode *inode)
 	return is_inode_flag_set(inode, FI_INLINE_DENTRY);
 }
 
+static inline bool support_tail_inline(struct inode *inode, loff_t i_size)
+{
+	const pgoff_t tail_index = ((unsigned long long)i_size) >> PAGE_SHIFT;
+	unsigned long tail_len = i_size & (PAGE_SIZE - 1);
+
+	if (tail_index > COMPACT_ADDRS_PER_INODE)
+		return false;
+	if (!tail_len)
+		return false;
+	if (tail_len > MAX_INLINE_DATA(inode))
+		return false;
+
+	return true;
+}
+
 static inline int is_file(struct inode *inode, int type)
 {
 	return F2FS_I(inode)->i_advise & type;
@@ -4197,6 +4212,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
 int f2fs_convert_inline_inode(struct inode *inode);
+int f2fs_clear_inline_tail(struct inode *inode, bool force);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct page *page);
 int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 168f08507004..957d1ff55350 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -748,6 +748,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode) && f2fs_exist_data(inode))
+		f2fs_truncate_inline_inode(inode, ipage, 0);
+
 	set_new_dnode(&dn, inode, ipage, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
@@ -4703,6 +4706,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
+	if (f2fs_has_inline_tail(inode) &&
+			(pos + count > MAX_INLINE_TAIL(inode))) {
+		ret = f2fs_clear_inline_tail(inode, true);
+		if (ret)
+			return ret;
+	}
+
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index cca7d448e55c..2e63e9389fd7 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -102,6 +102,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 {
 	void *addr;
 
+	from = from & (PAGE_SIZE - 1);
 	if (from >= MAX_INLINE_DATA(inode))
 		return;
 
@@ -156,11 +157,12 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	};
 	struct node_info ni;
 	int dirty, err;
+	pgoff_t index = page->index;
 
 	if (!f2fs_exist_data(dn->inode))
 		goto clear_out;
 
-	err = f2fs_reserve_block(dn, 0);
+	err = f2fs_reserve_block(dn, index);
 	if (err)
 		return err;
 
@@ -176,8 +178,8 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	if (unlikely(dn->data_blkaddr != NEW_ADDR)) {
 		f2fs_put_dnode(dn);
 		set_sbi_flag(fio.sbi, SBI_NEED_FSCK);
-		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
-			  __func__, dn->inode->i_ino, dn->data_blkaddr);
+		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[%lu]:0x%x, run fsck to fix.",
+			  __func__, dn->inode->i_ino, index, dn->data_blkaddr);
 		f2fs_handle_error(fio.sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
 	}
@@ -210,10 +212,33 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
+	if (index >= COMPACT_ADDRS_PER_INODE)
+		clear_inode_flag(dn->inode, FI_INLINE_TAIL);
 	f2fs_put_dnode(dn);
 	return 0;
 }
 
+int f2fs_clear_inline_tail(struct inode *inode, bool force)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct page *ipage;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	f2fs_truncate_inline_inode(inode, ipage, 0);
+	clear_page_private_inline(ipage);
+
+	if (force || end_index >= COMPACT_ADDRS_PER_INODE)
+		clear_inode_flag(inode, FI_INLINE_TAIL);
+
+	f2fs_put_page(ipage, 1);
+	return 0;
+}
+
 int f2fs_convert_inline_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -263,20 +288,19 @@ int f2fs_convert_inline_inode(struct inode *inode)
 int f2fs_write_inline_data(struct inode *inode, struct page *page)
 {
 	struct dnode_of_data dn;
+	pgoff_t index = page->index;
 	int err;
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	err = f2fs_get_dnode_of_data(&dn, 0, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 	if (err)
 		return err;
 
-	if (!f2fs_has_inline_data(inode)) {
+	if (!f2fs_has_inline_data(inode) && !f2fs_has_inline_tail(inode)) {
 		f2fs_put_dnode(&dn);
 		return -EAGAIN;
 	}
 
-	f2fs_bug_on(F2FS_I_SB(inode), page->index);
-
 	f2fs_wait_on_page_writeback(dn.inode_page, NODE, true, true);
 	memcpy_from_page(inline_data_addr(inode, dn.inode_page),
 			 page, 0, MAX_INLINE_DATA(inode));
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b72ef96f7e33..5c45de7f60a1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1514,6 +1514,8 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	struct inode *inode;
 	struct page *page;
+	loff_t i_size;
+	pgoff_t end_index;
 	int ret;
 
 	/* should flush inline_data before evict_inode */
@@ -1521,7 +1523,9 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 	if (!inode)
 		return;
 
-	page = f2fs_pagecache_get_page(inode->i_mapping, 0,
+	i_size = i_size_read(inode);
+	end_index = i_size >> PAGE_SHIFT;
+	page = f2fs_pagecache_get_page(inode->i_mapping, end_index,
 					FGP_LOCK|FGP_NOWAIT, 0);
 	if (!page)
 		goto iput_out;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
