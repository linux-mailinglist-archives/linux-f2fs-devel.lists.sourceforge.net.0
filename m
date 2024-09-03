Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D61E19697FE
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:56:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPLJ-0007N2-1a;
	Tue, 03 Sep 2024 08:56:53 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPLC-0007Kq-1Z
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=; b=R6ScJudTPDnZXv/w9qn61QRFOk
 1+nqBOaI0bdi7znLYDDFR463hSuVNQWC1AuOTQtsW7wpleOObUoH+QTkeKUoKjBLY6Lk3LVRwwkmI
 G4KQu2niSfLtZGEXzzEADsb8Mp44tlIaLCFu6e/9YSKKrgzwxBw4VEktUkgVnV0txOzY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=; b=WugM7dhJfPP9iKV1hB5QC06zhM
 CgC7k75AfTgfFXEMKh2FuHyEyzvqYHZIxqF61ieq0Yle/VF+dHk/AdIUwiLSjCDvMKa6atCX6GGVD
 v2XVyZzdvjviiP+ZV5pTvdRkyUSiLCWxV1uaNYOwHr3vYv66RMv25m2x2Fxwgcu5tJco=;
Received: from mail-sgaapc01on2047.outbound.protection.outlook.com
 ([40.107.215.47] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPLC-0001Xc-5W for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=cDfiHzGfqCLnnHvhCRPzglGBxNV9YFdtLLkK0wrIgiF5FfcPByaa3NcCcxPlEYuqoE1SAUhJP+cRIC6A1rL5LP1behD7eZ7nIrwx17AXMLSEV/deL/jsOzLwrHncUC/p22s1a1RqP4TO6TM3IJUqgzUlw2tv3WhNSvYMSAJRYy0aia+QZpA03V9vphtOVHmKb++2EbvQIGWVDz462a8CCv7zKCxXfOs8h0+G6XWk/5/J1wZ6YGuXgK7TlKMy02N99mZbs6uuyZRRrz1Xk0F+LyhMmANduUZg1d6FoIrj2Y0EGnsA+wmvIvj2ZJTOXYCgh5m8rFoZqRZ8DHLN38Nc8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=;
 b=kZNAuPooEO2Klba9tmUFz9z0MoJv9CxECv++IxlDM7CCwKr/2X3SnR7MxjUOecfCe9w9iBL+2Dv3mL/W9S2tYs6BihtgYfF+Fi8oUWEVoZqAJr3gioE5YYETp11Gr0RMe1Lin7UlnCCq0f0//tgti4bacpq1TL5vtKHbC16ghTeobL07meP0f+gM4lvEFOhFAcdY0Jfrig/tVf4yFyGwAfHM1TX5YIs1X1mNKLnlc/uK+G44VOoN3x1t+tVLHEOeAnycwPHdBsSsMcw7n2bYNzlRWEIWTy9mABFRsEX+oWT2bf8VU1h4d7/TVDG45n7lzLWFFbX4PP1Z6KWM+FduqQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=jLg/Ort+dktxydWc7L68s9DMFyaM5EKCxEMzSwa7J1A=;
 b=fd7TandFSqoo/IRbvHS/BzRSiK6Uj4bSaAA3cuBsqBeuGP4vtH0F2Zek1uf1mJnofzUphbDSXtrUsl/xJmfLlVSrCV2PdqEPCQ7gyVhtnxaAZ3B+EozTN/1Ns+08/lk3qSQj+oxzH8NwSgEWbq81vjAvMBNAZUYzdczC4V03E24aJrcDqvgOqXd6rMNVTBC/nSsS5er3WZvsyyUxRvkIw3S5EbhItmFaxD/gBaDEAHK0GP8n2EKvrRDwLPkzYOv/CDi0ms66h0345AkPSzok4GjCb3jshYhQEIA2M8OP4i63F29ScquAY9gUBG0J9WgrhopnkD2bZ5O4d+94yH4tBw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR0601MB5536.apcprd06.prod.outlook.com (2603:1096:820:bd::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.24; Tue, 3 Sep
 2024 08:40:52 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:52 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:49 -0600
Message-Id: <d5f1a318931b213f7a27de8441ba985354eecabb.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR0601MB5536:EE_
X-MS-Office365-Filtering-Correlation-Id: 5b541b73-fe17-4479-2c3d-08dccbf41e39
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?u2iRQPivX7in1Z3nFW7yE6kzmdfUsTbr7Xabq1OMY/cOSy2334RZX3S6yJQh?=
 =?us-ascii?Q?2acwPT2EYdfbdUocRkXezUii6/B2TO2J/En6VCGtG+ObA7gvP9AfB2fVF9Gy?=
 =?us-ascii?Q?X8P1sK4dRLD3H+6NufJ7KTV/EZV5CDyW5rRDd5otMuCmnsf+sW6d6ajxZEcw?=
 =?us-ascii?Q?pUCaVDwi3Pw+/MZTL9OMDDY/WLd6cgUZ7mehdbG3hZngcrXyd4ouQXoS6xl7?=
 =?us-ascii?Q?8pfJzJct3RRiO4nLXT+J9jojdZidqLyejW7juGXtjl1LSRxRr2N6bRBZHf4U?=
 =?us-ascii?Q?6xaLkwYvXkix5RA5blHyAG5HdpTEMTzRCWVJYLkXZfQlx0M0ZB9FLgcO+oeS?=
 =?us-ascii?Q?P8anYjz+2O0qhWWlubJwK7Ne35iLZ9X2Lx9H8bg/1sz177Bm0VVCkEehUOXR?=
 =?us-ascii?Q?/W+3J9IH+DRI1WAwVCvTFcHFE6UeKhkbN1+SA76s/tsJ/GaTzT/fKKir9DjT?=
 =?us-ascii?Q?QMeeiz5MzJOy9OzqQN7uKfbhVmWW7S5WmEXBx4yMR5WQh30YurD/Yytujnz1?=
 =?us-ascii?Q?x6sEIZ42xJGWPaoXFMGBTQpYz8UAtK9rhS3+JlFT6DJ86AAolFZ2r3fO79iy?=
 =?us-ascii?Q?fOWSz3397e4RM8+zcLBAMk/RRUp/EGnxAuMEhXdLSZ5Gob3XfLdgUhrLvMRd?=
 =?us-ascii?Q?SiD8/FG6lG1JNaD0LpheV0mLlPlYJJJyxFAQaCRvhRLggxBPREMfCJfHUzp7?=
 =?us-ascii?Q?LjIVY/g9RM5/mdU8HU1YooaKL2VeLqvUU3tHSSCVLYIzEga5NrSBIij8RPvw?=
 =?us-ascii?Q?lTK1kHFuPu+gHnBO4J+6TJyUgWyXW3JsygwP/DGWp5sAy+V3qBKUwOroret5?=
 =?us-ascii?Q?mglyUj/yYsgDbelS0rU5eJvODRe287S8ltrhphug0LHkm1/SEcJUkmupz3HG?=
 =?us-ascii?Q?cbM6Zoo+Vkpm6MdA/90aFgXtv1lfQbmG7X6QGUozpX75Pr+hMJuAUFSNw+2c?=
 =?us-ascii?Q?cjqWgNnMTWXzhteiga93aOf0JMpL6wE8m/XYufaXTOPFsvW0BZY7X8YwWG7h?=
 =?us-ascii?Q?tzAgLXPkUzDX7CBumEttJkxAVVoPBLJTKdjedpz9KytXhxuL7jhiQIw6NNw0?=
 =?us-ascii?Q?gi3co6S3MBQzhA8wp2HcMxbtHA8mQSpvgYnyLj6t0CHOzr3KXxDH20vTIQFc?=
 =?us-ascii?Q?XQKlj/we3Bh0NwNXxHQpukw2m0ncy+xtV/uBmlqp0zlhrb9xmSdR27JazZ8W?=
 =?us-ascii?Q?SHzGZZKNehuMdU7q6sXtWeneDgaUXY1iotq4662Rm0T5DPqjIcN5G9RbkC/b?=
 =?us-ascii?Q?gLGKTXohJ7TXgLdZibKzZ56D8P29shvzryem+Mrv/hew8CVVEI8XAGGFwHU/?=
 =?us-ascii?Q?LdswSN1ruFLgpSYlCNkHVRDqxnuVUalOYmbFNaEEgcRRylam3sHqsIPWJDWm?=
 =?us-ascii?Q?4pywME2ZF6oCQljK0An8dgMJeuWKC/w1sevG6csBQYXOvpN2sg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?b9wVUQNqbf5moh5xg7oiQFX4MsE/tyk1jut5oDJopJDQr+TkMthQ0G/bGjfZ?=
 =?us-ascii?Q?npwypYDZDWCqZjlWwuh15cykCmEoBZESbzkSryXctnZGN3OUVOJUKGUeXj89?=
 =?us-ascii?Q?AYuwuNB8w/gDBSxlnyRPjrTik6v32FtLdzaC1Zd6kOvuoOYlhNmidQuMBaSO?=
 =?us-ascii?Q?xapFrgy8cvUDXeEeREbEF+r5N7q+6JdoSv1UDq+bvWRzN52ySxFEfI5NE84/?=
 =?us-ascii?Q?HqJ5me+l2iaaSuUVct+lrfMPLvltCJQByu+Jlsz4h3hdqIhlFLEc9HBB/DTU?=
 =?us-ascii?Q?6aS/VIaNOeCiopzaOvhwOBZMeHX9luitkdSIzpHEHovE2igRJaNTYJCnTcwq?=
 =?us-ascii?Q?Lz9bum3SP2TqJMUTzX5OocSq6mQblkQNOH0Gqj2zhif9F4yd/J459emwCKyc?=
 =?us-ascii?Q?LQEEBnvcpD+SonrUOacNApt4G8hVoHYqAvSPQHJpwGGW9si26Bk3PfsoCfrf?=
 =?us-ascii?Q?NkpCptdroujGcih8pv3+XiwgGI/0WdmjazJ912rZn6cRXWOJHXqMJpW9Ghmz?=
 =?us-ascii?Q?jD3cryGDOXv7c4TTjmE+5ylXxgx1e+LXh9R3/pVIy020zFy8ltaV91lDxq56?=
 =?us-ascii?Q?xLdWOcmyVIjd9pIG5rr+mGlaHtlJuWk/fXGjdK6ZEfvM0EreGoL17yurEn7V?=
 =?us-ascii?Q?zDOJPSKSGoBr9t70ui/BB7ATAvc/62x22QcwD7+H9E+eAOkziQM1TTvhZTPi?=
 =?us-ascii?Q?xnTLlgG//1yuNYOTXTugxsj3qEf1JiDa1j2cScE8imK4orFWFrlTpObA8r91?=
 =?us-ascii?Q?scPD7hPLTp96EyzZ0NR3m/gYTYh9XA/W23fiD4y6Q9zWOq4r51nW1D7jKOIw?=
 =?us-ascii?Q?3aIEVQRssO+6jEB3fqm7F3DaUGT7Qw2nGhkPioEL39HjwK0Gz626UHK5z1GX?=
 =?us-ascii?Q?FA8NRTrihIraH77oEX6ezq7UcMam+eQJ82iBDgfJ8cbesytitsEybxtwPyKF?=
 =?us-ascii?Q?+7hGcBtLURoLix7WBY+utzi0sJgQPXAgxE0hG4V462KsQglXr6i5C3qHoug+?=
 =?us-ascii?Q?vgQ2oMuUGwZ8sIJxS4z6zwRh9Obwr408Jc76mf8U/d4WsB7jY8OoD/KLInSw?=
 =?us-ascii?Q?KWNHAVy+5983S/0TUFhHFkXU2qRVr3SzcHzhw9FbX8qEnD1sYQUfwc6Y9cGA?=
 =?us-ascii?Q?hbD5Xv24qyGSaWlJsG/22CaoMTCQD6t2FB/0CcUNv5+9j7xBRkpxHK7h0IAS?=
 =?us-ascii?Q?St29t+sP8TVXjWpzBrZ53NK6eR9Gm2s3WoIWlXWmm4/5pTkRNJZwAgG9s8+e?=
 =?us-ascii?Q?lSER6LX64J0YcMlKILPV6ehZt8PR6UbnYPMDBSlB9XDjzTgkn7NKgwd9YGYa?=
 =?us-ascii?Q?bZY8AHLvPvBecRS5N3WGUvcVTBEXbbcQ/kEksomEtORBoHLrlnXEcUQXt7mo?=
 =?us-ascii?Q?20qZKuYIVv2c1LU5o5iH43EP7GRmU5JBqS8BFpNf8KWXW8YzcfF0YLTKDTfo?=
 =?us-ascii?Q?s+re++iASRdK3vIDed9Z8HLHu1Rwj6otagHIxvYaTWmoN37UcQyjGGyEPWm/?=
 =?us-ascii?Q?XXsJXA1g2JScvqZRZBJG3+eldDueg9IIod0Cvwwp4VlfDqfFFU+L9SCMkwxZ?=
 =?us-ascii?Q?Ty0tp05d7na4kb2gulwSxLhZqhkjGzKdx81luiFZ?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5b541b73-fe17-4479-2c3d-08dccbf41e39
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:52.1733 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: BawhQMySAvaJZFuuC5ci7Z35OIOrKY5o2g6wC6U2X4mdmHcmbeMBizN2aOx4WTLCCqAiQM2CoGAZX0gd5V4cPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5536
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Set inline tail flag to enable this feature when new inode
 is created. Inherit the conditions from inline data. Signed-off-by: Wu Bo
 <bo.wu@vivo.com> --- fs/f2fs/namei.c | 3 +++ 1 file changed, 3 insertions(+)
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.47 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPLC-0001Xc-5W
Subject: [f2fs-dev] [PATCH 05/13] f2fs: set inline tail flag when create
 inode
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Set inline tail flag to enable this feature when new inode is created.
Inherit the conditions from inline data.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/namei.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/fs/f2fs/namei.c b/fs/f2fs/namei.c
index 38b4750475db..13c295ea19de 100644
--- a/fs/f2fs/namei.c
+++ b/fs/f2fs/namei.c
@@ -315,6 +315,9 @@ static struct inode *f2fs_new_inode(struct mnt_idmap *idmap,
 	/* Should enable inline_data after compression set */
 	if (test_opt(sbi, INLINE_DATA) && f2fs_may_inline_data(inode))
 		set_inode_flag(inode, FI_INLINE_DATA);
+	/* Inherit the conditions from inline data */
+	if (test_opt(sbi, INLINE_TAIL) && f2fs_has_inline_data(inode))
+		set_inode_flag(inode, FI_INLINE_TAIL);
 
 	if (name && !test_opt(sbi, DISABLE_EXT_IDENTIFY))
 		set_file_temperature(sbi, inode, name);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
