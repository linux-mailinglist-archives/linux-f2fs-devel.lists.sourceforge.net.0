Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A2D62737E1F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 21 Jun 2023 11:13:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qBtu6-0005UA-TS;
	Wed, 21 Jun 2023 09:13:31 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qBtu0-0005U2-SN
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:13:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rDEoBFgDpu3EfXSpuwHll6vKR2OG5mULdzcQbP7syA4=; b=PpCsMEXub+gXaJIqjGeRX1A4Qn
 0McPkPDRFfvRzkLxtnjYk0O7TuxfHW/ceJGq6scmZhYjCia1KJNoo3eaRH/Bo7zyKYzMEuU9NMsKV
 KXiHeKs61LW/QqVG6IOzQ5+ATuHU9FG6bXJn7KE3zmVlKkP8Gf1H10PTlwvwdBnkykvM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rDEoBFgDpu3EfXSpuwHll6vKR2OG5mULdzcQbP7syA4=; b=a
 Xdb/7DBSL1ZK7Bdd2zPYimBxzpQcI/6jsCE9aDx3BxtWu3s76Obnu12DqbHo5mXW9wsHgftPQ6+om
 JlGSr9YVmRUZkV9CCYjBfX6dGFGLNM+a9Q2kZ66sCPyDEfwApdTf/TXoxgs4MltH4JXl8ekIF42JV
 +q6QMTjhByY84vck=;
Received: from mail-psaapc01on2131.outbound.protection.outlook.com
 ([40.107.255.131] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qBttw-00AVe0-EG for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 21 Jun 2023 09:13:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FDMW24W0E7634OQ8kFRuyVGd1jQbQxC50Br4xXR3Fd00ygGFu7bRkfXSaND2UIMVxCEcvxbIk4T66JPL0qTRb5oIWg4tJ1qDLcfg1McGwYrNdNEIG6W+EYzttqt+0sOBcLplF8fi+IjVUPJTvwlnAinPvzUYvVWyb/eDpHgekrT7grypKkvhNjn7b2BxoMd2rHS698p4ePJsbuinT4ceAlWQhuvigbshaieDIgyvXtbI4/1mvrLDjmQpCK18+0mZPijrFApDPWW47xceOKQ7IrS/H5OumW6C7BM0UCgW5EfTLxcwSmPEZ18+HiS7i7KnPQtyNDex5o4yTp7GXqnXPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rDEoBFgDpu3EfXSpuwHll6vKR2OG5mULdzcQbP7syA4=;
 b=Ns316dhrg7vZexCmbEE/DpB+Ct2x4IORTB211YnZ+Nn3/K3AGeusIpzTrY+M0YlU5jyk/i5hwwK5p4pb5k6fdFaoHXe3TtERLUeNiz3HGf7FjuQ28W2rHG7buLOjysXC0nuAZeljFLvZv2qtdat/BbORO+htStbNoW8lH+QGgUtUPzw3BcFPR/RkhfoqlmqE6dn6mw97lKA70wdeeLYPBOidRnMmUZDi7ceQiD9nPmHnl1af7pl4kExAUCpEqdcTVOrAe8J20ooBdRA5qWx2Y2WJw8L1xtMmeeLWCwR/WN96aPjsbhAKAp9Pba/3ynWjQN95lPlHIn1D3rbayzyEpw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rDEoBFgDpu3EfXSpuwHll6vKR2OG5mULdzcQbP7syA4=;
 b=U1RwI3ysSAz0pNIE1VxtsZhI3yFthq+RE34DzrONX89ji9B7QFVeMKHfYPNnle1ErT0L6cj0i4BPU8xiyhY1w5UjfniJn2m30JYF2THpGzSw3q5MpsKGh3Kif4rYG6YzxXpqREF7fSEOc87QSDqi34G2oJ2CZTjGlYRG3F3YVxwPFms/HDsgcE4HsIrvUZki/Qf8/IRN67AToNLhrZEut70Vu4PNBGKT8akg1h71S7tvqft6gkhmTIa5e3FjG7QedrmQgFCFCnyy2OHXATkSL6biotLjMjgcVdv+st/MUVTcWoHlx6gBWc2uW1aKIBlVzTon3pZXZgn/PABZcbOpPQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYZPR06MB5417.apcprd06.prod.outlook.com (2603:1096:400:203::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Wed, 21 Jun
 2023 09:13:12 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::e008:38cc:5ce6:769a%3]) with mapi id 15.20.6500.036; Wed, 21 Jun 2023
 09:13:11 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Wed, 21 Jun 2023 17:12:53 +0800
Message-Id: <20230621091253.1396-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR01CA0112.apcprd01.prod.exchangelabs.com
 (2603:1096:4:40::16) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYZPR06MB5417:EE_
X-MS-Office365-Filtering-Correlation-Id: a7a86f9d-378f-44a3-4c81-08db7237bca6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: XwwJE3JOzewTFEmFFzw9Oycm6YInPY1VC5fAk1WFb8/IT51pWdUIm99iQYKvZbLseltH9xi1jcuqY7Ut6EZIWxckksi6EZNekuR0E9OI5CgVjR6OOx1icHg36TW7yepntww0noMxHA5H46yPFIRJIInobtjQVqZ9I2YViOgobmG4maVRWwMpm8A4b5DP+LS++fIdhtkNnUKPfsGv/fEpkIkmeC0ibn9X07Wo3HFhKqoTk6ojAS89MOJpc7DoSoQYF/o/Hb3mjcY/fkV+qSb43jslubtGyj/YzY2j6hTznA0od6ttzPOGYT7Kqjwm2rnmi3hCZKOoRPSGkgAXCeUnzhA5pvf2+HosDdhGeNOqEdvu1oMfpjGOE+NlK31/ey+sVZDYYm3glym3n0qD/MOEbWPz3ZrFuXb6YGWUvGVs4AqB6A+RXNijdxrOTSzv98j7AgtuHUEUfz5fbrB7DsKeJvQMUAztR4Kwk7d2qdn4zmEtvbnm+d1Kv572pMs9zHa31Ir9iXiTpj5IYB62flZRnCo3fS7gleKxBl3kX5+Cctzw5URrnSVaLGfca3Hpz4IqT8ukxqQ+uZ0A/BIdsMQXIDSWPg45RRynFYqA6GYyY6oEzubbiOm4WW5Oo9GnrYuA
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(136003)(346002)(396003)(366004)(376002)(39850400004)(451199021)(316002)(38350700002)(38100700002)(4326008)(2906002)(86362001)(41300700001)(5660300002)(8676002)(8936002)(83380400001)(107886003)(36756003)(6666004)(6486002)(2616005)(52116002)(478600001)(186003)(26005)(6506007)(1076003)(66476007)(6512007)(66946007)(66556008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lX2wTTDsBlZHTn62pbL0e/p9VdTCrk0ewgeauoMoBXtQEBEnUIdwKcE6OQrQ?=
 =?us-ascii?Q?znO8glw3OaIGhk1kZNq3lQRRGFVdR5Xz7HWWP8e6qaREjLgb99Lje347Py62?=
 =?us-ascii?Q?9NqTNh2mc1nIUmAxrmDZZgqqKTr76Tzf+YOtmbSR92xXEboYUdonjO/YeplK?=
 =?us-ascii?Q?OK8U6ECky5F5md0prz9OFdCiM02NLZnHzfD5gvSmw1UpDhnNgYkQm+OLB3x+?=
 =?us-ascii?Q?23vx9rd7IsD/e2XvRi1yz8AtTdHaxCTg1puGuEoEnj3eXohq20dcYbEKMphE?=
 =?us-ascii?Q?eFzK8ykHI+/UvORzAF8aQwJQ29DkPvT1bSyFJ8Cxh9r7BCz2oY9b0U+3pImi?=
 =?us-ascii?Q?GeSHIf9YsUOGxTjDqdx+GfWL9RC9RMuvF4Eu1V6Y5HiHyeRDOpWVYzqkZjKq?=
 =?us-ascii?Q?60zQkeYzWUGV43EHtWwY+FSvMspPlsDaSHYFQP/5YS6YVcpVuVSPL1Qf/+zd?=
 =?us-ascii?Q?kWx4oL+ZXdvQdxORitH3ovZ4FfLnFwoZ8Tc+2TETN2qCFfTNZL2/m/i92Nat?=
 =?us-ascii?Q?7jVJOLJwbG1Zn5SmTU2AeI9Zf3gsQCP3otZT6yscc8GJYsPgVYWR/MrmcF7l?=
 =?us-ascii?Q?kz6s9LhsUGe1XKFk4TaGmQnT/zJdJELYdKL2Ekvw45Z+uCH0yQJ6R9Sl6OP2?=
 =?us-ascii?Q?vtP/HBgv3ydVX5++ceP2yzgsXXZmP3MKLn0tSZfox6YhRCZyPOtTFsrIF6lA?=
 =?us-ascii?Q?5YaELJ3HjJpxQnMqrK4RrndDgn3vYeqw+d90q8UpVgd+uRB2UWMkpSglvz3B?=
 =?us-ascii?Q?yIHlEFMvTNnp0JNJ19PbpP7dJmMkFcjn3SOWHaTtEto/y57UBLvp4E2giJNX?=
 =?us-ascii?Q?hHLSslDIY8hUuAUyHZ0nMmrwSnwxJVS9jDARCdNB3CRTIjnF7OFn+Pj7vlfP?=
 =?us-ascii?Q?tm5bphqsBO/iI0BvjPKIhBPzhM90dDjIq0sXzXdVfMKvlqD02Jw7zpjfombN?=
 =?us-ascii?Q?6/083pcvkIAO5E2vVTIvtO4SjA6Dv4suhMylOZWEAE+8lOytYz8kGafgWuEA?=
 =?us-ascii?Q?VieojPks1zmxkxJkt9g+nXpPCgG0oR5TqHv8hkzq24jjSQ3VJRh7IjL5Py/V?=
 =?us-ascii?Q?cplEXhfEiPaSi0StEe6RsPicoqpHusXsmNn6i7yJY6V6Qee6jvJ5YmL0RAoO?=
 =?us-ascii?Q?58csWNKAPir70cG4JpFDsPSqOx/vvCRsCNqLxnS/mS3iTD34qUPjQfg5yMTM?=
 =?us-ascii?Q?kG+JKKp0XZc9l9QThbQEHzob/J1TCw10ivzDESF69jAzVMaHgK5I1B+QIaUL?=
 =?us-ascii?Q?smBzkr5+RX1qnGbFmirwUKcwwhFXRDlHBz0LRV7ogikE4v3Okkv4/bAMeipC?=
 =?us-ascii?Q?652GVjqHlQwSLKJK1uYl6mT02hBGrRtGz0Hh2soVzwDdgN/+0uhN9AMRv9VH?=
 =?us-ascii?Q?RVaiiysYTNCIs3t0adeuA9QFk1jQW271MycUGrJc/Ua6V9Z/3vj7ELa/x3aa?=
 =?us-ascii?Q?IOBoTHu4ep5Ly9FCYumqe9tFEA4Ivqcg1ucY/Nra1lehnZ4yQJmvKpoblLZn?=
 =?us-ascii?Q?YEmd6WKvlXmpCAZB2Rs9ad54bVLjJIy6se1BSzWtOfFb5eBWQCtlPiXxKfeo?=
 =?us-ascii?Q?men0PjGFTOvR4TLmdggaPGNKt/CDfhfxu/fE5M1q?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a7a86f9d-378f-44a3-4c81-08db7237bca6
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Jun 2023 09:13:11.9768 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T5KLPsix5d15fACM8Br0wHyAK5zskdXoR1ZqfOcHYb62Wufb2qCg1MXaL8YX3eCWXe9GeMMbO7GT09lPlfa0XQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5417
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Refactor looped node chain detected logic for cleanup as
 kernel
 does. Suggested-by: Chao Yu <chao@kernel.org> Signed-off-by: Chunhai Guo
 <guochunhai@vivo.com> --- fsck/mount.c | 115 ++++++++++++++++++++++++ 1 file
 changed, 55 insertions(+), 60 [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.131 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.131 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qBttw-00AVe0-EG
Subject: [f2fs-dev] [PATCH] fsck.f2fs: refactor looped node chain detetected
 logic for cleanup
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

Refactor looped node chain detected logic for cleanup as kernel does.

Suggested-by: Chao Yu <chao@kernel.org>
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fsck/mount.c | 115 ++++++++++++++++++++++++---------------------------
 1 file changed, 55 insertions(+), 60 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index e5ffb2602b9e..b4eb9ffeb685 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3492,32 +3492,6 @@ static void destroy_fsync_dnodes(struct list_head *head)
 		del_fsync_inode(entry);
 }
 
-static int find_node_blk_fast(struct f2fs_sb_info *sbi, block_t *blkaddr_fast,
-		struct f2fs_node *node_blk_fast, bool *is_detecting)
-{
-	int i, err;
-
-	for (i = 0; i < 2; i++) {
-		if (!f2fs_is_valid_blkaddr(sbi, *blkaddr_fast, META_POR)) {
-			*is_detecting = false;
-			return 0;
-		}
-
-		err = dev_read_block(node_blk_fast, *blkaddr_fast);
-		if (err)
-			return err;
-
-		if (!is_recoverable_dnode(sbi, node_blk_fast)) {
-			*is_detecting = false;
-			return 0;
-		}
-
-		*blkaddr_fast = next_blkaddr_of_node(node_blk_fast);
-	}
-
-	return 0;
-}
-
 static int loop_node_chain_fix(block_t blkaddr_fast,
 		struct f2fs_node *node_blk_fast,
 		block_t blkaddr, struct f2fs_node *node_blk)
@@ -3560,6 +3534,58 @@ static int loop_node_chain_fix(block_t blkaddr_fast,
 	return err;
 }
 
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
+	if (!c.fix_on)
+		return -1;
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
@@ -3608,42 +3634,11 @@ static int find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
 next:
 		blkaddr = next_blkaddr_of_node(node_blk);
 
-		/* Below we will detect looped node chain with Floyd's cycle
-		 * detection algorithm.
-		 */
-		if (!is_detecting)
-			continue;
-
-		err = find_node_blk_fast(sbi, &blkaddr_fast,
-				node_blk_fast, &is_detecting);
+		err = sanity_check_node_chain(sbi, &blkaddr_fast,
+				node_blk_fast, blkaddr, node_blk,
+				&is_detecting);
 		if (err)
 			break;
-
-		if (!is_detecting)
-			continue;
-
-		if (blkaddr_fast != blkaddr)
-			continue;
-
-		ASSERT_MSG("\tdetect looped node chain, blkaddr:%u\n",
-				blkaddr);
-
-		if (!c.fix_on) {
-			err = -1;
-			break;
-		}
-
-		err = loop_node_chain_fix(NEXT_FREE_BLKADDR(sbi, curseg),
-				node_blk_fast, blkaddr, node_blk);
-		if (err)
-			break;
-
-		/* Since we call get_fsync_inode() to ensure there are no
-		 * duplicate inodes in the inode_list even if there are
-		 * duplicate blkaddr, we can continue running after fixing the
-		 * looped node chain.
-		 */
-		is_detecting = false;
 	}
 
 	free(node_blk_fast);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
