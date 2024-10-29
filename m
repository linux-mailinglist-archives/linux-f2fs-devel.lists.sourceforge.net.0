Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A12E9B4941
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:11:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l4n-0007z8-Pr;
	Tue, 29 Oct 2024 12:11:57 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4i-0007ya-3W
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=ygavBiyoAdJZBmxeErtBFpcQo8cb0+0SesJEOcOGR/Q=; b=hyoRx0NrqnjD5+Q8WUePXj39K/
 qxq4WZS4ZLZHxJFsfHXHJ0nuNOG203kxbrScPx+Txd+kP3+SS1rwK6+W9Ki1xywAdLSr98U6xRFhm
 Wm/KWd6XAt4XBEAbsiyuXynX01/LdrLmhK717BPqXl+W0bmzzPGQU2iPJ2zefssLWHXo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=ygavBiyoAdJZBmxeErtBFpcQo8cb0+0SesJEOcOGR/Q=; b=Q+wt4kDlRK+MBWZSuTrXv29K3h
 MRLJX7FmdTSmLcjYn0oWfccyN5Oh2ywj14pNGu3iuBCbXGqqfqaP6pj0Ooc6s4k8cowl/Ltc2Zkue
 f27Jo/zQmQDa8vn/rfcx7igH7rpu9JbJvPaWpiuGtrcKkbCGTtIs2g6t0TPj5cz0t0I8=;
Received: from mail-psaapc01on2053.outbound.protection.outlook.com
 ([40.107.255.53] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4g-0007R0-Mc for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:11:51 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hUs0F5RTJrDRfoAkx4yFUCYr3rA+NG9sBVNSoW7fL9IwGKAeY2NkJDKGIJjExn5y2YQCccr2XAg/UjQviDyJCkGyq3PCxk2E2aGBQCSjmfTw2XcCX6gx7r+fEzH22s4b+GZ/3X8nJUS3+lIZnemvY/bKD0YZB4NpjrSodFvJKf1XnQQrJ+qdxmPMUhnwc6NysJaR4exZydDN8yDkMvFEegyDXFCGrpdJBFpmjgsc2k5e1akzpnMBuWSyOWdrkDxPUJTMR3xzYFqfikHtTn47g8MVicUt0mGROL1CPmKcLdE2MBEQF0qtUABPfpdG+qsDXECNMGz/N863RvBgI4NdXw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ygavBiyoAdJZBmxeErtBFpcQo8cb0+0SesJEOcOGR/Q=;
 b=EYnw5ARzrgia0IpngHVeTYtQC8XI11bi7QA9ra57BkeAPYUX7U2AjBJRHtkGDm86wqifPkegNGwlSZOW5BUGKtgWsvKPZdVE+Ju5xCnjkgh0wj7il3+/wYrleeTS1Xk7+rEDAYPnYrCSLmFx8Qe7pSbc+hlVQ154tASV0Y+0fM9qjjRXZ3IzDDKGtrIn3pia1NjlxrAwqL/4TPzWtdgPmGrGYfe3Mf5oWqiqJZ8SIUEiKhtKJT/R3ODm2cq4g4d2YlVIAk4cW6/QB/MD6KU3YRJN8C+kBKpbR2NCimyIWdNmnWPbO3WXYH9FdPLNQ/UasPjUuxulVm4IQhojwYb2+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ygavBiyoAdJZBmxeErtBFpcQo8cb0+0SesJEOcOGR/Q=;
 b=aNnrDfFtpT8GJinXAJrDNqwrW+tL70f7M1J1We0tUPPUbeYB8Eoxd1rJRJ+IHGlbPw8E0Bjqw/L6UDrmSJyEFW5/sC+mSrX/RoRBrpfv292FRdxjOMiDbX01W01v0B1HokS7o6OhDzv53ZyobTe7xxpIu4kSqbGDsJ2ooKr7Lz4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEZPR02MB7326.apcprd02.prod.outlook.com (2603:1096:101:1f4::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.32; Tue, 29 Oct
 2024 12:11:33 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:33 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:36 +0800
Message-Id: <20241029120956.4186731-5-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEZPR02MB7326:EE_
X-MS-Office365-Filtering-Correlation-Id: 57bc458f-f444-46a4-2b0b-08dcf812d378
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|52116014|376014|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?cBG3pNELcOViP5Kfw6/M8AQqB2IFrlsGbcMNJlme0jDgxKBV7jTsbmzYgl+9?=
 =?us-ascii?Q?LQEillD0As/tU8Bgi2Sgopp2uIEn8qTtgpGphKHKU5gkz2k8T8C2NtSxjvkK?=
 =?us-ascii?Q?xAS8sedUUbCuadIYtwdaJhHJYUKO3Cggd7kO26QV17EbARl60ySoll2kBcFo?=
 =?us-ascii?Q?sLJKm5/SpJtD6bwv6Nyub0PnbLdMkawf/MTnOoCaNxWeEqloiGOLm0KyP8FB?=
 =?us-ascii?Q?7jkcuA3JntcRs7lbiWgBBWhWfEcHBwzv30XVzgeqZpwBmqkt6XwkQG2lnL2D?=
 =?us-ascii?Q?iq0PO9CIT/zWepVaFUDkZAKpAigoD1hIYLJGgipQ7ynIRHbSxPhb0VOjwBMi?=
 =?us-ascii?Q?Ut3szHFbRv40RqvMSrec5c3q9lWuDZEpag3fZarkVtnQnAxZrCDyQZ5RJkDo?=
 =?us-ascii?Q?Sqj3zqG3k5zEYTKzWQFv0FJv9JSmJNKvvoiudkmumdiryd0bFjl9KGHz7BRr?=
 =?us-ascii?Q?tBUqZOek7YTCBXGODReIwIAC0XAoJcj93IFr0oP9eJXgwh2XJCl67phrV9mx?=
 =?us-ascii?Q?GAfo75/pJ2jUdNHPZat5u9V93u0vsTs5KTzqU0kXZjb44wCh+pkSjWFkUNp1?=
 =?us-ascii?Q?/Awd3FN3UZQZNGCE2VNa/Vs87YNO4xOevwIB2CVFJea1dmHnhjyGQfETADmZ?=
 =?us-ascii?Q?+prHBFUEvc0RpYtfhgVigyddI214hxQLo+xZED9JFeiHJY09t7fdivTMGHYX?=
 =?us-ascii?Q?nO1MVWN6/8OgVgYPpuGKP7EJzGG98r7wVAvPd6D3t5z8gdrRn3I9ua/7zn8P?=
 =?us-ascii?Q?N7l8fwqB/Um6ynM5pn1mF+WbnnbNGOJFLibxUhBftNbrsbVBxj4gcKD2m7+h?=
 =?us-ascii?Q?X2cIo8XkWujmHCIN74ZakdLgPOWCbmrSkgi/txC0ByUL7057wh9uKi+S2avA?=
 =?us-ascii?Q?urJSw5FfFMgN6EMmaelcH0UXd67i9GBCcOY2bumZXXLGer4penGcWHShTz5D?=
 =?us-ascii?Q?+oxeTfYfAx4rGUNEUfbHeE4+zirnAFCBdwX5M1j/qLo9F9A0Tlosub5zWrpn?=
 =?us-ascii?Q?npCWrKOr9m1KDzWgbXa8lCcMX3YiMOEFqpX0qRZtZExXlupKd7Fdtur8ZMmz?=
 =?us-ascii?Q?OmTHPEUXjQldUACd3rei4cpGakXaG89dY4dfIsCTMQVLdg6DjxUNS+APhB/y?=
 =?us-ascii?Q?n36JHHTyu9KtFSfUroOxS7bTFFyTSGoD6i257H9Z8iY8BOeW5zom/Dv5qc7O?=
 =?us-ascii?Q?jFQbOV7eg1l2H2vM0VanjmJpWUEK8sr2p+iZQQ6WT0UxG8lLSnGj+iwEZjM5?=
 =?us-ascii?Q?zvorTM1wazLkxPqoYxFzlfGoh267aJmdIBLzbHjpgsBFgQQcOi4S4MqLq0MK?=
 =?us-ascii?Q?/3m75B2EA+9eaTYgX2/ebQFSzXieUXuAezh+CdxHg7W+LT668SDbsNrkaxl4?=
 =?us-ascii?Q?VzCbZPQ=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(52116014)(376014)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?0WR8JKF0K3ag9f+yfp5STySGRPfblZE+pz5gNJHEtdM31JLMO3HLCaTv7OCm?=
 =?us-ascii?Q?ifpxFZLRPkapFWWeEKcMpKM/0z+vEgFGKzHAnzTuO0dkNR+x7daPY4T7ZnoF?=
 =?us-ascii?Q?291+AzKktIqnirCVVh9Ej/D/GRI0E0Ocas6GmQWrv4OaiBbLbk7zJQmzW9tP?=
 =?us-ascii?Q?GBAHlrEy9xnClWyTf2z8EmbTmzhbhNNHFeMZY0NCCvZ31eVQbP/f+QSiFksL?=
 =?us-ascii?Q?ZJ4CRfDJiEstJcYqyj3FS7juDW6nZ/HAmswYLRnAYZ31b0wdcWC3fpz1wIxo?=
 =?us-ascii?Q?GhaNiz0q1ztFwaucJ8Owe3JYb1dSxggzc2fDm4yYvGsfzzh824cXI1CbQWd2?=
 =?us-ascii?Q?lIqOqi5+FCLZA7qs2U8K+eVJvkpJHzaTB07hqQBOXmFI0e8jx22ICJ6h1SI2?=
 =?us-ascii?Q?IYqrw5M8gS14+5ZDfqnVx623NCKRgcBvioHLz3lQBbQg+pAc1KS1HMGvNEK1?=
 =?us-ascii?Q?fA1NSRDwSokmgWsiDf9FPO3GCbqly8bBPvnHsI4Fn5y42tWK+hVzZEtb0e86?=
 =?us-ascii?Q?e/sWxGLqDhhfxBRc3Ki6ySGDNhuv3zkPnLjtojY2PqyazZibgZNCxBgrK79V?=
 =?us-ascii?Q?THw9uSurQ2x1ki8oX7yKzUUdegelyDtwOxa63NYDdufBLf2N/LfsUywMTdD4?=
 =?us-ascii?Q?QoWhaFKegsdQJ25+TLqriH5cnk0UT/bObuds+nkehbnqLrm8uD5FLs9dkNNc?=
 =?us-ascii?Q?KvokhXUHJ9mOXhkMRMyS3Qqab2fyivprzFQFxYcXotBnz1bpUWVYbbO7jFP1?=
 =?us-ascii?Q?sGGjaNnwhDWNN7otOPmiQVvbgaN/zdp/MWhPOQXW1M+lEMXPZSYEEKggzcYN?=
 =?us-ascii?Q?mSRAYDZ2Glkj5NkFVXja5Y5Gu2tgA8S//18wZSEGU0RnI+NXr/WB/GuAe11t?=
 =?us-ascii?Q?ejwZzfX/VZXJnP0VDUB8kuRsWhXIKpsP+pmRaXHAeDWQECKzsmu9hzTLWALG?=
 =?us-ascii?Q?SiIc71iDbLXjWNuzVoEoW1s+jhX6pSuKGsGDSoASACMXfF5Qd6ipRPgx9Rku?=
 =?us-ascii?Q?H8xC4TFr1hna/4+f5wVncRE+vFV45RQFq0kr7k5/iDgEQZq7/dWNfOG7XYBH?=
 =?us-ascii?Q?w+7knjF3G0hZOIw7uveJmQM8BqBnkSuF54/8mlhcSHAR4GplzkpCEQjR5Nja?=
 =?us-ascii?Q?y+30/87Vom6Tnja0txLGwUeXFXbTxrVFOOrsY3AXeUw+/W4QAskxLlO3OW6n?=
 =?us-ascii?Q?iIcgAXDCNPNvo4WchJ1948gXrGvu/5tKf4DaQ3dZ/eyEDQ8CWMRxRPYGkJ4H?=
 =?us-ascii?Q?8n04oL878uArSiw/eTMAPrQQkzvy3t3X5m9/cgYwfi7PAqAOBuc03vvYQ3Qc?=
 =?us-ascii?Q?Axpm1S84522WypEIxV7GoiUKwFksqjwp+CZETHG8GS8evWSzIBQdhnPEPmfx?=
 =?us-ascii?Q?G4MWO29HaCKapmPCHNwlleCl1c2guvAkqgzdh24Ig6a0Z2Q2b8V80kUAHb3w?=
 =?us-ascii?Q?YFY5EKRjWOCvSE9UhsS2vG9Hn7AFkKWjOCwLRWplgSgbbT9HR1qLofwsP2yt?=
 =?us-ascii?Q?CzUyUSFLSaQvhKa9MywLLf0fPEtU7ZMOxLyLHphAwCb8WYeDHAzVthgNTjLt?=
 =?us-ascii?Q?pUjx4ECijB4QEGX7cRlwpfjcz4+0rbY5lHCkFqVo?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57bc458f-f444-46a4-2b0b-08dcf812d378
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:32.2515 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uVluZHBicqxNKlNoYQF4tsKNkquI7IpkG7FosZvISbXdEuS0h7cp2n6RFbNucPJSReiYmObyXVXLqwnJjvj9pQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR02MB7326
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  The following members are add to inject more fields in cp:
 * next_blkaddr: inject fsync dnodes An error is returned if no fsync dnode
 is found. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.53 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4g-0007R0-Mc
Subject: [f2fs-dev] [RFC PATCH 04/24] inject.f2fs: add members in inject_cp
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

The following members are add to inject more fields in cp:

* next_blkaddr: inject fsync dnodes

An error is returned if no fsync dnode is found.

However, the injection is not supported on zoned device. This is because
fsync dnodes must remains at the end of current warm node segnemt, any
dnode change causes all previous dnodes in the chain to be updated
out-of-place, and there may not have enough space left in the curseg.
To simplify the injection, it returns an error on zoned device.

* alloc_type: inject curseg's alloc type
* crc: inject cp's checksum
* elapsed_time: inject cp's mount elapsed time

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/fsck.h       |  3 +-
 fsck/inject.c     | 80 ++++++++++++++++++++++++++++++++++++++++++++++-
 fsck/mount.c      | 15 ++++++---
 man/inject.f2fs.8 |  9 ++++++
 4 files changed, 101 insertions(+), 6 deletions(-)

diff --git a/fsck/fsck.h b/fsck/fsck.h
index b581d3e0da9f..51061e435f5b 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -222,6 +222,7 @@ extern int f2fs_ra_meta_pages(struct f2fs_sb_info *, block_t, int, int);
 extern int f2fs_do_mount(struct f2fs_sb_info *);
 extern void f2fs_do_umount(struct f2fs_sb_info *);
 extern int f2fs_sparse_initialize_meta(struct f2fs_sb_info *);
+extern int f2fs_find_fsync_inode(struct f2fs_sb_info *, struct list_head *);
 
 extern void flush_journal_entries(struct f2fs_sb_info *);
 extern void update_curseg_info(struct f2fs_sb_info *, int);
@@ -238,7 +239,7 @@ extern void duplicate_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoint(struct f2fs_sb_info *);
 extern void write_checkpoints(struct f2fs_sb_info *);
 extern void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
-			struct f2fs_checkpoint *cp, int which);
+			struct f2fs_checkpoint *cp, int which, bool update_crc);
 extern void update_superblock(struct f2fs_super_block *, int);
 extern void update_data_blkaddr(struct f2fs_sb_info *, nid_t, u16, block_t,
 			struct f2fs_node *);
diff --git a/fsck/inject.c b/fsck/inject.c
index bd6ab8480972..c3e68eb35246 100644
--- a/fsck/inject.c
+++ b/fsck/inject.c
@@ -138,6 +138,10 @@ static void inject_cp_usage(void)
 	MSG(0, "  cur_node_blkoff: inject cur_node_blkoff array selected by --idx <index>\n");
 	MSG(0, "  cur_data_segno: inject cur_data_segno array selected by --idx <index>\n");
 	MSG(0, "  cur_data_blkoff: inject cur_data_blkoff array selected by --idx <index>\n");
+	MSG(0, "  alloc_type: inject alloc_type array selected by --idx <index>\n");
+	MSG(0, "  next_blkaddr: inject next_blkaddr of fsync dnodes selected by --idx <index>\n");
+	MSG(0, "  crc: inject crc checksum\n");
+	MSG(0, "  elapsed_time: inject elapsed_time\n");
 }
 
 static void inject_nat_usage(void)
@@ -440,6 +444,7 @@ out:
 static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 {
 	struct f2fs_checkpoint *cp, *cur_cp = F2FS_CKPT(sbi);
+	bool update_crc = true;
 	char *buf = NULL;
 	int ret = 0;
 
@@ -518,6 +523,79 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 		    opt->idx, opt->cp, get_cp(cur_data_blkoff[opt->idx]),
 		    (u16)opt->val);
 		set_cp(cur_data_blkoff[opt->idx], (u16)opt->val);
+	} else if (!strcmp(opt->mb, "alloc_type")) {
+		if (opt->idx >= MAX_ACTIVE_LOGS) {
+			ERR_MSG("invalid index %u of cp->alloc_type[]\n",
+				opt->idx);
+			ret = -EINVAL;
+			goto out;
+		}
+		MSG(0, "Info: inject alloc_type[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, cp->alloc_type[opt->idx],
+		    (unsigned char)opt->val);
+		cp->alloc_type[opt->idx] = (unsigned char)opt->val;
+	} else if (!strcmp(opt->mb, "next_blkaddr")) {
+		struct fsync_inode_entry *entry;
+		struct list_head inode_list = LIST_HEAD_INIT(inode_list);
+		struct f2fs_node *node;
+		block_t blkaddr;
+		int i = 0;
+
+		if (c.zoned_model == F2FS_ZONED_HM) {
+			ERR_MSG("inject fsync dnodes not supported in "
+				"zoned device\n");
+			ret = -EOPNOTSUPP;
+			goto out;
+		}
+
+		if (!need_fsync_data_record(sbi)) {
+			ERR_MSG("no need to recover fsync dnodes\n");
+			ret = -EINVAL;
+			goto out;
+		}
+
+		ret = f2fs_find_fsync_inode(sbi, &inode_list);
+		if (ret) {
+			ERR_MSG("failed to find fsync inodes: %d\n", ret);
+			goto out;
+		}
+
+		list_for_each_entry(entry, &inode_list, list) {
+			if (i == opt->idx)
+				blkaddr = entry->blkaddr;
+			DBG(0, "[%4d] blkaddr:0x%x\n", i++, entry->blkaddr);
+		}
+
+		if (opt->idx == 0 || opt->idx >= i) {
+			ERR_MSG("invalid index %u of fsync dnodes range [1, %u]\n",
+				opt->idx, i);
+			ret = -EINVAL;
+			goto out;
+		}
+
+		MSG(0, "Info: inject next_blkaddr[%d] of cp %d: 0x%x -> 0x%x\n",
+		    opt->idx, opt->cp, blkaddr, (u32)opt->val);
+
+		node = malloc(F2FS_BLKSIZE);
+		ASSERT(node);
+		ret = dev_read_block(node, blkaddr);
+		ASSERT(ret >= 0);
+		F2FS_NODE_FOOTER(node)->next_blkaddr = cpu_to_le32((u32)opt->val);
+		ret = update_block(sbi, node, &blkaddr, NULL);
+		ASSERT(ret >= 0);
+		goto out;
+	} else if (!strcmp(opt->mb, "crc")) {
+		__le32 *crc = (__le32 *)((unsigned char *)cp +
+						get_cp(checksum_offset));
+
+		MSG(0, "Info: inject crc of cp %d: 0x%x -> 0x%x\n",
+		    opt->cp, le32_to_cpu(*crc), (u32)opt->val);
+		*crc = cpu_to_le32((u32)opt->val);
+		update_crc = false;
+	} else if (!strcmp(opt->mb, "elapsed_time")) {
+		MSG(0, "Info: inject elapsed_time of cp %d: %llu -> %"PRIu64"\n",
+		    opt->cp, get_cp(elapsed_time), (u64)opt->val);
+		set_cp(elapsed_time, (u64)opt->val);
 	} else {
 		ERR_MSG("unknown or unsupported member \"%s\"\n", opt->mb);
 		ret = -EINVAL;
@@ -525,7 +603,7 @@ static int inject_cp(struct f2fs_sb_info *sbi, struct inject_option *opt)
 	}
 
 	print_ckpt_info(sbi);
-	write_raw_cp_blocks(sbi, cp, opt->cp);
+	write_raw_cp_blocks(sbi, cp, opt->cp, update_crc);
 
 out:
 	free(buf);
diff --git a/fsck/mount.c b/fsck/mount.c
index bbe29dba0f45..c2e0f1a3a9df 100644
--- a/fsck/mount.c
+++ b/fsck/mount.c
@@ -3454,17 +3454,19 @@ void write_checkpoints(struct f2fs_sb_info *sbi)
 	write_checkpoint(sbi);
 }
 
-void write_raw_cp_blocks(struct f2fs_sb_info *sbi,
-			 struct f2fs_checkpoint *cp, int which)
+void write_raw_cp_blocks(struct f2fs_sb_info *sbi, struct f2fs_checkpoint *cp,
+			 int which, bool update_crc)
 {
 	struct f2fs_super_block *sb = F2FS_RAW_SUPER(sbi);
 	uint32_t crc;
 	block_t cp_blkaddr;
 	int ret;
 
-	crc = f2fs_checkpoint_chksum(cp);
-	*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
+	if (update_crc) {
+		crc = f2fs_checkpoint_chksum(cp);
+		*((__le32 *)((unsigned char *)cp + get_cp(checksum_offset))) =
 							cpu_to_le32(crc);
+	}
 
 	cp_blkaddr = get_sb(cp_blkaddr);
 	if (which == 2)
@@ -3864,6 +3866,11 @@ next:
 	return err;
 }
 
+int f2fs_find_fsync_inode(struct f2fs_sb_info *sbi, struct list_head *head)
+{
+	return find_fsync_inode(sbi, head);
+}
+
 static int do_record_fsync_data(struct f2fs_sb_info *sbi,
 					struct f2fs_node *node_blk,
 					block_t blkaddr)
diff --git a/man/inject.f2fs.8 b/man/inject.f2fs.8
index 01d58effbfe4..6cf66bcbf2a3 100644
--- a/man/inject.f2fs.8
+++ b/man/inject.f2fs.8
@@ -79,6 +79,15 @@ cur_data_segno array.
 .TP
 .BI cur_data_blkoff
 cur_data_blkoff array.
+.TP
+.BI next_blkaddr
+fsync dnodes.
+.TP
+.BI crc
+crc checksum.
+.TP
+.BI elapsed_time
+elapsed mount time.
 .RE
 .TP
 .BI \-\-nat " 0 or 1 or 2"
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
