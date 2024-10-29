Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3978C9B494F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:12:13 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l51-00042l-A2;
	Tue, 29 Oct 2024 12:12:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4z-00042X-77
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jRN/11OnMc/ec8MSOvFtJFnpQXpJht9mSu/10DP2tCo=; b=fiqF6ex5o5B8vY6tCUToAi6Tp6
 e0zVWVKBFDp5k5pVOfkEmRwH8nJEJBPN3JWOnETo3K1i3MdtoBlN5dir+PmCcFIlSwq539TChf9I9
 17jre+3+dGsxcGlJRIs85PmIhpyAIFG4qTJA17h0AqXOV7f40f+pYjijuiBwYtDlhClw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jRN/11OnMc/ec8MSOvFtJFnpQXpJht9mSu/10DP2tCo=; b=GoX3N9vmUlvEvAsPAWznl0yq5Y
 o68HVfqbPjac+x/hKH8qiypvkV90NyIHaGb881xwH8JyCRQyiNpdABAgOxnJ61/wZ6eu8EzrPDEEb
 Cy4TPdWqZbTpimhAV9FMTzAYuMlii9ilGWFi0DPwvuwZrMhiUcu3W4Nkhr0ATk5/PTIU=;
Received: from mail-koreacentralazon11013051.outbound.protection.outlook.com
 ([40.107.44.51] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4y-0007Sn-TK for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=kitATZSgmBkvdynwHc0sinpP420V2cwpDT8u5UqgU1ayiy083m6LfcgcxMwHfbjdJ2gTVKMs16HrcKCFXPzk33mp6iOCYYtOPFV3b3p6EOH1165zIX5TZjHN2BkiAQg9GjrsQQtkKTVCo8qruH07HAFcOHo3RazF4hEY3Dus15+b64pxW8zFn8Pii7Ezar8TrXBmN2xm9KTfyYnif7zppqu5ZJoM4my+AArJK9WaYm4TVGyTsLyrz63Zeoz3l7kCvLPEd5RFeSa9hWMRtIs3oIjZTLfGJCx42XJAuHPINNPKDgR23FQr0GKS49RP8D+umyr1hZCPZRcXaxQUGxq+yQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jRN/11OnMc/ec8MSOvFtJFnpQXpJht9mSu/10DP2tCo=;
 b=Sxo8r/+OscDX9E0zSrzGSoNIBoZzmwGd0rB1wVGv+afg+86icBdy1s5bqYCoVk9c28Bw+scqd72ZSD1AoWhpDVNawizsDuqTntrC7D6mKBHw+yels7BuHAezucrsYndeW0JtGKwEMJ1T1FyvzlmmAEpNnJu1l0m7JWD0W6t3mRUxuYI3/3FQDvJ0dJwvtWnGOMOQiArKrbxSD1SpkOOjU7yfi7q0iI37euTztPQx0X5Kz/4oIpCaVddsQaoSatEAnzzD1ZnSWX3Fem4B0cYim9giIGyzOxoZFzR7S1z44tzO6+yRyu8KDndTTPWwCczOAB1ZiR2NHowaOrKq8PR3TQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jRN/11OnMc/ec8MSOvFtJFnpQXpJht9mSu/10DP2tCo=;
 b=VGAquNg+jHPiP3mXxFCgSDfsd+Mo8b6mrjj212cSF1wuFe/6iNwHRcrcD5Wr2ioKX/W5vm0RlEFTNYdt6scnhuloADmtFiff449xbVMD4JGGwEnYFrg7HKUktxGkfiZBQcWZhPYOlVBYhozvKznyPVwkkZ8kCqy+0sszaiGSc/Y=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:55 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:55 +0800
Message-Id: <20241029120956.4186731-24-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 0363338d-d31e-4985-24ed-08dcf812e127
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?tFovH/Zv6c4n7uyd20BbXrcoT8Zhp0Famt+KGmoW+d/PfANdbnBJSPBraIhw?=
 =?us-ascii?Q?stU7eNGBSgcC7+370fS/nUFdoWqt7IaqZOoaMJDq1FGSy+IU5Ede0oVYKZI0?=
 =?us-ascii?Q?YbvDD0rD8vMelvcU7AXtWt5TMre0jPX8/oOUzBF9fXv3bAjP7+kUCxN6i9h5?=
 =?us-ascii?Q?Rs4UnAJs40tB1rCHNfZznnlAZ46B9A0k40tfOw51gk90v5mcW1G5TrF+jbsR?=
 =?us-ascii?Q?Semc1JJ6lPt39JlxGxeQDsx3XcZoO9vqimB2jF7h9d0zcqYTVJj/ryCJYC1S?=
 =?us-ascii?Q?72n6fU69SMDJun/4sFvM2U8dxs8DNfmEGrp+GdqE3Q2KOxjva7IZc0jvJYqt?=
 =?us-ascii?Q?l2rjmZUqOcmrXiixBWt8UuN9lRdwK7mix26YVCbpQA6lS82rXoGahf9UF39B?=
 =?us-ascii?Q?jgWH1ZWeJid+sNaYxpdMFJfCjquIdyP1UY+MDXD9tnyNpSAZM4vfhXpFBlsj?=
 =?us-ascii?Q?gJjIywLowY8S7qnVKB8s3C8KpbhUr/yjPHNSbHtS1KLAoPPwCqty0VzjcQ7p?=
 =?us-ascii?Q?NppKKGX67fa3fIxI+vlBSIc3MT7eW9xESThndNZwCDlDJMXyqGWMoceWgPC+?=
 =?us-ascii?Q?ptQtciHt7g/48MME6rnM2DKmIyoZovbnxXz+9Hw+1WDOOtDwl434dJToFxsZ?=
 =?us-ascii?Q?vaZ7vw3n9X+kMMqNDPH/QJsXQ9j8i6NVcynAxjK7emOWAHf6rSla16jE9gXg?=
 =?us-ascii?Q?TFbKrZmgml5eeNyLjnnXGxXiTpILWEd8PqCA3EvIhLZ9SJ0opkKUwXG9mIm5?=
 =?us-ascii?Q?7XBr7Wemg0BAwhQZDOwY9alF7HWILztr16xXGivBuzt075kBAwUiBkfgcAPd?=
 =?us-ascii?Q?eqwSqLFYolxTSLLtm567CTXuP4LDEtKIcAD6hgLJ9wD13kVIhmkeUGdY5k8j?=
 =?us-ascii?Q?X3uHQkJhj5BV9gFXmp294aP5OdUQIiZEVX3+1dAHR9r2x16NZ7WpVMn6x2PJ?=
 =?us-ascii?Q?IzXpYRiN1e8tCfrn6gV0WHbtI+7LNLXcHoOYwMirqjqMZhNTgDmNL0JOcyGn?=
 =?us-ascii?Q?D6H+jK4MqlRC3KNZwXgtgfqEgHDmgYpQXUtF9iIiEclRwXUZwHnPBSFANioH?=
 =?us-ascii?Q?nH4YeMCynDll82+N/jHjEFYCLRrTK5dguHDCfjwwO1zxGsFZUd+p5mkSU6vk?=
 =?us-ascii?Q?CUhukwqyylQSFamy0RaYCnkpNh7i7Qu8BKQipc/Yj0igjjQTS1cuX4ncvSWf?=
 =?us-ascii?Q?kRpsv+BZjbhdDvyFdBAyAz1/kydz8X9jUiQl50xfmt+6fcg1NdQkp+YuYKv5?=
 =?us-ascii?Q?AaaXSNkI6Y4kRg1hNLO79Dw0zj5zZBErtLVL6U7R6sJ9kRJHw909dDRndmFy?=
 =?us-ascii?Q?YfffZwN3QImEgT9rOz0/LXR82cngymcY8tyXPHaVuoxSh1jFLngX6vBrVYQN?=
 =?us-ascii?Q?DjFF9ws=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B5lche5W4csYfKbIfaBN68EO6La2Q13e0AU77MyJb8wCAymXI8NR4WyBDRgD?=
 =?us-ascii?Q?orNALUDSFeb+DCDiIrFTMIrXK2avKcvPyAc46oDGkg7XYXkdczWkIPLXC0D3?=
 =?us-ascii?Q?jqYG6F+IQlTNGtEB3kq7NEEc7F4rW5EXVGtymZOE7diOWHJVqJlx8YmB4zYp?=
 =?us-ascii?Q?aLqX3zOWPTiB0jHlwileQuXvE7oBTc6VSyWEtXBsGeQ6jG5hRQBwD6bVbFA2?=
 =?us-ascii?Q?74/1kzIDYDR7zlgKhffrZL0HnzGOA4XV0qFFy6dXGInqR0+Gwuv9/Va0NHJ0?=
 =?us-ascii?Q?V/V7TSeARux/t/QoWkb+W99Q9wEhN1+/JJvc2WFb7KHrwO80KvjymOOvbWMm?=
 =?us-ascii?Q?WF68X84+B84OYeQXH2o2gvBUdm3vbp0J0tz9QtnCLCreya4w75XleQrjnzgx?=
 =?us-ascii?Q?8923CHKXkuU5So4Nrog2R+hJBGgLOX2EF2w9f3sFOXbfEFgShCB6N0rOCpub?=
 =?us-ascii?Q?abpxqiISBmCWWjks1I4nZB202zvMCiDJUIEQjfQs8Ysi+WQ4QAAlY+JaT0qV?=
 =?us-ascii?Q?Mp4DteeC0CwWbS3ijKm62NZuB4DEVVU+63Dx/b5j1+HDJdczUdXqChwApdec?=
 =?us-ascii?Q?PeKnQVjb/g0k5JWvmBzi9NeYsnseav+JzPpYFxHvwK1DZJ7z/J7MHNAVFuFG?=
 =?us-ascii?Q?QMlad8ISnLqJwaiZ6gtjb0W3DPWpmWwMyhxg7l9WzfvCM/Ij9iBFLZljAJgN?=
 =?us-ascii?Q?Ksi8jBDR8Qy3ZP8AGv6AGWY8jIaxXhRaXklBtnmNXeyqT5639Pm+eeb4FSlE?=
 =?us-ascii?Q?g8xWLxAb9srlNim3TCDvu6Snod7vzoXckhIGwzuR3Vu9vYWzb0s7N8FoLZYW?=
 =?us-ascii?Q?O1zTSxl9wnwe6ZwS6WbUSCVJQVX962ueWgD6Y8TUZoSvxRlp8VsMZ0XL7T9A?=
 =?us-ascii?Q?I5DcRZtFVILQdaRujARsPDKQt1KtirNJAgCIZmt06FUOLJEBKv+Qv8/3Ak6F?=
 =?us-ascii?Q?nPRG4afI/VosWjZYCDP0qOAs6RPN5BzR//TyB66t/6W51tJUlptFhAjZBhq+?=
 =?us-ascii?Q?bINrGTyVus4WROcJ7CfGrWJVm5TCl+30MQKWpL2MjQoskqLwyN0iU7GqlXnB?=
 =?us-ascii?Q?mnCQaY6K6U/9WqGPzGy976T84oy7rGtIcxRjUhW+Dc3MFJ2P86fqRSsz696b?=
 =?us-ascii?Q?mhGMfXh3VJvaMPTMQZk/sD61L6+5cSK3oZHSunlZfx26Vi955YytWt6WhHV7?=
 =?us-ascii?Q?4aBy6HlZVUiawGl0RDw/2g6J7wt3N0A9ykms8WtWH6/D8Z021hEE9wumrPDv?=
 =?us-ascii?Q?Xd+4F3tHJ1jThpTm5S6O3snCSHphCq7L9dKO6ntvGIvxr7GpKRTUw9NL0Yx0?=
 =?us-ascii?Q?BH5hcmhTWY2HN56tOAsZOZmk419QchTDt63pNTf/zSwkDvmODog3Bpk8+Wj4?=
 =?us-ascii?Q?PZD7mJLYoGiZ6e3qRH0THcR/41JvUeMsxQ+12MWJXt0itcAVXM834SQWsa7f?=
 =?us-ascii?Q?CuJKD9YR/C442viK0e2tih/2WE4ii/KoLKLrnO8zPaOqr9IeFKJ5LLWZbrxO?=
 =?us-ascii?Q?b9uVBBHAJ8sykIWmyJgDPjsKAF/jmSOoyyp4ZWS3dUb/+tFPI5hcUfIw8cOV?=
 =?us-ascii?Q?YapicqEsOfBXurlzZgZapFgnVt4k4819IynmxZ4G?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0363338d-d31e-4985-24ed-08dcf812e127
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:55.1996 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hxrcTbSoNyMW1iyiZM0hW/CHJ1y5/Fa1CsGyIJgBbxKJ/dvT9j+V4KFv58/ckQJ7Q8GKVAlzp+tr0qmLi1g0zQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_dentry_dup_dots/README
 | 11 +++ tests/f_dentry_dup_dots/expect.in | 150
 ++++++++++++++++++++++++++++++
 tests/f_dentry_dup_dots/script | 58 ++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4y-0007Sn-TK
Subject: [f2fs-dev] [RFC PATCH 23/24] tests: add fsck testcase of fixing
 duplicated dots
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_dentry_dup_dots/README    |  11 +++
 tests/f_dentry_dup_dots/expect.in | 150 ++++++++++++++++++++++++++++++
 tests/f_dentry_dup_dots/script    |  58 ++++++++++++
 3 files changed, 219 insertions(+)
 create mode 100644 tests/f_dentry_dup_dots/README
 create mode 100644 tests/f_dentry_dup_dots/expect.in
 create mode 100644 tests/f_dentry_dup_dots/script

diff --git a/tests/f_dentry_dup_dots/README b/tests/f_dentry_dup_dots/README
new file mode 100644
index 000000000000..54304051d548
--- /dev/null
+++ b/tests/f_dentry_dup_dots/README
@@ -0,0 +1,11 @@
+1. create f2fs image
+2. mount f2fs
+3. create a directory, and create a file in it
+4. inject dot dentry in the directory by changing its d_ino to the dotdot's ino
+5. fsck fixes the dot's d_ino
+6. inject dotdot dentry in the directory by changing its d_ino to the dot's ino
+7. fsck fixes the dotdot's d_ino
+8. inject dot dentry in the directory by changing its filename to ".."
+9. fsck fixes it by deleting duplicated dotdot dentry and adding a new dot dentry
+10. inject dotdot dentry in the directory by changing its filename to the "."
+11. fsck fixes it by deleting duplicated dot dentry and adding a new dotdot dentry
diff --git a/tests/f_dentry_dup_dots/expect.in b/tests/f_dentry_dup_dots/expect.in
new file mode 100644
index 000000000000..ce2a45c09080
--- /dev/null
+++ b/tests/f_dentry_dup_dots/expect.in
@@ -0,0 +1,150 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_PINO_HEX_] for '.', parent_ino is [_INO_HEX_]
+
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_INO_HEX_] for '..', parent parent ino is [_PINO_HEX_]
+
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_INO_HEX_] for '..', parent parent ino is [_PINO_HEX_]
+
+[ASSERT] (__chk_dentries:x)  --> More than one '..', should delete the extra one, i: 1, ino:_PINO_DEC_
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 0, dotdot: 1
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '.' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+[ASSERT] (__chk_dots_dentries:x)  --> Bad inode number[_PINO_HEX_] for '.', parent_ino is [_INO_HEX_]
+
+[ASSERT] (__chk_dentries:x)  --> More than one '.', should delete the extra one, i: 1, ino:_INO_DEC_
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 1, dotdot: 0
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '..' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_dentry_dup_dots/script b/tests/f_dentry_dup_dots/script
new file mode 100644
index 000000000000..6f6a92cb2843
--- /dev/null
+++ b/tests/f_dentry_dup_dots/script
@@ -0,0 +1,58 @@
+#!/bin/bash
+
+DESC="directory duplicated dot or dotdot"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+mkdir $TESTDIR/mntdir/testdir
+touch $TESTDIR/mntdir/testdir/testfile
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir`
+pino=`stat -c "%i" $TESTDIR/mntdir/testdir/..`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+echo "ino:$ino pino:$pino" >> $LOG
+
+# inject dot's d_ino
+$INJECT --dent --nid $ino --mb d_ino --dots 1 --val $pino $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+
+# inject dotdot's d_ino
+$INJECT --dent --nid $ino --mb d_ino --dots 2 --val $ino $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+
+# inject dot's filename
+$INJECT --dent --nid $ino --mb filename --dots 1 --str ".." $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+
+# inject dotdot's filename
+$INJECT --dent --nid $ino --mb filename --dots 2 --str "."  $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+INO_HEX=`printf "0x%x" $ino`
+PINO_HEX=`printf "0x%x" $pino`
+sed "s/_INO_DEC_/$ino/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_PINO_DEC_/$pino/g" $TESTDIR/expect
+sed -i "s/_INO_HEX_/$INO_HEX/g" $TESTDIR/expect
+sed -i "s/_PINO_HEX_/$PINO_HEX/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
