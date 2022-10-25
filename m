Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 55A2B60C1E7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 04:49:24 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onA0E-0007R0-H5;
	Tue, 25 Oct 2022 02:49:18 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onA0D-0007Qt-G2
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 02:49:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=5MpBBHOKRwbqWduMEQ1U56Sy+6h8GvWYGHGjEz5vYKA=; b=QXVGMWVRzeu/e0tp5cebA9YQmT
 zmUVqU2xOiA0zhgabxUvGHEtah1oC95TLF6EQ2axejQWu+xakstGtY9wImKkAjPZrI+RiAataYqMQ
 EKc/HV3DAQDNYpHp03uu/5M4fnwQJpwIWH8+zW4jGhFT6fPEGzmSckfyZ6rOaYY7SFig=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=5MpBBHOKRwbqWduMEQ1U56Sy+6h8GvWYGHGjEz5vYKA=; b=HD4ROW5GxFcb2jH5oq6+7lrRIU
 yqo+2cFL9htwK6JlRglpqoqxkNXNb+FtBUCQA5q5g27IyObD15wKM/nOuPlQ61ztIqwCSCABfAF+9
 7VKT12l2y94z9iTows74D8vRGY2uEMNuS+7AvkduFuNWtTJCB8dcnmWVtKCchmbwFni0=;
Received: from mail-sgaapc01on2118.outbound.protection.outlook.com
 ([40.107.215.118] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onA04-0000Df-TH for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 02:49:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=hdXBjYdwMidlhK4pb+kHISqBtK40k83ZxVetXd9kBzi05UxKMJMiy02t3zFGTKdtlleaRDyltx0SlQL9SrfnN3TjeZThrpycuSH1rb42u+RVE4GcX9ldMBHchOlkzY4zsHoLyJbcZG4Cmhz6CXutdurisNP/wrOo/gTTTS1SsxBjto/CB9CiWAGon2ZjN1BCPSdY6kyiImko9daJfd6s9nGTXhi2AuO2d51KXr3hiuywUA2gmyuzOLU6Uvw53RMPucXkhItb75evsH/dRpzwBW5Keo0fXfN6I6vU3Z0J2JYWDqySm/sfnNV+zoxkNSTkA+bHSmJN4I7si+Rp4qMYgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5MpBBHOKRwbqWduMEQ1U56Sy+6h8GvWYGHGjEz5vYKA=;
 b=BUv4GQ3i3KGcXAH61wQApGOk0xI1y71Fim2eOw+9MSK8PMLM7y0ksUIkwHtMS5nDLhv6foIiuBLChxRxBv15UevNnRJwnQp7yQMzoKnnjPClko1QwHj2COCt6lHXMHcXKMzIyULBpgroTm+7kyCNt1CKiRgQVuAAISJbk0IEkFhsTHPLHxkAAwaiORq59WArKnhf+5gZaugxnUhA5+3GQ8rGiiw8FrL92+ACojIdNPwiZqP1GcLjbL4ByAtUDl6T2aHiis6pmameLJuNoV0mfa02J+Zc+FcIQGg+yeInbvdRXJ+2SMwg6ss717VygHgscfu+haO/pTNVzdriT+C0ug==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5MpBBHOKRwbqWduMEQ1U56Sy+6h8GvWYGHGjEz5vYKA=;
 b=gSMLFJnnkg7Hu998I3N0knsMwj8TZ8ZWLn+RWQ8SddMnp9JsrR5eHqI36kX5pErDK2b9La5sUHxXJi06Y3Zw6szScjEZwpFb/DbyeX4dmknIPNBiJgH2Tu4c/E0/lmskuO7V6jYamkB2nPp9ypBVkZgRpN4eiiyeDQhlh52i61H8RHbSW285ihUC+yIoyBIB0fN+W5MDtwVdPTrMoBNDSwyJGXvqA5LR92G8NEIKnkRNufdQoVYyto3g05COzmM3ifuz93iMGKVxhZc3zQH2PjDRxZ5syOu3inzt7jhqSmhDPvu3e7wYrlI73Y6o9YyKRUFY9733PQCUIPQWRRagqg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by KL1PR06MB6136.apcprd06.prod.outlook.com (2603:1096:820:d4::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.21; Tue, 25 Oct
 2022 02:33:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 02:33:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 10:33:34 +0800
Message-Id: <20221025023334.77096-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <dfc051bb-71ca-035c-b945-ad298aa5e1ae@kernel.org>
References: <dfc051bb-71ca-035c-b945-ad298aa5e1ae@kernel.org>
X-ClientProxiedBy: SGAP274CA0017.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::29)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|KL1PR06MB6136:EE_
X-MS-Office365-Filtering-Correlation-Id: 70c24b58-67d8-466e-7625-08dab6315571
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/84IArZBNfnLLqokQjrcPlXIEYUYWWCJYf8ue+NMDAaVsWrCqJqzOxE1u01SJt/c4cq+iMgt5nulzZ/lZKiC44+xz/he/Xu0rHFKKXxgGbqUfESSVuuOysM4xe0xZ9T4a2vgui7EQyVrAYGhsVakmy/VJgWeJKmBKUfqresjH4XvpyIJ2b4hizCGTplVci8c8LHHUIeUESFLw+Zh7WrWqoX0CyMZB3QuTEJr9gG0II7iaiQF16ogpWDUd4D4BQf5VgeQ6tmSMrbV7QvVXXkhjgcitPD0CBtwP7Ilt0YDwgLcMfVKz2LRVTQ6I/EPdjC6GHR+Sn6ZU6MgN8Ygtjh0n199aEamiV+lJtUrnyS2RTOYHDg2UE1cPC48IALUecyma6OfEg+8PEWJTnf6hAU9LqJkGtfSmmQ74illqiSPQD2E0UyCFA+EyDf15QDWKMoxM2ItHQiqEFSX0LVWRp6Km39fKauK2XDJnSgd3QDYx+Ou5+AJFWqTqa0qF6kZdfRKseaW0UfM9cN8gQQhn5Oi+SXFpy+hFosmq6qqE0Ko3/gw2YwzAQH2rYPjR2BFjyc6bBepfkopJ1i23/9bSKUvDvzyfCkCqASv/L10J/l/zaiwbx5HZ0H7Wcwke9K+vUOV2H37Q7arrZv3VP3b6/dciGHQyipf1Q7EqIyqVxivUhQg8AOHcCL/h3/upMeoMIDmApAaU9v2K4trTaSiRc7qdzL1Nkf3xaXUXgALfmFryyLjNzyNf3Gh8obkA2dc/Yd9VBxY63h5tE0Tb7fTuZW5A==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(396003)(366004)(136003)(39860400002)(376002)(451199015)(4326008)(8936002)(66946007)(66556008)(66476007)(8676002)(6666004)(26005)(41300700001)(6512007)(5660300002)(52116002)(316002)(6506007)(36756003)(186003)(38100700002)(38350700002)(2616005)(4744005)(1076003)(2906002)(86362001)(83380400001)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?xVQW8klqrcm9QCGCYn2CpnKd9M3BaG98ALELFrJFPbRcJy/VwpReWJQF9z0N?=
 =?us-ascii?Q?wgFT32MGZIH9I26UNmaMbzqgT2ZxJXnTMKqP/OUHNIYu8hQJ88IScJMM8kBC?=
 =?us-ascii?Q?fLh6XMtnHKytSD9IP2//S5LJ2o/PyPWlJPpEl9b82Eu+HZ97ovmOdYYDCz/4?=
 =?us-ascii?Q?BVPttVALgF5SXE6jygoriTHMfJODhyGvG+rjj5NkEzXa2/mwFteB4zsCq6tj?=
 =?us-ascii?Q?NI6SMw9xi30+MiamMjF78M5JK1HkCVYPIVY0SadI3x87jQc3kxRt+Uxj9e7O?=
 =?us-ascii?Q?mSYQ1iW3mrsKFEAtlylTjsFRwfitmYPfFY9UL+7YLKyutTCrcCsdzUeaJJAC?=
 =?us-ascii?Q?eO3LDv7WCN4gdHELjHbKX+9wr5F0pNwwsWge6DYR41pVeEEm+jpyLrut0pk/?=
 =?us-ascii?Q?OzpXOK2dzyOAMlyPNXouB5qnU0zNti5dWB6YcISD23PD6nNZx/KNxhczXlXx?=
 =?us-ascii?Q?PzhfT2vlMxeM77Ad5z9b5GsZnZfrmLenDZD/eNji7OnJRYuFlB/iaNZE+x50?=
 =?us-ascii?Q?gh/g2CrILyt5+nC98Q0vuB06cchjcUFyAEVPa1m/0342fIuORCXSo6W8jq2o?=
 =?us-ascii?Q?3ZQCHom4fAWXp69mZ+1J89CLi7orKYc7FqgDoSCVG5R4q4znABKYsnshN/DN?=
 =?us-ascii?Q?r8mF6OtQkatFBCCMEWqn3sLXpWiuxQ1iRg2P4Xx6zM/MUEm7kC4Z3gl1qLCl?=
 =?us-ascii?Q?/SHWfp0gy+EA+xAl5zWDBrcDZbIoNH6wu0k9VKZ8xy6kJqS9qHa9Jskps+74?=
 =?us-ascii?Q?5wzsqsgroJM07VYjesTpnmN6kB//2QNvzyK38KJTiIr4JsoaKt702CHWHgXO?=
 =?us-ascii?Q?qjJZwNegZyFnfGmuCsSqdAcrYzz0mGwEWt5n7LqL0oPOsgUaLkf7hsn2GUbk?=
 =?us-ascii?Q?efp/s4+6C0Z7e1NqLP2MdzXgmQJ256feG363/NXiltv6KiBFFmGavFR2U+Js?=
 =?us-ascii?Q?Xo5sgsJMKVn7G0Uvf36AcMUi5lzfFfR02SLMyhJvnaVKEUuzQpm5HMDZbK2o?=
 =?us-ascii?Q?V6aHIP7ElC+Ft+JFkWeryecB0b0lmnJxd9MXN+IQ52+gw7BpEJQUbWWaZrhR?=
 =?us-ascii?Q?lhEFEXFqva2X9+JUfNm83CFIZ091IH9Zl4zq8FmenBtFt7s6BoV51du+qka5?=
 =?us-ascii?Q?rlD+S2gOzLSqt9h9GS73tIgNwqdmyRUJZ3WB8WIZ89s2YZTesHXZJVFrxoCB?=
 =?us-ascii?Q?/KRZ2NyWUlY19ie/NSFxR0XOACaw4VdhpsqZlDVxpErF5GbiNZw9ApEGW5oc?=
 =?us-ascii?Q?H7hJ8YT1uYvZyif1ahnkio4DoVxtmr91+IHVZeSad266eypo1fpQmBQNWFQs?=
 =?us-ascii?Q?vfG5zXY9RsCZfz0Jh+AsArkD7pi9RAnpWrdhg5nMPFvrvCVC1DuL98NHYKJs?=
 =?us-ascii?Q?htM86fJaiHWWJsrsZN0XOniCk2756zJS1UEbW2/IwN+p6D4uDQnpn7Z1osYx?=
 =?us-ascii?Q?bkH74mRdeFjBU5K6rtPspl5PwDHyskQZAqzj2meUA9HK1MlUoC5Ai5PmrXhQ?=
 =?us-ascii?Q?jk5sS//o0mQK9NEmRMCAZl7eUf/XfFtfQ1pCo2SuQVA92QBOIYpgpbzJ4PfE?=
 =?us-ascii?Q?MtZJydZCJNTkvP1Hvw+vXAgSai54EQ75OdKQS2ny?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 70c24b58-67d8-466e-7625-08dab6315571
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 02:33:43.2154 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Xcasev95LZic97VjC+qYMKbRjjhvcJ56litu6irb9zHztwOLSZmiz1GFLzBbwwYznmxUOgebguDGK2nOIAbbFw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6136
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, What: /sys/fs/f2fs/<disk>/gc_idle Date: July 2013
 Contact: "Namjae Jeon" <namjae.jeon@samsung.com> Description: Controls the
 victim selection policy for garbage collection. Setting gc_idle = 0(default
 [...] Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.118 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.118 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1onA04-0000Df-TH
Subject: Re: [f2fs-dev] [PATCH] f2fs: make gc_idle sysfs node readable
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

Hi Chao,

What:       /sys/fs/f2fs/<disk>/gc_idle
Date:       July 2013
Contact:    "Namjae Jeon" <namjae.jeon@samsung.com>
Description:    Controls the victim selection policy for garbage collection.
        Setting gc_idle = 0(default) will disable this option. Setting:

        ===========  ===============================================
        gc_idle = 1  will select the Cost Benefit approach & setting
        gc_idle = 2  will select the greedy approach & setting
        gc_idle = 3  will select the age-threshold based approach.
        ===========  ===============================================

From the kernel documentation, this node only describes the writing of
the value, and does not describe the reading of the value.

Actually, this modification does the same thing as commit e60aeb2dee1a
("f2fs: make gc_urgent and gc_segment_mode sysfs node readabl").
I understand it is an addition to the omission of the patch above.

Why gc_urgent and gc_segment_mode can be modified to string, but gc_idle
breaks forward compatibility?

Thanks,


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
