Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CE251B1C102
	for <lists+linux-f2fs-devel@lfdr.de>; Wed,  6 Aug 2025 09:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vJckg3Nt/CU5ZTGss6g5avvlQZMLRyDCqv6dOetpIw0=; b=bsbS5ObYO+SSUZRmQnrBlMvxGf
	s+sciQlXpZQLByIY7iTHMKzlbj5IIPT9c1PGnSxXvCbfEe70yEkbF3e2R+ub90zuXjC4QZQrgr6Sd
	AMqDkNnVx69Gtpa7fkxNR59IkRXSmO24J0+4jdCOMyU4bVnN1r6qLvSTymsfFxZaKS00=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ujYI1-0004fm-3O;
	Wed, 06 Aug 2025 07:10:21 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ujYHz-0004fa-Sk
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 07:10:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=y1WTNGxFRvGA5/z7zJPtXMT5MIBROsqeZzwrbaf6haE=; b=UKfvYHlVmJryCo7vgdnjz9XzKS
 jR12dGYKJpSZi98/pFfQIdvtuAmVnWErjc0NPQqmLtNZ93lmZX3F988uuyqctYuSFDnfTGJqg/VXC
 WdGLGzk/PI3dqKRRja1PI7in2m1tK2kNjQPkU/mtVNcRzD8BiS+E8GXxbaPhy/X6WfOc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=y1WTNGxFRvGA5/z7zJPtXMT5MIBROsqeZzwrbaf6haE=; b=HvxkH8jSYOeMWjBEXOe3yfBApU
 A6Iy3kH4ureIgCHXzv1eBnxDPQCX+E0Ps7tQkn485JstVX4esvGIjSzukOZlwXltNV9yQ4AVIEw8i
 Feeq0NnMdixNf7HA0a9PzGeIJbf0HAC1D+mKIFVdmuNuF+anwArzTT0KqHA5pnTt63Xw=;
Received: from mail-koreacentralazon11013033.outbound.protection.outlook.com
 ([40.107.44.33] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ujYHz-0003tT-Am for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 06 Aug 2025 07:10:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+54cp9tFK3pdWPPP1rtVvPSY/judgfrU6iQD7qExQ4rIpDQDRd3nObcOwSmha03kHXlm0rbgzvmg+IaZHrnNk6wQR2gU0tIyiSzRvqL8AQkCimx7zZ6JjDCoIx08UnK+NDmzJRQPGc8qIijlTiudVWJVzKxvJCN7C6BLnf9/8sXgObTKZUuYohqdTtqW6+zO5l8qWSX44vcZwMJLdck07whwO3hZyF+PTX4oQISkcFJzF19zE9tqlrLWgFnf4Ns7d9hY2UcIDxnRxlel98XxxJjS65/KAlASOqjlx3RrduSvheEVRwXESnb49xDriIw08KAM0wcs8K4muamxz5iiA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y1WTNGxFRvGA5/z7zJPtXMT5MIBROsqeZzwrbaf6haE=;
 b=dmEvK7P778yy54QXTsB8MKqllMwMozzDP2lnNw5A+R7Fqdl5YInQNFBZhlnIO9xPPO73E+TkCBN0NGx5xkUfxr3L3jppBda3Nlg3p5edv/+nVyfMoiAqfFcsgbmObbrqbVKZTWilKC9/NeggES2/LnpdaFCC6cpdQQuz9bi6BHW7b6L9nkWmnsqRJq0wP/0XBz9lGUXHJpmxnA+JXOFOeXrFAxLpoMeY2DuAOH1eCih4QHMuAyIZMPgWOWdoi8Br2ED8FYEJfMmd6U5wW8e3y4/7SzyFG89owL4/wRLdEJx2qaZRYppkCQfoATnjIvleAVPBW4FGGaMibo0fXf1mfw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y1WTNGxFRvGA5/z7zJPtXMT5MIBROsqeZzwrbaf6haE=;
 b=fN6kixZh20Gu22t5/UwzjhK1kEx5c/gXH1Beec+JOW7DmOeQOqK/1kIqTDCc6EKoydORzlnFeRtkdlTs8OaZVY8IHrtjbN/DpuMK18gf61sZaszbGIB+eFusGYYbhel9ACFy0EPa5Me+WdVADkcNLvbJnH0GLnVvIAFoOtjy25qyM/dNZLjZMyhodcPd3J0BtpdCBsuGPFM1qs9tyPWVCuysC+iFhul7dPHu/faIpjbv1HnuhFRUhaEyPx2kSlABinbHg5UcmAmqAoTqhU5JVUIZpyYZWyQiXAjBxTTHC05d4FBHqqoRHHpX9QEYgtnvdmZIPHqMLhnmK4HJMRPA7g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by JH0PR06MB6723.apcprd06.prod.outlook.com (2603:1096:990:36::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.21; Wed, 6 Aug
 2025 07:10:03 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%5]) with mapi id 15.20.8989.020; Wed, 6 Aug 2025
 07:10:03 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Wed,  6 Aug 2025 15:09:05 +0800
Message-Id: <20250806070905.71012-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250805132208.486601-1-liaoyuanhong@vivo.com>
References: <20250805132208.486601-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TY4PR01CA0043.jpnprd01.prod.outlook.com
 (2603:1096:405:2bd::16) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|JH0PR06MB6723:EE_
X-MS-Office365-Filtering-Correlation-Id: 20e06d4a-6511-4b0a-6bdf-08ddd4b8431f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?SpC9+9LN8xNxl7bURAQ7wKw8CQnyKa7nC2iTB4l+G9uPzap1xzl1whCI3+86?=
 =?us-ascii?Q?m7HHPeQLy8TK9KioGrHo/Y+IgbDF7UaISRWqgF0Sy6kXm/IiDMGqexbebs8r?=
 =?us-ascii?Q?QdUJKPUd3E5BUVmLeijWPibiJglOtEXwSeEIdem2tAChh0QrBuOo4POhjBBH?=
 =?us-ascii?Q?l9ONUfBjGbHyLx1zw3vbnFf/yxCKoYoFWQbk7UOMyafzWGx0rBc+kLBcn6fI?=
 =?us-ascii?Q?0CDk+Z42RxWIwPpsKrIYHN/d6EEJIPEcZeJcQJLSAxoonF0UO+hP30SRHj4r?=
 =?us-ascii?Q?LWjtUAfY1SsGKc0T5rNBU98r2tcKcvJ9WYbB9xJqp+OK4KJsSq3sZJ7P6yf1?=
 =?us-ascii?Q?XUsSuyWvzikoAHe4N7YiOn+Z9fKGcb1/dLEXpW4spRQ/6iFPYT2IDzOCt5qz?=
 =?us-ascii?Q?7zuMQUTw1PV1SShUNNiVT/E232sItOTRDpvjnweTMPgzhMMdWSL1oeTn9Pfk?=
 =?us-ascii?Q?7pt1EB6xUlcnDlcSfqxmqInEo0upKIKObSea+bhJJV0y4NehPKgjQiT4yIWu?=
 =?us-ascii?Q?+rD2sFti5Z/iWzhaKj30QzcERQ1oelOq3QBi6rbYmITtI6fKPqeggKKs1YKP?=
 =?us-ascii?Q?1hS82+crVinjtXoHnpyIdk0VNzbr73rX6UcEZ29CkdnHswZ9RZSFnMtVLxPL?=
 =?us-ascii?Q?lfQHIvfXuWG8CoUbeAolA3U3LHuJGpkQGjkWwkPOGVUZsEmn8o4S3ipSGCbH?=
 =?us-ascii?Q?0DZyn5fMDpxqCMANzUSKoUMf4UHqFnk1Qwsm2Ej8m+a1i5a6d0/TK5M1pkWz?=
 =?us-ascii?Q?nz0Fw9pma5wr2W7bGTVoM8F4KjJ18xZKZdy6v/K19N4khaAVWFQSIbPjXJMh?=
 =?us-ascii?Q?7OlICwlBQ4kwH/ROZf/RnYQGX4ADQLPAIuDeeUvoN2QBs6XuPAzLImXM8vqZ?=
 =?us-ascii?Q?NxlZrSPUwQzdWJNRvtNna2SKj5S6FffRpu7+ndmemg4o0pLptQsofCnLadhb?=
 =?us-ascii?Q?njPJ9t5AnuD1mdXb8UWusw7QwzidQeDqM3ewjGDqS/cxBC51Xysrmpiw7VoV?=
 =?us-ascii?Q?3fER+DnpKSluP49RS8pYjg294c/AYbpUH1PAW4rlSPgNobQRAQDEPVuK8gBD?=
 =?us-ascii?Q?0nQpHNL24d+D5a/rD/IowSAn555VRMwnGOhOJuJO4SgGZ55Y9AWFIOCICLaN?=
 =?us-ascii?Q?ukExcw5a+I/xWdPWHXZb8RcTv+9Gwhn4Jjj/XUa65uAv2mGX0U7MlbZ88HDI?=
 =?us-ascii?Q?hmGXsLXIxj+Rrj6aR5dj7VrNyQ99zgJKRKoFfztmNDflAAXugZe9+M+GyO8+?=
 =?us-ascii?Q?szFRu8DEzXrlfYaL0Qf55D/pLW9P0owHsqGW1BfDgdVL1iWRnGCexH/EfEjJ?=
 =?us-ascii?Q?0r3ogjN/eZ7vXd1uP+C+RNmGPSN4IpsX3jZtiW47qGgjGHmrhRf4QPYjWB90?=
 =?us-ascii?Q?ff1Xjkq8Wc7t/Eim3dLt6GwCCYsQ3oBSbMpuPsjKo6k89LT3s6AKqjWQ5aGU?=
 =?us-ascii?Q?TJ3uaCoasg0r3JJkkL2JZ8dmPXt41uNBhKEkA0s73U1m8lel/9WZCA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?sj4Z45Uhr7m1chE519Xolr/K6fTYc/6x0sWiqEoKtWjR6dtn0F4eXPh/8c8j?=
 =?us-ascii?Q?Fr6gw+LO2ISk9fkUgsiPeIMZddAQeegsnnJrQ163rMSNiwOh/uV1a4Rjhbc+?=
 =?us-ascii?Q?MpZWXWOdGnMt2e2glabW9bh4ZyMh65MYD6ajUShz2zBBVfgOOEHG2VFzZddE?=
 =?us-ascii?Q?r6Yie+jtaYXOGZfQmQqL9OuVrRY+V/i8iEEufaqk19bQs4kftLs0rKYp46QR?=
 =?us-ascii?Q?bY5tl8gFFEdjjHgvFg192udm522oHFVlSl38j2ZpitaYqoC7TYW3mdSt40Ht?=
 =?us-ascii?Q?TbV4uyEKAf7gZ+NW9/8yL2EYs+SjHByfAnFw0yLH/waL4DTVe96icf8HxUd4?=
 =?us-ascii?Q?mw9w9R6iHweNclDfGqAXOg+QopjhMMtxHADHEknkmBFwffSZQ/qfKYrvi6Sp?=
 =?us-ascii?Q?ankEkE9Z5CuZ9MHc6OakvSk1AlIhyz3qMZDPCWOYy9SvdMOEdruyuMv24u9N?=
 =?us-ascii?Q?5K8HyBJ5iRfx+RoPY3ep0nFFqKxfzww781KNHNpQuJrI2hnxH2gWjH7VqhK9?=
 =?us-ascii?Q?skAB+BCbiSMRlkIIYlvQdQ4I+68DSKXjokNlZ0kNQbw3RujPnxAIXuS5m9bL?=
 =?us-ascii?Q?w5/t8H52ewnDHiYoS9ItKjVKiNjMp89xFI4V2B6CmgWieF4xwj7Jk2g3Q2DT?=
 =?us-ascii?Q?5LIQzw8P/8ejYGqaoib+M92CQHkhQkV04t+gF5MrfpBgwnKIeNxELTCbZeAd?=
 =?us-ascii?Q?tj2f7OXC1tlwMFwCaOKaKaeMl8RoN13XIhvJL1lOx+El656wGgZIECR9T4C7?=
 =?us-ascii?Q?2WK1VSBvyx+4iIPio1nPMMBm3onzAKS2E2m4i7aJ8xywxqpuAcUcw5zh9w4a?=
 =?us-ascii?Q?jYWwP8mK9y6LkYvlJI9KtsiryYH/Iwz+5w92xQVvTcCJnjzFnqNXNtD3pdsb?=
 =?us-ascii?Q?XlgoK2P4atPRDmONnx3+1wX+8xxQoBUA7eoGiRzfRYvwjQ/9l6SV35yFmbN/?=
 =?us-ascii?Q?/MQqoSQnhIrlmQ1Sm2l7jTVrBJeB6OuOYBuouH8vd/QPu+6rCE+xfYFGr8Q4?=
 =?us-ascii?Q?vk0fj1D7xwyD6CFRAckbQbFwB8VgBu3XZzVjRySc72Sj11eE+5KSoBbkiMJK?=
 =?us-ascii?Q?nERyQG399YhAujGm5hI5V4fJtnEteZlrZa0z2NyJQgRpDb5WTiL3cX0WVg3/?=
 =?us-ascii?Q?b3nENEOETZXyZG0Bh1cEEGuFjQyElC0afl+ShikkS5YN/vgpWAeVG8YppC2K?=
 =?us-ascii?Q?5NMXoWdCdXhhx8WhJh5T0Fjs5NuwYG3SS6C0QhsWdDFnrwmk+lKpdlb0et+t?=
 =?us-ascii?Q?UGCiryc5zICEyN9pptyEhiXlfHyCxT9q7oukyQ9t8nVyAmtqaE372eS4wtxi?=
 =?us-ascii?Q?5rK1wgmuaoCPfpb2VKdah+AcJYOP9UJdQNTTPHlLR6AA26Sk1BYuI8z2z2WZ?=
 =?us-ascii?Q?XKJ3YsU8Rk+9ARAxAg/JgMQTdZacSJC4tQ2W44U+22aOSY3557QhTlnZ6gIv?=
 =?us-ascii?Q?Di6efKVeVmFd443Du1PK1rAwJwZHHdkJexIWywJNdvioiIQzDyLDxPd1jnDT?=
 =?us-ascii?Q?/kKVqHtHI7MpXjMVE7W6gqm5Ze326EugePviav7naZJQaL8arGeQZ15TVcvK?=
 =?us-ascii?Q?NTiLK5hxh10gn2rxjuRrijip4g1TYloJJ3OXpp5P?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20e06d4a-6511-4b0a-6bdf-08ddd4b8431f
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Aug 2025 07:10:02.9250 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: E0XigNTbjb1/5+aOpnKrq74AStEFDNaFcsXZ67FF0b2QXMxbTb+jXkgKkfZFQIc39QLT4FZKgcBltpNFpXIcJg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6723
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 we have encountered some issues while testing ZUFS.
 In situations near the storage limit (e.g., 50GB remaining),
 and after simulating
 fragmentation by repeatedly writing and deleting data, [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.33 listed in wl.mailspike.net]
X-Headers-End: 1ujYHz-0003tT-Am
Subject: [f2fs-dev] [PATCH v2] f2fs: Add bggc_block_io to adjust the
 priority of BG_GC when issuing IO
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

Currently, we have encountered some issues while testing ZUFS. In
situations near the storage limit (e.g., 50GB remaining), and after
simulating fragmentation by repeatedly writing and deleting data, we found
that application installation and startup tests conducted after idling for
a few minutes take significantly longer several times that of traditional
UFS. Tracing the operations revealed that the majority of I/Os were issued
by background GC, which blocks normal I/O operations.

Under normal circumstances, ZUFS indeed requires more background GC and
employs a more aggressive GC strategy. However, I aim to find a way to
minimize the impact on regular I/O operations under these near-limit
conditions. To address this, I have introduced a bggc_block_io feature,
which controls the prioritization of background GC in the presence of I/Os.
This switch can be adjusted at the framework level to implement different
strategies. If set to ALL_IO_PRIOR, all background GC operations will be
skipped during active I/O issuance. The default option remains consistent
with the current strategy, ensuring no change in behavior.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
Changes in v2:
	Non ZUFS can also be adjusted through this option.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/f2fs.h                          | 18 +++++++++++-------
 fs/f2fs/super.c                         |  2 ++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..12fda11d4da5 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,16 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/bggc_block_io
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Used to adjust the BG_GC priority when issuing IO, with a default value
+		of 1.
+
+		==================  =============================================
+		value				description
+		bggc_block_io = 0   Prioritize background GC
+		bggc_block_io = 1   Stop background GC only when issuing read I/O
+		bggc_block_io = 2   Stop background GC when issuing I/O
+		==================  =============================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..fe41b733fbc2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
 	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
 };
 
+enum bggc_block_io_policy {
+	BGGC_PRIOR,
+	READ_IO_PRIOR,
+	ALL_IO_PRIOR,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1804,6 +1810,7 @@ struct f2fs_sb_info {
 	spinlock_t dev_lock;			/* protect dirty_device */
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
+	unsigned int bggc_block_io;		/* For adjust the BG_GC priority when issuing IO */
 
 	/* For write statistics */
 	u64 sectors_written_start;
@@ -2998,13 +3005,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 
-	if (zoned_gc) {
-		if (is_inflight_read_io(sbi))
-			return false;
-	} else {
-		if (is_inflight_io(sbi, type))
-			return false;
-	}
+	if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
+		return false;
+	if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
+		return false;
 
 	if (sbi->gc_mode == GC_URGENT_MID)
 		return true;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c2..a21cecc5424e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4629,9 +4629,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
+	sbi->bggc_block_io = ALL_IO_PRIOR;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
+	sbi->bggc_block_io = READ_IO_PRIOR;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..efea15209788 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -674,6 +674,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		sbi->blkzone_alloc_policy = t;
 		return count;
 	}
+
+	if (!strcmp(a->attr.name, "bggc_block_io")) {
+		if (t < BGGC_PRIOR || t > ALL_IO_PRIOR)
+			return -EINVAL;
+		sbi->bggc_block_io = t;
+		return count;
+	}
 #endif
 
 #ifdef CONFIG_F2FS_FS_COMPRESSION
@@ -1172,6 +1179,7 @@ F2FS_SBI_GENERAL_RW_ATTR(max_read_extent_count);
 #ifdef CONFIG_BLK_DEV_ZONED
 F2FS_SBI_GENERAL_RO_ATTR(unusable_blocks_per_sec);
 F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
+F2FS_SBI_GENERAL_RW_ATTR(bggc_block_io);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
@@ -1342,6 +1350,7 @@ static struct attribute *f2fs_attrs[] = {
 #ifdef CONFIG_BLK_DEV_ZONED
 	ATTR_LIST(unusable_blocks_per_sec),
 	ATTR_LIST(blkzone_alloc_policy),
+	ATTR_LIST(bggc_block_io),
 #endif
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	ATTR_LIST(compr_written_block),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
