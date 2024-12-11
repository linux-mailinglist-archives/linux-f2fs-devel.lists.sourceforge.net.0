Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BCAD9EC079
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Dec 2024 01:15:00 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tLANT-0004mX-44;
	Wed, 11 Dec 2024 00:14:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1tLANR-0004mQ-Jo
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 00:14:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=JY/egANZ1IlZmwOkWBtDSUQisRRSOI7ZL/UXKhOuitQ=; b=E1oG+7mkYf9PFDC8T576iiYcuy
 h2ALRTk7FqpqfbGId7hNeMBIiVG/hpEXtsg6lpJt+ZJvr7zKAfkJpJV+TrukFL5Nsssb8JWpomezL
 ehTHB5XCEazrMHwU2hKybkeaC4gFgghGAP6lrF4PwygErEISTaoWpd1v3prtsRtgisOA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=JY/egANZ1IlZmwOkWBtDSUQisRRSOI7ZL/UXKhOuitQ=; b=Q
 9d9Mmo6oixEao9jvGEjAH/ClM1afC5gmvQUA6yvn/EirvPKFWCi/XjL4yWR5AaVhf3kUys7m7+Tob
 95XrnDU7JswTswSTvdl6uDxFarlfRbkhfg4I7lLj/MuZMJNIlG4jj6ei/mz3WvOVRP2TtnWNaTeLW
 8kok3Ipibd3efXI8=;
Received: from mail-eastasiaazon11010044.outbound.protection.outlook.com
 ([52.101.128.44] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tLANQ-0002RU-4I for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Dec 2024 00:14:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=sa06drDxSjS9QzvrbGaodh5Qnl7tHz4I2Hg4ILyBjro238lGsKoTlk7sIOs64kcwmQ1VTZoMNYSaIiPInlmsWWv+APZVsZc4Lk0mjVCsNWcCn/HLUnnINzfyZSqB1uFJnu4GQY+f31MwMLxlyEnnvAPHK7Rr0NuTbMAf+97+S9WOjh15T8sDfxuII52DcwlKdfusauvggkWMWeEqQWByK/7puGcwjTpqJnIqKJNXnz1e+f/om/NFzYaAN+FiK+dqFgkIQ8dltATOZsfkJTIOS3RP76Z0DhytutIBUZ62MguCavL8cmPrj1zpNpY4i+pr+sUhHiuJwRs4xNUOjjkFXQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=JY/egANZ1IlZmwOkWBtDSUQisRRSOI7ZL/UXKhOuitQ=;
 b=iSH2ZbQsvgUV+hm+6iqZqVZ08gnoK7H9AK6UcMK3cQQiCxZotxZgZ8RBkykP+jbLOn7w6EHyMFBMhcxp1smq52efUoVK9fH3lO9+SMuroFxCGBzjBtXYPWuOaQjrJvJXKui85pc4AMUheiy57v77OZ/o6gTRmAGz0z/JBeXskuMuy+Cta5lZaUtaDKIw37M7Y5XMezOfj5eSTu0iMmDHz/CgA24Uzy0riH7LObntLgDU7cFNd8k+7apNaLNev0hJGITiELWxAeP29NzyFVSkMv7P9Hrb1ypSJGaudrPZHdLt+bu43XUh8welBMw2/4yAxetygLP2gewcbbBsEF7TSQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=JY/egANZ1IlZmwOkWBtDSUQisRRSOI7ZL/UXKhOuitQ=;
 b=u/EjtYexEg8uN231MT91zivkDnYzQpwaNIsZUf63HA/s/C2TxzJlJtsSW6vgz7lK0GxMl2Ce/Lc+dn9766yRaKA2BuxTuYvi0dGIRFGkUcNbxGcXw/mXS923p7Fpi6mL/IcrcXcSPi1neodbAGg4WMmpihT6iYXHNPcJ/QFaE4w=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by SEZPR02MB5591.apcprd02.prod.outlook.com (2603:1096:101:38::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8251.15; Wed, 11 Dec
 2024 00:14:35 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.8230.016; Wed, 11 Dec 2024
 00:14:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 11 Dec 2024 08:14:04 +0800
Message-Id: <20241211001404.4120186-1-weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI1PR02CA0028.apcprd02.prod.outlook.com
 (2603:1096:4:1f4::6) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|SEZPR02MB5591:EE_
X-MS-Office365-Filtering-Correlation-Id: a16f061e-ed67-4977-f8e7-08dd1978cb18
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?c1JKsxJt4xyIHIiheV8FiZK0tF3CLLZsSjSv3RiJAMduRAuCb9l8ivT2l0n7?=
 =?us-ascii?Q?egW1pgl5182tAXWbme5Zm+9vWFbWBMH9QP8lGRVbTrAfIjZ117fF/yEg5VwI?=
 =?us-ascii?Q?8MxrJD57Vqp9x5XKPe8fHxDGT69AWa2l2Sd7BoXXwrOOt5T3Jgq9H/tky+Kg?=
 =?us-ascii?Q?sXG5JOQIlmt4xt2FufnjzI81gmJ50lci8ClgbqjfE6yTcbdTcxEzll++I6wp?=
 =?us-ascii?Q?OWO2sLLkCUfEEMMdo7eHG8cYMcA09xxaMlZRmH+nfL1AToNYHvHyujgCOl2N?=
 =?us-ascii?Q?xLFSdYEv+iHKe6qJdSwLxazjsTf0CyaKZu3s2zocObp5OGE7dHI9MRZarS0X?=
 =?us-ascii?Q?qGlbdXe8lTLOQ2IohcLpP0xD3+JxpciyZnIPNYEzl8ent4baCIfZSqv22GOH?=
 =?us-ascii?Q?4EhqTQ7AyTjv1ifcyqUkTkOam7yE7i6dXChhYHzQk7xc7ANlXcGwMxBRPLtB?=
 =?us-ascii?Q?gJZK1lVmjPYrMCw9P5Lymi/rbmtjM238axutekQmsihhWNxuHLIT3NcRb+/J?=
 =?us-ascii?Q?5HlpP06QZj1mkEZK//eODi9GQr/vqStl+9qa33AK52/TxwqT97eP002RiYR5?=
 =?us-ascii?Q?W254PUI/NnPxRmwwDVhqLMF1rtDe51PGh3u2Yw731D5/KadoKYDII64nP0gN?=
 =?us-ascii?Q?Na80p46ebmhxUEC1u3s5vMaXbgucOUKWFwctRfyn/zfwFtPbnfq5X5xJASkV?=
 =?us-ascii?Q?mBoTYAvHZRRTZyR1KIzSS7U2THt4vz1KWIqtWGox1QeSd1RA2GU9Z6QV+qGu?=
 =?us-ascii?Q?odvivHLDJHY9pZ5EnTleLnTs+guCPymrTZ5faYcAgyNAfXd45+Vk5tRrdqf+?=
 =?us-ascii?Q?3GyBu84T/LzwqV/DockiUA6wGPZ4jYwpe1Zi2e+9mEPlpPKdcC6sbjxKB3EF?=
 =?us-ascii?Q?oQubsZQSZfP26DFwoALFXAwekYxeqrJfDhkfC9qUzhrSZUmhJ9oRUFdHkNkd?=
 =?us-ascii?Q?LpSDoDnWA+NOx+xqK5EouUqiuMkfMSm9lo6OWAMOLvWL7VXOYrjwuI5UMgdD?=
 =?us-ascii?Q?H7QfIL6clyxK8At4/ENExqbpHnaUzzUwxRIWLKlF/HKLxo6AEfz3wFK/mtQI?=
 =?us-ascii?Q?0AJF9NxCVewkK6ipkG68rXS1gndP2fMuqrzG3vWsv+8WfDffIK/LAOvY2WD5?=
 =?us-ascii?Q?FT4tSYYx4W9HCyAWX77yywDe0ndc86y6NPuYJfDSWIQdq3fd5FOjUc9z+Igz?=
 =?us-ascii?Q?V9TLA/NLon4VggvkltDDW+ZahEq5zLDTPKkv0Exh91mwDD0vPw6oyEO4eRLu?=
 =?us-ascii?Q?kzCqfj1IpGDXqUN6OwWB0CdEjc7gSI3dS/Tv4CBMpfXZZiAHoiotifxZruyR?=
 =?us-ascii?Q?X/he1y9d6gf1OzLKbcAnGBMb8gKQHI792mZTlps+mBG7lyBat93M0w9WNdUz?=
 =?us-ascii?Q?mx380bVcZRSWHMgQam99IrROl33HUFBE8OIdu4iJfPVIKaa8Cw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?FxtamBhPmf+kfNN4KbxTOlZ3lxFeR2GATnQ9N1UhKQkw/w4P1bpG5mv2hiWi?=
 =?us-ascii?Q?07YYl1f1dGMCUm0qXODBUwdy8z2NMyldclInnfSkV0eprgVeblQJ3Kj61jKw?=
 =?us-ascii?Q?pXnEjhZ94Lifb29SCGHjKIwWviZNTdf6HqYAYaddH8eXX8wuicoc67u70tbe?=
 =?us-ascii?Q?Gk0F6ZrTMbaRRenXt4ByEzGE11DGosoXER/ye8zDQABuyrJd9GX9Jpfv2R7x?=
 =?us-ascii?Q?pY5ymzfMQPnNA2nK1hVwfKWEk80anK5M8lBNtAkRcSBd5oVIM5u+XsgftlMV?=
 =?us-ascii?Q?Zo7ItMI5tI6O5AYDo107EiDRGU4jjpPoVAVlDuETtnWMAYDjhhtp333tWXkj?=
 =?us-ascii?Q?UBXFtYFsctnRovZfuIVDP8ylrD8QI2Tr+nin2vRN7clJ1GBDn7dLAaIvnjmE?=
 =?us-ascii?Q?YRYo6aYEqPnUwvtFfO48VWtJUFlsluSeEohOPMRBmbyWTs1wPKEAOiolpP9W?=
 =?us-ascii?Q?jqqUN6mwtwVRn/nw8VH1F8ND7Esp/5nJqTyIYNgpN0FEaC3gQYpaBeJFujjm?=
 =?us-ascii?Q?mJ466s5PAmBuHQC9nZuee21l7QbLY9VpJuhMEvpxaRFsXIAwRejFXy3EKtEZ?=
 =?us-ascii?Q?baF3oTR5shCuRcSN4+RABAji0S0qgBkgMy0Cl2+I0PszVmrrPMU9fFqMK6jN?=
 =?us-ascii?Q?Mc+wwN+1cTqt2yyZbNrhyh/0bCXemr037redsbKt7i9w2NFSVuXyK3OzKFJA?=
 =?us-ascii?Q?Ts4S9d6xirAO6T//U0uQyTQPJkjKXIPKz46n/MXjTF91RhlnwDtwrptPZQRt?=
 =?us-ascii?Q?tQPcO7ESbpZbAiolyX6Pu8bDoG9ubcWJ5cVLIMwfdDaS0wYJjOVziP3jpBCv?=
 =?us-ascii?Q?0Ep3t8JXwvIDpg4nyrJUlFFitYlz9P3L3GeV41if2aM5V1utc4Gg3RdtQE+H?=
 =?us-ascii?Q?C/17CeHE/v4R79MDLm5r5xis6e/jZmoH71OcYy8F2cE2N9IjTR6xEffSyOGc?=
 =?us-ascii?Q?BYnXdcvg1DwEzOM380ilaCeAanvtHXMxYJ+9TvQydJCa5QZnhg9NPglFsGpb?=
 =?us-ascii?Q?X2T56ZwKPb7l+YoA7xlOD5sfPGJafncF40AojpOkujuT/Gq7kWajokRi1AbV?=
 =?us-ascii?Q?Dy/7XG6zet/bilMnzAxIDr7dNx9/vrPsCaUWqiN7SiSv9d+4fArUX9BvYD3D?=
 =?us-ascii?Q?lISzJRLGAS4X/L3Y/IgC9puywwZ67diQ9EdloccxDkoFKQ3K6sisLgAmWUPd?=
 =?us-ascii?Q?b9ENwpxbSGFIsQr+1VnfpWpj4lR4y/BzO/j5yMN0dF0fZ1ryMvMgTAGHycr3?=
 =?us-ascii?Q?ovPOD4h7DVsW3CkqbkkzgzOSDcVdWr/JyFblp/+/UGlyHV1P8ixKsliPCfjF?=
 =?us-ascii?Q?oZ/OB0vc7H+38tCTLxQ9f5OFLY/JZEBvbMC8Bqe3Only/HnRJBszuY9RZTF+?=
 =?us-ascii?Q?RAr0Od1MlodQvPotyiMdBCN0pB53ksSfMnY4b5e/BvQGhEQ8MW5p45MRNz56?=
 =?us-ascii?Q?rjW4r2Xs+Ku8zagNb22ZzVKwYuGYf3dPCm8xDk9VRj76Uzj7WuTXGQ+kyibP?=
 =?us-ascii?Q?DJUIwpZxcl0/RpBumFFb2CTtCNAiT+lK/oWQ+UquKRSp4i9EG2+dCDHvEnF+?=
 =?us-ascii?Q?cQvc3sMnJaeVaC1mUpWq8A6n4jwEXmM++HUzm4/RshLnIPDIADtLDsEFbbh4?=
 =?us-ascii?Q?pg=3D=3D?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a16f061e-ed67-4977-f8e7-08dd1978cb18
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Dec 2024 00:14:35.2946 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bKUJ9nvXFNVXJftQ5I/dYNbS8cVsIJ7ciwWiifNtY4N2RQTH+IJDPWggrpMGuAhC+37FhabUpOtXRbrkNzuL8Q==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB5591
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch wants to reduce the number of system calls to
 improve
 performance. pread and pwrite will only be used when the target platform
 support them. Signed-off-by: LongPing Wei <weilongping@oppo.com> ---
 configure.ac
 | 4 +++- lib/libf2fs_io.c | 32 +++++++++++++++++++++++++++++--- 2 files
 changed, 32 insertions(+), 4 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.44 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.44 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.44 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.44 listed in list.dnswl.org]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1tLANQ-0002RU-4I
Subject: [f2fs-dev] [PATCH v2 1/2] f2fs-tools: use pread and pwrite when
 they are available.
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

This patch wants to reduce the number of system calls to improve performance.
pread and pwrite will only be used when the target platform support them.

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
 configure.ac     |  4 +++-
 lib/libf2fs_io.c | 32 +++++++++++++++++++++++++++++---
 2 files changed, 32 insertions(+), 4 deletions(-)

diff --git a/configure.ac b/configure.ac
index 2053a65..ddfc3b0 100644
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
@@ -192,8 +193,9 @@ AC_CHECK_FUNCS_ONCE([
 	getuid
 	keyctl
 	memset
+	pread
+	pwrite
 	setmntent
-	clock_gettime
 ])
 
 AS_IF([test "$ac_cv_header_byteswap_h" = "yes"],
diff --git a/lib/libf2fs_io.c b/lib/libf2fs_io.c
index 520ae03..2030440 100644
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
 
@@ -615,9 +632,6 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
 	if (fd < 0)
 		return fd;
 
-	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
-		return -1;
-
 #if ! defined(__MINGW32__)
 	if (c.need_whint && (c.whint != whint)) {
 		u64 hint = whint;
@@ -629,8 +643,15 @@ static int __dev_write(void *buf, __u64 offset, size_t len, enum rw_hint whint)
 	}
 #endif
 
+#ifdef HAVE_PWRITE
+	if (pwrite(fd, buf, len, (off_t)offset) < 0)
+		return -1;
+#else
+	if (lseek(fd, (off_t)offset, SEEK_SET) < 0)
+		return -1;
 	if (write(fd, buf, len) < 0)
 		return -1;
+#endif
 
 	c.need_fsync = true;
 
@@ -663,10 +684,15 @@ int dev_write_block(void *buf, __u64 blk_addr, enum rw_hint whint)
 
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
