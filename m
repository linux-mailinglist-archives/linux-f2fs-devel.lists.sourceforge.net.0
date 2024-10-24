Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C9E139ADAB5
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 24 Oct 2024 05:53:23 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3ouI-00075o-SS;
	Thu, 24 Oct 2024 03:53:07 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t3ouG-00075e-O1
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 03:53:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=YYNdSu53w0LK89+cHupHQbjOlDgHZdLpWf8Ja0UfOyI=; b=ZgvxG5004ErGVqAb57QXW+Qv55
 7yYfLFgfL1uDHEgqskzQdOR8/fP8khYKs3C0am+uNGkzgYoWqMBNQiUS2R4vLYy9W/4KlPdZXtNah
 eWzYnHcu2XogX8L6XFiLWQc1lEG8Dwbh76HUXawVKocjeqUXVM8LxQ8yNaUiAA6gyWr0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=YYNdSu53w0LK89+cHupHQbjOlDgHZdLpWf8Ja0UfOyI=; b=i
 ETm1VBhq05I3Sse2I1sxH+EwFiP4wNlQgp4IFX1eS2Gzep9X64RGr7kifq4yGkmerzaHvxPsTq6c/
 m8101SGbgt+9rp6A0fVDWPPMWx/j/BJY6G7xyWpHXMzOj83SWl6aRHf5FQY+Q4ZfDrkuDnhnvvTAz
 Ms92RkT/BwNzAPkw=;
Received: from mail-koreacentralazon11013006.outbound.protection.outlook.com
 ([40.107.44.6] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3ouG-0004D1-LG for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 24 Oct 2024 03:53:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=BT0A9QoJBs7rc3GhB2CsqHjTm7ROusG/KVYt2xIiYql19i2Fd46vZNSdQDfSC2ApTZLDoU6Y5sTNOwGvbLEBrPk2Aya78/vHjC32KXi46G+pFxtcfqLFX/GB0NNCtByRk4Ntd2RSievrrZupckvbQ3QXeTAY2cdcmq4OgSz1LB1weuNebgQfn+bIMC93w4hYTw8WZb4RXFwIPGGkc8b6eTj8x5lsmKct6iH/FYEqwCHoPcu8vxr/LVwASyA6bvedTtfrjRSix0R1ZDzfVd/a78hVZSse2gJg9U37Y/GKe3ijcrzekOd+w6kLPs5ks+DeAlpIX9flB9jluYq7fq8hnw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=YYNdSu53w0LK89+cHupHQbjOlDgHZdLpWf8Ja0UfOyI=;
 b=vYuO1E0p3JJuld1eh/yFWbaYBWKcKAelXtqtmJOl2MVecb2JT2DaZfGaNHm9e5pE8IaG4DqGwFkfOfXhKtbpuDy1aJ8yTB9t0jeIBauD+kN5fLt27KRL+MdB+A56CKkM1liK1C5ZynA5f1CDL2AJKE//i7fq+2LmA13GIpuHLfyTBw6izUl2PDJFyec4wmtBQ99yWKsMjqxpe8zfDr4kPRIpvUjeLEaBwHDaTayC3RLmUk0hjs1ltaMePyUeBFzQTvKWxJ0c3PVx9+31CDkJ4zgQwvNziXh2GBo7lWmaOYINpYTKjW6EP54ilQOMitkflxLELgiQhD9q8N/eEjlVgA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=YYNdSu53w0LK89+cHupHQbjOlDgHZdLpWf8Ja0UfOyI=;
 b=TqmDBJNFJy2YgeO9CtGMVkWr2mdVVz35ZVt+KDsXjSQUWcfGXYbWN6EfxiXArPfY2L2tJmYIomVPjoNArfKKkCwXhhtKQAp0Bp7mQcEHKmRlP1KcGCqYYdvzoZ4SIe6F4wxzW8gPQyWa3KsL+hvoejE+yIQesJA5k9BrV6pIH+c=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB7169.apcprd02.prod.outlook.com (2603:1096:405:8::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8069.28; Thu, 24 Oct
 2024 03:36:58 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.014; Thu, 24 Oct 2024
 03:36:58 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Thu, 24 Oct 2024 11:36:41 +0800
Message-Id: <20241024033641.517015-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SI1PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:4:1f7::10) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB7169:EE_
X-MS-Office365-Filtering-Correlation-Id: 943b54a4-f951-4cfe-8f5f-08dcf3dd1d29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?d5HXLHrjYCAvSsgayqQxfVxdalk+qKWp5RS3wlF0mfhzyxAURemubRdL5eCv?=
 =?us-ascii?Q?4J3TzH149hFWxCTJttu/IcWFCX+kDRK73Okl+GWskkoQCMzrz0QA4up6v2zU?=
 =?us-ascii?Q?MTBok5oMX+fk6FTR77Wws/DshojYQBzeoMpk4+fZ+Eh7vLL0sX/A1SQ622g7?=
 =?us-ascii?Q?Lm6IRSa8qmaPo9I4XXQzZx8Fz7Ip6resV0mQeXgkwrhFTY010LiLeuBcCwx9?=
 =?us-ascii?Q?QR5nE0+ED77K+unzKzCrj5mS81rgEguF2/7ngdofKQjpzkezQTlEfVZLnVtK?=
 =?us-ascii?Q?VHdanDO4rA9UXfZwmz3DNJ9Xhe7nIQJXT1yJzbWKEu0tf9jRQXTHxAsQrJs4?=
 =?us-ascii?Q?wcdRZdnl3G53XOJpadJGBQyzpRndaLgA50VlnmDWfcJMNPMa2zim49aJu0Rt?=
 =?us-ascii?Q?4bCo6N6mVI/F0nHHnKLqHItciIYy2i/HYJTfrzfHMm3TOnC0EpxSb+R0FKH2?=
 =?us-ascii?Q?hmWcPYCVYYSiFT+MtftqCwmswM0rqPZ34mYx2895LNpFyjT+gskG+MuDUFzo?=
 =?us-ascii?Q?/F36/fpU/FzDzdAosPqF2g2sTivrBpWUrmewKpU1K0AEYnWam26I2v1fP0eB?=
 =?us-ascii?Q?bS9yu9GSpJwCJT1V6DEYYK7OSgivQ14oNL1pbUnscVouS+VV2rWjzUVR9zj6?=
 =?us-ascii?Q?rPJfEUDvUHoTkM1cRmB0618dyRKmDGZ4PRMG+qZaYQ8UpquCuf3JBMueNNnQ?=
 =?us-ascii?Q?zB6PUzxyobQovoXYME7lVRizqLU/G3LacH4mgDSWBxk+SJRWjRwpAEbJiSof?=
 =?us-ascii?Q?uZeEaOa99at9z4bF/V6jKF2eQvtmm/eZdvolY0W4SBfVgAxe3AUn3p8KOZX6?=
 =?us-ascii?Q?Tp+Q4JXH946BHkjO7CqEwU+70nGOYlroloPKxbn2FemYI1LQNkR5cuMVIhjR?=
 =?us-ascii?Q?VQFHeJNA/VbN+oV0GhAH2ZbXH7mBQdYUhTWop9LgIZzpyR1Pfo8CEBYdije3?=
 =?us-ascii?Q?nqxmGe8qFQrYwcAhJV6xe38yE0wH0tSUQbhsIx+2X9OCJxiEyi40+PVK6BEq?=
 =?us-ascii?Q?l77j8XoPFUeuRVnE4YOCsy6g51nmsPsF94lPfTth/7OyXW3xKzPRTXlD9C2C?=
 =?us-ascii?Q?gyiZsiVwlITZORvCfA/IKZni2EE2gVdQovu2ioGqLU/lCoo2xHPBPODMjbPM?=
 =?us-ascii?Q?dkdxpq+3Hcy3SFYhkM9jynVV9pGp6VJits95bhv2y9HKsHlP4V8PtC3CZOV1?=
 =?us-ascii?Q?PT57dAJVG04C6OpKI585VL/oEnVyfE9NJQIlesBU4o8ts0gLLn1AmtoY1qim?=
 =?us-ascii?Q?sAj647ezQPu3DlB4Fg+DQ9kM9JIiT9ICQXkj8SLchdEOvAyH164l2UFLQd7Y?=
 =?us-ascii?Q?8/oPGU7HKBOb+kzB7Qt0UfHYpbte6janMI8eFxpLEOhiDdy4wzx/J02GwE95?=
 =?us-ascii?Q?H2gWP9o=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?mMOd0IU55Qj6trx3HO5dCloU4X0ertEH0Ql6duhdj6fiKwwcI61y8bO9QmeK?=
 =?us-ascii?Q?3iI7OFmCNrJQ4fwHM5tX9+eOxH1sZO427ezsY+q2HYQNsaISfZBpZo0QXsVF?=
 =?us-ascii?Q?hfjsONjJrT45UREo6Y3xHJQx3Qvu3KM5ZEBGvA3e6wbdcRTQyhTN6XzA8nXM?=
 =?us-ascii?Q?7O2IoW/BB5oCPznrU9pBliclkJRu1ldry5qZjBSRk67UvAmQ/xQx60hrNiZT?=
 =?us-ascii?Q?ju1Tt7ZP76miAVuzPDS21LLrVnq6lTQQ24cLZTcXB0wv2ear62P/KJoTPMFO?=
 =?us-ascii?Q?ZgwVtnEBe4qwPhJnJA/iTcA+1Gkf2Au0Q0Xda9GLCwXe7ar9/jk1xi2/a0e8?=
 =?us-ascii?Q?n4u5zLomDQPY/NQPC2BYrhIRBub3nG3tysOe1sZbgjqaPqYvdqBST+blYyeE?=
 =?us-ascii?Q?UOj7aRz6Gy2kG73TPA3qY383XDXiPoUjXOrF6S8U10+vjMi8k/TIESUHfvjo?=
 =?us-ascii?Q?EDQnVW8RdSVFg6hNQTz/amba9koqSKU8Jf4NurtGpJJv8sZU2WUetQGSVL18?=
 =?us-ascii?Q?EZ5ka/jIGI8d7/vIo86Yq5eTejGMkaC6Ca/ZP5Mg7WNUL+U0mLB08jbWAsJT?=
 =?us-ascii?Q?76/iVDU3bPMKJxKFIyjfVyt/dWXciXVDChcwr9JdQyDUfETwZJk3GCEAdYRe?=
 =?us-ascii?Q?uXb7ASm7NvfggYm4Fez1Psi6i6Cd3UIsQkdm1mlVRtMlZTm33yxhHOdSt/+0?=
 =?us-ascii?Q?ecOHvuKqEQf6O1SWr2Dl+ePkA8z7T4ogaSZwbhCsanuRPTdHFtnM0fPFECkS?=
 =?us-ascii?Q?mrSKj+z7ixEt7vBY6+HfZHojMOZFMVjFmvxg1Vym+7Fg3EE6jUbhg57Pp8O9?=
 =?us-ascii?Q?xNN/5rj+rfYyjroK5bFKX2gGX8KBDN0eZOV0ZMgiLjFd1e9/GBWwckgPdxdG?=
 =?us-ascii?Q?G1LcQiWv36ohVZADbJ8kHlj2SQxTU1O7w20iUJctiNX3AkmatrFgjRKSY4lO?=
 =?us-ascii?Q?h/1Dh2ZQEC0ZN7QH2vWiZWCgL1DQ7Pk0yV7J2fOeyq3GZitnVXld/scFewKp?=
 =?us-ascii?Q?4tMHY+T2LJ+0Es3jPedYs5a/cM33Dxw+d1YsgNHsmKYbZ3XoaBX0vo8XVKY/?=
 =?us-ascii?Q?Omltc/+fSw8D+dSpxyh5s4IOJgxTFjMXS9NEHPYcPlLPIxCFR6g2dLsQfeMK?=
 =?us-ascii?Q?1XtCT0Bv8ceRXOzm4D8gc5gTZIIiVxUMOdqxokZ8ttggRervca5WUL9jrRVh?=
 =?us-ascii?Q?nFTY/L7B4wm/SaJKVVn1AsXKqu8L7UR812Dh9JiBV4YLK4lpGdT0l079I5g0?=
 =?us-ascii?Q?zV2e9tX3AStaV5jtisHuwwFWXz6MdbwIACm5IZ/cfrRVl0hv9PP0LXQn0zmV?=
 =?us-ascii?Q?s6JrVd0bZ2yFREA2w0yfNrT3LNG4a7QTGiqjQE19doHZkBc0jDxDdBwcRkQ1?=
 =?us-ascii?Q?QKUVH4a61aCT+IOg13V0Sv8hDuypteHh4USVvw41TZpJWuZZNmm5zCCV54ZQ?=
 =?us-ascii?Q?sP2ECPXZ3WY+lcYtxFeZDICmfm+abWqo21JxaVZtCmVvoWzTmp1UPVHEvIYG?=
 =?us-ascii?Q?UH7CYj6D4peFnw+DR45wXqtboF2m2UIVfb3goL3/vE8SXFlV9ou1LJBYjm1A?=
 =?us-ascii?Q?zyIHdskVrcdptTG3iH7v9eZlEMXf8VbWW3Mk4E61?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 943b54a4-f951-4cfe-8f5f-08dcf3dd1d29
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2024 03:36:58.5462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Dx0pTGzA/6B3OoJLZSPNZpZovPxsmT1N+5pDz1a9Rmg5ixwUPJuz9uE6XsCKQEz5VKDiI9+mlSn46IlAo4QFIw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB7169
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  If dot or dotdot is lost, fsck tries to add a new dentry by
 f2fs_add_link(). The blkaddr of the directory inode should be passed to it
 in order to update the dirty inode at the right place. This patch [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.6 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t3ouG-0004D1-LG
Subject: [f2fs-dev] [PATCH] fsck.f2fs: fix incorrect parent blkaddr when
 adding lost dots
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

If dot or dotdot is lost, fsck tries to add a new dentry by
f2fs_add_link(). The blkaddr of the directory inode should be
passed to it in order to update the dirty inode at the right
place. This patch fixes the uninitialized `blkaddr' to avoid
corrupting f2fs image.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/fsck/fsck.c b/fsck/fsck.c
index 18587fe2c973..ab3ede191449 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -1311,7 +1311,6 @@ skip_blkcnt_fix:
 					nid, child.dot, child.dotdot);
 			if (c.fix_on) {
 				umode_t mode = le16_to_cpu(node_blk->i.i_mode);
-				block_t blkaddr;
 
 				ret = convert_inline_dentry(sbi, node_blk,
 								&ni->blk_addr);
@@ -1326,7 +1325,7 @@ skip_blkcnt_fix:
 					ret = f2fs_add_link(sbi, node_blk,
 						(const unsigned char *)name,
 						1, nid, map_de_type(mode),
-						&blkaddr, 0);
+						&ni->blk_addr, 0);
 					FIX_MSG("add missing '%s' dirent in ino: %u, pino: %u, ret:%d",
 						name, nid, child_d->p_ino, ret);
 					if (ret)
@@ -1340,7 +1339,7 @@ skip_blkcnt_fix:
 						(const unsigned char *)name,
 						2, child_d->p_ino,
 						map_de_type(mode),
-						&blkaddr, 0);
+						&ni->blk_addr, 0);
 					FIX_MSG("add missing '%s' dirent in ino: %u, pino: %u, ret:%d",
 						name, nid, child_d->p_ino, ret);
 					if (ret)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
