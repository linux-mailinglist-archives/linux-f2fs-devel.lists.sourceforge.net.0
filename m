Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B78467703B
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 22 Jan 2023 16:39:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pJcQt-0008LT-4r;
	Sun, 22 Jan 2023 15:38:57 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pJcQn-0008LF-Ck
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:38:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=; b=BM+FDXLCvdRvxaSrvepM66ByKc
 gnkJCqKEZJ/EySb3A40Cf2HEidVDUeAWKnlSyLkby50VoBFp9qL4i0CjjZoLra/i0PS9giHqz1MAD
 QIURQaK92fwPOdKYAVthvX/VzX5IZH+DSnQMexLX3o8sLDb9YTwWbtj6yji7fgFxMz9Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=; b=YAmeZoo0RKGp6NKyAXwMvK5B3a
 VuXSqlb8fKhrRWVmwWyPtcz4s1bfcSUrPpnftSuRYxJhEJufP3AvbWfcx2U5jLpiYazFG8LlAL+vO
 pGVWDTko4mCDm88R7ie+1uyNLyQzif0/rKZ11wBY1u9i30oKeq0wP4B293nEGsKi8Bgg=;
Received: from mail-psaapc01on2111.outbound.protection.outlook.com
 ([40.107.255.111] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pJcQf-00CZDu-08 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 22 Jan 2023 15:38:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=LeqB3jAldxj04N58MBZF2Kf9CqLUCBOykGrb+E+fVZ/+73DDFTMDPy9KbGlZz3Z8NdjrRNgU1CGUC1KBmstrxnCpxPWBkRJDqGE9wO75K0PxV/uMeYnkWj+0AAnDsXnS8R0OsVIETxBwX//NSxe8myqXEr3BPWeh5s3ejQ0Cdw3YuH8UA5VzCHVTBnrdiXC6saMpoAe3EnkDkZZzPbI4JdDtWrh/FCNikakBUjyhhAzdeOf/LGsRIHlFEMUjCxWqox+VX+J14im7myzFUBwtP40y5YTNgdd3l2yXD9HuECLePVuzlElTTeJPACsXDR6XbMVV4UqimO02CiJ49cLnZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=;
 b=OKQiWc0LQsiMXAj0SPgCfErghXY6WqX+mxa6fhOp+vy3NzBwYuANMnYC6SapQ+w5iIH3YFALYmX9fVjFyXeGORInB5VY+Fbvk2x+po0hlj8hgb7+8cqgGAvYgnsQc5DvyQNMbtyTZ1DytZoIzzxXWNT18txPUG2X4hlBJ48ie59c4XKsPKM+HjtDqSEGdH/UdRvTHORSAsP3cJZwCIm9raIcbrf/i29ed/hH4ZoFF1VTSJRble443DsPcAE2Z6twBcom2DoWbPoXKMk7MjxjNCeNuYxkJSYkUpRJkDz6xZL0f0InAV3/5ZUlK5FxFpGbk9Yewj0Duc40NQBqk0jFvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xU88Qgp8Gk9+VsEUbTvac4/6+o+e0MtIneaxHAfF3Zw=;
 b=VAzvjA5oPAKbiXYuDB0q5c7PrH5ieBp+cgmd/ImaXhjRChp5DoIPzXV+vDJZd38Zccelozl9C2qwswkU1mVehEphLkGCaVzMEDvYml8rA5FxsAfyjIu03qGGpUHJjSTomaxvOapODEg/DxaYJR5Sfxa708HLH5BoYPDGRAYcgkCbNsFW7uS9LTPGQif/ErGTUS9jsF9vrwsBzqjV6/GsWY8zEORgOLWHcNKjxz3mwp0fr6XVkKczYTG/Y921q1D7wRyuDWh0zRyqFpWmFdRNUn8jBq9sWtL6W2qA0k0Zs2owWtwFGVcAxoqb41HXB94eWgymN43mftj6YU4I6R73jg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by SI2PR06MB4297.apcprd06.prod.outlook.com (2603:1096:4:15c::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.9; Sun, 22 Jan
 2023 15:38:35 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::3e52:d08c:ecf4:d572%5]) with mapi id 15.20.6043.009; Sun, 22 Jan 2023
 15:38:35 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org,
	terrelln@fb.com
Date: Sun, 22 Jan 2023 23:38:26 +0800
Message-Id: <20230122153826.70865-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20230122150049.66607-1-frank.li@vivo.com>
References: <20230122150049.66607-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR04CA0004.apcprd04.prod.outlook.com
 (2603:1096:4:197::22) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|SI2PR06MB4297:EE_
X-MS-Office365-Filtering-Correlation-Id: cc620f0f-c944-492f-31a0-08dafc8eb997
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7X9apMKXbMUvNq1afAS8h0llHWfiVdYmY+xdpzaaZ1APazBgWoRY4BmAkCl7afGmQ6+KyvXzVUXh9A+4+/LaP3aM6POtthB5acYlUc2aKP5Tr6BUOssNcTBbDlmUNR12nopQtZy7ILvWfKofsbLq4uAJ0XPwOHb7/HuzzfBN1vN/qfUzXSq613cHoAfo/BEqOL3nx3fBoRc2wv4H7pVzcnzVPUAUzTJIuMShL9JNqryONimsn/IMIFUFfukr8K7fMNG8aL5AHmADWKiMgoQBjYJ7CY43PPRSwUfkLp/K3H2kvS+7Kv0Q4neI9bxiTpSdO/ifDjgIwr7DsUeZUb7PNjrJ5QKUvNwLDoIxiS6rrBbCxURO9zhzaXipo3B3kegQiYyCo7s0Jci41GWlHrW2EoIHqUVsUCgwJXM7gDiyyghMIMbw+/Alu8y0zizz1pYm
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(136003)(39850400004)(376002)(346002)(366004)(396003)(451199015)(38100700002)(38350700002)(558084003)(86362001)(8936002)(6486002)(66476007)(4326008)(66556008)(8676002)(2906002)(66946007)(6666004)(41300700001)(2616005)(1076003)(6506007)(186003)(26005)(6512007)(316002)(52116002)(478600001)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?j7b5wa7jt9lQroeEmE1d6QGAMb/7VzoQ7MwFQcesZFFTjdLetwKcZH3nCjXK?=
 =?us-ascii?Q?kvmSTmd47aQ+dOAauYHXDrOClbU7S0r4f++1dVSNofUgC4BkEPlj8aLR9DZb?=
 =?us-ascii?Q?bywFAuqBgj9BTw2EAotg1Sahk5QkUnvh01ZunNZg6wF4uJT0SivnFqMjUcjj?=
 =?us-ascii?Q?BJSrlPjoII3DeU8txyZFVlR8UiNzOlwJ3Pn3FECfGvpieIr8agXQlUEHllNv?=
 =?us-ascii?Q?HVKlvr7ofIkleSEM5E84HwlQs9AwSXQRIjf8uSZIEinsqqWM3FD5JP/FFujr?=
 =?us-ascii?Q?b4jarX2nQ6kPqB3o7qSiJQFWOS4KXItnqeY4uG66CPYAx83aBC/nyoH6ZXUu?=
 =?us-ascii?Q?01FO7HI8gygOpO89tE2vwZFH9ZTgs1o/nSKwmHAycKzneglKNn7i43Va26jK?=
 =?us-ascii?Q?sr7psOF8+UFVYtSwm32ZzHd6hk7/3I+taUUYyg8gukvhBaBE4PtVCI1kbHWv?=
 =?us-ascii?Q?Kuy8PvccrU1X33NZFinA+hSgkkR94jAk6xclFjxVCQApERTq9BOUtm0776FX?=
 =?us-ascii?Q?paj2zCrr+/w5VDck8QoeAqx/UsPqC5cnvORA9THM3zfLsYhDnGJRTH9ljMS1?=
 =?us-ascii?Q?SDFZGrODDuYytBgG2HO7OveIn7gbc+IvPhPe6/pj739p9ARd9faGUEXZBZf4?=
 =?us-ascii?Q?xJjT2dz5MWrkPIAIkg+03c9txkPHykz4Rp8YDUyP3Pfivo/DYliqfzRrZloK?=
 =?us-ascii?Q?JvAYYoJtOiFHs0NL9S2flSdPihEvTTwfnQKHQxW8b2VCARLeb16NROHmU/Uh?=
 =?us-ascii?Q?uFlni09jnA/sfqcQrRQqOCzxFZulvSLMFd+W/0XtA28StNpt4fzh8B9fkEJH?=
 =?us-ascii?Q?yfIE+cbphlZ1Qk0MHFvTt4ugIx/oI+WY1NGw8LrHbEQfmHfjqqRkwFGJ5TPJ?=
 =?us-ascii?Q?2cXVMOB11cdaRp7A9y/wRjkpJB7Ez11Wrnr4vHTOqygyA5MhCMvN0JmMMPkT?=
 =?us-ascii?Q?us0CwYYfjJSrkQP/AeI8ah1bTANrVapt5pxvvLA+1+YD0JXc3wtnSQExiesK?=
 =?us-ascii?Q?EHkBndiTTiCYnEZM4BMoU50J9rNaNxS9DVceLto1TzbNi03UXE9Ij0QcA4LC?=
 =?us-ascii?Q?lFYLOBLpjqQPSJmYtz47RXe+I+iOWBoiuJHlt+Ljuzw+xC3zT+GsRZAoDBep?=
 =?us-ascii?Q?tGtOnT5TmkfOTe7UoOQIRMJKOyFIK7eHO+mqoPVTvfIwE2bZMjNuRlVl8A6e?=
 =?us-ascii?Q?LWviUHrMnqkxXVZMGx1Fm2qMEzVOFDyKVBDfPFydwmmCiJ4fdIt8NyUb2/JF?=
 =?us-ascii?Q?jJzFdRGDMOP7x4NPlisIdb3L6zYQX5/SMsSpzkvYIvIuP2wUH/3oOlBqSBTD?=
 =?us-ascii?Q?otIecaEyctAaf9UqgMBshHufZyBP6W6YqsoSwzlezQFWkouwn9aQU2v7RHa7?=
 =?us-ascii?Q?yyRh035/9IB4aznLtUyF32I2xI5Vj0dRBVKkzj6zjQyWx5myc7MtCkCEKgN0?=
 =?us-ascii?Q?5UXHjDqqjgX1Nd5NsSDRiN2CDoup2vkkkLisa79bhl8Ed2Tojr048OAwiwxT?=
 =?us-ascii?Q?OUpBy7tarkqhQHNcNbRz+JCCcnItQnnCyoqOQZcwoIaCyN1fxwVLPUE+yjlJ?=
 =?us-ascii?Q?QUzF6IeG/FSLiFqfBBzi838xdlRjqdOgoRLozOAZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cc620f0f-c944-492f-31a0-08dafc8eb997
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Jan 2023 15:38:35.7626 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: FTeY29N4U6R47g0bXDubUQ8u4iO7FDxU+vkMH7Pta8nyd6BurZDbTTXgJyLWXfLt711PhyGEciWnmfDQyVtBQA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SI2PR06MB4297
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  +CC Nick Terrell 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.111 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.111 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pJcQf-00CZDu-08
Subject: Re: [f2fs-dev] f2fs: add F2FS_IOC_SET_COMPRESS_OPTION_V2 ioctl
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

+CC Nick Terrell


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
