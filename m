Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 904F064A2CC
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 15:06:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4jRX-00011q-Jb;
	Mon, 12 Dec 2022 14:06:07 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p4jRV-00011i-Ox
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:06:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=my1ZT8OUqTAHba7MqJCEx89N/ZgdUCD6mXiuReUcPuw=; b=krF2EJcTsfMbQOtz3Ui5kaMkpz
 FF+WVqawnI7wd27XeJUIPyWhnHVyQyBKch//kqGZwpT6IhUQ/JpfDCpHAaEIas4q/jzDTSJykmD+j
 WyYSPhAh5hAd10zw6CzxXxfGP/syNZU/vlsxvDQ6T4fLaDH5ahZgDdjS4vb7VDzN5GIw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=my1ZT8OUqTAHba7MqJCEx89N/ZgdUCD6mXiuReUcPuw=; b=N
 gVHzW1uncj/wtwWjjfWe6RzgmE27a5C1rOc0jCbKPv2rGxZ/xsvP3tDI6VZoJDbJ6fPxkaluripWR
 D4NYmG/xh7bFgLAR8apnGdq0ezM6xke/PvJDEam7H/2d0/BbD3Mwe9RLbXzzchcXc9syyeaigOUdw
 XnXkq5AJc/5qh6Rs=;
Received: from mail-sgaapc01on2129.outbound.protection.outlook.com
 ([40.107.215.129] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4jRR-00Enjz-1c for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:06:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=lBJFupRC7g3hoxh3/gzUGcxSjekLwcshqKBCJJJdffM7SgfIoayGvtFW1BoTn+29aTbfLGEgeGB8RJcpZyw0DmeSbP+4y4c7vFb4QTy3+tIo/a3nwPa0rX0BfXz9iY9AITJ1ea3GpahukDxaDLS3rCg/tOtvbabag5ydH7ZCki8+NNYr/9WQ+yA4x9EeCFCj8/uh7d+aj6TZw2Rg/ZSy6jKBbsfLlO4tDGDEDEc3djDuMPLAq8l/MzEoPwxjRTkMsWDV0/V6awi5UOA2tG09Gqvpolb8oylqhTmznxJdbXvEeXyPrh82Slsw3fRVThVmmWTvr5KOfgZQ9pzGyWtuhg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=my1ZT8OUqTAHba7MqJCEx89N/ZgdUCD6mXiuReUcPuw=;
 b=NCBgA9Xj08xHoyesufIoJWKMpgJ/WVPIvDl5LT3dp7/oJUNeg88hxJ1Tv5Qptc8isov6qKDMYqGXn2UrMMB3pNA/D38sVuf/xQWLah0bqG1YyHprlIFpB/+o3c5H8Y49krKjW8Mmv8Du7zVY5oNLFf82bXUaYIdbaU1sOS3F9iJntw25PkvyNg8mdF43ndkNaJvF5ES842s4WS0ocUpcCdPRl8d4TbAZvnUplv1mvEbNwZxj+SpZbDXrK3nQz1OiGouJZfKA47/30dIoZUYmPXQ3HjQ1utSqbUGx7cHI/lXir642YK1z+SBZsY/CUdP+s0KLRegS71d9TfeGlCOlDg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=my1ZT8OUqTAHba7MqJCEx89N/ZgdUCD6mXiuReUcPuw=;
 b=EmiS0hbirNJXTg/Nkyh0AkL3P1CT49gK78EPeWOE6XhBy/Fh0VQT5DPX2JZ+wR6dxfFvA7/PD1pnObD2uy4v2X690OcbLxp4uQWt+z+ibCnnY1T9S3jt6UQUP+SHIVrXy4yAEyPNBcnsDbl5wFsFSvHSYM1mY+4DoPgC3ZmjkfWG9/kFZP3pplOTxb6Vi2AdO5JceyFT4cGVIYY4XvKaApdWk4QyMfqYckc2kAsQa3SLMOxK6WCcVEC5ms5/HSP/RpGDJYg2uC19fMP4FceCXeCrtP4apmqu2CevKHYOPT/fX30iZss4Uf25x2Pe4wxAjptXuIMD1BS/51YIwwsTdw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5469.apcprd06.prod.outlook.com (2603:1096:400:27f::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 14:05:51 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 14:05:51 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Dec 2022 22:05:40 +0800
Message-Id: <20221212140540.5187-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR06CA0234.apcprd06.prod.outlook.com
 (2603:1096:4:ac::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5469:EE_
X-MS-Office365-Filtering-Correlation-Id: 40b8329e-b08d-46ed-78c1-08dadc49fa07
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2HydoTAifyaL7dzKzkbtPYU5vIYW5PIptK7abvUqlDycvtQLOzHv8FZt43gjDltgSzIv2xc8oghsMEx09+nmB1rCrzmt6ovToozV1pRSTjsnpAQz+PFaAnZS9hP50L3kCK4g1CXm7KYZW2VltWEDYRDOjJFNkdsjat8bt4jNgJT0zqXcx+QFPgwDdWqaBKbXWInYTXZOniuZT/NgT1l2vAxEf2VnzdcTGQhKQQoBjeh8wBZd4s4vxWy4dhVnarH97cP3kl9PFVF6uHAebihfp7S/2yY/6gsOTzO8gX9yXTp9NduvhZFZ2ZehLV+mb1xcBs89qoGNiPv1resrmMTy0KPtSsQdQe8ICQHaHmzwER9NgQTnQaIxnXsiyeGbcetga0T6LTKWWzlFLUlsQ3yK1w6dHC4NAmSCrEX/UncG8LJR3cgyD7kxZYioCuf1RJpETxkKeZ2UEGP8mwlsT+fFJC7tGZiDQWnM+rLcCC81f8eJydvpJZA259XLYabaIeDNbAT3jD+WuQaTPG+Ays2gAHFNoMqTVSF/V43jPOiWLzqcun07tNK7eW9/Y6/93noUEN9bu67G6G9hpZrZBpJh9vKdGHtDOHXYkUbW/sb7FisgH/wJL5RBhwGaukGAVse8k6AahNd+lQtZITJHLAnaDHSo5B8EVvLHNamcuhwzmT8V3CtErtCl/k82xZa1W+xz
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(346002)(136003)(451199015)(478600001)(38350700002)(38100700002)(86362001)(8676002)(316002)(19627235002)(4326008)(66946007)(5660300002)(66556008)(2616005)(66476007)(8936002)(41300700001)(2906002)(1076003)(186003)(6506007)(83380400001)(52116002)(6666004)(6486002)(26005)(6512007)(107886003)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Ujn/JcEx5EUbyzQGenD2y/zgah9Nie/8IPKJ1Rt8lYEOdUBqay/Vb984PwP+?=
 =?us-ascii?Q?6KrKFzdaoYTR69Ov23UwAMVCc2l+9JdalYEbds/nrBXljo4SKgWQuaTrcECo?=
 =?us-ascii?Q?SpC8PEWt3KDhJnNDtK1D1+c2UxQlFJrG0qPMdh7E4TA9B39rjs0hspHIOZvN?=
 =?us-ascii?Q?baYNdzoLq7PBAGPUZEawc0ymFqUWKLzO87WMhWhLQIXpgrdDgjFHZtGcYr/x?=
 =?us-ascii?Q?1oe9Z8md85SLNA9G9E9C00DRf6HKQZUEoM3d5sfFelMbmFSxhCbVUpNTDrUH?=
 =?us-ascii?Q?BwKTSOJUpNIt6eG4stsU14/tbN//5Ny/hnOIhAaJXFOkjMzAR3Y5e1nQST69?=
 =?us-ascii?Q?KkAwS5WExVnPxh4yCRJugi7OIwIyEnJ+iQZ/A/tW1dRW8eUFXvrRmWm2p1Wh?=
 =?us-ascii?Q?DQ0amWuQDlvfxzC6DZd/lCZeG8N8MGb0JWbwC67+JV+jXKw493yooSwEnWgr?=
 =?us-ascii?Q?GB+qnkki6NK3dFePF8eY47n8yRaXarHELFvX/n2YYX2fZA5ftVuoofShQFIU?=
 =?us-ascii?Q?qoSNg0feBXsbAIwE3vkQHYeWMUsJsdrXHEXirFRFe3TlB4mZjJTB1yykdBoa?=
 =?us-ascii?Q?jAxd56qye8x2YOTVL8dvlhuajsqNO0QnXRSDwuMW+juqVo74j1B9dzhjgESS?=
 =?us-ascii?Q?Nv9t1/oa49GIGstub53mhtYcSzvaJG/nwmNlBTedLOe1PudNm3457BV9cZy5?=
 =?us-ascii?Q?/J6MmQhcytZM579TQIIYWMhJMfPNT4DvLWjH1htIMt/ekqu9jk9Wh71CvlgW?=
 =?us-ascii?Q?Om/gLWdFauiqQUCDrJPzdzRk/lj7Hy4vMb3jgd8UsT71c3Ip+vs9E0yP5Tpl?=
 =?us-ascii?Q?xy6OBcOWdN0JZyvpWOx/KpUFDZ26zK1XYJhk9j4F5cIBdHLUOy8/xGXUy0LA?=
 =?us-ascii?Q?Eg9Mbsj+uk9fPLSjV4L+ToU+WES1QkMoBMBaK0ot7NTXnRHO7thYGPWv0srd?=
 =?us-ascii?Q?bpnc5fYAPKhBwY6fhSVohWRWkQTzfDNZeJFbFl6ypOhnB48QJ4FcZYuFyM6P?=
 =?us-ascii?Q?p0+S6h6H3/yDhkLNH/wGMNlHrNNwnzK2BCiHxZDosRidcHK2mAqpZQslj4iu?=
 =?us-ascii?Q?3GieriwxeXqXlHUf0zddom3T37tfmbSG5hn0kV1ZY6G2RKWttfYrHbZesqkj?=
 =?us-ascii?Q?XZhiFd61WiuSIwqt1hx/h6upZjeG1UYt5VnJLFPlwGI7wS1dxHARgdBsRuGS?=
 =?us-ascii?Q?PuxckHf2s+OPGTRxOue5L8tvHq6TJDsu6S2IerXu+ufZmaPQvx3TG5wvQZg7?=
 =?us-ascii?Q?N/QBw+fqZbJFCT71SSVd5N5xWbFMvOmNIxUL97zpPOjCSy1hFyvalyGRv8nO?=
 =?us-ascii?Q?XhmHCiV5xrQ1+2h8o+hMVNnYv2SjOJgg+4Rv8qixruCHaKoDHVaoGphgX4Kb?=
 =?us-ascii?Q?df4LKNPtIHR4bQ4n5JvP+gb9b0AwVv8bUsx9e9Eq4n13JWoEpo8PyKsMG0X8?=
 =?us-ascii?Q?BpKazmm3B7NovP2KqMLJlQBm+eHJFIqfH5Q2VDcqCSxDN36O3M95+i6qF3ja?=
 =?us-ascii?Q?v12P486E8cH0nol8pqPHg6fZrGgykkRk4GsexdOLeAdCzf3CzHrrLGBHR2LH?=
 =?us-ascii?Q?Loj+oLmt/MWAaYwWykxVe1AQl2gcY3j6jGGEfnmQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 40b8329e-b08d-46ed-78c1-08dadc49fa07
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 14:05:51.3269 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: osMPXCpmOiOKKwehp5oTbz4pyZeJNn08VbWHVIXcx+5ArdrS3wnCnwbc7wcOBLok540Zh7VonaQ7pUoqOqouVA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5469
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The current discard_io_aware_gran is a fixed value, change
 it to be configurable through the sys node. Signed-off-by: Yangtao Li
 <frank.li@vivo.com>
 --- v2: - allow 0 Documentation/ABI/testing/sysfs-fs-f2fs | 9 +++++++++
 fs/f2fs/f2fs.h
 | 3 +++ fs/f2fs/segment.c | 3 ++- fs/f2fs/sysfs.c | 13 ++++++++++++ [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.129 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.129 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1p4jRR-00Enjz-1c
Subject: [f2fs-dev] [PATCH v2] f2fs: introduce discard_io_aware_gran sysfs
 node
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
From: Yangtao Li via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yangtao Li <frank.li@vivo.com>
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The current discard_io_aware_gran is a fixed value, change it to be
configurable through the sys node.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
- allow 0
 Documentation/ABI/testing/sysfs-fs-f2fs |  9 +++++++++
 fs/f2fs/f2fs.h                          |  3 +++
 fs/f2fs/segment.c                       |  3 ++-
 fs/f2fs/sysfs.c                         | 13 +++++++++++++
 4 files changed, 27 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 9e3756625a81..7b6cd4cf40ce 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -669,3 +669,12 @@ Contact:	"Ping Xiong" <xiongping1@xiaomi.com>
 Description:	When DATA SEPARATION is on, it controls the age threshold to indicate
 		the data blocks as warm. By default it was initialized as 2621440 blocks
 		(equals to 10GB).
+
+What:		/sys/fs/f2fs/<disk>/discard_io_aware_gran
+Date:		December 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	Controls background discard granularity of inner discard thread
+		when is not in idle. Inner thread will not issue discards with size that
+		is smaller than granularity. The unit size is one block(4KB), now only
+		support configuring in range of [0, 512].
+		Default: 512
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e8953c3dc81a..bd1430d09c6d 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -332,6 +332,8 @@ struct discard_entry {
 #define DEFAULT_DISCARD_GRANULARITY		16
 /* default maximum discard granularity of ordered discard, unit: block count */
 #define DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY	16
+/* default minimum granularity discard not be aware of I/O, unit: block count */
+#define DEFAULT_IO_AWARE_DISCARD_GRANULARITY	512
 
 /* max discard pend list number */
 #define MAX_PLIST_NUM		512
@@ -410,6 +412,7 @@ struct discard_cmd_control {
 	unsigned int min_discard_issue_time;	/* min. interval between discard issue */
 	unsigned int mid_discard_issue_time;	/* mid. interval between discard issue */
 	unsigned int max_discard_issue_time;	/* max. interval between discard issue */
+	unsigned int discard_io_aware_gran; /* minimum discard granularity not be aware of I/O */
 	unsigned int discard_urgent_util;	/* utilization which issue discard proactively */
 	unsigned int discard_granularity;	/* discard granularity */
 	unsigned int max_ordered_discard;	/* maximum discard granularity issued by lba order */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a9099a754dd2..f4bf39ee31c6 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1060,7 +1060,7 @@ static void __init_discard_policy(struct f2fs_sb_info *sbi,
 	dpolicy->granularity = granularity;
 
 	dpolicy->max_requests = dcc->max_discard_request;
-	dpolicy->io_aware_gran = MAX_PLIST_NUM;
+	dpolicy->io_aware_gran = dcc->discard_io_aware_gran;
 	dpolicy->timeout = false;
 
 	if (discard_type == DPOLICY_BG) {
@@ -2066,6 +2066,7 @@ static int create_discard_cmd_control(struct f2fs_sb_info *sbi)
 	if (!dcc)
 		return -ENOMEM;
 
+	dcc->discard_io_aware_gran = DEFAULT_IO_AWARE_DISCARD_GRANULARITY;
 	dcc->discard_granularity = DEFAULT_DISCARD_GRANULARITY;
 	dcc->max_ordered_discard = DEFAULT_MAX_ORDERED_DISCARD_GRANULARITY;
 	if (F2FS_OPTION(sbi).discard_unit == DISCARD_UNIT_SEGMENT)
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 83a366f3ee80..5ab42da5f2a3 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -473,6 +473,17 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "discard_io_aware_gran")) {
+		if (t > MAX_PLIST_NUM)
+			return -EINVAL;
+		if (!f2fs_block_unit_discard(sbi))
+			return -EINVAL;
+		if (t == *ui)
+			return count;
+		*ui = t;
+		return count;
+	}
+
 	if (!strcmp(a->attr.name, "discard_granularity")) {
 		if (t == 0 || t > MAX_PLIST_NUM)
 			return -EINVAL;
@@ -825,6 +836,7 @@ F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_request, max_discard_req
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, min_discard_issue_time, min_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, mid_discard_issue_time, mid_discard_issue_time);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_discard_issue_time, max_discard_issue_time);
+F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_io_aware_gran, discard_io_aware_gran);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_urgent_util, discard_urgent_util);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, discard_granularity, discard_granularity);
 F2FS_RW_ATTR(DCC_INFO, discard_cmd_control, max_ordered_discard, max_ordered_discard);
@@ -960,6 +972,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(min_discard_issue_time),
 	ATTR_LIST(mid_discard_issue_time),
 	ATTR_LIST(max_discard_issue_time),
+	ATTR_LIST(discard_io_aware_gran),
 	ATTR_LIST(discard_urgent_util),
 	ATTR_LIST(discard_granularity),
 	ATTR_LIST(max_ordered_discard),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
