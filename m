Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A46178E6ED
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 31 Aug 2023 09:03:03 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1qbbhd-0006Yr-KA;
	Thu, 31 Aug 2023 07:02:54 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1qbbhV-0006Yi-45
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:02:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=h3GgzXLQ9OeN2DFITmrk+icIdimjHUIeTAXD+v2n3n4=; b=FEXfZYyqlORd+u/xrKi4Fr1ITY
 bCEmvaNO6skWQJ9rXJde7DE1Tcit3dnRvrhe9e8N++U/vwyf7fFl7MF1K4U9KQeqTBLVtMaWKDELj
 MOT4wyc8dRICu0tvoYZcyHohzKwsqu38h4Roquas4tBLej15vVj+ote2xsrHGQh1v/EA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=h3GgzXLQ9OeN2DFITmrk+icIdimjHUIeTAXD+v2n3n4=; b=R
 lqeVx7CP36DGL1RU4JUqBsubo2tCYFPYGnpA5bzCgdgg9xOFGM1Y9AniaZsAa3miVDbVSu9TUq2ZG
 uuNWjCUxQQmaZt4ZxVFxS7YUNW4RbCq95JjyjLXfMg6j5WWGmbb9+dAXRRPzFvp72AwuWb7oFLZS7
 1KPfoRIjnkWjon7M=;
Received: from mail-psaapc01on2128.outbound.protection.outlook.com
 ([40.107.255.128] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1qbbhS-0001aX-9p for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 31 Aug 2023 07:02:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Zhl3pIXlau53U6FdYu0+PArdt8qe6o/rKNFbnZ0YOp1c8SHaZksDuPEiYcTn3RP/L4bvqGLnuHWU7nOpMphoKtQkZgbTZQWxavpLoLL8bj9iRCPcjgyj/gBYcfbANI8GG3I13hvziu0tCPnFwdLwAo3Ko7qTQI/TT1Rc0w2qc7CbZz5UN8mNM3R85yjRhHJ9bgQkftVj6jLTV+XpDHNMhJN4+u2ep/BmvLCPtobgRVum9HZod3GOMoDCzinh7nGulBsNmw2o28c2bo5QihlC606EaFaP0kjCfPYCipmHmDnO5IrgiAvmb/yEw2FkIP+epPfD1e0qb+gZnnNEdVO/7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=h3GgzXLQ9OeN2DFITmrk+icIdimjHUIeTAXD+v2n3n4=;
 b=aEVVdmzZce9gE0Tg9V7SiamefVWZcDyRKOZPwSpgWp+bcszrdy/CYqskQB/Qxo/DPOfqX8QxvRaODUo3SRIokaaNIObwYnPTKS3ozOYjyL32MSCnkU9UYEH4FPlO0a1Pzxc0UlR0cwYs56dljmxIb8UPIZFuYBP5duAPQ6gorgUf76E+MnsxR/YHCiWYkY1XnAdMETxZyUOVdQCLmvGAiws7IOEi7EXr1OufOVOwzrj0blb3h6nV6RVAzxFXwCOVaaaCEtjsA8/fXWgvrRgzuxLgsjvBmzkk2hZiHfAPn6+mEMS90XZbSUYQi9fJ+CLDFcW/fxh9PDWlG/24ukYpjA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=h3GgzXLQ9OeN2DFITmrk+icIdimjHUIeTAXD+v2n3n4=;
 b=Onk0vFnFUtq5mhAB3UmfLOiMBSH/9CARD1O/mnY94Y7xNVXqIHubY/rEH7hPkTybKuN44Wb7Mf53fdnONPp7WX+JorRTnkED0DwPnK57UXiXuONHiNR6uTApY/crr2ejx2xmeETKkHNQx4E6xK2/MampuT+skVPHWlkhg9b8NAkkL6Lo48aDqWbylZb0TjRzMd2pSn4ssul2zb73eQCn1yECdQRr1NF1/HyMiKGdDRPdFzKySKn6FR+jiYZ5yvFlxfT9DMYqJNQMyJwtylylr0EO36jy+TgpbVRjsYUTsVcq8M8Tjtba5+uedeOLlU6BXKheJA2TiA0tQ1sWl9G1vQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com (2603:1096:404:fb::23)
 by TYUPR06MB6078.apcprd06.prod.outlook.com (2603:1096:400:355::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6745.20; Thu, 31 Aug
 2023 07:02:34 +0000
Received: from TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959]) by TY2PR06MB3342.apcprd06.prod.outlook.com
 ([fe80::60d3:1ef9:d644:3959%4]) with mapi id 15.20.6745.020; Thu, 31 Aug 2023
 07:02:34 +0000
To: chao@kernel.org
Date: Thu, 31 Aug 2023 01:10:11 -0600
Message-Id: <20230831071011.56116-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2P153CA0046.APCP153.PROD.OUTLOOK.COM (2603:1096:4:c6::15)
 To TY2PR06MB3342.apcprd06.prod.outlook.com
 (2603:1096:404:fb::23)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY2PR06MB3342:EE_|TYUPR06MB6078:EE_
X-MS-Office365-Filtering-Correlation-Id: 9efd342e-2ceb-4511-9886-08dba9f040a0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: lyl2YGSya2iepgZzUu1YhQZ2Oojm0DQWtkJd4NwCmOvywrQNoG8DeXt1gfU9RUUb+bckvPGBmXTCNO7GXmIupqd4FHT2SZl4FR+1V5gmOlNxPXiMUKesOYQ9VEhQrR09uXuBw3d7tQENSjGEeOdCWAWQnga+EKGM6iya61fT6kATvNZNosYwc++Zx3YF0BAvOjq5JlYC1YnWW6Pw97hhG2wS+WMBIz/cN4gcT1zIW4uXM/hstGltwBDOG56IDRnzr9Mhyh6l/Kt1q5663+97xB9oi1WQAX25+bQM3ypmEGg+mul3+sdv11Zz4HB0prR8HWF8LADacGNpArK26EiMIh9qrL1maNsgY2YgSZJCC+MTTqCPc2F98ijtIMrqPfFLvUuSzxxcq5bbsUmh0EEyF+MT/zrBw8MhCNAeqzsIa8DdXxbhMixSHJugIHD0pDOPSp20VYRhr4IJ80BMXnGEYkn3ucq8NyTOdZ9U6MI6POK/0FPAbykqCt4izHAgoECtU96akxDW4B/HvYcZ1e0oj8Oy4P5E3Erg+28iBKEL94P6/Cz78ZWdws0hr90o6Sp06GF5/XyG/wpxC6v+ciMXsfFtHSf2UitE9hY8SU+KEhfF3YZqMZUDlioyzHQVUVKr
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY2PR06MB3342.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230031)(136003)(346002)(366004)(376002)(396003)(39860400002)(186009)(451199024)(1800799009)(2906002)(66946007)(36756003)(66476007)(316002)(66556008)(6916009)(26005)(41300700001)(6486002)(107886003)(5660300002)(52116002)(6506007)(8676002)(8936002)(4326008)(1076003)(6666004)(83380400001)(2616005)(6512007)(86362001)(478600001)(38350700002)(38100700002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?R/18Yvh+V/tliK2+AgrRisnTsgy5W/JWf07I2S1qADOk9AXTtFQoEyY3sy9m?=
 =?us-ascii?Q?shIeWJt0eDcAAktJD8OKsw3NLA4f7iTqpZX2H20Wbt7ZXRKMAzmNsOv3bnz5?=
 =?us-ascii?Q?NfC/1h5prAcvPFi0EBCB4eyzX+gnllWPNAdERe1NKbvR4GeYXMYO2sm7Mj+p?=
 =?us-ascii?Q?2Qm6OKqTFjC4bMHkrLRzkMVRCpEky+acqN7o63Ze9lteITqHLy4q6IDn6KH1?=
 =?us-ascii?Q?IxJPuzkAoRG3j8GIsZvge3WrTkjUV4TNhiDYFYTrk9A6QDcpC8ZFZ2pqIoG4?=
 =?us-ascii?Q?nD4P2ppvfGUhKbsfqXspK+ym8PmtWhRQwnhOQHdypEVLH5AvA2Zt+3Y0o4go?=
 =?us-ascii?Q?Hrg5bGUgoSXH7DGfRK0BczhW0FE3OOQ+doP/Hr6hGh7mRaQ53tYYL00vUD57?=
 =?us-ascii?Q?JntDz2z0/MsDudp2evULNuX6/bnjxPjOqLUOQxFC4W87IzOA9M3Bnx5sxwuW?=
 =?us-ascii?Q?6cf6d4jA2gYqD4Teu7/QtwZYW1qvuWtWB/xbxOH6cZTZo/REcNXiJayrPekl?=
 =?us-ascii?Q?Jg92QN7XN9pkePfXbR3oAW9vSZoAJU5IQy1OtK6T9d0ZJOw5Me4CuKoA899J?=
 =?us-ascii?Q?2e/EVzPbmbpP1bK1qluSC7wdEBbjvAAmfVLtyJ6KeMZ67t0vr7XdkPF+AaFa?=
 =?us-ascii?Q?pKoD3G01JiD/GHFh07NkISNcYZVYzhtUcDZIYBo7hXWHy5p0b+nwOq9WmWL+?=
 =?us-ascii?Q?59PiSANlbWKH8iEGl6RseVmEUKJXUBCakLdmEJLYYcjv8v4dSDkW9mWLwPHw?=
 =?us-ascii?Q?YGPTz+m2DgKrIqY8ExLbbCpT2r0DcD2earu98kVT4+NwTlT25FHqUxUxrnie?=
 =?us-ascii?Q?vVO/B9nW8dO+gN7V7AY344m21z1+YurnNy4AEIwglp9Pb1vDBMnTiAmo022C?=
 =?us-ascii?Q?t5eE3r/VyNAZxGRiD+jU4n9Sf3GOPEwR0YmK9fyAgIFukuvq22AjCiqctU1w?=
 =?us-ascii?Q?bIzbsA6RDpEwKx1yUU9z4rgMDkwVRSq2hdy/lXGDHknqNJo2QuF1NzZFnW4Q?=
 =?us-ascii?Q?ON1UU/s5yz6A/pLR2nGcV6O7wYTt/qy7LeVGPiPUj0nz2gfSxVhjYpZW6w48?=
 =?us-ascii?Q?QPDqvlUXA1rcp+yZFhYyZOZ2OcBm6ixQTdInqHqbEKKQ7+9slKgc1j46n5mi?=
 =?us-ascii?Q?m73c/Zl+3K/PzKhBewKYQ9Pr+3/OLBUQnz+2MvD2bc2XE5U38dASQ8wOel4X?=
 =?us-ascii?Q?B7NHv0TRSut8J31fadfOJmg/iFUKRg9zDJ+G2gfXGokhabpNRiCuqeNiNRDt?=
 =?us-ascii?Q?4i9FYGgan1bcm28Hf9nTSl0PH4ECqzVh2OPllzPwghYwlAM2D0SLmEicUFUN?=
 =?us-ascii?Q?Qp/xg1lhsTKyAgvDh3ZxpWxZAtu1OSXTLQzi9DHQlQstxyn07gc8H1QCIoln?=
 =?us-ascii?Q?+gpgYJIjUksN4+p55XJtTqzl/747xCY0BUW1z2YDXvJXf2jzROPk+v/xNTaZ?=
 =?us-ascii?Q?BSM8T+X/vQ2v2htcft92SYiNiI3WZH/UywCsvUiB8pokcMIJabC1ESmgcuWR?=
 =?us-ascii?Q?tvzP+aH33twjiT2CLl4qfDWiSW7K45JhxnGwns9APS8xZ5ZBRVNKzCHn4sah?=
 =?us-ascii?Q?o7g25a32oGk6fAnLfZXj3oMPPD8Vi6cJb+BqEcrs?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9efd342e-2ceb-4511-9886-08dba9f040a0
X-MS-Exchange-CrossTenant-AuthSource: TY2PR06MB3342.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 31 Aug 2023 07:02:34.6668 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: F4IFVpxmm+XrGQ4g6kbLbA+ZGU64Uw5gKR0T0kbJhq8iGn4tRnEStelzDkhe1Yyymb8FFRYRcaOjso1zfQXQpQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYUPR06MB6078
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: The commit 344150999b7f ("f2fs: fix to avoid potential
 deadlock")
 only requires unplugging current->plug. Using blk_finish_plug() is unnecessary
 as it sets current->plug as NULL and prevents wb_writeb [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.128 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.128 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1qbbhS-0001aX-9p
Subject: [f2fs-dev] [PATCH v2] f2fs: replace blk_finish_plug() with
 blk_flush_plug()
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
From: Chunhai Guo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chunhai Guo <guochunhai@vivo.com>
Cc: jaegeuk@kernel.org, Chunhai Guo <guochunhai@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

The commit 344150999b7f ("f2fs: fix to avoid potential deadlock") only
requires unplugging current->plug. Using blk_finish_plug() is unnecessary
as it sets current->plug as NULL and prevents wb_writeback() from using
plug in subsequent loops. Instead, use blk_flush_plug() as a replacement.

Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/data.c | 3 +--
 fs/f2fs/node.c | 3 +--
 2 files changed, 2 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 916e317ac925..77b4a55d6d94 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3346,8 +3346,7 @@ static int __f2fs_write_data_pages(struct address_space *mapping,
 		atomic_inc(&sbi->wb_sync_req[DATA]);
 	else if (atomic_read(&sbi->wb_sync_req[DATA])) {
 		/* to avoid potential deadlock */
-		if (current->plug)
-			blk_finish_plug(current->plug);
+		blk_flush_plug(current->plug, false);
 		goto skip_write;
 	}
 
diff --git a/fs/f2fs/node.c b/fs/f2fs/node.c
index ee2e1dd64f25..c4b5717a8c1a 100644
--- a/fs/f2fs/node.c
+++ b/fs/f2fs/node.c
@@ -2126,8 +2126,7 @@ static int f2fs_write_node_pages(struct address_space *mapping,
 		atomic_inc(&sbi->wb_sync_req[NODE]);
 	else if (atomic_read(&sbi->wb_sync_req[NODE])) {
 		/* to avoid potential deadlock */
-		if (current->plug)
-			blk_finish_plug(current->plug);
+		blk_flush_plug(current->plug, false);
 		goto skip_write;
 	}
 
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
