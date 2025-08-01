Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ACC16B17B47
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Aug 2025 04:46:19 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uoLxF3hZyRD6rduEO65KL9zNq3i2Q77casfOlntnCRk=; b=VRFSM8yE3s5gefXQPepXHXFOSS
	FnXxH6qJ5U+d8wnh1TRRwg3nqcpk55QKA3eTF9W5f7t5N03iDIKUfj4iXHO1CpqPLJNLsnklPELCD
	HI/uSYPojLLS3CBTSdY14NCJiwOOYS1pyCBNOpI9kSWGxW8ceMpRIDSrz8CSOYAgqjo8=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhfma-0006GO-Bb;
	Fri, 01 Aug 2025 02:46:09 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <wangxiaojun@vivo.com>) id 1uhfmZ-0006G7-1s
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 02:46:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=kQ3XnKGKMI044CNok3CWireoBg9Ccj/m7G6T0nPunVs=; b=CmCRF6v43Q8R+J7e6eCuWTaj+b
 nUg21ncytWxuH3Vsw1ZPSTQpp7peb1uJGKQ30Sh6sQumr9AiZwQr2wdEFXLtX9E/koDEg5RHjM++p
 f4KcfNOoojfIDe7wLvRQPpf9aecKAxSc4ncRwT/XqXqfng4xjEvexX0JASuFfjnDDgrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=kQ3XnKGKMI044CNok3CWireoBg9Ccj/m7G6T0nPunVs=; b=d
 u5DxbeemVRYpUpkfRbLnEs3/wysfm2imKSyiiAunOhekzKKV4At7v3JgmO2HA9X0MLLj2wlYDi77C
 +X5Rwx54LxQ54nDUvtxVuyGfvUWpP0+ZqcIpOd6gjlpiFtKEo5a+mV0/ajl5Wtay6GscRxCh5UfbX
 SC9i1/7gS7QATwqs=;
Received: from mail-koreacentralazon11013018.outbound.protection.outlook.com
 ([40.107.44.18] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhfmY-0008LF-FO for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 02:46:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=CGpSTLlYMPj+nxJVEhJ712L/OTluAx7UK8SgfMPnxFj3+mnoT3FVtkXM7l8VgQxVJV5wM2edsB8vMkZnE3IOqACXmMg4q8/Y1fUtOORe/f28kPT5ETo6Q42+J5j5S0EqJ0VB+lYMt3AELJhDSwyPe2/lyZyVvLeURhb0rrJhti7x7wuXvLOPU+BUFEJMfRb2qk9I5HgLl0en+OMHlfp/AHXQuncv9GEzvtnwpEVFNT+ppDFeM3wya15iShLnElygyH7HwVfrEcBRakKWr5ARR1vefM6BPS0s/2+WWC2B7XlI5KFyctIfcFrG+7IWiEG4Dp88CPrLR6b4tZJx2Y/ATA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kQ3XnKGKMI044CNok3CWireoBg9Ccj/m7G6T0nPunVs=;
 b=k9KsjU2zHCDuxFSd6gUuX9b8XR52tLp+YTRWXSxgNGEkEi86+Og/p1lbavkB9KKeXbgKo7HFXDVfrSskcT0odo/WcmSz9MPqMEghXu/E1cJugObcHlxmqV270YuT9KJ9VuaBEun1nKPmElJaPi7ZfOOp+mux3GcBe/yvWOKQPcb8VTdQmCp5eRjr9mK3JHSKjrI3rQLU56UF8Ezqrx6yIcu9SryS1hHyH14im+hzH8mg2WInTzpthIe2XxuUlSUXZbdhRkPz1q7k6D54+7oTc/iP7m6yNYPCRwt1CUSj7mcKNXPYOvKzsuxzPIIEu3ZCW86QcR11JNzgHv+o69Yj8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kQ3XnKGKMI044CNok3CWireoBg9Ccj/m7G6T0nPunVs=;
 b=D4ewUGQDBypjvR2xPVst9o5jIz+MjolrsLvuMZO1DeL37aqDeJ4DuyUYyViW4nZXYZrUP8Bz9eKWqK1VTAUZF0ueYMx3vYGUPxSSwrGln6OvQUKjBDqMt/JuCHJCPp1wZLwmPStQKrhuEZgkS6uhDTJQvasUIDNUC6S3+D1e19MSHG51ZSgYF2EKo3wrH4IeujyJ37Mu5ftcdnq6AN1lR55upikd0l50D9ukMxf0AY17CnxDUSDxHwxyVifkSyiTBEcVoS1BZ5VvylI4QhVmmiMuvS1QbiTiojAWjqVdCMctUD7r8bc2XW1eF3xfloiD34uEJ3XA1hyp1YP9DoEhAg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
 by SEYPR06MB5159.apcprd06.prod.outlook.com (2603:1096:101:5b::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.16; Fri, 1 Aug
 2025 02:45:55 +0000
Received: from KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054]) by KL1PR06MB6845.apcprd06.prod.outlook.com
 ([fe80::a919:58bb:f4e3:b054%4]) with mapi id 15.20.8989.013; Fri, 1 Aug 2025
 02:45:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  1 Aug 2025 10:45:39 +0800
Message-Id: <20250801024539.317438-1-wangxiaojun@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SG2PR04CA0164.apcprd04.prod.outlook.com (2603:1096:4::26)
 To KL1PR06MB6845.apcprd06.prod.outlook.com (2603:1096:820:10d::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: KL1PR06MB6845:EE_|SEYPR06MB5159:EE_
X-MS-Office365-Filtering-Correlation-Id: 0d5dd355-e7d0-4a8c-4586-08ddd0a589a9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MmAssziQTRNKfzi38sMIfyEiXMYGI5wZgrjj993/iQVvjNVe5cLJoHG9jkjC?=
 =?us-ascii?Q?OrlwEX/m1jqoyKqgiy3ZNDBDoYYm8vzn9SkLoRqn3VGmafXwzq74SPxtYNQT?=
 =?us-ascii?Q?1KMhSuERpeHVr5fmY/FVsoNSiYA1pO3m9wFD0ucIPrW2v154GedLzRHk1/7D?=
 =?us-ascii?Q?0J/s7c4ajSziSAd9SqgMOxd0pgo9iJkpsREAA/yd8TSC4GqM7ffRkK/uxU8w?=
 =?us-ascii?Q?aSn0Xt/5YvnsmBIPQ/YCb2nFow4SHYop+/E5cEDaRhMeT1EGDtRg/vZ1FPEB?=
 =?us-ascii?Q?FGgpwsDJdYpNGhFlN4OQdS5IKkNEXn5qL/aPjk3Z/eP1WfqE8Xgei7kdN5uA?=
 =?us-ascii?Q?n89vuj2HjDb+qd4L3XbFJZDlK7dpu6bIlO+KrqOMggmGjeE4UVwy5Vcs3mOm?=
 =?us-ascii?Q?ZhlOlv7MY631qZF+tnBoiZgLm/QgRZK2z58SEbbT7AV3niUZLIVFpaYsp18F?=
 =?us-ascii?Q?lI9VXi/Nwm/pQoBRGWtEm/07zA8ggVaAgYpZnt6Jr4xX952jZ+sctGWiuYeW?=
 =?us-ascii?Q?9/+wAwC+SC328GzgqJlMEOPBMcC9lLpTWiATDvlGGZneHhZcNUCvU/SgrfEY?=
 =?us-ascii?Q?760zOUS8WLGGoHLZc3oy79O7zGsiWXQjLGZx0/kwjL299nDhaezfWkf8hkjY?=
 =?us-ascii?Q?qK5gnCDmvFSfc+a2ZShGQ2oup0l4+9AzEcnCIg29MbbkiCLuyGSacNvFanqI?=
 =?us-ascii?Q?bYjzOtqFFyKGWKTI5pQkuiMW9rNMQflE4tucBKBk7kqkeg5Ufo9uQKrFoEZC?=
 =?us-ascii?Q?4Yhwzcil6yqBbo8sVeJmNAyVvWtod4N1wLv0sFPKX3J+gD8y/WhyRhJRGUru?=
 =?us-ascii?Q?nGw5euPl3HKl7hWdIXtPOsYTjoduapb11abY25sYZtINu1vZE3qUJWHtHm9g?=
 =?us-ascii?Q?A2HxbrCzpCqMd78RxEDGcyBXPF58g/Pa97jYb7lxRgFzewefede/eLk1mTHD?=
 =?us-ascii?Q?FcSRLMfv4+/RpbF0WPBsq64OJvFPw8llcj4osgEELz5aIILAw90U7laa1p2M?=
 =?us-ascii?Q?fANdrIDvqLNO0j0EMv+n+UGeX+8BI2Xp5ZHk+qi+CnmE551Oc0d25gWGDB0W?=
 =?us-ascii?Q?jEHHq5N7dVzvTGp9CDp26lt2gzLhWwVwvV0lRDVamWd6b7oulDtFVKk2j/pq?=
 =?us-ascii?Q?elgNHiCK2gJxk49GtTDnSbQE1EMrsRzLkOO7WTDFIV/hc6bcD+dAaxRLAw2o?=
 =?us-ascii?Q?pMRAzo0MnmwOoDxnu913yDUs16a8X56rrTMRwkUwMl0ADTnFefaPF5/rHdpk?=
 =?us-ascii?Q?IGNU309W9wF6W7DHCo8EvPDq2u6j8UZzr63MONe3BUW2m/ll5dgDAhgL2qdv?=
 =?us-ascii?Q?FTkhNVLpelZqMBPyhbWSX4sem44lvvxiL2IQSN1q08dczHnKkll8roSuh+28?=
 =?us-ascii?Q?3EFE4KztO1cG1vQKi2WEiPb1SNDpTL1HqK+US06J7vWjG4Axs8MqqRnQsxYX?=
 =?us-ascii?Q?Mtf0UQueaJTK0BaNlR0CWPkMetwvY2cmBpQ7f2nXc2wiNjBk/oarrw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR06MB6845.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?IDv+LMO8OxMu/t8jHWvqb7/0N5pnpRVo7O/r+snssveML/VbMKPEr0Nm7UzP?=
 =?us-ascii?Q?hCYAh+nVpLR9gvceO5ObdIUFk+dHiOoNN5W2BnZLND/WP7tmmwtCMasvIt7t?=
 =?us-ascii?Q?o+CMZTvuE5ofdAtS7PcXOOdSnXPvDbSv8mdoQNt6Q0pGkBoqeMd6dRiMQpOQ?=
 =?us-ascii?Q?q/ZGAHSeRP+l7U6Biy4ACKPekjVnvoRPW1iMk1vM4wvswmt+hUP1weef8VbK?=
 =?us-ascii?Q?ntYPmLQw8fJeRQZ2qf/IGBRg8LZeQqcq9wlvO1ZDgFhWo7nztETIPqNx6Rv9?=
 =?us-ascii?Q?BVl4qiqPt7JDHEvymMA4McGJUSIfWturtMvoQ+qZ3CbxZ6kG0ZvP+gEuHkWr?=
 =?us-ascii?Q?741xdzdbWrVq2IaLJMU6ybfnh54cytZwprVb+pIPBTs14U1MXVLpjzybgXYj?=
 =?us-ascii?Q?Q0wEoR+Ju/6oKqQeuerfw6gZ/EtBj1DucAIkRm8saX0UZ/XG9s7GkaP9IsqK?=
 =?us-ascii?Q?lZw7LOebQxcGXeFrtj2JHPLgO10y7wcaWCEQjfer1OOmxjgAZFLfHZE8nXKT?=
 =?us-ascii?Q?1/LB0/SJo26Yr8u0tYivh8XU9GFiNLli0UmVzzQnmQZEXMMFaqAjsDegMFqo?=
 =?us-ascii?Q?aHS4qT8akSlqiv36XnbEygiOY8aRxdM9X0EF+BN0T+01M2GeEqekTYQssovf?=
 =?us-ascii?Q?SCVflWv09lSnVvcuOA3xfUGOaOI/i560gbc0VSuoIIuvZ+OTwckWtosfoS6s?=
 =?us-ascii?Q?LGPGM2rW1GHFL5f+4VD9iUqXlObMyN9sLBPLXRHMxm8uUqq8y+qCDJ/MXRcO?=
 =?us-ascii?Q?vw1+uQae05Uzei/4b1AZ4SalwBoSU4DQH9YwWDxw5U1R1J55NvAJIIAvJZSz?=
 =?us-ascii?Q?X3cXQm5r1hbTH+XZ3FSWndr4Mlj3lLOCNxwy3bd4wDJxObQgrd3XgAy9yMhB?=
 =?us-ascii?Q?9sM5YUwyTJC7j2HkdwouKWzzhylhW4pquIWhv/bcofod1axuBcSnKKjvr2xx?=
 =?us-ascii?Q?PWqRwDp/na00HetJibIvEJXx74+qhJ9Q6V4rFUXDYSP9IuQdsKCMyd/+2xDB?=
 =?us-ascii?Q?JyIRaovKFuRmSXt84b7ZS2WFifjw95eRPUQ3XHpxHcD+fiawo//Figuo5p0D?=
 =?us-ascii?Q?lDl+vIjhkQ4R+t+to0xW5ROEFh3aVI/2JxG2BKgG8j+8EingMn7oNSGAumpB?=
 =?us-ascii?Q?8WT8KCvrtA4fDD/LGIreg0RPvmgbEYaCCzpCJsvoKhi1Cr03H3hYIzvdws89?=
 =?us-ascii?Q?oeBAynp0BuacdJDevphs/TLl0U3Rz6wp+pGZ5yIYEiTWdqaYrcTQFpQ1LsFU?=
 =?us-ascii?Q?AAF6Mm+5fkjgl7J/QDt+RNU1dcxOUJpIA92FkotPYNf/cvHUPDoWZqvlUxi9?=
 =?us-ascii?Q?gvQWemkLKVxI4ocgHVgHypWAZJMvkFc8xVmBJaLb2B+9MDmbHmjQ1QRvTNkL?=
 =?us-ascii?Q?d9u+MEIR8WqnTr3pGnxuKN7HXO1SdCpBVe3Fl2qgmVX7leqFHK2anJd1GjLC?=
 =?us-ascii?Q?TUJwOXX6gzP0Mc5ryIcGDRWaPxz6hy3erfcW+UFrkpP1bVuk2f7tfHmYu8yy?=
 =?us-ascii?Q?cFvlptXBFr7SwhmnELMlKVdoS9R4GSXLeDpL0AQjnqwHymK3XoBdo/vYCbXR?=
 =?us-ascii?Q?6V7mwM77tVkJ6vnDhAjXgIgrEcdaImWY2PRcZtO3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0d5dd355-e7d0-4a8c-4586-08ddd0a589a9
X-MS-Exchange-CrossTenant-AuthSource: KL1PR06MB6845.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 02:45:55.6053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3Gdl0Yw5zCE5/dDTeX6qCep4D0C+PA+5LYSjmL+jxjQCR8GVviXq8BDO5wqCJsgeBmXoFk2Di+O+KelHOV/tag==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5159
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  In the following scenarios, F2FS cannot reclaim truncated
 space. case 1: write file A, size is 1G | CP | truncate A to 1M | fsync A
 | SPO case 2: CP | write file A, size is 1G | fsync A | truncate A to 1M |
 fsync A |SPO 
 Content analysis details:   (-0.2 points, 5.0 required)
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
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.18 listed in wl.mailspike.net]
X-Headers-End: 1uhfmY-0008LF-FO
Subject: [f2fs-dev] [PATCH] f2fs:reclaim truncated space during the recovery
 process
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
From: Wang Xiaojun via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wang Xiaojun <wangxiaojun@vivo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

In the following scenarios, F2FS cannot reclaim truncated space.

case 1: 
write file A, size is 1G | CP | truncate A to 1M | fsync A | SPO

case 2: 
CP | write file A, size is 1G | fsync A | truncate A to 1M | fsync A |SPO

During the recovery process, F2FS will recover file A,
but the 1-1G space cannot be reclaimed.

Signed-off-by: Wang Xiaojun <wangxiaojun@vivo.com>
---
 fs/f2fs/f2fs.h     |  1 +
 fs/f2fs/recovery.c | 15 ++++++++++++++-
 2 files changed, 15 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..d37204567b66 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -459,6 +459,7 @@ struct fsync_inode_entry {
 	struct inode *inode;	/* vfs inode pointer */
 	block_t blkaddr;	/* block address locating the last fsync */
 	block_t last_dentry;	/* block address locating the last dentry */
+	loff_t old_max_size;	/* old max file size for truncate */
 };
 
 #define nats_in_cursum(jnl)		(le16_to_cpu((jnl)->n_nats))
diff --git a/fs/f2fs/recovery.c b/fs/f2fs/recovery.c
index 4cb3a91801b4..2f482742857c 100644
--- a/fs/f2fs/recovery.c
+++ b/fs/f2fs/recovery.c
@@ -95,6 +95,7 @@ static struct fsync_inode_entry *add_fsync_inode(struct f2fs_sb_info *sbi,
 	entry = f2fs_kmem_cache_alloc(fsync_entry_slab,
 					GFP_F2FS_ZERO, true, NULL);
 	entry->inode = inode;
+	entry->old_max_size = i_size_read(inode);
 	list_add_tail(&entry->list, head);
 
 	return entry;
@@ -828,6 +829,8 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 				break;
 			}
 			recovered_inode++;
+			if (entry->old_max_size < i_size_read(entry->inode))
+				entry->old_max_size = i_size_read(entry->inode);
 		}
 		if (entry->last_dentry == blkaddr) {
 			err = recover_dentry(entry->inode, folio, dir_list);
@@ -844,8 +847,18 @@ static int recover_data(struct f2fs_sb_info *sbi, struct list_head *inode_list,
 		}
 		recovered_dnode++;
 
-		if (entry->blkaddr == blkaddr)
+		if (entry->blkaddr == blkaddr) {
+			if (entry->old_max_size > i_size_read(entry->inode)) {
+				err = f2fs_truncate_blocks(entry->inode,
+					i_size_read(entry->inode), false);
+				if (err) {
+					f2fs_folio_put(folio, true);
+					break;
+				}
+				f2fs_mark_inode_dirty_sync(entry->inode, true);
+			}
 			list_move_tail(&entry->list, tmp_inode_list);
+		}
 next:
 		ra_blocks = adjust_por_ra_blocks(sbi, ra_blocks, blkaddr,
 					next_blkaddr_of_node(folio));
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
