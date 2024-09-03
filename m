Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB44969657
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 09:59:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slORT-0005s4-Kd;
	Tue, 03 Sep 2024 07:59:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slORR-0005rt-0F
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 07:59:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=+jRKx7hY4qonITtYO90UyzC+Ab3adq+ZL72q8/CeOmY=; b=V3jg07nWGjdi8+e+GlElIaJabs
 gxASEoki1ZQS4dSxObeqQYRwCnVDxfW2Z0RaOt8CzVp/QvYFUot3BC00YH+akltPRxueAw4J77nZh
 ypolxHggTNAVoQMu2e8dsjGdvz85nEoi5K6p+9WUGShTDBwwqNTgsRQO0tegMJwNpLWE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=+jRKx7hY4qonITtYO90UyzC+Ab3adq+ZL72q8/CeOmY=; b=L
 JXFBgs0L2YS7vwm56hSgOvj8kiO0oncGBtdM9Hw2PGcyfH2QP9u931tEmjjWWdyaI3xwIfsLx19JT
 vBqC1nj8sTtvDkc1m62XAHMO7n86KHF7ou3YSNUkGSB/IArDnQTWBWzxZGoSkET6/1tySlJoS/x4b
 UF6wmYPKazY5yijA=;
Received: from mail-psaapc01on2089.outbound.protection.outlook.com
 ([40.107.255.89] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slORP-0004Th-Dt for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 07:59:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=alhzT4YGATNUv07C7yA8SZIblDcz5mrK/VrMuI9CZ2Y4/7sCvEVVXISxFOYwB0meSL5rZAh3a0Hen3e8cMoyuEDDtK+SWnLGc9bRkvEqXn4r7HOW7qHxrrTCD7nB+5o6xEjyrJsWPwtK8z5/AxyNSjGM/Q57v/FXJ32e3Py1uvevgzHEv1I0uM1thyRdpswY1FQ1pmbrnqSwHbaCchXg0kA20xEtCgbUMs8sy+WW2c3RCzWZP4cWD7KzeBKeYMb42yYlZjvXereXL/LAXi2zn2cXydDvTYUoDIjLW6Ttt3+683jlPJ+ujy40OLWJT/ctTvTM9Ptq3Dj16qKEOBMF7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+jRKx7hY4qonITtYO90UyzC+Ab3adq+ZL72q8/CeOmY=;
 b=H7pK3l7pawZD4CyB3Bi/jNERUWPZl2nE/JW9QN97ZpOUpG4QSlugRq+B+BfXCYy1yaA6s+0LceZ5a6KKJYzTXGop4KNkHbjP7jd6qpYxo56ER0HaZ+DBpxnVCHpTI/YTwMpAjQXMs8VRZ6u98AS7Jev56TqLhicd33UG0D4bIUy0F+jbJ4YkOdURzK2sMZlwPVykTVlZSdAEMGELXMG+ruruh0RibR/LAlKq1q2tz/zkVifbFE7UjLivEgpA9LcL5qGv5vuMNJr1HxACo32M7eNb9WVT+0utL34m6cBJjByVVKUaoGmFVF7Vnp1q+TTOAvwxJKIM69GdCeMbvi5aIA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+jRKx7hY4qonITtYO90UyzC+Ab3adq+ZL72q8/CeOmY=;
 b=j1vkkRfBbWttXBmsRd2Fc3EOvePSAUPKRUHHEDCyLOrT5ef0VBtK1n749ZXW8muDhPg7+34mPnIh6ntm8QBcBSRHsVcWfZSwGU5Y2k+fU/o6OLuMvV0NdB4UbDVeVJSIr9iYrGnHp01qq6NQdtg5vZXWkIjNQEZxRJOMw8CtmTkazmuo7HGVFZnmJh6jLd6dZ78KQcrX/h8gf4JzVReHSEOTg4sgAVhcTx0esHa9DGaciEx8UxNcSTAuh4wRFHjutKR+Za1dkTvJCXGFqcFxARyXdxBTGeatZkFh2lJrzGHS1+CLCgY6LDlEFpXtO/u2ig8qVt5rAYkyLIfiDDB1Mw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TYZPR06MB5759.apcprd06.prod.outlook.com (2603:1096:400:269::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 07:44:18 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 07:44:17 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 01:59:31 -0600
Message-Id: <20240903075931.3339584-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SI2PR02CA0015.apcprd02.prod.outlook.com
 (2603:1096:4:194::16) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TYZPR06MB5759:EE_
X-MS-Office365-Filtering-Correlation-Id: 642bec85-42b1-455a-bb4e-08dccbec36df
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?qMy/7wcTL9xMnj666/MtGGgZUVrLBdM5bX6wJ+/aFSxv5q8smHimtwU7qi6a?=
 =?us-ascii?Q?6nlFHY9wcNE8H/Z9FvE5zYdRR5tkvGIsX1trzAU79J82i1qj6GCUFtgDldDq?=
 =?us-ascii?Q?eTHDWDuP6zUoWpy7MaePq51lNC5WNLkp/sS4IQWOh8BjT4pSp0RALJKa0X/o?=
 =?us-ascii?Q?R4L+K3i3f6zNf41/ev3K0xawERGF9/JVMXHXHxO7geOOyggE+acn26oxBfBk?=
 =?us-ascii?Q?PbAtY043ayjK9O7WNa/XClngK4E3CS8fAwaK1NZWamu/ArFR91ycKQ9NnWyt?=
 =?us-ascii?Q?evFClrJaIKG4CcoSBv0uAvdTAXAwDc9rg244BdiAmLUmlxnDjKvoxXqZuIMB?=
 =?us-ascii?Q?Wp/N2HE5bqXQcK4X3OP3JVQjqDl07wS2CuQ2XaGdG6+TSmawrtWcD35Ap8AE?=
 =?us-ascii?Q?4oRbBD3/6qAYn7uFd5d1Ghltg+W1NXXZ+9m5gL1eMPdyZqs+/pei1G80BqOs?=
 =?us-ascii?Q?EyIdvZfvrM+wI3JzLqrB8jT6OYnGUOAGKWCasV3uuf33JHXWtfsCxgyt3nCL?=
 =?us-ascii?Q?qWW+oABHI9j1+xaT+V8KAZT1P1+J4dp7VB/XQzx7g8TXha7EQmB8fdGZwEME?=
 =?us-ascii?Q?llNyeFWBv3shtrSyKCmVDGmFhLykt7vsyDqcLSLxvxMGdQ2J3CVtxPogrZ5h?=
 =?us-ascii?Q?o2T4oKIqbaXFQ6fkS1jmaPqGBQ3wkB0wfU9VULp2Uxn9UUJHyWcQ7jaNx6x7?=
 =?us-ascii?Q?0bgvOPxOvTWi/t1hTVvFt/ch1bW2l9RVGZXJRulWtRMoiaHjzZV/XvzYjUdL?=
 =?us-ascii?Q?cPQitCHIMH0AdSUDBgEqKaX1NeblcVnk0TK5MYC7HASWaCa/fdOhOKUVbT++?=
 =?us-ascii?Q?sCmRtwOv8pBJLH4vDSHwwNZmwSnlQumjH3OyhzLF71YKdm5iVpHbnf2izCMf?=
 =?us-ascii?Q?2jqJguuacrN0wczVM15iwDUINq8HRLQxm3SfTO4c+4bJsm2nuP18Y2QaNQdi?=
 =?us-ascii?Q?cXNcz2DphHUlozFrU+QAZWfvjKbCTRMKzGK5SdkuqHxxY/i0Jk63cKgAKhxv?=
 =?us-ascii?Q?GSPnE02rXDJSUnX0q9s63pRvNKB0BP2dXs6J5FnYLgOaJG9pHNWqEGZOlcxb?=
 =?us-ascii?Q?m/oJjsk5USNkSqnCNkHtsLxAmhUv+J7OnxFxMFIUYd2eIviKjN3jtVxLdMxy?=
 =?us-ascii?Q?EWi7k4ugf+br5mjUVzojESGE7QIws7JFBZb96B0DG8Mo6md7wDC2J18gSD0O?=
 =?us-ascii?Q?Pt2MxVNoGjE5mx0FPaD0ORw6dNV8StvOCihteqOYesRCbUuX5Cbquv5q5P05?=
 =?us-ascii?Q?glkXMn9Lp6mMzXhzSIGWdIjOVjlk7ESp7U590BBgZNg/EN34/G9G/TTy7pvV?=
 =?us-ascii?Q?faREKlN3VBAkAErqxTlI9AvyIiFP+d0IIuHes9YD8GvTNYKo43x+EzszZaBl?=
 =?us-ascii?Q?oM6goHPY4+DinQAAwjpRY97KMChW4kIk5rJPOG4NQ2WSsFSz7w=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?pfk73yvuqvcLL3V10ATmlP1RQaHYK0H/AAkD7sd4wIEVYhuN8FC8NFtEkWXy?=
 =?us-ascii?Q?b4dYrDFQxlJ8asaAF8SMo8Sd5Ty5iT70JmMmehJyTHWd59kOuQKdCUj8tQOZ?=
 =?us-ascii?Q?p1cH4KcMui907uuDD+229r2CKfJ/dLdUmqBTz3JCerUS6ie20ByeNUJEJ0Jl?=
 =?us-ascii?Q?BmDEe9Ean5dW5n2qq3oXkWWa89rsQSEW/Tz09iPSGjOqQb1yt7Yuq27Ka3ta?=
 =?us-ascii?Q?DIzquI/SY4v83ajVKl1P/GYaTzL3ikmAHFBFSNji7x64095VJn/5w9JMRbnW?=
 =?us-ascii?Q?9u4cvX6xHgiGFdJdJBs+7yMwvKHBybBw7ID4T5Gk2y4nTNzEfqRFnTBt2dPI?=
 =?us-ascii?Q?hBwbqPmvCwvF4Ku0S8SVkJ7Z9rUJo4SUXQG3qQfFQ5hVwczMwk4JxQhNPfm/?=
 =?us-ascii?Q?9mFMw4He9elJ8wih2J8svfDsQCPaGHWLVtPKhEA/2jNMbZYM/bB+kG4+R1qC?=
 =?us-ascii?Q?RZSNzNOGolhuUkj+loeNCvTnW2YtpwJhCFzcsBeUxboeeHnWqTIc9YdKet5h?=
 =?us-ascii?Q?tUEJia+xBX66fyUMYKqK0tnX71BTguZySvO0FjcQeH1EmVMFKgbx+GtReAoz?=
 =?us-ascii?Q?flBAvq5WAWyeyolby5BIEoo2FHqHchbOJe1WJYQYmOFLH5VJN6e9/dD9oSvT?=
 =?us-ascii?Q?wvN0DAZQbfPmJa10Ub5hr09QQmAgXlOvqkqSdoy68rLtmr/duBZbz3Oi0U4C?=
 =?us-ascii?Q?+i8pqxgvhsyPQuH8zld31RctEmvqrJV2brFoJYVLjFuMwCiLxMMf+u2u4xVX?=
 =?us-ascii?Q?XwvZ8SLbtHPgy3sTlMKvOSt8GivTFInvWjxmRUV+6t3FIA97u3vTu+vz13Y0?=
 =?us-ascii?Q?bMiktz7Pdf6D2zpEWLEP7VQt5uVXBvQ5DD47uO5JYoymfJMgL8ifL0lQJtyi?=
 =?us-ascii?Q?KgzlYIQu2/sn/QOlsOY8TaPndFcjSomtFsmk2FP5CRT1QjyYMC++bfO1qmKk?=
 =?us-ascii?Q?eQGEIVIRQkUHLPt2eUl5aWeDG6Bi3XjFJX1eiso78ydpArC2dlyRNZ5p+ytQ?=
 =?us-ascii?Q?LbCwCYVAYmPJ0X3NLtgdvyt2wRJaY2OlW7CJDsy3zExmfItlwukaft82GE4U?=
 =?us-ascii?Q?8wVUbHXd9fL2C8g4UHKkcR0jf1pH7dAq0nUA8I4+9cIjCWNs2TK4k12UmiGF?=
 =?us-ascii?Q?39c5xilI35iciD50M0x26HxJNxFTU/ui80oa8kWqDmSIIoa9Sv5KQsvTtS30?=
 =?us-ascii?Q?5wXubGwfbfKUcFbps2AB9oYOAyu+dNvlswrKQBXnK4er2zJhdAKOiHH6u+8i?=
 =?us-ascii?Q?o5Vb/dyVbKQmyry76rmtQVZluy/9/SavUYCplSM0DLDu0oosI9bJHs5V1TrF?=
 =?us-ascii?Q?Pi34z5Tzv1RKomRrdDJ0hEzdVxzAuTBP92kPX7j/JPrwpmNUYEoRCNwLtTt5?=
 =?us-ascii?Q?WzouOIHaeFj6y9zIHpSEsS3m3vTZwlx4cEHlDUPf8OihP/wrrgOJ51Fuu0IE?=
 =?us-ascii?Q?nHrj98ayr/0iC5jvFyA6PNdkMDW+i8dMJKP+jc8RehYZHrNbAQ9yVjFmZNPy?=
 =?us-ascii?Q?5UhCIVLxZwhAr30ayn517Km9Aaewl092jeN/VoYhMVWCkuIJ1ioG+kItqVnh?=
 =?us-ascii?Q?GCkroAyCwIwDfltNPZrS/QXsf3kzkD9qikIFGpYT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 642bec85-42b1-455a-bb4e-08dccbec36df
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 07:44:17.6312 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7SWVMXogzE5lMqBLUpPOc1yasuy5mokX3rc7XlLuejfhQpidVZxhGeUa7uxIHlDOntHrEeTXJE/uADtk25i5EQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5759
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  To maximize the utilization of inode space, we introduced
 the inline tail feature. This feature modifies the inode structure, requiring
 support from the f2fs tools. The inode layout /w inline tail: | inode block
 | 4096 | inline tail enable | | | ---- | | | inode info | 360 | | | | ----
 | [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.89 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slORP-0004Th-Dt
Subject: [f2fs-dev] [PATCH] f2fs-tools: support inline tail
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

To maximize the utilization of inode space, we introduced the inline
tail feature. This feature modifies the inode structure, requiring
support from the f2fs tools.

The inode layout /w inline tail:
| inode block     | 4096 |     inline tail enable    |
| --------------- | ---- | --------------------------|
| inode info      | 360  |                           |
| --------------- | ---- | --------------------------|
|                 |      | extra info         | 0~36 |
|                 |      | **compact_addr[16] | 64   |
| addr table[923] | 3692 | reserved           | 4    |
|                 |      | **tail data        |      |
|                 |      | inline_xattr       | 200  |
| --------------- | ---- | --------------------------|
| nid table[5]    | 20   |
| node footer     | 24   |

Change-Id: I1b7bc47f4567a6b6d433379e80ca1e76d678a104
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fsck/fsck.c       | 24 ++++++++++++++++--------
 fsck/fsck.h       |  1 +
 include/f2fs_fs.h | 14 +++++++++++++-
 3 files changed, 30 insertions(+), 9 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index a18bee9d0c3b..a794b8661ed7 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1123,14 +1123,22 @@ check_next:
 	}
 
 	/* check data blocks in inode */
-	addrs = ADDRS_PER_INODE(&node_blk->i);
-	if (cur_qtype != -1) {
-		u64 addrs_per_blk = (u64)ADDRS_PER_BLOCK(&node_blk->i);
-		qf_szchk_type[cur_qtype] = QF_SZCHK_REGFILE;
-		qf_maxsize[cur_qtype] = (u64)(addrs + 2 * addrs_per_blk +
-				2 * addrs_per_blk * NIDS_PER_BLOCK +
-				addrs_per_blk * NIDS_PER_BLOCK *
-				NIDS_PER_BLOCK) * F2FS_BLKSIZE;
+	if (node_blk->i.i_flags & cpu_to_le32(F2FS_INLINE_TAIL)) {
+		DBG(3, "ino[0x%x] has inline tail data!\n", nid);
+		child.state |= FSCK_INLINE_TAIL;
+		addrs = COMPACT_ADDRS_PER_INODE;
+		if (cur_qtype != -1)
+			qf_szchk_type[cur_qtype] = QF_SZCHK_INLINE;
+	} else {
+		addrs = ADDRS_PER_INODE(&node_blk->i);
+		if (cur_qtype != -1) {
+			u64 addrs_per_blk = (u64)ADDRS_PER_BLOCK(&node_blk->i);
+			qf_szchk_type[cur_qtype] = QF_SZCHK_REGFILE;
+			qf_maxsize[cur_qtype] = (u64)(addrs + 2 * addrs_per_blk +
+					2 * addrs_per_blk * NIDS_PER_BLOCK +
+					addrs_per_blk * NIDS_PER_BLOCK *
+					NIDS_PER_BLOCK) * F2FS_BLKSIZE;
+		}
 	}
 	for (idx = 0; idx < addrs; idx++, child.pgofs++) {
 		block_t blkaddr = le32_to_cpu(node_blk->i.i_addr[ofs + idx]);
diff --git a/fsck/fsck.h b/fsck/fsck.h
index a8f187e07fe6..db7791ce7016 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -28,6 +28,7 @@ struct quota_ctx;
 
 #define FSCK_UNMATCHED_EXTENT		0x00000001
 #define FSCK_INLINE_INODE		0x00000002
+#define FSCK_INLINE_TAIL		0x00000004
 
 enum {
 	PREEN_MODE_0,
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 15a1c82ae18f..e7c548ef3c2a 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -666,6 +666,7 @@ enum {
 #define F2FS_IMMUTABLE_FL		0x00000010 /* Immutable file */
 #define F2FS_NOATIME_FL			0x00000080 /* do not update atime */
 #define F2FS_CASEFOLD_FL		0x40000000 /* Casefolded file */
+#define F2FS_INLINE_TAIL		0x80000000 /* Has inline tail */
 
 #define F2FS_ENC_UTF8_12_1	1
 #define F2FS_ENC_STRICT_MODE_FL	(1 << 0)
@@ -962,7 +963,7 @@ static_assert(sizeof(struct node_footer) == 24, "");
 				(DEF_ADDRS_PER_INODE -			\
 				get_inline_xattr_addrs(&node->i) -	\
 				get_extra_isize(node) -			\
-				DEF_INLINE_RESERVED_SIZE))
+				get_reserved_addrs(&node->i)))
 #define DEF_MAX_INLINE_DATA	(sizeof(__le32) *			\
 				(DEF_ADDRS_PER_INODE -			\
 				DEFAULT_INLINE_XATTR_ADDRS -		\
@@ -1400,6 +1401,7 @@ struct f2fs_dentry_block {
 
 /* for inline stuff */
 #define DEF_INLINE_RESERVED_SIZE	1
+#define COMPACT_ADDRS_PER_INODE         16
 
 /* for inline dir */
 #define NR_INLINE_DENTRY(node)	(MAX_INLINE_DATA(node) * BITS_PER_BYTE / \
@@ -1660,6 +1662,16 @@ static inline int get_inline_xattr_addrs(struct f2fs_inode *inode)
 		return 0;
 }
 
+static inline int get_reserved_addrs(struct f2fs_inode *inode)
+{
+	int size = DEF_INLINE_RESERVED_SIZE;
+
+	if (inode->i_flags & cpu_to_le32(F2FS_INLINE_TAIL))
+		size += COMPACT_ADDRS_PER_INODE;
+
+	return size;
+}
+
 #define get_extra_isize(node)	__get_extra_isize(&node->i)
 
 #define F2FS_ZONED_NONE		0
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
