Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 99B0A73DB6F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 26 Jun 2023 11:31:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qDiZ2-0007pG-SO;
	Mon, 26 Jun 2023 09:31:17 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qDiYy-0007p2-Lq
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 09:31:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=/RTvYAyMNYLmGelXuDdWylBL8tO6a5wbSDcs2R7kEx4=; b=C3D8GloX5rZRKr7C25RSLSH2IX
 SPzjBBYK/UubBjioLzQgiXKnc7h0hsLCTuMDBbDqhii6Z7ACueMkakICRhY3E4aICV0dFZ21DAZBm
 nW7CPOiC5prsjEEaO/8mTHyg+1tRR2tWJPzQB/soCHoBAdGBM7H/TbG2ToJxlR3gcYVo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=/RTvYAyMNYLmGelXuDdWylBL8tO6a5wbSDcs2R7kEx4=; b=K
 4Dn29l3izL4ubTqf/Ywl2gE/EpxfF/eo9uBytylFQH7wfJCwAE+pux2RLac8hAgqe7+cNLPhwrpJg
 zyibowFVoBVsElZn6pOtAY+HxfY8WG8vdaqSPFMFKL/SALMsflO1HI+imXTkAtEq5Py9qdV1t15hb
 pzW4nuseaY5JwUas=;
Received: from mail-sgaapc01on2130.outbound.protection.outlook.com
 ([40.107.215.130] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qDiYs-0003Lc-G3 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 26 Jun 2023 09:31:11 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fgj6mMykgc3ABd+eQI96odP3OF2aSgbun2WHHH9jJH70J/5m1UYJo/QsBMEDirloSyHEVXVmyl4D2Yka6iykvWSm08uKlpxyIaPzaSbmC0wOOwwWo/90wEQZ8kzGZTf4TtV7JdzsBc/IxgqdBM5I0xlKv0sK2zKE+sPRMTDCjravxOIFzTZEZzkXjvuaWeDjwWpX3sHkzJVyLk2rTKO3ASj7tawIdkRje6t+LMWSjcbbVD0fmj8dFlU5DAekmVw0S6sUMoY8WMIFP+9yDEBnM4XlTvRCHRdWncgQkiGyVHKHhhwZG9CZDwotauvpfhAVktP5ORqC/zJofstHDzWEag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/RTvYAyMNYLmGelXuDdWylBL8tO6a5wbSDcs2R7kEx4=;
 b=Y/f3O6lPm2wLwPJSjUhTcvc7HkVCanlxa/gaTq+ZQ/UJiEBQM74OmQvE9ELCSUuxQrBQTwRDqs/MIs/dddy8jLXlers34rnm1L+GCzg3f1BKE+SEuxGPN8UZ9UYuUC1dbp5tBQVSM1Gb7tkxEeB6MBsLBr4IjMirESJ3JB6U5YY/c40XNb8Wydw+j+u8Lt25fNjJ4N1g5M1XdBmhPEApt1fsuK16eK5JjJGEbI4XTBKUe7HVfox6YMxvhi/zLhw7gTO1ztqDnj6rFMVSy6tdX81mzMZIxRTwJlQsmbiygIr/GXXlQ+3RUZX/zEmU3CXUK90RGN7avBEq6W44EbJ7Cw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/RTvYAyMNYLmGelXuDdWylBL8tO6a5wbSDcs2R7kEx4=;
 b=fP/0XvbcZ4oJKkqszP3jUE9vVRDk4JfKl6ApY6AW3tTtsWd5L56I7y7MroGgrdiDTHwyLabC2PWBkEAyl7P69Xn9PPXOxxmweeXSgrN7fclIzA9qRCy3cPbZ4YnGLPiPfbWS8G8WtVt9CIrIn4ejVHsuX7G+dO2T6lNUjONs/MZBNaDbOo9KpZLciQqp8iwsJxrSVbSEs3ZPN2VYrMddyUx7lxKVbTKv8jTTxNyZWW5SbzBq0ZCW5gGH6elBoAJNXBzkAufc1EezgpJ886ZuHAQbYKUweLhckpsVYvavfrVv+dqYqU9r1+UfMLs+eGp2FTS9MWQj79c0E2A2+ikP3w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TY0PR06MB5212.apcprd06.prod.outlook.com (2603:1096:400:21a::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Mon, 26 Jun
 2023 09:30:56 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::4823:1d86:1665:5a02%7]) with mapi id 15.20.6521.024; Mon, 26 Jun 2023
 09:30:56 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 26 Jun 2023 17:30:46 +0800
Message-Id: <20230626093046.68352-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SGAP274CA0018.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::30)
 To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TY0PR06MB5212:EE_
X-MS-Office365-Filtering-Correlation-Id: 2bdc7701-fe70-4a42-98da-08db76280b2b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: JBeMbwpaPendZAezi3oZOov+ESJ+HTGd7CD28VJMZkRnwG8O3tR4LjEoxZKrWLizDXSYET57XEj6DNIu9f1g1nQTpvOv6sRsCEK5u0AvAYXJbTdq1T8iKnVxzYQIfGI0MJipfBMSbim3NprlXRgzaiY2rsg5XjpGvXKLxIjrFl5bvsEsxFi5FlCWYIoyCR9C2QTV078wxxA0tWO5kbZzWVupHWchCp1ieeOmbO/E0tfajHzEhF2GTBlIAyTzBEnI3AtBctzQbUTzBokkkEMEXA20zRfBw9QIjnRrqDWDfFmMGVHUx+qt5scO/hfdvUYEfXG6IKnsnhPWpsdEqeb2lqUP25sjEPPocvA/8LbPvZfWkJr25mxFes7I9NCQVyV2jX2jFwNEm8yLcNu4iFKqTyX13W+Qbw/+qVR57tB/a7F1/CisAMn+sAmzFlPjhPSuwcg+5rvpaapbOwyqp6ynOrzuE5Gf8R4tdb5anXySnWRVGX79/YxJYe2h3K67kDlGo1i3WGtnim5CnRf7EA/qcpsLJp+eSubvTmlgYdgPIPeSJnin43U+djVSkcn/E6LaMGSx9o5iijgYBOV1fYy4IE1P9zzGg3tPFjF6EZmH7W+nUEypxpYlYCwPgcn5s99K
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(376002)(346002)(136003)(396003)(39860400002)(451199021)(2906002)(6486002)(52116002)(6666004)(38350700002)(107886003)(38100700002)(2616005)(83380400001)(6512007)(6506007)(1076003)(26005)(186003)(41300700001)(86362001)(478600001)(316002)(36756003)(66556008)(4326008)(66946007)(66476007)(5660300002)(8676002)(8936002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?kJzGvaeLG9ngR4IN+ukzo4Ei0cG9Cjf5U83KnfICD4+KS+zto0PdcHOynY6K?=
 =?us-ascii?Q?KBZP8I6OqpeA+874PyiczSY8wNK2QMgklo/aOh2iaiF84i8Z30jMKohlE38x?=
 =?us-ascii?Q?AYW5s2xecxkSYaUjXqpCmzIX8M4BAKaqwV12tK9cNfua2ZPg3RwMpkPJSrHK?=
 =?us-ascii?Q?UaAUmfT79tKbSs80sSGM/t3U0J5rDTQq0SIJXMU3/NqrNvih2M7LxCzOTqcN?=
 =?us-ascii?Q?jWfW3M34wrwpl7fMLee5gLcO9wRfFxexmeI9NA39FPRojGt72PjqxW6/Shqy?=
 =?us-ascii?Q?kaE0zwCzKJ57Rbhp1foystTClLIdoc94+BYu8qrM04ft/N2Zcjv/vvvEuHBs?=
 =?us-ascii?Q?HCPH6oWoxBqxyawWivwjDdHlwsHSGVt6p7AwFdjQA/qS3AVh2L41WYi941Zb?=
 =?us-ascii?Q?GL0XgK/LPEZZZwDYqEmbBiHccDGYa2lketXDjCuHp0K4B6eUoC1u09lNrnVm?=
 =?us-ascii?Q?Jwi7dZi28PodzVkoCnoPmqDGC7Dxw99hsPbRV8vSrg/84RZwToMLkGaDxH56?=
 =?us-ascii?Q?NP1gY3CceCDBJLILKrD4b6Etn0nDUI02gR+LxSq20GH1JR8qvXhTNYF30zZA?=
 =?us-ascii?Q?9tVcUVYCw/RpsioTCliGRbjvGIAfQUdI+QtLy99G7KtqavcjfRWsMOby357+?=
 =?us-ascii?Q?B/niCbxgnehP8XntVskFEHgnV4ogTyfXfbZLIQ/Q1+0Z9bGccZy0GVcMUkNz?=
 =?us-ascii?Q?rjJhKYr1OAkB2reNEXOsiAJo6hwUQ5fKNvd8DnHaxLPDZlkKkDBcjqtNlBc6?=
 =?us-ascii?Q?3a3M8JB+w2okldTisICnHCzH3s43egjIUBSSns22qy5ixEWoxX8p4KJ7yMls?=
 =?us-ascii?Q?0pNGocdoDgTDXWzChc3hS/PBpwlD+msxWq91jHkmzryb6uSlEgPDAYBDR5DG?=
 =?us-ascii?Q?k+nk2OrHuxERU9Zmc3+cGq10cxTZPwnh1+j3p8/LdvJV1wsiLdz5qdrgoRt6?=
 =?us-ascii?Q?XpYLQ8q9y90Q7sMuPKRuPUORykQUYQ1AmX9b6QPH7fMwbR9hqH1RKZtRRFx5?=
 =?us-ascii?Q?sFVJyKGPVASGPzsw2h31kOMjNqWDwdE1Q9LxfRiVEG6up5seR35xVdGKXSsd?=
 =?us-ascii?Q?YywuazO8LB3Ism7xgpziCrD/9NYq3CGkhfgd2LDYGig9Qg76eDCAz66lOw80?=
 =?us-ascii?Q?6SEM2bx3nEHAK1HiWTczytjNb7h+8+OrFPRNXAUFCOKbtiyfQKaagnpjO5iM?=
 =?us-ascii?Q?m3iReHKQiE7kjcUrYOORV5u1L0Um2Fya2w0dhVieJIL2C3gW+lODbs+iz9p1?=
 =?us-ascii?Q?MPcilt9+a5vcLBUPXu3E2y2Tkdw4NPIt2lucLa6Ns2QB/jO/Y/n5MRC0Utxe?=
 =?us-ascii?Q?94FS3f/ScqyAk+P1FrnmZW9s1QpS1slfCophm6EoALsFLmU+dohhqlPha7I/?=
 =?us-ascii?Q?e4cEo3V+wAB1XXJJCZeYxYXohwqrB/jTydRYkWRZQ34EIYasaNc4+qYvUqN+?=
 =?us-ascii?Q?UqbV7aXaN9AQrT9BImJUugD3UtrAn579HChDfdwz8J3ggP6O6QrBCDgvO9ix?=
 =?us-ascii?Q?Yot7ZWOvr4xBVrXUzFvghE42osQdhOQTwWsSnr9KjE8YM+CLaDV8D21g4aYY?=
 =?us-ascii?Q?Z02SsRDIZSKjhrAfOm3IlGEwNlrOcHCM0otD+ncA?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2bdc7701-fe70-4a42-98da-08db76280b2b
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jun 2023 09:30:56.3999 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: f7I3U8Isvb9z1yjVMcV6NZd449TEb36FtFMIVCku7KBPlHIZzpHUOY3gIUpRcfd4bnDgBQGRZm8IP3XTZAsk1w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5212
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_inode() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cycl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.130 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.130 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qDiYs-0003Lc-G3
Subject: [f2fs-dev] [PATCH v9] fsck.f2fs: Detect and fix looped node chain
 efficiently
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_inode() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient, and fix the issue by
filling a NULL address in the last node of the chain.

Below is the log we encounter on a 256GB UFS storage and it takes about
25 seconds to detect looped node chain. After changing the algorithm, it
takes about 20ms to finish the same job.

    [   10.822904] fsck.f2fs: Info: version timestamp cur: 17, prev: 430
    [   10.822949] fsck.f2fs: [update_superblock: 762] Info: Done to
update superblock
    [   10.822953] fsck.f2fs: Info: superblock features = 1499 :
encrypt verity extra_attr project_quota quota_ino casefold
    [   10.822956] fsck.f2fs: Info: superblock encrypt level = 0, salt =
00000000000000000000000000000000
    [   10.822960] fsck.f2fs: Info: total FS sectors = 59249811 (231444
MB)
    [   35.852827] fsck.f2fs:detect looped node chain,
blkaddr:1114802, next:1114803
    [   35.852842] fsck.f2fs: [f2fs_do_mount:3846] record_fsync_data
failed
    [   35.856106] fsck.f2fs: fsck.f2fs terminated by exit(255)

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v8 -> v9 : Refactor looped node chain detected logic as kernel does,
	coninue fsck when c.fix_on is not set.
v7 -> v8 : Refactor the code to reduce indention.
v6 -> v7 : Correct logic error to handle is_detecting return by
	find_node_blk_fast().
v5 -> v6 : Simplify the code by removing unnecessary retry logic.
v4 -> v5 : Use IS_INODE() to make the code more clear.
v3 -> v4 : Set c.bug_on with ASSERT_MSG() when issue is detected and fix
	it only if c.fix_on is 1.
v2 -> v3 : Write inode with write_inode() to avoid chksum being broken.
v1 -> v2 : Fix looped node chain directly after it is detected.
---
 fsck/mount.c | 135 +++++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 115 insertions(+), 20 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index 8db2a97cbce4..1fbf187bec68 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3492,22 +3492,118 @@ static void destroy_fsync_dnodes(struct list_head *head)
 		del_fsync_inode(entry);
 }
 
+static int loop_node_chain_fix(block_t blkaddr_fast,
+		struct f2fs_node *node_blk_fast,
+		block_t blkaddr, struct f2fs_node *node_blk)
+{
+	block_t blkaddr_entry, blkaddr_tmp;
+	int err;
+
+	/* find the entry point of the looped node chain */
+	while (blkaddr_fast != blkaddr) {
+		err = dev_read_block(node_blk_fast, blkaddr_fast);
+		if (err)
+			return err;
+		blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	}
+	blkaddr_entry = blkaddr;
+
+	/* find the last node of the chain */
+	do {
+		blkaddr_tmp = blkaddr;
+		err = dev_read_block(node_blk, blkaddr);
+		if (err)
+			return err;
+		blkaddr = next_blkaddr_of_node(node_blk);
+	} while (blkaddr != blkaddr_entry);
+
+	/* fix the blkaddr of last node with NULL_ADDR. */
+	node_blk->footer.next_blkaddr = NULL_ADDR;
+	if (IS_INODE(node_blk))
+		err = write_inode(node_blk, blkaddr_tmp);
+	else
+		err = dev_write_block(node_blk, blkaddr_tmp);
+	if (!err)
+		FIX_MSG("Fix looped node chain on blkaddr %u\n",
+				blkaddr_tmp);
+	return err;
+}
+
+/* Detect looped node chain with Floyd's cycle detection algorithm. */
+static int sanity_check_node_chain(struct f2fs_sb_info *sbi,
+		block_t *blkaddr_fast, struct f2fs_node *node_blk_fast,
+		block_t blkaddr, struct f2fs_node *node_blk,
+		bool *is_detecting)
+{
+	int i, err;
+
+	if (!*is_detecting)
+		return 0;
+
+	for (i = 0; i < 2; i++) {
+		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		err = dev_read_block(node_blk_fast, *blkaddr_fast);
+		if (err)
+			return err;
+
+		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
+			*is_detecting = false;
+			return 0;
+		}
+
+		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
+	}
+
+	if (*blkaddr_fast != blkaddr)
+		return 0;
+
+	ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n", blkaddr);
+
+	/* return -ELOOP will coninue fsck rather than exiting directly */
+	if (!c.fix_on)
+		return -ELOOP;
+
+	err = loop_node_chain_fix(NEXT_FREE_BLKADDR(sbi,
+				CURSEG_I(sbi, CURSEG_WARM_NODE)),
+			node_blk_fast, blkaddr, node_blk);
+	if (err)
+		return err;
+
+	/* Since we call get_fsync_inode() to ensure there are no
+	 * duplicate inodes in the inode_list even if there are
+	 * duplicate blkaddr, we can continue running after fixing the
+	 * looped node chain.
+	 */
+	*is_detecting = false;
+
+	return 0;
+}
+
 static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 {
 	struct curseg_info *curseg;
-	struct f2fs_node *node_blk;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						sbi->total_valid_block_count;
+	struct f2fs_node *node_blk, *node_blk_fast;
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
+	node_blk = calloc(F2FS_BLKSIZE, 1);
+	node_blk_fast = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(node_blk && node_blk_fast);
+
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
-
-	node_blk = calloc(F2FS_BLKSIZE, 1);
-	ASSERT(node_blk);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -3538,19 +3634,16 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 		if (IS_INODE(node_blk) && is_dent_dnode(node_blk))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(node_blk)) {
-			MSG(0, "\tdetect looped node chain, blkaddr:%u, next:%u\n",
-				    blkaddr,
-				    next_blkaddr_of_node(node_blk));
-			err = -1;
-			break;
-		}
-
 		blkaddr = next_blkaddr_of_node(node_blk);
+
+		err = sanity_check_node_chain(sbi, &blkaddr_fast,
+				node_blk_fast, blkaddr, node_blk,
+				&is_detecting);
+		if (err)
+			break;
 	}
 
+	free(node_blk_fast);
 	free(node_blk);
 	return err;
 }
@@ -3825,9 +3918,11 @@ out:
 		return -1;
 	}
 
-	if (record_fsync_data(sbi)) {
+	ret = record_fsync_data(sbi);
+	if (ret) {
 		ERR_MSG("record_fsync_data failed\n");
-		return -1;
+		if (ret != -ELOOP)
+			return -1;
 	}
 
 	if (!f2fs_should_proceed(sb, get_cp(ckpt_flags)))
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
