Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1691E6072A9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 10:42:48 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olnc5-0005Ng-Bc;
	Fri, 21 Oct 2022 08:42:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olnbx-0005Kw-71
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=FIEqPrmxk/QN5f4CQzPiJlz61nYe9bwy8m7Bv/xEuH4=; b=a4R2oDi7Ri62jpX4mtzoP107Ev
 n0sRKGpwOUaIe2WhglGv7I8F/m9zEk3Rd4yEQaem5biiTlRl/zWdEAbh2aMTe/wWk8gO9zxldQDx6
 YXAYcme/TU9yO/29fQ+Z2jzZwNbuB3vGLmZ+o3BpxM8Ccz0gv7fq9xrkkS2M2bXpPRwo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=FIEqPrmxk/QN5f4CQzPiJlz61nYe9bwy8m7Bv/xEuH4=; b=Y
 VNipHlsmoyInDaCvMxAYWIDDklMEYBJfTtoDhGx8/OtR/aJAzJupwVqSLFYNWRW80q5z1vSvWJj2k
 h1t9BIqUmwkS2dy1JnP05P1JqRVz06BwUj4w2demkbINEWkooIvC7lEngvqqeMnGB/EnFqZspjkeC
 GAUh1MGpSFQuro7A=;
Received: from mail-psaapc01on2139.outbound.protection.outlook.com
 ([40.107.255.139] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olnbp-00C4LH-SM for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:42:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KzUWg1Fd+Zej17xe5wSvyf6QYO5Fd6cNwymS58/wH6QtEIojtw5ndUyvVRjxj45idwHWzJsPqeEz+jUQNXQWVd0Mkguepuz+Pj9wCRO27hDuh8Gxh3WhD5fkBZZfXGf2u16NQObI3PUc5w6mpWWip3vJwcIwoguPdoxNt+gda6Q+odYY/Z2cF8hcOOsnurvKcDea2t9yMVDGwMbNdwxmxZn8HwNkgmx11l65jaslKWZyicary+3mDdcD5s0duadutLEinyAXM8RpvbyIO/U9J2atUasEDh2Kd2kv76YPqFNi15/WERmwhCSu3tiK5c+90NuEP/5Ujp5Ryj35wnou0A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=FIEqPrmxk/QN5f4CQzPiJlz61nYe9bwy8m7Bv/xEuH4=;
 b=mgPAAg1tFYNuB9yDsxoo3zVOJcc1WXigF5rxjMNIxxPISxx/0krvnp8BDXML8yRsQlWYUBXlqBi+0T7EZePYwVky6uIO9P+gOQXO2YSDljhJ0cEkT0lYJ4S/rhwKZ3WU8AK4ncs5USsp3IrfCa9SNIQg0UQdKdEImQUpFk2jnLNatpnAPpuFx7TxY46Z8nrLaUMymEGOIAeSl7KdlddscY5h3/y4DTqStaJ8tbYI9SJRYxySPiNMmb6QoAwkFLlbIDDxFSHEDKGB4e3/xQMgFDNZyR4PCDXqLMMJe7Af8gd84EpcxAXxsNjoUUideXEzZpKsc/JNpdtdsnMWwkP7Kg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=FIEqPrmxk/QN5f4CQzPiJlz61nYe9bwy8m7Bv/xEuH4=;
 b=V5cM3FTqiuN4hrVBjBSmg6Xt3HY9hqkP2E7nmQ/GmJwMgxzpyBGf5saP1Rcz3VPPD7h5AoIXER4T4lbMB+txedY60I3TssXKeLAGAIxyAvVmyh/JdJpa11MAZkWfC9q+NOh7lNrJumGL1pw0lOIBHNSdSlEyaBGfb9oFeAQtVz3QKFtFfWdmWgx4V1/9pMY/1Ys1NjCM6FdKlWTPCBHtsfXQQIc5GS0wzT7NvZKdHxhXw9C9r19ei5Id1uQGxemQqLLmsjTwc/jDoBszNZ322wjOTUjomQPpiVaWMcmjt4r2bbdrSWbiugGnwrXRm3EYnSIBO9bamfYRoWKSJF1Rag==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB3946.apcprd06.prod.outlook.com (2603:1096:4:ea::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Fri, 21 Oct
 2022 08:27:07 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 08:27:07 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 21 Oct 2022 16:26:57 +0800
Message-Id: <20221021082657.26559-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SI2PR01CA0016.apcprd01.prod.exchangelabs.com
 (2603:1096:4:191::20) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB3946:EE_
X-MS-Office365-Filtering-Correlation-Id: 2c2ed492-efb8-4bf3-4e28-08dab33e0a6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PPcddfDKi86KcH6344xbtM/3z1pqRerphqjMAtRXGsZSj4nBvLRlE5Qq+ojJSnbiuryhT2FIKeDUy0XGj65gej9v6Q0c4w2zCuBgBAryXaR+DVKy7dF1zMxEDDLRbFnKE8jkID6lDEChKjoN3rI+LzjHI9oz0ERdGwtosI4kPv7A31ToulFQ//ZTMo7FAFHdwAjcuB1hylyDyuv3AmFVR6QzxdVivxMEvlqEPbBm0+y7fHZoDSRXmh1Y/oHNYKWPVktODNqslkWafBdqmAwlrWC4eyjf9Lkqnsp8LeMbmdGgsnBIZ6iIhlAqVjZfbeFIiCUuoJzWPLhVtlzD6+LZQEXXtWQNUurvyaKt7Esi1t3rRRqZwBmEfopviB1PbNO8Vh6EGw+0pXCysWu4ARcq53HeDALMCBma2E426NEzHm8LYx/HYvW1C8SzwK5eE43AEBdpWISQldLIxoA1L3ayGJACqYn0cPpfm+EyesFWzqUsBhF7zere31LGNkrMzjirmqcVKO/QhfXsEDi3+6E0oEf13avq5PvPoXEg2TI7eR7wYS1jhi7qwpO2qAZBFQvsi6XZvR6XkphV/uh5Q6WAod472JtnP6mEzjQmB4IknYYomgICt0ARPZcU9UTUJmhUuL0Qzr4YR0+BeFDtZIhQt4Qmqj9VBTZbccI2BhxzPC0tsvCg43iPTHuqdf+WL+ujEwBg1HR5lOqNd93vo8Z/yzeGLwn+eRMBNRB1a6WNR68f8Nx5Cp9S/v18mMLoJUP/Tas/qKu0RZtv3QzjNc/ciQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(66556008)(6486002)(86362001)(316002)(6666004)(107886003)(8676002)(66476007)(66946007)(186003)(26005)(6512007)(36756003)(2906002)(1076003)(83380400001)(6506007)(2616005)(4744005)(38100700002)(478600001)(4326008)(41300700001)(5660300002)(8936002)(38350700002)(52116002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?U6TJD4SpaXbMbHN639H5UeuCRGECNh26tgzo4EoQSEbbZ9ul0/SRtTnltSoC?=
 =?us-ascii?Q?TxStEQS5Ww0QTA2PSVp99FBhiNJtMe6uFwIUTKM9Y2ioBEWUIQQlnX2nDIZK?=
 =?us-ascii?Q?9hAw0uF/NcZUi3zz/CzLU8xxjPn+uN3sPzRvz8G4vfIdAS8R4Ix14AmZ0cQc?=
 =?us-ascii?Q?PqcfwwnmhFnvy+1yg1S4fjsGPfgHHT/y+uzAfN8vSYQ5dnqVV8IUdBJzHPv3?=
 =?us-ascii?Q?V7XWkjbuKBf/E24XznMIWzMsN9VDui8Bz95WAf6JFMahTYylrOFdFSc9GcBx?=
 =?us-ascii?Q?tW4CnSTh93IK/v6S6JcfS8+HlNZ6qz2D8BXNFqRjQ609diJPJH13nx3SlciZ?=
 =?us-ascii?Q?9rUYyEZI9srD/cYPNBY7tTtJFPA7TTVlVGBxM7WBLVA+wupJcWgBKANEHll7?=
 =?us-ascii?Q?O5skkklTNKEIB8nGjf1HvrD173Av0bz4IsZH4bzhPSrPuWbZnIElgUgtNZLj?=
 =?us-ascii?Q?BnVk7qXtBGyAymHSn1y6SH5JL7wgCRcEKHpVDhe1PQaFffQoxLxw9WdWIngd?=
 =?us-ascii?Q?q9Bl4Kl/P09TS9glM7tSU6DegAb8cFsTOQll0cqPUa2DDYA9XgrGK0gicTk7?=
 =?us-ascii?Q?fuTVnhZiZ/X2qFcubCH+pYpXPRTFnp74QFD8rtB138g6yDcA4x7kd569+TYJ?=
 =?us-ascii?Q?4AgSJda6uXC50L98mvgaF/eP5s2j6nKFmwxAC/SuUIWEDAL0VMQkq3CYgTcz?=
 =?us-ascii?Q?WPiYTNeYfjJbph/ire+GpRyhCQEHIQyTWz8jZXklS4m7SQcdRct6MF8j7t+e?=
 =?us-ascii?Q?N7X9EA57/LX+ZA97JlpSLg+/NwcSYU+l1CBt2jeIi1hgsoBI8f1QB4Fjl+Lv?=
 =?us-ascii?Q?JnGT3Ou6sTOEdmnTAlCCXrXKmKg0QJPdvwYP3n30eUd48AO+1KCQ54NEMeOz?=
 =?us-ascii?Q?htwbxdFHFesMR8EIRS6UjP7moWq3UPjI0yaVSfqngjhjVxIl4XNg2/zSsS1B?=
 =?us-ascii?Q?9PiIRScJ7/q1pIOb5kb+FhCRTcnX1IvqapNq++YFNIzdBsC47PlM/0FW5iq0?=
 =?us-ascii?Q?873WifqhftgHBKwLTP0hBllPUWgoc1yWUg048mQIOy+o8zKz41OOYnwGcizi?=
 =?us-ascii?Q?pz8t3TNA9xsBI/D5pEDzBxecyKTezyMCvwjnqAN/p/VySNxpK5oKYtNuwQwB?=
 =?us-ascii?Q?DvraytccdO4wP6UR2ZxOYYRq7wLU/QHYGhP/CCyBv/NebbAFj3Cv6dK7Hstn?=
 =?us-ascii?Q?VMXAvKFr/OZZ7+jRVocYGVftZrJNCpqczINR/omVpCN7vr1TB9zUb+oP/rlM?=
 =?us-ascii?Q?ZvPYuTV0rtfU65neyQFYOAxJs5IK4WOezkOpMmhukQ2nrMBJ5HvwQlp9RfDW?=
 =?us-ascii?Q?pCwcikDwmB/nZMlbMiSF4aJawEiOBPkp7Kkc74r0iCJo4zKpFJjG62kGMM9W?=
 =?us-ascii?Q?bJA1p+PSeBWjNAq5TpGDVE4EPB7rbo4KeZFvsprc68EZOrVbP3Fe/p/D5AQ/?=
 =?us-ascii?Q?SMk41/r1N8GoPJDUT+oXJpflSzbLlLwDc9qoAKVB0u7cVmxcDmsY9ZbliTI6?=
 =?us-ascii?Q?hIGkSeOaRBt6LYDspF+4B5oJZZ/tbpgxNiBVnYeZ81ul/LBE8Sck4kmYpRea?=
 =?us-ascii?Q?YLwR4tbdDhicE79E7zlQ/DQRjw2IqAJudgu/0r1R?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2c2ed492-efb8-4bf3-4e28-08dab33e0a6c
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:27:07.3060 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3KFRUeyVE0+HIiCEIsqKh4sKl7BdAxNHcY9VZgyoLhz+XZ5DPVBDYqbHtizZ1OPJX+3YroYXGMsS1JAH07EUlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB3946
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Changed a way of showing values of them to use strings.
 Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- fs/f2fs/sysfs.c | 4 ++++ 1 file changed,
 4 insertions(+) diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c index
 b4476adea776..555849d4c744
 100644 --- a/fs/f2fs/sysfs.c +++ b/fs/f2fs/sysfs.c @@ -332, 6 +332,
 10 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.139 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.139 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1olnbp-00C4LH-SM
Subject: [f2fs-dev] [PATCH] f2fs: make gc_idle sysfs node readable
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

Changed a way of showing values of them to use strings.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index b4476adea776..555849d4c744 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -332,6 +332,10 @@ static ssize_t f2fs_sbi_show(struct f2fs_attr *a,
 		return sysfs_emit(buf, "%u\n", sbi->compr_new_inode);
 #endif
 
+	if (!strcmp(a->attr.name, "gc_idle"))
+		return sysfs_emit(buf, "%s\n",
+				gc_mode_names[sbi->gc_mode]);
+
 	if (!strcmp(a->attr.name, "gc_urgent"))
 		return sysfs_emit(buf, "%s\n",
 				gc_mode_names[sbi->gc_mode]);
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
