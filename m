Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C3DB7135D7
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 27 May 2023 19:07:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q2xNx-0005fe-Lz;
	Sat, 27 May 2023 17:07:22 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1q2xNt-0005fX-Tg
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 17:07:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9OaUs1pwXokDvtT2s0gYPtsaRWxvSBovaApqIyuJvGw=; b=P7aIbuSs2h9xipktnMQ3nDtQpr
 mZ4HdfTFXEy2sXYw0n26WudTPZMm4zkAtdJ5E2Du3i8Rqjd2vBKF/LTqLS19pIm5JKB3UvHqHfH0O
 ABo6t46mPzLgIgNGBbHymNTDdEaiIHyaay5fSE/2C1Ol1WRTCZ7PdgJiOzzT3GGgP/Aw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=9OaUs1pwXokDvtT2s0gYPtsaRWxvSBovaApqIyuJvGw=; b=Z
 zn1XzOtqFgUwjbQW4968yjgHYa/eDkP6ITsweGuZrJeQK2fd75GtnO+Ya+pv8MUJ5itK3J35qfnap
 USXEQJzriQ7lzthBpNaMnktlk8qaEZ06axFoT0SzR7tmiUqEGa597tBjdUzVesKe6GOC2mTkqE4Hu
 l9KB+kxJ+ew9frjE=;
Received: from mail-psaapc01on2137.outbound.protection.outlook.com
 ([40.107.255.137] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q2xNn-004ULJ-7x for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 27 May 2023 17:07:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Mx6SDEo6GBN3TA86/zt1Rbrr+EnatEgeQRquNm1bdFSN3iWTfXBZuftgQfW85d/JYFCzmeKam+72g/FjU+GW35wLWwQLJLU6WYZvSVUpuUt7n8usdKg38hfjgjQ5ePeYJSjs7bvn46WicNF7Rvmjhc+pUmLSeSz2ycEmlrhVAqWGeY7ZOmtJhfeXdNqs2o+I5qylV1s+g3jFJsQnSTtHaMozuLueqKEUOa4O8qAfsmaWXkl6lKdUXPzBANCmkSB8oWmwRugFdKqjGvk6YuX26wapZowV6eszCn0n8kdyYMNfwVkAXAMr9FUEzubeDZkiBqZQsbzEZHrSoP3pqV9oxg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9OaUs1pwXokDvtT2s0gYPtsaRWxvSBovaApqIyuJvGw=;
 b=nsNbyGx8h7ZY4In72QpaxJhBVUDKUOk/Lt0l66NvFi0e+GE+XhHJBkFWaGfTohPSwU+QNrjQWjNOjI7BlGJMC/IU6sbfUg5SDU1mkv2AlOu7vXqCmfFaxcsmNKa2TiSKW+yZ5eoTJQ4JGJ1Jzr1l4lsIqKW8EoDJtL4zXjAzXsE0FqhQG5MKMhbpBwpum/Oz7qxywjjlWzTEqIYRWElP11IYviii+tflSKgpLpNTYDbUH3LZrftnROrweqg/0xdttmB4cEH0rTJVG2UBiZFO6RhiN55sfyLy/kCNObSGyINoJMwqpwdZL5plPgn24Tt1MtFWCr7IIx5CJnFoTJC1dg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9OaUs1pwXokDvtT2s0gYPtsaRWxvSBovaApqIyuJvGw=;
 b=gtipFOaRruFqJVa8B7G/PTAv/6w+plXrZAsNaxAFr0+RMC9l0Q615uCJopzlYDpX6/CoZJq7aS3BvEdUVIGVLXzYgidNRa1jrjC5iFpSpzsExTYA5YamfacWrqzSVquMNDTn4QA5hQEkT7VxEHu2NxYA0M9aLTrh8OyeSnijw+nJqygys2eifjJGIJhD+RyLHBMKGOwCZuWdscfum+xgQWEvy7ONSBUrLOVngzpL3oM/mRCUw835rxrnRtoeTGtj1ruWBXiTuSnruN+UkdZM5iz/PYo7HL4N/wrFVqoCK9n6l9PgbJKMSiYds518A+HAyRZjKV+KPJn4hQEN6KPFNw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by KL1PR0601MB5613.apcprd06.prod.outlook.com (2603:1096:820:9a::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6433.21; Sat, 27 May
 2023 17:07:00 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::1e05:3b1e:35f9:87cd%4]) with mapi id 15.20.6433.018; Sat, 27 May 2023
 17:06:59 +0000
To: chao@kernel.org
Date: Sun, 28 May 2023 01:06:40 +0800
Message-Id: <20230527170640.37930-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.39.0
X-ClientProxiedBy: SG2PR02CA0052.apcprd02.prod.outlook.com
 (2603:1096:4:54::16) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|KL1PR0601MB5613:EE_
X-MS-Office365-Filtering-Correlation-Id: 251e652f-e353-48ec-a3e1-08db5ed4c8b5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Q7+kyeq86Z3N9QIIhz//OkBu3AQDeZ1WZgyK1DHmafcj/HN85zmvkcuVwAaYzBjwZP7KSGgqK5cgCfEP4BkV9Lxhhr7zVX7p0TexIlNk/xEYMJt5PXgqdLUwq+XNbdEwZUDYGXWS4ytsoJ5XlHiLDndn3xiZ9y5mVOkB1ak2kayWc4vSTO8ElRRsgf6rCyRpcfcCiypfk9cWUfK8cklfd4xJhSpMo8SWhp5hYal7NBtKampH9AXo6+vx5MYFcBy3MDPltVQqAeEuTIAynzQL2D1xwwkzrjmyGrupKJ95Sz9GOSnMBqXsXmyR2d6Q/idTJddFeDCcRyPrNgtQkUfKb6qs1fQBc1aJMY4hc+6i4ZSwOlvBMB88e9FS+ptA5+gBMhtb5zFhQ90GVfVVJ237WP25HVijnt5EuM03Zw26YrfkqC0NNB4RBCHRKEs82EhUjFch3cBtG5UKOPYifhxYX2r97mtIKC3LRzIq0A2srqr+rqBBrwUZi059xSLfATGBG9CwVyhsxEPN1+DzMV7qCI4kivfFicm6AuadQ7Yqaf7PNp11f3mDlMNYB9jlNiXZF+hz8/ao0PYP3wIbMSUqH3rgHq/ijT84qnCycBJKygQyzdytX1j+rxRcuDWq2KO+
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(376002)(366004)(136003)(39860400002)(346002)(396003)(451199021)(41300700001)(107886003)(8676002)(8936002)(83380400001)(6506007)(1076003)(26005)(6512007)(186003)(4326008)(36756003)(86362001)(2906002)(66556008)(66476007)(6916009)(316002)(52116002)(66946007)(2616005)(5660300002)(478600001)(38100700002)(38350700002)(6486002)(6666004);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R1Nq5JR60mdDQqiNM2TmsXd8BUhu1juVDStaQ09m9cG3Rhu5Y35vrjNZT+Ph?=
 =?us-ascii?Q?3LfL+8sCrpUCN+V6zYcx7cjLQv88/HAfP9FzLwvh+/iR2ZMiyKlXBXxQsHIO?=
 =?us-ascii?Q?Rh/u/MYws6M70GQF5TCn4ixrJdlMZtuGM3mfsRRgDeweAefhQHksie3d1mQC?=
 =?us-ascii?Q?xu6BlcxWVpTW98h4ywGv/SpVUlyhMt7KX22nCvVyqKxcwW0k5k6wJHemo5PC?=
 =?us-ascii?Q?YxThhIW7LCDhenfM3fPXNuV5pmgOdJp0Lk56fOoXsyXZtIx5Z7ixur2+M/iB?=
 =?us-ascii?Q?PHVfWyswjTBxY30QYsnzXCGEbJWxmVnrMdvSYzhKr3+xnqW9TqxvkQ6VASIz?=
 =?us-ascii?Q?VS93AlseJUFyhNUAVwoYkUNa4vgz33NUHVSBh/lArnR+Ctk8BQdnIus4PFTX?=
 =?us-ascii?Q?q5Q4fN7Ck4VVT2nTxa1xqe+gSGN0feclDMY4BdkaSRMPNO25iJuEP7xmUEQI?=
 =?us-ascii?Q?I2BJPAiXBK0qf57kDQjawYJ85AxPS8cXtRmctin1WaIKk4gZiiZj/1UI2nGi?=
 =?us-ascii?Q?4HIiB8RQ97R1Y0fm3tHiFDZ0LhdjSAALkmAzqFkstfpRjuI9Vlu62pZafcu8?=
 =?us-ascii?Q?hP1KSdB723Br3Y13FBQuQNs07vDf+RDfn88Cunl1vHFNjAwp2Txw4yr7V3Zw?=
 =?us-ascii?Q?y47s5bTT02yWXyw/+HkD+pOO6n6ultvmX0pM4+uHnFI0UTs8QomEET5ast6b?=
 =?us-ascii?Q?k0wAWLDR2gsCu4pzAjw++7D4L3YHbcibVd92pHwCOJ4YKJmw2RrsI2VE2qrZ?=
 =?us-ascii?Q?ur1jk2b5UEBcfCLQPZ90RRRDY0a5ua+pUXOftPA0tutsJwTkgnAe3vjk3gYK?=
 =?us-ascii?Q?g8EKXMKqS0lt89OaIYyqAq9YlMiQXKXqh0zi3mwYXWlrCkbwaGN1TehctlrG?=
 =?us-ascii?Q?dvzCMgZyWcE+uial3A3RA2SDUe7DwPg0k5lPH1scwlBGJYlvr9JjS7XFhU2d?=
 =?us-ascii?Q?pa+Y36f/khiw2jmZuYZ7ltFA09u98RA/nFieSF1/TtAHzmlGV457IEwJyznl?=
 =?us-ascii?Q?Xt0JWRyfv4jFOy/V7f1ATq6ig5o8NyVFvUi7dc5AHgBXP3a/xdvYTZ8wGHxX?=
 =?us-ascii?Q?t3os8zqN+j0M8egC77Fc4oPV5/grgsc844bLAPZOA8wFf4o/syjAcd40VDlf?=
 =?us-ascii?Q?8gwUa9XB2Zy5tFNyxd7RA0PAfZxRnu1+xOZ0LM8bnpVOdBlsRMNLIeJF4g9H?=
 =?us-ascii?Q?0gBm7i+tWtAQK/zhUrCirxq0w6nj2aePxkOMOy0E8KO8sRdiyx/uleCEddx+?=
 =?us-ascii?Q?5u7jNGgy0Vb7Yce55gq1TK/6rVlnqpqtF1DEXhLcmkPS6p10+10qboZwkQj3?=
 =?us-ascii?Q?fgDDvbhN6em9HjrkdOL0F6CTOlXZxZC1wDD+8plrsYVNJthxpg6MPV52ATOp?=
 =?us-ascii?Q?iMPEmZrL5otkU1KzPwheXr9erqjzSAeAqetnU1MgHwHw+RAFMFHyqis9i5eS?=
 =?us-ascii?Q?1J8TqjGb2TF1ymBgUi4WgAYnbmm1GnCPOs0mLc9VUXyrm2dZmXNyUBj+xuwz?=
 =?us-ascii?Q?pqmk/NGlRoO7pIvMrbKkEtcPRdMWfQ/5eI19E2PuoSL1PVkAfGFdT9kyAAuW?=
 =?us-ascii?Q?++aOJD8wDKB6VXRV6n7tKRn92SIZnW5CKwXyFycf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 251e652f-e353-48ec-a3e1-08db5ed4c8b5
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2023 17:06:59.8769 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFZ0oCiiXe+p6ka8tNsbibRCUJ8aSg1QF0Q2lljpiXxphZY5RrMwb4+PolXcNqZP+mXR9T/v5A7XHI5VFnsF6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5613
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: find_fsync_dnodes() detect the looped node chain by comparing
 the loop counter with free blocks. While it may take tens of seconds to quit
 when the free blocks are large enough. We can use Floyd's cyc [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.137 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1q2xNn-004ULJ-7x
Subject: [f2fs-dev] [PATCH v3] f2fs: Detect looped node chain efficiently
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 Chunhai Guo <guochunhai@vivo.com>, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

find_fsync_dnodes() detect the looped node chain by comparing the loop
counter with free blocks. While it may take tens of seconds to quit when
the free blocks are large enough. We can use Floyd's cycle detection
algorithm to make the detection more efficient.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v2 -> v3 : Reformat the code to make it more clear.
v1 -> v2 : Bail out if a looped is found in chain and do repair in fsck.
---
 fs/f2fs/recovery.c | 71 +++++++++++++++++++++++++++++++++-------------
 1 file changed, 51 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 58c1a0096f7d..f0cf1538389c 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -360,21 +360,63 @@ static unsigned int adjust_por_ra_blocks(struct f2fs_sb_info *sbi,
 	return ra_blocks;
 }
 
+/* Detect looped node chain with Floyd's cycle detection algorithm. */
+static int sanity_check_node_chain(struct f2fs_sb_info *sbi, block_t blkaddr,
+		block_t *blkaddr_fast, bool *is_detecting)
+{
+	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
+	struct page *page = NULL;
+	int i;
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
+		page = f2fs_get_tmp_page(sbi, *blkaddr_fast);
+		if (IS_ERR(page))
+			return PTR_ERR(page);
+
+		if (!is_recoverable_dnode(page)) {
+			f2fs_put_page(page, 1);
+			*is_detecting = false;
+			return 0;
+		}
+
+		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, *blkaddr_fast,
+						next_blkaddr_of_node(page));
+
+		*blkaddr_fast = next_blkaddr_of_node(page);
+		f2fs_put_page(page, 1);
+
+		f2fs_ra_meta_pages_cond(sbi, *blkaddr_fast, ra_blocks);
+	}
+
+	if (*blkaddr_fast == blkaddr) {
+		f2fs_notice(sbi, "%s: Detect looped node chain on blkaddr:%u."
+				" Run fsck to fix it.", __func__, blkaddr);
+		return -EINVAL;
+	}
+	return 0;
+}
+
 static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 				bool check_only)
 {
 	struct curseg_info *curseg;
 	struct page *page = NULL;
-	block_t blkaddr;
-	unsigned int loop_cnt = 0;
-	unsigned int ra_blocks = RECOVERY_MAX_RA_BLOCKS;
-	unsigned int free_blocks = MAIN_SEGS(sbi) * sbi->blocks_per_seg -
-						valid_user_blocks(sbi);
+	block_t blkaddr, blkaddr_fast;
+	bool is_detecting = true;
 	int err = 0;
 
 	/* get node pages in the current segment */
 	curseg = CURSEG_I(sbi, CURSEG_WARM_NODE);
 	blkaddr = NEXT_FREE_BLKADDR(sbi, curseg);
+	blkaddr_fast = blkaddr;
 
 	while (1) {
 		struct fsync_inode_entry *entry;
@@ -431,25 +473,14 @@ static int find_fsync_dnodes(struct f2fs_sb_info *sbi, struct list_head *head,
 		if (IS_INODE(page) && is_dent_dnode(page))
 			entry->last_dentry = blkaddr;
 next:
-		/* sanity check in order to detect looped node chain */
-		if (++loop_cnt >= free_blocks ||
-			blkaddr == next_blkaddr_of_node(page)) {
-			f2fs_notice(sbi, "%s: detect looped node chain, blkaddr:%u, next:%u",
-				    __func__, blkaddr,
-				    next_blkaddr_of_node(page));
-			f2fs_put_page(page, 1);
-			err = -EINVAL;
-			break;
-		}
-
-		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
-						next_blkaddr_of_node(page));
-
 		/* check next segment */
 		blkaddr = next_blkaddr_of_node(page);
 		f2fs_put_page(page, 1);
 
-		f2fs_ra_meta_pages_cond(sbi, blkaddr, ra_blocks);
+		err = sanity_check_node_chain(sbi, blkaddr, &blkaddr_fast,
+				&is_detecting);
+		if (err)
+			break;
 	}
 	return err;
 }
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
