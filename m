Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 458419842C0
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 24 Sep 2024 11:57:07 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1st2I1-0002o5-W2;
	Tue, 24 Sep 2024 09:57:01 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1st2I0-0002nx-Sg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 09:57:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rxVstS/tsmft28TiJt82p9fPxgOqFdFZeDzVMSpD8pQ=; b=A0/unp3m97UBV8ovnzURNNv7x2
 uJiDYnV3DJvjWPnCfvzNw388f/jJ+0tIP5KNgKt7jy1JY/eTdcu8HFS/9KfpQ22S2D2x1jgdaohaE
 5xS+NjrXPm0osv1bnFgRnyqYhWZz94vuigb0EN/xj9j+6Q75uRZAXbD0qegUtP+d+Jso=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rxVstS/tsmft28TiJt82p9fPxgOqFdFZeDzVMSpD8pQ=; b=W
 hUUBcFwxO0ZmjrFdR6LE16v7XFDMJdKI/JQLPkXcyQRigzoGrHd+fH/jLsKJdmpwuqY1NIekLEEys
 IwEslL8WV9C2+9w5g2uaIn3a4NPGz/5tG3q4+LWVZ5r7EPazJ+m1HbxLU1TeBf9B7EoTIOJKMaddv
 mHeeHFEw7aHQnXow=;
Received: from mail-psaapc01on2043.outbound.protection.outlook.com
 ([40.107.255.43] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1st2Hz-0007hy-7U for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 24 Sep 2024 09:57:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wuiIg44iJb/YzonZLYFnZFqr70jmsRQZ+eBchwRVYRjUoJr22XSpC+BC4IxYmMva1IetnI9xnCqpXafloEj6rzja7o0NLZ5vZor8Cm4K8SLIRQrZCx6LPmdPPcUDtk5frg949nVRqQRtlqBDOnkn6l8a3cQxgG1B00kH4MfFIrOc9fKPUEo7/ZhStygRRkXBgQCPB/ClCLmGpKRx34QiLmmb3AqjJTwSQvcE+sttDV2h2RM1GYGNTbEdVXJ57o2iBA2Asqnj3gnjc9kI8pssrOHAj5NTBpWNhqEI3CEb/Ne0X7dxFd1oavxmTFkKdrtNTzwkXMZxSBbkH6RnN7szmQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rxVstS/tsmft28TiJt82p9fPxgOqFdFZeDzVMSpD8pQ=;
 b=osyx0F5YNInox2bMwmNA7Q+nG6xuQowd4HFxfh/iNvXloxrbSbxBC3nfEjK/usQe8OcfjQhjHGU9aW6tR0fYlbZYNd3bNnTHi2YbCsA1SY9LUNoGyvwqunYo+PmJT3tZ8sDOS2V3I22t13K/yprCwcQd1nJvqUQRSmFpWedwJyddGEXQMKIfNy0upxbLFg9/PrctZnxdKzA6aBLGvU5LFJAJDm19Ykf74NsLPDkDmXmuIVAUCPf5y0nTVo6C+HRgg25BnpfYoqlsl+Q98EZEfYwV506rYKmIC715GG2jcaKRykTIsWQSkVKcZ4vTR04/IKhz0a3sFRImZFxQQwDkWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rxVstS/tsmft28TiJt82p9fPxgOqFdFZeDzVMSpD8pQ=;
 b=Ll9qjpSHD1G/eFSGZb3ScYDzNNfzrpm8ftJ3OOXUewjXQIA//a8Rg0MvsVKp8RqJx8u6PMO2oz0KSGacSyvWKnHq+aNv5c4FrHfiQdx0Cci3DXUZ5PnKhqb/Pb4MAP44NemLjwO+V9FxSWiBj1P8qHuLixXWkG5f38BUYeKXj2r3y7YsEWX5yTBQAz54Ag6b0gmRXko/6eHuRc5D0g75qfsc9JD8tjcCcU+vT48f2I/p7W1+iiGlWlEQxeNAvOGstYJW864wWNRgg9z7zlq5Ve52u5UFjomtEoQaXh0kSBUpvEMmmN/bZ632FRhuMbQobCC80wQS6FXwMVJp8sA07Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB5482.apcprd06.prod.outlook.com (2603:1096:400:287::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.25; Tue, 24 Sep
 2024 09:56:45 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.7982.022; Tue, 24 Sep 2024
 09:56:45 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue, 24 Sep 2024 17:56:36 +0800
Message-Id: <20240924095636.19457-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYAPR04CA0007.apcprd04.prod.outlook.com
 (2603:1096:404:15::19) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB5482:EE_
X-MS-Office365-Filtering-Correlation-Id: a6fdcd25-b9dc-4bc3-216a-08dcdc7f32d1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?jfMAblKeb3R4k+D7AwxTdwCajL6k7ak9L8cP2szBJiW3gLv8IRRsOukS9C3K?=
 =?us-ascii?Q?oH0vpkQldtxPK4wUVAMHnnimPvtv6BM24C9x5yFXOWQAa0YCnmwkgDM+UAgy?=
 =?us-ascii?Q?G4vSf5Pzw3Rr+INKNNhcS5UnA3h8ylkoJoadQ+akh+vfecnChipUTKNb2sP8?=
 =?us-ascii?Q?SMcgkPD7zEdpEmyme5gHMDw4X3zkSbwwm55RhxCBwdmgFtu368igBGOiJBhW?=
 =?us-ascii?Q?GJq6gUcd9pz4jYcC8XFx5g/IAUTJ3tZ0PeFKX3GG6OFnFvWWma6I9rTjJI/x?=
 =?us-ascii?Q?cnGofrirT4gp5jWIzxDhy4dnoZqnSpEGJK3knsmsq5GGNKdCU6Ryc7gJH4ME?=
 =?us-ascii?Q?kCGPbHdd0+RMfKbFLp4ay6s83AT0fCcBZ1aqXqaRPYg/sl6lYDVa/h1M3UiL?=
 =?us-ascii?Q?Tds4MBrugRU5/1OwVSHrnuTRwFsXWWeB4GBo1Sp/lBnaMpOnWX/gKuTrl1BZ?=
 =?us-ascii?Q?A9VulLAKEc4vkGoQRNqVvBg87PXwXOHTqTQ6I+qFu9t6XL1VTB9gH8qvlZtx?=
 =?us-ascii?Q?YqafJ0e3GJfkE/lGo0HO5sd0e177vdHKWzU24d/lxasBzEQXnCieg6mh9g7A?=
 =?us-ascii?Q?aESVfdZWBeKow/+hCT0J1sPyXDECDo/pTA9pP9IxZe20dbWYCdxLmiy7MKG4?=
 =?us-ascii?Q?RNg67aAVtBvH1DR+2iMW5WMO4rLPeuviB74Y7yr7UxWM4SwJgUs1ogxL96oX?=
 =?us-ascii?Q?NM53LO2uw9naB3kCBQ3LTzBMhDSTzuNKPmxfUlVdJNby7JDI0LKKnbxDdrn+?=
 =?us-ascii?Q?GKXD2wEB1M6u75OQgO7wsB0nBm9OO0Wfir5UtuuAcILnrpnz+vW/zAKI9847?=
 =?us-ascii?Q?o+6J6mzM33V384uRZQGYNRM9ktLb0hy161NM4Qq9SNjNbShdh6RYxeBfj3Qk?=
 =?us-ascii?Q?Mpsxq7cjBb78bYMZaRGOY0YqnB+g93ZP7IQGBcvzJmKpMYjxWNaSqMIKMKG/?=
 =?us-ascii?Q?3Et5Wo18zn9x+4e0odxxqRMelA/4OFS5cBJJfniGLTNwn+SAabIqenIS5bb5?=
 =?us-ascii?Q?trM/XsHHgBOqXPYa/zViH9wRfSG006nDavd/cUlfhCl6eLGk3jUNpjaAcuTf?=
 =?us-ascii?Q?cIYHsmTWcvolbqWPO/VKoqfMOo1UfVJ/wOdBVSzSwjXzK+WutYM3siT/vg+s?=
 =?us-ascii?Q?R1GWG+9ZmOpq7g4Zns+vmKeZKbFBy5P96AM8hCiigVDqPC1xViLqyhM4xdeF?=
 =?us-ascii?Q?9FvShQh5qQlvikPJOkbqs4+pWDF00D0HkVyYA5We3xwoB9Pb6drEz0rjrplI?=
 =?us-ascii?Q?4gfLl7UsXShgshu5Gnd4qmIJYkKPQbdEkzYOmEZ7ujdckgBM3Qkj+hnR20DO?=
 =?us-ascii?Q?LqpgXycb7L7YSTXDKmndf54vclr+LFz9NQ+ObUKYDzWaiw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tWcFZ0Gg1RRk5oNDU4Qwc6iqw++84qqqaTkcDrYDjrjWJb4Mz1vKS5VYLtUD?=
 =?us-ascii?Q?NeB7Oo2uB+mlDZzOoUs1Gy77VIqhCk7faZEaIdkB89Mrx3vl0zQSHN8MqrOc?=
 =?us-ascii?Q?PPdtz2kY835KQhqVU5oRcURTILkxQ6IcWfaf13HmFmzNAbLkvFkRA+8sHooV?=
 =?us-ascii?Q?kwx/4H/N/TYY61jal+QhInpRlCz7SZEZ/oxSgXehhJQn+cOH9/9o1ch5BM4x?=
 =?us-ascii?Q?+zxUHb6I5CEvJYzIKKYdCCpLSjxkQXBqIAARudmZGyXXpqv4Ng7t6uuPAOuT?=
 =?us-ascii?Q?Jnd7oMzGLsDPUSCHZWyx+oIRRsZ1ucazHpP17uw9cUGX6dH+PUXjHqe5Fqmb?=
 =?us-ascii?Q?2ysXGM92s3FoNsnN8N9fO1e2UEXdfci9jdPVnXVCxhTJPo/ugEGnByGmewLZ?=
 =?us-ascii?Q?hRKwmb6EYdyw/GjfdRRR2c08Uccb/ucYO0Xi9IEJPB66nxu9CmPH9+IjLCX6?=
 =?us-ascii?Q?/Qx4/4lJyQf1+PI5cWRN2Ej3YaYgO/m6E42E2EhKEXxR92BbKDw9iUF2DR4I?=
 =?us-ascii?Q?1tNMbcodhp5JpSiOC0Wk6Y0D+OYwDmUEpXBT55hxmhKBkUGicE7bN5vdOaGj?=
 =?us-ascii?Q?eoAX7AdAjgZionA3qJGjCVjtqSZwUCbjKR1jRcSpmwBMCTZwF/GkyPYGrKmE?=
 =?us-ascii?Q?2Y6Auqn+bywGbG9kXz/XxujHFNf6j8grrz8L3tYYiWyB6oG22Tpfvkk6odYY?=
 =?us-ascii?Q?3YjS5jNpbbvJla9VxP7NQD9bicsyGm79K5bZ8v+VMAmeIBV/X2HGqbwjfiVd?=
 =?us-ascii?Q?tdJ4UEcfdMWXXxbkHjYQ7DcK6Cve1A9nJ4XTbkd5PSuBXrOH2MIPVbIsCwSm?=
 =?us-ascii?Q?XTDiWTn1z1NXgCIjgdSROQJalXaPBBkyEvq7kOXOb2h1+F/HTxV7D4WvpqlB?=
 =?us-ascii?Q?/z9D2PhTvtiFP/oXouCxrsrcgomzyHjKPE1Xthf1pDVQNZAPHlzkjrD1FLTi?=
 =?us-ascii?Q?OhDPQJjsorkzZtp/EDDd/a7KAX5n5GL7xjhulx9MSA6e2X4YM73vimUMPRuI?=
 =?us-ascii?Q?+i6bR3JAQjiV5HahUhAZL6bOm6nTCFC+h0WDUlEyvoBkdlenC9/WunP5d/Bi?=
 =?us-ascii?Q?N5kMZ+T4yXQedTF5wTrcLT5J4E2pz3wSpAECkKuHtVj89yXNfBIfRhd7z27l?=
 =?us-ascii?Q?kwk7rSS4WohtuINo8mHVXDm/dAENKiD3jHrrXJBrfC7akP7pY/+UIQjzfQCh?=
 =?us-ascii?Q?bdo7rOBtdU2LpMLW8wB/N/qIfHgSH4PMav/QqtNiecU4VvHTZVuEXEaMySt2?=
 =?us-ascii?Q?aaYZArzmLYL3ZH7Zj8Of3D53HDpMMAwv93Ie1l8Hk2HwibmbAej1MMXhKGRi?=
 =?us-ascii?Q?BtrZhEqIkUhCBEf113dL33FUQRgV0HQscyvK7eIUIeWbsbmseR0V5o1QvZvg?=
 =?us-ascii?Q?xeWlWrQB4JiG1lzwbTGFCmDr6b9iMJwiaXq07K3YOUpBtyRat+FNHvP67BfA?=
 =?us-ascii?Q?5+fVR1eyrDP9MCHsCeK+qcAVdIOJbcdjE6t9ZTFf2RYBqjmtjiZU0Jyzm/Yk?=
 =?us-ascii?Q?YBl8MoDwDGl2/hBG5GtiBIXsHx+PC6EBAFojttgegrDInQCMKs/tiU/JHYmE?=
 =?us-ascii?Q?ijRZdAvWnE9fjN72UFUfi/8ScBbAJmST/tQCdZMa?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a6fdcd25-b9dc-4bc3-216a-08dcdc7f32d1
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Sep 2024 09:56:45.2700 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: WR4CU+V+W8CKaJbx3U56b0qEgwlaspIhKXIH+jy9EiyHsFgaQsFxZFVYbaqcx6XZxQ+YlkbqeJnQJIf0nvHjOw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5482
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The f2fs-tools support manual configuration of rsvd and ovp
 rate. In cases where only a small rsvd is set, the automatically calculated
 ovp rate can be very large, resulting in the reserved space of t [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.43 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1st2Hz-0007hy-7U
Subject: [f2fs-dev] [PATCH] f2fs-tools:provide a more reasonable ovp rate
 for manually setting rsvd
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: linux-kernel@vger.kernel.org, Liao Yuanhong <liaoyuanhong@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The f2fs-tools support manual configuration of rsvd and ovp rate. In cases
where only a small rsvd is set, the automatically calculated ovp rate can
be very large, resulting in the reserved space of the entire file system
being almost the same as before, failing to achieve the goal of reducing
space usage. Therefore, for cases where only rsvd is set and ovp rate is
not, we will provide the same ovp rate as in normal situations, which
exceeds overprovision_segment_buffer, and does not occupy additional space.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
 fsck/resize.c      |  2 +-
 include/f2fs_fs.h  |  8 ++++----
 mkfs/f2fs_format.c | 15 ++++++++++++---
 3 files changed, 17 insertions(+), 8 deletions(-)

diff --git a/fsck/resize.c b/fsck/resize.c
index 049ddd3..eca6555 100644
--- a/fsck/resize.c
+++ b/fsck/resize.c
@@ -147,7 +147,7 @@ safe_resize:
 
 	/* Let's determine the best reserved and overprovisioned space */
 	if (c.new_overprovision == 0)
-		c.new_overprovision = get_best_overprovision(sb);
+		c.new_overprovision = get_best_overprovision(sb, true);
 
 	c.new_reserved_segments =
 		(100 / c.new_overprovision + 1 + NR_CURSEG_TYPE) *
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4..038002a 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -1760,13 +1760,13 @@ extern uint32_t f2fs_get_usable_segments(struct f2fs_super_block *sb);
 #define ZONE_ALIGN(blks)	SIZE_ALIGN(blks, c.blks_per_seg * \
 					c.segs_per_zone)
 
-static inline uint32_t get_reserved(struct f2fs_super_block *sb, double ovp)
+static inline uint32_t get_reserved(struct f2fs_super_block *sb, double ovp, bool conf_reserved)
 {
 	uint32_t usable_main_segs = f2fs_get_usable_segments(sb);
 	uint32_t segs_per_sec = round_up(usable_main_segs, get_sb(section_count));
 	uint32_t reserved;
 
-	if (c.conf_reserved_sections)
+	if (c.conf_reserved_sections && conf_reserved)
 		reserved = c.conf_reserved_sections * segs_per_sec;
 	else
 		reserved = (100 / ovp + 1 + NR_CURSEG_TYPE) * segs_per_sec;
@@ -1781,7 +1781,7 @@ static inline uint32_t overprovision_segment_buffer(struct f2fs_super_block *sb)
 	return 6 * get_sb(segs_per_sec);
 }
 
-static inline double get_best_overprovision(struct f2fs_super_block *sb)
+static inline double get_best_overprovision(struct f2fs_super_block *sb, bool conf_reserved)
 {
 	double ovp, candidate, end, diff, space;
 	double max_ovp = 0, max_space = 0;
@@ -1799,7 +1799,7 @@ static inline double get_best_overprovision(struct f2fs_super_block *sb)
 	}
 
 	for (; candidate <= end; candidate += diff) {
-		reserved = get_reserved(sb, candidate);
+		reserved = get_reserved(sb, candidate, conf_reserved);
 		ovp = (usable_main_segs - reserved) * candidate / 100;
 		if (ovp < 0)
 			continue;
diff --git a/mkfs/f2fs_format.c b/mkfs/f2fs_format.c
index e26a513..9c917c9 100644
--- a/mkfs/f2fs_format.c
+++ b/mkfs/f2fs_format.c
@@ -480,10 +480,19 @@ static int f2fs_prepare_super_block(void)
 	 * overprovision ratio and reserved seg count based on avg usable
 	 * segs_per_sec.
 	 */
-	if (c.overprovision == 0)
-		c.overprovision = get_best_overprovision(sb);
+	if (c.overprovision == 0) {
 
-	c.reserved_segments = get_reserved(sb, c.overprovision);
+		/*
+		 * If rsvd is manually set but ovp rate is not,
+		 * provide the same ovp rate as in normal allocation.
+		 */
+		if (c.conf_reserved_sections)
+			c.overprovision = get_best_overprovision(sb, false);
+		else
+			c.overprovision = get_best_overprovision(sb, true);
+	}
+
+	c.reserved_segments = get_reserved(sb, c.overprovision, true);
 
 	if (c.feature & F2FS_FEATURE_RO) {
 		c.overprovision = 0;
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
