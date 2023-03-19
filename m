Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A01266C0052
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 19 Mar 2023 10:27:40 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pdpKA-0002TE-Dr;
	Sun, 19 Mar 2023 09:27:35 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pdpK1-0002T5-HV
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 09:27:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hlI6qokwpgOkaE5Zh3c3JyOWZOSK5DXV2jjrjRhAFQI=; b=a3xwBzgDtj7OhFoqwd6YzvjR3p
 SJfRP7zuiRM+MVKUqo2ENzTHDyrS5Jc47ACoQBJrthe/It4ZWcDUeHbk0ognvZt0COwvp/h2B9Y+Q
 gdDS6852qF8mEJjVDbaMWH/orGUuq+KrR5zHJZ09r7KDZ0eAbeGSIZcNBnt7qrTES0Ck=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hlI6qokwpgOkaE5Zh3c3JyOWZOSK5DXV2jjrjRhAFQI=; b=meLO+dJzon4pIiRylAr8NZydMz
 ttQsrXleOE2HFwnlKZ47PCpSTUyjxDyIBVgHtMWTQHH47vinjw5iFgyFRPuSneJUnK0dmcfY6gA35
 axo85P1Prst+TWxbWfI3SzC8XEddkevJycaAxf6DYwSOozMXmj3LtL6tD2UWd/S60sVI=;
Received: from mail-tyzapc01on2114.outbound.protection.outlook.com
 ([40.107.117.114] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pdpJu-00DOSY-0k for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 19 Mar 2023 09:27:26 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=I9/jvvHWV+ZFhCYXu4hi987raatLtO14FMHjoxCUw4/8CuJXTjrRx0JBNCRLBXu99OpCr6Rg4BfOUFIdp/P/qnw8JPWsroD2MW04SacPSyk8DJ3hmxPhV3R0AqbDlT13ngpDo1BG1gBVh/hyf6JX0kp+W5QD0KWDKeo92l0NY8ad30Cdt9Ho5kEw6drIS6uzp0z6aqYlGaC+q3gX1ievW2UuQR8uU2nS4yJ2kM4nj2LTZIWmcknj6q83dRKnOnFQl0i+QeHFwdJHQGpqwbZUcuVi2wgdY5aORhuPWVZtoVBjonuYThCwJuE5Gz6RnI7fY6sbelLR7QMXUbcE9/OAGw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hlI6qokwpgOkaE5Zh3c3JyOWZOSK5DXV2jjrjRhAFQI=;
 b=a2AILjJot1WFeOtchq8AxGOz5zvwuS4hhnbGNu09NrCn1ti/A75+IpbSy8jH5oLW+K02bBcaWy/5lBZnuwhJxfMnW3CIkGxmjmqqFvaUSXkWDjRw02i7W/RdoUOU9um7C47I7zAxg7B7/z/qMLoAakNjOrN8vrRr1aEHeGlFs0gXaSu6I4XqAnjvF5jFi5sdovaHoztb3jTUiUNeQUDJQ6QoqCl+xuMDlTYml6J8BCI/sUiTqDplzXOKhQtd99U9gPHdP2+hye9SQHKCtJiPGXVEjnPtdEWaOR8gJkHLZVTjY1nqrBBhWlpsgjivMrxMTmPbKvO3ThAeSwE8SOWSqg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hlI6qokwpgOkaE5Zh3c3JyOWZOSK5DXV2jjrjRhAFQI=;
 b=pcGMD+J7+EnLqKvjpLCe9VBriPYDCxRrVU/AG7yoXrvX4yVvwYB0nGewTrLn9RoPTgYtsrVQ8hAxokEYHPh8dQ0RbbPqWuBw9X6oLeuIGoJ2aJ8Ms+zXgPRmyXXfry+BGs74qY0U3hG+abASwqpQ+Yh/XpS3ccZY0gjyLcgpklSuuBzLx81tGU+ikkaqSnTy0Fc/jC8IobTjul5YJvh6Y3wSP4IFcP8vFIJngpdVyCtoRqQ65Lsd/oVggi1uKe49kijTCNFklFVq2lbT0KIqsXiCNPBH+vHxcduLSd9Kw/z3t0Fq1t98czDBsmfBQvC1HbM71uPXYRBh/rC3L1kYzQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4012.apcprd06.prod.outlook.com (2603:1096:4:f9::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Sun, 19 Mar
 2023 09:27:08 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Sun, 19 Mar 2023
 09:27:08 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 19 Mar 2023 17:26:33 +0800
Message-Id: <20230319092641.41917-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230319092641.41917-1-frank.li@vivo.com>
References: <20230319092641.41917-1-frank.li@vivo.com>
X-ClientProxiedBy: SG2PR01CA0137.apcprd01.prod.exchangelabs.com
 (2603:1096:4:8f::17) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4012:EE_
X-MS-Office365-Filtering-Correlation-Id: f14da4cc-c289-41a1-5026-08db285c1c28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: uB9fRmvYsqRj9oaKK3NcnAORt6KWq3GZ3bgnT9Fg2/OtxS3UMEiJexXH98QqP7lum+Nndvr5w9txlZQze0wMWepTcSdKTwnxynUrjplNS7EZYW2t8BlaHta0B4XWipQS5HjSf9xNgfP23Wn6Y3YkOarhluZKxNiuJj/O5KuqP9707E3JVPEoIXXGoR2V/cknZbVxmlhAdJ4BktA3x7NKbkrijRMcE5w3tox6CJgd6X5rKu7dkT7vT0SGAST4uM6NHq6lX9ZtjLlaemVJ2O7SAdD3HRWkUei5yh8vUEj/s5LW7G3p/xmstHYH0jmSeqlTP5UbHskioksm44GdXbB2REq00ZlQwaf5boVEaInruGIVQNhrE2FCn/5QKCEhyc4meumf4Pg3CflDTlmK9/VkON40tnjbWzrGvDcKSvrxsq6CMlKzuPdErs7p84RyiXehovWED3xI3Euiu3PT+y7jpV+kXwAAC+YPmK65OtVcxNLLblU6SJpRBYYH5/mKJFeFeXnpJHZZYGna24DRQteN+5A/AG8gRe0rNPzUWPxp98/r9+fVUqng0bsCiidg6KkLScvXtmRq2Yn6m7JobSAQDFmgRHqPcKllSH3Q1GA4rqux8jOAHiBjCOxBDbFQFmxwEpoVB8++x0awq2d7YGt7daDxVX2sVGC+4V7JriWHDh0zXYFWGTgOGIyEZcaK/zR/szscc2x8os1x7K6IXPr3Mg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(376002)(346002)(136003)(366004)(396003)(39850400004)(451199018)(52116002)(2616005)(478600001)(6486002)(83380400001)(6666004)(316002)(54906003)(8676002)(66476007)(66556008)(66946007)(186003)(26005)(6506007)(6512007)(110136005)(1076003)(4326008)(5660300002)(41300700001)(8936002)(38350700002)(38100700002)(2906002)(36756003)(86362001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?t208Qz5qXeGEwt0y/AFa5PBChgRl1NVKGgO6ncuetiwV8pcfYbGni0rBtAFD?=
 =?us-ascii?Q?1ADC14lED1MkMa1uIhzz5RAVZ7TCAh2aEnKEd1c7ZpQqquWntUyJv8CpNg1L?=
 =?us-ascii?Q?MkZ8fLRvHF19NBpeVG8EWzupdk+XISin0AXo5Kfv+ndiHNu3LlmPevzWEKRy?=
 =?us-ascii?Q?qiQXlNXrHZ75XoAFXDrLIRoOfJZ0RfzfK9U+noOZrhZjDD627uDhOFqXMXNm?=
 =?us-ascii?Q?NUDFaYmwYjf36hHuw6ZfFNE/l2O87EgB2OdDrNl5Dw8TkZj4XaPfGDC+z4bo?=
 =?us-ascii?Q?ygQfAqwCBHVXDSnSodHwvfapa4rG+bbIPAzmqGmEUB7O32CgEZZcK5NC2/n4?=
 =?us-ascii?Q?vpk845MpWkEZGoTl0iSJhPt2cdy+PFuUOP+Dh1Fua7rIlK2nFbe+lLZUJVdC?=
 =?us-ascii?Q?Qk4jTF2NTNnrq9M6ZHEfo4Uj2+BUABpLij+ZgGQtLJJtaLoj6y+0S3cK726M?=
 =?us-ascii?Q?+C2PTcFQp9gZ9z9rIkMNtFt+nnc3sPVl1kE/zAVKacZANWsUGa5MIispBKfc?=
 =?us-ascii?Q?2UJBBGYUSoM/BEbKZDUJxAK3NTvBzUE5f8FgZ9AcGy9IM1g6ngrLC7cqutAU?=
 =?us-ascii?Q?qYwpi7URjb2+/zUmf+tSUTOC4kyR2ayBqRxNmg+IbNZjXqSduajzvT1S3Y0S?=
 =?us-ascii?Q?T91CKlyEfQYVHbP4dva6NYZSPd6KOrV9fn/29PkFYmtye9DlWSrk6/8i7zEe?=
 =?us-ascii?Q?hdsmBGfc2M2MviyIEaroFpxElJRlv9SvD+Iwh7HepDP55ecf9nFngE/WTgJP?=
 =?us-ascii?Q?qoaxvNFv+m5MGBrTV3ljoaaK8SNP6whDOnGGrRbw0eMjEn009hQk1+poKuJo?=
 =?us-ascii?Q?aDmUG+IkAFhAy/76uLusaSbGyUnBYQI/7Tmoxd0hwv9Z0e1ZwPHxPkyftf8d?=
 =?us-ascii?Q?nbvF4Ohl0NrNLiBPW0jy7Q8+sQhk3cOiFW55WYHvLkjItYSXZc8vUcPjvIpX?=
 =?us-ascii?Q?lBzoCPgFhmt1gX0njeq7ZG8CZImTcZuTFSW+ia7HwGPrAxqhj+AdwJbsfpdQ?=
 =?us-ascii?Q?9xnxApvAvqGhq9QcOjCt4OH74lcFAlFzoQK2tupnJaB0r6e2sKoDEQ6ACiaH?=
 =?us-ascii?Q?r+MNfqEDOP8gTZh5NhtRKVbvBaB0at5imSyKvZzO0agkeWIbmSKLuU+ITfc4?=
 =?us-ascii?Q?iMox7XKMzjF7ZGaR/pKuiuzzcxumOHO3bZK75Yedy+M1qYTaKxtKI15KSqaV?=
 =?us-ascii?Q?d8s4jWSJidfHH86q2AZpQmvLDbbTFFmXOZQAwfFBA8nFOIpldokeSCYzZkfn?=
 =?us-ascii?Q?K0uRjKHtW+4R8hnSchN/zXPu6+BpQdhZozAszdjFHH6AS7iGVdGNgOG4nuI0?=
 =?us-ascii?Q?nJkH7PKlPi4MUQgb9kxv4ttPNMvjT4gAMiQjVuuuGWSBg5Jl2mWRHEMYIkCb?=
 =?us-ascii?Q?pXgNG1Lc279x8EliBRmwYUOIddE2VQ8MLfsLl4LmLf+6aQ8QQwxP2ovAFeFW?=
 =?us-ascii?Q?3CbBUwT5wHy952Oev2v6yAt+t79yIp722mCklXgxNHKUpwQHFSs1SJrp7g6/?=
 =?us-ascii?Q?HcOcg6UpmyDyiXIykTahAYGOyM/mXUZvOLlf8eDkMCqYj6pdo5xtrLXg2SDf?=
 =?us-ascii?Q?2UrqdIYFMmOSS1iovXU+LDEJb2grrdagRqPQ/Ud0?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f14da4cc-c289-41a1-5026-08db285c1c28
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Mar 2023 09:27:07.9438 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: seFoHrwQjfDxix9aLWz4bOWsPChtzbaLsGxan9tdYNFQtsKJdZzZdgurhEoXvijPgLxnOvBfgHh9Rl5x1im8vQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4012
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Use kobject_del_and_put() to simplify code. Cc: Greg
 Kroah-Hartman
 <gregkh@linuxfoundation.org> Cc: "Rafael J. Wysocki" <rafael@kernel.org>
 Signed-off-by: Yangtao Li <frank.li@vivo.com> --- fs/f2fs/sysfs.c | 9
 +++------ 1 file changed, 3 insert [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.114 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.114 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pdpJu-00DOSY-0k
Subject: [f2fs-dev] [PATCH v2,
 RESEND 02/10] f2fs: convert to kobject_del_and_put()
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
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net, linux-kernel@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Use kobject_del_and_put() to simplify code.

Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 9ddc6ee19433..b455afc12cfc 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1478,14 +1478,11 @@ void f2fs_unregister_sysfs(struct f2fs_sb_info *sbi)
 		remove_proc_entry(sbi->sb->s_id, f2fs_proc_root);
 	}
 
-	kobject_del(&sbi->s_stat_kobj);
-	kobject_put(&sbi->s_stat_kobj);
+	kobject_del_and_put(&sbi->s_stat_kobj);
 	wait_for_completion(&sbi->s_stat_kobj_unregister);
-	kobject_del(&sbi->s_feature_list_kobj);
-	kobject_put(&sbi->s_feature_list_kobj);
+	kobject_del_and_put(&sbi->s_feature_list_kobj);
 	wait_for_completion(&sbi->s_feature_list_kobj_unregister);
 
-	kobject_del(&sbi->s_kobj);
-	kobject_put(&sbi->s_kobj);
+	kobject_del_and_put(&sbi->s_kobj);
 	wait_for_completion(&sbi->s_kobj_unregister);
 }
-- 
2.35.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
