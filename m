Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D85864F7D5
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 17 Dec 2022 06:32:20 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p6Pnw-0003aV-LT;
	Sat, 17 Dec 2022 05:32:12 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p6Pnt-0003aJ-N5
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 05:32:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YVl6QnGFiO2c3mSqSdLfwxOxe+NntM+JqQuI9V7FiAw=; b=Pe5w1HadOpPO5ySDwzI6b/S16j
 13CB69UbZiIcBOuAqaE0ZIcpqWkqKArvElMxREGa11JN3ErK/BV4tV33EyOjfdaTWHHSC5f40U96/
 XbB3VDOK79K4LI4K2gAI93QVacbMhu1FEvg8vhOac6ey9J0xKKK1u5EvN4B8qQpvWSRI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=YVl6QnGFiO2c3mSqSdLfwxOxe+NntM+JqQuI9V7FiAw=; b=DrsSGpy1G9XeawR55rPOUAYe2L
 7CP9vsTc4V+Kdo4KMhan/K5sJkwgIZDlPQIjRzqgakzmRT3c8fCY72L3znSkMJ058Y6GOT+wy+skQ
 SJIXnpAe+b+vQJdzYxMsN667BzBDjnDJs/GNrbfsPyIXWbEY6I2hkXTwfitYjQZiqWRA=;
Received: from mail-psaapc01on2095.outbound.protection.outlook.com
 ([40.107.255.95] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p6Pno-00056z-0i for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 17 Dec 2022 05:32:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d4zhR2J2KefYutfunq6OpED2VzR0XmhF6lFMZbMn2y716q45GdXYRKQbgKylj4yGCGK5ZzPss/adSnnWDgpujY7HE3o588qcCmGdvXRlZlGBun3WYtfageRnKfnVk9rXHu6qqQGb2YXyTobWzmSc1DP1IKAv3xlNOqSq8E/Ys/6zKNGzwR7eOHhvyNdJG1z+uVR4fvMfMC1x1z2uVgorDkhmkx6+1cvfGS1qhej2kGYYaclHArygkx/zbTVcR9p8QUZGtTmCL8hZuH/eKvpdUzG2W1vY9841Y98Kky+x7gJWsHaY0c8p1Ny0Rd8BY4soHDW4MMfbxjoX2k8FJClx3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YVl6QnGFiO2c3mSqSdLfwxOxe+NntM+JqQuI9V7FiAw=;
 b=VuGeUL4Dyo1ndW7poy9RVyUW2oCc8vLaMLj6+gOMD4cw1V9rZYUAnqEoPsQJHcwApLAmJfTrb7OOFn73ugr8PIRx2dblZ0Xwb9NeoLSVxLtC1WEV4+pLqzwP8OiA8gPznskyIMnKaNJq9pE8oxBhsuaG+3PTyyOmpOpj2LgX4ZlB7Bc2nZWINA0ptn+6Vw+x7fLdxqbG00+SA9dsDUZNDqRraFiRr08eEp3ed1OVow2ZpGWjCCeEOooWWPsds/R8WODFk5XOOdKr5R3uJJaYi/KRmB806eHBEhAgcQLn4AL/3fqYKVKaPK0RIBztH7cz66U+9fkPlihD6h2WzghAWQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YVl6QnGFiO2c3mSqSdLfwxOxe+NntM+JqQuI9V7FiAw=;
 b=FLH2x8uZ0Ve0Eh4b9gDeWaug3+VzUSr7OBjL7oi12sB54jFKqdS+SueF8LNxQxCwpZkMRAViAKiSmYTADOwTTXOZAXOJ/k4ogd9HdMyIBXC/o9b40S7jaBbYBLl+wR4wSGhyRWUL8EFt3tZ9CUJV5L87/6qOy/Jn1zBk2iE/7K8imofkAh70IWStbDemYIGhVhZBqyfhAaV8DUe2OIxLPu3s0b4SB6nAin6ORNDBM97vC4fNfw0C3OF2SLSwSvRA010UXEwAbSZQFmZ3NiBch+JJek/n+7umZ9qqos1P6snuM0ZbvwagmCOxiGjEX/WffAcnKaaA929t1Tg4lNvNsg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SG2PR06MB5216.apcprd06.prod.outlook.com (2603:1096:4:1d6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5924.12; Sat, 17 Dec
 2022 05:31:50 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5924.016; Sat, 17 Dec 2022
 05:31:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 17 Dec 2022 13:31:42 +0800
Message-Id: <20221217053142.61678-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221216024506.77048-1-frank.li@vivo.com>
References: <20221216024506.77048-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0004.apcprd02.prod.outlook.com
 (2603:1096:4:194::14) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SG2PR06MB5216:EE_
X-MS-Office365-Filtering-Correlation-Id: c19f31a9-3336-44be-ca21-08dadfefff33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s07Z6dMUAI9TVc8TfZDaXpYcHar3HdjxmKnZX+lShhuzVatuZJZVfqxzIlLNs18Th8DFfbdoQojN8nCOQq7ANbFC1bYMzxhKwos4B6tgQ4yyQsIbJqEoJP8mmlg7SNiFMmvCvk91HxcPFjLsfSrp+W3Cbs9+QUw2jTBoObhMew1Gj3HBTkYUpRHcRuiqUwm+im4wLso8FDAnQWpVVHZHXDzgopoiHaARyrKBi1xGfrYMxHg04N3w2YjJXIwIO6b1AcIuSZTA+WPruypAh0TePTPb8Tc8XWEpw24s9192l45T6/knMNWUKsWWQjGMIsSH4CKuS4bw952VqT9vDixGRapVyPYwxaoGZVmmykD6ycyQH12Umm62DBKaRLOeNpVDXMeoVglsbjTgUVXJR1IWBLbWUIw2aiSjqhe1iN+iE/rDC+p6ybJTokmaFIXnT8f7f8j+c5LkmCKesAnqFyB9Lq4QdvTsFUJE+khc/fxxtBuduHog6tabweSZXoa/bUHEWwlOfsijs10b7uQBlrp02KeVp3GEjBfVl+VfK0dvPCZW3CLhGKN0N+1PoSHBy2soqxIpYXHp6EZzv95MHRnuKwDe7BZvuH0Wj55x5x4QCmW3xtOjxaNsO1Li1lSj5bSl2QIiZYvG3GFjxjo0pIUe9Rmj25vys38YeaP1lRY0emPjPo3XfPjDni3zr36jePSUUCvmkYIAih038t0kJwe4toXLskcfI4hno3nuuSVQpqc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(39860400002)(376002)(136003)(366004)(346002)(451199015)(2906002)(38350700002)(8936002)(38100700002)(4326008)(8676002)(5660300002)(558084003)(316002)(36756003)(86362001)(66556008)(66946007)(66476007)(52116002)(26005)(6486002)(6512007)(186003)(6506007)(966005)(6666004)(41300700001)(2616005)(478600001)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?ImcyaPofK2DI+53rCxEvMvl3TuyxjKil/ptBtwop6VhfMlk33FKXQPcChz4K?=
 =?us-ascii?Q?00hAfPQUg9AvysLH6lpa/G00RFFD0tkFHj1ZJ9XLFtmjgLTczABsTOOZyV1z?=
 =?us-ascii?Q?tMt1gcT1JwrDosYGnpGjIphe6NlV8aMQ7t4OVtv8qfWCGp2TsObL21soPP86?=
 =?us-ascii?Q?SUZDLt2o2ez/Jc2dsD5tpyvzBgaMOvHAI0M1cmn4mt28p/P9YHYoiTMD5XR3?=
 =?us-ascii?Q?PqL4WGuVEi/8egC2PLQt30XXQ+Cmhe7frVVCzBuqy/JXU+/Ro8pVbPJPqcir?=
 =?us-ascii?Q?F0gyAe6aMn3fsIa0fSAbP/spUZ3PDiHuhsfI1vTfIrJ7gikihz4Q1iC85io7?=
 =?us-ascii?Q?VRmT2TPehbFalIt5rAAoG6VJKNGzUDBi6+YJkHrmU3mSs51XXK6DY7/9V81h?=
 =?us-ascii?Q?QNhBI19LnCcOHtndMAbHJrH57FpeJVQKcjoU+8v5QLOornGuijG00dem2MJy?=
 =?us-ascii?Q?ssuezJfgdWqOvYRN51Xnytz5jWdE8cuHnSJld645YqrX0IAMyDBpsELRI59h?=
 =?us-ascii?Q?bGhmTDsXXzqsDDWzK/8npCdECnpTN5ECnDfGGL2qZlnBek3hK+Zj7PzhcEuS?=
 =?us-ascii?Q?fCB3c1x+xI/ZYKPF0+GMJGOcNrIqih/oXbRXW2wu1joJetlFBezJosRchLP4?=
 =?us-ascii?Q?1gjQn+FjJOYy+j9UpbV3goxBecevt3+aWVX1qOALbFPYy6/4xnTrXN05r8hj?=
 =?us-ascii?Q?+lRVIVlzd0KGh0TtCCEt5m2pMlTxKB1lza0c6RQIxte6hnM3vvmA262rfTj4?=
 =?us-ascii?Q?xYlpsQdmYhixlrrG/veDt36jSt5aHya8uDBTRyyDJQJmxcECRcYGVeMNi6YH?=
 =?us-ascii?Q?XnDB8xB6QNqLbop3bJUKQaGzmBKadVuRixSXFvKfvpSRFt7PsYrG9qPvsN93?=
 =?us-ascii?Q?mGTQvASObCIiSSA17AjDsL9Gma9oQ2zKPuGH9artMjRk98PARNMGSi9xX0cl?=
 =?us-ascii?Q?0BiT9gFqgMqjh3NvZ24TbaDDuoDWzsgWee7hi6gVN0pBPCj1d70Q7EhiQn0u?=
 =?us-ascii?Q?g2Hn5X+DhHtcEhhRdJc9sGPqaXhLUASC3ZI667PRdy/h715zoTzfc1aqMzs+?=
 =?us-ascii?Q?LgNiia0vUypMsGQ/XX8rkwS8XHlob6aPoNBeaITbZ/OLO932OBSYViH9aE+v?=
 =?us-ascii?Q?KgMDohTNOfaMoRvjy999u8t9zuUHN/uuweApBbImWc4XIT4jdSgQUN0gD7tr?=
 =?us-ascii?Q?5VB65EcjDisZblLI/ZHgRqU9qzt/KJGfrIPn0+O30Q1OBPyoOrXHzC7R8gHx?=
 =?us-ascii?Q?N2lCWIFAyBFUnZM7T0vB0G5oGS3DX/Tyz7Dm/7DdGTm+4SAU3UI2naP1WhRU?=
 =?us-ascii?Q?t2u9mnyZOaJiXbvh86NhdaygG7M6BE87LVzC92LJEVBvjy7xSyIwoiwKAU0u?=
 =?us-ascii?Q?nuO3naJiNcBplBtV1wSW0LK84bz5wMCOhxxAmb5I0rZn1oJsMS2wUxERchlw?=
 =?us-ascii?Q?dKFTeeSN9CDX4iYtf0ZPxN3jFyOmGegYO/DRqfePv4nuB3gCqpkq0To110w9?=
 =?us-ascii?Q?jltNQMYuxYiuTA+jITPS1Zkq60umJ+d2d8PEoIEoh5nYavGb7JbVxTZwwRGn?=
 =?us-ascii?Q?ZUSmW/gyqHxMJ9xbxAF46qA9l2CpMKVxt+C5YOE2?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c19f31a9-3336-44be-ca21-08dadfefff33
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Dec 2022 05:31:50.0139 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iPAG0KTxEXPYsL5wQgDMsA6RF23ci/6oxw+KkHZVT07JB9//w5Zrrv+rJYpK3/Afi05a1nDdrI6osFly85UlVQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SG2PR06MB5216
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hey folks, https://patchwork.kernel.org/project/f2fs/list/
 now works! I guess it started working after Patchwork Bot was added? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.95 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.95 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1p6Pno-00056z-0i
Subject: Re: [f2fs-dev] [PATCH] MAINTAINERS: Add f2fs's patchwork
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hey folks,

https://patchwork.kernel.org/project/f2fs/list/ now works!

I guess it started working after Patchwork Bot was added?

Anyway, now we can use it.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
