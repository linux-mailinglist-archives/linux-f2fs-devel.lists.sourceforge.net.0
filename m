Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AB4839B4942
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4n-00040W-Iq;
	Tue, 29 Oct 2024 12:11:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4k-00040A-6L
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YuEjuxLobaTvyfQkV99PVdX4wNmQANwWNPnrhHLxbLk=; b=WxtgNufLLnsS9bx5wS8A0+apX4
 /jYc9otgxTOi3nwg/DQtKrPwHf/LCQLvt4JnaBGMrv0fm4S8PMOma5vY9oEBknPeux/rat5Rx0Gns
 YG3/NUNIvMCZDmjauBoepW1XuleBtTMGw9XCcZyW02pXeO5KsBkLelrtcfD0sTKp7vV4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YuEjuxLobaTvyfQkV99PVdX4wNmQANwWNPnrhHLxbLk=; b=U5UqfTwws7qQur0jSkDSHf0WHt
 qNeYJ1x1u+JDd9/0z+m7MIZ1u0amNsU9Y6LEHOYy6Etv5CA2OIEr0GsRTI5fGzt4NQc/3JTizt3iT
 ozUNGVhIy7NftVcU5fcZ+oKb+MiuGOoxJs5uNe1seeSSZ+piBDgrTfJIlRABRNxi5HA4=;
Received: from mail-eastasiaazon11010001.outbound.protection.outlook.com
 ([52.101.128.1] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4k-0007RS-6G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Kcx/bF3rL/n7YKdoCvyOQmpY9rcpUAI9YFbPDAiueddUkwPybptIRY0+P7XEdySAwxBQECz4Dfk7ATGELX5+FaODHARRpywMrA2InFl08Jut0ffQpV6A+e4HKUQlfDpgoDH6aJ1rd9x5/7tzRM4khxnFWh5sVezROlzJU1V4ywGOLgVd9tkw/1qHr4P9mAsgmPvdwg35ex0izTgVdRD9/cLSq/bLlq7wViV0msFhVtYKKbeDPCZkwgPoIA18X2N7m/7pPUt8kjUG+UXRL6bTWDmHGXnEZXtG5AzwRzisjbFD5K/DcoHoc1Xa4e/PG9f7RDfbWJf3DTYKFjG5xkZBUQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YuEjuxLobaTvyfQkV99PVdX4wNmQANwWNPnrhHLxbLk=;
 b=Ks465ZNCv3lq99ToqZurk9MR5K1ZgNCBDqoPLeZvuj8zD8CYUUZBpXsCtWpjQI8Yqe1z8HmmWbSm8k4MPtXVu+mU5ArCMkbw8pTCUyz7wssU1wdIJqgGPTtJhE68kGxcE4aWDYaMz4MFGI97DDVWyQFBXaxfZY/AArcQAUDtg4nqdbKqMONQEbYSdf2L6iVmTilM0TVwZXHGY/ZioCNli0Zy17Gpx7Fcss/NvyYmSdbzky1EN6kldcY+Ym78XCW8t7xyuH3rMfmieopOvmiG692yJa+HXRi1zCADuWaGv+iRAHczokM2iC0Y8l8lEl2L5hmbkqtDJazMi1HP6ZAk6Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YuEjuxLobaTvyfQkV99PVdX4wNmQANwWNPnrhHLxbLk=;
 b=EQG0KwqDPppytQ/akpTN9KzZ+7tQm9DJFVgktiuAlZcPMXNgV3VuQPjt/uNxto0fVISxB1fCtQULVwlAxrEZUBP605az4MlkzhPRjYaP0U+zMdyzN4N/UQpqcpQPD/s/Qbabnwjt6ipLbJxyO3lsCP1IRYnrd5VdvTq5bHOsgq0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by KL1PR02MB7877.apcprd02.prod.outlook.com (2603:1096:820:13e::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.28; Tue, 29 Oct
 2024 12:11:40 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:40 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:43 +0800
Message-Id: <20241029120956.4186731-12-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|KL1PR02MB7877:EE_
X-MS-Office365-Filtering-Correlation-Id: ea0c7792-ad61-4d1e-0fad-08dcf812d892
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+4sCJg6J01INyejJGz/1JgAToJc/mVBaN3UR4rwGc+6Hru01krvSCHTXetd5?=
 =?us-ascii?Q?VPRXt9OGP4b8C5JI3J+YXrjD4OqYFKQUDh4HzYKmbRxdccblBxmK1Q5a+yGl?=
 =?us-ascii?Q?DTLwLyaWoux9DPrCQrlqD40datQkgr+/m7N+4SchBuhmKINvDmhf/C6zoOzy?=
 =?us-ascii?Q?F8PgnGYB9g4wGiQI9YJPMu7z39naS8NtJWlbKvHHKxOMBgO3RsQbDwIKX5D+?=
 =?us-ascii?Q?4UP9OW+7ap2ufH3LlARJ4jfpRdgtDwGYQ0FMS7T4UfAIJCrNOFm7iDhzd5eK?=
 =?us-ascii?Q?mxz2HNuzgPNvvy7EhqvCtQ+azytzeMaIFWIdvmZFiZEcJSso8vZsqjKAAEJt?=
 =?us-ascii?Q?cJIDNbHiu46NK9K8rt9+1rj2NpiyOmnlCXOuBvcl1hkhzM/0Xp3s4cb3F9kW?=
 =?us-ascii?Q?TRurv3uYxLzZOqK7fm79ZO806sIDxy2i7w3odFIDGAddNpvFB0Lq1aeSxx7j?=
 =?us-ascii?Q?IeydKkx78QYOXk2mRxIWkxIBR8pNJ7jgjy+QdguCDz+hAlqXXOmKgowFVcbN?=
 =?us-ascii?Q?pKpv/D0oJ0rF867/HXfGqHJL9m6xz4N++YLXb8QSKmYGImJxlefUd6H5gdPY?=
 =?us-ascii?Q?UROIwTpfa35crgC9uS4foap+TOfz81q/1oraM3xg9ZEmYNVSqaz9r5dCbsoQ?=
 =?us-ascii?Q?NiYdXSgEO4gsSqPnqd1AT1GtK+oV9wyXKComjxlHkxPjNQaGmtqjoc5w6kh3?=
 =?us-ascii?Q?qCfYrIOJRpBQhLepdkepbQ1nQ9aFkoRJOstQkGre8F3BKMg9/7lDqIfzoBMD?=
 =?us-ascii?Q?+HRpMWgrbMKlp6AKztKzW0GzA0PeQNzlKQZNXPpC/prOgVBNHu9czxQk/j00?=
 =?us-ascii?Q?JHOnvLuQtVd8kCt+5Otb3A9usIMEcaeD14NzYcD233vztDdUUX5yjhecT/gp?=
 =?us-ascii?Q?GSCJLkACf1Wpq3FZEgvxV9rMirC+nj78D+ODKXa1LZxwsB9EC1tNQWeK7JbP?=
 =?us-ascii?Q?Djh4OWskAEqTpRA5ziJJATxNAURd7ZLMnW0iXNz9mQQYG5j/H5yTxzm49RBj?=
 =?us-ascii?Q?WE2C5KtXRj0WGJRh6MqfmXIZ0Totc1zTUp2IpevklyIT8flyy/LSca396YH1?=
 =?us-ascii?Q?B+1w4nEk5x5lpzIq/y0ba4E4n1oTNWVfY54fivDxDMVT15WHZ4YHhLi+DnUw?=
 =?us-ascii?Q?hpHOEoa9vWwqRaw8UEJ7mwelSpn5xICVLMjPMvptUjPtrOX8CsaMw1ZjdvcS?=
 =?us-ascii?Q?XhGTKllXBGTWZe9+5R4uJDdZ4yMW5rgXcmzrQYzrykD7BfGz5QQmR+EURum+?=
 =?us-ascii?Q?O7D1lRpNdH1QCWEUpn4bqLH4RcRPyfA8PBSe99RgsvZCZIbEvDFoxjFWtJk8?=
 =?us-ascii?Q?UhzPxdBn6oL2XAPJdEjvNtamp15thYKlyKgDEz/eZQvDVoLlGjh79tnrjUB6?=
 =?us-ascii?Q?raL64QQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?fkrrdV1IpILxBICzviDpl6dfNSnieD7XqogKOmKWK466QM6qbDM6ou/+WFe+?=
 =?us-ascii?Q?+TTUl5XK8VtDZDQSOEV4pgDhqtD7UpU3HfB2AikT76AL+fwGheUCJytGvBDU?=
 =?us-ascii?Q?sSlMPKq/FLLk86XHIUieQxaVvdhnuCK5wOx0tCUEYQ5jx4tI6xuRmncPlFc9?=
 =?us-ascii?Q?yBNtp56/oQaGefSLD6ryYXWQEBH68HDNU7yyLPkbZUSwwUyv3xPtaLhNYIzF?=
 =?us-ascii?Q?0XQM/1MDKk8boTBzEDlB55Y52AMD2f/+adMQaU+T69LfauLBBj19HFWSxxRK?=
 =?us-ascii?Q?bjRaTy+7GQV0rTxyqAM0eUDoHzQTsuyqhKkH1ltaoofIciMrqDubad9cIEId?=
 =?us-ascii?Q?m+NvLnYF/mbwr7yBgKMmJ6pqN5g2bAP6pQ0+qoUOHVOUqSKyDFeEMK1r5+pA?=
 =?us-ascii?Q?a+qNC0UJX1CZfSqug1af7OCE/SsV7+CsSalgE3I/d3/W76OCFTP9ujgyJWsF?=
 =?us-ascii?Q?4tnkLXeaLGPg5/Cw8S6yDsNIE3xVZRqZuGkAZKV5l6JAdDxC6EjfapceM/p4?=
 =?us-ascii?Q?jYEUs+NEm1xPsB7ZnEiG7Xs+htjx8wUzDZ6FV6zU4MJZJGycH90GHGpg+KQ6?=
 =?us-ascii?Q?Ir3p7c0QKVA9qnWUqr9PTk/n5OUt06VTMEZt9zVTbHC6q7gd/TJphaN/s3tB?=
 =?us-ascii?Q?evXvHv5DfHULJdD1bWWOkz4OWgp0yiP3TQ3BFNEO+fTUy45KYXg7v/pMHKoh?=
 =?us-ascii?Q?XvuZgM9WJoBiBthSfisSAKQmZXoWBpCpBRNdRPUtmBETJSpi8tIsaBr7Z9Aw?=
 =?us-ascii?Q?nZ/u1SPdYFxuHatrS4NevHOCdedGiMDVKI82hWw+jJf3Qeutrew/Nn8ZJasD?=
 =?us-ascii?Q?+jS3b5CziTksGlB0Nk4Kp2/MoqwqsgkkMfpHw5s7Qa5tioPboxL+rP3RCdlK?=
 =?us-ascii?Q?RY6qPNrmamDqDu9QybPUThV/Vl8naFl3BJrez5hwLweohpqQM4LusoSlL55t?=
 =?us-ascii?Q?b/J+wmnZ+KFhEruRQriEEo0JmRmmw8G35+qdh51zOYF/UAht52KYkukB14wK?=
 =?us-ascii?Q?rOfbHLy//gP92SFvZRiWIy/5jacQ6fc1gH0CLWSSCgRuog6zCCSliSST/bbO?=
 =?us-ascii?Q?PQLm4yEU+QNwgqxalzPqynVNy/a41rBv2rSmw5fPi9C4dkpSm9bzA/E7Y5jD?=
 =?us-ascii?Q?VWML25DGvj/x29LCWS+/xbEkbQ3El3y+rBIaRUmzmD/J99h3q/Ghhy7bosmG?=
 =?us-ascii?Q?TM5ZmYD82oItoJrA/bk7Fkez7rMf35nUSqGyi9yE0DQejGxh74TBzS9av3Jy?=
 =?us-ascii?Q?9YMXrkJqtqXGpaHRVMpLxKmoJREKS78I7tDQZ3Q/AL4ITWXAZt5ibe4ijsj1?=
 =?us-ascii?Q?FxM7P6k+OrAmFI7SvBjEpUP3wNkJNOlBtk5qtBWCd7YXGXkeKz8yXjBJQpzr?=
 =?us-ascii?Q?KIgfcln/sOxTzz/SJ1czAYsn5G9pkdcuY3N6och+9bKk0QT3vEbnzLXmqGOY?=
 =?us-ascii?Q?ztJ/6UXmWkTntQ53D9iM4B7Wx1riMVACB2cNokbYLoIEATwcT1+sLJVM8jSH?=
 =?us-ascii?Q?/xLvEqzcdg14NS8buEGy9Erd00zmBGYXT9YkH8X2cg8lGLVKJBNc5AX+RKPN?=
 =?us-ascii?Q?33C2etOEc5qdVCDmgumF3FnwKI1URxaWYc8FHuGI?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ea0c7792-ad61-4d1e-0fad-08dcf812d892
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:40.8026 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: emY8ygYevCEbrY01mgBrYsKZI52u3RkQaT5YdYR62TXv9BpLV4mKIdrYLy0tOfM3MpmdCydftmZBkaWaU5h0Vw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB7877
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_cp_bad_crc/README
 | 5 ++++ tests/f_cp_bad_crc/expect.in | 22 +++++++++++++++++
 tests/f_cp_bad_crc/script
 | 46 +++++++++++++++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.1 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4k-0007RS-6G
Subject: [f2fs-dev] [RFC PATCH 11/24] tests: add fsck testcase of fixing cp
 crc
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_cp_bad_crc/README    |  5 ++++
 tests/f_cp_bad_crc/expect.in | 22 +++++++++++++++++
 tests/f_cp_bad_crc/script    | 46 ++++++++++++++++++++++++++++++++++++
 3 files changed, 73 insertions(+)
 create mode 100644 tests/f_cp_bad_crc/README
 create mode 100644 tests/f_cp_bad_crc/expect.in
 create mode 100644 tests/f_cp_bad_crc/script

diff --git a/tests/f_cp_bad_crc/README b/tests/f_cp_bad_crc/README
new file mode 100644
index 000000000000..250ece3f8b5a
--- /dev/null
+++ b/tests/f_cp_bad_crc/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. create a new file
+3. inject crc in current cp with value 0x12345
+4. fsck fixes bad cp by copying backup cp
+5. compare cp1 version with cp2 version, both cp should have the same version
diff --git a/tests/f_cp_bad_crc/expect.in b/tests/f_cp_bad_crc/expect.in
new file mode 100644
index 000000000000..f21fecd2ae17
--- /dev/null
+++ b/tests/f_cp_bad_crc/expect.in
@@ -0,0 +1,22 @@
+Info: Automatic fix mode enabled.
+	Invalid CP CRC: offset:_OFFS_, crc:0x12345, calc:_CRC_
+Info: checkpoint state = x :  nat_bits crc fsck compacted_summary unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+
+Info: Automatic fix mode enabled.
+Info: checkpoint state = x :  nat_bits unmount
+Info: No error was reported
diff --git a/tests/f_cp_bad_crc/script b/tests/f_cp_bad_crc/script
new file mode 100644
index 000000000000..5ef689c33ebe
--- /dev/null
+++ b/tests/f_cp_bad_crc/script
@@ -0,0 +1,46 @@
+#!/bin/bash
+
+DESC="current cp with invalid crc"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+touch $TESTDIR/mntdir/testfile
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+offs=`get_cp checksum_offset`
+crc=`get_cp crc`
+
+echo "crc:$crc offs:$offs" >> $LOG
+
+$INJECT --cp 0 --mb crc --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -a $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -a $META >> $OUT 2>&1
+
+cp1_ver=`$INJECT --cp 1 --mb checkpoint_ver --val 0 --dry-run $META | grep "inject checkpoint_ver of cp" | awk '{print $(NF-2)}'`
+cp2_ver=`$INJECT --cp 2 --mb checkpoint_ver --val 0 --dry-run $META | grep "inject checkpoint_ver of cp" | awk '{print $(NF-2)}'`
+if [ $(($cp1_ver)) -ne $(($cp2_ver)) ]; then
+	echo "cp1_ver: $cp1_ver" >> $OUT
+	echo "cp2_ver: $cp2_ver" >> $OUT
+fi
+cat $OUT >> $LOG
+
+CRC=`printf "0x%x" $crc`
+sed "s/_CRC_/$CRC/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_OFFS_/$offs/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
