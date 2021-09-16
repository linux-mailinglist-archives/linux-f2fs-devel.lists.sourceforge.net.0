Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 42CDA40D96A
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Sep 2021 14:03:37 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	 bh=F4uMpG/ifrdCALWRdWrxSsJcepZiU69meH3u26eGLH0=; b=UsRRo00uxDeKmsRyrHBJ9+r6g
	MqvNyk+DtU9lwruC2rozC911kQHy7hb5k2STmkjzmIeAxH0ic8BgVWDApUPRLVwuRENk1hrCAwv2A
	XomIrRJsD10HTa8Ovd4aHbF2xwJ9M0XCdkcE2gtXcwd1pQ/rimvqq7Q9xu5E/Wt5LFngg=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.92.3)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1mQq73-0004dS-0P; Thu, 16 Sep 2021 12:03:33 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 (envelope-from <changfengnan@vivo.com>) id 1mQq6z-0004dJ-6g
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:03:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=qmkEiyOIB4dLk1QgsaJ++ev8KNLFDs+eMHD2wEHzrqI=; b=KmfnNChpy4u46kc2dCtt/gcs50
 FazW1UyyysEVsHtkvRw5iXx+PZSGusi/tIJJ1d1p2KPYGXpRKRY6fYSAk42TzFUjzPbJQufIVTkai
 +wy6qImnz3+mfsxGPwatm3rTtFvX4uc9sPjOrQtJ+mXUY0C+w/rA8YFWvwYEKMG/ntiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=qmkEiyOIB4dLk1QgsaJ++ev8KNLFDs+eMHD2wEHzrqI=; b=ZGKwRpxKJ/yOZ6ETVqpezoSlNk
 lX3YxU6/VoFJutdNWiXUXbHlKflLX2BAZI0TZtaadPjRxH/4Bra6Zfewi6P7I3oPsNKl6p2mDMwHR
 /KqS+gwCHV5/BKYHREZzaALUQXb+5YvHHuDBwqj5qPBYkufJOwUG1gYGAq76zgego+Z8=;
Received: from mail-eopbgr1320138.outbound.protection.outlook.com
 ([40.107.132.138] helo=APC01-PU1-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLSv1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.92.3)
 id 1mQq6x-00020r-Ny
 for linux-f2fs-devel@lists.sourceforge.net; Thu, 16 Sep 2021 12:03:29 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HliSgsRXqbJlsgtlROTVj5zSdWVm1IiT8N2CzqKJ3MbWtPBJ2h7p41XT7G1HObwqqvUu2dOwkFtgxJ0AVAJE6UENwVgt2GGJak7HeiZ38PjmRgA2GN4dxEwkmptMrrQKRrBMbrM+r0oSWEoWqKr9WQD0v0d4tNyqAtaZNYKZHV5WpINcxnLaNIIKw471UdjibWbiGfFZZkwZuBvCrKDpBozE9jZtWLMFLPI0oBbz6pkJixA3sDslAnSkRC6NApuUWRIWzGCOJT03553RAjD3rb5bAvop1jBHCgBLriNJ0k7qIvR4oB7uFDcH4FA8q5z1Yb80FbDXaAh89mvENPFZvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version; 
 bh=qmkEiyOIB4dLk1QgsaJ++ev8KNLFDs+eMHD2wEHzrqI=;
 b=kXm+o5cHPpSNCAuM+1o89sZiEARpmFlymUhYvAO2Yc3dUiGT8sFoUbKsgPm3lsflcV493T7C2U0A1GjVweadaR83Ougijqd29FBLa9mKaTu8Z7fXW0K6fZrBVtriNd2sUtyEr5fag768D/0FTZkhQbnxOPvOccpxJUvMo9UOtNJltuYxDvrdKq7LVw+sQncgIOorQQg7gmj6Adanscc2zhuGW2lNJKnW+VdkcihV6Nv/VVcHiH2p71ciwfQY7BSj8JtO4oGRIYj5hEOT1EG1yaLT41uKOnZt1rNTZjQ2BOVTWJcbHTLKUOhC5WBGN9ubPFJTk7DWzJJIWhYqkcqYDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=qmkEiyOIB4dLk1QgsaJ++ev8KNLFDs+eMHD2wEHzrqI=;
 b=R97rHjLB3Wmn7e6V9KUIo2bUsLammbFKuaWvUwANDC4MAto9dc113UqpMBI7KQDWtN6Km6pRcxZw4wawtpkCL8K9OVoK3HU05lBaqRamLZojiXzaCvOF+2xtmSB6hELEZPlDCQYrWTAjiQenmOmo3AUgmcZ2knp9h+2wMELEBtg=
Authentication-Results: kernel.org; dkim=none (message not signed)
 header.d=none;kernel.org; dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by KL1PR0601MB2021.apcprd06.prod.outlook.com (2603:1096:802:d::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.4500.17; Thu, 16 Sep
 2021 11:30:55 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fcd1:f2b4:cfa6:6970%7]) with mapi id 15.20.4523.015; Thu, 16 Sep 2021
 11:30:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 16 Sep 2021 19:30:26 +0800
Message-Id: <20210916113026.378385-2-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210916113026.378385-1-changfengnan@vivo.com>
References: <20210916113026.378385-1-changfengnan@vivo.com>
X-ClientProxiedBy: HK2PR06CA0006.apcprd06.prod.outlook.com
 (2603:1096:202:2e::18) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-Exchange-MessageSentRepresentingType: 1
Received: from comdg01144017.vivo.xyz (203.90.234.88) by
 HK2PR06CA0006.apcprd06.prod.outlook.com (2603:1096:202:2e::18) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256) id
 15.20.4523.14 via Frontend Transport; Thu, 16 Sep 2021 11:30:54 +0000
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: 1b31d9cb-9778-4105-c588-08d9790571f2
X-MS-TrafficTypeDiagnostic: KL1PR0601MB2021:
X-MS-Exchange-Transport-Forked: True
X-Microsoft-Antispam-PRVS: <KL1PR0601MB2021273FC7AB21F4AACB8139BBDC9@KL1PR0601MB2021.apcprd06.prod.outlook.com>
X-MS-Oob-TLC-OOBClassifiers: OLM:741;
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: c3yO/fV9plhj/sB9q9yB6vKf6bpZH9e+vnB2m4UzNtE+kwyS3MNHhiCRUnaDP4CI9ahpBrjoOfSNKpecBLHuUHAPKcNc/2svU8dWe4TFpALm/zi9EM+9P+YuZtsBmaBHvPMuuAzHrweS/pEtSmol3alRe2qdcFOQi+SgCrholsVKwO+0fHNMZ4Nr/ewX9lZuoMYRPxn+i+roM8vuif7wnWPHex1SmQuIdShxzzCZdd63GAi5sF6w39mwvkHKmjNK2F7RftjeLrSKfcLEjCchX53hb32lm5uhU/oM6HWBY/oaMXOU+FvcaImLzlZmbkJyHJ6xNcNzCnAIEh/pA0UGlSZNVe/ZUFRMt8y4AhARogYsO1rvoDyDP7EQT/MQOc4xiU0J0gk8/mxD8WN2jI0KKS9dLqx8+OY70hUQttH2lunTH1FHYRsxlSk32/YtCKiUsFQNf3av6aKo10HWi/+8YNGYrNlzZrqQBfTlb9UEIGgtvkw+UH1fDBdcMIeh0CQ0o6aAJR9x9oDW40+I65QjxaQgcIqX1ARjI9r1RQGLinL0QRexPzTTnnnOSQ8l3mEijF/xYt6CyMMgLWIMS0fATMtNsWtTgvokLSxH3lSjn5sUc9D/Qd7x0Ry0ZXeee2dNFEuwKsuCSNG9i5jh5T4bWazBeb6rrtrQZuB+0nWh+IILP9f6lAFkDRgpy8vMXi+wzBHuloYzx/bQRfcoKgybVFZR5E4ZgSfr4AzhqZzqrsY=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(4636009)(136003)(39860400002)(366004)(396003)(346002)(376002)(38100700002)(52116002)(86362001)(107886003)(38350700002)(1076003)(83380400001)(8676002)(956004)(8936002)(186003)(5660300002)(478600001)(6506007)(66946007)(66476007)(2616005)(4326008)(66556008)(2906002)(6486002)(26005)(316002)(36756003)(6512007)(6666004)(4730100016);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ed4zXWuyZ7YlJklwzS/GCDyUyakvYovygao3zJpULX2+P58NFfNM0hS17eq1?=
 =?us-ascii?Q?sVDrgLLRZamnd/uaDqA33LawKqehUIVf5gn06VE1A83/47qsFI+Hzlf9fIaD?=
 =?us-ascii?Q?TugDhRQqeeORpTOi2W/xfmRoB08nqTq/pNQpFQVWhyvgV1LrH4VRXq9KehAA?=
 =?us-ascii?Q?2rRw6yd98LCO9omjB8usjWjXl6mQ447lPSk/wQlAwN3EHZQf+R6/WdlicRXi?=
 =?us-ascii?Q?bIvwncps1pXglewbI1Viazoe/HtBk/OONe6ZuqC0LLKyxc2Pqzf95HuomHd0?=
 =?us-ascii?Q?ET468sCZ0a4+SgyBStGWcgifzI/QAOMKCpQQFid7sVgfqorLlSy8GkTdPh4R?=
 =?us-ascii?Q?8GculnlhccOrgfU9pAwedF0UJIJ25fZSt+2lIrjH44oUIG6p8N4GesfEKW6y?=
 =?us-ascii?Q?DrpIthx2Zg0nWwbUF0pZf11Hrjg4jWmvqURzB4Y8uQmkLhnI1ExiVG0Ur5ZY?=
 =?us-ascii?Q?uM+wSf6HjmIy0Xlg4+YRjLxpe5/f9cJQ7b8ozFd1MzSafrFJAgoFYCX2LD/X?=
 =?us-ascii?Q?/ix5UOwj/MAueUlU9KGbj6fuArJRKU75qNAvBTJ+WjYe8zsLjIwgWUxNuOLR?=
 =?us-ascii?Q?ehXdZmUpLRVXpWaHyyAl7hrbT/CDPuvwbaSDbmJJ/jRsOjzBd7U3nQ4eiMQP?=
 =?us-ascii?Q?Pn6n4S9rfFjX645eVg50LmO1pu8CJHRohZlyOm6APWqEd4jL4BiMFgQk4zaI?=
 =?us-ascii?Q?9eVGCSsIZCxjFPFEnJcoaLpn6RNY9ZsV4UhHP0eoJCVQEQN5TqRwF7LjYgYC?=
 =?us-ascii?Q?PVnHpLCS1zLwY6myCohvPmM6tRf5ptCMdsex7DtBsYZgqwV0Q2vz/Taqf3d8?=
 =?us-ascii?Q?Zo431Ybtgdqh5pqLZz9UDuCSaNrkl0S5CiqC1jd0B8q3jDv+MAwOSWNl7n5x?=
 =?us-ascii?Q?lASmZE3vo59wjXh8yKNEuFaFqsj9jV6n+7fnplJxQsbNYkzcBL0KbYBAXe2K?=
 =?us-ascii?Q?HUMIZiDzXuVk2KY87OZFoTeldRbnlrkzdWSsNhaAKyCBgJ1z1ls/c6THZW6y?=
 =?us-ascii?Q?k7+bOwHJwlvI4F1m50ynLLdRTplsZ7DDqQUycNyv1W5zdhQ4xYdV3ERkqRAl?=
 =?us-ascii?Q?S4+08+m76Q44uvTjOC1EXxcYlu/rWpcPL24iECVAQpxSJS2zZiJBdMBKOzCs?=
 =?us-ascii?Q?XQT/Y7UH7kc/943LHSkzi5fO5dgXUVRTw1sN1h3XpyiabwA43G+23I3WQcpA?=
 =?us-ascii?Q?+wXasStOddAjV8hAm1UGpv41GdF19njhquHXFYSwu/0ympjuHTebxDT0K9Ys?=
 =?us-ascii?Q?JqfAPeHSAby1+xead2fMJjSQyupn5gjJrwx0wqpHP6XOcSrJ3JOzA3P7Qau5?=
 =?us-ascii?Q?MqOvP7CFASMB+nq3wDuxtvmE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1b31d9cb-9778-4105-c588-08d9790571f2
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Sep 2021 11:30:54.4542 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: as2+jkjV24fyPMxgTilXO+dg3m4wJ9b3Zyzmm+v8ZlIxos0U0dgEfDNaqoa7gL24m7N9XdnyCDJi6gvRpQcT5Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB2021
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For now, overwrite file with direct io use inplace policy,
 but not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, ) instead
 of stat_inc_inplace_blocks(sb,
 ). Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
 --- fs/f2fs/data.c | 7 ++++++- fs/f2fs/f2fs.h | 8 ++++---- fs/f2fs/segment.c
 | 2 +- 3 files changed, 11 insertions(+), 6 deletions(-) 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.132.138 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.132.138 listed in list.dnswl.org]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid 0.0 MSGID_FROM_MTA_HEADER  Message-Id was added by a relay
X-Headers-End: 1mQq6x-00020r-Ny
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: fix missing inplace count in
 overwrite with direct io
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

For now, overwrite file with direct io use inplace policy, but
not counted, fix it. And use stat_add_inplace_blocks(sbi, 1, )
instead of stat_inc_inplace_blocks(sb, ).

Signed-off-by: Fengnan Chang <changfengnan@vivo.com>
---
 fs/f2fs/data.c    | 7 ++++++-
 fs/f2fs/f2fs.h    | 8 ++++----
 fs/f2fs/segment.c | 2 +-
 3 files changed, 11 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index c1490b9a1345..0c5728d63c33 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1491,6 +1491,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 		if (flag == F2FS_GET_BLOCK_DIO)
 			f2fs_wait_on_block_writeback_range(inode,
 						map->m_pblk, map->m_len);
+		if (!f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_add_inplace_blocks(sbi, map->m_len, true);
 		goto out;
 	}

@@ -1553,7 +1556,9 @@ int f2fs_map_blocks(struct inode *inode, struct f2fs_map_blocks *map,
 				goto sync_out;
 			blkaddr = dn.data_blkaddr;
 			set_inode_flag(inode, FI_APPEND_WRITE);
-		}
+		} else if (!create && !f2fs_lfs_mode(sbi) && flag == F2FS_GET_BLOCK_DIO &&
+				map->m_may_create)
+			stat_add_inplace_blocks(sbi, 1, true);
 	} else {
 		if (create) {
 			if (unlikely(f2fs_cp_error(sbi))) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 3d4ee444db27..2d81e9f0a0ee 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3785,12 +3785,12 @@ static inline struct f2fs_stat_info *F2FS_STAT(struct f2fs_sb_info *sbi)
 		else								\
 			((sbi)->block_count[1][(curseg)->alloc_type]++);	\
 	} while (0)
-#define stat_inc_inplace_blocks(sbi, direct_io)					\
+#define stat_add_inplace_blocks(sbi, count, direct_io)			\
 	do {								\
 		if (direct_io)						\
-			(atomic_inc(&(sbi)->inplace_count[0]));		\
+			(atomic_add(count, &(sbi)->inplace_count[0]));  \
 		else								\
-			(atomic_inc(&(sbi)->inplace_count[1]));		\
+			(atomic_add(count, &(sbi)->inplace_count[1]));	\
 	} while (0)
 #define stat_update_max_atomic_write(inode)				\
 	do {								\
@@ -3877,7 +3877,7 @@ void f2fs_update_sit_info(struct f2fs_sb_info *sbi);
 #define stat_inc_meta_count(sbi, blkaddr)		do { } while (0)
 #define stat_inc_seg_type(sbi, curseg)			do { } while (0)
 #define stat_inc_block_count(sbi, curseg)		do { } while (0)
-#define stat_inc_inplace_blocks(sbi)			do { } while (0)
+#define stat_add_inplace_blocks(sbi, count, direct_io)		do { } while (0)
 #define stat_inc_seg_count(sbi, type, gc_type)		do { } while (0)
 #define stat_inc_tot_blk_count(si, blks)		do { } while (0)
 #define stat_inc_data_blk_count(sbi, blks, gc_type)	do { } while (0)
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index ded744e880d0..c542c4b687ca 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3611,7 +3611,7 @@ int f2fs_inplace_write_data(struct f2fs_io_info *fio)
 		goto drop_bio;
 	}
 
-	stat_inc_inplace_blocks(fio->sbi, false);
+	stat_add_inplace_blocks(sbi, 1, false);
 
 	if (fio->bio && !(SM_I(sbi)->ipu_policy & (1 << F2FS_IPU_NOCACHE)))
 		err = f2fs_merge_page_bio(fio);
-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
