Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 129F2914F48
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Jun 2024 15:56:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sLkB2-0001Ox-2t;
	Mon, 24 Jun 2024 13:56:12 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sLkAz-0001Oo-Iv
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=chRiwWzhTC8eY6J0yNVFaAk6QJW1jumVmvMImm4+nA8=; b=lXFg0jObeR1UmY1WSUkyd4cYGi
 sB9OTRfgshjBljhJQq78TDctRdJRHFq5ml6IFfRQt4FZdz3keDI+Im1rhx2FiTJ+CWvPEJtog9vWm
 5n1f3nMnZYOLCBkI5r7mJsV39BDLbRc3Laq4tYGgzb4/uJN223lvYBC5jYHJP9P0wKFc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=chRiwWzhTC8eY6J0yNVFaAk6QJW1jumVmvMImm4+nA8=; b=QlQrQJh8uuoCI3DLFTmkfqkTx8
 ekELHJLfEPTIUG5SzBxI593ratFk4YSbORJP5wU/qjjF+v/5DMrjP4XqjhqKGk9AS5mnlEa0c+F1n
 530SV/6Px3WXNTZ1vGnomgMWDuYhzeyD2T3KkL9zYO8KXSTWPMusbAGZBBb2UWFqoX18=;
Received: from mail-sgaapc01on2083.outbound.protection.outlook.com
 ([40.107.215.83] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sLkAz-00018a-Kr for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Jun 2024 13:56:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=PU13LC0wjEN4uRqAepu3u5WTAr6QR3zDkKPBO44ZNJXEMORRn+YgHl6HBsJsbJkQcxw7PcMhnj0Fh3lYWsE553stJ6xZ1wVRvrHSYIAcC0DE8e6QGUsE7ANIb11AHCUmlpSolVEDvq3YhHkz1yudSQrdC1Z+TaBivBQqZeHydiuHvB/+Xya0Ud5pog7BA1IgSG3vqpGBluuvIHmg8nlzpdChdSzv+pbrSzkGB3x/ScUTiKzko3Tzt0LMJ6QZAxOA9ZpdA+sVnkrGxmO6b1lYAILGUOokeJfBUfpk+GXTCF8L7hTTm9Sw8FSgC+mv8G4x0PPOhg3A/gF0aDe3ORgCUA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=chRiwWzhTC8eY6J0yNVFaAk6QJW1jumVmvMImm4+nA8=;
 b=eQDeZaOAUwAiTYnqIK8jlzpycefh2tblfCB6GHKOk44qRCGHJK28tPIy7QUGSeLsqRxEZgroPXxPStIZpvACMcHjsoI2JJPGpn24R9niGHP3YXZ7Qxkgl3P9vVVSaTA0hDCz/lCewwIspcITDozqE6YjJIHyFUTrRvZXgnWetT4dDsDWY2usQyCz+Z196WYv3HdPaNPVJluwZYr8QFeV5gNheAMU0AH8WtoBoR42XM9j7NmnfKGpDqinsamhD42Mx1R+UvO3VdPOFsjvcaTJd8TueSpAbvcyONI8KUes8+r8OpVrkvsuF7VJPxC/uPQzl7GF5aFEhVxdr6X3xaQplw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=chRiwWzhTC8eY6J0yNVFaAk6QJW1jumVmvMImm4+nA8=;
 b=dg9Vk06GFVs35h7hu5ujcvik7qTOM9mamzT/YgPdrdMK8/U9RiOSD8wtWW6X7sJiw/ReABIe9oaUBs57pzA8aMeh6wOTgopBoNiCCOLeGtRMqbSn9FEQPTiLHlkB6XTn6fdOmUDJiqtdOR/wpY7ZwCO/k3TofDRMs7+RNZlt+uA=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7438.apcprd02.prod.outlook.com (2603:1096:101:1e5::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7698.28; Mon, 24 Jun
 2024 13:55:57 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7677.033; Mon, 24 Jun 2024
 13:55:57 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 24 Jun 2024 21:55:26 +0800
Message-Id: <20240624135532.3330136-4-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240624135532.3330136-1-shengyong@oppo.com>
References: <20240624135532.3330136-1-shengyong@oppo.com>
X-ClientProxiedBy: SI2P153CA0001.APCP153.PROD.OUTLOOK.COM (2603:1096:4:140::7)
 To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7438:EE_
X-MS-Office365-Filtering-Correlation-Id: 7ee353ac-305b-465d-27b6-08dc94555f31
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230037|366013|52116011|376011|1800799021|38350700011; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?458knOpXTuw/OS9F+z+Mu6tkJb9FCvNHUZ1nwuj1RgUooFiBw5dJ8x5LcVjg?=
 =?us-ascii?Q?teAyuUXKiJp115Gzmd11tEmDi6TK8C90HyPfGADRmkpuzcFMY/eTmPUFfxmI?=
 =?us-ascii?Q?Kau0AIUfyhEZ3J3d0TzFJSj076w49hTMj4kYEmf2zgMAGU/2XXjh7KozJdhK?=
 =?us-ascii?Q?YBcWkQ2Upd/ZUpeow2gSUmvPwTJ3wKD25xgKpTtE1xy6enwj5Rz8JCQKqwkF?=
 =?us-ascii?Q?9RREe6X1Qd4YtEX3pR+mRZophr/fm3xGt0GumvRF8b+emQgVKnZju2m1dLfp?=
 =?us-ascii?Q?oG0uWYaON4fjweFxZ0ytx75vjfj/y1yQUTnBt/itCYPTEt7+OlgZD+8g2LYE?=
 =?us-ascii?Q?Jq0SG/W1A4jG/kGUt76c33ohYnF2/SFrzIMQ4bODzZsRafojT/FkaH5NRDqr?=
 =?us-ascii?Q?sCa/vMcTUS4znSY9E572cpx9tegHCsAODwRj1xKC4Bb0F00r7p9W1Rds0+qm?=
 =?us-ascii?Q?iQuRej8THOUAadEtdMKj1cL+0nKlbygr+PAuqKSMa61KGYAxwWEyFHfc1Bo7?=
 =?us-ascii?Q?3zpFoh53e58qs4+/T+ArErr4vddvZAFdUaMHTfuXMo+3ngGqJZm2v9yv6voU?=
 =?us-ascii?Q?Ahp2sL/eVIoGFbnnVCgNJqmccwuURcqs9opf9cjl2Nz773tmVlhDg7l2Qs7m?=
 =?us-ascii?Q?ZxYkPRZl7c1h4AtamLgTy5rEYPA9ENVVFWzJWLv+tiIgjKBt2nVRmGNlQC+5?=
 =?us-ascii?Q?Lr0XvHl0tSy6GubGPRo9htl2ba7GHew3lfbMP3aiDaSVtTA4WG+3bMRYbNhL?=
 =?us-ascii?Q?t3VHB/Nycu2DRGqd0A1E0w+16BhqoKLGO25DFddGEf8MborrIrmYchaxxQMN?=
 =?us-ascii?Q?Sbz3U8+1bQVzFUJ3zEiSGe3TLaTUk57czni6F8CLfVL1Vt2/WbRBHtReHeU8?=
 =?us-ascii?Q?x6MRCob7/4jR0830LkPtpuuqzuTSFR0noLEOxN2iWuXtB7qzTu94vEGSZSXd?=
 =?us-ascii?Q?PhUhAXywV4YcxiVfT8QOtgD6IYs0RhEcoeGHcBAZrLzhRBeAzrqtdQs0AauK?=
 =?us-ascii?Q?iK4++5pq6ePowPmYKDW9khVsg0MZPhtkItVjiLEHkUHzOxXaHC6SFJsotTzV?=
 =?us-ascii?Q?ex48s/X88pUMv9bOXr4w76tU8VJMybr9dDSxeSIsXodiO8JHq9nEhAn+zVTS?=
 =?us-ascii?Q?26AbC9jXWeVKu6/FczV4COFmbYiwuKNqxAspIDoezNPCAI8qL9XgMh8Ct8/1?=
 =?us-ascii?Q?Y58ZazfrtJg8xY4APHb//3LfJAKGC+IdpH7C5lWtCronhBUaeWPRueowM3AV?=
 =?us-ascii?Q?wrlJo/v525bAmd3STR3xsXNOoukud9ArLeeouWynNmtLeJjwfmOjVIV9OJ7z?=
 =?us-ascii?Q?FprUGs8A2/WkTgqrpnm40Qf7SOrAsE2tuf/jKIntVXEpd4InP0zf2lcPzBYS?=
 =?us-ascii?Q?W8Ti5C8=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230037)(366013)(52116011)(376011)(1800799021)(38350700011); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S0JTajs7dna2ZjBm/AFFd3M+Gs/hgJpeEJfKUninDnd6XUoBZdej9/i7pYiI?=
 =?us-ascii?Q?whlMiWnFjdnB2Cml1guYFCsEsKt0zbRFH9co11riycFtvQNL8SV5Z/nWuX0k?=
 =?us-ascii?Q?oJnWMdQkKQZRetPx1aAhiXYZbmIV8pZmvVgV348IHsgF+xBivhf82AC04avQ?=
 =?us-ascii?Q?yvarnIWuwkcwDDPefELQ9DYVJnfMGHjUwipOIbI6lirIxQxEgODG9lzaSimX?=
 =?us-ascii?Q?6GX2aNqLlGRBZVykJcFwcAMPK1Y8vdBYHrjr7nFr2GeN/JsNDsSo9B7Gl1kH?=
 =?us-ascii?Q?xrwsfAQjJ1PbtoJ0sP7tEDsLFlokaP4YqrDhehzvMqtdLB7medtm/aB8LzGj?=
 =?us-ascii?Q?vN531dagYjwXmeXYLvK4U+Pf0LwW8bdlFxEcujY3MC+jJ+ntgxOvvyn16XYT?=
 =?us-ascii?Q?9WK5UqzZ2o8O+lCmSM5jYhRqtmRxbhxt88wJkIfTtnt63Wn4pMlhqFjDBLkn?=
 =?us-ascii?Q?BDqr3dVfeQYo1fooBewqbJw7zzTU5475cvaUzwe62+ECx9XNcoNkuZkx+VbT?=
 =?us-ascii?Q?0mX6cXtzyqksPPecI5H860K4QZbRmtQ8kcqyUD6djMYW6p6ZjjolTws8irYo?=
 =?us-ascii?Q?oF57QUgqVvC2L/TpOmEL7zViFYbbCqfl+q2IFpHoDvZE/skyflinsYqqn/PH?=
 =?us-ascii?Q?AHKsNHaw7Zj2hWAkBCYo4zJXIsvzvM46j75yMZJxRMkFApNQI0Q+C15rCrh3?=
 =?us-ascii?Q?0XDtKSQ6VMgEZGn/gJOaGtwrwmBqcGXbBYC3vrHZN0R4z72REB0LWPru8ePJ?=
 =?us-ascii?Q?z0g79zGpNUE4q+1taTMEEP6BR/tR3z8lk9cD1qVDygGNy29I6ybW/Mc+eR1G?=
 =?us-ascii?Q?eUuJcJBxS3s+lE1MU1bOuyNq0gLx9gQtyWFgB1p1BVkRtL8jrOyGlEWoLiyf?=
 =?us-ascii?Q?FAufsY7czMYFIgCOikL3GKUGDhhhcuiVj/saBUW97aY6kVIzxwiratlK164g?=
 =?us-ascii?Q?TcPDS9fHSc9DYelpB+BXMAuvwGXET/F+zP+XSihfQ4NAW1YfA+9UstBA7kvJ?=
 =?us-ascii?Q?LiGxCBdrESSDpW+OSs78HfLFLtXmimSAJhpUm1SvbnE9WCpZzI2GDCGXMvRi?=
 =?us-ascii?Q?yPnP7KLh0CH17t8kwOcSURM71bdgfDJTNGXeV6nKDBHrRZjMuvCNspdbzD4N?=
 =?us-ascii?Q?gUacyFDBhd1BgOdqwWL1baHRtbszLuhnjX1UfFR7uCXcsl7wcdSq7SJfk6+V?=
 =?us-ascii?Q?HmMcFuCdfBOQBAMmHLJSrG3aJdgTEFH3sKn7jeuRRGM+5QE/VEMQlU1LaKFD?=
 =?us-ascii?Q?WQNy7I706+a3eK6at6Tj5kuoTM+xrA1zOjleHi4rZtHMBrs0JMKh1fQYvhm1?=
 =?us-ascii?Q?dQIy5krLsH+LwLatH65TJid+O8c9DIOHROg98r5jU7hNMvU2z+8xoJLz4BGN?=
 =?us-ascii?Q?QBaB3y0DBzWxbYciFcWd8EApG1Clki0NjrmY11iNYvyS261LMSOGhABTyeFy?=
 =?us-ascii?Q?zBSGMEPOT9cklG69bFFeFWxSP1QXUusXBuOsUY0vNWanNRCjLyYoBgsZdBbC?=
 =?us-ascii?Q?cvVy4uNjSwonM857bo2QyyilATGF1ViMWH3va5M+i5S9diIF/ZD/Rv+io0E+?=
 =?us-ascii?Q?n7voRy070r0KqqeypEKCKn33J0XBtWB+l3iLn44w?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7ee353ac-305b-465d-27b6-08dc94555f31
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Jun 2024 13:55:57.1565 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: glQMVkDIkzX/59ClAX2aak4H4y+YIk8axDIgXbi4O0VDMSE4yBQSlXJlzpKhg9ZlhhXkZbgCr7kBvfW2QmjK/A==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7438
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  This patch enables injecting super block. The meanings of
 options are: * sb: means sb is injected, its argument chooses which sb pack
 to be injected, where 0 means the current valid sb is choosen automatically.
 * mb: indicates which member in [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.83 listed in sa-accredit.habeas.com]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: oppo.com]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.83 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.83 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.83 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sLkAz-00018a-Kr
Subject: [f2fs-dev] [RFC PATCH 03/10] inject.f2fs: add sb injection
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

This patch enables injecting super block.

The meanings of options are:
 * sb: means sb is injected, its argument chooses which sb pack to be
       injected, where 0 means the current valid sb is choosen
       automatically.
 * mb: indicates which member in sb is injected, its argument is the
       member name.
 * idx: is used when the mb is an array, its argument is the index of
        the array.
 * val: is the new value to be set when the type of mb is a number.
 * str: is the new value to be set when the type of mb is a string.

The members could be injected in sb contains:
 * magic: magic number
 * s_stop_reason: s_stop_reason array
 * s_errors: s_errors array
 * devs.path: path in devs array

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/inject.c | 134 +++++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/inject.h |   5 ++
 fsck/main.c   |   5 +-
 3 files changed, 142 insertions(+), 2 deletions(-)

diff --git a/fsck/inject.c b/fsck/inject.c
index f6fd346..1d40b72 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -18,17 +18,42 @@ void inject_usage(void)
 	MSG(0, "[options]:\n");
 	MSG(0, "  -d debug level [default:0]\n");
 	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  --mb <member name> which member is injected in a struct\n");
+	MSG(0, "  --val <new value> new value to set\n");
+	MSG(0, "  --str <new string> new string to set\n");
+	MSG(0, "  --idx <slot index> which slot is injected in an array\n");
+	MSG(0, "  --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string> inject superblock\n");
 	MSG(0, "  --dry-run do not really inject\n");
 
 	exit(1);
 }
 
+static void inject_sb_usage(void)
+{
+	MSG(0, "inject.f2fs --sb <0|1|2> --mb <name> [--idx <index>] --val/str <value/string>\n");
+	MSG(0, "[sb]:\n");
+	MSG(0, "  0: auto select the first super block\n");
+	MSG(0, "  1: select the first super block\n");
+	MSG(0, "  2: select the second super block\n");
+	MSG(0, "[mb]:\n");
+	MSG(0, "  magic: inject magic number\n");
+	MSG(0, "  s_stop_reason: inject s_stop_reason array selected by --idx <index>\n");
+	MSG(0, "  s_errors: inject s_errors array selected by --idx <index>\n");
+	MSG(0, "  devs.path: inject path in devs array selected by --idx <index> specified by --str <string>\n");
+}
+
 int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 {
 	int o = 0;
-	const char *option_string = "d:V";
+	const char *pack[] = {"auto", "1", "2"};
+	const char *option_string = "d:Vh";
 	struct option long_opt[] = {
 		{"dry-run", no_argument, 0, 1},
+		{"mb", required_argument, 0, 2},
+		{"idx", required_argument, 0, 3},
+		{"val", required_argument, 0, 4},
+		{"str", required_argument, 0, 5},
+		{"sb", required_argument, 0, 6},
 		{0, 0, 0, 0}
 	};
 
@@ -39,6 +64,33 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 			c.dry_run = 1;
 			MSG(0, "Info: Dry run\n");
 			break;
+		case 2:
+			opt->mb = optarg;
+			MSG(0, "Info: inject member %s\n", optarg);
+			break;
+		case 3:
+			opt->idx = atoi(optarg);
+			MSG(0, "Info: inject slot index %d\n", opt->idx);
+			break;
+		case 4:
+			opt->val = strtoll(optarg, NULL, 0);
+			if (opt->val == ULLONG_MAX || opt->val == LLONG_MIN)
+				return -ERANGE;
+			MSG(0, "Info: inject value %lld : 0x%llx\n", opt->val,
+			    (unsigned long long)opt->val);
+			break;
+		case 5:
+			opt->str = strdup(optarg);
+			if (!opt->str)
+				return -ENOMEM;
+			MSG(0, "Info: inject string %s\n", opt->str);
+			break;
+		case 6:
+			opt->sb = atoi(optarg);
+			if (opt->sb < 0 || opt->sb > 2)
+				return -ERANGE;
+			MSG(0, "Info: inject sb %s\n", pack[opt->sb]);
+			break;
 		case 'd':
 			if (optarg[0] == '-' || !is_digits(optarg))
 				return EWRONG_OPT;
@@ -48,7 +100,12 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 		case 'V':
 			show_version("inject.f2fs");
 			exit(0);
+		case 'h':
 		default:
+			if (opt->sb >= 0) {
+				inject_sb_usage();
+				exit(0);
+			}
 			return EUNKNOWN_OPT;
 		}
 	}
@@ -56,9 +113,84 @@ int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
 	return 0;
 }
 
+static int inject_sb(struct f2fs_sb_info *sbi, struct inject_option *opt)
+{
+	struct f2fs_super_block *sb;
+	char *buf;
+	int ret;
+
+	buf = calloc(1, F2FS_BLKSIZE);
+	ASSERT(buf != NULL);
+
+	if (opt->sb == 0)
+		opt->sb = 1;
+
+	ret = dev_read_block(buf, opt->sb == 1 ? SB0_ADDR : SB1_ADDR);
+	ASSERT(ret >= 0);
+
+	sb = (struct f2fs_super_block *)(buf + F2FS_SUPER_OFFSET);
+
+	if (!strcmp(opt->mb, "magic")) {
+		MSG(0, "Info: inject magic of sb %d: 0x%x -> 0x%x\n",
+		    opt->sb, get_sb(magic), (u32)opt->val);
+		set_sb(magic, (u32)opt->val);
+	} else if (!strcmp(opt->mb, "s_stop_reason")) {
+		if (opt->idx >= MAX_STOP_REASON) {
+			ERR_MSG("invalid index %u of sb->s_stop_reason[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject s_stop_reason[%d] of sb %d: %d -> %d\n",
+		    opt->idx, opt->sb, sb->s_stop_reason[opt->idx],
+		    (u8)opt->val);
+		sb->s_stop_reason[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "s_errors")) {
+		if (opt->idx >= MAX_F2FS_ERRORS) {
+			ERR_MSG("invalid index %u of sb->s_errors[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject s_errors[%d] of sb %d: %d -> %d\n",
+		    opt->idx, opt->sb, sb->s_errors[opt->idx], (u8)opt->val);
+		sb->s_errors[opt->idx] = (u8)opt->val;
+	} else if (!strcmp(opt->mb, "devs.path")) {
+		if (opt->idx >= MAX_DEVICES) {
+			ERR_MSG("invalid index %u of sb->devs[]\n", opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		if (strlen(opt->str) >= MAX_PATH_LEN) {
+			ERR_MSG("invalid length of option str\n");
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject devs[%d].path of sb %d: %s -> %s\n",
+		    opt->idx, opt->sb, (char *)sb->devs[opt->idx].path, opt->str);
+		strcpy((char *)sb->devs[opt->idx].path, opt->str);
+	} else {
+		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
+		return -EINVAL;
+		goto out;
+	}
+
+	print_raw_sb_info(sb);
+	update_superblock(sb, SB_MASK((u32)opt->sb - 1));
+
+out:
+	free(buf);
+	free(opt->str);
+	return ret;
+}
+
 int do_inject(struct f2fs_sb_info *sbi)
 {
+	struct inject_option *opt = (struct inject_option *)c.private;
 	int ret = -EINVAL;
 
+	if (opt->sb >= 0)
+		ret = inject_sb(sbi, opt);
+
 	return ret;
 }
diff --git a/fsck/inject.h b/fsck/inject.h
index 62543c1..c7d0e33 100644
--- a/fsck/inject.h
+++ b/fsck/inject.h
@@ -20,6 +20,11 @@
 #include "fsck.h"
 
 struct inject_option {
+	const char *mb;		/* member name */
+	unsigned int idx;	/* slot index */
+	long long val;		/* new value */
+	char *str;		/* new string */
+	int sb;			/* which sb */
 };
 
 void inject_usage(void);
diff --git a/fsck/main.c b/fsck/main.c
index f093ca7..d6a7a47 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -817,7 +817,10 @@ void f2fs_parse_options(int argc, char *argv[])
 #endif /* WITH_LABEL */
 	} else if (!strcmp("inject.f2fs", prog)) {
 #ifdef WITH_INJECT
-		static struct inject_option inject_opt;
+		static struct inject_option inject_opt = {
+			.sb = -1,
+			.idx = -1,
+		};
 
 		err = inject_parse_options(argc, argv, &inject_opt);
 		if (err < 0) {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
