Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CF3669748D3
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:52 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGk-0003w5-Tq;
	Wed, 11 Sep 2024 03:43:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGf-0003vs-4d
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=; b=eZKA7xHF7sXs/sDLCjJKpUXPZy
 j69+SmyR/hcJGoP0LusqJZxft8Ekm2UBlOEVTv3ugGb/vH2lMgZ/Ici2gK/s42xG3lC7AaYUJOUNR
 5Ebg7stQGYhaSSsroCPumFyk5dGg2DA5wwKNQ9ORKhb+cqBLN5KTlFYpyeHLjKaIRd1o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=; b=Cu+CXM3j+SYTaUM0YaCgOCkH28
 A6s3EUHOd+GreQIy2D6PuHefTTlDQAMuMfkP1+wYQUELuWpDri5KL67x5SvhH2dxjGiZbRrzFklat
 3yDz8ZvfUflGjZx0qHpaVN1XPvgGikNvNE7VW20vbI5TRxXE9lLL8g3713uk8olQ9GEQ=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGf-0000Nz-9m for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KkXUr5JZ40fqmYE8eKLujKKIkO3IKSaXLUV7Fdl4EZgCQD8677bp87B+/Zfy0GjFtL4UzpePuZYJ/PXSpYoU2GK5ZKoJm+VHUvBSXWniEeIntQbpe6eGm7bpFBTy7hZyQBUNH9FVEAjBrT7EhXWhH/IvB9XsL8YjnBYuAXfmV6xHZ0GQnSeq5DxxlmBXpgAFiymjBvt+A996hNqTzx/Wi867t7MpJ9KJdrOj8qe24lS0suvkop+S6ev1E+CousDPZVYCZwy2cMZlX4Zy5jm1xTS1cvFJZm1DsmNIgpOrRhdxbqDw5WpDpKxA/55aAT0t35E8CH+NSjBj6mqPk7GjOA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=;
 b=ATGncO+MZLvTtYeMpdUM95eKZdiWAS4dM7Qif44GQ4wPPPsJjdLmQNHFiKsBASMWs0XkY4OT5yVnVKsT6Cn7wqPKWTfnWUZFIUxI8NHND8f2ONN/KODttJGnKXXSfn4XGpriwQf6klaDimVzJL+/rfYAehAWzkYMUP1UFmIePmdscthAdCTYBmmzg99wyshJ3NzQGsxzWWLMaRfUCr4YBsgCyEOulQBVbC2VyvYK5JcQbtWjX4ll1ZXsLG2gqp7GM68xzqBI/ma9CLPrA0brNmtwRZSjsFM4pGUjJuJW/YzbB1gdNAO+hGi3TMdXfW3FwuYqFSe3ERB5DezRMGWCSg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=;
 b=ElXpdf2qfniOjLsVIzBi8/OjPI0CtdN6oj+1u2zHCvyrmpad6zuwC3JG23+148/hVT3klqLRa8aBG3bitFJB6DVtBDUOvT6YUb6kr3H7iAYIKf/SjAW4TJiZGbhBwy4FhOS1KRHOxBQsj5YcBjzKTpjHqIcDyQq4BAnlGbHEDLbRWljqDTYLq+Qd81w3DU+DIGnf4JUgB90zGlI7PvZZTcU+kEGhTbejChBB3TGce68Y0tA/IBLcNsL9guQreHPBdRlE8gab66Jed86t6hLkvWIFLgrWILalU3QEa+RmcTEGmmWORQn5zE1siJDqTXyEb7CXq4XTYRHon9WrejSAhw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:37 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:36 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:18 -0600
Message-Id: <d5f1a318931b213f7a27de8441ba985354eecabb.1726024116.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 499f8947-8bf8-4f2f-9f90-08dcd213eae9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4GBQhh3IUQW3QPpzeQg1K4cCUGz60lqF7iaZv3IONWo23O55KZCi8tEAHFsK?=
 =?us-ascii?Q?W+7Enw6AWa83DEljvA1tzRfXLNJt32Lo09m4x4Sjslc9sH/JZl26SOby0SiU?=
 =?us-ascii?Q?EvsuxH61pHpsqIZBMh/Qg1hKFyULNMtkJhrS9a/bhCTn771/lWXTnI/PCfa/?=
 =?us-ascii?Q?lKdZ+lK5F8cW4qQTLKB18HbEe0mDYXxWXmCuShGsEykRH2rWgGyy4QTkFJel?=
 =?us-ascii?Q?IoCe97BittB2Dy7aHgcXTKvfHL13MKl9eKbaMu0cmkuiXmHO3DIKFpPsqjr5?=
 =?us-ascii?Q?8k9MhrZA73kxtQj9xNIoiuxTWKFjgiR3n4pke0PrMnHeFL5WCUPNjDsQo64B?=
 =?us-ascii?Q?lNgDTbVBR5K4euMbzFEAUyKSIRiM+TcZ35doXdlbZP2zlg5uLvzZzmMdaKqL?=
 =?us-ascii?Q?xUpAN2JrgoFHL0v3Ts4EDfKl9U123A191k8d879yeoEEQLMHEf5ARHqV+l6R?=
 =?us-ascii?Q?sYUmb8Ux9WxzLQO8nNXZ8A2yq5PdWWesiR2jruD2wS3FKtzLAtzcjut/O9Dy?=
 =?us-ascii?Q?KRMeUNAqM39/Ehvg1hJ3BqX0EjqXIStk8cbv4GB8LDfsmjVWxp7KUumnxRsK?=
 =?us-ascii?Q?b0gI5/su+uHrYD1oG+dOnk7fHzHId3/5At6ofCAU7aE7zMP1u+OIVFl87jyD?=
 =?us-ascii?Q?RIEy2kfDFLEJyGztuvfcxIKfD28vHGIe/LFw801QECKqNM+zmwK3ztAFR+WH?=
 =?us-ascii?Q?t7QS5Nz7gjMs9ZvB+L9G8LmnE1h5SKbRAJIAiCWXcffH2WUKYQxjKznBkB7h?=
 =?us-ascii?Q?ny+5QEmACwTWJkNiIA4bVmJAgVWT62XHq3r0uJkPEFEkerkTBt/S0zRmNtQ0?=
 =?us-ascii?Q?+JDlDvVYzTDhmPN+knIyH+fFNEVrCg3Z1Gihsle5OzjTuYqoOh56IOzl3yXl?=
 =?us-ascii?Q?qRyEjVJezt/CkxSI04q5vMrMd6QJYpIg7mC55G9F4wTdvmx1CnXZcJdrqYwi?=
 =?us-ascii?Q?1xGRK/IelxcLq0ePTOjbtrcwA9cYDjECPUtYBFxcRBEqBFGbisJ6qfS5SHM1?=
 =?us-ascii?Q?df1N04hHywG9FVtJ1FeO/cfiaQ2HIH/mecvXqjkAdKyj01SMAFMiaiZH0tXi?=
 =?us-ascii?Q?wSxbPE/a4Yg9k3s5A72P9ygJQdiMq4tWlfiXeqRRFOCQJ1RBDffc94s5BNf0?=
 =?us-ascii?Q?MlBYGqpgh+3cekW5TgAWiF+uD7v0UprdjoZ1nQZsFP+5Fp6IhkUIIRxaGcDw?=
 =?us-ascii?Q?TDcd+lozFV20TlSCnasSGWG3uUQ0Og7PtbCsDLIvAyG//jG00SCJYbv0v0Tg?=
 =?us-ascii?Q?hU8pTtXSxunRr+XEiEW0uLSRy1JHaaC6L0p6Bj9Apq2x0FcQ4XQsQFFcKP34?=
 =?us-ascii?Q?Gt8AxykIlt1xsiKAQRPoN4xLYhquE8mVgXa6MzJOMWkxR1mB+mX5MUXHS5Jo?=
 =?us-ascii?Q?kAFoEuym5WQ+E+IEy1BkDJTaX+FUoc29FQaVj99Yb24I4W46UA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?eFZyXr2+hzrdK1a8LOMrW4h4QGiNBSJ/pL4ZN2E2rvkI3c+auKWaNoM5HhOh?=
 =?us-ascii?Q?vibTGFhorXMZLZqqPZQVs3ev4suIikZnxKWEqLDw/WQGA9eH5MWOzqwku6dv?=
 =?us-ascii?Q?gHkdIBWjHZbhUFtHUDrjkc19zCStIutEIuxHi3sFN71D2D2u7Z6hUZxnAVvk?=
 =?us-ascii?Q?sizwfVxoYevtH6S8YtWVkJyl/pIW9IqgD09UuTXs20uIYPj+lKU0DIEH9/Lo?=
 =?us-ascii?Q?fl6hqPR8BZZtMyDn2aqBMaIXEGSptpnFaCvun9GHnogJUgdBvnHQqe1uM2jW?=
 =?us-ascii?Q?Nlgjp9axxMSG9al+/06W+7La3Y8STpuOK+6t7FGlJrqfZEBkjhjsidap78PP?=
 =?us-ascii?Q?NBnoSM5pLLHlW3np5UlSu8OYYd5O6WVyu/1e7Cn7p6Zx1NSMx5Ie7DDWVIrc?=
 =?us-ascii?Q?xIIX88T2M+lPeDGntwKYMov/HlYYtQBHpT+Wt+5Pi4KgXvqzLrpnMkdsxALP?=
 =?us-ascii?Q?SNsKBAXdOGQWqP4KkNdOA0jbANwUQOIVcCDjeA3IllXOPsp16o8Ah4DgYtxx?=
 =?us-ascii?Q?P7aM/+pbYvtYpm0gvRRNFO9VgsRgyhcYdmLhsCw/TIwcPEeAYTgGKogS/a5Y?=
 =?us-ascii?Q?3jhjh3cFKrK1N9YqHD5snCKnpgvBc1izD769DxL2RG3Vy/q6R48nFNivKcDD?=
 =?us-ascii?Q?JbdfZlM1jE906Su7C73YCZ7Kl0q8m6/vAgMVuvHcy4tdb9J7uHxpM+lb5J0q?=
 =?us-ascii?Q?RDAnrS78UDbzgnFzZz7y17j6Ru3X87e9UpD1IrgoFnsHc+Oxcjrr+uFCh5Za?=
 =?us-ascii?Q?U0S7NXIszDXvLo5mR1cS8cdaodx5m9cwOHbz4wnxL3Fr6PaByv0dJeVqdEAJ?=
 =?us-ascii?Q?Y1j7lPUGyhbtZ0sNY++N+zbPJOzXMjeLlWyVx6Agtc3QROIV8Iao7bRh1dOC?=
 =?us-ascii?Q?2evoqSC0Nwskv/UDlmH4103pGp+ym1esv/DrFSWc86rgyMWxtzqXGJj4Fi+k?=
 =?us-ascii?Q?rR9edkSSW+TkvppA4dqGKovta5anFhzucKL4xG4Q/1SznFGswzMnh6YxCPAF?=
 =?us-ascii?Q?Mhu5ITSxamKYflcGLT/qVT9B7gTPBcpl0PIf3Lfizfg9LyhcxwFllwJnNyNQ?=
 =?us-ascii?Q?CDSs4gzW9xwZMonFZNz0rsiYBKIlzvqBRaw46uapQRGA5nIWm7TeIb1XhT42?=
 =?us-ascii?Q?kez2PWIzKoqnwsEUs3vj8rbDTHsi4kp+mRL4C0vT5gJkQ7KVGJ4WpXWyiMni?=
 =?us-ascii?Q?crcPCi11pXF7izOYlwj6STJIPPsIeZwMNCszomiNhetzbEZvEqB8GhG2xUa0?=
 =?us-ascii?Q?akMfwTYKfpbpp/5vYEuj1PkuFAdkB5PwrXGrobksm0ZXRm9bpBy9Yu/V53QW?=
 =?us-ascii?Q?MSLjvkExAgdKs6d5jB37q7ulPuO9oe6tvObAVgomdrIHdbJ16rf8kxuzFiwb?=
 =?us-ascii?Q?XFfGziCYZ8wutbQ2Sb9vwrQuEZeKt5vVpZyJx6fjVqqinlCoAGShNB8C7OGV?=
 =?us-ascii?Q?P2ScJ9EHSwtQpQ7bPOcJmNpvsX0H+nHBpZ2rU9x8b+oF4Cc6YGFmyDEQcm3j?=
 =?us-ascii?Q?38XS4DqCkd2YeecF+IuaUgN328lUv/X2mw+L/a5ap41OwbPi5ArIiBVEJGX9?=
 =?us-ascii?Q?OY9T+M5HiGn6e3ieVa0m3L7MT0JHH2jaJgAD26PD?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 499f8947-8bf8-4f2f-9f90-08dcd213eae9
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:36.9109 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dcRw1Fp9fef4gPTMMV8ksmir0rDm09PIrO8Sx5hbHsF5NXxiGeey9nB7/6kjtS08+LJ8kknYrNX+fyDq6DMbgQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Set inline tail flag to enable this feature when new inode
 is created. Inherit the conditions from inline data. Signed-off-by: Wu Bo
 <bo.wu@vivo.com> --- fs/f2fs/namei.c | 3 +++ 1 file changed, 3 insertions(+)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1soEGf-0000Nz-9m
Subject: [f2fs-dev] [PATCH v2 05/13] f2fs: set inline tail flag when create
 inode
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Set inline tail flag to enable this feature when new inode is created.
Inherit the conditions from inline data.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 38b4750475db..13c295ea19de 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -315,6 +315,9 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	/* Should enable inline_data after compression set */
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
 		set_inode_flag(inode, FI_INLINE_DATA);
+	/* Inherit the conditions from inline data */
+	if (test_opt(sbi, INLINE_TAIL) && f2fs_has_inline_data(inode))
+		set_inode_flag(inode, FI_INLINE_TAIL);
 
 	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
 		set_file_temperature(sbi, inode, name);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
