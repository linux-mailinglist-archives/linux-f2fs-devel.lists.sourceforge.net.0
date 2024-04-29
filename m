Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C9368B5015
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 29 Apr 2024 05:54:13 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1s1I5b-0008BE-AK;
	Mon, 29 Apr 2024 03:54:03 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1s1I5a-0008B7-K0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Apr 2024 03:54:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UA6GbvdGWwzQBd2O7IaYVnPbL4rbwkSkUTzujbKwIWs=; b=AiaO8rCVMs9lRMqxbyhwQy6Ec6
 O5vYTkvjyba6od1pU0obqaWpO/f73H4zFRQ+I8IB88WQx9hjwwMcPRZw+nHaxKWNOOzrDRC40yl8Q
 5YNTHKEorIryQ2z1DhVy5PDceS8M9r93lYWs/tNzV5sB620lFb+RP9do0DqJjurqYNbM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=UA6GbvdGWwzQBd2O7IaYVnPbL4rbwkSkUTzujbKwIWs=; b=Z
 yaGedhmvSL6HVbUHD1SywOdvNc2FZRSURK5h9MkXE/ngbvgBqV5lPpPcQpE+AdjrnK9NeIX1XFB5K
 AExufYn9vOz7u/HBA3xpp4btZz6tisNtLpgmylmONBk8Bdcjr47sppsj65U/F253L6Isc/L4Uakd5
 ft8k9YLVjeXU9lZk=;
Received: from mail-sgaapc01on2053.outbound.protection.outlook.com
 ([40.107.215.53] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1s1I5Z-00066w-6S for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 29 Apr 2024 03:54:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=oNteqcj6aapmRml7jR25eioCeZ7NFzFFuJkLM920qvoJ7mUYzQvsgIXEmgRZRlyhiVrD8jVbYBXJZ0f1QaMEydTKq1RMkWSQyKZKIls/PtfJG8NeCqgg40yWYuXc6FMdmMsWDEEg4ca2k5u5W58VG9fg3QmmecFalPkC805Pf+J1NgE2e8dyuj0h1W6igul12mQVjysauvKIv+CLTkTZHOX0K+eLFxzk1J4w7w9Eteuje9MXRAT5dGBDJODczdYoGTuI+vZcaE5fgvjktqV7c81SMDkxEHtR4G9ZDcufpafMigltRJzTZaBLDvR/qLrXhn4Tf1jMnDLX4jlXZoOZ+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UA6GbvdGWwzQBd2O7IaYVnPbL4rbwkSkUTzujbKwIWs=;
 b=Xmblv7os79Sv7d9NBMVjP141Ri1JRO7OVrFf6bfkxArGGPC9ZxuP7+UVw1+/qZcBiYydsGkEZyqiGLe6DqS+rKeKOLRfZIfbGwc8BdzkPlQvxufZKTYsox7t0VLdWw1T+sAYczNhpHesxGpDecg1kACE/tHbsV6SmzdBomvuGfIqiVq0Pv/GIxorUszrFcXW+d4x2mTaSl3kcUtaAoGIo2704qgSHCVLa14URGHV7THUqGgVf2qEwLLzjg9PVEY9JqTQ/322j3O5rbnQVr3cEmWd7uGlGYB2CzZp+2SZNBVoyEW9YWqnjWWfDLzhtiociIXqHULaA9Yp82uzVlZYaQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UA6GbvdGWwzQBd2O7IaYVnPbL4rbwkSkUTzujbKwIWs=;
 b=H2Sqj924TMABmd9d2zZkEDPQKT6AGxLcb+PgJKbGJBgMOoQXBeWBldOLuVrt+thhI6SpXsKDt5F9KBlhBTxX9G+7swVbt51vC6/mQ17iSxefjqamyuriCoxkOKqTPMbJT/qf7JYLbl2ICHkLamUD/Q2BwVDDevclNy/nTGfl9RUxs//aNGYGUhgi6k693osP4KQZ0lMF1SRekBY+w+vNh9MwIXXPal1Tam6f7EWxHWYkVr8EGnwnjQZk2UPYmZQNZo/4OTQFt659chwak/E9flNXuIk6F3lbq7BfUvOMiMcoQ6rc/PWOVVLydnRUHEOd6zG7a91ZHjFSm6bREO2FfA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by TYUPR06MB6194.apcprd06.prod.outlook.com (2603:1096:400:346::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7519.34; Mon, 29 Apr
 2024 03:38:44 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%5]) with mapi id 15.20.7519.031; Mon, 29 Apr 2024
 03:38:44 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Sun, 28 Apr 2024 21:51:42 -0600
Message-Id: <20240429035142.706356-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR02CA0125.apcprd02.prod.outlook.com
 (2603:1096:4:188::13) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|TYUPR06MB6194:EE_
X-MS-Office365-Filtering-Correlation-Id: 9b34974c-5086-4e6b-b760-08dc67fdde94
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|366007|52116005|1800799015|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EI3fG8ry2q02F+AdUDJndXNwKCKqE3swjIgYSR2THAOh/fJ53t4v2X4AZFsM?=
 =?us-ascii?Q?1Ggvvo+JRgRepjY+xxWR+1lPdUObEkT0WBOX08sxqa9CeJ5PFgVDAjgmCe+G?=
 =?us-ascii?Q?Jx5VSX0EIHHNL5PcPfuxydNBwdEBsOlAprw3cMEBGpxzSxp82Ech6z3oVjlD?=
 =?us-ascii?Q?JXhEO9m+bjhZUHYLZZAqNLmDkVk4L8pEoXEkjJ5l0gUhIV/bK/AcVPMsERhl?=
 =?us-ascii?Q?DoJA6wcBy9orInBQG/GvBsBO6T+S9SWa72tZ8I5HKwJQ1W8u4vE6i4bjtIOt?=
 =?us-ascii?Q?s8LpCahhkvg8DMc4JWm0ADUVI0d8Ic3NofS36OVY4RJwiXZwdQSp5RxdVi1I?=
 =?us-ascii?Q?YBPuOQYyQcHdVo2zoQtsaVpN+2Z5zJE+ulyRbiaXurOv3g1+nWHp/rLkHuy6?=
 =?us-ascii?Q?bs2xxGlrYOLkglsa+VAweSVETc/cghb3xdSh9OwiwRUr1poBn5xQu7tRabXM?=
 =?us-ascii?Q?ctM3Ed1s0LHIIsYVzTF82Jb1hqr9GgWctfF4/IfHfnpyHtyEfxL0UTSflQF0?=
 =?us-ascii?Q?OQT6u0gUaUJRi/j2NcgRJySAhdh+IgkLO5yCBbs6dOz+pugho76CnESPDbtM?=
 =?us-ascii?Q?AjU1mSXfmVl/dgHDZUSLMmFDjcQlMafI4Nk8Az0EyyPfMIw28V76xUMRtQ5b?=
 =?us-ascii?Q?QNpjJ5IO8QXfHRcps4QMdLwtR4Y7G3TyBnQguS4sSO69E0m5JM0sXRYRSMXK?=
 =?us-ascii?Q?cMuZn5tYvm6IZkEW3UD0G+W7vTk8DTLT6j769fb2Jg0XnCJk8TJCYJ0MkC/l?=
 =?us-ascii?Q?Dlux9KjKNunegVs9UJk35W0Jo3iTJV7a2ExvFOdz1ZU5JQ/V1Sm/N47LIgZn?=
 =?us-ascii?Q?eFkCBREMFnbskw0/aKIjh6zcmgC6JEuVHuJzDxDQfBkDe0Lmobph5/vYueJe?=
 =?us-ascii?Q?gwJFGArU2e8JhtRoJQDzv2eJrFH/GMSrndW5hQZrZJLLWzLq1vRTgkucwRwZ?=
 =?us-ascii?Q?q6kVM8GhjpjN+7pOajUnklPmGyrckrILv5CG/FMLjVYSc+OfaehoeU9v6qZp?=
 =?us-ascii?Q?t9H0io4QIlTBb/nJNx6TdYznUE8Ky6wR9aW+EnwjNN4Aa2FAwyD+r7IgbryQ?=
 =?us-ascii?Q?+AArbOTnzlw/NlInGqMgZRrXIZpttb081zhLLRBoJyT8O6iQckQaSw5moAow?=
 =?us-ascii?Q?oPiqNUkkTYQrsmItzS9JjilX+0yDcq/rnN0tTkL7bp/CbSqrlS+lWb9/oZ6I?=
 =?us-ascii?Q?NBBSX3v4t8OWKRE06qrDVy6gwjgihwb7kKl0yjeXOxdl1YjYBcHpa3wDNhzY?=
 =?us-ascii?Q?li//6JlIvkfFliCVBvU2uj6kE1bhe9LX0gyZ5EJCX9Wco177PGsUHHWa4zU2?=
 =?us-ascii?Q?yEFGVeEHkJ+efjpEwg77iejSFAo0KJ8oQtKrURrERiKwnA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2b+WxJhnAIw2+7vMhujuH7mfNqswX18wLGSswyiELszv3aO6GGVdlzmy/hYh?=
 =?us-ascii?Q?elkCnE4gtbqmgqhIwuLGlfiZTyhVzHSP60GhJWdONnjB4s++BJimdieDp1q9?=
 =?us-ascii?Q?PtLi5WGBd6juK5HPq2lSuTg2pyO2CnixmRWCqeVqipLLdz8UPm/MEV4agMES?=
 =?us-ascii?Q?D70r6+gqLW0yCKzr9HLP7h8PDmwWkDg/qsG/tCCE35eoFeh4zoxoPsAhVizz?=
 =?us-ascii?Q?0p4yDKvrTpVAfXJf/FDaVRGhAarNySF8/fCJG6oTP7Y733LRh0YFvIkCBowp?=
 =?us-ascii?Q?pt17fkI/X7mllrB93VKW2sgzwBCNagQLq5m7Etae64VxSQo/XYo3+nBVJ4S9?=
 =?us-ascii?Q?YWfNZJwL9NiCPOf1avkUU+PgQq0tio0Z+gtKiWMcmoFiAAhJy+5q/VEorHQC?=
 =?us-ascii?Q?OV/UpCt1bIj2SgwzXfzqkwB5ZnQdmPnsS0OQV7ZcM0k11NTs7+M/Kf7n9KD8?=
 =?us-ascii?Q?wa6bx9vBHhsBZ4dws4qGtFL2BLoD2OuFp6jKDYlUmLTN0Wsmo647KMGuVQZh?=
 =?us-ascii?Q?KSDGnJpd5ugjkMbJfz6nn71lrvQ/90Y/83zXGm3290Ad39xD+HojP54xTba2?=
 =?us-ascii?Q?6lFkhxMYJTtvP0tayC82iepmsdxpQPksT06AGjVdCVZfeH8UAAQDgIeseNaL?=
 =?us-ascii?Q?P825Jc50PULcbcfbdOpEtA21+bIti32jkw/x6KW5vmUIJBoYoDZDFXqAWbvS?=
 =?us-ascii?Q?KaXvs2MC7xt/BkG8ZgJWgU38HORk7gyq/z67eNoEwHVwuo8B00/b+C1ei/Ki?=
 =?us-ascii?Q?5mdet5xjA9RShk4ZX/pLIoPsjDCibB4maATPfArSfWACT5AEk6ZbvfAkmar9?=
 =?us-ascii?Q?imobb1jBoHpqTj3Sqh0149UfDxOusTIv9XPFtS3zIqCOMwg9FHY2DmOOy+Xd?=
 =?us-ascii?Q?7H3hKCexkCJ+2DZhmEvG7/UFdKjwbnFJZA8cyyFs+OA+87DTbKXP9fi1qjrA?=
 =?us-ascii?Q?aLo3tFez8d5gz28V077FnNZCYWIIpPAXAuidIv/zdbIQDt8cZ4UcrvjGZDmY?=
 =?us-ascii?Q?Iu+V83wy6nqn0alns3JJemJ1EQArOJ6t4OyEPokLX7/fI0ZVfLev2jYMYhfe?=
 =?us-ascii?Q?b6Ke7VoEXc5rA7Y3G2chcjCAK+g1wD5UUP4vymCHojg8vwDYBHyGKHqEHRhL?=
 =?us-ascii?Q?8L1wcjykrJy9VwY2xnESQd8VCc+HKbWvuMunDK+LqGCbhgi+PkmcnJoc3PAC?=
 =?us-ascii?Q?A5CijzJIkKvWmoIHuRO0zpHgm425RwhGlMWoyMWcxRpeKtxi9CW6J2iQpFSD?=
 =?us-ascii?Q?XwvFAFwuf/PL6fSnG5Cw+5uTuiL68vus4QNZoESyHozWSdq+N6IUsx4Hp+Mi?=
 =?us-ascii?Q?lvfV94h3mg6Qnxuht+/t93UMEAea7QqU8UTBadISO7viI1HbjhqDpe7w2VzM?=
 =?us-ascii?Q?Ga3WMtPIh2wBCIUQ3Fo/p3szkusfrEn65XoKfwCwe77zpiSLy18yoFyVoLgS?=
 =?us-ascii?Q?8wRv+SQQiBi/kD3GvgtQFtk/m9SqhqiUdhW1aWPgQnmTq+Ckm+PokBeybxeu?=
 =?us-ascii?Q?DZu5nWJOMUWj3oHRnIKDj2Z9rBssUbrbUp3/iVkGZ1GtbwSOAoSojjPC0KiV?=
 =?us-ascii?Q?4NFbl2uktnN6J3qydNiO7fVBlOn1JJHEE7ZASudQ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9b34974c-5086-4e6b-b760-08dc67fdde94
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2024 03:38:44.0175 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: +qDf0Vvq/CKIN9dKR/6VN/brz+0c267Ej70ozOE6pqZWGH/a2whxdDQhC2GWJq6XllMYkI5C1G2BH/DoSz9RtA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6194
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  As for zoned-UFS, f2fs section size is forced to zone size.
 And zone size may not aligned to pow2. Fixes: 859fca6b706e ("f2fs: swap:
 support migrating swapfile in aligned write mode") Signed-off-by: Liao
 Yuanhong
 <liaoyuanhong@vivo.com> Signed-off-by: Wu Bo <bo.wu@vivo.com> --- v2: Fix
 arch-i386 bu [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.53 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.53 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1s1I5Z-00066w-6S
Subject: [f2fs-dev] [PATCH v2] f2fs: fix block migration when section is not
 aligned to pow2
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
Cc: Wu Bo <wubo.oduw@gmail.com>, Liao Yuanhong <liaoyuanhong@vivo.com>,
 linux-kernel@vger.kernel.org, Wu Bo <bo.wu@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

As for zoned-UFS, f2fs section size is forced to zone size. And zone
size may not aligned to pow2.

Fixes: 859fca6b706e ("f2fs: swap: support migrating swapfile in aligned write mode")
Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
v2:
Fix arch-i386 build error.
https://lore.kernel.org/oe-kbuild-all/202404290041.jfIs3zkw-lkp@intel.com/
---
 fs/f2fs/data.c | 17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index bee1e45f76b8..6fd877c69c03 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3916,15 +3916,14 @@ static int check_swap_activate(struct swap_info_struct *sis,
 	struct address_space *mapping = swap_file->f_mapping;
 	struct inode *inode = mapping->host;
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	sector_t cur_lblock;
-	sector_t last_lblock;
-	sector_t pblock;
-	sector_t lowest_pblock = -1;
-	sector_t highest_pblock = 0;
+	block_t cur_lblock;
+	block_t last_lblock;
+	block_t pblock;
+	block_t lowest_pblock = -1;
+	block_t highest_pblock = 0;
 	int nr_extents = 0;
-	unsigned long nr_pblocks;
+	unsigned int nr_pblocks;
 	unsigned int blks_per_sec = BLKS_PER_SEC(sbi);
-	unsigned int sec_blks_mask = BLKS_PER_SEC(sbi) - 1;
 	unsigned int not_aligned = 0;
 	int ret = 0;
 
@@ -3962,8 +3961,8 @@ static int check_swap_activate(struct swap_info_struct *sis,
 		pblock = map.m_pblk;
 		nr_pblocks = map.m_len;
 
-		if ((pblock - SM_I(sbi)->main_blkaddr) & sec_blks_mask ||
-				nr_pblocks & sec_blks_mask ||
+		if ((pblock - SM_I(sbi)->main_blkaddr) % blks_per_sec ||
+				nr_pblocks % blks_per_sec ||
 				!f2fs_valid_pinned_area(sbi, pblock)) {
 			bool last_extent = false;
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
