Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 779CD9B493C
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4l-0002aH-RC;
	Tue, 29 Oct 2024 12:11:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4i-0002Zj-Gv
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jq2STUu0OPNY00syPFv7jg0CFbIHIvWx5eyZupS0iGY=; b=Uvso3qPGDi9TtI9artcAc0FbZK
 dSAheaGLi+Wm173oRsOQz/XsELigrunNsRHsQNqY6e5bOl9Z1EQORi8dr8TtJlFO7g6YrrdjQ2jXm
 ZaEpOtXpSbb5Dz7Dzp4UVoKRInxkKMmr7MFdy0OmYe6sjH9BypFAbxeGQll68uCcuibw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jq2STUu0OPNY00syPFv7jg0CFbIHIvWx5eyZupS0iGY=; b=Lt9jOAaRl/I7ak4B2OrXaOB2H+
 TPDOW7rYY4kGV2QaF0wiwrVIF8GOC5VSkQX3CCOMjQqmtHPiiTemYdooeksuND826GJxRwg05RpZ+
 VwDcewWtsUvj2pP/YqmugJTzuhDaWPLjCKapWkVbYgrp697m6hZknxJwoUp0zwQiJT40=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4h-0007Qb-Ot for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=P/lum3pPXmAQziGnyzHyBlxHmZv8cv+VW/+JNTsjz8kisXiNymIbwGCEsP5pchP3sltOWd5ZHVfDWlOU2gk7h31/BduLeAkRfLnYoeRL/wuVVyZGu04NVk6IPVrLuaL4X/8DiE5mlaHI5YtaYUkTRv3N6laoDagWf+VoWpkpFpKBTBYA4paY/VqUbYhRs2fsAGm8Jdn4WnfWpd9PGcsxpZjJNMaUFeafFkGjsO8hQfVVVIwI9oq/jldJMBYXhKg3tJBLrxbjMPParzFKvjLMLJpDlWikax2JfkffnqOJR4qYmrkhCLy/uxgNKUBNermGOXVmlOYKL6Nox1bhX0oUcA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jq2STUu0OPNY00syPFv7jg0CFbIHIvWx5eyZupS0iGY=;
 b=pATb/tFYuIp1zZre8BoQo7OsFQNMf9DvtrLlalwuKCYgaSbd7XqEXFN7gJK2atfZm4Ex2gHye6sn2JZ5uLoNhSYLB34Pdi1iCAqrj5xVEm7sayqq79JUgG1E9QU30W0HD/SXzs4G9x3/JxNpmSY4y8SfjZCIYuG880unG1vHTT5v5jb8GVFuk0xMwx/2jsGDW63804s21z7AvOr+AVzkeX0pi7TZjkYfDzWk6DJGSfFdEYlIRzd/CuRB2CPKyY+oSt1ieAKUEvqUP4cgI6z4FRJqGKom2opap/OrnZmQIQvUCv9ngXKGnkoniN66TuCqvwPsJ3j0eDN7yKXfn1xTFA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jq2STUu0OPNY00syPFv7jg0CFbIHIvWx5eyZupS0iGY=;
 b=vV+/7/gXqoskTEIUMnIcoGJFqKd1JMsqKMYNZtZ+EWItiODyIzcOUW9zAT/ap2HNyhUwIx5s5XHiwy8L5UM/p00c+EIFtL0KEZAaRc+7VWgQKVGibNwAi3e3NSpJyZ9cCB1Gb+Mi/YH3zmYW79f/xsUX5ww0tWcEXt0M4DvSFwU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:34 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:34 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:38 +0800
Message-Id: <20241029120956.4186731-7-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 6864158d-fab1-4766-0cda-08dcf812d4e8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+q8tGmNrgVO/3y1mXj4bZabyO5GtpgAwgwBK5WG2n8btRX19cuVnxDOaZpB1?=
 =?us-ascii?Q?LDnIepC4BIwwZNmcSN9UhQ01jU9Bh/v2CJTSnqaa7evFYtX5C5+WT8z4FoKa?=
 =?us-ascii?Q?gzmZBeVze5Ojjt3hJjUPB3EwIJPOI4bpzUI259qKZiRf00/T/+rLSbruW/3t?=
 =?us-ascii?Q?JtsOY5iRowCz/sdmDyIUxX4tLyx4f3WoHCUQ6HIEIhVRCTZLKxZg09iRtDfS?=
 =?us-ascii?Q?YAXPhXs3XbpLax5peZ92Sq7oHm1XT4r2u/ZsjHiidgA8jVjbAZDTlejY0657?=
 =?us-ascii?Q?sVe2D0KGMVtTDM2NhB/Udq9cIYs9eW1Xmq6X4EIbWMEcfTV4qvAAqChPEBeX?=
 =?us-ascii?Q?1S7bdYV4SlRZUnBW1WsCm3gGEBUDFOtGZMAaRJ0LtXxez0c+KJzQUPoRcWRg?=
 =?us-ascii?Q?XW1urT8gbBg+LZvp3dTyJc1fkYTklIJEhJo9gtA1H7Y+X1fIT2sTihiWEgU2?=
 =?us-ascii?Q?tb0G9h9n2hXFFQQSGqiTLgLr/oK5Dph0PNuZDM9J28BS2n4l5wgG968ZwC3w?=
 =?us-ascii?Q?uqPlZJwIZnsYNvInzssryO4jaCPA/wY92axd39ls3VEqcFBcmd/2hfKkb7bN?=
 =?us-ascii?Q?hxOMHXSyj8NplB4mOJbLprUDUE9PKcFrVm+IE516his5RHQQqKcEUlXNtbrl?=
 =?us-ascii?Q?RAmKMSkH0R9G5Q5Je4oHfBtjgIt0pfrw339NpDfDVQsSD3X4aSzWuVzXGbT9?=
 =?us-ascii?Q?lbs08OC+Yt3HrKfCg84q51dQilLV2MTjrkoIFQgvcmKAVDu8ZgDdmKNUz+7X?=
 =?us-ascii?Q?FIZpQdfs1eXaufJ+bk02ryqNv39OrT4+FgqpPDBDrFQDng4JAXILji6SFrT6?=
 =?us-ascii?Q?4irxk/lt81a764hdHdXxnto5dhZWdO2NDWHQqX/Db6pn3iq1jDEmuwv1koV6?=
 =?us-ascii?Q?NdsI1qC46blFYWF2SyAnyd2Wwar1/m5vR9/oFHhIw9Mm86iDFYNMh4Cd22RI?=
 =?us-ascii?Q?aDcuw2wdxnH7s0ar11E4emyvgHLFdDFEFl941+RF59RFox2AxGgsKkBaUwya?=
 =?us-ascii?Q?GJgEZ0I/LxZzPhNybBGoClIGPEa07Y6oZR8FTGF6uomifF9ImUrFx9EJmEt8?=
 =?us-ascii?Q?rvgEHfVBNu8jVPUzSUieGuoYZ9ZhKwtEKPnSYFjk8LmacvvWFWAMSeyF9vGS?=
 =?us-ascii?Q?J97eo0YfER9yJvXHsNNAeE3N9ZR75oljeLZcqU6XTkIIUGtI00VuyCanxBFv?=
 =?us-ascii?Q?NZgTCju9666kSneC96Iu10Arg9DHLA4TTQqTpsr4fNW+7ILG4QQitC2xKAao?=
 =?us-ascii?Q?yYAO5ThZyqr2wuvFmTaBPxOZDMfpZi62TkA7gTmX/Tm42J7iaejSwxrPdoKY?=
 =?us-ascii?Q?+8OwFrQxyM9U3hR7a2b8lxH2sUoqDEXiGPBqtdsky8s9vZvBAajnzNLG1dlh?=
 =?us-ascii?Q?qWVoPrI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?q9EZBB+QaVmU3TjGbCE7SSWw3I/VLi1AupxJ1+KKoVgcjQU+GVvRhNE3X0Dn?=
 =?us-ascii?Q?5V9AhOQyxSLTgJZTEMDsEaXHa8EsYCwAkdDBJbeRV6oegeXLw50Pl5LZx1V+?=
 =?us-ascii?Q?X/RlVuTezIlQ3dRvm69EjK+5KZzEOeC+iNZTgQMgW1vFfXdwWrqmoJnUyYD+?=
 =?us-ascii?Q?k937yH3npSVu7ZJus1O0sR0HOBCe/pzsrMzxrcIYsD7NDjbIM7rHRtJO51d4?=
 =?us-ascii?Q?gFehI7KWzrCW8prPh6pz5CeO1w+cn0oHgdm9SxFDUAeph45VpQMoyYh8FIqp?=
 =?us-ascii?Q?MeWggVyWmBPn1JQlQEQtSp5Gr8wDrHhuE2sebEEJFXQXUs/JVl5COoxFTfB6?=
 =?us-ascii?Q?JyfmEMjB81papFmHnwbnxQVDuRKZxBXcKJyitPviRM8VB0Z0UAlBax5Ceys/?=
 =?us-ascii?Q?B2P5GbMnZmsslhAFCqe04kqMvvDU9Fxs6EzoLl22xCNJ1pTAfCQNIpWz0yEl?=
 =?us-ascii?Q?l+NIASgH1IE+KSkSHjfEzhvwW7OkCU8nTFBbN9JsHjUOj6Kedv3QfAM1u1Rc?=
 =?us-ascii?Q?OpXbh0HqSTCjoUv2hrMznVxlfO2FKaXUS2iP9udc2Rcnh1ZKaQzrNgwQyXUR?=
 =?us-ascii?Q?ng4gUNA08t+oio/mPkffibBhWBnLFyt/AokBios5hqmL3DWLmdBlr4Zd4Wtr?=
 =?us-ascii?Q?3WwdE8VBdVYm6hG6qL/8nhid61GuOOGKqz0BqF14R1DKIiuD21JoNYAcOPFV?=
 =?us-ascii?Q?eYqhdID2dduwFrrBlSAZWtYfQGjZshAKweJjCR8jJC5ByidTj0mQyxKc2rRg?=
 =?us-ascii?Q?sHAe7U/vAvfChynwVSe5MYCNYdg8/0zlHDD9Bs0udTn3aWN14Ly9UtVm6ZtJ?=
 =?us-ascii?Q?xTkx4x0xnkc6mKaFOzvGLC6FndUBSPgw8Um3dTs3Di0ZeEV7X6et2hkNjt1d?=
 =?us-ascii?Q?UD0SJQ/IwTfixXOs1IkriceeVl0bRMgUwtzhpcyuotK6WvyEIDpbQVXHfpcv?=
 =?us-ascii?Q?1DhuFlsNuy4oDcqH7UiA8PIL9vGOq2NuNuJykmKTy0hg1+pkE9dMVr36gMgV?=
 =?us-ascii?Q?qjT/F/F8FznRwCuYipAF75pe5j8R2Tow/BYfgipayp7Jv6VgtsYGIkPcPmnt?=
 =?us-ascii?Q?Gb+NWg4UQ9sMLIB/ZpkpdXJ63uT3Kvx1Z1fUKlZhVSB+at2x1EPvMvuVL/8P?=
 =?us-ascii?Q?McRT/cbqeOqxLqbmuGA1GdHknobTwaVldLBsBJ4RRIf0fpJGRf+qeZ5OCDX+?=
 =?us-ascii?Q?1Au7jFk/AGHY3r0EsRnfFb1PPjhidA+aWxRBePy2LjNgJsOUSuzoxtqmQjcy?=
 =?us-ascii?Q?rwinqTLUL8JfVVfJ7RZlasoWT69cAzcVDznzCsjq2HW1Gv6UIt4i0iq7CQ3v?=
 =?us-ascii?Q?1IWSQrj/UYOt/XTOzM/Ok+HdyCO7pOXAnUxDs2dRIHxQjhE/YPOEhbkTauxa?=
 =?us-ascii?Q?itRgacRBXUycYO5meIdxPH3sENSOnQ1e3xxpahMxQ2kek0BF0aCeyO5A8fWV?=
 =?us-ascii?Q?/CbHxufXflwb4gV3v3LfGN9JQlO7kBewCNISkFWU1mQPIRy2CCQFO8VSX1rY?=
 =?us-ascii?Q?X/57CrlseI97TDvM+wZn7xR4QCDysmVIQnitD05bG7qelLKo1+520W4h5g5f?=
 =?us-ascii?Q?+N1tNVaPMTBftf5RuOMFxHbCisennGR5/ZUHERGV?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6864158d-fab1-4766-0cda-08dcf812d4e8
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:34.6510 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kzjbx5Mq3+0KRlc3sJu7KSEn78dLm3QC+HPJo6+nwsoNReUMz5uYQU8XW93z45UkYkCReGlSex3OHgEXmiDF+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch adds new members in inject_node to inject inode:
 * i_ext.fofs: extent fofs * i_ext.blk_addr: extent blk_addr * i_ext.len:
 extent len * i_inline_xattr_size: inline xattr size * i_compr_block [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
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
X-Headers-End: 1t5l4h-0007Qb-Ot
Subject: [f2fs-dev] [RFC PATCH 06/24] inject.f2fs: add members in inject_node
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

This patch adds new members in inject_node to inject inode:
 * i_ext.fofs: extent fofs
 * i_ext.blk_addr: extent blk_addr
 * i_ext.len: extent len
 * i_inline_xattr_size: inline xattr size
 * i_compr_blocks: compression blocks

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c     | 28 ++++++++++++++++++++++++++++
 man/inject.f2fs.8 | 12 ++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index c997334ec57d..4a811b3a3302 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -197,8 +197,13 @@ static void inject_node_usage(void)
 	MSG(0, "  i_links: inject inode i_links\n");
 	MSG(0, "  i_size: inject inode i_size\n");
 	MSG(0, "  i_blocks: inject inode i_blocks\n");
+	MSG(0, "  i_ext.fofs: inject inode i_ext.fofs\n");
+	MSG(0, "  i_ext.blk_addr: inject inode i_ext.blk_addr\n");
+	MSG(0, "  i_ext.len: inject inode i_ext.len\n");
 	MSG(0, "  i_extra_isize: inject inode i_extra_isize\n");
+	MSG(0, "  i_inline_xattr_size: inject inode i_inline_xattr_size\n");
 	MSG(0, "  i_inode_checksum: inject inode i_inode_checksum\n");
+	MSG(0, "  i_compr_blocks: inject inode i_compr_blocks\n");
 	MSG(0, "  i_addr: inject inode i_addr array selected by --idx <index>\n");
 	MSG(0, "  i_nid: inject inode i_nid array selected by --idx <index>\n");
 	MSG(0, "  addr: inject {in}direct node nid/addr array selected by --idx <index>\n");
@@ -877,16 +882,39 @@ static int inject_inode(struct f2fs_sb_info *sbi, struct f2fs_node *node,
 		MSG(0, "Info: inject inode i_blocks of nid %u: %"PRIu64" -> %"PRIu64"\n",
 		    opt->nid, le64_to_cpu(inode->i_blocks), (u64)opt->val);
 		inode->i_blocks = cpu_to_le64((u64)opt->val);
+	} else if (!strcmp(opt->mb, "i_ext.fofs")) {
+		MSG(0, "Info: inject inode i_ext.fofs of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_ext.fofs), (u32)opt->val);
+		inode->i_ext.fofs = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_ext.blk_addr")) {
+		MSG(0, "Info: inject inode i_ext.blk_addr of nid 0x%x: "
+		    "0x%x -> 0x%x\n", opt->nid,
+		    le32_to_cpu(inode->i_ext.blk_addr), (u32)opt->val);
+		inode->i_ext.blk_addr = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_ext.len")) {
+		MSG(0, "Info: inject inode i_ext.len of nid %u: %u -> %u\n",
+		    opt->nid, le32_to_cpu(inode->i_ext.len), (u32)opt->val);
+		inode->i_ext.len = cpu_to_le32((u32)opt->val);
 	} else if (!strcmp(opt->mb, "i_extra_isize")) {
 		/* do not care if F2FS_EXTRA_ATTR is enabled */
 		MSG(0, "Info: inject inode i_extra_isize of nid %u: %d -> %d\n",
 		    opt->nid, le16_to_cpu(inode->i_extra_isize), (u16)opt->val);
 		inode->i_extra_isize = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "i_inline_xattr_size")) {
+		MSG(0, "Info: inject inode i_inline_xattr_size of nid %u: "
+		    "%d -> %d\n", opt->nid,
+		    le16_to_cpu(inode->i_inline_xattr_size), (u16)opt->val);
+		inode->i_inline_xattr_size = cpu_to_le16((u16)opt->val);
 	} else if (!strcmp(opt->mb, "i_inode_checksum")) {
 		MSG(0, "Info: inject inode i_inode_checksum of nid %u: "
 		    "0x%x -> 0x%x\n", opt->nid,
 		    le32_to_cpu(inode->i_inode_checksum), (u32)opt->val);
 		inode->i_inode_checksum = cpu_to_le32((u32)opt->val);
+	} else if (!strcmp(opt->mb, "i_compr_blocks")) {
+		MSG(0, "Info: inject inode i_compr_blocks of nid %u: "
+		    "%lu -> %lu\n", opt->nid,
+		    le64_to_cpu(inode->i_compr_blocks), (u64)opt->val);
+		inode->i_compr_blocks = cpu_to_le64((u64)opt->val);
 	} else if (!strcmp(opt->mb, "i_addr")) {
 		/* do not care if it is inline data */
 		if (opt->idx >= DEF_ADDRS_PER_INODE) {
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 5196aa46699a..691a40c889a0 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -182,9 +182,21 @@ inode i_size.
 .BI i_blocks
 inode i_blocks.
 .TP
+.BI i_ext.fofs
+inode i_ext.fofs.
+.TP
+.BI i_ext.blk_addr
+inode i_ext.blk_addr.
+.TP
+.BI i_ext.len
+inode i_ext.len.
+.TP
 .BI i_extra_isize
 inode i_extra_isize.
 .TP
+.BI i_inline_xattr_size
+inode i_inline_xattr_size.
+.TP
 .BI i_inode_checksum
 inode i_inode_checksum.
 .TP
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
