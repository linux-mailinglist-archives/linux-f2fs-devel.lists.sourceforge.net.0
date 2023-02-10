Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6BEB6691C9D
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 10 Feb 2023 11:21:01 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1pQQWW-00062x-97;
	Fri, 10 Feb 2023 10:20:55 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1pQQWU-00062q-Lf
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 10:20:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=e/gG5F84KiyPR7TAnliniylwQfEBhjSAmB6wyMTWeMI=; b=NwcdUXaRPDe2yfAQwc05FhPBEq
 eeQlRghpSM8u+5ihmKqk6WNlCgrTInTU5RcwSi8iIlcz69G4TV6qy2insiyGdbebt0+g0TFSPXJZ5
 99S2vg/Nnt1fuiWhtXfvQYuy1Yw5/Qn/HzkryCaA27RXs1nrEDqj+c3amtGCCJCgWbYo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=e/gG5F84KiyPR7TAnliniylwQfEBhjSAmB6wyMTWeMI=; b=M
 xV4EVMx86xHcZjAvOhVGD+Sa5DckPxcVKZHO8l2yTQnoIR9YDsTg6kAaUD6+ajCmwSULgmxcN6PmS
 2DeqMy7cyxNlIHdemjHIYGSr35NhEghVMwShx3fzxuGe4FZ5XteO0dL0dg2xsTrvDnc5HKdSEAODC
 xemtkN9etKVRyHrg=;
Received: from mail-tyzapc01on2138.outbound.protection.outlook.com
 ([40.107.117.138] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1pQQWP-00062p-LV for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 10 Feb 2023 10:20:53 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=MQG6iyGLCvebQZTpJt93IKuzSAUxdakjuFfIAHyyJl+CuE+UUfCRn9qRseW4AQU2YQ3XnlacfJCcA8XRPXH9XlvlgJn976CNy8omv6ZXBsZRbuP3g4r/DvoyqLhEaKrkvg4csPSLUBfupZBq/BggbevwQPs0R+vob6fBpMmPZoZxVx2qiXlLV674qmW0nfECTNdbfUZd7sWFpH8PKzcSrcVTQgEPAMmt74Nxeor74TtOGm7hTf2pLzQkHiSjpsKcTvvJfBlG7zuaBKMzr8G+cmmmDh3ucBV6OxrfO47xxsoDJH/6uttvxs9dLJq3IYVIFDXGp6qtAxvymPWp+VYPsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=e/gG5F84KiyPR7TAnliniylwQfEBhjSAmB6wyMTWeMI=;
 b=I+xUTiosrLAQYmt6Sq6/GjQF/2nzALG4GpxwUjheq1rl8SgdRjyJqXfKBi00uG8XHOHQBbnxukYFK1bx+h+raXGdkPSqthbcZ1zYWEGM95MRpHVlQHnkFcxivafY5alGh9S/GcS8n2/ibYYNZl+Xx9JmVa0Xzdpwc77+IYYu2hKE4cGq6RsRKy/iQBHB1Uwc8LFhOwM0YxvS8KMtCpcwC4uEL9poVwOqxPdVJzQSLSWVpc3p7gVyzQihAOm2AHmnCwZfcF2htPgasQA4LC1kdcDjoI8QC6MLpaZSW+85CYkGm7UCdJBm0OvVLFzXvf4X/IiQEMoELgsGxlirFlolEg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=e/gG5F84KiyPR7TAnliniylwQfEBhjSAmB6wyMTWeMI=;
 b=dT2pNx/tNub0Pajc/Jc+b4kXaU7CeY04wBTuyIIYbFZSpJlqkkgsXv1ZNu6eScpjULRBC7EupPgOlBg0y1GulE2g4NBUUK+e47ZQZgmDszuu3W/rrKP9pp5ADfRemt6Ae0ubhbLh2X4outaVxILpJEiQRLcodn1lVPSDbDw+9Gae5RaR+CJ/QWLhfQVR3aUIur7x7roOy2g1GdX1XuK/QD6WfdP+yhnkrTvFcqja5hn1c/dnOBvn6JauutAsY+GjP7dIsYxCSLSaz0qw/OGiEezoIWKKJbsjNLeqUBKnNlc6DROoC6fwIrdLx3oJg6sUcOVB4DuwC6OoyE3NwCUVZg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by PSAPR06MB4374.apcprd06.prod.outlook.com (2603:1096:301:78::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6111.6; Fri, 10 Feb
 2023 10:20:43 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::daf6:5ebb:a93f:1869%7]) with mapi id 15.20.6111.005; Fri, 10 Feb 2023
 10:20:43 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri, 10 Feb 2023 18:20:19 +0800
Message-Id: <20230210102019.61193-1-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
X-ClientProxiedBy: SGAP274CA0015.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::27)
 To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|PSAPR06MB4374:EE_
X-MS-Office365-Filtering-Correlation-Id: 79f62a67-9f13-4c05-1370-08db0b507754
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: wStl8BJ+a2JYfNDYnKdNdlS3KVHGPWC7VGU8s7mV8sJxu4EKZTron8FKerqCcucZ4HQ8WY/CVeFVcbDaL/dq7r29xMr+CDzAnaqDn6Oq8KOfPT07E2APZR6j4YDhhd3t9jxRcFR2YNEs0RuxgRB+58t7G28+SVoHMl3R8K83eR0X33gEy54hx2vNc2fS2dRN1mdG/FhoDsMURxhTjLuAP78ubZXDeMkDfR1ZEKuxfpJjX6qw9NN4204VsOFjMf3zAW+8axiYgsb05gWvBnCZ2VfZfKohMWdu1UEiwRyc+23iCnU28E+shoC3wcakmzUtkJtkClTpDtJlrDp1lzK3+voYmD0Df/6iMkip5vFJtVTc0liaAIZEWsKDAUqY6P8yQ4hyPY5UeQuOJEYtPKyPh5twwAlZ3997nyaIEsKk0zAPpzq6x82VjkVAjOcor1PYnjTQeENq2omNuKxDNFbGfy92/40brttopNFi+tr+6/38bt8aYVrZdV8h1D/v4EmFYjfDAY3+uHYwwyZOHF/RNex+i2w/tPfYNE+O+KG4LuPb6ATJogu5O/pMhxeU8RFtfe4MK1MpY8Tu/guNCyhETL6aXUVyqH6ckifBV1ZXbJOsZ96RHV406iYG3f+81eas7phtDDe09GPU5yiLNFIY2n6cSUIixCADe80LcIY3e/ZsA94PUTCgTM573AVdaDUPHL3hwu8NEOQ5qxQd6ibAOg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230025)(4636009)(136003)(376002)(346002)(366004)(396003)(39860400002)(451199018)(86362001)(36756003)(38350700002)(38100700002)(1076003)(83380400001)(2616005)(107886003)(26005)(186003)(6512007)(6666004)(6506007)(478600001)(6486002)(52116002)(316002)(8936002)(41300700001)(5660300002)(2906002)(4326008)(8676002)(66946007)(66556008)(66476007);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AdWFC+14wufRtxA7+pZ3Iqp7E4b+J9uPwuvRvllpxKPHO998HqE6oSmkEL+/?=
 =?us-ascii?Q?mJ7Kg6vxbAEHuoXn2sdcH2CeIRHtanZtmxhbzmYdSBQ5vZ5RhsnCUtpPoX6u?=
 =?us-ascii?Q?YglhsatzPIasj2yqPNWEzOvI0oviVvXrXH0Mj+kA/nkaBcoQ2BLP7vQCrljW?=
 =?us-ascii?Q?8c0jqQKIVixBkH+CWmT79ZBWcuUy9LWXEeZPnam8bltZo0QY5PHl6YEwDbsC?=
 =?us-ascii?Q?0SdoK+cxrmqiJc/XMqutYUOFSfULuQBpe//24P66GhKRmUgZMAOIbJgT9sYw?=
 =?us-ascii?Q?GNr14NZMgnjoL4pwe9l+JY63eCnwKouLBAA0mde+pna1f/CVUt8YU7/UIgU2?=
 =?us-ascii?Q?SN8WgWIM7ieh48NZyajY50Ce+coZysNyw3gnjL7BM2/Wt9bcXLjxN8kfU9/j?=
 =?us-ascii?Q?jr1za8Qn/Be5pdswH6+i5HsWRgONKitX0ZEfkEMOFrTbaYNW7yS6Ie82wic4?=
 =?us-ascii?Q?khy9DJ+zt4FWvlW2LVnmfHuc5O8/VSvBiofw73v1BmavtpbK+6rncTy8k7WM?=
 =?us-ascii?Q?7T/ggnJzHocMaGF/+xu6o5wo6vdeLhxp3uI37IBdt7xFOO40hZDxVGmqg489?=
 =?us-ascii?Q?Ad9MtaTDWN6BFf+cVtJ9B3RnkDUgP4jR7W8dPbgCaK08iKHRVtO37//0iHa2?=
 =?us-ascii?Q?M47VgZJdJ6BjjHHo0QsY/yC/XYNFptBRhLCRjY8wRuSuwNt31xUIJOYf5HUV?=
 =?us-ascii?Q?U0qPS+n4t7lvy8awAnbYdLbAP+et5SDFwdvm6I8jqD8nGIMC1l/joQvPmln8?=
 =?us-ascii?Q?4Q6koccxBiXGZlKiPtEIcAx0ulGsNF2SuC/sm0iG8g2TBr+84BAWl8zTCdB6?=
 =?us-ascii?Q?1QU58T6Q/l05hQcTAsqZ/9BVWz3TNxg8bKuW7ZhnNQ01fhgcGGRFfjyG7fvH?=
 =?us-ascii?Q?Wp1E6BTP7VEbR7uObSPJFTwhPd8rMTIfWfIciN6A+yBPojyw5+UJzSQre2xU?=
 =?us-ascii?Q?l+a+Uh53RCsvUlNAgpkhypWmHJCDZzW3R/ZZ4GlqolGGAbKXO6D9JYPSGEWZ?=
 =?us-ascii?Q?JdpkJoMQOZJuoiH0Gz9EXauOq7KhmxYLAiSuhJhzfMkVetC4v/maX/dxkG79?=
 =?us-ascii?Q?Z+9xsPfYkvmMh3M91j/z6VlZVWnBo2OWF0n+a7Psw0FZ20TYqtfuxSm1CBv1?=
 =?us-ascii?Q?9+70b5oYPLgO6ew8fosXDdxpVdBVAQsnsmRhAICGIUuyhx67ZLgtEIT/skGI?=
 =?us-ascii?Q?cMU8DjF2OLvlDz2Il6PkPKIXjcPLnOFJ41qCG+1q8eYSv+Wm3QRZqqQXMfMP?=
 =?us-ascii?Q?GE5QU5ZM0FxXP7CDsEFSzOUFIFRSrlO55ecDOxv0LgbvvnUs1j4qIxmTfTQ6?=
 =?us-ascii?Q?/ORZjdL1LQu4hMYHSnJlhEaCfexPNuTeS25MSL8XgRLbFvTBncrobbXvMij3?=
 =?us-ascii?Q?vzLFFV/HpHaHug40jjtR7J6pz0Y1Z/oHOaWcMkh+gL9Xs/v6rTuPBN4htku6?=
 =?us-ascii?Q?jfH6B1izWTJ3mnJJQ8jn5m80BpBUq6mjeuSIVIJkpMC9lkMpI1Csr+aq1018?=
 =?us-ascii?Q?o3wbaubWM1+EMZsY24SrVZg5kz/fyI3PyyEevwTQMTuQC+SJ6M5bVSr07u7D?=
 =?us-ascii?Q?fTI1NDUyCb5d030wUvvK71t8l73eBMKDcrefBf7Z?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 79f62a67-9f13-4c05-1370-08db0b507754
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Feb 2023 10:20:43.1886 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: u7w2c/5tJj/mJ9Do7czI6k5owYMLkZV0dLRDZInpUoU9FWTq/AvVoQEY7AzCuf320dbGMCYvFZuJkqtNw9mD2w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PSAPR06MB4374
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: When the released file is reserving and the space is
 insufficient, 
 the fsck flag is set incorrectly, and lead to the file cannot be reserved
 and released normally. $ mount -t f2fs -o compress_extension=*,
 compress_mode=user
 /mnt/9p/f2fs.img /mnt/f2fs/ $ dd if=/dev/zero of=/mnt/f2fs/800M bs=1M
 count=800
 $ dd if=/dev/zero of=/mnt/f2fs/60M bs=1M count=60 $ f2fs_io c [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.117.138 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.138 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1pQQWP-00062p-LV
Subject: [f2fs-dev] [PATCH] f2fs: fix to release compress file for
 F2FS_IOC_RESERVE_COMPRESS_BLOCKS when has no space
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
Cc: Yangtao Li <frank.li@vivo.com>, hanqi@vivo.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

When the released file is reserving and the space is insufficient,
the fsck flag is set incorrectly, and lead to the file cannot be
reserved and released normally.

$ mount -t f2fs -o compress_extension=*,compress_mode=user /mnt/9p/f2fs.img
	/mnt/f2fs/
$ dd if=/dev/zero of=/mnt/f2fs/800M bs=1M count=800
$ dd if=/dev/zero of=/mnt/f2fs/60M bs=1M count=60
$ f2fs_io compress /mnt/f2fs/60M
$ ./mnt/9p/my_f2fs_io release_cblocks /mnt/f2fs/60M
11520
$ dd if=/dev/zero of=/mnt/f2fs/30M bs=1M count=30
$ f2fs_io reserve_cblocks /mnt/f2fs/60M
[   56.399712] F2FS-fs (loop0): f2fs_reserve_compress_blocks: partial blocks
	were released i_ino=cf iblocks=76104, reserved=5220, compr_blocks=5655,
	run fsck to fix.
F2FS_IOC_RESERVE_COMPRESS_BLOCKS failed: No space left on device

$ ./mnt/9p/my_f2fs_io reserve_cblocks /mnt/f2fs/60M
0
$ ./mnt/9p/my_f2fs_io release_cblocks /mnt/f2fs/60M
F2FS_IOC_RELEASE_COMPRESS_BLOCKS failed: Invalid argument

$ rm /mnt/f2fs/30M
$ ./mnt/9p/my_f2fs_io reserve_cblocks /mnt/f2fs/60M
0
$ ./mnt/9p/my_f2fs_io release_cblocks /mnt/f2fs/60M
F2FS_IOC_RELEASE_COMPRESS_BLOCKS failed: Invalid argument

In this case, let's release back the reserved part of the compressed file.

Fixes: c75488fb4d82 ("f2fs: introduce F2FS_IOC_RESERVE_COMPRESS_BLOCKS")
Signed-off-by: Qi Han <hanqi@vivo.com>
Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 fs/f2fs/file.c | 97 ++++++++++++++++++++++++++++++++------------------
 1 file changed, 63 insertions(+), 34 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 300eae8b5415..8f3f55ac153a 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3427,11 +3427,52 @@ static int release_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 	return released_blocks;
 }
 
+static int f2fs_do_release_compress_blocks(struct inode *inode,
+			pgoff_t page_count, unsigned int *released_blocks)
+{
+	pgoff_t page_idx = 0;
+	int ret;
+
+	while (page_idx < page_count) {
+		struct dnode_of_data dn;
+		pgoff_t end_offset, count;
+
+		set_new_dnode(&dn, inode, NULL, NULL, 0);
+		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
+		if (ret) {
+			if (ret == -ENOENT) {
+				page_idx = f2fs_get_next_page_offset(&dn,
+								page_idx);
+				ret = 0;
+				continue;
+			}
+			break;
+		}
+
+		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
+		count = min(end_offset - dn.ofs_in_node, page_count - page_idx);
+		count = round_up(count, F2FS_I(inode)->i_cluster_size);
+
+		ret = release_compress_blocks(&dn, count);
+
+		f2fs_put_dnode(&dn);
+
+		if (ret < 0)
+			break;
+
+		page_idx += count;
+		if (released_blocks)
+			*released_blocks += ret;
+	}
+
+	return ret;
+}
+
 static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 {
 	struct inode *inode = file_inode(filp);
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-	pgoff_t page_idx = 0, last_idx;
+	pgoff_t last_idx;
 	unsigned int released_blocks = 0;
 	int ret;
 	int writecount;
@@ -3481,36 +3522,7 @@ static int f2fs_release_compress_blocks(struct file *filp, unsigned long arg)
 
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
-	while (page_idx < last_idx) {
-		struct dnode_of_data dn;
-		pgoff_t end_offset, count;
-
-		set_new_dnode(&dn, inode, NULL, NULL, 0);
-		ret = f2fs_get_dnode_of_data(&dn, page_idx, LOOKUP_NODE);
-		if (ret) {
-			if (ret == -ENOENT) {
-				page_idx = f2fs_get_next_page_offset(&dn,
-								page_idx);
-				ret = 0;
-				continue;
-			}
-			break;
-		}
-
-		end_offset = ADDRS_PER_PAGE(dn.node_page, inode);
-		count = min(end_offset - dn.ofs_in_node, last_idx - page_idx);
-		count = round_up(count, F2FS_I(inode)->i_cluster_size);
-
-		ret = release_compress_blocks(&dn, count);
-
-		f2fs_put_dnode(&dn);
-
-		if (ret < 0)
-			break;
-
-		page_idx += count;
-		released_blocks += ret;
-	}
+	ret = f2fs_do_release_compress_blocks(inode, last_idx, &released_blocks);
 
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
@@ -3585,8 +3597,22 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count)
 		if (ret)
 			return ret;
 
-		if (reserved != cluster_size - compr_blocks)
-			return -ENOSPC;
+		if (reserved != cluster_size - compr_blocks) {
+			dec_valid_block_count(sbi, dn->inode, reserved);
+
+			for (i = cluster_size - 1; i > 0; i--) {
+				dn->ofs_in_node--;
+				blkaddr = f2fs_data_blkaddr(dn);
+
+				if (__is_valid_data_blkaddr(blkaddr)) {
+					dn->ofs_in_node -= i;
+					return -ENOSPC;
+				}
+
+				dn->data_blkaddr = NULL_ADDR;
+				f2fs_set_data_blkaddr(dn);
+			}
+		}
 
 		f2fs_i_compr_blocks_update(dn->inode, compr_blocks, true);
 
@@ -3604,6 +3630,7 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	pgoff_t page_idx = 0, last_idx;
 	unsigned int reserved_blocks = 0;
+	struct dnode_of_data dn;
 	int ret;
 
 	if (!f2fs_sb_has_compression(F2FS_I_SB(inode)))
@@ -3637,7 +3664,6 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 	last_idx = DIV_ROUND_UP(i_size_read(inode), PAGE_SIZE);
 
 	while (page_idx < last_idx) {
-		struct dnode_of_data dn;
 		pgoff_t end_offset, count;
 
 		set_new_dnode(&dn, inode, NULL, NULL, 0);
@@ -3667,6 +3693,9 @@ static int f2fs_reserve_compress_blocks(struct file *filp, unsigned long arg)
 		reserved_blocks += ret;
 	}
 
+	if (ret == -ENOSPC)
+		f2fs_do_release_compress_blocks(inode, page_idx + dn.ofs_in_node, NULL);
+
 	filemap_invalidate_unlock(inode->i_mapping);
 	f2fs_up_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
