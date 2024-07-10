Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 28AAB92C7D9
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 03:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRLzW-0000Sd-NR;
	Wed, 10 Jul 2024 01:19:31 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sRLzV-0000SS-8i
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=L1D+drMLeIaMKiEciEHJEbpJrxrCBk8iHlY//84KaaA=; b=CcnWCBzAHWTzc6+66F5PNqJMTk
 pDDMgp4oH0xsweCRWyfYYiZqq35wbs+KKjxWUngSHkR8b5aikvXPLHAwfSqGo+59rhxjS0WOBqiFI
 gyGP75SHPweUg/zK/IS5jQf2dskbvJgnRe1AcQFTSXgUedHH2YBo1EmRvixG6xJFNnss=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=L1D+drMLeIaMKiEciEHJEbpJrxrCBk8iHlY//84KaaA=; b=nNUaAwT3/vS7psSrQIAct74+Vy
 uWQ9YQ3qAHgYFns7zcXVS5NmiWIO0tYv8ZK8VQnbDyiamPOwiFqfqW+RqFCdJqMU8v/24yAGI+TMc
 4x2TCxM4newdSIkp8dpFO226X5vFzpMwdHK1vdIjjHVlmLePjdBzaIfC7MGd9HpA94+Q=;
Received: from mail-tyzapc01on2049.outbound.protection.outlook.com
 ([40.107.117.49] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRLzW-0004qo-2l for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=eT0MSKCHlUytJynp41R9/ZI8lviRvUd0u5U9/J3PYX0OgzGyMmIQv5zp0CRw4z7TbjK4ll3vex1iM53lBwPWmyA2N/d/2nUQiWi62+igrENVkxvlnwBt2a+nuT6cP/iHUvNmWB+Hhur8HWoPdhKHwr1ev8NSiv8T3zc6HwTRzdf6UV5ufvqYJUVCKi4v/I6WJjK/HYB62lS9AVzQtQ3II9A2EBFkRDitXCi4K6FWpdtBP1kWUAajKhj7BSIO0/QHSuicGd7QVIeyHFQnMCe5OWUErBVssE91Xnv7xbY/B2rJ9aT1MEdsIx3wa0D0YdTUBStCg7XAdlnSyCXRCxZnPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L1D+drMLeIaMKiEciEHJEbpJrxrCBk8iHlY//84KaaA=;
 b=IaIn695juYEfTDXomUP3P4KdP9ClnCDESVkskSVAloNlACs3qgyXDvJjpDFJGBPhwocu82Qbh7b11ohPgIaRVelQkyZULRCdG6QhNFcLx9wGuTyMlvFREblsrLEZ5z6n4Kxw2cw2uCq2dzXbWauTQ5d+B/OWOU0KQd+EV3NbyCUugwmCviTIUwemTZdcEQHGhLXpGDS10u57D5d5Xsiz09f7YJ9M+n6YAyhXT9DY2XuNg6Hp4r5Oc2gPWYU6vDlMjvuiSS5UqTY8HrSmPMpxb2XP08HW/yKvx27KlRgw5kxrVl4JKd+XqsqM+MORJETgpJrf5y1G0J13cMA7QdQbYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L1D+drMLeIaMKiEciEHJEbpJrxrCBk8iHlY//84KaaA=;
 b=jqL+7ZKBSRYV3TZVu28Z672sVmlxkltU8KNYsSrYRpzrvOwzC/lxuuaGuXjREhMkXr1f5endZIRaj3dmzqeTwk59eXRDsWzXhJUb9i5CjGcAtAY3H4VhWzQpqD7hP4hN/PkR1FByz1dShRTSMELLtYSFdrG2VO/EmocFAZZ5Ky1Luoi+9UO3sv+xAjCLLSK8tFv+lRUEMbq8c8NsOGz8HxLzBGvnGWnC0DRrnLRVYdRbwxE264/PDkeHF4a7II2pfgpc+3ejYy8MhlWPtaO+m9904fX4kMI1b8BmTmA/PzNULrmpTqDdHJKIza88P3jTVaa68QnJS/96FDzHgB3SKw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6889.apcprd06.prod.outlook.com (2603:1096:990:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 01:19:21 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 01:19:20 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  9 Jul 2024 19:33:05 -0600
Message-Id: <058fdab7474a21ea1aedb3b39179828d43d267c7.1720515215.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720515215.git.bo.wu@vivo.com>
References: <cover.1720515215.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: 089ea007-9ad6-4ea7-1c5b-08dca07e5387
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?f+7PmTata59V5avwSxoFIu5IhCaFCHljws24BZGJ3maF5xMNAkpr/Svg7c85?=
 =?us-ascii?Q?pG+vPkHTcS/gPvJ0G7ZNmvU7a6ssXyb6oRKjAqHRgI1BvZpU5MQWfy00Mf56?=
 =?us-ascii?Q?xC/i5wYF6WfwnQEzvaVrd/t7uziYv7qxRuRRORIQ/NfZ2I6gsF+SfZaWoUjh?=
 =?us-ascii?Q?jvzZQ4lTRmiDIDccAXnvH9iOX2p0LWh9X6iXNj5fpQmf00iBuRxC3ASp+TBl?=
 =?us-ascii?Q?ch8A0uJRYoqqobA4uRiuCi4cysRl/9HP6GTmOKQ5OlaV4L4ILGmGPrOnRPuO?=
 =?us-ascii?Q?aJ5sGoCmBS3yJdvQlnfp52PSPxPM6PS6oOFnap+RqPaXbUYLSkDgf+kdj/Cf?=
 =?us-ascii?Q?13WSajZqG4nWTpADkTsiF7p8Id3w6Y0IStiuNuN9c+ZcNz58Ai8hFgBtBKqS?=
 =?us-ascii?Q?OEi47GBbQSYLOtdcoZDQYqNMl9DyLHi9Yq3OiReFf0H7/KnUDcohlZNiSDLc?=
 =?us-ascii?Q?JF3yuYN7ns/P/JmfwlX3rpyoD7CGEM9sGMmfCOkRfRdpdWBKGOX+YrsdM2de?=
 =?us-ascii?Q?z2bPM8E8bkboE1oyKK2/a2IVxyR2GV4H5JM9KOWbDvTZX3t+OybCfA6z4BjU?=
 =?us-ascii?Q?yj4iP3TOojAz/FldrC8cfiY68+QtmwpXYtRz5+FWpb/tsbHDDHrVpMd6CRwl?=
 =?us-ascii?Q?haN5SDqKc9f5tZQEaQmrKtUdqp02lkry4kulvMQy/GwSEY/Q8W6AG+bcqxC1?=
 =?us-ascii?Q?yaOePhl/svO6eNYsCgNynf4QycdagN8WGzTomh2xHT3Mq2+RiRHGWMJGV1VF?=
 =?us-ascii?Q?dItkhM14cvSUs5Q7lMFw+O5lqFVU2tqqWWzoM0Anzh/u1DTlJQ4GhOvp092T?=
 =?us-ascii?Q?Cyso+bgHRtBTZhKUH154Mq71bYfO/GwYiNrkonKdqe7XNpJKjNf3/IKc1Z2M?=
 =?us-ascii?Q?nErH0clCpQ35bYVDb8E9Hv79vHKksskKaiktd0shrfNv37dptVf01ggrjOj6?=
 =?us-ascii?Q?3lwu0UZHPB7GiIiVCi7s5x3/LApe3YPbkWTaxWEKqp7xdfNyr6pT+dQ9oBe0?=
 =?us-ascii?Q?Y+Du67balH+z8daEJ56VGFYFelVZk/7v6Ky6kPo5QQpwC+jpz66CgTI3x3ta?=
 =?us-ascii?Q?iBJnl9E+QRsYd1fTH02Icx/Sztd3Vab+mA767m2tjWf8I5xUNKPpZYErOSSK?=
 =?us-ascii?Q?cj52FjOOoWUGAkor7Uyf/ZPbduL6J7fR8T3rnMnApqc+xR/EHtr4wKg0A3hK?=
 =?us-ascii?Q?Rp5e4Y1QeCj88X9e/422F7lM1UMCC+I6XmKyiP2tfGVeQmFmnUhjJpAHOFEm?=
 =?us-ascii?Q?48UsLOpvrmcYh7npg3YFETF6gwulykFK/zw8BmqH6WAF2iq7voISO8gKni1g?=
 =?us-ascii?Q?88DzAKXhAJ8QcsZXJYJj0NKpGt/7a5hila0KoF226/X0RtDFC6dxcPSljmKZ?=
 =?us-ascii?Q?QuCmcOAGpNrGJuFWgfQnJNDeQhKReXO8Ab3T6JXCMABqkJaykg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xHIBFgwrgmak8IgXwn5dOPLJHPPAJZSsevUN+cLyPegJzWqcCHuPlClvwe7a?=
 =?us-ascii?Q?MfmdnyzuzURUV52lWiHhmUoEy91Y5oK5eoEuewWa3im6dQVXNAVwStd9cFA1?=
 =?us-ascii?Q?C4dqkgkxDhtD9LvAf+4VjfefGO+2cuzVxto3kIzhQS636K01GQZUhWn3BDeg?=
 =?us-ascii?Q?h4dXM0oFaXQz+Wq36TuxcOCotrLZcQZlnlNK6MiXoa4UlDMGJT7kFzmUo6SO?=
 =?us-ascii?Q?gTOE/0ATT+uLPj1uFvh25xRbExexHrFwwKX6nnzCZo2nBc7ITYTaPM6pryl8?=
 =?us-ascii?Q?jjMTBdyTaLWglS/Dq6lBpNYUrZ4as4SiOMYd6Qi5nEB97KuLAjdjjJEfqbYN?=
 =?us-ascii?Q?lpG2KVMSGeRCAKfWf6OI0dhGlkL8FZMcqtWy4xu8Yi/c2h4DVmpd4AFxHywp?=
 =?us-ascii?Q?+/ahXRR8rQfFSBEzitV9Py0zpe3vMWZ1Cpn9o6WLvm64HCXpMrDFqQY7OyIo?=
 =?us-ascii?Q?KBKkorrzOEPFz5EMO/qhwuQQyDNkJivngJNNkrJi0dIyz3naSBxJcDp5Bk08?=
 =?us-ascii?Q?xRpJmlu6NFG94/pMjsl5/9BUtgvG+S1/14mDQAKoqoYWGTyskj60YKw0tZnM?=
 =?us-ascii?Q?2sASUXelVz1sHg9EHMHPePCv/p2RAJ4mGLXwSE9nu+lGPe2r8IBzEPIkCaPo?=
 =?us-ascii?Q?jr/OZbM/lit/PH03uUvYRbqOR++B4AuYFOeasEbMhifIQlWwIJxisrI5XKDn?=
 =?us-ascii?Q?oFvnPAJDqcGBC0iOAPLywDkTu3nfr+0EShGy75ixHFwJwZexHs6mqx5ndq5B?=
 =?us-ascii?Q?/ykwIqYQBf7QvHS9Y9MuyvIOhFuKRfe6G3wcuqbnCveh8COpbpmC1BnA4tPe?=
 =?us-ascii?Q?SpikHFgcYQ6IokgxdIxRvKFnQG/Z7tyPTm8nAChA100oh7JfoJ3H9/e45U5R?=
 =?us-ascii?Q?oU59+YmanBpsLKJW7chuGQ/SGVrImRMrLQCJGxhwQVHwfV3Wyah2qu2+IBEv?=
 =?us-ascii?Q?MwT2nVSs74Ej7yNh9WQDHvqNPZgqcLBTNJLFn4uG6vlm253/1U3Usqm1r64n?=
 =?us-ascii?Q?wamxxYhoWjgA9pGHAjdxxyLZrXWfi2l8imPNHYhnTWrc3Qp9EG5ZkMzgYl1B?=
 =?us-ascii?Q?QozFrxmcKfHDE+ZPd567wl83O1P1OrGZkOOjgmi6ZWcdajgpWILU4xsHq6qv?=
 =?us-ascii?Q?DYyQeFgJ3iJQXOj+IObEgwr+NlPb3GhlOdNFF0vHjZZIBo0FUSvwMLkn6NF2?=
 =?us-ascii?Q?cn/q11iZ7rCekK0C8wGOxvq1PMUfpTYyJDeoSnECaYk19D36a5sjJFN9gPYG?=
 =?us-ascii?Q?tTvtWxRgCEBLn+C37WomKPH+jB2TTQ39lOYDnrEZFvVWRbe8kJxounjTuOnG?=
 =?us-ascii?Q?ZAB+TOk/KwEYcCPsTZFZpqToU03XdcRCm6Gp4BJovak1CpVYQpeglChYLxTP?=
 =?us-ascii?Q?VwuYdVn7qcnWcTMBL8CIbxy1IhzFwyxoUxQWF+EguZnSb2TFqyl+kEGEq+xH?=
 =?us-ascii?Q?KzIDR9Qg6RF8g21GY6pC5SGtubpyIlk84SlSuQSIMWDSDRzkXIKvswj2E7z2?=
 =?us-ascii?Q?s8Gb3Rz+o6uR49DWC68UAVkBiiJif5d+Wj8sCx8ZH2tDRY9pKv3zFB9kBd+N?=
 =?us-ascii?Q?bS4Sc73o0AkE/0OddJx+0g4qQFod6VBFMiXtoOHs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 089ea007-9ad6-4ea7-1c5b-08dca07e5387
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 01:19:20.8848 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ki8BESFgk8JmSdwsZAAM440cuogx2J4a6hRomyvil5tLyaMX37AW9+vbSxZ5Lc068Yqzvl0y/QzPlj54+O1Q0A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6889
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As f2fs inline data is a special case of inline tail, we can
 expand inline tail based on inline data. If file tail can inline to inode
 block, not bother to pre-allocate block at write begin. When tail page writing
 back, inline it or normally write it if the tail is oversize. And when inode
 page writin [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sRLzW-0004qo-2l
Subject: [f2fs-dev] [RFC PATCH 3/5] f2fs: implement inline tail write &
 truncate
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As f2fs inline data is a special case of inline tail, we can expand
inline tail based on inline data.

If file tail can inline to inode block, not bother to pre-allocate block
at write begin. When tail page writing back, inline it or normally write
it if the tail is oversize.
And when inode page writing back, update inline data from tail page.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 30 ++++++++++++++++++++++++++++++
 fs/f2fs/f2fs.h   | 16 ++++++++++++++++
 fs/f2fs/file.c   | 10 ++++++++++
 fs/f2fs/inline.c | 38 +++++++++++++++++++++++++++++++-------
 fs/f2fs/node.c   |  6 +++++-
 5 files changed, 92 insertions(+), 8 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index b9b0debc6b3d..2481da74c13d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -2769,6 +2769,7 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	loff_t psize = (loff_t)(page->index + 1) << PAGE_SHIFT;
 	unsigned offset = 0;
 	bool need_balance_fs = false;
+	bool need_clear_tail = false;
 	bool quota_inode = IS_NOQUOTA(inode);
 	int err = 0;
 	struct f2fs_io_info fio = {
@@ -2860,6 +2861,16 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 			goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode) && page->index == end_index) {
+		if (support_tail_inline(inode, i_size)) {
+			err = f2fs_write_inline_data(inode, page);
+			if (!err)
+				goto out;
+		} else {
+			need_clear_tail = true;
+		}
+	}
+
 	if (err == -EAGAIN) {
 		err = f2fs_do_write_data_page(&fio);
 		if (err == -EAGAIN) {
@@ -2882,6 +2893,11 @@ int f2fs_write_single_data_page(struct page *page, int *submitted,
 	if (err && err != -ENOENT)
 		goto redirty_out;
 
+	if (need_clear_tail) {
+		err = f2fs_clear_inline_tail(inode, false);
+		if (err)
+			goto redirty_out;
+	}
 out:
 	inode_dec_dirty_pages(inode);
 	if (err) {
@@ -3386,6 +3402,11 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
+	} else if (f2fs_has_inline_tail(inode)) {
+		if (!support_tail_inline(inode, pos + len)) {
+			f2fs_map_lock(sbi, flag);
+			locked = true;
+		}
 	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
 		f2fs_map_lock(sbi, flag);
 		locked = true;
@@ -3414,6 +3435,15 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode)) {
+		if (support_tail_inline(inode, pos + len)) {
+			f2fs_do_read_inline_data(page_folio(page), ipage);
+			if (inode->i_nlink)
+				set_page_private_inline(ipage);
+			goto out;
+		}
+	}
+
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
 						 &dn.data_blkaddr)) {
 		if (locked) {
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 4595b6fa3714..ca43396df4df 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -3323,6 +3323,21 @@ static inline int f2fs_has_inline_dentry(struct inode *inode)
 	return is_inode_flag_set(inode, FI_INLINE_DENTRY);
 }
 
+static inline bool support_tail_inline(struct inode *inode, loff_t i_size)
+{
+	const pgoff_t tail_index = ((unsigned long long)i_size) >> PAGE_SHIFT;
+	unsigned long tail_len = i_size & (PAGE_SIZE - 1);
+
+	if (tail_index > COMPACT_ADDRS_PER_INODE)
+		return false;
+	if (!tail_len)
+		return false;
+	if (tail_len > MAX_INLINE_DATA(inode))
+		return false;
+
+	return true;
+}
+
 static inline int is_file(struct inode *inode, int type)
 {
 	return F2FS_I(inode)->i_advise & type;
@@ -4183,6 +4198,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
 int f2fs_convert_inline_inode(struct inode *inode);
+int f2fs_clear_inline_tail(struct inode *inode, bool force);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
 int f2fs_write_inline_data(struct inode *inode, struct page *page);
 int f2fs_recover_inline_data(struct inode *inode, struct page *npage);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 5c0b281a70f3..19d65ef0fd00 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -708,6 +708,9 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 		goto out;
 	}
 
+	if (f2fs_has_inline_tail(inode) && f2fs_exist_data(inode))
+		f2fs_truncate_inline_inode(inode, ipage, 0);
+
 	set_new_dnode(&dn, inode, ipage, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
@@ -4648,6 +4651,13 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 			return ret;
 	}
 
+	if (f2fs_has_inline_tail(inode) &&
+			(pos + count > MAX_INLINE_TAIL(inode))) {
+		ret = f2fs_clear_inline_tail(inode, true);
+		if (ret)
+			return ret;
+	}
+
 	/* Do not preallocate blocks that will be written partially in 4KB. */
 	map.m_lblk = F2FS_BLK_ALIGN(pos);
 	map.m_len = F2FS_BYTES_TO_BLK(pos + count);
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 7638d0d7b7ee..8c1636c1ff2f 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -84,6 +84,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 {
 	void *addr;
 
+	from = from & (PAGE_SIZE - 1);
 	if (from >= MAX_INLINE_DATA(inode))
 		return;
 
@@ -138,11 +139,12 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	};
 	struct node_info ni;
 	int dirty, err;
+	pgoff_t index = page->index;
 
 	if (!f2fs_exist_data(dn->inode))
 		goto clear_out;
 
-	err = f2fs_reserve_block(dn, 0);
+	err = f2fs_reserve_block(dn, index);
 	if (err)
 		return err;
 
@@ -158,8 +160,8 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 	if (unlikely(dn->data_blkaddr != NEW_ADDR)) {
 		f2fs_put_dnode(dn);
 		set_sbi_flag(fio.sbi, SBI_NEED_FSCK);
-		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[0]:0x%x, run fsck to fix.",
-			  __func__, dn->inode->i_ino, dn->data_blkaddr);
+		f2fs_warn(fio.sbi, "%s: corrupted inline inode ino=%lx, i_addr[%lu]:0x%x, run fsck to fix.",
+			  __func__, dn->inode->i_ino, index, dn->data_blkaddr);
 		f2fs_handle_error(fio.sbi, ERROR_INVALID_BLKADDR);
 		return -EFSCORRUPTED;
 	}
@@ -192,10 +194,33 @@ int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page)
 clear_out:
 	stat_dec_inline_inode(dn->inode);
 	clear_inode_flag(dn->inode, FI_INLINE_DATA);
+	if (index >= COMPACT_ADDRS_PER_INODE)
+		clear_inode_flag(dn->inode, FI_INLINE_TAIL);
 	f2fs_put_dnode(dn);
 	return 0;
 }
 
+int f2fs_clear_inline_tail(struct inode *inode, bool force)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct page *ipage;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage))
+		return PTR_ERR(ipage);
+
+	f2fs_truncate_inline_inode(inode, ipage, 0);
+	clear_page_private_inline(ipage);
+
+	if (force || end_index >= COMPACT_ADDRS_PER_INODE)
+		clear_inode_flag(inode, FI_INLINE_TAIL);
+
+	f2fs_put_page(ipage, 1);
+	return 0;
+}
+
 int f2fs_convert_inline_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
@@ -243,20 +268,19 @@ int f2fs_convert_inline_inode(struct inode *inode)
 int f2fs_write_inline_data(struct inode *inode, struct page *page)
 {
 	struct dnode_of_data dn;
+	pgoff_t index = page->index;
 	int err;
 
 	set_new_dnode(&dn, inode, NULL, NULL, 0);
-	err = f2fs_get_dnode_of_data(&dn, 0, LOOKUP_NODE);
+	err = f2fs_get_dnode_of_data(&dn, index, LOOKUP_NODE);
 	if (err)
 		return err;
 
-	if (!f2fs_has_inline_data(inode)) {
+	if (!f2fs_has_inline_data(inode) && !f2fs_has_inline_tail(inode)) {
 		f2fs_put_dnode(&dn);
 		return -EAGAIN;
 	}
 
-	f2fs_bug_on(F2FS_I_SB(inode), page->index);
-
 	f2fs_wait_on_page_writeback(dn.inode_page, NODE, true, true);
 	memcpy_from_page(inline_data_addr(inode, dn.inode_page),
 			 page, 0, MAX_INLINE_DATA(inode));
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index b72ef96f7e33..5c45de7f60a1 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -1514,6 +1514,8 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 {
 	struct inode *inode;
 	struct page *page;
+	loff_t i_size;
+	pgoff_t end_index;
 	int ret;
 
 	/* should flush inline_data before evict_inode */
@@ -1521,7 +1523,9 @@ static void flush_inline_data(struct f2fs_sb_info *sbi, nid_t ino)
 	if (!inode)
 		return;
 
-	page = f2fs_pagecache_get_page(inode->i_mapping, 0,
+	i_size = i_size_read(inode);
+	end_index = i_size >> PAGE_SHIFT;
+	page = f2fs_pagecache_get_page(inode->i_mapping, end_index,
 					FGP_LOCK|FGP_NOWAIT, 0);
 	if (!page)
 		goto iput_out;
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
