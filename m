Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4411092922C
	for <lists+linux-f2fs-devel@lfdr.de>; Sat,  6 Jul 2024 11:17:18 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sQ1XV-0005FF-St;
	Sat, 06 Jul 2024 09:17:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sQ1XT-0005Ez-Tj
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jul 2024 09:17:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zr7eZ/umvFI0IK9ZzBZgID/XxpUUHRanXPRA45J0FEU=; b=Y5feCnnKzZbxAtg7zHOdYNUD/a
 N+UPOVrekh4hXLone381o5+o2Ax+HgWAYsHKX+1KwLNfdBCKSWX+eVisGD8sG9ZqWY7GiDmIM6ZtB
 ATCLVdYaZK0x113gNh7RYS6/YBmcdLR25eNXRO1CBgYvPdWWb26tDe+Tcjj3lCgTwHew=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zr7eZ/umvFI0IK9ZzBZgID/XxpUUHRanXPRA45J0FEU=; b=L
 6xH+J1BTRok07yxXkFQ+1gEyVocZxegSFqUYjbyOwu2F2HaKWak+3chs+XoT8AKm9LQJGhrdh3FY/
 NLX2vWwqH5c0QyZz/pJgJSyVG6pcP/zN6Jo/OH7hQ9LChBF0olPzV+jt0kDtsYB0wWFGTzLhRunsA
 m4pP/v3pMTB+Hyws=;
Received: from mail-tyzapc01on2063.outbound.protection.outlook.com
 ([40.107.117.63] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sQ1XU-0002vT-Qh for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 06 Jul 2024 09:17:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Nf8JQfnQVdZnlfHmaU5pEAlhkRcPNMwLaZyF2IAe6C86GAmcrnlFMjJ8OQKs3t8pcjG1qyvFR4YHWLap6Ael7HoxEMK2q8BQrbSOYT7CRoqv6eVtvhrkfXPsHTzPn5/Ub8FFY8XIfX2OEd/j5ZiRPHACmLqhNQdJhaJKnrDVgbGQotI6RPYE53bF1WFkfLBLirkAqEuBni8uJ0tDFGFejHV2WUxMMCK1LjS0+D4aHyAfvqA97xoEH/LjAGkTobNR2sYSk+yo8stv/UXV1R1e4JEIvPfPDWcCvW9sN3FMjFArfEExDtA5ZChrH67krp/0zSiAenwoCAHZS2sYUlWIjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zr7eZ/umvFI0IK9ZzBZgID/XxpUUHRanXPRA45J0FEU=;
 b=ixh8/IT4E6U1H5OPS3sWgPEH83sA+MpxkShw83OzhN2KAdqff30t9c7qVGIFemLFvkR7lxStM239YpqTu9ROaD6b2jPFVn1/cVJpA+b6KGcAdMm6UABqNJ68oEeW1qXIFJjzuN36w3xKwclh/eyLpJ/nuC2qaglJwswWUHsB3vku7y5E+45Aia/Gpzbg2rdyK1rh2Iy28IOzUAKzZQ46H8KbdxO/MgfzEC/IFvH+TKPt51lJiVYN+RL4zPsxHD7YIOYuVKlrIPZuP6Ebk7/1FquHOAAYqsAbzSMcmX/DuzRCsWGs/p4jbUS88gmazYc5W/rkM8iCjleEmXO7Sa5Ymg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zr7eZ/umvFI0IK9ZzBZgID/XxpUUHRanXPRA45J0FEU=;
 b=emjuXHveK+451Lt2dOdADeUoXC9W2rqCqTccMks6CcSWQqueKBVsXkHTZC8ubd/8ClwJqGBe1ER51QKqS9KgDoKZCo9cy3pIHFf9RLdks2k+TyM30mjb4LL2E50qOE4S+hCtbzSUp+e/ajzLR2kwGSFP0dyGoJIcvoZGTUnlzLs=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SI2PR02MB5516.apcprd02.prod.outlook.com (2603:1096:4:1b1::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.34; Sat, 6 Jul
 2024 09:16:50 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7741.029; Sat, 6 Jul 2024
 09:16:50 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat,  6 Jul 2024 17:16:34 +0800
Message-Id: <20240706091634.1970874-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0055.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SI2PR02MB5516:EE_
X-MS-Office365-Filtering-Correlation-Id: f3dc83b9-a9c5-4deb-c331-08dc9d9c5e12
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?0m/CugkZVU+lFjPw6Mg7h8ot3hJG1DlVB8lXSfS8qk9Wb/yGGHNUSZ73ydk5?=
 =?us-ascii?Q?w/i1l71eySMQh5s49aOxb7kGC16G7oFw9o3jJkEX0ktA35HcTU0AM3kWOPDY?=
 =?us-ascii?Q?KkzHJMWVD1NRKYlT8tDcbxex9EP5CJDOYqbJ+x9a9wsxD4ocvPUD324/tYbs?=
 =?us-ascii?Q?m9t0hDSPfPBkWc+YGWZ0+n0NtdlR9iv676czrngYfnCp/FrlLgwt3yvoRZoh?=
 =?us-ascii?Q?439sRHFFwWK6RSp7dy6YCgwTgBVTjcmh+3iZSLvg77U0AsOfExtk6x7MH4wd?=
 =?us-ascii?Q?9QhPt8IG2mGVK6g86SqO9Rj7VurE3ZyYSCsyn+/rPHea/mrkyjAAG9S8lL0E?=
 =?us-ascii?Q?sHlg6Yz9L6TzHsuCV/Tgo/Z3nh/Pi3DBpVgDtEtLMg16BiaxM2GzC0rT93Bw?=
 =?us-ascii?Q?A16vNMhVJ4GUQRaTnvPxG22HFj+DIyN/IaJeBrB5Ii2mhVr9SJxAuuo0mqCw?=
 =?us-ascii?Q?RqRZmVKui0UQlB2fKuWxWnEYUKmq6+/CZaskpZbxitnBph3ztf24lIeNaxLB?=
 =?us-ascii?Q?APOe+WbDCDbE6urWuTx5OhsyJpfJF6COr6iO3PUH0bWMGMTuW+tmsnsY8VnL?=
 =?us-ascii?Q?0niIieJuITfDMpyuexSNCsavZ/AvIh8zJf4speOeqVtLlxfUrwKo2HTPwoXh?=
 =?us-ascii?Q?rvM6CVQjF1NjpCHuUvdbVFFbXhweCBRV2pPbf6xEoilf7UZ0WHxl+0aZyUGq?=
 =?us-ascii?Q?vbYsMkAlPUYXlrFspS2U31sfHNQvJzjkCmisejzFx9On8m5lOp2Np+bAZ6at?=
 =?us-ascii?Q?jtrIEQdnYTq70AXSHDGTqmDB8bKzpdQizqPFYx6TM60KDar4l4somNluti+I?=
 =?us-ascii?Q?YbdbN7X+73n5cZRI4i3LobdjYbKiHXMF4xjWXP5NGn+LUZNNkaz0t/TO4zEg?=
 =?us-ascii?Q?AD1M5t4AMudUxy3Njn8gT1FOihc2OwmAlvPu6trkOrkITauDg07THNwgLah+?=
 =?us-ascii?Q?sbwKVy/dS+5SyS6hhJsRW+tKuR2iC33YqpYRsLs0ST6neyrleqg2Ouc9o8d1?=
 =?us-ascii?Q?xHHr2JoLUQ3Tlr58LnVh77QPfWYn8ZfGct9mRlKi+fvhPM8ptDLff9peY2i7?=
 =?us-ascii?Q?Lzxu+a6LdEKk2KAhEwVjJcmZytGxN4A+elkNGdVwQWM6KUtrTg3b7Il3rdRh?=
 =?us-ascii?Q?EfuP+T/XdLHvnxa+NsYd0FwRKyNTli0Am0FUoPglLbZO/5RwPyRVmaJ3BxXL?=
 =?us-ascii?Q?9PbRGSSZhM55P8MhsjH69PZri6CbK2cG0ZK7VevrZUmjJ1mUqCg2HXjoyba3?=
 =?us-ascii?Q?IpgUuu4Aron/J3QUDhrYYBhywdGVHKWHLr2TDAhty8nLcWmRhVLidr5g/QiD?=
 =?us-ascii?Q?fnPaBJeZorN5GRas7cAlxlWEgk+Wusl7Tyt59mKRUJDIhsWQzhumObOEUt0B?=
 =?us-ascii?Q?vKPhfyj4pykf2Im1tf19yFIYbM8nvEGLgpKsY5fXYQvFISvpfQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SLuhIzNn4/dI5hZns2nm1NeUd205L++8Nf+m4UQERMCPXzSY+LtU6nwGqmQY?=
 =?us-ascii?Q?rk1Wk5cLJHZBi6XFs52wFWrYCWEKRKJc1e3xpEeKhYsQqdryz7xjEZ5G1ymO?=
 =?us-ascii?Q?V2oGeT+J/qCJgB1xH8ZLVtBg5E9k3JCL5TR2SclS/9MO6RgZIvxXm2fbJkGX?=
 =?us-ascii?Q?lxUW8kqAttxk2rffhJ4JU3AdMQcImZ+hkzvLwBOeihVfY/tvjIQbeljh0qAp?=
 =?us-ascii?Q?0OZNTHXfarm9j4jdKcpIJwkJKp7ti4SfoEJhSmYWjPkvcQ387eKRamZ407L3?=
 =?us-ascii?Q?TX2wbn85OGRYV62M2Ll62UOJ5MC780beYyYWTgbdd0IzBpAfDJrkMpJSQnrt?=
 =?us-ascii?Q?gK3jg0EC85moWfCtLeQjJOyTnh2JiX7P4cPOOqAQqaXA6qP5BFldnJKIeIBi?=
 =?us-ascii?Q?bR3qkjZFFskUVzm2h8DZakEb/66x90P35LAIE33tdAqFA7/hY1DoxxA43MPV?=
 =?us-ascii?Q?VG0/6MU8L7exHczROVH3wrcQyBJY+3LrxRj+LmYt7wyB8xIltP8+M0sxIuis?=
 =?us-ascii?Q?sq0YjKWtEf6FPZmSwzXg2xAbf4GMI3cdh6BUTcfZAKKOTdEvWDcFrITH8z21?=
 =?us-ascii?Q?YyYIMBEnAwjBxxhPoJjEUl5+RagGrnRdOTAU7jjv612U3SiqdgUogSxgK/gD?=
 =?us-ascii?Q?/5fvR2thIxckeGOTk3lLAoxSk4c2XD4oQWwEDMqa29q0sp0DFl0bvaroB0fE?=
 =?us-ascii?Q?tNSoBn/xg6NSPITIQliOHZm7081PjUP07V0vGoAI12A/5JKnJywwIvrSn+g8?=
 =?us-ascii?Q?SK/nk0/CjAWZGULyPfmAeKd/zqhQoZof4KqMdQhXsmqRG7g5LYrs63IShYSC?=
 =?us-ascii?Q?Npw6dn4ejj06JidtSlosj/PNx+WcHhcNMKlwZQzb7Oi09w14TfkeaSKGbbTF?=
 =?us-ascii?Q?2gWFBnGWIry01SKPoZHoqrlW+8feky3vCx+nrDrf/E9XMYU2OKNDFpOihuE5?=
 =?us-ascii?Q?ARxG4X5NLzVzosoR2y50ghK4Y+RltZo22wk6TDILrKCQ+vc5uSBL/ktBLWs9?=
 =?us-ascii?Q?zlcPBvH1MAFMDtvSFHd7RALnl4zY9G9+x6ISfUvW4AXlMkzycQu6IzDqKpav?=
 =?us-ascii?Q?VICEDj1/KLzcg7GJFupIV8jLF3R7w/9Cn8zs7J23oBEJTSWnwizI9dSKzucO?=
 =?us-ascii?Q?FeSPT+jcsHxIV1WfB+kH4zyZzCAmWvJns+6v6Ae91AbXaFPX47HEIJwG8stG?=
 =?us-ascii?Q?HW2kCaBAGEThpqH/bd32kD9AD/8FZMlxRWqIysX6f7tMhXu1gdtkQFuuBzdc?=
 =?us-ascii?Q?XrrzANgeGfQQB3dWRkJmIadcMpWvB0Q/AgKcF6jXh5sKvuLHIhYWRDOkXqx1?=
 =?us-ascii?Q?fSySxeuN/DNdiS6R3Jvsmjjhk0IiWvLSFPIon28Aa/SasYSFO76i+OQIuaZ8?=
 =?us-ascii?Q?EzMGarZEp//nGTT35mKoW/AeDoDoBtVoahvg3LOclCqEu0iaQQ12TyJWLGNq?=
 =?us-ascii?Q?PRx9Jo/eTvS2bs2NBj8H7D9HnvPqqeWQSEdohjoZYyq8FCOxZfP/N438ZMwf?=
 =?us-ascii?Q?Fq0OEgEFr0O4vEtNQmwkxMAQAq2wFGogZ/zHsM2tME9HpEUx8iTYDg41LdDv?=
 =?us-ascii?Q?yhnBT/0a5BuaTRvZWqmNrP8HueYUXqlgCKq9lBr9?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f3dc83b9-a9c5-4deb-c331-08dc9d9c5e12
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Jul 2024 09:16:50.0625 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2LFMH+LlWgoESV4HjamyR9Mkrc7m14gmpnNgJWRy1UU9H8rrNYnQwPwOkc0NOVPF4W0blPAyDhvjFqLW2MostA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR02MB5516
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: get_ckpt_valid_blocks() checks valid ckpt blocks in current
 section. It counts all vblocks from the first to the last segment in the
 large section. However, START_SEGNO() is used to get the first segn [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.63 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.63 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.63 listed in bl.score.senderscore.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.63 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sQ1XU-0002vT-Qh
Subject: [f2fs-dev] [PATCH] f2fs: fix start segno of large section
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

get_ckpt_valid_blocks() checks valid ckpt blocks in current section.
It counts all vblocks from the first to the last segment in the
large section. However, START_SEGNO() is used to get the first segno
in an SIT block. This patch fixes that to get the correct start segno.

Fixes: 61461fc921b7 ("f2fs: fix to avoid touching checkpointed data in get_victim()")
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fs/f2fs/segment.h | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index e1c0f418aa11..6ed5bc811d2c 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -347,7 +347,8 @@ static inline unsigned int get_ckpt_valid_blocks(struct f2fs_sb_info *sbi,
 				unsigned int segno, bool use_section)
 {
 	if (use_section && __is_large_section(sbi)) {
-		unsigned int start_segno = START_SEGNO(segno);
+		unsigned int start_segno = segno / SEGS_PER_SEC(sbi) *
+							SEGS_PER_SEC(sbi);
 		unsigned int blocks = 0;
 		int i;
 
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
