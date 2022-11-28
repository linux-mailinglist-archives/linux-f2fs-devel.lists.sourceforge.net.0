Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EC2E663A038
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 28 Nov 2022 04:52:32 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozVBv-0001Mf-FY;
	Mon, 28 Nov 2022 03:52:23 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ozVBt-0001MY-It
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 03:52:21 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iIMdO7Ba0mvREi0m2Cnj3HjZScRjMIXODgy29Lcjk/A=; b=SoahSpMXCL1nMBHn8oKcSPxH82
 WKbXdNhwYPqX8Zf0jc4BrGHMpqeDj+PpFGpLvr7tPm0Kk73Lq9lUlbs587QNJy6iHa9RAI5VGEFnh
 Y5n1Zk+iOpra+V1VOjb2KoRDCd1k/R4qGxDMtP+OgSZsYUPIvaIK88vbp6cdTI4dJonM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=iIMdO7Ba0mvREi0m2Cnj3HjZScRjMIXODgy29Lcjk/A=; b=I
 R/Dgp1S+8COUaU1Hb0rVo3mcelBGJUPlpaXMsCg/1fHoDX8UdzUwi40tp07g2axtf5wpcNjygmrqq
 xPB48Xw2EXioFEXYN3F6hscwI/6m4W+7+Eal7qQL7T1sESFOsC2/xIciQw4HSnuUrjMijCo/z7LVv
 BZy2HU5CLRNejeSg=;
Received: from mail-tyzapc01on2107.outbound.protection.outlook.com
 ([40.107.117.107] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozVBj-00G9Nt-2E for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 28 Nov 2022 03:52:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n+TOk/cdYPLPGOmuo1edvlcm4YnLpGIKLqZbqGjYnYU50GP+bjb2e3iUnqSmAK4TUV2e5EBmx5fb7EnFu16Q8wmcQV8ofqu82PXA3psBDs+wK9ZH7vRVO2PS2A7C6v4Zuhy7e39bwSHzxWSVACtvc0xVGDdFttKoxszZSr4XeTIHjnIPfSXiLkj4BcZ85VAPzuf5NnJX6iPiJXhYYoRXU3ELcF6435R1ncvWL64z0YoIifxTCT8fYJN485s3RcpUG/sHpC1Xr66nljoiqgCbZnh+xWR3ATB30B/0JLPGZLJy0hKutV8XuBkPY/87NIOpc6MT4Fk23Bjb80LJahCMuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iIMdO7Ba0mvREi0m2Cnj3HjZScRjMIXODgy29Lcjk/A=;
 b=OTVTQS9CmbCHWk1dCWFh/yOAkFke0f1ywaChiNvyMbCBDQVKpCSAQj5RUDUZkqy6OPGz0fpHxQJ9H7/gtYSYbCanxsvUL+m0VLDZS59ufYU0vs71hoU0/SxfFi3QiEySOh5w0E4DoSMAGg87OOOzoH7ooWXvygJjN5S3e7swufVSs6CDpIdP9WZpK7ub0U8ni62zbfUMEfWLYzZUdjgaN9xYqwb6AV0v7+VifLxAfH0ZS4KgGLPj3LA/gRHvvw+ASllJlZcVbRf9WzZJ8h6kOMQ5ORraIXyDK+8aMqRub9gRcRkLdIYnfS9/eB4KqdxJMQJol2cRAvXceIQnhFMz1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iIMdO7Ba0mvREi0m2Cnj3HjZScRjMIXODgy29Lcjk/A=;
 b=HVI+uJDRBQ6nEAx5aetPUE8+XIQLXS0DtSECm91Z46Hl5m80yEoK3avGo+hBuAviPtFGhiZVhR5+bj4f3hBPf1ZAw4VaUPc7JVVoy4gK+tnAKlegg1FN31d3qKsg8g3683rhYJGdjvuOf9VTrrQgyWHNnnX+rtwtuVZg7yxtJh62EpWCe2qXbGBoAeXIHLTmBiJ1M7XW/vodmyT6O71I4EynFO9c4/j70JtxR8DgU60HLGG+JprPzuN4ge8kGaMJAShtilKLTJFxX3ouFRH+lm64hNPtpHhvNVePCp9yVDzhYgaK2dByW+FVTiMBszDkn0M3GMD5BHLGrblWHVytOw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4044.apcprd06.prod.outlook.com (2603:1096:4:eb::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5857.23; Mon, 28 Nov 2022 03:51:59 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Mon, 28 Nov 2022
 03:51:59 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 28 Nov 2022 11:51:50 +0800
Message-Id: <20221128035150.30787-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4044:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b9afaf8-c411-438d-a177-08dad0f3e6b4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: /tRdpsa/JU9/2oXJfKYWGPzAGxT62w37JENjz34/2eIvaWFqhobzH3PeKhlnk0kEhn8toJKwldoSPsksrogf2LRpgIEdY70X5lTxCE30fGlBKsBKPV12PTg+qYdt9xrTuVmv+qx45QqEpEHYJqEflEcKdPwEMKSOqDQgrDx4QYrV4k11I/xkTqKx9IFb29JmgmYT5aAIcyqisfvX6wS/MLGyOi1EwvxcSx3hBGbnm35hFM5kNEGL5hVoB3K57ZRMwLrbSydtoKKJrf+/JHJWgZ+TufC61rmfgludhlKkMw0i/FNtWWWNc0+mGDI3h4XzWoQi3pOr6u9lsC9N3Gpi/8xMKEFf/rik3Sx5U2cKGU1fEGzuyvA1vGh6HOQl5DL5HsHlyr5SqI3cl5pLBWHz8mV1gO1JbcHtKHMRzb+dEoLNG9EW0kI3uX/mP+KGxM9AKthoLpAR3RvVQip8KUx/X8+WzFmD7dD3S7Cqw879ljjIFS2J/Ht8mDE4aMk9io2nuOiSNdQxEoChuzZZKE0FzzUv1ko1QrWpE/wHdBnkro9S5mvc1UJ8Jq6IYSjUPdpI3aXw2vdAq57fYij5mnGSEEsNuwGvxV5lwpWP/cXuBBL6oFFiYGgwJIJ6DGymZiuk8YBzZjpOi3Hx8TyKabsuksC6cdpdao/AFkUX95hbNhr5b9TSIl4UODITRL6gql6c+KXwiZHr9jC0BFygsuoXeQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(376002)(366004)(136003)(39860400002)(396003)(451199015)(478600001)(316002)(2906002)(36756003)(66946007)(6486002)(966005)(83380400001)(38350700002)(38100700002)(107886003)(6666004)(26005)(52116002)(6506007)(86362001)(6512007)(186003)(2616005)(1076003)(4744005)(5660300002)(41300700001)(8936002)(66556008)(66476007)(4326008)(8676002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wSucYULU9pdiLDCm8uHBWFlybQ6wcAvjdAx/pO+qrGfoBmvDzuoc7T6o16fu?=
 =?us-ascii?Q?OJFyrr3tGZ6XL2524k8LE6VCXCjsVWRkoMSsRQ/1YEtlBIFICRrbWvcsBBlC?=
 =?us-ascii?Q?WlikMU6njjdUKBPyq5/x/bZJKl4Ydy/gTAwCv9oAarXHQXO1AejFVW3LN5No?=
 =?us-ascii?Q?syh3cLTrvFbhfFS928GfQMxbKuYguDrtYIVrSLnuVQKP4slHEzIWoXBbRBwG?=
 =?us-ascii?Q?xgjZIDc4dLqZXc10Pa9QQgNqG4/l/oM1fDeYH+qv12O0Gb5+oDCaPVGvDinS?=
 =?us-ascii?Q?yvHy82MVsws08nG18g0OkcgZEYntfz6q0VTNXiyh2nogEXYVklMhSK9yl2HH?=
 =?us-ascii?Q?g61gG7Bv6DCnXiouuumsNXtvWys6b37/KKwUO4RtsqRJBL84GE/WM8MuEly8?=
 =?us-ascii?Q?4ja2FWw+gn40KTNA1pYyQpaiOYN8aSUBIn/aII1PV6clXbQs/iFAL6fnjd7U?=
 =?us-ascii?Q?md+3iJrl88sx8+h+e4U2p3+cvLWbY1Nq08skW7ksqqqnlVU8ZpsCdJ6Z2Agc?=
 =?us-ascii?Q?vYFLXyVCON+g3/J2H2KMbu7HXmQKy2YFIdbxB1LDJAzk3qAlpD7VX9hblCWI?=
 =?us-ascii?Q?tHpW3k+MGNyxYS2/hOeEvfOp71yx0mXyTjpBdwYY9I5BKBp4iuZWnHq8cw1M?=
 =?us-ascii?Q?RGkRAoo+joTo3g8HWEN9dPF4n/1sccTNzO3jVo+wDNz6eiEp8A9tLPC7YnzZ?=
 =?us-ascii?Q?6GszMShLeNO0K3S7e115lxzl7kyqH/A7OCaSBcZaaq++ispFDKCEQmON2yot?=
 =?us-ascii?Q?xjmxgzcgVsJ09YRooqPUxG27ErWjrpbFuh4ayj3Jxrifc0ccrYKQv2rOZFOT?=
 =?us-ascii?Q?3TilCxcw1CFWMA42W5LXOW+VLnsyYBcA6ZEAzKKFDHVeoQ4XRtrblKYYAHCV?=
 =?us-ascii?Q?u+5znayc7ZoWsq5MU1Ii9WQlmutrP1tfzIjVNBvvGkPjDJTsfQR57Y62Lp/y?=
 =?us-ascii?Q?LPBLWXH2LSXkuU8vC44JVVR4slabJiWW/Zy81ac0uRAlzg0/O6KUIOyIHzj5?=
 =?us-ascii?Q?pinwLrP6zbIVFLxzrb0P6i+R3W5kSjCUNYXo9JTfV2LHr+qNvZ27haQE96u5?=
 =?us-ascii?Q?8oYk2ZqOG2XlocW9KzNtsLmBvRtIBpqv/WAk4fiJdOlSSm6AsfGyGqqxYQwY?=
 =?us-ascii?Q?3M50lg8w2mN2inr9pNiNX7rXsQ7rMKDo7qrXuJU/dstg9iQ5P79yL2E+S1JF?=
 =?us-ascii?Q?DPFg5t56BsF6UdBeydjgLTp/65Ts9WWq69/i5St1iTVvl7O35phLdiY/JpLN?=
 =?us-ascii?Q?wjUIiVfaC0DiqTT3U9BOSPqUv0mwgmLJuoo5GA6cGf562iVFWRi/px8vmon+?=
 =?us-ascii?Q?q1CdHRY69Y+ARuKYxtu8vFbchyTt3UieyRrsBF1GyyDNhk0xDRd1mTCHnRbB?=
 =?us-ascii?Q?EPCF9ySBYzyKlMxqeO8MLA998BV/6DC9AOeWN3AcOTjdczeCmGR8WhznTXeD?=
 =?us-ascii?Q?LJxWf0GBqUCUPl8xtBOxOCGZwtXye023cdQHj8UT6CoORxA085Bx5GTvYUp8?=
 =?us-ascii?Q?UJAEod7nEp0V3Aw7bJ7IcwLfxIWUHcvU7IeOc0L7RJg5LhtZrAF19smJdDFq?=
 =?us-ascii?Q?/qRGKBmBqCd9UjGzkPiNPNd3pUSqoEYC7wBhssV/?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b9afaf8-c411-438d-a177-08dad0f3e6b4
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2022 03:51:59.4605 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: pLJLnHQf3zuVVGX6ROrpACMmj96MjnGVWgtiLgN0mHDBwo25YnJBpGeJIWXrETpdHmNTR5Il4trhzGlQWF8mAA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4044
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  It's better to use bugzilla.kernel.org for reporting bugs.
 Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 Documentation/filesystems/f2fs.rst
 | 6 +++++- 1 file changed, 5 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.107 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.107 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozVBj-00G9Nt-2E
Subject: [f2fs-dev] [PATCH] f2fs: Add f2fs bug tracker link
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

It's better to use bugzilla.kernel.org for reporting bugs.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 6e67c5e6c7c3..67e1f3e86f32 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -25,10 +25,14 @@ a consistency checking tool (fsck.f2fs), and a debugging tool (dump.f2fs).
 
 - git://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs-tools.git
 
-For reporting bugs and sending patches, please use the following mailing list:
+For sending patches, please use the following mailing list:
 
 - linux-f2fs-devel@lists.sourceforge.net
 
+For reporting bugs, please use the following f2fs bug tracker link:
+
+- https://bugzilla.kernel.org/enter_bug.cgi?product=File%20System&component=f2fs
+
 Background and Design issues
 ============================
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
