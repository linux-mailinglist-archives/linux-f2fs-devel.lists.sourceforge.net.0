Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DDA7592C7DC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 03:19:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRLzY-0006Y0-FQ;
	Wed, 10 Jul 2024 01:19:32 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1sRLzX-0006Xm-9f
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kSxp0Z9sy8zL14aTilIZMNBsf5lvlnuWdkZrA8tEkZ4=; b=hRrNu3KTZ5pzIf26XT99rQj2gh
 +fmQ39tX8gDhyGBTJFsxxUSnDALdJZ4v075slPuIUf3ewcYKYGVysy2q+m9tLOYDDCK5PXX7xUH9P
 o+UoGpPWYAjb0TqrY39cRes/tISLpppFybHZWWw/0DI3XgQnbXjLtJOS3dl8sDikbBzU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=kSxp0Z9sy8zL14aTilIZMNBsf5lvlnuWdkZrA8tEkZ4=; b=CrYlk7IT8UqPEv+p7Hc8i0gzWq
 f1H6vGJHnOZ0EF9+td2Gp4fQsf/EYg5WtkludNFiMpaifU6+pFzb7wn+d935iCwY+2+OoPugDOXJR
 XHCkqRDqBE2CLk665t+stlGYnTW5Xn3wJYQ1XQ8+9JNJNO4TEhPe9DjXcH8sTljCcxV0=;
Received: from mail-tyzapc01on2049.outbound.protection.outlook.com
 ([40.107.117.49] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRLzX-0004qo-Hp for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:19:31 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mZY92rAaaKG70YtutbblbavkLoG8w4XnTjzMgVu4NNTuXgYSWTU7vY3CkeUVuopM5N0RSGVtjzOF9QLTxQ8vYamisjmXIP06vMUaCQeP9Y3H3ZXUFpf4BEUYhShFft8/yxCWFO8GIQc2QJa9z4/7ZvtZx1IVcVcTDb6PibG0X7Y3BJctYOyN7QZI0CGDXIqh7Wu2sKN60Dgd4lXjjBTZBretmphzLMnrQtiyr2jU4IjBlqUS/yXctI1O8DWSna6VOOzSMF1WOs89houVhGEbbnSf3QJc444DMM1HwsCrpkJqZxcvQa/DpQMULHxh6sjlnGjiaa1ASgI4oq3YiGxvTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kSxp0Z9sy8zL14aTilIZMNBsf5lvlnuWdkZrA8tEkZ4=;
 b=WRXO/M62F2bwoQON9fPzay75avN8gHK8ML8AYvImINz0uw1SdR9qrNKtM+o3PPr4rfznDo9RbretJWCbI4lc9H8YVHf5mNXTKXnikOiEOOcsleDUy6dJ6+iyQPsJEGJcnneueQAXa4mMKKJRFw1Z7Gxi5zXx29FcSLp1orHe9vsYl1exTLYHW4YF1cU2rV04nl/RVpw4wLP6xykHK31vW6Fh17wC9QbWABfJXHWSKXMUsNuJ8sow1S1YKdZz+8CH7C8eOto56Z9F4xDFn0tAPOTCn9wOMM1PyIWCi9PXXFu2BWiumJEGTKO0Kveiq9uIkaxBetXWC+qYmzD77ZaAkQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kSxp0Z9sy8zL14aTilIZMNBsf5lvlnuWdkZrA8tEkZ4=;
 b=BilNDH9Mao1arKCdP5aRo9H+jjwCY9XBnzRwJeAefPeY+2v+7TJIHPcGvuqOpRXcQs0z+p0BCRQPiw1uv8K2qCMWMZP/NRxJ1rcrO8JR6ypjP9HT/CZPnPIWQov5oItpl2JIQPmY7MaQ9rtwFshZHX/LFWT6VtOn9rejMx0c5R8AlYuha+yhXoEBGVpze9l6QzapdeRwaKl/k/xVNaRwsmXmrOoqyRIk03CAnDhe2kISBeVIf7KCZ+Q/L3KE205fYMx6uBcZCDkC868BW0PulD+Qzxmlpa5VxDieRGVUk0aMIPRgB4MtlhQaAR+icm3Jwj+amXuDHDGvNGuGNaLo1w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6889.apcprd06.prod.outlook.com (2603:1096:990:46::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.35; Wed, 10 Jul
 2024 01:19:23 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 01:19:23 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  9 Jul 2024 19:33:06 -0600
Message-Id: <b83c3375c65b307704ce39821b3fd3fbe904ec79.1720515215.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1720515215.git.bo.wu@vivo.com>
References: <cover.1720515215.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR01CA0030.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::15) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6889:EE_
X-MS-Office365-Filtering-Correlation-Id: b660b001-d784-46b4-ea0c-08dca07e5522
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lPcDXUenU3eltiuHDJISFbaXISKXHdXYLEYBPPMlyuIu9P7Oat7OPtyiBa4w?=
 =?us-ascii?Q?1unSFUu41mO4h2nhTtW7CbUWZDzr/69X7fUZSacM/N/TEuzHWT3pK64f2mr4?=
 =?us-ascii?Q?V9Zfs2l1fLDtS7KEOsGg9bh0XMMXCZUaWL4skvAI1K8Te9g4WqMdegX0eIii?=
 =?us-ascii?Q?9B7/THxzYGFQdEsu6flvxSr4hREHxV5pFJYJCCD+BI7O37j+XW/l3o+EsB49?=
 =?us-ascii?Q?f9Sq9uqRBiDokeabABb6GnlOMK8zgL0cpQhbudkExnyhAm9e4ojBjP2OioJw?=
 =?us-ascii?Q?JlcOND1MyOhMgYEKQqG+lPKZ0u48HLt0C2SiLz2DK/9lAAENEFEuKLmDuDS3?=
 =?us-ascii?Q?LIae1g4MJFIFvWU0PjmTi1crgtkbwsip6KCSeusQV0bpgvZYesRxdguEzfbU?=
 =?us-ascii?Q?c0a76qIFowii5YGY2RG8QHmOATKSEswFv99iimrhJvRoN2ne/scQNLaVW29k?=
 =?us-ascii?Q?F2QUF+Lr9bzxtv9350FvoVEH40d1Pa4FkOQu6xG2jjSvlsUNvvcREBf7Vp5F?=
 =?us-ascii?Q?h0XK6JLQV82HkX0RKk0jfey00U4fjnKmqxqsUG17rzjuiaWu0G3VBxj5Ygd4?=
 =?us-ascii?Q?PpfkRXJeT6NFtRg9J1YTFEOZfcGaOdIH2lWBXX0qiu9N7pafOxxn0CaqAZ0B?=
 =?us-ascii?Q?cR7p+8HBva88K6y2EvYZWm+1qXBOX+wGVK6sxli0fUsTyF7V1ESq6BPVds4I?=
 =?us-ascii?Q?TYNUZIgasR0ZG82sTxTNnPWpAOvRlyWgE0fVaEnzO4nqaxKcj3ivWq3kuMh+?=
 =?us-ascii?Q?uYI2PSvFNCuVMjn+H7BTTNcqTBNKk5HyWRinjIILWlLj9W+udJ6hzBcoMTI8?=
 =?us-ascii?Q?z5MZlHYYUXYqJ0FZ/wnsgZutLpWqcnW+qAPET+dtFs9WFbO7n1JQvMMDKiWo?=
 =?us-ascii?Q?ksLKVaDu10+TUEJEGg35QjHIg9PGNkhJwkK7eCF7AmCMWC0WxlENdTwOR0jB?=
 =?us-ascii?Q?oNgfslS8IVlYVkK3AOVO1cbprcQY4tOPT9ZI32tFQZcUF/ZQGK57ysfb2Ogk?=
 =?us-ascii?Q?sW2cndz0HPQg2wHPFXk0SG1FXLN8UvGBzqEpCyA6DV/IREOMLl0UTALT8DBA?=
 =?us-ascii?Q?Ropi98/LxxyVSZVeR3dELYHP8eoY9Yxz1CnlSJ1UQMLtYbEiIdRnkE0cGepa?=
 =?us-ascii?Q?1ulfa4F/ML3wWhQNsn4M51FAtguE1lG+CNCFCHqTN38oOYpfzrbQ2EuMMcc8?=
 =?us-ascii?Q?2yFGbO07fDSBQR4Em+jFDLz1wIyTFVFziLeSGDn99AZy0bkVWWth75FrwxnH?=
 =?us-ascii?Q?24gZuxz9QEBsmhr+XBL6E7QKjDNg6z9kkcOITm2xENavKrP/TzZGaxk4KZG4?=
 =?us-ascii?Q?x4brO0WA8s91Dejoucr9+I7lAGtm2JyEmSXWwzZPQU4MBMSWFgzyrhUIMFeV?=
 =?us-ascii?Q?ZL/j3X22TP9wBT1w25ObVFPB/cUks3OrXJhBH+dHvLMHnft7Ug=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vOCg/WIet7hTbMdXRQcdTW7ohSMooE+w2ctSLhcDhFjc09YHxKd37nbd0Wr7?=
 =?us-ascii?Q?jHkAOJ+knLHRocEMw6qE61dV40xyo7bbOd7o7ly645kl7OUULFct6T8ORuwV?=
 =?us-ascii?Q?lsbwENKmsU9mx6xLdFWYgs5+yJZ/LHbe7lNwPi9DoNjV+0JYKXXyTZ20OF2f?=
 =?us-ascii?Q?KVueofdm41c4m40X1Ny0Jdtkel3UWzlJE7Gf7a3Oq36F8nRmbaCoBaiwaU9j?=
 =?us-ascii?Q?CNhGLveq/DVLTXBSDGQYZjVfu99qCJahWNbZJsM/otpautXsoEIiB/CVzTlD?=
 =?us-ascii?Q?z/6L0ZkA9/aog4N+3Bjf03flKeSZ1+bJ4e1RSIXqwHODoHe9iyzP3P+CBR47?=
 =?us-ascii?Q?dytUOOswofU6hbme9Roz4QVZC9w5qpshQwlph+zRhkdG53UL6AkFBIpPZArz?=
 =?us-ascii?Q?hkSS/pSBFX4VRSYYXoJsBDUUGc7XDvo7XfyPoHdw/Cfkvj+JrnPQp9EFTvye?=
 =?us-ascii?Q?NVCu75svY8sJIKl5QJk/Qb1NLgf4FQy5TjhzrfLHllsQlH64tDnv6M8uHoVb?=
 =?us-ascii?Q?52uWkfDGdVxNfQ0Irf/TFf+AaFz34ZOcW0GBWLHlzBnyB7oYhQMld4qXcB1I?=
 =?us-ascii?Q?D4JwifQ/rWqMhCyFuLP916bt+f42NWbLufDqSaDAs8Q70ONQq8kZvmPoXvAT?=
 =?us-ascii?Q?geLteAC81J192YlxQp/C69WyhjB7Po2nKIEhiAuMeVAoS4DsyiwtEQ2kzb+w?=
 =?us-ascii?Q?cuRhu1hHLsqvnNp7gy8YYXU0YA5XrOlJGV240OkOOo9a/GVPbOODXcZFxLyJ?=
 =?us-ascii?Q?2Dn7z0Y5GBYqWTSZJzY3N3/RU7qo7v7Ohiiu4ZX8NeesBjJMD/B1f6yc8ImR?=
 =?us-ascii?Q?jxHvi+RABx9cIPSiwkwlr8wgdg7WvlKcy61zEr8kFQ8OzfDZg3SqBbDZco6H?=
 =?us-ascii?Q?LWzYgyBzd2InLbteDBUuwW1C6bZrFkdo0neIi5VsHoqIW56qlaBEH6ap0CxB?=
 =?us-ascii?Q?wwjiq92Jc3Cw8jEXkN4HcCT2Gu4iS1FL/U4ZjV8gldoIe8WUeBe23OeYRsYc?=
 =?us-ascii?Q?1UhRcP+JcwK/nbUcMJjzOJtIRn4gesBn34rlQzXjg1tlA5xwPV2oMhy6o0Vx?=
 =?us-ascii?Q?/OYSDRy5JZwUpGNi4aZoOWIEG7NEqVEx6wJQK5CGxB3O+Jfqj/eiUeX0drrk?=
 =?us-ascii?Q?fSE9YejMZc/zFpUm+zOwCIKo5rkieaIwSFTzpRfp6mvKdvcXj4Y8rboBIddC?=
 =?us-ascii?Q?8x9gWBBWpbDF99YE0f63jnUTZNt7Ov3/UJbeAvbyKUBVLQAyloZXZiSJagd1?=
 =?us-ascii?Q?ZzRp2erDkPt33QPHa3BdTOvSVGHsyGrKaVgXlU5hV7oZW1g+pqyhaSgbRyFU?=
 =?us-ascii?Q?FYNZ44SddK4mSSsZP9+6IUsUrYz6w8MYvw5LvFy1e6lO9ZXoo2DRfA+Kilt+?=
 =?us-ascii?Q?jb8AP8x05rHT0qq3KS2eptjRkXL9BBgCISFpUK8yVlLadw0Ye0JqRJ6rUloT?=
 =?us-ascii?Q?ax/emZhPsivRdMI3VpBlNLwvqOK+liubIC/I+VENoi/0iNjuV3rF6NRVKt/Q?=
 =?us-ascii?Q?fwtpu3e7cMioVuXpyJEa8v3fS59rjWRWHcmxGF//Qj3M7h3DXWpU1TRPFfwk?=
 =?us-ascii?Q?eCd8DGTeAyMxsdb/S2SLD+/Uu3z3auQzPhjvIewi?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b660b001-d784-46b4-ea0c-08dca07e5522
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 01:19:23.5752 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XyhLy2ke2CNADH6Xv7zkpDnyzccJhtcn5j7ZI0G5tbUzqOY2CdHMrigH04KaNXMjciOrMwFrhAIdoJ1gUjuVUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6889
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Expand the inline data read & fiemap to support inline tail.
 Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 31
 ++++++++++++++++++++++++++++++-
 fs/f2fs/inline.c | 26 ++++++++++++ 2 files changed, 42 insertions(+), 15
 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.49 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.49 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sRLzX-0004qo-Hp
Subject: [f2fs-dev] [RFC PATCH 4/5] f2fs: implement inline tail read & fiemap
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, linux-kernel@vger.kernel.org,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Expand the inline data read & fiemap to support inline tail.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   | 31 ++++++++++++++++++++++++++++++-
 fs/f2fs/inline.c | 26 ++++++++++++--------------
 2 files changed, 42 insertions(+), 15 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 2481da74c13d..1a239f4f82e8 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -1920,9 +1920,11 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 	u64 logical = 0, phys = 0, size = 0;
 	u32 flags = 0;
 	int ret = 0;
-	bool compr_cluster = false, compr_appended;
+	bool compr_cluster = false, compr_appended, inline_tail = false;
 	unsigned int cluster_size = F2FS_I(inode)->i_cluster_size;
 	unsigned int count_in_cluster = 0;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	loff_t maxbytes;
 
 	if (fieinfo->fi_flags & FIEMAP_FLAG_CACHE) {
@@ -1981,6 +1983,16 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 
 	/* HOLE */
 	if (!compr_cluster && !(map.m_flags & F2FS_MAP_FLAGS)) {
+		/*
+		 * There is a reserved space between address array and inline
+		 * data. So it must meet this hole state before inline data.
+		 */
+		if (f2fs_has_inline_tail(inode) && start_blk == end_index
+				&& f2fs_exist_data(inode)) {
+			inline_tail = true;
+			goto fill_extent;
+		}
+
 		start_blk = next_pgofs;
 
 		if (blks_to_bytes(inode, start_blk) < blks_to_bytes(inode,
@@ -1998,6 +2010,7 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		goto skip_fill;
 	}
 
+fill_extent:
 	if (size) {
 		flags |= FIEMAP_EXTENT_MERGED;
 		if (IS_ENCRYPTED(inode))
@@ -2011,6 +2024,13 @@ int f2fs_fiemap(struct inode *inode, struct fiemap_extent_info *fieinfo,
 		size = 0;
 	}
 
+	if (inline_tail) {
+		start = blks_to_bytes(inode, start_blk);
+		ret = f2fs_inline_data_fiemap(inode, fieinfo, start, len);
+		if (ret != -EAGAIN)
+			goto out;
+	}
+
 	if (start_blk > last_blk)
 		goto out;
 
@@ -2370,6 +2390,8 @@ static int f2fs_mpage_readpages(struct inode *inode,
 #endif
 	unsigned nr_pages = rac ? readahead_count(rac) : 1;
 	unsigned max_nr_pages = nr_pages;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	pgoff_t index;
 	int ret = 0;
 
@@ -2390,6 +2412,12 @@ static int f2fs_mpage_readpages(struct inode *inode,
 
 		index = folio_index(folio);
 
+		if (f2fs_has_inline_tail(inode) && index == end_index &&
+				f2fs_exist_data(inode)) {
+			ret = f2fs_read_inline_data(inode, folio);
+			goto out;
+		}
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 		if (!f2fs_compressed_file(inode))
 			goto read_single_page;
@@ -2455,6 +2483,7 @@ static int f2fs_mpage_readpages(struct inode *inode,
 		}
 #endif
 	}
+out:
 	if (bio)
 		f2fs_submit_read_bio(F2FS_I_SB(inode), bio, DATA);
 	return ret;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 8c1636c1ff2f..e4f72291713f 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -68,8 +68,6 @@ void f2fs_do_read_inline_data(struct folio *folio, struct page *ipage)
 	if (folio_test_uptodate(folio))
 		return;
 
-	f2fs_bug_on(F2FS_I_SB(inode), folio_index(folio));
-
 	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
 
 	/* Copy the whole inline data block */
@@ -108,15 +106,12 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 		return PTR_ERR(ipage);
 	}
 
-	if (!f2fs_has_inline_data(inode)) {
+	if (!f2fs_has_inline_data(inode) && !f2fs_has_inline_tail(inode)) {
 		f2fs_put_page(ipage, 1);
 		return -EAGAIN;
 	}
 
-	if (folio_index(folio))
-		folio_zero_segment(folio, 0, folio_size(folio));
-	else
-		f2fs_do_read_inline_data(folio, ipage);
+	f2fs_do_read_inline_data(folio, ipage);
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -794,7 +789,7 @@ int f2fs_read_inline_dir(struct file *file, struct dir_context *ctx,
 int f2fs_inline_data_fiemap(struct inode *inode,
 		struct fiemap_extent_info *fieinfo, __u64 start, __u64 len)
 {
-	__u64 byteaddr, ilen;
+	__u64 byteaddr, ilen, offset;
 	__u32 flags = FIEMAP_EXTENT_DATA_INLINE | FIEMAP_EXTENT_NOT_ALIGNED |
 		FIEMAP_EXTENT_LAST;
 	struct node_info ni;
@@ -806,7 +801,8 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		return PTR_ERR(ipage);
 
 	if ((S_ISREG(inode->i_mode) || S_ISLNK(inode->i_mode)) &&
-				!f2fs_has_inline_data(inode)) {
+				!f2fs_has_inline_data(inode) &&
+				!f2fs_has_inline_tail(inode)) {
 		err = -EAGAIN;
 		goto out;
 	}
@@ -816,12 +812,14 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 		goto out;
 	}
 
-	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
-	if (start >= ilen)
+	ilen = min_t(size_t, MAX_INLINE_DATA(inode),
+			i_size_read(inode) & (PAGE_SIZE - 1));
+	offset = start & (PAGE_SIZE - 1);
+	if (offset >= ilen)
 		goto out;
-	if (start + len < ilen)
-		ilen = start + len;
-	ilen -= start;
+	if (offset + len < ilen)
+		ilen = offset + len;
+	ilen -= offset;
 
 	err = f2fs_get_node_info(F2FS_I_SB(inode), inode->i_ino, &ni, false);
 	if (err)
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
