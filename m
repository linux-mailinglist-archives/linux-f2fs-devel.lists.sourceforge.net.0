Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C8C8692C7F0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 10 Jul 2024 03:27:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sRM7A-00010o-2k;
	Wed, 10 Jul 2024 01:27:25 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sRM78-00010i-PJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:27:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=vVgDdArwbVUFcFsjOALigj3LaEaA1Y7fsy+KB2si5r8=; b=bqBXKOSic1XKsotGSYz2HBuP3u
 vZfNahujR0E440ApA0ycYrIz9SlmJz4HzO09v/AXBDJ1PFY255pzullAY7K3MqhQHdVKgar6j5zAn
 rkBPl1twX6kJD6VdJqxoi4xdEASkqgxtJo+2rtws7yWaVFIoNFi++VBYadrm08rFJMKQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=vVgDdArwbVUFcFsjOALigj3LaEaA1Y7fsy+KB2si5r8=; b=i
 AlqHD4D36fIc6jPOCbHTIJ+KmUZgNsevGl0LbErUo6GzOgzIF6jBAcx14ToTjXl1DZfCQh6XzdHMA
 TXVK+mklKcYhMDyYvfC4K0FTwW7dKeyYl2zFThJN5tZM2CG09FWLCy/1oYwaLPFIv9Ua9aXEeb+LA
 vIclUGMJVPbz3X1Y=;
Received: from mail-tyzapc01on2077.outbound.protection.outlook.com
 ([40.107.117.77] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sRM79-0005C1-DX for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 10 Jul 2024 01:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=K5q2IQ1Na49gbLxBiINMnfdyBWHLAILnSmyMlOV0AEuM74bZvbRhJMKyevVQfNizexp18rxeJ5WYppRAwDRIeVTD05k6IRrEU2zNttwUJRE+QbIEap0wUssdarg5K5AorY3eEcisr/nC4p8MiEblvY9MXSEipuBnDJjQyVuCSipgc6r3XgX0uBR/44t5tMepUkrmnaiYwsvI9FYWkDVh/oSBOAsUKncb+1EpOpnsQxfk3qCMVU26vIX1UMQSG36CG6TghYZxIiZXdLXR4ryVYILpa5fwxggApT9EfV9YlrnovVOj4OVYdNzeALHdMgKffhSuxaHmipxeH/lR8ox+Ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vVgDdArwbVUFcFsjOALigj3LaEaA1Y7fsy+KB2si5r8=;
 b=YTE4QFmChh6KApphKkztwROIBurlK/V99vI/3TWZEOJqHfoiKr7/bbuNKkitBSM2vur/JPYh3rABnzTat4hv639Ohs3EJ/UCJsYMi5VCIY9JsxAqYuNUhA+AkDRp9XbrNrCckfPtuaT47is/Aw3JzqkgdtxWBo/HEsdFMcURg/dsne+x4X0d/nmQLzP60Ec0cdBFG1MSo4gjyajxixInH0U9o8UhB+HDyReTqvqbVBiHc+sm7tzhjvXBkPJeXRNqNj7oLRjQMgM1evQwYucBxHBi8LsnsVfBfeOFlr1K+7lQIkm6NxzEq1nvqtHJLkadOK2Jb3/hXAqfN4aYHFQzjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vVgDdArwbVUFcFsjOALigj3LaEaA1Y7fsy+KB2si5r8=;
 b=sv/aR4L0VoSclnJbpreNVe7kvvAauntGqiRd7897RbhoAHJEYOF+Dq0vcDHZOakPas5aMB1N5bx0eCJSn4cBw+AdXFvvbitfHF7IYKc1ooR1Wn8MmmA4WNcGvu1nvlXpDHKf97/6B2+gQ/qMrxF2UXG4SdmXcp30uJmWXXajVzI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB5653.apcprd02.prod.outlook.com (2603:1096:101:56::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.36; Wed, 10 Jul
 2024 01:27:14 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7741.033; Wed, 10 Jul 2024
 01:27:13 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Wed, 10 Jul 2024 09:26:59 +0800
Message-Id: <20240710012659.3415856-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:1f5::18) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB5653:EE_
X-MS-Office365-Filtering-Correlation-Id: 420ccdec-5c80-4923-1cf4-08dca07f6d3f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|376014|52116014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?+UnWnrcHJSMnt907SGIdUpILAzx0k7+9g7Doa1ZkF6MO0Us3RnUdL6UTfido?=
 =?us-ascii?Q?LNuRxozOk/tWsF2EpM9FR8gImyTT7fZViNhORkLN0nsEvYuyTcvriRpQ5ye1?=
 =?us-ascii?Q?y6NO0Pq93WuWFL2rGeN1+pFYjFZLqK1Ogcy5ABoSVvyrras4lY9IUgNsVQCY?=
 =?us-ascii?Q?/CLvWAQDrsDMEnhdkO9tlNn002GKQfWNLM+FuKd/7p6qeWnt/FFUVP6XbHAB?=
 =?us-ascii?Q?sJAvaxcAtPVoMQ37cP92+fv9gZUdNMHoisfYNY7efrLXD6ug74cIAqyYnFMO?=
 =?us-ascii?Q?ACLokZlSJ6WDv+p6YVRsLO6fxnKg1HhpzR2WadVx5i9L18wBSCtuuVvrfvSB?=
 =?us-ascii?Q?ooAhBwcBuFNQLWD8PBU3nXzxHlEA/HdfdR1RGQKJSDqJPjW228jouC8FNHB6?=
 =?us-ascii?Q?3xPD5tVLiFgvjn4gNiGjMMIbJkT8uLvP6S1eHl6d0P1RSRD4zLM4dpxPkafj?=
 =?us-ascii?Q?DczL6DgN7AOHZEoaLdkFy0j4QZraYWmjsCM0UMLX3ntC+2BllYizUNqnRQRO?=
 =?us-ascii?Q?aoVYjv8SLFAlCKyEM6io5NC1aHNtg0+obi8ctK/YvLU+lpLbAcm/0FH+Qlky?=
 =?us-ascii?Q?UJ45dBgriqeNkssF/I1JqYiCuDNYEGz6bfIFXWT0rGiCjt/RssnVFjKrZJ3e?=
 =?us-ascii?Q?MjoMc0lx8nesyPKBpNlTMQRAbo/M+l95Ei21Fna7yDgTCsJ8zyiIy5+J6P0V?=
 =?us-ascii?Q?CJEA0sVESSBKz1UcE4tpzMfdyJ/qqta1bK0Bs6KeuBDaL6S41/u7QoF60j00?=
 =?us-ascii?Q?Oud8umpTMnVDGdeB3Rnq2boq7rg1p/6a26JAGJANAhMsGBjjNzNL4/HUjBjR?=
 =?us-ascii?Q?99paP++GF/AnnItZfMvMHsGkn/V3iJiASadohtBPnfN+xI557Apb7Vc+Lq4s?=
 =?us-ascii?Q?AO6TicoyKGy62jGygWeNynboZQEluJEoK646D+oAUMZAZB+4vsZgVSrxi8r9?=
 =?us-ascii?Q?9TxSUOHiP4P8ApEY+Rb6WvT6rlas7Rkn5f4tC6ar+yYABEAEO1gvMvytCcEp?=
 =?us-ascii?Q?SKZs+mfrE4el1+Jt4o7NMhFnGTnq9rGt5apa/OXQnAQe5jxc+yTuZBHaHp5n?=
 =?us-ascii?Q?8/q5/R/RgmQWzh7wCMd+TWxcM3HaOkblB/+zt9uL454mtzzcPFsVsMQ+svY1?=
 =?us-ascii?Q?FZcdUqkbKZ/2QHsbMxnHLA0XTcqkHk0p3XOmbwyvFB9yFCJn5AZ7S+1Ezyaw?=
 =?us-ascii?Q?q4cikR8VQronwt05QEhFzmoZQfW4i29laMWyZLKugiOdfNw4C6XZvaveSCxt?=
 =?us-ascii?Q?HVuK9jYneuVzY+WwzofngN8sxNzCOIMl0pKk6SlmBsdqiXKw9h6wd134ekJi?=
 =?us-ascii?Q?NhAJdkCJAOv7+QSnY5519iE3ins8RYSSrFXHOARo0s8tEdIgZJnAEEmLdZZe?=
 =?us-ascii?Q?Dhy2ZOHSTcejkexvs/2y8HbUtq8V+K5KI2NVDkoiixGcJVEzAw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(52116014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/wtIex694UGgHwOEv4Cj63CTEhf0wuP9Tg5rpe+5tF/UBuSfedg7iamY9rg3?=
 =?us-ascii?Q?QgPvER/Vgz65B4sH5XSHX1h2iiCcK7kxC1cBOHF3Sghl4RXR5hOtDaXN6Pmf?=
 =?us-ascii?Q?Vn8YLjeOxztkTfIzyF4v2kpLrH2YV1Vwrutr4MSMca/8K91m98P1ErqIEMfS?=
 =?us-ascii?Q?n644oJw8fjQ0osVJkWgVBmJn7kfA+0MDktqDDYFYF3m6EEknaY9h8eg+Bkio?=
 =?us-ascii?Q?jq8ouBDpSXE+Lh+0s8btNj+nIynitda5yFdbvSNzIrEJenAkiaYY1HTjwAEA?=
 =?us-ascii?Q?jm//NURf6VS3t9s9feG8twCnAUP8ABrOP/XvNBkx8BlQSdLo7OGLCXIYOGj7?=
 =?us-ascii?Q?tlJn2uRSaUXsl1j8dUAQLx0nWWD7CgZVMaTESu5PaLBJmlSCy6iQR+2fD8jd?=
 =?us-ascii?Q?FRvo6QGIa/RrgVLbYtpGF4Jv52JKoaTwcosb8wZpEObKEQHIiLTm0TfDcWtS?=
 =?us-ascii?Q?6udIsPhSnkSx/zoHhwjbzjFrrCJYvfBxSx+CL+eKMYvEDCRn3/Kx+h6IYcu1?=
 =?us-ascii?Q?Wa1fxJcKgr6rj/r2d+yfn7E/UrCVMKZ6oGBgYLBq7+bVvZIzl7+qhRHLTMP1?=
 =?us-ascii?Q?qrsCuRh0wK9ssvzlv6jPbVwNkLtptUnQahliIatuKUHoy54hHoqh0L71Ry3l?=
 =?us-ascii?Q?l1KblGtLKFViUyxvwuXdKiDtym8snQ0rml86FlCzDx8kxNtVLxuLXVT+SH4U?=
 =?us-ascii?Q?0R7/uPtnnCOzRJt8Q9+ceecMfjSfZxILhzBS4t0umE8Pssnail6DqBZzuS6c?=
 =?us-ascii?Q?rvTPAutARPtumOCTuBYf1ZDwd8TcFhKC9QB3cEVJpi7YX67vdCqrIekkyx61?=
 =?us-ascii?Q?JbUcjhCXS/TbwG0kk+HZno1EQXu2Vva2j+MQIz+622CmclVvmgggpSnzTGQg?=
 =?us-ascii?Q?OvmEB77fj14oAEwBxM90HckOXts5bXKtTJhcCRaMSiM8/1P7yXx5J0pEPPCM?=
 =?us-ascii?Q?Nwb/GpvFdSc3ccR/ai57S+/bixMf2mZWFoZrNwpmzxABZZ4ZSXjLZCNwhk8R?=
 =?us-ascii?Q?NhKIhrkdsSnifi2sAYC7olqkkgXg8ezBSYIhhfZtrhK8cl2P/zkORq5MLa48?=
 =?us-ascii?Q?TBGOTJbzFCZLcUHFBoZ6t0zzyE6p4LfdEICW/Ry7MElSKtG2bXwh9PE5YTJ6?=
 =?us-ascii?Q?ApTg1NsCqk4yjIkTvliaTHRl9SCltLubTOYN3TBEhOAc95aZxl5x9RAdbrqp?=
 =?us-ascii?Q?FpXqugnredbvwv9HxBe4vluAQU3/U0fUftztphHqlthJqDpyqorOvWMQhJsi?=
 =?us-ascii?Q?5WUJSk25Wm1alLRJyVBwsQ7/gEK1bttav2C45fUqbujDtk0fPSlyfSg6PdzO?=
 =?us-ascii?Q?wvW5Gec1SFi905DsN3ElXXP90jkNVDspIJS76OeLPu3HuuMkLeUYhRrappak?=
 =?us-ascii?Q?0D6H1urMfJX14PTZzO42So2MFJ86EUGMgkCdQeQggWppM8TlDS7J/N9a5+03?=
 =?us-ascii?Q?Ph0+P74fMf3BCNSOLG4CYz0Kdsx+xA3KbRgSZ94IWm7Sx8EGLVRgJOIDoZ7v?=
 =?us-ascii?Q?TCgonN4b9OQtUJ+IOVrzT6+7T9nGRJ13YbB+zZJrE/nLND9qfyCmb7LU26tl?=
 =?us-ascii?Q?xHPb294xARgwflGMR5WqWv3efK67qVNCpFUPCt89?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 420ccdec-5c80-4923-1cf4-08dca07f6d3f
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jul 2024 01:27:13.6392 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UxWCqdVkgJ8NhrNSD/Ofs2yEzeL9VxveQtEoPrKW7EEn9cD+TAmJX5tLZGqN4f5I3jJ42bys5WWgSwODY4/yAg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB5653
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When new_curseg() is allocating a new segment,
 if mode=fragment:xxx
 is switched on in large section scenario, __get_next_segno() will select
 the next segno randomly in the range of [0, maxsegno] in or [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.77 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.77 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.77 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1sRM79-0005C1-DX
Subject: [f2fs-dev] [PATCH v3] f2fs: only fragment segment in the same
 section
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
Cc: daehojeong@google.com, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When new_curseg() is allocating a new segment, if mode=fragment:xxx is
switched on in large section scenario, __get_next_segno() will select
the next segno randomly in the range of [0, maxsegno] in order to
fragment segments.

If the candidate segno is free, get_new_segment() will use it directly
as the new segment.

However, if the section of the candidate is not empty, and some other
segments have already been used, and have a different type (e.g NODE)
with the candidate (e.g DATA), GC will complain inconsistent segment
type later.

This could be reproduced by the following steps:

  dd if=/dev/zero of=test.img bs=1M count=10240
  mkfs.f2fs -s 128 test.img
  mount -t f2fs test.img /mnt -o mode=fragment:block
  echo 1 > /sys/fs/f2fs/loop0/max_fragment_chunk
  echo 512 > /sys/fs/f2fs/loop0/max_fragment_hole
  dd if=/dev/zero of=/mnt/testfile bs=4K count=100
  umount /mnt

  F2FS-fs (loop0): Inconsistent segment (4377) type [0, 1] in SSA and SIT

In order to allow simulating segment fragmentation in large section
scenario, this patch reduces the candidate range:
 * if curseg is the last segment in the section, return curseg->segno
   to make get_new_segment() itself find the next free segment.
 * if curseg is in the middle of the section, select candicate randomly
   in the range of [curseg + 1, last_seg_in_the_same_section] to keep
   type consistent.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
v3: adjust `if (__is_large_section)' check
v2: update commit msg
---
 fs/f2fs/segment.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index a0ce3d080f80..161aed632278 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2784,11 +2784,19 @@ static unsigned int __get_next_segno(struct f2fs_sb_info *sbi, int type)
 	unsigned short seg_type = curseg->seg_type;
 
 	sanity_check_seg_type(sbi, seg_type);
-	if (f2fs_need_rand_seg(sbi))
-		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
+	if (__is_large_section(sbi)) {
+		if (f2fs_need_rand_seg(sbi)) {
+			unsigned int hint = GET_SEC_FROM_SEG(sbi, curseg->segno);
 
-	if (__is_large_section(sbi))
+			if (GET_SEC_FROM_SEG(sbi, curseg->segno + 1) != hint)
+				return curseg->segno;
+			return get_random_u32_inclusive(curseg->segno + 1,
+					GET_SEG_FROM_SEC(sbi, hint + 1) - 1);
+		}
 		return curseg->segno;
+	} else if (f2fs_need_rand_seg(sbi)) {
+		return get_random_u32_below(MAIN_SECS(sbi) * SEGS_PER_SEC(sbi));
+	}
 
 	/* inmem log may not locate on any segment after mount */
 	if (!curseg->inited)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
