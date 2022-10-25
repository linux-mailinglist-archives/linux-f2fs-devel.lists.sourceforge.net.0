Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id ECFEB60C404
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 25 Oct 2022 08:50:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1onDm4-0003HA-By;
	Tue, 25 Oct 2022 06:50:56 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <frank.li@vivo.com>) id 1onDm3-0003H3-1O
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:50:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9kTFwIpKCO41V09Jhhe6dgE98wIEtEgOZvh9GCH28zs=; b=RfOmAgx4RyYuwVbTkaPBlYtF5I
 ly7ez4oE7g71TFrAyVLqhUk8cHWaWfx3FgS1oMcFCniFoJRIvhanpiO1eaOjURi6QTtW+XEMV4EGW
 fU/0t9LpCgqJWzuHc0j1EqEmL3hGiG7fsg5Gdf8zrKrmceEzuL+J1zLPyJ2j5Y36s0vk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9kTFwIpKCO41V09Jhhe6dgE98wIEtEgOZvh9GCH28zs=; b=OgQ/zqcFYv2vtXZF8k+DU8iFFz
 ZkLa9AIXgFfzAB3mLBH75ydoZA5GN/31YFD+59swU56c3x9eq+gKz2US2SCq9ZdJKhop+hnaX4Z0r
 Lc+gI7ynXPRtnSlCNyvFxnqAi4oomW0cZD8k9+oIN1Ie1yF636IQPpkUyiOMmrlDFcpM=;
Received: from mail-sgaapc01on2094.outbound.protection.outlook.com
 ([40.107.215.94] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1onDm2-00GZSx-Bh for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 25 Oct 2022 06:50:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fx2Bcw38WutwRfMIB/Mees+ThzWUKSS4UFSCERVP9JPetQyV3hIK5/RVjKnD5vEed3RBO4cB06AmCzi7SIyWWW9BArplKc1nW+Kkx49Z3AUCAiisZjuUeqWckri9GAImwPGvkz6SXdqNPzrP/rQ5Bh0mQwvftX+S74yjRQLWL7q6vfZQtWAkYIVO2+snv3KDYjWJTx1HoU9gpII1isShqmNAeda7PQspdqikqsPPFWFh1jRsQhACHFMPmf5AJA/Fj/89dIKc7leZnevUasmXFb6zoBLTd2F154lQSOHvRM3vjoji80K8tVECfI5CtrjMAN0FrhdU/LhZ0zKdlkc5Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9kTFwIpKCO41V09Jhhe6dgE98wIEtEgOZvh9GCH28zs=;
 b=jqvuG7/S6ERWhpCdZPfVMd8civILO/mOUUsLuGxqC1/jQMaJEXL9tgXsFVEPhFRTvIhzXH+vpQeUWfK9kqQc8IhfqvkEjVTLiEn27alXiHijg+DhO2V5DZ8bZgr0hwXvM7nCM7Pohy4Vq5ZwxD1sUrtsi41mfKnoKtW9rib4sI8hVmD+Sf7c9qRKcDn9mRH2ygRQwupXy8kcl2RE0TATnSiZIzGlIJ+CVXZzqx76Bv7eEMfIHaWGWxZbBcF8HKMZeZDy9Uiju/eXmDQ4MbpIZCQfaBKnGSuSXwwUp27CAcdAvHj5erjjXvvQvegqnr5VPrOQBquKKLiOnbWOOnlsGw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9kTFwIpKCO41V09Jhhe6dgE98wIEtEgOZvh9GCH28zs=;
 b=i8eK+n3fDSzsy/Qe9pmR6/xR4Tukj+PSRYhMgCeUfEYyX74DfdP05A3ix7t3vlVvS7mIB6CQtI1JRFA0LMHxQE+EDV91Uy3umRow28DX8G/9bOS4FSI4XIQdL7JXn/QLx1nrV31ZxC5TRLWrnYcQLwxyQXCx/o7tLkwgtmK5YzHgrzwcL23JkIJDZGhkgHoUZTGXbJ2nbqXUQzM60nKZgWD9WSyFkSORpZsAksL6qfAymIzIWN+ktmAlxl+dXNL4juAj+AJfhxS6TVsuKrmKfEr8VMJ0fmy37gUeZ3LobalSYAeMH7qcSKJgdAD7HBoNN6vPxkYoZKHVmtAMkoXU1g==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com (2603:1096:101:78::6)
 by TYZPR06MB4144.apcprd06.prod.outlook.com (2603:1096:400:20::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.28; Tue, 25 Oct
 2022 06:50:41 +0000
Received: from SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd]) by SEZPR06MB5269.apcprd06.prod.outlook.com
 ([fe80::c84b:5a6c:d66f:c0fd%3]) with mapi id 15.20.5746.023; Tue, 25 Oct 2022
 06:50:41 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 25 Oct 2022 14:50:25 +0800
Message-Id: <20221025065025.35017-2-frank.li@vivo.com>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221025065025.35017-1-frank.li@vivo.com>
References: <20221025065025.35017-1-frank.li@vivo.com>
X-ClientProxiedBy: SI2PR02CA0053.apcprd02.prod.outlook.com
 (2603:1096:4:196::16) To SEZPR06MB5269.apcprd06.prod.outlook.com
 (2603:1096:101:78::6)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5269:EE_|TYZPR06MB4144:EE_
X-MS-Office365-Filtering-Correlation-Id: fb3dc23e-fb46-45e1-62ea-08dab6553b67
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MqfOoC1kfE994xCwngyRUx9IPX0EZMrZAbZZJMpa+qlm0v5+eeFnIjuu0Zedv9D0PU3/lkEg2fHarCNOwbGICmFTpLrD8PoOLarfvzqjpZT1BX2b2GzX4LbTFYVk2lsqsyXKLpHSkbr3t9Vte0sCcFXv1X96EzCKBsmg3ZSYU/YVq4X47K8nIz91KRFM3FecS8mN4bCQbwdSpL5EWMekioLT5R1CXQUfgfuoqPTx1shww3FKq7CAkLgVL7qmMTA5kvrRJjNRUJ5nQdFNp28ySzFGlqSfsQu58YP1qTw3prLiG4tnTTjSojriEuNCQm1LdBTzULwxE2d1uz4xWbMFWDH1U0LeB2gGANGz1HMU9MaFiQXvNvBuCrLnZV4+NNYuYWoMM87LYEDKIQYXSus+tSuqBah8+PqSzwutt4VpuarThnVfuJmWjFxC6/v4kOfiZcogVoxUX5r5UB0YUvHi/VbVcwy9N8I2yPucwIQE97Hk6QQLjU8eHpftBYY052kw4oJknrr6Yr8FrVOSXmrFkV4d7b1FFoyD81viuQj8BvjaHiA2joI02oupdFxIlfT2jQrbYuSNqf7xpUZtDciaXySJi7P3OmpDSMR5SyBoo4RMR1ltpY1tNUAhHJrD/Mzmn0rHFI1Nr7hNImr9fPGeQwqzM3h4icGuegfb72MqC1bjsY6l0IWB1gKn3Mz219P1rXTiBUF4KlEoikhmBHHJNn46svNHr9wUZM6Hd8+QEslJH90ABSkh94vrUk013XUsRmUFCCLK7f7bpJzXM+Ni0w==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5269.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(346002)(366004)(396003)(376002)(39860400002)(136003)(451199015)(83380400001)(186003)(1076003)(6512007)(2616005)(2906002)(26005)(38100700002)(5660300002)(36756003)(41300700001)(107886003)(6506007)(52116002)(6666004)(38350700002)(66556008)(316002)(19627235002)(8936002)(66476007)(4326008)(86362001)(8676002)(66946007)(478600001)(6486002);
 DIR:OUT; SFP:1102; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?S/9zz65tqCtO5obPalSNr08KQT1g6JqxlhOFCUIZi7KNUyThHpvUUM6NOeXg?=
 =?us-ascii?Q?T3KhPqPDJDlbogyxEFwofZQGuQIEFlXeGsP04cPr891+o0EHJlpqX2ExcyR7?=
 =?us-ascii?Q?kXMxqeYDoh4FPDeymzp6sgHPyUV/9zR77caEzQWh9M2wVc+O649CwPkaYXPx?=
 =?us-ascii?Q?c7VctYxxlgI3z+0c0Z5eVebRZn8Gs9FfudScQ9XSFnuoIsnKhGz8NtbcZumE?=
 =?us-ascii?Q?ZgsqoTMW8SntwphgXCsQM+fL6MR2SdOZ4JtEKr9t/asNoIB0dE0oLhKpkCA4?=
 =?us-ascii?Q?/OEq+5czqBDDXbfAlNsJvOshZM2YjXtj9vlH4EtREIC5C8ssuFwgVuKMHn+G?=
 =?us-ascii?Q?Y80dFz2lDU37o89G8UDq0CvBSBEFUJgiwgxM8l1O5XfQS6OXM8KkDGSUgMy7?=
 =?us-ascii?Q?RtLFX071yvaBgmKKOJ6xO4ad572BXRJlO1rQrE9sX1HMg+31BS7q7quF35aJ?=
 =?us-ascii?Q?WyUIbFEXklNwXSdRJ2gclTPsae4SCsRLVs6aMWTMV4Bo1Aw3JLylcGMqLe4a?=
 =?us-ascii?Q?1zquXa6gJU6TYtfgUMzzt3hEXUBUeEjzVhMjURc4FwmYifbvbf7ukB4KhKFW?=
 =?us-ascii?Q?VNZtqPF6pRe1L8LY24u7KB8vNz6ORfZUXzkyUrCE79xea9UPlgSBN1miaLBe?=
 =?us-ascii?Q?H0DyYusI0rlqEM7GJmQZ4YSrZdNuyeC9Eh7xjm/7+2fyBHZi0imTLr20l6/c?=
 =?us-ascii?Q?h5RFmcNx/fv9M/G5tbIDHUu2hsrkHpJVZ2tlm2vL/e69j+0iYSK0R49+Ureu?=
 =?us-ascii?Q?eJLih+D6v5s7sx0hdLJZ2FkdNYpchdjgykdbqbc8P+mVRk/wqVqFRTdc2KpT?=
 =?us-ascii?Q?OB3Qq6M1+BZYsS+im99OXw9CYVF30qDpjI6ztGIF7roWUFeNRy0oYJbU+l3G?=
 =?us-ascii?Q?CqdYMkRvOdUf6pP3y1yZ0l44Qx7uIMoOREUilC6IndJlEcUoK/0hK5fUlwwn?=
 =?us-ascii?Q?Y6E7Wxd9i1PsL7HO61Sbe13udjiTkncBO1xwp2kewu4d8vp9Ym6GPPK7Vl/W?=
 =?us-ascii?Q?2B/6ajfT/73yluBjngRf1qqzqTmcbdjEm6TSVA8i7FPzDZOLg+6WqLODPN0s?=
 =?us-ascii?Q?Xs0cRjW1jE9TUTL1vgyoGccORMWrQDDcua5t0QuB9XuJnW4Pnxsmj9NZDCzs?=
 =?us-ascii?Q?OKUQrynfUcRnCUwxlbg27Egfsa6OtxcBcrWwTu57sDosxONorhr39Fm3Kl+H?=
 =?us-ascii?Q?cnoaISfFl2YsrpCB3o+9q+Wzls5jupLms9el+D2zKFDTJ4XUcd/xBPklLkqa?=
 =?us-ascii?Q?4rResL5URENdTmqGCNE9BByr/WjLKbKTokOvp8sH2x7wZfQRd2TGoB+fhRPf?=
 =?us-ascii?Q?66ebRrcgeiddphMC7u3G/Jzl+tSEQ8uBC/u2DLhrftaynLZixuaIuSK5ua3Z?=
 =?us-ascii?Q?ME/QtvYEoitVmoUQ2QkL0nOC88UvObB/9ItxjfxoTfTFyMjG8XABKtalnKNv?=
 =?us-ascii?Q?48XdNRAXzeaU5iCQCsR1rArcqteN9ciGoVWb7J4M1i8uWNECdzbCaB6S0hP0?=
 =?us-ascii?Q?iSZuC225iDiMwG955c+IG2UfvBosrFfNexQtZZ2AcNgDvJ157fyd9bKJbnXm?=
 =?us-ascii?Q?+f90tcQQ8K9b78RRaicad0mQWR65rqnCS5Zw/3or?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fb3dc23e-fb46-45e1-62ea-08dab6553b67
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5269.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2022 06:50:41.3015 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: nMkOK1c7pUfqdsHj7Im2r+oAVfNpxep/cWawZmvHHCmrcuo1aZwCzp0bL+wnnC8cOCILMOg9B8gsg5mlYc/kvg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB4144
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Added a new sysfs node called gc_urgent_idle_remaining. The
 user can set the trial count limit for GC urgent and idle mode with this
 value. If GC thread gets to the limit, the mode will turn back to G [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.215.94 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.94 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1onDm2-00GZSx-Bh
Subject: [f2fs-dev] [PATCH v2 2/2] f2fs: introducr gc_urgent_idle_remaining
 sysfs node and mark gc_urgent_high_remaining node deprecated
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

Added a new sysfs node called gc_urgent_idle_remaining.
The user can set the trial count limit for GC urgent and
idle mode with this value. If GC thread gets to the limit,
the mode will turn back to GC normal mode finally.

This method is not only applicable to gc_urgent_high,
but applicable to all gc modes. Also mark
gc_urgent_high_remaining as deprecated, so that the node
can be removed in the future.

Signed-off-by: Yangtao Li <frank.li@vivo.com>
---
 Documentation/ABI/testing/sysfs-fs-f2fs |  8 ++++++++
 fs/f2fs/f2fs.h                          |  6 ++++--
 fs/f2fs/gc.c                            | 12 ++++++------
 fs/f2fs/super.c                         |  2 +-
 fs/f2fs/sysfs.c                         | 14 ++++++++++----
 5 files changed, 29 insertions(+), 13 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 483639fb727b..859c4e53a846 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -598,6 +598,14 @@ Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	You can set the trial count limit for GC urgent high mode with this value.
 		If GC thread gets to the limit, the mode will turn back to GC normal mode.
 		By default, the value is zero, which means there is no limit like before.
+		<deprecated>
+
+What:		/sys/fs/f2fs/<disk>/gc_urgent_idle_remaining
+Date:		October 2022
+Contact:	"Yangtao Li" <frank.li@vivo.com>
+Description:	You can set the trial count limit for GC urgent and idle mode with this value.
+		If GC thread gets to the limit, the mode will turn back to GC normal mode.
+		By default, the value is zero, which means there is no limit like before.
 
 What:		/sys/fs/f2fs/<disk>/max_roll_forward_node_blocks
 Date:		January 2022
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index e6355a5683b7..2bad69cf9fd9 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1734,8 +1734,10 @@ struct f2fs_sb_info {
 	unsigned int cur_victim_sec;		/* current victim section num */
 	unsigned int gc_mode;			/* current GC state */
 	unsigned int next_victim_seg[2];	/* next segment in victim section */
-	spinlock_t gc_urgent_high_lock;
-	unsigned int gc_urgent_high_remaining;	/* remaining trial count for GC_URGENT_HIGH */
+	spinlock_t gc_urgent_idle_lock;
+	/* remaining trial count for GC_URGENT_* and GC_IDLE_* */
+	unsigned int gc_urgent_idle_remaining;
+	unsigned int gc_urgent_high_remaining;	/* deprecated */
 
 	/* for skip statistic */
 	unsigned long long skipped_gc_rwsem;		/* FG_GC only */
diff --git a/fs/f2fs/gc.c b/fs/f2fs/gc.c
index e0ff99c7e3f2..0ed5b3c5922c 100644
--- a/fs/f2fs/gc.c
+++ b/fs/f2fs/gc.c
@@ -152,14 +152,14 @@ static int gc_thread_func(void *data)
 		/* balancing f2fs's metadata periodically */
 		f2fs_balance_fs_bg(sbi, true);
 next:
-		if (sbi->gc_mode == GC_URGENT_HIGH) {
-			spin_lock(&sbi->gc_urgent_high_lock);
-			if (sbi->gc_urgent_high_remaining) {
-				sbi->gc_urgent_high_remaining--;
-				if (!sbi->gc_urgent_high_remaining)
+		if (sbi->gc_mode != GC_NORMAL) {
+			spin_lock(&sbi->gc_urgent_idle_lock);
+			if (sbi->gc_urgent_idle_remaining) {
+				sbi->gc_urgent_idle_remaining--;
+				if (!sbi->gc_urgent_idle_remaining)
 					sbi->gc_mode = GC_NORMAL;
 			}
-			spin_unlock(&sbi->gc_urgent_high_lock);
+			spin_unlock(&sbi->gc_urgent_idle_lock);
 		}
 		sb_end_write(sbi->sb);
 
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index 3834ead04620..f90a8c0a53ec 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -3616,7 +3616,7 @@ static void init_sb_info(struct f2fs_sb_info *sbi)
 	sbi->seq_file_ra_mul = MIN_RA_MUL;
 	sbi->max_fragment_chunk = DEF_FRAGMENT_SIZE;
 	sbi->max_fragment_hole = DEF_FRAGMENT_SIZE;
-	spin_lock_init(&sbi->gc_urgent_high_lock);
+	spin_lock_init(&sbi->gc_urgent_idle_lock);
 	atomic64_set(&sbi->current_atomic_write, 0);
 
 	sbi->dir_level = DEF_DIR_LEVEL;
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index df27afd71ef4..2b1c653b37cf 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -531,10 +531,14 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
-	if (!strcmp(a->attr.name, "gc_urgent_high_remaining")) {
-		spin_lock(&sbi->gc_urgent_high_lock);
-		sbi->gc_urgent_high_remaining = t;
-		spin_unlock(&sbi->gc_urgent_high_lock);
+	/* deprecated */
+	if (!strcmp(a->attr.name, "gc_urgent_high_remaining"))
+		return -EINVAL;
+
+	if (!strcmp(a->attr.name, "gc_urgent_idle_remaining")) {
+		spin_lock(&sbi->gc_urgent_idle_lock);
+		sbi->gc_urgent_idle_remaining = t;
+		spin_unlock(&sbi->gc_urgent_idle_lock);
 
 		return count;
 	}
@@ -826,6 +830,7 @@ F2FS_RW_ATTR(FAULT_INFO_TYPE, f2fs_fault_info, inject_type, inject_type);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, data_io_flag, data_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, node_io_flag, node_io_flag);
 F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_high_remaining, gc_urgent_high_remaining);
+F2FS_RW_ATTR(F2FS_SBI, f2fs_sb_info, gc_urgent_idle_remaining, gc_urgent_idle_remaining);
 F2FS_RW_ATTR(CPRC_INFO, ckpt_req_control, ckpt_thread_ioprio, ckpt_thread_ioprio);
 F2FS_GENERAL_RO_ATTR(dirty_segments);
 F2FS_GENERAL_RO_ATTR(free_segments);
@@ -953,6 +958,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(data_io_flag),
 	ATTR_LIST(node_io_flag),
 	ATTR_LIST(gc_urgent_high_remaining),
+	ATTR_LIST(gc_urgent_idle_remaining),
 	ATTR_LIST(ckpt_thread_ioprio),
 	ATTR_LIST(dirty_segments),
 	ATTR_LIST(free_segments),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
