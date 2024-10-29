Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D01899B4943
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:59 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4o-0007zJ-7g;
	Tue, 29 Oct 2024 12:11:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4k-0007ys-Gd
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=K9q+3wzhHhMEQR6AG32KbB7p+8mI0YvjNUs2WlLJ6Yk=; b=hX7kwsWr0bWIb6ida/kuIlE+EA
 eUU+mQjYsOit7I1WYQRUW0V5SDcx1xZjMa4htxUiX1dTpIPUugJOQpiQZqMUucv2IgPqNMcFeG1uw
 7BkFQ30CpVIyI5t4o3TCQMLsTPc6VTt4K7XGlk9yh9IJOHTRLZmElR5ftp0JFk5R5O+w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=K9q+3wzhHhMEQR6AG32KbB7p+8mI0YvjNUs2WlLJ6Yk=; b=KbWaIPr0vTk+IpFLAzkkoEc66G
 UQr/CqoqaNFurD9ywdlcAcFlE4ZwYaEn1Np1f6mODOfUiDjzwUPqzhnLKOG3L1GQbwYXICjqVdiEv
 ESAD+AsYGfu4hp1/+Jg/LRyLedWfJZV3TemHI2s16tCI7qJqTVjnzupvyuEGnOTUjPTs=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4i-0007Qb-PE for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MMbFT78K0Ipz6+loqhVd9GrJntoFPXcFg3Tb9Uuvewq8ojXP1Yv1vPQNJDnV+KbW9HDJAaYsJ0XQZcqiLVUZq6GG6MI3sAPm9xjpwbf0rqAcCcUcs9jG+84IIMeLq3o/JKLGbEwRxSEOjdc80YMBgdHeFG/amR5yA1jtZMaNZi1PjLB3sulbrCFetv9dUnQbzhHepU0gptnaMQRfWiSl+cXRtjSXzRLl5CWrhdTHcTE3qkCTb11h/Fid50ymKdwgwCEO+JN/AD7rJL9POsHlHj/TmCAlJQ96ItR9vDQH2w4BF9qp+Dp3ASRhYuSc7gf1w6Bmswr4Rm4QFza1qGhR6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=K9q+3wzhHhMEQR6AG32KbB7p+8mI0YvjNUs2WlLJ6Yk=;
 b=L3zLbcdLyOPyXPRHE6xIC7qakpdiPGbhw+7Qfb4jWpCKgQVPclWNxWygANFZwGeBDPJPeKSRg+P12LwEg07XMeIGt1RMMOQPhd16s+mmR3mw5FaAx7Iz+Xi68D+rcZyGN84z9wiFOyogT77TNcN9ZzsKqe+olDQHFjwGsRaCWyPp4IyN8+ZWromvkWFx67HH7rtsoXg1ZL952/RBu3ukHYB+nJbgPgcaFyyeYHhrLj0bfOi33vaZuJTcGyodBo7NT1qnPHEHCgGluTyExVq2u0x5IKNGlcG/xrNgGq9e7oOwCYdjfw9ONzNecOZ2m6GkG8PbFKRaV0g0qLKH7hknKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=K9q+3wzhHhMEQR6AG32KbB7p+8mI0YvjNUs2WlLJ6Yk=;
 b=MrRRZZ1/Yytv2Vu7+l03kYLdos+XtL8tKMsmyoYCzYkrDsPFfG3ktuoXntPwgSwLI6wpmUELFTWmxxbwdtXFCtExYCBy8baysKUSnQn6RhYe4nKZ0xkjJwyW/hxR2sgdjVTq7rr0ioVYfr36d1Tzy2JAKz00H5JPyEKV7/WMup0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:37 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:40 +0800
Message-Id: <20241029120956.4186731-9-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 1a590c74-e3c6-4c1a-ec27-08dcf812d669
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?poFyDWcveHpyACfxBKveh5nxZ0iR3sGAO4TYZkf4knGc4EW3gSfQQERXf9pr?=
 =?us-ascii?Q?+M0MMtyCH94J91YfnTshniKQto8mCp18OplTig9mbhpVZUs82CbWtLyy5Qq3?=
 =?us-ascii?Q?LKRKY4XPyuVvPrEL8Rn+M3oJFVjiHuS55H0/N706IafpHLTHZ6twOeZ0Y1I0?=
 =?us-ascii?Q?GwE9amIfaVzj3aXTonwU6tFLvyJZfsBpSqwYqbb5cjM4mVk3Q0GXY9gWe5mH?=
 =?us-ascii?Q?MCm47elaVdnPHk7y+dsMdvsfFkm48kX8Lc0P9Yl+yO6bA0JMqvSN9AK9KZii?=
 =?us-ascii?Q?PafLfr/AS7Pa0bjjWl17h+8/2UQQm6SmU4bYGQy5Au9HjRYYsFDujOnVDuD9?=
 =?us-ascii?Q?ziZyc/BUU4gTyVHnc0cml7DeTmbZAkVeYtuUcZ0DOavDMKSn0dqp7zIB6wR4?=
 =?us-ascii?Q?L3B2R+2gv0INRMyBEC25HrmmaKIFgz63KelblqOL5F6d+yysypFACa1GCZ0B?=
 =?us-ascii?Q?4NPWuExZIHzbz9X6qWZgLe7dHW+WAAHYWor1c63zhSi2Xt2r6BkYrBAMlBHT?=
 =?us-ascii?Q?zKfZVf6ZipATCIjUJWxawVDnF4MGwhyLxLGdmFIeFjQFkSgx2DL8EvQBsvTs?=
 =?us-ascii?Q?sbjThRV7119JjBjBuCGJVEllxWLVZWax0qs7HCTao7/hyyzeps/jbwQHcRu5?=
 =?us-ascii?Q?RctdKzZ7q1O+f9pTzIrF3LIyDBdKH/RjGf9hJebKbDjRrFQpKlWXKy4KEy6W?=
 =?us-ascii?Q?7CB3II3Km6SIIdiCoDkqyifDNeBDURNIDQhL1b29IGXbqLtLzlNme+NSJ/uG?=
 =?us-ascii?Q?3p5GDfZbp1E1AUhc613lvuIXT7jQKyN7aj3loBi0Fqpq08TU2ls/7Dykboxh?=
 =?us-ascii?Q?3e/s36qbjTPw0qqVs8fFrn/f6byTxEukON5UDmyvoMmpI/YY/+9Yft1KAoJP?=
 =?us-ascii?Q?yY25wz2oSSfNb7sIN2bbo3C3AsDmyZ6EKBJcADtIplNk7ucwxIwloFfz5I0I?=
 =?us-ascii?Q?lQ3v9EgcwOEkOXwfj7wCSuQRO3vm6/Y6MGUXmoJhGRLHBQzkWG1IkUiuxG+G?=
 =?us-ascii?Q?wd/gg/FtmQDxiO4QtFjIiUxAUgdZWUevBBCI+n8+/Qya1hhCoyVaj8jSuVeN?=
 =?us-ascii?Q?XrhlXjvUd4Lp8ZmwFWUNimoVH4zeVMac2jqC9ygK+2p6bjGgl0DNfVvBIyGD?=
 =?us-ascii?Q?IUwTdlVPLMNuoF+SxyfuWMJUnaPUCWtGO4xbWX5UIJVokAJrJdLAWWpNRQ53?=
 =?us-ascii?Q?jALG3pwvOu1POUY2vc5adahzpLw2ljdq2xWLd06EEqepPepv+s4f7vlsTTuk?=
 =?us-ascii?Q?2pDr7hLjTSSbMEgf9v177hvkLpg5M+oFYD0IGqdI3zev6sCuGIMfErDBrpHo?=
 =?us-ascii?Q?lS1fr5IUAs6HinXq/9/+2dadV7MxM1N9Jo+X4r4z9w1vYSQgUzlBue1LZAoT?=
 =?us-ascii?Q?qoB/SxE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?GCUIbfRtG5glrvxjHWd5Y0sCCx+s2BzSU2YMnrISszv2Goe2A1gRe4qdP1y4?=
 =?us-ascii?Q?95XNLd4dkYzh1Dve9mkLC9KgBVcD0PiK6kpE/tdiW2sepEbBZs0iYiPKiR7C?=
 =?us-ascii?Q?2z6Mm8a6+CCp/tESSdFVSK5ufWUXjz1uBEb4Zk0s/t+7jCr6trRQuXrdj9mN?=
 =?us-ascii?Q?8hDvxRN8x6+tdQknOQHB8CECs3duF7CoSE9NPlyQiPlpxdC7HPOT1pilLmb6?=
 =?us-ascii?Q?ZbpbhD8cm64zKzHXg8OOpnSTBbIBMMm6LafjYlliKo1FFb+ag4MDMkHeXyHo?=
 =?us-ascii?Q?v/dd47J16/c1dD3O8+N3lA2754OWjWYOEK1nEt7tViRVl7ECNPe83TktPytW?=
 =?us-ascii?Q?veWIBgs7K6nSqgvJJ6bOM2MlJOoNOxaae7nZJwLLeaWb1tP/pKGZXYbs5njo?=
 =?us-ascii?Q?HXO47Q2bzPwUpomdGBdhBfbRaWQ8zSkTmCiO4V0LoQmU2JI2PNJkzGRSSkfB?=
 =?us-ascii?Q?FvxCxQ0WwnpTgSXkzPV/MpZQitK+49HCIU3YtjPFi3ROYbPeyoOu4dKhSU7X?=
 =?us-ascii?Q?yXV/FtsPOenmnmcHBsazaFzvsjiTzBlOvHz3oTExYvW6FdtVSjxLHkZiWHew?=
 =?us-ascii?Q?3ag+dwHo9k0CuCKSfNZfsS3tdhJiJAPpT0ATK/lyV6nKAczLoptTcqEKLlFp?=
 =?us-ascii?Q?g2GQ+rkzy6Dp3aXMZ77M9ayFgS7SAqR/VQyqwFfKjtcZgalD+nFOQ8fmhKr8?=
 =?us-ascii?Q?mpNZ5L7WHjnNtT7FYHkoJ/o3wdlJrGT8tbluyglDjsJia0SSsaWBiwGV0iPk?=
 =?us-ascii?Q?+f15St/sC/VsMXihwHxZY1akbRQd6fQ2tmU8GvLO5Sae8BstS8WxriqyLAmS?=
 =?us-ascii?Q?gLql/n20CGZVAFiufRBCY1zy6gdTs1gC+LmF2DKSMKXP2ETv5I2lp5lwKYPS?=
 =?us-ascii?Q?Az5nJ+xUzA4w2f9yJDpVP5Q1QozE/sIAlNmEwOoA+6cz63MJhIArho8RtnG/?=
 =?us-ascii?Q?FBHA0xl1/pEF8Jcz/3a/WnH23vzuYZaK63+ffJyu9RTbsRsJDF0Lxt7EDcJY?=
 =?us-ascii?Q?Vo6aHymdq4hZCAz7RWjdJ16vklUFuGnBkYT+zSVYRYV20bEt9O6GxO7OJr1m?=
 =?us-ascii?Q?JGX7d481waZFh9WEU5eVdjEN3PqWGFLIaHms0GHUNamyeXcrg4/OFh+5Zb40?=
 =?us-ascii?Q?m7yW12XNnN8EGefm7s47opZHl7/tBM5vSBM75UAnrru8cE8OBzf6wEOVgzib?=
 =?us-ascii?Q?XvnYX5nJRVvFNdmQysFm+VgvL5MbPOsuMOUp2onCjb6EYd22wSXqv+D4DZcM?=
 =?us-ascii?Q?ewq3TRlf5Zx6/lrVLl/vEtGc2ITpRso1Y3WuSJuaHolACmwQ9fUARyqKcRQF?=
 =?us-ascii?Q?Zz92ncbxe0CBimoUvvfDyA0hd49OwX0pKDabGmN9o+UNv8hPOPyji9nKsRA9?=
 =?us-ascii?Q?O0Brft10iX14Kmj3bFPSzWsg0mjRX5cv9vLf6yDLpJUbRACmHyZNJ7C/BYKC?=
 =?us-ascii?Q?Kf2jkjwqOKPTyjJTYkeR/DofO59TiAZ1pwYd0ZK3mBskgVFvCF2j0gBXje8K?=
 =?us-ascii?Q?j1ZnoaqIRi9dbgKL1Anepf6spQV8UM+XDXuTq7VKrjeyp63Yl88DcLmKgX31?=
 =?us-ascii?Q?QNIGiQtU+HsK/8QQ2mKm5QQ3EQUL+elDS+LIDiuL?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1a590c74-e3c6-4c1a-ec27-08dcf812d669
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:37.1829 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: W02+kbBVSKfXXCCxeRIXRs0ECl/jUiDa0xTbp3O5rV5/xAFjCAUXH3lqKaiwZFYg3bWOEBAkszUVPN8VgMxxAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch addes helper scripts for auto testcases,
 and testcases
 of fsck will be submitted in the following commits. The basic idea of these
 testcases are: 1. create f2fs image 2. corrupt the image by inject specific
 fields 3. fsck fixes the corrupted image 4. verify fsck output with expected
 message Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.84 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.84 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4i-0007Qb-PE
Subject: [f2fs-dev] [RFC PATCH 08/24] tests: prepare helper scripts for
 testcases
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

This patch addes helper scripts for auto testcases, and testcases of
fsck will be submitted in the following commits.

The basic idea of these testcases are:
 1. create f2fs image
 2. corrupt the image by inject specific fields
 3. fsck fixes the corrupted image
 4. verify fsck output with expected message

The helper scripts include:
 * test_config.in: is used to generate the basic configurations of all
                   testcases.
 * runtests.in: is used to generate `runtests'.
 * filter.sed: is used to remove unnecessary messages and cleanup
               arbitrary values.
 * helpers: provides helper functions

The usage of runtests:
 * run all testcases:
     runtests
 * run one testcase:
     runtests <testcase directory path>
 * cleanup previous results:
     runtests clean

Each testcase should have a sub-directory, where three files should be
included:
 * README: describe information of the testcase
 * script: testcase itself
 * expect.in: expected output message
an optional file is:
 * img.tar.gz: if some scenario is too complex to create by script, the
               gz file could be prepared in advance, and the operations
               of how to create the image should be described in README

New files are generated in the testcase directory after test:
 * log: output in detail
 * expect: derived from expect.in
 * out: output that will be compared with expect
 * PASS: testcase is passed
 * FAIL: testcase is failed

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 .gitignore           |  13 ++++
 Makefile.am          |   2 +-
 configure.ac         |   1 +
 tests/Makefile.am    |  28 ++++++++
 tests/filter.sed     |  60 +++++++++++++++++
 tests/helpers        | 157 +++++++++++++++++++++++++++++++++++++++++++
 tests/runtests.in    |  46 +++++++++++++
 tests/test_config.in |  47 +++++++++++++
 8 files changed, 353 insertions(+), 1 deletion(-)
 create mode 100644 tests/Makefile.am
 create mode 100644 tests/filter.sed
 create mode 100644 tests/helpers
 create mode 100644 tests/runtests.in
 create mode 100644 tests/test_config.in

diff --git a/.gitignore b/.gitignore
index 49809446793d..c824e8f8091f 100644
--- a/.gitignore
+++ b/.gitignore
@@ -46,6 +46,8 @@ stamp-h1
 
 /mkfs/mkfs.f2fs
 /fsck/fsck.f2fs
+/fsck/dump.f2fs
+/fsck/inject.f2fs
 /tools/fibmap.f2fs
 /tools/parse.f2fs
 /tools/f2fscrypt
@@ -54,3 +56,14 @@ stamp-h1
 # cscope files
 cscope.*
 ncscope.*
+
+# testcase files
+tests/*/log
+tests/*/out
+tests/*/PASS
+tests/*/FAIL
+tests/*/expect
+tests/meta.img
+tests/data.img
+tests/runtests
+tests/test_config
diff --git a/Makefile.am b/Makefile.am
index d2921d626e48..0c9ec66d02b6 100644
--- a/Makefile.am
+++ b/Makefile.am
@@ -2,4 +2,4 @@
 
 ACLOCAL_AMFLAGS = -I m4
 
-SUBDIRS = man lib mkfs fsck tools
+SUBDIRS = man lib mkfs fsck tools tests
diff --git a/configure.ac b/configure.ac
index 2053a65bbb36..364dd162e7c0 100644
--- a/configure.ac
+++ b/configure.ac
@@ -263,6 +263,7 @@ AC_CONFIG_FILES([
 	fsck/Makefile
 	tools/Makefile
 	tools/f2fs_io/Makefile
+	tests/Makefile
 ])
 
 AC_CHECK_MEMBER([struct blk_zone.capacity],
diff --git a/tests/Makefile.am b/tests/Makefile.am
new file mode 100644
index 000000000000..670cd373c628
--- /dev/null
+++ b/tests/Makefile.am
@@ -0,0 +1,28 @@
+## Makefile.am
+
+noinst_SCRIPTS = test_config runtests
+CLEANFILES = $(bin_SCRIPTS)
+EXTRA_DIST = test_config.in runtests.in
+
+test_config: $(srcdir)/test_config.in
+	@echo "Creating test_config script..."
+	@[ -f test_config ] && chmod u+w test_config || true
+	@echo "#!/bin/bash" > test_config
+	@echo "" >> test_config
+	@echo "TOPDIR=@top_srcdir@" >> test_config
+	@cat $(srcdir)/test_config.in >> test_config
+	@chmod +x-w test_config
+
+runtests: $(srcdir)/runtests.in
+	@echo "Creating runtests script..."
+	@[ -f runtests ] && chmod u+w runtests || true
+	@echo "#!/bin/bash" > runtests
+	@echo "" >> runtests
+	@echo "SRCDIR=@srcdir@" >> runtests
+	@cat $(srcdir)/runtests.in >> runtests
+	@chmod +x-w runtests
+
+clean-local:
+	@[ -f runtests ] && runtests clean || true
+	@rm -f runtests test_config
+
diff --git a/tests/filter.sed b/tests/filter.sed
new file mode 100644
index 000000000000..ea69c8eb65a4
--- /dev/null
+++ b/tests/filter.sed
@@ -0,0 +1,60 @@
+## f2fs info that could be ignored
+
+/^Info: No Kernel Check/d
+/^Info: not exist \/proc\/version!/d
+/^Info: version timestamp/d
+/be careful to overwrite a mounted loopback file/d
+/^Info: MKFS version/,+1d
+/^Info: FSCK version/,+2d
+/^Info: superblock encrypt level/d
+/^Info: total FS sectors/d
+/^Done: [0-9\.]\+ secs/d
+/^Info: total FS sectors/d
+/^\[FSCK\] Max image size/d
+/^Info: flush_journal_entries/d
+/^Info: Segments per section =/d
+/^Info: Sections per zone =/d
+/^Info: Device\[[0-9]\]/d
+/^Info: CKPT version =/d
+/^Info: superblock features =/d
+/^Info: flush_journal_entries/d
+/^Info: Corrupted valid nat_bits in checkpoint/d
+/^Info: Checked valid nat_bits in checkpoint/d
+
+## fsck messages should be kept, but some numeric is arbitrary and should
+## be removed
+
+# e.g [ASSERT] (is_valid_ssa_data_blk: 340) => [ASSERT] (is_valid_ssa_data_blk: x)
+s/\(\[ASSERT\] ([a-zA-Z_][0-9a-zA-Z_]\+:\s*\)[0-9]\+)/\1x)/g
+# e.g [FIX] (nullify_nat_entry:3274) => [FIX] (nullify_nat_entry:x)
+s/\(\[FIX\] ([a-zA-Z_][0-9a-zA-Z_]\+:\s*\)[0-9]\+)/\1x)/g
+# e.g [fsck_chk_quota_files:2242] => [fsck_chk_quota_files:x]
+s/^\(\[[a-zA-Z_][0-9a-zA-Z_]\+:\s*\)[0-9]\+\]/\1x\]/g
+# e.g Info: Duplicate valid checkpoint to mirror position 270848 -> 270336 =>
+#     Info: Duplicate valid checkpoint to mirror position x -> x
+s/\(Info: Duplicate valid checkpoint to mirror position \)[0-9]\+\( -> \)[0-9]\+/\1x\2x/g
+# e.g Info: checkpoint state = 1c5 :  trimmed nat_bits crc compacted_summary unmount =>
+#     Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+s/\(Info: checkpoint state = \)[0-9a-f]\+ :/\1x :/g
+s/\(Info: checkpoint state = x :.*\) trimmed\(.*$\)/\1\2/g
+# e.g Info: write_checkpoint() cur_cp:1 => Info: write_checkpoint() cur_cp:x
+s/\(Info: write_checkpoint() cur_cp:\)[0-1]/\1x/g
+# e.g Info: fix_checkpoint() cur_cp:1 => Info: fix_checkpoint() cur_cp:x
+s/\(Info: fix_checkpoint() cur_cp:\)[0-1]/\1x/g
+# e.g [FSCK] Unreachable nat entries                        [Fail] [0x1] =>
+#     [FSCK] Unreachable nat entries                        [Fail] [x]
+# e.g [FSCK] Unreachable nat entries                        [Ok...] [0x0] =>
+#     [FSCK] Unreachable nat entries                        [Ok...] [x] =>
+s/\(\[FSCK\] Unreachable nat entries\s*\[\(Ok\.\.\|Fail\)\] \[\)0x[0-9a-f]\+\]/\1x\]/g
+s/\(\[FSCK\] Hard link checking for regular file\s*\[\(Ok\.\.\|Fail\)\] \[\)0x[0-9a-f]\+\]/\1x\]/g
+# e.g [FSCK] valid_block_count matching with CP             [Ok..] [0x10] =>
+#     [FSCK] valid_block_count matching with CP             [Ok..] [x]
+# e.g [FSCK] valid_block_count matching with CP             [Fail] [0x10, 0x9] =>
+#     [FSCK] valid_block_count matching with CP             [Fail] [x, x]
+s/\(\[FSCK\] valid_block_count matching with CP\s*\[\(Ok\.\.\|Fail\)\] \[\)[0-9a-fx, ]\+\]/\1x\]/g
+s/\(\[FSCK\] valid_node_count matching with CP (de lookup)\s*\[\(Ok\.\.\|Fail\)\] \[\)[0-9a-fx, ]\+\]/\1x\]/g
+s/\(\[FSCK\] valid_node_count matching with CP (nat lookup)\s*\[\(Ok\.\.\|Fail\)\] \[\)[0-9a-fx, ]\+\]/\1x\]/g
+s/\(\[FSCK\] valid_inode_count matched with CP\s*\[\(Ok\.\.\|Fail\)\] \[\)[0-9a-fx, ]\+\]/\1x\]/g
+s/\(\[FSCK\] free segment_count matched with CP\s*\[\(Ok\.\.\|Fail\)\] \[\)[0-9a-fx, ]\+\]/\1x\]/g
+
+## inject info is verifed by fsck result, so it also could be removed
diff --git a/tests/helpers b/tests/helpers
new file mode 100644
index 000000000000..312ecb9c8e99
--- /dev/null
+++ b/tests/helpers
@@ -0,0 +1,157 @@
+#!/bin/sh
+
+# If multiple devices are used, META is the first device and DATA is the
+# second device. If there is only one device, META is used only.
+META=`realpath $TOPDIR/tests/meta.img`
+DATA=`realpath $TOPDIR/tests/data.img`
+OUT=$TESTDIR/out
+EXP=$TESTDIR/expect
+LOG=$TESTDIR/log
+
+# $1: pre: cleanup previous test result
+#     post: remove image files
+cleanup() {
+	if [ x"$1" = x"pre" ]; then
+		rm $TESTDIR/PASS $TESTDIR/FAIL $TESTDIR/expect $OUT $LOG
+	fi
+
+	if [ x"$1" = x"pre" ] || [ x"$1" = x"post" ]; then
+		echo "rm $META $DATA"
+	fi
+}
+
+# check test result
+check_result() {
+	local NAME=`basename $TESTDIR`
+
+	if [ ! -e $EXP ]; then
+		cp "$EXP".in $EXP
+	fi
+	sed -f $FILTER -i $OUT
+	cmp -s $OUT $EXP
+	if [ x"$?" = x"0" ]; then
+		echo "$NAME: $DESC: pass"
+		touch $TESTDIR/PASS
+	else
+		echo "$NAME: $DESC: failed"
+		echo "diff $EXP $OUT"
+		diff $EXP $OUT > $TESTDIR/FAIL
+		exit
+	fi
+}
+
+# $1: path of image file
+# $2: size in MB
+create_img_file() {
+	truncate -s $2"M" $1
+}
+
+make_f2fs() {
+	local metasize=10
+	local datasize=118
+
+	if [ $SEGS_PER_SEC -gt 1 ]; then
+		metasize=$((3 * ($SEGS_PER_SEC * 2)))
+		datasize=$((11* ($SEGS_PER_SEC * 2)))
+		MKFS_OPTS="$MKFS_OPTS -s $SEGS_PER_SEC"
+	fi
+	if [ $MULTIDEV -eq 1 ]; then
+		create_img_file $META $metasize
+		create_img_file $DATA $datasize
+		MKFS_OPTS="$MKFS_OPTS -c $DATA"
+	else
+		create_img_file $META $(($metasize + $datasize))
+	fi
+
+	$MKFS $MKFS_OPTS $META
+	$DUMP -d 1 $META
+
+	return $?
+}
+
+safe_mount() {
+	local dev=""
+
+	# If multiple devices are used, DATA should be associated to a
+	# loop device in advance.
+	# dump/fsck will check the path of the the DATA device, to make
+	# them happy, replace devs[1].path with the loop device before
+	# mount, and restore it after umount.
+	if [ $MULTIDEV -eq 1 ]; then
+		dev=`losetup -f`
+		losetup $dev $DATA
+		if [ $? -ne 0 ]; then
+			echo "cannot setup loop dev: losetup $dev $DATA"
+			return -1
+		fi
+		$INJECT --sb 1 --mb devs.path --idx 1 --str $dev $META
+	fi
+
+	mount -t f2fs $*
+	return $?
+}
+
+#1: mntpoint
+safe_umount() {
+	local max_retry=10
+	local dev=""
+	local i=0
+
+	umount $1
+	while [ $? -ne 0 ]; do
+		i=$(($i + 1))
+		if [ $i -gt $max_retry ]; then
+			return 1
+		fi
+		echo "cannot umount f2fs image, retry: $i"
+		sleep 1
+		umount $1
+	done
+
+	dev=`losetup -j $DATA | cut -d ":" -f 1`
+	if [ x"$dev" != x"" ]; then
+		losetup -d $dev
+		# restore devs[1].path from $dev to $DATA
+		$INJECT --sb 1 --mb devs.path --idx 1 --str $DATA $META
+	fi
+	return 0
+}
+
+# $1: member of sb
+get_sb() {
+	local sb_cp="`$DUMP $DUMP_OPT -d 1 $META`"
+	local cut_here=`echo "$sb_cp" | awk '/^\| Checkpoint/ {print NR}'`
+	local sb="`echo "$sb_cp" | head -n $(($cut_here - 2))`"
+	local val=`echo "$sb" | grep "^$1\s" | sed "s/^$1\s*\[0x\s*[0-9a-f]\+ : \([0-9]*\)\]/\1/g"`
+	echo $val
+}
+
+# $1: member of cp
+get_cp() {
+	local sb_cp="`$DUMP $DUMP_OPT -d 1 $META`"
+	local cut_here=`echo "$sb_cp" | awk '/^\| Checkpoint/ {print NR}'`
+	local cp="`echo "$sb_cp" | tail -n +$(($cut_here - 2))`"
+	local val=`echo "$cp" | grep "^$1\s" | sed "s/^$1\s*\[0x\s*[0-9a-f]\+ : \([0-9]*\)\]/\1/g"`
+	echo $val
+}
+
+# $1: blkaddr
+get_segno() {
+	local main_blkaddr=`get_sb main_blkaddr`
+	local log_blks_per_seg=`get_sb log_blocks_per_seg`
+	echo $((($1 - $main_blkaddr) >> $log_blks_per_seg))
+}
+
+# $1: segno
+start_block() {
+	local main_blkaddr=`get_sb main_blkaddr`
+	local log_blks_per_seg=`get_sb log_blocks_per_seg`
+	echo $(($main_blkaddr + ($1 << $log_blks_per_seg)))
+}
+
+# $1: blkaddr
+offset_in_seg() {
+	local main_blkaddr=`get_sb main_blkaddr`
+	local log_blks_per_seg=`get_sb log_blocks_per_seg`
+	echo $((($1 - $main_blkaddr) % (1 << $log_blks_per_seg)))
+}
diff --git a/tests/runtests.in b/tests/runtests.in
new file mode 100644
index 000000000000..d49634752d42
--- /dev/null
+++ b/tests/runtests.in
@@ -0,0 +1,46 @@
+#!/bin/sh
+#
+# run testcases
+#
+# run all testcases:
+#   runtests
+#
+# run one testcase:
+#   runtests <testcase directory path>
+#
+# cleanup:
+#   runtests clean
+#
+
+# clean temporary files
+if [ x"$1" = x"clean" ]; then
+	find $SRCDIR \( -name FAIL -o -name PASS -o -name expect -o -name log -o -name out -o -name meta.img -o -name data.img \) -exec rm -f {} \;
+	exit
+fi
+
+TEST_CONFIG=$SRCDIR/test_config
+. $TEST_CONFIG
+
+# $1: path of testcase path
+run_one_test() {
+	local subdir=`realpath $1`
+	local name=`basename $subdir`
+	echo "Run testcase: $name ..."
+	TESTDIR=$subdir
+	. $subdir/script
+	echo ""
+}
+
+# run one testcase
+# $1: testcase path
+if [ x"$1" != x"" ]; then
+	run_one_test $1
+	exit
+fi
+
+# run all testcases
+TESTS=`find ./ -type f -name script`
+for testcase in ${TESTS[@]}; do
+	subdir=`dirname $testcase`
+	run_one_test $subdir
+done
diff --git a/tests/test_config.in b/tests/test_config.in
new file mode 100644
index 000000000000..b4249dc26179
--- /dev/null
+++ b/tests/test_config.in
@@ -0,0 +1,47 @@
+#!/bin/sh
+#
+# Test configuration
+#
+
+check_executable() {
+	file $1 | grep ELF > /dev/null
+	[ $? -ne 0 ] && { echo "ERROR: $1 not ELF"; exit; }
+}
+
+check_diff() {
+	diff $1 $2 > /dev/null
+	[ $? -ne 0 ] && { echo "WARNING: $1 and $2 differ"; }
+}
+
+# path of tools
+MKFS="$TOPDIR/mkfs/mkfs.f2fs"
+FSCK="$TOPDIR/fsck/fsck.f2fs"
+DUMP="$TOPDIR/fsck/dump.f2fs"
+INJECT="$TOPDIR/fsck/inject.f2fs"
+F2FS_IO="$TOPDIR/tools/f2fs_io/f2fs_io"
+FILTER="$TOPDIR/tests/filter.sed"
+[ ! -e $MKFS ] && { echo "$MKFS not exist"; exit; }
+[ ! -e $FSCK ] && { echo "$FSCK not exist"; exit; }
+check_executable $FSCK
+[ ! -e $DUMP ] && { cp $FSCK $DUMP; }
+check_executable $DUMP
+check_diff $FSCK $DUMP
+[ ! -e $F2FS_IO ] && { echo "$F2FS_IO not exist"; exit; }
+[ ! -e $INJECT ] && { cp $FSCK $INJECT; }
+check_executable $INJECT
+check_diff $FSCK $INJECT
+
+# config of mkfs
+F2FS_FEATURES="encrypt,extra_attr,compression"
+MKFS_OPTS="-O $F2FS_FEATURES -f"
+MULTIDEV=0
+SEGS_PER_SEC=1
+
+# config of fsck
+FSCK_OPTS="--no-kernel-check -N"
+
+# config of dump
+DUMP_OPTS="-N"
+
+# config of mount
+MNT_OPTS=""
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
