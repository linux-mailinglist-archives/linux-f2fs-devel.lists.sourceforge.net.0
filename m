Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A55A5914FF3
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:31:00 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkif-0002FR-Dn;
	Mon, 24 Jun 2024 14:30:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkie-0002FG-8W
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:30:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zOvhJIS+xFsE041MZhz+mb7CFLPWSyNsfVslzqmHHRI=; b=OQX2mt8prXO5o07uFAawcOXRB9
 O74V3lip0mRSQ2Tay0Xnmnk9XFUpoPLIApbrCdUYCHaeKgv6vktkzHbl5Z3q4hcwyAcu1LtHJ5cK2
 3UN4JxSdozHQ3MNBu8IgRELSIy14Z7wr08JyhJm69wgGhEwGx3BwLplSSS4a0J87gfNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=zOvhJIS+xFsE041MZhz+mb7CFLPWSyNsfVslzqmHHRI=; b=gIATj/wZWGo4VpM58+4YCSrWrd
 O2Dse3PdhrwOQAYg8qLOPWSUw8CqA/l7NC+nK4i08IdvC2OWOKz5EpVAfi2U0A0WjW+3PmpI17zwk
 fiNva2M82Bq9fkYW5Pg1e+gJUU7/tSS7LoD8yg83L6/FYA2OfSEEV+XAUQ/DilyaSgpI=;
Received: from mail-sgaapc01on2076.outbound.protection.outlook.com
 ([40.107.215.76] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkie-0004us-7z for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:30:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nsp/7sjXA9bGH50FVwYhTBCSfqdmkpNeNS5oVOokqQwiMwLamJtG+iVyQrbKpgsEhPIywGFh46++pCDY1bpYvCQwhedKc61GcJUnsUOVh2/gxHeFyQrsBUS18CJqhtF2dSMTFdvyGyY5OkTdVBeBPkn1otmbopM/s1qdEmdlE6D8C5P0nZADEd8rU7RXCbq8duEhJbQKrq8holt/LKU5wHg1U6ljJq/RG1omAitAZZH1ZKftPSEd+229mUe4qgv8v3j/phs3nKJosloBEUJ5FfzUSCnjVBohouRdzF7bN8d6ZOCR/tt+1MFVlBc6RXA0fga/5MzYd9IgJEgXczMNoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zOvhJIS+xFsE041MZhz+mb7CFLPWSyNsfVslzqmHHRI=;
 b=hYJ7fprbs0Mdo33EZ4sJIuCELvfntle3d8kugi2bz85g6LlW8U/WGg8gFBnv5HB8Z/6u6aRPMLczAxrduG5HAZXHHznoL260kxmyiyarUSE0jbtSp4XNOpg0dlqsfQHva6p6nKrFtWJc7H66fY1EbEjOWBQooS+Gmn9RXzc5t/qXOJ8/6BUNBUzsAkHsnnE74eojm/5luqT6v3zYGEJnjvwkDtnYDYLCGjQEQBPUUTb1SVElAipFJ66PgdKrOSs14JqScef5AKToMpi4oF9XxhWzxPGNPyypU9rQONkUyWDEZtTYy23lWDR1Ul/p+UoslgJxhc6r+sQDMqJ2/mYqmg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zOvhJIS+xFsE041MZhz+mb7CFLPWSyNsfVslzqmHHRI=;
 b=SIc7a+eaIWqi93K3zwKLT9OMTohAeD/745BZ6AYJItRWHgIyWVMts/FPh7h49sViGKjkdTen2l2X1zlDesDk1TtQTfQkbRboT+WWKbWDgcWDXLbid1UDPHU9uxZUDv2oY87PKM1v11KzN5C0THU+Vt0lMgkB76BAcPSSFM1iKPE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7515.apcprd02.prod.outlook.com (2603:1096:101:1f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 13:56:02 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:56:02 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:30 +0800
Message-Id: <20240624135532.3330136-8-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 62f137c6-cfd0-4a5b-6ba3-08dc94556249
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|52116011|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?IPz49tv8POfZc3OOFdW4silJD3LrEJITBU+qlKlL4mWTk04H4zaZIjo24zYM?=
 =?us-ascii?Q?OQ2FeWwePR6VQExWOnprWpRHCFgybrcIeMlxwOwXhXGCS4ssmaFvgbTw9R2j?=
 =?us-ascii?Q?Gy4OOP1q76zJsTLKk7sBE7Z6kBgDod9Y1nnDPzh6TB/kwKJkcEOG/II9T1Ch?=
 =?us-ascii?Q?Jug//Iwm1MgYn/m9Owb3Vstaxv0O49CxNy3Dxe/jI+ERWAUoIAawfldtezYy?=
 =?us-ascii?Q?4e0jveihLW/7hKB8fmlxz/gSeAgn98bKKRfov4/nWwuJ89l+6cnz6Uwv8eDH?=
 =?us-ascii?Q?R+A0h16ygI9OZ5/sz1CGupZdvB9x8MgRXhAhgXmvbqUh7aWDtBufxTb36PHU?=
 =?us-ascii?Q?Cx95kpm9JzjsNd/DRyaMvkALp8M/bIFC84wua9yQYlDrG8qj5C2/KOIzGBf5?=
 =?us-ascii?Q?jX3Eo7RmUOBUZN/ipd2065rzzd1nfF4Kw8njDzb0o++8PyFFjwIiOT3aTiP4?=
 =?us-ascii?Q?OQQJTvb5Hzr8tTeb8sPofFTAQk2GdpzETiBm8Pg69Olr6n7aMVR0fNcGakjA?=
 =?us-ascii?Q?HqLnrs1jqSSKdAYa3azHTWBlvkKa3xCOjPpUk1kZ0hLkMsp+OrR5tQrlqJ3N?=
 =?us-ascii?Q?JPogLd0Rj0kPe+0sL82Ah2waeqe6+IqZvy014NV/keg/Vem+/qjzxI/HCJA9?=
 =?us-ascii?Q?nb4ywpezmmqzyFVjP6oVT+C0UGm4RSwjtKmPKF4Qptyog5l/CHhPWrXYKwPE?=
 =?us-ascii?Q?zGtz6L9kks5+ArXnSpcRxVi9SZhYtdXUuVMAHxjI5xNanTluSsPGiPgY0dK5?=
 =?us-ascii?Q?O8EGZxxuFTlQTP7sYo6fY/1SMLBEZHGEJWWSQx/Ik2oPzeTdUO/6uRyq9azn?=
 =?us-ascii?Q?lk9KrL3F/m0wnWAK5L6eFvooLOmGnoWzN4Y/g8gKDghvGfjo1NTI0MVOzgrj?=
 =?us-ascii?Q?RhAOuBdEYYHH9OGCHMfDCQeZJMEifKaw1xSnjgoz7vXTEuPZj9X7f6BMWVAr?=
 =?us-ascii?Q?ZFsho/VZqlW/Qugj1z6VCWYYQN2O+e5rmfQOyG6FZPBBk3buXZ6Z8/ujZLx/?=
 =?us-ascii?Q?YUlb1UnErztoIxWxUmPT447Q8HrZtYpZfiUAc0kC/L2ZcOTy08RVM+KMPYeE?=
 =?us-ascii?Q?51GAkVf1eZvf6RjRS1cGQEHg/QJvqnb4K6rUHkwKMBoBBU31G1qRhCLx97ji?=
 =?us-ascii?Q?JfcHwZj0TQmeunArtFkc72QV64YKyF+8HOU3lcMRYOAXJrg2XqMz5hWUSxR1?=
 =?us-ascii?Q?4nJs4BtMaeV414DJDDR9kInfWtEcsrSenLMdR/YPWoANZPtiQuVj2sQZXIi2?=
 =?us-ascii?Q?D/+vioDSHeX38A3XU3NXpw6Ge+BMmix3soGRPxr9MugNBGVx1uPXCRnL/LXX?=
 =?us-ascii?Q?zv7sV2HPiZSzW+kZcWPKRKp5bsiOVF+wIeYMtrAzQNFAVR/ie+nXCZlQcD4k?=
 =?us-ascii?Q?vn22uzY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(52116011)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NDMZlmZJpA+pZmOxb2y4qJIDhj7EZtKc8IcBBUaypP1Lx4E6+pGQ8IABGGW/?=
 =?us-ascii?Q?+JvUdFj5JS4ADAhFu4Aaqk367v8wYWKt4MDZb7uDbv19UnOaWeyif/4lyMOE?=
 =?us-ascii?Q?4MmveXY3SREGCA19w4dx06B+QOmvx/h35Xj61lHtHzvLn57zBsKfJMjG4/Aq?=
 =?us-ascii?Q?vrJyMXXwTR7S/i/rsGrrDAGlcFFGEqzDu1Ld9BRIiXdA/fD205rOQ0o3lg3r?=
 =?us-ascii?Q?3m42GjnpPwJypJd6n52sNuDgRgdmMUkQV8dz6pPra2fK7XeeTF6/exNJpUkH?=
 =?us-ascii?Q?l5PI1i10eBzMv7BGp0tMO9SHF2m1Na23vwcBOa5oVOOD6/SXLoVciNaYB/QR?=
 =?us-ascii?Q?WrbAqNmfIE8vEID7qnHnrnjaXBr64Yn2j/dUngxH91ksawgj3qDt4cLhqk4H?=
 =?us-ascii?Q?vDBol4sDemOC83h2lVo/b/ReArj1/fQyMiXEAb1Pf9ifJ1r3A2fK+T2GFO2y?=
 =?us-ascii?Q?ghW6TLtEOLeSyk6DPJDOufecJ9AGHkHKyLupUFOm2c5s7X+4xZpedaQJYyiF?=
 =?us-ascii?Q?Ihbuk3J4CZfSmGbKQf/kpDvIU5Pe2Nd843n0V7bK1FDuBwfr8zQ6E+gqOqWv?=
 =?us-ascii?Q?12QcYMjtnSLh/QpJ7crVVzP6QWRGUcBf0tNnKFi57uqtt8Udz6hMF+RnDw3d?=
 =?us-ascii?Q?P8C3G5qrarK4Wa+dEvY/le7OKRvwMu65ah7oLM9iY7uh4OFGE2wI4VERbPl0?=
 =?us-ascii?Q?/3/lY1M9Z+A53+Ue5ztt1vcA1anUOhlaolgpf4UuO2aqY/92WpGyRYpjmchI?=
 =?us-ascii?Q?b8o4ps7JnNryP1Pvt0UuSadVXF9qqqK5YOTfy/THUGQK70Kt1RarupdWtLeO?=
 =?us-ascii?Q?eo2bTaUT26KZkIoFT9R1n3JMbKQcxF/xbThCVozRfiGSIBcN5mn5S7sCXPzh?=
 =?us-ascii?Q?C6ZgxYLmNgAqGWrRokz01zwQstkCoNM9DR6RjYuL+lUYqo5sxpyaOTcdWmW6?=
 =?us-ascii?Q?LAuR1I4rI03PeFOEIGWn2wmIlb9kMOIHpsgLycYIoQAeTUHIfPenDT4qKZvT?=
 =?us-ascii?Q?cEbmEk+2NygAhTtOuwJ39HmZ4AS1ocjBMbLRCRyUlDt6/QWRw5P9Jh7XokuP?=
 =?us-ascii?Q?YXkRKZnO3IF1pMb8WxfOdtqYKbWmUDoXntGpncRiGCW7uGYEIkGk/Yskf3pX?=
 =?us-ascii?Q?h7DOFY1hJPPg1WcQTTELgGwH/It6M9dcGLQxy8VVrJRHKvYWhEHJHbEnXbMn?=
 =?us-ascii?Q?dxJ2B3/Sh7pjeTrgEZw3be7971/ZHAI5ZvDVZDsS5z+zb5Z5H+3zfSy5XtDF?=
 =?us-ascii?Q?xx1JPwPHTSf4nBMU+iecnR2dND8Cuw2hWUJBg4Lv4vvLWdkmdOTxgYS4/duZ?=
 =?us-ascii?Q?bItcVVcbr/tXNtFIH/x+0b/df728iMqCMZJo0qx986EDys/QcZUzAPQ2DDss?=
 =?us-ascii?Q?ln0TQDo9jtmFvjzWXKE7enDUgOadHH6wiz3bB8HrFfbNYYOG0Soo//8QX6Sv?=
 =?us-ascii?Q?NWz+T+eFz5Hm38VXHhSogqzAun5WT2BG1RJZ4wEUaW9NOQxByU4dHD1letqI?=
 =?us-ascii?Q?Dnsu1jy9fqyvDFhcGwjFybATb1v165vVaUrrO4TAB88xuCkpj3sQ19dns7tg?=
 =?us-ascii?Q?wNw7pH+2y4aDB0IptoEGGfGEO5KAn7Lm0k9H5SzL?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 62f137c6-cfd0-4a5b-6ba3-08dc94556249
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:56:02.3575 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EFsaq6hQzKCtw0KpIeCQPYDX3ojybzVFYLBOtNSJEr2lnyj4ZTbom5hVJIjqenKGZfzvy6YOYDBvEuoA9s88dg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7515
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting summary block or summary entry.
 print_raw_sum_entry_info() and print_sum_footer_info() are added to show
 values of the ssa entry and summary footer. The meanings of options are: *
 ssa: means ssa entry is injected. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.76 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.76 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.76 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkie-0004us-7z
Subject: [f2fs-dev] [RFC PATCH 07/10] inject.f2fs: add ssa injection
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

This patch enables injecting summary block or summary entry.
print_raw_sum_entry_info() and print_sum_footer_info() are added to show
values of the ssa entry and summary footer.

The meanings of options are:
 * ssa: means ssa entry is injected.

The members could be injected in cp contains:
 * entry_type: summary block footer entry_type
 * check_sum: summary block footer check_sum
 * nid: summary entry nid
 * version: summary entry version
 * ofs_in_node: summary entry ofs_in_node

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 123 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   1 +
 2 files changed, 124 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index f854651..0f67f80 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -43,6 +43,25 @@ static void print_raw_sit_entry_info(struct f2fs_sit_entry *se)
 	DISP_u64(se, mtime);
 }
 
+static void print_raw_sum_entry_info(struct f2fs_summary *sum)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u32(sum, nid);
+	DISP_u8(sum, version);
+	DISP_u16(sum, ofs_in_node);
+}
+
+static void print_sum_footer_info(struct summary_footer *footer)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u8(footer, entry_type);
+	DISP_u32(footer, check_sum);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -59,6 +78,7 @@ void inject_usage(void)
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
+	MSG(0, "  --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -120,6 +140,17 @@ static void inject_sit_usage(void)
 	MSG(0, "  mtime: inject sit entry mtime\n");
 }
 
+static void inject_ssa_usage(void)
+{
+	MSG(0, "inject.f2fs --ssa --mb <name> --blk <blk> [--idx <index>] --val <value> inject summary entry\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  entry_type: inject summary block footer entry_type\n");
+	MSG(0, "  check_sum: inject summary block footer check_sum\n");
+	MSG(0, "  nid: inject summary entry nid selected by --idx <index\n");
+	MSG(0, "  version: inject summary entry version selected by --idx <index\n");
+	MSG(0, "  ofs_in_node: inject summary entry ofs_in_node selected by --idx <index\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -137,6 +168,7 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"nid", required_argument, 0, 9},
 		{"sit", required_argument, 0, 10},
 		{"blk", required_argument, 0, 11},
+		{"ssa", no_argument, 0, 12},
 		{0, 0, 0, 0}
 	};
 
@@ -204,6 +236,10 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
 			break;
+		case 12:
+			opt->ssa = true;
+			MSG(0, "Info: inject ssa\n");
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -227,6 +263,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->sit >= 0) {
 				inject_sit_usage();
 				exit(0);
+			} else if (opt->ssa) {
+				inject_ssa_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -551,6 +590,88 @@ static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	return 0;
 }
 
+static int inject_ssa(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_summary_block *sum_blk;
+	struct summary_footer *footer;
+	struct f2fs_summary *sum;
+	u32 segno, offset;
+	block_t ssa_blkaddr;
+	int type;
+	int ret;
+
+	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
+		ERR_MSG("Invalid blkaddr %#x (valid range [%#x:%#lx])\n",
+			opt->blk, SM_I(sbi)->main_blkaddr,
+			(unsigned long)le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count));
+		return -ERANGE;
+	}
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	offset = OFFSET_IN_SEG(sbi, opt->blk);
+
+	sum_blk = get_sum_block(sbi, segno, &type);
+	sum = &sum_blk->entries[offset];
+	footer = F2FS_SUMMARY_BLOCK_FOOTER(sum_blk);
+
+	if (!strcmp(opt->mb, "entry_type")) {
+		MSG(0, "Info: inject summary block footer entry_type of "
+		    "block 0x%x: %d -> %d\n", opt->blk, footer->entry_type,
+		    (unsigned char)opt->val);
+		footer->entry_type = (unsigned char)opt->val;
+	} else 	if (!strcmp(opt->mb, "check_sum")) {
+		MSG(0, "Info: inject summary block footer check_sum of "
+		    "block 0x%x: 0x%x -> 0x%x\n", opt->blk,
+		    le32_to_cpu(footer->check_sum), (u32)opt->val);
+		footer->check_sum = cpu_to_le32((u32)opt->val);
+	} else {
+		if (opt->idx == -1) {
+			MSG(0, "Info: auto idx = %u\n", offset);
+			opt->idx = offset;
+		}
+		if (opt->idx >= ENTRIES_IN_SUM) {
+			ERR_MSG("invalid idx %u of entries[]\n", opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		sum = &sum_blk->entries[opt->idx];
+		if (!strcmp(opt->mb, "nid")) {
+			MSG(0, "Info: inject summary entry nid of "
+			    "block 0x%x: 0x%x -> 0x%x\n", opt->blk,
+			    le32_to_cpu(sum->nid), (u32)opt->val);
+			sum->nid = cpu_to_le32((u32)opt->val);
+		} else if (!strcmp(opt->mb, "version")) {
+			MSG(0, "Info: inject summary entry version of "
+			    "block 0x%x: %d -> %d\n", opt->blk,
+			    sum->version, (u8)opt->val);
+			sum->version = (u8)opt->val;
+		} else if (!strcmp(opt->mb, "ofs_in_node")) {
+			MSG(0, "Info: inject summary entry ofs_in_node of "
+			    "block 0x%x: %d -> %d\n", opt->blk,
+			    sum->ofs_in_node, (u16)opt->val);
+			sum->ofs_in_node = cpu_to_le16((u16)opt->val);
+		} else {
+			ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		print_raw_sum_entry_info(sum);
+	}
+
+	print_sum_footer_info(footer);
+
+	ssa_blkaddr = GET_SUM_BLKADDR(sbi, segno);
+	ret = dev_write_block(sum_blk, ssa_blkaddr);
+	ASSERT(ret >= 0);
+
+out:
+	if (type == SEG_TYPE_NODE || type == SEG_TYPE_DATA ||
+	    type == SEG_TYPE_MAX)
+		free(sum_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -564,6 +685,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_nat(sbi, opt);
 	else if (opt->sit >= 0)
 		ret = inject_sit(sbi, opt);
+	else if (opt->ssa)
+		ret = inject_ssa(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index ece4915..c828f3f 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -30,6 +30,7 @@ struct inject_option {
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
 	int sit;		/* which sit pack */
+	bool ssa;
 };
 
 void inject_usage(void);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
