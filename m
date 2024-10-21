Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7564F9A58E0
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 21 Oct 2024 04:32:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t2iDc-0007uv-S4;
	Mon, 21 Oct 2024 02:32:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1t2iDa-0007uo-Tw
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 02:32:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YDYKhxqjgazH2uOevqpNxewM/4Xh1F1Sf9226Kc5nOM=; b=ZM1XbgYyWOlJYlnXwX8nh2EIdr
 FDlGwaFcogByWIlDH9F97pWpeEw9oIFXS7WHgFP4+VC7vTnFi07Q9eAnhjbH3m2DsxUKIdLbU4mGq
 rfnlNP/MQADod4YeqDSulCiQqzpVRL+8q+S3JnBEOit+sfyW26VSLEJCzBYqfCaGUNjw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YDYKhxqjgazH2uOevqpNxewM/4Xh1F1Sf9226Kc5nOM=; b=m
 kYvQ8nageEbwtonu8ZcLiJuCZb7grJUkbpd7sarc6cJOm+2IOZtSv5tJTB/J1ko7EPpjt7hPgJ6A+
 sxdsmmRDWcoEw1QbR1U0xEoTg6c5btiBp49M7RH3MjcLqP72vuWNylZC3rMZfJJ96jcXtyC5JpEwp
 wZdPSm9RgWOR/UcQ=;
Received: from mail-koreacentralazon11013008.outbound.protection.outlook.com
 ([40.107.44.8] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t2iDa-0007oU-Qj for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 21 Oct 2024 02:32:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O2Me922V1xsv6naNoC40JK6Gi4wVUUWdIKk/af1jMmcZkL3FcdYWAlU47gCqIF+5x9KlxNXl5yHxgR0g+b/Z3QttXJuIZDLkBOZ82Kyw788SZIeXuyF7IzRSuEnVQjXK18FNYCTILx/0hvp45fFJNvDfdyyrQWZ7zzj7oKIOXGEzBFw0ZuWcdcMQAJwK753qbxNSmFGkRpp9eVYtD7bshtYeMmNOOshrejiaqUOmD13R1AKj8yBv6GIt1Bv4AgjJuEZYuoIfsxlMlWA4UDGp0NLxw0tEMNIhnrB5Ba2FGiD8405jj6rzyg/Jmf15UHY95yh31P23D9r7SdAOFbBnyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YDYKhxqjgazH2uOevqpNxewM/4Xh1F1Sf9226Kc5nOM=;
 b=zWJKaDMsdaxW2T7QoSyuhYM/7oObE6Tbwc0dmVSAiadhqC9L5Ri+XCopg1QDF4whAEbLbe66s+ihu07TYRf0U2OSbHZ57PD4wZu2eJS5wrAnOwydt4i75MsBpfeXw3bUorI0ZVQ76HfI2zziQim0OBmb21GBgUJ1Dru9gHCT61B29Fp55f+Yvtj3nl4vAwLXt3C3+VcaebEw0ivsyVIK5/h1f21xwUUVfmwR+MX5kcU83NIc+EweU6XDjcGnqSBVeN7lJQs4LeM5X3pWI35NHYDc0CTMZdpl6xEdJwFDaS9O4rliHpa01zVgiL/KpPAg4F4Qpwgunrvg9hW34BWTkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YDYKhxqjgazH2uOevqpNxewM/4Xh1F1Sf9226Kc5nOM=;
 b=RowQQd7RhTxqgswbM7awxFTR1je/AYnsbJ932asaI/l4ZDdJMtvS9UjmKXPYRv3hwiqSSFKgd26QsaUEIMLskUGvfoHWBdDivt2T+EB8kbcpxQ6Rz1WZa+aGQtruRyK/Hq18II80EB1rjzMGMxtJFYstsNg8PcYvD7A9/E9wjx0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by TYZPR02MB5691.apcprd02.prod.outlook.com (2603:1096:400:1c1::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.26; Mon, 21 Oct
 2024 02:32:18 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8069.027; Mon, 21 Oct 2024
 02:32:18 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 21 Oct 2024 10:31:47 +0800
Message-Id: <20241021023147.1774412-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR06CA0212.apcprd06.prod.outlook.com
 (2603:1096:4:68::20) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|TYZPR02MB5691:EE_
X-MS-Office365-Filtering-Correlation-Id: 9e89cc54-411b-416f-eae8-08dcf17894fc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c5zGQSuF77qvT1baCtafphM29OEvAvcLU6slfIhBplwMLQ1AVV65+r3elQCE?=
 =?us-ascii?Q?LW7lyhjrEjz2ttxKuQe/ihgtTnViENXdhpMiX7jD+XC98W9Y9kMl/qY+4vcv?=
 =?us-ascii?Q?HrWafJ+4r8abHphHA0oTNZSobElBsxdtbU0Ysj7KOPWGVrViGpHaZ6LTIz+P?=
 =?us-ascii?Q?ILx9kQ6jOjJ0ww3RXaGQ2YeXdDqCkVtQO0jM4aVmsYKfb6zWv7DJtEv+Yyrt?=
 =?us-ascii?Q?nly8OkS8Fd4pbS6tmdc3qpEaU+H3BHCR4N46fIQXNkfTT9QYNZue8Om1Q1+4?=
 =?us-ascii?Q?iIYiCDyTuoPTBC9aFs+3/yBApMZSJNoSmYWG9cXcm4i2xWFg+XfwMYl7WB95?=
 =?us-ascii?Q?6M8jX/nqBb/ZkQ6oHIa6E1Hkvj3YZcgWrv1oqUR3QmR56GhhI57z9Atf6UAd?=
 =?us-ascii?Q?yMw4i0fajh23eNx79jXsyuulq30HanBpvn+gZH41xK1Qvr6xsNeDEJVuJrOx?=
 =?us-ascii?Q?87dvwEhR7aEpXXjMZO5BRSh6QPpYHL8iI2ddRliUK8LVCL3ORklu92yQBz+0?=
 =?us-ascii?Q?7G31mdJeP3xyIp1MR7Z4x4qugFKDgGf88A5XDWwKVe8NWs8Ak8ltEcfPp5+A?=
 =?us-ascii?Q?Ri3q6WuVhtKWJ3nzCtVQpsnwB4MWtM8MD4piDsGUfu3vREL91EPtQ414LnIT?=
 =?us-ascii?Q?dfUMx1mOJymEakgygAnLLKjrAMl6+amxmBH4OXneL3bK385YfpFIIysZnkEf?=
 =?us-ascii?Q?g7LitWSWbj/43jLCgPnpxxa/uY9cxS2mM3d+KLB0kONKC1NoC93AdofCveOq?=
 =?us-ascii?Q?ZrO4A9RW/GeXvLG3qHoMIYtze7wyLiJEHzxbjVHqhjHyVF6HD7ijPv/whIIm?=
 =?us-ascii?Q?BIqXMO4h8ZU1xarH8fK7OF/MmixrwwsJjanaCRVUdfOTgH2qJWfqfZWBau12?=
 =?us-ascii?Q?2SePDFqj+YDzl/7CoOGxDW7F06kWv9UxhWumfKF+adEw7+D/BnoP8+O1dDC3?=
 =?us-ascii?Q?JfdPy7V4VWgBv1iEGEevU3yr+MYUZDmRob2ykOr+CUJYlM9i4mmVxQFAcKp+?=
 =?us-ascii?Q?V6vFXUKF8jwRtk1qL6CPQdK7tAOniM4auupGw3K41orT0NWpw8Vx0QLCcjvu?=
 =?us-ascii?Q?exfK/IJSvZHP57oyRjyDWeQcaNJ2dqwFZYZm6jdfvsxZRwOCMEbhywA6JbcE?=
 =?us-ascii?Q?jc9ZkclEufNnvZ4qNww7vKMn6pcDI14WqyMHIbfF3//8ApyCtABRbFOHctbe?=
 =?us-ascii?Q?4eFYPPrqVtXIq1Ypkrq8uuWItDMrnsMvBaGn4bL7GZchwGKBhz9mANvYP1MB?=
 =?us-ascii?Q?x2sp+jTssD3lqxOX/9lauGKmLNrlTS+KT0/OnmYFt1rjJKhNqKtByyuTWAvZ?=
 =?us-ascii?Q?gVLp80gif5/Ib5UIkxGN+WrLQCzHtT9j5VnmDrArqOL3xBvGePOpmHOXtM4t?=
 =?us-ascii?Q?eqCESPo=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0L3BfgKvB2ocNEc0f5A5rK4GJy2fNXifVzwgBej3FUR/dYr/xmcqpaHaX777?=
 =?us-ascii?Q?0y5JcNNSvVPh947RI1FcVUj8dU8OY37p73442AWJ0dJnnKfxS63WAEHlnKHi?=
 =?us-ascii?Q?Ql+MeEdSs8e7NZcnPBL0i/Bgz/uD88LaiSdPOaGwzzhcW6e3O7bAOBdUAkPS?=
 =?us-ascii?Q?9gJkjTXus8As94CXQGbcjELXoHKWryA/PG2Lkf3cy53nXc2EdvzkIaOncD7D?=
 =?us-ascii?Q?9/8JzNd4mBPYaZzVjzYk6gGWyptpfUFo/eyv/Ai6KOSxPMvyNPwgkn5ghZOX?=
 =?us-ascii?Q?RjtzLnkiFQcRJZjFL1KmHrDHAY4lE67MNteFPPUUnudo0xqOL5X3O6RnBxJH?=
 =?us-ascii?Q?18kUtvqxr3SVJVAANeBNfk6QXVLweYtEWrVtdj5M5zGparY6e77K3DhQyI6q?=
 =?us-ascii?Q?5/AHEDVEFiDpb7NbZHQcq9OCg2LAWFqfg7u+7B+xjCx5VSd8AOCX637lJrrs?=
 =?us-ascii?Q?en9NvbgW+w/qjB4hBCBgFyhLcS0ckQ3RUem3n7BuBMBHBLwwGzc9KXCI62W7?=
 =?us-ascii?Q?dyqHMVB098ZXX2oS1KEQPjYLvRQJ9VPU8JA/zNZS+I2A71WLle3N0Y8qi8as?=
 =?us-ascii?Q?UlQ8+1viM83CtZWQG/CaIZfC3mI9Lc46rIMVo42HUgd/g495qLCLnznqYM9P?=
 =?us-ascii?Q?a/K26ZZZhHWdzjFHBe4ZdQxzZyfDf2e7FmwGx9j2pG5V+3x9Ta5WL2NIMcyB?=
 =?us-ascii?Q?iujcbV4CmxBlBFyaudAz3Ax6hE6LH9prELfmqL7nWpPcL5H54Y5Ii7ywMT+D?=
 =?us-ascii?Q?f5NAL5qzNjQBMrqaZhUPXieGalXkpNuvW2iZscpodCML3+nmk8hSlh0G20m1?=
 =?us-ascii?Q?OcwmFla0h+BeNOFCR/At7v7IZ8aRaytxoTSJzB1zKudotgQqiR0j5Un3rMNr?=
 =?us-ascii?Q?3MawCfDMXDLnuyXntMg09YQnmMlzgoxf8ZmU1jXTPCe9SMRHdySVYWztnc4s?=
 =?us-ascii?Q?k9C4uF2iqJ7o+aTBC4e0AyMlS1aX9iS+k/0kLInZdyLR8J4SZBmbbmgjdZox?=
 =?us-ascii?Q?ve+LnCCBQFLeoHc4RzeEqC4MY0rpRWPHwOVfpmmZlpikeOgLZ9z+H00w65pE?=
 =?us-ascii?Q?EtApHezSAAgq3lRlah3BsMEDqx3s9PILGz2Nv5DjfqQP/+ygYwXEZA2lLGJt?=
 =?us-ascii?Q?Rg/hiQ9HW6y8hsQuF7/1bw0kT5Of147nyHyLmwWmqia64qtp6th4SbXC7Pnx?=
 =?us-ascii?Q?rIiXvPHtmP9SJclZCpcb0++gNFS6kHC/R9ZjrEuo+klbLvPxSOqHtyjRlg8e?=
 =?us-ascii?Q?txGIlIv8e6erqu+In6SRKaFCJ4oiK/go6KA3AbGHnfQ2d6jOXuyxW1VxqTzn?=
 =?us-ascii?Q?ZzFY4GGsl8RCjGFDEIdF/vYlzLPN+x/gzOKDB44dZWa1GESAku1XaUPf1Mlg?=
 =?us-ascii?Q?JmTHg7rLBSuH33G5IjEZw9pre06vKnGQL9lxLmjX1ANiu2lM7Jt7ZZiwqB3z?=
 =?us-ascii?Q?saLi/w6sjBBsHsO05DLsax7WvpaMIrs7VhiaFUK5qzQucgUoB0aZPKNyZ9WT?=
 =?us-ascii?Q?DzX1/amCaiPKD1CiTI9cEfsadSULQ34e93ein3tWd7jGA8+7uQmYv+3fWH0o?=
 =?us-ascii?Q?zo4zXCJzhAN60TSIHO844bG6VS3msuXoXieBijtFU6yVWd+w8L+Y4DKsb5hj?=
 =?us-ascii?Q?zA=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9e89cc54-411b-416f-eae8-08dcf17894fc
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2024 02:32:18.0582 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eQMrwBdk5ubLWSS+VZrarpCvlgBqTj/cnUqfD7lJJYE/B5KRmZoFPSm/V7gquNu2RxE74SYD33A0b9FSqDBA9A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB5691
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This f2fs_bug_on was introduced by commit 2c1905042c8c
 ("f2fs:
 check segment type in __f2fs_replace_block") when there were only 6 curseg
 types. After commit d0b9e42ab615 ("f2fs: introduce inmem curse [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.8 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t2iDa-0007oU-Qj
Subject: [f2fs-dev] [PATCH v2] f2fs: fix the wrong f2fs_bug_on condition in
 f2fs_do_replace_block
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This f2fs_bug_on was introduced by commit 2c1905042c8c ("f2fs: check
segment type in __f2fs_replace_block") when there were only 6 curseg types.
After commit d0b9e42ab615 ("f2fs: introduce inmem curseg") was introduced,
the condition should be changed to checking curseg->seg_type.

Fixes: d0b9e42ab615 ("f2fs: introduce inmem curseg")
Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 fs/f2fs/segment.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 1766254279d2..7b54b1851d34 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -3977,8 +3977,8 @@ void f2fs_do_replace_block(struct f2fs_sb_info *sbi, struct f2fs_summary *sum,
 		}
 	}
 
-	f2fs_bug_on(sbi, !IS_DATASEG(type));
 	curseg = CURSEG_I(sbi, type);
+	f2fs_bug_on(sbi, !IS_DATASEG(curseg->seg_type));
 
 	mutex_lock(&curseg->curseg_mutex);
 	down_write(&sit_i->sentry_lock);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
