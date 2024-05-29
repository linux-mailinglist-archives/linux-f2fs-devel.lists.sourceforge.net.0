Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E8E048D35B8
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 29 May 2024 13:40:45 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sCHfb-00089H-2F;
	Wed, 29 May 2024 11:40:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sCHfa-000898-Db
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:40:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=juwzqRTYeLrA+nwnItyLJl4DgRoWqTA3G/NbYhSesSw=; b=FltZltvm4GHGM2YmkhWiWw+Xqk
 IifG9OngR9ig7WWZoWkMwo4gOe8kdo2Dm+8S65RavHeFqmXAks5GtvDfQWzHn3Eb/z5lPvJBVBK4I
 F9iTAYijr7UlgjIo78/4V+J8TUa/6Td4Z5mcawBMJfmpBJhcFVz8hYLSgErh159WTFbU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=juwzqRTYeLrA+nwnItyLJl4DgRoWqTA3G/NbYhSesSw=; b=C
 8iqRIj12LqSUjLNgc64+MusOXSWfP56n/nbBh6m+V5aynRfP1ff8RlW6LETaq0F5JzogPnJebmzy1
 EGer1hHKwAswjr5R/TmclNV0aehTfQYben5/404ICMgyfO+HvToGd8jfOl2AfXTra4ZtTUeOo+W7n
 P1FS6kJpbRYOOsbY=;
Received: from mail-sgaapc01on2053.outbound.protection.outlook.com
 ([40.107.215.53] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sCHfa-0007Bs-LO for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 29 May 2024 11:40:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cB81OsxlqREWgrlAuN19w4gN55Qog5o5HMLU+IS7U3XBGkZBmDBFEk3kp/ucKrtCz73k+8R3NrXY491koZ17U6J2j5yIilM8vw4iExg7T71PKb0FcgoNd7Svariy+o2Hi4a1iwI73j5wMotPvPcgpfvJZHkQklmqtlIFquruPRe30mEVYPos6opaErh4HMG7MWOSXgek5X2xAw/tPvKb9/nEsC28tdU4OyVyvp5gXyQLuZAu1T2bDfrVS0av34XBj+siAVXsGBBxiqBT7kzqU/JccCd5MEV3sUsawZyjS9u6YIrfJYIxkqMwKdpIvYbt8JGnpoZcfhmxzxXHVOEX3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=juwzqRTYeLrA+nwnItyLJl4DgRoWqTA3G/NbYhSesSw=;
 b=UBF29EAjDP3n8y2kSbkc19bdVCMzaFjEFfL3wmhLJ2zFXSL9dG5S+CR8MCNExpPsRJtP2miYbOijVoeWomoS+YMHlJmuJbaCzuZotfCTm6kv+GZalHBonC4QKSu7rfUxQD4mg3O4uO9rtLSNVaKG3bjP1aefopypsVTpAmi46BKbuzsfx6+iKsdi7Vrsl6ep55/43HcgeyhrL30KASKSkA4hCYocz1+8KcI8xt118n2B5BqA+fNBpaZTgAEMtv1uNhvwudhDH+4yWkJB+DoXxH/ew/IHN6iMZAwQ8AWbuJsogf65T885Go68yymlBB96vmUASp+XFGLknl0dAQ1QqA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=juwzqRTYeLrA+nwnItyLJl4DgRoWqTA3G/NbYhSesSw=;
 b=tKYI4NVApfYg3oPe0Ft9d59wX07WI4Ap92gCv+5p1c5hk2r+TjRTHxXkCq47+zdjlj5W+nsHvXK67QSB21ZvRXJys2W9eynNUbqUcHWaK8KR7qxXUtd/lVfeY/BjyoVeJGueiZ6dmPClwPTPQy4OW9aa8DpqDDo+uzcOAPnvTfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB6145.apcprd02.prod.outlook.com (2603:1096:101:b4::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7611.30; Wed, 29 May
 2024 11:25:35 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%4]) with mapi id 15.20.7611.030; Wed, 29 May 2024
 11:25:34 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 29 May 2024 19:24:11 +0800
Message-Id: <20240529112411.380453-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: TYAPR01CA0201.jpnprd01.prod.outlook.com
 (2603:1096:404:29::21) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB6145:EE_
X-MS-Office365-Filtering-Correlation-Id: 20fb151f-0591-4a66-ae04-08dc7fd20e6c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230031|376005|366007|52116005|1800799015|38350700005; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?CyWRzWHSjYLiIchtyTK7xDPOp/SFeQ6vUHLGk+LyTILZVbK2lRRLiKsqW7hF?=
 =?us-ascii?Q?Pwel7sWeR7JtlebmgoJEgtMZSy02gSjBrbiG+MLZesoTu6MxHoli7v49RbEx?=
 =?us-ascii?Q?EVeM3zwwBka08GJ8F+wJZfVHzL1+1gmsH6Rzs6fB4GfkQ9T2lO8ysSKx1Fdb?=
 =?us-ascii?Q?HCqTrwbGwnkCgvO0qjjn2K5Omq4NsAjwOhuIeUtuIt4hwPVZxoC6upcsgLt9?=
 =?us-ascii?Q?dq3mVdsTawlFu2/ueNUnCLuGkBNVPvf28hUwYDOWB7UhJYvT2seGXJwODqY6?=
 =?us-ascii?Q?Hk8zY5piXsZxa1AdckS6r3KxpmLt+LkDPOb1BdZMDQSW7+f6UIKLf/Q/2p6P?=
 =?us-ascii?Q?mpvI65jPWRV5FktHNyNDPt+P7gK3C55VVhevTFjZ4liXLxqeBlMZ3GtgROr/?=
 =?us-ascii?Q?bFx9o6y/l7K/6RUqEgFgJD3EZEgRf6jBnw9ZRuuAXAsctmbBWHV8216Hz8UC?=
 =?us-ascii?Q?O0J6EPi4Pp3M5S/XewbpEOVAANOA1RgkkW5TzQTaAcRi7GwKEcl2dd3tCJRz?=
 =?us-ascii?Q?z3egc03UlK2J+1Adr+apQhRJltl7ZQk8N4lDckEQPAaOIVBCVlZl4yqxPRXp?=
 =?us-ascii?Q?vETejRxiFj3Bl5IxEe5x3vx11hx1kciSxurATzvKi6nfbONUZ2Wmua7vph/M?=
 =?us-ascii?Q?QNS8agocK6cRCxiNkTV2nMTzJoBGHgYBXQ5IhrpJUi/NL3vGp2/1eCcvu5/m?=
 =?us-ascii?Q?FY8oRBH4drJmv9ZHIDpYsBCAcUXarx2x7MMP4JL/8ltP5AeCx8s6AvRFcWFx?=
 =?us-ascii?Q?1MUPpwgoAkQGJz5k06YyY31jZQJR0cVOYYvS/B7dIjgszA7dnKBHWNx/RIkf?=
 =?us-ascii?Q?EwSvJTfN00E1x7zlDMz7nyZmtaSqnedZ3BiIn2liZJXBN4Az7voDYAqhV5JR?=
 =?us-ascii?Q?vgihMGk3CI5LtHMvKnQE9rQtC3LFWvzjgIG0ox25OfKujpV9Qs+oJogRtSnN?=
 =?us-ascii?Q?GI+mUmpG4ZmYSbCag8ApWX/oJ2El17SP0lmmlX44DRbcfuBKC6umQXySH9xC?=
 =?us-ascii?Q?l5ZooTCUK+LrX3qqu8igEzTmGCS3AVOjhTf6BxTcgE27lZv4Y7h93HZWrGRS?=
 =?us-ascii?Q?uCaks9ghS1Lx7gRWyXAwDAqQ6HjidKIVVq1IUSKgSwUtM93lCsuzAChl4f6l?=
 =?us-ascii?Q?SWk99A/BE8uN66WEJJXwWXbyAe1RZ78+G+1eypouNkcpg/ozSq3kcIy9xzbl?=
 =?us-ascii?Q?FyjjnL+DX2jjpxXLYD6gwkMoSYnsqie9HPSvWAXLBHKEHp6sSRTJT4ybqV1R?=
 =?us-ascii?Q?mBfJj9sESSrW4sVwEh2YbrTd/Jj3kTstbfe/CmFE9LPcW4x9DlXDOsM518eD?=
 =?us-ascii?Q?dDZnmuvj7vYTZPzl+weJlUiisNofS36Vg52kza+2EqdhPQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(376005)(366007)(52116005)(1800799015)(38350700005); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?V7IVE0odU1zkcflM5/9itxbVLjY7hOXZLWVQEdLvnUQo1wsiTNfj3Fbuk2kW?=
 =?us-ascii?Q?WVh2PahHN/72Ot4zdOcYw9vAfhaMt1zTTttFzSCnCm/eCRSGTHXZvX4pB2D4?=
 =?us-ascii?Q?v55vnagMLqvv9+Klaa0PHHekxkP2wNokQ1pukp4sPLSk054kUXzyupTw+XYQ?=
 =?us-ascii?Q?nP86vAiwauaKWUw+cEtth1tZj0QmAvqI6ZRPTcyer0zQfF3LDny2oyBA758A?=
 =?us-ascii?Q?H5Je57xl5tUgxy85DNYbPLbQ1GH0m3bhVBowrVvj5kbE7Gy05wHBEHSORiMl?=
 =?us-ascii?Q?d7WPOeFKjU7cH/+f2mQDSplRTdc9SyW4cEvTrwnb1V6zLQIlapoQwA6205l/?=
 =?us-ascii?Q?SJWQdJ7yS5RyvVwvg5/Hs5CkW5s4bfjpVjYZk2ZlaoKUuTee66Akm/+OITnq?=
 =?us-ascii?Q?qNrhfBbci/PG02HuAMRqjGU+RSGA8hchZx6OFWFLb2HvplMJ28hn26U7t4cM?=
 =?us-ascii?Q?szfOwlJ8INvyoT1RYebq4746iq/t5H7uYv8uucVSig+0WHzBNvJfn6b+NEUc?=
 =?us-ascii?Q?CO81bnAKj0Yn0KTJQhMc6mro/0lr0EdJdzdFEjMcZ735SLHd5qqVzqVwudk6?=
 =?us-ascii?Q?DHL4yRbPtHALgRARUxFJzmX0MWG3L4p8tKgfVgEmneZMSpE/yQLhDWvfJsWY?=
 =?us-ascii?Q?ij+SxFlvRhPlHMA9N6sCd+RdY4R3OUMGfl88OJps+XJEbfsKX8wnNlvFxKum?=
 =?us-ascii?Q?9HG2lfCLy1fLXoXdQGHS2fB8tHRez+oVgE0eAi0hpzgblDrPLeXp1c1NWrAL?=
 =?us-ascii?Q?U/JH9QeELjYCtCmvrXUL4TCqfCJ2k5Brd6sbK4gfDM6YWbOznHVXDcmTt6ct?=
 =?us-ascii?Q?fGuWLbZHxKgQmMws3gUCvpuJpODH06nmBSUsrOMFchjmSbphn0Q2IGVCSdyz?=
 =?us-ascii?Q?hpB3qNMwVGye5hALXqWOev5BgAc9I3xKL7zmODyqLGR2DjkX9zIva/fViEzv?=
 =?us-ascii?Q?jkKrImjGZhfTnk2L+duC1Z1ae/nCfNk+pmZsa/V7S8+rYAGd4NhELjWaeslI?=
 =?us-ascii?Q?MwDMNM3yyPT3FhVS//Dl8uWAL6XLPpHYP3+lIOD8iMVmLTVKe9LS7q/1ujGK?=
 =?us-ascii?Q?mBZHLvStvopUqu4H867+WT37s0OZIeCZPI7/R4DUQkpgWeHxMkjHhQRtWwrY?=
 =?us-ascii?Q?1ozHCPi7rIyREmp0cAT7sI1Mj5mz7giDuKK7hVv1T0SOcdg45dEPpt7IVCDS?=
 =?us-ascii?Q?l7VhViMu/uGtu1uCiYzAw6y8v2nMFyk93sybSLfGzWU+OroT80rjZLSxPV7O?=
 =?us-ascii?Q?Ym4n4st1HFlDYekIfpRsOtN1oAMnj51utX4XTbTtCBJ5PXMlCUGa7FeJnw+R?=
 =?us-ascii?Q?Zl0vOhbhebVrc4vVJlai1ObpGPzacCZxcuM50aTrRfl7zP9Qwm+8TsiWldLT?=
 =?us-ascii?Q?qH/TvRgMMBnnP0JlRkg9h/FdXEteqaGnGFvJawmquL1Bu3kVvPBGV6PCzTK1?=
 =?us-ascii?Q?H8u9nxuEzbRNzM+3ozokVzB1FZLAd1+YDgY85N+uAAlI6tkJaIBTv2AIQz4e?=
 =?us-ascii?Q?ekbHiOtdZh5knLz7/naOpgcIfecLoQvnLxRvOpw1t8SGjcybFyHscrlOVurz?=
 =?us-ascii?Q?IoRG1GmpFxQNFU0g0iwcQe/FfQa5rtIJZryRLv/1?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 20fb151f-0591-4a66-ae04-08dc7fd20e6c
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 May 2024 11:25:34.3676 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: B/YqSUQsfDHTplan7WZGIrQAnI2MSX/gntEDw6OhBZKbIj8j5TA5GqnsGWAdBu59xqZtka7yIVzuMuJKNrhUag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB6145
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If curseg is not the first segment in its zone, the zone is
 not empty, and it should not be reset. This issue could be reproduced by:
 modprobe null_blk nr_devices=1 zoned=1 zone_max_open=6 zone_max_active=6
 zone_size=1024 gb=30 # /dev/vda is 4G mkfs.f2fs -m -c /dev/nullb0 /dev/vda
 -f Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.53 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.53 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.53 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1sCHfa-0007Bs-LO
Subject: [f2fs-dev] [PATCH] f2fs: avoid resetting non empty zone
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

If curseg is not the first segment in its zone, the zone is not empty,
and it should not be reset. This issue could be reproduced by:

	modprobe null_blk nr_devices=1 zoned=1 zone_max_open=6 zone_max_active=6 zone_size=1024 gb=30
	# /dev/vda is 4G
	mkfs.f2fs -m -c /dev/nullb0 /dev/vda -f

	while :; do
		mount /dev/vda /mnt/
		dd if=/dev/zero of=/mnt/file bs=4K count=11 conv=fsync status=none
		if [ $? -ne 0 ]; then
			umount /mnt
			break
		fi
		f2fs_io shutdown 1 /mnt/file
		umount /mnt
	done

And the error looks like:
[  123.169852] I/O error, dev nullb0, sector 41951232 op 0x1:(WRITE) flags 0x800 phys_seg 10 prio class 0
[  123.173070] F2FS-fs (vda): do_checkpoint failed err:-5, stop checkpoint
dd: error writing '/mnt/testfile': Input/output error

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/segment.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4c8836ded90fc..50b38cbe33401 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -5004,7 +5004,8 @@ static int fix_curseg_write_pointer(struct f2fs_sb_info *sbi, int type)
 	}
 
 	/* Allocate a new section if it's not new. */
-	if (cs->next_blkoff) {
+	if (cs->next_blkoff ||
+	    cs->segno != GET_SEG_FROM_SEC(sbi, GET_ZONE_FROM_SEC(sbi, cs_section))) {
 		unsigned int old_segno = cs->segno, old_blkoff = cs->next_blkoff;
 
 		f2fs_allocate_new_section(sbi, type, true);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
