Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D758D63D600
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 30 Nov 2022 13:51:44 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p0MYw-0008GY-Oa;
	Wed, 30 Nov 2022 12:51:42 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p0MYd-0008GK-El
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Nov 2022 12:51:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=; b=GbgFi6FhjC3ciKF3ZZy9yLti4e
 zro/GdYT4LGXDX0Byk2RHIGZdB8DmmdYWIgc1Pvh02QFOh8Au5deJhr6+3YhJazbJsdhR/qLeh3dB
 yyTaeFUSokeOmR7SXRDED4v7lrlptpOL+b95B2XrhV88ZD6ynnCUNsNL1VztLWs5ukgA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=; b=PyNx0StAv2ZsBbmOsxEYV1c8cd
 iOR4fLVRVzIuLg6ko/gJXbMUk763+zFIz33pJDvmoZHWpDIMQ7A9GWylNeG+uheMttnk9L/i4K07F
 EUriAfJwvIh8LaMyly2RU/nokdf/6JHd8PauB92WWjQlTvZh3lChh6XjdGL7a+G8wEfM=;
Received: from mail-sgaapc01on2106.outbound.protection.outlook.com
 ([40.107.215.106] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p0MYY-001PRW-3i for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 30 Nov 2022 12:51:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XhUtVMNvfRSlThOrl1MQ8IS0/Bz0bvs56IGz3kLCNVFF+ad/T0g/3D3RR1XoUT8f/4fiXfHTdEXh3qzwLNdLaz7XylfdwGfp/2zu9S85f4XtR0LVeEE6o6p5L+wMhBEsP/CJzNO0cqAB5Tla3w8t8OAlKM3CmLalq9EYKWov6kHBBibi5V4D6VrMpKWxaA1CM5KH2HUUqOhx1y33FoOTIzX5pT6ptm2FmPknnR0wL/XPrTrgSVZYfBIcoyqBNoG9pk+oxcv1q1EI/GlPMxoag97H9Mc98VVB1sRBgI6FsRnmQCSCNKUS1Gc2/WgsZuTx95SD356ggT7p+LNFFsDREA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=;
 b=ksHMGPmAJsdoxQXTg+5G6liEVekSPg4iCjWaEZV1+pxI77tYHna6YNG4H5ETtbLEOxHhcY7bMchZzYTQkqHshw/Q1A1TeSEH+RS+KR6h1kHmqzMhBZBlAB14Msv7xXlXU1PBwL+ffQLG2bpihhKoSdr0Hm+JywVqVkEIYWoK49GuulYs5mv8dpHqp2Uhpc8zPnK+BVO49g7yerPNqr9IC73UL6CQfW8wlI8bwhnLxZccyARUQN5iIrKPA028IFChRb7VhDkF0DtAERq8ldnQdzyN9CcNcmtf35IIreJ7JU9te9x7DW5HTm7jeiK6djzTEZb16RdvP7qpAskb7BuE/g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=o3H7kcpKY7sxZiSAy9KXPHf7WoEKzm5kRZNIk7zIyE4=;
 b=nSvdbCQXXqERvzBia8hmecgF0VH9dptXb/HMGNUfPDcYcWSKsYnQiy/QI3YH4VDpq8CPk+7fsStg36ydJWooNKqcq2ZcUt2JxxuioxyCcBhyA2/ccjuFNUpP2iKwKDzLpWJwUQY5GV1LGX+N9O9nbACB4lZLvHfQbyWSSUcCflL06pgI1hJ+8WnqxDotYEJuHfPFQCWu/KbdLWfpsK8Z0BwQgbh0thWYcw/WGjGvYtWkDED8UB3YjzI/pluNr5kyrClzGF/IKG4+gMG7ehBFpqCV7LRDOs+VMjK2W7UKGIoCuTnNM04jooOF9tKEWlgxb90BpzhpO+9cWPGezt4y5A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SEYPR06MB5514.apcprd06.prod.outlook.com (2603:1096:101:b3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5857.23; Wed, 30 Nov
 2022 12:51:09 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5857.023; Wed, 30 Nov 2022
 12:51:09 +0000
To: willy@infradead.org
Date: Wed, 30 Nov 2022 20:51:00 +0800
Message-Id: <20221130125100.80449-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <Y4ZaBd1r45waieQs@casper.infradead.org>
References: <Y4ZaBd1r45waieQs@casper.infradead.org>
X-ClientProxiedBy: SG2PR06CA0204.apcprd06.prod.outlook.com (2603:1096:4:1::36)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SEYPR06MB5514:EE_
X-MS-Office365-Filtering-Correlation-Id: 1ea88094-c0f4-43f1-f5e7-08dad2d18d65
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: Yerj0npsAGpC3C5HQyUpQPkLNkzptwUEPVmMK2C7bXvbshJVRlU3nwEOTNJhItBakpjT2tf74b8aoIxFJv7EWEn0OgykCYSKORxflA1R3gPZl/4B5RmuKzSP/EToJuh7QWFgXqA14XOzWU43XZgQywOQasQMp1MFb7zC2Lhui06rUILYz/Gn4DTq4netuF0XN3VHd+5iN6KwkNMHAL3/Tgt0QLIx/hFIg4qfuDLAOAh35MTksMMc4susFnSfoFGW1A33dYBa30KNs+4ornpscXFNDgYC3T9Mi92kZ9VJ0cY5MrT3W4xJP3DlzWu2JOjxJMYLcIYDZay+OoeBozez7BYYTcAspAmT/++BL6RcbVrphzsjA5H6nc1ZWDuXCVft/8ZWk5rgTsXbXOgM8/TKx8/BXI/T540DfC6rGXuDFZLUPXHh5faYT+snj2Svt1QJMQaC7fZzL0EGzYZqB5KTFmnrIoQZnM1GEOzzqH472zz6Wp/B+JDBrG+iZ/L//v/kkeIb0jQOh/dQFnRxH9pDQYhR/hOgRPbtLjrL8vB4HXcz8704G5qNPBJDGKC/0Xm992cgr8uDjndu1vncoTBV32hjmvUYBZoA35jDY92P81a/cmeUds+las4Lz1ENKpg8+uvmCiQLjJG7zfAa3WHdR5R6BZP2jsLe51NcOyjXyVvwdsmikoEAu7RsinDIPrvv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(396003)(136003)(39860400002)(376002)(346002)(366004)(451199015)(478600001)(6666004)(6486002)(6506007)(66476007)(2616005)(8676002)(36756003)(66556008)(4326008)(1076003)(52116002)(5660300002)(8936002)(26005)(6512007)(316002)(38350700002)(41300700001)(6916009)(186003)(4744005)(86362001)(2906002)(66946007)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?qj+JCBkZkkWaRcvazj2q0Fz6JPeLdA63d4OpKM3zMHOBXEFe0FIwWqD+mZyo?=
 =?us-ascii?Q?eU8Oevnone9LGdHbdxQefL4EEfgPUWDfVij9pRHp/2a9Xd69E2B4FCwCVk5r?=
 =?us-ascii?Q?7KlamatH4TjeWZ7eE1IYo7kkCjl3iTYAOFSu0bnY5cLMCZmHBBblj9I93Txi?=
 =?us-ascii?Q?A19CQfmehx58JjI5dZGVA65whyzESpnhlYvRZ5dYEd2J8nR7Nww6NvKa/5Lj?=
 =?us-ascii?Q?MFMsSJLPe5PYzp450459wi40f7fmtTJm+ZTfASGQ3mDKw1EHTlJaLm+0MQO8?=
 =?us-ascii?Q?BY8bryuH3GIvGw9V8CkZ8UAA5p7F6/ZlR+2bV3V4CopDG1cSyRb/8gHEN4fm?=
 =?us-ascii?Q?Mi6orC40u/p0R7WHAavmUNrCrgJrU4PqdJdb8rMeefi3/XJpdgclWQzAQ+N/?=
 =?us-ascii?Q?cbDddFmdsBMM5zaEWrgJx9/MrAPamG5XoBf8gXpcDyv8igJL86jdgj3Npni8?=
 =?us-ascii?Q?4wFxEB4Z6ixw55/IqpYTy/gx3/N/+LckXyr4KBzVqtR72pw5UHQwpByl8xK4?=
 =?us-ascii?Q?3LvXPKZNPArfLlKRT6PF3gAhICU14j/GyE+AUl5L34ZSRiqkEDsp+s8IY+wb?=
 =?us-ascii?Q?HZLI/H03Bccycf8sv2KyMFFgEslg+z7QmGHLW6fxywMnPhfgJ98Nc/Mr+CoU?=
 =?us-ascii?Q?RGITtAyvHHaXlM3VajX++IobHE61psflN0PJ2xhgBcsPo8hc5G5kIw0BdObC?=
 =?us-ascii?Q?rNWeopS301KczGTeOw42l4XkyuvaY+bjaykjOaokFAVbspQFQLRop4smwDw7?=
 =?us-ascii?Q?zpz6a9pTP0zMLKJxQKzgTxWNw1caoma9CwLtcp+QHxEpb9LoRy2FenBIbirZ?=
 =?us-ascii?Q?eFRnfmxFEg8q9Hydx7YPHyETdjqS/xO0CAmYLVqV4TANcufU8XYoNRoUn7wq?=
 =?us-ascii?Q?Oh/K7AnFcM2Cex+1fdoJJumPoE+F3GeQeL25qc+tKRZ2LTyT1s3HqR/smsQA?=
 =?us-ascii?Q?+FMh3QpMrWlJbmDE8KuoEpQEInqq9vTfzjbHwl58aIkXdEiZkLoW4AxXYWI4?=
 =?us-ascii?Q?r93CpzEe82hXbYtDAK+j01GD2vLDOED2RIC1E21KSJyTDFvyblJIfgrXTWXa?=
 =?us-ascii?Q?fg932yt5xT9SzNH8DHqjAYctVVip3tNR8RUy790WrASGica+pH1An99o8nvQ?=
 =?us-ascii?Q?xj5Ozw3Lj81n8F+1En00RzwvXb9QYcL4ujr5W9qozJP2AnYznKXZ4pYISz5e?=
 =?us-ascii?Q?sdVoJLjtSD4wX7KksRHjNo7WgadQbeyKcgWlXgzspoDCyBMG+NyyMaTNoT8d?=
 =?us-ascii?Q?uL5E8SQ7zrauhfWKXYOwv/Eo25841SKaozGOgdsvGvXNCvihevdI5tT7igHa?=
 =?us-ascii?Q?+3sYdIUOl/LG7J5GVruuicJHfKV9vDamxRs632k9c/BWkvjiPk5TeLF7jHML?=
 =?us-ascii?Q?QRfz8GmVHNN0Lg7Zi/8ImhS15HtohgdE9EZjdOYa4jmkALM3INe4M79Z3qR+?=
 =?us-ascii?Q?oJl0SMER1RPDNPO/kr9YklQbFLseMiN1gkjht+Tbgw1eFpgYAvMocd/OYB95?=
 =?us-ascii?Q?uTFdGqBbEIVVDKX4B0bu71RBYA9pq1OE7jhniFIiJiSga4f8RiZh7l8KQNxy?=
 =?us-ascii?Q?0ozKhpYhmAeCW+VEhxSUhnjmCopoN0JHZDqgzLGH?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1ea88094-c0f4-43f1-f5e7-08dad2d18d65
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Nov 2022 12:51:09.0644 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BB8bXitGeeQ6stPSWJWFrtdJSGfAnbSUtID3RQ3/tzaPxWyj1WUFApP1jdVl73iJanVB7GMYxbrZBr7diIDKaQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5514
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, > Thanks for reviewing this. I think the real solution
 to this is > that f2fs should be using large folios. That way, the page cache
 > will keep track of dirtiness on a per-folio basis, and if your fo [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.106 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.106 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1p0MYY-001PRW-3i
Subject: Re: [f2fs-dev] [PATCH]f2fs: Convert f2fs_write_cache_pages() to use
 filemap_get_folios_tag()
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
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 vishal.moola@gmail.com, linux-mm@kvack.org, linux-fsdevel@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Hi,

> Thanks for reviewing this.  I think the real solution to this is
> that f2fs should be using large folios.  That way, the page cache
> will keep track of dirtiness on a per-folio basis, and if your folios
> are at least as large as your cluster size, you won't need to do the
> f2fs_prepare_compress_overwrite() dance.  And you'll get at least fifteen
> dirty folios per call instead of fifteen dirty pages, so your costs will
> be much lower.
>
> Is anyone interested in doing the work to convert f2fs to support
> large folios?  I can help, or you can look at the work done for XFS,
> AFS and a few other filesystems.

Seems like an interesting job. Not sure if I can be of any help.
What needs to be done currently to support large folio?

Are there any roadmaps and reference documents.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
