Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 11F34914F47
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 15:56:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkB0-0007fm-Ls;
	Mon, 24 Jun 2024 13:56:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkAy-0007ff-VM
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=; b=IOc9qKMGBM+Van3V3cK6FtjQ1a
 W4r5r9bKfVvMk2PI7+gu7jJnOHVIM4ZHxQ4Z4ekBTJhVV4OrhQbGLP1N+wwEkfera2UeULkJ35VJg
 KDAx0hSp+3y4sR6CNpr+bSJpKGeumlcuCTne4RUgUz2gbNRgxINml3vp37dp6ooTsq4E=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=; b=i6AhTq3A7ptX0H4wxobXMFB3kq
 gf6HH58Lm5TGk26slaMUllTnJYCxcVIRCEMyhwb7nTRdT9pdLDLOpaNx6N2vJHWQdZVaXS3Vu7U9h
 apre57gLO8/B542hDktNQM8/P1pBVhGnaGOMV5t6EOlVRMF1fR0umcQd5/BIN/wbGSKE=;
Received: from mail-sgaapc01on2083.outbound.protection.outlook.com
 ([40.107.215.83] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkAx-00018a-Jt for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=QJpox9wENd691wH9e5+T7W/XlUnc9my8JoQS04XICnl4vvdXLv+pkNe+nuco4gyDio7EG0R/EIteJgXJXDdh2pvK2SitV77BaRjeHPzTspKIEMwNBTfN5inHg7UXSuSJ3Kj/YxdpY4B5VzHAu7KmjIvLZb+DjrW4BD7rq4gux3e11L110jAQcc4TZwyXqMV99uPK/GV3liiWLNpOyJfgNDjIErRh+OPcUf6oNu5A5GJ9FFde0qtNIXau8xF8zPtlh2xYgXb6TPqMgicOaaeBb3LwNqHqYHUO79ATuQnuCV7WpUPe/OJyglxlQUVc4kk9ZniynIuL/hlgBl2emFrBqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=;
 b=dg4wIU+0+D0OWheJ4TtAp+b+2ksQeutcy1emmo0ajuKilg9xvK/VO7o+vPfesbzpcurgOinZxG++IA/aGhGb7yGckP2p++A1G8/ktDGf2r1vQ1EHjshJAPAAEH3/ukbIFe3epjNMgJUY0UKeoABMtByNVL3xphRugsMGQR3bH1Sc4NRgVDimwp6J6DYiuNhHfDrNLCsCjk3+4FM8RBbLV2M2RBwLVZqObN1Zo70s5F42pXrTSeixzP4sVg3I51OtSlD9pm5qs0lkGW6Ug9W3qMQmrBWHaVuEUueYpqhseRByG8Eiaf/OZMAcGAC290TR0pYzH0aWMQc8453BtlfFMA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=1XkzWrJunNjwg07SZ0xtl89vq9kjD5f3AOik3evu6LI=;
 b=tbrJhf66Y3NZ2fInGvdnYA4cknln5IqVodPZAJL1WzkcqGzonpGH4QngX0bHYsUAwQ5QrKX36eQvXEnsz6fmz66r/69xbqGSupt9rzz2OSBdds3CO11O7yLLwV8vVkV1x616Jin5wA3ON54FdFewSpynpJmSBNs9/kbqueS2an8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7438.apcprd02.prod.outlook.com (2603:1096:101:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:55:54 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:55:54 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:24 +0800
Message-Id: <20240624135532.3330136-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ebb7a23-6436-41d4-500e-08dc94555db5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|376011|1800799021|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?XwvPW59p1GZ/qDXjYEXxUfvsWvvrKYVaWtS0WaZvuVJyF+Ta34EFKWTRpTbr?=
 =?us-ascii?Q?xD9G80C3AmhvS9Hd5UetS9CPmSLESegiVMNT5MR9hnRB5Yy21vIii04uMKBf?=
 =?us-ascii?Q?5SQ9IExfR06MYb6V6oFmZNAwcxm6qls7MhZeliG4sqyqVx7jXRrmAv+RSGTt?=
 =?us-ascii?Q?8+ap2iskRuxdoPHNBfMTF5/qs09u9gZFNLAZzBLEOUm4Xm5m8yAKZYdVydy9?=
 =?us-ascii?Q?RkauxGt6A8SS2e34N88feThYLUTiStfVVHsHjxop+V5MtGl3FPad69rpGwHC?=
 =?us-ascii?Q?sHTnbucuYJ8B/MXIo9BtVVr9daZHRqG1Ry3w3+TNxZlNBzdGsCm8OQ0AwI5c?=
 =?us-ascii?Q?ImMByw1gLNmzf7oWVNcsQIV43MlupXqHY5d8RG8+DMDtHlteGZjNc599oSbL?=
 =?us-ascii?Q?nQe27VheP3rBgzY5n6mHR6Xe8iS/KoRvQNuQkQLaq0xK8wf9kSofXY6aGwg+?=
 =?us-ascii?Q?hEVBm25+uZvcfDIB3RUnJUQ9whLPTfaxAtKsegnSACBvZgRBlARDiYJsHjWc?=
 =?us-ascii?Q?Z74FgeiAVo3rWmcrLSQBphDVxuJk9VK1CcuJgPoJwy7EpBUUO8KgjKyYmFyQ?=
 =?us-ascii?Q?sEcJaG01wf05qic4HECjcv62MpN74h0ylkWqnHErrU8e907GeKNmGNUtG4Vr?=
 =?us-ascii?Q?jvF/ceAxavtR/crjwypVF/0oXFne9fASMxbs3EJ/+EHYImjqEAgcMdj84y/T?=
 =?us-ascii?Q?WDtqwahR245SqJvr/VN2v7Emx88+Bp1mDSBXwpR+9YBkQWo+rS8hfL3gwfGe?=
 =?us-ascii?Q?zZPfi5O8UlmYiRMuYsZgKcYAjrFJEB+gWRgc/uxX4Z2geOjMVGrHnKUdf7So?=
 =?us-ascii?Q?wQvPdt6vxomH4IutMxvQsbuSmAf13UteMlMvjZyBkAU/t8nS2eqcPUXxRhxg?=
 =?us-ascii?Q?V0b973SggCaAh+w9BoDxpwGZol/zeOGDW/pE0WaHs7RjoQJ7xBdg1QcnDV7C?=
 =?us-ascii?Q?cccy5lzC6IHCcfz43jyNHGes2PWG262FNr94ad9fK9viziGFkN1/7s15U+8h?=
 =?us-ascii?Q?avZOHAqzw02ftzPqFWYdxW3kylUK+imrpxYeSLXlhIhPAuP9K9mz/3yQLpk/?=
 =?us-ascii?Q?6MJJQyqR2N5ybwo6YUlWmYQTsZKyoWdnkas5tJrk7324OVX9qGUkfWVkXKY+?=
 =?us-ascii?Q?UIa2kWW7Il78nIvGe9yC4TyNirNByaomn3T8V1HI211Ko6hX6+PGAwNkFo6t?=
 =?us-ascii?Q?lDVDikta2WAXGd0CQJw3parbyRGFhYQnjHEJvU6qhT2QVPkfD/GTpaUOwVZT?=
 =?us-ascii?Q?Hd8w5Ie/dksUAKaojsIIW/8R1IrRIjzXiL4/5CWTofi/RedVhf2bf8+vVyh2?=
 =?us-ascii?Q?QPwvsdHbmiAC9tg1Q3j0sGEtg/YFGUiZJvTVvaXN9oHLDCcHLC87KXzWY5A3?=
 =?us-ascii?Q?66VoxJs=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?dJAQPGoDtpXBZaJR+6+sEAQuQmgRHcyMRfcbeK5yVwDoiU7Ihm8Cr2kygC/m?=
 =?us-ascii?Q?JKPlt2G2URH6DvhKOtKi/UdCrPSH5qAu/8fIAq7IQLUr4kHKFPINI1iiMOMS?=
 =?us-ascii?Q?AB08CsQOPWtm2HpK3/CTvLeQH1uWpHMPXhPZH5RWCVZlKrW9/+5RigX14wOz?=
 =?us-ascii?Q?9/vcouN5OYUfRE+UAUJPz0Q5n1UsFIraUxZCsOQGPKBQzIc3R9rgc5mhHjLB?=
 =?us-ascii?Q?YGTU7oRGDRrZIuIjs5oBD5Dlx0kGzAcPEBq3qpWQ4IcixkpOFUaIsSNp+9lj?=
 =?us-ascii?Q?6PKlcTolpsNddUDXxo0dbw/UfJ4kR5j3TbuHtAs520jHUtoL69Mt5V6B03kk?=
 =?us-ascii?Q?Y6grpwqddDaVhql5aYOkf7t9B3vGSFSN2A2tKsDK6bIN9H8xred5SYVnEHBh?=
 =?us-ascii?Q?qgbToYyLU1AWNc4ZxfiJXPzzCeliTpgK/YA3TSCctZfTRLGKFOvKYwxNig3F?=
 =?us-ascii?Q?OPUfFuIgTowblewfENV6Fxy31E0yQsAZ1CLSeG/x/GrptkMQFcYtMmJ6IfNx?=
 =?us-ascii?Q?vbHvG58m/RZey7bD3wcx0oxeKrwU6o8mtB00sYjq/+9+fX881wF6XfdXliBc?=
 =?us-ascii?Q?iMXkwWS1ly8OJMtWuAOjyuv7ffCKrLq8kRc7FBZeTE3T0Qw0lsSRJH0HAO58?=
 =?us-ascii?Q?kLfi5j1tOvDiewP43fBVLgWZiUN1X2j7nxywEZYEL7nvZVUIdL/ejF0bS/sw?=
 =?us-ascii?Q?fWnQdEgArrPcoNipbcD4CML+aR+UxfJC/jLX4d7czgMOCjX1S+gxUgR2XKLS?=
 =?us-ascii?Q?mkoInpy4jvMltsjyZdYBWpu/qI6zdMJ0EoE4pwmofSzMQRPVqhZ4mLUGbAMB?=
 =?us-ascii?Q?TSp/MGESQ+dfTXpaM/xExB6ZYsdTMuDuTlizxvkNSjsdMn9RXWJ06ecVevOG?=
 =?us-ascii?Q?pqmZRLtk8qQGZ3yc7BdIGWrdAGmDFL3BPzie07d1AOWe0BuvqRgyKM7V2/Eg?=
 =?us-ascii?Q?74BLjp9cqejx16Sh3AZOGiIO/rt0G2EwdBHzDu3oeihkuK4bGw2GReWfO/Kr?=
 =?us-ascii?Q?eetZG8k1UyBaRXkx5gpW6pWyCvv7gMVIK0ZilTzi2uOAnbIcVLMG2+dfnms/?=
 =?us-ascii?Q?BKEAgqqM5H0mqE3vt1Y8sfM5a1ZvY2b4qlLtVtiVimAnZGuU3ODaboWtP09L?=
 =?us-ascii?Q?p6PviJu4WwnUDijCdxmQi6lxIa8NIB338JiOYPo3rfoKgfwS4ML8H0pXv5HD?=
 =?us-ascii?Q?XVd+ncF8YY2QGHB6pIpSjZbBtjjccxBMuDsKjCXMbwe6Z49c967VO9P0I1VL?=
 =?us-ascii?Q?ZBlxwMm5Odztw9+9tWpp7Wrcp5rZEoJeyyhXeO1TvoGMhOK+WvyT9j7NMs3u?=
 =?us-ascii?Q?wVGq1cLbV99QcVrAdC3z+UbZJdEthmKTuJuNiv1B6GAg5zgRL0undb7+GWeC?=
 =?us-ascii?Q?XoeazcKdK47mVo4ZRYGsfCuf753zmS9YIADzLGv6meHB9wfXYLzdgRCNoKvg?=
 =?us-ascii?Q?ar/xm+S4SX9+Z1nzdBRacntQ+LrTA9r0X2OQUpJlrUqNJ10akiOiLkYAZTXj?=
 =?us-ascii?Q?asIKWzW+f2gjclqibcFgtEBmby/lvXiC4rfsYTeXBmT5nYaeTHeBwUDo6n2r?=
 =?us-ascii?Q?P/bmUhNgXV/ni/pdgdtoOvP3H22CI+NHx4c5vNtW?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ebb7a23-6436-41d4-500e-08dc94555db5
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:55:54.6970 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7mvNkGxODablXfcoB9CUJZIN9Hrbk/CHNa46U2uQMPuQSFmc6RTc9UTlCdQy+IJhbXxeJuy9Xdi1bc0I6F/FYQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7438
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fsck/fsck.h
 | 3 +++ fsck/main.c | 2 +- 2 files changed, 4 insertions(+), 1 deletion(-)
 diff --git a/fsck/fsck.h b/fsck/fsck.h index 6cac926..4ca75b3 100644 ---
 a/fsck/fsck.h +++ b/fsck/fsck.h @@ -353,4 +353,7 @@ int update_inode(struct
 f2fs_sb_info *sbi, struct f2fs_node *inode, int flu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.83 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.83 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.83 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.83 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkAx-00018a-Jt
Subject: [f2fs-dev] [RFC PATCH 01/10] f2fs-tools: export is_digits
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h | 3 +++
 fsck/main.c | 2 +-
 2 files changed, 4 insertions(+), 1 deletion(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index 6cac926..4ca75b3 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -353,4 +353,7 @@ int update_inode(struct f2fs_sb_info *sbi, struct f2fs_node *inode,
 int flush_nat_journal_entries(struct f2fs_sb_info *sbi);
 int flush_sit_journal_entries(struct f2fs_sb_info *sbi);
 
+/* main.c */
+int is_digits(char *optarg);
+
 #endif /* _FSCK_H_ */
diff --git a/fsck/main.c b/fsck/main.c
index 6edc902..9bda412 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -166,7 +166,7 @@ void label_usage()
 	exit(1);
 }
 
-static int is_digits(char *optarg)
+int is_digits(char *optarg)
 {
 	unsigned int i;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
