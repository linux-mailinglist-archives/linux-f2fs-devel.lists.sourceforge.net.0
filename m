Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0300564A2F6
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 15:14:53 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4jZy-0001Bp-LC;
	Mon, 12 Dec 2022 14:14:50 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p4jZv-0001Bh-4M
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:14:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sB+n4jZTMB/fx/gxcGDwJ9Yci4UN7SIlRIrbXVXWq+0=; b=ma16vX57UIJlcYp+RKsgjxCTh6
 47bSIDJK4w+Xw0welDnNVMUP+xSqTOtE01IsBnqn/jxqgZu2ENjsMuAuRRiSdwA88P1TZA/cCXR5V
 oUcre69UmcmdlmS4Is5PTu3TT4TwGYh0uX8Vsh8fpjHUCiaYMZPQt2Jz8VL2L+nv6/e8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sB+n4jZTMB/fx/gxcGDwJ9Yci4UN7SIlRIrbXVXWq+0=; b=VdZK7yTiMWm4K73umnl3/rjp1O
 2O/OzrmIL0V8EujFUBxXhOpON0pmxm8PxXPBG9F4ev7ELqiXy5UYvZzOfHozQ0zzLV2EoUcIujl6l
 NeIxoEyHGH4GBCwG+gGeVcOHKXtoniTI3k6xsQ82AVR06S0FA+fho2a/moFkSVzX6XBo=;
Received: from mail-psaapc01on2117.outbound.protection.outlook.com
 ([40.107.255.117] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4jZt-00Eo1C-8L for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 14:14:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c7LlXaGvxSUSXNV9wYj3lUTVFD5Vfmdi9hYkssn/RmAKjTa4Wtw9ufrVmGF3HHBJnkv+jdVf3c0Qw4dYkZZiFCIJEF1buergQmxgbKYjsNsySW0AAdo66EXtEVYOWgBu1T4jmF6x+JnhTTittCtcvfVcoi7A2J34g02g7We9Hl6kPeK3hlI35/oEKyB5UfgjN6oP39LAoNlxW6TdqUmHsKqwQ2exaA9r6rb1ECo16M2Y48ORNDUOvRdCIH+ivUecER4i4voqu2W0aP6IzPcuHt5hTG9HIDqy1GDQo+czV/bm72es5KOp3pSpih3RpZdx+P2OA20iZjFpHIB6lRCSgQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sB+n4jZTMB/fx/gxcGDwJ9Yci4UN7SIlRIrbXVXWq+0=;
 b=gLcllg+8qHQT5IqbmjfV38ANHipMScbF/MDCuV+XgQLP2oJakS4gaqrx2SyciOFwntsPaPloWAeQ/gi11Nhg1V1Y0/ZuAEFe3xAZsY8JO6D5Ezih50YptKNdaLj6S/fd62Ynqk0YemXmuIXRAWDs2v3TwTZ+F3tQu7eALdHmfeKFACAAl76u/4pb7eh/DLWqyHMMYbDb4ka7lNl+pkirLMwvJEeS8e/uML35nGiV/hnS+d7OAn5BDZkqVfY1urbJGfdJVyDtyp52k6SESV1svGptHojkVcJIqsQnozfqkBR55gd2691J3jDram9eyMQjzjA30uWuL9ZaYGxLp4/iOw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sB+n4jZTMB/fx/gxcGDwJ9Yci4UN7SIlRIrbXVXWq+0=;
 b=JQa7JPwPKn2CuNVuL7uPVZuoDLtr4gbCRMxDAWNJZVcK0SN9HQt+/qdBOb10ExTMa94sp9xkSSLbVzv0SiZC+/+i5JGTwkr3dGLA3nsJ6NmoxzbvZCUMr+Ug0vl9Ts0cwe/bzxoX7+RH82FN005+Y+Pn63KGiGyhsVgbOgzZZ0dY9fopHMaL7y+gYTR3/RrW63Dum4u0FXaTXP8u7jqYuq7mqaAKIsQexHooeft+EJXiivjpJQgb6LOO56Vv9B95BkrlRUyIsfoav7lq31EzHXEfie1o+IP8FLO4rYuHFodOyGI3zVTjz1aYUS6hoSbgBC7qRBEuUkf39QRl/NwVig==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB5395.apcprd06.prod.outlook.com (2603:1096:400:201::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 14:14:38 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 14:14:37 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Dec 2022 22:14:29 +0800
Message-Id: <20221212141429.6329-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <974f5013-b6af-a39e-0b0f-2ce86253eaeb@kernel.org>
References: <974f5013-b6af-a39e-0b0f-2ce86253eaeb@kernel.org>
X-ClientProxiedBy: SG2PR01CA0183.apcprd01.prod.exchangelabs.com
 (2603:1096:4:189::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB5395:EE_
X-MS-Office365-Filtering-Correlation-Id: dbc78305-0a22-48ed-3bf2-08dadc4b33d3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AFxyeuOTaW5TQz2PH8LsL52Yc6Q38rRhWgKCy4d5cGHIVZtcobitLbtjXXyypkGtUOCCh8cxaMI2hQPVmcJWFtqhOLzBeo+1YZ2apoZowF1QScx1NI/RxMlmmBsbLW8m+1jfbd4O72SYeINX1FCdObKBL39QHSyGprVn9gdSNGsVDyGyoHflxc8nb6VKcxonRaFMzAG8hjqf5LBJcUu9fWQAcvWUX44qYTYAqKACo7AUDzFlJw4QJiiBoGoXeg2YyMVwUojQttWYH2MHQ/rDLKR0p6wL2NcSaU7/mMHIowSA/azBqzEJMcUHeoSTzV/yYkQ1m0USxpL0IncGzxf4vI4ja++78n9i99TsGYnMMpsZIWz+bkRQUSFAHtxhWFealb15Np7Yxm/I94nGtp3Oap94Vib8xrt6KnHb0Oylorh9SzPTO7wddSMOmGJO35g7Kt01VLcQCTy50GLqRdlXwbGTBDx7I/NrGJ/GB1qzV/gxPTrEMZb8lInwVDXk7wBqZZktWad/wS2tbkQkeEmUZZir+QWr9hP1IzxjmUsB/2l6K0RUFx1kb4ws9TS2J57sgFSidSsMMx+3A5TvldQcxEg7ls5Ps+WmxHD/ALfYAU45qSVyGvcq0qs8AodgaY1TIIQARFi6Vx0ZLGSnEnxu3qFK4+R5YTh1xQ9k793GYMYSjKPFFh1O51Z1GDAzs3XP+oT9hvi/DLu8acQmy8ErmA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(136003)(366004)(396003)(376002)(346002)(451199015)(86362001)(36756003)(478600001)(6486002)(6512007)(52116002)(4744005)(5660300002)(4326008)(66476007)(8676002)(66556008)(66946007)(2906002)(41300700001)(316002)(8936002)(6666004)(38100700002)(26005)(2616005)(38350700002)(1076003)(6506007)(186003)(83380400001);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?JJJcS4GoRewQWhT02KVjefPCOzFANLrKafmqU29+nK0vUJvim66Rdx2elC2M?=
 =?us-ascii?Q?qba0vyMkB+1Q46cpKD5yAC9UlyyEBa6ctjMwnTsCDOae7SSGxa6BSTR3/G9Z?=
 =?us-ascii?Q?DL5UrMOUEJqf8BcSg2TG4DiMUgghH3no8MU8Ju3k/QpjNUmR8jYs5Knu5SMD?=
 =?us-ascii?Q?xDRa/R5mzDo5AWL93qIFZTEIgWBRYqEnuXbU0f8mrBDZzr7wqpSZhhUsjz2/?=
 =?us-ascii?Q?4xVxHmPg0GFq1hxMd2P/0MgnFMMZkQlu+to7XjGGdbT/szULKG4J38zHEDFc?=
 =?us-ascii?Q?TT5z723WT42ZQEBxvG6i7uGCA4xNb4FbXLqjqLvQdsQAGxcggZZFCNFVNIAW?=
 =?us-ascii?Q?Jfx5g/kJaQzXhzgcoNr3h9xGICqpsICsOFpNsp57dtJVP+DZsqe2WMJpV6Iz?=
 =?us-ascii?Q?klFilUs0AjmnYStkXp/mVYSAnsoEWaQyZQTCqtQthFRuEfiWwTEGZGHneKoi?=
 =?us-ascii?Q?2w2fYBs9WIWgHOvlM57myyFw+IcstkNGxm6IYRLaYt2Yy/IdR89rmcbBquUC?=
 =?us-ascii?Q?OukjQgONltuwj69qSYMDWho8wkB8wblQ9Mjb81ObmYFxjYEV0rMRBZN85HAz?=
 =?us-ascii?Q?ZAlyKZroD/djaDcnyK1w/QpkE9ilqTFlhcZxzMsQ9+H9traagU18HO7oRsav?=
 =?us-ascii?Q?q3ASHgePbBDVbp3iYQR+SczzZ/+NF6QvtsfKTeu6Q+tvL4eyycwaF5haDdxw?=
 =?us-ascii?Q?OMv20YVHAMilxRj/lCjMn0xqe6ba6Enyg1szH+wnyPecv30z4+ARAyRqzOAf?=
 =?us-ascii?Q?jJFA6RN5QIpqbieIEpU6MVSG7gtTeoZc0QmHoeLR+eRPrYDAEonm8b4X3uEP?=
 =?us-ascii?Q?VFRnKehmqON+aXBdIuboOdKJIhd/mftS7SaRNZJiSZ6xI3eUzjSiI/F3+FS3?=
 =?us-ascii?Q?D/Z9DHmI/VBDlh5YmfAOYi0v0/Mg6T9ecvHzdylsp8NrlyGf0hw0K04PvvNw?=
 =?us-ascii?Q?c4XXcHbj5UmZXa7wYoKZTWX7CJ38WW+kNGvi93jSKTwd7kbjRqpureR+LPWG?=
 =?us-ascii?Q?rnFH8tGFnFr7Shadbv/7UNZ08DJbzJMEsvtdJRRowphVbWyyTTes8owPQPe5?=
 =?us-ascii?Q?rd5GbUAzS1QhZPsvphjHHgkiixq0/xY51npf3aoplnNnxgyT0n2cPfmjHGnL?=
 =?us-ascii?Q?Btoj1DaLuvlfwufO2MZ6CeLPvMSDdAv4GryZfnUxdnWCT4+7Q4eLOPtVtRzj?=
 =?us-ascii?Q?0CYu8xMjjBsbcYYVTJ9iE8B1TnZCdKJQslh5v2a9oI3eN5AocV+i4jUhsstd?=
 =?us-ascii?Q?TOGx0bUfgoryzwW211W7j/quLHfCbif+f6dnNLSPE60o7GEm1gQ0nm73CPm9?=
 =?us-ascii?Q?AJ6gIbRMWfa7zGfklmH72sHNSV51iCfVb9QSh6UPobAa3AzdjbeOFTFWKRbZ?=
 =?us-ascii?Q?zetyBnW7D8EB/nW67lsAAcRIWxNyiTilK57DJ/eAUSdblW7M//B4ZdJFVjGv?=
 =?us-ascii?Q?/NmoFN08dYVs3MLR83K717Adxy59dVFCkw41Lx796Uah55l6L4nN8ixmFhKr?=
 =?us-ascii?Q?KCw2hjvFpgdv8XXxT5/tmV0ObsGpYYUKSEeyDfdI9NY3FAPWTPM/HiUcI7se?=
 =?us-ascii?Q?kaqhhDdOaJTqiyBzQR6zHK6xaeDHJvMG78unNggR?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: dbc78305-0a22-48ed-3bf2-08dadc4b33d3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 14:14:37.8516 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: bPuqopuSpHNdfeNz2N3kc3ZkLpPV/3bkl8abJCN8So1J0KMVgVW/xTkdubo9p78VlgoiNVe68L/8KvLYOztcBA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5395
X-Spam-Score: 1.1 (+)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi Chao, > The difference here is,
 if we use f2fs_realtime_discard_enable()
 in > f2fs_put_super(), we will only write checkpoint w/ CP_TRIMMED flag >
 when discard option is enable and device supports discard. 
 Content analysis details:   (1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.117 listed in list.dnswl.org]
 1.3 RCVD_IN_VALIDITY_RPBL  RBL: Relay in Validity RPBL,
 https://senderscore.org/blocklistlookup/
 [40.107.255.117 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.117 listed in wl.mailspike.net]
X-Headers-End: 1p4jZt-00Eo1C-8L
Subject: Re: [f2fs-dev] [PATCH v2] f2fs: don't call
 f2fs_issue_discard_timeout() when discard_cmd_cnt is 0 in f2fs_put_super()
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

> The difference here is, if we use f2fs_realtime_discard_enable() in
> f2fs_put_super(), we will only write checkpoint w/ CP_TRIMMED flag
> when discard option is enable and device supports discard.

> But actually, if discard option is disabled, we still needs to give
> put_super() a chance to write checkpoint w/ CP_TRIMMED flag.

Why do we still have to set the CP_TRIMMED flag when the discard opt is not set.
Did I miss something?

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
