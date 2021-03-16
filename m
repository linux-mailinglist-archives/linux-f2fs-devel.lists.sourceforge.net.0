Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E1EC133D4B2
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 16 Mar 2021 14:17:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uBmJqqPamxa6qDV7K+Vi1T1IFqvU1mkSEMeaTxdRuNA=; b=ZsR093k8jthylb8RJiXEBdHg1a
	ulFrIlC1sronv4N9udQFzHddTdisHd8dJMVikFJ60dNqZlfMyybSxANa55mNyNR4jvXBWiJdjDO8L
	DLlUYtGOa3XNF1noCgrS2YP258q8iilrTS2/NXLt57iGn68Vom3SkQPvuEQp+OuBGvP4=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1lM9Yu-0007C2-DS; Tue, 16 Mar 2021 13:16:40 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <guoweichao@oppo.com>) id 1lM9Yq-0007Bq-Jr
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 13:16:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Message-Id:Date:Subject:
 Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=l99h/4Rbp9ljUh8V8HNfBTXLCs8ehlIiG5o3dzC78QQ=; b=dULolpohc8llR8DVelhjHklGDi
 TnCgSISeuF6klSGahU1jnAy185grbWwjbPEHe30f9qS4/CQ8NzUwI7KyV8jZKwJOprNjjowwZF6Zu
 whAhbQr/rGOY7XhJaAD9PqIysrqjujCkKZ7Xi54j+Hsa999yS3xkCXGeVcl3OLRC9rm8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Message-Id:Date:Subject:Cc:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=l99h/4Rbp9ljUh8V8HNfBTXLCs8ehlIiG5o3dzC78QQ=; b=g
 lgkbMm3CVC8a6icAAvo/d5v3dV2b40y0M94Ymck7ZazLHDLJ5P3R02r9Od2SaTW43tAlTnhR5ndB2
 G34R22HdhS+jDc+GfVkxWqIJSel86FXmdKk+8M5cIOLLaNkmCzE+u0F0DVnfRzZULGP0zm/sl1QJY
 8d9feU7bVtJYeKKY=;
Received: from mail-eopbgr1320048.outbound.protection.outlook.com
 ([40.107.132.48] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.2)
 id 1lM9Yb-006G1j-KY
 for linux-f2fs-devel@lists.sourceforge.net; Tue, 16 Mar 2021 13:16:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jIdLo7g2Ca/GYpPtyFILIr74qtHQc/NcpBnmCwJpZfRA38RGEJnLequUMnzWVRHZy8/gaREvMJnNna3kBqzlHZ3RhomTE+xZJmIeFJKsRMznF5s0VHEY3EhRv+o5wmt/GeKiJ3hw4JIDIcB26yGuzarVYjefGLetvqNAi0vvoY8SaLs2TWo34PLUWpiriS2/nEFwzdZaH0aqAQnzfQHrs+t+Mkfeb/qm+EYFSbU0eVf5T/8ox5rceeQhC7uc8wwCCSVpiTsfrgzdx4aA/zgoRmOtmjm6wRwtE6SC7ZFN7GmK3PEjywM9Mc0wFbeeMISimjNImDhQpfrEYQe/LCV4QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l99h/4Rbp9ljUh8V8HNfBTXLCs8ehlIiG5o3dzC78QQ=;
 b=NOP1XKBCS15U2t1yAm3t4Z7VE1x/sUTpSnsvArkCkSSvcATLC0nB3uMpUU9owXt81SakHFqrIT6+8hyEM29OgcAAL7T4Ha0LonCyZ+H1M5ZnZ8NOASnKmDt4xlxXibaSg5NPyHil1QrfBsZYIQ6CjxJi2jYq8WO8CIMhgAvx/vHmDzZH3BskyWmUsWauvWSFmNqJzOkh+WaZYaD9ELaff8e4Yk/45KiExgwUeBVvJ0GkdgGzSyAF2BPSL14VVhzllkvNT0F+oNwZ5aI7C5YANUYiN8L376Wwqm8foxCRgOGB/fF2F6a4WIA2oCXoXzqvLYkIZhbdwG1YenqB3+x1Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=l99h/4Rbp9ljUh8V8HNfBTXLCs8ehlIiG5o3dzC78QQ=;
 b=qlaLBpmy20+SrTyt3bFNtIjOTnEdbJNR3f3iRI2cDDyVLCly5FXXUmf8mJlLtBw8fbQtHwFDyK2SuhXDpGl8cWVqMkPpTRGICNrCbrAvE/nZCMdoc5xsXixYuBN7gKw5zIhWVCd6Iy2KwwnP5YAtCjbXTm3TPT/+Bqkk8Missxo=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=oppo.com;
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com (2603:1096:203:6e::12)
 by HK2PR02MB4257.apcprd02.prod.outlook.com (2603:1096:202:35::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3933.32; Tue, 16 Mar
 2021 13:16:12 +0000
Received: from HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2]) by HK0PR02MB2690.apcprd02.prod.outlook.com
 ([fe80::9cfd:51dc:bd7:62d2%2]) with mapi id 15.20.3933.032; Tue, 16 Mar 2021
 13:16:12 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 16 Mar 2021 21:15:22 +0800
Message-Id: <1615900522-20747-1-git-send-email-guoweichao@oppo.com>
X-Mailer: git-send-email 2.7.4
X-Originating-IP: [58.252.5.74]
X-ClientProxiedBy: HK2PR02CA0221.apcprd02.prod.outlook.com
 (2603:1096:201:20::33) To HK0PR02MB2690.apcprd02.prod.outlook.com
 (2603:1096:203:6e::12)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from N80263842.adc.com (58.252.5.74) by
 HK2PR02CA0221.apcprd02.prod.outlook.com (2603:1096:201:20::33) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.3933.32 via Frontend Transport; Tue, 16 Mar 2021 13:16:11 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 8a30500a-f419-478e-d059-08d8e87dab75
X-MS-TrafficTypeDiagnostic: HK2PR02MB4257:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <HK2PR02MB42574CD4AF0A3C941B294CEAB66B9@HK2PR02MB4257.apcprd02.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:4941;
X-MS-Exchange-SenderADCheck: 1
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CN3cI9VKb3MXi89j6Sw6hYIJbLOifO3k4i8/8IdEXKRm0Kto+v4+nJIZ/i4E+2+L8XleBt+KVBTyZo1fw05eO5G8/6nB62kd65A9q+j3U0Rq/PQ5tCa8+znBHamtY4sH8y98OCsQRGGYsrdjWroTeoaBEGiEIAmk2GZPArkmTa9/Vxu1293zzO/t0rT3gw7I8hwRJUvis92Dz5lr6/wrl/T1loBn6+yx8FSr4kQVf/EvK8CNN4X8neHpXjIdEAj2yoeaNQnyItUc2ZyZ4xcz4KEuQU9UKT0gunOPXBd7Uj75H+HSDTmK2I46mK1WJMUlBQ/x8ahKtj8eXXA2RbLxzJIu+aswLaeGkSQGp1VKkxX6OENA6914JOjo1lsHUEOWWBDDseMzJQjBzzpbCKYCF6rcamxRXxJmBMwOH5lHSTEDyZwECEAGeed4Jw/dcrfLSOu6iEEtY51DCfRXSwkS27qLwEpoGqu3PkOLV3OeBlmyUbYorrjKXlDmZ7x07f24bYpM8Xp+4TQrpsrFJyaFOg1VfGBzKgaztmA14FR4zgns94jHVj89VMEYPS01V5fj7fa9mDjavRSJRRNqSmLvuZr1da2/TgAqjgYCkopOHJk=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:HK0PR02MB2690.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(376002)(39860400002)(346002)(366004)(136003)(396003)(66946007)(6506007)(52116002)(956004)(186003)(6666004)(16526019)(66476007)(54906003)(2906002)(2616005)(86362001)(107886003)(66556008)(36756003)(8676002)(478600001)(4326008)(316002)(5660300002)(26005)(83380400001)(6512007)(6486002)(8936002)(11606007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData: =?us-ascii?Q?z9G/3leivkfXuynUfNUIuon1JfgKQVFo1EZEhKpUnELTxZuBCCP/ut5V35to?=
 =?us-ascii?Q?r3v/CdI2J9UDmFBWhZe+OckroBje7V1/oRJ6GtEID/aAty0QTzWNt9pqvQpj?=
 =?us-ascii?Q?fpvke2DqYhLDgOB+in5N8wdqu4cMPuKgt+75SEixU2YyxLkHwHCxFTeTEigh?=
 =?us-ascii?Q?mz5yIg5n9y7Xmn/CzcE4wlhmIZDPystLWONQ+VkJ34IebiN6+FwKrruKrRw8?=
 =?us-ascii?Q?lv2lhs702w9VZNVMhfMMGF1Fc/FzQi4g6O5h+M1cZvu5oj4eM/tEdvNcy5bu?=
 =?us-ascii?Q?WTQFxGVHcMtacplj0Sl0mBzGHf9vaVMSozc/nseZChQtSchRy/fyCHqzPKKS?=
 =?us-ascii?Q?xc3NfJuzWqiocMCyGm5ovAipPgR3Akuazz4uyF+4uAXkXpRO3R8W8Dh/ET6L?=
 =?us-ascii?Q?6KMfF0O6Dh8Zdzetn8KQoVdx77ekxy39fE4RzisWoEf0M9HHh5Np6nbLXGYC?=
 =?us-ascii?Q?7hSlgoInXVeESdBaxx9zjSfmpG48yqypGtYVW+uFDRC7PE0bQQl5caTGo53/?=
 =?us-ascii?Q?t3ZHWEZA0Rdon7uClASNttm0SJ+xlE8KiiwGzuUPUqBYDt0Aezrq94L/+ftU?=
 =?us-ascii?Q?V8pyTM60O1Mo97kgTgqp9OLj9957LqMxqpyPUj2p0Prx6rK2TI4cDDrHGNRd?=
 =?us-ascii?Q?nJiWurAoxvR0sRPipGvdIOTQ+tOKrQZzUYPEY4ZA1h3YQTfSBwcyQxay7JOO?=
 =?us-ascii?Q?NNued8lK99xyLTkK2ZeT8jbyBYipOJYGI4eGtPQ1tKkhP6v80IzoxLk7PiqS?=
 =?us-ascii?Q?ITuJdrnYTpf7ovYgv7hivI7KM/8nJDbC6jUgOrfAOGsPg4qwGe+t5aexNGWD?=
 =?us-ascii?Q?N3Hvat7ubg2AzKvHahe3uFDADZ+LHSjbfqoa3sJsU49w+5J886UAAFyIc/cI?=
 =?us-ascii?Q?bXcuJMO3lehC55I3m/mrMHqVNhTEXvU9VCutHYEV8AAg0ll9oGaankGmnnSx?=
 =?us-ascii?Q?iwNAsIWgeTAuFLwXW8X5qyf1kChqQCMQed5+I2zLLePAPskdI0vqLKCqoyj5?=
 =?us-ascii?Q?xyDVpZCusopXLCYkacY4yn92Xl3HEEM/oWEPOxTW7jCasfKz/JFoM9wvcR5R?=
 =?us-ascii?Q?RHlie5F4OWZcFDifj08pmVjZxjZN5VwjHH7aqZcJeEYMbQ9zDv3VMISFnV6J?=
 =?us-ascii?Q?4FlwRMXTIiY2IpBWGOgKaxdyHlq7FUlUPzy7TVCzsX1HfTdyPg0Ubca2YVN/?=
 =?us-ascii?Q?SB/uHI024KP4zdvdRMGEiwuAMhulAMq5qltEVfE8K25eu1r48z5Kdx4lWzvl?=
 =?us-ascii?Q?fx1CK/RvX1H7kX3dnqaFVc1mdz5h5j4tzQmAadzjw0aMa8uit3/mpEhmlW+p?=
 =?us-ascii?Q?qPzOTXF07AZoLLGLMvbXE2on?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8a30500a-f419-478e-d059-08d8e87dab75
X-MS-Exchange-CrossTenant-AuthSource: HK0PR02MB2690.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Mar 2021 13:16:12.0115 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JUWHXJOLP95fsDiaKju+9/GZNEsHsKFcfF2F+22lqFMI79or7v2TDHIzQ5Iny6PYW8NEIbK6Zn6UfBww8GLm3A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: HK2PR02MB4257
X-Spam-Score: -0.1 (/)
X-Spam-Report: Spam Filtering performed by mx.sourceforge.net.
 See http://spamassassin.org/tag/ for more details.
 0.0 URIBL_BLOCKED ADMINISTRATOR NOTICE: The query to URIBL was blocked.
 See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.48 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1lM9Yb-006G1j-KY
Subject: [f2fs-dev] [RFC PATCH] f2fs: do not use CURSEG_ALL_DATA_ATGC in
 foreground or urgent GC
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
From: Weichao Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Weichao Guo <guoweichao@oppo.com>
Cc: fh@oppo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CURSEG_ALL_DATA_ATGC is introduced by age threshold based GC for better
hot/cold data seperation and avoiding free segment cost. However, LFS
write mode is preferred in the scenario of foreground or urgent GC, which
should be finished ASAP. So, let's only use CURSEG_ALL_DATA_ATGC when not
urgent in background GC.

Signed-off-by: Weichao Guo <guoweichao@oppo.com>
Signed-off-by: Huang Jianan <huangjianan@oppo.com>
---
 fs/f2fs/gc.c      | 3 ++-
 fs/f2fs/segment.c | 4 +++-
 2 files changed, 5 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index 86ba8ed..ee42f6e 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -1120,7 +1120,8 @@ static int move_data_block(struct inode *inode, block_t bidx,
 	block_t newaddr;
 	int err = 0;
 	bool lfs_mode = f2fs_lfs_mode(fio.sbi);
-	int type = fio.sbi->am.atgc_enabled ?
+	int type = fio.sbi->am.atgc_enabled && gc_type == BG_GC &&
+				fio.sbi->gc_mode < GC_URGENT_HIGH ?
 				CURSEG_ALL_DATA_ATGC : CURSEG_COLD_DATA;
 
 	/* do not read out */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 32b915e..cbfb0d1 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3264,7 +3264,9 @@ static int __get_segment_type_6(struct f2fs_io_info *fio)
 		struct inode *inode = fio->page->mapping->host;
 
 		if (is_cold_data(fio->page)) {
-			if (fio->sbi->am.atgc_enabled)
+			if (fio->sbi->am.atgc_enabled &&
+				fio->io_type == FS_DATA_IO &&
+				fio->sbi->gc_mode < GC_URGENT_HIGH)
 				return CURSEG_ALL_DATA_ATGC;
 			else
 				return CURSEG_COLD_DATA;
-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
