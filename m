Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9222197BA8C
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Sep 2024 12:06:56 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sqraC-0008WN-BW;
	Wed, 18 Sep 2024 10:06:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liuderong@oppo.com>) id 1sqraA-0008W7-6H
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 10:06:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=Content-Type:MIME-Version:Message-ID:Date:Subject:
 CC:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=2wovymd8akxg53irptRUgFwGJ9wUNA4VzdT4Dg8DoaE=; b=I/D3M0sj41EyXD1Z5KX/73c443
 S/R5Cb0NGdgufq7IhnwHkXKQ9kn5anJe5AHvlxazCKVsZJGK+OHYq5WqOwnHzNcALBPFKBekD/mQB
 GjhHOaFIAl82eXxRFmKDO9LzhW/8+IZFXzbnC8DBKf3behA6XXLiaZ9xx9ZaQUCuHQ5Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=Content-Type:MIME-Version:Message-ID:Date:Subject:CC:To:From:Sender:
 Reply-To:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=2wovymd8akxg53irptRUgFwGJ9wUNA4VzdT4Dg8DoaE=; b=Y
 J9AtO9ArmHfuKZZEkt29/U8FosldkaqVx9avR1oe+mlhMH9zhmtP+sSw183eDDbPTkehl1V2fjbh+
 IBYQCWnVghEHFzz5KIlxNnqTJ5QdZ357yTMP8gEODvH9EDp5ciAqCrP/sj3AG/b2CMFPmfsySy1sL
 3EPYjyWnSjpFAFBY=;
Received: from mail-psaapc01on2087.outbound.protection.outlook.com
 ([40.107.255.87] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sqra9-0003hh-B1 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Sep 2024 10:06:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bBNItt8CW58ODg5Dp8TAC5DWBq2EOBHTK1JBmki9Qqtd2pPKYbll+celRCd+YqLvz0EKX+ta1QoEZyLeB/QiqoPZER4CoQOBTQA9jcqOX6v2dA3tnDTR/DvAtbLnlXdiIUAZbd6GjXrB227wxVBGMxKFNOz927e79wWbynFfBBWacvKFvXsozvUvRQ28KV9fHfw9NZ+MVX04uC4yxZWSaTLH8sutsIzgV0X41iGVF/jaEIv/3QqSgV3PxCnDOmDxfDqJUZ3Re/GnaTvAeYz9X8rAPNVoP3UaIGx3eBdLusWAbq34frFq8e4bfG9SMpkPUNo13VTKcxnPxty0rShXzQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wovymd8akxg53irptRUgFwGJ9wUNA4VzdT4Dg8DoaE=;
 b=e0JRV7PopZxnY8sqY8eEZHbOrqnGoON0vj94c1ywCwoAOLA2oqeY0Vk5hsvrI+XNpJXrJlq254pIPvoKGQbcjZqo+dgUbHgOu1U/mfc0+GNkfYV3P8F4F6KNYKNyxyeLbrai3OfoXOuW5BbZljPVE3btApYuTNLK5qXl8T1zUcZHTZHlJhVTwDLDGpynYVlmnFLVANtO3KtPgjZkqieM2ZPIIFLtTu5lXd4idQ/dMxTXOZcnygwld4at7yJqLjoXb46Lb2IRDidkArRpWhlrFuxAVU3rTy1YH8bb7AhG0ir8zEetOctFEmjvQTyJDoL5C7v3ewNhAhDQdpeN3Qocrg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 58.252.5.68) smtp.rcpttodomain=kernel.org smtp.mailfrom=oppo.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=oppo.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wovymd8akxg53irptRUgFwGJ9wUNA4VzdT4Dg8DoaE=;
 b=diGFlGUb6JqjFdhRoO+sPkery5D4VlagNE89yNO+gTJmpB0rRebLVuRPtDzCIfTdc+2gzz8JG5+d7FzTxwkxxKiSIfiwRxv2etpgsVY0TJyu4JDSi/IwBCV+5B5oE+zghxcnZ1IGYFUV0Pz54h8rAH5W29BUA+KqtpJSs4flf6M=
Received: from PUZP153CA0007.APCP153.PROD.OUTLOOK.COM (2603:1096:301:c2::11)
 by JH0PR02MB7375.apcprd02.prod.outlook.com (2603:1096:990:62::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.24; Wed, 18 Sep
 2024 10:06:31 +0000
Received: from HK3PEPF0000021E.apcprd03.prod.outlook.com
 (2603:1096:301:c2:cafe::7) by PUZP153CA0007.outlook.office365.com
 (2603:1096:301:c2::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.6 via Frontend
 Transport; Wed, 18 Sep 2024 10:06:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 58.252.5.68)
 smtp.mailfrom=oppo.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=oppo.com;
Received-SPF: Pass (protection.outlook.com: domain of oppo.com designates
 58.252.5.68 as permitted sender) receiver=protection.outlook.com;
 client-ip=58.252.5.68; helo=mail.oppo.com; pr=C
Received: from mail.oppo.com (58.252.5.68) by
 HK3PEPF0000021E.mail.protection.outlook.com (10.167.8.40) with Microsoft SMTP
 Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.20.7918.13 via Frontend Transport; Wed, 18 Sep 2024 10:06:30 +0000
Received: from cndgdcavdu0c-218-29.172.16.40.114 (172.16.40.118) by
 mailappw30.adc.com (172.16.56.197) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.39; Wed, 18 Sep 2024 18:06:29 +0800
To: <jaegeuk@kernel.org>, <chao@kernel.org>
Date: Wed, 18 Sep 2024 18:06:18 +0800
Message-ID: <1726653980-590956-1-git-send-email-liuderong@oppo.com>
X-Mailer: git-send-email 2.7.4
MIME-Version: 1.0
X-Originating-IP: [172.16.40.118]
X-ClientProxiedBy: mailappw30.adc.com (172.16.56.197) To mailappw30.adc.com
 (172.16.56.197)
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: HK3PEPF0000021E:EE_|JH0PR02MB7375:EE_
X-MS-Office365-Filtering-Correlation-Id: 3a8e5736-11ce-4f3c-0eb4-08dcd7c99151
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|82310400026|376014|1800799024|36860700013; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?EumWgvz2Uu+KTv92Heo4aHCfRNTgirWHg+VFNwDHDM0rh4X1x1ufp+7ybb8w?=
 =?us-ascii?Q?qr/gS1Ao2I4DGdW7OChG1bOcF/NAp++eqaGhxyzj5iOWoHduVOEGMmy27lPA?=
 =?us-ascii?Q?ziIfU/Qx/pwKrKZ2OM4jtXLcAoWtV4ICMg1+vd+sUCjDv//OtEEKMWz03ux+?=
 =?us-ascii?Q?xUUr7XLlr1UENywBcfUZZfah4mqtUnWPwcjktALFgnN6q/r/FiNjcnQqD+tx?=
 =?us-ascii?Q?BNPhFjopJXySN2oklIU12BHXZh69hnisIbICppXyhID4ys4unp4kD6gABmhP?=
 =?us-ascii?Q?TM1YfzMEuxSbUKUVwpzWuAzfqpQc+bMoKDWsRuJ/NmItscv90m1x/jHzYUk8?=
 =?us-ascii?Q?lfybk5gJN9AsBmfO0LOttUOhzGfbgn0F1lbyRXgxhfFffvzyivrEgc84Y2Oh?=
 =?us-ascii?Q?HVgC8wYaa5FpTmEG0iDCnHxvKfDCAh5v6FnNwCEbzuRjlcx/dTGDomG1RPVZ?=
 =?us-ascii?Q?Xf/TXtpa7QoIfPwD9hjHinwSUUG2QMHXvHCxEm4vJoRmUWdMWcXZcGwtzmqN?=
 =?us-ascii?Q?+dEt5nNltETG4bg+eMBzmSJzUfzZYdCAKj7Qboi2YmI5/fUDc0Z+rW3Ka36R?=
 =?us-ascii?Q?zAVtgZeRY55nyQCHUeG9USrnJIts/Doaq0fGBhADPVPJLSJMhyoFbKEWIpAZ?=
 =?us-ascii?Q?HgC4FiMeFvCGgdvAObddpsYoJhe716uvA+fbahjWSI/PpKW60jSkYaZxYFeS?=
 =?us-ascii?Q?Mjq+6iMNvJ9GDpoqFIOo7t+tXsMF34myQhYR+XFFZyAF0r5svnub+0mDvUoS?=
 =?us-ascii?Q?w5qu25MiA+l3IubY/jNcW9mzX+DiLId/+EHSL6QImS7McJ1QyS+2llkD6jzB?=
 =?us-ascii?Q?EAyDWOMOv9+Xqu25iO9U3FOytF0zjR7j7awFGCwrSHJS+BXFw7VCaejbMB89?=
 =?us-ascii?Q?tJ5/kim4hG8e0x3Y9YbpecxmonGvo5HEdRxN+kxeu16GIrwmqtjy7gdPITV3?=
 =?us-ascii?Q?v9VplccmA8D4fDZqbnpixk5qAw4hBrdU0+oUDk6zEDO4xKKHAgPq92dpQUvo?=
 =?us-ascii?Q?Lo46bxbX4Yr7wcacrSHgSSMQf2xWQVpSw3zySk7w8GvUVKWnjx7oKvB4j/tk?=
 =?us-ascii?Q?jjyFsE6SapqNjaekpC2SE/JSWTGaPgaLrJF/6Ekfr5vVuOV7skQujuMztn/e?=
 =?us-ascii?Q?y/7Wdgu9PVqFC4Z1zTBBHANBgLX6+3gF6Rk5XGTZBNIdMcQl58qD83dC8tpS?=
 =?us-ascii?Q?iYDrnpyGUfBEzAmXN4fWJR0TTu8KqUKjJ7WvoGEfULLHk1iFrTe+Yf/bBTUF?=
 =?us-ascii?Q?QYMgsyZWvxrT0vuQX4HzAn4LO+rTUp7eMwrxxq1lqP8olYTaF5esZ6qKwrKp?=
 =?us-ascii?Q?pvxYCsKwBLkVoAy9Mm7C+b/cepiePgbjEVxPzScsvVmD62Fp5+uqp69W/tOH?=
 =?us-ascii?Q?vbgc7y1VWOMUBTUjS8hANiSOaGTjpV9ONpjDUrEZhUl5vGtyAfyisMHwpIqx?=
 =?us-ascii?Q?iHkM6OCnXieA3cwAOOcQmKJHunaKY9Rn?=
X-Forefront-Antispam-Report: CIP:58.252.5.68; CTRY:CN; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:mail.oppo.com; PTR:InfoDomainNonexistent; CAT:NONE;
 SFS:(13230040)(82310400026)(376014)(1800799024)(36860700013); DIR:OUT;
 SFP:1101; 
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2024 10:06:30.4455 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 3a8e5736-11ce-4f3c-0eb4-08dcd7c99151
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=f1905eb1-c353-41c5-9516-62b4a54b5ee6; Ip=[58.252.5.68];
 Helo=[mail.oppo.com]
X-MS-Exchange-CrossTenant-AuthSource: HK3PEPF0000021E.apcprd03.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR02MB7375
X-Spam-Score: -1.2 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: From: liuderong <liuderong@oppo.com> In cost-benefit GC
 algorithm, 
 mtime will affect the selection of victim segment.For a large section, mtime
 should be the mean value of valid blocks, in order to select correct victim
 segment, it needs [...] 
 Content analysis details:   (-1.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -1.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.87 listed in wl.mailspike.net]
X-Headers-End: 1sqra9-0003hh-B1
Subject: [f2fs-dev] [PATCH v3 0/2] f2fs: modify the calculation method of
 mtime
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
From: liuderong--- via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: liuderong@oppo.com
Cc: linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

From: liuderong <liuderong@oppo.com>

In cost-benefit GC algorithm, mtime will affect
the selection of victim segment.For a large section,
mtime should be the mean value of valid blocks,
in order to select correct victim segment,
it needs to modify the calculation method of mtime.

v3:
- add new define INVALID_MTIME and rename new API:f2fs_get_section_mtime

v2:
- modify new API:get_section_mtime

liuderong (2):
  f2fs: remove unused parameters
  f2fs: introduce f2fs_get_section_mtime

 fs/f2fs/f2fs.h    |  5 +++--
 fs/f2fs/gc.c      | 23 +++++++----------------
 fs/f2fs/segment.c | 38 +++++++++++++++++++++++++++++++-------
 fs/f2fs/segment.h |  6 ++++--
 4 files changed, 45 insertions(+), 27 deletions(-)

-- 
2.7.4



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
