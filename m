Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C16366A7AFA
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Mar 2023 06:51:42 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pXbqs-0005XQ-Hu;
	Thu, 02 Mar 2023 05:51:38 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pXbqq-0005XJ-KO
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Mar 2023 05:51:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d8U23HfExjRgsC3oxbJ1tIOZD6CMduUOQ8H1T/8W08o=; b=D4uVLEwp9XfZsanV93jgeC3zpZ
 /kkJ/BDA0VdGwWtfcjYMa68V0HrRTzE78IA63Wypqz11zwzn6LY/6/a4OtxnbNWnpM1oim4+lg39+
 FufLFFqIeoyX/mlWxxisenrSaZx2HnSgAuvcxk7bxnwPxBuYVlPfsYTbThu4nIVTC08g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=d8U23HfExjRgsC3oxbJ1tIOZD6CMduUOQ8H1T/8W08o=; b=H
 yXH8Oi9MHeMOpPpYgtEsS4ncPAJYlpCYEiSrfEROjztl5W3uu/8r9F+kpCWYScHj1mK6/HzipfurM
 cUDPwK7KndcHMerKwNwFKaMDr/MsejBhgOJswAvpA+vU+tq9pwta0X/QN/Mqh9in8axlDII+FORVi
 nn01cFa89WXxrhn8=;
Received: from mail-psaapc01on2104.outbound.protection.outlook.com
 ([40.107.255.104] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pXbqi-0006kM-VD for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Mar 2023 05:51:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AWxNByWjW2SzestqYPp0lfQyi2TfC2GaGC3hNDyn4cwM4ZCBwYOs0n1rM8kkJcJ2Hli2++eu14gfnh41NLpRI656plXeLcQ7ATrYUSSzAaXa5qMCfgCFnY6CHaV02juFM3fJwph6/v/JetOsknQh0snwEnDtLaKgKSZ23jWNwOEQQfL1iI3DkflntZLONdH0Dh5vgauU3yAx//W+A9HpXv7aEy985YafrSHEYyDo+ZadC2Ucf4/K5Q4knS/C/h7BZPSWljDGutxmDBy4dGpKt2dd1jELqvdfjGTiEBjdgwCg9/GIpCxHRy9J0O84d9GZBpBp8v+ewgU+fK/0acEUCg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d8U23HfExjRgsC3oxbJ1tIOZD6CMduUOQ8H1T/8W08o=;
 b=EysDfL0fHrhbKtjoJ5Sxmk5LZwZlKJ9c2E5h76ZbOEjLbn8Bw+BHXqnLZLK8jMDZoOWa5UKSLywU0wmYeEcCnkogUKpI/0YWwbntMTYcpx7LjC+j4caARXZlMrY3t1mITq4Jw7qMbmyhX97jLbiPF/lEDrm/eaYICtaykT1SoDm7pNqryJjB2S+8SO76bD7h7j2IUsHxRkjBRVAHbqrJoAHDyKp5cGov9bJ5RVKRgB3hLrD0EHM20hHB+F3df32KqqUH9vswvtTZrMwZEIDDFxMWbY+WnqkvvC1AGnj4oIIj51JHZnRM4BCofGo+P/NkkCAmahARdSn5cug3hnZnzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d8U23HfExjRgsC3oxbJ1tIOZD6CMduUOQ8H1T/8W08o=;
 b=PohmtqJ3ye+RLqFGTiZ8EXunllEXSvAsa6fJMKBhqbqs2SUCkyQ5Kj5wdUyH0l0+0kRX0KaKwkxiCSCnAwAyUpGvYnxlCFm27lWTWcdvTE8DpD2xO7P09n2NQYMmFO6Il4dM/TM8wXWsYhZowMNRSMcsolJem5URo2iW+U/OJ26EMC8BjWxqvBqEq/xCgbib74kDQfHvM6/OQzZgapyC6IfL+8ewjtLgsX8kFRFAe09UUcxLNyhnVBoxvb51x/ao5n8HOzy0vpv/U2QmvoSAh8eucAOPC3OFMxl3n2OVmtjQa+oJvcaQXbU0R4Cfi91qKU6MFzvHzyNuQrqrxsPE+Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYUPR06MB6220.apcprd06.prod.outlook.com (2603:1096:400:35c::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6156.16; Thu, 2 Mar
 2023 05:51:17 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6156.016; Thu, 2 Mar 2023
 05:51:17 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu,  2 Mar 2023 13:51:03 +0800
Message-Id: <20230302055103.60116-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0001.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::15) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYUPR06MB6220:EE_
X-MS-Office365-Filtering-Correlation-Id: 6f74a8fb-8b56-4abf-98dc-08db1ae22416
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: NSl8quMaOFkcGZ2NhEjGeBYLrbrqvlmMMR2j2SyPEmryQ3QRZ1eAzNv4Jq7JiwbBxbRrNJciuGG8oMzmLO5nQpBcRkBuiWEVG37Audnl2AAjO5LYzg2rLVJ2NUEoZtS3u19QLgm+AuffMJiYmZXxUE3czxD4e4/K0TG/MKbDhGQoR4BgP987/GTdQzYRdYXKKfNYOnFvdQ5cph0YNZY5g7TTlfeqdZZwmDGQtUjwIP/K27X6nrfKiacR7kXx8G85TuSU63DI80EPanC0FOvssetpirGIp8s+BujGe9F+AlM9d6lv1650DgGixronny99/cvUa6PFzNOGW06LBRWTkAYr2mebGmLpKZqOreqrrm4mtmjTWwZsCfMfDVIdtoOXKrlhWk0pfZPLrFaSbWpPuFNzliQ9Pl8ry1N32yDmFnRtBWsBIRG7umATjTY9CcHETrvAbjX1pUj5pSIycNpTwP6z1JU3OCOgd2aeNKE2XB+5LmNExOaQalnT2bJPh9UBaXh9R6yS0nSPXEeOOUysQNi6R9Pq/hOHxMHrSj5jgEE+OKO8GN1l4CDanDaWrOIizvI4mMJFnOrzwo+yEAFlNC+2HEs47xPOIomU86EHvTL3ao/8wkmXNvOBQhCZRuqnjnvMU7aIP6REGBSD0Gm/OgHiM9QBquLN2xcSytYAFZjjVoya0uxnCCPEGmVtG8oUP86Hp7UU7HEcRr+VlQtACQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(39860400002)(376002)(346002)(396003)(136003)(366004)(451199018)(2906002)(8676002)(1076003)(8936002)(36756003)(5660300002)(66946007)(66476007)(316002)(6486002)(4326008)(41300700001)(478600001)(52116002)(66556008)(86362001)(107886003)(38350700002)(38100700002)(186003)(6512007)(2616005)(6506007)(26005)(83380400001)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FWbIQXHjrVzv5cYCWIrgXcOU/ntX7JfoR8OGYwenV3j61xsTKVqJwSMhTF6+?=
 =?us-ascii?Q?szCdikRjomk/0oNoWs4qOYVQGoW0LjgyN9+UN9lIpSrRvZV6Qt5mLO/sbzEM?=
 =?us-ascii?Q?BAFoGc/QgJCBKKbtd/R2ZXBp/oGjuPKqK0XAMJsFZPjvrSKn5hv6VyH8uysT?=
 =?us-ascii?Q?3hRS4IHqd8e08KNr8RE/GGanJpbmkhT8k57nHmb3YAwVDA+kiUfMDscPwopT?=
 =?us-ascii?Q?zTEMrgS1SdEIFY76+4NCKKI0hTTKUTJcQhHjni7TA5jpp3qqsxooAvsHVOSh?=
 =?us-ascii?Q?QopWzMe5rd6QoFzpA9ZANFtTQKhSP6Lu+sIcISG58lpEuAse95xuI0XDGUnL?=
 =?us-ascii?Q?vDpU8Vwyhrn9VQuZpfTdxoT+co0JtnM9vF5WRK5fWU7p1+ZxivPfo18n8Oh9?=
 =?us-ascii?Q?kgVi6XjNyrddCJna3rv7sBJThlSPQCCgBokiJdHsU9jVBMaeI8n99XIyKRTL?=
 =?us-ascii?Q?5nkgYudhaECwVM6/Be4q++WPbUH270/bUKAr/jC+sqoAaKyuUMH7X8caXqha?=
 =?us-ascii?Q?2tuMzHj+wDlMjyB+9UkKLNB9CAl2IaFwWyokkovfM5tJhKZqLi4KhnZHG/5n?=
 =?us-ascii?Q?Sq+oC7pQV4g/hXZkKnBp/i2Tjgw9YSW2FK7UIPcEIEVJXzxEzzPaEj9VhPay?=
 =?us-ascii?Q?J6Sw9fR/ozAnPIjaD/JA7lXozae7d2EfNvrPTNTQ8fDQLAF+zlsrZs8V8ypl?=
 =?us-ascii?Q?g/1rttgGw6jDt+LXnOOcj3+0NO+lhcWUxUNKzoUrYyNZ98aA3ECW4egsU7R/?=
 =?us-ascii?Q?zVxsgpcNGJgdNdYwSCAhg/L4Jb1vLNm4Se2VoBG4L6YqDCeVSJdUZPzSgC80?=
 =?us-ascii?Q?pCL0MXdv79sHv2DyrcDi2zXYhZcWI904JvPcH5zoi3UfXPAm93rd89pA+80d?=
 =?us-ascii?Q?kWUPTTIcBjuD4nW5B2h1X2Tipxtk156uxmJBMe0D1uMBfQAYj1ph23VTZZkf?=
 =?us-ascii?Q?APyhH/6EzX7LWNF8nl07aHnohvH8J8VOfnoPlysYgRAxEhKyfXoGP2o3vKUI?=
 =?us-ascii?Q?I51Qat8fnDbHK4VhJv6s7zrlvjbRhB/cw4YLeHL68HnzdG4uDwPg2qyfZEfA?=
 =?us-ascii?Q?sT+lObeObRfGflxaDOEt21KOx2QbU6WETRFspAD9xEHvSg5Ohi1Ihn4twsjb?=
 =?us-ascii?Q?OrNKL4KQQoVrzQ+FJVPdEan28XN3c3mbmFst1wfq27dLqaPaE/GFgIy+x5o0?=
 =?us-ascii?Q?kxpJYnwv3t37PXEA3LrqQLtxCDKf7/BpBV6dsEoUHg3ownqMfqeA/IaqCKuy?=
 =?us-ascii?Q?Mqt9wFr+kYyeR1a8Pz4fYbesYeoR1bS5vnraya31PfljhTda3gdJjFwjh3hW?=
 =?us-ascii?Q?sVsi/F3VX1jgKfrM2M3qeDTJkco0KCX5rLsphlL15q9bxE6Xy2rGjxLXiGmy?=
 =?us-ascii?Q?rWjk+C9KPiK5/cvs+pJ+nizGAidhnAzBvO2A7NDykirLg4cmfTrUHnKbo4Lv?=
 =?us-ascii?Q?69Kyh4Q/HpYnIWpX1oeoRxPbrLSqrVDK8g1l2VPrzSkUcKxcZNroJedxVz4Z?=
 =?us-ascii?Q?RL5L2hNq1mDv4NzJ0lbR5VxVvNVf4KIGoEcVLSsFKdZQOxeQ7f6WRBxPUvF9?=
 =?us-ascii?Q?41VmSNaPRiKnxnn74FHduoknYdDty880AX/uaL88?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6f74a8fb-8b56-4abf-98dc-08db1ae22416
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Mar 2023 05:51:17.5479 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: rJDlN50riUE0JQIu5b4LHcQSO8xXd0BaZIwhNSVgT+lXukHOHyGuo8KesTs8BY3TXJPJNN1q45ht1OZZVqFHng==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6220
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It makes the discard process run faster on a more powerful
 CPU, or not. And if bind it to a specific cpu, it is possible to have more
 cache locality. Signed-off-by: Yangtao Li <frank.li@vivo.com> --- v2: -fix
 kernel test robot warn Documentation/filesystems/f2fs.rst | 2 ++
 fs/f2fs/f2fs.h
 | 1 + fs/f2fs/segment.c | 8 ++++++- fs/f2fs/super.c | 36 ++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.104 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.104 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pXbqi-0006kM-VD
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce discard_cpuset mount opt
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

It makes the discard process run faster on a more powerful CPU, or not.
And if bind it to a specific cpu, it is possible to have more cache
locality.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-fix kernel test robot warn
 Documentation/filesystems/f2fs.rst |  2 ++
 fs/f2fs/f2fs.h                     |  1 +
 fs/f2fs/segment.c                  |  8 ++++++-
 fs/f2fs/super.c                    | 36 ++++++++++++++++++++++++++++++
 kernel/kthread.c                   |  1 +
 5 files changed, 47 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 2055e72871fe..dc005f3b784a 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -351,6 +351,8 @@ age_extent_cache	 Enable an age extent cache based on rb-tree. It records
 			 data block update frequency of the extent per inode, in
 			 order to provide better temperature hints for data block
 			 allocation.
+discard_cpuset=%u		 Set the cpumask of dicard thread, it makes the discard
+			 process run faster on a more powerful CPU, or not.
 ======================== ============================================================
 
 Debugfs Entries
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b0ab2062038a..62ce02a87d33 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -183,6 +183,7 @@ struct f2fs_mount_info {
 	int compress_mode;			/* compression mode */
 	unsigned char extensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN];	/* extensions */
 	unsigned char noextensions[COMPRESS_EXT_NUM][F2FS_EXTENSION_LEN]; /* extensions */
+	struct cpumask discard_cpumask; /* discard thread cpumask */
 };
 
 #define F2FS_FEATURE_ENCRYPT		0x0001
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 227e25836173..2648c564833e 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2054,11 +2054,17 @@ int f2fs_start_discard_thread(struct f2fs_sb_info *sbi)
 	if (!f2fs_realtime_discard_enable(sbi))
 		return 0;
 
-	dcc->f2fs_issue_discard = kthread_run(issue_discard_thread, sbi,
+	dcc->f2fs_issue_discard = kthread_create(issue_discard_thread, sbi,
 				"f2fs_discard-%u:%u", MAJOR(dev), MINOR(dev));
 	if (IS_ERR(dcc->f2fs_issue_discard)) {
 		err = PTR_ERR(dcc->f2fs_issue_discard);
 		dcc->f2fs_issue_discard = NULL;
+	} else {
+		if (!cpumask_empty(&F2FS_OPTION(sbi).discard_cpumask)) {
+			kthread_bind_mask(dcc->f2fs_issue_discard,
+					&F2FS_OPTION(sbi).discard_cpumask);
+		}
+		wake_up_process(dcc->f2fs_issue_discard);
 	}
 
 	return err;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index fbaaabbcd6de..8ecbe3595f34 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -164,6 +164,7 @@ enum {
 	Opt_discard_unit,
 	Opt_memory_mode,
 	Opt_age_extent_cache,
+	Opt_discard_cpuset,
 	Opt_err,
 };
 
@@ -243,6 +244,7 @@ static match_table_t f2fs_tokens = {
 	{Opt_discard_unit, "discard_unit=%s"},
 	{Opt_memory_mode, "memory=%s"},
 	{Opt_age_extent_cache, "age_extent_cache"},
+	{Opt_discard_cpuset, "discard_cpuset=%u"},
 	{Opt_err, NULL},
 };
 
@@ -1256,6 +1258,22 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		case Opt_age_extent_cache:
 			set_opt(sbi, AGE_EXTENT_CACHE);
 			break;
+		case Opt_discard_cpuset:
+			if (!f2fs_hw_support_discard(sbi)) {
+				f2fs_warn(sbi, "device does not support discard");
+				break;
+			}
+
+			if (args->from && match_int(args, &arg))
+				return -EINVAL;
+
+			if (!cpu_possible(arg)) {
+				f2fs_err(sbi, "invalid cpu%d for discard_cpuset", arg);
+				return -EINVAL;
+			}
+
+			cpumask_set_cpu(arg, &F2FS_OPTION(sbi).discard_cpumask);
+			break;
 		default:
 			f2fs_err(sbi, "Unrecognized mount option \"%s\" or missing value",
 				 p);
@@ -1358,6 +1376,14 @@ static int parse_options(struct super_block *sb, char *options, bool is_remount)
 		f2fs_err(sbi, "Allow to mount readonly mode only");
 		return -EROFS;
 	}
+
+	if (!cpumask_empty(&F2FS_OPTION(sbi).discard_cpumask) &&
+			!cpumask_intersects(cpu_online_mask,
+				&F2FS_OPTION(sbi).discard_cpumask)) {
+		f2fs_err(sbi, "Must include one online CPU for discard_cpuset");
+		return -EINVAL;
+	}
+
 	return 0;
 }
 
@@ -1884,6 +1910,7 @@ static inline void f2fs_show_compress_options(struct seq_file *seq,
 static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 {
 	struct f2fs_sb_info *sbi = F2FS_SB(root->d_sb);
+	unsigned int cpu;
 
 	if (F2FS_OPTION(sbi).bggc_mode == BGGC_MODE_SYNC)
 		seq_printf(seq, ",background_gc=%s", "sync");
@@ -1909,6 +1936,8 @@ static int f2fs_show_options(struct seq_file *seq, struct dentry *root)
 			seq_printf(seq, ",discard_unit=%s", "segment");
 		else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
 			seq_printf(seq, ",discard_unit=%s", "section");
+		for_each_cpu(cpu, &F2FS_OPTION(sbi).discard_cpumask)
+			seq_printf(seq, ",discard_cpuset=%u", cpu);
 	} else {
 		seq_puts(seq, ",nodiscard");
 	}
@@ -2340,6 +2369,13 @@ static int f2fs_remount(struct super_block *sb, int *flags, char *data)
 		goto restore_opts;
 	}
 
+	if (!cpumask_equal(&org_mount_opt.discard_cpumask,
+			&F2FS_OPTION(sbi).discard_cpumask)) {
+		err = -EINVAL;
+		f2fs_warn(sbi, "switch discard_cpuset option is not allowed");
+		goto restore_opts;
+	}
+
 	if ((*flags & SB_RDONLY) && test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = -EINVAL;
 		f2fs_warn(sbi, "disabling checkpoint not compatible with read-only");
diff --git a/kernel/kthread.c b/kernel/kthread.c
index 7e6751b29101..8ddc2cd1b27e 100644
--- a/kernel/kthread.c
+++ b/kernel/kthread.c
@@ -541,6 +541,7 @@ void kthread_bind_mask(struct task_struct *p, const struct cpumask *mask)
 {
 	__kthread_bind_mask(p, mask, TASK_UNINTERRUPTIBLE);
 }
+EXPORT_SYMBOL_GPL(kthread_bind_mask);
 
 /**
  * kthread_bind - bind a just-created kthread to a cpu.
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
