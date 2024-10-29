Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 87A949B493E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:57 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4l-00041E-LN;
	Tue, 29 Oct 2024 12:11:55 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4j-00040t-PJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9gaeeyoWSMZw/seYyRPGWc2ZHsFetQXQ8xGniI8bokw=; b=ISKGlVsGGW4+3HEkfZVD8GjMzG
 DaxHouwyVbpsByBjSwoNQhZk3TCegGRutBzyODwHN3dDlg654DUtuHxik9zzQoM7mw02aOvrWi94H
 xf1colhPaw++vySPZMgM20W6cds9mSYUl2ytmnBhafElv9K8entsDvQPpt7vWVfirQ80=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9gaeeyoWSMZw/seYyRPGWc2ZHsFetQXQ8xGniI8bokw=; b=PZrYP3daitlm0lw9YKce5TnKu+
 mUiyGMnC0WdLO3wEfg8lh2OLmj2DGT13cfj8GULd7AJhz90Q4A0TKtNXRchPn7I/971SjlSXsDx0I
 MUOi2puO/kdcWN+E9aR/k20BjXuSItsvV9VR6yS6ZChFk1eU4m4hYZmFpNurU8Xl1/Qo=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4j-0007R0-1Z for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PN9BZ2FAIHme21stJOevS37B7QIUPaO24HKWYFp8L44tkicxIyeJQh/OAifBWlFURUOpj+yNVZZDyKDl4AZsyFpkgOVSTDQ5UPTso7XjkgCXuWLDLPFn5qsKxxPPwOxVrihSZLJCMg1xsFZYSHwTVr5o2imwDd/bLiLuTePmuEjNe/xrrqPSaSwXTb98LSzATQtH7gk4zEK6gkUbofYzQRVQ5NVjDQXjC75Sb9WqHHoNuUBJ+t6xrRMiwTwqCB8bLICt8mHZL380sYIi/GnsPb+FWfs02PEm2oJfPCEqLSB5MsbH3cmOSPXHYwy6QMltIssYGMJ75KVhKxChSjJSPw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9gaeeyoWSMZw/seYyRPGWc2ZHsFetQXQ8xGniI8bokw=;
 b=Ih75bhI5g5MFjelGookJ2wkjDjpnRNxM6WMo5gU9L68z6+Ck4WPrSkQ+mMsDrobFB2cPPPqBukDHUUNGaPccaLsAoZ1DZvQ1yyV4Mrq6MoiHpNEd/aG8MZq63gRZwT8dFxvHY1AX7d6vphvfrEKN7I6o46ymlgk5JfItOcipLU5Yy9qoKtMvRsrvi6N0koYU1ooXRagbx4s4GxSzf3MwU7nX0Ddv0qKi2NZ0gnmKgdq5jAhiSRFjMoQpC/vOZN9YXfxvmf41DQ1Mkk02i1M3re2IqQ9mhmuHguPJe9SjEJoG9+S16R8zcqXlPorWMWjP70Uzd4O/oQ6VdDfjVgL5vA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9gaeeyoWSMZw/seYyRPGWc2ZHsFetQXQ8xGniI8bokw=;
 b=rqZ/+qUJ6l7odIx6ZP456PXJ+txkZX+ckyuV0HCJ8/X8vnlCxRUCkNBQRO/TVvw5/mjnLUJv4KHW1nZddp/cctMJFsBgdw0AKWZcp3kb4nJPY5X4P17B4KZZEzF2te6SFEkaNAj5UKjf1A+sDHvL33nK1I3fzIoDIb87+xIos9E=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:38 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:38 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:41 +0800
Message-Id: <20241029120956.4186731-10-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 530ec866-453c-427e-4102-08dcf812d71e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zd9qLz0AQl1VYqVkf1Dy3drsMLEntmM4HsNxc7abyxAl7LEO/+q92OIVASiS?=
 =?us-ascii?Q?CeUBPglIZMcWMDvFTmd9d8bI4OS+i79BbuGTYDqcdMc4gaaaOQqkvYQAQeWL?=
 =?us-ascii?Q?zgvxFj8/eYOa7fa7Tj1K97pWh3ty/Z1zbCvTqe6agAeyZ2WGa8UKLb/hokmq?=
 =?us-ascii?Q?Bj480rvUc2QkVy1XavR+edItGKRJMubfq2RsoVqoIIwwIq5T3OuLsbhY85gS?=
 =?us-ascii?Q?5dEgYpzjY2lREtm91G+lVGeGUNwoh/bXTVW+1biYmKYeSX+/z/0rSvodZOTm?=
 =?us-ascii?Q?6CPAlPtBbrsKZrCN6lGvVOXPD2HVFH8r7nEOfjVjC6Zf9idKZXn2n2AAqIn1?=
 =?us-ascii?Q?sXFph2nJX2tEOxaJ0SgoNuh0Qtpnkx7jLSPF59StxgdYz43lSrzFAH3jngMf?=
 =?us-ascii?Q?BZvomps2dswrFx6dCGdWpEgYJDry8zPgx38LMfsfPdO44hoQby4BhqEZTNcV?=
 =?us-ascii?Q?zR3EXmgZvSh+yV3s+w8stz5D/DBQX8cg+fEYCbaCY+uOfwaMloT/fXhYb66d?=
 =?us-ascii?Q?hwjR62L90tBQSGGFLYmQwsZNpRHpkcgHYRnksYkzX/Hy5UTxPdJu7bBBR18k?=
 =?us-ascii?Q?rQc1GccaWzxHMhUmjF3WcMGt4SsoEtMAgSOBk8j5JBDd/kxKy9oEyWvwgP23?=
 =?us-ascii?Q?ScyCyT9NKANYYSZYjTcYwmEgVF2iYF/sQWSeiW2yaLkIv32eyHwU2VHvOKxJ?=
 =?us-ascii?Q?D+MDSaxS2noC7zW3h9W7chBoTtEL+jHpfLRKR9ljBikfRAzZI4gxSavikSYg?=
 =?us-ascii?Q?co74Q0uM5CL+vlh0bkVCKxjyLjS+3jTvXVjP4sUAN6B22+N1duyJAozF54rF?=
 =?us-ascii?Q?dFAWoATwEHrWYgVDnFikMAo58jOgxrgfpmarjopSfwEexoKRv/4V8p6ckjPE?=
 =?us-ascii?Q?e0qfdvfviCj24Leb6omr2oXca1aDO+RJaFGGkJXq9oGgqdzptv2b6lxlhxRO?=
 =?us-ascii?Q?5sjfYTrgviCq+hOodsmz2PIkJD3IRPoIBCuahRTiO6tACTPDVW63nNo1OEUP?=
 =?us-ascii?Q?nzAfIU/o2rgqCVTL2GHUiPbQe5wb4IQKCmpd/RfoMaKrsbEGdSB2vAPnASeM?=
 =?us-ascii?Q?d7o5D2O5hMDtsfjBKD+RLWPEcNwPxEmMjsL49IBk9c8Cfqtfq8ZRiFlDCeFm?=
 =?us-ascii?Q?givDgbVMxjeGb7Xv8sp2c7qoxk7ezk7dcgHqnEqOsav2gpaE/rZ3pYQP498S?=
 =?us-ascii?Q?xI4OiNeyC5k4ck3WjPehBihYtUYijGMjBxRaG6bOybFLnTyt2F8w7eJPQFNd?=
 =?us-ascii?Q?VBXT7rrdSUkv4hrKTmhnIpZ4Z3KKQkBiTSeqjbtjx1rpuABMDXttkn2/DAWM?=
 =?us-ascii?Q?/fGfE8VaiUQm5NzLOxQe1UOp6XUktQrfoM1thDLJJUOzp42OV/Ze6Qmbe8KX?=
 =?us-ascii?Q?WcYGmfE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?PDAa2F0peeZe2tKnyLlX0VkJaQlQMUkHnSxwCOpexHQnpIBnqzkm7M6ZOH6k?=
 =?us-ascii?Q?Q5cdOV+nkAvNDJH57TTZgRPMiDjEMfB6Gcoa3T3hlLzqedodqNvOlyXGTXqF?=
 =?us-ascii?Q?qeVsakscidbABHt0A/CwT+QiOUpQ8W3S/jawZKtFm62NNWKGT3+wvknzw+xA?=
 =?us-ascii?Q?p+IbJqG/dBOu48kagLMX8kn8AmXUPfbzkmVapXEV8jkYmsE6MBXw/3+dHHZ8?=
 =?us-ascii?Q?ksIJCkpS8w+clpq3i3WDTy6ziS6E7YRqII4Wi1Kywm7YBq4oXNeRUAYUotrW?=
 =?us-ascii?Q?ml4jW2PKf3mWVrj8gcsHWe560P/6oZ55DTcz5SGSCxNeEzehZ5vNKKiUrRr1?=
 =?us-ascii?Q?cuSINtJ2VDh37sssOSj+dxqmIPHKol6FshoB2jErH363FgxcO5LL04hKfoD+?=
 =?us-ascii?Q?wtjwCxltuIJ+lmuSv1e2l9fmbmJLMHdAfN0gy6XMZj4+hvPZ8LnwOmS/mwNc?=
 =?us-ascii?Q?HRe2jYOZDO3/oScpOOhwkjMCT7aKyeLONQ1G7TqhJGeVwF7RB+M2xVb9mxJ8?=
 =?us-ascii?Q?wFm8F+qYqC3zWh0z2JSpRSAFcA2bRPd4WJWkmHNnufBe+AOuZCcF54AxapbD?=
 =?us-ascii?Q?NxeEBe903iVNEj2JpXDrnaUpX2TKSfiJZ8BOrZIb3gKt5A96d5CIpLvJzgRN?=
 =?us-ascii?Q?alBlfDWpFpLBjl5PzdbGkq45y+2i6It6cBks4GvTaPGOVCrNAwhF5eJGyGGE?=
 =?us-ascii?Q?5b2D3EyKEUmpzPjKA0Ke0OAJudevf9wh8fiFmMYrZl73TwUjCeKtAuKLjKRJ?=
 =?us-ascii?Q?pnVWrSQ7jbcE38S0x2E6BB1TMX7j0GXTYTjVno/5JhtxSFnlqem1jSTSqB5C?=
 =?us-ascii?Q?ndWtTGHh5RyS3GpDDYCWPed0+mWBwHbpsyPINkiaR90cqlxfdxfPoD1Hju06?=
 =?us-ascii?Q?8HhQkSj5f4fG60Uob9b1IOABdkWkk11tpmj9u5xx60vaMMsx9oCOoxduzp6/?=
 =?us-ascii?Q?Rfq+Xkd+Dt/Uj9GXqPsmEJSTIqWwur+E7vwO2cdrQIdhvmtAmHvBWAgj6KHc?=
 =?us-ascii?Q?P3DGOUsjr1k3V146T0ii5WQntX2X9VQ/Wb6ZauUBqheXdpUKoS5kEXRX870T?=
 =?us-ascii?Q?G5x1sK+Hj2MHByldkFRdhOzzgrDwjScEBCnMNaWJHG4t5ukLTvhi45BcaNbo?=
 =?us-ascii?Q?a7llCI6oC3x9tOVTDGV5HTb8HzTzWIgP9wIOK/Uo7RiJMifSIC90o27YD8HF?=
 =?us-ascii?Q?rPmYmOHms4Ne05RC+7xsLOf+36kDt1IT7bzZaoyaizbRJEWPxQLDeSSduOvS?=
 =?us-ascii?Q?KFgTBlPh7/rAKprVOFVkS7xbl7Hd3OykwRStTB0wYFEYd2Kno3b6swuefQUw?=
 =?us-ascii?Q?I4RNmJH6LJGdlzgSlSKRImC3T9T6NDTDHqwCnGbpTf2Rf2VN11fIL8Uls8QV?=
 =?us-ascii?Q?x4xRTaEFqLLDdpM2JTCtJ9sZuHRCv44d1tggIjCyssr4WnZaweZHUrNeNJY2?=
 =?us-ascii?Q?bhJCtdxYX0rhr12KZPdQ942jN/2JFQOIFNvae8VUxjI4MfG0DyLhshd5vxSa?=
 =?us-ascii?Q?aE5/hdQNDyOoWms6AF9vfmUFmiFbyEJfQsaA1CxzswGPlwCO/1IMRa8tNQ99?=
 =?us-ascii?Q?mQrccbMKnh92EH3N7xvkuF9+l9Hq+5KFwTEUXui/?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 530ec866-453c-427e-4102-08dcf812d71e
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:38.3888 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: unPTg+I99cRFmytBNWfKrwWZkZOyFxps64g96rxR6ELn8/w/q0PYYo9fwP2aUF1XCjMf+Zwcwq/SefFxl4FrGA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_sb_bad_magic/README
 | 3 +++ tests/f_sb_bad_magic/expect.in | 40 ++++++++++++++++++++++++++++++++++
 tests/f_sb_bad_magic/script | 16 +++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4j-0007R0-1Z
Subject: [f2fs-dev] [RFC PATCH 09/24] tests: add fsck testcase of fixing bad
 super magic
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_sb_bad_magic/README    |  3 +++
 tests/f_sb_bad_magic/expect.in | 40 ++++++++++++++++++++++++++++++++++
 tests/f_sb_bad_magic/script    | 16 ++++++++++++++
 3 files changed, 59 insertions(+)
 create mode 100644 tests/f_sb_bad_magic/README
 create mode 100644 tests/f_sb_bad_magic/expect.in
 create mode 100644 tests/f_sb_bad_magic/script

diff --git a/tests/f_sb_bad_magic/README b/tests/f_sb_bad_magic/README
new file mode 100644
index 000000000000..a8887ebd2dfb
--- /dev/null
+++ b/tests/f_sb_bad_magic/README
@@ -0,0 +1,3 @@
+1. create f2fs image
+2. inject magic in sb 1 with value 0x12345
+3. fsck fixes bad magic by copying sb 2
diff --git a/tests/f_sb_bad_magic/expect.in b/tests/f_sb_bad_magic/expect.in
new file mode 100644
index 000000000000..7e2d55b10d5c
--- /dev/null
+++ b/tests/f_sb_bad_magic/expect.in
@@ -0,0 +1,40 @@
+Info: Force to fix corruption
+Magic Mismatch, valid(0xf2f52010) - read(0x12345)
+	Can't find a valid F2FS superblock at 0x0
+Looking for secondary superblock assuming 4K Block Size
+Info: Write valid nat_bits in checkpoint
+Info: checkpoint state = x :  nat_bits compacted_summary unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+[update_superblock: x] Info: Done to update superblock
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_sb_bad_magic/script b/tests/f_sb_bad_magic/script
new file mode 100644
index 000000000000..3fca2b66b383
--- /dev/null
+++ b/tests/f_sb_bad_magic/script
@@ -0,0 +1,16 @@
+#!/bin/bash
+
+DESC="superblock[1] with invalid magic number"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+$INJECT --sb 1 --mb magic --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
