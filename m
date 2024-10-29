Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id F17E49B499F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:27:21 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lJf-0006kS-SO;
	Tue, 29 Oct 2024 12:27:20 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lJe-0006kI-FM
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=G9tLbvTT8tjrufmCDXE4FFVf1eRlaoOmPZre1Z4buwQ=; b=nBvsvf+RY6kzjH+2KlcZJxu8BX
 m9n5XP8y+7G97FkjoO0csDBLUQptjiAzOWbTvbeNByQ7gznZXAenjtVgkB1e9/13rIMsHSwoaXrUN
 wIaIejiltmxOLnRJU3TAEH7Mc0foEIhyBb0GQWiRnEG9qKkJE+wNB2M/PKf8rBuNZEuY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=G9tLbvTT8tjrufmCDXE4FFVf1eRlaoOmPZre1Z4buwQ=; b=QltI9EQfyz1Cfoo/cHST3cf7Cy
 DgD2YwL77qeTFT3LCqcYPyFBt8ZyqMsZT6WXr590Y4Zfeo2t9mRyumT4sjB/KhA+63chLRFi448iC
 TqLtfTOpNPkLwmmgBUmX/TYwBj3idcgZwsuXdfysagnRnCNpZBWU2nbTfi/XsEI3sxZA=;
Received: from mail-koreacentralazon11013046.outbound.protection.outlook.com
 ([40.107.44.46] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lJe-0000dg-EU for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:27:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OPmziuZkNanTGyYlfi4F4u3wXNOV0GtXODpykqkqzFUQnWok7R7siN9T3vKV/YSb3/kY8PLF4gUk6nvgt1ueOqsHXxIT5o2Tge7V/ckCDcb3VPkuEyB/NkPdGBGPnP6RcQRqTDkUgQ+ElcsTK+IAvuhrnxv9mITm/6DNxaerh/PpxM2PkIZUOtJo/QxgHdPFXdlvHrekUB8gO3DgTIpsb6AM6ufh75VHrGKdrCIivBCJZqNyIOLxJUNDestTzalV7uX6BKrKzOWBzb2aCHni7Qk/DeXxjpsv044WXWMZcqBj5VyCzjt0tsY0SoP8lu9fZqEd6OFoCNcK4oEIx2JzYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=G9tLbvTT8tjrufmCDXE4FFVf1eRlaoOmPZre1Z4buwQ=;
 b=k5RIoKZeP64YYPGTEonwGui2YF0mjvukSDIr9NXyri5A0uyeSX3FfKDf5Fx9y5nphB6Vy3jV5m1jiEsVfk9BufYI368uAcEsvakzOXWxN8ASTWLX6Z/ROmY14PEfLC/aIXGNePMxDBlLYXsX+GctfQdzYnprMSkY6LcoqHRm3v9my/pYJedeYNDCsu/6O5RKy8gFxAX3aiRRqQQui70vcRD/EyISgYVURugQz6QXqZ/t100VL6Y7StFz4gPiUhgMx+ezIretU38o2l60xwDkeYXhl6OUVJsP69+81wt35jO4XyPpXaw88doHXOQicnzittoCgaiIE1339nBELwfUJA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=G9tLbvTT8tjrufmCDXE4FFVf1eRlaoOmPZre1Z4buwQ=;
 b=tBAd/CQUyEq5O4aEmuNTO3atvTmpuVLRxuOk+rXIDpb/iiDmKeL2ok4yO3oPyG6OLibIQe7fn6k3oxkgKmRkMcFnGC5JYlVy3AG3V+piVDkUhxQWYFixocF0rJ3urTJady3/+r3ZEqX9On6Wv9eXvwQyAmzbfdaPJIa2Is2Dh2Q=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:51 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:51 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:52 +0800
Message-Id: <20241029120956.4186731-21-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 3ba70151-9c99-4848-6936-08dcf812df06
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?pLs6NZ2bIugxHssKhhVQxI/qtd8Sn1qjqBUjkMQJoDFRNMpbSpZqKDrwev7a?=
 =?us-ascii?Q?4Ucw/Xrp/KNsPMXNk06TvVFdQ6MLzw0eHjyZW4o+Yzi0jz5RwVhWn83VztUe?=
 =?us-ascii?Q?8NEQjZIvuu/bVYxw2YRdkrUed9x1uOlXt49GTE9XrRI8ccJVNqLFeYBVu33L?=
 =?us-ascii?Q?S6o1fiBccnv9R+NqCd4Y2a4WV6RXUSJ7f4NUFrH9/lX2KrDzFudbXEfGrwA6?=
 =?us-ascii?Q?XburjSmsBSEhTn/425CTzEl21v/9XZGlj6+kqKHm2ncw8uoosS/jkIwA5afe?=
 =?us-ascii?Q?YVrrylU63ghApIuWBcdCc7z3O0ffN8McxVpBWuRdUpEPFZXEJS1vs9AySx/2?=
 =?us-ascii?Q?K0R176gyUCGuY+ApJfGpRvFtNsbDBOOW1apDN9FHphLx4aR1dZ/kUavFlczp?=
 =?us-ascii?Q?FhwOAll4povJBFVd/YnaS7DWIeKBU5MKOV1J6CjeofCLkp/rVI9X6AF0eK8r?=
 =?us-ascii?Q?AcVTJDB0JhsB/bJJt/6GI6xKd59Bcny9zh6lisPcGPgwhq4kWlZBhWw9bHQt?=
 =?us-ascii?Q?5VXxu77UXyKCVoBQhKKItxWkNMPNaekNgJGOnT/HX2HEicFl/x9OQZH3yUqi?=
 =?us-ascii?Q?QJQLTiqyix1NF+EvA1o5D/8hHf3bI63CNPxhAZKWYRhrG9d9mqstDqIXD4zI?=
 =?us-ascii?Q?gsgPe6d2ZmN7rI+AB47nhRqjfSkj5onedY9jqRZnypsIfCIDSnzZeQOHggJ+?=
 =?us-ascii?Q?j+CC27fofclIjx0HOEhmWuFldkfQNS3rWFLpEjwA26KRGE/kFNoELklG5KYY?=
 =?us-ascii?Q?XKF6wtV+nT45v77dmy3Q6nKKy47HY45q/cM3Nx9phrb7EjLrKXqQie1wA7MQ?=
 =?us-ascii?Q?Ts670MfbDJYEcmelYwNOixnnFuINGwbP5+bdyXtkBCYdFs23eBt0NJ8r5goY?=
 =?us-ascii?Q?liqrUneKkYD4N1Ng9tk9OFxZkGDLiBLEObCSXBcNs3YksMHrUAKNxwj1ysnE?=
 =?us-ascii?Q?liBl09bS5IWUTVDjUFLuVMCpMbGY1Mi2X32+zxuz6oOts1isx5QSXYSV9iFK?=
 =?us-ascii?Q?mzghU6De88HJDx1mZyGHnAh3xJ53E827WqVZMvj8yG8rJ5K9drL5mlzt+hrD?=
 =?us-ascii?Q?D2DZS2siuSBQlEYiBdlLhxw7Rorzainj9T/pSNNvxKYmLp2Kuieuf60rpadu?=
 =?us-ascii?Q?UAeprhO6kNTyjzCt1iE4mcX7sMjKdosqk/hr2AsFND1R4KyYt0/fpbNz2Xs8?=
 =?us-ascii?Q?lPrKVClVG30EGZtDsXAgZnht7g56HW0yJx+MIlLyD4MM5TMqJByy3zfv7747?=
 =?us-ascii?Q?oRgEd7Xb7QisZD+EMw7JgzGb4a5GUHjXHjgl98xBLCFKSA01dkRWLx4RlvRF?=
 =?us-ascii?Q?uNv6LGl3L702ifjVRSAw0E07EyXNVBcGXNKhvzrY6zWhYdEtTS0VGpT+u96s?=
 =?us-ascii?Q?HZyDXiQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?exo4zGE+vaD7MOOnmCYmvfZwk5wOpaABFEH8gLkllhEKWe0fiT80h9S/pmAC?=
 =?us-ascii?Q?MK89vsL4VgyTpIrD0+f9BHbcjuJ24AXu26S5lm1br0IAShOfCKVub4tvSdEj?=
 =?us-ascii?Q?I/EK6dFBgpdCdXow7oG+n/SvGXBmXwT/RHfjrD0GUpeu2R3GHkLrg6KN0izT?=
 =?us-ascii?Q?T06fHwqj2zZxmA54R1EPieBvuhm1e5+XHZh4TXdGSWwJAR8k6FShdTlWqVSE?=
 =?us-ascii?Q?k41dcCD4LfxrazZVQitifYGX0OkIYOPNJ28mVJMJkCP8yuxpYdEgYs27V91u?=
 =?us-ascii?Q?Svox2+/i5+NJfKzfs46h5wJ+AqUcbUG46gIQfrnXZGecQP6Bza4e5GECaQ5D?=
 =?us-ascii?Q?tASfASYDHmdoQ/L9DiQFlOjUQWdZIeqVLY2nNHujK9fjgwYn2fk8gyafyNNJ?=
 =?us-ascii?Q?xXLt2hchnQMLMgNe4yjPYD8xtwRJ5s9PFsSYlLV5ehHf5Tf8Qqy+yrYa+5kv?=
 =?us-ascii?Q?/ECcubYN6Ds423F7w40BFX1HnKkGt2w5lYJ/o54JFh5xmn7vcpacV9wJrd/5?=
 =?us-ascii?Q?XRW57G9lgT57T8ig6kFaU1grkzvz3IEm6IkPDAPpAh289MqtSCyoP+FlJOIx?=
 =?us-ascii?Q?3TbnCWNTiOMIJVAuHU3gBnYj5VaG5lRMvP3HuB0Mbi0sUSoIk0W1+1P+OURN?=
 =?us-ascii?Q?hThOQjIO6NkFCqfhAeHcSEATBFYYqm+G021dzqlGnqHag2nuleAhUH7rnG/M?=
 =?us-ascii?Q?Y0M1u74Bvrw2oZQpDeLbfsK+jzLOsGEB8PDn0ACZxqwl9AqKChxTZ+pLMd0J?=
 =?us-ascii?Q?+2Ws6CmdkPst6wBTdHaE7Pd7Cht2tn30kw+j/T38ROuiOFzowmPUfoRVY10T?=
 =?us-ascii?Q?ErFPQ4iKwKkqrfh3sy8C2tlxm/q+E3ns+DOjdgjV2f0TLmGPr7Q6KeLB5zWx?=
 =?us-ascii?Q?SSheRFFdZ8YdLGgfGVDOSVAopyGRFFAubZUr2iataM9jJl3VfuEe8QnKzHQM?=
 =?us-ascii?Q?UXebP1BV1r3kuSKJb0FjDK1CpAMs2Qr2e89lQuK2Oy1fkBQoqRWlWdtNTUZk?=
 =?us-ascii?Q?feXBtATcH7A62J+RaYdRTJf3ozuKB7Q52zJuconDeQg9isfhDMGcL/gU2Mqv?=
 =?us-ascii?Q?lpyDl2vTwN9KNZTH3Nz6bWKH3cZDMwHgfrpFvrsOinq67JPbl30SjxlTvgC/?=
 =?us-ascii?Q?RkH6DblTnYLAid0kQU3rBWBEC0NqNpahgoS9DzlVVvfywQ8SyTBgoZVmlAWA?=
 =?us-ascii?Q?VrYT5q0iL66peJNE9bHNnlmDE6dTsEvSPtYVN9Uv1rKs4LCkSHVts1EDpV+q?=
 =?us-ascii?Q?YNsWhHt0EgIPRZNFgzgrArg5SIHRvKKNN6YNMB3VJQBKqAkMJmf4RJUDjkEE?=
 =?us-ascii?Q?PQHbirl4LUz1+OFcwiEUIyvdzgR+oNh7Y74FpFwj5cr1sgSBhcTTK+2MibMV?=
 =?us-ascii?Q?jYQ+D893EQzFohlhIjvLgynRHV9UX+G8v9n1VT3PoExdCA8ybIhvlOZIMyfq?=
 =?us-ascii?Q?aWYVoLMe47MB30dez1Evj6ppOPzNpYLVJfwLxpp3adYFsi4Ds1fyTuj2VeO8?=
 =?us-ascii?Q?s07mn/dPOZSLsOHHxtad8856UAhPmKPt6SYAz8unVdHDvO6BepvFKQWVivnA?=
 =?us-ascii?Q?OAdV42IgTM7G+JtML9o9oiNlZpPIXyCLRrChfTN4?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3ba70151-9c99-4848-6936-08dcf812df06
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:51.6241 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: lcfGDIlh+v4HQf3HTNUd6keJAN0SsuUvcOWFwWo1mf52nBpQ4MOS39zoz2tduU3GbBAYcUE04HGRceCObeV8dw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_inode_bad_iaddr/README
 | 6 ++++ tests/f_inode_bad_iaddr/expect.in | 38 ++++++++++++++++++++
 tests/f_inode_bad_iaddr/script | 58 +++++++++++++ [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lJe-0000dg-EU
Subject: [f2fs-dev] [RFC PATCH 20/24] tests: add fsck testcase of fixing
 invalid i_addr
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
 tests/f_inode_bad_iaddr/README    |  6 ++++
 tests/f_inode_bad_iaddr/expect.in | 38 ++++++++++++++++++++
 tests/f_inode_bad_iaddr/script    | 58 +++++++++++++++++++++++++++++++
 3 files changed, 102 insertions(+)
 create mode 100644 tests/f_inode_bad_iaddr/README
 create mode 100644 tests/f_inode_bad_iaddr/expect.in
 create mode 100644 tests/f_inode_bad_iaddr/script

diff --git a/tests/f_inode_bad_iaddr/README b/tests/f_inode_bad_iaddr/README
new file mode 100644
index 000000000000..5ada3226ab5d
--- /dev/null
+++ b/tests/f_inode_bad_iaddr/README
@@ -0,0 +1,6 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject i_addr[0x100] of the inode with an invalid value
+5. fsck fixes the inode by nullify i_addr[0x100]
+6. check if i_addr[0x100] is 0
diff --git a/tests/f_inode_bad_iaddr/expect.in b/tests/f_inode_bad_iaddr/expect.in
new file mode 100644
index 000000000000..a7a80c5dc5f3
--- /dev/null
+++ b/tests/f_inode_bad_iaddr/expect.in
@@ -0,0 +1,38 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (fsck_chk_data_blk:x)  --> blkaddress is not valid. [0x12345]
+[FIX] (fsck_chk_inode_blk:x)  --> [_INO_] i_addr[256] = NULL_ADDR
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_ has wrong ext: [pgofs:_PGOFS_, blk:_BLK_, len:_LEN_]
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_ has i_blocks: 0x00000202, but has 0x201 blocks
+[FIX] (fsck_chk_inode_blk:x)  --> [0x4] i_blocks=0x00000202 -> 0x201
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Fail]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Fail] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
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
diff --git a/tests/f_inode_bad_iaddr/script b/tests/f_inode_bad_iaddr/script
new file mode 100644
index 000000000000..8d0ba8d169e3
--- /dev/null
+++ b/tests/f_inode_bad_iaddr/script
@@ -0,0 +1,58 @@
+#!/bin/sh
+
+DESC="inode with invalid i_addr"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+dd if=/dev/zero of=$TESTDIR/mntdir/testfile bs=4K count=513 status=none
+ino=`stat -c "%i" $TESTDIR/mntdir/testfile`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+$DUMP $DUMP_OPTS -i $ino $META >> $LOG 2>&1
+blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+ext=`$DUMP $DUMP_OPTS -i $ino $META | grep i_ext:`
+pgofs=`echo $ext | sed 's/.*fofs:\([0-9]\+\).*/0x\1/g'`
+blk=`echo $ext | sed 's/.*blkaddr:\([0-9]\+\).*/0x\1/g'`
+len=`echo $ext | sed 's/.*len:\([0-9]\+\).*/0x\1/g'`
+echo "ino:$ino blkaddr:$blkaddr ext:$ext" >> $LOG
+
+$INJECT --node --nid $ino --mb i_addr --idx $((0x100)) --val 0x12345 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+
+INO=`printf "0x%x" $ino`
+PGOFS=$(($pgofs))
+BLK=$(($blk))
+LEN=$(($len))
+sed "s/_INO_/$INO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_PGOFS_/$PGOFS/g" $TESTDIR/expect
+sed -i "s/_BLK_/$BLK/g" $TESTDIR/expect
+sed -i "s/_LEN_/$LEN/g" $TESTDIR/expect
+
+$DUMP $DUMP_OPTS -i $ino $META >> $LOG 2>&1
+new_blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+
+# if i_addr is 0, dump.f2fs hides this i_addr slot
+if [ x"$new_blkaddr" != x"" ]; then
+	echo "old_blkaddr: $blkaddr" >> $OUT
+	echo "new_blkaddr: $new_blkaddr" >> $OUT
+fi
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
