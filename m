Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B4CFB611497
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 16:30:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooQNk-0001re-3W;
	Fri, 28 Oct 2022 14:30:48 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ooQNi-0001rX-Nu
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 14:30:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=GIHQY6kRjsGHtWVGB/mGnno7LPH0Wu1mVe2cu5SWP8I=; b=G765dM8fdsY+qeFD7ybW5YgZpt
 HjK2LceUdaEo7IlTxnxHDMt453aerO1Bv9gS/2fRnIpz/Q9XTA4qDdZAhyYuy52E/tR2yv7A39V7H
 vTdU4da/82ia3QbvVlLQ71FErAYqg0BIsCNP0PSHbTfYVzd8Ckb/HcOc0uR29WntsaIA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=GIHQY6kRjsGHtWVGB/mGnno7LPH0Wu1mVe2cu5SWP8I=; b=i
 PG9/wqWtTTn2ualEPgLNpH3PW4Vy9+rESejCnPPItE/cqMA25i9C1NycuGFVzzyJipBm6pMUoqZ7P
 pBNB0kQ1xKQTOmhiBYWwZ78C96vFwcEImZ8/AlHRde5MZR9EQh5Xj24neBfj71pF8mu7uEyivqG1k
 7HhLqQeq5P7VOxew=;
Received: from mail-tyzapc01on2099.outbound.protection.outlook.com
 ([40.107.117.99] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooQNc-0007Zd-Lp for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 14:30:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=iRbd2cWrTLrIZGsnu/u4m6k5MOmQWWlQm6UB102fFPgX1eIhwpPEdY7zek4PbEtt3UWpdAj0jwOcqoG6XjyqJmd5L7tUhSjvPJbpgRWW9v9Bv6+tixgDI8NvQOJ8TZE+YsbSRZKs9BhdvHn7/sBZOHxBsBLjjbNsa7hHtV9fM8KJklwvPHR1vMe0rGkhfwiDsMxSQ/hG7qitIS3UCd6j/tDMdCu6mH9qnJ9fVcQWpcUmkyUnAeUHHvXWsMOGf0a48JcuInPpSIr4DYZyE0PTdVhCGs2E5cPF/PCmg/PKNlxFiTCnf95gSGKXq0A2mzn0V5GG2BK/d8xmLe/RE/VVDQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=GIHQY6kRjsGHtWVGB/mGnno7LPH0Wu1mVe2cu5SWP8I=;
 b=nnZ+KTIQqqQzZSlpSR1zKkNsCsmse3Itbh3eYZPCIqJtFUGsUgyPFFddCsKZPaL+RT28zlzjmLWQ9BwpWXxC+8C8ZLhJaxTcyiGHDTPp8l7novk+0pDnPnHwQVZdD08bIUqI1W/dkybdanxBt8QNVWP9WbgoBnnOcLBYKPF+mNE0gmwmDJ0Ex97GEEFpDRV9LVkzNvI851BjgWKe4PjZOdI32QCaw3NnS9lIMgYL/EYWTwYiT9wVUDlr5c+/PkW/dHdsPTDtLqubRAGOvX4bcc5qAzzclmvCZAv4/3IgbK1E87SSNCEYhFEJKuDsizVFrd108lymmr0EZImP8CVCUA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=GIHQY6kRjsGHtWVGB/mGnno7LPH0Wu1mVe2cu5SWP8I=;
 b=Pe0hnTBi/Ea0e55PxWhZI2SqXoTfUV7WmdzKtsDBhdViG5mMh57K9lhn3JTp3NwVOyysKUkidEfCntADDeVjnFrjfTwie/8DRxTXpcEs/eW9DnBoCVLXaAPruJO1U8Nz4YAMJgundp9mFWocNpAWGUM4em0x1pKgwocFm6jggWr+RzN2HGJhbeakKABiNQTiGkCUDW8Ce62m1J7bkIk5C8xZjRCH+FsetYmf+sKqsqM0jOd3/7P4L869UnvGkCTtsJchJTPbLfeQmc/hnYBZT78Ye7yMnK0xMFCSnaTuuseS0P/Z25AmlcVvM2PTxVwwZrt5nRq1IYBUTfap73dO6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5841.apcprd06.prod.outlook.com (2603:1096:400:28e::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 14:30:32 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 14:30:32 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 28 Oct 2022 22:30:22 +0800
Message-Id: <20221028143022.56476-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR04CA0003.apcprd04.prod.outlook.com
 (2603:1096:4:197::23) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5841:EE_
X-MS-Office365-Filtering-Correlation-Id: 1121728f-a8b2-40dc-e177-08dab8f0f7f1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 3ofmiqlhtw9RAyPFwWRIxOGAAnGt3cuhtI4EsaSMCHMjCZA6LyXoiBc0Ig5el9DH6lec89YgGzfWHyGTkU7V6qhiFAisL8HaKy/8jLcuZ65vvD3glJ0wOaMKbSSeRkBy2YGuiHfOe4GVNu8CoCBFBf1m9h+kbzj9GGmBohBQa//6lbvE3nN4d9gAAdvEa1Cc0JsfbHd2iaBFmJFE/ZXulbFZVgC1grfAqIDkyRQIIDtAss9Ijw2W4pllQlh+8jQ4S9Ycjmy7cy8leQNlNPscULMjaoVuykPXKHuj/33qAiP72j276p2vFtvtJLuRA+IqjTuKhelMJxOc1QMeBbKb5LavOlrFjFkdKVVgTWN5tt7leXjPif/29n68pz5M+YQkRkoywhL7S2Yilx2KY5xfDZYiyEUinZXSpEo5HtosfrMrJP9cCpoGslqnYAeW1aLcst+s9Jl18e6A03u77gIY4U986kqTWpkkQFGzdFCntevTyjQKFWUQ/0MvKfn1lYvDHvvfAHJLsDv+D3aMgcACLkhfsV/hBvrXwTM0xHBCWUwQsYod+QawKxIiMd+Em+OEqcs9biH94J3jYBfbXlXxUSeUMgzvWTrwfmHEUcYhmNFENPi4kkErwyHLhs+cSAF0Qpq66GIskIlB3zCATalwwtsrSNf7zT4z1cmXznYixKv2PoDs6HecC4M8YQ2t7aLfCsHOSJPzaiLdRvLeSeGZlNIl1/jKDSIz/QXdoe0+huUpu1sq54AhPBlrVckuCQXPBiiD9pE9MGgqpb437xZvTA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(366004)(39860400002)(451199015)(26005)(6486002)(36756003)(5660300002)(2906002)(4744005)(4326008)(316002)(107886003)(8676002)(478600001)(6666004)(38350700002)(186003)(86362001)(38100700002)(6506007)(8936002)(1076003)(2616005)(6512007)(66476007)(41300700001)(66556008)(83380400001)(66946007)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w0+mLseSiRHb0BI/F7I/jLf6LRniw54p8f8Ezjl6ZITprbNRRQQlZ7CkO6nc?=
 =?us-ascii?Q?7V37hLT4OiXTOZzYnaByjmLd8QqLZKSfYbONpPpOozEFggluMxUr1AfIPpl4?=
 =?us-ascii?Q?iNwMvQv+yZfAnhAsFwrUexXTenFDjdhSh7elOONtOZNHHTXcx6eKLUyzvRP3?=
 =?us-ascii?Q?wJaSE7sG9hZQpRJvX5hOrJXtTpltxVqALasyqH+LaS+Q9BKctK8dTnDYi2t3?=
 =?us-ascii?Q?15TmIWSgH2crGzs9/NwPJE8LlrjVg4FaumDo55273NdbqFwnkmauvz0HWZPz?=
 =?us-ascii?Q?yUcXyXoxqXHkSQfN84PZg2/Mkuq5jaM/nlIvwS1pCMg4N2AhFAPvb0tAIG+W?=
 =?us-ascii?Q?KG7BaVpRPI4o0c1pdEO3P74GpiR+oghSAsnYONFclXBnz9ckEnAEy62HFQAs?=
 =?us-ascii?Q?y6eWGhN3EYCt3btv33AGw9BF9f/MxUFdeMMSN192eJi+0hcDP5uy87/gYOb2?=
 =?us-ascii?Q?K/aaDPd/nzSRKjNPiUVeA4XsI1N5OWW+ps9XAucKn/FbClM3d1/HIWFitiyY?=
 =?us-ascii?Q?utpHJSLKOPPGad8Ri6QZNv3T9Jq479Ro21o82rfdS0sMmi6BvjcRPls2NRlQ?=
 =?us-ascii?Q?V7ZKDSZdtXX3X7nbhY3mXtHktjEwXpXCHFJcyFbBhUWQwaTpdVj5wN4QaMjN?=
 =?us-ascii?Q?Rw5tlPsQEW7hhL+plbjID54lsRb8Hag6UwT9vnfijZTbEZupv7VKr/OqEqdC?=
 =?us-ascii?Q?V7vF/PclIovmJeyO+L9H8JgX5cEzep6LhnTNkhb+P+lFsfFbosxuDfOqRXB7?=
 =?us-ascii?Q?V8W653vevUCQNRMr7ptJkimPtuLpJfrIuAmqfkjoclFUQ0jjUjUNtSJkx2C+?=
 =?us-ascii?Q?0sQHZo4zhs0WqW7bOORXOiz4jInoJG3/9mIiIoZ4Ma5K2ZNJG7HmX8MpIo5x?=
 =?us-ascii?Q?gth+JVVuQEGv7RJO0BIfB1x36MWhTo733JBmVR/E3vDkCD3P0HS0SnzRIJuE?=
 =?us-ascii?Q?I0N5q3wDBb7LVzt6ffClDLmguOpZVxoOhQJWBLVkn98faW2BkRUUWp56h4Y1?=
 =?us-ascii?Q?L7KZIHN40Y/ZhKpQxcSS+IkqWEqOyWlA+0OKCYBqsElUh/MLdMkiBk3fwSgt?=
 =?us-ascii?Q?s3LwwQA+YhbwHdA7kmp1Lfp1tfBQg74oocoEQeXoQNHr+Q0v0z+T41as++Bm?=
 =?us-ascii?Q?kofwQVDXxPaX9k4SH0/VfJd22x5I8JMBt4WqAPhCAo8fVQYSb899lnjwkkr4?=
 =?us-ascii?Q?g4/HH0DFad2x/la3pt0Gmx8jcg94tr3ty2p3oW0PkqPYliDT4r5dj3Fds4+C?=
 =?us-ascii?Q?yvUta/chvVHA1IRILLozVJX6Ixvbsx46FgneiGGSCjruI24GpBqwEJs0dkEq?=
 =?us-ascii?Q?rwgH4/XxDlCsN4fRLokiuRb/AIjH5dhU/MRViGN3cJwHVwCdvmVj1XqvCF4h?=
 =?us-ascii?Q?ovnX5u03JV7sJhWBtXfeadR/DzM0fPyhPe5031EcaTYx9RBCc32zv+AdCfhl?=
 =?us-ascii?Q?sWCn1PbUx1TKf4YZ2+tnMgkwifl/N0DQXIB3Tx9+GwFy4jVjX2CgzkVktoWt?=
 =?us-ascii?Q?PEx/R2+aqwB3OmV9AkoosTS3lcpZ7a8Ibz1+y8F6oSHgxIFm06qgI7bu5Y5v?=
 =?us-ascii?Q?9aIpPV92RJX12ftQD0vemkrGGWjfCxvc0lTvIEcq?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1121728f-a8b2-40dc-e177-08dab8f0f7f1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 14:30:32.0488 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 08kyCEgxIynJBWyZPH1iKUUpK4V7JrkZHC4cNTAt1/p5IMyFlNQhlcE22gxylfw6vIVwriR6VNKYE3ArT/Dgbw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5841
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Under the current logic, after the fsck flag is set,
 the discard
 thread will still run periodically. Fixes: d618477473eb ("f2fs: stop issue
 discard if something wrong with f2fs") Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- fs/f2fs/segment.c | 4 ++-- 1 file changed, 2 insertions(+), 2 deletions(
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.99 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.99 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ooQNc-0007Zd-Lp
Subject: [f2fs-dev] [PATCH] f2fs: stop issue discard if has fsck tag
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

Under the current logic, after the fsck flag is set,
the discard thread will still run periodically.

Fixes: d618477473eb ("f2fs: stop issue discard if something wrong with f2fs")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7786351de429..b3600bcadfc7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1716,8 +1716,8 @@ static int issue_discard_thread(void *data)
 		if (kthread_should_stop())
 			return 0;
 		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
-			wait_ms = dpolicy.max_interval;
-			continue;
+			dcc->f2fs_issue_discard = NULL;
+			return 0;
 		}
 		if (!atomic_read(&dcc->discard_cmd_cnt))
 			continue;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
