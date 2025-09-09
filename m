Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC040B4FDB8
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  9 Sep 2025 15:44:55 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=G8nTdoYnePCwVjHywAEhPzkizxXDR1bZOaQW1n2n8MY=; b=V43OFbX6rtOgcLXtFaa2nWXIUA
	VwJ+Pp+To37rF5v0TSohnHrt/DNY5EHX3CqGKDsCSEOFjKUCgoTUN4yQoJ5TUcih/t9o58NAhnn9g
	eA+6OP/B8gTfuli83o0nfolYjnIv6ozt9Z3w7FDJ9mZ/GrejL9jchsX7hD7BBAsaVmj4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uvyeL-00032E-US;
	Tue, 09 Sep 2025 13:44:45 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1uvyeK-000325-Cp
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 13:44:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=HgV+3Dxpl7yVMjEq7POCBJUJ8/SOaOp5wzlbkfMD+WM=; b=gisf617elQaJPttE2NFyKPVDu2
 34keA5CmXHr37UIwQWv+xwsXpcjE0qFx6Cjy+Uzq3c0RsLOct6WCoihlJP77tp2BDVvRSr9JPNEtF
 b7sc6xHWm0px+grIlE81rlKd0Uf21jFIHbmGSBJmfWrN8brGG0pu/QEvepzTv6kpPPzc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=HgV+3Dxpl7yVMjEq7POCBJUJ8/SOaOp5wzlbkfMD+WM=; b=e
 vshRcY+leNYBNkDLMiTqAA3t7FK7ytt59Jf1CjToJ7H21LB7TqeJhAw/rM42muzeNwnlBBhpFQ147
 zcIUzSK3l3ZXYBSOmpkqzM/4ur5ey6QQXko/PoQaQj5PKsokjnL7tAmkkxipGzNG4ki1LzObrMlMj
 +wsuEQT4ANZ5jE3c=;
Received: from mail-japanwestazon11012047.outbound.protection.outlook.com
 ([40.107.75.47] helo=OS8PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uvyeI-0000wG-QC for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 09 Sep 2025 13:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j0QoLl+R7EB9CLM+7FV5Jkp7KNwRHfD5+FmK0YwclEc/Cft6/mtjXWAWQxtB/A+5vNrtxMxkNnODQPVXlL3UgHMSUTjzj9LJnRkS78iDtGo47vIucelz5en/ySeNN4a5wqHW3LTMeCwzGCXZHSUUynu6BwxOwzSNt2uFhfpkfiehP6ev9hm+0+HPQ53fz/l9DDyZnjZ6RBO/uxL49ufVwchTzKI8JY3SoSCdPzRJ7xkR88ky/dWvCXFOcApibdK8iwmVBrsQhJFk2SDbCAaSfJY9gDPhzLoOFLEQcFrOXvN+sS1X68v80atcANELhUzxg+4Egv6kqq6p18GgNavB6Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=HgV+3Dxpl7yVMjEq7POCBJUJ8/SOaOp5wzlbkfMD+WM=;
 b=wMAK9JNnt5XE3iYwT12IkZ3BY9w/YVwHOgcyGpeBtuqxpN3kogJziSM1cnyMKxOzaaiF2OxCYQZDtY/dt6eG6wd518wdb02JHoTy3728ixAFuEZBgA0rmKeBiUdmocyEwNwX9J+DbsNOs4fMAZZy50ectAOZJqm9cZSVxxXy2qQrAiJn8F7Kg7ACBVX6PjRQA2Rq2glKxZOBQ4Z3JU4N/Aj6JdrR4alZwLc7Dv+krnXMOogiEdYk+aBaO72Jxh4GzDNA3UeIhu5Vk4S1SVDVf+hYkCe5zH4uYLa+NshRv5TdbRuTz7TtA30s6NTfspK19aIBNT0gzLbep6eFuaFE+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=HgV+3Dxpl7yVMjEq7POCBJUJ8/SOaOp5wzlbkfMD+WM=;
 b=okJJAWAx73BavWboL+39Y3gWnJ4YgG/xuDkHOECPNWfdAWNUfXjbUjcPRkbDhN8tKHK2H5yxnJzlde6jRvZgB9oF9nLxebfOOn1W9L2bPGxF8RojzrXA9Qu1ByrGYbOOFIEezvpqsvZAUwKtJ650rycyQcydg1m/zs0XyjfD7hEfR4DcmzD+bMOy8FVazz2YEFetPr0BO0NhuyLDs/0RLFsfZKQvAkrWzZaGlEcaB8SpcTOK7A7FPpYiPo9V79q3KlfhUtJPO22Io7pVMfRNtvIYW/2XvHstdWDrHRI3YJJlGUVUZKaqn/n/9ZZaG3VP2q64pLAu4Xg1OhE+XcpJ0Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by SEYPR06MB5376.apcprd06.prod.outlook.com (2603:1096:101:8f::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9094.22; Tue, 9 Sep
 2025 13:44:29 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%4]) with mapi id 15.20.9094.021; Tue, 9 Sep 2025
 13:44:29 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Tue,  9 Sep 2025 21:44:15 +0800
Message-Id: <20250909134418.502922-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SI2P153CA0012.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::15) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|SEYPR06MB5376:EE_
X-MS-Office365-Filtering-Correlation-Id: 9d573562-6716-41f5-1b23-08ddefa6ffa2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?KQ59yHEuEDaKAbrtN/vTA8HOTFNQFxU5ypy9Z00HwPOUbuRUh9lB/f9KUhBA?=
 =?us-ascii?Q?SQNl8iiybwjtoBy24Kq8+/0pMiZyrQrV81LKdLJPToYsa33TtMYsV4YvWQuJ?=
 =?us-ascii?Q?ZMp7jdmFaJnoqOdWRVdUWbaJBob8eUYGPBB5TmAkv/Z8tzDUDcVkbMVcpdnO?=
 =?us-ascii?Q?obrJjuTSlKr9skgPXjQfsu3+C1OozTNmeGSA8cc3D4KjbHPHTrQwaWosZFYe?=
 =?us-ascii?Q?gfzVY9bkVwgw481HyqN4/l9LLH0NwX8WzPFIFQKxT4PJTqL+C8mRXNCqTYfE?=
 =?us-ascii?Q?qr914GyClkoNhZ5WAiLdCwLLQYT0cCWyh4Ma7VfqJ2PgUaZUzdLyoMTaLuXP?=
 =?us-ascii?Q?CxeKg0Nq1yhpfF1ETwpqlmfjde4Orfy3Z0pK1HSuwCL0Wh6LlrT5AOyT4n4/?=
 =?us-ascii?Q?A9ZHQjE2C5YCtibSrPA4KYHYmi0L2B4tf0HakEksIgMDJyENqf6rAHMKCYjD?=
 =?us-ascii?Q?n7XBoutfNqqHk2tdugK1lwCsSh94uB60Ie8b0RowHgiIXLUvc3ioc0J2TXjr?=
 =?us-ascii?Q?8knYG0OWSuwf/087t2BHNyBc6QFPay4wXOP2SqpbVI9km0YSYWkhB5oyBucO?=
 =?us-ascii?Q?jNeAvAIZTVdDxKWQjKmWmgGDXoVDOYu+aoaOQE1hUrEyK4+/0mE+0VbKogth?=
 =?us-ascii?Q?yvSQgtmSd33v+Itcyq+b4c4y249dDuzLUj3LlkeNWKbTskYYWozcpCDj9xh2?=
 =?us-ascii?Q?NZI5CY7xU8ckZJn/M+p6/UnIRXN4nb+YHxZTUEM+6DZ9wRqaGBI7mQ7o6FtS?=
 =?us-ascii?Q?K6lG4KPShzXHMzoNKz/ChMxoUZurOvQxJehYWTufGeIcMFwiEMy+5W03oMq/?=
 =?us-ascii?Q?6S2gudB4GcFPNMcnIsO7rvc/uDJAWBv5hlJxifPwYJuqwQUC9Apezre2xVMX?=
 =?us-ascii?Q?DTqjCTD6RAEuVCCQ10s4v+G+gpuO7ti9vhSyw4L8XnzOIAEYP9RLacGgzqSM?=
 =?us-ascii?Q?o0UI3ne+fZuAMnakli3NU9A5Gfyx8m4AoyvX6xEWBRZa8XDq+Y77jC3+AwLy?=
 =?us-ascii?Q?Y2JIwK39UAHDbHcKZMx3RmEhe+vMJcRAYA06GvY5a6LKEHXz6745j8YEVY8G?=
 =?us-ascii?Q?0In7y5L/Gi15+krsDyYSf4xLOdICb77SM/l/dqHEkPm4amyzzafjh3p03yDQ?=
 =?us-ascii?Q?ifWs6t0ic72uFg8DBuTLHYHfGr6FLZaJ+MA6BFttAbvXSehBTxwkNTQqbac9?=
 =?us-ascii?Q?xyMLGUwR/D49gYwPkpde3Aml54IF0krHq1bmX+IdBetzwhuBe5Hh/ct6OQlt?=
 =?us-ascii?Q?p34nytTyWka2f7STg/VOjcDt/dnwk1/yWzbYv5IGUmvXgh502C7w9yzRfnY5?=
 =?us-ascii?Q?oqIboW2FFsdoHtXhwKEXRfYkWHIl55RanYWNAXbgjPk1zj/LEZO1TSPDrgta?=
 =?us-ascii?Q?e/C+bBHXLHXXiA8IJxxAN8YnbobwSeKyDh4FC3s0t6Mq4IQzX20EACrjpLJP?=
 =?us-ascii?Q?RPxuD3T8I4M75QMpCDiVdJHVP984taCqlHoTiLKwMvQL46o5Ke3LioHVVhFb?=
 =?us-ascii?Q?VQvQZbh4FMEZ7bU=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3QXLEKyvTK+mQ3zHAGcrcrBhNUKCK17rLRTLrGZrdPDsOx5L4KeFHKeK5OdS?=
 =?us-ascii?Q?nn+5xQTrnPgTvt8jkxML3oliWQHAaL3rOdBT3IXOTswvejr9SaSGrl5jpxvl?=
 =?us-ascii?Q?fQqLCu9iyt7adads+hBdQDFPXIuckQwjWjIl3rJdfxBS3uBrox9bL/KwzGx5?=
 =?us-ascii?Q?b484BhWH+t4WwGoMJ5CHtfcdq6xntWzol1Ld4b0J0u3Y0nLyLapIe90XKi2M?=
 =?us-ascii?Q?EK0/aU29oZ52sV7J/eFhck+0NNQl6zXEj9VuxhpCOW3Z/3ErdANh8MllqtfW?=
 =?us-ascii?Q?V9mv4d36VsnrXeYGk19uI26rGiz+/c2gr48DlIAiNpTf79i02k8hkK3JtvBE?=
 =?us-ascii?Q?1LmUqpubxzKcR5XY5GkqCfufdLyzzbP799iEirEdrfOenPE/A7lKslaKqgfn?=
 =?us-ascii?Q?wyYJ0MtnqatFzBJEm9JNXnnaU1iThoYFfr7cgdgldVKawMjz1dfgEx7n+fBI?=
 =?us-ascii?Q?kFMWz3kiQUpMcPtJoCjVfcsAVwuI+j9GV0MsCRu/lU5GwN/7ZiMJJu7o5Njg?=
 =?us-ascii?Q?/MX8dOvP7MswOvn25yXF33gLocLP9UzeGqmUVGTVNlXsAydf5mvEhgkY7p1S?=
 =?us-ascii?Q?1beVhRijrMxJih2Za2bOlh59ARsmil62QZnwC8fcKIuanSSnZZfPFyOgPeFQ?=
 =?us-ascii?Q?ULGoMmFeSik/7cXKeThY3Ugjsu3uzA6mYFy8SvEJtVsKad1eXs00fGR0u95D?=
 =?us-ascii?Q?j35eMKKT4a2IXK0amlcT3IQGpxw5KijzfP1H4mCyTy2YXaqTdvI/RyN1h/XM?=
 =?us-ascii?Q?MxFTJQR3kVJ8X6df/uaRrsI2l76+IrvRbWLC+eiGpyhM4zxK9AFHrjY6WrB/?=
 =?us-ascii?Q?QvbWQdMA3uHLabEcQKjnJQXXvK4LAArxjJ6fW75qnoa+dZFNk4Hojz4P03VG?=
 =?us-ascii?Q?UP4Y94ygC6xxwe1yGEXTqqLaIlYahrBO5haBlysWY136g9TpZrKOmC0TNcR+?=
 =?us-ascii?Q?QOtchfkb1Yf8Z/yd58ZyzsSvXNBd22n0OhyMvkResU2E7pBAZD2b6KGNaimS?=
 =?us-ascii?Q?jTjJmKKT9Kqo84Lid/g7Pmq935bqpNMQswItW9wKX6rCHlTmnIY76sv1px2B?=
 =?us-ascii?Q?+NpH51EVUsmIawX7lsIkVfmMGFUmoFUmqg79ohCGBoa4ehCyomqhYpbby/8m?=
 =?us-ascii?Q?JQzcVvXAMBslsL3oN9UgsHaBw7EQjNPL9pQlRazt0DlAirI8xhE/6b+Lmt75?=
 =?us-ascii?Q?YLtV7qRzuOgs7NISMbRVYs8yqvMmlSLSMl4OG8VBBM8YKfSvw7goHjndMXM1?=
 =?us-ascii?Q?PARnrI/yDmAjDrD+lShf7B8M2N9pKH/BsAM56tjvDg+GpSuBsRXMeRO6z3SF?=
 =?us-ascii?Q?VsdZmcP9JJL4KSpXdetgVzqLFsa2uCZhmSQFfd+mSEgknPOUEjULcWQtu2H6?=
 =?us-ascii?Q?Pcthi4GXRwz69uB8LPnlpG4f9zal5u4ftyyBktMQvfg3mk64ePQjupG1Qc/O?=
 =?us-ascii?Q?EJDuvrpR5znLonJRTyXyxvtlr7yFCfC37P51nXv3Ew+6An/WRssk0QqkKY4y?=
 =?us-ascii?Q?lQicOFZ3Zg5vswPo4Vf0nT6TNSnz/odko4XZLdjhv/mOab3Onjqk37aiqZEZ?=
 =?us-ascii?Q?mLQqjjC2HERdDPNlDPlsTLrZ+sEacsf4q68KEb1a?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9d573562-6716-41f5-1b23-08ddefa6ffa2
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 09 Sep 2025 13:44:29.0038 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: aWnXVqLED0tm77tFXvTC/hZRHqJclN2N6djhkPios14yN+4tVQLlwZSKODuYBavPuzSDyZ1tAQeEuBgp/edKsA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5376
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  While testing Zoned UFS, I discovered that the background
 GC results in excessive write operations. I wrote a script to capture the
 data,
 as shown below: Timestamp Free_Sections BG_GC_Calls Dirty_Segment 2025/9/8
 19:04 433 0 935 <-- begin ... 2025/9/8 20:17 224 14533 27734 <-- stop ...
 2025/9/8 22:07 244 78722 728 2025/9/8 22:07 243 78968 755 2025/9/8 [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.75.47 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1uvyeI-0000wG-QC
Subject: [f2fs-dev] [PATCH 0/2] f2fs: Some optimizations for background GC
 in Zoned UFS.
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
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

While testing Zoned UFS, I discovered that the background GC results in
excessive write operations. I wrote a script to capture the data, as shown
below:

Timestamp        Free_Sections        BG_GC_Calls        Dirty_Segment
2025/9/8 19:04   433                  0                  935  <-- begin
...
2025/9/8 20:17   224                  14533              27734  <-- stop
...
2025/9/8 22:07   244                  78722              728
2025/9/8 22:07   243                  78968              755
2025/9/8 22:08   243                  79201              706
...
2025/9/9 9:46    244                  273763             797
2025/9/9 9:47    244                  273930             791
2025/9/9 9:47    244                  274097             796
2025/9/9 9:48    243                  274265             791

Currently, in Zoned UFS, when free space is between 25% and 60%, background
GC is triggered without boosting. If the free space does not recover to
more than 60%, the background GC does not stop. This leads to excessive
redundant GC writes, as there are not enough dirty segments to release. I
suggest adding a has_enough_dirty_blocks() function to determine if there
are enough dirty segments that can be freed. If there aren't enough dirty
segments available, the background GC should be halted. After applying this
patch, the captured data is as follows:

Timestamp        Free_Sections        BG_GC_Calls        Dirty_Segment
2025/9/9 12:04   444                  0                  529  <-- begin
...
2025/9/9 16:54   227                  14339              29854  <-- stop
...
2025/9/9 20:31   242                  55842              1583
2025/9/9 20:32   242                  55842              1583
2025/9/9 20:32   242                  55842              1584
2025/9/9 20:33   242                  55842              1585
2025/9/9 20:34   242                  55843              1583
2025/9/9 20:34   242                  55843              1583
2025/9/9 20:35   242                  55843              1583
2025/9/9 20:35   242                  55843              1583
2025/9/9 20:36   242                  55843              1584

This patch currently only optimizes background GC. Similar issues seem to
be present for foreground GC, requiring further investigation.

Additionally, I implemented a modification to the valid_thresh_ratio to
prevent the execution of background GC when the proportion of dirty
segments in all sections within the range exceeds the valid_thresh_ratio.
This also helps to avoid unnecessary excessive write operations.

Liao Yuanhong (2):
  f2fs: Optimize excessive write operations caused by continuous
    background garbage collection in Zoned UFS
  f2fs: Enhance the subsequent logic of valid_thresh_ratio to prevent
    unnecessary background GC

 fs/f2fs/gc.c | 13 +++++++++++--
 fs/f2fs/gc.h |  9 ++++++++-
 2 files changed, 19 insertions(+), 3 deletions(-)

-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
