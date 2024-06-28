Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47CBF91B4A2
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Jun 2024 03:32:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sN0Tb-00032R-Lh;
	Fri, 28 Jun 2024 01:32:35 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sN0TY-00032K-Qi
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=; b=HcgnNn1KfnFKwcDbRiWyDUG/V2
 XFcjGMvVH1A/KeMIDaNJ3LwOQ/8OVLXhsCc5bcNHMHYCDMC9vzPPYn8PdgHSICEOK6ywuumO84tgZ
 LRLMtsOj7KQSdFgQ2KYV1cHkCiwjpj3KLNjANnC6tvWSjD00xh1wgDWb9hIrNsUt2rng=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=; b=cnYd7YCzCkLUvYo8EH+DLOYqYO
 +ta/1oCPbGCq5a4c4VFCWISKk8yvqsJ+//XtUVW0FVtJUDHa18v2GybSEi/xCOfZcL5DOK54lXVEC
 crZ1is6X9b76GKy6NK0EdHWePBvfUZw5WKmGwRSRtp4J1bD8RMIfP0507dcQ1ACU0ZG4=;
Received: from mail-tyzapc01on2044.outbound.protection.outlook.com
 ([40.107.117.44] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sN0TX-0006JV-Un for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Jun 2024 01:32:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WtldmCyjkgeGvekDc7kh/cYLc6X5bp9fvOfvdgFYf8j90+CpZhZ/zU9fJJLPt1IkfUhprWwSAO/h9Fk63IEfjpg0sivnqRJgNk4ceiWazHkXMbYU4JHiFNF3tjzWMwJrnNuzqTHoZJdOTHgwoyuBIIa394laNDVO4nC35wo38fbVwF9Vl9FreDmFbUqampGVBA51ODO1RfP1p7K8U+G3RhfLhguS5AEoP7QEYqAacV4FnvmQ4/5j6y+1CzU/bKlRss2qPfmYduWF65m+0HplLPbar38dHLHQbmQU83XY6c0DFso3uKz4cUBV7wd2XC755CXv8RzuLRdrkMu92fIyAg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=;
 b=iV6VV9TN9a+idPmHwCrIGEtfc2g0PdW337j7ZoZsvSD9fTA4+je11QOj0vJUWKLCPnqc3L3V3UKFEHCdG67G0f7+GsaHqLEruvF+8XSdMCEd3w3yiDol66vz6B0pN6ZqiNxJNLizbQV2fxf41/GYAFD844OAeWbrzpmshA7FS+wJvMrHejlhA9i+w/Nn2yGV1czpCliJIzoDEqk+fXAbALKRFBX/HlGburfeCnQiHVwOiyBhMk2bdoi9NuB3sdH4NzIPWOHZC8ET0Ty5OnXpMvHnKHxcTFdU78UK8jjAaeA9B7y2x9R7m+H7z93/6+lOspa2Gnj2Cpl42MyXI56rDQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Qn7nbywE3y7Hclvot0YEg6FFhfxcalDvo/L3BxCEGeo=;
 b=ielxWHPaC69dxudx2DL8imY3cevATTWwPFEyeYL3U88jaDGgvW49z5jstQjEmlZNDUeYzh7M9Qb+m/hrTvEzVTb5mFymZhEwVI75Fbz6k1vhdkVvcESelzHLCu/G3ePlnnAhCCgpPD3eBQua+OX+F2dwJxv39MnkNAE/WXutyUk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6576.apcprd02.prod.outlook.com (2603:1096:400:41a::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.35; Fri, 28 Jun
 2024 01:32:19 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7698.025; Fri, 28 Jun 2024
 01:32:19 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 28 Jun 2024 09:31:32 +0800
Message-Id: <20240628013140.2444209-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240628013140.2444209-1-shengyong@oppo.com>
References: <20240628013140.2444209-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR01CA0047.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6576:EE_
X-MS-Office365-Filtering-Correlation-Id: 213374cc-d25e-4713-9ba1-08dc9712265c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?TqGannPiZtT92pbRWgl0aOQsDDpL3KOb94o6NWR63Tt9e3do75ZmtT4/anvy?=
 =?us-ascii?Q?xl920CCwYmdFxc7VSOJhMNmeyXUVQVJcPlrrap4IJEao2d5NiVOggIIFDXlm?=
 =?us-ascii?Q?p8GB9Ih/SuE/19zk9Mg9rJD/M2Kb6Dm4qvbPcWl9SL4OPyv9HvIb04ea/9wg?=
 =?us-ascii?Q?9xkkNJJvZ3P2QA89oG5aS0SmdiWldh1bQGAjYg+l5NbN+nANH4VuFW89esnE?=
 =?us-ascii?Q?KQbNiHszA+JC5f+BOf6FU7BiE8+XZvYAgVtKW6vwIzKstI/tozSejxNDP6e+?=
 =?us-ascii?Q?LPXJG3Vn46MmZcR2D2y5YSSMSqahMiP9Obyk1I+wDF0gwjNkM6W/tLPUwK9z?=
 =?us-ascii?Q?r3PH9f9M93Z7iGG+NTADV5fwomdyqczBl2poU7MaId6hBFYItG864AMyGvT4?=
 =?us-ascii?Q?FPjQsS4PirxLQy7A6mvtx0pksTWwz8Mpg7dHKRm9bLo943bQmCk0Dl0egn21?=
 =?us-ascii?Q?Z648jeSvoD6Kpc3A14aEEiWmKYc0mVjAj6Y7Pb3SceIqt6FLk/W3zhdeM3s9?=
 =?us-ascii?Q?Zr7PuHfZzddBHJCLj1blTI+RY/Mx0BmcRRsArtDasPNmGu+nSJJno5ZsqpCe?=
 =?us-ascii?Q?DFhnx8TOZIdmM7Hx2Jzeh2kT8avs0Sw1hIAKbmVYMbw3jsx8YXGM3VFh4ms1?=
 =?us-ascii?Q?LH9zeK2eXyvWAVpuc7wJclCt40ccz6NV3ijxfUBh+Zv42MPQpgr20iY3MEq3?=
 =?us-ascii?Q?EVu5ZDkagmcGliAjQ7In+WkAHfOdjCRlU6nK5Ui/HmTswgHgDPi5nnYnyGC5?=
 =?us-ascii?Q?BqcRoPgBFCIYFR019gWLv0WmrO6wDy9yMLYTTmiihvyDaZ8UnKZUl/fbGzda?=
 =?us-ascii?Q?BYxAXGF2sPIZUf0eUThhUop0aP750Qa4AOgxDhhDY48xoM9NO6BMg/WtY1wn?=
 =?us-ascii?Q?/WzS1y1gJzxGB/VdLnoCMH3xB45H5bRw9aXilUn9KjXjmA1jHtluw/jcFAbz?=
 =?us-ascii?Q?XMzPy27hxlcUHIzfTiVPSHC2Kb+Z2nr7L2PWpE/gFMp6lwWb6zntD+lHVEeM?=
 =?us-ascii?Q?JVk3/v1gaylvNhOf1N5wYfH1nqYlTveKnUOfVFyqVu+mTDQEwcyaKKQa/dJF?=
 =?us-ascii?Q?z2f8AyeGg/INP5MglW/DakjfowIpqOl8Wenn/SvKMK9GZ92miMl8MwhTPHJS?=
 =?us-ascii?Q?lBlxT+gme4qG2NKVZQCzrlKctQqboDithA1zeh6L62i3COfeOEl0uvsf9ppa?=
 =?us-ascii?Q?23xKQVdf5PA5M746GaRSZyS+duG0DHihcn1/ZkWZCL3Zn6gMtqGCvfkyhOm3?=
 =?us-ascii?Q?k45wdcnhdgd+TciSX6FGDPe9opMzR8O46TDalIWWQZ98d4HPchjpNy5P9ajq?=
 =?us-ascii?Q?oV4Mm3BrvLCuIwYTNbMR6vy6/tuQSW2ho8x93vJgHdM6Zg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FD/8QrG9pKU4neSv6plXVvN12SSaii9ojb0r923g+kPn7fZkXQq9UI1PozYH?=
 =?us-ascii?Q?CPJ+DIO4tOw8Zqug/BVY63OVRPY7ZuvyZp3V9q3r6h0pjdWbZntwDIVof9JD?=
 =?us-ascii?Q?mHMcRZ4xmMBFKMaUZIKD2CeWAIgtQ4976184b79zVgGnduzWhDuoVQ8GWBfN?=
 =?us-ascii?Q?8rm5gEB2My9fWba/jpw7tCCXd3kNVF0FlrIbgXnSnehS3QnzyD1xUeQ3HVAI?=
 =?us-ascii?Q?ko6oANU4NlIV1hwHk5zXviDvdLsZcPla2occU0Ah5ufX1qmg6ajy0MM2g8CD?=
 =?us-ascii?Q?L6Enix2B3WqDuqicFmZNQUMOQvO1LxpCwbOPpPCOicncA7CHEwSN76R+VLPN?=
 =?us-ascii?Q?64bzZ1aI+5vgqdNQcLbOQ4LXgMh2J/20uIErcL+vkmHPe5SRTNWDBtQIYUvV?=
 =?us-ascii?Q?wZW48tqqQFsF9ACg2gi8J/7W67vLFFH2n0q/b1n/SguQRZ8AhFGy1vmwB6RU?=
 =?us-ascii?Q?KhcI7B8pKV/+0HYGlKLLju6/JZGGmzfVtsOZS5Cq4WPW7kAvuCeNqR5zDJsp?=
 =?us-ascii?Q?rppG+PDoGOL2MZI+Nl/yf6c67wjdV6ix9sQNh1AdFq7tbuT6BcOXaWzWWWHc?=
 =?us-ascii?Q?qMivra/YXDHcrEv7QSMzVc6vIr/yMRKcGL+4VH/kdLbQNt4Sd7HuERTFD77p?=
 =?us-ascii?Q?WgeOBE4M3lDf7cmK3m247UrOVNCUrd6Aiwyl7eqRROhMNUK4MPvQUm645eHG?=
 =?us-ascii?Q?L03SHQgsh8UPwzLM57hW/wY0Wv7sB71gMdXRdWkjXBiRzNsaayoiCcumZR0R?=
 =?us-ascii?Q?4ZQCOUnZ+juTHteuxpsqoNi4zA3HgrF8JA7FIiANAGGJUhOHIW2mcw34idm+?=
 =?us-ascii?Q?4F8L2iFkBAGb1WJrDiJtQzOaLnYXi05lXzDbcIEdChDl6bIupKfQTGM19gse?=
 =?us-ascii?Q?cDmsgRKtppG1Ae1NmuCobcSK6YgiuDyv8bf5nBHxEN5cbf3cTkVYaJ8i0MPq?=
 =?us-ascii?Q?5o/EFkJi2z9Nr2DXziyW66rhOFx94ND4BIK08hFKE80c3GhsokRxDXBbLvhw?=
 =?us-ascii?Q?xLn/XBMnDUqpKhDJ2QVa7XLbquDuHNWQbS42sWbCiBUSDSCOfcIOqlh3Ak4G?=
 =?us-ascii?Q?6yDEcJg1ylIGO4TFhGKHKQE7ZuVtwcew06/8SRhjthZrIQE0mivdI2UsqfNA?=
 =?us-ascii?Q?TYCRBkAZ3zj+0nqf36Q5CwGqJyvDw+jsLI6mSss4PODtJZl6rGehQ5qxVup8?=
 =?us-ascii?Q?9EYgGI+YAU9VoYNRDWyAn7DfJ4VOADi+U5Fxis1nLVHYK5KYALOtMG0m45zm?=
 =?us-ascii?Q?neIaxKZZJVWjB3fieYjji45XqR/7UAFGD5pg6gInbUW49V81v+D7032H7w0i?=
 =?us-ascii?Q?CRtpboezD87MNG6p/T9XuTpI17rQh41dyD1C6HB9INbpNdp1LubrlcMDyay/?=
 =?us-ascii?Q?e/i3RoMiXY9Kckm5gy45GiiOoUl4X3/aJimooeJjKiRUNpGSd2Qnj0oOb0cQ?=
 =?us-ascii?Q?cEVfhtjKyxhS52v1Fk7oWFcqWyDRYhY08vqcQTMtgdv1/A9NvI/rG5kqM5B2?=
 =?us-ascii?Q?tGiRn5qeUeI8VmPy26ZQKmrOQHrUjBWLhFF4OB66LL/UNk5V5YeZFAbaNTFK?=
 =?us-ascii?Q?KLa7ytyPNi3tqEaU27FDs3EBcwaA9UqNbqKmBV1a?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 213374cc-d25e-4713-9ba1-08dc9712265c
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2024 01:32:19.0401 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LwmfKldvG1M0X+9YrolVE4kvvU/EV9BT5fru/Ztz13RSLJvlW+95ZSG5g+XTxQUd/QLob0A6sgsH8FZVpF8wHg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6576
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a new tool inject.f2fs to modify
 metadata
 or data (directory entry) of f2fs image offline flexibly. With inject.f2fs,
 it is easier to generate a corrupted f2fs image, which can help verify fsck
 or reproduce userspace behaviors of some a fault. If option `--dry-run' is
 used, nothing really gets chang [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.44 listed in sa-trusted.bondedsender.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.44 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sN0TX-0006JV-Un
Subject: [f2fs-dev] [RFC PATCH v2 02/10] inject.f2fs: introduce inject.f2fs
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

This patch introduces a new tool inject.f2fs to modify metadata or data
(directory entry) of f2fs image offline flexibly.

With inject.f2fs, it is easier to generate a corrupted f2fs image, which
can help verify fsck or reproduce userspace behaviors of some a fault.
If option `--dry-run' is used, nothing really gets changed, and that
could be used to get the value of a specified field.

The following patches enable injecting each part of f2fs.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/Makefile.am  |  5 ++--
 fsck/inject.c     | 64 +++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h     | 28 +++++++++++++++++++++
 fsck/main.c       | 29 +++++++++++++++++++++
 include/f2fs_fs.h |  2 ++
 5 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 fsck/inject.c
 create mode 100644 fsck/inject.h

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 40d31b8..48402ab 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -4,11 +4,12 @@ AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = fsck.f2fs
 noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
-		quotaio_tree.h quotaio_v2.h xattr.h compress.h
+		quotaio_tree.h quotaio_v2.h xattr.h compress.h inject.h
 include_HEADERS = $(top_srcdir)/include/quota.h
 fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
 		node.c segment.c dir.c sload.c xattr.c compress.c \
-		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c
+		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c \
+		inject.c
 fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
 	${liblzo2_LIBS} ${liblz4_LIBS} ${libwinpthread_LIBS} \
 	$(top_builddir)/lib/libf2fs.la
diff --git a/fsck/inject.c b/fsck/inject.c
new file mode 100644
index 0000000..f6fd346
--- /dev/null
+++ b/fsck/inject.c
@@ -0,0 +1,64 @@
+/**
+ * inject.c
+ *
+ * Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+ *             http://www.oppo.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <getopt.h>
+#include "inject.h"
+
+void inject_usage(void)
+{
+	MSG(0, "\nUsage: inject.f2fs [options] device\n");
+	MSG(0, "[options]:\n");
+	MSG(0, "  -d debug level [default:0]\n");
+	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  --dry-run do not really inject\n");
+
+	exit(1);
+}
+
+int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
+{
+	int o = 0;
+	const char *option_string = "d:V";
+	struct option long_opt[] = {
+		{"dry-run", no_argument, 0, 1},
+		{0, 0, 0, 0}
+	};
+
+	while ((o = getopt_long(argc, argv, option_string,
+				long_opt, NULL)) != EOF) {
+		switch (o) {
+		case 1:
+			c.dry_run = 1;
+			MSG(0, "Info: Dry run\n");
+			break;
+		case 'd':
+			if (optarg[0] == '-' || !is_digits(optarg))
+				return EWRONG_OPT;
+			c.dbg_lv = atoi(optarg);
+			MSG(0, "Info: Debug level = %d\n", c.dbg_lv);
+			break;
+		case 'V':
+			show_version("inject.f2fs");
+			exit(0);
+		default:
+			return EUNKNOWN_OPT;
+		}
+	}
+
+	return 0;
+}
+
+int do_inject(struct f2fs_sb_info *sbi)
+{
+	int ret = -EINVAL;
+
+	return ret;
+}
diff --git a/fsck/inject.h b/fsck/inject.h
new file mode 100644
index 0000000..62543c1
--- /dev/null
+++ b/fsck/inject.h
@@ -0,0 +1,28 @@
+/**
+ * inject.h
+ *
+ * Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+ *             http://www.oppo.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _INJECT_H_
+#define _INJECT_H_
+
+#include <stdio.h>
+#include <stdint.h>
+#include <limits.h>
+
+#include "f2fs_fs.h"
+#include "fsck.h"
+
+struct inject_option {
+};
+
+void inject_usage(void);
+int inject_parse_options(int argc, char *argv[], struct inject_option *inject_opt);
+int do_inject(struct f2fs_sb_info *sbi);
+#endif
diff --git a/fsck/main.c b/fsck/main.c
index 9bda412..f093ca7 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -29,6 +29,15 @@
 #include <stdbool.h>
 #include "quotaio.h"
 #include "compress.h"
+#ifdef WITH_INJECT
+#include "inject.h"
+#else
+static void inject_usage(void)
+{
+	MSG(0, "\ninject.f2fs not supported\n");
+	exit(1);
+}
+#endif
 
 struct f2fs_fsck gfsck;
 
@@ -190,6 +199,8 @@ static void error_out(char *prog)
 		sload_usage();
 	else if (!strcmp("f2fslabel", prog))
 		label_usage();
+	else if (!strcmp("inject.f2fs", prog))
+		inject_usage();
 	else
 		MSG(0, "\nWrong program.\n");
 }
@@ -804,6 +815,18 @@ void f2fs_parse_options(int argc, char *argv[])
 			c.vol_label = NULL;
 		}
 #endif /* WITH_LABEL */
+	} else if (!strcmp("inject.f2fs", prog)) {
+#ifdef WITH_INJECT
+		static struct inject_option inject_opt;
+
+		err = inject_parse_options(argc, argv, &inject_opt);
+		if (err < 0) {
+			err = EWRONG_OPT;
+		}
+
+		c.func = INJECT;
+		c.private = &inject_opt;
+#endif /* WITH_INJECT */
 	}
 
 	if (err == NOERROR) {
@@ -1224,6 +1247,12 @@ fsck_again:
 		if (do_label(sbi))
 			goto out_err;
 		break;
+#endif
+#ifdef WITH_INJECT
+	case INJECT:
+		if (do_inject(sbi))
+			goto out_err;
+		break;
 #endif
 	default:
 		ERR_MSG("Wrong program name\n");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4..3a5d146 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -45,6 +45,7 @@
 #define WITH_RESIZE
 #define WITH_SLOAD
 #define WITH_LABEL
+#define WITH_INJECT
 #endif
 
 #include <inttypes.h>
@@ -427,6 +428,7 @@ enum f2fs_config_func {
 	RESIZE,
 	SLOAD,
 	LABEL,
+	INJECT,
 };
 
 enum default_set {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
