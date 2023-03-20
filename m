Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BEE366C1E02
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 18:32:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1peJMb-0001Bs-AP;
	Mon, 20 Mar 2023 17:32:06 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1peJMZ-0001Bl-W3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 17:32:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7LVaPTCfjPYI1OJzN1Mri4Fv4VfkAhKNfWqasn0hEaI=; b=nETwHQbRK5G5/tJC7xawdJo/kh
 69lGN3U8ntqpto1Errk2ntgLh692pAi8/7m+XDTTAX9Njig3lRR82Du+nGFieJqql3zBF6ehDiV1X
 +Hs58yIDst3vN9DUfd99K9s/ppolO5XwgXXUO3eGz6E1H1b2RRjr/A5ZVGvPg292Bmys=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=7LVaPTCfjPYI1OJzN1Mri4Fv4VfkAhKNfWqasn0hEaI=; b=T
 xpUsNO++ssqFvwJdlSMftofVGfh2aveRIoN06b+NtXK898n6iaVWZD8boHLz0cP4dfiDizNfZfV6E
 7vcAlwTiarsclauc60flWiy0MLWhYxNLhGiLQNQcXE9unpefxVroaWQn2szvsE+WBdA/LfPQEpmSY
 TtEBFQ3CQzTr0yz4=;
Received: from mail-sgaapc01on2133.outbound.protection.outlook.com
 ([40.107.215.133] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1peJMX-0008NT-9e for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 17:32:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K8IWWxCLdzKPFhlRMSsRylXwbDCSgqnpC9aHBBZmI9UZevnH35+RNWiP23xt11hA5vvhenB1BTCG9ohyaq06IJlyxik3ScELGfoA5Bj3PGeOZENfLxPOysMU2Q9O7rt4C4VMpvPS+oU1pM0GZTIiZIWu6zNDA/4pTdEvUcH3cKG1/6jYXQFZpoZ37URpr1di7vDbBLEVsSu8ifEstIZB1Ao3lmQmYTE/g1wcvOs5Yy25mejXGuM39aFI6MA3oQrT/jWYYfAuQlQ6EiKE9SM7O+aH8bPhDXtlpYiqPFA8eV3V7O+0voKMMhl8G/Ng3G8mnm5c2UEBjOYYyxjqGj9BQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7LVaPTCfjPYI1OJzN1Mri4Fv4VfkAhKNfWqasn0hEaI=;
 b=LSGA1jQXZCZTVGHwTcAYqPTm5UUHTIWCP9+gPDZ83e6GM1OpReBEPWl46BhHn1BrXPaKsZNf9oM4sWB4EgSNV4rzQul2KO0vngri4sI4NipfswvcEGm1BvDtnJvJrEK5yxAYC+57vfDKr76tB+KebEqNiB2N7pG8CNVSe+7T/tZkhIzF6UU4+JATNuv8Pw3HNXZEHAI6+F4ECCR3OKJcuulEKqix7u36gGzYae6Xn+tS/8IHxl2het9yLRjcpEvb5TpfkRAQziEfnoXVmBbNasBCFai7li8ne8o97CSfgG28MHgJOVDXQ3ZRUw1/rzBY3uLQr8gyZ53cHTunbYMbqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7LVaPTCfjPYI1OJzN1Mri4Fv4VfkAhKNfWqasn0hEaI=;
 b=N0Mbdvg/Mb6REp//EARyZtq+1oNJievJO0ZXBV8l3Vnrzf2Y7N806tayMNCz3vQQRvgTCbn2EaQSC7i7tDKlSTop2hKa/GbJfY5Kgm1A/RJUgsGlNwjMhJpViYh77krO6Z30kC9+ovOm3y1EZqKKV0VHopBQPL1QAMxHQgzZzaxNUMcOvruSxLIWWK6ZbsuntLk99jd5n5uuiizfDoTg8GLFD2kDISXzy9fHCt/sAFJPqbhKXVJmIAiIsSMM4+6VdKCnBd37+j+cNJYG7a/4WE0esklwtc1nbf7+s4Gu1CqJ3g9SoJcLpzk7SNQQbcvzonPzYhSKT9hMpGCn+RDYQg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB5385.apcprd06.prod.outlook.com (2603:1096:4:1ec::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 17:31:49 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 17:31:49 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 21 Mar 2023 01:31:36 +0800
Message-Id: <20230320173137.64413-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGBP274CA0004.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::16)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB5385:EE_
X-MS-Office365-Filtering-Correlation-Id: ccc44a12-3dc5-4993-77ac-08db2968fc5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: zKNNAoSo9REsFKKUVNepxg+Qq00lfNH2bzih5Qyf0/Ngl1ix6UGDUeg2rrktCTK/OoeGAF0hDrofa9vUc7F7uk5zFy9LhpE7cwMcBmgiM53IHYVWwVUSiJlYM61W959o2gXIPCqyxtoilmOwAja/ZvS4Lspnn2twVS5xjWknXEOikzSOqOVk1oF/7/XASW6Yqn+aZpivFKtwOfzNDQpBeAK0f+Mpj2SvswDC3I7JHIe/BDKvulQAo4KJhgpnjuCeb7JH3JAY7DwIjwUhHanlEZRs264kfY4niTP51xwKpPXox8Tl23VTAfX3Ba/0U3EXhqn77dyDrEZIPMFxBaUusKh8Wjg8NoMHjRmUbahzu3pqm+T9WrbxgVPPrboHME87GmNUQ+8yPNtkXsxKW3fYOUxSUOVN9mpMEWtZq6FZd+1gh2rGXeYkIBbW+Vk3MYnCGpjMFovrizG8iiaoUP6Fn3wx5fz+75PvKUY+EYpnfk8drjDOv950oRKlICXfF/c1mFRlU2RBZ3BO03WDMQ+Mk6qT6mgOJaDyk7oi8nnpMyWCXRp25P/l9pxRStAjjK+/V5SLbadbzvRLQZ1Jt+qLmmF+bNCBXlWKXUJVw1BUY8TRHpMK5C4Z8uTGAOjScrcODdDwpf6wx1EEbFJEDG7WgdPyWpfiLaj1lZGH5aL2AMnRXDJm3OZ5u4iLb7CxU9RzRBuV9RsKJ5htR+HUudTaHA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(39860400002)(346002)(136003)(396003)(366004)(451199018)(2616005)(41300700001)(52116002)(186003)(6486002)(4326008)(6666004)(83380400001)(478600001)(316002)(110136005)(8676002)(66476007)(66556008)(66946007)(6506007)(1076003)(6512007)(26005)(8936002)(4744005)(5660300002)(38100700002)(38350700002)(2906002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Po13rdLamcn8tcExQtIpZm32zlnbAG2wUrKycQRNmpYdkHNpvn/Qt7v5exUL?=
 =?us-ascii?Q?iLyuDXunEc/mrK3RaXuB6MVSzCHjNVWPKZSawm3+keJ35MPrjdmM+VrxERWG?=
 =?us-ascii?Q?fYr6dNUDMKcxXzqpOjnpwpnCaC5HICoi+/dz/LsI17fJkSQ1cmp3+1JCeYZc?=
 =?us-ascii?Q?9zMXt/CRsxuEiUo+EmLWk9PjyldNUuXyyNwWB72a3Jj0EGVZ6+o+Zpl1/3J8?=
 =?us-ascii?Q?uG0W/A4W++VhIdBAD4q4uAF196oyTsTza5iOIUq69a8iXVaDlEEAJqbIDPAe?=
 =?us-ascii?Q?HDtos8aln1jd/26HuPtdukNMLlNeuTBngmXwIpnKDUEiS3WVjR/W12SS9w9q?=
 =?us-ascii?Q?hglAfHc6mrQJ5HA/Z4kDMJ3xRui5yZoblZ33B9gc3t2UM9jysJQLazH8riAC?=
 =?us-ascii?Q?Oo97A52/coaCBXftz2E98ttUBSsoKQbIrZ60Uiid+0cNgMax89QB4bIY4GNk?=
 =?us-ascii?Q?w6uYNMH48sBY0Fsb+df5xbbynWr37hqH/36QLTVKvsV5wb9BMt14lK2bE/+p?=
 =?us-ascii?Q?2993jLtdwoK5XZgtoQWffmtkfSGKZUgtbXVf3fu9ry6OTdsli80rqGAaLTA+?=
 =?us-ascii?Q?I8FKG1VK7jzpkwhsXJcuRvrLD/lSXp4wz6BwFaTAzPxwp7DoMuQnwu4193uS?=
 =?us-ascii?Q?Hc7HZU7xMhV0Ghy3lNqiS7z0jd22PXpsp5RdRaicst9KiYx43O2d9dwW6fV8?=
 =?us-ascii?Q?nJFqP5pzoDgAlOLyHwLLMI22mkcV75jvzyMIz+IMH8wzFZ8fxNo9UU7Eijqs?=
 =?us-ascii?Q?zr38L9yfNtg9TjBK7ZX7OHpuGVPyEGxHsjRWbYKz4+Z9fAQVfKJtX6OzGOcV?=
 =?us-ascii?Q?aw1LsmaChGFq6/e0lVfz4X6L1Cbi4+k5re3v10isL6WCH7gUQOFI54NJMClI?=
 =?us-ascii?Q?3dqahRP5jCbXt7IdLMrlC6DCQYP6vu/cpekaC4eaHuj0CRLG9gq4sMCdc+Yi?=
 =?us-ascii?Q?lJW6hn92y/NOjbOWORtYhfL0BYqpKZcdjdgMpmzpBCSbcOySGp/rV00KM3EC?=
 =?us-ascii?Q?cBfrH98w55rc7agtG6RrsOFCnpAoQr3pBjSR/6I4DVN/kZZxwcfchbY1oRL4?=
 =?us-ascii?Q?Ww0brKm59CM/OS3ve7ilY6o1mkfIRW0MCMAI+b5bIXiB0KyLbvDRT4WyXX4Y?=
 =?us-ascii?Q?Zw9x91B+6F0YccFqKVgbcjujnMq3PeWfARaziH74m6kgRuYnQ1B2MN+89sQ5?=
 =?us-ascii?Q?RNKrU0o9rp8Aien3vUnTBjgpox9XF9V429SbFt76Nv1NBX+3CdwkNyKaMnvr?=
 =?us-ascii?Q?iZMgOytWxGPY+gOXMEqpfzBSbz5g5/dlDaFA+7fMgzduxOM9YhAGjWgGfpUz?=
 =?us-ascii?Q?C79q40aTlEpcgBJwmVU9L2ES8Wi2vboy2rIeynCoHLQ+dKDjD7GT7d/48nZA?=
 =?us-ascii?Q?OcOyDu7HMGtYWpkPPzsiqlRN3VGKsNBc85VQDEWn60bIW937cA2aO9lBXhcu?=
 =?us-ascii?Q?8cM3/v3FUC7cfMKtvETwsTa8lCpbG+JNSmtT7xFMQTwLLRpi1dU0nFebECWY?=
 =?us-ascii?Q?yTTomA5NWADG9nNCvGsXh3YNM2wtJjLOk7o9qwBR13hO9/JFB8ikvNHq2bJ+?=
 =?us-ascii?Q?1oM6vWaro/rF0rB9Q1CNzexGoNJCb6p3QznVxJlc?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ccc44a12-3dc5-4993-77ac-08db2968fc5d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 17:31:49.2265 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJTHQnjj56/gCg8tWwEwLfPMgWaDv8yf87WxG2yl9f6Mllicu09OgwcrRnm/1xNktfziv9yLcFo3n8WnmbNwAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB5385
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Christoph Hellwig point out: Please avoid the else by
 doing
 the goto in the branch. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/data.c | 7 ++----- 1 file changed, 2 insertions(+), 5 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.133 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.133 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1peJMX-0008NT-9e
Subject: [f2fs-dev] [PATCH] f2fs: remove else in f2fs_write_cache_pages()
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

As Christoph Hellwig point out:

	Please avoid the else by doing the goto in the branch.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/data.c | 7 ++-----
 1 file changed, 2 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bf51e6e4eb64..fa931fb768e7 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3123,12 +3123,9 @@ static int f2fs_write_cache_pages(struct address_space *mapping,
 			}
 
 			if (folio_test_writeback(folio)) {
-				if (wbc->sync_mode != WB_SYNC_NONE)
-					f2fs_wait_on_page_writeback(
-							&folio->page,
-							DATA, true, true);
-				else
+				if (wbc->sync_mode == WB_SYNC_NONE)
 					goto continue_unlock;
+				f2fs_wait_on_page_writeback(&folio->page, DATA, true, true);
 			}
 
 			if (!folio_clear_dirty_for_io(folio))
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
