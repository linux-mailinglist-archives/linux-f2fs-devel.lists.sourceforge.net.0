Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B067263BAF5
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Nov 2022 08:50:08 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ozvNU-0001L1-GF;
	Tue, 29 Nov 2022 07:50:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1ozvNM-0001Kf-V7
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 07:49:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6BV3dpZTpsr4yE+baP8EUKJ6qdMvQogHFJcrZasXMP8=; b=ZpF9DbQVTfBiTHYV0AVklbebwd
 UirPSUZl6S+hzN03HYSz5198Dhwyg5BP4ntIDt24xAvITrxUnuy95uCoOY912Yynw0YX/vaiBTdUS
 kOPCPuL/hAlWRRt9spSgztkOhwHKm865aSXCzH/9CIay+VkwO350uUgAKoceZ1v1BdDg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6BV3dpZTpsr4yE+baP8EUKJ6qdMvQogHFJcrZasXMP8=; b=YolcVa8tvSEBIxjLCZ7G2KZir5
 b5odu8QrVx/MmqGAlv8O27JhMJZoF6Cdy5zA3NVLKTiJa6sgV6aKyHUHywM9LlPT+2Zy8aKrumMTy
 hsHQhRjsDiENCEKqpMF7iOQckRZyymt7Fp5Uyy4B1xo9sy/C+RwSafiIx2OcAsB8AU38=;
Received: from mail-tyzapc01on2124.outbound.protection.outlook.com
 ([40.107.117.124] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ozvNH-0007cD-5v for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Nov 2022 07:49:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nd81O3fmv9W8f5alrkwnoget0m8wSrc1WeSen8DWKq9Wyof5q/p89I3KIwnnv9gBxKE9X9RefR3f+2Mg1YNJoezbAEhZgytMtURK+ypjMkWckR7aZGAhzAQ8lnC2hBMaD+ib8vOFUN4rZMoUFgbeHFnkhA3hH3Ombp36EXT2Y9rnQH/CmgX1GIBJEdRpuf1PUHuNyGRTJs8Dx49knGI7sHNj6Arrb7NRz95Fx1JVAnHoDSJOwkV6X1R613zRVGVo+G/5nZ1AEMimPabDe4Z3JZG3vpQ4EMxDkLulDMri4HP12zKstFSjwJREihW6XIEcXWiXLr8ng9acQW+z2omfnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6BV3dpZTpsr4yE+baP8EUKJ6qdMvQogHFJcrZasXMP8=;
 b=kyytIrXgN8BBbwVThIvWxgJjHnFc5N6SqYpHz9+90yQ3LNVu1j+arzm4xLlRwu70UKT2kNYCGnwr87ESQVgKyGVaHStTC80oA+RlGHg/JeWerRFsLAVhkuLVElC/CMnMqaM6KJ23H6XwntuknukFNmjhey7QLhBUgB79b3VDYGS/23JlP+rHC66LFTeDzEcagKchR3Ycw6ER0u1y54gOoNSmzDaRNQ7xQ40X5R4QN3ojJr2IuITavrgAkYGJCtSrdU/STjwiWSleFZfdtSJ28CflyqVOUniACIMVXEg5nqZKTTFe0pZHGGKjpjKSVqnxizDokF356lScoEfzLCMULQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6BV3dpZTpsr4yE+baP8EUKJ6qdMvQogHFJcrZasXMP8=;
 b=CgGxaDBxmpaQciIzSR9OudMCFI2xvOriKbD/oiH0wowwrZEffSmwz3sIfqxxDAVgI9+OIgqTJ3x5DxuGOW5xmTtuL4Zx5MVlzMhs1/e/T5RO4c3RztZKbj7nZAhca+xCGHwx7N4EFGMqaxVwUrkc+pFsos2F84ZPa9KikITKnCBLr7KtMPNx98dVY70PjPvHyuDpERfy5HnonMYZIjp+43uIKmafLEph+ma+Rlx5Rqe/IWCmMkYWlBlF9rRWc+ZJBOaEYUqwflCmcovgmuNe2Gwus6KqXLaymyqLUWP/NPPNPmPzs3VvtxpZjteua0Dw7QAb72Bs6IjixIh9CjVyyw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5013.apcprd06.prod.outlook.com (2603:1096:101:3e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Tue, 29 Nov
 2022 07:49:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Tue, 29 Nov 2022
 07:49:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org,
	qxy65535@gmail.com
Date: Tue, 29 Nov 2022 15:49:33 +0800
Message-Id: <20221129074933.25124-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
References: <20221128085859.5295-1-qixiaoyu1@xiaomi.com>
X-ClientProxiedBy: SI2PR01CA0037.apcprd01.prod.exchangelabs.com
 (2603:1096:4:193::9) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5013:EE_
X-MS-Office365-Filtering-Correlation-Id: b1cbfa30-552a-4dde-6019-08dad1de469f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 2gN1wFSlE6SSTA6xQS10x3aQGriU9BkFFQxZWL3Cqqu+UuhRNRqNFvgmxEpKppM4JBECQJo2A9Gvau4m+zt9bIJ1eMdtWsA0iumm8tU9E8tFn24C0tZICdaVEvx9xQMnmopjD+Laqx5CLF7fhmRekyyGybiEsqL/tR2cb97ML4DerMpD3hCboRmkTKdmKGKQ6gyP2VN8azJ03Wa+tGByVA4ARHrjk8YIt98fghvW7chRQnT4K6xZSuv0z1xsE8UatmsT6OHNTl5FX3TyPJ7up1jbkK0yzi6BV/gY7SaGgvbfHcQqP5s4+sosqh1MFztqMBsRu43IctHqU6E+ln2E5LLOMS8fj441ox9e+EmEGr54QJt8W1Tiom1a3DiJuYyOmAD8opOmdDh6jKrCC4jTlurPal6IZonvJm71IIMxtwhrQTfD77aN9wlriOXCZJ4H/WFLs831J84o9HIkK/Izoj2QUTMve7zL/xI8dL75PuRvDG4abkanWA98/q0CeWGT/WKPylt/O+ljcqso4r+dvrDhQt/KvUpzcQvWZSZMMKZScGJyjWo9mBtiGTSQ6I5GZW04s9N4wSh705fudAPr0JE+GUH/P3HSfDVkq++RZEUjMCuTLmfDkt/CltwfXoUMMt8AauEd6tTXllRGYOk7M0Bsx/Okbro3SBhc+vJkrCcvYK8E/XaSjBDeQVJp2Ga0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(376002)(39860400002)(346002)(366004)(396003)(451199015)(2906002)(41300700001)(316002)(36756003)(5660300002)(66476007)(66556008)(66946007)(558084003)(4326008)(8676002)(8936002)(6512007)(6666004)(478600001)(86362001)(6486002)(26005)(6506007)(2616005)(186003)(1076003)(38100700002)(52116002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?HV6lPT/136JBltalMSCDwra66qIh26aF3j+1Um1unf5MCEKSC8pYk+sUbmfD?=
 =?us-ascii?Q?pqQ+UFi4l6pT+W+FEpyiCnmOAjvxax6oy4YsXHRgFLnbJM+8vUzYqyTT2qJe?=
 =?us-ascii?Q?0bhyG3+d5L0oVq3Rhcrf0H3w9i+R2lO3dZWoyMhAdzpTiPUX4x9QtztiQjQV?=
 =?us-ascii?Q?CroXk4bguSfvbKkEKxS7f/f/gQcD7ecB0rx9Nq6AD/zC3URRCyNWW1pfeVsO?=
 =?us-ascii?Q?7BR1keejfZyFn67Pa2nEJXzz0cEh32nYZ9XBC8fmGgh273YWclYeZUUtM1tU?=
 =?us-ascii?Q?bLk8x7M7ebi+zrBLsLK4qacXlxol+0mg40DwWEHKmCtAH7uzRHMcX6MXfxWI?=
 =?us-ascii?Q?t0IeSMRlRKiyTU/3ijE9TZKubSh7JZxIdhx9fNQQwhX5LdA/R3vMMxfL2Ovy?=
 =?us-ascii?Q?ZbgJVKTmC0t1XROpPToXmsBT/e5fnhD1k8M6+mhyP6PklwLoPkce/pztXMuN?=
 =?us-ascii?Q?OSLmxrdHp40yEB0vgAtJ9qHL/1Vw4zveIKcKc0LOvdC7s3WQ6irW03gaQs8i?=
 =?us-ascii?Q?kR2w8Z3NvAfjf2znjyu5QDTWjTmqiVUp06gzjHV0YNRU1IwBv6GOtGgnn5Ul?=
 =?us-ascii?Q?sEQRPQkxQCLQnFehRz0Tau7hTmz/Pp8GEWTHFURVvywK+47Lm9Z8ylo/U1Fl?=
 =?us-ascii?Q?XALMiOfTeXyS4/vUDJHrH/vSp8GGsCB5Mk4DV2sEc9OAUkKp7ycwCVhdBnIX?=
 =?us-ascii?Q?pIK2jziBw5w7KgXfIllgAamzylP6T0emajWW8GZo68sotlTguqqXJflsTrtc?=
 =?us-ascii?Q?4CS5fpfKmRb0rUsrb0gWvmtIHNn8VrUuwlwjD4uFsoolcXAofczmvUaspQ79?=
 =?us-ascii?Q?s2g/GebNpxBaw1ytlZKUhRUk3zGZHZialfX6T3oO/nqdPxtvhCWKhiwcvjkP?=
 =?us-ascii?Q?1kAZXFiC4tGTPqrTxL4l5UPeNsn61EKPtb8ob9lnslXXuZ6oOmnwEiNQLi/l?=
 =?us-ascii?Q?Vdx+nB8o89lr0hR2NwCv00gWrZ2ZwrFNd6WSyouslGB8zWW/34cXudZkbfSg?=
 =?us-ascii?Q?TBCujOce/OaexkbJhN0Mo/hD7vx71Xt2cyqOgr4k9fedgD85kWESl9b+77pv?=
 =?us-ascii?Q?50xyTRcji/2v6Kp3Vb5DqJVz6CSk+GPTaS3XpCrpYnViLSH0DaoT+h8NpOZe?=
 =?us-ascii?Q?Rk9dUNeyU7u5/rFkav3Mkuu+ZpOeP70W4bCGYlAugLAgcYYWwvGQWnP0pKC5?=
 =?us-ascii?Q?NHuLTjrQ9eXX/5QTLQYTr87V64tL1n1kzJ8DuIxVex0syNJkgUeC8DVMtTu6?=
 =?us-ascii?Q?Q40GnapJVOuQRE6rso6ejdCKI08s722Y13tlERws4KqYCQi3sQgJ+UTWF4Hk?=
 =?us-ascii?Q?9wXjhT520fKeUTFSTTtm/KRa3/7/yPspuJs/spZqaChbhgDmRzsM+hfcv8nY?=
 =?us-ascii?Q?gLQYIVPA1wgo5ktxwxPIM1ON3HqBShCT2DKPme/iN+SIqA6vfT5LQR2QC0ag?=
 =?us-ascii?Q?eGcqnPyznWOQny5hBpZKyO11SKVptv+suK6MjPTISZaPmgX9GRChWxIjIPS/?=
 =?us-ascii?Q?5eBDR8dNm4O17eOXrrZ76eYIJOuhd37L36VWD7hsC+KIZEwO54b+1zNaTuL1?=
 =?us-ascii?Q?ntShngw/Dc7lFVVJZM1CXDcW//oF1QRy66drl8JE?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b1cbfa30-552a-4dde-6019-08dad1de469f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2022 07:49:42.9309 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: yeTnbPlcQiFaqSRxz1gN1uD/488djfg7X5nWHde1kTLBXmhiGLMBqTzjccqfetU0Y2Ce936LhkZtwlt366Wr8A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5013
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi qixiaoyu1, Thanks for your patchset. Does this patchset
 have data related to memory and performance impact? Can you provide scripts
 or commands for related tests? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.124 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.124 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1ozvNH-0007cD-5v
Subject: Re: [f2fs-dev] [PATCH] f2fs: Support enhanced hot/cold data
 separation for f2fs
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
Cc: xiongping1@xiaomi.com, qixiaoyu1@xiaomi.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi qixiaoyu1,

Thanks for your patchset.

Does this patchset have data related to memory and performance impact?
Can you provide scripts or commands for related tests?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
