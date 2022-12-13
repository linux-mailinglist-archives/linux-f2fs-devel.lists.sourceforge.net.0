Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F5A764B813
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Dec 2022 16:09:10 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1p56u0-0006KZ-QN;
	Tue, 13 Dec 2022 15:09:04 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1p56tz-0006KJ-4K
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 15:09:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=rLU3FKohBsVRHxng0oDgU9twrITN2QgOD2yucjm558g=; b=Sgb51jvlnGg/K+tHJsCuL90wU5
 aS4vgEIKlnm84LKFdAfLx3tcjmTFF0bH/zwECdllyd250VbPnJowduALgc1cvLBJkvcGwtuDYBjkt
 gkCUrIl/9tyl6R4i3DEBPVD+nBuMl/7E5c2SFegvPNXuDs24bG02RIelGMNn+pEOJ3ow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=rLU3FKohBsVRHxng0oDgU9twrITN2QgOD2yucjm558g=; b=X
 QzJlCkH3sVgpv60SjlAouJTxolPLeKPuviMHo9jTolGMCbFcUF+oIzKJMUtRFodyVpTEYV+R4sKJ0
 W0Pny6j4cVXG+pprlnfThlf/Kr4jScjQGZGdGRtb1hRNVGZ9R2OZ2xjDl+mw0kbw7Kkq59I3Jv9LE
 MZy+mqoo3L7Kwn1Q=;
Received: from mail-psaapc01on2103.outbound.protection.outlook.com
 ([40.107.255.103] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1p56tt-00Fqgq-E4 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 13 Dec 2022 15:09:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=miojPOeRQc2aPCts5KA0T4BzuIBum2seyWczUEN1Tm0CMHmDKFVlSLMKJaKOCtrfacD/yQzaUV7IAhFnCWaj9tlcXnPjRw0gfzE0PO4S7XwGVq7smItF7yUAtucEv16kr0MJbuYu+JtMZzG0hhPXZcEXbalByQ+Y7nc9UfHbcqiut6bW0nGaH0XWECnwmNqzz6oSOf04ewsdN7VcC/vGVtbT8xV6tqRlsIX9XWjkHfE0yPzbbiuqGd/ACnaIOGZrFNvAnUAYCO589Ij6PVZr3mz5WSVPImEqOkuaE6LlyzdRRX6grDB0KzdNT1ZzaGBn0U1JIvyJiWu+nm5v4AHJhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=rLU3FKohBsVRHxng0oDgU9twrITN2QgOD2yucjm558g=;
 b=oAvFCJRLQ2uXyWkorWsEZva8YYFTf26zLsabrEMI3FmLJ56vzruUuBgKSLVqEbM1KSOy8HyA82QlcLTLHazH3gTRYUNujuc/jaWJdZ0wMjkKpn+DveSC27+/Ko2GYMEZqijor0mBmqBBRUwrS/9Ig8ERD1rmtVfOreuP0ZXPcoZq3/kXfCdDH+TnJrVxPjvB+6dfSk1scxGzEab7JnfKnuHYI3nVStH9Zwc1dCa3wKk5XF3r0MBkpj88fzzCSUj7M7UJU74LILqFhAuqUCOFWUBWy7TSpvKo7zKOCd7xdTpWk32Y/kfWYRJFvVO0rX12CF7rhOu2nQxZSe/s2SAC8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=rLU3FKohBsVRHxng0oDgU9twrITN2QgOD2yucjm558g=;
 b=gNZTUDGHkHrkbP0j0K6ZOfMG9CLMGlbbe+4xDWj7Vr3wTS48JHUWyiVeJ5EPnur0q8cAQjX6ms30WCsrK93Wyr6J36rxphuGIYAloDc0k7aZj7NfYQIe3nv9fCFCO4e2z4XDsVNUbnuvbSdzUKnVwwcNXBN27i6mJ9xH/0uKrU+gjjy6SfRll7CKlGXHn6BmK4clJbxUQ1VRinul933w1FdKeTDZ64VUouusV8JCtIjX9TVba0NYBn2P8KZo76EQQwp0TNa8mVhHzF4HUsW7+mlHBqjYOOLBMNZfTQ2pvBjZ2r/3gEEW8qou+9O99GqhoEp8CtqsHBvabxAKIlDZlQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB3877.apcprd06.prod.outlook.com (2603:1096:301:29::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5880.19; Tue, 13 Dec
 2022 15:08:48 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::ef03:cbfb:f8ef:d88b%9]) with mapi id 15.20.5880.019; Tue, 13 Dec 2022
 15:08:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 13 Dec 2022 23:08:37 +0800
Message-Id: <20221213150837.71208-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SG2P153CA0002.APCP153.PROD.OUTLOOK.COM (2603:1096::12) To
 SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB3877:EE_
X-MS-Office365-Filtering-Correlation-Id: b28a6477-786f-40ae-c1ee-08dadd1bef5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ZJpgS8/ZQsSYDeWhHwJjT4eVUsCsOK2+srRAGYYDeKZzl2rw7nvY5WZjgKgVMlUFEZP9t+czcQIAEcHIgq/CGgtBO5QADRZXkzVHUHaX4Ayrc5SEVEy34YmyDSJ9xnqc+6/+Pi+R6Tc7wrjFxa16pZSSyQ9mqtuj/boka8C8k+cdLsjAsOHGuMmIDpMvB06LlZuD0JA+oKIAdxh1asvMwmzOPbhcjKHjII9PCEde1m84MsLu+gCoq8zatyzsnZA7D/nLZeA3wmKcdkla/Po6xCKlqnZCd6xDbyIcVaWPP6s31P2Mr2j5XibqclZ8Fh98+ponBELt6dydiRONIlOmBlymYndSyC9EPw7oLfeePd8WhkO9FScnQykOuuZASf6VXb8XVqyiiYR90WpnUreCejjMETnq4vLshPbJTlDdJfMsxKRJP0GC46gDuc/r6oqg6cRhWyZKnzlwx8lWib5XJdzMbD8pCL5cZkjzgfxX0500MnWU/nV7zDiw8njCooTQILbAuNNmWzLRD3HUryU/02NA6y6TOVGwbQacL5Vc4RN9VmcNiT/DrE18fhnIE1aegSC7pXpzRyIYKt+JEMMlJZQ2uRVOvXyxALL0PW9CXB1IMSY0eR+Pgv0lGkAs/Aiz47M+2AdufNXa2QzPZhSFW4S++TyFMv2Bd5O5c4ANAANttiq7vzJ0vK8FO/j3+/Ki
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(366004)(136003)(396003)(451199015)(26005)(86362001)(52116002)(6506007)(186003)(83380400001)(6486002)(107886003)(6666004)(6512007)(316002)(1076003)(2906002)(41300700001)(8936002)(38350700002)(5660300002)(478600001)(8676002)(4326008)(66946007)(66476007)(66556008)(38100700002)(2616005)(36756003);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?2WeBD+t085I0AXG1HsrR275HgowdB0Azurybo8lXBzKtETZLBbfxYZ5bqZxX?=
 =?us-ascii?Q?GGWzQHDPJFUDIfgi7TXiWe1rQuWItOUZELrjetirRAUrJpfb2H4o4ZayJ6zc?=
 =?us-ascii?Q?YmKJ0jxXH2oxZ6aKh3LoWeIHYFE0QgztC30Hy4ExDi9o9VVyClSESqjyDlTT?=
 =?us-ascii?Q?cxsjN3wIiyKfs5HA119ywKD3q2Fb80F0TepV2V1//y8jq7vMm4kZnk4KdShF?=
 =?us-ascii?Q?C9EYOJUqJd3pxFeT/osxUFh1L2hBAuHVXXQMmKfD9isJjWFv+EzUS0ngHfVN?=
 =?us-ascii?Q?0kaowS4YYKOr29TKyNeyoFlLpBTrHvVHRhETlfEIjzvuWz0LNq2dELvVxXkl?=
 =?us-ascii?Q?CFEHdJ8MmLQWaLXdrV6+RftaZZVrK9h3/LxZ243cTE53Xr3YUdOC9QbId+Lz?=
 =?us-ascii?Q?tfjLTg7cp2tVMjBeHY+79cgPywaNivDENjOCZqzJleFOgrQFB2zlUrmUWksi?=
 =?us-ascii?Q?fSukBq6qeT+KbhioyMStFzkHaWIMD/DG8pgjkAlVWtH77I585IqIL/Pa9Low?=
 =?us-ascii?Q?blAeE7zkJX+8QlD1AhHYByh5FhrVJmshp1Ll19Md7eELYqQkA/OoexI9wm+W?=
 =?us-ascii?Q?9zTMr+s9LbE0U+co0mAwqw9johME+4Ju5cLwgC7SyWCQGmbHEhOPahH/BL5N?=
 =?us-ascii?Q?t7OjdOHmJOeVUtNXdV4e6YZBaQ7C42Em6xWpuVYGCBTVWRqVUibxQLN2KA9W?=
 =?us-ascii?Q?a2bcnFoLANxVomjdz9Ir/VnCQc4rWE8nvLgIy/bwOWNFz0AXYS3L4vVyuUSt?=
 =?us-ascii?Q?R2bgYJTGdvr1y5g8bvtb0+N45gJCOt/3qMlfW6NwCUUG8jdm4rS4iQTHBZo4?=
 =?us-ascii?Q?U2qXUENa6q3/eXUrfL9+g6XmhF8NOCEY5tssEsKE2rIqybox3AeJ7joUBfhM?=
 =?us-ascii?Q?Vl21N3rGXDQ4f7lVG7Z1OgnSHJ72u16/scxvL20Z/QBMUy1fHK+2P59OjeG0?=
 =?us-ascii?Q?1dH6FsQBX53eBhs81x7liMwRFtNHoAGVYy7ta57DVusDwUwZHrpETLTiCBD9?=
 =?us-ascii?Q?ZO4vDTIZHgVW3UgmHNp4l/Anx6zziDZ2PnU1WHhmY9eXhMOdvmCpzA1ay90F?=
 =?us-ascii?Q?3NvAwkNJLFlV4N73v+daKye0DM4/0r4dijBc+KarpvweiaawyMjPJRIcYKAm?=
 =?us-ascii?Q?MsemF+m2eyNt+nch2llBaON5fSYxsHASUNR68W9ZthbliVuhmlX8ERBqlFm0?=
 =?us-ascii?Q?Wd2gx3Fr/EWNL9v6lHDLyW4Pl4qgHyKuL5Ya3mrLuoQdX10aUR4b44s+FWVj?=
 =?us-ascii?Q?6teYKTpWWsWHuOKLSbR8u1qopN9YccBJ5mlFpos4c0vkFtlJ2c/KIU70k91c?=
 =?us-ascii?Q?0EuQheCi1JfaazpyUKfh4owt/Rx6LgzKY+Tfordut0nZK8waA2h7arpcM2R8?=
 =?us-ascii?Q?ZYToJ+6nvw9ZUIF9ul+5X5idcr6puQwYHh6Pdc0LGall44YwRz40xPknK+Nh?=
 =?us-ascii?Q?aMhoeDxNRvVsqyTtos78Urv2I45v2kO7nfiHM19fFGSbyIn1fpKIk+9rvCAM?=
 =?us-ascii?Q?CgTcEGcHpAHGUQ1O5WGuUaYPCosKxC6uBb0KruFM84I81ZAnI8Bfeab5l7j7?=
 =?us-ascii?Q?eyvCXCnKBzhppOibvb5YmQsFyHVuVOqNgd4Y8wcY?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b28a6477-786f-40ae-c1ee-08dadd1bef5d
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Dec 2022 15:08:47.8756 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 4uHbcHWcNYHJh/SbljHAcORLOKb0EHTEyB+zgfxuBjUzvhjVEMhLswSsvjSnlugzKIKyjpUUgltpqwxuqh6+qg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB3877
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: There is a problem with the html converted from the previous
 commit 6047de5482c3 ("f2fs: add barrier mount option") code submission.
 Probably
 something like this: barrier If this option is set, cache_flush commands
 are allowed to be 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.103 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.103 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1p56tt-00Fqgq-E4
Subject: [f2fs-dev] [PATCH] docs: f2fs: fix html doc error
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
Cc: Yangtao Li <frank.li@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

There is a problem with the html converted from the previous
commit 6047de5482c3 ("f2fs: add barrier mount option")
code submission. Probably something like this:

barrier If this				option is set, cache_flush commands are allowed to be

Let's fix it.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/filesystems/f2fs.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 220f3e0d3f55..2055e72871fe 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -158,7 +158,7 @@ nobarrier		 This option can be used if underlying storage guarantees
 			 If this option is set, no cache_flush commands are issued
 			 but f2fs still guarantees the write ordering of all the
 			 data writes.
-barrier		 If this option is set, cache_flush commands are allowed to be
+barrier			 If this option is set, cache_flush commands are allowed to be
 			 issued.
 fastboot		 This option is used when a system wants to reduce mount
 			 time as much as possible, even though normal performance
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
