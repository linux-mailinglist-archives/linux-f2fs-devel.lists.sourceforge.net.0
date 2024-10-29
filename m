Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 804B39B493D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4h-0003zm-Mj;
	Tue, 29 Oct 2024 12:11:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4f-0003zf-T4
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sMZDrvESraSmy01tSsVbChbFpYkFMftk+RYkxgVIJVY=; b=GjH8Ob8MhMdd8MpwwaDEVQ0sdE
 tiT9FusUcRXYfbEwQnmte0d2TsU9F13nXUE2QBlYyYxWfA5x93dywuchQ05UIeJdqySllAQY+ezPv
 Wry84aP31MxOidj7l+vQkE3ZIE9iuRK+ipKC50rt6xg7GM9/ysnlmr+WTnPr9McNUvPw=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sMZDrvESraSmy01tSsVbChbFpYkFMftk+RYkxgVIJVY=; b=NsYXmjjtDiVQNVYLsvicYM66xC
 c3HOXMiFN3Q9yqDdnt2ejNMvepIhiHnuCoSwnPGnAUsS4Mco6IUTvb4hCV1VFaw4GO8EQhzgDeU8I
 U70no7CqyAt5ddaAcBKUpB9Rl8MD7S3rT8dquAeo+xhG4QvK+SXhrcZy3krNxK1eUnC0=;
Received: from mail-psaapc01on2084.outbound.protection.outlook.com
 ([40.107.255.84] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4f-0007Qb-Ud for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=uhEhckUek+ajd86P3XnG1RTiD//TPUpPe4b8aD8KWo1OJVtefCjhw0mhq30tPGL5u43dDk5GZYdGzgCnY7C13PryyvbtcujCO75dN04U2Icuvr9m/odqHfvdt5JcMq3teTEZ+v1OedUAjZSxfRhXp2Eo/4lahrAY9yPxd9PhxIWqv0V2z9SeE/0hjaFjZvB7q3Gc/rgYzcZUpeXoBbe0xJW2zERk1TcWbP9F14tM0UhynHh/1NGn49GEJL7BU/nUOSvDHXDJFNLyNR3kY8WrAFWY0a9yEin8rHU4lqPUcrNrUBUiqv5pVek2SXLWpLt0AxjRwETimXH+nOCSMu2Hlw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sMZDrvESraSmy01tSsVbChbFpYkFMftk+RYkxgVIJVY=;
 b=N1ZwW01pvqD/LppQovlsJSXI/CE78o+7G43zcQUn7xRKQh1Yi2wBgmjd/aqIRrlBKZLd7XO1SzyryksWkRb3HiS2gAC7JmkdISxnCVemokdNoA4ymDOdAyLBRh/P7UqSVMgDAg+2Z/9+6YXOIkGeqYnmjydXokLNr1Q+HRXcx9cRW3fJvkt0oAQdM57zmFYDbfVH2GuCMuA2F7ml9yMoJ+jPS+F/hzhsc2wi4hM38tUkrOTMvUHYIF46nRDhdJxxflsZEuSN9WS9aloXLIDOiLy7wR5fp3PuqqkdcrNF3R7Oy9m2BRykeXln4WAjbVOlcr9FgOeCZ5wpc9cs532fAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sMZDrvESraSmy01tSsVbChbFpYkFMftk+RYkxgVIJVY=;
 b=h0poWzXMM2M+niJSKZXm0Ux/G4wMBax9GkPk/QaAgpGv4r6Oo9uZVvz7+iyBnhE/OxUtZcHUlo2v4r72tm0JQqOH9jaoOadNVT+0bmc9IMFgnPbxJQt4LEu+15rwJWAonxqVrgy8+EzjVGyWcttvG9jTDyKnJKPdO/nAvc7Sv2c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:33 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:31 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:35 +0800
Message-Id: <20241029120956.4186731-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: d7856129-2ec5-4b70-6b5a-08dcf812d2bf
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cwXuzryHOssf2HA8wDsM4xU49gmOMcFMINaehXyKpRUwRJcpW5rz+5wwdJqL?=
 =?us-ascii?Q?o/bZ2UqWAH/s3LGy9hMqok9UZa31QtZ9EjY+nUbqLWiZr4lLdBjbWfrlLg1h?=
 =?us-ascii?Q?LkXBNMa7GrVOcyRS8G6vZdj696T98rzGHMayrrYNvtAus/4fTBFletV2KpA8?=
 =?us-ascii?Q?NidJNRU88ufb/LpI5KWektRiISu/Hetl8nxiX5MxwUxwcA45g+FbGXlz2rtr?=
 =?us-ascii?Q?HrUh5d8QNo/m7hFmVPjtoM+zpAqJpnokmZxpV9BH5XrOzWZOsHnVQXUjOg0z?=
 =?us-ascii?Q?NLpRN9xJildBl1yjV0ZZI3AUMGkiSQ1Pg3TwGnCVWI831ZenLfIa5LAS+GJG?=
 =?us-ascii?Q?BTXWzyJaCR766AFYhyAdyKE0tRSBblo026A7NDCj5LK2cJ3owLKPfDt0rs9T?=
 =?us-ascii?Q?hHc4XXGilm6s/NG5A0D3sHF3ofrwQdh02BRcx1as6EVGBN4CHbG1JSnDnYzC?=
 =?us-ascii?Q?uLJO8ZCot0M98BrgFy8jMZHkqr1PAaFgb02RIL9c7qP1dZLw6EWu2SwKGmK9?=
 =?us-ascii?Q?yz8geNHxAngTuBVKOF/F2RsXcbeWatul5wNnX5ON52TC9EyQ1AyArdWupAja?=
 =?us-ascii?Q?INtSdpsN1iZCqMURl1NtXcUQgVLH8w+1xJYKxw331fTAovs95EieUXxJPGsY?=
 =?us-ascii?Q?aw+/wULm1ZcvXEquQaja899Rju+f+V6ae+d1ILwFr2V8MqM6430D2MQ6N29F?=
 =?us-ascii?Q?nSvdCBbY+oFO+1XZYzZGgQLALfrLc+yQnoaKxTreL1DkBbie1SPwFK3Qgx7D?=
 =?us-ascii?Q?XA25Mma68lDw41BfdwgQjhHfIt5PGC56k+tHrdyizFd4QQ4Zr6xSD05Sq2fM?=
 =?us-ascii?Q?ja8m7ojjK+oEUdOjNj5k3dRantO7kJ9tX9GvAq6FZrnPWtQZC5NG9UcE6aYg?=
 =?us-ascii?Q?yrt3Uk1XAPim5cvXOKDV3s3Z6qQ9H+d7fvODa3OZISUqJmAuiQNxvJvWoolD?=
 =?us-ascii?Q?rJPkbEWtLapJyLzUaqlmm9Mjs6W5W/fIfCC96iMsttgwhLF+lvdv3uqquffl?=
 =?us-ascii?Q?msqBLsiAa7lMwLmjJYa9WjlhS8pD9K5MCivfhYuxhzRaFBB994RNUE5cHksc?=
 =?us-ascii?Q?IMCqWWrWyI9dl1PkR89gQefF/cQh+bGndXG2fU4oPOWvFIqBWwimkqaN5tCn?=
 =?us-ascii?Q?+y+y6Qx5r+I5hOAptBGeDQr9pI6ywfEndsqPfZ4upUsbk/wv0O+8YEOdW9Lz?=
 =?us-ascii?Q?dyX3GdDvFbj9wIgzkr2a6qrw5Xt8L6da09UVDstA+ZPSp1R+8E/4F4lwXUsV?=
 =?us-ascii?Q?DaTeOosdcScDDMhrb7xZEJRM+aRuU5bTiM4X1FO0tYXXe8WRRyqZd8tgxVvy?=
 =?us-ascii?Q?KFw9Ds3eSdwT9gS8zt0XPR8eRpqgKM2bx5Ts4w1VrsnNr7potsKo6QQIFNB/?=
 =?us-ascii?Q?yhiUvIk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGou+dS2ZebWSAH6ZM1RuRGSRZi9GJkLw9CFbMLqQEMfWe6BAdjebjj63Qzc?=
 =?us-ascii?Q?rhtSsVA9jO8ZrPRxXacWO3hpod0zecUP2q15/Vt2k1Trmau+mCme9KyxYrNi?=
 =?us-ascii?Q?dUJbJerdcSFsvI5adhxxUKFpwdWjJhYnc4/91SVSbSTHMWAKleKqc3OaPITs?=
 =?us-ascii?Q?Y8k+8o5rOqL5CQumjS5NVLZR0/GPeWEOqM9gY1CAc7vfs5Fe1uTt58eibrxm?=
 =?us-ascii?Q?lVa+VHgxEh8yPCO3bqs+lHpoZW8qVYJVIuQ8P8mUqZYfo5F8Blxu8Gi0W1wT?=
 =?us-ascii?Q?DnrSwxzAhw/1IjeZknWwx4RKfRc8FiYdmVUckeKaMSod+Y1QXaaCDDgoaAaZ?=
 =?us-ascii?Q?gm2a9H+MX8fNS+BmOU5ceIAPG3H/zIUw/zcDm5+ORy5ChCQ0e3rqN8VIsKZd?=
 =?us-ascii?Q?9KEJWhl+BmMC97yLoH+UC9KgfOiUmOaexsb/75LiACQMxWpwwA/IW0zGtRDf?=
 =?us-ascii?Q?TjOnKw0KnuQQdQigfxbYQrNyqSLV40yV+lEfdLtNcT630lBobXP34VTCXH+f?=
 =?us-ascii?Q?TJ6gqO07WSzG748hbPU+QA8e4VTZ2fOQn84NBTZdsYQ+F1IHxXUL2h5lF6D2?=
 =?us-ascii?Q?oiM9hVkU1Y8v12dAzq3lHP9GWlyzsgPGh0QzLCjbfmVz7uTZ9KRP2yyn4YOz?=
 =?us-ascii?Q?DJ3UmcoxikCOQqyglPyZ+d1rS7wcBH5kXTl2kbnR9q77Q5j1QEeI0Pb2z/PP?=
 =?us-ascii?Q?AXenx+adG2kWOVsGMbTN3nKrgnCaWLLZtlt37PL7pdREiD0He3J6OiPhq7XE?=
 =?us-ascii?Q?7k2AWFbQ/U8n9h9UlFw2+2Nd5KJ6kxZl36ljbo58VkEngChlg4MzyOKSyB11?=
 =?us-ascii?Q?a1YarnQxuwY7MW/LXI1ywffgefBqZ8rMkRIZ0+J1tjM4+h47YYlM6z7vy9+1?=
 =?us-ascii?Q?SgG/qJMgRQWMQgZms1WSe8NgAUInrK72OIH+qbiBMTFB067g28qTJyg1eTN8?=
 =?us-ascii?Q?ymx8qNa5URWooxfZWlbakg4/0E0PEIbxpDtPbqmBNscpzbMU9MFLDkoPWWtw?=
 =?us-ascii?Q?rJ2xxqGkEBI0ubbFwOXPqjJkiQOwrNtXVhiR/5g2Wk26srxe5Y5bBSFNVRwu?=
 =?us-ascii?Q?BycRcc3LFAWe5KoYrClJyhC8djjJqZ5nc0yBdFnHSRl6n5wICE2KkivwejRz?=
 =?us-ascii?Q?C/inCwPRHIuRHfNdADFrTYk7xwITldOIcjMUZQGHSIPaMaqRGC+rdQUluDOD?=
 =?us-ascii?Q?veeN5Gci5WU6z4LTzTBDqefLg2W92jnSNbGcLHqBwIhVNGTpAw30S5TAP7Rw?=
 =?us-ascii?Q?fSgkzpqiCpwd9zgYg7kwI3+dmDySFrGzAoNr5WZ7y9iAnYkWqisbGaFo3QB1?=
 =?us-ascii?Q?4Mp5kGIpm8eKrK7waUbsLEcrfjfCYW9AteanljqktuXy5ZK9vnOP1z8Odg3R?=
 =?us-ascii?Q?PQGi+hUGvkZFKrn6cndgTJkL+9EirNSnJMvB/ajk1ZO65eBdnLoidAZgDeJW?=
 =?us-ascii?Q?s67RPBopUUK1scja3R1I7k+gUB03bv0KWBLRo5hB/CKLbmWiQtdM6cePKxrl?=
 =?us-ascii?Q?BU47M1guS7dyxb6Mdm7v6o8rWzm1KBmc9DM9yGSZBXW6RlTtRNEh8cX/m9j1?=
 =?us-ascii?Q?ii7BE277tmSps/UnAEZiWSYngf9WGRIFnWuE06IJ?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: d7856129-2ec5-4b70-6b5a-08dcf812d2bf
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:31.0355 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66yEZ3664VKVbeiuhDFLS+MX3Szy3rdzIKutisQTR2itL6ixwPgiY0iCeEC+lEjrT7Oc+U1/VC2vN+x79zEgyA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If one cp is invalidate, set CP_FSCK_FLAG to allow fixing
 cp at the end of check. Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 fsck/f2fs.h | 6 ++++++ fsck/mount.c | 11 ++++++++--- 2 files changed, 14
 insertions(+), 3 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.84 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.84 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4f-0007Qb-Ud
Subject: [f2fs-dev] [RFC PATCH 03/24] fsck.f2fs: fix invalidate checkpoint
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

If one cp is invalidate, set CP_FSCK_FLAG to allow fixing cp at
the end of check.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/f2fs.h  |  6 ++++++
 fsck/mount.c | 11 ++++++++---
 2 files changed, 14 insertions(+), 3 deletions(-)

diff --git a/fsck/f2fs.h b/fsck/f2fs.h
index 187e73cf9aec..651a1f734281 100644
--- a/fsck/f2fs.h
+++ b/fsck/f2fs.h
@@ -346,6 +346,12 @@ static inline __u64 cur_cp_crc(struct f2fs_checkpoint *cp)
 	return le32_to_cpu(*((__le32 *)((unsigned char *)cp + crc_offset)));
 }
 
+static inline void set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
+{
+	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
+	cp->ckpt_flags = cpu_to_le32(ckpt_flags | f);
+}
+
 static inline bool is_set_ckpt_flags(struct f2fs_checkpoint *cp, unsigned int f)
 {
 	unsigned int ckpt_flags = le32_to_cpu(cp->ckpt_flags);
diff --git a/fsck/mount.c b/fsck/mount.c
index a09a974fc810..bbe29dba0f45 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -1322,8 +1322,11 @@ void *validate_checkpoint(struct f2fs_sb_info *sbi, block_t cp_addr,
 		return NULL;
 
 	cp = (struct f2fs_checkpoint *)cp_page_1;
-	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg)
+	if (get_cp(cp_pack_total_block_count) > sbi->blocks_per_seg) {
+		MSG(0, "\tInvalid CP pack block count: %u\n",
+		    get_cp(cp_pack_total_block_count));
 		goto invalid_cp1;
+	}
 
 	pre_version = get_cp(checkpoint_ver);
 
@@ -1387,14 +1390,16 @@ int get_valid_checkpoint(struct f2fs_sb_info *sbi)
 			sbi->cur_cp = 1;
 			version = cp1_version;
 		}
-	} else if (cp1) {
+	} else if (cp1) { // cp2 is invalidate
 		cur_page = cp1;
 		sbi->cur_cp = 1;
 		version = cp1_version;
-	} else if (cp2) {
+		set_ckpt_flags(cp1, CP_FSCK_FLAG);
+	} else if (cp2) { // cp1 is invalidate
 		cur_page = cp2;
 		sbi->cur_cp = 2;
 		version = cp2_version;
+		set_ckpt_flags(cp2, CP_FSCK_FLAG);
 	} else
 		goto fail_no_cp;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
