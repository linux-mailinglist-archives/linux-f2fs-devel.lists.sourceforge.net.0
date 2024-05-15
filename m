Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CEE548C62B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 15 May 2024 10:25:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s79ws-0005BH-Fp;
	Wed, 15 May 2024 08:25:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1s79wr-0005BA-HP
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 08:25:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=eLb19zrwrtWxdUekpCcCFsMvmSfizVpyDVNcEFOfkzo=; b=Djgzw3dDLbBSbboYehvWbiDoJU
 mNwhixDFj5ctWaXnxytaC4XhF8vMlw4UsjG0uj9vswD1QwkuObPb63a5+kw/WYozBVw4U+qyUBJNE
 uPZ8xIkPp2QExgFIOl9FbOxIwEj8HKGR29OWnQNMVIZevlHh/Tn3OT9jYb32HVFxPGQ4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=eLb19zrwrtWxdUekpCcCFsMvmSfizVpyDVNcEFOfkzo=; b=Q
 8uFftLhi3xo2BQ1gH4a/g1D0uWlgIJ/s5KZ5TRKLBIRrA2N2CO/4+7XyN0Zu210ZEV0Gy224pw1RN
 79tNTP7MbrsTmPWqjoiGqaOj1oJk9xjVEn+7xJC38b3jODYex3AHHM7PxEUL+/3GiRGTav93AzBHc
 DxmGs1p4m/f5WmwQ=;
Received: from mail-eastasiaazon11011004.outbound.protection.outlook.com
 ([52.101.128.4] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s79wq-0006LG-UU for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 15 May 2024 08:25:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=aXfrBBOPbRIOPGnIvHz19cTHyDnyPcevDDGT6fXflSp1fCyuTiZQWCs7A936wnCeNG5bB0XM10HjP/97xX/y9xotl6fSHpS8fnQhm/fs8+dLYJ3jhJAC2A/qUCEQZ2qPfpIo15LmZZARsPKVzGBlXkXwoXGZJKFrtYaq3Tvfc9LZhN46DOY2+9gfxHijPrbmG07a1OHX93IlzX1R7y/drJkKn/2p8QNNWNbr+sVRyj579fJT2q+KoEMB6VQXbxN/67gndZ7eVn+3xAHfW+mNUB3dayhLZHOdiGr2+c8FO+rfLGd8AEEQyRXQmP4FlCcz5xA3Xgk5RIKxglJiouUkLQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=eLb19zrwrtWxdUekpCcCFsMvmSfizVpyDVNcEFOfkzo=;
 b=FRd/8n4Z7uJ04gxVg4SaEVH2W609fdD6qmvzk3xZxK0Dv/QDXAVhKhpnubNeA/nTZV5lK8x066XLRRjLZwEZ57rjUj6cTNfPKQizgNb6idLB0S3DqgUp5iBABz7bewAyAtepA0lnN+NQIipe87CcSYRxOhUfJcsStfvg0Fiy+t2Zey/p1pnuViW09iOEk+ytqtDt3cLjcm0912W/UsIgXefgfTO71wZpBZwyFFgUzYIGwgXIfrjFnMq8q01vdrkdDqlpqPFbCXsJP7bAMvG0rdg5hgiY8Dh0yMSOmCC3CO/qw2Pwug3rznIaCTbUSpc3s95lv6dB6NnVvLlSKZqnfQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=eLb19zrwrtWxdUekpCcCFsMvmSfizVpyDVNcEFOfkzo=;
 b=pagpeMSf+Axjjx2vdBi9vc7xA6Vyfv5IwTJFadYldMmSzmSyWRIC47+1mQJkUkiLGIU86DWRw7KRwAY0u3kWfOHicSNN7oeq0Vmc4Ckqkzc8Dp0lUMopWLdGM6ddRgQPnrBoGJbv0r8owhNLOk4pmO3bB9Op50zNe924k4VrE0tn2wuLF8h3nVpeEdbH+MzBrOcjAjtvunUbPqi1gygtgjlmZu/ts3JV7cQa3bZFwciYF5j4GcnWYrwwX6Ou43PkoSChn53fiLuKj4dVysecU3XLDreaqY0D52j4f20IQowhelLmDr/mJMynQOrniZ2WOf0hQuTvpzjyK82CUVyKEA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB6034.apcprd06.prod.outlook.com (2603:1096:101:d8::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7587.27; Wed, 15 May
 2024 08:25:02 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%6]) with mapi id 15.20.7544.052; Wed, 15 May 2024
 08:25:02 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed, 15 May 2024 16:24:33 +0800
Message-Id: <20240515082433.24411-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR04CA0177.apcprd04.prod.outlook.com
 (2603:1096:4:14::15) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB6034:EE_
X-MS-Office365-Filtering-Correlation-Id: 47b4a625-fba0-4604-3d66-08dc74b8845b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|366007|376005|1800799015|52116005|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?WhdEF8XT/F9of28aE5XF/cKiZl9CfFaqK6LuxemC7vosozfWPOv8GpaiNRHT?=
 =?us-ascii?Q?oilL/uION7q2t94PW10DFQudTRiDG2NfczhP8B22pxzzO+qojAZZU2C2zVMy?=
 =?us-ascii?Q?gSFNA2IITHF59QJJ04XfTC5lxTrPvNVJWqEsJP/WwtSih++h2WDB4GgaT/QH?=
 =?us-ascii?Q?7NczsHx46CA2ZPJDCs1/ZRmPhpMEP1ZgHQYmgNk7dYo4DBmbtwieZDudujiV?=
 =?us-ascii?Q?h0kVp7TnHJW6PTkJCuBvZTaqLwFgn6qSkFU536Iozq2ZVQT340k8M8BbRlhS?=
 =?us-ascii?Q?AFmNUF+SyCqd7WrRkcBQzjSfjRzDS57zutpOR8Vu4xYB5YUHDQG0yKk6qbuj?=
 =?us-ascii?Q?ifvB2bEL9N8y8Jb0JzBIbDlIq0WMfgBDi0YEHDEVP/lXZfzW3Z4TBfNbociJ?=
 =?us-ascii?Q?vNb2EC1hpl+3xVy+7M3guPetAShANG5NRkIkDlyUYaT8lZO/kgoUfgcJIX0Z?=
 =?us-ascii?Q?dB2GUg9wNsmhUU8Jd46rw+ONkC0DOpm95nbHN1HsyxKXVVQPl8nhihXpRHOq?=
 =?us-ascii?Q?GoP7jx6vuxNyty1NI50F5vjgUT/riFsSawnUjVyinvnBSLCtOZ4B6WJudZMv?=
 =?us-ascii?Q?bpsdi5kuluYpaxXbeMRLcoufTB29HgAGm4u/C5RNoiLNYSNdEl6u2YUuCXYP?=
 =?us-ascii?Q?rL8GrBTsf7Yn4J/dwUx4WDHY2fk1fZqTXtc9A4LTXkYHaKGwVxHwhYcuY1Ia?=
 =?us-ascii?Q?RvqJ8JXNUfz8lujA6YyMfbmzq08mVpfBis96MpqvzeWj/xz+UL/HWGRuiXYW?=
 =?us-ascii?Q?YU8peyODDwelqQ1cseNylQNUEuXd2J/N7fROmruTCTLQ64KhxRvIMEu2jFDN?=
 =?us-ascii?Q?B5C728YMNd2lvUIDGcd+Nx2bMtITsqEnDdzn/NynX+Y2WQ8yvn7PwD5tt+pm?=
 =?us-ascii?Q?zch4/3/7gfT/VSein4VDLdsCXOLqjRefa3j2CLcPYcPtyrgl4WkE1Cv5QoTz?=
 =?us-ascii?Q?lu8NDWyZ5odvbT6jsPpIT+RKWwfzGy+X4yeio219Ey7YvilXojxZC3kT/Eul?=
 =?us-ascii?Q?xSH7iZ32yD7qiKym8aSJhsjRXRjTcZnQjcy/+HaHc6DRC5W7aCeBLf6Xzsen?=
 =?us-ascii?Q?2xYjebZstFidueipgisJwW5itT9xKB4XacEXm1JCM5LJFU8xlixvvdPUqtIc?=
 =?us-ascii?Q?JVCn+wxyOtIWquLINvddzB3qSo5AynM+ZQUvTFKk1uEEMaHa86XNkm0+4xrs?=
 =?us-ascii?Q?bvfjxNtAvfF9JNQr0j2m5eWAXbb5Qf7g+QaqnqHYBJ/uIjsm3n3GDRapEvmb?=
 =?us-ascii?Q?lKiVDADPwWlOY0BM9JAYXjLEwMStZj8YnQGHR019VECmn1lEouj3r6IoyiGV?=
 =?us-ascii?Q?iE3GxtH5YGxxRV2vkLTfmFZBNSUhqoRMGODUt2lkOjQVgg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(366007)(376005)(1800799015)(52116005)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GiSNvt+xHbh/neSpHfvhwOEReMNZk2m+E3Fq/xsSECyZuZJAmYnDYnd5Uyy+?=
 =?us-ascii?Q?qqIJcNALAGsfUATbUH8ozRDZdKEkTRqKGuZwlEUQVslKNP8bW/Aqcf8bGxYZ?=
 =?us-ascii?Q?NjyPmIn1Gm9oRdKiTbwLTMJUvucbG8Y7S9picD4Ik6WJiYPM49x1OmfV0Znz?=
 =?us-ascii?Q?o269q4xoaDLkyQYBMSClCgIoUi6N8KBXGBQUzzIqlirzeUvC3nkOX1GbW4Ap?=
 =?us-ascii?Q?vJij8f0Rc1TegBpUmWq7MJHdzdtaODbDESxh53JJQsg4dz7Cs+QYqa+E538y?=
 =?us-ascii?Q?iWRXvP0pkAAO0ipUR3vBOcmfeDHbPcAVEolX6CO3tEPw0F97SRuMsKp6ij2J?=
 =?us-ascii?Q?b2Yk7WeqXwOL3q2b1pzQWWTYM6a4E5LT0lI1DiftPcxcDAd+kwVlEu6Oa5Xb?=
 =?us-ascii?Q?peEhH4yGgkGPWeU+F+h7s82Cz3HC3+yoj54oCbJMO7CmKj3bR9hVzInMwlND?=
 =?us-ascii?Q?9R4EftC1vuzeuKQQ/Ffzf7e4EYehJ1Hn8DAEnLpb4GtGMjEUlBHPquGJ4DNb?=
 =?us-ascii?Q?KgPSoI+abYdEKwlW4T+aDa65N73n2Jzj75bxrFvdEiBOF7AXBTRMI11TQCfS?=
 =?us-ascii?Q?P3wSs+FniXUW0F2IkAwh7j9UbmkTD2jsXO7Zc8Or/3Ex82LQQZ8m4HumuKOw?=
 =?us-ascii?Q?ZrvxJCHJSWFC5tUpA0lrhItqQvkl1nYT95RTe9TW8zaCGjed24zbEq4Y7/jc?=
 =?us-ascii?Q?wj5SZ1CrFS5hZI5jpNd96sh3NzoN17gucBmrui4PiCsZyasTQ7tban0vrv46?=
 =?us-ascii?Q?EYyI30gcxUU9bK9TLfRevWzEsc0wg41BEFfvW1K+YUDEfltlVnKWJnFphbDo?=
 =?us-ascii?Q?yXLonj66H0wbW/7NjuSE+aSQ89M4kYn8alPQ4V2kWT6/Oh4zjJf36Pj2fN5y?=
 =?us-ascii?Q?ZohBa7hnCBC5Tw8iVCG8x0tygqvy7snAL0U2N2+jA0+6oaitefiAml21pf2m?=
 =?us-ascii?Q?7nn5qNq0bLJyfFr9mb+5BlAMoKf/oPnzZtODZ7xZOoSTc2jolboAYP0IjyN3?=
 =?us-ascii?Q?yEJQ++ApaDLTCAdvNjY9qwvVRdGxaQ91QgZ+GBWVYDHdSfGBB8atlNJ4sejQ?=
 =?us-ascii?Q?Bf/1e5eVlkfwK1+gzRwBqYQILySqZsvvcdRt4llBzFs/UijwAhdwaNKxzkRk?=
 =?us-ascii?Q?QYf1gdbTzA3jw07hrdlvGH5wTj9a9FTRGPKNvxxgDvt1ztuD5uHlDPFiw4jn?=
 =?us-ascii?Q?4dye8gfbQj2wHJz7XvQIjJ87ckoNS/bhcz2ovVjXO+pTbcycykd3X1bzVPbx?=
 =?us-ascii?Q?BlHcHo7X3uJ4QYhkuvKt2relLjvgLtkjUlevBd+paSoTCUGbYn8vrXaYshs4?=
 =?us-ascii?Q?dtGtWPjUGC+ZiwNDnYR4t+aowIc1S6TicKMMs/uVBtB1GKHxi9US0VTnt51r?=
 =?us-ascii?Q?K3LvGvyDMRUmPryb9/MpUisHUwouo80Enagb9OBnUBoVz0dppmEWDHjqjG+9?=
 =?us-ascii?Q?dLfZN4MoVkSKgk1zCK9nb8vQhP7nrGA7kNC0m64ukZV+xQfrAKyylTMwJRev?=
 =?us-ascii?Q?TBPgQGpiMR26N6gGuBjBhEaAVD9G/PvX5Tlz0pWiFTFdqqfBotwF5eLMevGu?=
 =?us-ascii?Q?Z3BSJhhZeH1dCHfZqO8JCl65UIweTSGZ/SjfLsVK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 47b4a625-fba0-4604-3d66-08dc74b8845b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 May 2024 08:25:02.5512 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: o4srkLdgiOKQcPI1wow6M1irGtRSV4ZFBdiqx/ZtgImQuJxv46cs2zIUT2XJCov6YQ1rzEoymc0YlnfdkjDB+Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6034
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, when we allocating a swap file on zone UFS, this
 file will created on conventional UFS. If the swap file size is not aligned
 with the zone size, the last extent will enter f2fs_migrate_bloc [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.4 listed in wl.mailspike.net]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [52.101.128.4 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1s79wq-0006LG-UU
Subject: [f2fs-dev] [PATCH] f2fs:modify the entering condition for
 f2fs_migrate_blocks()
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
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, when we allocating a swap file on zone UFS, this file will
created on conventional UFS. If the swap file size is not aligned with the
zone size, the last extent will enter f2fs_migrate_blocks(), resulting in
significant additional I/O overhead and prolonged lock occupancy. In most
cases, this is unnecessary, because on Conventional UFS, as long as the
start block of the swap file is aligned with zone, it is sequentially
aligned.To circumvent this issue, we have altered the conditions for
entering f2fs_migrate_blocks(). Now, if the start block of the last extent
is aligned with the start of zone, we avoids entering
f2fs_migrate_blocks().

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 23 +++++++++++++++++++++--
 1 file changed, 21 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 50ceb25b3..4d58fb6c2 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3925,10 +3925,12 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	block_t pblock;
 	block_t lowest_pblock = -1;
 	block_t highest_pblock = 0;
+	block_t blk_start;
 	int nr_extents = 0;
 	unsigned int nr_pblocks;
 	unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
 	unsigned int not_aligned = 0;
+	unsigned int cur_sec;
 	int ret = 0;
 
 	/*
@@ -3965,23 +3967,39 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		pblock = map.m_pblk;
 		nr_pblocks = map.m_len;
 
-		if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
+		blk_start = pblock - SM_I(sbi)->main_blkaddr;
+
+		if (blk_start % blks_per_sec ||
 				nr_pblocks % blks_per_sec ||
 				!f2fs_valid_pinned_area(sbi, pblock)) {
 			bool last_extent = false;
 
 			not_aligned++;
 
+			cur_sec = (blk_start + nr_pblocks) / BLKS_PER_SEC(sbi);
 			nr_pblocks = roundup(nr_pblocks, blks_per_sec);
-			if (cur_lblock + nr_pblocks > sis->max)
+			if (cur_lblock + nr_pblocks > sis->max) {
 				nr_pblocks -= blks_per_sec;
 
+				/* the start address is aligned to section */
+				if (!(blk_start % blks_per_sec))
+					last_extent = true;
+			}
+
 			/* this extent is last one */
 			if (!nr_pblocks) {
 				nr_pblocks = last_lblock - cur_lblock;
 				last_extent = true;
 			}
 
+			/*
+			 * the last extent which located on conventional UFS doesn't
+			 * need migrate
+			 */
+			if (last_extent && f2fs_sb_has_blkzoned(sbi) &&
+				cur_sec < GET_SEC_FROM_SEG(sbi, first_zoned_segno(sbi)))
+				goto next;
+
 			ret = f2fs_migrate_blocks(inode, cur_lblock,
 							nr_pblocks);
 			if (ret) {
@@ -3994,6 +4012,7 @@ static int check_swap_activate(struct swap_info_struct *sis,
 				goto retry;
 		}
 
+next:
 		if (cur_lblock + nr_pblocks >= sis->max)
 			nr_pblocks = sis->max - cur_lblock;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
