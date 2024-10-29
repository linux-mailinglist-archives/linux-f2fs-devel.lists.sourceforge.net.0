Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A1F9B49A3
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:27:39 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lJw-0006m1-FK;
	Tue, 29 Oct 2024 12:27:37 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lJu-0006lk-3T
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Gy5s7n/f9sXm+lK7/nKIBoASAqOkWzuXhnAl2Y+nuf8=; b=A+sCxy/6TJRMPrekO77M5xyN6a
 EK8qxut/6ahI/sHnpSBzgGv5qiVA49/dRKpBvApeigeqbuiokAUbNB1q5riJS+Thg6XGhw752vrMX
 roKy8APCrCxxP2FpPw9uN1mRj+vKIaHLg9KcNLXJHGhPYQwpPCTF7wMUDPHweoEawu9U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Gy5s7n/f9sXm+lK7/nKIBoASAqOkWzuXhnAl2Y+nuf8=; b=i6qEM0PfxWA7GWLBdw5o6i30Lp
 trh5dpgZOic63me0pfE7wNUQaI0p1j9iLxa4JOqFkzhTDyJV0YZvTM4ppWm/9kd0Ramz7dP6fotOh
 m4quK/+Fnq5RT27/kFNO6JbMbjf/3AnO3i5/KzeMHUcgygM0nOY6GmBroEp4Vs3gwR78=;
Received: from mail-koreacentralazon11013071.outbound.protection.outlook.com
 ([40.107.44.71] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lJs-0000f1-6G for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=UmgaQInFxhpjUzvZ9w3Et78/QE14a9Z8Sq7Iz6UsitfltQq4M9FjnnagIDSf1+a3SyPqmK9YpgGO4vkuAI10RgMnT1PxEoiC9TVwAcuFYR0AOH9TLm6OT+ixJdSaqbR5NJJWLkjInaVwbbig2Qd69KBegX9oH7O3/ITRARytq9sof3T8zAUtbdCBKbEIH8f91UKGtv2WOWO7mavyJag3JmoPNB5RtJlJtkXPlmf7vbRJWAdXC33yLlaYwhmgbIHLRQobwDY9qIMV1Mt5UF5i1aq7zYx+nAlqi2CDewOJ1E8FLzjRQ1dSbHz2yb6z0SegD4zKQZdAEeKQ1EImhFmRlA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Gy5s7n/f9sXm+lK7/nKIBoASAqOkWzuXhnAl2Y+nuf8=;
 b=iV6ld1FrRsVoZ3d/Y0rt4IrZ8PfZiTYdDIzhVkvRVRKls1OA0ZISBSKwnl89MnLnp444R56/61F1QGiJ4r215P/teZK+IFpYO8LxurJWwGJrB+Zrw08NSIApo4BVQ3RPJIq6IaH9JFL6vo5LKODEqpjGSbvnkVyGuk3n76BY+H7SWZiwkecmIL71zYDiVASOzPfI6N8UGjJstShNmzyxIDKk5xjOq0uZ0GcxmVeM52RzRkqnvRkQGJM6oEeGHacuB9gZ0g79BXEX/YSrr1JQHcq14+NlpAveVrDVWcr+Q6Ahr0ViugJvrcQ/obUoNdr+aN34X1PsjOfpG8zQ34RhGA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Gy5s7n/f9sXm+lK7/nKIBoASAqOkWzuXhnAl2Y+nuf8=;
 b=SIkCvWjphoJ9MJJRJO403cFkKpDpTRwc6f1n7wkfUJRkUp6ivO2ucRu6HXROAg50FHRICJGqdkuIvCk2zyPKxtZWP2JeJ6rzjPPmHeD032q8o8xBvCb28FYf5p+FhR4gcYR5jTZeQ9xpH9oxhq4SpozvNE2ojmoLQtoHUz1Y46M=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:48 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:48 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:49 +0800
Message-Id: <20241029120956.4186731-18-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 32fbd625-fb75-482f-3337-08dcf812dcdb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?PU1BEuof3IbRglevsayzhxld6C98kH6XzznM8Uf/JaNJ1oC3GYozWmslnfu6?=
 =?us-ascii?Q?FALPajHaXzg3ABl8iZI2DgHBDE5xhYG0ElVIhDOS8AB0O5fXizcwARImsfot?=
 =?us-ascii?Q?fXF9Zs93iufF94c9uW9QP+P0K/rCoKDXHA2YoDPHCZZCFZwNyPszp6ryPyYa?=
 =?us-ascii?Q?5BXf9cEPze9ER57fTyAoD1L+sQzIeA6rrRD2AZASlTPjghumslzkbOI2MeUF?=
 =?us-ascii?Q?PX1CJm15l6kZJvzT3vY3s0TmNsEMQailRAdplyVI0LNyULtLFAxyJrIOz/6Y?=
 =?us-ascii?Q?yrjjoys30EhQB573PFTCGhqo2UBG1jEjt5Wtqz1pyJNK4QeALT0AArP79MdE?=
 =?us-ascii?Q?0iY6J5AeSdjgHuRUokJbx1zjegI2g1OrD4BHjMxGyQIErXbTn3p9+lbuNP8Q?=
 =?us-ascii?Q?dxkKXqHrV9gcBegDsUgT+Ec+2xRJgmOHE5Veibh8e5ojvA8YSNICpvq/s+aR?=
 =?us-ascii?Q?TvKO183vUuNrxWPeyfTMntXEt54QaLkBy28K8/ve8R7m86OuzDzooySk3Ah9?=
 =?us-ascii?Q?TiGXzEBt8gRKnYX3q5V8N2jy7CcKLqdQNiKDyOaKAPnXbWem6Cmn1TZYTfes?=
 =?us-ascii?Q?Qspqrn9YyviUSdpVdOncOPabCjtKzqQ4mUsMF6n5mP5G1T3pP1/8SGpajDpd?=
 =?us-ascii?Q?OT4erWXtT9wI6B/8/RPs/rTgagOWNj4uoNfwncJWmvVCKeFw2/8YkIPuNJMY?=
 =?us-ascii?Q?KV7MZB/A+4zJwfSfmhMkgEzhwUYqDlkp3Z7LxLK9VIWZTDqEIOEWu5Wi2aFa?=
 =?us-ascii?Q?C7nthCA8TuwuUjcRNqh2LkmS62xRmfivR1PxebHMuD1UAMtN1rd+pVt2u0xJ?=
 =?us-ascii?Q?aq1emuC892tPOwqfJHsw0HWulUr/BRVqyW3cWl6AhrpOXXx0ZijlS/CdUtNZ?=
 =?us-ascii?Q?+3g9ZAgGAhm1TPc5pDCRm4o18qTk7zhoNNMgsQZKdTGAXhv6kywu1hpCjx9V?=
 =?us-ascii?Q?e3+WWzqpw2P3g9lHSGhMY1yrk/I/0mMW0/YN3u/98+/N4PMYbl6GDtjqJPTx?=
 =?us-ascii?Q?HRO4/RzifFjTISp0pbTJKax5PQYfEy7fiZkTi/M7gmRza2DPHvliSX6nqjl+?=
 =?us-ascii?Q?s9ZHXWYZ5wr2auqWo9GlxyPFXFh78hDP0S8GaW63LcPJyyru14r0MequnpHT?=
 =?us-ascii?Q?LM1ANJW5jyWTod+4CFsFCVUnVjszCBrc8c0BZ/KI0r9GEVsvhicDkOLcgLTE?=
 =?us-ascii?Q?u0oFUf5vZJtL/qkakW5hMm5Bcg8M3pbZ2udDfK9OPNqA5Nyo2ZpAr2txbf3o?=
 =?us-ascii?Q?1v3yVwwHa1vTI2SIZ4VkK4Qx1xNWNKGKyW8E6QhYghUMXUFwX3UWb+vEt0p3?=
 =?us-ascii?Q?mNDP2QSBYb1z42EvnVIGo23DsmhF+sTz0cDJJtXMSqTlaGxg1Ic7yiH7L4Oi?=
 =?us-ascii?Q?fzBPWYE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?I0vveqL2jw/YEpFWvrNJ5nIYpu6GDxWBtMfKEnbiOJw4AiDy3f5+IJazs4uv?=
 =?us-ascii?Q?XLK0XwQC7toy4gNlF0K1BeNpDSAASzj0P9KU7JoQ0VU/b/W6GUmbo96mb0JV?=
 =?us-ascii?Q?iVoMvRq5q4ljAkNO143PbsLgqXsle0eAiSostEAO7AM948+pvE4LkPUzHGC/?=
 =?us-ascii?Q?pdmYrFP4OXVyga6iUINuG8IXh/y3JgWOc15eDZua9hJh2dHMb1cGHRi+IvEL?=
 =?us-ascii?Q?7KNfHJGSUfeqMI/sReTGaEmdV+MgPVD6SBjd6t/ssBM9QHXP+Oaz7j4skHoA?=
 =?us-ascii?Q?srSqS7BwdTZreEoQ4/naV9wZZ/huVmWlJQpxPk0Wyp1dRGFwAw2i16/sd9yp?=
 =?us-ascii?Q?ikQOvJULaJdLhTa6zVIm0dpoVt9PrKM/wiZnrkyDuaAZ1Q7dDhFr5oTyTwua?=
 =?us-ascii?Q?RtP9DH06D2hthgPRrPHLUAp1kgHgGGuRetBay4+UGaiyANhhTWpkLV/NbAby?=
 =?us-ascii?Q?14XshnLENkm9dgxbMssBi9JW8lwF3hmwj53+f75GOHVZ3ZRFBHBat8rKFGfL?=
 =?us-ascii?Q?lz1a2h4Jwx+Z9kAFgQqV53GxzEqbI0MVtxVUMFzU7HAb5HfPTUg9BsoSYyvf?=
 =?us-ascii?Q?dNLOSzMCboJod2ItgTnL4UqC5Kpx5Geq/J7WMKLPkZe/VMeLl7MVOYO62bcA?=
 =?us-ascii?Q?j6RHTSDbXy35H7XIpqvpHm5Lyg8nGh7WkHbqBp5jUagJLaUZj3cj/HtvXLLW?=
 =?us-ascii?Q?xlWC8yvl7tn8qYYA1fieOUq+5GQZCtr5ppmFgYrIbRR7Psnefx7tQkVURAIK?=
 =?us-ascii?Q?tr+y75tLgxFRRFYvVLhIjum4uJrWr+rvHNH1ZvWiNLZ1wBR57JyuV6J4OOxb?=
 =?us-ascii?Q?YOungzYZRPEklq69VLkk/+E089hczjwL5sqwIO7f5D415f3f/nGZ87DJUuKg?=
 =?us-ascii?Q?iT9XJl9LGRH6H8SFZRr6HT4UKQQFTYkwZXZhpiW/Yn5830ilx4wv5Pw/TjJx?=
 =?us-ascii?Q?oMsw++pSRg8AsXnMbZMLXkxQ6bayE3shGuJqhw3mKMX6rlfgxNZSUY12NxTc?=
 =?us-ascii?Q?DJcboENxSORrok7Py5dyFlHtX/iv1SaLNXEQd1PV/dR19QA+xbXeN8TZwpiE?=
 =?us-ascii?Q?kdlDqP/ewyk9TvO/zQjNf173n52YxioR8ksb4ZAlpuhMn/3MKX9IGG5NAkb7?=
 =?us-ascii?Q?clPlRz51cTLOO1X0JaUTkoC2sdihQdI5OHffUpO/gu4koA9N2Sc8EHDY6wRb?=
 =?us-ascii?Q?IHR0iA09YR0rOITAkgPWV7DzE9FxfP6hScnpwvxSqUcwhLb5SySdoux9INQl?=
 =?us-ascii?Q?2HJE1oNLJfz5t+4XK4mJNw/iw+94YGHq9MmHnLQAqS0ePzEGJj/Jg1GTARum?=
 =?us-ascii?Q?+eVyWbefGwefedKyFiv/q7LURAl1ET86yW6g5Th00NnUzeCmpd/11CmUG0WK?=
 =?us-ascii?Q?u4wtNE+ercaGF3OMJ3qtdACxzf26Idqlx+uvdvpBo7rKxIgzY3taaMXaYNM2?=
 =?us-ascii?Q?Akx11GcUFSXzN4/LlXVmGg+aEF0Fdu1lWs8t7GjwKGw/vQaj+B/fFze6eWI1?=
 =?us-ascii?Q?CDsGn4Sifi/chJ+SQK9GWxrIDoYU4KoIibBOmTnWwdF0gwN8EaabQNqlUOBq?=
 =?us-ascii?Q?wEDCRQc/LyPs1vJfN2J0P5DG/lHyXrL3mapBvoiH?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 32fbd625-fb75-482f-3337-08dcf812dcdb
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:47.9937 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qXK1L6HEIXYhlyOu06g8vQogSp3IDzgFiIe1LjHbi11fPFtV5+poW+lRI96rEZGAdbmndveokpC+OIuhm8bXeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_ssa_bad_nid/README
 | 5 ++++ tests/f_ssa_bad_nid/expect.in | 34 +++++++++++++++++++++++++++
 tests/f_ssa_bad_nid/script | 44 ++++++++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.71 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lJs-0000f1-6G
Subject: [f2fs-dev] [RFC PATCH 17/24] tests: add fsck testcase of fixing sum
 entry nid
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
 tests/f_ssa_bad_nid/README    |  5 ++++
 tests/f_ssa_bad_nid/expect.in | 34 +++++++++++++++++++++++++++
 tests/f_ssa_bad_nid/script    | 44 +++++++++++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 tests/f_ssa_bad_nid/README
 create mode 100644 tests/f_ssa_bad_nid/expect.in
 create mode 100644 tests/f_ssa_bad_nid/script

diff --git a/tests/f_ssa_bad_nid/README b/tests/f_ssa_bad_nid/README
new file mode 100644
index 000000000000..d30e41c77c63
--- /dev/null
+++ b/tests/f_ssa_bad_nid/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject nid in the ssa entry of the blkaddr with an unused nid
+5. fsck fixes the ssa entry
diff --git a/tests/f_ssa_bad_nid/expect.in b/tests/f_ssa_bad_nid/expect.in
new file mode 100644
index 000000000000..a3a6c94993a7
--- /dev/null
+++ b/tests/f_ssa_bad_nid/expect.in
@@ -0,0 +1,34 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (is_valid_ssa_data_blk: x)  --> Set data summary _SEGNO_ -> [_INO_] [0x0] [_OFS_IN_NODE_]
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_ssa_bad_nid/script b/tests/f_ssa_bad_nid/script
new file mode 100644
index 000000000000..ae57d979d148
--- /dev/null
+++ b/tests/f_ssa_bad_nid/script
@@ -0,0 +1,44 @@
+#!/bin/bash
+
+DESC="ssa entry with invalid nid"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+dd if=/dev/zero of=$TESTDIR/mntdir/testfile bs=4K count=513 status=none
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+$DUMP $DUMP_OPTS -i $ino $META >> $LOG 2>&1
+base=`$DUMP $DUMP_OPTS -i $ino $META | grep i_addr | head -n 1 | sed 's/i_addr\[\(0x[0-9a-f]\+\)\].*$/\1/g'`
+blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+$INJECT --ssa --blk $blkaddr --mb nid --val $(($ino + 100)) $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+INO=`printf "0x%x" $ino`
+OFS_IN_NODE=`printf "0x%x" $((0x100 - $base))`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_INO_/$INO/g" $TESTDIR/expect
+sed -i "s/_OFS_IN_NODE_/$OFS_IN_NODE/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
