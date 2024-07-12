Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0801792F3E4
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 04:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sS5bo-0005pq-Sg;
	Fri, 12 Jul 2024 02:02:04 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sS5bm-0005pi-Kq
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:02:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=hKWDQ3YfwGMZOrGtB/1wlMBM7CcEx8zZa47nQQeft4g=; b=JXaltZafjxCg0nr3Xj4/47cBWt
 D7WcHrGq1WQM/F5AGu8QbmnKwVV5JA7vLwr0qnN9TO9wbo4lAsppO/zrggfbBDlRWJCLo470au3Hj
 gjoiN7rHAyWUv3GiJHzOVCWzEjH5WR+RCbXPCml9VAlfoqmBDZ4DoC9261mB8SeWYgM0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=hKWDQ3YfwGMZOrGtB/1wlMBM7CcEx8zZa47nQQeft4g=; b=cYUHy9Ahxh9Ug4PQqOUisDaRRh
 idciY6wkP1rLHo3q8IxUlY884RuSKSu+0+2hD397w5UmJsfy6HE5AL6d6nVH79zp4RngmpT0AsLdS
 90BUw3jTJDPJrxd8ptX7FYsnTaQp0tyPOGrIewXYNeTPE9GfSiEMuFP/JFzGETU3qSXs=;
Received: from mail-tyzapc01on2047.outbound.protection.outlook.com
 ([40.107.117.47] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sS5bl-0003QU-LP for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:02:01 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xNOIRkFD7/RO6d33aolyiIv1dU1LvhKdT35nwWLvRn8yglyayv4dcXSUup5KJgnruVvSezmttFUqKSqc9HQ3/PEj74lC1KYFsV3tEHm+rQGeJ9UtvinjYR8ZpRpXfhmSM0KMdeYli0yeU1myrMkWeEhoRX65Gk/Xsn9mWfz8TZAX6d77Q5rV9W4NOPI5jxQTDzANROPUttYEgfZlm4DeYsCoX1623q4E5mq4khJsUP7cucoMhNGzfj50IRj60TiZ8AUFTVqQtU+Jm8MkRUfZmmjpmxZTzEUv1NsHMKmtyp1efH3xCP+VPd2cbUWqtI9EBbCTEaUt7QdsXnc4eSdKZg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=hKWDQ3YfwGMZOrGtB/1wlMBM7CcEx8zZa47nQQeft4g=;
 b=ap8xOiRb1+AgWMHVsIy5aMR2Ukl2aTXuDyaOzDr5Auras6p4gDeSRb0wb9H+9OMQMBk7h9mM6YmuVEooQvlJOboAIbBmj71ZMQnyg5BxYQePBQYzlquZVYKSbrKtx/9C+vPYKg3mUVIgoydi82j5nDo6pxeg++Nmcq52IrN5zb9tEW9I0ml7eM6SNqM8iN42117z4sf7O8nUkIF1P0uHdJ8m6LrSNk9HayEPZ+jsW8HdfDY2/NZvckBgfMbNnlU1o2Xof2Pz/aCgTKGobJNCFb38kZea5/eIx8kv5KTJy1MCHpIRig4TjyDHJLb0LKgrwLRNDMUn+96IIT7muMp+Ew==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=hKWDQ3YfwGMZOrGtB/1wlMBM7CcEx8zZa47nQQeft4g=;
 b=MylNFNFykzFZigkK7DwDgZlk7OFMihPU5RsE3vY52rMThEOyxiRjer2W18zTQhXSuyEGUbZd3OTwvoPlQxm4ef7YA8pdDKg1g3gz2kq+NJsuT5IWzmI3n5s8fOUIGnmGZEgFK9TyTZFbkWCrcWnsQS+nWZH3PGtu55cNEGbF0Fc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6621.apcprd02.prod.outlook.com (2603:1096:405:28::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 02:01:48 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 02:01:48 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 12 Jul 2024 10:01:32 +0800
Message-Id: <20240712020133.140148-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240712020133.140148-1-shengyong@oppo.com>
References: <20240712020133.140148-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 5ea80e87-5cc6-4f55-203d-08dca21696d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2fovN2Spyd0WYpwKjVjYwJwsXnJ8MaSh9hUQLA87aXOhoz+ZcD9eywZUDci9?=
 =?us-ascii?Q?y7o3MhF6cSCXLXiVWsifvI3twgRCSiXE9bN291eDz5jUF5C1lHiKAPWHEery?=
 =?us-ascii?Q?6ms5RAJUlYprEFsREY3GQ4/AJ508A+TbwThhW+jVVse8sXBRQt0nM04Gfipm?=
 =?us-ascii?Q?5DUiRNdSs90HL95wKucDUzfeYQEqh7uFEcif74/SnvVKGAf/WrN1kMuFwbBA?=
 =?us-ascii?Q?qHBul/rvZw/WN75qxxvHWAOjvScs3cx2KaAUHFidpTjEtxYzbogC77sSJLCw?=
 =?us-ascii?Q?VM0erWNlbDBX/vBu6LpgJ3jYe0fIWe08GlpI8ZJM2NmqNI36aV6l/9DJegNn?=
 =?us-ascii?Q?80j7z1jf18cLjgcTw3N4yvEzztrlCV73QsREhVZbi7C/4sltARMityL3Wbgw?=
 =?us-ascii?Q?qi8S6JKxUxnDqO7jWg15yzCKYMd/mfCY+OzJ1tWxJTn6U+jgn2MSwuYnUjy7?=
 =?us-ascii?Q?prqnNpRUop9IXnCYQGAmLIW3jKLbZWXW2P9opwY7USlYV8mWDZJQasFsWrIg?=
 =?us-ascii?Q?jjglWv2Vx66iv3WDZrY+wh2aZ9PsbgGyPdX0CTblKC9PcRSBcKhPvK/gkebn?=
 =?us-ascii?Q?xHGN2GIfq0mu5eyG+nwNiPwB3QZbqXWM7iSS5VCddRczVimatP54e5AFbWZh?=
 =?us-ascii?Q?BFbCKlfEB720wTiUPH5v8HLFHbdg83BT0Btapdn447J8TUkM034zBC0z4DYO?=
 =?us-ascii?Q?DMNN0fIB9VG4mQDmS5iAE9Q34y1RbEBKrxg5aC57TBx44sZymnbIF4HgkoTh?=
 =?us-ascii?Q?+YxXgL8N/mVPRztLQKH7usvDPn3+F+pdIlBNs57YWQmpkOIcqjB7SrNvP/u4?=
 =?us-ascii?Q?ypKZVtHqaNvW0L7IcaeJwHkh63P21fviyTITNWI19ftknhgERqDJu+jS/w01?=
 =?us-ascii?Q?N/OdD8x+LKPE/Xa18bCscqFGVsB5KkI0Orf0pjc2CZex0W5M3oZrzaHilsa7?=
 =?us-ascii?Q?+N4AflYofZD4DMss86cH83QP7QuuJmOFCjewG4wJg+Ot+uN/IuGcNvtVB9qH?=
 =?us-ascii?Q?gaS7nsywvh2vn1Ru6h/Mqd2zrw/rF9y2Km390Tk5WNhoy6fDvc7lurpNUlDB?=
 =?us-ascii?Q?9VU333L18Y4RItlY+ZIwmf4DO3qVB22Ranp6+Q6q2UNF5iC1brjxBFqsOnAc?=
 =?us-ascii?Q?MMW4hR2rKa3BwsG3dksIDl9l0CjED1ka2VQu90K6wQ44JIDEWVpMA7ydRgcI?=
 =?us-ascii?Q?ofi0dPC2Fb3YTjWicYNr1QfmVVoFMg8pgwO9Qo28jgPp1jBir276caLEZcy9?=
 =?us-ascii?Q?2KOOyBLm67X+YiTBBX+WI6CZ/n0v5ccTYtoVNY0A5H6+Bf/2T2zA8d4Hm3s3?=
 =?us-ascii?Q?YcU48tS0l5Bam5rfNTLSKUMJAt07B5pC4spku3p3CQFPvrgXUCp9/3V4Km7a?=
 =?us-ascii?Q?hTo5OMQEJJfjMoFhuAPgeznyozKaKbnbrQhwuJ49INXzxT69bg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SGXuP0fqxI4RQG6B2jmI0/fwUmSNYEVtrnET3nWSH+vYvYcazFNv+nyjyRIC?=
 =?us-ascii?Q?OILSFFlmsa02bjpqC9jPd7preiVEKmpfwXH5MHKeMcGX1D+KiuVrAY70NdK9?=
 =?us-ascii?Q?vdWdxGLpDxkPjJ95iTDDz5IGbVN0unbjc9aePnEOhJxCDdBIGM/yQoM/uPFS?=
 =?us-ascii?Q?7/Cx3xs6DxTrAKjJWKu1poPPuSYD5XscgjghiMX3FVNKRw6SAz3sTKV2M2JY?=
 =?us-ascii?Q?g5QQBN/dmylIWGKXOn2Uj09vHInSyvBij88fz+py9Z9UdEeZxJeLctJHcEnE?=
 =?us-ascii?Q?sAw8mFO40I7Y6yBmmr/4MuDRsVKic+RKMXF07yEEp94gOMlv0DzxrhnxeCeP?=
 =?us-ascii?Q?ckl2aaF6PsYQQd7enQD/SGQXyWFqwsQdePqHZYibX46cw6r7MTNTdOpbiefg?=
 =?us-ascii?Q?PC+p7Qz2VgjWdYiSTM9LZf/vkpdFIT/OfIZnbNw61dEkdcem8X4PqvTtcSsJ?=
 =?us-ascii?Q?vJbs8I3LqLnUTbM7yKViMZJ7LaVMlvxtoQJVQityTzJK5E05epxQIuMk0y89?=
 =?us-ascii?Q?Dm3uj1vL8q4DctkVxkuhjA20kg39cocSw/I8xbmOQjwwVrb+nnai3w3EfATH?=
 =?us-ascii?Q?KeKMndypAVfUHaSUgVbc9AEeUXqBxO4nJAsy0dmhdv54nLz4yasVAJ8V6mbq?=
 =?us-ascii?Q?9frSz6zw1BPIu8Y5FRdZHPna7c8QrOMEny4WL0CChyLlDTsQ/m3O0URZbN+g?=
 =?us-ascii?Q?2Ezj+AXPCi6wpSI4G/U0ZDECc3I3D1Je4hU3CR1zggbUbG8Ck6fiSoK3LAMF?=
 =?us-ascii?Q?bYGvE4cPNpcFjD+bcusbn8/k2T15uTnFj9CFeFIvB8O0uVkalHFGpB1Lh6hG?=
 =?us-ascii?Q?+fAZ6gcShSbBdKVTyCw4F9k+U8DU7bHPjg90MXbFm6/KTCxtgUJ8bBtSYh9r?=
 =?us-ascii?Q?6nvZ6jDMqPhfwZPhkVwxjDdGu1GUwoibcWtkCvGykoMrvfN5Oqv/AaOeJtb0?=
 =?us-ascii?Q?6/i8w64vSQ3RGAnIxcOrvawiDsf7H+3cX5XE0ToqHz1Bzb/okEB3mg4HdMv/?=
 =?us-ascii?Q?Zqyyg7H4i1zQ+cqLYDGhMPRfqRUdmEnxN6czDCQfHvkBnRpSS8NGL37wKV6B?=
 =?us-ascii?Q?QrfSjmsQ0NQHT8z8iSPQs5sNALfTK4k1gWpGa6PzLuL9erDyZSCNO4V8/AqO?=
 =?us-ascii?Q?7cxkkevjUGTY8hez7uNbrJR8WnmrZKsQBC7n7FiJYgpOtOGgH6Z5X0oBGtsd?=
 =?us-ascii?Q?tvbvOFCPHGE5xyadT8JgkTsx7SvJT0U1bHdf6B2W1c4WiLOp84RH/EZsPG91?=
 =?us-ascii?Q?Id6e1dbnHf2IRmdQeQPOlMWpT31MIAqgo4yWUjtLTxXC0Gm1rwyOGi4+Lrtv?=
 =?us-ascii?Q?UjIR/FfPly5rF2cQdc3+m6OuP56xNZ8li39BIwnrYeG3KMVx6EeZMqIR8saG?=
 =?us-ascii?Q?FUQ5+84o5gbNTvX7oi+kxC94x02csqsf/vbT/yOFgUF5hfwrgTe5nTtLjpu+?=
 =?us-ascii?Q?Ggwhg+FtmEYfPtxG3R44gFolDE+TaIDmpHJuZVtRXvZzHXmXhI3lsGy+nku1?=
 =?us-ascii?Q?WFoQ/fX3MVczRxyO0bSNEd+C6pGQYu4cBfBwT/D13pGTVGdpbxIQjIENRdMU?=
 =?us-ascii?Q?3wBpsbEZq51ZrKaXJgGylBvmPjE1VgFLpXpJgE6w?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5ea80e87-5cc6-4f55-203d-08dca21696d3
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 02:01:48.5025 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YvJK7Q44YIc3y/o/DpE8n5dn7049NgeIrnGt12r0NjosS5NLvp8gGsZTU1wfHMoB7UMQ6R0oMapTrRu/TSXQlw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6621
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  For zoned model, the first device (devices[0]) is not zoned
 device, whose zoned_model is not F2FS_ZONED_HM. Let's skip it and check write
 pointer of left devices continuously. Signed-off-by: Sheng Yong
 <shengyong@oppo.com>
 --- fsck/fsck.c | 2 +- 1 file changed, 1 insertion(+), 1 deletion(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in bl.score.senderscore.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sS5bl-0003QU-LP
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix checking wp of all devices
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

For zoned model, the first device (devices[0]) is not zoned device,
whose zoned_model is not F2FS_ZONED_HM. Let's skip it and check write
pointer of left devices continuously.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 6cb02729aec7..b15931eba3a0 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -3351,7 +3351,7 @@ static void fix_wp_sit_alignment(struct f2fs_sb_info *sbi)
 		if (!c.devices[i].path)
 			break;
 		if (c.devices[i].zoned_model != F2FS_ZONED_HM)
-			break;
+			continue;
 
 		wpd.dev_index = i;
 		if (f2fs_report_zones(i, chk_and_fix_wp_with_sit, &wpd)) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
