Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 15B54987D36
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 27 Sep 2024 04:55:02 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1su186-0008Nj-My;
	Fri, 27 Sep 2024 02:54:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1su185-0008Nd-Ad
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Sep 2024 02:54:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q7KHY6yFZFZa1Dtus8nBY8gFmQ7jDR5Z2kZoIkYsFlg=; b=fuAxWteVPlAGe1ZhQ/ODK8XCCy
 qrrzNTJP1bbduVeVYoDZD9GYq+2yVqCU9UTqkv1TCLUPiNnK6d1rvf4sGb+DYF7+s3iDi2zWf0haD
 jQ+gLce9eW9/mKMx46RsMkYBwW8FGM3tSks7ggsp2Z2KZGDWKrTFTes/q2a1OW01DMf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q7KHY6yFZFZa1Dtus8nBY8gFmQ7jDR5Z2kZoIkYsFlg=; b=l
 XS58mKnuigYODYYm5V/ujwWSjDLm3PRtfy59bOhxa48zx7PxNsN5Ew7PFmiZVgUOyGmbXl81Eb7ht
 2a5r00digsvqyO8Jvn/T7ogD8tv86Y4+ObYhOsQ3kffPhzZtfTbLiInXj2+c9oWZqzphllTKQ2hbi
 lpGpqYFbsvAsWYuE=;
Received: from mail-psaapc01on2065.outbound.protection.outlook.com
 ([40.107.255.65] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1su184-0002BE-Or for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 27 Sep 2024 02:54:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=s8qP9e0QSrZetSKfXpUSkFGyIX+mXcSKr2o3EAfHkDpPxbHo4E4EMnRqczxma6tU7Da+owgDkUHXmq0/gJb8svMbBn62/X0kmnNtOgva9LMs5uHEvVclFMn6sk6YGa4XAdVPfzoeleem3I1Vr0qGVRDyTeiXR7y6Fx+nZhVXbbFhqjFlgQ+Y0sEETBYjUyoiOW9uFiRmDDNmsWhT2QwY0dTsHT7kuOVu4Y/Db0EhYPSGZHBCeCc5/Qhm8ZIgAtCxu0aYor/tMRKkikwCOIlrBjJUQKYnxMW1h0XQgjt0dA/wL9ZUbIbfe6ri4urYZrGzGEBv541pXZjJ7PHp1nSnZw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q7KHY6yFZFZa1Dtus8nBY8gFmQ7jDR5Z2kZoIkYsFlg=;
 b=C/eojkZz8v+LS8kW4rgU+7rH+oGcRJSJl5F3rrmI/FXz174StHjYqAVVMNOvkUeq6aDkzJIQSEJM6iEoFmzbAbXWq5tnyZoIPM7fGrLXXiJfT/4AxXlPeW1eBICJQacssyyB7m8yG4G0fQJskopFCko/LBUYdJVyLTr4kYCHO+NErq8ZfLLf3yWBxx+CF5SBOy1aPzSZdHgHieLVBNkLEmmDNNoLzwFJs4CNNx2aK5/u7yI1drTwx8ncxBMTRNPMQqc7Nd491c39GLnyLur2fVR7WOMANLYSznUdEvP2B3zZ33l4i5LYMy+AA0yEqk3mNoPbvbROhrR/uqW7CqRTuw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q7KHY6yFZFZa1Dtus8nBY8gFmQ7jDR5Z2kZoIkYsFlg=;
 b=SUwhRt5hpRwFvnFbRBAwmwkrxUXluwSqrFiSoxmYZUdabMjhwqjqdJKib/FNl3sI19Zz595jpgcKw1G6YkNZvHPx1iW6B7Rwy1lVlhhNo4uWautiYEASb4vX7fofWHhNsWwH7GrKYKvhccpxvGiPw4rBpDMsD2qxYi6Ww8k83HQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by PUZPR02MB6115.apcprd02.prod.outlook.com (2603:1096:301:e4::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.27; Fri, 27 Sep
 2024 02:54:26 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.7982.022; Fri, 27 Sep 2024
 02:54:26 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 27 Sep 2024 10:52:18 +0800
Message-Id: <20240927025218.191544-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR03CA0113.apcprd03.prod.outlook.com
 (2603:1096:4:91::17) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|PUZPR02MB6115:EE_
X-MS-Office365-Filtering-Correlation-Id: 80d0de02-5aec-4eb9-14ee-08dcde9fb2ab
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SOtpSSoLE7xLmkvcuZUWu+8hBQByf2i+xOs8jTseGpT1KvJpdIWy/9YWuWv0?=
 =?us-ascii?Q?HMT50K+eHMFivYU3cne4GqOrDoUuTEprf9M+br6zaGdSc+K8FgpYl8DR3AD4?=
 =?us-ascii?Q?PCLAdMQBJl+w573GmNbSyjpq2+RUuxjX1fdXEVpA2FhRhEd9HMuaMPaE8Q4S?=
 =?us-ascii?Q?K6pxkpRCRrC9iGsPstn7/xPrrYfbTMOEfaVn4OcoM2+FW0WKZaPnhL9vjdAh?=
 =?us-ascii?Q?YZJBv7kONQ70Ss3GbY8POxH7UgKM3hoiGI9BMcFAyRrUE8IKJ7gvkAu/SWy8?=
 =?us-ascii?Q?ZETVmb4ntZPl8uHJoUfAzBfxPsOAfmNVajXti+m07cBhUbtSk7zad9JnLMps?=
 =?us-ascii?Q?poVhabW8CPDc9T11FkC5zx737SC9KISldAVTB98fYvROOY7nlbcMwL3oAfFw?=
 =?us-ascii?Q?pNVq5QzwUXAP4xmxtuhjzafluo042cDIQFWtJkz8HkCfkih92kXDiiSvEw9W?=
 =?us-ascii?Q?PYuMA0fGsj6SrsFWiFJ91kKuB1yUJh1gmz/wmEnAcMCmCPWe4YXFuarXGPE+?=
 =?us-ascii?Q?/v3esWENV5R0d40RFtzdSlcrGOIXdMQkO66JofBcFK5F8EEDRYPxfgU0qPO2?=
 =?us-ascii?Q?6fn8FzRFDWZ6VyzQ0QO4oLOV2wRHSgwJFRs6uR1iiYqUYQ3cmxXtUKgqf4tF?=
 =?us-ascii?Q?qe92sfOvS60WujuD7I3RCBaYjuZRRF0Qz7junSPONnggQoWTOMCWi/d7bawL?=
 =?us-ascii?Q?kiT36jNnlYMfbdEHTeXkWQbTXs3n9RELRxgERiNzRJ/Lfh+8T75lvgO2axIG?=
 =?us-ascii?Q?TVQcHakbbduCNQ+JmIofzu+/tipBtsymxDedWOCzI6KNPQ28uD5OHFbbnvzF?=
 =?us-ascii?Q?EEJiDnjc+WZzroS51+BUweiaMiAncoYdPZI1sbpms8pTeeRtltn/gWPnz525?=
 =?us-ascii?Q?UHTReLkrfuOVLWc3GH12rzXI3udn1oFevEPjKbqkyQ2QNF55Rp6TVG4Z1ekQ?=
 =?us-ascii?Q?TvBQ1Amz96Q7Nb0nqdJVuHT0kPB/MZgjqJ9nSoFQ73N+yWRb/cPsBBdlO8pi?=
 =?us-ascii?Q?wFPO9Gbebh2T8TBUZRSoCz/mM4/pZPWgP3FJMrnqG0m8u2t3CKV79CLfBScm?=
 =?us-ascii?Q?KbS627g5yIFxp+O8HNj7RB4omk4+7RAR06Jkg/8leAefMc25kdDC5b9D8OOp?=
 =?us-ascii?Q?P4vA4K1Dm3OxfHOVUGk6FysvW0yc7wU3co2I2Ee1nFwY9yE6WlDgFrmCCqlv?=
 =?us-ascii?Q?Q0W4si1aPU1KCFP7VfxpUqkyLNvbQ0P3ecD1NimwwX7zRE6or4wvEzktt5L3?=
 =?us-ascii?Q?YgEbBOY5DtCsz49vMwGHdLSOfAk/9ao0vEYZ1wiyI1jyDvSp/wR4okCb7q67?=
 =?us-ascii?Q?qpQqPsCYWQ7Tz+DxavNxg/Gw/TRWfVA3NM4zdo4xDcyxa+evj7CxngxYntZT?=
 =?us-ascii?Q?7m1DDOD0ak0u+IgXSmmd00SAqKyxF0mLxLQ+MnZ6JIH8Ou8+Xw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IgZnaXzlDtrLnXpCuXTt8C4N3swKBhwOZSlzpzJg1Y/JLCS+xFNbYIGWhMF6?=
 =?us-ascii?Q?a0WMoBry45WMp/6wZC9dPGTFKRySHd5z3rWTxQ1zBdZbCDcwpja3y5aJCc59?=
 =?us-ascii?Q?xCqEYlQUjV0ptOpjH61dF5gqemmWWat5976KXx1GjFx3e9qy80wgU/CbVTwb?=
 =?us-ascii?Q?nB7US03kia62IhGRHoRmUb2iGI+g+krPyOe/orAdZ/K+qwkqXt11p2Qopy0Q?=
 =?us-ascii?Q?iQDnd5hmmEZ5ZijpbPczngWofkZJmynMBpuZz1kKA5WuYT+nXi9r/H2k8ZGN?=
 =?us-ascii?Q?3y27f8R6CmvSpNTKRRq++QSI64ePkiJtEKve3Q8FJvmspGptyEnSXDGuZdva?=
 =?us-ascii?Q?n7qPOZB2T4Z0LSIi36mZ4o4oX3P/PKmaWYxkKb8coi13EIFm/Z/HE2BfrNFj?=
 =?us-ascii?Q?XxS/047nf659Hg5/2KAzWp/oL0dqWoRSSE7B8b2cla67RVpGeycka0Jjcr02?=
 =?us-ascii?Q?vjCGvpxpoVGP7JkYKA22mG7ku6+W26JWogVz3haij19TwZh1vBh550v0LURG?=
 =?us-ascii?Q?CrDwuQfnoKhBFUPlhp8NpFxT1KUX6FLd1KwkCF2rVNbcoCmAbw/+ORpstJ/4?=
 =?us-ascii?Q?6KZxfAHQFUcqzPcUpDMadYAu8eYAKEq+XpAcKl+pQYjH5NcfG6kXc4pIFJ0W?=
 =?us-ascii?Q?0+l3xRsEbigkXtaz3WXJzYKH/RLVC7kIPhdKl9vPMd68QSBszPTUSxvbMZpN?=
 =?us-ascii?Q?2hD00bi3q0lA50RLOPuKiHn+Rlz798s7YO0+hb/uAzcDQ5ckY2Xjti3CHv/Z?=
 =?us-ascii?Q?Ypx2WtOxtn6qAeS6/FnTUvOFS5J2bu8bU0GBpo56IaCG455ZTkbYFUnmqYGz?=
 =?us-ascii?Q?2uEd6BU0Z5lpQNEVTPC9xWklgXWSvJqPLQIfRgFz6T9FHPOoQgsnvaUy7Xca?=
 =?us-ascii?Q?lc35hAZKY9YxgfxiQUlejgevD3Fdg6xvXS35KTxHZPDyHBvQtuDb++ALErWB?=
 =?us-ascii?Q?xsrOuRylM+Jw1nb4zVtFUPZ6PWYiRyEa6Nkv9QlV4xOuQjBcHJg8/qR3le/A?=
 =?us-ascii?Q?cnwfzM++odbgTIPMdcxhiNsjrUXzt/XesQVqcPRkZjK05AXlZvtxAKLhGMf7?=
 =?us-ascii?Q?Z80wm5wuVfkibhw90z4tSvr+pji9eKbwJEVA4Db0VyjM40YMUdo//QHkg7JK?=
 =?us-ascii?Q?qyt0VQQgn6cxGqelUCxP50/Oje2TKuTi6wAKtZ1XUs6gs1eyhgQjDaJqZBPE?=
 =?us-ascii?Q?NsIV/Uxs6cpukq5qrnKb9vgQc9X5/md26NNq4gRm4mgz80vAQSguPqEKQoys?=
 =?us-ascii?Q?DlgmTnakEo5SBT6p4d6Tx3OZbYA1wluSwGEx9o6MguE4PF8lZpmEXM2bj7gU?=
 =?us-ascii?Q?saYyoKfIyXVfMKVmLbEBy+F6nF/V+JPB8SgTeBwwplGdvTddqZktJEh8chgU?=
 =?us-ascii?Q?lFynb7Gl6Y7SxOfBWbBGOH5xuhzemxEHhHlG9wTdaCV/EXHDaM4rS1d3hWSL?=
 =?us-ascii?Q?RpBVZd67chjcCRx0inOEoGtwUxKN3FwUKlResfgunhfWUSmyfuBkXKtILzJJ?=
 =?us-ascii?Q?ODzj6s+JImVtYwWQArUANTIWPqzN34tsJEm2g6bp4T2tTKbOBSRI3q0Idg6L?=
 =?us-ascii?Q?F6hHMiOb9P6h7tFwl8wosfC9Y0FPpEe4Fy5ArX4xWC/i8+zyp0X4qhY9T6JP?=
 =?us-ascii?Q?2w=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80d0de02-5aec-4eb9-14ee-08dcde9fb2ab
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Sep 2024 02:54:26.1155 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PWQ32KnDt12ioQAeWvrcYhwUYnWFtP1Ba2oOihubDfJh+Usv+Hh67ypn4RO24HimEgyYYMlbNm6RW65fMzNg/w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR02MB6115
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: LongPing Wei <weilongping@oppo.com> ---
 tools/f2fs_io/f2fs_io.c
 | 25 +++++++++++++++++++++++++ 1 file changed, 25 insertions(+) diff --git
 a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c index 94f0adf..8fbad3c
 100644 --- a/tools/f2fs_io/f2fs_io.c +++ b/tools/f2fs_io/f2fs_io.c @@ -174,6
 +174,30 @@ static void do_fsync(int a [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.65 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1su184-0002BE-Or
Subject: [f2fs-dev] [PATCH] f2fs_io: add fdatasync
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

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++
 1 file changed, 25 insertions(+)

diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 94f0adf..8fbad3c 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -174,6 +174,30 @@ static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define fdatasync_desc "fdatasync"
+#define fdatasync_help						\
+"f2fs_io fdatasync [file]\n\n"					\
+"fdatasync given the file\n"					\
+
+static void do_fdatasync(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	if (fdatasync(fd) != 0)
+		die_errno("fdatasync failed");
+
+	printf("fdatasync a file\n");
+	exit(0);
+}
+
 #define set_verity_desc "Set fs-verity"
 #define set_verity_help					\
 "f2fs_io set_verity [file]\n\n"				\
@@ -1808,6 +1832,7 @@ static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
 const struct cmd_desc cmd_list[] = {
 	_CMD(help),
 	CMD(fsync),
+	CMD(fdatasync),
 	CMD(set_verity),
 	CMD(getflags),
 	CMD(setflags),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
