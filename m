Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 229CD6D097C
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 30 Mar 2023 17:25:39 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1phu9d-0000YX-Tv;
	Thu, 30 Mar 2023 15:25:34 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1phu9c-0000YQ-J9
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 15:25:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l6UOYNrhS/ATqFSBARfWj7xnbFE94bckjujkFNerpdk=; b=SNO7urU8++tgTPClKJOElFngVw
 CCOnCqXobkQNOCkNuzpQ2UyK5ZDSATRylNVrd4qRL9clJ8362PSx03vpYpj3OvwdgZVwITgbn1hTQ
 GM19b8oA+cy0vufpdOXY1GBjzr/MeMR+rtxNK1usGx1pka8BuUwL+5uXwpwqYyLJY60A=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l6UOYNrhS/ATqFSBARfWj7xnbFE94bckjujkFNerpdk=; b=P
 bfZQchehJ0VK7onwCAhhvq+kPi0M0g+47C/ToK1g2Nc4492B9ujmXbxvYki0kgA9QlNZBHmuZ1Sa3
 KmXHTPDIYsQba/huJq0vhRs0yopmYP73oLWoW+2yvbtDyItOb7EOJOr2LsrrWG6YnTV6ZKtTAdKGs
 qK5jmNZUhlqmz04M=;
Received: from mail-tyzapc01on2131.outbound.protection.outlook.com
 ([40.107.117.131] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1phu9c-009pMt-GP for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 30 Mar 2023 15:25:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HSYapoPeMXlz8py87SaIwwziyi62n+h1KV6LASJlklml9UKujnQvDP1i44Q/lgB7goBo/XCfOarHzNmFlMCeP2IeorDq4vxBd72qQUCBE/ObYUm0QFPfEmLKly6bj7mnqhGBBQnkLZXCmiRRz7lyxlVliZP3EMDmWLjTgHfX+As/+azsjDOEimwQGwhPCYeDivg4hVa1qBzSy6KttEihZxxqX1Npd+h3aDwHcKGhDqP6jKTKTZ+/XbYKBR3qg5TQyEifWu6KJXO5IhXPJxSfa1MwrRmYAhtW3MUnlonDzl4SN7pScUxSTksHzfWxVwSSEsizejAIMSOgJohNsIoceA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=l6UOYNrhS/ATqFSBARfWj7xnbFE94bckjujkFNerpdk=;
 b=E9TO2WxVO0SQvaVHqoIeYFGMYoR650C/t3k2odM4Ja6sNvjwW99CWGnEUccBOx0d9P4eqG0ty0Y9rkfs9Ip9MsdqV1eFUYmv/MNGOcnbv/xkGT0GTIq2oksuVYoLdvoqNtzC8WaVDeU61gOAFvV2zLxnShoqWeyGgp9U9ZnwmPG5S8n6+0G2FDu/a1Ta/Up1rOiwxgtyOAYsPHl8AMx1jJRVkej6VXX95Ds/+aSLW2k/2Ttoo4YGJuCx9RC9JUU9sdskFo4GEsQ2C07FFkh2Cc4Q1tQTb+l83TMLGzBSoZUtEKLH3F90V/Kt8vKk+LcND/P1cvuMPgihfzWifEmhpg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l6UOYNrhS/ATqFSBARfWj7xnbFE94bckjujkFNerpdk=;
 b=UqSxE16jsg01KRK19MSGhC/UM3RoinsQvhkmu8YSCKBsz7l1vPABkRbMTFO1lpV83dEJZFGms2mg3k+QbmfT/Krz5OWKlb/N9Ft9/tBjJfYn1QODKfpMdEcOFm5EsGoAob6MCxLT1gEU3QNvMpAIg15Zlgd+Sw3rqkXNnk4zqsmS56hMY2HmQWqZ+I/z1XeRhE3ggoPooquCyQCY4s0MfUs3bojOboFWOAq9zSvqkSqNeX9KlUkh8UcK3sDgp6IzEFlmL3im/HWV8Ce/LbXW0Bo+hnzqwnN2GVCRr19GsD1OH09xIOEsaRk89KJW0nkSb6oxGco/ybsXoLp0DI3A/A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4393.apcprd06.prod.outlook.com (2603:1096:4:155::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.20; Thu, 30 Mar
 2023 15:25:21 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6222.033; Thu, 30 Mar 2023
 15:25:21 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 30 Mar 2023 23:25:10 +0800
Message-Id: <20230330152510.81886-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG3P274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::27)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4393:EE_
X-MS-Office365-Filtering-Correlation-Id: ae098078-7bea-4089-a34a-08db3132f9c4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qHOYdLfeqqjBB5IYkEJLXGkaDcPusDjc8tcsPR5u5FWdQbg9x4XI5twma23dmNuaqDjVlHOmTltA+YJF05lPwQJCFi6o5gx44I92KYMy4f+iczXVZWEdcnLFzPksNLVXoBaaScvhfsPrK80rq93htsyyG2ga4mbFCR6gmyxbKIwGCBZcgGWtWeumzShlmnVIK7qXEC5lm9YkSXxw9VI9UWVcZFEGMQCnFmroYM60v9aROJln9f3eGmk/8lKccY/IYalXxyX4anrTGPHmy/kpX/SBP9iPZu7cHB/z/YsrP0AxW5U+Aa2Kmh2OvxxZoLVwa9bU30bDSQZ4+iEUNjYvzaU08TnT/+HkauiQD7hJ8YToIfRoHDcwirTpXeGeXWKPAH6v/v9jtHhlJWd6yB1ZSwR1ZHfuA7nIHzf6UYqz4R/BR4kOQ8K1X/i++PrDIP9+9+6Fo5nilhlRzW+EyOKrJmu83QVv8E2y3/OHq+JjjcsOxoFIk2cghNHGSwH+I9gmww3hJAWcuYUYbmSwJC1P+x0hnKij5UFeQ6KUiaMmC8XyCvX8WuF8my6iUBl0PUJXnfo6WTn77uEbxx2pPK5MCvryOX7uQR/3rEsR0b6JT/SpuVLYe7YhE2pWEA1W72nH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(39860400002)(136003)(366004)(346002)(396003)(451199021)(2906002)(8936002)(86362001)(66946007)(41300700001)(66476007)(66556008)(8676002)(4326008)(186003)(36756003)(316002)(19627235002)(6512007)(6506007)(1076003)(107886003)(26005)(83380400001)(5660300002)(52116002)(6486002)(6666004)(38350700002)(2616005)(38100700002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WWl+6Nu/OeIKaDRbfJSuH8+1+TSSMh0RPc8XxNSf5Drny2YsUc5tT4bC5tGr?=
 =?us-ascii?Q?eVdaj+KEJI8pSGaPLxtNCgXk6JzZGjEHd4BVXyJ6vU5BCqkg9vpb+l8UzzE7?=
 =?us-ascii?Q?FjlIjA8VH1CJat8aFJC76+5+o+lt0+P3QKMpL805HHYGXPUlSYYaeV1G57iv?=
 =?us-ascii?Q?6j2uynnyHC3S+RijPoosXSRnpEmgpZYXo/WkuNjkPJ7dm4zKhxGxyEaQJb2M?=
 =?us-ascii?Q?EJ2Ha/bzm7Tzaynp6RJYB08NURTSY36bsk0rCnus96fanhbi0kmGIpFHpN6s?=
 =?us-ascii?Q?CQRuWfMFqZqsmYoOq2KGA2fxwy570RFY28vQbpYrml2DqgBeWPMvuSauh1jK?=
 =?us-ascii?Q?sgLkie41hC+q/o22KMQ7DbBM9VKP5NbrwnybZMMlm7AANdQKb452zlE0M2HI?=
 =?us-ascii?Q?A1O2TsGjGS2ulsD7MILckXgomieCp5/F9GO5bg1d/tyrWbUPAvg7HucUYAW5?=
 =?us-ascii?Q?0n+CAzqAOUXR7peX246rpnjzx25U4Lo3q/5vKJ6OmGCW3ghKVNqrCJzNaQ/4?=
 =?us-ascii?Q?5wgmvS+9BU3RDWEUpqI97fQWPK4AL63PQw2LYHmXGLyKIWHvJMIgKIgxHD4W?=
 =?us-ascii?Q?ehjKAoN/WwZHb1HPFy/w7Qmse2980amOuKPfiMlYYrJsURLp2BKW5sI2qcTq?=
 =?us-ascii?Q?99ZPP7gMgJgZF3Uib8BTRf7Nz4xmcmGzuiDwc2LiP1gocAlqZLFcnffPgNPq?=
 =?us-ascii?Q?HhJ2gw8xDCrOqeYGQ/SGnJotaR6/309LvSdkKrmUCG9bjz279+2PjoQB5a1W?=
 =?us-ascii?Q?bCHJQ8qaLkSvqiKxOBBpjVglg8m+HbK5H7llLQYbF9R92a8yqzzz/iFTGCQ2?=
 =?us-ascii?Q?akimf9pas3fp3QlLHds40td/mpNM/1UAe977DyfFVTPA2fwzESJqL/WHDgws?=
 =?us-ascii?Q?f80YnEMhNi0It19U3K3KxpCg/LHg7N8iikLYtgMPl1X6wjvDf5m9sFTTHX21?=
 =?us-ascii?Q?dmaobMnKecYJPYUYDx2tcVSh2ozIwSuHb9Erj6dpIXPdo985ulg9V/Fkp+ly?=
 =?us-ascii?Q?calX/PCXYYTxpr/uzvaRwIYidV9W549I64Ur11j5hQ6UouxOTlKkCFHZdqaC?=
 =?us-ascii?Q?z9Uxt6JQ+eXixnC5DM/HLEuI9asOt3Upf0t5cKlCl/xciiaH+9s27mzgBU40?=
 =?us-ascii?Q?8meu/EnrLqZt1m7GXOqR1EGceQR60ujnIpWCUDbEGA4CFUEzW8CE/TFVbURE?=
 =?us-ascii?Q?c6UojPxVUDapVThsILQikMx3Tc4WDlIvlZjQdyRMSUpv5Ts7WlOhTYuW1rmq?=
 =?us-ascii?Q?d+3Z5SX632hWoZjvjNWdfPAdImlpayAt4wTwM5zhL2bnxDgRyoGZNwrjd4z2?=
 =?us-ascii?Q?jivGhLhV82p9xL4mLBT+FId6398k4CKRMALZqT33MMfdzptXqZKvGCM14h4k?=
 =?us-ascii?Q?WwNNNcT/pW9wV23fzUgWow2WYshvcyC+1PtqSLjxyIVBormYJ2M05Eqvvnud?=
 =?us-ascii?Q?bN7l0F+0dZ8px/8i/KJs0ePyae66wvfjp69e5VWr0UzVKcH7SIl1k7Y0zUHC?=
 =?us-ascii?Q?oPziSqVsAkEEFFUBBuEapug0CZoKrp4kMCwBCXlYdeq8OVfEueawHs/AIH8+?=
 =?us-ascii?Q?TlHbHOzBrbus0aBLyYfglXZ5okkQlR73MgAeGvKb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ae098078-7bea-4089-a34a-08db3132f9c4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Mar 2023 15:25:21.4267 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lSTgMfRE5jXLyhNkxhYIo0xXdWUa4CaIEJiipOz35meOfuwcUj58bMMiAkwXmilZVxnL3bZvzhtwOdC7RN+Jyg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4393
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Similar to FAULT_LOCK_OP, this patch supports to inject fault
 into f2fs_down_write_trylock(). Usage: a) echo 524288 >
 /sys/fs/f2fs/<dev>/inject_type
 or b) mount -o fault_type=524288 <dev> <mountpoint> 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.131 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.131 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1phu9c-009pMt-GP
Subject: [f2fs-dev] [PATCH v2] f2fs: support fault injection for
 f2fs_down_write_trylock()
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

Similar to FAULT_LOCK_OP, this patch supports to inject fault into
f2fs_down_write_trylock().

Usage:
  a) echo 524288 > /sys/fs/f2fs/<dev>/inject_type or
  b) mount -o fault_type=524288 <dev> <mountpoint>

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-remove f2fs_down_write_trylock macro
 Documentation/ABI/testing/sysfs-fs-f2fs |  1 +
 Documentation/filesystems/f2fs.rst      |  1 +
 fs/f2fs/checkpoint.c                    |  4 ++--
 fs/f2fs/f2fs.h                          |  7 ++++++-
 fs/f2fs/file.c                          |  8 ++++----
 fs/f2fs/gc.c                            | 10 +++++-----
 fs/f2fs/node.c                          |  2 +-
 fs/f2fs/super.c                         |  1 +
 8 files changed, 21 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index c1314b7fe544..fc0f82f5c9f9 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -714,6 +714,7 @@ Description:	Support configuring fault injection type, should be
 		FAULT_DQUOT_INIT         0x000010000
 		FAULT_LOCK_OP            0x000020000
 		FAULT_BLKADDR            0x000040000
+		FAULT_LOCK               0x000080000
 		===================      ===========
 
 What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 2055e72871fe..a81c896464ff 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -206,6 +206,7 @@ fault_type=%d		 Support configuring fault injection type, should be
 			 FAULT_DQUOT_INIT	  0x000010000
 			 FAULT_LOCK_OP		  0x000020000
 			 FAULT_BLKADDR		  0x000040000
+			 FAULT_LOCK	          0x000080000
 			 ===================	  ===========
 mode=%s			 Control block allocation mode which supports "adaptive"
 			 and "lfs". In "lfs" mode, there should be no random
diff --git a/fs/f2fs/checkpoint.c b/fs/f2fs/checkpoint.c
index 1e0164cde23d..b119c9ab0cc1 100644
--- a/fs/f2fs/checkpoint.c
+++ b/fs/f2fs/checkpoint.c
@@ -372,7 +372,7 @@ static int f2fs_write_meta_pages(struct address_space *mapping,
 		goto skip_write;
 
 	/* if locked failed, cp will flush dirty pages instead */
-	if (!f2fs_down_write_trylock(&sbi->cp_global_sem))
+	if (!f2fs_down_write_trylock(sbi, &sbi->cp_global_sem))
 		goto skip_write;
 
 	trace_f2fs_writepages(mapping->host, wbc, META);
@@ -1185,7 +1185,7 @@ static bool __need_flush_quota(struct f2fs_sb_info *sbi)
 	if (!is_journalled_quota(sbi))
 		return false;
 
-	if (!f2fs_down_write_trylock(&sbi->quota_sem))
+	if (!f2fs_down_write_trylock(sbi, &sbi->quota_sem))
 		return true;
 	if (is_sbi_flag_set(sbi, SBI_QUOTA_SKIP_FLUSH)) {
 		ret = false;
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e73fefe0d8fb..d434c25fa175 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -61,6 +61,7 @@ enum {
 	FAULT_DQUOT_INIT,
 	FAULT_LOCK_OP,
 	FAULT_BLKADDR,
+	FAULT_LOCK,
 	FAULT_MAX,
 };
 
@@ -2193,8 +2194,12 @@ static inline void f2fs_down_write(struct f2fs_rwsem *sem)
 	down_write(&sem->internal_rwsem);
 }
 
-static inline int f2fs_down_write_trylock(struct f2fs_rwsem *sem)
+static inline int f2fs_down_write_trylock(struct f2fs_sb_info *sbi,
+					struct f2fs_rwsem *sem)
 {
+	if (time_to_inject(sbi, FAULT_LOCK))
+		return 0;
+
 	return down_write_trylock(&sem->internal_rwsem);
 }
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 14e9a20e68df..db8c435d6201 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -2462,7 +2462,7 @@ static int f2fs_ioc_gc(struct file *filp, unsigned long arg)
 		return ret;
 
 	if (!sync) {
-		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
@@ -2506,7 +2506,7 @@ static int __f2fs_ioc_gc_range(struct file *filp, struct f2fs_gc_range *range)
 
 do_more:
 	if (!range->sync) {
-		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
@@ -2851,7 +2851,7 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 	f2fs_down_write(&F2FS_I(src)->i_gc_rwsem[WRITE]);
 	if (src != dst) {
 		ret = -EBUSY;
-		if (!f2fs_down_write_trylock(&F2FS_I(dst)->i_gc_rwsem[WRITE]))
+		if (!f2fs_down_write_trylock(sbi, &F2FS_I(dst)->i_gc_rwsem[WRITE]))
 			goto out_src;
 	}
 
@@ -2971,7 +2971,7 @@ static int f2fs_ioc_flush_device(struct file *filp, unsigned long arg)
 	end_segno = min(start_segno + range.segments, dev_end_segno);
 
 	while (start_segno < end_segno) {
-		if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			ret = -EBUSY;
 			goto out;
 		}
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 7e97e4284db5..302950c6cbeb 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -104,7 +104,7 @@ static int gc_thread_func(void *data)
 		if (foreground) {
 			f2fs_down_write(&sbi->gc_lock);
 			goto do_gc;
-		} else if (!f2fs_down_write_trylock(&sbi->gc_lock)) {
+		} else if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock)) {
 			stat_other_skip_bggc_count(sbi);
 			goto next;
 		}
@@ -1577,7 +1577,7 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 				return submitted;
 			}
 
-			if (!f2fs_down_write_trylock(
+			if (!f2fs_down_write_trylock(sbi,
 				&F2FS_I(inode)->i_gc_rwsem[WRITE])) {
 				iput(inode);
 				sbi->skipped_gc_rwsem++;
@@ -1620,11 +1620,11 @@ static int gc_data_segment(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 			int err;
 
 			if (S_ISREG(inode->i_mode)) {
-				if (!f2fs_down_write_trylock(&fi->i_gc_rwsem[READ])) {
+				if (!f2fs_down_write_trylock(sbi, &fi->i_gc_rwsem[READ])) {
 					sbi->skipped_gc_rwsem++;
 					continue;
 				}
-				if (!f2fs_down_write_trylock(
+				if (!f2fs_down_write_trylock(sbi,
 						&fi->i_gc_rwsem[WRITE])) {
 					sbi->skipped_gc_rwsem++;
 					f2fs_up_write(&fi->i_gc_rwsem[READ]);
@@ -2150,7 +2150,7 @@ int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count)
 	secs = div_u64(shrunk_blocks, BLKS_PER_SEC(sbi));
 
 	/* stop other GC */
-	if (!f2fs_down_write_trylock(&sbi->gc_lock))
+	if (!f2fs_down_write_trylock(sbi, &sbi->gc_lock))
 		return -EAGAIN;
 
 	/* stop CP to protect MAIN_SEC in free_segment_range */
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index bd1dad523796..e8e838f72ae6 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -517,7 +517,7 @@ int f2fs_try_to_free_nats(struct f2fs_sb_info *sbi, int nr_shrink)
 	struct f2fs_nm_info *nm_i = NM_I(sbi);
 	int nr = nr_shrink;
 
-	if (!f2fs_down_write_trylock(&nm_i->nat_tree_lock))
+	if (!f2fs_down_write_trylock(sbi, &nm_i->nat_tree_lock))
 		return 0;
 
 	spin_lock(&nm_i->nat_list_lock);
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 7d0202f7b317..768be1c76a47 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -62,6 +62,7 @@ const char *f2fs_fault_name[FAULT_MAX] = {
 	[FAULT_DQUOT_INIT]	= "dquot initialize",
 	[FAULT_LOCK_OP]		= "lock_op",
 	[FAULT_BLKADDR]		= "invalid blkaddr",
+	[FAULT_LOCK]		= "lock",
 };
 
 void f2fs_build_fault_attr(struct f2fs_sb_info *sbi, unsigned int rate,
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
