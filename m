Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B73B7926DB8
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:37 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCg6-0004zQ-KF;
	Thu, 04 Jul 2024 02:58:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCg2-0004z9-3e
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zUuIXMqloQyxW7GSOX+XY77UUnIMcrh1MT6Uc7daSjs=; b=OGa2/4Dt4ZpWRU5bRtNIydi6F0
 HNV2a4gjm1rtay5R7uvK2sgPb8vI2Ddv2vDRDt+Tklc7pb1WmsrNXosbOMUmlte+xhXsR1dMlEFhN
 juqZ1WiXNgLImMUD9dK0zCpb0+W+qqXh7PBbagnbxl8+1XInlYh7rdRz57Np7tvKfugo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zUuIXMqloQyxW7GSOX+XY77UUnIMcrh1MT6Uc7daSjs=; b=KuUMm5MnjGAO/c8mzIxeS9KMEL
 0ZgK27n5ejqOTj1APuFTahmrmSQzprQcEiTgwniTVXkt7mk6fSemiNP65TjxpyWxVucNMAqWQtUw7
 RjNf4qiM6sZMHpobGe3Ydq5qlzG/RTHf4ABKQErx8jkZv7oXT9HH8qddpuxfQKMxMVEo=;
Received: from mail-sgaapc01on2054.outbound.protection.outlook.com
 ([40.107.215.54] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCg1-00011d-6H for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZM+SrCMqFaZH09CnIg0z76gM35KF70EsWD8ldqDHCyva5L8fdZamiO0g4Aq5JJPvTvcCAfxdB1YoopFODwHUYuMnsDnx18gDILCza9naKFLsX+OvISoXGgmV3i2khe8xOzf00kpocRXSzvbe1r7ZTkfyhIwFzv/5/TQb72jE/mpzz48aArjzIiFL2AdzI/mmtph65aNlKrEXITjo+fEod7sJrX9rWzscGRjmJPAwHqjPBKgiWfJcyklPgyMqdSapd/Gby8YIzaMz7yj5gLhdbjr8L4RiO1PYXbQLVeV7JTyn5G6rNA8j0Nw+VypJazdu5luWXWolsUMpcyBSpO4uiw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zUuIXMqloQyxW7GSOX+XY77UUnIMcrh1MT6Uc7daSjs=;
 b=b1o0OfnFcIn9F81Je6haLJeD+UCqw2C2a2S+xio63shGbUNMKwW7t3PylLI6GNJvPT2SQFLmk5lS6vAo+tIG1LDouJpou0mG0L5hw66MImEmPFRMQfPmwoAgqavCG0WztlG2GvMTwhj6VbDasWAScTCZJLTUp/R/V/sPRTxCCpNv4M9hoHxVi37QmJ6a775LQ8iVIv0m2yN4mEDU//PUt+/JW/WTsatj4x+PK/9OhpixxB2bIw4g4fqGx9m9JbmwK1N1YzC5SuAu2t8Zjz0iq7qVdF8hjyqH4PNNB83o8vw1ItDbT8p4ythWiSxUJuREribam2DCiEuiQJJd/pGp7Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zUuIXMqloQyxW7GSOX+XY77UUnIMcrh1MT6Uc7daSjs=;
 b=oYTVLaA1Yr3+WIJOAdk8QqBQ84I4wU4SuhQg/0HpXYQxZ0JELPhBzTdQnzYRZwEt6ZScT9ZT2hFHXv9AA2wjXHVkAAbT/78wQz8NjH0pszNNh3F0IWJQZJ35rnFEjX1marjeodbGixWdm2vtER6n1ZLK+ajrVBqI2ZtjZWBKF+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:15 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:15 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:37 +0800
Message-Id: <20240704025740.527171-8-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: fe580eeb-9c77-4dbe-789b-08dc9bd52626
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?DRSAkxD3vRCzdj0hTlXkV+cwOi79qcrSpCmUzSq9dKtfxgwHMNPPFjJm/fUc?=
 =?us-ascii?Q?q973DjTif8KzPCOVFNbNs5k7UcrUeZMgTIBc4ALc0p/MCi6PU9S9Y0NSNRg+?=
 =?us-ascii?Q?4EtoM80kmD8RjZqx+gUA1eUWOWkn5b3wypvkphxA/nd2sLL7G015kGTki5mh?=
 =?us-ascii?Q?TdDKmcZF1i/uoiG5NItk4D2j1Tjc6fE9BPSiZiwaqOMEIW5lpAob/9FrImLs?=
 =?us-ascii?Q?7N88MK7Q0p+m9yvb7LHUT5l6vmPZdiclC0sUIsUBh/fXO1ZMKx7FCK97f7jP?=
 =?us-ascii?Q?NGLwKDaChqU/Mp8556FKUO8vWtQpdtlzU8cE02RZyHr7gr6uiPcgkcL17V3B?=
 =?us-ascii?Q?tiSmspVnjEs6jiV/XKMcmiz2UaGAgoPqYzVJM5VenLRgFGu5+QtdYuydDVMy?=
 =?us-ascii?Q?JoIhcYw8vTnlUmNR0H1TGEA3uYTT2ulfdu/3bAImhOSLBsIYmQ8NTXBi67kv?=
 =?us-ascii?Q?5EjzepIhq5+KLef+Jj7P0X+ZD5/EQhlj304xRB+7M0L0wFQGX9BDobJHqJ9O?=
 =?us-ascii?Q?A44Ul9u/28O1bit09KSmtrdvXcfEfEEZnCYv77/AKE5U9a1fWcKUi8htnhyu?=
 =?us-ascii?Q?MEKa1BAAqbnnyFJQn3pMAa060ixXuCcjBusOuYObTsAzy1Y/O+vxtdT59i97?=
 =?us-ascii?Q?CSXu0irju4xiCgQlduc5Of89T7NKpFhFXWxvac/YlvefoOzg9HmR7MoVq0kr?=
 =?us-ascii?Q?YfZd3n+nHQDjk2XM+NS40i25C2WmfnRViNlh5zJE7MNCoeLQ89zV07kBDfkL?=
 =?us-ascii?Q?2HE4I3ROpbXUNDR9m6iFz+BRU9MbV6FKHh9bjeoK3nI0XkSWk/jRXzHd1dXw?=
 =?us-ascii?Q?IdziBc7wcRRki9cOStJhe3C426ZhJuVrcAFAgMz0f+pbYZWDF4pWgs9VssS4?=
 =?us-ascii?Q?uVuroSjoxnMUKTQ0kQSM+HoAmkO3vWXUdIeZdknq1XUDxzzuwhUseRxi9eUv?=
 =?us-ascii?Q?mmGwZIcBfxoRERf8ZPSmSAtAQLEms1ZOStIzzgtd/VF4z2x4SFdsrDqHFmvH?=
 =?us-ascii?Q?8eSYyLprNyBeXy2K6A1CF0aMGlFbr6sfRVekcae6eI4pt9+RNMKZA17D2KwO?=
 =?us-ascii?Q?4eicaLu8+vMZ9E012r47oNp/7Ty5/u+FoXkWUVFCxmzBRDNyH4P2R9HO2GD0?=
 =?us-ascii?Q?t1iMmL69GOeK3eeHds9eAFQWoJ+NQ8ervmoM/vxQEIHcNYnrzc8jfK7zdUVb?=
 =?us-ascii?Q?+EeTNs8gqOYYIcDFpH1xZ3m1Kq71xQC9cLg/GYsVCspfKsf458U7ObNHhNOr?=
 =?us-ascii?Q?pVPjBCMJ7BEuESX6usRSADmh0dFa66e/TLPUGkMu8QktScq8D5MbSLKshBBp?=
 =?us-ascii?Q?W7BLElsmhNib/3Yj3QaYP+orRZ/mYrrBT5XH+GsTFg9wOrcRD2uxb3iiH44t?=
 =?us-ascii?Q?GTiHFtKVZYeTdtmjs0kDZiD95wNCgTiGrjb9SJdAjgFBslTGRA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?O/pFJBne6RZtLhPsWsVUJBTK0x14hAPumy0q6LHJ9cHwFMkstH9+8Us7Zaqp?=
 =?us-ascii?Q?nMMP+H0TruZhS3x6Ums5EjkrkO3bX85HxonIfaQssbTDxGyCas3Z9XSkLOPW?=
 =?us-ascii?Q?70TkgqSuw1UtIKZrqC+PaMUi5XdgDF+NckNSCjFf8iz+enrE8NVB7Gz3Ykhn?=
 =?us-ascii?Q?Da4CNP4jH7bwYUBoVe2Ja4CFBsAx1lhYlxg7kyn+gvFPtVKA/4LErhPHcrY9?=
 =?us-ascii?Q?H85j1rQEuqrgO6Oyr0pnJ2SvUrXDWwjMqBbrmGoEilTOjwutUkgwlYIHw6Y8?=
 =?us-ascii?Q?vmvoScDSs/IM98wItDm3wrOh/Ttdie9NtQmhRDW82osTIrzNfM9PED6cko2I?=
 =?us-ascii?Q?5ns8hE29vxDvf79/Z+dIlIiIfj1cb8QUqr/AZruHf3KNx2i5qlcuB8YNEVw6?=
 =?us-ascii?Q?iMozQ7eFdjkJiAukr69hHNR2cE5Ac6TwlHpwZpG7yjH7qzPIM2wWHWByXvj/?=
 =?us-ascii?Q?6oR8jycqwc0669McsTgD7IdjtjtI9F7yRVZzj1Phqyh4tmayaNIKnrzNZ2Up?=
 =?us-ascii?Q?ZClNW39JyoUS7FfwEy+CEFqrEAfyp8tfHBgmNab/x8wVt3az0Io19W21hupo?=
 =?us-ascii?Q?z9dOfMsu1ncQgh1ndSBmbiP/PDGKen5zRKvpX3J+s/iQPyNlyAjDNuxqPlV2?=
 =?us-ascii?Q?DqZoiufCV2IE2/itCkOZFX7tAdiEfKJnVH0iHxx2pbDkzfj6MGDBNR5AjCW/?=
 =?us-ascii?Q?zX2hw/zcJGzfLOJzZuwagbOCq7QlAJln/TLBESROSBRGGfGGHF9Q2Z55mipd?=
 =?us-ascii?Q?J92rvtFlObhAi2vVtmlYDH7XTFs8CiNYp5pAy37bQXyIDoQKCWhHgnJWj34V?=
 =?us-ascii?Q?EWFQfERKwSYHdJTrd3QqngzEDelFaU0Gq+ALdZ/SmhQ7LnKZYT02z+yHdBBF?=
 =?us-ascii?Q?AJ1ChMuONp+c58eEmvFbKIm9tGbw8TdgD5j+airmMw9rbUhXerK9UhtwciSe?=
 =?us-ascii?Q?HwVnAfEtH990Bk9BnRJTa9gYe7UWYF7vi+0RdvN9c/ul3NRfFFm5LGSzfftY?=
 =?us-ascii?Q?nNASgISHKbQC/bEPmABl+FTDGmpFDxLhuM4lVBEQN3KUvPjVFVsqDwngjAH6?=
 =?us-ascii?Q?26s8jEcV41pJwQBXZlxOEmEWOKB+zjxTibkxElZSMpArZAqudBFgLPAmn91D?=
 =?us-ascii?Q?s9pwOBD/LtFk6sAca5bes99RqDgNECWzw8xhmdNkiawZ39Xq/TWX2QEgI4Il?=
 =?us-ascii?Q?L52aHhXmpVxShDQG6l/RQwIh6+j0YxZvzQ30R0CF7D0MGzhkELiTzWBGzG6X?=
 =?us-ascii?Q?PcifHivBAyQ8dUJalDusgRGZ54YB7PrAZSeB3mklCJbmzCP6iwtppt4BV9Rv?=
 =?us-ascii?Q?SeBdDOWyfuvZ+se5aKCcFWxQAmji8+fe7+jdgWGXpx1DUOjQSl8mmceqLiYY?=
 =?us-ascii?Q?sdkkuf+I4ES7g/nPekxrS1iziTx2EISXPHMZKrLbeRPb+7wgg2vv8vxo9xDG?=
 =?us-ascii?Q?2cQrK0eY5SGCSoL2Lv7kczZyK9agzb+/IavqKvTV6zUpLOel310K9QE2bebx?=
 =?us-ascii?Q?k2yecS0OMEQrqm8l6pBTm/vxl1Km7+1omLacUW+pdOmNDTzCnb3j3GozolMz?=
 =?us-ascii?Q?AlvOPRxgGGLo6zOQysSLVWLFDqernJloJHlBVcae?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fe580eeb-9c77-4dbe-789b-08dc9bd52626
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:15.2420 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: fxjO5Kk0uw+oxkUoGqCbigej0lVQtE6dCFttDLSVRaRI6hjM340ZCt3UY9Pgvm/OgO8V9uuycis+VEmhGhLSew==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting summary block or summary entry.
 print_raw_sum_entry_info() and print_sum_footer_info() are added to show
 values of the ssa entry and summary footer. The meanings of options are: *
 ssa: means ssa entry is injected. 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.215.54 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.54 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.54 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.54 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCg1-00011d-6H
Subject: [f2fs-dev] [RCF PATCH v3 07/10] inject.f2fs: add ssa injection
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

This patch enables injecting summary block or summary entry.
print_raw_sum_entry_info() and print_sum_footer_info() are added to show
values of the ssa entry and summary footer.

The meanings of options are:
 * ssa: means ssa entry is injected.

The members could be injected in cp contains:
 * entry_type: summary block footer entry_type
 * check_sum: summary block footer check_sum
 * nid: summary entry nid
 * version: summary entry version
 * ofs_in_node: summary entry ofs_in_node

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 124 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index 5799353..d6f8774 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -43,6 +43,25 @@ static void print_raw_sit_entry_info(struct f2fs_sit_entry *se)
 	DISP_u64(se, mtime);
 }
 
+static void print_raw_sum_entry_info(struct f2fs_summary *sum)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(sum, nid);
+	DISP_u8(sum, version);
+	DISP_u16(sum, ofs_in_node);
+}
+
+static void print_sum_footer_info(struct summary_footer *footer)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u8(footer, entry_type);
+	DISP_u32(footer, check_sum);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -59,6 +78,7 @@ void inject_usage(void)
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
+	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -120,6 +140,17 @@ static void inject_sit_usage(void)
 	MSG(0, "  mtime: inject sit entry mtime\n");
 }
 
+static void inject_ssa_usage(void)
+{
+	MSG(0, "inject.f2fs --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  entry_type: inject summary block footer entry_type\n");
+	MSG(0, "  check_sum: inject summary block footer check_sum\n");
+	MSG(0, "  nid: inject summary entry nid selected by --idx <index\n");
+	MSG(0, "  version: inject summary entry version selected by --idx <index\n");
+	MSG(0, "  ofs_in_node: inject summary entry ofs_in_node selected by --idx <index\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -138,6 +169,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"nid", required_argument, 0, 9},
 		{"sit", required_argument, 0, 10},
 		{"blk", required_argument, 0, 11},
+		{"ssa", no_argument, 0, 12},
 		{0, 0, 0, 0}
 	};
 
@@ -218,6 +250,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
 			break;
+		case 12:
+			opt->ssa = true;
+			MSG(0, "Info: inject ssa\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -241,6 +277,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->sit >= 0) {
 				inject_sit_usage();
 				exit(0);
+			} else if (opt->ssa) {
+				inject_ssa_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -566,6 +605,88 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	return 0;
 }
 
+static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_summary_block *sum_blk;
+	struct summary_footer *footer;
+	struct f2fs_summary *sum;
+	u32 segno, offset;
+	block_t ssa_blkaddr;
+	int type;
+	int ret;
+
+	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
+		ERR_MSG("Invalid blkaddr %#x (valid range [%#x:%#lx])\n",
+			opt->blk, SM_I(sbi)->main_blkaddr,
+			(unsigned long)le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count));
+		return -ERANGE;
+	}
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	offset = OFFSET_IN_SEG(sbi, opt->blk);
+
+	sum_blk = get_sum_block(sbi, segno, &type);
+	sum = &sum_blk->entries[offset];
+	footer = F2FS_SUMMARY_BLOCK_FOOTER(sum_blk);
+
+	if (!strcmp(opt->mb, "entry_type")) {
+		MSG(0, "Info: inject summary block footer entry_type of "
+		    "block 0x%x: %d -> %d\n", opt->blk, footer->entry_type,
+		    (unsigned char)opt->val);
+		footer->entry_type = (unsigned char)opt->val;
+	} else 	if (!strcmp(opt->mb, "check_sum")) {
+		MSG(0, "Info: inject summary block footer check_sum of "
+		    "block 0x%x: 0x%x -> 0x%x\n", opt->blk,
+		    le32_to_cpu(footer->check_sum), (u32)opt->val);
+		footer->check_sum = cpu_to_le32((u32)opt->val);
+	} else {
+		if (opt->idx == -1) {
+			MSG(0, "Info: auto idx = %u\n", offset);
+			opt->idx = offset;
+		}
+		if (opt->idx >= ENTRIES_IN_SUM) {
+			ERR_MSG("invalid idx %u of entries[]\n", opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		sum = &sum_blk->entries[opt->idx];
+		if (!strcmp(opt->mb, "nid")) {
+			MSG(0, "Info: inject summary entry nid of "
+			    "block 0x%x: 0x%x -> 0x%x\n", opt->blk,
+			    le32_to_cpu(sum->nid), (u32)opt->val);
+			sum->nid = cpu_to_le32((u32)opt->val);
+		} else if (!strcmp(opt->mb, "version")) {
+			MSG(0, "Info: inject summary entry version of "
+			    "block 0x%x: %d -> %d\n", opt->blk,
+			    sum->version, (u8)opt->val);
+			sum->version = (u8)opt->val;
+		} else if (!strcmp(opt->mb, "ofs_in_node")) {
+			MSG(0, "Info: inject summary entry ofs_in_node of "
+			    "block 0x%x: %d -> %d\n", opt->blk,
+			    sum->ofs_in_node, (u16)opt->val);
+			sum->ofs_in_node = cpu_to_le16((u16)opt->val);
+		} else {
+			ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		print_raw_sum_entry_info(sum);
+	}
+
+	print_sum_footer_info(footer);
+
+	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
+	ret = dev_write_block(sum_blk, ssa_blkaddr);
+	ASSERT(ret >= 0);
+
+out:
+	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
+	    type == SEG_TYPE_MAX)
+		free(sum_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -579,6 +700,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_nat(sbi, opt);
 	else if (opt->sit >= 0)
 		ret = inject_sit(sbi, opt);
+	else if (opt->ssa)
+		ret = inject_ssa(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index ece4915..c828f3f 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -30,6 +30,7 @@ struct inject_option {
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
+	bool ssa;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
