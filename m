Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 575AD6114BD
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 28 Oct 2022 16:38:20 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ooQUx-00020G-3W;
	Fri, 28 Oct 2022 14:38:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ooQUb-0001zk-5S
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 14:37:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ZAakm/77XKiI0neJGVxwHr9h8bEyPZzbC+sWixZCBNU=; b=avNqbspy+KULVSbwPkb/+jc7Bn
 UpAvkog3WOECDxFYrxHQnlhj9rv6tp1OSBi+j3OoZffDXn5jlQVO2pMypa7WsM+LcCC+edlVHjldF
 cSUvawGsFa78nREHvm1MxGHNbXzjlhUpDD8j4DUO4FFXHOcz2AsB8ckoPvNvtBDRt7ek=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=ZAakm/77XKiI0neJGVxwHr9h8bEyPZzbC+sWixZCBNU=; b=K
 6RRBifI0uEEQuzwZQCc93GDV/yWjJgoJ9VoBK2rgsXy4y1ltt8AZHUu3ZHfRPlHNYyg7eCXRnDDCh
 i7vcj4ZeFGgpJYRhfzIqaXD+nizfYwqugKdkeYlPf4ZrfvY+/llm+Q+nT5vfR+5ouGhr47uR4WVRG
 bl+dJTtyvuO/LofM=;
Received: from mail-sgaapc01on2106.outbound.protection.outlook.com
 ([40.107.215.106] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ooQUZ-0007pM-6U for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 28 Oct 2022 14:37:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=TGHUeuVmJwplwVx8o5C4OPcAlYb4kljmSARyhXYrqkqJx4KoGRxyYDKR2hTd6T3q1RmjtSRaArdr8TUI2C1R2Q7ztXqIpkhs251dznezJ8SQrQaAd40hy2WSz6WbWFluxAgCZiUMPsi1VIHgE9jc5Mj5pG04CCd+isVVdssUrIlkMYMKu5aMluT6seeYH2bugu1lxLDsixrD7GgKh6cOIo5wGl5cXa0BLs0ar7CqU2g94IZ7uhGzfP7r2rhn5Zh28lirn4adjAujXycJCWXEDVt8vSIMFMIZ/siighzQT1x9zi8QFIwiRcZGNMM+RnU0XMRda1XcI6o4UNG3vOkTfw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZAakm/77XKiI0neJGVxwHr9h8bEyPZzbC+sWixZCBNU=;
 b=WB9Rxnl3N2C3dvQ5swjKVZT57yrvJ5XuPqN+A4jbmcs8qGNWKFkTbtPMDoSXg4dpls+RXtyfuWMbmtWTphsOL/14owcSbpIalIfAtCNU5n9xQ6ui6ubZQ/xOZx8CW1UoEvgIkchLUEJJHcPw+da8K6Vmm5TUYVSGSVE0uaIJsbhv6fXvnsWPwImLrcIaiMz8SalnH21uI8AT8G11SiRWbvl/E00RlyP4R5V6ODGkTcuFY0+WDFp+d5sTOmJ2TkufefBjqYGYSv4299cUY1tn+OQu7enxx5fQdWEkSNfCRknr3wgUNHJJXLkgWzfhEq7IiV8WXWYo0EVWUsAyF7mDlw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZAakm/77XKiI0neJGVxwHr9h8bEyPZzbC+sWixZCBNU=;
 b=pZc7W+B7xv7IBfyEu1kziG7ZLC3h2KVj3ccYlnYAeb0W67xL7CEF7tFE4QiJdoz9poleZNPwWCaUUcL13ZsOVbJkbv4g7fUhg0ZEDqoS1Yp6mjFlH7wxh+g0I1dB4oo1NDgOtSb6NAw63OKXt61Hc9mdAE061uIaufJsWyTnymndfZHUMrMUZIuJCz4NPEpV6qPAjJ7pgzYWOXCfrdOhR6YUqE6tY6LqMjd7yd+DrScTMhKoJEPvq5oFknS+lRVlpKc0pspea2sK78yh5ogwWRLWS4UdcREYsNyIurBsZsPcN19B0Sx0OdwE3GWAHe2vykOkWyB448z2YMXuuoJ2rA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5099.apcprd06.prod.outlook.com (2603:1096:400:1c5::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5769.15; Fri, 28 Oct
 2022 14:37:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5769.015; Fri, 28 Oct 2022
 14:37:42 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 28 Oct 2022 22:37:33 +0800
Message-Id: <20221028143733.57322-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0081.apcprd02.prod.outlook.com
 (2603:1096:4:90::21) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5099:EE_
X-MS-Office365-Filtering-Correlation-Id: 68173172-295e-4cbe-36ae-08dab8f1f8a3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 6tKgchvdjq4bysDW+x/i4QfExZ/z91RAKX2Cw8QxtmKRS6PEGYcx85ynxDQ0LY6h9Ub2LQruSoDGKoGrcdLOzluSy9FLVPgJXiEI2EqKQwwvzEJtHsc/otJ8CqjFBPvBdJAS3fDsXQEBQi302ym3VInGAydyiujcqSGm5hhPwQHxTwBDWT7AykOs0xHUjQG4HKXMsCMQnaQ8YT2qudORPofDJbimTSVL0krRpam0rlgKLV6BwMabnn0lS2ugzpeKW73AYsC81kDi0nirdjWn1YhXYOPOHhSXpaihjGf2aEQrBDzvDYHm3doBjDeblI6DsHuzkOu+mtjqL/Le83wkDrcAlCXbj+6guYzrqpBUurldLcZV5fYHCOgAg2pFY4+9bf+9rnPv870SiHFEeqOzHB49+THFVESFVvHPmGYL1aDOD950DclF/nZaAF3vbZjOHGrYIBmfCYpoBCS9tklMz0eQXvrpLNSqbnNKVFx2MMmKKxvg0BrD42ymZw9jntwze2GHI5Ow7TSS5EvEmlPDqxOPh9dFZpQJI4Y85Nmm+Qkr0I9AeO+XgVouYZ356iI9KLd072a0r2YLnnSXXaq0qTPsXF+yV5jlrrHDlR9ATAlnwuykYhVkcOfEEeYIMW0sWcixZpsg6AMr+cZU3jgixv5ejjkGBFu2rR3hegnbiuBYCIgpuFee5uGUWxRGiMYYG6xHAx+lQN27up6WRDXZZGu9UY4O29dm+V9MfJESqap+b+oVk4pA9o4ABWZ9FfVRnaNQmR/+lQCnXhZmUANUKw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(366004)(39860400002)(346002)(136003)(376002)(451199015)(86362001)(36756003)(38100700002)(38350700002)(8936002)(2906002)(1076003)(83380400001)(6666004)(107886003)(26005)(6506007)(478600001)(2616005)(6512007)(52116002)(186003)(6486002)(8676002)(4744005)(316002)(4326008)(66946007)(66556008)(66476007)(5660300002)(41300700001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Nq0s4VcdE4hSD6B2fluDw/uNhg8F6WrFqXmkPrLyjoECTdqydlqupXr1Cdz6?=
 =?us-ascii?Q?oo8w9wYbrxanulpFH5lSOtXG8bKqi6bkqcNTB+60IgLmUz3n858/6ee8pk1k?=
 =?us-ascii?Q?kq8gZIJQ604msFxgT20lp1yo3bEjhH6HLdrVprWL3g4LwfVaRYDsG94Nu9nk?=
 =?us-ascii?Q?mruY2s6JyErSHyoI0IB0DoR7y56rjv/myWa1yxlwg1K3XNw093vsqlmNNOBd?=
 =?us-ascii?Q?rDtXds3ivAG/yTYxRhSlusDqH3iB7piDpYoCgRt1JZKuDOYvOR7nVCRmpGx5?=
 =?us-ascii?Q?5ToyGyMLMOc0w6xqWIz7aAI9we25j5NAO4bGh2f3syqh4W3/E+yaf7EJwXlQ?=
 =?us-ascii?Q?d5xF/PUfzCy2ihYLytshl/dQ/13SCKmxARgV8UmUQANUwe0dK980uJMPSnaU?=
 =?us-ascii?Q?fNhWA91kRlfqjAZVc9uMEW7GThjxifTPgcTZU+EoTohQEYVWdc2V9WarmfS0?=
 =?us-ascii?Q?Mr47+dfkqs2dcjLetC3uQsret4dfbJn1HDPUASYuyTJMLaQF7f+ut0tj1/8M?=
 =?us-ascii?Q?czcv1C2fKP7l6aOBPW9o4nAmxYoR7cQ/IoJU7jUGLTGN+EgL8GFeZ0pQ59UZ?=
 =?us-ascii?Q?hTZY0uKoz2sa6bNn8iICdfI3SxuxBJr8XoeAQU0Ttr37fWouksytocxOZ6m1?=
 =?us-ascii?Q?hgh9Bm/mX8otjYdW5keQBK6bLq3PMkOLwDN3iHmIK7+k6pNY4MEWcJLCp3HZ?=
 =?us-ascii?Q?kG2YhVW6rQ63BQ323vW1orKsdEp6zfGfd71JZ4o6XP5EBEOKIXV3qJVHvt+0?=
 =?us-ascii?Q?WjicrHQfxEgOA+KWY3oqrlGhSEs1OD1COuo7tu8Q8c5RO/3MpsvH2vaASiy4?=
 =?us-ascii?Q?alMP150FS6JOztadL1zuxUNKROz+X8clDV9YX7eZF0H6byYlDaQYeJ5NuKBR?=
 =?us-ascii?Q?VTFz5wvWIu2aOJc23YDUWKXCogQPKiCFuBNQHm9pYShK8ykylmecXNkcXvQy?=
 =?us-ascii?Q?QZaFkqc6NPFt2SlbDuQQ4lEtEKVgLO0eGwefBnQKngzpWt6pKdJwyXLkH0M1?=
 =?us-ascii?Q?cR1vXZOcLf0sOEVtAucZqCj4VQujRSf9BLvYaYEzYGAVFn2DSkmdeMaVbDo5?=
 =?us-ascii?Q?457hcL/ufQD067alrN3fb/SxcJQUwSMvPbh1YsrdctQQLYYtb7NR/Dj0RIlO?=
 =?us-ascii?Q?3HiuOG//8nrJk4YC7uikYYVxtbfw11JMeV4LC/8eaJOT7UougNbcr9QD1DER?=
 =?us-ascii?Q?Xslxk4bKm8NlhDkm9fAgURn/rV2PqfC2+0nHottT2NmxkU4jHPliPz5WOf3r?=
 =?us-ascii?Q?6SzqTQq7MOeyDedLpsHyOX4PGYz5MbOMsfUC+8JJGsKEVPWzAgi5xRvhEyn8?=
 =?us-ascii?Q?T61htmFXfAf2t89delpPI5J2pQ8qFRlpRW3QOOPVPJu9d0D+gOAe+5062qam?=
 =?us-ascii?Q?8+MnnWbIL/VqnWOzBWPh0cChBkyMLFbrYkL2nR0UqxkRfBGKzFQZIn/a6KtQ?=
 =?us-ascii?Q?ecnhvhhMZwmgb18j+DAb1VFKqcQXs/Mb8pBbmI4OXEEop0OTJDQTFSI7tnHz?=
 =?us-ascii?Q?NfkysJdJ3a+L1Fue3cBefdsOThS+d+OuDu9oHCEnEevYZcsljQKr0NPv4kyB?=
 =?us-ascii?Q?YCQqouCcQ3drMJ93oACw5yFqchJdKC2SR3CVbxQT?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 68173172-295e-4cbe-36ae-08dab8f1f8a3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2022 14:37:42.6464 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qUA4Uh/pDdxgc+4W0JJx4OgFRVRppD4AmMtxdXEasp5b4E4Gx6JDp9N+shfQbtEdJKmWDmIwKVc4GhWlLUEAFQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5099
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Under the current logic, after the fsck flag is set,
 the discard
 thread will still run periodically. So stop the discard thread from running
 to avoid energy consumption after the fsck flag is set. Fixes: d618477473eb
 ("f2fs: stop issue discard if something wrong with f2fs") Signed-off-by:
 Yangtao Li <frank.li@vivo.com> --- v2: - commit msg changes. fs/f2fs/segment.c
 | 4 ++-- 1 file changed, 2 i [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.106 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.106 listed in wl.mailspike.net]
X-Headers-End: 1ooQUZ-0007pM-6U
Subject: [f2fs-dev] [PATCH v2] f2fs: stop discard thread if has fsck tag
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

Under the current logic, after the fsck flag is set,
the discard thread will still run periodically.

So stop the discard thread from running to avoid
energy consumption after the fsck flag is set.

Fixes: d618477473eb ("f2fs: stop issue discard if something wrong with f2fs")
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
v2:
- commit msg changes.
 fs/f2fs/segment.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 7786351de429..b3600bcadfc7 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1716,8 +1716,8 @@ static int issue_discard_thread(void *data)
 		if (kthread_should_stop())
 			return 0;
 		if (is_sbi_flag_set(sbi, SBI_NEED_FSCK)) {
-			wait_ms = dpolicy.max_interval;
-			continue;
+			dcc->f2fs_issue_discard = NULL;
+			return 0;
 		}
 		if (!atomic_read(&dcc->discard_cmd_cnt))
 			continue;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
