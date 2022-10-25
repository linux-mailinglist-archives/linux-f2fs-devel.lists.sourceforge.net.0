Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC7D760C55D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 09:35:31 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onETB-000498-38;
	Tue, 25 Oct 2022 07:35:29 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onET9-00048x-PC
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:35:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LCKW3ial4Cm1cWRAB2S2YZpocCOQmHjoDDkpQODPvYE=; b=TBkzd8wvWgziDld2FTDBmYMvQ7
 Ja2wNeGjQgmgPtWewwKcTPsniBLygjIawMneGMt4wZeTn6n+v1ra0BUSXt8Id9J2ST/QjSAb//Yrl
 XSuEEXy6ejN9KyEVHUFVuIgfiZnVAiQ+ZTOs61rhQyDBWR4C7eLeJSAhCy+GzaKm5qj4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LCKW3ial4Cm1cWRAB2S2YZpocCOQmHjoDDkpQODPvYE=; b=Q
 4/8A3e80Z6LPxdBQftUlJDNZFcG6amTDRMzsllb/OxDjlRW1LpsfWRKlHA0DLqCHISoPTRkEa+4b7
 c9b5XSuF8jjHGagSQvxP/+7UqiaQ43A9t3MLR7wFznBod57S3ErkPNd1OoVt65O7+Bi61qVn2y5at
 gPK7veMBxBVPHtnc=;
Received: from mail-tyzapc01on2133.outbound.protection.outlook.com
 ([40.107.117.133] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onET6-00GcbP-6T for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 07:35:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=A/lsyufqlrbGYepxUfv5KTdKbq88mXs4D8NtJa3D+T/It7EXubiV/jztm6sYzcV6mO16i/PbIfZjghEzfaUDAGbVOUyH8/qHF6HDsq/oXbNmUA7IIv2fqK+5n215Hx6ZE5Wfcos3VZrx8jqQmwqDV6VDdXimCYuk9TZE/BCM6HlTdGw/e0/ZZoG5FZzPMbJ/L+eawbMSoVimSnlvRwI+ASO6Yac79NM0gi82VMnjzhQ+061lsUkHFyhvI3UOMVpZLP7PvjAP1ZH9+zK9zCQ0ULkz6pWSczl0Ols0PAInhqRQ9qnIXTvBY3FSHaYFKCKs9Ch3CjxvDRIalMCqRj1IMg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LCKW3ial4Cm1cWRAB2S2YZpocCOQmHjoDDkpQODPvYE=;
 b=nsCt1jZhp+hMXsvALN63BRO0BmSujXWEAKNvBC3eiUGeT5RrDXcVRyL8pWo2p6AwB4ZZHlQ5BH98OVeukqlevwYMQwU9BdeS11WWcNd0B+WSt2j0BWwiXbGRr356JAV8Uz75b3zodI3aFm0ozGKJ7+HNjc94UntqAsNFOWNDV46sM4nukH11eL7ZMj7V2134CtdHC3nWawMEIt593rq1eBFzL8vUDfWCXa6qMOUtPQfi2pk0wf8C35EWoQG8n+AlQLwGGzfKMvNJJ3OSALxercGPGSArIhohwRMYnXocakIRTgo7XqN5xG834iev8EdqP9LBsxSaiSHd4IDrgwy4+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LCKW3ial4Cm1cWRAB2S2YZpocCOQmHjoDDkpQODPvYE=;
 b=qYJPvLWNGPq8UcCYIyAFGhSPMOU3ne/RryD/7PZD9qhvvqVT704Hwe9v7aEvXq3ECbryI+51OR9gk2hMlwntz5GwT4PLcO6VuHxtb4vLhSzSIxj+TlLI/fl5rosTH1XqqX2mr7FqYByP4hFnTZw6agJgmsLcBvFtr9lFWTQaV7SHEQVr0YHU7B+uGwuLeAn8LjHZGo4lTgymefGaHbuC1jh11bBMEk7+iqslFfCAVqLy99icsJsBL23vJoMshuT7xEeOhosO0rvOwXrSKdDlqn+Ye8iapjT+kTJfTlI4eTp/IaD60VRuuCLuyKxiJfWUnu1Sl6JzAq4BESIzUiGr+w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5236.apcprd06.prod.outlook.com (2603:1096:400:205::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 07:35:13 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 07:35:13 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 15:35:03 +0800
Message-Id: <20221025073503.43935-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI1PR02CA0020.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5236:EE_
X-MS-Office365-Filtering-Correlation-Id: d3231c5c-e787-44b3-92a5-08dab65b73da
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gkWsjBcNSubVx2QPfEI9AH3Sb59T3XAC5fzl0U1pproC/6GIxe23ImUbLxFvFPOB2rB05G9Riucm1Yn9yEQZ7iC0dccn0FZhXdylDc/3vKKbVnZdrCBwvc4hzZQyRt8sE7ItQJkUqb0BUyFuiog/MlaFrCpoQiI1vD/3pxLWU3bc96SIXCUMhm//9b4Kwo9EgVPU8cDgwY6NZ4GtB+YdkIMV/EA3FNd9fsgkKl2ETCemYRu8/rCRYnatr73KzQLErw9OOfQSBu9rRBSkexNkORRtUu7VGw2rYti2jb1RUD7nkJKvfbgijfPbr3IFSrM8ZNoJn5PHAJDcsu5gtY3oh/vvYRL6CgI//VtUPQ/UnEekEseF6fPCBKdcUFeK7lAmywzTiUKhl2tkemsSDgzFhUZUrGEHt9HT7BkSgHB8MWgMrwzzvAGp39NaORlXTgqd0u5jIfBtApaP8upyQzAkngMGyXCbQdrEfNrGAFZqDp7Z//HWjax24DHjbLzLNDsb61xCrvQpN/2zhKCQic7V4PearRXc7q2F6/sgoGbbHLTcYNG2U+BsnKvNw05uvl+Mba8Pk3/6qaVJ7NymtwEv9ngCd+3Klq1zVT3qXGLRZVQ3utRQ/MogthoLBDIGv2ZyazhSoeMT22iIxgBvlst0RCKTYFEhvjKMgOH/bmmvagkgaRKAt8A8H8B93dnqejReDB16KlSbGd8v//zsGdTa2jM8X5g6oI5Nqxe7PzkMW2fOhrSKxyppVj8bAnu9WW89Pm0gRaP2MDXCvmaKyuH3XQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(366004)(396003)(39860400002)(346002)(451199015)(52116002)(66946007)(6506007)(66476007)(2616005)(66556008)(19627235002)(6666004)(83380400001)(316002)(107886003)(36756003)(1076003)(186003)(8676002)(6486002)(4326008)(41300700001)(5660300002)(2906002)(6512007)(26005)(38100700002)(38350700002)(8936002)(86362001)(478600001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?4RoxzEqKVOFV5Y2K8SkQ/HreJhzVG1u2vhd3O6W3jbXzqPAk2kCpmKSfTHzt?=
 =?us-ascii?Q?Kr0VeYVX8PqNUF79euU5w/aCdtnflCoILlT0yh555S56QFPJiSmtXoMDTzCm?=
 =?us-ascii?Q?4gbi2aynLyXtoxkUhsbIW3el5qTWf4OErbVmdZIRG0TXNgjr8viwRP6ty3Jq?=
 =?us-ascii?Q?SV6FJYxRyZ+Mo5i6+Vt4D4rEA6baMslDipCvaGZdi06+3ogo8d+DE+j4O9dI?=
 =?us-ascii?Q?s67Az4t7CSFb7U7dAH2LWzpRKr+9lcvUqr+Hl1UcVTRLDJv32RJhHrqWGtxK?=
 =?us-ascii?Q?JuesMmc7s4DkyAaAjSS8W89tOAbHTuJi8u+24dO1t3BWrWXcuIXnenSStMVo?=
 =?us-ascii?Q?uKp+oPyx8AjnzKgH2N5lTVYwpOaTORoHdEyOQ/UBmqdzpJqHYjjz4Vw8TWtv?=
 =?us-ascii?Q?swNB8oQsuogsF1GhmZybMnMs3YE79rqqdlIirva/SwR+vwcxbGRn2eG3xk5b?=
 =?us-ascii?Q?5VA/0m3L7vs18iq02MqUfl6tcr7dfXMhN3yZfEE0Wun9GAX3IyYigp+tfDLJ?=
 =?us-ascii?Q?aPvgO2ji5lhsA7OueNeHOlSSlJq/IvAfLVRgvd5M8CO/atffbcDRjuTbO5v9?=
 =?us-ascii?Q?fnREPTUGVtMwIkQ5TJD1ucenJq1H10PXLOQgEdEd1aMH6jsk15kZDi6JD7v0?=
 =?us-ascii?Q?Pjp+CSeNgnd57aHF+RzWl/ugapEe3WJDk/HnhRqg/KQ+LR/d2WglML+4EuNR?=
 =?us-ascii?Q?K7ESo1yYEkvRPrCZMEaYcTn1wxaMrXMZ6BzQ/MRXxzJexOxA0bgbBHGxLFqy?=
 =?us-ascii?Q?kZzkP8U6Ta2qA6JT1zi58bElbPR91UmhlfoumsmD0XU82rB1JcFTZ8CZOtfp?=
 =?us-ascii?Q?P9O62OJ0FvBhqBXy5zwejIwRCLfDuJc8xk6rEYg/RhwMgJP+KQqcXns6neIU?=
 =?us-ascii?Q?Glg374UJt65npc6JWYzB5JjHXeo3iUub3CTRUTmwWQcoA9NCqfZVjRBCrxr6?=
 =?us-ascii?Q?xgnEnedHOiOgyp484h9O7jZyNtzYjFJuUTC38fGeCHv0u3j7orAA1wif71sI?=
 =?us-ascii?Q?2tSLXL2Yv58kamNOfgWiLF+yIlbHsuePfB2+YsVZ7vxUW/Hx5FfYcdc6Pqeh?=
 =?us-ascii?Q?c9v6vGm74f+/j8oE5x7VT4AEGpPIzmrZIcjdhKk3cCPeFiM4x9WXYgCe1BOK?=
 =?us-ascii?Q?/d1jVJSKm4riK2kehxslGSx00HZfNPOhxgPPDFK4r5e3j38PYwHqbvZX7fb6?=
 =?us-ascii?Q?THDXk2yNuzNCb8aVDKDLB1+2AMiKG09QclM6l2azpi8uxbIz19J56BSQIuP2?=
 =?us-ascii?Q?5B/s1XnmzjGIjnbhBh6A4eLt4G9VurRwsIz6n2/lMtBqzy6nKQtD4PG7By8h?=
 =?us-ascii?Q?k1kVMcoM/jy+V5Dftx4FxnmP5klIO7AsffMxu+SIY8grrh+cXcfJiSysgsNq?=
 =?us-ascii?Q?W+2TMdxaFxI1CYsdUNTvFaRhvNOP3moyu/6mMqroq+G4liRJM3fjQmLuqfEX?=
 =?us-ascii?Q?rPuk5DDgtD7cSNoaBVY9t8VUW4RyIh6YhLLgxh3kx39YtCittFsfz2hNJbZN?=
 =?us-ascii?Q?CnUVALO/rBN3bsGS5jRyfOXx/cEfDri/S7vBatI0SeXvK0pb1sJmq+8B7dZm?=
 =?us-ascii?Q?KlZSPMPq0SXktNAPErEtB8FK5jTV8BLixKZGH5hg?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d3231c5c-e787-44b3-92a5-08dab65b73da
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 07:35:12.9423 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xZV+m3584kpdSqJJqSeXppd0t4Y9Vxom1olsZUjDc6PIKZDTK39rMR45npGHe8R2g1ORoGPAWXaVvYr1o8DVww==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5236
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current max_ordered_discard is a fixed value, change it
 to be configurable through the sys node. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- v2: - s/order/ordered Documentation/ABI/testing/sysfs-fs-f2fs | 6 ++++++
 fs/f2fs/f2fs.h | 3 +++ fs/f2fs/segment.c | 3 ++- fs/f2fs/sysfs.c | 11 +++++++
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.133 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.133 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onET6-00GcbP-6T
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce max_ordered_discard sysfs node
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

The current max_ordered_discard is a fixed value,
change it to be configurable through the sys node.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
- s/order/ordered
 Documentation/ABI/testing/sysfs-fs-f2fs |  6 ++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/segment.c                       |  3 ++-
 fs/f2fs/sysfs.c                         | 11 +++++++++++
 4 files changed, 22 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 859c4e53a846..8faf7b1274df 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -99,6 +99,12 @@ Description:	Controls the issue rate of discard commands that consist of small
 		checkpoint is triggered, and issued during the checkpoint.
 		By default, it is disabled with 0.
 
+What:		/sys/fs/f2fs/<disk>/max_ordered_discard
+Date:		October 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls the maximum ordered discard, the unit size is one block(4KB).
+		Set it to 16 by default.
+
 What:		/sys/fs/f2fs/<disk>/max_discard_request
 Date:		December 2021
 Contact:	"Konstantin Vyshetsky" <vkon@google.com>
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2bad69cf9fd9..91c3fc5383f1 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -330,6 +330,8 @@ struct discard_entry {
 
 /* default discard granularity of inner discard thread, unit: block count */
 #define DEFAULT_DISCARD_GRANULARITY		16
+/* default maximum discard granularity of ordered discard, unit: block count */
+#define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
@@ -409,6 +411,7 @@ struct discard_cmd_control {
 	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
 	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
 	unsigned int discard_granularity;	/* discard granularity */
+	unsigned int max_ordered_discard; /* maximum discard granularity issued by lba order */
 	unsigned int undiscard_blks;		/* # of undiscard blocks */
 	unsigned int next_pos;			/* next discard position */
 	atomic_t issued_discard;		/* # of issued discard */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index acf3d3fa4363..dfa9dc3a1bc3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1448,7 +1448,7 @@ static int __issue_discard_cmd(struct f2fs_sb_info *sbi,
 		if (i + 1 < dpolicy->granularity)
 			break;
 
-		if (i < DEFAULT_DISCARD_GRANULARITY && dpolicy->ordered)
+		if (i < dcc->max_ordered_discard && dpolicy->ordered)
 			return __issue_discard_cmd_orderly(sbi, dpolicy);
 
 		pend_list = &dcc->pend_list[i];
@@ -2046,6 +2046,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 		return -ENOMEM;
 
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
+	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
 		dcc->discard_granularity = sbi->blocks_per_seg;
 	else if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SECTION)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 2b1c653b37cf..e2325d8dcbb1 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -483,6 +483,15 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "max_ordered_discard")) {
+		if (t == 0 || t > MAX_PLIST_NUM)
+			return -EINVAL;
+		if (!f2fs_block_unit_discard(sbi))
+			return -EINVAL;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "migration_granularity")) {
 		if (t == 0 || t > sbi->segs_per_sec)
 			return -EINVAL;
@@ -793,6 +802,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
 F2FS_RW_ATTR(RESERVED_BLOCKS, f2fs_sb_info, reserved_blocks, reserved_blocks);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, batched_trim_sections, trim_sections);
 F2FS_RW_ATTR(SM_INFO, f2fs_sm_info, ipu_policy, ipu_policy);
@@ -923,6 +933,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
 	ATTR_LIST(discard_granularity),
+	ATTR_LIST(max_ordered_discard),
 	ATTR_LIST(pending_discard),
 	ATTR_LIST(batched_trim_sections),
 	ATTR_LIST(ipu_policy),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
