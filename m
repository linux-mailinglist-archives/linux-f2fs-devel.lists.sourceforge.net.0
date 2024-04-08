Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 0B1F389C41A
	for <lists+linux-f2fs-devel@lfdr.de>; Mon,  8 Apr 2024 15:46:44 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1rtpKV-0003zu-Vs;
	Mon, 08 Apr 2024 13:46:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1rtpKU-0003zf-EJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 13:46:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=435CMry6b/Ur3ATLhDQLWv8TL4NW3zA/cV2qOjy1KvU=; b=H8Ud0sjazFHsAh5taLkSr+zHWQ
 VOIhS4L7rNyWawWzuu4kYhd6lIOGO2Ndh3oleczwAVDQ8RDkHzTicsw3wsUhv7I5MaJIxDMOTvT4W
 DFbAdy/b4u2h0/X/KRKbbf4Ke/ODuz3BQLhkRPLA+dvGbVAruC9XgRwUxRwQ6nC8uNNI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=435CMry6b/Ur3ATLhDQLWv8TL4NW3zA/cV2qOjy1KvU=; b=n
 UjLjRUYSrYQtCQ1OAPG70FxTGItIITYqS03AjBqf1E8/f6dys/8ID/uCII56XnNK7Nkfdzwr2UfG2
 uVzUajNUKaQyb6oaHg3+OMftCLeHcI32lc+umTBiH869SWk8VeX9RJev4vgYYFTtQnXiRaiTtqLWt
 pZuPRCshYSDtXmuY=;
Received: from mail-southeastasiaazon11021006.outbound.protection.outlook.com
 ([52.101.133.6] helo=SINPR02CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1rtpKR-00054F-H4 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 08 Apr 2024 13:46:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WgJGtSzL4NbCOG1FHyIjmskc7XcTejetJ5AmLVFdEVg0U52i4zYTdz6BUeE4q8tspGGi76OfUuEidbEJ7R+f8l6cwQtOtzJ26SazE5JetANgHQBS2Xv5zhAli6P2/DUyPXpexrgivirpoTi56Mrwn04UvNRGKIWVNFAlnOqQnAu1AJsr+fMZZYLmxQj8B6lxAV4kf1r409fTvLhLPcP0CBHuGiqlkPiOke3pP73CKDz8CdXTmePLw3cOLBks8kzS/dFKFcfH99Y0YWjJcdJZI0c7hEKCIlxI/nUJCo0uMvSiAyE5IpHRxmCkbvxOkpQtOaVRWN+ZeMDc5zYf74jU7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=435CMry6b/Ur3ATLhDQLWv8TL4NW3zA/cV2qOjy1KvU=;
 b=jesN5axLJNl6YbioKkQYE0sZXDzihSXiJNNY8r2uE+4uW2XBx++YsFeMvRHOe24g6OBLOWft6T+UC2dJgGEcuZu69Y/QVKyTlZsWVxiBvYTHom5JwSfARTdLe9Ylv0sZSVsfmFOsoJuhVp893mLDAKLNpzgEfyBE7un/slZ23bv1MIjLyPLdKvDZ+z4GSdmgg46pK464F98m0iVou2SBUOno1jgOEp7koey4CTj2a2PUzdO/tw9wuFQlo6H1Jy21a3As0tPOYvibiz+V5+eZiGCBM8wp39c0EBaVvyLmlt447sOvfHA6mcH5IkmcPx1GKbr/eO2E6YShzv1djztWVQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=435CMry6b/Ur3ATLhDQLWv8TL4NW3zA/cV2qOjy1KvU=;
 b=oAk5msECTO8FeN29t8VhYaZFQ6t7kx1fh2RAhEjTG6v3ndBIvlPwIma6617uevhmiu6mvsUR7QQMGfqa/gjUIMWEj9q1HYLRG7mMI/3W73PE25eFZh8DFYZPubhI7yjwCZxxd891Tcxkv/k7QHb0w8/p3T3ABQCh68zfipb0JUw=
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by KL1PR02MB6141.apcprd02.prod.outlook.com (2603:1096:820:be::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7409.46; Mon, 8 Apr
 2024 13:11:51 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::a99e:50b1:70a6:3afc%4]) with mapi id 15.20.7409.042; Mon, 8 Apr 2024
 13:11:51 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Mon,  8 Apr 2024 21:11:40 +0800
Message-Id: <20240408131140.4100090-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SGBP274CA0008.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b0::20)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|KL1PR02MB6141:EE_
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: gdRIlMGn6anCNc00TfnEFTwPHtV91fxeJCqRh83v7H+9/vEbakDHMHWo7PzPpv5gdeWu80O9Ws4Vx0EGoOpuG7pe6aagaclzHO7tcJOV55tpLHamV57BpzBcXMvkArLQ8Xn0ILGQ6EHG/DB2tOFT6THiGTbzz2ZNllHDnUWb8PsHHMqzT5dPP+tTcXxA2mzrtYcpnJPDTTuInMpMG5mJAmqVhi59rl1xQKJ3qyGV2BtkqozDFYVIrIoHawMhKjXbdMiZbQDJdahfLXg2SupYm58ku5RGS/gvDiG0P2P0FOYADrGFcHYzpDLqqVxZsKPLzBca+cPNDKg3em+hI3+tHWjaEe6Np8+Fc1L4np1NU0n6tyr05Pm0a+Sm8W+X3EGLYjLrupkAasZ7mdqBmg3ibxLJFgQP6c3JfiZiqQEg3mJRa6RP/Gnd2mjspDpkF9M67Z2TeA1wN2V4pLfTw11/NzSmvbg/qWa1quN65rkVPIMZs2Y5FHMfgsUb9Uz98nPlcAINpizFy802xI2mx7KHWNG4Oso4Hyq/izgVxREFNcsfQMp0J4M5bYpHFdEvSQbV4QHvT1nMOq2nktiJYIWXUyEbPCSxHChlHhC7KWdEvYnzQ3FuGTOc5YGnioOXt9RAIARaMCgmVmoiKyp/d0n6nlnWuYVCQTMNgkAoWNXGpa+wOiZjIHJtG6Os9n07oQRpHrm8VSV/ubID1pFGullxaIsDzkQmYxmXJMhtyeiNlPc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(1800799015)(366007)(52116005)(376005)(38350700005); DIR:OUT;
 SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?26pCmXp0uu7Bp8KDtTHJ2kmXAF49sz50NkEFsLPDN+FB0WCy6b2oqrlP+Wzr?=
 =?us-ascii?Q?hDAPAUtFhNk15J3nZy601doJvA8swrIkGs0rvWtaf0/HPky2PUiyiA7ytNWz?=
 =?us-ascii?Q?IK8LEQ9TpXEBxcP8JREwqoSAxg0RFwG1h6FIhaulhpkOIP7dZza/t3nhNH4k?=
 =?us-ascii?Q?HWIwcZ7eYpEJrqVe4MtXhdUq1RYzURM6Si2q1Mjk60LN+4FbVRa8R040de1r?=
 =?us-ascii?Q?c1AHLnzCXVztnKpYBn2RnXp+HGnT4ghPTTr3sgmqOqtriGsJEXaS5FTfN11H?=
 =?us-ascii?Q?XdO4TCRXNszAYSvzKi3CxgdTRhg9ng8zKEd6jOUKECirsusYi4enryybKTiP?=
 =?us-ascii?Q?hhU8UW8EjtG1eBLh9OiwzGqfaKM2iVJvISGbR1h8DZrip1Ciy58835VyjPlv?=
 =?us-ascii?Q?zXODrXE+9OtIV1LNVfmi7owweX2oVA5h0DIaFwvr8okSNsF3JBhEUde0nvJb?=
 =?us-ascii?Q?APgopLZjPPR5FXu7cuIRfi4mdGGVjS4RLmqK7bhrzJoSzAm/MtVVl90bpMok?=
 =?us-ascii?Q?YzXDOj6ulXMOyqB2yK7Mrc/zRaJkNjPNfN+xIw4Dz9xAQjIG3hvSxoEKl4rW?=
 =?us-ascii?Q?0Pc65asjkhA1NX8gcobKt6MasCP+eqhmAKmZRDNXmRSNCcz8KIlXVQSCOL5M?=
 =?us-ascii?Q?Zm4VAmPup09MZ/XOxP5Rqv6FKUPsKc7/dzJxsxeAnSFMoowidJuA2K8DOuQ4?=
 =?us-ascii?Q?U6j+ftp1dE6GWs7NEdpIIyBrCwTFn1MQ64kYOZ29fH0xrChg9+l8xVVeGNma?=
 =?us-ascii?Q?ffmcyhlqduhRl/NBOvTdRzPu/8xGPOjoXkW9ySRAnVHPu+1vGAEuJrx3KyM0?=
 =?us-ascii?Q?PT2XERmx/srn5OA9NQb5/fBkc4oGqG3+RLZnz9yEf87fz/+jZl2KnAQWObXA?=
 =?us-ascii?Q?96oE+wo6lz/2/vsvzV9xPpD2vtsH6bHHgxiR2awypVt8+y+PU1+fUxtHKeRH?=
 =?us-ascii?Q?ctZxjaXFqYHITlX0k0msRFXUhmo0ilfb+90jYLNFuxhxcmVhkciyO1triv+f?=
 =?us-ascii?Q?bwTo008gy7bZZsvmGR/NBx/83I2KgSP2isf9gMWH5l+71obr1mSKlXGgO48P?=
 =?us-ascii?Q?1VM9yEX7hSJ3toKtR2r1fPoMRd4/cJFrPDV/u9jvlQRAcPOX57FOvQtKEDbe?=
 =?us-ascii?Q?MWYhOZEGPuPeLrwn3y6hrkEI1JQbBist2HHfh3h6NIwA9VRqc1fFf6ALfcyj?=
 =?us-ascii?Q?kNJgV5B7OR57cm1T4HC4ifQn+ATVaxJoxHSWQkJi0OhamrzYug9B9xrUcht2?=
 =?us-ascii?Q?lW0H/vszpr2J6Q3ddekZDR0cVJct/NjzMPsrokMtNoD7uxN71dWQaMYLlt5R?=
 =?us-ascii?Q?Z5uPola/uydYgsMQPfjGygdPO+AXLhwjEMNz7tQusdZfC2H5C+pGPmJ255I2?=
 =?us-ascii?Q?3xKehKHMSX0f9/zxbykI5zQD20BFjTgKI5A/Vrq1BRnZ94DNdq+RJrM4Bbt4?=
 =?us-ascii?Q?dilQCRih3Xfkh/x0ob27nWCWXnn8tDls+KzPvwbnNhJ40PO4cCUWYlqpmM+X?=
 =?us-ascii?Q?rETn+Tym9i67XCqjRY3Aqgmb69BqK/CFcIpusTsBNhkN1AnMShPWugjCvWjQ?=
 =?us-ascii?Q?YcO48UT1VGlCrgwsXLaILqDY2i+GjJFfzn1OxAMQ?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f6938b8f-6f0d-4a96-6a15-08dc57cd7452
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Apr 2024 13:11:51.2890 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: G0E7Ty4R/qHF+GGJQTRmoIHrW809TwsSXbpoxVTxY+9/u8bsIl4hLMnyWqFwKimNd9ROSQo0z/NO22G5tG7i0g==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR02MB6141
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The "hot file extensions" list does not print properly.
 **Before**
 extension_count [0x 23 : 35] cold file extentsions [mp wm og jp ] [avi m4v
 m4p mkv ] [mov webm wav m4a ] [3gp opus flac gif ] [png svg webp jar ] [deb
 iso gz xz ] [zst pdf pyc ttc ] [ttf exe apk cnt ] [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [52.101.133.6 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.133.6 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1rtpKR-00054F-H4
Subject: [f2fs-dev] [PATCH] f2fs-tools: print extension list properly
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

The "hot file extensions" list does not print properly.

**Before**

extension_count                         [0x      23 : 35]
cold file extentsions
                                        [mp      wm      og      jp      ]
                                        [avi     m4v     m4p     mkv     ]
                                        [mov     webm    wav     m4a     ]
                                        [3gp     opus    flac    gif     ]
                                        [png     svg     webp    jar     ]
                                        [deb     iso     gz      xz      ]
                                        [zst     pdf     pyc     ttc     ]
                                        [ttf     exe     apk     cnt     ]
                                        [exo     odex    vdex    ]
hot_ext_count                           [0x       1 : 1]
hot file extentsions
db      ]
cp_payload                              [0x       0 : 0]

**After**

extension_count                         [0x      23 : 35]
cold file extentsions
                                        [mp      wm      og      jp      ]
                                        [avi     m4v     m4p     mkv     ]
                                        [mov     webm    wav     m4a     ]
                                        [3gp     opus    flac    gif     ]
                                        [png     svg     webp    jar     ]
                                        [deb     iso     gz      xz      ]
                                        [zst     pdf     pyc     ttc     ]
                                        [ttf     exe     apk     cnt     ]
                                        [exo     odex    vdex            ]
hot_ext_count                           [0x       1 : 1]
hot file extentsions
                                        [db                              ]
cp_payload                              [0x       0 : 0]

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/mount.c | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/fsck/mount.c b/fsck/mount.c
index b983920..8524335 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -429,20 +429,26 @@ void print_extention_list(struct f2fs_super_block *sb, int cold)
 
 	printf("%s file extentsions\n", cold ? "cold" : "hot");
 
-	for (i = start; i < end; i++) {
+	for (i = 0; i < end - start; i++) {
 		if (c.layout) {
 			printf("%-30s %-8.8s\n", "extension_list",
-						sb->extension_list[i]);
+					sb->extension_list[start + i]);
 		} else {
 			if (i % 4 == 0)
 				printf("%-30s\t\t[", "");
 
-			printf("%-8.8s", sb->extension_list[i]);
+			printf("%-8.8s", sb->extension_list[start + i]);
 
-			if (i % 4 == 4 - 1 || i == end - start - 1)
+			if (i % 4 == 4 - 1)
 				printf("]\n");
 		}
 	}
+
+	for (; i < round_up(end - start, 4) * 4; i++) {
+		printf("%-8.8s", "");
+		if (i % 4 == 4 - 1)
+			printf("]\n");
+	}
 }
 
 static void DISP_label(const char *name)
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
