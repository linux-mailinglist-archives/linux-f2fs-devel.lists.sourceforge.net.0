Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 460C25142B9
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 29 Apr 2022 08:55:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nkKWw-0007jC-Vd; Fri, 29 Apr 2022 06:55:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <changfengnan@vivo.com>) id 1nkKWv-0007j6-Ud
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OcupsmO1fCmJmRytJfgfRb9dDmsEqE/ou/PjJKIbrSM=; b=dmGLQbBCe/KnYiD86xKV3190OF
 zqFJN1n+lV152ctTdXUyC4+JcshCfSmyBFbWs764ke+hJdBnkrZFz9xuXhDoJ8RLt3p3T0yvQQIJX
 9q/fgFslVzP6XNmVT3UQomLFLhiRdpQtmX+vFMl7cn1dAmUOwwhF71dVujTwT24/Nu3o=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OcupsmO1fCmJmRytJfgfRb9dDmsEqE/ou/PjJKIbrSM=; b=X
 yNYyeG5FI8dg7kZnXJHBDK60vh8HA0BTmU8yX5b/Dcs2zXrVF4/oEPHBVEwj+YuU0892Z6e5ZSf/W
 psmwYG/J3XpFPcH4SDb7Vltee4vdSGCSbS6btdHw39yRmJz/JKB4Ju420JfgMhbZ3mZiECayrwXSh
 6C35rUEPJQ0wq6dY=;
Received: from mail-psaapc01on2092.outbound.protection.outlook.com
 ([40.107.255.92] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nkKWu-0001a9-Nx
 for linux-f2fs-devel@lists.sourceforge.net; Fri, 29 Apr 2022 06:55:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=RuXPKl3z+YTtmgK5qhsqFE/Qf5+u+7qwcXx3XjLD1c3cN2V3wxt5ZNA7NIi+dgsYYva5Yr0qI3TX9nH3CGUzzIt/2Blr9+cTq0kgwmx+1Qd9gGKGFKSaLyQthvBqLAbidKiHF/N03i1ErttmxbEoKCjdgbrAKWy5gaWItGVxFeX3hZG9ezXw33RHrfg1giDor/u6kKpu1Xfh/wm05gNh70GZ8GPWV0qklbLxUDv4BOPC2v48JYWa9XcL11JgqzvW08xpYmN1cygkUFdcPvankABRbsZqzBX+5uuUz5+u+POLA+gvvcKUp5wk99A041QcOiQphH3gBk7SlZb8Qlb7Lw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OcupsmO1fCmJmRytJfgfRb9dDmsEqE/ou/PjJKIbrSM=;
 b=HnZp8uC9yQ5SI8hE+kkWl6+ov4wRh6Re+TGgJNGQ57Ab+Yu0pRltd8mAfyhi18nT55Pxbgkt+6UJ7KUzZ2dVpnkF2OofCxw+pIHIfgIEe30gIHeHtsThnlwiKKdpVGu2e67dSkClASe06tm3/qPBKIaawvDoB2m5745vaee3FqMKh3EDL6zgiJPlDHZVEsxJPghAZkMR4LhvkuTSwvUKD9rGTd4hNKb6keghHLjFa4/+4K0YtdcwcI8ApV3+Ocl96642mCvsshE4h1nBvHnemaVBIU+efUNOQV/S+rDyoMVO/5MQb2kHr2nMiq2YUf3jfwWV4DL+ZgK+/znFGOGgCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo0.onmicrosoft.com; 
 s=selector2-vivo0-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OcupsmO1fCmJmRytJfgfRb9dDmsEqE/ou/PjJKIbrSM=;
 b=brg02n+8PkIvOWklpno29FWCOdZGaSDH+/B/8iJyy547f2v+DhdqpxxlMs+qLEzqUeIrOReFtjm27PVBPojujilrpWoXOqb7C72zBVux3mshwplEoFq8lDC76oQnee+ggNk9YQA3wLCy7FPIkBbP3C5tTbQiRmh1p+1vNe6r0ME=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com (2603:1096:820:26::6)
 by TYZPR06MB4176.apcprd06.prod.outlook.com (2603:1096:400:2c::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5186.14; Fri, 29 Apr
 2022 06:54:56 +0000
Received: from KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02]) by KL1PR0601MB4003.apcprd06.prod.outlook.com
 ([fe80::fc26:a0b5:8bfd:7c02%5]) with mapi id 15.20.5206.013; Fri, 29 Apr 2022
 06:54:55 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 29 Apr 2022 14:54:43 +0800
Message-Id: <20220429065446.208019-1-changfengnan@vivo.com>
X-Mailer: git-send-email 2.32.0
X-ClientProxiedBy: SI2P153CA0005.APCP153.PROD.OUTLOOK.COM
 (2603:1096:4:140::11) To KL1PR0601MB4003.apcprd06.prod.outlook.com
 (2603:1096:820:26::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-Office365-Filtering-Correlation-Id: ee26bf48-7737-49c8-a7c0-08da29ad2aba
X-MS-TrafficTypeDiagnostic: TYZPR06MB4176:EE_
X-Microsoft-Antispam-PRVS: <TYZPR06MB4176B966036A888CEF8DDA51BBFC9@TYZPR06MB4176.apcprd06.prod.outlook.com>
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 7fy5M/OpuEfTYh1Rv3oPHlTRr6iFHngoGBk8DCPGXkqJDHy9+1WQk3AH001Je+WEZ1UzeXkP/KWiTLL8EA8DS0oTt9oT5JI3dUH4zjOgcRDqkpDEun4yVuc0iSSxf9J9veyVQ5Unagb8jOfBWaBcSyxNhs059qlHvBjfQ+W5/bsTIGZP2vD42qXBfOe5T167t+Bzm+1Ed7syLv+dtIuOxBYHNlMxEOSeJwtHsQV5p8Uj3LWUUA6iF//DFXDFwy/nfnwOT6H+eYrZbO9PrqWGUP9xhyyd9pKp1TKv59kdl0kg8QMZr8R9VJZVJZrnMjRgHG459cwQ4pg7V/MqeOGz8h+aV8ozVa38gPc1R/yAkbVH70D3hyCQcAl5t7OJffidZykGlzOpFqjGrM+xzUM+aZR57XnBz7KdazfiPQ4GChqfhl9L8mVjgNSalpvQyBvJl4mf4tKAolW5vr5iR7sz1YLrbtav2dMHnJTanrUlv1E+elFAydQPTEbGUybU5EK3mI8zYJsUKZvlLSaAAv+BIAjCsb+cyouOolASMYJR1EbLPWxV0qHgV1yY8Jpf+TH5roUdo5JYb8oXuVz4sG/8CBcsCPWbX3KpSouGDx8yJoYC+f0eM5cPWuMpZ4IiJsdxkJyLQFCTH1aSK0ItcbWAGYq6svGbfjh3IOvzeV1CGYPE932gMud9CqzfwWj9sfuQoNEwYatVsjhIh3cQIQt0Kw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:KL1PR0601MB4003.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(316002)(66556008)(4744005)(186003)(66476007)(36756003)(2616005)(6666004)(83380400001)(8676002)(4326008)(6512007)(86362001)(52116002)(26005)(6506007)(508600001)(107886003)(15650500001)(66946007)(2906002)(5660300002)(6486002)(1076003)(8936002)(38100700002)(38350700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?6KgF0XF2dED9ET42bmTRlNYFFBobsdHe2aDIjR4YyOEaouu3S+xCVwsfw4dA?=
 =?us-ascii?Q?iBmTNQv5tkFxPAGYq8UfHaRYHfiOCdHx1UjFQl9n2LGCV349WmRz5Zvx7TLx?=
 =?us-ascii?Q?Y67fQnDnNAaiwtSAYQq9A8awVlD0qGCA/X/Vnb7+Ow7OwDVCh4qj6Q8wu3DD?=
 =?us-ascii?Q?mv+xS9jxOAWt8aCxYdtAyOVr4VgHDRvw3p+ywpxS6CfrmfX98LCPefoLMCzF?=
 =?us-ascii?Q?1Fvd91nL4UMyPEbwvapHO4EiEgitG3A+hruB6lRGoZmS19vacMgn8BkVEOoS?=
 =?us-ascii?Q?VhQbtGnkQLtB43yzoFKi9BO7f7mFSRp4dpX6amr4GyL42R8TVguSdkyHYYuG?=
 =?us-ascii?Q?zMbEX5QtQt2zPhk1LDbxwZfKpiufopn3xMOTOEeuF+hgxT9/hnCrjpYno2Yb?=
 =?us-ascii?Q?nOXwfzWgwi3Z/rge03X1iJ2WEYdnuFC3HQWeXHN/MsGR/ISJNrLssB9eB8ot?=
 =?us-ascii?Q?gF1bSuZzPvTPizOwPS6+Wum7JXi9703bKBF1mOB+IgnivgfAK2cbwpWs0I9q?=
 =?us-ascii?Q?/AmLtHNn0p1jIUG61POoiwE41Y6JCk1Cu4tSotf+NGvWktXIBs+ltaOR8yTw?=
 =?us-ascii?Q?g/C/az69HnA87EmsJrwe5tA3ULaxZ1YYPHbbD7HzFRCUj5FPprOALWTdQWN3?=
 =?us-ascii?Q?/2VE/UTbgUTj08zxe0d+gNBvliVtkzYUqre6dma7kx21ntgMm8o/sR7hzaab?=
 =?us-ascii?Q?arN3Frk0dfg3+MwQ+e/Nei3MnvkNF8Ch9XeiCtM+M8Ln2IjRjpZl3Zl3syhE?=
 =?us-ascii?Q?gDPIVW4WA6vEJJKr6xRbkEdKA+s3fYZzKli5kG4PFSMTLBh3NO9Vxrkjgrhv?=
 =?us-ascii?Q?hvI4l3hj/KhEE6bsnYIGqam5zfsxzs8CeY9gShtGrqr7NqestzZebfBWBYAp?=
 =?us-ascii?Q?kh3WQa78yxikjTKgIx5gebfkGbRbeKb65SDeN4NPdJd+ZVgkNtm71LUid6iX?=
 =?us-ascii?Q?30RL52NKQwmUd/apTTK4H/ficS2Mz4P39gIELmIoAuNmCU7I3tDV3WMkUjwG?=
 =?us-ascii?Q?5+JI0TL78icyeSLieSq3vR598VTdg8vSqZhCPO7SE3tTB2kec67hOHKjJbhx?=
 =?us-ascii?Q?TKjFtbvjTr6+ykROpeTdMz3hH+n/PuAZCbNtN176RxQMe1N5o2JSdhXpyUl0?=
 =?us-ascii?Q?jeaZtAvF8eH+jJXTrQYv3+sT5ZcILw6bRa3ByQHhXLNXMmCRzxRn70wnGdhr?=
 =?us-ascii?Q?1Prn9LeFDBH6STkcoQlSvTGI9Ji+V2tk2UcM9r6wTrYWwtgU3g34tbB1OxtJ?=
 =?us-ascii?Q?UcZjeZOsu76ZccLBgzpgiGgcb/6I63fSiZ+ogHKJ2W1ZySk59zgd/qpITpNT?=
 =?us-ascii?Q?xsJvAneSDkiMFJ/n/RLj54j4ZzDHLHCPMT42WXhDDtQdsIKzuB5F3Mtgaqse?=
 =?us-ascii?Q?CvZKqrw1aG8UGQSEMh3Ur+1YKPA/ykd922krJ6E6edRJGNoUZbVoZsxr1Lcx?=
 =?us-ascii?Q?WCaLkxfJDr1B7J5lu8SgSJ6YXCpDHzgpDncAzzDA/84kekk55d9MDuVz6hbj?=
 =?us-ascii?Q?mAz6rYLB1PCLXfjFWuX//7qo2tjJdqQ/hVjP/HPpVqWOkXY2CR7AhnjFYjhJ?=
 =?us-ascii?Q?al+QoQn+gUbG4tPJ2x5wBL0TKtUV89DhTjzASplrjF7jCMRRlmz25OCoNqlu?=
 =?us-ascii?Q?d9Sxvu9Guf2015jUQGhoHCIf/n0dK2zr+NEsAk3NhcREoVicYONLrIy7g/7G?=
 =?us-ascii?Q?0my5JS/cLlFjHQuG4HhhM2/gBroigy9c7R6pStui2I9JtnZsRCiC9ndAeM5i?=
 =?us-ascii?Q?occzeTBrYw=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ee26bf48-7737-49c8-a7c0-08da29ad2aba
X-MS-Exchange-CrossTenant-AuthSource: KL1PR0601MB4003.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Apr 2022 06:54:55.1958 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SCWMiYaKjZGHXXEYXQjtwUUfJiclGABRtaLR3Q8hVdGexwwl6QtRXOV5ak6YKTmtftVyaVWKzIAXqWP8VRXLkQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4176
X-Spam-Score: -0.0 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Optimise f2fs_write_cache_pages, and support compressed file
 write amplifiction accounting. Fengnan Chang (3): f2fs: intorduce
 f2fs_all_cluster_page_uptodate
 f2fs: use onstack pages instead of pvec f2fs: support compressed file write
 amplifiction accounting 
 Content analysis details:   (-0.0 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.92 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.92 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1nkKWu-0001a9-Nx
Subject: [f2fs-dev] [PATCH 0/3] *** support compressed file write
 amplifiction accounting ***
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
From: Fengnan Chang via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Fengnan Chang <changfengnan@vivo.com>
Cc: Fengnan Chang <changfengnan@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Optimise f2fs_write_cache_pages, and support compressed file write
amplifiction accounting.

Fengnan Chang (3):
  f2fs: intorduce f2fs_all_cluster_page_uptodate
  f2fs: use onstack pages instead of pvec
  f2fs: support compressed file write amplifiction accounting

 fs/f2fs/compress.c | 27 ++++++++++++++++++++++++---
 fs/f2fs/data.c     | 33 +++++++++++++++++++++------------
 fs/f2fs/debug.c    |  5 +++--
 fs/f2fs/f2fs.h     | 22 +++++++++++++++++++++-
 4 files changed, 69 insertions(+), 18 deletions(-)

-- 
2.32.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
