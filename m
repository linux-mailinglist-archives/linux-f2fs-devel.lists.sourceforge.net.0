Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 464BC649F5E
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Dec 2022 14:06:18 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p4iVb-00023x-5E;
	Mon, 12 Dec 2022 13:06:15 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p4iVZ-00023q-JV
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 13:06:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=LFBXN07/yg5Nlf7myR2alo2M6bm9JpaWBB42W8Pjs1M=; b=LXVKoBUTJ16PVqRP5UmV6Jy7wO
 XYzl6mS+Osd97LrCAFL3rtQft2OH06ammntoYIiBaWlEtyCGcSDCsqWnd+E8jdHB2LDgjY7MkFo+E
 7scIMGK5TmV65Cl/dRVuyiMIc0LO0UctjScwRAPD7lAE6Ifl8WM3ySf7mH4STtyDcCZE=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=LFBXN07/yg5Nlf7myR2alo2M6bm9JpaWBB42W8Pjs1M=; b=EpnLnUXOrSKH+o88pdvbfMlJB5
 yIXegO/Tu+++XDyCw7MRxzYQakEAcK51HfBPL81cjeTPKvUc6TFCGwWOLrSj6ssO5U3VOePU9oImz
 dJPMKZKVUrAUGo71w3QuxMp1F0t3eNwDXMsUUnTgZMAxfOrWFEx6w5kz+AQ2lHXUX4GA=;
Received: from mail-psaapc01on2123.outbound.protection.outlook.com
 ([40.107.255.123] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p4iVY-0004Vm-Sc for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 12 Dec 2022 13:06:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=n7R0vSbLy5bDlU5Yxf7wv3QGss/Qkt3Pfi2cRyp53CTRr4wOsh2H2jAFiwrLTGoWr3ZzWQIAxiDYyKXKR7cyxIvL+Gx7FdEPmkucYC6+gKl6fMPLwIebJR9lkODxY1NH7yOwNd3cSZL7kuhgBAfD8iMSbYtGlBlddBBD6WNYO6kLDEdjVhwB481GXDflbEx6nh6nGJFNpiNTSNDRTusCkPioNh0uivkMeU8hOnomNY0CkAvBM7yfGv1Coj0/2SxAwSY6jTWhg3r/30dp37F5T38/tzuOYz6V8fB1uE17hCt59QDlIJ1ZiWhOyGNeBHcrU5KtQEKtHlNI9G4mOjXe0w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LFBXN07/yg5Nlf7myR2alo2M6bm9JpaWBB42W8Pjs1M=;
 b=oQSK5JpmtePwtPTiHLpZxp5zVdN+8v+bEvuS0VGRvLp1BszmQwlb2lt6dAbsggIDwoURt4ooAxPS/3BtfZH9jt9uldVq06xP3lJufr5P1PmEsGbwMXikmUIJ87VMK95zjNhvs++3KcEiaJ4Uk+zTwVg3d0BT+Bgt2pqEGV+JtnteyJkW4kplehobUA5PPeLmw4Yb5/BNfTtox9Mtiy6PdMKok4gP4ob6fn2/5aHDNN76NOnqpZCemydRAkDsgbAAuqojDTeNqs1uq5svDrMwFN4D3SPGqXX/2goJ2P7hjpbPPiCgh7Yc/GGtuNXrgFC1lhXEZQhnuEmTsAaMPZgGXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LFBXN07/yg5Nlf7myR2alo2M6bm9JpaWBB42W8Pjs1M=;
 b=FLqy5dqUfI0EDI+w30lDjCgUmDHCgusWhlGr0BTFJtC/RAoR9w57rKMdowZIAacRG7H24ZEAOflOrKSsVQwYAF4ibUD3XO56bIbmFFSbmHE8JN7tWkMKgi/tPgRxaGteYFklIjjsiajmc+FCe7OIovJ6B1G21RoMkD5cLMsIH2e69xV6Un2ICoMq+WW9K4bj0ls0WTeDoRE+nJVjQdeIsT8YSnBGyh9woBM2URReIkfLWdRNJSs5RMpgPC+nhk+fG+izjJ9DG7CZ1BKUhkhL0FbyAPYkNNP203Y0n3OBRIfYfkVlY4ptKDOh4/+MmoHDLSSpxwc8KrDnw4DMs+lVxg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PUZPR06MB5698.apcprd06.prod.outlook.com (2603:1096:301:f6::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Mon, 12 Dec
 2022 13:06:03 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Mon, 12 Dec 2022
 13:06:03 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon, 12 Dec 2022 21:05:54 +0800
Message-Id: <20221212130554.79049-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <3f2c81f8-7946-d2e0-8768-6f0b03282944@kernel.org>
References: <3f2c81f8-7946-d2e0-8768-6f0b03282944@kernel.org>
X-ClientProxiedBy: SG2PR02CA0136.apcprd02.prod.outlook.com
 (2603:1096:4:188::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PUZPR06MB5698:EE_
X-MS-Office365-Filtering-Correlation-Id: de9173fa-8fe6-4e50-d074-08dadc419f28
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 0AWtRQGC/4OGC+wFvyK08KxpARD14fwHUpXrCAsHLh1U5hZZUlJIliWazZuvw+Zlcf8RrBGdW2tKq3D9FYtvQ4sccLmy038tkca7uG6V2WCjbUeFoY9LVRgN1io4FMmJK+Mv5fctqprwMAe65kB4SYSsaGzDp9BI79zFdE5p+nI50kweF3WoSaRpsumkZq65Z09mtFIiorDQoyrw4nUARfuvEVE7cItlPWvfvlzAf33kEUHXw4a6WBcbgLgiKJWK2AYzGqGvB5Xepq4/uMHWqNpl7t1e8eicbrlJCK7Fo7JPRqVmUK6j7q4X8tkpXGe6JW3D2pwGp1YrPV4+01Ifc8mn3GKVi9RJ5kvmWN9NIlIqe10diUJX6p8luVLk5az2hFfXDrNeH9PqkM/EksgcK89F8j8DYivFRhI7+YDxeJDcnz0+WQGObAmk5DofQr/GFRhWWUoJgCGp7Fw/aYvg1jI62BjSEq5cWUICxwkfPWNG1Qe07L+l/PQLdy6yHRwe4mIpVhFwulTHU957ZNLkNYXkdzCnWwFTAPGg1LWiiT3KJSdaXdt9lr/RLnmORG243nR/sC3Lm+mEUL7XPlNhw7sVSjrk96wcaojbQXm9vjiBU9QlGMc437jcj8hpPfBZ1PeID2Gf1MLzIWxNTLvVh7Sq8IULJjewKxEKdA8N0roWthibKyrNahaWsjmqZ1X1GIYMZjxDsKBgKuyPXrz7zw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(136003)(366004)(396003)(39860400002)(451199015)(36756003)(8676002)(41300700001)(66946007)(66556008)(38350700002)(66476007)(5660300002)(4326008)(86362001)(38100700002)(478600001)(6486002)(8936002)(26005)(6666004)(186003)(2906002)(4744005)(316002)(52116002)(2616005)(6512007)(6506007)(1076003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?16oUwSMmVmyA0bndqrb5uCflwGRU9HKb1RfY9vZ2dYgWD+XQJPjTMZxsHeFL?=
 =?us-ascii?Q?9J5tCuKeGvpK9kq0abMhWM/gR0nWdxurlCOC5HoZNp/sqVc/0NghE1Rk/OXz?=
 =?us-ascii?Q?Gk8rKG/DpZxfq6Kg/G/7hHbDM6WRUT+KoUWw2CHpAZTUZXAMWTLlLyCnm1NA?=
 =?us-ascii?Q?j6edx4Wkl1DvXj9nXjBRvQRruC3G9fj8a/supmNCDyNRdprMMsSX7UqxWcI7?=
 =?us-ascii?Q?butwn8PPgVhzsR94R69xck4/oiuLdaBhGKJ6jscnKnMM0RGBKkH2p7JQDUaw?=
 =?us-ascii?Q?a5HE/UGQYUf/M6HW4j6LUKpBR0f8VQjf1/5EyggvrriPI73+2zq2ADzajRJY?=
 =?us-ascii?Q?Vxnh+mIvM4R0vJO8J+6/RFje2aXjmYA8GSKBk2IhoaatSUo72wStfuRNKNKv?=
 =?us-ascii?Q?VX9RvB4kFn2t9E1OVcC0Lc7Oi4YdHxayMJuU3NcuOVbR2Q6F54GbxpE5kk8x?=
 =?us-ascii?Q?mz3YZvwpZbA6WlkSTO1NI8DRn+hFK4am340DOnEc4tZ0JEFYfaAc20IiRio8?=
 =?us-ascii?Q?jFJM/7LNYpwFTLLUUZfMgyfzTo3REHSoiZjqTsIM/Ddu8YWlOlTKaMYFH10d?=
 =?us-ascii?Q?HdwlEWK3nJftcO3rOwxv5tu2ZM1stcJ/43RUwD4boB1rd8Wyh+sggB8G+VzB?=
 =?us-ascii?Q?briYvujsPBd3iimpKTkyQqEnpaDYLoAxMRKln6+uTtBVsnNoAJatAj3Lspbn?=
 =?us-ascii?Q?+mms1CmehB48cz64AqrqJY3QC6hwr7/0uHTv51rrsElG+P/OhgpdOJNo/fyo?=
 =?us-ascii?Q?POy9o4ot8j4WXXZx8UyqTvrwHHo3YcnMYXU2O5lT/IeoeN+VhCyr0obBvf6E?=
 =?us-ascii?Q?/xDTx4W9SH4bu7/Cm1fbsUMqLNUocjl5zWsyB7KO7OD9J/ziYoVgOfyp/zK+?=
 =?us-ascii?Q?bMf2j6SQ+7lLpkWEiEhTSLSMqgRydVDdkESkLR3molRGot02D17Gzyq+j6u+?=
 =?us-ascii?Q?Y1sM+T42CkrCqjTm6UIdt9KU+mcS0CmvW+HTPRbd5LmfQdktnRXXlv+v3D+W?=
 =?us-ascii?Q?kbxH5aqHWiZH20GxgHQkRBNvRJie3ojYiKRCzJHWBJNfzBP0EKUF+x6zVkD5?=
 =?us-ascii?Q?TlM3M7ydSkBDdTKO/vth3nWfhmG+HGY7+qSCW/a7SSQPC7hXRKT3ezwoObRe?=
 =?us-ascii?Q?ppDOxMxjLVH0xCjeE7qfVogbtZFlsopUNWlzt5cWN5kifE+1NIu3Ou99JsCj?=
 =?us-ascii?Q?KoJum+JsugOye5R9FzCMdK6cwZ7lSErLFkPwyeb1EBZ2rhvn7iAIeBIh5Qos?=
 =?us-ascii?Q?KaIa9S/Imlup+ybWf0aL329yjtvTRhinXytb4eQCOXTdh3lJQ5HBRSYBeq6Z?=
 =?us-ascii?Q?1+39cHCnMg+O46X9S83ZKDYoUfTzrcuzv8JIDsygtzbSm1a62GbgY4DimT8m?=
 =?us-ascii?Q?Sak8CmdRBf/cdT+3m4OUd6H9WK23d9za0k4iU0NtALoHMm7b8wok6E/YLXLf?=
 =?us-ascii?Q?28sfL5wXY77lip1rYSTtrHLM1IYanTlSTeuyeSsRdPugngKUiTvkL8lUsIC+?=
 =?us-ascii?Q?6AvU6toWt6ssOGN8LvZHcwAeiszr4VjtVBz89EketgzS14xUZgz61Qn+4xZr?=
 =?us-ascii?Q?7DTadrVc43KiEz+o80i5v5RF5C84RmsMTGAnA2H4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: de9173fa-8fe6-4e50-d074-08dadc419f28
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Dec 2022 13:06:03.0095 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: KD6uiWOp6dM2C9U0bkfkcco0a5tpsoBsjxfRULO96YYiTHa7seKPKkykMmTEzHLKniQ8q6MbNlwvZFaZt89PEQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PUZPR06MB5698
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Hi, > static inline bool f2fs_realtime_discard_enable(struct
 f2fs_sb_info *sbi) { > return (test_opt(sbi,
 DISCARD) && f2fs_hw_support_discard(sbi))
 || > f2fs_hw_should_discard(sbi); > } > It looks the logic is changed? 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.123 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.123 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1p4iVY-0004Vm-Sc
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

Hi,

> static inline bool f2fs_realtime_discard_enable(struct f2fs_sb_info *sbi) {
> 	return (test_opt(sbi, DISCARD) && f2fs_hw_support_discard(sbi)) ||
> 					f2fs_hw_should_discard(sbi);
> }

> It looks the logic is changed?

For a storage device that does not support discard, and we have not actually
issued any discard command. I don't think it is necessary and f2fs should not
be equipped with trim markers.

Thx,
Yangtao


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
