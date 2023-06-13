Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47D6072DD12
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jun 2023 10:53:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1q8zmG-0000WP-KX;
	Tue, 13 Jun 2023 08:53:24 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <heyunlei@oppo.com>) id 1q8zmE-0000WJ-Tn
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 08:53:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nDS93DPhDN5ULBsF3WoR/o9cKItNLzIXPkMTHV0ui04=; b=KSHGuF15z0aheb5go4sQVGJ9cI
 dccQo3YJNjjLemuN1uRY4YcvtRj9JF0JlxPVfTjpHAJfhLaT+r+w8s0RHtSiq13dzeovCKfLf5/lq
 U5P7AQLoszIegaSFK7o9maVEWqoejPs6l43k+pLIBDzHkus8SNct7uCuOSUt5XVGd8r8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=nDS93DPhDN5ULBsF3WoR/o9cKItNLzIXPkMTHV0ui04=; b=g
 yrZjOEOtXhD03Xm1iUiwbuNKAy62WjictRxVN2DOI883XL/oh93HRdah0gnXOebLVrdvOs5/uqjfk
 N0x9mYEek2T1MBCldbtVaXyk1ZrXf6CBGj0vxJXgjB0XyEAt5fI33Zg0aYFt9CiUC8eEjvZYnt3Oc
 RShVYJx1isJwwaoE=;
Received: from mail-sgaapc01on2053.outbound.protection.outlook.com
 ([40.107.215.53] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1q8zmA-0001OB-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Jun 2023 08:53:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dZu4KjbjDHIMlbRcHdlVEl8w+3mZ+ail4gxtt8nX6w7Hlgi/bh+dpsk6mm8w7NpdUzZ4pjEg6D5c37qzBqVGmg622s4tMsTC1mi7WHTogikq/0evLPP7n/8/sqr3+GGH4y1oFMnEp52HqeW6U+wQp+Li6zjRvEDlQ1NT5iQ8ZNgnX6adibPu05mh9Elo8YKC5LDFwn8f5xaqoF5uIG9GTyMVUH1BNa0xw8AK6eLrWgZkZh1taEJAw+h/Z0yR+7KuGf+E0Td7cZ6uHnpTYnjE7FZ5+O2YDgxMr1x9xKBGMYpLATgMQch8oHG3yGn8nX+FBEaBM25Er4SeCsJIs/scSQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nDS93DPhDN5ULBsF3WoR/o9cKItNLzIXPkMTHV0ui04=;
 b=HNUOHTwPH98NWgyokQNvZgCcI+bvLsWTaOA+P6cfCoGhxFuWDiluc2nWPEiJE0udYJXXGZLBfkJbIVskMgY6Yt5eS9lHFhrRFziRIdmFXctvfHEFn4DjXgl5RqtvyQySwJQAvYJt24hom3Jc+QIIyEy0J5bKSVg3g75sra0/n4doZO/unrC/VAWk9oFW+UlSx+TpCoYw/xY1NW20/dxtTkVOiWxpM1CdoOeyI1al2vYI8NxiDxKpNxHRz5IlzudE59kzA79UdBkkbX/oOnnRXIWw8eCvTURkVOFQCmQR5e01T7F2rSMS2qxcYDiwIGlN0J2qBWiQDRb3cLJcuGLEzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nDS93DPhDN5ULBsF3WoR/o9cKItNLzIXPkMTHV0ui04=;
 b=iWFeCgJLLt748iJu/1eGEobvRgWPfsxBSYB5+LQxEjcftgE8A/cQddmfon6WcSy9An2U654cWF8RmNUqEYfL2VCzyZcw7AlZA8UaQXr0RDA0weZcJ8uahN+8DaQ9y85oJn6l58ZcX3FQXLqe1hMupGupikFKZVt9x+L2TG3g8B0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com (2603:1096:404:800e::7)
 by SI2PR02MB5049.apcprd02.prod.outlook.com (2603:1096:4:15e::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.21; Tue, 13 Jun
 2023 08:53:04 +0000
Received: from TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb]) by TY2PR02MB4479.apcprd02.prod.outlook.com
 ([fe80::bc4a:4d7a:4c73:76eb%4]) with mapi id 15.20.6500.020; Tue, 13 Jun 2023
 08:53:04 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 13 Jun 2023 16:52:50 +0800
Message-Id: <20230613085250.3648491-1-heyunlei@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To TY2PR02MB4479.apcprd02.prod.outlook.com
 (2603:1096:404:800e::7)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR02MB4479:EE_|SI2PR02MB5049:EE_
X-MS-Office365-Filtering-Correlation-Id: 6cad789d-0448-4d34-49f1-08db6beb99d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w4EQU7pyZWgNNhJNd/E55i81yDz1nZr7azW0WO4/WgvYhamTTuI7dnSNsVx67NhRlu6hOPBXWgbt8l5M85pI9gV+MKHIuZwPu2u0UvFSHP5LOgsIiLMsalHyDDoofMgjI3tClY1kQs9+UfXc6vIhh4qZJbUuVC+XWBZWT4bN8qm13Awjd/Sc6fKkDaz0XllefhQx7Z8xixuE+awrbG5haPoQeUiE5zTz303US8Um7gKm0F729Y74rNTb4d8HzfBYWt2apU4VHZzXCHHXqF067nAntYw/zksirdKfGStd0wgTct6m0scZCkKKzKsbBlmi3hLlTWEGomUsTO1Xn8R2XfaeT6ztOUmSyZyuQzmqUPYFbfcGLxC0+LyPuiKYE90eTz2Ytpdc/oQ5DfKXbcm2Imdrxzo1R9SI7gQhDqIc2xmgUzkZTwITPkVU1MJnYCxBg2n6bY5cYD5QCjamkTU4uNXMwfjOBqOAK2T3MV6I5aaUM5fpQjzFApFzqvo21IZM+1T0YxFqXM66Pl50IYyq70+liwGmcXtipQAn7iygw5asTDBPwh5VV2o+vov0gzDqRdEqvXavg1GlBu41v832TOAMKLkL71Swa7qNw3Va05UWn/iSzN0vvTATl3IJkOnD
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR02MB4479.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230028)(4636009)(39860400002)(376002)(346002)(136003)(366004)(396003)(451199021)(5660300002)(66946007)(66556008)(4326008)(8936002)(8676002)(41300700001)(316002)(186003)(2906002)(478600001)(66476007)(6666004)(107886003)(52116002)(6486002)(1076003)(6512007)(6506007)(26005)(83380400001)(36756003)(86362001)(2616005)(38350700002)(38100700002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cHGUxKSQqBMZD7f4l7B9MjdHLUtJKbKKebfOgUVE8yFipjrq2krRYGXBmryk?=
 =?us-ascii?Q?mbMQ9TlRJSaYxWKhJgOhiyaxjoNl9gVT0Xyoo5qwYIOCZyKzFDEv5Aw5Dgzy?=
 =?us-ascii?Q?fiCyb1+DdUGP85Vyw4Et6Unna7xCMvKORrc5Spi+2NRI5nof7bHGKcjY7MNx?=
 =?us-ascii?Q?/a91YDHiATqmCs74EPuZGDpsXkkH4y8QaKyI7L0yWtBSFkjtSX6o/8UzGJFp?=
 =?us-ascii?Q?WbA03EvEkIC7eoIb4znCaUJIKl8oW2tJJp+hlfm1a9p6bX+kh+8pKKEhP2P4?=
 =?us-ascii?Q?uLW0P2O78cHg7h/NDpLgLjuXu/DNm+xDHtkzGHli3CnBVu+zgltjAAJG0pjh?=
 =?us-ascii?Q?XvvaxdtvZXXylcFZwb/OCblHEv+KUyRwRKgGoaMfwDQHZfk4TKV1sxaSO0AS?=
 =?us-ascii?Q?g4DVP972SFImFdJlWjTR7CIeJg7O3bf7M/eRraqW0qj3ipMANojmSyIWmDyN?=
 =?us-ascii?Q?CvspLu81z5eMVp83HhiewSOnGm3hCCcdYKBOIjSfh/cLmDhQ68OP2tc8WRSz?=
 =?us-ascii?Q?B/qX7qU2RI3IVoPKlMC36sihBolnP2WFFujIw1qSBHR1ap7ICQ1xREorVjOY?=
 =?us-ascii?Q?y8OMHakipVRq2IaEIRIIyh3v5IQekIkLSQZT5cr4lzmrmGdoYtO/IysAuVrC?=
 =?us-ascii?Q?KQpX/kpgQyIm8CEox/AWLLBIcvMsKFgv4yE/uETU5EIpug+yhHxe/mES9+YU?=
 =?us-ascii?Q?6W+pQRs3DzZ5APd043mPpXiooTw2wOLH5jXZ64TSogPUhcUH44eMKSrQ/TDt?=
 =?us-ascii?Q?OpxUTrHSb7EST5E44mGvjdrQg98XTCRz5SyoQxg95AWb35GwAe+Jr3aTFdAz?=
 =?us-ascii?Q?uq3iXZRkpho4biS8bylUVJ1SGzw1CBwTusSHMBIa7UMoTdNfKTZBm4qmDX2m?=
 =?us-ascii?Q?4YRbnIA3hyB8wBem+mbZ21P7FACRpvG0L8MUc5nEbwuNxrdSqDu2KbprorF3?=
 =?us-ascii?Q?oM3+0FXbTNIRWzogT3idd04xcZihyvX4V1MOOFfsWtYnKmZr6dwzPLK4qfxY?=
 =?us-ascii?Q?QE9uTpSvdb+XlwoS3y+CiqVYR6o1pj1tbtdoSOvTR3jV2qZKqULrhswboVXE?=
 =?us-ascii?Q?sCIexXqlr1AYE/2wd3hyip+nSYBH13ewzDCp30360cMGMhZAQbIbJAeTj9CN?=
 =?us-ascii?Q?bOIGrUyvxpbWUDO1d8tRRBVgNoID5lg8ZcibHiENyw4F75irkDiar2QxEmnO?=
 =?us-ascii?Q?FkQZU6yv1RIv8hv+qJhz1JqKMRIP/CnRtHA5aN7XpoSjZH/V6XKNuPcikZFf?=
 =?us-ascii?Q?0XX1Dan6ccC1c1Smm1f256Fsa8i4jm6MnT8nHlhFWXdoWeoms2afyFgP0m2H?=
 =?us-ascii?Q?lbKmIpFe8qOs6S0kv3D1t0gjYNJ5jfEmFa45X+MTIr+OMqd8EFXEyac4wwt6?=
 =?us-ascii?Q?YACvnnBgyX67OaM1vvbZVAe+Fu39FlHVgOnNMtrGksqCgxJD/BEYpJ1JoCBg?=
 =?us-ascii?Q?JwGl6/Fm2tZpZ63r3kO50Y7jSY3NHv010AOsyA/qVhcPFt3xElehGRv/XBPF?=
 =?us-ascii?Q?TLbHwgPJz3XRBTZRhBSbAJCLmaA3Xe2W92Agf7MZ9ZXIFYd8kVckORVxamSC?=
 =?us-ascii?Q?Ml5U+W1xnleVX++sD/FdTd5P8n8ukHw5AFxAP7Vc?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6cad789d-0448-4d34-49f1-08db6beb99d6
X-MS-Exchange-CrossTenant-AuthSource: TY2PR02MB4479.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jun 2023 08:53:04.8135 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvbMWNE8gsyqYHAzzE8+WSxHJ/Z++KHGB+Lb8CFYfY+xDK52YWTST8GySbWMurg/ABsGvRgS3Au9S1U7AUqYJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5049
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  File set both cold and hot advise bit is confusion, so return
 EINVAL to avoid this case. Signed-off-by: Yunlei He <heyunlei@oppo.com> ---
 fs/f2fs/xattr.c | 3 +++ 1 file changed,
 3 insertions(+) diff --git a/fs/f2fs/xattr.c
 b/fs/f2fs/xattr.c index 213805d3592c..917f3ac9f1a1 100644 ---
 a/fs/f2fs/xattr.c +++ b/fs/f2fs/xattr.c @@ -127, 6 +127,
 9 @@ static int f2fs_xattr_advise_set(const struct xat [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1q8zmA-0001OB-Nx
Subject: [f2fs-dev] [PATCH] f2fs: not allowed to set file both cold and hot
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
From: Yunlei He via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yunlei He <heyunlei@oppo.com>
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

RmlsZSBzZXQgYm90aCBjb2xkIGFuZCBob3QgYWR2aXNlIGJpdCBpcyBjb25mdXNpb24sIHNvCnJl
dHVybiBFSU5WQUwgdG8gYXZvaWQgdGhpcyBjYXNlLgoKU2lnbmVkLW9mZi1ieTogWXVubGVpIEhl
IDxoZXl1bmxlaUBvcHBvLmNvbT4KLS0tCiBmcy9mMmZzL3hhdHRyLmMgfCAzICsrKwogMSBmaWxl
IGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAtLWdpdCBhL2ZzL2YyZnMveGF0dHIuYyBi
L2ZzL2YyZnMveGF0dHIuYwppbmRleCAyMTM4MDVkMzU5MmMuLjkxN2YzYWM5ZjFhMSAxMDA2NDQK
LS0tIGEvZnMvZjJmcy94YXR0ci5jCisrKyBiL2ZzL2YyZnMveGF0dHIuYwpAQCAtMTI3LDYgKzEy
Nyw5IEBAIHN0YXRpYyBpbnQgZjJmc194YXR0cl9hZHZpc2Vfc2V0KGNvbnN0IHN0cnVjdCB4YXR0
cl9oYW5kbGVyICpoYW5kbGVyLAogICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CgogICAg
ICAgIG5ld19hZHZpc2UgPSBuZXdfYWR2aXNlICYgRkFEVklTRV9NT0RJRklBQkxFX0JJVFM7Cisg
ICAgICAgaWYgKChuZXdfYWR2aXNlICYgRkFEVklTRV9DT0xEX0JJVCkgJiYgKG5ld19hZHZpc2Ug
JiBGQURWSVNFX0hPVF9CSVQpKQorICAgICAgICAgICAgICAgcmV0dXJuIC1FSU5WQUw7CisKICAg
ICAgICBuZXdfYWR2aXNlIHw9IG9sZF9hZHZpc2UgJiB+RkFEVklTRV9NT0RJRklBQkxFX0JJVFM7
CgogICAgICAgIEYyRlNfSShpbm9kZSktPmlfYWR2aXNlID0gbmV3X2FkdmlzZTsKLS0KMi40MC4x
CgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpPUFBPCgrmnKznlLXlrZDpgq7ku7bl
j4rlhbbpmYTku7blkKvmnIlPUFBP5YWs5Y+455qE5L+d5a+G5L+h5oGv77yM5LuF6ZmQ5LqO6YKu
5Lu25oyH5piO55qE5pS25Lu25Lq677yI5YyF5ZCr5Liq5Lq65Y+K576k57uE77yJ5L2/55So44CC
56aB5q2i5Lu75L2V5Lq65Zyo5pyq57uP5o6I5p2D55qE5oOF5Ya15LiL5Lul5Lu75L2V5b2i5byP
5L2/55So44CC5aaC5p6c5oKo6ZSZ5pS25LqG5pys6YKu5Lu277yM5YiH5Yu/5Lyg5pKt44CB5YiG
5Y+R44CB5aSN5Yi244CB5Y2w5Yi35oiW5L2/55So5pys6YKu5Lu25LmL5Lu75L2V6YOo5YiG5oiW
5YW25omA6L295LmL5Lu75L2V5YaF5a6577yM5bm26K+356uL5Y2z5Lul55S15a2Q6YKu5Lu26YCa
55+l5Y+R5Lu25Lq65bm25Yig6Zmk5pys6YKu5Lu25Y+K5YW26ZmE5Lu244CCCue9kee7nOmAmuiu
r+Wbuuaciee8uumZt+WPr+iDveWvvOiHtOmCruS7tuiiq+aIqueVmeOAgeS/ruaUueOAgeS4ouWk
seOAgeegtOWdj+aIluWMheWQq+iuoeeul+acuueXheavkuetieS4jeWuieWFqOaDheWGte+8jE9Q
UE/lr7nmraTnsbvplJnor6/miJbpgZfmvI/ogIzlvJXoh7TkuYvku7vkvZXmjZ/lpLHmpoLkuI3m
ib/mi4XotKPku7vlubbkv53nlZnkuI7mnKzpgq7ku7bnm7jlhbPkuYvkuIDliIfmnYPliKnjgIIK
6Zmk6Z2e5piO56Gu6K+05piO77yM5pys6YKu5Lu25Y+K5YW26ZmE5Lu25peg5oSP5L2c5Li65Zyo
5Lu75L2V5Zu95a625oiW5Zyw5Yy65LmL6KaB57qm44CB5oub5o+95oiW5om/6K+677yM5Lqm5peg
5oSP5L2c5Li65Lu75L2V5Lqk5piT5oiW5ZCI5ZCM5LmL5q2j5byP56Gu6K6k44CCIOWPkeS7tuS6
uuOAgeWFtuaJgOWxnuacuuaehOaIluaJgOWxnuacuuaehOS5i+WFs+iBlOacuuaehOaIluS7u+S9
leS4iui/sOacuuaehOS5i+iCoeS4nOOAgeiRo+S6i+OAgemrmOe6p+euoeeQhuS6uuWRmOOAgeWR
mOW3peaIluWFtuS7luS7u+S9leS6uu+8iOS7peS4i+ensOKAnOWPkeS7tuS6uuKAneaIluKAnE9Q
UE/igJ3vvInkuI3lm6DmnKzpgq7ku7bkuYvor6/pgIHogIzmlL7lvIPlhbbmiYDkuqvkuYvku7vk
vZXmnYPliKnvvIzkuqbkuI3lr7nlm6DmlYXmhI/miJbov4flpLHkvb/nlKjor6XnrYnkv6Hmga/o
gIzlvJXlj5HmiJblj6/og73lvJXlj5HnmoTmjZ/lpLHmib/mi4Xku7vkvZXotKPku7vjgIIK5paH
5YyW5beu5byC5oqr6Zyy77ya5Zug5YWo55CD5paH5YyW5beu5byC5b2x5ZON77yM5Y2V57qv5Lul
WUVTXE9L5oiW5YW25LuW566A5Y2V6K+N5rGH55qE5Zue5aSN5bm25LiN5p6E5oiQ5Y+R5Lu25Lq6
5a+55Lu75L2V5Lqk5piT5oiW5ZCI5ZCM5LmL5q2j5byP56Gu6K6k5oiW5o6l5Y+X77yM6K+35LiO
5Y+R5Lu25Lq65YaN5qyh56Gu6K6k5Lul6I635b6X5piO56Gu5Lmm6Z2i5oSP6KeB44CC5Y+R5Lu2
5Lq65LiN5a+55Lu75L2V5Y+X5paH5YyW5beu5byC5b2x5ZON6ICM5a+86Ie05pWF5oSP5oiW6ZSZ
6K+v5L2/55So6K+l562J5L+h5oGv5omA6YCg5oiQ55qE5Lu75L2V55u05o6l5oiW6Ze05o6l5o2f
5a6z5om/5ouF6LSj5Lu744CCClRoaXMgZS1tYWlsIGFuZCBpdHMgYXR0YWNobWVudHMgY29udGFp
biBjb25maWRlbnRpYWwgaW5mb3JtYXRpb24gZnJvbSBPUFBPLCB3aGljaCBpcyBpbnRlbmRlZCBv
bmx5IGZvciB0aGUgcGVyc29uIG9yIGVudGl0eSB3aG9zZSBhZGRyZXNzIGlzIGxpc3RlZCBhYm92
ZS4gQW55IHVzZSBvZiB0aGUgaW5mb3JtYXRpb24gY29udGFpbmVkIGhlcmVpbiBpbiBhbnkgd2F5
IChpbmNsdWRpbmcsIGJ1dCBub3QgbGltaXRlZCB0bywgdG90YWwgb3IgcGFydGlhbCBkaXNjbG9z
dXJlLCByZXByb2R1Y3Rpb24sIG9yIGRpc3NlbWluYXRpb24pIGJ5IHBlcnNvbnMgb3RoZXIgdGhh
biB0aGUgaW50ZW5kZWQgcmVjaXBpZW50KHMpIGlzIHByb2hpYml0ZWQuIElmIHlvdSBhcmUgbm90
IHRoZSBpbnRlbmRlZCByZWNpcGllbnQsIHBsZWFzZSBkbyBub3QgcmVhZCwgY29weSwgZGlzdHJp
YnV0ZSwgb3IgdXNlIHRoaXMgaW5mb3JtYXRpb24uIElmIHlvdSBoYXZlIHJlY2VpdmVkIHRoaXMg
dHJhbnNtaXNzaW9uIGluIGVycm9yLCBwbGVhc2Ugbm90aWZ5IHRoZSBzZW5kZXIgaW1tZWRpYXRl
bHkgYnkgcmVwbHkgZS1tYWlsIGFuZCB0aGVuIGRlbGV0ZSB0aGlzIG1lc3NhZ2UuCkVsZWN0cm9u
aWMgY29tbXVuaWNhdGlvbnMgbWF5IGNvbnRhaW4gY29tcHV0ZXIgdmlydXNlcyBvciBvdGhlciBk
ZWZlY3RzIGluaGVyZW50bHksIG1heSBub3QgYmUgYWNjdXJhdGVseSBhbmQvb3IgdGltZWx5IHRy
YW5zbWl0dGVkIHRvIG90aGVyIHN5c3RlbXMsIG9yIG1heSBiZSBpbnRlcmNlcHRlZCwgbW9kaWZp
ZWQgLGRlbGF5ZWQsIGRlbGV0ZWQgb3IgaW50ZXJmZXJlZC4gT1BQTyBzaGFsbCBub3QgYmUgbGlh
YmxlIGZvciBhbnkgZGFtYWdlcyB0aGF0IGFyaXNlIG9yIG1heSBhcmlzZSBmcm9tIHN1Y2ggbWF0
dGVyIGFuZCByZXNlcnZlcyBhbGwgcmlnaHRzIGluIGNvbm5lY3Rpb24gd2l0aCB0aGUgZW1haWwu
ClVubGVzcyBleHByZXNzbHkgc3RhdGVkLCB0aGlzIGUtbWFpbCBhbmQgaXRzIGF0dGFjaG1lbnRz
IGFyZSBwcm92aWRlZCB3aXRob3V0IGFueSB3YXJyYW50eSwgYWNjZXB0YW5jZSBvciBwcm9taXNl
IG9mIGFueSBraW5kIGluIGFueSBjb3VudHJ5IG9yIHJlZ2lvbiwgbm9yIGNvbnN0aXR1dGUgYSBm
b3JtYWwgY29uZmlybWF0aW9uIG9yIGFjY2VwdGFuY2Ugb2YgYW55IHRyYW5zYWN0aW9uIG9yIGNv
bnRyYWN0LiBUaGUgc2VuZGVyLCB0b2dldGhlciB3aXRoIGl0cyBhZmZpbGlhdGVzIG9yIGFueSBz
aGFyZWhvbGRlciwgZGlyZWN0b3IsIG9mZmljZXIsIGVtcGxveWVlIG9yIGFueSBvdGhlciBwZXJz
b24gb2YgYW55IHN1Y2ggaW5zdGl0dXRpb24gKGhlcmVpbmFmdGVyIHJlZmVycmVkIHRvIGFzICJz
ZW5kZXIiIG9yICJPUFBPIikgZG9lcyBub3Qgd2FpdmUgYW55IHJpZ2h0cyBhbmQgc2hhbGwgbm90
IGJlIGxpYWJsZSBmb3IgYW55IGRhbWFnZXMgdGhhdCBhcmlzZSBvciBtYXkgYXJpc2UgZnJvbSB0
aGUgaW50ZW50aW9uYWwgb3IgbmVnbGlnZW50IHVzZSBvZiBzdWNoIGluZm9ybWF0aW9uLgpDdWx0
dXJhbCBEaWZmZXJlbmNlcyBEaXNjbG9zdXJlOiBEdWUgdG8gZ2xvYmFsIGN1bHR1cmFsIGRpZmZl
cmVuY2VzLCBhbnkgcmVwbHkgd2l0aCBvbmx5IFlFU1xPSyBvciBvdGhlciBzaW1wbGUgd29yZHMg
ZG9lcyBub3QgY29uc3RpdHV0ZSBhbnkgY29uZmlybWF0aW9uIG9yIGFjY2VwdGFuY2Ugb2YgYW55
IHRyYW5zYWN0aW9uIG9yIGNvbnRyYWN0LCBwbGVhc2UgY29uZmlybSB3aXRoIHRoZSBzZW5kZXIg
YWdhaW4gdG8gZW5zdXJlIGNsZWFyIG9waW5pb24gaW4gd3JpdHRlbiBmb3JtLiBUaGUgc2VuZGVy
IHNoYWxsIG5vdCBiZSByZXNwb25zaWJsZSBmb3IgYW55IGRpcmVjdCBvciBpbmRpcmVjdCBkYW1h
Z2VzIHJlc3VsdGluZyBmcm9tIHRoZSBpbnRlbnRpb25hbCBvciBtaXN1c2Ugb2Ygc3VjaCBpbmZv
cm1hdGlvbi4KCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNv
dXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5m
by9saW51eC1mMmZzLWRldmVsCg==
