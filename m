Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E42C607B33
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 17:39:05 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olu6u-0000nX-9S;
	Fri, 21 Oct 2022 15:39:00 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1olu6p-0000nG-Ic
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 15:38:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=TANES268XFejJY/y0bCIe+nDZNdAK9LHXT+mtSy9XHc=; b=UA6dFmgIStQ+P28r7nu2vx6iDK
 dfmZVk9+gCuPRpvnsC9VpifHqVW9hM8C2NQArC0XeIXtYm71N7UYGdBDy1ETPAhMKefKh9Z7n+P6S
 iv9aASIPmKcJRM70i9F1c/WtlQbcxqc+Dyw0sC/m6bDP0yO546hL61k7K/VxkvtZMde8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=TANES268XFejJY/y0bCIe+nDZNdAK9LHXT+mtSy9XHc=; b=i
 ixif0BdnXMZ6oszuZyDQuXLtxMNrS8g3WhM8vFaF/C0Kc9Tae73oDj+pLdZ1dCIpmCCVEa29k6wJn
 t9Y1UcCu6A78mpLGs7Y1HC+EM0OpRbVzq4HcqZKcA02v/+C4E3JchjUFx2ZsrSOnR07kJ/v1ZThcA
 Sg8Vem/d6vsgHd0M=;
Received: from mail-psaapc01on2115.outbound.protection.outlook.com
 ([40.107.255.115] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olu6g-000566-8T for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 15:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=EABMhMFZHkZR6rQOQkmq+zVRuDcnpHEw6oND+qrF6DiM+nqWLWR9Dnr54Fm3WBsnW+ucFt9RPzQ+4t8+86VcqFrgFJ1lcsxbQaBcYOrHEchKeQRoz6vGdqCOn4PyqCPOCfXUY/hqF5Qr5fM/IQXPUjiHXmL9rV9fVSavqgucnEVsuysWKGFe19Ell5h/ONugsZHFEN3A67jpUA58QcmhcVeqbyGlU/TFMgt27vsNJAjfP5gWknKdcIQJQuHk31cuoyE6VVAHQt07PnEVlc2H+iGDvj1DPf+aQc0OqrEKc8/uIlpV+TvtLKR8pCIJK3w2Bbxhw1LEIAvzPweC74aqSg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TANES268XFejJY/y0bCIe+nDZNdAK9LHXT+mtSy9XHc=;
 b=ZNJ6GFqPP7LH7pEL4na+v16tHwBIE4YQH8rR6vctXEpZF95aUQrPsvarEY5853Cj2AhA1u4xp4WqW1nqhlLnr6O9kH7sXqr1VzS+t+2q47IsVWF19nI2j84o2xoAXNpKGhUoHrk6xhCq7AToaHeZpBawiE1XaT9hp0gF+FOOaebkyqt3Ei3UFhHw6jvMThPjudkGe2CLqAckDFiftYvZYHOlmq2kFXAU12zx9R1gJu6QBtmCTNUDUXXq9/H1Nr3v1HvRJxdf7C4Ojych+vRfp0YCTjFGhk0Zm7IzhEodfc50aBS9AEb3GHj7d8bYmPbtGNCgQCCllmtCFP/CYOkqyA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TANES268XFejJY/y0bCIe+nDZNdAK9LHXT+mtSy9XHc=;
 b=oLm811JMV8S+mB5W9Yttq5lqvDqRjOTsin1eJ7cSzks8qs0798j1Nr1AKTuoy4QJa2orchRXkhUtxsBEHY5t7BfbG7fS4DiGM8LJ6CU64GwF8+hPzgzvsQ0fwrSdOlXBHUGRpM9wGHq1SweY8MfAwrtsEx3A67DZg8rIJo5GRzN2ZkHaNDkN5k0J5hxa7iwLkyxwkyl1HZJqiHtthfqCKpvePrDJYBvBtw4L3NioeH4j+SG2uGOhhf0Q+BtMaUgbPO6aLHLMrN12K7LBrvBO635Mi8A+lNekKxfvEcr2c2rtfgyogeN5f0el5WWNa5d8OJYkgf77RqsiXqsuv9bprw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB6035.apcprd06.prod.outlook.com (2603:1096:101:d9::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.34; Fri, 21 Oct
 2022 15:38:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5723.034; Fri, 21 Oct 2022
 15:38:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 21 Oct 2022 23:38:24 +0800
Message-Id: <20221021153825.79614-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2PR02CA0006.apcprd02.prod.outlook.com
 (2603:1096:3:17::18) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB6035:EE_
X-MS-Office365-Filtering-Correlation-Id: f0a2a9e5-f5a0-4a47-9c28-08dab37a5261
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: qfYtB0Tn8Zbi8JEaSz9+9U06Eq9RMyYgnkGaLddNQQAiLVMqRx/4Oi1QLYhHNoas5fBsFxbefdELlHYZw8+A4HfJahSoYT8HrafAykCUDdwI3078ldrP3vuk0B3bIWTkNzr4EjSb5EAqLVUr6+hX456oY7iKa3Dv8kfi0fX01T3HH9jqxVgN92zXKBXyH+XPAws9nR4dhskqfQcCCWBbfJO0mwNDOUMgNNhC6W3hVTmwXgWsz79tKCw1IOAKGTK7t1WlH97c0DVrkbD58AOSIXO+rO1iazgUB091auo0BkglbOmL+YvX1T0aoFxbY0gTuBGX5sQyg3ImzS6gXkt7aa0tKfsBZQpmEgJIZBWaSv0YWH1k2PBwh84zNlnu0Kn+dFFxji1STtZu0ScomZpFsZazX6a9sBMUfG6PYk4AAXMtwDbFr+ELegeozO4idzUwylfG7ojR2wquNJFaPjvRfA/imOF6dx61R7voD2qEMa39IZFTwqTvp+KBc3quDm5dr6y/CEzkFDtOfDq5vPqAzYbz8hpECW3+OQw+4JHVSwZAekmAS6epcjX/q/mJ6hNFgAP3kNVFdpfPX1Fi92T59t9CTec+y7sXKeLJ22PN8MB2xPpSKvkkQt0jGtIgWygK66H45YxZ4Jd8y5XRKs+fGMd9oiqe42Yr25wrQBMGFwjKOr6kMdshKRPjDCf5QPr43smh8Ed7UP6x2mAzY5CAKH+IH8TG6U20FAFLs5sIelgFkHb0WodXodP6xMfZTjOc
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(376002)(136003)(346002)(39860400002)(396003)(451199015)(26005)(2906002)(6512007)(8936002)(6506007)(1076003)(36756003)(38350700002)(2616005)(83380400001)(38100700002)(5660300002)(41300700001)(4744005)(186003)(478600001)(6486002)(316002)(6666004)(107886003)(52116002)(66946007)(66556008)(66476007)(8676002)(86362001)(4326008);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uvgFy39emjfTfBdWl2/zMQfNl+6czCE5KaZQt6ClXgxFqI3plAbZx8NTGfCR?=
 =?us-ascii?Q?xM8aJPUb2hbomBD7SguE2l+I3jsaK56CdnYu75YKTgLwnHhcwHxgK7VBlG1p?=
 =?us-ascii?Q?G5I81o72vdaIRwnNkVVkXgBfzI7bVLQq20OKj+YudoHxyrn30lmW9FRYE1OL?=
 =?us-ascii?Q?AaFuZ5fSx0DG6QnpwL8bixwfAiJ0B3CG/b4HJ70GOeIf0YjG1TVWP0rsdO9u?=
 =?us-ascii?Q?5g5LRua8sXOh0a7uqEBrPQdx9arzqPGpJ0P4SFsxLUBD37AZ8YPmW8DZCZV/?=
 =?us-ascii?Q?cS9x41fb74NDpyfgcFZCzPUV9dTdAa3uxiEcCmmflqZQ5/3vhy/CVir+fPjY?=
 =?us-ascii?Q?QFrLwXpvjMnPHEGLwIW1+BEaP/qMLoBvtf3KR15x+MrupRFsU6eoFa/EWMbr?=
 =?us-ascii?Q?lIAHcYkt8e2+sUyPEvy8tGlRZe00k9itvGQ9rEIfqT7o5YrKU5cO11FUPbIx?=
 =?us-ascii?Q?uv4M4dj6Fj6UWa9y/B6/JRMK/Q6E9+coyILIk+9VdDMvhmBzkhom/0zbsnLl?=
 =?us-ascii?Q?5wKLMgc28h1h24xDHff3CXyVpGuE6BULQ1M4q5YpzcKgmyeJHJE1hNgazcVM?=
 =?us-ascii?Q?w+g0X6DfEVVnxsADbfSbmkesd4jAOiWjNpkqQY3CE0GkQGyS4rZkde/uJHz1?=
 =?us-ascii?Q?zbC2AVf0XGgKdUY+bSraEhsuy2y83CJaET8GG5yHVcvMqQpg6P/lHqv1ETw7?=
 =?us-ascii?Q?qeyqSqRtf2Lrxu8q7I1eo3k6zJ+ieZwwe621tRO63nUMF4W/C9XlyrJ0qAgI?=
 =?us-ascii?Q?uazGiFy83hKbgnRx7bNkbOO8O5NtE08Rx6z4Rv5Ue6u/tlk87dOOq/GBnPfj?=
 =?us-ascii?Q?J7ClO6kDEyeSDhbN7+t1oO0tRjeh94yWRNC20Tq1kyCbc6uQypC4nC+N0BBw?=
 =?us-ascii?Q?Koz+y+sNpTPeC1yVgLXL1xeZ4RiLNdS09mNr5A5a9/j+AFdDo1D13DzvMX1O?=
 =?us-ascii?Q?PDpNU9d2YIkkY6dCvpwnH9W0rRiioEoqXgbk45AgLgjIcFoHFYYzPr7kQM/D?=
 =?us-ascii?Q?bR8ATByD/pJXl+8T+DZQUIPJnpaDvTG/itBZA9SZ725A+iio65mKCaAIyIAl?=
 =?us-ascii?Q?kOOhKxmJAjh71L/oML/pOJFsoh4o+uP6ZWmKaRVl4rMyeTPDG8NLA0WMYuPv?=
 =?us-ascii?Q?CCl+O9fObquYB4pElJDoPfSnHCqHp6n5RMsnx1LORWFs/P6mDXz+Tb4lVzZB?=
 =?us-ascii?Q?b2pBI2aKkpiIH8oHHcc+CGW6xXuTC1FEbUScL2j5LP3u/AaMeVO6VuERje/5?=
 =?us-ascii?Q?/lVWQrvs7a+M0cbxYSCtreEk9hxF2CFG45Wy/lILf0njRrrsAliwXMNAE6sm?=
 =?us-ascii?Q?DXh6YqwXFdVx6+jeKUNxhaayB1H+aSfsLIM8Pqi/gLN9GdEA+QU1MVkZcBet?=
 =?us-ascii?Q?hrJDUapNDg4ddyZLwvl4WZSTTnYV1kVBiHCcls3l7azcbg1mFlOO8otlWig0?=
 =?us-ascii?Q?333Q8FA8K650cVH/3pinDRPFFnjFtsdxuAlu2tgFsmTPFP1xtkO0qB0+bzfS?=
 =?us-ascii?Q?D26WVKYtPd6m8M0GqFK2HUax4BAbzqlNXADQxfguWsCNpvrDm1AluvEMqqVw?=
 =?us-ascii?Q?XfVtJgRFhjd9vKGZJyli8wC+Aset3axL1sGq8sjn?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f0a2a9e5-f5a0-4a47-9c28-08dab37a5261
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 15:38:37.8044 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qTnU1CJYgZofI96wr8f/kNEFopR6Ohzq00o/vczymL5OIBVCtLYfZLqDjB3vDNFN57PCcN8GXQFg+MAN/91onA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6035
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: commit 377224c47118("f2fs: don't split checkpoint in fstrim")
 obsolete batch mode and related sysfs entry, but use wrong name. Let's fix
 it to right name. Signed-off-by: Yangtao Li <frank.li@vivo.com> ---
 fs/f2fs/sysfs.c
 | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.115 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.115 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1olu6g-000566-8T
Subject: [f2fs-dev] [PATCH 1/2] f2fs: fix to correct invalid
 batched_trim_sections node
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

commit 377224c47118("f2fs: don't split checkpoint in fstrim") obsolete
batch mode and related sysfs entry, but use wrong name.

Let's fix it to right name.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/sysfs.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..3005e2783a25 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -488,7 +488,7 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 			return -EINVAL;
 	}
 
-	if (!strcmp(a->attr.name, "trim_sections"))
+	if (!strcmp(a->attr.name, "batched_trim_sections"))
 		return -EINVAL;
 
 	if (!strcmp(a->attr.name, "gc_urgent")) {
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
