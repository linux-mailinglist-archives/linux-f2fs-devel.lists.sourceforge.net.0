Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CC4B96C0B27
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 20 Mar 2023 08:12:17 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pe9gi-0007Gh-C2;
	Mon, 20 Mar 2023 07:12:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pe9gf-0007GN-Me
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 07:12:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=KzjxnsJbJDnjGik/CxYLa2sqgyThkXSxTjJWJGKdsro=; b=Xg00k2+2iyFL5P0qyBJUJptVdC
 jVUkz3phBzITwyebyhaH1mKvv7hEQu7F05MMCQ4P21LsywMPSeTsUERxqw2WZdeQ7FV8tpn1NnWrq
 r9qADGirQs+OVZeJbu5OqBCMU83GUr+t2RgPTBeszF3I7BmTMRQYIhWc4aT7ZpUO9WdU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=KzjxnsJbJDnjGik/CxYLa2sqgyThkXSxTjJWJGKdsro=; b=TgaYEkY5Nev7GD3WBMyhaYr16p
 7eY114/iRotPPyCPIzsM/IfW701nTwlfUCtrIbT51evkB+3/Sy1TcfCDP1vplQf0S3oN3xi4Zy/WZ
 1gRctxd/PnRfJm2jyBGkGzuIormBYy8YPsJp81TrEqidI6cFXcH8jmhs2f2AdFfrC0Wk=;
Received: from mail-tyzapc01on2129.outbound.protection.outlook.com
 ([40.107.117.129] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pe9ga-00E2zm-QG for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 20 Mar 2023 07:12:10 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=DWbsmDz3Q2K6OARrdihhP2RXNeHBtlqd0FyhX8t0Ftfxsfz690J7WssQIhXEafh38/G6PBwqTMDCAZgbF5oLViI9TyPMNc1o1EhzJgpPw6APONSvcCeD0J/tarxnNg3lh9Uz4429NejRK96xTehgNHxW+e3Tj66WfK50a/X57teBI/omiqvUt0L889RD+xKXor26OrVCl6J0XI/JAn8riuUT10tqz8lW4JL1vnpyi94njttvOdyBEAdrBT1WfXnZ6F7jb+dQ6NwugTCyJO+QWAVRPrjDyupuF9Mn1xYnLRR9AHpBefcljeq3+2w7wbRCmUxtxmV+vxV71ewU/P3/cA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=KzjxnsJbJDnjGik/CxYLa2sqgyThkXSxTjJWJGKdsro=;
 b=SYpubDVv+6QdDc6XT0SqYSP+2skv9qGiIrvqUY4pPJs3T2lI7i9A7EXA3fICict/jBKB5+Y2FUd7pmjKasaSpJTSgXNUofaA0GswUGycTxmq1g5+jT4OQFtqY4Ih7RSkzYwLqQWlaIGPBTPmYU62b/zjejpq1wsSvsw0Lqyb4bfnobSGaijHplSLzn/NHci5jTl8sOpzjR0Tq7Tkn66tOfnqdtxJwzT1rRqE23fUQ6Cz3VHXFPT+jzDI+3jMRq0l1D6BRL6JvAjSVaaIJ/fBWFpLkI/x/j+YnvEJKx4EC059BzhYTmNgw3sVyJIaW2ctWJMBqGNey4Z+d3CmCVHG1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=KzjxnsJbJDnjGik/CxYLa2sqgyThkXSxTjJWJGKdsro=;
 b=NVgS6ISxsXSX+v87J+SfF9KPotarq2icOckIsyABALk7Wy8+QewHEoZtAAoqvpHH3+s68XkUl7LOHbtNueev0cHNtfneMNVJJB4BA90Iib1r716fwuK4Nb8IQMH85ALYcDyzkv0pVMKK59CA4W+r6zobl0YEg+57SzYCduvfsCiYcVRzN8uXNRhcxy8twqxdusEqi/PYLI8Ps8XQyBooOZHH0r61sFkmNAF+pRGVCofq0Q94fFc3YdCsRVscl+aZmlIdj+n5Ixpy+ofPJ8711kU5Iadhl1vNF2yUjZZt9ye33hfqMCl0YwBNAZ3g8EGDrCNtANPABpuSYvV/sfv4Dw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TY0PR06MB5404.apcprd06.prod.outlook.com (2603:1096:400:219::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6178.37; Mon, 20 Mar
 2023 07:11:54 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%9]) with mapi id 15.20.6178.037; Mon, 20 Mar 2023
 07:11:53 +0000
To: clm@fb.com, josef@toxicpanda.com, dsterba@suse.com, xiang@kernel.org,
 chao@kernel.org, huyue2@coolpad.com, jefflexu@linux.alibaba.com,
 jaegeuk@kernel.org, trond.myklebust@hammerspace.com, anna@kernel.org,
 konishi.ryusuke@gmail.com, mark@fasheh.com, jlbec@evilplan.org,
 joseph.qi@linux.alibaba.com, richard@nod.at, djwong@kernel.org,
 damien.lemoal@opensource.wdc.com, naohiro.aota@wdc.com, jth@kernel.org,
 gregkh@linuxfoundation.org, rafael@kernel.org
Date: Mon, 20 Mar 2023 15:11:40 +0800
Message-Id: <20230320071140.44748-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <e4b8012d-32df-e054-4a2a-772fda228a6a@opensource.wdc.com>
References: <e4b8012d-32df-e054-4a2a-772fda228a6a@opensource.wdc.com>
X-ClientProxiedBy: SI2PR02CA0032.apcprd02.prod.outlook.com
 (2603:1096:4:195::12) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TY0PR06MB5404:EE_
X-MS-Office365-Filtering-Correlation-Id: e5f02840-b284-4bc3-6d9d-08db29126199
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: muTGT43VaeByLyLoRi9XhUb95SqH3+kLWxBVtPkJutQTCu+mkxnxvPwmOqwWlwk6+1X/S4GtfvZKc6YTilz/CGe8wkqp76Zect5yfo+VmEw/hUQ7mbZdWFtUmF3eFYD6zNR4DyiKMyhQ5wN4CiaQhtQoEcMK+dsEBYKaIOEsJtHSQzx0o21fTV/rNxZuCuRxr7MgYGH38LqclXy31VjU0PIYeUPD+bfPhpAvIT7mUjTuYhUPZnzcICKlOutlFoOo09yumhEULB+5Gd+IQ1mB7SESlZnZqw30BZ4NvLaBqi4z5kNKCscRkvtNE4PuzbSAbFghtzunHVTAjx4OuuHyt+coAieP9/7luf0kXq/nQCdl977y+S1IFsT4y2Ab7Rho2hI5DSFw3XsAJb9Vg31TC7fcROrMEIPgyDaBdLdsF4BJcGrQCYgb2+IZTFVslQOc0X6hiMZur1mo0PyOFA3t3gnBaV8URIR645vgB1j7xGuZk8W514QMe3r5dlC9h9X9vdssphRMa5xIUU1WHi4JVdpnrfRE2SZRFkS8LiUVWnAI+YtTS3mIXVvoFgjDKb1+5QZYrw/qQ8mxmE9u0gTmN8ofs9cOQTPRZ2yb9t64ZbU/NKHJKU0VfuKAoxes+Upp0tcXHQlCH5DfxJt2ZXqrUurqj2uDs58vbD5WXbRssx8JX7nMNmfD05HR0lg/+GPc5b1jXHBwm5+K9IMfdV6Ljhv/qBk5s/GIXGo/BU+BtT0=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(366004)(346002)(39860400002)(396003)(136003)(376002)(451199018)(921005)(2616005)(186003)(38350700002)(38100700002)(2906002)(26005)(6506007)(1076003)(6512007)(6666004)(5660300002)(7406005)(7416002)(8936002)(36756003)(66946007)(41300700001)(6486002)(86362001)(52116002)(66476007)(8676002)(66556008)(4326008)(558084003)(478600001)(316002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?B7n0Da0DhxzRtFoYUJL/KqTvnb5Kl12fMVAwapWeNNKrE/fiE1K5hCTezkcl?=
 =?us-ascii?Q?JX24k8pHJnk/UyBFocGSLkTpQjt0Rt13zqmWTKchDaNBMZ3JPm3BSS+GqCx6?=
 =?us-ascii?Q?bKFmo9gNmfRQ2Qcskja05hLxD9EmNSyYuyO7QO3WHz/+SrRULS8mSEDMGvpH?=
 =?us-ascii?Q?n0SaM03XB/+p6x6u822GSmUgCu2f90jIZGbMiC9mgo3fATiirLJKsI4RjToP?=
 =?us-ascii?Q?YEOw25AeQlMwZIkX3d4cqcP+erFelQWQHSW+dujWaoYXD4WSwTyCLBcihX9L?=
 =?us-ascii?Q?o/4tqu9jppaNodlscJXfRxYtniTFhGL2oCWOIYo3t/aYRyZ+QuoUMiVPZclC?=
 =?us-ascii?Q?oxGbPRdruI8zh62PR4UwLPGyZnF4BQ/GmPBOmqOxx4Cnq0VtLn5QSKNwROaZ?=
 =?us-ascii?Q?ltxV9NOUrCB1i0lc2qymhaUPkLnzBzpiFJyqcr+cA+WxxRocV3fUzJ2Cumra?=
 =?us-ascii?Q?TGkDUKXG9Nwpdoge9dlhhJC3I6IVaVjh0OnXa0Rf8iYLY9XI9dQ8tcLl0OES?=
 =?us-ascii?Q?qRWL8tKY3tqsrfAAqAYPuL5Dq2ssrV7ST8IdyoPKAdBuu+594Ho19G1R+nE8?=
 =?us-ascii?Q?SvObTMOUVDHJokkeuC6ljZvZ5G1P3R7N0KYNTNhoCuYt7WOH4nzk0JruTboT?=
 =?us-ascii?Q?99JSBgwFohch0eDiEnOYptLBTglB9yuDLI9rxGWj80/y5bz3kdxlteYyNkAl?=
 =?us-ascii?Q?MNGnYvlMU2znIe7MrjAnohPT5Mrd17ZjiOPFo7xIXOD1iTN2CBfy3SprW0DG?=
 =?us-ascii?Q?UMTqGGRV2+Gaq2TinYv0Vf4WXfOOpXetDQoHhtJDFVnSEgdG3QzK61xkX2hJ?=
 =?us-ascii?Q?m2J/u3hxsJ/5wF4Lknf7MxtRPWsH+8i+NaE+cnC0zljBSufI+c09qNOU1UlU?=
 =?us-ascii?Q?C9VK8O1clRjzKeH618hpMu8ePTi3RE4rLToCKdnsbJzEzq/yQPhPOMDrz7PF?=
 =?us-ascii?Q?a/g8VddAAPYDmf1GXl1s8feW/al3LGWukRV3GkPOHJzgxGNkF9my9lTemMUO?=
 =?us-ascii?Q?AHij04vSkBqzyat1tERgX+k+KuMNOnRQeovPSf9gnwu6+c3ostCgPvM10NY4?=
 =?us-ascii?Q?K+iVZaiB16uCSUTngTYg3kWP/llKcdO7geoS8A78a9xK+0oZ3fKkCketqtzu?=
 =?us-ascii?Q?PgkUomOwQi4lUlPPAP/R/6Lc9MndjZfBW3Mp6tYmO7YfGlBCWRk9nxztdeIl?=
 =?us-ascii?Q?T6FLgPtTgXjWEjXdK0VdkWsmnTB3eGtPNFV5FJbRJCYfCYgxXw2A5d0idHiF?=
 =?us-ascii?Q?mbp0DvuOKHFcO21PmaE233e+D6Dms/6gt+jIHi+d0UB8XAw7ekbSCG7v3730?=
 =?us-ascii?Q?O/N39KvHhFeXb7ucuV9sYBCQ5c1JnrMU4eG4xyf0zSxbVHKbMvgd49Z91PeO?=
 =?us-ascii?Q?/dA0cJBvo4utUXmPES8kwFJWTert0qkqjMDamMos/XsXcW1slBLgojaMXyN2?=
 =?us-ascii?Q?MDS2xAwE+Yd0Si8/2Rb2fI5nYBxmKNLcTCYB4raQNTXgbSoGFrTDGMiRQi8E?=
 =?us-ascii?Q?Ng4XzZWTiEyWJYDVdE8e7OZ/AYTGntu6+zQpN1OtOwOEu8TIfklbYAqY3ZGN?=
 =?us-ascii?Q?h2ngCvK9l049u3DIAw4tk66KAJeSlOpStjP7sx7I?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e5f02840-b284-4bc3-6d9d-08db29126199
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Mar 2023 07:11:53.0714 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VGrfEB+l2SQXH2mcjspX3Dbqw/v/TG9H0vVdwARvjipXXCI6KYTfJ6RZA4qYyXPJjbfGoePhxW77KortzoGmdQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5404
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi filesystem maintainers, > Hard to comment on patches with
 this. It is only 10 patches. So send everything please. If you are interested
 in the entire patchset besides Damien, please let me know. I'll resend the
 email later to cc more people. 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.117.129 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.129 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.129 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1pe9ga-00E2zm-QG
Subject: Re: [f2fs-dev] [PATCH v2,
 RESEND 01/10] kobject: introduce kobject_del_and_put()
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
Cc: linux-nfs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-xfs@vger.kernel.org, linux-mtd@lists.infradead.org,
 ocfs2-devel@oss.oracle.com, linux-fsdevel@vger.kernel.org,
 linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi filesystem maintainers,

> Hard to comment on patches with this. It is only 10 patches. So send everything please.

If you are interested in the entire patchset besides Damien,
please let me know. I'll resend the email later to cc more people.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
