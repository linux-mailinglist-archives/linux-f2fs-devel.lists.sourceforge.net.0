Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B88C6E717A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Apr 2023 05:14:54 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1poyHT-0003U7-9o;
	Wed, 19 Apr 2023 03:14:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1poyHR-0003U0-Kz
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 03:14:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TsuXSgBSbuNd/qGMJzWDO+rk4EMBGySItL7HnhsAn5c=; b=D1VTilbeHvGyhVf/0LfQXuXG70
 1MwRtXBlQHYeYjOMVJE0vcXaQt+i2DH1SRePD3Jdbz38d8PaOotsY0IW678l8vvbT9Q1JwKWMMHik
 ruxgBWo7M9kXMgKSkQC1+bG5Z0xrHV0+luX2eebYTR04EX+ivnkSXyhyHrOVOzvs3R8Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=TsuXSgBSbuNd/qGMJzWDO+rk4EMBGySItL7HnhsAn5c=; b=Li+iVvpZIGdw8IEkADcY0RvSqS
 Mveav34SM3s619WedxIJI+JFn4aVbrtcWfPu3P4CICHZg9etjg3+Z/gzBF0+G+nDZfCn0XoniZ4+N
 8N7qciXlp3s/cO5lZVv62VgT2fKCjlCb7qPcV7jyDT9FMmGLenbxe45tmiCfjjvXFhQ0=;
Received: from mail-sgaapc01on2136.outbound.protection.outlook.com
 ([40.107.215.136] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1poyHQ-00Bz4M-5H for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Apr 2023 03:14:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=h85dMtpdK0l6t7rLaA3m1yaFEbaqJug54MdkM/WHZ3leMbfrWzeq7W9LjarqB/c+cTcH7Qi+5TTCOf6fh8v3AFd4D19+92T07KdRcN6ukSkl3937TH4/cxuxV1I4D6pnPtKpJNKtLcW7AdEf6FL1wH8MMgNJqOHur5Izblm83khv4T4apYsOrqpEei0LjrZ9J5/9RoRITzCEJVfAI6uduZG4qWinOCnG3IEmsxdvOsdu++s/IqVhmRdtXa0hYSab7RIKibMTrwOYg8jZiS+Alu8RFOKGtGsQo86q6tbPGFoCe0VguX2SVuF3tcEigyI+K5+jcsXBuskb8vjDFyE8KA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TsuXSgBSbuNd/qGMJzWDO+rk4EMBGySItL7HnhsAn5c=;
 b=fk6b5VY1EHbL80BsRRz4fBoctmxMEyp4YgQNVOl+3YiZXTCEW0oF/3ubs8406Z39IOCcVcBFwWAQ5K4wY4rWoCEAjKN1nKUTr/zjIcjAPggoLIZWFv6+Jp55zaf7p9sUXPSeAhA/upg2ndPZXQaGcAh0u0IOQZahmqtQcdGDjyoAqVAMkI64xyK0d0I+/uHf0JvWkmvsEd85HOrixg2pTLfjiD8+XM3QRD7lqKZIIjdlueV0sMxp6UzsN0jRoXe+JYsHKFojxiijRfPGb4Be7hZgFeHtuwSEX41w2NVJ7uXdtD/g9U3aCQ3vTWJt/3xT2hzuQOzhCM+ORZxTtvHKyw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TsuXSgBSbuNd/qGMJzWDO+rk4EMBGySItL7HnhsAn5c=;
 b=Kmiw4vqxxOM0USCAYSD61qSX2WkrIbB2nXr36czv16KRybqklVub/8xpijeodROVKXxf8PcpFFkUZMSD8odZKl5IPk6nUZRetc7dYu5ASXWxPyrsnP/OoOFyHYWx2nDXERzS4Y6BtzpezFkIdituJpUjzNfw10MQcgKe458kti1cO1jXVtQy4aCvqkHVZ/X1ZMRQnKSzuwmMvRrriPlMxM84SF+VgnvxdhpFsHDyrJ2LsdbfssRqk/vs92RuqFDFMhzYznMlADGUJDWPoFOBmLXy3KcrABqSCZN0PmGW7hbpnOnKeqeBQuIns3SdojugGovQf5Znq/W9662yXNbhxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR0601MB4164.apcprd06.prod.outlook.com (2603:1096:820:30::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6319.20; Wed, 19 Apr
 2023 03:14:36 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::76d6:4828:7e80:2965%6]) with mapi id 15.20.6298.045; Wed, 19 Apr 2023
 03:14:36 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 19 Apr 2023 11:14:08 +0800
Message-Id: <20230419031408.5775-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230419031408.5775-1-frank.li@vivo.com>
References: <20230419031408.5775-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR0601MB4164:EE_
X-MS-Office365-Filtering-Correlation-Id: eda9173d-138f-4b16-d4e7-08db40843474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: UgAzYijBgkJwvJ8I08RmR6exYPMgxrhyoA9kforLOpWPPXei1SkvYi0oI/RH/BmfbOgnqm1NerGE2BNeiKvxLNGOArEpx/1oiG7oFEuNwvIFeBKSrA/jdccvj9JNsrYS4YQBgf2EFH3dWIgY5Yw1Te+4IccXQKqJXIF0EArDQcHQuyMYb096ctaQUb1Ge3WDzNVWQFw+IxWsiy2Is4TVwhdS1NQdAxYhyrBPBeVLkmnL3SDnwLoZi2uYcCFGyzcxjH4lFp49IhM2CUoyxU0W6R/tqtbNv0VA3orTDpj4h6ocojtAIJzutzKAbUxobSw2LfNC0HxX0UNkdctL3C/nTskC3c4ittUu1mpqNEFJ0Ls8SXjbqptaL7u5L+PgFxYoaurL8jVHFiL+6ZAFJ/v0I2crzzO/XBZoQ6v82MJoexo85El3sfuAWxm5o79sDBiUW1GmYigOQyJ5dZSzfPxlSPgR/1oK85P4CD4nyGu+2TTwmSoiz1oLpPd/8wwZr/d/Mdr1WlzvPU8L8LIgjAbXLnNPj4xblhM5gjHbTEFvwLYjkJ5qznSrNQWDW+qnAULe/iPe3DZFmEpex2hhKEknJZBpQAtUl3ww0zRGG/oT0QZHhaOOU0zpFuRxAdMEpJ9R
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(346002)(136003)(396003)(376002)(366004)(39860400002)(451199021)(186003)(4326008)(110136005)(54906003)(316002)(66946007)(66476007)(66556008)(52116002)(478600001)(6486002)(8676002)(8936002)(6666004)(41300700001)(5660300002)(2906002)(86362001)(36756003)(38100700002)(2616005)(6512007)(26005)(6506007)(1076003)(38350700002)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mCUCMyhy6aMjDkKqt41BnVedu3YMKzXDBuKgWOcc+oRazPQy0Xd6R39LQlDW?=
 =?us-ascii?Q?HwGfBtOT2yNfQPxpNdFIaIf2qmJuuNecFwn1rxAWMt5fJzzyxDFkWDL2f4Tn?=
 =?us-ascii?Q?J/Zcxs5HPC9XUvLePhbt9brv5UQA9YiyWFkw67bDEwoDNYK1w4B04ogsQwi3?=
 =?us-ascii?Q?yqDNZtwUXzNB0rlVRSe8WpHhWFBu5jWZT1caEQPXe9EBw8DrJtoZvuy4A1C0?=
 =?us-ascii?Q?iDFwH2LJftf34PPZIIhTjMJQgAGs7th1v04Gw1XWdBNibvU/FQZZ05ldKck+?=
 =?us-ascii?Q?6ljMTLeyRV/Y0hAUCcsySff3Wgh0N65VCorYzcBQnuULGViWnrTaEueynJSD?=
 =?us-ascii?Q?BBxPThOa2VgE1AtEnp+SQu9bLBojnh4bFTrJNTBhyDsL+myTx9ufrhQajWvn?=
 =?us-ascii?Q?HEdbDno/3v+YtgEIeQwghCWNtHN4syyCQWMViukTY9ca4+2KJQJMrWrF/Fix?=
 =?us-ascii?Q?Toe03uoI38uPbKYq9cZ5xYVtbkr1TIDV6JRFHG5T0hf8sasCxYVQi47wWPMV?=
 =?us-ascii?Q?c4V5Mj73cvFcCnG8ULezxyhwT9xVV0rlHR+XSqgbYLTD1tSYX/EPvNSYDrop?=
 =?us-ascii?Q?PiRzaTm4MnJddl6eiCIXPWGBgf8pzE1YZ8ME7r9rlHOPDMI+hy0HzOe5UnNn?=
 =?us-ascii?Q?nlE+4irKHsyKBk6qr6T4Cu27+suBHDIZX+8s5YvYueNKMCf9oZ/TV2FfrXvg?=
 =?us-ascii?Q?fQR50u58JGF2IP5uhYqs9JHrPBr5NfZPE4QRYBwDukXBU71qFmBDhmEyLc0d?=
 =?us-ascii?Q?7wr+M9yVOoRHACzBI9fs2IlR2qTFfCUxV5uuXmLAUMLf7m40BG6aeAARiwfC?=
 =?us-ascii?Q?VundD7AxF79jCySaD561MtJYCS/V6B3Um8eBcRPrHKTMmHb911mnavpimL5M?=
 =?us-ascii?Q?9DteJ7S90n5HvwV9efHBnZJT6ShMp6iDJdYZdxhbXb9e/XgmdpW+ySJ3g7iY?=
 =?us-ascii?Q?oNFVgKwaCONaDjajbe4gTOaQbsEAkhrfPq6XDst8/IusEqVHEFMgF6/GOw9e?=
 =?us-ascii?Q?6l0WawDo8PMNjPGzdTn0W8IQOFMGAJAccGB8wC49Fsc7JMbbczCwREKeAH37?=
 =?us-ascii?Q?XQFXqwlgbIX8DOsIwPyCI7FrH3eZsuVBmDplA6VkgYsM9lBVQjJl05huL7fE?=
 =?us-ascii?Q?1n2NvS3SX04wCoKoiy84j1TYoB8Wi8jbKOKUiSimxy3jAWlGlRbHdH2zEsZC?=
 =?us-ascii?Q?T4d+Z5c6ePKjA5Go0LJxACpiuXa1GD7nbzbyPwSTRqDccOCM7xgSY0LgUZRA?=
 =?us-ascii?Q?Nw6jeCanewpIKaXaBgaEf8Wiln8G8NA7FD3N+rk5yzlZrCenEOAoBOWn4XSB?=
 =?us-ascii?Q?nv4djqU2X9IqfMZxruoB/fFR+lTY8B3nxX8E0n2tTNYJnD1LdVrGNay054fB?=
 =?us-ascii?Q?nZkslWnzpm3uo6t99jF8zkXZTOLWU4kpSYL8MM4YkCgTF1RsCCy1qP3C4ixZ?=
 =?us-ascii?Q?jk7X10l1kxUORooxrBeiE5onk+LRtL8OW3I3AMP4oqmNmgVjSemkQc+EYjbd?=
 =?us-ascii?Q?EzzB2el0RRnb/DVq1RVNQ+AUtArEbodO5M+stOt7lcbTfiFD5z8NELeA204C?=
 =?us-ascii?Q?fnmuNWdsTC7wDEUko5FZpL91dr8mAa4ELa1O96gD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: eda9173d-138f-4b16-d4e7-08db40843474
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Apr 2023 03:14:36.4087 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: sCpUiVkBqraAda7bSxMA+gShJO9cPQG5LF9gpgb8xAztfrXT6PSs4+R3qAX+6CQKe+wiIE05kT7EuMZ/UXwU4A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB4164
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Slightly modify the description of noinline_data and move
 it near the description of inline_data. Cc: Bagas Sanjaya
 <bagasdotme@gmail.com>
 Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com> Signed-off-by: Yangtao
 Li <frank.li@vivo.com> --- Documentation/filesystems/f2fs.rst | 4 ++-- 1
 file changed [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.136 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.136 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1poyHQ-00Bz4M-5H
Subject: [f2fs-dev] [PATCH] docs: f2fs: update noinline_data mount opt
 description
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
 linux-kernel@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Slightly modify the description of noinline_data and move it near
the description of inline_data.

Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Suggested-by: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 6db21ae0136a..87436ce5d2b5 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -144,6 +144,8 @@ inline_xattr_size=%u	 Support configuring inline xattr size, it depends on
 			 flexible inline xattr feature.
 inline_data		 Enable the inline data feature: Newly created small (<~3.4k)
 			 files can be written into inode block.
+noinline_data		 Disable inline data feature, for which the feature is
+			 enabled by default.
 inline_dentry		 Enable the inline dir feature: data in newly created
 			 directory entries can be written into inode block. The
 			 space of inode block which is used to store inline
@@ -169,8 +171,6 @@ extent_cache		 Enable a read extent cache based on rb-tree. It can cache
 			 increasing the cache hit ratio. Set by default.
 noextent_cache		 Disable a read extent cache based on rb-tree explicitly, see
 			 the above extent_cache mount option.
-noinline_data		 Disable the inline data feature, inline data feature is
-			 enabled by default.
 data_flush		 Enable data flushing before checkpoint in order to
 			 persist data of regular and symlink.
 reserve_root=%d		 Support configuring reserved space which is used for
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
