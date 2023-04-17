Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D3E556E3E91
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Apr 2023 06:41:32 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poGgC-00008w-Oz;
	Mon, 17 Apr 2023 04:41:27 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1poGgA-00008p-Rb
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 04:41:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LRCyXawd2J7MaaYWT9bRYzad+yct5dkOwX5dc//iFz8=; b=YiZBdsilu4rluWSioNqShaUbab
 3H5MsylwT44pptNc6tFvk4hi/vrZNksDrcd8WcKsILmIM7emHdhvkfoYYJBi7Nu/WohIPsjoA0Gm6
 soyu35LjPgG6IomuYX+ti9LJNY+Csfd0cZYuAeWlakrdppXWfBqruAfHQmAIjLWGjGJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=LRCyXawd2J7MaaYWT9bRYzad+yct5dkOwX5dc//iFz8=; b=Y
 JvPXmpUmTffz3yOq/veDghreIAf2FvRMw9DnH4Pkgw66bejNhdX4Fhj4MKSU1rI8LvGCgdqgWDFPO
 zPPP6pAXAt0I82N2ajvEVttB/52liBPWzx+4JJRvebP74rPLjNuJ5LlYNOHHQ10+4LB+3D5ngcd1l
 xyj8057njszkNxoQ=;
Received: from mail-psaapc01on2127.outbound.protection.outlook.com
 ([40.107.255.127] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poGg5-00AFme-WA for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Apr 2023 04:41:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Q3tBRpFn7ei073fUYF7zo8HHTVz5EMEyXkh7DtI4IvFb/Xpxef/RtnODR2j2w98851VitW6l4IH7X22ZBXrBv0jqiUM2H3JaFPuov2lHM2OrKw4c2hmrbYpFD3PL7SONDC2CnZjS4Tf+1bBw/T5XHTEzdFZcf0jRguUZnNSjpRvQMg80WGViv+f3rFGtj5htSlGhw8C4+352/j2ce9HLEOVv5a7g+AO2tqF1hpuhj+7ICU0pHSiN74BKoh2atQjyT5AzdGSKnBWibgjVJpgejUYDJ+aYCQ/NsjmUPMmUVy2JyUoSx8q5oEfAlep1au/USgU6LjjpYKV8QnBKMmJTzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LRCyXawd2J7MaaYWT9bRYzad+yct5dkOwX5dc//iFz8=;
 b=fv/F5xZQ72kdyPPR4az2SdwxM4YhwaqrrqbDG/WTF0bNL7oFq6bEd6JuiRMn/5AlwewU0iHr/LidE0dUf+yl54/93xXogPDcF9u6wvhZpoaZDAN7iOeIfiKE/79o5G/nUuBSRRYxJMIYrNCaNCgmi8boAa69lWT2KrSkrPVTXh9oXgU3hBQZYOSrnYoEEDE5n6vgeNzek2y2AnXBm5I/tcxeeAbh63RiOR51j+roPVTuk8/S52W2A/i0SdW+av9zf2AyeVjR2+qFogAWmcmzlY68hanYSrUaLhcRhtCTt2Slav9qj62FxrwlbKCsFeiyyu6GtpUhjqsyl+lAN24prA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LRCyXawd2J7MaaYWT9bRYzad+yct5dkOwX5dc//iFz8=;
 b=R3IBZ8LizmaxSCVLvuKgFC7VQ7HjlxQvx92PuWqDPgDcjTQbnfxJI58vN1W4Vw+gVaTCgEowtTbEtWUt4VTmgrOUAaEG0AqCihP+2aQKqlNxJ0olgXywCsDwakdT9Py5RdCd4MJY5cG9wfXaNdTDDAc45wWE5CuDaW/NHpfnGtgu/cWIHkfxGjPzOjzgCXlhMHCLiwb4kFIw0nr7sPrq2h8wP5+/wIod+XlrM4YhhT0GGa4hfAPdWgvMEhjVTL2x4zh5p0i4yf+zyMBcjF33AAA9bohQm4Z80o7G51Anf7R0MPAFlPhWuHOOKT8k/+7l2IqDchojRkJnkIspCChVSA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com (2603:1096:400:1f5::6)
 by KL1PR0601MB3875.apcprd06.prod.outlook.com (2603:1096:820:21::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6298.45; Mon, 17 Apr
 2023 04:41:13 +0000
Received: from TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::16db:8a6e:6861:4bb]) by TYZPR06MB5275.apcprd06.prod.outlook.com
 ([fe80::16db:8a6e:6861:4bb%6]) with mapi id 15.20.6277.035; Mon, 17 Apr 2023
 04:41:12 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Mon, 17 Apr 2023 12:41:00 +0800
Message-Id: <20230417044100.56409-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2P153CA0024.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:190::13) To TYZPR06MB5275.apcprd06.prod.outlook.com
 (2603:1096:400:1f5::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB5275:EE_|KL1PR0601MB3875:EE_
X-MS-Office365-Filtering-Correlation-Id: 0f931cd9-0c39-4d53-2afd-08db3efdf8e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Wac1rSq3Sl2mYZKklXE37B1c+I2Tsm4N+rXiN1erF7QEyuq/gp64/uYsi8R0+TA9s3BZF28rhfJ158dOen6HAPH66LCyWytzdwtjegGhQ5kifWPEY1W1gJbj39Fs0uCycWE3Qd96lg82CrymbImXrxQc+KY1t+OxqsCmlgUwcdzN6MOdDHYHGnVYdqlCK5lfGc9TFehgF+uaobMG5k4oK9vuKLzzGepzec45RdROmoDW1x/0AR2RfMIRNtoGwlEmhelRgGAL6ux7pE2V27UIAJlUBrEW4CHB02RGRlPeHoeRH/iO1A6Iv/BrLVsc/xG/7djzbxi7J/h2DYbH2w0XHw50A0NVATPic2QkdgToIOJQJQg8KaBJlRoovPMznT399Dvp+U3AuztG2cdXbAUUqz+/Ca6VDHF8E0NgXSkp2Cu7H/dC40a/zXK4s8dJHLa5lxOhViLYwkAAUyf0h8SCv4Oocxc7qOzS3YX3X+8oceVM7FILmxOH/7B1+0MPacQP2A9ETgC7FVbWzosr/k/eEesKW8DESAxofvSPEfoevoq6eR2IGtV0QhfGqMHj3oqIoZeyD4SGzWXJu4YRTz3+CfE3DWG05TrKSwm+A6GjHqH+Clj9PbcPHwco2ASXVBfW
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB5275.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(366004)(396003)(376002)(136003)(39860400002)(451199021)(4326008)(316002)(110136005)(66556008)(66476007)(66946007)(186003)(6506007)(1076003)(26005)(6512007)(38100700002)(38350700002)(2616005)(83380400001)(41300700001)(5660300002)(8676002)(8936002)(478600001)(52116002)(6486002)(6666004)(36756003)(86362001)(2906002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cpJVbAjc6mPD7rMac30QqWzm+t83FyOL1x66hQcfZtMMnxcSWdfzeTSJvQkr?=
 =?us-ascii?Q?NoAPNQy9lfRPQuzxjmZgOZ4kLPtV1VKdHJaN0/JKii32ke2E+wfk74KGMatw?=
 =?us-ascii?Q?9lcYsIrzoeIZhWT00U6UZ/kT54FfhPiqI1oEUU8RCtF3tW1DIvvxZS3RU+pS?=
 =?us-ascii?Q?JufA4J/STFugOUwU0OA8grocXOWZ7n+JbB+yitPtUMfyKXFVAmjV1F5+UfZy?=
 =?us-ascii?Q?5d1NVBQznm98+zZOS8DmZyEsAT1crjiq38VVFFxDN0axfsliib8NrJjkOoWX?=
 =?us-ascii?Q?rbdatfWD/BY5gvzyj0AtiLn3CEaBOykmiYyY1GduQu3l1ALiI4dn2YWxFh6O?=
 =?us-ascii?Q?fc6Y0zu6yawaOCUhY0WshvUtzZqW9sKzHglKaH5jJbxGVCCCT5kyG6bLTY5J?=
 =?us-ascii?Q?G3cLF7RmfDpOQ352+ZuMghAWMb4GbKvBBGMY8nhZWEK3VoVBSlhW2ENiDmhE?=
 =?us-ascii?Q?y/ytt57lIFqLFrk6rkFlflv6vhrAJhS4Qv1iyhrTFnrYPSI/36RMWFITNR0n?=
 =?us-ascii?Q?/hk4n9p4JKdClemEKtkUuWsLxhYrMm4LgMvXyEcw61vHU3BMFWoJ1/Aoa3ce?=
 =?us-ascii?Q?mZ5r8YMSwcZiYdRqNRmGvFSfFFol52H2VuUpSFhKjK7lNRGxC4zF6312C2Vd?=
 =?us-ascii?Q?27XM60CUiug2oDSh32fk6b2gSK88tS2b0RiOino0Hoxo4XgsYxBt9A9YUQyx?=
 =?us-ascii?Q?1ktjzA2ZwqocI/NFqgO0F3iVn6kDffZ3K5UtmHoqkH7i1XJ+9UI0t/onSrKE?=
 =?us-ascii?Q?UJcJw0VG5UBpX00FXZt7rNlkdvGq/6ITSk44L6+dVYJNwc+0XvF2gCgrNgzr?=
 =?us-ascii?Q?XMxhWvSep7QYi+XrCGRq4xf652SeLzHHk68iTpa00baXCf6yGVOuu4RK+FWP?=
 =?us-ascii?Q?NoaEbk+k8XDoFgkmUgVn2wc0mNiJgd3NXjl96ZUicuE/fIbuA/GKS/Pujx8j?=
 =?us-ascii?Q?16W9gGkSl9fWMYeFtH/C+V2Hs517djhJnoUh3S3gd1aJ7shyfMKyfuGFf4rM?=
 =?us-ascii?Q?FLA9U4CEmG6adSWEctB8uEzA5qtk+GFT5P1xk0FdCSA/dpxOYjErHiMseuv4?=
 =?us-ascii?Q?kGOCvGw0i4h/uy6VuCkENQ/TgXTL2wJ5IqdBPXSN05vQbh1QlfFue7uIXoiF?=
 =?us-ascii?Q?PPC6ecqglGeWnCexk/PbL/5PrqJBdI6bMpGnvI0yGrDVrvARRiIpeol9gY8B?=
 =?us-ascii?Q?j27yArJR2pbDgugO0n3qW1m1w2r/uRRtAnf+p0V2uqglNEDlooigeFDYN6W2?=
 =?us-ascii?Q?LTxG6nIOpX+3Hf+4a4LwFoItQa4H9Vn4/DRxSlh3rcznzZbahH56b8JCwyht?=
 =?us-ascii?Q?5HpgncCGDzGUWtAzv18diB/1TbkIbImxsByWrj4+D1gJFLtHt/m/wytkvz68?=
 =?us-ascii?Q?dbFqZF3mk8HpOhp3sy2kbI/5Ve+Urf4QZmA7XIc3m2Rmg80iDt+1XrzGm4Ry?=
 =?us-ascii?Q?mJG8jF01qJaH0yzbFVCMj+/oNaPU4lbQaGiXjgMqmWwU49ctfQv+LVV7/r3j?=
 =?us-ascii?Q?XiEqklJAR2TW1/4baMVW/6JSuHyzk9+tzSe7tGGC+irBWnKcZSL3eTvOu7mm?=
 =?us-ascii?Q?9cILrROYGAISX5Tj+JZenB1tV4yt50P2ccxH7Bdb?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0f931cd9-0c39-4d53-2afd-08db3efdf8e4
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB5275.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Apr 2023 04:41:12.9088 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JNSAvRu/39euGZmiUZDPQP3sUvqBrYh5PfYsAl5rG4Q7Q6DczAhKQ8SqhCTlbNSSX7TP8j7thStfMVy3NLj9SQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB3875
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Let's descrbie it's read extent cache. Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- v2: -s/an/a Documentation/filesystems/f2fs.rst
 | 6 +++--- 1 file changed, 3 insertions(+),
 3 deletions(-) diff --git a/Documentation/filesystems/f2fs.rst
 b/Documentation/filesystems/f2fs.rst index c57745375edb..84911b7aff25 100644
 --- a/Documentation/filesystems/f2fs.rst +++ b/Documentation/filesystems/f2
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.127 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.127 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1poGg5-00AFme-WA
Subject: [f2fs-dev] [PATCH v2] docs: f2fs: specify extent cache for read
 explicitly
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
Cc: linux-f2fs-devel@lists.sourceforge.net, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Let's descrbie it's read extent cache.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
-s/an/a
 Documentation/filesystems/f2fs.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index c57745375edb..84911b7aff25 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -163,11 +163,11 @@ barrier			 If this option is set, cache_flush commands are allowed to be
 fastboot		 This option is used when a system wants to reduce mount
 			 time as much as possible, even though normal performance
 			 can be sacrificed.
-extent_cache		 Enable an extent cache based on rb-tree, it can cache
-			 as many as extent which map between contiguous logical
+extent_cache		 Enable a read extent cache based on rb-tree, it can cache
+			 many extents which map between contiguous logical
 			 address and physical address per inode, resulting in
 			 increasing the cache hit ratio. Set by default.
-noextent_cache		 Disable an extent cache based on rb-tree explicitly, see
+noextent_cache		 Disable a read extent cache based on rb-tree explicitly, see
 			 the above extent_cache mount option.
 noinline_data		 Disable the inline data feature, inline data feature is
 			 enabled by default.
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
