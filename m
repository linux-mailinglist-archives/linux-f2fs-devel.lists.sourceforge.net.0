Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id F1qHOLL5L2pxKwUAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:10:10 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 366696868F9
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 15 Jun 2026 15:10:10 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=kthqYyLO;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b="O3TOIoI/";
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b="g wK+sno";
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=pLBefK0K;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=58IHDCb4LYbbiMXI1sLeRFzrk74ESdrd2IyKrH2Ojh8=; b=kthqYyLOTZK7TikQ2Ona7fUqZZ
	yDvbjGvu8vjAWdn0jAEobFfH7sJgKRZIaG2gHhdHL1v9RojuWewlnMo8ghj4IGunWWXo7kLW/5Vgx
	hKkESiyN6Uu0xo4RgJpzXZhNJa7pknTKQVKHviX9yZ5hqlLdsUadq4ovc7zVgM6CHUb0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wZ74n-0004Wy-9f;
	Mon, 15 Jun 2026 13:10:06 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wZ74i-0004Vv-GJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:10:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Kdeb+GboxiNNfknkb03jWdO2NoaP9Lcu6b7fz8YCvTA=; b=O3TOIoI/AjeqdqcTqOnMcguT0m
 xBXpQUlfaDDEw2UyXSvgxEd8Kxjor5tw0jW7BkY3SM2dtt0QUoB1EGv1UF9mkv9iXTt+T9hagIzEF
 BO+2jh1J6rlUWCgKjTsK3jxL6u4u1a1P2m/7Hrf27D8WkXwAcTJhx3HiKDGk4eEQrPoc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=Kdeb+GboxiNNfknkb03jWdO2NoaP9Lcu6b7fz8YCvTA=; b=g
 wK+snonmgjNure9qxuaKvY0KnC6ylQT0FhUB+sUZrZVwscUWGZQui3TMHLHDMMb0T1O9vNCn40gpq
 WCeDF6bC2DwHb1EAlWCcj6EQMd38StScuXBEK5DWpyndGYnhEZ1X3fusPPDXWjpFSZarK6S4zJUpu
 PPDAu/wkXmHSEzLY=;
Received: from mail-koreacentralazon11013046.outbound.protection.outlook.com
 ([40.107.44.46] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wZ74h-0006CB-8v for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 15 Jun 2026 13:10:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Of/NnTTCnbRichTByrl5oMDBTNp1NZgVcdNGK2GTGm3lH0KmsWtC1867OO8f/76+7aybyHxJJJWn99wKv8rrosEMwWiOVKZTkKXDD7ZVTQzYiZkNJtYUQNPA9nqLQZvEOZ36H8Z12wKfWux+c2pZoaD8JqFfxn7+RtGa+1zMjtsU3coVWYnTWMmoz/izBNfHH4zwhsdGAd5IIxMhkZdmnV+/gbqM+hwzrCrazDIQMEjGHXz69hv1MwptjaoyYIRcszdJgUPGB5B/EiJI9dIrZMs43US7mzompG5GkfX2/bs5hxMQOj50WWs053IDBBZTZJHBubGPWf4cZM2CrzDq7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Kdeb+GboxiNNfknkb03jWdO2NoaP9Lcu6b7fz8YCvTA=;
 b=Jyf7zZqkVrxEbX0Scmm1+XO19g6Alw5syHS9r4W/TY7dHrzRgNhkgxSosCgpSy62dCzwjuTl2xuLl6lS/PJLt/GWztFaLH3CMbO6XxcfRacgl+K9kK10yh8bc31RFW3feWLLWJBBrnLEEP6G9CBZXs0Rmr9DxZIHmY9yB0mT8V57P0gEGCqf3rTYIXCFnYW0R7XPk7ie/+KlMQ51jNdUskAriQmkJbM3/Ssi7JZ+HE+xOwZ96ZhdB1z21opZ4G/GoHNHcpTkMDK5mnQ3fKobTitmDxtID1RrTLzouHRT7gpO9QCYswuu7x8cY3CyiR2Z6HNr4/4hroI6t3uM+t+orQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Kdeb+GboxiNNfknkb03jWdO2NoaP9Lcu6b7fz8YCvTA=;
 b=pLBefK0K+09LkyZsNrZn718gwvWgI/t8bLKkLvEc3p2KtMKiFjrvqSdnN6MFz6B3JZsvSmaviFyQu2DyAR6VS4ZlZ/59lrJf8K9LDxZArDO84r/DBaTI+36WVtWQcGH1VNMSimu4I6W+hysTXw+Wq8TUZt86NBlCBbpb3sJX4CdHpyc+1dOw22uW05ap7+Z8EBQgM32Zk6t9LIaNd0b+/FfpctTbrWgmbRecbe2Ig1N8l+4qrsxpPzKmq7Xm26JmVqNrkaVCLrajzAm9qiyIHVgXUexQo1lc93+UMiaI07e6QVfaY24lHSTvoj1cCKjndqd/I9OPon3qmqrDT7/wFg==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by OSNPR06MB8687.apcprd06.prod.outlook.com (2603:1096:604:493::16)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.113.18; Mon, 15 Jun
 2026 12:55:29 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0113.015; Mon, 15 Jun 2026
 12:55:28 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Eric Biggers <ebiggers@kernel.org>, "Theodore Y. Ts'o" <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION),
 linux-fscrypt@vger.kernel.org (open list:FSCRYPT: FILE SYSTEM LEVEL ENCRYPTION
 SUPPORT)
Date: Mon, 15 Jun 2026 20:55:12 +0800
Message-Id: <20260615125517.362294-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TPYP295CA0031.TWNP295.PROD.OUTLOOK.COM (2603:1096:7d0:7::9)
 To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|OSNPR06MB8687:EE_
X-MS-Office365-Filtering-Correlation-Id: 45ae7e33-9c3f-40ef-60db-08decadd6053
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|7416014|52116014|376014|23010399003|1800799024|56012099006|11063799006|6133799003|18002099003|921020|38350700014;
X-Microsoft-Antispam-Message-Info: ebslDmXRpUwWkHedWADOVzCq8W86S9Vui7jotJANVntyPOxUbaGjeEIYimjXsgwwVElxM35Ppvyr0iohgYxmVMTTc01IL8HiI+hL1IM0h3Z+0aWPJ8qMqCDspWx8b7RUC/Jtrqi0L3VP6EDntr+SmmAb/6U8khbRvd/Hg9oSaBA3OH1wRJk5p/Soh1if8oRNL7vZQpuYJcuNyk8UZBAZDeQsOCsuhwi6wvQtooFopc9qm8JDQKvZzB4XtVFP4djSUuY+Q6TjUtuxyGKm3cuJTvQQBjCbME6AQhuvts6ePTghS30Xqn81B0atmb6NkAehqHecYYbDWh0WZxkc4aG1WCIwHY3+mfzz4dMwEVh9/ARaPc/hrl8z6sdLigFbmI0QjfHT/NAhUZsU8VyZzia9k6SiVNzL1UV2AEMzbGgaudbUYQQFRPQ11TODvCn8IkuXIrG31uUXAcoZEeyNwem7P2sIos0XsebFk3BKrAT7fDJsZ+VoVA6QGuiWdhXw2s+HWJWGV0aXAAlPXQTXdt/Pa7diH5VDvbH1TF1HsBIxSfinXaoqUtCsSz5Y5zP/GTP+BVaq70f7VGAGHDxg71/0VRYkgX4YpygauJmrhf9bGeXgfWNKXr6QYY3lilqCztOTerDmJxSltGdZnOt0hyeBWxqexJRumOgDHsvs2mzNXYOsdM+PqI/cpkRBJHx7DlNqlFESrGrrxiqDF0Po5YVFa9JFZFTZCvoRSKYmvDE5kQYXkV9kyOtp4cQKNzh5ZaPvQnrgNfomLAacNVJZsPf5tA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(7416014)(52116014)(376014)(23010399003)(1800799024)(56012099006)(11063799006)(6133799003)(18002099003)(921020)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TbJq+x1fXPftDe7BjtYZvVqGpGsZJQ2rd9bmKmDRxNITzJQzjnXutLRP1GsZ?=
 =?us-ascii?Q?oo8R31OtpjePUbNN6ukCdsHknw0Y+N/Db6n4ZiTNLLREKbDzZ6wMu6r8FTP5?=
 =?us-ascii?Q?xpJzZpqMd6k7qU65YdYWqLFHhCnErEQjTtO7woYcIAwNF4PrYLVcGifIOLjA?=
 =?us-ascii?Q?JigyiutTwNzwojTeemHvkGqvoq+AxZDiJ4bMo4TXgdA4Nesq93GpXvYHGDnD?=
 =?us-ascii?Q?JLLMBdakEHkDKob+b0R1PGs27rDDWqU8pneEkXQh6zNXoNdis1ObTAP24Omw?=
 =?us-ascii?Q?/jbRNbeoyQYM2Rk9aZjzbQ9zFoYywPmHKSZnvblbymIe6I1sXG19oNoYT0T7?=
 =?us-ascii?Q?Wz/+nPXpSkSbwOcQykaLCqJRLAGs84AiGV20pDtCMnBFwE33S5f7CphbaBqH?=
 =?us-ascii?Q?8szIvF7MRKHKoPSZzm/J7Kq5Y7n7MUXLh2nYOtbZJLIgkeZ6Tkdt8kEFttrB?=
 =?us-ascii?Q?SZ7nuT1O8KAzCo/wp7UugJapdRuWeu3lWRo7Ava2JPZisZnSfpAowvsVnkOA?=
 =?us-ascii?Q?lNXsAnx8+YG5uZhIpWUUJyASFsGWzQuBErFRVqTgO6pJUjf0peR3I0WQr1IS?=
 =?us-ascii?Q?7UufVcQo3tMdVhxnzR1bzGVoZuo406crT6bMon1I5xnCoCWh6+jcSCUBRaLO?=
 =?us-ascii?Q?i/XsikIruaE+0xJvSBJBgxSshMXx1KT5PGRKPoUbuCfKW9LSdgvt4I3wAaX+?=
 =?us-ascii?Q?mOjDgWt4EuO1N3xXM3uaQ+CtEh1CCKaVhD32C5a7bTBBQcQLj6OIy0xATDIA?=
 =?us-ascii?Q?cJxUIAzMoiU+hRe75huvw+YnRGJsFFLxIpTRqqjx1dy+qE8dneusWTVMyRha?=
 =?us-ascii?Q?7SyjkLQEk1a18OhBv/Kwzi5il7tEgXQsLy1XsTTrPrmSL26wtrND0Yau6LDI?=
 =?us-ascii?Q?lSh/vqb3IAUQ7KCVwrkdpvsTfDuB45t/rD1GC2QFJ8Ksm8p7Dl/ZtLqJvBVo?=
 =?us-ascii?Q?FSbEX3ybO7e3Sl+fKoyhut2QNHm8Msjqt0MDlR2LQBFAQi2UZpg8y47r3abI?=
 =?us-ascii?Q?pza1k48ciIHW1f4z7bJ0Sis+AGtuzRQBW41Rcgx1BSADaMp5VK9eDg+tedZz?=
 =?us-ascii?Q?a5Fb9fwQBYoRDnvtQwnOCD7MKh2p+ua0DNnkb2MJqJzZyGL7gGmfr9nfHyeY?=
 =?us-ascii?Q?LMJ3jHx9y3e63/KtIIobVecS5m/mBGWv4HenpkENnPykrrQ2ciaM57sjLXup?=
 =?us-ascii?Q?hrQrCZKoE2JhJ8WLYbUpheBVPIU6LeCNRwrsToTnijI5fCIOsuMEwFAHSL57?=
 =?us-ascii?Q?fBqrDGxt0Ij++H3HMpquWEgCgu3ZLJgqnJQ03E0H0kCOI432Rqm3NQuixRlt?=
 =?us-ascii?Q?IpZsxIksWPZPCDYFHslhhLj6rWgy8gYDqdA2oEgTHNxRh6ojhJ6h0xNNN3M6?=
 =?us-ascii?Q?eBIaSMd040MNF5JWf+r0RDLnqZpx17svLEgwEmX4Hye91U0vLi9qic6Q7Av3?=
 =?us-ascii?Q?CUsBsIxv4K4LcE79TidCM5L9X3R4a7W2Cqne5TEBwHRBr4e0FgAnMgsQdROF?=
 =?us-ascii?Q?yi9Ls/gIuCbSLaiYBtD48f/NJC0YCtz/Ua29PRz7Q/L73NGzZ/sEEVdTuXB7?=
 =?us-ascii?Q?Sm1gkegWuedCY0gw6CJfc7P7rvT36SONSD43diWirum2wuH9awU0GROEyprh?=
 =?us-ascii?Q?qagDSarxAisv0foWYDduq6zKoWtFZ5dm6mwGlA7FqTsL8wuMhE0g9pfn70iW?=
 =?us-ascii?Q?9pI7uCg/JHTdzrR9d4zAVI/oZMg1RNqmo2qWMENzlmRY/6maX5VrGVJv9atp?=
 =?us-ascii?Q?5af4Omebww=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 45ae7e33-9c3f-40ef-60db-08decadd6053
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 15 Jun 2026 12:55:28.7455 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aK+O1Mtq6k+WsK5ozche+pbwSIyxJ+afcAQmROWoGsejTbs9kBXh1ERYM8Ylzeje8m6L49D1O1kZd2smevcPTg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: OSNPR06MB8687
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  F2FS currently disables inline data for encrypted regular
 files because the inline payload is stored in the inode block and does not
 go through the regular bio-based fscrypt path. This wastes space fo [...]
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
X-Headers-End: 1wZ74h-0006CB-8v
Subject: [f2fs-dev] [PATCH v3 0/3] f2fs: support encrypted inline data
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
From: LiaoYuanhong-vivo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Cc: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:ebiggers@kernel.org,m:tytso@mit.edu,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:linux-fscrypt@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCPT_COUNT_SEVEN(0.00)[11];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:from_mime,lists.sourceforge.net:dkim,lists.sourceforge.net:from_smtp,vivo.com:replyto,vivo.com:mid]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 366696868F9

F2FS currently disables inline data for encrypted regular files because the
inline payload is stored in the inode block and does not go through the
regular bio-based fscrypt path.  This wastes space for small encrypted
files on Android devices using F2FS inlinecrypt.

This series adds an encrypted_inline_data on-disk feature for F2FS.
With this feature enabled, encrypted regular files may keep small contents
in the inode block.  The inline payload is encrypted before being stored in
the inode and decrypted back into page-cache plaintext on read.

The fscrypt changes are scoped to filesystem-managed data-unit crypto.
F2FS first asks fscrypt whether the inode's key/policy supports this path.
It prepares the software transform only when encrypted inline payloads are
read or written.  Inlinecrypt support is limited to v2 IV_INO_LBLK_64 and
IV_INO_LBLK_32 policies, including the hardware-wrapped key configurations
supported by fscrypt.  Per-file inlinecrypt keys and DIRECT_KEY policies
are not supported for encrypted inline data.

The basic encrypted inline-data tests pass.  The test creates encrypted
small files and verifies that they retain inline data.  It also checks
normal read/write correctness and confirms from the raw inode block that
the inline payload does not contain plaintext.

Changes in v3:
- Support fscrypt's v2 IV_INO_LBLK_64/32 hardware-wrapped key
  configurations.
- Drop DIRECT_KEY support for encrypted inline data.
- Refresh comments and documentation for the updated key support matrix.

LiaoYuanhong-vivo (3):
  fscrypt: prepare software keys for filesystem-managed data units
  f2fs: support encrypted inline data
  Documentation: f2fs: document encrypted inline data

 Documentation/ABI/testing/sysfs-fs-f2fs |   5 +-
 Documentation/filesystems/f2fs.rst      |  30 ++++
 fs/crypto/crypto.c                      |  47 +++++++
 fs/crypto/fscrypt_private.h             |   3 +-
 fs/crypto/keysetup.c                    | 174 ++++++++++++++++++++++++
 fs/f2fs/Kconfig                         |  14 ++
 fs/f2fs/data.c                          |   8 +-
 fs/f2fs/f2fs.h                          |  37 ++++-
 fs/f2fs/file.c                          |  24 +++-
 fs/f2fs/inline.c                        | 134 ++++++++++++++++--
 fs/f2fs/super.c                         |  12 ++
 fs/f2fs/sysfs.c                         |   8 ++
 include/linux/fscrypt.h                 |  24 ++++
 13 files changed, 497 insertions(+), 23 deletions(-)

-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
