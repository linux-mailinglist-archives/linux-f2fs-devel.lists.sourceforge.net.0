Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AE75E91B4A6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:41 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tg-0004O6-3z;
	Fri, 28 Jun 2024 01:32:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0Tc-0004NX-C0
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=PnuvdXBVJf8McZte9KAupRPyQqftLHFApP3EVBqcxQE=; b=d3PSMLmc/Q+JF158N1KO6UtPA9
 koKOBOhO5lwG1MoH0FtJ4MyoHLoNLB66TgYngotyMW6L7nskUozHd2G8F3ZqL+mKG8wZ2PkshBrK8
 TE/WjmItsNM+eBzNlQBxvSpyY170rCq3yv8z+dyFU1kY5c9hoDlKiNujqa+Rgf9jK0Qg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=PnuvdXBVJf8McZte9KAupRPyQqftLHFApP3EVBqcxQE=; b=XLALsVahfU8XeUQKqWz5PsTgzj
 ZzT3SDdgS88C1CQjMGsihmY4mCjC8QhVF7frmYVKNmMf825e/Oq83OmmX00tleJWdT2eNrkd7S5Nf
 NfLr6A47y4YwYtR1nmE927gYgsucR0YbvxIl6GZpNlowZFrIwHE/nsBnroXeei/F3Dd0=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0Tc-0006JV-HX for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kTBjF91yZzmsBAnTBbYDo1kP1T+97/Yi5Rf+GvONT38c82m+MZSvoqbYWsnnCaeQf5JXRlAFdqOKUDXQ8G6XpzvFF+bwM+F9Em/39FJs9POZ0Apt+R1TuVFdUubo/O672tm+TB8Aj5ILL0QhUEyB7sNWABJxEfhoHcDXZNuDypUat24ME/eFlzSojbvR1y6yV66drBh/rQ2ZPUou+mSa/z6ETIS6OXvVROYXd2hPFXuMuJwtAkup4ACIS/uiDBDUOnCWKwBxDjrInw3pAJ9cub0sFZ/rG3ITjQ7ygCFN2yoX4DMfzQCdfG6jHCYLaGnzZP8+kyuDifpZd1Gz6eacMA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=PnuvdXBVJf8McZte9KAupRPyQqftLHFApP3EVBqcxQE=;
 b=jGOM70mXZSKu1cz1nQxg+nDDZx5YKEO5VN49CMERFueP04V1ilsaXvuRm+5KzqLjcUAo4AYYnV/KC1AVH+4zMLuQrX4Q0STMjol6MwaFLkwi4jiYN4zaDglauAvUXGGFsvh0YK2Ko2e8GFLai91LeiCegmC6+kJ1pnhfhxZ+oUT8WrXdTjbwqP7pSZXSzuAIa/TQIeSzK+ysaSNpRJLVkHrV+vTtDqV2PcQnnP/3uhyPJFKjr7+fex0ZTwlgv0D9Z9S9ZU7gzSY2g6kYZdSrcRrwqwjdEVDoKaLvyYQQgDCop4PwY3qf9/RdrhUeWWgGy0a2YGupt8/LR1zmqDjqbA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=PnuvdXBVJf8McZte9KAupRPyQqftLHFApP3EVBqcxQE=;
 b=K55vGB9ole6EGmkfiJvxe4f0wni9rorj8BaXNvByi5eGkdBrcsERrGeuTTsmsV5KNSPhDnezmCeAPbtbsgi1dCRo0KXvmNT3g1a101tGu2HZYDPrOEmVJfQ0NGLlrB4vyBwCp7MF3usKg3xK9LoJ88+SW/V86Ectf6yCOivACNY=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:24 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:24 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:36 +0800
Message-Id: <20240628013140.2444209-7-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 65827124-9c9b-4ff1-2883-08dc971229be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?gLFls0xLwFnl/uH2gUBvfGa995wB0uq9UoBaay0QGgswUTu9AQFNW9HLgMk1?=
 =?us-ascii?Q?pz/NUk+KDvxgyXT3rLkkJAiQ7srVJSe6DP3Rek0uUsdUKNdT9B+Kxb1m/Bfb?=
 =?us-ascii?Q?kHlpD0sSfIMattRgVVMbvdXw0mkzZkkaRNPpIiMg7fhXgJZCHoFqg4P56fPF?=
 =?us-ascii?Q?A055Vg4M0GG7GLE/0wm2oIPbTP8y3dLz7u3qkPGYcAFyczQ5Aj/IE3MQeOZ+?=
 =?us-ascii?Q?kYrBPSKpArfwGrDuXzYM0OzbLEKw4luHlNQM6iZWFuXh/VGfOT85VSjSodtJ?=
 =?us-ascii?Q?p0radaWRX2FA4vxrOxpZbfxZDUR/M3NUiB/Hv3kCjqK0p6ICa2DLeoz+FLA4?=
 =?us-ascii?Q?2KknpVMH+siJ1TjLB/sus6KtMC0PyKCb9wpzsKqV74jj2BB7hsjS1rw7I8hU?=
 =?us-ascii?Q?axFRvOl4sn5cDp0sQG682z/O8O8W84PqinPt0PbEUHeX3CZi7dVMwezqIMKj?=
 =?us-ascii?Q?LHJ1+UHSn5+5yMvJWV2fT9uyD91C4UG8TidW7ccX+/eG1iDEYviViI0iRJPi?=
 =?us-ascii?Q?c3FdlNUqBX8Csq8gNg7M/p+crSG5N66gsf59dbn1MbmVb2GXOoynsR6lLfIX?=
 =?us-ascii?Q?hGMiydD5Nm08cFHU0aq53HwDc8oznWoHTBng7FHPtnVi1Cnw+HA9RuMcr21t?=
 =?us-ascii?Q?+LvJccZHNDJWDsv5KmJGfEcALDFM9vFRgbWH+PAmfiLj/iGTB5lZ8YAg+nWC?=
 =?us-ascii?Q?EKLXKWtpHtlRuiEOCPzYrHrup7QUt8Z2Nf0pJATvY+UdPhz6WOHtetSBDN1c?=
 =?us-ascii?Q?td8/A7G5VK72GvzXzF5wqUcufZphRNIaT90hFzP6qL1uQI2NryFrBKJH1Bg/?=
 =?us-ascii?Q?S8zrhvOMI3i5oNQXjFZEdg4y7LiW5JuDJFqi7xoXvQT/YBPIqcdu0ZweQsEZ?=
 =?us-ascii?Q?azGO5eVKort4/jz+V4u3J/DcEHmo3ukvYnL0quU8Dxba7u7pCuXV3HdvijwO?=
 =?us-ascii?Q?P9X+fR/IrRMz2hnNQfyeHENWjrlPfX7C2BdlPec6MzJFTyvGJBfH3hB3jwj8?=
 =?us-ascii?Q?1wMcfmLqPjvb384BRbg5IEdRWgpUBmnv0nzeeDk6/FHF/EGIXYO23w0Eg2zW?=
 =?us-ascii?Q?IqZUAvkCBV6kR4UJBW91SYNOhF8EU8KJGgMMVs8w9vfyx6rVt/bxy+rH59N2?=
 =?us-ascii?Q?ikmGiOExI+lIKK8cZlo1htuPYOBNSP/3//GgdqyYppAwMX1Wh60qTZe33w7Z?=
 =?us-ascii?Q?tbuoNbTJQhH/yWPSGqoSgCj5vT2YV3sfgOP+XKAFsbCW9P4RhgHx7EL7p4V5?=
 =?us-ascii?Q?Xi4Jp7sa7SUhYz2c+iHYIrU8oekxgRT35TBhqJkvbAzkwy95mPv41MOoRiNp?=
 =?us-ascii?Q?t4IYF2GRXhGekIOUeC34OoX/7sWBsORaTvmrPxRurazu6tbIaePt5bcmkMxV?=
 =?us-ascii?Q?ChoSyAjKWn330IXhZg5KIX5x3YeffJzRUdDWDGBlNrCXykWbxw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?My7/4NZxV9w9qcgrLk6eoM9eMyRRaybw9SOzrPJboKOAAL7A4kOWF6cIdTHJ?=
 =?us-ascii?Q?sGffk/ALENb05faDxFsI3UpWcmjbda2Y7DeUacVXX6KI9pocVSnWABrKyQOm?=
 =?us-ascii?Q?PMQeY/npv41GD4NdETzg3V8iEFMjuVWY7GV2k9l+yRG8s/ADW1tFM+MFay5S?=
 =?us-ascii?Q?caUQCVXfz2S8NjBj+PjfCCSpc0WnOlYDp+I9F9zwKGJK3mmU3hqGyRMdEq6l?=
 =?us-ascii?Q?+bdGf0tB4MtaSzecOdsvrwQawpQEbcHvMXj9lU0p1mNMu123+TfbSIiRtwm2?=
 =?us-ascii?Q?Wi36et8/0W+YGhlPOkZyGFDEwNb0WRfgvMN2eDmwwdsoeOA87CA2s6Va4yaT?=
 =?us-ascii?Q?+VMfG1LVR9Vp/9RLGH48g3FnWJ1VPIx+IKGCWq03kLggWcGJ5a+KAgPSLia+?=
 =?us-ascii?Q?60r5YCYLHIe7x0cqFSiObGQIQqNCeDOUFaeOr6AqQ5sZFU+sTfRw02wf8XbY?=
 =?us-ascii?Q?UBd4yqixNKcHkjaV68qlknGg7uGySGLSUiXLBAHJGc7kNkvcQhWPU7PsK01Q?=
 =?us-ascii?Q?6IqRZMhAQ/AIqcjaMfO9oJtBXKF/Lv0YpokqRdJG4hpTYbjUvxjlGE4j95Ae?=
 =?us-ascii?Q?iiaTzcCeBICVWwPWg8hlrCkdc3PIP94Df8YZNzSaNvBjt94EVBUFVHkTbcnX?=
 =?us-ascii?Q?aDdtTzepO3IcuDPS3okmx2rLcBEhIXz3dxVQy/AwqSGD6ueCx1FMdSqMFYNC?=
 =?us-ascii?Q?xEcuBcJxwFSwzt2EgcxaZjROpFfnSekpdQAtFouJP/cpIEoOlq97Tee7cEZS?=
 =?us-ascii?Q?lTWaBkQ8YWju1JKzI0T+peNPn/utMTzTVld4pKmXPJxI91EzPB/YjuxPKlul?=
 =?us-ascii?Q?F2NxlIqbb3tj2U9rKTaq/C94XoB/ALQjhpkpuUl9tZKgf+cJMO/pdfk9CRQK?=
 =?us-ascii?Q?Xl6JEMhiFw7HeYB9wWq/zFMqVZh0Ee1I8/uVErdN+I3k1/AM+eBc/K6/rhUr?=
 =?us-ascii?Q?0IBAJCZ+c2L7IGRg62OPNn07RXzVW6F5Hw9Xic9n657rGlwgHZtBYDjPbQOW?=
 =?us-ascii?Q?hnrKpvlB3/4obgFmyZEpgaOseBLSIobRc49RCb1VYeXnnrQQ4+J7Rfzx8qIs?=
 =?us-ascii?Q?JLw8UNhfFWkZC42wBS+y+77ygT8SwgKJ/EI0APJdXha6A3611bs7fCC+OvNV?=
 =?us-ascii?Q?ASgQs9QQe54fBcndJjJgUuGiSxco3OOAbVYBY7T1DMNt1sK8Cl7Ea6liUU7r?=
 =?us-ascii?Q?hJjhaz9Ul8YhedXOBIBfCSoe9g8hstgBxw8GX0RdTlhZdg1jUHlBHU6EKmur?=
 =?us-ascii?Q?aXwQrRoM77Inqxmwa+8WwvAMyH2JtBDodtBG/Lcy3AHO7P7H+M4SoMfyLd3v?=
 =?us-ascii?Q?+DDIqIFxdEnldqhQwOOcKWA7C2fhuaGR+FkE3JHquDZjXHHaLfQIrpTrSySg?=
 =?us-ascii?Q?rAl1qfxC/NMK7MelwGruWz4yXCR9/Y8cTG/DcugqX3SMZzlT7Yg6ZWSIgpN9?=
 =?us-ascii?Q?b0eDW/db/LlJH5zFSJ+9042F4ZQU5SiYfGqz0yNMWFIQk/SPEqypwMxZb5E5?=
 =?us-ascii?Q?/m5kueQAaDMIdULkHyy1FG6oJV264lLSoFjgeHYk9NvgGEbaLs6WNzIJ8si8?=
 =?us-ascii?Q?uS4y0W2lS5/QSitYlQ03Tadwwf9ktyD01iJg6h/P?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 65827124-9c9b-4ff1-2883-08dc971229be
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:24.7133 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0aAVtZY0mIGhXzFSsohY8zASmX71p5VqsuB8DU/WZ1kqR/Fa8P/eA95l899G8KwhnC20YwZ4wjwyLhlZFnoqYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting sit entry.
 print_raw_sit_entry_info()
 is added to show values of the sit entry. The meanings of options are: *
 sit: means sit entry is injected, its argument chooses which sit pack to be
 injected, where 0 means the current valid sit is choosen automatically. *
 blk: is the block a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0Tc-0006JV-HX
Subject: [f2fs-dev] [RFC PATCH v2 06/10] inject.f2fs: add sit injection
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

This patch enables injecting sit entry. print_raw_sit_entry_info() is
added to show values of the sit entry.

The meanings of options are:
 * sit: means sit entry is injected, its argument chooses which sit pack
        to be injected, where 0 means the current valid sit is choosen
	automatically.
 * blk: is the block address of the sit entry.

The members could be injected in cp contains:
 * vblocks: sit entry vblocks
 * valid_map: sit entry valid_map
 * mtime: sit entry mtime

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   2 +
 fsck/main.c   |   1 +
 3 files changed, 133 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index c5081f2..0fe9b9d 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -22,6 +22,27 @@ static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
 	DISP_u32(ne, block_addr);
 }
 
+static void print_raw_sit_entry_info(struct f2fs_sit_entry *se)
+{
+	int i;
+
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u16(se, vblocks);
+	if (c.layout)
+		printf("%-30s ", "valid_map:");
+	else
+		printf("%-30s\t\t[", "valid_map");
+	for (i = 0; i < SIT_VBLOCK_MAP_SIZE; i++)
+		printf("%02x", se->valid_map[i]);
+	if (c.layout)
+		printf("\n");
+	else
+		printf("]\n");
+	DISP_u64(se, mtime);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -33,9 +54,11 @@ void inject_usage(void)
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
 	MSG(0, "  --nid <nid> which nid is injected\n");
+	MSG(0, "  --blk <blkaddr> which blkaddr is injected\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
+	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -84,6 +107,19 @@ static void inject_nat_usage(void)
 	MSG(0, "  block_addr: inject nat entry block_addr\n");
 }
 
+static void inject_sit_usage(void)
+{
+	MSG(0, "inject.f2fs --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
+	MSG(0, "[sit]:\n");
+	MSG(0, "  0: auto select the current sit pack\n");
+	MSG(0, "  1: select the first sit pack\n");
+	MSG(0, "  2: select the second sit pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  vblocks: inject sit entry vblocks\n");
+	MSG(0, "  valid_map: inject sit entry valid_map\n");
+	MSG(0, "  mtime: inject sit entry mtime\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -99,6 +135,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"cp", required_argument, 0, 7},
 		{"nat", required_argument, 0, 8},
 		{"nid", required_argument, 0, 9},
+		{"sit", required_argument, 0, 10},
+		{"blk", required_argument, 0, 11},
 		{0, 0, 0, 0}
 	};
 
@@ -154,6 +192,18 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
 			break;
+		case 10:
+			opt->sit = atoi(optarg);
+			if (opt->sit < 0 || opt->sit > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject sit pack %s\n", pack[opt->sit]);
+			break;
+		case 11:
+			opt->blk = strtol(optarg, NULL, 0);
+			if (opt->blk == ULONG_MAX || opt->blk == LONG_MIN)
+				return -ERANGE;
+			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -174,6 +224,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->nat >= 0) {
 				inject_nat_usage();
 				exit(0);
+			} else if (opt->sit >= 0) {
+				inject_sit_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -424,6 +477,81 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	return ret;
 }
 
+static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct sit_info *sit_i = SIT_I(sbi);
+	struct f2fs_sit_block *sit_blk;
+	struct f2fs_sit_entry *sit;
+	unsigned int segno, offs;
+	bool is_set;
+
+	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
+		ERR_MSG("Invalid blkaddr 0x%x (valid range [0x%x:0x%lx])\n",
+			opt->blk, SM_I(sbi)->main_blkaddr,
+			(unsigned long)le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count));
+		return -EINVAL;
+	}
+
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(sit_blk);
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	/* change SIT version bitmap temporarily to select specified pack */
+	is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
+	if (opt->sit == 0) {
+		opt->sit = is_set ? 2 : 1;
+	} else {
+		if (opt->sit == 1)
+			f2fs_clear_bit(segno, sit_i->sit_bitmap);
+		else
+			f2fs_set_bit(segno, sit_i->sit_bitmap);
+	}
+	get_current_sit_page(sbi, segno, sit_blk);
+	offs = SIT_ENTRY_OFFSET(sit_i, segno);
+	sit = &sit_blk->entries[offs];
+
+	if (!strcmp(opt->mb, "vblocks")) {
+		MSG(0, "Info: inject sit entry vblocks of block 0x%x "
+		    "in pack %d: %u -> %u\n", opt->blk, opt->sit,
+		    le16_to_cpu(sit->vblocks), (u16)opt->val);
+		sit->vblocks = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "valid_map")) {
+		if (opt->idx == -1) {
+			MSG(0, "Info: auto idx = %u\n", offs);
+			opt->idx = offs;
+		}
+		if (opt->idx >= SIT_VBLOCK_MAP_SIZE) {
+			ERR_MSG("invalid idx %u of valid_map[]\n", opt->idx);
+			free(sit_blk);
+			return -ERANGE;
+		}
+		MSG(0, "Info: inject sit entry valid_map[%d] of block 0x%x "
+		    "in pack %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
+		    opt->sit, sit->valid_map[opt->idx], (u8)opt->val);
+		sit->valid_map[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "mtime")) {
+		MSG(0, "Info: inject sit entry mtime of block 0x%x "
+		    "in pack %d: %lu -> %lu\n", opt->blk, opt->sit,
+		    le64_to_cpu(sit->mtime), (u64)opt->val);
+		sit->mtime = cpu_to_le64((u64)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		free(sit_blk);
+		return -EINVAL;
+	}
+	print_raw_sit_entry_info(sit);
+
+	rewrite_current_sit_page(sbi, segno, sit_blk);
+	/* restore SIT version bitmap */
+	if (is_set)
+		f2fs_set_bit(segno, sit_i->sit_bitmap);
+	else
+		f2fs_clear_bit(segno, sit_i->sit_bitmap);
+
+	free(sit_blk);
+	return 0;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -435,6 +563,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_cp(sbi, opt);
 	else if (opt->nat >= 0)
 		ret = inject_nat(sbi, opt);
+	else if (opt->sit >= 0)
+		ret = inject_sit(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index db45fb9..ece4915 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -25,9 +25,11 @@ struct inject_option {
 	long long val;		/* new value */
 	char *str;		/* new string */
 	nid_t nid;
+	block_t blk;
 	int sb;			/* which sb */
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
+	int sit;		/* which sit pack */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index 3ab49a4..7ec4da7 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -821,6 +821,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			.sb = -1,
 			.cp = -1,
 			.nat = -1,
+			.sit = -1,
 			.idx = -1,
 			.nid = -1,
 		};
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
