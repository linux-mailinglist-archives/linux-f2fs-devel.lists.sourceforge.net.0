Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 739F3914FF5
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:31:25 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkj6-00007h-S4;
	Mon, 24 Jun 2024 14:31:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkj5-00007b-OH
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:31:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iohESym0hMEMsIt7cKZdAuJhsVLYFFLlIIgu3OiqWqI=; b=mf1+/xzfj3bBrRnalQ5DsphW1Y
 0R+omJ9dva/DylobNanjonQqB2A6JAk0rSuHiOeLPuDUBhybOJXnQTxYbpo1XWRHaKTnoJvtkKpCq
 Hp/nx6LQYbqIZczGAjArG120aDm+geHjaL1dJbXaQvYW1WWlW1YJUUp5WJZX0WlAdxJY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iohESym0hMEMsIt7cKZdAuJhsVLYFFLlIIgu3OiqWqI=; b=YYSxgf4MifBvpK1UHREomPC+M5
 XaoVwDWPFSbsbWDTq+xH4FLSr6h/PZ+0m+6Wd3adaOiqAFmvWVeLYD+fyZ2c920SJhOVlas1qbk9I
 yJHZfAQMWEreIzi5O2mQqYHsCKqKsDp5flxYCwTaah6tPnHuIR9GlzKta1YEp+T/IXBg=;
Received: from mail-tyzapc01on2077.outbound.protection.outlook.com
 ([40.107.117.77] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkj4-0004y3-Uo for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:31:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=HBItx3x+bLTP7aRVzF9JR6rZKWmHMt57nc9cN7iynLULSYTI7HwsmrOA0b+swejavrdUPDNKc7MdeBKznQqu566XRtdsRHndo91OtIeKQDrAla8EiFh+XwfSzQsf1YSgSaEZnx2FQkbE5gcIWN6WqHO81Hw80qp9/FkkFcFZdkAvkZ7IDuP4Grj1bZqjoRV+FNDvCo/r1Ax5OXCqKYtmoci5YbplS8T8y3zsSCBYv8A3WimW8m2FOs4PPV0CadiJp00jIS2D46rZFsQOu9ActaVSQMms0VE55ojHtGzA4xNgnwTmU8d0Bra/7a/n+Ywr3PEeaFLrqNhPagk03KANqQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iohESym0hMEMsIt7cKZdAuJhsVLYFFLlIIgu3OiqWqI=;
 b=gFj+R0mf/bLdruB3Mr5WcFdcfIPDf0MtKr6/9/owMmhhXLP3ezGB9kUsnQ6TazaONsPOH/Kv7fkSEhldqywLXfwjx6bVyTu7q0ZaAPaXsccbcT0rxd1878HhkBxxBvDGTM1Fb9XZ5TTUQ1L3kBtkob0O/HufuRuOIpWdZWu+SBy4yuTl9hg8UsaLYq3TN/10dXIbw0e21FdocLIo3+TYWwhVkUxBXeryCsb4ja/k1RiZpwSBf+sMl1UCZ8ynkO3pYeuZXYBlAJ7Cr1DpSa8wg0jnBXOlGq86P15aLaK+Cuq6NMlu7j6a6BslqmFnh2JlZab1xvBhkRIUp39Gn3GzPg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iohESym0hMEMsIt7cKZdAuJhsVLYFFLlIIgu3OiqWqI=;
 b=Z4RTOQc7zYWJs+nyOEtnbGPogfbdBnfQUdmKObAmVXVLSQxR9bnsDLkdiTAwJ5bSTINXdjVHWH5tVBjBlOnEJ1D5OANQ8TE+HORakGshcBWStxSelnM+xRePNhQE7/gyPU2FouAdJS/ihliXTFtqqaVaKtLCxP2sCr+D9pKahsk=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7515.apcprd02.prod.outlook.com (2603:1096:101:1f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 13:56:00 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:55:59 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:28 +0800
Message-Id: <20240624135532.3330136-6-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 8078fc18-18ac-495d-23bd-08dc945560cd
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|52116011|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b5wAbeEra/tXWs3+o/eLK0KRtD84vzJtWPIjGQmm1JHHjU6l2vzMX69Q7BM+?=
 =?us-ascii?Q?N4ar6Gi60OTSzauqy1cSWOQd/QTDO6jG7FqcxZflI3Nnz5S6wrJO46gfMA2k?=
 =?us-ascii?Q?scC6FYPVaBW37dY9lE1FDQol6Y+e0HVR5WW3/wia6xbGBCC5j82fkAL1IAP2?=
 =?us-ascii?Q?ZnUOFsNHdUbWUmb8XiQFYQcouVGjL9eBzkd3mDEu4i9pBOdwRKxmWraKoExg?=
 =?us-ascii?Q?vC3/wuPGSaJ0Pefs5o96y6BZ6k9izM4SZimlOSHqZ8WOZB8Uw7LxY1z40gXs?=
 =?us-ascii?Q?QCa0EAFi8WMqbNLx60FnzILUjNYqad+8kZbTTeRArYbdTElLfpx0UqYwOgwH?=
 =?us-ascii?Q?rUlXPghLUDpMMk4EUDFb9mVEQGi3FmGmYRfx266lc2yKVh2PK2+/TzRBRTeT?=
 =?us-ascii?Q?RqALU3AenE92G0IcVXd16OlRGwEjlr34g8P12VCwOtm7a2tSPnaei3SLDlxk?=
 =?us-ascii?Q?dQRdXyriYJPuPgqJ9yXZHlei3XN9KHvJtErExIceTLFmfopa/jGC5KLbnHvK?=
 =?us-ascii?Q?YA4VA2rF516kwxAesBBKB2Yhip6tOmDiovFCZaXjUOrw6ENXD/9AUnPbOc2Y?=
 =?us-ascii?Q?1/Aa4EjPQzTPr8kS8NAM/AFt0rYECGPI83wttH2S3QCD4BwpLiaGJyRnNsjo?=
 =?us-ascii?Q?vd/8Q4XQ1aY2eJgzvY7kSu+DhUsV8iYJ60BYJOcjSddHf5/VNLeqkzOptfio?=
 =?us-ascii?Q?APb5CQnjBmAuufweipcdhRq7WU7Gem0+usPu99OCbwbccVdsLQtg/rbHJC1Y?=
 =?us-ascii?Q?sfE6G64qXOhvWK62t80GwjGbD15FJ8LTKg3G1MvSxKL8L3weySwKZx9VxW/a?=
 =?us-ascii?Q?SJ3fthVhYpWPsQWrCAiTY9YiEE6LzM9b3ODbKG/2RkjvZwG8asJQSoGPRcMx?=
 =?us-ascii?Q?X3WKPmsQ7Zygefl1LuMimvvjRl1sAIDtespm2jPle/lsceHEmikYHzNHjvJr?=
 =?us-ascii?Q?1/k3R8JJ3+1QCBOI9HRyTWOdgJE3o2iXdHkLd+jEl8PsidNUIdbF8hLZCUU3?=
 =?us-ascii?Q?cjTyWMPD4wvcG7HWwUKcswamVvfH6s0RbVuHwFss2MIzAwJfLqM+jHLRa5D2?=
 =?us-ascii?Q?VPa9B4dDQ0hQAqybVfdVCW6WJ/C6Jr0xq0Z5//m2AlSNwQqe1xJQq/qjt3C0?=
 =?us-ascii?Q?wP6e7eCn/UPnfosgmb70MfbB3aefE/aVrBphOaiP6Asq722CalirLf3dyGGp?=
 =?us-ascii?Q?e6JCW7h7hfrYhyVhdIsMxidgDPyo13i1sublTa/KBgWalw2oqLWFg+4FFP+G?=
 =?us-ascii?Q?t7E1wP1EFAiJyGmG9zXFxukM6dfcQftNdljN4t4YKc6EYB4f5GDXvVbJm4Q6?=
 =?us-ascii?Q?3Zl9JL47DvNaJUMeMtmMiym+RonxZBmhpS8zpV7EOhUFo2FhOT98u2gGMwDY?=
 =?us-ascii?Q?31z7ctg=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(52116011)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ohjqJkaVNmYHoxpKtluVUFQDHukLXQellGeq71+NiRNe/XSHPUiIn305dOXG?=
 =?us-ascii?Q?6KGCdKDZhSWQSM5ujwerdLVWOYFtveNdBA+cn1RC63H8iVdBcjOp7/q8QW+y?=
 =?us-ascii?Q?69RPDR+kDOJBeu63F4xy7vzg1ShYRCDrhoV5He2hHnFaQrCnDN/ViJbLKGq7?=
 =?us-ascii?Q?CaXLlieTC1jkkrAFaVF79Vve0wvWBzzlA5BvV65OdeFfqGDij9TIyCS7vr9h?=
 =?us-ascii?Q?vJgxoB2FcCCHIvxV+0ML3sYbVWVOxQU/VuqpO52oyZ2tnEoDGpdvNleM/U0E?=
 =?us-ascii?Q?YVPHRHdfr/UiUQEvJZS7wZjXE9NijHtcwfN8qBs1On66Gs5nbTcSvyZwz0tE?=
 =?us-ascii?Q?nnZK0Z+yjUq9cZaHr3aCDCQvfgXAmVyy9U/+uEiG7Fp14VvisQkV/ouB7a++?=
 =?us-ascii?Q?YgzixI+3VdaIQoEl2aDfkX0EVes8gpAbUi1z9VyS4kEMuM+FjYIsqOFk9agW?=
 =?us-ascii?Q?Y10TuwukLjD1etLGSlV0+D1s7leYzs8G1+WuId7tgddSlGnPiR1glVev3g4v?=
 =?us-ascii?Q?BYU6I0eBl7UVe/MSKWzU1OhCtW8JpqPeg7pY3KO8G7G+6jEStCDU27Oo4KWY?=
 =?us-ascii?Q?khtBdbfTM0SpMcdfQaTClieYRf0F6u4/a28vP0IGbJFZZ3Idt+y4+scu93di?=
 =?us-ascii?Q?TTs5WOY3jdgkG12KtYmdJyne38WzXow78/0+/xu4XXaOYPeWmeQYJF1bVqQL?=
 =?us-ascii?Q?E7UBdVfQH+1c4UG99t7sxUYhH8akFUiygub8xbn2Gupb+4xFja8AjtzxcQYX?=
 =?us-ascii?Q?zMeANga6/c2sUbuAIuiZIAEWU5G2CvWZrCjSnRtLROzJ1pmPEIWbmpF0zs1j?=
 =?us-ascii?Q?JBJThohURRdA7loiAqhWZ/myBH8eY7z0hLkK9qxamjfnKYYKU43mzqHV6DJO?=
 =?us-ascii?Q?N3VoQiwh+8XcyfUQIgWSfVGihQOy0yE8Xa1s+sgAiI6Zrko1TXlphFOU/bFn?=
 =?us-ascii?Q?4mi7Xur4J0jXxqP01aEzMqZqKSj0aGhdSGYz/gZNGMdYAcRF2BshOU0vtdGt?=
 =?us-ascii?Q?GotBlXH/VmwtRFmzbqIoK0hAkTa5eNCqU6DZurn+PonVHWLDcYH/HjWh3QH2?=
 =?us-ascii?Q?VQrcstoxKGIjGBpbOdznQg9bCZwBTAV+maJPQR5JNzmQHJKUCq6SsfDVwMQm?=
 =?us-ascii?Q?O/73EAV86LIJFYI3C7mjnFAiLfZSAJEEeZ8m3RByOamy3IlBHcULn71/WEm5?=
 =?us-ascii?Q?vwLfIX7BmEuQN1JW+bnww8jV9uvrZ0H7rUMAjmgi6ULx0jslVu79xlh6rMzR?=
 =?us-ascii?Q?lbUkLWirvH6l89Vl3br+1fd3DELO82hhqVzAtRzYs4tGFKJWYdWY24N/l6Zm?=
 =?us-ascii?Q?kDGsIFsKK1I4aCR5T5ou2a64ePWU1jez1b1oBLgsTuJbUyxUhm1bowmqzztP?=
 =?us-ascii?Q?JQeH5kyjQSXe0Y6HpbaTiyUSta/abgghrEbfjYTT8kq7frCvDMYIiOs3Uiny?=
 =?us-ascii?Q?WvcA2uoqWTYNej8iXmyQxz9K0NAdLCxuyyvc5c4cwplhaZUgbCQEAX40Nq4i?=
 =?us-ascii?Q?btwY7v3/2GPVMl8mkKDTK/msU1zTbtpbGJuhyPJaYMtODwLxeqXfQ1ZdSNYt?=
 =?us-ascii?Q?c8XR1RIc3XzdnCVjGgwjVFb+IoExlisf6NgVxoph?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8078fc18-18ac-495d-23bd-08dc945560cd
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:55:59.8597 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +ZlcAx5vR+wu/udhZiV4KU90t/S3g2JDfbF0gN71RI2hJwyKVXFae/YKapmkldfZa36oqsI01ok5pUGpGb8HRw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7515
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting nat entry.
 print_raw_nat_entry_info()
 is added to show values of the nat entry. The meanings of options are: *
 nat: means nat entry is injected, its argument chooses which nat pack to be
 injected, where 0 means the current valid nat is choosen automatically. *
 nid: is the nid of [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
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
 [40.107.117.77 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.77 listed in bl.score.senderscore.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.117.77 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.77 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkj4-0004y3-Uo
Subject: [f2fs-dev] [RFC PATCH 05/10] inject.f2fs: add nat injection
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

This patch enables injecting nat entry. print_raw_nat_entry_info() is
added to show values of the nat entry.

The meanings of options are:
 * nat: means nat entry is injected, its argument chooses which nat pack
        to be injected, where 0 means the current valid nat is choosen
	automatically.
 * nid: is the nid of the nat entry

The members could be injected in cp contains:
 * version: nat entry version
 * ino: nat entry ino
 * block_addr: nat entry block_addr

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 119 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   2 +
 fsck/main.c   |   2 +
 3 files changed, 123 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index e7ec329..c2deaba 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -12,6 +12,16 @@
 #include <getopt.h>
 #include "inject.h"
 
+static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
+{
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u8(ne, version);
+	DISP_u32(ne, ino);
+	DISP_u32(ne, block_addr);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -22,8 +32,10 @@ void inject_usage(void)
 	MSG(0, "  --val <new value> new value to set\n");
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
+	MSG(0, "  --nid <nid> which nid is injected\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
+	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -59,6 +71,19 @@ static void inject_cp_usage(void)
 	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
 }
 
+static void inject_nat_usage(void)
+{
+	MSG(0, "inject.f2fs --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
+	MSG(0, "[nat]:\n");
+	MSG(0, "  0: auto select the current nat pack\n");
+	MSG(0, "  1: select the first nat pack\n");
+	MSG(0, "  2: select the second nat pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  version: inject nat entry version\n");
+	MSG(0, "  ino: inject nat entry ino\n");
+	MSG(0, "  block_addr: inject nat entry block_addr\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -72,6 +97,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"str", required_argument, 0, 5},
 		{"sb", required_argument, 0, 6},
 		{"cp", required_argument, 0, 7},
+		{"nat", required_argument, 0, 8},
+		{"nid", required_argument, 0, 9},
 		{0, 0, 0, 0}
 	};
 
@@ -115,6 +142,18 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject cp pack %s\n", pack[opt->cp]);
 			break;
+		case 8:
+			opt->nat = atoi(optarg);
+			if (opt->nat < 0 || opt->nat > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject nat pack %s\n", pack[opt->nat]);
+			break;
+		case 9:
+			opt->nid = strtol(optarg, NULL, 0);
+			if (opt->nid == ULONG_MAX || opt->nid == LONG_MIN)
+				return -ERANGE;
+			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -132,6 +171,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->cp >= 0) {
 				inject_cp_usage();
 				exit(0);
+			} else if (opt->nat >= 0) {
+				inject_nat_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -306,6 +348,81 @@ out:
 	return ret;
 }
 
+static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_nm_info *nm_i = NM_I(sbi);
+	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
+	struct f2fs_nat_block *nat_blk;
+	struct f2fs_nat_entry *ne;
+	block_t blk_addr;
+	unsigned int offs;
+	bool is_set;
+	int ret;
+
+	if (!IS_VALID_NID(sbi, opt->nid)) {
+		ERR_MSG("Invalid nid %u range [%u:%lu]\n", opt->nid, 0,
+			NAT_ENTRY_PER_BLOCK *
+			((get_sb(segment_count_nat) << 1) <<
+			 sbi->log_blocks_per_seg));
+		return -EINVAL;
+	}
+
+	nat_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(nat_blk);
+
+	/* change NAT version bitmap temporarily to select specified pack */
+	is_set = f2fs_test_bit(opt->nid, nm_i->nat_bitmap);
+	if (opt->nat == 0) {
+		opt->nat = is_set ? 2 : 1;
+	} else {
+		if (opt->nat == 1)
+			f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+		else
+			f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+	}
+
+	blk_addr = current_nat_addr(sbi, opt->nid, NULL);
+
+	ret = dev_read_block(nat_blk, blk_addr);
+	ASSERT(ret >= 0);
+
+	offs = opt->nid % NAT_ENTRY_PER_BLOCK;
+	ne = &nat_blk->entries[offs];
+
+	if (!strcmp(opt->mb, "version")) {
+		MSG(0, "Info: inject nat entry version of nid %u "
+		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    ne->version, (u8)opt->val);
+		ne->version = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "ino")) {
+		MSG(0, "Info: inject nat entry ino of nid %u "
+		    "in pack %d: %d -> %d\n", opt->nid, opt->nat,
+		    le32_to_cpu(ne->ino), (nid_t)opt->val);
+		ne->ino = cpu_to_le32((nid_t)opt->val);
+	} else if (!strcmp(opt->mb, "block_addr")) {
+		MSG(0, "Info: inject nat entry block_addr of nid %u "
+		    "in pack %d: 0x%x -> 0x%x\n", opt->nid, opt->nat,
+		    le32_to_cpu(ne->block_addr), (block_t)opt->val);
+		ne->block_addr = cpu_to_le32((block_t)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		free(nat_blk);
+		return -EINVAL;
+	}
+	print_raw_nat_entry_info(ne);
+
+	ret = dev_write_block(nat_blk, blk_addr);
+	ASSERT(ret >= 0);
+	/* restore NAT version bitmap */
+	if (is_set)
+		f2fs_set_bit(opt->nid, nm_i->nat_bitmap);
+	else
+		f2fs_clear_bit(opt->nid, nm_i->nat_bitmap);
+
+	free(nat_blk);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -315,6 +432,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_sb(sbi, opt);
 	else if (opt->cp >= 0)
 		ret = inject_cp(sbi, opt);
+	else if (opt->nat >= 0)
+		ret = inject_nat(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 907309f..db45fb9 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -24,8 +24,10 @@ struct inject_option {
 	unsigned int idx;	/* slot index */
 	long long val;		/* new value */
 	char *str;		/* new string */
+	nid_t nid;
 	int sb;			/* which sb */
 	int cp;			/* which cp */
+	int nat;		/* which nat pack */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index 0318873..3ab49a4 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -820,7 +820,9 @@ void f2fs_parse_options(int argc, char *argv[])
 		static struct inject_option inject_opt = {
 			.sb = -1,
 			.cp = -1,
+			.nat = -1,
 			.idx = -1,
+			.nid = -1,
 		};
 
 		err = inject_parse_options(argc, argv, &inject_opt);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
