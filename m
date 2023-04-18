Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 555FD6E5926
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 18 Apr 2023 08:10:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poeXy-0001Xc-Mb;
	Tue, 18 Apr 2023 06:10:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1poeXw-0001XV-Hj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 06:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4BfoSX/p+sWE1/mFzgkGSH6JzqeNvGc/buaunJMJx+A=; b=fmaCBA/ovFeCRdpdEmo3pptf4y
 c697poh5Akru/JWdwEfaPImjspGGcaxz5vNBxXG3vjXTx7oBGQ/vYaqCdMZITN5FNdAIicvwxNDic
 L0XHKbOpiJ9wEp2+7j+LtmMRbijsbeES3gx5VXPOL8hXS/G8dCAj/lHe+ZL+hOfxqn90=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4BfoSX/p+sWE1/mFzgkGSH6JzqeNvGc/buaunJMJx+A=; b=m
 tbgqIBNNnnCpdHDk/9+CgXwjtuv2VME9dzw222bzpF9mVKzK8NNQpWJA/Av+FUSS+Lz7FQLICjS9z
 vPQ/NdfmcjyRp1aV0xMAghM7E14xIBgRzGfoomW2OvQvyeQK5kf1dkAffJ2fxe122KDX6VcoV3jJU
 QA+MIDsZvYWJCaGk=;
Received: from mail-tyzapc01on2131.outbound.protection.outlook.com
 ([40.107.117.131] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poeXt-00BAQF-4X for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 18 Apr 2023 06:10:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Lcfkig8nF0qyM6D4cCs90EaYBiXMQN3uPGe/x494kUogyVgP9DiBU6gzbZDc2VKO8peY4AIZtgUW84i4mVyiHNPdGLTAP9MLPDUj5Q9Nw8yitUJuj0Z3oTcG3ZfPKwQqrOkfqozCiXonvp+b9/IeyoX25tlYFvUAyGvKcHsxh0YjSgD0nsZJENyqSt8xcE6GsYEinjG6Pnjse1oPtrNYJwwpqMUjiBu9lrUqQTcEkQsXOO+fDUD6+kv7Dh2V0UrhGC6JwzeUjutdGH7xV0iOOIKUiefZu4+bRpVo9tj5XN2z0laBRq4EhkVengopGEQBRVPezMw8yG8fRdWCyADZsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4BfoSX/p+sWE1/mFzgkGSH6JzqeNvGc/buaunJMJx+A=;
 b=JrOqKu1Shp+zoTdQJkJtQjRf4rFepFdrp2GtAQEhC76Mk2YjNgbvcqT5w9GKQsWSoeb1Co1d5hztpJS+QhT/bdrmGlaCdU05Fzy0pXIjNuSNY3DQhKBvF6mchROfceSdgt9Wt1QJ2ScJ9r+kIkcnLygs4Gm3+Hol8tAFaKfH4ISTlELO7vhwT7H2nono3wrkzXQN4j+9puDwyBbGqgzngTtF1AZJuZReCnH8D8xqa+1+YnNgyelASs/arnQqbGWL4/N6OA6W3xLMI2k/SqM12bBX1FKcgeOra4qIjfpQZtSuNQj3cCXDhhihA1mH/O6qwWIEfyFWANV9iYZD6u3ZdQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4BfoSX/p+sWE1/mFzgkGSH6JzqeNvGc/buaunJMJx+A=;
 b=fwbIZGJSQhPXi8uFiYQF2lA5993uL0S9buADIwsc9rOc20LFdR2Al0Nu2jbAPQdZ8aU1JsnP6Boe0oYtP760gjEBenO+SyYsTU9Ip2ZpPJjchat7Zz/ZJZcYLSOUX/H0BMEKYoXX8w12uVC0xyWjUSanVg//chiBGksAQ6B1WlH3TM331jNI0gvyGrl7VgnPBGLJEuMW6CXyLbBITt5xNvLgcB4L9c0FHfBYYGWmzW4iGHkAWtVmpTEAT5a+ly37H6zHHz0R9VbogjnRB0GNaSGxg4RxQ05k5kV2NLru25kly2q5xnOUklmZTw2H0tGKLR817+w253FwlJiyKdTysA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3227.apcprd06.prod.outlook.com (2603:1096:100:3f::10)
 by PUZPR06MB4631.apcprd06.prod.outlook.com (2603:1096:301:b2::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Tue, 18 Apr
 2023 06:10:20 +0000
Received: from SL2PR06MB3227.apcprd06.prod.outlook.com
 ([fe80::eb50:7785:eee:2892]) by SL2PR06MB3227.apcprd06.prod.outlook.com
 ([fe80::eb50:7785:eee:2892%4]) with mapi id 15.20.6298.030; Tue, 18 Apr 2023
 06:10:20 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 18 Apr 2023 14:09:54 +0800
Message-Id: <20230418060954.67585-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR01CA0156.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::36) To SL2PR06MB3227.apcprd06.prod.outlook.com
 (2603:1096:100:3f::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3227:EE_|PUZPR06MB4631:EE_
X-MS-Office365-Filtering-Correlation-Id: 530d7878-d140-4591-8bd6-08db3fd395f4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XBkeTCVaTwNWQfpqeX2dNJtWess+FBX7HkY4PmduIP+FuZvjqFuOqERYeDw6vQ2nAYC3CCX1P0Dlgxc0quH2Ru5pqfIJibj1A1BFNS9SVZcKp+Rcv5RZgRI5oGc/UQqevC30nMFK8J1CZZL1puo+jnIu+X+5V1JO+ZQrivTbEvXYIlyYuz7T5Hzwk0N8Z9B8yIr4LmfMUCUnql9SyJzZ82yddzZ74KDHqYFFUlI2Xas4NYXFD+wRoMYQ94hHgapQh+eQl69DHBjRub7/rFj5Z4HEYL5cEsFWOp8k+MLfvvbxjIezPANLByXMjlFK2AdQMKxF3JqE9EuXs+21/1Z7ZRp306xxRCFOFThjaPNqRKdqDOybW7FDeEaUBne2kHnQb6vf+3CxAwEPjmvsKL1bmbBr1FAm5/aiUyUtgpL7MQ7TOYY9NUhIUzOC6b2NMBz0zVEp7LYXK/tG8tWVhW9A0GH32lP2WW7llpcbQD22InwmUmnj9e2xFKenGgFctoJt2VSSwW36/DDp3M4MO4BzRIjs0WenmhCBdCCflqGcmRJatpA1jOz6AoZFnJniJNLxhwp7r+Gn7hl9vWHHwWlIdmBiy0UftSM4sjvM35W73ZH440861g552fGxcTgRWw51
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3227.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(136003)(346002)(396003)(39860400002)(366004)(451199021)(6666004)(6486002)(478600001)(86362001)(2616005)(36756003)(26005)(83380400001)(107886003)(6512007)(1076003)(6506007)(186003)(38100700002)(38350700002)(52116002)(66556008)(66946007)(66476007)(4744005)(316002)(2906002)(4326008)(8936002)(5660300002)(8676002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?OJl1XEwnLHo5rGtPgsilpIbfEIb0e49y6WcFwVVzQm9dtu4xmJRj1sy+0r8E?=
 =?us-ascii?Q?1RJTems3cT7jp4CG6OLh1qp8OTNLP2qsOrAOkd03lCQ3IXiJP1xSoriqh7P9?=
 =?us-ascii?Q?7pbkUGfN0d7HqObIfu0kwWvnlgFWb/j/S9SUPHzBGrG0WJTxdCYzwlamo1oG?=
 =?us-ascii?Q?JOU+ve+L8PP76OOGgeEF907G79YHUK2wpliv27/b4dLBSQ222BAA9OWSeRid?=
 =?us-ascii?Q?cJFXNBpyv5RZfper8j9VhEcVpgw7qJhAgZxz8vrGL6z50Y9N/87jf2JFu8L/?=
 =?us-ascii?Q?yFXmXjZ3wDaEqDhNGLZm9RMJ1AYtW1LsRlmmPeXsMT6Cob5NEhkPKnWi9/0h?=
 =?us-ascii?Q?uNtXEhgnr6X6LSPa1O3G7G8fAerApfQZqT6v5JiDDCYkD7IKXToB/8Xe3ge+?=
 =?us-ascii?Q?qDHW5BxC3GmN/2r0UaR98Dlz0L2Qu3xOalqrzdt/cdXU8pR189tMK2PmFbhn?=
 =?us-ascii?Q?eAKy3JbYV3i7JPqbAyfIBEnleMualtZg6acv6oFT7LNz9G4AAHmdZR3OAHId?=
 =?us-ascii?Q?zjg8/HSN0Zf9cGmqBmDxcWCwyQQ06DRyzDSD7Ylqkeu6c+x0SUr1/zFFbAoJ?=
 =?us-ascii?Q?BFp31BltYbx26Sx4b1dyIL/rSOvw9beZEyV6KeFMRBrQzcB9MKGgHxxdey9v?=
 =?us-ascii?Q?99tagcJFWeSbyn04qgavkJO54KI8N0UllsgJGGBXnvJxWD5i/x8lQ/bDUymu?=
 =?us-ascii?Q?RHRO0iV7I3vGNIddPS+sOiOWmHtuKRCG0mnvuXAqmeBz9A91/qKdy6WsYzFO?=
 =?us-ascii?Q?FdVtAgCPS/5YRSO7gpuAt1WPeJqk/Y4lKeb0EXHpH44/3CdVGEOTXBNiezAy?=
 =?us-ascii?Q?SLub9o1So2svoFaseScsuz8snqifASbGZjzfsSPiai5xmTBcxN00jlkrHRZZ?=
 =?us-ascii?Q?fw1XqdiHmqLkAYQby6xNTIjut9ow/JuYBpNTRZJuVzRjfE6zpvJKnzJUB3KT?=
 =?us-ascii?Q?GcKo15AW5j9Nqfb2LlUF4pVgShWCp9FLq2v4zjowti5BLAfe2lXoQY41cFtl?=
 =?us-ascii?Q?lpKdVX45cObb64J8fyDDROmrExTLcaR2TDB7uu0mJLsq0TAzEbZKbD5hHpIn?=
 =?us-ascii?Q?TUNCSoP/4ALVzvcxDvpZK9VgVAJX0fwKoPIrrzu3uaCYS6PdVsSO6uQ21INE?=
 =?us-ascii?Q?Ii3y9qFUY5vETutPsPOGy7bhEn9Xqv9XHq7itkdRmqcimK2IpgIl4c1G+kvD?=
 =?us-ascii?Q?Rw7t5/FtC3IPv52H79MYY6yC1dZz5LaA5kvUZgS2kPylZnh1h1LgAxFkpn5q?=
 =?us-ascii?Q?nWuXebBrRcyftwwjZxLclMTkN1U8ImFZvMmDaiUWKupyHOoJeabvQYeagVjO?=
 =?us-ascii?Q?Ca4cHgBY8k+R+xZeEx/X4Lu2viWd2WxvjaKNJlXdcWXjIx6aKUoQZPe9c7NQ?=
 =?us-ascii?Q?fo4yqnxS1WSzVcYnAAiCVa1KJHvki4luctUwOwz7QTYkbYQ6DQKTg+YgzTj7?=
 =?us-ascii?Q?p+M3lmxcqp2uzxshl4R/R+XVXlbMY1r3Sc4XYFszJo4yVN9jvttJn7rL0/ku?=
 =?us-ascii?Q?FfBaCoS6vK3FhEjzBc0TOwPxLExhq5bRAIOMH7Do7++o7hZs+Eh/OCvER4EW?=
 =?us-ascii?Q?e5amfx9OdssdA1/Ypo+334KBhyvqLlYEtiTQX1dM?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530d7878-d140-4591-8bd6-08db3fd395f4
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3227.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2023 06:10:19.2134 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Z7A+0jCEGkNrZGocukGautPPgOnzKDFGPqiKRjpSNRNmFENtAJJ4P80fgYz8FRl/CZeyVAU7RTXf8U0XxlzfgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB4631
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This comment make no sense and is in the wrong place,
 so let's
 remove it. Signed-off-by: Qi Han <hanqi@vivo.com> --- fs/f2fs/extent_cache.c
 | 1 - 1 file changed,
 1 deletion(-) diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
 index 28b12553f2b3..1f6d7de35794 100644 --- a/fs/f2fs/extent_cache.c +++
 b/fs/f2fs/extent_cache.c @@ -86,7 +86,6 @@ static bool __may_age_e [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.131 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.131 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1poeXt-00BAQF-4X
Subject: [f2fs-dev] [PATCH] f2fs: remove unnessary comment in
 __may_age_extent_tree
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This comment make no sense and is in the wrong place, so let's
remove it.

Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/extent_cache.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/fs/f2fs/extent_cache.c b/fs/f2fs/extent_cache.c
index 28b12553f2b3..1f6d7de35794 100644
--- a/fs/f2fs/extent_cache.c
+++ b/fs/f2fs/extent_cache.c
@@ -86,7 +86,6 @@ static bool __may_age_extent_tree(struct inode *inode)
 
 	if (!test_opt(sbi, AGE_EXTENT_CACHE))
 		return false;
-	/* don't cache block age info for cold file */
 	if (is_inode_flag_set(inode, FI_COMPRESSED_FILE))
 		return false;
 	if (file_is_cold(inode))
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
