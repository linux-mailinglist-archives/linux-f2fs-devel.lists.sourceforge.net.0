Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 73F7678D296
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Aug 2023 05:45:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qbC9C-0005gP-QA;
	Wed, 30 Aug 2023 03:45:39 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qbC9B-0005gH-9t
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 03:45:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nkZH+nXhAZGvuIPnQbt0Huk7a0XPWaLLFUXEX1qldaM=; b=UOuU+K8dFPOg4GnlsNcwF0/KiY
 3nxptKrz9eylll1Z7Hjjm5vJ51Gmzoavj+YAcMslk7O1LTYw7ZHPYHt0u0S5NChVn7RwKFObD6Hz9
 VcO8ZdW0XXdMQML5m2ofU11p4r/h5lI6BkU7fF+6tmdcYXdCx3OVg0TnZ9lDbjo1brb8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nkZH+nXhAZGvuIPnQbt0Huk7a0XPWaLLFUXEX1qldaM=; b=H
 92iR7k/5pZ6Lgse6CyMqU3AEt5Pv0wn7T/yaeYx1FUstre3kNjvQGVBX64uazoiW8fX5n2Bkqk1R3
 kme2rEJgqIM2vxltryYQ5Qb32/0kxflCTbBY3xZkR5S3LxU8ezPyLUn1ZdEQB8inRHyPjF+Vj6YKt
 sgWueUWqsQyM7YTE=;
Received: from mail-psaapc01on2125.outbound.protection.outlook.com
 ([40.107.255.125] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qbC94-0031df-NQ for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Aug 2023 03:45:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Bow1+Y659BBNn2DnfLC3pEsT6Ac0IEcu6CtCkqty9HHxYsI7IruzMysyiwI650c5gPpJQIFf3II14VKPyikCra6Tyoo89zgfEoPE8skAWXLic5st9sZISyaZesWS4EqQHqrN1U+5dE8smUu7g4VITSqDyJlItvS3gyLeOmNxvh54k+qtnWDyG5ppB0NrvUlxCyzgLOAfUXQcvTfZSuSKhugfMgnv5k+Sfks1xfMNLfbZqtwJUAKdzqirFuxDIkPBHJHm8Q9C9cF2VRwPshzVnbX7tOQxA8BHLfozouasV1ayntefsNZA+67bqd2MMgUS37frCIVWIUl5FX7Kmte0+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nkZH+nXhAZGvuIPnQbt0Huk7a0XPWaLLFUXEX1qldaM=;
 b=XRI53JVA+5PKfLYbd0TiZ51PbbweeLIjnM9pl7tAH9Om8hK/RWM1OQYKKP3keB4hzz1UoRdLIixbdBl0H8F7T0zdCJ7ufD218LqIvp33xuEQGehNfZ9K2YAo3j3GSFdMNwI5wo/1REIGn66PxWjEtcnB8NsAoibSGkd26/hgr4TsHWxd845ENs66YWDYVjNeFETwNLxIlxYNrIC08pwCWC8Nk5y2l0A6WqYBJVlr/PJB7J1OuWPcVjQkGtLinEfICPaFQ5IhfyyThQcbLuq1MUIKr09kqDWtDitCWKT4lCsRcXikXRSGo9UaywvvI80hEI++xxX/Au/m5JWLL6oo1g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nkZH+nXhAZGvuIPnQbt0Huk7a0XPWaLLFUXEX1qldaM=;
 b=cv79zOyYN7vyKwmNOAZxbeCMYdFtCn7zxY4svhdg//PjQO5w+d5cqJL9ZpvbS5duJjhKBfxKOHHfoGCRH4LlxQnc0xHfbe7KMblQKRhUBQuQctFaZhRrPWpkfk3+AOYDMt2UFLXz30bFzqvTfwSzF/3ncFr/MrhSF02SLUQ6ZqpViIls51b9sz35utw5tpJVLYD+Fxw2ouwt/D6QJjTGyaWwS12/KUBQFbrWG9V3xw5llRGeRg45ENkMp7NO6xMBvTiIkpuxYi3otlXYmt/qsElsw4DZVmRbeUbMHjWzhfUUvh+jAC/20mXqtIeq1B/McAOMlrEdlh70PVv8f7fVTQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by KL1PR06MB6553.apcprd06.prod.outlook.com (2603:1096:820:f1::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6699.35; Wed, 30 Aug
 2023 03:45:18 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959%4]) with mapi id 15.20.6745.020; Wed, 30 Aug 2023
 03:45:18 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Tue, 29 Aug 2023 21:52:48 -0600
Message-Id: <20230830035248.4051323-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR06CA0240.apcprd06.prod.outlook.com
 (2603:1096:4:ac::24) To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|KL1PR06MB6553:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a52f0d7-c3db-4f3b-830a-08dba90b873e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AXMJVyKc30qRuUpuTZ78FydYb52dV1eNGlrvJn6hTJlOq7IdXMSLCJrkhcaZhX7NcTVIGnBnYWxx7HXul5hjzGW6QGsbh6hzYDP5b5b3+d/HdjgJQMtakNC+ABB1zMIqV14baaFZth1MtZbpjNcuvldhVqhSv7aH0ilhNy5aDme9AjDMINjNrmsv63ZoEmsgDjyew0JNq7gXdj/SYPmus+lzwnTeBqywX0uKNkZvV7Q+0xAbMSsOe2w7d6KHFpvWro4pf9f/9JvEHpa7HR6DzS6+LqJ4kUU4hfzn3yCYBzQd8I0C43cVMWuqCrtyYfyjk+UeXWYgVc8Zpa7Px68Rp99SxWKkEvo8m4HmsvuP19erakymtRmt33aOTrEZhJdPY5B61IM7z+WQa+NAeStgjW7FkWcOowz0tATZn26zwGUTJd190svHHaJ8o+lSxFRekKQBQ//YwNpieXl2FXVQz7yHTPnZT1gEzJdb+nEV/UHA09lGbkmFg8Lgek1n+nR5mqYfza347PD49gejyfy3eWjV5l7rHzJ4tu2yAGOqp0oGmORXz9JCUEfC60n40Iw0U8n7Oa0RF9H553eQ9z9oM1vryMBBWkbfcuGXkfXZnT/YsP+H346RVdHLlbu4817s
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(39860400002)(346002)(396003)(376002)(366004)(136003)(451199024)(1800799009)(186009)(6512007)(38100700002)(316002)(41300700001)(38350700002)(4326008)(4744005)(86362001)(26005)(83380400001)(107886003)(2616005)(36756003)(5660300002)(1076003)(8676002)(2906002)(8936002)(6666004)(6506007)(66476007)(6486002)(66556008)(66946007)(52116002)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?zeqVHlYaszq9jv3974cA8EHP4em/QqRU4tWHOUB7WML9Dzf3KRFHS3LBYthk?=
 =?us-ascii?Q?d8nl6DfC9WJcqFfsLcGeQv06NJonNLkdPNfEkEsep8ZVE1PJQ6MnjdVBkwwo?=
 =?us-ascii?Q?4tL6dgaVD5MRlBawvZPC8X8bbOQNejSZiOSndiNQnYfuXcG5kd6a+WteHfO2?=
 =?us-ascii?Q?BxXZ+oUE2mUKdd9Ax/cHLgxBA1RE6jo9alyiMkRvk89xaeD+vaMgsbITucvV?=
 =?us-ascii?Q?naOEeeao/hSzj8234N+XlrTSNshqsZzjnJdOQH8MSeA2sSO7lyLf21+NSmIA?=
 =?us-ascii?Q?2O1zdZKYKSt6d6Rufdwx9SRg0HCFX9dSwPSmzMCiw+xPf39SjaSFSbp9j+YK?=
 =?us-ascii?Q?YIhL9v8HreR1p4ohynL5T8vIGfc3iSw+7aQLsS+hZKcG9MbjMv7SkM5eVW5F?=
 =?us-ascii?Q?tdeXGrsGivl8EB7+RYIGQSk7sN+6qhe4y3mNKH5Wn49TjxdyDLAsIfiu3feG?=
 =?us-ascii?Q?miFzTxbGjPi7s2c2belmFgq+CA0/i/10F65qS4ojAPWKQvPdrxe5X1konQxv?=
 =?us-ascii?Q?zelD70gEQeY3EQXDX9VkMmkU2OR7va+co4LSCS8cPPehbx/6EyfHGp5hV+5d?=
 =?us-ascii?Q?kzJt19WyvOMWW0nCyenYwzE/1aYly++bZKm5DD/PBkDy7Yg1jvsNwOcDb5Y7?=
 =?us-ascii?Q?SLLbU2UHkb38tA+gC821V4FFLvY4aO+mPSAveKqWUFfLk26Wv0f2UTwuHDVf?=
 =?us-ascii?Q?7rG0uyTrhIQBWAWeqZIDvKDGCc/7eR9dmsJqre5roMxIFB+GRjpnwcqCYQQl?=
 =?us-ascii?Q?kspVxLRkBmgXvu3sQBmDdgDounD5heQ3poQGT1GbYbWicAddz42uqEv3uMUq?=
 =?us-ascii?Q?eK8oM1bADVvrWCZ++86zT71Tiamw+Nv8yP+cWSNp8DoBcT28XOAya0TogXt8?=
 =?us-ascii?Q?gLv4C4gGTaMhg65reOcQwMTNxs5LPNqcvbTrutwUbJLCvXvbW0xXpDUmXZH6?=
 =?us-ascii?Q?3I/v5pODWxv78qbZDK2dUOH2QdhQ4nnY6al5uoKZ/YnFaHivYypbIDI5Kgm6?=
 =?us-ascii?Q?OPxbhjb7XQPEFnczpTMSrGr1TfDylejDEaWJ7Ky1i/yMMIx+R9btdDdKK8bB?=
 =?us-ascii?Q?T4mZaI8Etp3ECO8cWIeWu1I+dp+Pw81x+NIMat7A7ng0hIVUugwff4TKYnk0?=
 =?us-ascii?Q?KAFygPoTWjmX5cjfavSaceWUiPzoWH3FMuyKfKgJSM/ghM5PsHjZ3q1LPlcK?=
 =?us-ascii?Q?+k+dU7rGoME2JsB0CqH1FHXCOoBuRxsPNceZV+89J5MwGewFMNzEt+1vwQpo?=
 =?us-ascii?Q?09hKNf6QS7FsXYWbI8GEDYC91xiDL3WsWRKK0v8QA1M/wZYWK1LBwvFwk34a?=
 =?us-ascii?Q?bsmSQtdkCJw89d1iZMZgMY0oHz8MDjaLppbcQNjhqXqlmOO46HcCe1avChq9?=
 =?us-ascii?Q?PxqEbkNEMSoAzVnyq5gZY7BZNPo8AkpHhJzwCmVcNxjEzPf6vKfCRCn4jGGp?=
 =?us-ascii?Q?kZ/BZb8R4jHvV3RNzfn/vZ0gBkPifqcb2fzudeud5bu6FqcQju/f0uKR68ll?=
 =?us-ascii?Q?8WlU0gXGBNbG9skhh44t5JuO/jdFxa6Al0sF/8FGyZJUUz9B588aqq5ymMj5?=
 =?us-ascii?Q?narXs2Jsi5ZnlKxq8Y68D3Na/Tws6vlFbcwlK2DY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a52f0d7-c3db-4f3b-830a-08dba90b873e
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Aug 2023 03:45:18.4930 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2gO01obBsKHZWwbTuQpBn0Hwt+T+qH+kp+tj8YPJQFNMLMiKGVxrM8QB/RRVLtomseAnBPhgfqXfNeJXTcRQoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6553
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The commit 344150999b7f ("f2fs: fix to avoid potential
 deadlock")
 only requires unplugging current->plug. Using blk_finish_plug() is unnecessary
 as it sets current->plug as NULL and prevents wb_writeb [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.125 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.125 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qbC94-0031df-NQ
Subject: [f2fs-dev] [PATCH] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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

The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
requires unplugging current->plug. Using blk_finish_plug() is unnecessary
as it sets current->plug as NULL and prevents wb_writeback() from using
plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/data.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 5d9697717353..936a95464186 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3343,8 +3343,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 		atomic_inc(&sbi->wb_sync_req[DATA]);
 	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
 		/* to avoid potential deadlock */
-		if (current->plug)
-			blk_finish_plug(current->plug);
+		blk_flush_plug(current->plug, false);
 		goto skip_write;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
