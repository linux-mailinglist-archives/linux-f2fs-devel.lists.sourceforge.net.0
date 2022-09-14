Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3406A5B8109
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 14 Sep 2022 07:39:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1oYL7H-0000JO-AD;
	Wed, 14 Sep 2022 05:39:19 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1oYL7F-0000JG-2Q
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 05:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=0IAYwjAdjb/tNRTBN25wPkgD2nbLs4ESjg5CLqWicNs=; b=KUpzPQlEt642R2bWv7sZLmMLGA
 YXd5rtB0b0hG6nCmgAnj/DnMtU3pyxECbgC2YPDfXvsyNBKxgskhuPmCEMeSn7baW+WvkrmkUyqnl
 PVD0lUKjsG7R6NIjUGv85TRpb0sOPEUdDy0DViDuvMHlSoU4NGnaLU9l9SuseQNHdA5U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=0IAYwjAdjb/tNRTBN25wPkgD2nbLs4ESjg5CLqWicNs=; b=P
 0BQ2A8K5sEIsZs86v/QPmQLwa7vmkHQBTdMSuDjdPFpB9NjKTd82fUf4BSHH6DJeW+t/Q8GNLmbAl
 0knLefRHC6fHtsfGdislcC5oV6URBaTtTIz5mwQ1x2aMKDq2ZUSFFPsa8v2u0iM+Yh+wq7r9AqfcN
 Egtp+iliqibAsYsM=;
Received: from mail-psaapc01on2125.outbound.protection.outlook.com
 ([40.107.255.125] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1oYL7B-007cjr-Rq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 14 Sep 2022 05:39:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A2SbIWHN+9pyrjba2bg2MzyFgm/PeqvKxjc9fszlbICR1Up3FhY15HftGh3jz22+zKW6/PX42N/ci3qVxl0REisO6Af/vauKjxxLudDJ/9ss4w9gBiRnu0bVQ5yiiclEyFrZiDZFxFMcLNKDPzI/NiF7d7vZCOr9zwXvR+IrbcazYTA5sYzqshnK1PVviq6AqSdwOs7kREfb2JEzyvJksi7NPxSxcEu9Ec+c+WE4f7LZN/TY65Hd/IEHeQlS/A/sWSmZLLyGOXJ/B4wbMa0cGWSCVXeJir4CKDr5OrO7nbTN2ESVT+JjNKr0lAzUiJeGpAG0jFAgA/q4vFeUiBG5GA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0IAYwjAdjb/tNRTBN25wPkgD2nbLs4ESjg5CLqWicNs=;
 b=UQ7Jt8e/8T/tQ8pxdUwAtZEyImM3vsxvUrlkYlJdg+aaoegD+B0ZuwOvA2K+y3upFIKWCQqMo2wC2euBXRjFbqbj5FCjgC8YXaZA7cAfeDHdl8jC1+9e+sbLQbvBj1KC1gR3UwraPw0glDcd+FOb9qxwhZPPvGYlHZ/qkCAdAxqGn1/xh6a64PXa+9LNfo4ECJNcoZSs5C9QfnB9T9NLRUATdLjNFLnkEAfCglzDpnz8Qfahv21pbssA0GUW4hL5zz463oS1ursQtpmBp0EQLejR+0j1lxRGrg+lHTTevt42Tzksle0p2DRMQo0BrJzbdJ9OOqM1xsZIAAYjzmfj/A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0IAYwjAdjb/tNRTBN25wPkgD2nbLs4ESjg5CLqWicNs=;
 b=TAelgrBuxjtcHEKpLet96RZ+gd60ux+Yl/h3Rnz4sCk3CTxezZGb8ihpLsb0RqsRgUZqQ2ugnaEgAOl2jcoizuNO2l8awqlxc0XEQgfpZuc7nIUeXwOPkm/HLf+reIyO1PqOC+omEHw489YT4w4L2zdeNd/UoplJfjYBaycl3B4DSnQsf9Z24eT00e8oUHTMqSDqIsEcF+BKIE9C1DeNep4gu6j6v10efXvJ2xYYNjt46CAej8ZTuNPlcOqrdrFDnAnuvsbcPpzRbjRJ/vZs/YICP2j3+7vWmq0x8D3QQCzKQzJnSmGi8Om+3hneaCdwRfSHxLdZyaZ7KPBM+5wcZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com (2603:1096:100:3a::16)
 by PSAPR06MB3943.apcprd06.prod.outlook.com (2603:1096:301:38::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5612.19; Wed, 14 Sep
 2022 04:04:52 +0000
Received: from SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::495:fb84:3574:2518]) by SL2PR06MB3017.apcprd06.prod.outlook.com
 ([fe80::495:fb84:3574:2518%5]) with mapi id 15.20.5612.022; Wed, 14 Sep 2022
 04:04:52 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 14 Sep 2022 12:04:23 +0800
Message-Id: <20220914040423.539-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.36.1
X-ClientProxiedBy: SG3P274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:be::16)
 To SL2PR06MB3017.apcprd06.prod.outlook.com
 (2603:1096:100:3a::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SL2PR06MB3017:EE_|PSAPR06MB3943:EE_
X-MS-Office365-Filtering-Correlation-Id: 491590cb-be5e-4464-0b07-08da9606468d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: yzhPii0QWyzH4tHjYfcA9wdIvWZWbAzox0Jgoz0UyN3kiqv4a02jpTZGr4E2gZi61RTB5Tz/3JGkORHMdxzPEGcLyOfa7iwC/mxIcB0Iga5+V9voapd75UG1yMLRiq+MqWrNpAbdGrP96c01dxah/8YM4w868IjuF2x4bk1asKA9LsMB/FQbjuc5nm2MEBSWe4J58nJ69xs3JdD335ng/7XjagTCkUZ2TR+aOVeoE2zqYY/U7GkL5YksnUNCtO+FkaKtRsei0xkBBrWMCgaqMvMYQoTwjdNf4AkWYPOLUsWwheffiHdSAGQAkb81zXO7zYvbqlp4PYK11rJlM7Zm2sUPrtjPCObNaJ8RGlR3cIzmcSUYpeiqbwNy6yaPIQR2x7gbBF1YPlevPI/gyqNzgE5/dBdCqOQpKXyld5XcqCvNje8fq61WgcWFit/LE9CCWdRUGJMY/WZD/aPfYHVt+A/ppv3qAA807fqeBm/9LluAqHSZD8Thf4BMM2+O0zSCzYLErOTljhsV7E6aPah/7dqxd1pf77r74DHvfDIYsvp+lQ6VeMO1j4Nx1MuP9cMJwseii1G9nhrXpGCtMSIlOtRumMRKVyDiNIsKHU5XOZ9xXvgpLOlafWP55VnmO2KnY/RnLLbwvoDA72B8gDpfTFTn8/mR3SEypQPAkOjCyEVebVD/hmqwbJkXUyXj5WUBbDar1xgNrT/th+SYkAKpK9g3CicvrE6KinIP5Hyodxz2ZbxWquzZvBpYGy75rXRP4RuhwUKMg4aqNXudvuIq7utTFTzeONazyDgIMd8h9wTNPeLBtfLXz5KO9ictbsNC
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SL2PR06MB3017.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(346002)(39860400002)(396003)(136003)(451199015)(6486002)(186003)(1076003)(2616005)(478600001)(38350700002)(66476007)(8676002)(36756003)(8936002)(52116002)(86362001)(41300700001)(66946007)(5660300002)(4326008)(83380400001)(6512007)(54906003)(316002)(38100700002)(2906002)(6666004)(6506007)(26005)(966005)(66556008)(47845001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wOCfVqRxqOedaXIcUkU4yAHwm+lFAueFfCIpWjPxys4t2xlascVnAjltfanN?=
 =?us-ascii?Q?SM0QRYG3y8sLZykwoEtd4HEc80LZJHAIO8si2uAOuNaOtD9sHV9m9ewNOr5L?=
 =?us-ascii?Q?4fUoqgvC0QfUVNVotD+jK6mnPxEscJdf+lVt9oGFv3F32FM1Kx9XAOUd1w7s?=
 =?us-ascii?Q?cBDCWlftJqFcW7di1kqKJ3e5lnvdw2xrnDk/qFINWbbXYIR/WyLW2oLxoDwo?=
 =?us-ascii?Q?8NI5NcEOO/lxIwWXI8g8bRBWrmNO+/VoWBrNrGk7y+Xa/fChpqVINa+RYgtV?=
 =?us-ascii?Q?7msx+UUeXXOTNAyS7n4fpwEBxdAAFoXLJX/IOZ9lse++H8JdaHrcprFY2jQt?=
 =?us-ascii?Q?9HioHCQB2NRKGISz/O+xYu0THSnjvXpn7FHN1iMF7BQYgorwGVOPcmihP/BA?=
 =?us-ascii?Q?ifq96oW43yc37Lq2Kbf3I6lFqe9OhQ5nJvuZjDpykZQbrg9yFSaiDPi2jxhl?=
 =?us-ascii?Q?Acbf3ROG9ZF2XjAN0O4w5zV2f55aQWAH0z2qnWDBkKTjn1tVjzlCc7F2+y2G?=
 =?us-ascii?Q?eGkyZW9YWxSJmLi4JnWqa1k6Qo74KQIx7YnRPNJk2A2ShBeq5kCKyhcZyZnp?=
 =?us-ascii?Q?vL43NXnXagFoFPK3tk2TypdKGVj+VLRhVoPa7lQz9Jr7/VfKy33ofvubYDCJ?=
 =?us-ascii?Q?u/Jjh8eYi2QZhJ7LF5RrdCJBN+k3OI4ekcM7WocGbjyxdjh52ldKm4lVK7J+?=
 =?us-ascii?Q?PSKXq5a7q5BqgRLM4Y1LO5idlK11pLewTA2dpKNYQA0hSCQnQBRw2PfRQTx2?=
 =?us-ascii?Q?LjUerqr5tPOmfEpidWHnXWZ5vnnp47nN88QUucEYLohiT9E+nIyxPTJEvRvG?=
 =?us-ascii?Q?0uTHW4FoqGkXhvjrLHioIlN3NQB+JEUJqIpzQyGl27tqRIqzIYySFBuBeKlK?=
 =?us-ascii?Q?jPJgItH0zNMICiz4W2epNPAvDIDd9vR4Wd7sv6WtTl6SB7Wt0PMdVehsQ4AQ?=
 =?us-ascii?Q?Y/+e+8tuzqtAsO0E5QYfl/VdJwdgaow/C9jCOco8PR3f+ge77N22CXvhlrM6?=
 =?us-ascii?Q?/eDaOBQHqqKCIYqM9JDH/pkmvDBt3WzHLG11N+uY8zSDeauOycBEu50uWAoA?=
 =?us-ascii?Q?6XqnSgZalYnSfNrf7okYJpK2MFKUAnUG3QhxSuFWDW6PXHMDdZsl0BFnytjp?=
 =?us-ascii?Q?ZBRNoVOZjnXLRJZGVoIdV+peMkwueMs1g7nHxF7++tNNWqe82VxzpKKsuFOY?=
 =?us-ascii?Q?unnBjkMJNHY5fiuVYPu68tGOM6zzlQdQJu2+B2WsbuVFf6PcXS9/hv/Pp3Qd?=
 =?us-ascii?Q?saIaov1gARInTwQYkdQh48sofAnceyguA/k2w+t0UTdCQUYMNVwAZ2ZYqcfC?=
 =?us-ascii?Q?nT1VoFZWAiR2nGn+aYeIlDaRxI4/IYjdUTDfoAQTdyAkfqh2vB3DDnRxNG3w?=
 =?us-ascii?Q?+0RAEPBDUZxtWp0bfTgCTwEAeAzKtKt+nRVaUEc+5kgsxekWoWHWqQ+Htscr?=
 =?us-ascii?Q?NH434YeDytqnJKxVhWzwlfgBH/CNizmAeDozKYZTjA5hBsPU9lyWgNWfRMoZ?=
 =?us-ascii?Q?skdLTQB7xbFeGAmce/ZE3glpCTLHH+oHDZ6gZ4Ber7XzoL5+hYFsvxLbKxyd?=
 =?us-ascii?Q?QvMGL69v6W7wGzUZylXQjpXBRxvYfLjj0UaYPjtf?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 491590cb-be5e-4464-0b07-08da9606468d
X-MS-Exchange-CrossTenant-AuthSource: SL2PR06MB3017.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2022 04:04:52.6777 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GGH28+p5Oq7yGw7uN5mbkB6iSKWTlgwnq9nKrI8B4AKIQe/Sz044PhlZIQZYSLIHj86+9Oy3w2cmq43qjUW2Tw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3943
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Philippe De Muyter reported:
 https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u
 The warning log showed that when finding a new space for nat the journal
 space turned out to be full. This because the journal_rwsem is not locked
 before the journal space checking. The journal space [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.125 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.125 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1oYL7B-007cjr-Rq
Subject: [f2fs-dev] [PATCH 1/1] f2fs: fix to check space of current segment
 journal
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Philippe De Muyter <phdm@macq.eu>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As Philippe De Muyter reported:
https://lore.kernel.org/linux-f2fs-devel/20220913224908.GA25100@172.21.0.10/T/#u

The warning log showed that when finding a new space for nat the journal
space turned out to be full. This because the journal_rwsem is not
locked before the journal space checking. The journal space may become
full just after we check it.

Reported-by: Philippe De Muyter <phdm@macq.eu>
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/node.c    |  6 +++---
 fs/f2fs/segment.c | 10 +++++-----
 2 files changed, 8 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index e06a0c478b39..971d8b9ccdf1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2995,13 +2995,13 @@ static int __flush_nat_entry_set(struct f2fs_sb_info *sbi,
 	 * #1, flush nat entries to journal in current hot data summary block.
 	 * #2, flush nat entries to nat page.
 	 */
+	down_write(&curseg->journal_rwsem);
 	if ((cpc->reason & CP_UMOUNT) ||
 		!__has_cursum_space(journal, set->entry_cnt, NAT_JOURNAL))
 		to_journal = false;
 
-	if (to_journal) {
-		down_write(&curseg->journal_rwsem);
-	} else {
+	if (!to_journal) {
+		up_write(&curseg->journal_rwsem);
 		page = get_next_nat_page(sbi, start_nid);
 		if (IS_ERR(page))
 			return PTR_ERR(page);
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 0de21f82d7bc..d545032d2f6f 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3914,13 +3914,13 @@ int f2fs_lookup_journal_in_cursum(struct f2fs_journal *journal, int type,
 			if (le32_to_cpu(nid_in_journal(journal, i)) == val)
 				return i;
 		}
-		if (alloc && __has_cursum_space(journal, 1, NAT_JOURNAL))
+		if (alloc)
 			return update_nats_in_cursum(journal, 1);
 	} else if (type == SIT_JOURNAL) {
 		for (i = 0; i < sits_in_cursum(journal); i++)
 			if (le32_to_cpu(segno_in_journal(journal, i)) == val)
 				return i;
-		if (alloc && __has_cursum_space(journal, 1, SIT_JOURNAL))
+		if (alloc)
 			return update_sits_in_cursum(journal, 1);
 	}
 	return -1;
@@ -4085,13 +4085,13 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 						(unsigned long)MAIN_SEGS(sbi));
 		unsigned int segno = start_segno;
 
+		down_write(&curseg->journal_rwsem);
 		if (to_journal &&
 			!__has_cursum_space(journal, ses->entry_cnt, SIT_JOURNAL))
 			to_journal = false;
 
-		if (to_journal) {
-			down_write(&curseg->journal_rwsem);
-		} else {
+		if (!to_journal) {
+			up_write(&curseg->journal_rwsem);
 			page = get_next_sit_page(sbi, start_segno);
 			raw_sit = page_address(page);
 		}
-- 
2.36.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
