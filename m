Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 1412B9B4997
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:26:34 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5lIm-0003wh-Ew;
	Tue, 29 Oct 2024 12:26:24 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5lIl-0003wT-1w
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:26:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=VvZSFVU8G4lYBTsMjCjSOcByqZKQ+STlB0oq2AHmrLs=; b=AARN49BTjX0MVMj/TVYlb8GRkM
 BgZp9FBL7GEV9/OwtzfWCl9gK3Ox+uJDCj+ZHS6SPSKPYj0KDduGtqGU0YOpbah9LLO+hp9HrlVmc
 j6ZJMI8bIsx+rd3MFNBj58bMzU2+hPnqi6t+0ufEG6f5Fto1/1gyu2ijmc6r5KQLah38=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=VvZSFVU8G4lYBTsMjCjSOcByqZKQ+STlB0oq2AHmrLs=; b=O5+hLcti1s7fUhhOMUHvezrdGD
 6VNGDcvy+2354MfzXRmuUAatygz2zwMVMp79hcNC4ljgNkKOrlBEg7jdou6O3axTpWYMETdwZE5Gp
 ymHPX1mXDrUNHqqKmQhwfqLVg2o67SgPnV17jy160QC0HmtC4UziVeOredV4AUpkHVps=;
Received: from mail-koreacentralazon11013056.outbound.protection.outlook.com
 ([40.107.44.56] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5lIk-0000VE-6k for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:26:22 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Inv3fhSTUHf7Mt/qyNC+DbIgZ8EdBUXazW/vTTN5njuYUixJxu9araHx3I/XcrNDXEJC26swN+SfObw6C9y2SGYLDPuBYAbYEhnZlm3ZKc+cOvKygc2MlAAb/VfOK5Fj2P8BGqwGBsPiODzqdLk4+M8vDoEFZLsrCwyvN4DCNYqHwU70jag1JjwguyF+P80KaeVRxnWftoYrjRB+iqDwcOXa1fRmJZKa8rNkKj6EbLdaG0JFD7MLQVOPK6V10l5Q7aayygJn1ZEb9K1g4siH5ItXNAmYH7dzXJ9tREJ6vNyoT4noNjmU49vuq8VY2pQAutrHnWVfIPJi9vRN+Yxyvg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=VvZSFVU8G4lYBTsMjCjSOcByqZKQ+STlB0oq2AHmrLs=;
 b=JKcHVrCOq1ZCJ0s3Wr2CjNRq4a6aZqZ2PziBUiXvJmnKhbDgZejmWHtO1AJTFFGO///zkmQwW3RxBTxirl2/y+JOufYnyJWlwWb5A+/MkPliZJcSFy2Qw97zL+iKryOS6aoIaLyXrMSMWnQYze2lo7QcUHJLI3tFMaa4MRK8+uGMgZ38Vb0MWfyKWwBRNT8AqSs+njJX8qvIJnGKqYK+YQjGj+UmIaEOymxyahFy9pxPPBwZaYX3sdkukFoueypJvWqgO6BLsBdUS2IQ5J3lfXu/2PN7pMIoit26wwdPf3Yi+g0+Ig5ZlUX7QPzdtVU9+VKj63D5L2rOdN8+dv36aA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=VvZSFVU8G4lYBTsMjCjSOcByqZKQ+STlB0oq2AHmrLs=;
 b=BEzuJ/WAwO2QOVozIGIwIchOp2s+7qjEuu8j7G52U8xL/ZS+ZSzP7R8D2hnqTMMuIcREq8MgSjcnhCJcboPtJ4vPWxv7OXm7pWvFvOkwBgvZ5gpAaiJX4N/zWBHIhzTjCrjmjEsitjo5amUtH9KuX7Pa0aNZieRart1fLFpBW3k=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:50 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:51 +0800
Message-Id: <20241029120956.4186731-20-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 16658ffd-07d0-498e-bf22-08dcf812de48
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?YzqACBfRZSh26xE1nJkN25kTN4EfJetDWYAhOE9Jf8C2+p0/sQpZwIIHl5y9?=
 =?us-ascii?Q?Oa4Q73aYIgselfKmNr9ZcW4KLoGVodnHm9G4vWt3pRNu7hKg5A4x7Efo5CQ3?=
 =?us-ascii?Q?wb+vxU47iKlajX6ALYgK/aqVmXOKyoELwRwuQnPl592Q5qdqS5v9IjkuW03B?=
 =?us-ascii?Q?TxAj2EDyyQjqiokuv9kS4icRrIS2IZzwARwmAUVTpj6mXy4rGucxg3O699pM?=
 =?us-ascii?Q?+H2bKqDxzF+pbgxdmMkD1WxwsGeBlULv/7IcIHSJgYuau+OjyPm+qpZYTmsr?=
 =?us-ascii?Q?9ayhIexI1YY7atHPUBJ5Sleo5wfJOFe6aju7c8G0IhirtcyOEypfQEtsqk+O?=
 =?us-ascii?Q?thBG9uqK98MV4INEkuLkEKU4wTRtnYpSviPqajvtQhGYKn6qrz9aESzXfY0L?=
 =?us-ascii?Q?NCcSX4gAMFhSjICbaZ9oP7+wriWNIdXPXmIVlPBVsI4SSKWmvK20Y/hoCQGo?=
 =?us-ascii?Q?R7NyR6iFE98GQhzQVAgLSv+oPDKN/z6ZmwNYSKrvsz6Q8u82f0g6oIumcOgm?=
 =?us-ascii?Q?ixWOM40rN4y3IIoA7IHHDp7665wvIMa0KjVMUli2QSochu25FJojw0zzcBXo?=
 =?us-ascii?Q?Bkgi+skZzfqVJjTO2r1nyHouEYY7+Mdxq1gICKvjyr8nLs8jkxHUOGU6rEB6?=
 =?us-ascii?Q?Zy/4inv892tMjaN5MzQTXQ+zSiT1BiuIS5twRPtQPwJAe7GY9WiFS9XUFzzY?=
 =?us-ascii?Q?mtQkWuobWGgrRBTFX/hv8loMRaVgslZzyBQGzIX5GGZz0SLdfHZy+dY09uXZ?=
 =?us-ascii?Q?qI7ITHRf9DtuMwZXWsB5vfe/Qty2NN8WQmpDP6W+iZpmS2DSK+1jB8yGV75w?=
 =?us-ascii?Q?iXT82e2wrHiam0uccLGKNwD+N0LIsPt6ryHn+iL/4cNTnaGcLvfYF2QPWrvc?=
 =?us-ascii?Q?OzCqIH5Y76V1j1Jn2aiI+ABpnJ0Yd52fofz99hdJtFpUbNEv16pkFE4jsjwt?=
 =?us-ascii?Q?zPDwd2ACRJLvSQ/60cCqczZA+dMCvg8EoCkk2GR1uaetySfLq/TPqTfYJPyF?=
 =?us-ascii?Q?mRLuWievWPxWDYcV5wffyi9Kx4nZsEgd5ICxUz/qADkhvRmRp52wUmL0Na63?=
 =?us-ascii?Q?oWdjsxHiwKEsBc+Yb48cCn08FfE7mFpQd6P7acgr2eb8gXI3zDxDR0cEOpkw?=
 =?us-ascii?Q?Sci7IoS1Q/Bxo18oBmGMmLeFtQ4A/wmk0YTZu05VxvbK1Q4ZAbZu1X90Tdlx?=
 =?us-ascii?Q?mL87NWOpGQ6FFE/X8GnA92NPBbcVWe6QQ8iX/T4NxSsmK9kjSStD5O7D3HvG?=
 =?us-ascii?Q?NW4+Sm7S+ibTNJ6Nvqy54NaSebIwHmhYn8JyzzpkcaxtEAVNt2fhi84kEVxP?=
 =?us-ascii?Q?kJrPLS2yYRr8tdt3bGgAZeMvp3UMj5Jntezo5rUx9vkxyQPSNnPjDsgLU2gC?=
 =?us-ascii?Q?X/EKEAM=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SVywDv9VVNZkELBF6JpxT6IGMXGRuuoOQ6mVxg4jq6DfCY8TjHsIpDwtxRA+?=
 =?us-ascii?Q?S7pZ5sD4o+LxnsTTUdOcuwpz21GBiD27wzFiCzyZh9gFdX5f/MmqRx4GC+bo?=
 =?us-ascii?Q?xcvLzSa0kfVfW+fB0CJbrmjHMt/kYv+NQhYm9JlDcYTa8f+3SZzAFajWcEZQ?=
 =?us-ascii?Q?EH8q//MJds/1BxScknojQ0pz328xCJvEIknWEG+dtCYTz2zgasPwn50ugmSM?=
 =?us-ascii?Q?W9tjoWRd5Xbm9YqMQ3Ug0UOYGPuCfrH08yvdV4ZFEDQlGnAt20agrcCv7KsK?=
 =?us-ascii?Q?9ODlSeNv0TAAxcQk/nYuv8cVo7qQmBdR7MUHnvcddpqvBIaUKZxeJqJPLmTs?=
 =?us-ascii?Q?6290ptzvGVKzAyXvfwE1RIm2xgK2OtoeG2PlC12T2V+D+/RLoT9wgTbiO1NH?=
 =?us-ascii?Q?Fyo0S3A9pKUI+Usnhmf1QzPg3XrdVQFmKvjr/QjrSIarmdkyhx2FYeJIjvo1?=
 =?us-ascii?Q?i6lJbQsF0Y4W5ZiuagvxaXH5wr8zKkLhTo0TJkGopTIPTGIT4vW1nH4XL8OK?=
 =?us-ascii?Q?bdIJAHz3LpCjU3Mas+iiJhjXUR6wieyRWRjG+a+QZ0i9LiDEHd2vBBb11fMT?=
 =?us-ascii?Q?DU6KKik7zs4q58IaMaPI34qFEY58LDD8SsuiE/trTNNfe0qYU7BiwxamZrH5?=
 =?us-ascii?Q?CUimH/bsKP26HibXpfXcdbTyjXAaUudM6f+NstJrPRHMGwI0NfKonAeaA3BZ?=
 =?us-ascii?Q?n4uavsAXfSA8SVeTKTna9zeCwycRdYXelrXyERtezADeuCDg3ABgJUrsEdyi?=
 =?us-ascii?Q?zGqits+XEsNlM9PyPVGvi9ga8Wej3/j4gLvOw2swF+IJLAF9oLVYDwzddnr3?=
 =?us-ascii?Q?wNDuMES2pFmSrKaMHEJ82Ee7+VhxSgprMvkXfgS3trkLAXCNPYO+Dbzt6J/U?=
 =?us-ascii?Q?COPzjOlhU+mLIY3L6Cab7TBXYouDkljl64YULWbXhtSEG21liEiKf7D8BtAi?=
 =?us-ascii?Q?XNP5SLvkz5Sn5UpUKaEs/B1P/X0Kx849T59QrCjE6N37Js9TiGf3PAtMoG6j?=
 =?us-ascii?Q?TtSlkeLhFQuexRFfCquJ9JU50ImqEAtsuskL6xuIz4y9rRe53nWiF0X7R9iu?=
 =?us-ascii?Q?BezFQHOfDu6JVw1n+ezA1rx9yPQyEJJI9tXjC+aKVxSnf2A7M0bTuK+JpuCC?=
 =?us-ascii?Q?R9842NDk6gwFnhFeIpkuATwPQbywjbofW76r2X/E15J9Iu8Zo0b0LFdTvItQ?=
 =?us-ascii?Q?fngAEENInBbFUbwT1N3/KQZlxXiMGic3qhnO9c/QA01qOK1GaxIxVRArGM78?=
 =?us-ascii?Q?9xKWz7RKAjwbBmfiudJ3Ar4LuJkXeQHVYfUS2z/hc8s2BXaH6yPxVua/+CoO?=
 =?us-ascii?Q?xyMmhVW7SqgoXelC82maurqkaU1i10F5NqHaEDZ0A8kiEOTd76LudMBTNpTd?=
 =?us-ascii?Q?WqCJu0GjqE9VZ+jTjbfTAlZyudkcSHr2TXWEvW5u0rlOtEV5Qlg09W6V25CW?=
 =?us-ascii?Q?z3evAZh0vNE4UmJRbdkLPN8jkjEAdErZYWTB2HsKRBjAYC0NI8R6Wy9/0loq?=
 =?us-ascii?Q?f+XaiX1N9jWEAiwXhgOL48zpLVSQf0tqiL9hy2a15qjCjEMCuJemlG6OwsVy?=
 =?us-ascii?Q?a0jWuVGBRyN9zfBmtn0tWEgB2QTEi/yOjFSgmiag?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 16658ffd-07d0-498e-bf22-08dcf812de48
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:50.4095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 8VSCnb8kcSICpJsQTvs0z/Oa0060cw+lAslxYVfVa4b3ATUF5m310kmRvgoBL+WbZMw71tJp3pYy86/FNf8laA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_ssa_bad_ofs_in_node/README
 | 5 +++ tests/f_ssa_bad_ofs_in_node/expect.in | 34 +++++++++++++++++++++
 tests/f_ssa_bad_ofs_in_node/script | 44 + [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.56 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5lIk-0000VE-6k
Subject: [f2fs-dev] [RFC PATCH 19/24] tests: add fsck testcase of fixing sum
 entry ofs_in_node
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
 tests/f_ssa_bad_ofs_in_node/README    |  5 +++
 tests/f_ssa_bad_ofs_in_node/expect.in | 34 +++++++++++++++++++++
 tests/f_ssa_bad_ofs_in_node/script    | 44 +++++++++++++++++++++++++++
 3 files changed, 83 insertions(+)
 create mode 100644 tests/f_ssa_bad_ofs_in_node/README
 create mode 100644 tests/f_ssa_bad_ofs_in_node/expect.in
 create mode 100644 tests/f_ssa_bad_ofs_in_node/script

diff --git a/tests/f_ssa_bad_ofs_in_node/README b/tests/f_ssa_bad_ofs_in_node/README
new file mode 100644
index 000000000000..65fbf6aa4f1b
--- /dev/null
+++ b/tests/f_ssa_bad_ofs_in_node/README
@@ -0,0 +1,5 @@
+1. create f2fs image
+2. mount f2fs and create a regular file and write data
+3. get a block address by dumping the inode
+4. inject ofs_in_node in the ssa entry of the blkaddr
+5. fsck fixes the ssa entry
diff --git a/tests/f_ssa_bad_ofs_in_node/expect.in b/tests/f_ssa_bad_ofs_in_node/expect.in
new file mode 100644
index 000000000000..a3a6c94993a7
--- /dev/null
+++ b/tests/f_ssa_bad_ofs_in_node/expect.in
@@ -0,0 +1,34 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (is_valid_ssa_data_blk: x)  --> Set data summary _SEGNO_ -> [_INO_] [0x0] [_OFS_IN_NODE_]
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
diff --git a/tests/f_ssa_bad_ofs_in_node/script b/tests/f_ssa_bad_ofs_in_node/script
new file mode 100644
index 000000000000..a9d17e5d045e
--- /dev/null
+++ b/tests/f_ssa_bad_ofs_in_node/script
@@ -0,0 +1,44 @@
+#!/bin/sh
+
+DESC="ssa entry with invalid ofs_in_node"
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
+base=`$DUMP $DUMP_OPTS -i $ino $META | grep i_addr | head -n 1 | sed 's/i_addr\[\(0x[0-9a-f]\+\)\].*$/\1/g'`
+blkaddr=`$DUMP $DUMP_OPTS -i $ino $META | grep "\[0x100\]" | sed 's/i_addr\[0x100\].*: \([0-9]*\)\]$/\1/g'`
+echo "ino:$ino blkaddr:$blkaddr" >> $LOG
+
+$INJECT --ssa --blk $blkaddr --mb ofs_in_node --val 99 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+segno=`get_segno $blkaddr`
+SEGNO=`printf "0x%x" $segno`
+INO=`printf "0x%x" $ino`
+OFS_IN_NODE=`printf "0x%x" $((0x100 - $base))`
+sed "s/_SEGNO_/$SEGNO/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_INO_/$INO/g" $TESTDIR/expect
+sed -i "s/_OFS_IN_NODE_/$OFS_IN_NODE/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
