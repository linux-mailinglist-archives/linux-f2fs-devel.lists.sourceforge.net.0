Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C3B856D2840
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 31 Mar 2023 20:55:27 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1piJuI-0000qQ-Hr;
	Fri, 31 Mar 2023 18:55:25 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1piJuH-0000qJ-5J
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 18:55:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MCJWTq6uLv/auggJhoRMfub6sDpvGZuTmTsRwAqj1Z4=; b=IL7a5iR9c0bBL/lLVGIfiFy5rJ
 NiL/Wo1EF1nEyebXxdTj+vs0fXuznYmAge/Xeo1g7cdIXHL0yY6FHMATrF0UzlXUnnZVdJIRswCpe
 xuLyKou4zm7hf9pfnac2mmmK3s66zwpMfRc6KDrt5yo9Xt9XHrE62alPRoVJiU+s27Ao=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MCJWTq6uLv/auggJhoRMfub6sDpvGZuTmTsRwAqj1Z4=; b=RM1wwHdQ4B03Okw9gDAdlypmQA
 jEabwjoHpci5So19p1qxzWxgqC0f5GidrVJhmtnP932GilZ6Rrd251jqxqcCxLZ1PpSo3450Zq3R5
 pBeQ15Y1N4tQCKs6+hqPEpdBBKVR78tqdZ2oyxQZX+VXJlgVA6Ki9prokM/mbxGR4Y9Y=;
Received: from mail-psaapc01on2113.outbound.protection.outlook.com
 ([40.107.255.113] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1piJuE-00BARa-Ax for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 31 Mar 2023 18:55:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miK8kKJmuduHT0+tO5c3LsH9QpjKS+Z/6y5/aWwaCDHdreSrggcaUPU+A++Tqe3M60OHfqXwvx+KDOoc8iz/+NHe6qxcbbfmF4I3xtbGgEP6L+ChXqSluA/2u0tRb2TUp+4DP7J2iobZjF6dnkw5GywRBe685ZDHqeOA3o6JX79w/vtxjDFXlb0oTmQ8Gmhxh91qYNiSfLF3Hj/uu8wdHR2Sy7AeEt1nrSmXWGkUPf2ccxHrTM6OKE5cTUQqVhunpFubRye3zakS01xT8rJv3fDGpsZZzHO7phZ3mKWwZdASHMn9Twn0m4nOYW0W3nqP683Elc0ExL16zSyQiB21iw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MCJWTq6uLv/auggJhoRMfub6sDpvGZuTmTsRwAqj1Z4=;
 b=Z3HcUtb8XbnkKkH5edjZsVBCxbLu+svN1UWQ3sbBwQjNmsFPHBumsu5U+lbOedjwFphsuUOjpXPa1Q1vWQt1+nTfkAjA5MugXd6yjuWBn8o7Fq4H0rbb+Yqn9UYkhQwL1b+ixoAMTVF6zDvN2V+Tqgvrmq6hbVvkeM3Tcmi9XYFz9dzsTek5Z/wZjRkFDIk+V/eHln/YZ7rRzQJQcGZ2OOffBJ9NUsEmNBTovpzoYxb09dWYUodXyoAPwbufnsGQjEmoBx+d0xv4ruEt4rw24V4JLFC6184r/5N5QhtG8E6Euq3/FqSQM5V4ruUfMPaIVPbTqFNqJhCv5Dqhta5sag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MCJWTq6uLv/auggJhoRMfub6sDpvGZuTmTsRwAqj1Z4=;
 b=czl0uq42i2IS7KUO/dVhlkAh+e+2H4y69CMF6/SocgCW85c6vg0qb01yV/8j44rISIhd0RBftSsh8LFzbMS0YMuV7bYS5EQtk8MJ6rl4IZ0Us+Rvid9zUIZddIYFMKcsBgfP5SRomcw3sO8xfGXY1GonKMofhZq3CzRN3hGVeyX/TQZf95DVnYY21Ykl2cjCR04PuXzZxCgqGwaDCW1IjXa2PN5pQPszPk4JxO614rZgHNm9SzugdLzXO/lbU8GvSiimDt38DoWxZThFWs2Igo0cVaZ1H5O/xjwGKXilKj5oCyvOyPgTRCJVEJjbC4s+Dby9OlhFl/FLJAWJuEufyQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB3999.apcprd06.prod.outlook.com (2603:1096:400:2d::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6254.21; Fri, 31 Mar
 2023 18:55:15 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::a3a1:af8e:be1e:437c%5]) with mapi id 15.20.6222.040; Fri, 31 Mar 2023
 18:55:15 +0000
To: chao@kernel.org
Date: Sat,  1 Apr 2023 02:55:05 +0800
Message-Id: <20230331185505.58726-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <cc346bd6-16bb-a38d-d0d8-ec7e928b27e9@kernel.org>
References: <cc346bd6-16bb-a38d-d0d8-ec7e928b27e9@kernel.org>
X-ClientProxiedBy: SG2PR02CA0048.apcprd02.prod.outlook.com
 (2603:1096:3:18::36) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB3999:EE_
X-MS-Office365-Filtering-Correlation-Id: c25a4ab3-6699-4ffc-bff1-08db32197690
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: bvnth8W+IRi4aphV/NXCZaiTT8d8p8PMg1gZv9Jbu3GLokWZ3bwDnTG+AkYihnUpm8rRFytPNedKBlo8h6+hGMqUzPdQPtVNo9ymR9028nbWpl3t7aL9r6DWipRheWi2HhipIchVmEN97urLgYZOgXA+QX8km+d0m93lzFMhesHx8NegOdiCJsHrSkg15WmicMt/sbygm8dRJUu8yWzT2tIZHWQ8LQ0HnYhAXmbMKyVcH4XtgynxnJO1qGJDmFLJUB4tiVVZr9b8qLt35kOkKrsCDJJ7tUHvN/1ANJOoL49A84JCdO5TyjDbcKNNsuZs3AlRK0Pgu6y5hWyYhQD8swa+5GARW2dIGSRYWTHF/I/74uwJqe5BIuv1V+iAnu6IS7hEU6fCU2fBOPe5GbAfNz4tY3q1fOU62xaqyhpl/6n9c1QmqAP5PjTwP8luaqc8F6I4OzszDWcawjkCzOPhr0goLa0+OvmGHUf0Gqm/yd4C47ZeChj9QOrI2vAUC8daXAghG2zY+QV/Y6/Pb12/o79Tzft6caDgu7bPnX5ZFujtmt80C7icWnzVfHy4a9i0YtTdUEVWcqeiVY4UQUA/V1imrUfQL9wr11acFEqpk8HMpLBwoL9OlMUb8LCSoie0
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(366004)(346002)(396003)(136003)(39860400002)(376002)(451199021)(38350700002)(83380400001)(4326008)(38100700002)(8676002)(2616005)(36756003)(5660300002)(8936002)(4744005)(316002)(41300700001)(66476007)(86362001)(66946007)(66556008)(6916009)(6486002)(52116002)(6512007)(6666004)(6506007)(2906002)(478600001)(26005)(1076003)(186003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?vx999xugBGwMgHtvEDgDaqPz4bCJ9x+yF3jiX0oTksyEHD6IsGOjZh5Tz6f8?=
 =?us-ascii?Q?OnFX1+sn0UEekbmpQcamDGC9PHXznERf2YwioLmJ6GUDYDLR07Rky6qsr6k6?=
 =?us-ascii?Q?FEcRyet+90HkF9QJNJ+gV/vrE6CA0XpYLQJ5u6m8nAXymLAxxDVd0vyTReWn?=
 =?us-ascii?Q?W5XrmOzkk+y/SGvH6QlVM7m/Qt0NYE6ATWVU1GOIkXASt+r0bgJ2n4FXqvUm?=
 =?us-ascii?Q?1N623gsz6Kt7I6mFnwaRD3z/FFWs/1gDakFYBnhG/hlkpdQk/xSIykL5Xbz7?=
 =?us-ascii?Q?n1Gdsch6Vlq7RYt+oXWX0Xi3L8z1FUemD30YgZdCpZOdnMAkek8JI9EBsJlD?=
 =?us-ascii?Q?+V7rTxaqRH9k9aywuD0el44vwgSq//tJQIgPbbUgZwqsHbWUsV7frH6WwR7f?=
 =?us-ascii?Q?iWwjEVnxLiEC3wI+Q12IiN6k49KYI5LXe1uJ/ih49bAQdllgyQa2ucZ9FhFc?=
 =?us-ascii?Q?bf4o6p7WgJBDQAWkU04LZRGSss269uzetMRDvOZq1gqa8Kxhm9ycdsGjSLax?=
 =?us-ascii?Q?kuOJuCgADvJSnvcuAKGI4l53kBOp3onh9gAFOIY+MMJcQQt2eG9DJ0Dg64kk?=
 =?us-ascii?Q?f0FHKP/fjpe0TCe/e95djK1gEAABm7dl97hgqLJJb32hnCcrSi46Bw4sUdX1?=
 =?us-ascii?Q?3XaImQuhsaPCt1mhEe8SoRgzRkocEgxLWiipMz5wkPmS44QTe03PVcmEkWZA?=
 =?us-ascii?Q?H5KtV0csLkIISRq/+4sG+h/NPnGlQ+tjIciQGc+K7WcnR+LnLoscm5egGd80?=
 =?us-ascii?Q?Q22kDg2XEs35IzRqytDdk6I3xAFg/6nNTvae3jftSl+oUOLzYB/ICH6uVUMD?=
 =?us-ascii?Q?l7sikLCXTEpdtRN0t/AMlHXJPhbweiMLYbO6QhkQm93JzUY4g7iGu0g9pzDG?=
 =?us-ascii?Q?D2G8JFp+8/xA/NGQNWw0FVz19Hm8q2RULK3w4v+KDwSjBjA6tGRUTb6BEXHW?=
 =?us-ascii?Q?U/L3EgMgX66/EdhLTA7Ys17NjUUc+7vYU0yOOL67aUAT5250Pi+oVLIkF2ya?=
 =?us-ascii?Q?v91guvZydW8E6Pbi4+t4VrhSo1KTJj55axJctW0/Lg5W3xitZ7V09hlGUpQn?=
 =?us-ascii?Q?qmeQChsEnelrMUrlE1B7eKelEh0u0oUKboyP0ZxcEnlzImekMhr1+POTNnnI?=
 =?us-ascii?Q?923iC5pLs4bcRRpjHPmRqj1swRHhLnlRPrWOSmeheb5MiCpoowzqzNL91KIi?=
 =?us-ascii?Q?gIokLW2wwmBuFCBTwel4uJQTXXFVgvGzMLB47eSXpFtVUDZlgU/18I3dVanU?=
 =?us-ascii?Q?5CVkI578jf9vqawv+n77cLpKLIB/sDUjlUsCO2Q3ijs1o5X2fFIdwdxltfdq?=
 =?us-ascii?Q?3EAIC1gG25dhfNbHX2Z9aAgwF8HM4AvUC/Obl67fqYapy+2jtA1fVJyBMFX5?=
 =?us-ascii?Q?0noUPBVzP8pPG5otMCRgjl0RcQG/5I5V0RVq48PB2FBIFH3cryeptFPWPWrU?=
 =?us-ascii?Q?mm3winAeRltdUUrE/XA/ak8nw29GnrjFOrXLwFIcR38IHyN4+mB0WB1p1ZQ9?=
 =?us-ascii?Q?y7qb7j9HX+cPNQ6f0iiwQ0VjGtJ6HjMrDPIdAsWAqrjQIsDHJZ/5HcquOwUg?=
 =?us-ascii?Q?8kSPKRZE1B0qggYZEYRcSNTMuQwipKZIubUvJhrd?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c25a4ab3-6699-4ffc-bff1-08db32197690
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Mar 2023 18:55:14.9799 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MA8aZzDqaXndydFkxnfQMm9MWA4tFoJOEj9RlS6AiRmZDfjS3gONDpAPslSMhiGHRtURxGO/Bd29Cqly2G6nLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB3999
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: > I guess we can cover all trylock w/ FAULT_LOCK_OP type
 fault
 injection, > rather than just cover f2fs_down_write_trylock(). > > Including:
 > - inode_trylock > - down_read_trylock > - down_write_tryl [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.113 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.113 listed in list.dnswl.org]
X-Headers-End: 1piJuE-00BARa-Ax
Subject: Re: [f2fs-dev] f2fs: support fault injection for
 f2fs_down_write_trylock()
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
Cc: jaegeuk@kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-kernel@vger.kernel.org, frank.li@vivo.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

> I guess we can cover all trylock w/ FAULT_LOCK_OP type fault injection,
> rather than just cover f2fs_down_write_trylock().
> 
> Including:
> - inode_trylock
> - down_read_trylock
> - down_write_trylock
> - mutex_trylock
> - sb_start_write_trylock
> - trylock_page
> 
> Bug only excluding f2fs_trylock_op which was covered by FAULT_LOCK_OP?

> What do you think?

Sounds great, the 3th has been sent.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
