Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8E0659B493F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4h-0002ZU-CQ;
	Tue, 29 Oct 2024 12:11:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4g-0002ZK-EP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OAZi8jyRmx4Yin2OXUuffdcwmer0LMgPpygGaKQl8PU=; b=JFhHNBmtZWWMDimA6gcqHx/mBM
 AULvYeg8SUkpWrPlhNNaUCQZaHbc7gE1pgCTvNSxYj96GO2l+ocRbGr8nMxiCnI3YmqKLJwKsQ4Xl
 42LB8N5FYcwtnLY05kD1nexuGHISLFSb8Y/rSy5ltfvc4jO4YcFxbA1W5e+WcuHKN9FI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=OAZi8jyRmx4Yin2OXUuffdcwmer0LMgPpygGaKQl8PU=; b=fyUgTZqi4CXWmpX4VwkfLtv30w
 iQ2W6N4WBCqLLeVpC+vfeVYGRtJPv4TxDQcbrBGk63NnTRx9CPksUWxsMioymKrfMf3NJhFyGUpmc
 bDKKXgKDUaYDwREyIQgCjnUx7YsBnGj+zAIKr4KU0dkCiqeF/FTMz6dCyOW2as/abuCY=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4f-0007R0-Lv for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BPpLouF0Ozq3ENoKGb/abXCXsEBi83at6HCwL3jlWGvlb0Mt5mq+1D5vhK/sZN+b5BqQmYHBWkF5BfXpi3SxdAPZhYy7vrpIkhAWeTIzKbKKFRB3aLCP77SvTIdcakaXtaBC3VdL9SIQeySfbTrzM+iD+kIcsd8zKRSvdbNvE/7VgJlclfAlMpV1JsY7W87D2U/QRLopmGgwPLN/ciq7k5TLki4cjDOabDkcuW+tQGaqtRpwgRbuH/7Gg9FdgzozzpXWzyFxxp337yBSHYumZHgbN1zUfwk707i6uRwR4HR98Y3HdP3LnLlmUDzesr782M8dVqBuBFE9Fd1o1xKgHg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OAZi8jyRmx4Yin2OXUuffdcwmer0LMgPpygGaKQl8PU=;
 b=x5qImoehv5KG9RSnl3zzn7FGN+Pej1zszCTjdPFKl6BkSgRL7OxtuwLStuYU48FCff/SBInxEd6Dxct9hNv998Zx3P/wYT1zJJ8q28EBMs7JCyXr6AGXHnK7N30uIjNHzA9XRb2RuhCxyZzy8194oM7kv5GxVwdNzKa9pNuyhzc122BJWudNV6bXRNgaheSXrjK+3EOoy0qO67H3bpMNFnRxgXxhA4mD2TGmjW8HeQVNOW1xoTZkbSQDJTlvMRNqp2sYvDCzzTTy4B+5gzUEoASwbhZVEDfb3hllt7GEBL0FTEdgIhWabKBgwcsisSMhFPesSgVsPpT048LSyc5RgQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OAZi8jyRmx4Yin2OXUuffdcwmer0LMgPpygGaKQl8PU=;
 b=S3C1Ex4EtmdqYv8hret32Jlr8nyVbjSozk7HyJpUL0AS9ZUJfo3pgkXwEgzMEL9XfCKkUMWz4WoUI0KU/Fmkc218L2Qbq6Auukmz+vhSZR8rdxpsZShPHDTbzyvxJakuhlsMQkKyGCzQZ6XL/I8xeYpqfYktsc2ZfMYofvU4Xac=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:28 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:28 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:33 +0800
Message-Id: <20241029120956.4186731-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: cbeb8396-5ab1-475e-9623-08dcf812d148
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w818jMHVwCsHhZlzKRDOXviw8bPL4RTdCKys70ZsoMa3IZnIrJ37CewouTWo?=
 =?us-ascii?Q?3ThNYPqgSACx4XP/RU6jGSgIpv+A+b+ROkH6wUtHgJs9BfxRxFNS6PPNM4Tl?=
 =?us-ascii?Q?hZXG0G8OYsRbN01idAUs8dgbCTPaE3xRuhPpI97B+mTh2BQiq3qvw6uwAarQ?=
 =?us-ascii?Q?KT1dPgurjDm5915iNbCSp8mdDrwIJPUdGPDbWu4zvOUSkGXixDwqAOaqYPDq?=
 =?us-ascii?Q?hVlGurnk/5K75bLj/x5iVZCNhHrnGUkjlSuL2II0F+rf32jYdtkvnoyQopl7?=
 =?us-ascii?Q?cVQ36lE+da9A74/vu00zTxT7O+fA+PXjQ0xc/CKzLa+UxSgcdo1vthVNN8qj?=
 =?us-ascii?Q?I3iYxnE28uGC0J9M1V92m+fnH0zxhPOmWi0wQsEVKEbP8iJRto3uxIj8vEQ9?=
 =?us-ascii?Q?XRh3BXCiWOgJhBDxpA6rPvtGeWpzDPlfCgNiFuADF6a0SRGvHds4nfn6fTaP?=
 =?us-ascii?Q?8Yo/hswoxBjvbujXXKrC7DzVlJKnBjTJ7ThUIRvUyz1T6LqKiCLjG0XoCVAR?=
 =?us-ascii?Q?EO3mHFj3gtCWITNOrW7wMwxpscL2JqcFSHw8KevR9zktBf9Hhxmf1Fvc1UYf?=
 =?us-ascii?Q?1cSqDSFKL0rztqu8krkJ7ljaIimw8T4uInaUDMz9ouk9P5IHF/6y3yk8YjUz?=
 =?us-ascii?Q?X+oHortbhot/zjGKxgsBsI1iDbzpbeNT1m13oL8rdr0ZJ6onCyOibD0gdIbr?=
 =?us-ascii?Q?uTkBWsAgcM34yRXOnBSlP+mLEEhaWLMqcFs3R533fPqh2Lw472rnKlO+Wpne?=
 =?us-ascii?Q?Y7CkpoaEZZoyNk5U8FV1xGlqp5OrJvbTUY5YTPZQLmpG4lKYrAXhhddKWiwK?=
 =?us-ascii?Q?4VWU48NTx6IEPuq7o56ZhfJGjfIiB85qWZwQ3ecnF2pUAfaBPLYvNjCp+kIS?=
 =?us-ascii?Q?MUVp5TPsxvVj5WuNmqGc2X5hmT7yykah2LVJL4mhf0PAWVRetoPZ75D8o2si?=
 =?us-ascii?Q?ywIvwnmt6iuFX1tT5+q7IaYJxPcnY1fVwOkCe2P+kERZs0OOskYdvSf7IT8I?=
 =?us-ascii?Q?qJgbn8aMQbX6Z7RSGaSjedWlWEOro6JuPoiKPa48ofVj5xKVlFkb0iG/iHZO?=
 =?us-ascii?Q?9y1HW1SVA56KU4sFroeT4agJRHMmdfB3Lz9d+ijfCbr/+bPYL5r6YsbeuIp5?=
 =?us-ascii?Q?aEVnY5/pBBHgbTRlCJ97jTLcS462IbCAjUI/XeeJScu3pLIw1K04ccPaHYzr?=
 =?us-ascii?Q?h0+D0a8CG/uTidBGqFKeVxElzRW8vjWcBzPwC/1dS1LF6j93vprRFeQ7YhDr?=
 =?us-ascii?Q?RHCDB2kX6nzVBNzlhRMM+wxOTCNqfqm0cG0igtISKRStXuiU5RutYbOfrLF4?=
 =?us-ascii?Q?Ipkenb++RaPGqynBoYOBnstXw229aErfJkbflhaos2pY/6gMy3I4nKBEwD3C?=
 =?us-ascii?Q?Ye7xVGY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vSMdxUi+kUl2FTNQk/hslDAz/tw7FH9Udx2ZlfsrDRi618OFXEw6WSREV5ef?=
 =?us-ascii?Q?S4RWHJc8PF4Obh3D9vnB8z9Lbv9ARFSCSd9Of7/Mh6zWQ98vpzEksopXGrAM?=
 =?us-ascii?Q?vJo6Sutx+32qpRkQbdIQrInrc+8pQoJk5BW7SJ07lNDfLaNv57ukdcGvZW6c?=
 =?us-ascii?Q?BO9alPXOB0VFtxA9yQCux5o2ivaCVI1I669IKXFeJPnYu7EUVZ7NTUbvCsTS?=
 =?us-ascii?Q?bBsJd04SAhDiGnMJfpI+QCuiuJgOPH6cS3iAMxy1i0aX2nULUwixxtrZPlAj?=
 =?us-ascii?Q?GM84s6q2EDUsBLu5Pz4zDm7VGR+s0Tyka7K8iXJr0cOI328unZ00Be0B9aQm?=
 =?us-ascii?Q?7OCB/5Rtixr/cGA7Yb1n4fmR1wzgJC/SjSPLf1mYP9NM1CFaRGDKfoOX4UQu?=
 =?us-ascii?Q?aAEx1Q/CiDnviTyby2at//m+xnBz8rCDO1o7bXbJ0PXWeX+k5jc9CCwM7nXK?=
 =?us-ascii?Q?imiY4iZCuj3rRNj1ZqIak3Xh22WfbT0mG0DJTtZx+1+K7xprD3O0n1TX7/4x?=
 =?us-ascii?Q?7WE3DvJ03yysEj0xrBZJSB4arGEwQbqpVISSUz2amxmG6Ah/hrgEP0aB6Crg?=
 =?us-ascii?Q?UyHVjVVY8Gc94GRxJeiof2s8Bl9yEBUiZ6aoJEpFEhimnyeEsi/dvG0Ovhyr?=
 =?us-ascii?Q?uGnM1qPA1aCS5twhqs8ZkkZFzABVcJnwz/AIv8KC67ZKL8Rx1VV077iQK318?=
 =?us-ascii?Q?3kG+zoQzWar7pcrcEba/PUZg/VSbWHhtSfxpfdbPzBjis5+mEHJ3k+AOpcfX?=
 =?us-ascii?Q?JlXqw203YuBNmYfl2T/rd8fvF8ZfZ9PFcIKpOASMJdeE58lOmZLSDyg1bUWT?=
 =?us-ascii?Q?eolYNTlSxLhhCYixqz+VzzmytVVO1ZOLUn4dS8ZBRNXJMRfgEZWwsO7WLzw7?=
 =?us-ascii?Q?OEMy9MumKmGXJVYePki8o38BdnAptObLLwxn/zB6m6SiHJbiWnheNu6popWp?=
 =?us-ascii?Q?jpXMdr6bZ9iSvxhFB5+/f3sokFcLe481j9TUVZACwpMNezrNGkTeC8tF70X1?=
 =?us-ascii?Q?0Nyb/hpFumFYV6ud610I5fyDDTc3+kpEzNpl7JGF0rEjYpN+lIJZD2jsb2GA?=
 =?us-ascii?Q?njCvQDu6GkLqkzbNGcDu78BZ063SXQChxweo2C8HRa0Z1DbRQyvi1PMZC4xb?=
 =?us-ascii?Q?N2U/11m+ExL/NLx9NmjWnVtg5VdMw9xNZMbZYSyiRIJQK3VOvY/Fhh/s8AKw?=
 =?us-ascii?Q?xJhCU85IOPzxLCI1WeDhMv/3NPJinQMl2x56ygwWFE3OcVzx0ASED597CmJY?=
 =?us-ascii?Q?UQw3QPUNwIRwEsRJJ7GgLmQBtXY7RIUNjWs39EheD0CPorWC99yqIkPld7xJ?=
 =?us-ascii?Q?5fviMRaKaRZhq3bKCLjCaW9L+V1+4NC4f+I4tpe/W+4lGRD3QCT3u8m9cGn5?=
 =?us-ascii?Q?beeMotl+fB5evbRtsicJm9snnjv/G640gS5Qn15TpRrDJerDncjU2IM27a7K?=
 =?us-ascii?Q?VD66oGdApXKL2xGXLb2QB1X0Kx/dGZjF+YgXicWS3jF0GPrYTfDkj3aqbMRF?=
 =?us-ascii?Q?ydK/M0nCgXZTHP5orAgXV/q5CyswBVOsQ2bqu9GYIU6uVfMakkxxuso3rVnk?=
 =?us-ascii?Q?qeayMY2Ip707JfqW+e7F4LoSWk5KVMZ+cXYL33vI?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cbeb8396-5ab1-475e-9623-08dcf812d148
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:28.5816 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RphgvPqLfcqNx4bZQxt6P8ZN8gjCNYwdT3QzylXnWEa54IeqiIy+SfZ58AB/NYuglsWX7tauB2AuiYty6xzPDQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In some scenarino, such as autotest, it is not expected to
 answer question from fsck or dump. To simply answer no to all these questions, 
 this patch adds an option `N' to do that. Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 --- fsck/dump.c | 3 +++ fsck/fsck.c | 2 +- fsck/main.c | 14 +++++++++++---
 include/f2fs_fs.h | 1 + 4 files changed, 16 insertions(+), 4 deletions(-)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4f-0007R0-Lv
Subject: [f2fs-dev] [RFC PATCH 01/24] f2fs-tools: add option N to answer no
 for all questions
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

In some scenarino, such as autotest, it is not expected to answer
question from fsck or dump. To simply answer no to all these questions,
this patch adds an option `N' to do that.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/dump.c       |  3 +++
 fsck/fsck.c       |  2 +-
 fsck/main.c       | 14 +++++++++++---
 include/f2fs_fs.h |  1 +
 4 files changed, 16 insertions(+), 4 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index dc3c199bab7f..8caceaa4ae06 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -681,6 +681,9 @@ static int dump_filesystem(struct f2fs_sb_info *sbi, struct node_info *ni,
 	if (c.show_file_map)
 		return dump_inode_blk(sbi, ni->ino, node_blk);
 
+	if (c.answer_no)
+		return 0;
+
 	printf("Do you want to dump this %s into %s/? [Y/N] ",
 			S_ISDIR(imode) ? "folder" : "file",
 			base_path);
diff --git a/fsck/fsck.c b/fsck/fsck.c
index aa3fb97a7022..5a2865dacaf5 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3693,7 +3693,7 @@ int fsck_verify(struct f2fs_sb_info *sbi)
 	}
 
 #ifndef WITH_ANDROID
-	if (nr_unref_nid && !c.ro) {
+	if (nr_unref_nid && !c.ro && !c.answer_no) {
 		char ans[255] = {0};
 		int res;
 
diff --git a/fsck/main.c b/fsck/main.c
index 25d50e29b6d6..b6e9bff6cdc5 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -86,6 +86,7 @@ void fsck_usage()
 	MSG(0, "  -t show directory tree\n");
 	MSG(0, "  -q preserve quota limits\n");
 	MSG(0, "  -y fix all the time\n");
+	MSG(0, "  -N Answer \"No\" for all questions\n");
 	MSG(0, "  -V print the version number and exit\n");
 	MSG(0, "  --dry-run do not really fix corruptions\n");
 	MSG(0, "  --no-kernel-check skips detecting kernel change\n");
@@ -111,6 +112,7 @@ void dump_usage()
 	MSG(0, "  -f do not prompt before dumping\n");
 	MSG(0, "  -H support write hint\n");
 	MSG(0, "  -y alias for -f\n");
+	MSG(0, "  -N Answer \"No\" for all questions\n");
 	MSG(0, "  -o dump inodes to the given path\n");
 	MSG(0, "  -P preserve mode/owner/group for dumped inode\n");
 	MSG(0, "  -L Preserves symlinks. Otherwise symlinks are dumped as regular files.\n");
@@ -250,7 +252,7 @@ void f2fs_parse_options(int argc, char *argv[])
 	}
 
 	if (!strcmp("fsck.f2fs", prog)) {
-		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyV";
+		const char *option_string = ":aC:c:m:Md:fg:HlO:p:q:StyNV";
 		int opt = 0, val;
 		char *token;
 		struct option long_opt[] = {
@@ -356,6 +358,9 @@ void f2fs_parse_options(int argc, char *argv[])
 				c.force = 1;
 				MSG(0, "Info: Force to fix corruption\n");
 				break;
+			case 'N':
+				c.answer_no = true;
+				break;
 			case 'q':
 				c.preserve_limits = atoi(optarg);
 				MSG(0, "Info: Preserve quota limits = %d\n",
@@ -409,7 +414,7 @@ void f2fs_parse_options(int argc, char *argv[])
 		}
 	} else if (!strcmp("dump.f2fs", prog)) {
 #ifdef WITH_DUMP
-		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:Vy";
+		const char *option_string = "d:fi:I:n:LMo:Prs:Sa:b:VyN";
 		static struct dump_option dump_opt = {
 			.nid = 0,	/* default root ino */
 			.start_nat = -1,
@@ -487,6 +492,9 @@ void f2fs_parse_options(int argc, char *argv[])
 			case 'f':
 				c.force = 1;
 				break;
+			case 'N':
+				c.answer_no = true;
+				break;
 			case 'r':
 				dump_opt.use_root_nid = 1;
 				break;
@@ -1311,7 +1319,7 @@ fsck_again:
 
 	f2fs_do_umount(sbi);
 
-	if (c.func == FSCK && c.bug_on) {
+	if (c.func == FSCK && c.bug_on && !c.answer_no) {
 		if (!c.ro && c.fix_on == 0 && c.auto_fix == 0 && !c.dry_run) {
 			char ans[255] = {0};
 retry:
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 0cb9228288c0..d601e912bc52 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1545,6 +1545,7 @@ struct f2fs_configuration {
 	int whint;
 	int aliased_devices;
 	uint32_t aliased_segments;
+	bool answer_no;
 
 	/* mkfs parameters */
 	int fake_seed;
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
