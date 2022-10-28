Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 31AA6611253
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 15:07:57 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooP5T-0004Rf-37;
	Fri, 28 Oct 2022 13:07:51 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ooP5K-0004Ly-AV
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 13:07:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Z30fCu+gkZutfLemycgrch/uaJtL/rxBmqIOx/bW5Io=; b=SBKbG2IEjcIDbNk47+DE9ztYhA
 GdGcnw8RjMwMBpIzVQ8SJ2qTpvzr6BP0QRBrxaOz3opFAIcuJYN1JzNpeKllZodJYsJoX/LegAbse
 7QNOqrddfAB+UfrTljLJTS1tVFdbcGlqMkzlyPtgWrnrBo6p9nMDYEMym79+BvY0z3nw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Z30fCu+gkZutfLemycgrch/uaJtL/rxBmqIOx/bW5Io=; b=J
 /bmixC470e94WxYNZYEjBVXGqJMysYN5JllEHKgxC1/Lc3Pdjasn0micEwuvJzG2pxuGsLjXhYJ9m
 K/o+iJmU3kQmnu3a8v30nrVmnpHeL3s8/Nthvbpkbw0QjuF9dROlVlm5jr4pdYfZKxrUp/2pIyQSw
 kqIChVAXytug3YQY=;
Received: from mail-psaapc01on2125.outbound.protection.outlook.com
 ([40.107.255.125] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooP5F-0003ko-4Q for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 13:07:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=FX3rP8eIe1Wm1qd+kEYVB3HGo6GGnmA1H2h+s/S49Nz/ugLCUyquS9GDtwkvzPJteYvkqz00nGhe9EriNBw7aNwHfjEAhcVHY1HBOozXmDL9IMgwF009+SVfeMsmIvqoeLQG/7Evx6MTFCLXHqbI5Ga2jCyzwNFZPjH2qDrbYNbYEmXECMpoej9ZKGxVmb9AiRNrgzz1IbgO+sCJduaCAWJFQEI0rq+YUZ1LQQfzlptaKLvSYPppLH7Z5C4+SGux4IzWJ0PGm6VlucBaDufObqkKCMexFSrptFOS66EgNzMhE6Xa7frzGWumZJk/SW/zh76DZCOV5rV3wPPOoow3ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z30fCu+gkZutfLemycgrch/uaJtL/rxBmqIOx/bW5Io=;
 b=OmmQATqnDnBkaX//7IKNnmhP4fhpC8Jhs61xTClQ449gCCXZB43aeuEUGt/Zlu3gWcOccYgXePaEur2fAls3sY7NL/4IOt9Zb4YPAvTDJ/A+p5VEymvT/O73hRjkvBQyXOpTQR28i+QVc9I9boFqM1RZK1gy5zScurkDhdT1RKpP1ZoAKunq3dJEOlYpA3/D8JnXPCMxW3MtQAisTgfVq5YlR0zw5DVK2m1X9qZPaprUGJSB8LlmxgrpEnBep98IFquuy6sLgKdOAnYdZhmnTiF2Ao1F2IWcn3vN3SalhKc7oOFRrZDzhJIjsD1z8TbF+wjmNJOGoqqopJfu36/34g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z30fCu+gkZutfLemycgrch/uaJtL/rxBmqIOx/bW5Io=;
 b=Rcn4jsISrQXKDywgmK58yCXIppgls7tF9lIcE6xwfw3xmNsuCyp3+8nsA+QaHv3KLAp8HW8yPMhMC921V5GiJTnVkx8fFK0AU1HU9EO24T44uhQIqGMFKFUIG3vWfYpkfd7xQV2eFLu2/M7LRWVKStUJ5/vdHDZtcScvLFZz0fcwMWdx8uO3g6CMLoOn1BiUuhnR2Ja4KnuwWVK3/hVuoA0NTNFKSi3Op/NkOv5cxJOD+9KJ52E68xkeBnJkzmmaCQBHin8+qe6nUiCDhoPraH4ndek3ib+PEJu01+y2WGieupRe3KaoCBI7TOmRiawPiaxTHVvKZOhC5xbzqsfw7Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4146.apcprd06.prod.outlook.com (2603:1096:820:29::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Fri, 28 Oct
 2022 13:07:26 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 13:07:25 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 28 Oct 2022 21:07:16 +0800
Message-Id: <20221028130716.80850-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGXP274CA0019.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b8::31)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4146:EE_
X-MS-Office365-Filtering-Correlation-Id: 151e8d69-3c7c-4bdf-b024-08dab8e55bd1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: C1O60snBvtKtwYDV7YFRSfU0WhcgoHcNwET/LGGmGBMTz0GcLv/lfTti0u4XububX0wS8sF6Ndi7T46iDs+y97U5AjodpN74pBwQk/RoJIyneb5yHwRqk8jYVXg4QEKd8LsuyWeKCr+CB0cKxwaksYbV3CSCBaHBmJJJhQlXhJm3LYVN/O/9sH/nB7ia0XYQDQQB596uknpdoEKR014PRGqY930zT+TSM2sWnXD02ouOhREYben2VweTU8s+CTHtGObaXMXwWQwhUUuxgkzzcZW1cybkhNYD/NkW3bzyMnuPYQ4ZcH9p5hLtS87dl7GL5FmERfACGJy9TQ+MlJnkw6BU/8A+PMv/lWWArB0LxO97SnA4UAqi4sNNKedQZDQuEP0ZWvsWQv99YD/1bCWUdv5euunV0t5aOJ34VitLqepdJA3+KUeIZDx/KgFMNJv4CVPGFe5f3F6aK/PRvy6b9k9FJ4pcjX7uS7V5wz72iSbrE6E95+OBy8Db85MP1iFAfiM6AQ0XU5fLn9ZqjUmbRMDpM239sQjCxt/+ihRIZLNy75eIIjzCuUlCPYVllx0fC/JsJIwLkJsBmMWqj5IRxVOTHg5nxkhmgHI86Ipy3RnoQBYeZafEcrMO3h5Wkr6fGMN1I28W5b5Dl3yUiEhq5vE25iW2OZCphhIFbrLlF0vnVOShpd5xk2OrJ4AiWA0QZWVFrVNCnGKdNaf+pZRnhI3Aa0J4EHbbsACn4Fzos3emKHdVJexSNNNnghI+u/xJkNSflG0/ouLcohh2iOP9Qg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(396003)(346002)(376002)(366004)(39860400002)(451199015)(66556008)(66476007)(66946007)(8676002)(4326008)(41300700001)(83380400001)(5660300002)(8936002)(6486002)(478600001)(316002)(36756003)(19627235002)(2906002)(1076003)(186003)(2616005)(38100700002)(6506007)(107886003)(38350700002)(86362001)(6666004)(6512007)(52116002)(26005);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Teo/9B0ykBZy5IHmOFclVzP6u1bdO9RvK1Ejgq+gTvuQdYXW9MoOiJ2He0zq?=
 =?us-ascii?Q?ETtdTZBA03dcgiC+uKXagjSMxJRIdaPm/IpYYd1H0GB1rr9ZxQQSxBOLpo+Y?=
 =?us-ascii?Q?epcNVpEZ+j+i7tkTtPFrrdtr/l4AcoohNA0LMsWXdtaLYRa408UHhaOl+lFy?=
 =?us-ascii?Q?hkFacnTL8Deek/CsHIfEfDolJzxL8qc0XYM/Tj11lNSg7Fv2wVu349c3+Ml3?=
 =?us-ascii?Q?tepx3YTejaCZYXb9YVZjyKIxUUDANmhS6/o0fxitXAEcaBJTZ2JNvTvOzRk/?=
 =?us-ascii?Q?5CchIJLsLlL/l7gY9HfibM+hk1m8/Kh9L9I/31/AdoOhJKBOrPl5Eb0zgnSG?=
 =?us-ascii?Q?8M2jeCNyU4TJhMgO40vch1sbVV4F3HQdtJY2OBp3DV9pqBv5F3rwM+9/SiyA?=
 =?us-ascii?Q?n9DaYsHJChFdao2/XyeCZA3etJ6oLsW9tJVi9m4lBrCe0KJOAGrrQtrHa64n?=
 =?us-ascii?Q?3g4DM/VnF3SqAVhwclgxzadj+RJCtFvV8e9cDKBakzUeQv81AyME5HVNY6yL?=
 =?us-ascii?Q?BCnKliUJ/kIrz1l/fBxgz4qaNpNrY8kchP5IEAaCM/JSnCWltMtBFNFHX3Dm?=
 =?us-ascii?Q?MGAri4UevT+CalGQ1TlpWL+xNG36LQVHbwGkOQ9FqqzyWywnZqIHynY1RtfJ?=
 =?us-ascii?Q?LkohWoeQndW3NcXyjQKZ+Y7OTzvk5Nf6YhhrIqCrYACgCzXgpcIomhrO41er?=
 =?us-ascii?Q?pmRLu9FHns5G9BSESB/Nqf2fCwSTRf24TRYRhvFRvo6+YUxc6rfr7Z+Pes6p?=
 =?us-ascii?Q?PB7WumVjZi+Q6iDDkkNJZWQYPoc27pK3BTdRS/y/DE4Q8s0cpSW4Q2v1hFaR?=
 =?us-ascii?Q?8oBtNk7paXzrnl5Tn/jrsSdsm14pFFQgcEhc4cVNX45/KxUvnV2UG7JXZzf+?=
 =?us-ascii?Q?k7FUvylHJHDL3vXXTC6H7+bfg91DnXxvQpiHuJoAXehPkdJroHu7jZRpXGCa?=
 =?us-ascii?Q?dp4WGoddYf3/ayw1RXlZxByOWsD/w1kWy0+WPEqhhgJKcnELVej6IgzWUuYD?=
 =?us-ascii?Q?CDpuLrQCpCM8BiQBQ++Dgo3ObrIJAmeisdFCOBj6f2B5xuJkARyaT3JEnyuo?=
 =?us-ascii?Q?54bOYmqRTtkq8EaM161LPyPFBLdr/DkfGxaSvZ9quXqaVSM4CHSYvi84ZR7U?=
 =?us-ascii?Q?KVbCFPwh7HnBJa8yyU+ib7jr3+Fg4h6k8jC0IN4s2uO10FYxsuj3rAXjtQl3?=
 =?us-ascii?Q?Sx9Zhc1DSAdu7AYQlnxpdRXpN5lFhe4cO1TyOKJ7yHqjKrJPQhotEvFcyMVx?=
 =?us-ascii?Q?WqUa9CMP3avgY9rWBhzUcJYVbHiYfufZBmCIqCr0tKmcwGqL+WVKWbwfrcpW?=
 =?us-ascii?Q?jCkEg4qCvPTgnfmdJwZVJHYJz5xjV7DUM1hrEhr5F1F7x/o5gMX9EmNnHVnW?=
 =?us-ascii?Q?Mh+kGv9CxwKt7VytsvCH1rBBu9SCWda0DxTQ5N3f0nRAXCjDuJFLKaz8kyYm?=
 =?us-ascii?Q?9VxbJaa3lPMdnrBDQZcmq4EFyfqOozfXpAEXySZp9WKop/Z7pVX6E/GCx+xY?=
 =?us-ascii?Q?D0wKKXgODECEH/VdO8AceHe42M64hJCUVCjNlJoIvHddVUp2wWk3DxAa2ic7?=
 =?us-ascii?Q?25Ra97s3TPXfCm0jSySQidggoFwcFVi6AK+YJ4ul?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 151e8d69-3c7c-4bdf-b024-08dab8e55bd1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 13:07:25.6180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xFsBXHJ63B49BC8syci6GSY1UgYO7JYqcgMQfZhfPT0ZAfiPsVJ2y5yhL2wF3omg6cH/76QeV1RNNYOu/O83xg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4146
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: As Jaegeuk suggested to remove it. And it is not a super
 critical node,
 which just for internal tests now. Let's remove the testing
 gc_urgent_high_remaining
 sysfs node. As well as updating the description in the documentation to
 indicate that readers need to use the new node. 
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
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ooP5F-0003ko-4Q
Subject: [f2fs-dev] [PATCH] f2fs: remove gc_urgent_high_remaining node
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

As Jaegeuk suggested to remove it. And it is not a super critical node,
which just for internal tests now.

Let's remove the testing gc_urgent_high_remaining sysfs node.
As well as updating the description in the documentation to indicate
that readers need to use the new node.

BTW, fill in a missing '>', :)

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 6 +++---
 fs/f2fs/f2fs.h                          | 1 -
 fs/f2fs/sysfs.c                         | 6 ------
 3 files changed, 3 insertions(+), 10 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 374f0c98f8a9..e6b87522518d 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -241,7 +241,7 @@ Description:	Shows total written kbytes issued to disk.
 What:		/sys/fs/f2fs/<disk>/features
 Date:		July 2017
 Contact:	"Jaegeuk Kim" <jaegeuk@kernel.org>
-Description:	<deprecated: should use /sys/fs/f2fs/<disk>/feature_list/
+Description:	<deprecated>: should use /sys/fs/f2fs/<disk>/feature_list/
 		Shows all enabled features in current device.
 		Supported features:
 		encryption, blkzoned, extra_attr, projquota, inode_checksum,
@@ -601,10 +601,10 @@ Description:	With "mode=fragment:block" mount options, we can scatter block allo
 What:		/sys/fs/f2fs/<disk>/gc_urgent_high_remaining
 Date:		December 2021
 Contact:	"Daeho Jeong" <daehojeong@google.com>
-Description:	You can set the trial count limit for GC urgent high mode with this value.
+Description:	<deprecated>: should use /sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
+		You can set the trial count limit for GC urgent high mode with this value.
 		If GC thread gets to the limit, the mode will turn back to GC normal mode.
 		By default, the value is zero, which means there is no limit like before.
-		<deprecated>
 
 What:		/sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
 Date:		October 2022
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index b467c0ca1118..d0a279605f20 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1747,7 +1747,6 @@ struct f2fs_sb_info {
 	spinlock_t gc_urgent_idle_lock;
 	/* remaining trial count for GC_URGENT_* and GC_IDLE_* */
 	unsigned int gc_urgent_idle_remaining;
-	unsigned int gc_urgent_high_remaining;	/* deprecated */
 
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9312954ec03b..9db77f18e8a7 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -538,10 +538,6 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-	/* deprecated */
-	if (!strcmp(a->attr.name, "gc_urgent_high_remaining"))
-		return -EINVAL;
-
 	if (!strcmp(a->attr.name, "gc_urgent_idle_remaining")) {
 		spin_lock(&sbi->gc_urgent_idle_lock);
 		sbi->gc_urgent_idle_remaining = t;
@@ -836,7 +832,6 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 #endif
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
-F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_idle_remaining, gc_urgent_idle_remaining);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
@@ -966,7 +961,6 @@ static struct attribute *f2fs_attrs[] = {
 #endif
 	ATTR_LIST(data_io_flag),
 	ATTR_LIST(node_io_flag),
-	ATTR_LIST(gc_urgent_high_remaining),
 	ATTR_LIST(gc_urgent_idle_remaining),
 	ATTR_LIST(ckpt_thread_ioprio),
 	ATTR_LIST(dirty_segments),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
