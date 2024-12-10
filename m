Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E64DE9EAAAD
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Dec 2024 09:29:14 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tKvc9-00021K-Lj;
	Tue, 10 Dec 2024 08:29:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tKvc7-00021B-Uj
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 08:29:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=q+SAZQswD+sWPjsYSJayxIdoK3eMB9BkRfjdxEU0Y3A=; b=Xjpg8AVVngMSjMz6O+693ZMSIK
 sj7qyxxk3P5cb1FSOBhwrDwJg5Z8JTOKMVKsOsTniDKYrWXdqExkfZMf8/rIA91loMhB8VNxLBCYa
 IQ/lvXsX6Y7IvfW3pbXpZMImnPeNxu69ky1icf/MPeP9Icah3Bp995aejuYRPdVHcpeA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=q+SAZQswD+sWPjsYSJayxIdoK3eMB9BkRfjdxEU0Y3A=; b=j
 WFjNu1jCM62W/xctgQuDdaIDy1ELpKvrPNRfi168RmOIzAL0GSRUb9CSrxqNMkpdnFOIdxdAs2Ui9
 T5ngV7plzzinspjAyVM2hdQ0N9CKS8m1kXfpK+42PuEmt5tiPWdAc1q65VbADrpdknX1IZgkqU7Sg
 PLxsBbSJf24kuhMo=;
Received: from mail-psaapc01on2065.outbound.protection.outlook.com
 ([40.107.255.65] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tKvc6-0006Ls-FQ for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Dec 2024 08:29:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yvLUU/ky4NGI7GbANqnT8/r4s8lr+F8mdEs+56yDm0vNKgKV/CK7uIIqoO7GRCQ29wzGeqy3CBKBlI3R6fo1WDajsiM0wwndLMwD/RiFnr6SMe5vs6uE620C/R4033+DHceOExu3DhNZbKtbrnz9YhikpdXR8wNevCQsuiNkCICxz3MHKyfW6DfYfmzZwbFBOK+ih1Om0G53gmV0V41XWfjjp1JrWvcvnUhtU1lRdnID9I/1HMViNkWz+Y12d6Bq/HvcE+bhHZZ2Q+GT2UHwxbsLIYI3OL9UQkuvkcsLcj30KMzOHf+oITRwKjFSq2OFQ96h2C52H6CpPtL9nI62eQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=q+SAZQswD+sWPjsYSJayxIdoK3eMB9BkRfjdxEU0Y3A=;
 b=d6B8V4dQ3FqxN3DqYXPsxE7bvxbvQhCF4XshGeXQHNo8lPbxWVrfvQiy3S02KjaZlumHhts1LJ0uCNAEI4PJ9aqGvQNIdIrwE3XbBItgwRNtG+RzNa5IvCettcYjKzv0ORAFCXg6Ah2waylQ4ZTBB6nEcrIe9J1A6O7iiC1bOBZR09xdtkdxeneAF1Ky+tayEoJomAu92hFQMJQ9C1FRRh8smKlfKgi3IH+UY0WiZNMnU6Udg3NgRc9ZJd4nf7KWbyJKhKKiIouRADN404vcGpmmrv5OCEPZk1vb61ljPgwHKUoTt2F42ihWJKi4gQejUr6ehRavLXWzC6gnX5UH5w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=q+SAZQswD+sWPjsYSJayxIdoK3eMB9BkRfjdxEU0Y3A=;
 b=PaK1k+jGlZY4qtr8By8SV6AAy2k1c8jX10LfrNCj7eXBXF7dTX1gZSV6Nk23apuhvIWPVDGrNliHzT6XLlxxzwU0J/GeYFUtTsuMMp0q5E320JuZP44RURnPE21FPY6Iv/7oXy2pMKfWSjQbnPTL2vC/wXwExmBhBJnhs0nHfAA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by TYUPR02MB6251.apcprd02.prod.outlook.com (2603:1096:400:35a::6)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8230.12; Tue, 10 Dec
 2024 08:28:47 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8230.016; Tue, 10 Dec 2024
 08:28:46 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 10 Dec 2024 16:28:01 +0800
Message-Id: <20241210082801.4104194-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR04CA0207.apcprd04.prod.outlook.com
 (2603:1096:4:187::9) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|TYUPR02MB6251:EE_
X-MS-Office365-Filtering-Correlation-Id: c0f55395-a479-48f8-4ae0-08dd18f4aa1e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?xl0VQp0C6E2aESSI5/HINpqz0AfFz5x2eY6DfbMaFLCR0yud+1T/yKkAUvaV?=
 =?us-ascii?Q?zZ4J5HxZ2Yj+wx5PbGVAllN4tpunr5kFVn6BUoCEmbkfJORyEjpdllHj1gs1?=
 =?us-ascii?Q?7wXfsmsvFKNBy8OhsBgFLg5fR4OLgPYPDTBkbONI0WubWb74lPVFtpldu74o?=
 =?us-ascii?Q?zC6o2f620z1YmtmufbK9U9GR44o3JanqjYPGFKLkR80Dzzj118xyIeKY7cE2?=
 =?us-ascii?Q?rS9nXWh8O1Au4+Rk9lASeIU36MFNfVgxY099NLQn2SQRSQe6jgDbYB1QjmKN?=
 =?us-ascii?Q?2M13KoGbT2j9r7vZ+GBKx0+EDKKvcLipAYr2ukHrYBIcj0hBE0/byyvFTAAh?=
 =?us-ascii?Q?EttqMvkCqhKbxy/b4WaqdUvfUr4imXa3tjjFoEMOLJ1ETkdC9XbcDtiPaoyJ?=
 =?us-ascii?Q?zXcoKaQsy78YHFm3zJVQ1tlPMc/nebr8aTl/ed6Pjnksr+dRM+rtixrwJYnn?=
 =?us-ascii?Q?38tBQVZJ/mG9GXqguTvDBtRr378QieTyBueFqLnPy8lLGkVnbI/+7AvHyH1N?=
 =?us-ascii?Q?lQsu3CuWNpZtM3hymPrcA+9ap3rLMUk9ShjUeVz3tgktq0fDF832GIKUHwX/?=
 =?us-ascii?Q?gYaPh/WlwMMQV0QqXOGsrursp/c89JhskqLQ0cDp4yGQBFBCdVnBvhbFPks5?=
 =?us-ascii?Q?H7H0tTomecw75HNCDg4GuHSozDCh1ucuhXOLwf2uc2Rz63R4MNoChfkMAK6P?=
 =?us-ascii?Q?ik4fpcCDZADFY5+XjaXWaWzMyNmkNdrCq8YinrmfuqeTEpmPwQLHZUrGhsrV?=
 =?us-ascii?Q?XynnLvVyjv20xHn/ab5RldFVWmc6QJ9kNZEwJUzRnvaLAzTXy/ab/ZJt3RLD?=
 =?us-ascii?Q?RtLPFpSapTiO98VQ0bUUChq21k7PS/hcG7VJzh/oCRINQE4jm2uLy8w23B9+?=
 =?us-ascii?Q?gnyPEFjDD9LwkbdzhIOPAHl9cVdZDyAQZk1AjxkduxlI9WzIolKONChxN5lP?=
 =?us-ascii?Q?IT+lmLx7mQcl6mKFWS+cWNBZebjWBDgWTy7PfJ9G7GV1TWLpWOw/Qe0wj7mA?=
 =?us-ascii?Q?3mj/RPPa0CbKEJMerCpyiTrH8xfpvceEzHs4qzXJ2baswXHTTgA3L7piwBXI?=
 =?us-ascii?Q?vJo3NY0JxqW/GCIo8nm7fh8nUdmNaOri3pbcorLqrNcJL2nE318T5iew22M5?=
 =?us-ascii?Q?rUAptgXEhl2a7gkMRax5A5hkqyKA5LLPOsrveHhbhOU6WMniYjgS0NkiwbHP?=
 =?us-ascii?Q?G703qV/2vtYah4L2u/YO3zEpAr5Su43vBqHrFgM3pX+6dJbRvZPS/G9oriMe?=
 =?us-ascii?Q?q1LwpVlVIqGeqzoDnaBVEK1QhL0tQhGZZd7i0Lej3CpDKko0eqG+wViqvIyX?=
 =?us-ascii?Q?qiDdE3ahUqk0A4jDzzMfa7YXXlnoAFR43DvDZvnD2PBVpL3Yt6OOi6H8xCFU?=
 =?us-ascii?Q?tiSAwZ8dU2v0Oyq1N/7rPSIo4LZwGN5NeynbjGx4NGlERcm2IQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TMuW1XG6fwyiyr5NMZHezfSxHf4jAY9ta2CHDveKD9Rz9piYbne74YGpPn/9?=
 =?us-ascii?Q?c+DJiBwaepvI+wKvyulweJ0Lk/DB/mwF40fCHmfcT6NLWrkhuySPyHmYEwxW?=
 =?us-ascii?Q?ha6GbCqsK3A4I+xdet9YS+dA2VThECFkAoP0GJ4izAsqRuOyf9XD+z+0mR37?=
 =?us-ascii?Q?BS2S8V3FUBrJwdk1zhNkAnZhVDmCwZBj2pQqpbYqTf4+te974AMM6LDbU8CC?=
 =?us-ascii?Q?oGIJuaDd5AIujA9hkJDfLLMcBDmoyBoNyPQtkpCeoQV83rmEJmK6vj4GQuNZ?=
 =?us-ascii?Q?RFTYBZf25pD4BV9rytNFG/H5y2aIdZKv4ojwUfvsO4S93Tj8jhzV0ZhxY7uI?=
 =?us-ascii?Q?9Mu8ntTOGsQU6w2v2pk/aKLJT1zd1ZOPFk2B9e+6VldGs1Pcf+8Fj+2FKI94?=
 =?us-ascii?Q?MkY6e68L11sabdE6LcyR+O117lmuIspzARXcOcQ/i4UoAg7k8yCD0IcjBGb+?=
 =?us-ascii?Q?X+/Ux+p7V4xWwOCw/S1P+PHQ3XciE7hFuz2Ni3kG2jUK6pzxhNjwUaCR6dfG?=
 =?us-ascii?Q?31jZ+nfGEmgLEGgZetAAxqm0FltKejVoLveZDaFbDBc/26yFOd0CD2eD9LYp?=
 =?us-ascii?Q?Q0TOjEY7EYdfyarqovjCKJ1utCuiylfhQo1UzCtORh1AYk5sKOC432rsiPcM?=
 =?us-ascii?Q?U6Kzprw+g4JhafP0aboiDY4Yl7H0Ms6ltzYuY8bTbKFL0lMbChyw1rwkJRsL?=
 =?us-ascii?Q?mAjLFPO5UImH3tUVack8X0r/TiFZGOaxF18zg2yzO7BowLzNo3KYh/SQ4d8w?=
 =?us-ascii?Q?7rKO21gvdJsaV1StITESWr9KjD5TCJ1EgUL+pGcG3EW0f/gqNerm2boS0jo3?=
 =?us-ascii?Q?yQEp1PXu6uuHPn9paFKsEGOBfcpkTn0oLWAHzI7eK5zIwo1PH03i2muiGiYs?=
 =?us-ascii?Q?3EdM3n+2KKnxyFJsbI5HOf0mk2FJ7k7D1sYYPOyqVPZPbpkYrIo0XXovLiGW?=
 =?us-ascii?Q?roHXVtMFlkVH3QciRDnF8AmwBooLmsACicd/Hkp3B/NbcPXuYmlfMIC0qTqU?=
 =?us-ascii?Q?TiJfW+pNQ8znKC6lx38Dio09xLU7gjsZElurjannUwugDFpeZ4KDHyOnzX9S?=
 =?us-ascii?Q?oD1NLZpJ8cH7qs/9ioFq5EL5GwlVjDsG2YH/rVGj8OY2zRUOMlofe72fPw45?=
 =?us-ascii?Q?CsqWueD6eHiSa5Nk/jZ35kbmFtDIySdasnGDsYVFZzwb9M9U8HYWv/vSatzR?=
 =?us-ascii?Q?v1mLYgZd/Mb9wTQ7Rao0vBWiLL4RrRoKd+78MVmo/1p3mapglaQTFI5uAWhk?=
 =?us-ascii?Q?HnpjC2wt/5CyVwKTlgn5e1mXkeOJso/vHQVGSk31QzkeroWkdvmASzcQDa8B?=
 =?us-ascii?Q?QDpmBxAXnRltUdVfsjA12kPG1Ort5vW06iJoN9bBFmm87UvNbg9T+HX9J8I7?=
 =?us-ascii?Q?xiSd3AiQOmG74tS5hxam5eqwLWklQbLV+0NSJjkXTrkEebESRXuNYbrxp8ul?=
 =?us-ascii?Q?9xTi5PO/fQ6OvaOyYemRTdWLuAwNDHZkKmQJV9vU591rhtnSx0ZWh/NDqxy5?=
 =?us-ascii?Q?Nqyhl6uakoBPcZD4ZfAufCVSAPR9Rar+i6WiuuASLx9wIYMdH+TKfybVRGK6?=
 =?us-ascii?Q?AxtOBdzI01oldRbkKvLu8al0spA0K9pLj+BrWJQZzbi+v02uxMBsat+J13oy?=
 =?us-ascii?Q?vA=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c0f55395-a479-48f8-4ae0-08dd18f4aa1e
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Dec 2024 08:28:46.3993 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Oq0bTIIgcB5sY46lcoYoCrflN9zlYFQ1ump4V+LvpLr7hx0W39qgBLgPM+PLy+tnNJIxV3wbw2PBnr7hequj6w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR02MB6251
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch want to reduce the number of system calls to
 improve
 performance. pread and pwrite will only be used when the target platform
 support them. Signed-off-by: LongPing Wei <weilongping@oppo.com> ---
 configure.ac
 | 4 +++- lib/libf2fs_io.c | 29 +++++++++++++++++++++++++++++ 2 files changed, 
 32 insertions(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.65 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.65 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.65 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tKvc6-0006Ls-FQ
Subject: [f2fs-dev] [PATCH 1/2] f2fs-tools: use pread and pwrite when they
 are available.
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
Cc: panglu2022@gmail.com, LongPing Wei <weilongping@oppo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This patch want to reduce the number of system calls to improve performance.
pread and pwrite will only be used when the target platform support them.

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 configure.ac     |  4 +++-
 lib/libf2fs_io.c | 29 +++++++++++++++++++++++++++++
 2 files changed, 32 insertions(+), 1 deletion(-)

diff --git a/configure.ac b/configure.ac
index 2053a65..439b97f 100644
--- a/configure.ac
+++ b/configure.ac
@@ -182,6 +182,7 @@ AC_TYPE_SIZE_T
 AC_FUNC_GETMNTENT
 AC_CHECK_FUNCS_ONCE([
 	add_key
+	clock_gettime
 	fallocate
 	fsetxattr
 	fstat
@@ -193,7 +194,8 @@ AC_CHECK_FUNCS_ONCE([
 	keyctl
 	memset
 	setmntent
-	clock_gettime
+	pread
+	pwrite
 ])
 
 AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 520ae03..a8430c9 100644
--- a/lib/libf2fs_io.c
+++ b/lib/libf2fs_io.c
@@ -279,6 +279,12 @@ static int dcache_io_read(long entry, __u64 offset, off_t blk)
 	if (fd < 0)
 		return fd;
 
+#ifdef HAVE_PREAD
+	if (pread(fd, dcache_buf + entry * F2FS_BLKSIZE, F2FS_BLKSIZE, offset) < 0) {
+		MSG(0, "\n pread() fail.\n");
+		return -1;
+	}
+#else
 	if (lseek(fd, offset, SEEK_SET) < 0) {
 		MSG(0, "\n lseek fail.\n");
 		return -1;
@@ -287,6 +293,7 @@ static int dcache_io_read(long entry, __u64 offset, off_t blk)
 		MSG(0, "\n read() fail.\n");
 		return -1;
 	}
+#endif
 	dcache_lastused[entry] = ++dcache_usetick;
 	dcache_valid[entry] = true;
 	dcache_blk[entry] = blk;
@@ -393,10 +400,15 @@ int dev_read_version(void *buf, __u64 offset, size_t len)
 {
 	if (c.sparse_mode)
 		return 0;
+#ifdef HAVE_RPEAD
+	if (pread(c.kd, buf, len, (off_t)offset) < 0)
+		return -1;
+#else
 	if (lseek(c.kd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(c.kd, buf, len) < 0)
 		return -1;
+#endif
 	return 0;
 }
 
@@ -535,10 +547,15 @@ int dev_read(void *buf, __u64 offset, size_t len)
 	fd = __get_device_fd(&offset);
 	if (fd < 0)
 		return fd;
+#ifdef HAVE_PREAD
+	if (pread(fd, buf, len, (off_t)offset) < 0)
+		return -1;
+#else
 	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (read(fd, buf, len) < 0)
 		return -1;
+#endif
 	return 0;
 }
 
@@ -615,8 +632,10 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
 	if (fd < 0)
 		return fd;
 
+#ifndef HAVE_PWRITE
 	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
+#endif
 
 #if ! defined(__MINGW32__)
 	if (c.need_whint && (c.whint != whint)) {
@@ -629,8 +648,13 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
 	}
 #endif
 
+#ifdef HAVE_PWRITE
+	if (pwrite(fd, buf, len, (off_t)offset) < 0)
+		return -1;
+#else
 	if (write(fd, buf, len) < 0)
 		return -1;
+#endif
 
 	c.need_fsync = true;
 
@@ -663,10 +687,15 @@ int dev_write_block(void *buf, __u64 blk_addr, enum rw_hint whint)
 
 int dev_write_dump(void *buf, __u64 offset, size_t len)
 {
+#ifdef HAVE_PWRITE
+	if (pwrite(c.dump_fd, buf, len, (off_t)offset) < 0)
+		return -1;
+#else
 	if (lseek(c.dump_fd, (off_t)offset, SEEK_SET) < 0)
 		return -1;
 	if (write(c.dump_fd, buf, len) < 0)
 		return -1;
+#endif
 	return 0;
 }
 
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
