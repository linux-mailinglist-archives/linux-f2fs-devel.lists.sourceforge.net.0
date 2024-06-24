Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F04A914FEA
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 16:29:30 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkhC-0005C7-AL;
	Mon, 24 Jun 2024 14:29:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkhB-0005Bv-1d
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:29:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LYLBi3KZh5mCffkoxkRYX2vtpRjqRotR8GMfHoh22gw=; b=l2M9DP2NTTQK6kRLpQC8YxJFPS
 7PihNViPC52HJrlDonbWqAwBmK1A1x02Fka8bpruLz+R9gnOJpq2Bflqq3sILmvG/mWRMfbWHkgyf
 CIiNdng+0npNVCJQB5SEV4gnWrEAMPshIE2XeXDigxl+gYN1BNV0TyWE19I0gF0aFxYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LYLBi3KZh5mCffkoxkRYX2vtpRjqRotR8GMfHoh22gw=; b=U9sHn4rLHSFGDIjaKqxFe7a+tY
 zL8Qv7rs13O50fEBkJ5821aT6GhjKdeKUIixhCdUFqtaxcPVCdVK85xKu/XnwCItrJXHj7tHPsCh1
 xMBodFodFuPhtPxNEJG1g/+DHCECPpeaFwTAQjXL0e3EcywdlzawNT0lTA+nHV8GCO20=;
Received: from mail-sgaapc01on2056.outbound.protection.outlook.com
 ([40.107.215.56] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkh8-0004kM-Vl for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 14:29:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Ptb6xe5W8enzOATTEa0yk6R60S14a/O+PDtOnzeswFRd4dYqjraS577pNhz0daJVPson4mVc19yXlUQTH2RmtX05YrZ/ku1dOaM09JjS/bgEbzilQkKfnaDx7SO0CYsfQMblLigy0wBxFJyWkPY7n0uDw95M8p3B1vlv1GvxMmMKflJKkPIRmOEG67233qLaPalb3xMIzRer55bUhxpqCxFfntdBG2FQKF5vZozN0sD3trKUciodGHZyoWiftcQTEcQ2yeOzo+fp6LnlaV4H2jqu86UQO/4cpWRjxydztY8fpqDWA8Kk7egLtwEpf2aHxgT7THnlxHaJBho3/QV6yA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LYLBi3KZh5mCffkoxkRYX2vtpRjqRotR8GMfHoh22gw=;
 b=T/haH4L9tPU4bd0QNUOO/XSYoyi1cNk4RWiCCy3IWX5sToylq1ZdjMKunUC4sjJi6CgbZw3LbckNEfEcCP8846AOHGvh+unCN/4oNLMrxgVGZ+9+liIQGfgv0aYiqRHZ2LjCGM/gl0BtT8V1bz4Dnz6p7ZVXM4Fh3hHfAhmovti2AJUrSk9G2hFrNXVjgUVbuFoleJAcsDgq0YsBrwbVHMkc0ZnksYzqI+EL57pL4KljF2nLnxLYEa1YELKE8IC0NrEzEAqR7BqvYjaTb2jKkdEXx8L0FSXKhGzoRBUKmgaCCNggvWtOWNq8afeuEDLMa6mnsj7+Ta5xI42LSeWZYQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LYLBi3KZh5mCffkoxkRYX2vtpRjqRotR8GMfHoh22gw=;
 b=nCL3KXip5Xor4d01zyOTf/vsooYA0NqB1wtPswpxSFe/eiA2dLy29o+EfH71AnyqIkTWOp/eAIucVoUeFgxMEz5l6s3ScTpyHauWKxC1L7xormBvxBLVVctE29BD4iw2DJTq9GN4+d1loc2KxPXn2TH5p+i9GHZlMMXtHyusA3Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7515.apcprd02.prod.outlook.com (2603:1096:101:1f8::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.26; Mon, 24 Jun
 2024 13:56:01 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:56:01 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:29 +0800
Message-Id: <20240624135532.3330136-7-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7515:EE_
X-MS-Office365-Filtering-Correlation-Id: 19eed5e4-dd2b-463a-a42d-08dc94556189
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|1800799021|366013|376011|52116011|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?rDAyNclYiP+5dv+ctJ8ALoqe3penk2li8D+zF6BCGtgeRY7W+e55J48lDG1T?=
 =?us-ascii?Q?wSg4Z7qIH+PaqVXhMZh9ZPopIS85j1dZgP82fIWuhwI1g4Egdn0xTLBgaCzI?=
 =?us-ascii?Q?yztqXSUTBCH5Qugegpv5TYwJ4Ak/KTMIL/kMKU628NXBbXmDR2oUMgaObQku?=
 =?us-ascii?Q?w2byqUd5x/EWi7jV+iMyspPohKh1eWb5N9tMFjMNtwXtM7MvHfeKUusuWV74?=
 =?us-ascii?Q?T+MCoEyxt6jIc9antetD/jxk4vgGOCLEy6yXYoN0tO9fMZGrXNnF2T7wXhK2?=
 =?us-ascii?Q?awGbEwA5nw9zqpCRrEQSsmEk1DPNSU3q01iVGZD4CCEoIAJmEFtfxmILzzz9?=
 =?us-ascii?Q?AaJKDeXkES8+VqOtHoZw8cOKRZDfG5LhOsSwKdDB42aMrALfgTusVfKbr7dX?=
 =?us-ascii?Q?jdyVph4DOarnexKJvi4C+xtfeeCWiw52InMXiMmxllb5nyad0xg7aJbdnfvJ?=
 =?us-ascii?Q?nzNIdgSn62NZOItRVUBHDgXBLOPA3kG1/o65nV+IkAJpkUXd+a6+3HEHoqqI?=
 =?us-ascii?Q?x9RVO8Lvwl6rChZl2JfQjweEo4wOgM9ZKHVhGaW2qObXIZKUeqds1oDR+m00?=
 =?us-ascii?Q?pzsZR+kPC017act1ekul5Ro8BdWODe5XCdE7CZM5nGLHkfcXVjKX9xAmuuah?=
 =?us-ascii?Q?YNLaMgOjEbhi1MG8Pwfz0949cY04BfILuNATmbAGdlVvbkCp2e+Nu3j0jqSi?=
 =?us-ascii?Q?nPVdRmI74TbWD2+nCVA55gw2pr2xbzsvMJqdYl+oKznHZB8beMPJ6Ikd1O5s?=
 =?us-ascii?Q?w64RxOd0wGeHaeFzxx9+9uXZ29lqRW7J6WFcyVod3EkYTvJIYV5oklYzUUC6?=
 =?us-ascii?Q?oHXMLGbvIPa9kq7IjnSwPJ+fGqccKaELY2P9h9jCF8ZGGcmzGfdEbK1qwt+Q?=
 =?us-ascii?Q?ArQkJRvkV2pGzeIphCZVk2ITfYex63DXXivuTDr/LKizciRPFczI2hlvdNDQ?=
 =?us-ascii?Q?3MHwDtiOcmOpqk72XDfL9sm4nCFlbO2WoZCHEAKBSAuPWM7OdNrDiySWe3Un?=
 =?us-ascii?Q?5ijb5Zh/CvD7syBPno+9qeLg2A222kYay34EwPw57D0p0NyOAkbOzHTGWNJI?=
 =?us-ascii?Q?b0PKOVSrp4m/oPy1NZ15VtU61a75du4h9JkSKUACyjrz9/rRIrf/L7src9ge?=
 =?us-ascii?Q?s6nFaBIJu2XjQF6uj7jxg/OEZigjlh4SDZ2xS0M+aOj2sEukVAsducdfW7VU?=
 =?us-ascii?Q?zWZbfrgO2zRECidATxa6qoJzAYSEAEydJxvq0DQG2CJMtvyiBWaFjsOmmdwr?=
 =?us-ascii?Q?BbNMM0GnOkmW4LVU0HdacW+s6i457+Hy87t10ebi+ZeC/XRumYxJNuUcIIw6?=
 =?us-ascii?Q?Y7ElaqYWLHxJhtEmkHULBbzDNBFebw3Rd5WonZFhhqd6hHf2KkOlxdn2f5SK?=
 =?us-ascii?Q?30N+4+A=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(1800799021)(366013)(376011)(52116011)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?iGh6ycajTgAx6k93E1WNO1o5rlpGW0cexcUFCRBATMkg1+w3D7MHU5+VEoMw?=
 =?us-ascii?Q?BO+hAJbS5s3i/O51E2C2hMfa6PsnSCmBNNoGTXJgroJ99FsrrNvRo5ETcf1v?=
 =?us-ascii?Q?o+crAJzIK68vjuCIcpc4i3LN0+0RdRYJGq+Cd0cd4mqmf6ahZzOoYar+52WE?=
 =?us-ascii?Q?UVKa3vAW93LLrlZjZqCdEfBtH5TDa5ey+aFJdSgllg7/qFR64PzgM+4UUZE0?=
 =?us-ascii?Q?Oc3qDcFAuxHfZb1o3/EJGKYUBi8j1wmIZEnNwo29WqDFQDRJb3sjIj45rYMN?=
 =?us-ascii?Q?fOrfKnQzbyBprWjnBgIiaTk9Vk+BmTo+LCmqNRhOqjfJk1Cp1SN+DHq77NAm?=
 =?us-ascii?Q?7Z6uipJFJhI2ln4DpaphHayP+8l0Xgqm6OCb/lPOCJPciWpYm6xgKx4xVFIK?=
 =?us-ascii?Q?zL0tZ24HQthwZVMUxD+ke4O9xGFeZVGXCZ0WFwQbQRRSnKppxXf2NH0gdETZ?=
 =?us-ascii?Q?h2Rxs+FzYaGyu7aUxY2ugHQRBuwoMOwWDWtQcU9Qual285WkUlT7pCNHTmP0?=
 =?us-ascii?Q?MIVdIrftOyoUYaZVAFmLN4PGxAK+fTtJ+BhQJIaytymxi8mYjt5AfMEoQNwR?=
 =?us-ascii?Q?1or+FdBfu4WU/g7jM3pRaTXhb68Esyp4Q8mLaG0DJZAaxgvQkimBA10J1EQH?=
 =?us-ascii?Q?x7Z8/eYhxJIps7fmxD9FT7oq/DImYxSybaBkHcn6y3bnDLHnoLIP0p9AU5vM?=
 =?us-ascii?Q?LVjsFN1VCRTNGfV+vvZz/14TyC6Q6247IbruFjqKeOHIXprH/DKnfwejS9r6?=
 =?us-ascii?Q?p+lFQBjm1MyfiweUBid3+fCR6pLf8kwBPR/H22fmGU1NZjOY8EXMCpAFKDCS?=
 =?us-ascii?Q?r7vYh9KEJaFUyPlqc+Mofs/7c+Kgb9yAOK9w3bKUASvXYPcITsZGbAEUXSkB?=
 =?us-ascii?Q?b+iUvKW4/PfGkf5gTuUhS5HZTaL1rWF5xHtbmT21Ox4ZNi0twLu7lDtq09TI?=
 =?us-ascii?Q?h+vYsiUm9Gzj3cFb75QLPrgHCUHeJcG8YaAppwSpvvV8K0bws211v3l7QY4Q?=
 =?us-ascii?Q?d6WzFACVZ1OH/Ff5kiN02jKZAISVNJHTmkTTjw4Nj4WOaDTsIQE2zACrQtz4?=
 =?us-ascii?Q?Vw+XFnutubJPjR9FTM4N98Q43BzhWQHFkB5UDZhFzwu2Bi8MSEAR2RTS2Rk3?=
 =?us-ascii?Q?uK0E60YSE3Q1K14+5ivmFfodLz4aFxkfNqyGOMZ9GRH5GhwUnNq6mszMb8W8?=
 =?us-ascii?Q?iQNAEqpiAsnCvIyGf//TzbukcxYJtByk0JV20V1NTTTSSpr++Jh+2XrAzh2S?=
 =?us-ascii?Q?HwiV5TVZr9bB+pTbSWHBGa+e7G8Nar/DzcqYlFC4FwsvmYhtn4o6/zg9vfKK?=
 =?us-ascii?Q?0VCH0Pguku0SUOJvQ2L2F6hoMiyPVsqq7SrXDX6Sg38vhj4mqGShPxOuSMlz?=
 =?us-ascii?Q?L9sEDinjWpP5XEWc/hrIdcKaC+WXqq/cbJ9dkfEKUakmT6OqnRf4OWKHjlQd?=
 =?us-ascii?Q?YgE/57sgK4aGZOhB54SZc+PGv1PHpJyKKSLzNdTYkXznCw3fBZZ/JaGicZyr?=
 =?us-ascii?Q?B31Uz1DieJrSIIuIQ4GinsiuwY9419dAsLhTmRSCiO0rZP6HnMaJZYuT7ppO?=
 =?us-ascii?Q?MtAtSuV7fCpuKMF6AvagKU5aKVsNXdvMeGU28xI/?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 19eed5e4-dd2b-463a-a42d-08dc94556189
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:56:01.0928 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XZxsevbeZFL+aZ4Oj4uN1qE4nPJkAOhtnEm2vpAxPPBlDCuqErg7f601Pi0qP4waDcrTSsB6AhTv6h2Fa/5jDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7515
X-Spam-Score: -5.2 (-----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch enables injecting sit entry.
 print_raw_sit_entry_info()
 is added to show values of the sit entry. The meanings of options are: *
 sit: means sit entry is injected, its argument chooses which sit pack to be
 injected, where 0 means the current valid sit is choosen automatically. *
 blk: is the block a [...] 
 Content analysis details:   (-5.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -5.0 RCVD_IN_DNSWL_HI       RBL: Sender listed at https://www.dnswl.org/,
 high trust [40.107.215.56 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.56 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.56 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.56 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkh8-0004kM-Vl
Subject: [f2fs-dev] [RFC PATCH 06/10] inject.f2fs: add sit injection
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

This patch enables injecting sit entry. print_raw_sit_entry_info() is
added to show values of the sit entry.

The meanings of options are:
 * sit: means sit entry is injected, its argument chooses which sit pack
        to be injected, where 0 means the current valid sit is choosen
	automatically.
 * blk: is the block address of the sit entry.

The members could be injected in cp contains:
 * vblocks: sit entry vblocks
 * valid_map: sit entry valid_map
 * mtime: sit entry mtime

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 130 ++++++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h |   2 +
 fsck/main.c   |   1 +
 3 files changed, 133 insertions(+)

diff --git a/fsck/inject.c b/fsck/inject.c
index c2deaba..f854651 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -22,6 +22,27 @@ static void print_raw_nat_entry_info(struct f2fs_nat_entry *ne)
 	DISP_u32(ne, block_addr);
 }
 
+static void print_raw_sit_entry_info(struct f2fs_sit_entry *se)
+{
+	int i;
+
+	if (!c.dbg_lv)
+		return;
+
+	DISP_u16(se, vblocks);
+	if (c.layout)
+		printf("%-30s ", "valid_map:");
+	else
+		printf("%-30s\t\t[", "valid_map");
+	for (i = 0; i < SIT_VBLOCK_MAP_SIZE; i++)
+		printf("%02x", se->valid_map[i]);
+	if (c.layout)
+		printf("\n");
+	else
+		printf("]\n");
+	DISP_u64(se, mtime);
+}
+
 void inject_usage(void)
 {
 	MSG(0, "\nUsage: inject.f2fs [options] device\n");
@@ -33,9 +54,11 @@ void inject_usage(void)
 	MSG(0, "  --str <new string> new string to set\n");
 	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
 	MSG(0, "  --nid <nid> which nid is injected\n");
+	MSG(0, "  --blk <blkaddr> which blkaddr is injected\n");
 	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --cp <0|1|2> --mb <name> [--idx <index>] --val <value> inject checkpoint\n");
 	MSG(0, "  --nat <0|1|2> --mb <name> --nid <nid> --val <value> inject nat entry\n");
+	MSG(0, "  --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
@@ -84,6 +107,19 @@ static void inject_nat_usage(void)
 	MSG(0, "  block_addr: inject nat entry block_addr\n");
 }
 
+static void inject_sit_usage(void)
+{
+	MSG(0, "inject.f2fs --sit <0|1|2> --mb <name> --blk <blk> [--idx <index>] --val <value> inject sit entry\n");
+	MSG(0, "[sit]:\n");
+	MSG(0, "  0: auto select the current sit pack\n");
+	MSG(0, "  1: select the first sit pack\n");
+	MSG(0, "  2: select the second sit pack\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  vblocks: inject sit entry vblocks\n");
+	MSG(0, "  valid_map: inject sit entry valid_map\n");
+	MSG(0, "  mtime: inject sit entry mtime\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
@@ -99,6 +135,8 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		{"cp", required_argument, 0, 7},
 		{"nat", required_argument, 0, 8},
 		{"nid", required_argument, 0, 9},
+		{"sit", required_argument, 0, 10},
+		{"blk", required_argument, 0, 11},
 		{0, 0, 0, 0}
 	};
 
@@ -154,6 +192,18 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 				return -ERANGE;
 			MSG(0, "Info: inject nid %u : 0x%x\n", opt->nid, opt->nid);
 			break;
+		case 10:
+			opt->sit = atoi(optarg);
+			if (opt->sit < 0 || opt->sit > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject sit pack %s\n", pack[opt->sit]);
+			break;
+		case 11:
+			opt->blk = strtol(optarg, NULL, 0);
+			if (opt->blk == ULONG_MAX || opt->blk == LONG_MIN)
+				return -ERANGE;
+			MSG(0, "Info: inject blkaddr %u : 0x%x\n", opt->blk, opt->blk);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -174,6 +224,9 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			} else if (opt->nat >= 0) {
 				inject_nat_usage();
 				exit(0);
+			} else if (opt->sit >= 0) {
+				inject_sit_usage();
+				exit(0);
 			}
 			return EUNKNOWN_OPT;
 		}
@@ -423,6 +476,81 @@ static int inject_nat(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	return ret;
 }
 
+static int inject_sit(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct sit_info *sit_i = SIT_I(sbi);
+	struct f2fs_sit_block *sit_blk;
+	struct f2fs_sit_entry *sit;
+	unsigned int segno, offs;
+	bool is_set;
+
+	if (!f2fs_is_valid_blkaddr(sbi, opt->blk, DATA_GENERIC)) {
+		ERR_MSG("Invalid blkaddr 0x%x (valid range [0x%x:0x%lx])\n",
+			opt->blk, SM_I(sbi)->main_blkaddr,
+			(unsigned long)le64_to_cpu(F2FS_RAW_SUPER(sbi)->block_count));
+		return -EINVAL;
+	}
+
+	sit_blk = calloc(F2FS_BLKSIZE, 1);
+	ASSERT(sit_blk);
+
+	segno = GET_SEGNO(sbi, opt->blk);
+	/* change SIT version bitmap temporarily to select specified pack */
+	is_set = f2fs_test_bit(segno, sit_i->sit_bitmap);
+	if (opt->sit == 0) {
+		opt->sit = is_set ? 2 : 1;
+	} else {
+		if (opt->sit == 1)
+			f2fs_clear_bit(segno, sit_i->sit_bitmap);
+		else
+			f2fs_set_bit(segno, sit_i->sit_bitmap);
+	}
+	get_current_sit_page(sbi, segno, sit_blk);
+	offs = SIT_ENTRY_OFFSET(sit_i, segno);
+	sit = &sit_blk->entries[offs];
+
+	if (!strcmp(opt->mb, "vblocks")) {
+		MSG(0, "Info: inject sit entry vblocks of block 0x%x "
+		    "in pack %d: %u -> %u\n", opt->blk, opt->sit,
+		    le16_to_cpu(sit->vblocks), (u16)opt->val);
+		sit->vblocks = cpu_to_le16((u16)opt->val);
+	} else if (!strcmp(opt->mb, "valid_map")) {
+		if (opt->idx == -1) {
+			MSG(0, "Info: auto idx = %u\n", offs);
+			opt->idx = offs;
+		}
+		if (opt->idx >= SIT_VBLOCK_MAP_SIZE) {
+			ERR_MSG("invalid idx %u of valid_map[]\n", opt->idx);
+			free(sit_blk);
+			return -ERANGE;
+		}
+		MSG(0, "Info: inject sit entry valid_map[%d] of block 0x%x "
+		    "in pack %d: 0x%02x -> 0x%02x\n", opt->idx, opt->blk,
+		    opt->sit, sit->valid_map[opt->idx], (u8)opt->val);
+		sit->valid_map[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "mtime")) {
+		MSG(0, "Info: inject sit entry mtime of block 0x%x "
+		    "in pack %d: %lu -> %lu\n", opt->blk, opt->sit,
+		    le64_to_cpu(sit->mtime), (u64)opt->val);
+		sit->mtime = cpu_to_le64((u64)opt->val);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		free(sit_blk);
+		return -EINVAL;
+	}
+	print_raw_sit_entry_info(sit);
+
+	rewrite_current_sit_page(sbi, segno, sit_blk);
+	/* restore SIT version bitmap */
+	if (is_set)
+		f2fs_set_bit(segno, sit_i->sit_bitmap);
+	else
+		f2fs_clear_bit(segno, sit_i->sit_bitmap);
+
+	free(sit_blk);
+	return 0;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
 	struct inject_option *opt = (struct inject_option *)c.private;
@@ -434,6 +562,8 @@ int do_inject(struct f2fs_sb_info *sbi)
 		ret = inject_cp(sbi, opt);
 	else if (opt->nat >= 0)
 		ret = inject_nat(sbi, opt);
+	else if (opt->sit >= 0)
+		ret = inject_sit(sbi, opt);
 
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index db45fb9..ece4915 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -25,9 +25,11 @@ struct inject_option {
 	long long val;		/* new value */
 	char *str;		/* new string */
 	nid_t nid;
+	block_t blk;
 	int sb;			/* which sb */
 	int cp;			/* which cp */
 	int nat;		/* which nat pack */
+	int sit;		/* which sit pack */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index 3ab49a4..7ec4da7 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -821,6 +821,7 @@ void f2fs_parse_options(int argc, char *argv[])
 			.sb = -1,
 			.cp = -1,
 			.nat = -1,
+			.sit = -1,
 			.idx = -1,
 			.nid = -1,
 		};
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
