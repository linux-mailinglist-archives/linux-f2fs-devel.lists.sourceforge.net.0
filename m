Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 871989D48CE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 21 Nov 2024 09:28:29 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tE2Y3-0007WI-4X;
	Thu, 21 Nov 2024 08:28:23 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1tE2Y2-0007W6-1T
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 08:28:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7hSDkaOgxDxj42wa6Xm3IDycZHGXFlzxMJ0NklK4+QQ=; b=BzbYwCoSojorxqwCBzXijQN3BB
 VFR90mWJIfRJwInJX0b1RIg7eubOK6tiwFfG+J1b6FzkD8hKAt7b9Ncs8SNi5UeklL1d+QoyxlmGX
 o5donEFtYDsOj7Kv2gTBZg5w3B/OvgjqmYSo/IdyA7sAIiQn12pdMXMsGfCZ3mJ/kd/s=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7hSDkaOgxDxj42wa6Xm3IDycZHGXFlzxMJ0NklK4+QQ=; b=PCgevgeOeSrENHmxACXHOo8WQH
 g/2ZY2TpPm7TF94aJZTlBB2EPBxBGyQRKrIdBDANY1Sykqp0nMsylcHnAZnWFTPbZouIwzN6HymkW
 2dpp+416pXAAXPyqd4sZWfMrdl5IKB/qYzzu9prLbnHbqkGjxrSIS4r5qIEUiCJ49hQo=;
Received: from mail-eastasiaazon11010049.outbound.protection.outlook.com
 ([52.101.128.49] helo=HK2PR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tE2Y1-0002QN-EK for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 21 Nov 2024 08:28:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=MpRlbBvg8yt7rr4yb7SFaMGSW8Rtm0zSKN28hTlBaEvgoGE9tqUa5QMznSBu0Vimk5jS6XjICk4SS3o0UKHCYslFifZhhReknxX7+B5LQrwGsr51jkK5t5PGxnx2lULAqIqeJskz98gCDtA81yJdWGIkRjlzhmr68wPNwgLgxkHVLiOEyEVLE/ePLj1ofMujK0GWv3fCRbWa1GIyTZ9QB/1MMuhcwbHaX+B7rL55tlmieHM+oEyilD732P6qeEGWJalHt3XYONBFFtfrFf4rAE3xwppYZ6ngm4PfUF+SI4WQ5JxZCW0GSg5zXPWCC0faIp2pV9XMxaqozBnIGTWBjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7hSDkaOgxDxj42wa6Xm3IDycZHGXFlzxMJ0NklK4+QQ=;
 b=dnZKcuY2226tbO43PYoYFCpO9umqeJ/2QZpdjN+lr3SOs8OYRekec9MqDqGWfqSSwKRA0Lx7MqaUwjxNbkjP0anZB1vrSE14r/Dwug4k09Ml1DZQM3RYca6NI8f1xmrwWej6kNLyS7nCsFL95o+SYeq4MU0wxu+XIP79E8wl2dCzgPv6y9PNzW2QbImCG0zzE1omVLq6js93Trc7wjBRsKBHcrVNy+m9k+qGHQcsKUMHUCoOZDg7FHUZLeZHI+TxJOQGiS9nQV7gJw1oKlME7QqcTMRnMjafiIMsxDZLbZhAFJqDwCgUBZfdnh2ZRUpRw5qYGjWOZA5NPXVlc+j+NQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7hSDkaOgxDxj42wa6Xm3IDycZHGXFlzxMJ0NklK4+QQ=;
 b=EVZP9+gY1zYUVVI3D1O7buWAS3C5hLrw7n37tNkQDh96BKLgszz/qxf2f54X6PSPCUdx7OIxeQTD5f/0s1Cd2HPPuXfIlHd9lGYi9+Mk8V4WF5ZRLl69fsSiGP5Jd+tiN1HGQcyaiuwOj8BkX3Z7hpFZc0HFOrBY0VDx2/t3iMA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6290.apcprd02.prod.outlook.com (2603:1096:400:265::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8158.23; Thu, 21 Nov
 2024 08:28:12 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8158.019; Thu, 21 Nov 2024
 08:28:12 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 21 Nov 2024 16:26:57 +0800
Message-Id: <20241121082657.2644346-2-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241121082657.2644346-1-shengyong@oppo.com>
References: <202411211538.Tus6kZm1-lkp@intel.com>
 <20241121082657.2644346-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6290:EE_
X-MS-Office365-Filtering-Correlation-Id: ddc56e49-4b4d-4440-2b04-08dd0a067008
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?GPl0Clp2H1OgEW2VSqr/EZL1guyTZ9M09LJp7ouTXK2zQBjKsX2DdbS02u4t?=
 =?us-ascii?Q?AYnrBg7oqN6B7tG27nSGGe07RPog6k8hy2k1K2m0XNcc1kyVgSeNqgF9y/js?=
 =?us-ascii?Q?VerO8fHXc3OKuLVmYLueZcQJv7Vkyaaz6Oom7UY8Zv3RvTq23ObBiMIuC2gO?=
 =?us-ascii?Q?KZ9/EbuSj2Gbt6n5ccxi5bOvqEDm6J0FtD4uLKUk/lN2Kr8T0FOE2qzjFnd1?=
 =?us-ascii?Q?DBnZqqYiv/5GHBdJsq4pmv8Fhi/dY7TxCdrD0lJLw3vwZC4p8+V19bIJiyl/?=
 =?us-ascii?Q?4vIGk7hgsNcc+aQ7s+S80nor08YSrsduCzIoJzbFP/sz5Awf2u2nm/7KaTln?=
 =?us-ascii?Q?zwC2vHwgW5zEMNqoB0yjh2FAjnP+UqZcjY/c6DwHYqfo06HzRuzcp0Yhmpdy?=
 =?us-ascii?Q?J0ppld8lqaZQ9YfaR+BF6UNaz2irg1SoHwGJwd3c/Q0ZvGApAipnI0EJOnen?=
 =?us-ascii?Q?Msx42uyEOcMjUaGDDnDhMPplbuvNpZoNJz8SyRte26Hxt828Y8JtBHIfTxCx?=
 =?us-ascii?Q?F4HtDxKF9jMJTebp9QdoEY856nEOOH94ETVjXWFoKV58SP9XMXNzVC/OtEcM?=
 =?us-ascii?Q?4gF+P/myGCwjf8/uoqhSa6c+9Lf7+JdUhNqqX0oNUCfplD+rJxl7E7nQbtK/?=
 =?us-ascii?Q?DTHROBZ2fLQVK1lh4D23cTHqcS8OKljMfyYhRzIe6CcFC9hdblBWyXCmdzaO?=
 =?us-ascii?Q?Celp7rrQ9d38CsX2hj+mndx5KOObi4S1u8VhgSmuBH97vfiDICzJ5kNEzHp6?=
 =?us-ascii?Q?1IujrK+DIePysjmSzY8Gflf6plYCVtJe/+lhzV77IBMjKQGlZ4g6gdt4xPJ1?=
 =?us-ascii?Q?n07XpA28BmxAD/k+yQdISOznY7wjgU2hxGqnjY6N6ofMaOvhTAv6+TgbRyTP?=
 =?us-ascii?Q?WSJEAqwj18GQ5N71zr+RYMsqn1QWvo5VzF2w9bDe2C0d35Xc7kdeDsH2b0C3?=
 =?us-ascii?Q?RTweNhBsJlbumHJcZQZJJpI0ls3MeT5gire4LiiFmSiGkViqWSw5EY3QO0pE?=
 =?us-ascii?Q?zMw80NxLsJ0g8fViq7VfzPCF2CbqqHW8bfWcsR7dcTwBAQ512DFTOfpLpZEL?=
 =?us-ascii?Q?dQvufTKmCjqHWKkyvJTzKGXlT4ZiSbcJ9KnKqGzsdWFyjGa5rsIywuEs4Y8p?=
 =?us-ascii?Q?jrxFiIFTgR3CiHm4zJ5cTTAuNH7KGlO+GsPn0WGs3qfS+pp8qSxqr4PTdsRX?=
 =?us-ascii?Q?Ybz/QG8Vwt2O2tQQio+AR2L5DSa25pvbp3ubklTZYOKRDu8Vo2fKeBuHK/Zs?=
 =?us-ascii?Q?MinbWROMKxvfnJaAMUdTkv56hau+zom3huINj3XQnU9Hj9ucNAgaC1mtidTr?=
 =?us-ascii?Q?a5nmMRIvTHZVbjL5Pi+4LU8qFE+1rsBLIhaJRFbx8lyYIFhgKlAFYu5bBP0t?=
 =?us-ascii?Q?YQBK+hI=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?cgrvYHyGssRztQQwyZL53HfLGVy3vLBoywbwg4CV1Pewj2oak8HPrY5QzFfa?=
 =?us-ascii?Q?i4Q53WngLmTOmfr7h5Yt4pEBpKpmu8kiMrjJBhU54KKKX2gwp7P42FaZhlc3?=
 =?us-ascii?Q?gppa/Wn1uLTcL0Npi3KuMGAjW7CDeP0/HJ29/8jYrXXeIXaG1IZf0vFIuETG?=
 =?us-ascii?Q?PJjrjAwY3jE3c2+aZnOXj2jyidT/nl5m0r1OPUsp6EjjwwZXTmtd6eZDW2YH?=
 =?us-ascii?Q?uKjcu+Gmdu5rxjfo/SJdhsofBB3MgKf2Afd79M3bGf7pS5w3akbSN8MNkt5/?=
 =?us-ascii?Q?WxK5taTiaNDgffdQM18YAjbyuZSBAbXLFKjmlnQTt7D5MVBfPfwZpRW6RPw3?=
 =?us-ascii?Q?kyrVRaYGIp8dWE3JRLg0GwhiS0witCmjrWN5rmZB4hM8AdTaXlQxt9Ni2iAM?=
 =?us-ascii?Q?tipBXEtaP4BExpES8jCBoWlKHWxUpL8HvEmI+/weXl80pLG5pgLjEFW55rRt?=
 =?us-ascii?Q?zA108iXRV2uKrNMaGMJgSDeVZjvcs1dQfyAHponhPI2565joY1xsfXwG0Z8z?=
 =?us-ascii?Q?vHgrv7T3DvifyNLUMGCL8RURLPPk7rY/wh0x/y4PXC0iDnsIUEM4OFJFwMY8?=
 =?us-ascii?Q?Z2dhgATqsZ2E8vHvKx+Dst4L0ZPK6eMX0MReNGm/c9uB5rZLKaiHJdgNyJbW?=
 =?us-ascii?Q?G+xAdMYOykir8/32at2S8A7ZGrLkUeBgcxA9i4aFOcv3zM+8g3zEr4EzboMW?=
 =?us-ascii?Q?Tf7jcUrH5ct3hMu1i9968hLNRhxUNVM8QdB2wA0WnoY0W+Dm99k4O/464GcE?=
 =?us-ascii?Q?RXtu1RF6g0ZXKz/omRVq8C2Cn8aDU6aZBRXs9uWK/8P+l6TSloDYq2EzSo4w?=
 =?us-ascii?Q?fC8U//sBDmzAWz954fB2HDV8ud9BHYMlitV67eo/9S7tahhdqZBmWdAHJBru?=
 =?us-ascii?Q?VZ0QyeuXRDz+Wh3Ix3PzeIr5N7RMESF+lEcmP1KjOxWVi5RG15hC/9+kmWTM?=
 =?us-ascii?Q?s+1GISJjd9KXQirpekVC/rbjYX6PxZ5dYVp8Jq/Bn21Wci0rbudWm3t6addI?=
 =?us-ascii?Q?t3avqcUgA+8NsOk00BqkALw9jGR5vEpWa28MHcYMq8AJECh0BT5vBXCrXFIS?=
 =?us-ascii?Q?/VjjZ4OE9s2wRTeYz3wWTDMsHttlwz5HM/mRb7vwaThw/BBDZgFHuBoM+dpd?=
 =?us-ascii?Q?141lyun3N7pllMSdkoMvX0Ca8bv5N3Z9sc8V0KF7GsjAWgSaGK+JgYMR1BvK?=
 =?us-ascii?Q?m8hlj1DnMBemqVxkAymuzNTgNH+O5xotqp+9KjIUf+RpNNeR2sdj8cjXCfXd?=
 =?us-ascii?Q?AFrhSS3jVA0MLxJEfHlYnlLq7ucHI/rkurT0JKe3nl1ue57t5ikc7NVdM/0A?=
 =?us-ascii?Q?3t0Ftb6cH562VJEBVw9byEhBypOE+3HWzAI4qTQ7NBOa+u5O5jOv+S6Q6J4S?=
 =?us-ascii?Q?TVkkdE1M/cVuimpr5qAxsoqexL4F5Q6khSuhaJQz1AJmB6t0d4PN8rAzCaX4?=
 =?us-ascii?Q?Bs4Rm490Ph+G7yJLB1bW4mG09GPs0O/djzt1GFgQ9vxuhddkYiYMF87N42po?=
 =?us-ascii?Q?WaZA+a8mtrP+MFP6PHaZQyIpLPwsva2B73X4z+ekSXunBbD5P9L4RdzRhrVb?=
 =?us-ascii?Q?8+0EY1oWND1bQThXPTYylKJ+EAiupFkf60OwgW4o?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ddc56e49-4b4d-4440-2b04-08dd0a067008
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Nov 2024 08:28:12.4585 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2tq+3g0p2MSfCD0ew94yPKJI5qGvuCDs1PIF6S9PXDnIqBGdcqhe8KIe7w3XaD2pGEYbp4Y8RGgT+JKB3rt4Uw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6290
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  SBI_POR_DOING can be cleared after recovery is completed,
 so that changes made before recovery can be persistent, and subsequent errors
 can be recorded into cp/sb. Signed-off-by: Song Feng <songfeng@oppo.com>
 Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com> Signed-off-by: Sheng
 Yong <shengyong@oppo.com> Reviewed-by: Chao Yu <chao@kernel.org> ---
 fs/f2fs/sup [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.49 listed in sa-accredit.habeas.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.128.49 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.128.49 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.128.49 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1tE2Y1-0002QN-EK
Subject: [f2fs-dev] [PATCH v3 2/2] f2fs: clear SBI_POR_DOING before initing
 inmem curseg
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

SBI_POR_DOING can be cleared after recovery is completed, so that
changes made before recovery can be persistent, and subsequent
errors can be recorded into cp/sb.

Signed-off-by: Song Feng <songfeng@oppo.com>
Signed-off-by: Yongpeng Yang <yangyongpeng1@oppo.com>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
Reviewed-by: Chao Yu <chao@kernel.org>
---
 fs/f2fs/super.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 0db3fb47ff6f..9aab877f152f 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4776,13 +4776,13 @@ static int f2fs_fill_super(struct super_block *sb, void *data, int silent)
 	if (err)
 		goto free_meta;
 
+	/* f2fs_recover_fsync_data() cleared this already */
+	clear_sbi_flag(sbi, SBI_POR_DOING);
+
 	err = f2fs_init_inmem_curseg(sbi);
 	if (err)
 		goto sync_free_meta;
 
-	/* f2fs_recover_fsync_data() cleared this already */
-	clear_sbi_flag(sbi, SBI_POR_DOING);
-
 	if (test_opt(sbi, DISABLE_CHECKPOINT)) {
 		err = f2fs_disable_checkpoint(sbi);
 		if (err)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
