Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A93ED6243D7
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 10 Nov 2022 15:08:55 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ot8Eg-0001ms-D4;
	Thu, 10 Nov 2022 14:08:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1ot8Ec-0001mT-Gr
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cTMWG6i6v/GkgOGyxb3sBYKnc4qPWZx5OHtS6LECEnQ=; b=M5g84x5Zr8BZG3gvnA56wbCV3B
 0L+JjdJjKC8BSXn3WHcwpkEJiT9jiWo3mN0PzMcbb8E7VqLjuj7nlQyTgzyCDFGESgs0HTzh3rjna
 5WdrPpM/Uy76vEeoKAcQCpuOcF9H3Kdsmd/AMwnccsRhWC9TTAQ3mcp5qyr8QN8ZdNW8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=cTMWG6i6v/GkgOGyxb3sBYKnc4qPWZx5OHtS6LECEnQ=; b=N
 MXfmGlxd8wLvX9nb9xreqUhVf91F4uKdX2geoeDenao7z9NUnBMu4AMB/PfdmeHmJ3E/Tt+2taIZT
 QHy5OE9aWhtE6xhirI5mUzaciOyz1dpIqN0uJpjGE+uZxCmfNaMKq/gtxQ28yuv3mWy+wSttz7IKs
 tZoRagp032zA8UsI=;
Received: from mail-sgaapc01on2087.outbound.protection.outlook.com
 ([40.107.215.87] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ot8Eb-00067v-Lt for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 10 Nov 2022 14:08:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mB43X4Pneog8cubhClvLcMdq+RWet8IUBM7RDXDMC28KSKX4hy+M8JhXhmEBfzOErqKQKjKw7YhBSYBxxOCLLolWl7w9T/6oSC/h0gt0zGWssKD5lhRXyisWuT0SDy6ZkXHqDWIIJN2HjBNypppb3XH8lSWS2L1Dl6iuARjopYYwwB17xMukGuy23/tA+w295q+9eoBYXbO4ilYhGqthoVBodmZREcOLOcY9ZJX3di2dwfLgO3wiQZ5h0IBIo0qpAqsPU/DfCwYGUXaLWQcWtQZ7f5emk3JZJGB/5kFS3qcQzPietDAbVO1pkW8G4Pe2EdmrGBjOvTDk0kH/R8K9nw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cTMWG6i6v/GkgOGyxb3sBYKnc4qPWZx5OHtS6LECEnQ=;
 b=jv0RyyL1tjl9VujrbNr+dFFEDUA9lyCEvSBoSLcNkTpcvNH2Ofn/XKYh8vRMYNUcEkDXR6J8ek9Jzr26SDR8bzjEg0rzKqK0EuYqtdpCqGT4JwCqOfJai3m/QlFnhWv476/UmfyrkTVJaG8UCDRqAW2MRn4JyYbVXMK8niE1yUd3CHcAe09ewhAAZahbXRAmkedh1EJA3EurnQXnl00scraAaPDvaFUq2+MzTKmvNpkAAyZiIdP4yvkzQSd9rpiG0WmCvQmsG3KiMbU60SvENN/HW8r+rYMN47on9wPMIlPLh3jEU50sIprtf2grvg0IO21tcy9HPcce5Ke+1dl+hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cTMWG6i6v/GkgOGyxb3sBYKnc4qPWZx5OHtS6LECEnQ=;
 b=A64mDilQfkmqDvxPz+rFFwO0pjhYoYnHK/d+CtAwMRUep7dABX1YNoQ9Old1SO4B9gPWPNsffCTub1RfndgK3cQnKI8gMBdDfu9nDaX28FvvPfhE24l6g8TkTylZ8vate1LL2+rvfLSGeMaa6sz0v390g+VXS9RqezafkIBrRqE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com (2603:1096:4:153::6) by
 TY0PR02MB5744.apcprd02.prod.outlook.com (2603:1096:400:1b4::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5791.25; Thu, 10 Nov
 2022 14:08:27 +0000
Received: from SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca]) by SI2PR02MB5148.apcprd02.prod.outlook.com
 ([fe80::31b6:afe9:43b5:aaca%8]) with mapi id 15.20.5791.027; Thu, 10 Nov 2022
 14:08:27 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu, 10 Nov 2022 22:07:20 +0800
Message-Id: <20221110140723.92752-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR02CA0103.apcprd02.prod.outlook.com
 (2603:1096:4:92::19) To SI2PR02MB5148.apcprd02.prod.outlook.com
 (2603:1096:4:153::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SI2PR02MB5148:EE_|TY0PR02MB5744:EE_
X-MS-Office365-Filtering-Correlation-Id: 36fedf18-342a-4622-2076-08dac32509ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uM3mvJnVUdGEvRd/DaK19yGYjqTaGjfcfoOuRhM+I2jU5/kmmBz/84SklRLgU8DRkv87ZnimCLF6vsF8qQzGkbsaomCScIzG9bya6NwnI1aHLtszYd6GMVaSB10Jzn/P6cgQOfCWJk5iJ/DgZ9pnDjMTyTGx6O5Gpt0DmyYTTFC3031oeWVYYTJRJNnr8afIIfiHE0USqWO7iI7RJ3PqdTVrfhIwIA+yPx6gM0R4jrmS5X+2864C0GnnWsKJWuhwbx0JgdscnMiiXvsEZuqpJDynFch4MK3XCHHiZFuiQUgyEXAHQBKrpslzZ2PioRrs5AZz41MnErDAtND8y8sL0GwdlfqHdwJ2v8SEzCE6qDtDtrs138VMF4vEuw5+Rw3sp/ec0JD2jEA4RJFZdooY8LYRPsUczwfO7kZhiitQYVtDwMryeJOFM6+GftLNyN1TR0QnvTooX+FpreWr3huPv/vzBuVNdhS9AbsYS06adNph10ncwW2DqNBGKsJ1ocDqUDxJ9Bs8+QnXx/iOUs/eDadFxuM2iG1GOI3mW8F7b3OKhZeJduAVE3APSSf2sakcNz3qDF7AEAiAXFel1Ct8uNQoEeVFpKyi5SVbgWCv04qIRB0H5Zh4w3bkEIQdbg10lghTuLxICNwPQHuON5hI3Zi7r1DP6wyC7nG0HgxlUyW9kL2TsMRFY6buUgLljKANrVPeaPau5eUyO9KfeJIHdpBkF4hbsmHzbEWkOFR4zSMH+FjT4HJ7PHI4Rsns9pVAVEMoeXc/+i48I04tzMXbVBXV4rXdBPCsEqXtY9oswNg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SI2PR02MB5148.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(346002)(396003)(376002)(39860400002)(366004)(451199015)(52116002)(1076003)(186003)(83380400001)(36756003)(6506007)(6512007)(26005)(2616005)(38350700002)(38100700002)(6486002)(478600001)(86362001)(41300700001)(8936002)(5660300002)(66476007)(66556008)(4326008)(66946007)(8676002)(4744005)(316002)(107886003)(6666004)(2906002)(131093003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5SND/c339t+RPfsFl6B6eyJj6xVF47QDqIpRmPMZjumTX18KkWmAcSeHRF9d?=
 =?us-ascii?Q?jp1/2Qfk+nTCOBvJO89AXpEGItCr+WPlU/F55Bjvpp1Z8qHB7UGl7cP6ARvd?=
 =?us-ascii?Q?v8BtM1EqZJ2ch+7ELt6daeIidCN7oxGdZcgb3D4cVzJFL2/JUtiB9HnH3Ctq?=
 =?us-ascii?Q?wvYhOz5fbLEH4O337eA7hY/yohAVLReQUK59qvaH88VmuJE5EzLA0Pf6Xrj+?=
 =?us-ascii?Q?c/fA311yn/Kk7slgLCsb9jr0MUjoZH5TKGILtM+4Ji/sVI409LgDo5ZXP2pX?=
 =?us-ascii?Q?hqXIhexMP0o81kr2bn6GMoFBwyS2xTBuvim1PqgCbYXypIB0NLQBsrvc6Sx/?=
 =?us-ascii?Q?2pHzYRGhIF8rqteEUs19oBKHt6W56JxtAYiUrmGvWXdEdGKEHOZ4cBG79gmb?=
 =?us-ascii?Q?DG9GDt3tcFCKQkQhhL+t1cmjQCeDb4hJfi6At5G8EYP8H0lt164QHR3yY5lf?=
 =?us-ascii?Q?1zKreKQOe2G6nism41Skxb1LqCtkXjeKtpoXrO5bprUd5Y1exjb7VnttAWoR?=
 =?us-ascii?Q?KLHzei/9M4wmYNUmBtK6pZIGjpBKJaca8kuSi6p0/rNLW5mD17Sp/k9Q5OzP?=
 =?us-ascii?Q?XouI1dd0uDr7unYCQyVi9VHY3RMX92RU4tYH5rLbrmFsOIJZ3r53/5xgHuJx?=
 =?us-ascii?Q?NeyPYgrmcYwRJjPKMw9c1Nmy0RRIPEdCsFEXaJOdkZ9rT13tZ1JOWs8HISIv?=
 =?us-ascii?Q?1JsiWfNknxMR+WhLdAxgoxG5iZpHjZ079TfsHgLbj5BQ6yzrtULoDlk6djsF?=
 =?us-ascii?Q?JxrBNfF3hCyrCmZmKO6eFi+/E8kqlkZ4Otrbp8r5Y59sVR/qkb7win0cg0sY?=
 =?us-ascii?Q?jwb3wIgAHjsm8l+PTyqaMis/f3HDjE9fGN7WN3IlCyULJqZunfefTLV3HGfo?=
 =?us-ascii?Q?uYKXTCvUocdX0v4qsuKu/NosA0jpy6FwPKg3Nb3ws+83gtpeJcIQCLAcjvPu?=
 =?us-ascii?Q?9P/nINHQtbO6cMhjTOLllvxMMG2n7DF/5k4dtS2+yLBs1una05l0ioE/uIcd?=
 =?us-ascii?Q?R+cHjYDYZDPjK1/5kAQIxJvQbTY8S9Cxnz5wihZkOVVcqcawXvKD9J9hZm9J?=
 =?us-ascii?Q?YyjIeWYYQXMKR4uuC6eD4JC3FuQLvey/8GTVVIwJCtY7ed9k6saedTlXh6QT?=
 =?us-ascii?Q?5e1UNAzMUGQgn1RZHfAGSlGpwHWu9VVeGqXHPr0Gqa9xAuPHPNxj5Et1HZTO?=
 =?us-ascii?Q?CvGRkH6egJ9706AA7KdpRefSS+OeA5ZIvqG8WKlyqR4A6FEvDXFqpfxh5OYG?=
 =?us-ascii?Q?naKeR2fzKFptPuVK713F3utESVZYbs7OCxcYo5EGFPlFLX9VxiNqHmf2aBYT?=
 =?us-ascii?Q?GmHVzwisTGrVtC59RYzdRiJGXabEHwgWASO0CvqHLQXat8a6aP64Sidz5vHx?=
 =?us-ascii?Q?NvJHLomla/v5yUS7+MkxdndlVBc9JuxWxRi1ybp4f9gRSEmN6YlVnFpzByg1?=
 =?us-ascii?Q?g0bHVVfInZUiMfEulxb/tHPZFzVkvmb1itHVotTbfJH0SrFAD0pM0F7YWPlG?=
 =?us-ascii?Q?+UEMcU00cpOk8L0/gdAKhXXQTH0ljplHjd+LvRrAEg3PUrDPTmeFksOrxyLM?=
 =?us-ascii?Q?e90wbA1Z4BycCe5p2mmXnVHlRp2bKavSkUkHD0qv?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 36fedf18-342a-4622-2076-08dac32509ab
X-MS-Exchange-CrossTenant-AuthSource: SI2PR02MB5148.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Nov 2022 14:08:27.1649 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: LuJRW8fMTKRcv0BCAeV80Hd5NhTtHFPMk6/6vHYTtzLUAVugIIX+vVbBsSkxzoJ0Q/9IRR1Uwuf1ChDiSSRppg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB5744
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Option "-g" for dump.f2fs is unavailable and not used in
 dump.f2fs.
 Signed-off-by: Sheng Yong <shengyong@oppo.com> --- fsck/main.c | 12
 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-) diff --git a/fsck/main.c
 b/fsck/main.c index 3268664..9b50787 100644 --- a/fsck/main.c +++
 b/fsck/main.c
 @@ -273,8 +273,10 @@ void f2fs_parse_options(int argc, char *argv[])
 atoi(optarg); break; case [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.87 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.87 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1ot8Eb-00067v-Lt
Subject: [f2fs-dev] [PATCH 1/4] dump.f2fs: remove unavailable optiont -g
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Option "-g" for dump.f2fs is unavailable and not used in dump.f2fs.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/main.c | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/fsck/main.c b/fsck/main.c
index 3268664..9b50787 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -273,8 +273,10 @@ void f2fs_parse_options(int argc, char *argv[])
 						atoi(optarg);
 				break;
 			case 'g':
-				if (!strcmp(optarg, "android"))
+				if (!strcmp(optarg, "android")) {
 					c.defset = CONF_ANDROID;
+					MSG(0, "Info: Set conf for android\n");
+				}
 				break;
 			case 'l':
 				c.layout = 1;
@@ -409,14 +411,6 @@ void f2fs_parse_options(int argc, char *argv[])
 				MSG(0, "Info: Debug level = %d\n",
 							c.dbg_lv);
 				break;
-			case 'g':
-				if (!strcmp(optarg, "android")) {
-					c.defset = CONF_ANDROID;
-					MSG(0, "Info: Set conf for android\n");
-					break;
-				}
-				err = EWRONG_OPT;
-				break;
 			case 'i':
 				if (strncmp(optarg, "0x", 2))
 					ret = sscanf(optarg, "%d",
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
