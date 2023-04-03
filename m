Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A0EFF6D3F38
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  3 Apr 2023 10:41:38 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pjFko-0004iZ-Ik;
	Mon, 03 Apr 2023 08:41:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pjFkn-0004iR-EF
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 08:41:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MLrsLzjyMRlBeXTe/gW3HzqmTd8IPC4x83ju3uTFvfE=; b=HJwWfAtZZ+gMZNq0ePq2S4Jil1
 RL7vLnYi4DXJGMVmTA9h2zKrRgD2MiaRBcnPJQzZ/zqF+VfG7MOF9eHzdOlHTUdkPKzxGeLTj4qSM
 j9imo0z3KTd07VUlk0eQnrS1YZRUHhGLCmVDypudRraxCW1nOIr3siZCQSPPNekyyVDQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=MLrsLzjyMRlBeXTe/gW3HzqmTd8IPC4x83ju3uTFvfE=; b=I
 Rm1Rai7mfV0GolddlZsfp51cbMhjdIx3ZXZpD5bYdlO6h6mgkIWvsojbhpRypaub7lRTqjlL+H+C8
 U+88ianzloO+GkNC6SwbUfB//QbX0iZM2b8NSvdCo/DKg4HzrYL3LF6wN0yzipBcIhyZ2VXdlMVzC
 QxqX3i+13u9EsVvI=;
Received: from mail-psaapc01on2126.outbound.protection.outlook.com
 ([40.107.255.126] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pjFkj-00Dc7d-PR for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 03 Apr 2023 08:41:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=corWlnQbvyFeeEA5yECst8pJXBx5t9qYluqrZNzIp9jXeiF7PDDRwFAnujsXbNfzxN6YC6NhNGZJVVnG1hFKi91nvJSxLVZTcQLUMj6bful8BSuIft+omMk1tZArPxLihFTOjmHKEr652Spld8MKP2iHItyDUNnler/poAGqO05X4rRLpr5kRpncR6UlubesXJDSAv1+WU8xJxF5VTq99gxY7/G59XTnoQ4EEED2fgb7kdz5/ZDiRYLrbMCg5ofKeT+vFYL+7aPCcm+r+mQPmlBett0bI9hsNLoY20f8huREJmfFxsEJH/Tli2bsFQxQVHU7nCIdlNjOuY2k2gzbkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MLrsLzjyMRlBeXTe/gW3HzqmTd8IPC4x83ju3uTFvfE=;
 b=ay+57BHAqY/QmouNPaKJUqJLa32c7mxcYMJM4UgJXh4iFT80eaHfvsq+JD+zLggP0uPFSOZ5vcCiwnf6iv5gCMsBQ6j997v1gp5sBYYn4cCZdkVmRo29XoweuPLUQkA+BuHHIswwM2rABK15+EWJdoG0m7ZJ8Rta0Drnc2Vaukrg5xS9HDZuGUNJsuqRh7O4BlI/c5jDnrutZkGEAAt9Hj8F5QnniF6eElW0V2jALYruaheD7L2aBkRvi2OZj5vQ7Y1UOqaKRLepcAUqb7kgHDcslolL8LN9el4LGBssRQSIgZfE/ZTuogHKLj+CRDErOWxmRNvlrFAQ/j31kQwxIw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MLrsLzjyMRlBeXTe/gW3HzqmTd8IPC4x83ju3uTFvfE=;
 b=nnsVQ6S/cTLlVrDvLDIn6VAJocgJWuq4Rs64mwjuf8vnecugx/CP5WDKJnuqlo1bcTaqy+GvHLoHJS8/HFgoKqw8EFRqlybe2odqlrmOls6+lGLDYWiqQtw1u2UzaD6fO4Za1u74kcDw6RC1/IptfpqGwGqiXhjATf00t3iN1ylUEOaHcoLW2heC30UjK3XML5csq5nCPg4sYIZQcaAIhkMe7qXq5iQqWl6MC55pxOfkuhpduo64GQSNS9kxcrvrnAXb6xTcmE/7azCIzH1cBHMghaUZ74y1KS0a7kfhHvPBgVyw3TioOy/w5PSzNUbmZ32Uf4bc4KX+EaQkNwF7wQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4300.apcprd06.prod.outlook.com (2603:1096:4:15f::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.33; Mon, 3 Apr
 2023 08:41:11 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%6]) with mapi id 15.20.6254.028; Mon, 3 Apr 2023
 08:41:11 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Mon,  3 Apr 2023 16:40:54 +0800
Message-Id: <20230403084055.21482-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR02CA0035.apcprd02.prod.outlook.com
 (2603:1096:4:195::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4300:EE_
X-MS-Office365-Filtering-Correlation-Id: 5e2b0231-bd1e-4c50-491b-08db341f2d01
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: KVV7A37heW2uKnBLBJ5/bEwTSbvff0gHxnb6K32++rxZqGojoIlll+TD1B0UEbhIDMcN0f8iTTX0/rr39MzI4noAyYeG6BtP71II1SCLCbjcuXO7jutiewZ7/G7VYZ+FPU8pok0rToT4dhe0TTp5xQ7HYvANUTI4KT+60KRj7qB91yE47hsqCwaGYU86gOsd8ASSa+6GqvIeMdJziVF83IXAY6rzp5aOzmmy9gXj1DBfEuQsZDNjowIz7bAcpIT4cjR08/t2BN2qIyQ8TeOVs5r8NygtzxMZCfN9NTzedenhgIqh8iD8kS/Q4otypdBHskHlc7SwtqVWD+7lPEXjSmDSfiupMTCtDAV1+5G1Tt+Mo+1WFGXIgeN4PvOsdG+ss33Z+Y39H2WWcdStrQJTSOBJYhVoj92zMizzdEYECnJXnq7ZCT2wbjy9PhbspGLmLn0x4v8XZ1FJPsPac+9y45Er82CxomTOfku+susIk1hfATi4mOrEznwiUz9uxvck93IP5iiMTxqQpuegdRUUU61xkv/pn1ygSGEmmxiufUcRuDHyaez4ImxCTq3rRx3t/mDvc2SO1n8EsuDVwVhsDyYyuj+/+P8sHWRA9ImWOJzBy+HG36zvOvQKAs40CYaE
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(396003)(346002)(39860400002)(136003)(376002)(366004)(451199021)(316002)(110136005)(8676002)(66476007)(66556008)(41300700001)(4326008)(66946007)(5660300002)(38100700002)(8936002)(38350700002)(478600001)(86362001)(2906002)(6486002)(52116002)(6506007)(6512007)(26005)(6666004)(1076003)(186003)(83380400001)(36756003)(2616005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bz5/MY3MEIhmkONHQehtwNF8FgH/eugBbZXA9259KKSvG35aLigrYnj+1kZq?=
 =?us-ascii?Q?3pqnNjhOmsefnwk6BVJ6bcs0WQiUKCvWrwyGb5G1DRvNNlZG6KnfU7BBq0/P?=
 =?us-ascii?Q?e/b96OaRlyQWgDhL5rGyKUCWu1legCPFp1i0f6FQczrY0LRL+ct5MB+ouu6y?=
 =?us-ascii?Q?PMo294RBcXX+GJgvG7OL/vwEG6114Ho7ZukUeUa5bnZ9eEdNJXQwhK+5rpLu?=
 =?us-ascii?Q?TQKLR2MXr8t1mQZuRbCSLIYQrX2F3xFg1WSS8DaqkiBpwAk5KJM7XQe7+iEp?=
 =?us-ascii?Q?G0IW0jKkTMdD8ltVGjWVxGz5XZCZ9uAB178GPSrCgNP74OGPUWtHLdRIBYiF?=
 =?us-ascii?Q?A9AlQGQCh/ZAvIR0aRs++jRUiMbF4AzhfQqwboWA8Mgc58ATOU/rpqsox5og?=
 =?us-ascii?Q?ctEuDdnSYEPPelXvXI3GzQgVEjlXuATtcQOsxXitex5jekzr/qEc3GLhMBIp?=
 =?us-ascii?Q?k2QLvimDAH9AML4aYP0x2lBAe3jiszTrSTHoX8sipo6xe84FEQNnNCOqiDjt?=
 =?us-ascii?Q?3SNN92sXKh/vwKCL8mBGKokR5M85gl1QSHGlWvml37YiRdLe4QgtwqbieWFe?=
 =?us-ascii?Q?2bCPrN+7X5R3Cmc1qv/WIgCcMeP1vBdoiO6EMcv85SNH+osdqHk42N7L+ALA?=
 =?us-ascii?Q?mHLSwD64RHq/Ky2kp8a0s9pOCEhJikI/nwzKvGOgneCHNRY2LF/ycEtjR7HF?=
 =?us-ascii?Q?+h+wVRiz1DiO5WJjuvNuawlMwGFgO6nJmnqy0iexeRtmeuAOXOv7cusXdsW0?=
 =?us-ascii?Q?DFfd5n0DIKvXPnDxn///f/o/CKZizJ3pMHkd8PWIDtQtFq3KEhBF2g0zpQIG?=
 =?us-ascii?Q?SsTCpsXM4MN75vnqNUpyUps2ACd+Gm4eh0LDp/6pxO2bzgnv5dzbLI1lQqFU?=
 =?us-ascii?Q?BrULywWcBp4IYVPgLyfbscUyI8rW2ErQFHlqqUKxVlNz1biVgz2MwqC4a/u4?=
 =?us-ascii?Q?vW2ufCEAnzwQKLItvv12Eg6yLTn1CPHprDUKMm2ZhTBhxn57da3PW+qepdFk?=
 =?us-ascii?Q?Me0+X+HzfkDbEDwTXHNMMUI3HKheNN2EStrBj06/FrOgTeg5w7XFSVgQ/cyP?=
 =?us-ascii?Q?sOLoFpsXY2ASkuUY1OdxoIL4jWoRi7C5yjGdCanhj+rEmgK6R4qSsKF2312C?=
 =?us-ascii?Q?o/EyYP9/IRp4yCuZO3SXtEaJdBZZ11HYpvMvEj6ofUDJXfzVe10Ek3ouhTOe?=
 =?us-ascii?Q?N26A0HqEcQ8Gxoa3e8oYNWlz27T4FEOzxdb0yNmzhOdnFNhTt35T7b+jMaJk?=
 =?us-ascii?Q?hhPrR/ckWBV3OffKBDPo5apdS8bpYwYVfGkrBJzfX/jgisbqKjaKUtJXOQp2?=
 =?us-ascii?Q?u3wPdf5GL9lfZx1Jm0RGszYEePip+j+O+KS9Y3y/fP6Nffx445nMfmQChHEA?=
 =?us-ascii?Q?ib2XZ6sc9FHv9NfEN453jCjh/PzuT3LJijsKrhWBoWab3hN/iGsVdnB25sVG?=
 =?us-ascii?Q?iDazChwnfT46izCKD3T31F9Eo/PMdkt4tH7iqmmS+IDUkwqR+DEm1rUdWhop?=
 =?us-ascii?Q?6+TswWvyI4MpcxjD/Cs1xES14cgpCUl80wIBQlTx63JDuWspdCWO2WdpRVbe?=
 =?us-ascii?Q?6DFNzHBhqEBHhkzwkYp4T9mowL8LZcmAN/+DZ/X+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5e2b0231-bd1e-4c50-491b-08db341f2d01
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2023 08:41:10.8757 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4HOVWeiolj018KbbmzyemMfCEz3RAEZ8yQRmaIcl0al6PS21WPZdv2pjlG3hTHrlma186XOx6zT4N0hwhr87oA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4300
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  There is only single instance of these ops, so remove the
 indirection and call get_victim_by_default directly. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- fs/f2fs/f2fs.h | 5 ++++- fs/f2fs/gc.c | 12
 +++---------
 fs/f2fs/segment.c | 7 ++++--- fs/f2fs/segment.h | 7 ------- 4 files changed,
 11 insertions(+), [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.126 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.126 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pjFkj-00Dc7d-PR
Subject: [f2fs-dev] [PATCH] f2fs: remove struct victim_selection
 default_v_ops
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is only single instance of these ops, so remove the indirection
and call get_victim_by_default directly.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/f2fs.h    |  5 ++++-
 fs/f2fs/gc.c      | 12 +++---------
 fs/f2fs/segment.c |  7 ++++---
 fs/f2fs/segment.h |  7 -------
 4 files changed, 11 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 8d5124569a03..9a1ec5515121 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3871,7 +3871,10 @@ void f2fs_build_gc_manager(struct f2fs_sb_info *sbi);
 int f2fs_resize_fs(struct f2fs_sb_info *sbi, __u64 block_count);
 int __init f2fs_create_garbage_collection_cache(void);
 void f2fs_destroy_garbage_collection_cache(void);
-
+/* victim selection function for cleaning and SSR */
+int get_victim_by_default(struct f2fs_sb_info *sbi, unsigned int *result,
+				int gc_type, int type,
+				char alloc_mode, unsigned long long age);
 /*
  * recovery.c
  */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index f1e0e01a5dd1..f3f0020633ad 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -741,7 +741,7 @@ static int f2fs_gc_pinned_control(struct inode *inode, int gc_type,
  * When it is called from SSR segment selection, it finds a segment
  * which has minimum valid blocks and removes it from dirty seglist.
  */
-static int get_victim_by_default(struct f2fs_sb_info *sbi,
+int get_victim_by_default(struct f2fs_sb_info *sbi,
 			unsigned int *result, int gc_type, int type,
 			char alloc_mode, unsigned long long age)
 {
@@ -937,10 +937,6 @@ static int get_victim_by_default(struct f2fs_sb_info *sbi,
 	return ret;
 }
 
-static const struct victim_selection default_v_ops = {
-	.get_victim = get_victim_by_default,
-};
-
 static struct inode *find_gc_inode(struct gc_inode_list *gc_list, nid_t ino)
 {
 	struct inode_entry *ie;
@@ -1671,8 +1667,8 @@ static int __get_victim(struct f2fs_sb_info *sbi, unsigned int *victim,
 	int ret;
 
 	down_write(&sit_i->sentry_lock);
-	ret = DIRTY_I(sbi)->v_ops->get_victim(sbi, victim, gc_type,
-					      NO_CHECK_TYPE, LFS, 0);
+	ret = get_victim_by_default(sbi, victim, gc_type,
+					NO_CHECK_TYPE, LFS, 0);
 	up_write(&sit_i->sentry_lock);
 	return ret;
 }
@@ -1969,8 +1965,6 @@ static void init_atgc_management(struct f2fs_sb_info *sbi)
 
 void f2fs_build_gc_manager(struct f2fs_sb_info *sbi)
 {
-	DIRTY_I(sbi)->v_ops = &default_v_ops;
-
 	sbi->gc_pin_file_threshold = DEF_GC_FAILED_PINNED_FILES;
 
 	/* give warm/cold data area from slower device */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index cb8aacbc5df6..c9e674fe477b 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2881,7 +2881,6 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 				int alloc_mode, unsigned long long age)
 {
 	struct curseg_info *curseg = CURSEG_I(sbi, type);
-	const struct victim_selection *v_ops = DIRTY_I(sbi)->v_ops;
 	unsigned segno = NULL_SEGNO;
 	unsigned short seg_type = curseg->seg_type;
 	int i, cnt;
@@ -2890,7 +2889,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	sanity_check_seg_type(sbi, seg_type);
 
 	/* f2fs_need_SSR() already forces to do this */
-	if (!v_ops->get_victim(sbi, &segno, BG_GC, seg_type, alloc_mode, age)) {
+	if (!get_victim_by_default(sbi, &segno, BG_GC,
+			seg_type, alloc_mode, age)) {
 		curseg->next_segno = segno;
 		return 1;
 	}
@@ -2917,7 +2917,8 @@ static int get_ssr_segment(struct f2fs_sb_info *sbi, int type,
 	for (; cnt-- > 0; reversed ? i-- : i++) {
 		if (i == seg_type)
 			continue;
-		if (!v_ops->get_victim(sbi, &segno, BG_GC, i, alloc_mode, age)) {
+		if (!get_victim_by_default(sbi, &segno, BG_GC,
+				i, alloc_mode, age)) {
 			curseg->next_segno = segno;
 			return 1;
 		}
diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index d66c9b636708..89619969ec85 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -289,7 +289,6 @@ enum dirty_type {
 };
 
 struct dirty_seglist_info {
-	const struct victim_selection *v_ops;	/* victim selction operation */
 	unsigned long *dirty_segmap[NR_DIRTY_TYPE];
 	unsigned long *dirty_secmap;
 	struct mutex seglist_lock;		/* lock for segment bitmaps */
@@ -300,12 +299,6 @@ struct dirty_seglist_info {
 	bool enable_pin_section;		/* enable pinning section */
 };
 
-/* victim selection function for cleaning and SSR */
-struct victim_selection {
-	int (*get_victim)(struct f2fs_sb_info *, unsigned int *,
-					int, int, char, unsigned long long);
-};
-
 /* for active log information */
 struct curseg_info {
 	struct mutex curseg_mutex;		/* lock for consistency */
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
