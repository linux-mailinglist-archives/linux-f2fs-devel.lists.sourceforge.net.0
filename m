Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9916E9B494D
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 29 Oct 2024 13:12:11 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t5l50-0002d9-DZ;
	Tue, 29 Oct 2024 12:12:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1t5l4y-0002cq-Lg
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=MQfwO9bSjijqmphNvKjfaILHF5bB+UDG34IJMEyGfD4=; b=hr+7ebY0P64UQNMFrq0Pc7c5DA
 suhKsZ6+C2tQjX9dMDKKZB1yOzBi1rHXuF3Lt/zX6f36PWVtIHUxjd+s7J0K6v18uf1v5sh5FN3j7
 3lB9JI5SogyBKXM8S6bNfIvLqU+rnYBcIRfMyyf+qOho+kF9Rw951Y6GF3prrC+dS0CA=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=MQfwO9bSjijqmphNvKjfaILHF5bB+UDG34IJMEyGfD4=; b=P0DxQmw4IzEC9ndsdQlzTNfflP
 Q3ETfeM+jlijE08mnXNKXazYCMPJv+rpcBybp7Y45pS65jQP8wnZQEnCJt38QTxApW4R/OSYkpo/e
 7c29kRg/gIPMuvCgsJ58cVcD1pjAd0WjyaI+jYKLauEWo6X5V3NveTpm6GAldQ+N2GOs=;
Received: from mail-koreacentralazon11013051.outbound.protection.outlook.com
 ([40.107.44.51] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t5l4x-0007Sn-Nx for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 29 Oct 2024 12:12:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=B5Kj5dAHyb/7oJooS7W9YVoQJlhjLA+I1ltR9y8pYcfNCFzWyTsMaguwXUXGJ/jWahBWhCiS64vPvDL1wsXMUxOvpbjhS0xFcVSvL47r5e4W/VHtAzA+9Bahev+xtj6YPSdAyAEAFXOIMJ+DOI9ZniD9bHEMqfBJabqZNIdlstaPcPgLP6KyhZ5xatP9EPMdp79nTu7tDG0tC2mC7mbxuYENiki/1RuFEC91tB882xmSR6460dvI88qVGRUBHNJ+S6V2AbQZFdq5Xr635GiERnBGFIS2i3Gkv7BrBJTvk55dy3FUgUA0qWvqa76sQ3WMtyyf4dOtBwUWSwJCh3kABw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MQfwO9bSjijqmphNvKjfaILHF5bB+UDG34IJMEyGfD4=;
 b=mupdDR+3J3vdM0zl4BfGM1MpvNsApaR6dk3/mNA5ZhfVKCdRFwGZvswGF0P89Fq3jLAFtzrOkokbLTBqm3gFuU8LiPVPmnt+EeiyXlr9wmTTE9IjZKkbXd5uefOy+r95Y+G3WCgSuT20+1Hpy2v94n48nSZxH0eXp9hMUkzNUhgDEkLq+NteQ8Y19h9IHtoWKpqeaCwg7MEmRILqMvnrNgf/muAh7XlBaNON4i6XvFtkvmwSizvygNwTgt+Ly5GXGnKCyguls8qT1fQqJA39Vxdk5C1YShNCW4W4vo32QVmPe+3BjgMJ/EetJT5p/TzWmIV+2I6fxPUMzlnf/mWHAw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MQfwO9bSjijqmphNvKjfaILHF5bB+UDG34IJMEyGfD4=;
 b=VyAxOq++GwrKDgQlG0gdM4KsTjg0Lv+DzCRvzCAABr+1GWTVJwptJ4Skg8s6oTiSXXb8dFs3n4/Qc7vjp+ikJWTsGRd3Uk7xhTFfj2Q8y6Kw9hXnuhJNbzaroM9o3217V/Rf5QocAyJe8ZzRnNH1PDgeMdKXC9t18W7ZrKOODuQ=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TY0PR02MB6982.apcprd02.prod.outlook.com (2603:1096:405:e::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.25; Tue, 29 Oct
 2024 12:11:54 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.8093.023; Tue, 29 Oct 2024
 12:11:54 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 29 Oct 2024 20:09:54 +0800
Message-Id: <20241029120956.4186731-23-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20241029120956.4186731-1-shengyong@oppo.com>
References: <20241029120956.4186731-1-shengyong@oppo.com>
X-ClientProxiedBy: SG2PR01CA0175.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::31) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TY0PR02MB6982:EE_
X-MS-Office365-Filtering-Correlation-Id: 86eac41e-41a1-4f24-4dd9-08dcf812e070
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|376014|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?MnOieXJqw0ZKJz5l12yKa8HrHQ3bM2SmXVNh+cBupPHP1zfk97RYtbETBMOa?=
 =?us-ascii?Q?5J58fVVx6eADxPv5qssBQQtWx4hWYTyTSz11xWmhzFPlPFwkQTGy3Lfs0jxy?=
 =?us-ascii?Q?MEXqyY6fJGY3XP8kLdOK3y7VS8PVDzz+RwhYkFScNplGfr/FR47Ykm3xyFLU?=
 =?us-ascii?Q?lvn+tdz5UcJw1XjDNZ1X+8mWPwrOsQMM07MuLSxmIEAEapYs2XgPN9144VDT?=
 =?us-ascii?Q?p1EUHNAf++X/MiHIKi3KZKT0QKw9ELd3Oe8BH+/IlSlSXn4EPWpVPd4Gbsd4?=
 =?us-ascii?Q?RTZUL6ykefhla464swvbbqezDkcExG2b/GcnJfmdnCnEImVQf2VDbHbkb3eF?=
 =?us-ascii?Q?5y+uISSqD5UFi3mHsvzAtqv+Msv9VesdKNR+BXUt/dofDcn2c6xWx1LXJD6/?=
 =?us-ascii?Q?5ahBOPRjSltRJToceum9tt1IKlZG0WRLho1ZpJBFtgptuUp3n2J2/xAb2dIK?=
 =?us-ascii?Q?2Q5wujq0qEfDvfXDxdgUYNriBpyklc1P5OfXJnNPgUeo+UbopgdKHauJ7uJx?=
 =?us-ascii?Q?kP6uRNI22bYpyZOzbsWeiHIYR+gasmB+8QIQ/ajGaFrk6AiPm6xJ6zGJ9z6a?=
 =?us-ascii?Q?L2WbTOJn2QnQnw/tIS1RKi+PzWBdPeC02GpKySg7PEQWXoKRQ334hWSIdITe?=
 =?us-ascii?Q?oMHFXc2IMf7/hEkgDEXMKQ4KKIqxNxfmdbzv7MzqHOi/3tGvgMQATaFGT7DZ?=
 =?us-ascii?Q?n1bmkeFPvaSpK5PcWACxUW52uv2HPopzZHAwZ2ldGZ4d/1pUiPYGFWN8aEnB?=
 =?us-ascii?Q?lMlvnulzW4iXeJlZf68/aT2JLwva2VlrzUmFldG3gpWHjUdSYNZEIXccMVw3?=
 =?us-ascii?Q?W2jmENKFdI3Cc8foIeRh2z2bN5Yj7f/5g8d134CiJvNXnQXjp/mNOpKgtUzp?=
 =?us-ascii?Q?C5bP+P/1NbLXgI25/xe3Ic0Z9EJBtNAl7TyjoS315afkOZfm7lP1bOddUjOv?=
 =?us-ascii?Q?60c3ZiTw6lykmcZnNbHDs8v82l5L05JqFXSbUE+zXtP7gb8dTIoQq1hOXWaR?=
 =?us-ascii?Q?0kGu+6d2cOWfE1tlGYN9qnc0jV699Q9Q3EGi7RS4QZMt3VxeOCQgAtHYNidN?=
 =?us-ascii?Q?Rq/+rCaNEtSaURPeRWQus0kYrNpe9PEkujk6s+dBkyrIbOiDcD0JUpWtniJy?=
 =?us-ascii?Q?b4BrS1z2Se9rfvlAeuqneDD2Ii7GKJ9EFi5jbpdCIGSrRnLkuWc911ZqKm14?=
 =?us-ascii?Q?fy8MvEoHFrk9yB99ItBAPmu2kUctr9rcd9/4PZpRPQvcGkw5amezI96lU+Wm?=
 =?us-ascii?Q?XhawdzZMUd0qoJ6StybkaUB6obGzqn1/Q7UGuGy6vcxMAPDfgz1LONT0tWI9?=
 =?us-ascii?Q?HbdWHGIgzPAxGw5gqZtKIdVnb4HM4pr6w39aY/IQWyrL48YBjwXi6MZ/4tzS?=
 =?us-ascii?Q?KybWG4k=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(376014)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?tZSESRb3vR+yjGCAeaflxLCLnCi3f5ZvUJ9j7YSNFDl1e14jXj/Bg7Go+VOv?=
 =?us-ascii?Q?02Vm0cPgctrcFw1AEZanRKx8yeqNKX4LpadI7BzdyQYBilMxeILpMP658Oh5?=
 =?us-ascii?Q?xaUlRiYvPON3BMLEtidsmxuN5LiT05yCmJvAEJTmBCs4bvtrEdnLT+cp3xwi?=
 =?us-ascii?Q?RKb/RsE8Lf9Mq3OkfyIkyqNw0e/bxGhau9KayDuKk2pR1VLZGXh0xspLrbAT?=
 =?us-ascii?Q?fFA3AgkzXjs3FLjKngRy8YL9QyztZvgiL/5QAqDaOIQsqSX+aE3bJnd9pix8?=
 =?us-ascii?Q?U/Hfbj4Avy/sKihYA5+dGsrbnxTWSoMnuLIGsjDio8SCD0/wc65JOOlyOZXb?=
 =?us-ascii?Q?+dj8pveU9LURJojemZ93/szbHV5GuR4aMLhTxz855e+i09qhOvuEey10f4Qk?=
 =?us-ascii?Q?VVeS201He7lbSZx3eqPvAh8S/nJf4FUnkDrQ4FZU5GY8hjIujLEWKw0SrwwU?=
 =?us-ascii?Q?sb0OV4EMXQeJujncyyx1UathDW6FJjSAoJFTcnnuLjahWhVzcJd6IHTmiEBd?=
 =?us-ascii?Q?/KxAs/U+HKefxb7MxL1BNzs0WP9TSk3rAPK8rXUeXs2kYxhT+26EJzguJGce?=
 =?us-ascii?Q?FC71RP+/POhNfOJHW6yK4e6x5x4B9tz0kFPwXbt5N4959Qm67Seoq2KLPw+3?=
 =?us-ascii?Q?LqvKnDbjO15WrswAkP/xMWOqki3I7lPWg0lXo7BIjOmXOHK7KoLtkwqOsCBZ?=
 =?us-ascii?Q?ubJC0uf7pXFHtXXoRni0bjJuo9CpypDfz5XTohQW77Ae4MYvtrFuttq1g0M9?=
 =?us-ascii?Q?z9SyeDonpl4poePDDxkFeaFplSqxhGQauaBO+QUaRr7zjzuHo/h5pSuNgJPy?=
 =?us-ascii?Q?FY+tRtz/vjZboR/Hjn4tIyR5oq05Yy1lLSFNXWSrpSjvQrFqLTo7XNxqVlZ/?=
 =?us-ascii?Q?/Acam+vGTpK7IxjMTxj/7PDRYpKwMjB6LETlfqWTlfF6kv9T94jD1IFCNcdR?=
 =?us-ascii?Q?UPXBzRzQByV5PX/Fu7dnXO6OJ+OzTOtKPngkK4Ewa/kMzz3ksBTjfgp2UXYJ?=
 =?us-ascii?Q?I+hv/uAgTBZi726XvMlxQ1j9VppLKTm3OVrIcdAQNEyIWzWQ4QMFCbVyUv/L?=
 =?us-ascii?Q?m9aHiYxDMDK5auIfxJzhR1I8jBrAuuKe+DXiCKJSiC+330zxYNGVuwo9p5lr?=
 =?us-ascii?Q?7HBpp654AkV5H5iVl5HPNpdRkOpD5IPM5U6eVj0LDKzLS/hrL38SK96PjoVX?=
 =?us-ascii?Q?Xt6ql7nV8FqrkWiXXc0gcm9zlb9qRHv/70ynHDo2QMLJCWm2bRnDL3Davpc1?=
 =?us-ascii?Q?7yHu2trXRQpUY/Dfhn0KGVCanaTVKKNa6M5waV32Nd9JNlDo5p/CiBB3hRxB?=
 =?us-ascii?Q?AI44bF7ZjJw8ok6rMYbBUBodn8Gh3B6SYu6JQ12YuC1dyRoMTuJaFJfCshTM?=
 =?us-ascii?Q?RegrUXQZK29OkmSbXk1hOOJH/6H9DWqq/ps1YFXUTKXtD7AVxR37iWkwi2lf?=
 =?us-ascii?Q?jYOe1tDMKU8xVMJCd8m9yCQPSXbFKCJU9rbiMH4t+7ud1aqt+vzEokngi0Xo?=
 =?us-ascii?Q?qR6vXp8xlZpXbLpLZrez0diJ1VK74rSSSbJaZZIi/ufx4Xx4+HCxuORhEH4F?=
 =?us-ascii?Q?GbAPBgFKdXA1XyfQpPGjegO3y53vHDCBX4w9c88y?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 86eac41e-41a1-4f24-4dd9-08dcf812e070
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Oct 2024 12:11:54.0053 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tDY5xAwK6Yub5nTiB4T209pnYjiL2HA3D64TzGRy514/nnEEcAsHIXe8n6TJxUEdfiZW3Sb6HNTKwvZ4Gl2yPA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR02MB6982
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Signed-off-by: Sheng Yong <shengyong@oppo.com> ---
 tests/f_dentry_lost_dots/README
 | 7 +++ tests/f_dentry_lost_dots/expect.in | 74 ++++++++++++++++++++++++++++++
 tests/f_dentry_lost_dots/script | 46 + [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.51 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1t5l4x-0007Sn-Nx
Subject: [f2fs-dev] [RFC PATCH 22/24] tests: add fsck testcase of fixing
 lost dots
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

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 tests/f_dentry_lost_dots/README    |  7 +++
 tests/f_dentry_lost_dots/expect.in | 74 ++++++++++++++++++++++++++++++
 tests/f_dentry_lost_dots/script    | 46 +++++++++++++++++++
 3 files changed, 127 insertions(+)
 create mode 100644 tests/f_dentry_lost_dots/README
 create mode 100644 tests/f_dentry_lost_dots/expect.in
 create mode 100644 tests/f_dentry_lost_dots/script

diff --git a/tests/f_dentry_lost_dots/README b/tests/f_dentry_lost_dots/README
new file mode 100644
index 000000000000..f07a1165b8cc
--- /dev/null
+++ b/tests/f_dentry_lost_dots/README
@@ -0,0 +1,7 @@
+1. create f2fs image
+2. mount f2fs
+3. create a directory, and create a file in it
+4. inject dot dentry in the directory by invalidating its valid bit
+5. fsck fixes by adding a new dot dentry
+6. inject dotdot dentry in the directory by invalidating its valid bit
+7. fsck fixes by adding a new dotdot dentry
diff --git a/tests/f_dentry_lost_dots/expect.in b/tests/f_dentry_lost_dots/expect.in
new file mode 100644
index 000000000000..1d0f9572fcbd
--- /dev/null
+++ b/tests/f_dentry_lost_dots/expect.in
@@ -0,0 +1,74 @@
+Info: Force to fix corruption
+Info: checkpoint state = x :  nat_bits crc compacted_summary unmount
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 0, dotdot: 1
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '.' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: write_checkpoint() cur_cp:x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+[ASSERT] (fsck_chk_inode_blk:x)  --> ino: _INO_HEX_ has no '.' and/or '..' dirents, dot: 1, dotdot: 0
+[FIX] (fsck_chk_inode_blk:x)  --> convert inline dentry ino: _INO_DEC_, pino: _PINO_DEC_, ret: 0
+[FIX] (fsck_chk_inode_blk:x)  --> add missing '..' dirent in ino: _INO_DEC_, pino: _PINO_DEC_, ret:0
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Fail]
+Info: Duplicate valid checkpoint to mirror position x -> x
+Info: Write valid nat_bits in checkpoint
+Info: fix_checkpoint() cur_cp:x
+
+Info: Force to fix corruption
+Info: checkpoint state = x :  allow_nocrc nat_bits unmount
+
+[FSCK] Unreachable nat entries                        [Ok..] [x]
+[FSCK] SIT valid block bitmap checking                [Ok..]
+[FSCK] Hard link checking for regular file            [Ok..] [x]
+[FSCK] valid_block_count matching with CP             [Ok..] [x]
+[FSCK] valid_node_count matching with CP (de lookup)  [Ok..] [x]
+[FSCK] valid_node_count matching with CP (nat lookup) [Ok..] [x]
+[FSCK] valid_inode_count matched with CP              [Ok..] [x]
+[FSCK] free segment_count matched with CP             [Ok..] [x]
+[FSCK] next block offset is free                      [Ok..]
+[FSCK] fixing SIT types
+[FSCK] other corrupted bugs                           [Ok..]
+
diff --git a/tests/f_dentry_lost_dots/script b/tests/f_dentry_lost_dots/script
new file mode 100644
index 000000000000..711304785546
--- /dev/null
+++ b/tests/f_dentry_lost_dots/script
@@ -0,0 +1,46 @@
+#!/bin/bash
+
+DESC="directory missing dot or dotdot"
+
+. $TOPDIR/tests/helpers
+
+cleanup pre > $LOG 2>&1
+make_f2fs >> $LOG 2>&1
+
+mkdir $TESTDIR/mntdir
+safe_mount $MNT_OPTS $META $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot mount f2fs image"
+	exit
+fi
+mkdir $TESTDIR/mntdir/testdir
+touch $TESTDIR/mntdir/testdir/testfile
+ino=`stat -c "%i" $TESTDIR/mntdir/testdir`
+pino=`stat -c "%i" $TESTDIR/mntdir/testdir/..`
+safe_umount $TESTDIR/mntdir >> $LOG 2>&1
+if [ $? -ne 0 ]; then
+	echo "cannot umount f2fs image"
+	exit
+fi
+rm -rf $TESTDIR/mntdir
+
+echo "ino:$ino pino:$pino" >> $LOG
+
+# inject dot
+$INJECT --dent --nid $ino --mb d_bitmap --dots 1 --val 0 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META > $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+
+# inject dotdot
+$INJECT --dent --nid $ino --mb d_bitmap --dots 2 --val 0 $META >> $LOG 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+$FSCK $FSCK_OPTS -f $META >> $OUT 2>&1
+cat $OUT >> $LOG
+
+INO_HEX=`printf "0x%x" $ino`
+sed "s/_INO_HEX_/$INO_HEX/g" $TESTDIR/expect.in > $TESTDIR/expect
+sed -i "s/_INO_DEC_/$ino/g" $TESTDIR/expect
+sed -i "s/_PINO_DEC_/$pino/g" $TESTDIR/expect
+
+check_result
+cleanup post >> $LOG 2>&1
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
