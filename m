Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id CV1EDedMBGrhGwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 12:05:27 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 38AA1531192
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 13 May 2026 12:05:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RoCUitp2Yt3GJLZu0wmKFxA7wIDQgVAgY6KCK4j+z+A=; b=N4gmmO3a7B60q9EbOdDULUY0Bn
	v/sVUn4YehzJXBUzDV1gYsBrlHdSUS2ZNnvBw0j0/9uTLzI1TqooDu65/aZ52YZfRz+EJJWMDrYTL
	8Ey+zaK6BxHSebkw1NX815iZzJ4Vu+ZCL6D4IIcm3MpeVNURG6MIaouGrD3K0C7i/ya8=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wN6Sv-0007Jj-To;
	Wed, 13 May 2026 10:05:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wN6Sr-0007J5-94
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 10:05:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Cx3PtBAGYvPLmnhbJ5L2FS5TvaxHzPmXyvdJ7BU6bYk=; b=c+x62613nXOW/wMMDx5Bb0bZ3t
 /UOoN4ooLpKG3IFWl88a3ZmeA1TPTKeUF2fi6SEnO8Shcc5eXWfWKtmlVvUD9ZKGwPJ4lMvhIn3y+
 TduoqvKigtkhBf63it0kfO00K+E5fSXe0V7cF06zrJ+BEo8ts9v9q0T2xNhJiXjEUWpg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Cx3PtBAGYvPLmnhbJ5L2FS5TvaxHzPmXyvdJ7BU6bYk=; b=eKS5R5+sVVucxGvAVurjSbes1q
 qBGd5CB615jp4y4a/0bp7xrFQ6n+jr9y0YyWhIv8Bs8RUT3Cvmjg4nvR2W34JTji+uYKCr9jDROuK
 pyt0O1b7QPbyPsol2vgHGHbaE23s4w3y97s/t0RyJvcUvCRmH1oxobAK5BhJ8morbKmw=;
Received: from mail-japaneastazon11012009.outbound.protection.outlook.com
 ([52.101.126.9] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wN6Sb-00060O-Qt for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 13 May 2026 10:05:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=i+lHxDlKcR3SERfk5ha6GXKQbMkGXYZH6J97z6wMQbrTtAR6PyNhpplb7tbnx5LT9AcdtVWHuTcB5Yi6pOAtuvNr0AWSnlSNLM9zYQ6y52fMiE21YwxhXAqXj0fwjuWl7ckJ1U3O2Tqj/fRsi/dKiSBfWUiUVR21YDJou4BMKE6z3PVwilVF4AzHh9CJxKz0+JQRGs3PHrCC1c91seYZ+MjPFp9+YzFY6wNbPkUDLKGzutH4cvU45C6nXZR9emmVxixE1BqyQVLicRhZXrne/pBAafKfZz5wT/fwgKgtEcL+PReFU8cEhZktGJTqndHWOFGqGqptEQj3+SiKCbiYjw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Cx3PtBAGYvPLmnhbJ5L2FS5TvaxHzPmXyvdJ7BU6bYk=;
 b=gXsb7ZVezRI/BC5vNS32x1KolYu8t1uxpdcxKsoPgCmzhmGD324QEbZ77yNvfi0b8H14erJ66tD5Lz6QZ4Thb1WSIxeSf7VC6tQdi/lrofylKYRrJ6ID4YPoZ1+frIHe2zOyHDOQlUJCx+q6j5duIGTbqlpZsI+IrczJjMlzyRMHLeMPNNa+hxX5GA2vLTz6EwUe/SKAShkA3BjpbRRBuq9Hsd0IUyiPzcZX1ytP+tbUqKcECTXlG/v+0Moe7HBhhiFLpx774RaGwcoWJH4ZBNXvu1swwnp+DYPdkveHTYKLeVdeeU8HqXgRnuSoG9pN61LQ62LIEUM+vsKWrBM49Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Cx3PtBAGYvPLmnhbJ5L2FS5TvaxHzPmXyvdJ7BU6bYk=;
 b=WPXxe4hMdSVfLPp0CQXqR1MJA094j26oq6VrbSRCkI7nwiv5D0Y7wYEMi724ZTr2GBDA/DcFnr8iTfOOdBIngTMOPSSRtSlPyBMnnlp41sMKmtnh3dm7AuEDTxi7S5RbdIsHS8n4Uevp6eo5hnUo6A+Dmdc5Uor19XD1patSK/2niGVy6BomfBSKvOstnc/sV/G3ItSqUhe/SH7fToj8XVgtdXtIJe/XB3mIzXCR3W2ac34lMB5hRrp7uc9U5jmHJSy9qIPMBtS+uNpaDW1lTYFVxniXvWbZmtEIzCzXD2i5qvs/OAol9Btewc8ZLPrNF95mzeMRQdvdGqlP93wdCQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB5884.apcprd06.prod.outlook.com (2603:1096:820:dd::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9913.11; Wed, 13 May
 2026 10:04:50 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.20.9913.009; Wed, 13 May 2026
 10:04:50 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list)
Date: Wed, 13 May 2026 18:04:29 +0800
Message-Id: <20260513100431.299904-3-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260513100431.299904-1-liaoyuanhong@vivo.com>
References: <20260513100431.299904-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TP0P295CA0031.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::12) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB5884:EE_
X-MS-Office365-Filtering-Correlation-Id: 59d7c160-7e2e-4e18-04d3-08deb0d71200
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|22082099003|18002099003|11063799003|3023799003|56012099003|38350700014;
X-Microsoft-Antispam-Message-Info: i5lxO3cLPfegMoT1h6SUp+h/tBNgOcZVqGd/ecJfVz7m7uaFafunBBR7kFtG627DqX6RYLRuD4yxMvWWQcGphMvO9eeQXYI23s4EerVgwCOHAmwyo/2lWQYtXEAR1s4rt8uxj9wSnCODAFWaVNkBinH86P8iSOw4ViKz/9wn8qzXlEI2C0ui1ooZqhf3vwWPY9vWPS3Tfdl1ld+9bCRfnlEUYQ4Cp4Af4rru1Xi/1/VUpNs0ip/BetZk8Nj28i7dV4x0dzjgNTgB800zPQhLuVBCErciQ1MsNv+FZ3k5bef0oi4ycLDnr2KC8hnmKil6CJouR/CHevtNL3JV8U5FD0A/Sphkb9KC9lG9AmwgKb+F/LB3V6Dfld5aRSBu+leWsWl6212dgiHdVzFJVrTUaP3hUtUP+sacoJP83Rt7W/ygj6Ws8e2ve27a3uPeeJkY96Fk5rrZAl/YgzazxAOUljUxVM9/bs9FscWvxN7+9iyEIpcWTEZwjQnwVWAB4v2X02qDEDW98ahWzKqkhyQFdUHI3tR3eSsXSwmkrheNTzYekHkNllo82kRi3nHpBTsBIcEZEGnL2JTrBx19MehCRZyjffRZa76/Zk+Kx89a4JgyhwkfC/3VmryzCJtQFbbMVVsgJTQwfEU41JppxMzhARv7Ll3nqUONErqB/GxDxuwipF5YT6RVG4dqJlDPDx35p81dIqkYUtSfN22NZlfLYiUkgwmAL01eWvLJ87Jea3Q5ENrdDGIf6ZYJrFDwP9IH
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(22082099003)(18002099003)(11063799003)(3023799003)(56012099003)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?rjRBTXDpDMNNfwKEKWicSVs++48EwcWKCN6K2EXvZLZ8M2jBkwdySATXV21E?=
 =?us-ascii?Q?Nb3nbtCprVNQH4byiXoP7lf63BnJo2PQBwyJrJdDGchMV3dQUhpXrx12lS7J?=
 =?us-ascii?Q?zH0MNyBa3D9zY4dgbnohUk98BttWIR+J+WzYA84xfcVZG/RbZaNtvd/lI2cV?=
 =?us-ascii?Q?2fwkx3h+dKmzTjRmy/pr8UhpGhH/TPbQXAIjZQlDF+7CWO3fs0QsvzSlvD6v?=
 =?us-ascii?Q?OsGaYIzCzMtQtgvSRbQqviPZ2Nv8w0QKY+lzmEhyqN5h1sWXGmpkrRAQh+lF?=
 =?us-ascii?Q?JBcpRl/LvwRHBMo3RB/S6plrIJTowTNQqrjF7o6zoWcgZmXPRkbBCGwTIKBL?=
 =?us-ascii?Q?EJ5rXGJl0IPDr2OsNrEW8ZdsHhbscXraPtcJoBkpKq3QmoHiCtBAqscUi1B2?=
 =?us-ascii?Q?oHf+A+hBJT+FDWo+/ccr++FJ7jw9WI/LasRjASSzEeBvg6zo9T/z/umoygBU?=
 =?us-ascii?Q?5U/Oh3yzfTGI61h9dpQHVFN4VOLd2n9LRUPnakFor9M1eJe8h4L+GIjwDFtK?=
 =?us-ascii?Q?RbO8ovdlkjBjZefcV0Gs2APDtbw+u2xhJZmhHGMfhETfrpGqR7EDcl8tzUfn?=
 =?us-ascii?Q?Q4ZRAYoju29PWzL3gKl3ImKlzXGzs64qRcIjNWL22rr5u1bnzFh0BH8KDIeD?=
 =?us-ascii?Q?6FseXJUmaO3DKM5Ir3yYLwzbjRslcN3VDJ59+rHaFAYpB+h/uhREzZiesjmp?=
 =?us-ascii?Q?c3dPk8iDozENpl+zwL8HzU1H5CycV/nmHpei++WMrD08Tx1PljoexP9bwpIz?=
 =?us-ascii?Q?LFN4x+cAyLpfl0K6ubE7IRAhQMP+47/GfTi0LD3hxkLuofKN1kjYjTblPRjn?=
 =?us-ascii?Q?4tMHdjHytkC3KWEdW3TQQSqGCMBeYvyqmfZwlX4LdZel66bW6Q4YAyMThS+e?=
 =?us-ascii?Q?xVoay1r0Cu7pZgWmbhbpoguLZp2f3a9dQIKpunv3//SJVte3i8JS4pRpnBlB?=
 =?us-ascii?Q?f7phHomijgWpzNGrKSXKk2k0hzC56YPrUyUzLqrarkRwiHowxZbQV4nP3Fbu?=
 =?us-ascii?Q?vpPCO1d3hnWEoOdt+ml+jWHYmBpfKefmdjwnLdSg5iOE/MtozSC3MqGjgnYW?=
 =?us-ascii?Q?RhlqOXOj3wLBG2tiiD6onKSc19CitKtMrpfqlfc7layY+C1p1OEQRv6/hxae?=
 =?us-ascii?Q?IcHpsTATt7T6zEuAUA2IIZ/C6XSwRhdz2WWrHDzPzz0VcdRvaDziW8Bb7oKq?=
 =?us-ascii?Q?2Ci590V4X+BcCr0J+GiBM2v/EgkG9DkNX3QsfVTDcs4tXAN+7Pts1gl9TmFI?=
 =?us-ascii?Q?hR1Q6jwvjk7fmhtsk0fEV3Yo+7dOkbv0E3Dpru+BIb74pEZplmwyhOnAOQ+F?=
 =?us-ascii?Q?XUutSOgj2WEhZ+jQdqVeyEf06nrihrWsDPEkE1AXxlbWi4fnnqslHBXCw9Di?=
 =?us-ascii?Q?iD1+vKwxODxfmBe/r3WIy0sJV6R4dm4zy8gfNqLJCvdKG400OncnVKqLfEXJ?=
 =?us-ascii?Q?X/tg+eOylztFWKs06BuAdSOW5aLFSsVdzrVDlhHt+dM92x2U3R4v9TYfGiuc?=
 =?us-ascii?Q?7aBCFiNarxlx1bYudxrowawLU0nojyNu+nGkeaTE6NGeJCTGdfGSF3FuvPlK?=
 =?us-ascii?Q?KbVDSqtanYrq9tmlL9yoajoSX65cf2S6OExIrJI2BMX5NB/qFxVPaL2VImx7?=
 =?us-ascii?Q?MzJ4ErEOlVS0bDvTmGVbmw3O/d6ykeX+vqLDo1WyEDeYGQYoPn10puJjctj4?=
 =?us-ascii?Q?7Pqn5DoRvqTxm5Kq7CcqO5yxbZMAQrNUyz5CjgeJ/9IHRfx31/DPTCnDl2DY?=
 =?us-ascii?Q?ylc7uYb2eQ=3D=3D?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 59d7c160-7e2e-4e18-04d3-08deb0d71200
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 May 2026 10:04:50.4029 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gXMEiio67Wshs6j32XzqI62fYGhRAKFuzW3SPG1Y+LVnDqvh2kCM7mnBLex8bblB1aJnBD1ZDppUtI+cPTgFUQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB5884
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  From: Liao Yuanhong <liaoyuanhong@vivo.com> F2FS normally
 disables inline data for encrypted regular files because inline data is stored
 in the inode block and does not pass through the regular fscrypt data I/O
 path. This wastes space for small [...] 
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.9 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 1.0 HK_RANDOM_FROM         From username looks random
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1wN6Sb-00060O-Qt
Subject: [f2fs-dev] [PATCH 2/3] f2fs: support encrypted inline data
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
From: LiaoYuanhong-vivo via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 38AA1531192
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:email,vivo.com:mid,vivo.com:replyto];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	RCPT_COUNT_FIVE(0.00)[5];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com]
X-Rspamd-Action: no action

From: Liao Yuanhong <liaoyuanhong@vivo.com>

F2FS normally disables inline data for encrypted regular files because
inline data is stored in the inode block and does not pass through the
regular fscrypt data I/O path.  This wastes space for small encrypted
files on filesystems that otherwise use inline_data, including devices
that enable blk-crypto for encrypted file contents.

Add encrypted inline data support for encrypted regular files.  Inline
payloads are decrypted into page-cache plaintext on read and encrypted
before being copied back into the inode block.

The inline read path decrypts the inode payload through a temporary page.
The inline write path encrypts page-cache plaintext before storing it back
into the inode block.

Update the inline-data size checks to use the encrypted inline capacity,
since the stored payload is rounded to the fscrypt contents alignment.  If
an encrypted inline-data file is truncated from a non-zero offset, convert
it to normal data blocks first and then use the normal truncate path.

Only the inline payload is encrypted in software.  These files are small
enough to remain in the inode block, so the performance difference
between hardware and software crypto is expected to be small compared to
the space saved by retaining inline data.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>

---
 fs/f2fs/Kconfig  |  14 ++++++
 fs/f2fs/data.c   |   8 ++--
 fs/f2fs/f2fs.h   |  37 ++++++++++++++-
 fs/f2fs/file.c   |  24 +++++++++-
 fs/f2fs/inline.c | 119 +++++++++++++++++++++++++++++++++++++++++------
 fs/f2fs/super.c  |  12 +++++
 fs/f2fs/sysfs.c  |   8 ++++
 7 files changed, 202 insertions(+), 20 deletions(-)

diff --git a/fs/f2fs/Kconfig b/fs/f2fs/Kconfig
index 5916a02fb46d..9e31923b8df8 100644
--- a/fs/f2fs/Kconfig
+++ b/fs/f2fs/Kconfig
@@ -92,6 +92,20 @@ config F2FS_FAULT_INJECTION
 
 	  If unsure, say N.
 
+config F2FS_FS_ENCRYPTED_INLINE_DATA
+	bool "F2FS encrypted inline data support"
+	depends on F2FS_FS && FS_ENCRYPTION_INLINE_CRYPT
+	help
+	  Allow encrypted regular files to keep inline data inside the inode
+	  while encrypting that inode-managed payload in software.
+
+	  This does not change normal data block encryption.  Normal data
+	  blocks continue to use the existing fscrypt path, such as blk-crypto
+	  when inline encryption is enabled.
+
+	  Filesystems carrying the encrypted_inline_data incompat feature
+	  require this option in order to be mounted correctly.
+
 config F2FS_FS_COMPRESSION
 	bool "F2FS compression feature"
 	depends on F2FS_FS
diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 657fd5986c73..9371ffa7c96d 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3700,7 +3700,7 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 
 	/* f2fs_lock_op avoids race between write CP and convert_inline_page */
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len > MAX_INLINE_DATA(inode))
+		if (pos + len > f2fs_max_inline_data(inode))
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, &lc, flag);
 		locked = true;
@@ -3720,8 +3720,10 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 	set_new_dnode(&dn, inode, ifolio, ifolio, 0);
 
 	if (f2fs_has_inline_data(inode)) {
-		if (pos + len <= MAX_INLINE_DATA(inode)) {
-			f2fs_do_read_inline_data(folio, ifolio);
+		if (pos + len <= f2fs_max_inline_data(inode)) {
+			err = f2fs_do_read_inline_data(folio, ifolio);
+			if (err)
+				goto out;
 			set_inode_flag(inode, FI_DATA_EXIST);
 			if (inode->i_nlink)
 				folio_set_f2fs_inline(ifolio);
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 832b2f8beb11..0a2d75baf23e 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -276,6 +276,7 @@ struct f2fs_mount_info {
 #define F2FS_FEATURE_RO				0x00004000
 #define F2FS_FEATURE_DEVICE_ALIAS		0x00008000
 #define F2FS_FEATURE_PACKED_SSA			0x00010000
+#define F2FS_FEATURE_ENCRYPTED_INLINE_DATA	0x00020000
 
 #define __F2FS_HAS_FEATURE(raw_super, mask)				\
 	((raw_super->feature & cpu_to_le32(mask)) != 0)
@@ -4502,7 +4503,7 @@ extern struct kmem_cache *f2fs_inode_entry_slab;
 bool f2fs_may_inline_data(struct inode *inode);
 bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio);
 bool f2fs_may_inline_dentry(struct inode *inode);
-void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
+int f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio);
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 		u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
@@ -4595,6 +4596,39 @@ static inline bool f2fs_encrypted_file(struct inode *inode)
 	return IS_ENCRYPTED(inode) && S_ISREG(inode->i_mode);
 }
 
+static inline bool f2fs_sb_has_encrypted_inline_data(struct f2fs_sb_info *sbi);
+
+static inline bool f2fs_uses_encrypted_inline_data(struct inode *inode)
+{
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	/*
+	 * When the filesystem allows encrypted inline data, inline payloads
+	 * in encrypted regular files are interpreted as ciphertext.
+	 */
+	return f2fs_sb_has_encrypted_inline_data(F2FS_I_SB(inode)) &&
+	       f2fs_encrypted_file(inode);
+#else
+	return false;
+#endif
+}
+
+static inline unsigned int f2fs_max_inline_data(struct inode *inode)
+{
+	unsigned int max_bytes = MAX_INLINE_DATA(inode);
+
+	/*
+	 * Encrypted inline data is rounded up to the fscrypt contents
+	 * alignment before being stored back into the inode.  This is an
+	 * on-disk layout constraint, so it must not depend on whether the
+	 * inode's key has been prepared yet.
+	 */
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	if (f2fs_uses_encrypted_inline_data(inode))
+		max_bytes = round_down(max_bytes, FSCRYPT_CONTENTS_ALIGNMENT);
+#endif
+	return max_bytes;
+}
+
 static inline void f2fs_set_encrypted_inode(struct inode *inode)
 {
 #ifdef CONFIG_FS_ENCRYPTION
@@ -4827,6 +4861,7 @@ F2FS_FEATURE_FUNCS(compression, COMPRESSION);
 F2FS_FEATURE_FUNCS(readonly, RO);
 F2FS_FEATURE_FUNCS(device_alias, DEVICE_ALIAS);
 F2FS_FEATURE_FUNCS(packed_ssa, PACKED_SSA);
+F2FS_FEATURE_FUNCS(encrypted_inline_data, ENCRYPTED_INLINE_DATA);
 
 #ifdef CONFIG_BLK_DEV_ZONED
 static inline bool f2fs_zone_is_seq(struct f2fs_sb_info *sbi, int devi,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 71385ca4163d..ec243bb9039b 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -825,12 +825,32 @@ int f2fs_do_truncate_blocks(struct inode *inode, u64 from, bool lock)
 	}
 
 	if (f2fs_has_inline_data(inode)) {
+		if (f2fs_uses_encrypted_inline_data(inode) && from) {
+			f2fs_folio_put(ifolio, true);
+			if (lock)
+				f2fs_unlock_op(sbi, &lc);
+
+			err = f2fs_convert_inline_inode(inode);
+
+			if (lock)
+				f2fs_lock_op(sbi, &lc);
+			if (err)
+				goto out;
+
+			ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
+			if (IS_ERR(ifolio)) {
+				err = PTR_ERR(ifolio);
+				goto out;
+			}
+			goto truncate_blocks;
+		}
 		f2fs_truncate_inline_inode(inode, ifolio, from);
 		f2fs_folio_put(ifolio, true);
 		truncate_page = true;
 		goto out;
 	}
 
+truncate_blocks:
 	set_new_dnode(&dn, inode, ifolio, NULL, 0);
 	err = f2fs_get_dnode_of_data(&dn, free_from, LOOKUP_NODE_RA);
 	if (err) {
@@ -1147,7 +1167,7 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 	if (attr->ia_valid & ATTR_SIZE) {
 		loff_t old_size = i_size_read(inode);
 
-		if (attr->ia_size > MAX_INLINE_DATA(inode)) {
+		if (attr->ia_size > f2fs_max_inline_data(inode)) {
 			/*
 			 * should convert inline inode before i_size_write to
 			 * keep smaller than inline_data size with inline flag.
@@ -5007,7 +5027,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (f2fs_has_inline_data(inode)) {
 		/* If the data will fit inline, don't bother. */
-		if (pos + count <= MAX_INLINE_DATA(inode))
+		if (pos + count <= f2fs_max_inline_data(inode))
 			return 0;
 		ret = f2fs_convert_inline_inode(inode);
 		if (ret)
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index 099f72089701..6bcf103584ce 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -21,7 +21,7 @@ static bool support_inline_data(struct inode *inode)
 		return false;
 	if (!S_ISREG(inode->i_mode) && !S_ISLNK(inode->i_mode))
 		return false;
-	if (i_size_read(inode) > MAX_INLINE_DATA(inode))
+	if (i_size_read(inode) > f2fs_max_inline_data(inode))
 		return false;
 	return true;
 }
@@ -31,6 +31,9 @@ bool f2fs_may_inline_data(struct inode *inode)
 	if (!support_inline_data(inode))
 		return false;
 
+	if (f2fs_uses_encrypted_inline_data(inode))
+		return fscrypt_inode_supports_data_unit_inplace(inode);
+
 	return !f2fs_post_read_required(inode);
 }
 
@@ -65,7 +68,9 @@ bool f2fs_sanity_check_inline_data(struct inode *inode, struct folio *ifolio)
 	 * been synchronized to inmem fields.
 	 */
 	return (S_ISREG(inode->i_mode) &&
-		(file_is_encrypt(inode) || file_is_verity(inode) ||
+		((file_is_encrypt(inode) &&
+		  !f2fs_sb_has_encrypted_inline_data(F2FS_I_SB(inode))) ||
+		 file_is_verity(inode) ||
 		(F2FS_I(inode)->i_flags & F2FS_COMPR_FL)));
 }
 
@@ -80,22 +85,60 @@ bool f2fs_may_inline_dentry(struct inode *inode)
 	return true;
 }
 
-void f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
+int f2fs_do_read_inline_data(struct folio *folio, struct folio *ifolio)
 {
 	struct inode *inode = folio->mapping->host;
+	unsigned int len = min_t(loff_t, i_size_read(inode),
+				 f2fs_max_inline_data(inode));
 
 	if (folio_test_uptodate(folio))
-		return;
+		return 0;
 
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
-	folio_zero_segment(folio, MAX_INLINE_DATA(inode), folio_size(folio));
+	if (f2fs_uses_encrypted_inline_data(inode)) {
+		struct page *tmp_page;
+		void *kaddr;
+		int err;
+
+		folio_zero_segment(folio, 0, folio_size(folio));
 
-	/* Copy the whole inline data block */
-	memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
-		       MAX_INLINE_DATA(inode));
+		/*
+		 * Decrypt through a temporary page because inline data occupies
+		 * only a byte range inside the inode folio.
+		 */
+		tmp_page = alloc_page(GFP_NOFS | __GFP_ZERO);
+		if (!tmp_page)
+			return -ENOMEM;
+
+		len = round_up(len, FSCRYPT_CONTENTS_ALIGNMENT);
+		if (len) {
+			memcpy_to_page(tmp_page, 0, inline_data_addr(inode, ifolio),
+				       len);
+			err = fscrypt_decrypt_data_unit_inplace(inode, tmp_page,
+								len, 0, 0);
+			if (err) {
+				__free_page(tmp_page);
+				return err;
+			}
+		}
+
+		kaddr = kmap_local_page(tmp_page);
+		memcpy_to_folio(folio, 0, kaddr,
+				min_t(loff_t, i_size_read(inode),
+				      f2fs_max_inline_data(inode)));
+		kunmap_local(kaddr);
+		__free_page(tmp_page);
+	} else {
+		folio_zero_segment(folio, MAX_INLINE_DATA(inode),
+				   folio_size(folio));
+		/* Copy the whole inline data block */
+		memcpy_to_folio(folio, 0, inline_data_addr(inode, ifolio),
+				MAX_INLINE_DATA(inode));
+	}
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
+	return 0;
 }
 
 void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
@@ -119,6 +162,7 @@ void f2fs_truncate_inline_inode(struct inode *inode, struct folio *ifolio,
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct folio *ifolio;
+	int ret = 0;
 
 	ifolio = f2fs_get_inode_folio(F2FS_I_SB(inode), inode->i_ino);
 	if (IS_ERR(ifolio)) {
@@ -134,7 +178,13 @@ int f2fs_read_inline_data(struct inode *inode, struct folio *folio)
 	if (folio->index)
 		folio_zero_segment(folio, 0, folio_size(folio));
 	else
-		f2fs_do_read_inline_data(folio, ifolio);
+		ret = f2fs_do_read_inline_data(folio, ifolio);
+
+	if (!folio->index && ret) {
+		f2fs_folio_put(ifolio, true);
+		folio_unlock(folio);
+		return ret;
+	}
 
 	if (!folio_test_uptodate(folio))
 		folio_mark_uptodate(folio);
@@ -186,7 +236,9 @@ int f2fs_convert_inline_folio(struct dnode_of_data *dn, struct folio *folio)
 
 	f2fs_bug_on(F2FS_F_SB(folio), folio_test_writeback(folio));
 
-	f2fs_do_read_inline_data(folio, dn->inode_folio);
+	err = f2fs_do_read_inline_data(folio, dn->inode_folio);
+	if (err)
+		return err;
 	folio_mark_dirty(folio);
 
 	/* clear dirty state */
@@ -267,6 +319,8 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
 	struct folio *ifolio;
+	void *inline_addr;
+	int err = 0;
 
 	ifolio = f2fs_get_inode_folio(sbi, inode->i_ino);
 	if (IS_ERR(ifolio))
@@ -280,8 +334,44 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	f2fs_bug_on(F2FS_I_SB(inode), folio->index);
 
 	f2fs_folio_wait_writeback(ifolio, NODE, true, true);
-	memcpy_from_folio(inline_data_addr(inode, ifolio),
-			 folio, 0, MAX_INLINE_DATA(inode));
+	inline_addr = inline_data_addr(inode, ifolio);
+
+	if (f2fs_uses_encrypted_inline_data(inode)) {
+		struct page *tmp_page;
+		void *kaddr;
+		unsigned int len = min_t(loff_t, i_size_read(inode),
+					 f2fs_max_inline_data(inode));
+
+		tmp_page = alloc_page(GFP_NOFS | __GFP_ZERO);
+		if (!tmp_page) {
+			err = -ENOMEM;
+			goto out;
+		}
+
+		len = round_up(len, FSCRYPT_CONTENTS_ALIGNMENT);
+		if (len) {
+			kaddr = kmap_local_page(tmp_page);
+			memcpy_from_folio(kaddr, folio, 0,
+					  min_t(loff_t, i_size_read(inode),
+						f2fs_max_inline_data(inode)));
+			kunmap_local(kaddr);
+			err = fscrypt_encrypt_data_unit_inplace(inode, tmp_page,
+								len, 0, 0);
+		}
+		if (!err) {
+			memset(inline_addr, 0, MAX_INLINE_DATA(inode));
+			if (len) {
+				kaddr = kmap_local_page(tmp_page);
+				memcpy(inline_addr, kaddr, len);
+				kunmap_local(kaddr);
+			}
+		}
+		__free_page(tmp_page);
+		if (err)
+			goto out;
+	} else {
+		memcpy_from_folio(inline_addr, folio, 0, MAX_INLINE_DATA(inode));
+	}
 	folio_mark_dirty(ifolio);
 
 	f2fs_clear_page_cache_dirty_tag(folio);
@@ -290,8 +380,9 @@ int f2fs_write_inline_data(struct inode *inode, struct folio *folio)
 	set_inode_flag(inode, FI_DATA_EXIST);
 
 	folio_clear_f2fs_inline(ifolio);
+out:
 	f2fs_folio_put(ifolio, true);
-	return 0;
+	return err;
 }
 
 int f2fs_recover_inline_data(struct inode *inode, struct folio *nfolio)
@@ -826,7 +917,7 @@ int f2fs_inline_data_fiemap(struct inode *inode,
 			return PTR_ERR(ifolio);
 		f2fs_folio_wait_writeback(ifolio, NODE, true, true);
 	}
-	ilen = min_t(size_t, MAX_INLINE_DATA(inode), i_size_read(inode));
+	ilen = min_t(size_t, f2fs_max_inline_data(inode), i_size_read(inode));
 	if (start >= ilen)
 		goto out;
 	if (start + len < ilen)
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index c6afdbd6e1cd..9eddcde7939c 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -1549,6 +1549,18 @@ static int f2fs_check_opt_consistency(struct fs_context *fc,
 		return -EINVAL;
 	}
 
+	if (f2fs_sb_has_encrypted_inline_data(sbi)) {
+		if (!IS_ENABLED(CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA)) {
+			f2fs_err(sbi,
+				 "encrypted_inline_data requires CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA");
+			return -EINVAL;
+		}
+		if (!f2fs_sb_has_encrypt(sbi)) {
+			f2fs_err(sbi, "encrypted inline_data requires encryption feature");
+			return -EINVAL;
+		}
+	}
+
 	/*
 	 * The BLKZONED feature indicates that the drive was formatted with
 	 * zone alignment optimization. This is optional for host-aware
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index 665687244c93..600eaee75926 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -1399,6 +1399,9 @@ F2FS_FEATURE_RO_ATTR(pin_file);
 F2FS_FEATURE_RO_ATTR(linear_lookup);
 #endif
 F2FS_FEATURE_RO_ATTR(packed_ssa);
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+F2FS_FEATURE_RO_ATTR(encrypted_inline_data);
+#endif
 F2FS_FEATURE_RO_ATTR(fserror);
 
 #define ATTR_LIST(name) (&f2fs_attr_##name.attr)
@@ -1567,6 +1570,9 @@ static struct attribute *f2fs_feat_attrs[] = {
 	BASE_ATTR_LIST(linear_lookup),
 #endif
 	BASE_ATTR_LIST(packed_ssa),
+#ifdef CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
+	BASE_ATTR_LIST(encrypted_inline_data),
+#endif
 	BASE_ATTR_LIST(fserror),
 	NULL,
 };
@@ -1604,6 +1610,7 @@ F2FS_SB_FEATURE_RO_ATTR(compression, COMPRESSION);
 F2FS_SB_FEATURE_RO_ATTR(readonly, RO);
 F2FS_SB_FEATURE_RO_ATTR(device_alias, DEVICE_ALIAS);
 F2FS_SB_FEATURE_RO_ATTR(packed_ssa, PACKED_SSA);
+F2FS_SB_FEATURE_RO_ATTR(encrypted_inline_data, ENCRYPTED_INLINE_DATA);
 
 static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_encryption),
@@ -1622,6 +1629,7 @@ static struct attribute *f2fs_sb_feat_attrs[] = {
 	ATTR_LIST(sb_readonly),
 	ATTR_LIST(sb_device_alias),
 	ATTR_LIST(sb_packed_ssa),
+	ATTR_LIST(sb_encrypted_inline_data),
 	NULL,
 };
 ATTRIBUTE_GROUPS(f2fs_sb_feat);
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
