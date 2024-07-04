Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 94FC4926DAE
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  4 Jul 2024 04:58:29 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sPCft-0001Aq-Hs;
	Thu, 04 Jul 2024 02:58:22 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sPCfs-0001Ak-QU
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=UxSq6aGYgWdV5QYItzXb6dqZpARJm+GjUW1EMpyQk/A=; b=jihGDNA9kDMX5De/Rgf2w9mfQr
 pob50h26P2RVd3rnqYIWC9xOJTYKsZpN2mCLDAo4XjSoJQSpgSZ1+Ywkrf6VE0++BdKxa5mr2L+u3
 b0m67bqlIRRjP7Kf6pdmhfjMiP4tgChKoa+WsoeIzdnmlspTPvl15j/Cl4OMUpK9WpCU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=UxSq6aGYgWdV5QYItzXb6dqZpARJm+GjUW1EMpyQk/A=; b=YVJx1M1PDD+LjHDzFeCpUVOQEj
 9mHizml7w8K18KyvmLmt4cu9bc8NzqPvD0JyKCATzDgXg09SYXeP7dtak7GWpTw+VGrmJS9d76+eb
 Gm/rk+u/OOm93GyeoBy/wEtCikEhYrIjgfNkEtpyAI+BUqERa7ef5dhqIQEvVTPjHRZ0=;
Received: from mail-sgaapc01on2042.outbound.protection.outlook.com
 ([40.107.215.42] helo=APC01-SG2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sPCft-00010i-It for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 04 Jul 2024 02:58:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=mNhbA/xnJJo2cNYWL+ICTGR2Lh7wcfQ35ddqQfGrI5xcZV6Jg7m9tn8vS1rZGOsE7X8SILGTV5/aHlc4Yoc7mW6/84x1f1bu9rJ5Z8I1EfU1BEbpoNlzvzOfyhSNqB+mlc7lK66fQPq528uCyzBGZBE7Sa0SFlNuOL/dNY3FIEI8jQLIywQvrAfAwhlOuoR6OPsgsi/Aq0RZDJv5R2ccoheTeGgDTuUKtWRCZSuBuOjbtt73XjHbiNc9vHsTWmozza0c2Qb2+isLjNX7AB4o5FsX62uwBHDL00YeTJp7XhJSu5KkkY6YtmrIuMCELY+yzYgasuErL3nmHhRCP5LFtw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UxSq6aGYgWdV5QYItzXb6dqZpARJm+GjUW1EMpyQk/A=;
 b=ewz79X877at7XfPALq1r3pRPBcDuKQqJtvfnpEMFeJhSeNi6hyx9+U96awsazSIl+pAMVSU9UQ3ttoN54BiFW2gTT2zn1RDNnTEXXXugQP/3yINg6ZRz2SiYpitWX4CPNxzcM3fVkooY2M+/ZmSkuAkYFY9QUyLveVpK9nu6MIIzFKWXB+fXG4vdiACIaiZSe2RdTHzQ/Sk3uUpocZTW5UFtUvjlnJ7isqu0yj8DCPBocyaG7C6yloayZELJg/PLJC36t+Py3FTVte+TD+zm1yNHyZkuihBtfCnIPRm3Lrd7Wr0eAzV6YP8agwfVrPo19uNcpkBnQxfSS7UCtXbduw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UxSq6aGYgWdV5QYItzXb6dqZpARJm+GjUW1EMpyQk/A=;
 b=vKoBbD+OMqpRgVf2NE15BHOM8Esz9/6rgzRfFeKpoB++HcIMsRCweJlZU7bM1W/Id/nMXReO+94N92HGtj+6VkxtvecNFuB5v3EviVcuaIoFv+PNTB/G5CqimkKB2DUqwAFPSRel85wkpa0o+UnrIygy2MJSpF8qG7QFob3/KPw=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by SEYPR02MB7733.apcprd02.prod.outlook.com (2603:1096:101:20c::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7741.25; Thu, 4 Jul
 2024 02:58:09 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7719.029; Thu, 4 Jul 2024
 02:58:09 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  4 Jul 2024 10:57:32 +0800
Message-Id: <20240704025740.527171-3-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20240704025740.527171-1-shengyong@oppo.com>
References: <20240704025740.527171-1-shengyong@oppo.com>
X-ClientProxiedBy: TYAPR01CA0220.jpnprd01.prod.outlook.com
 (2603:1096:404:11e::16) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|SEYPR02MB7733:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ad55b9f-ceac-48fb-3a50-08dc9bd52285
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?w9mb4xRgKtFR717GH0OsMuX7VxeGHVA3DxVExYeL4pjVpw/aP//ZGW1EuDn6?=
 =?us-ascii?Q?ZTlAgQF/XZCYNGRRImvLhi/H9Lkif1hzfsc9p3s05eSEMb8DRNJGJxVh1qIb?=
 =?us-ascii?Q?URebBtK/2u86V/cIm7hauwqWksVWflR3nZ95ipKEC1X4hQEf43HsZLKsjgJI?=
 =?us-ascii?Q?e+nfW62gZDYpB/t0f1mlIDwAULpCOFRvqKF2AbVHDwlkOUlxsxtH26iqpZbQ?=
 =?us-ascii?Q?V7xMHHjex7sUD0O3/yuDuWBM78f6qP/wvuLwlV+YDkFSmez7I1PNfCtcUT26?=
 =?us-ascii?Q?4ZiiA4JxpleIMXmRCIc6zOYGCM3PWRwJPj0qKgXQ2aSjYFUpxY0UPW07tDCr?=
 =?us-ascii?Q?qMgfVtzzwC17V7rABWm6gzapzd9CB3gAAX1DUJHU7VBbfUfji+iDXc19Deha?=
 =?us-ascii?Q?BsEtc7ePtjbHtSaU7+EQS4tbC6TkqKgyagM9bEvAdabk89S25mnbHQzqfLR2?=
 =?us-ascii?Q?p3+VfCXz6g8/q6Ll3W+Oa4bLE7Ps55T5e4hjBj++gv6FAzSTDbwSITB5TJjs?=
 =?us-ascii?Q?dAiBWs6m/WVGTb6etcD6Csm2VLzZrR6fGD7DnzCXnM3wdCUi6gvfb26eeol6?=
 =?us-ascii?Q?lYclH5YgrCuLRynl6283zmFn9uHboauSaDRZVhAq5PwkLRS4GkNw41rjr518?=
 =?us-ascii?Q?cbgBhDlbs64ccIOBeoSIfuDzl87T9o5aK5nJ8/U5r6JnVFRkDLFX53MpKI5P?=
 =?us-ascii?Q?QFTURTuNK3NIHQ/bDLU9B6Qv8owylvN+Of/GgkShPKCpqFxJ0heGRPxtWunD?=
 =?us-ascii?Q?c7TGE50KaMhE5zEHmtLznEy0cDVoGmd0avM5yp6k2ZAyQgqnKO0PPoa6E3+t?=
 =?us-ascii?Q?nb+OCgbKa/Yoky7aX1V1Ktt25ncrC18u162yt/WUCcymtEN6j0xypP5uPp7Z?=
 =?us-ascii?Q?mqoKh7sP4EHdC3QO1XCahraPhRRUbGEvQCcLOQHbQSkcVbH3YEPDKbmmrAR3?=
 =?us-ascii?Q?obnHtebtXY4+W1HGo6CyfhODW2e+rqfnk2ij4JdIjLGu47PvOfOdGerf6uPY?=
 =?us-ascii?Q?jkKBzlJsrhmZoSl9PXgc09wHaFA2mlvnJo5czNto6kTZYNaQF5Rw/HK9SJTv?=
 =?us-ascii?Q?OPgTZuUG9fhbUHhgJnReJxRfw+5zY6EZdmbV1iZhjrlJqXBZTL3MSWzIr+2d?=
 =?us-ascii?Q?BTEdpWcWBkMKC1WmAqkAelTVAkQdqMGYQ+cL5poIZbSoo6BK8wH+/2OlnuQa?=
 =?us-ascii?Q?g3MQgmjyoSKc5v66uabOxU2DZNfmbzl3GOnneJhCw6RirKq6X6fNh7rz+5aO?=
 =?us-ascii?Q?hhLJnbhZy1CzEHH8qJZDb3gds1e3YO5NcYtTtDTaz1sqB2RYFlnLhakpQHaC?=
 =?us-ascii?Q?Na3H5dwRekFXZAJS8uENJu31bhfSyISTrR2mDYmeDLqc2A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QWVwjZJcEGJPVFOAz49VU8tmYLzCsENBzpO0V9FZGOjiY3veUifgYryaHVUc?=
 =?us-ascii?Q?ZdnUE6Sf6HkMj/VlKufcV0j0+QJOphzp2/LB9Iuou7IntminXA6gHhYZfiPc?=
 =?us-ascii?Q?DFj3ytX8+NPQDiUJxUbwJq5BkmHPptPi0GNP0ySN9uRVaZWq8Udj2W8DoSM/?=
 =?us-ascii?Q?nlsauYlaHZK2mbmE9J1oo89XxQbl2GUiYOkK6w550O+NBi85wVf5vlZc9o9x?=
 =?us-ascii?Q?r3FW2ubjsuC0gtJhOhZWlZ3ddhWaYgJ7oP16fnvOdE7UdNIgLrjlHoCyd0Jq?=
 =?us-ascii?Q?PAwx2iVANXtgTfoVCsYWwjDG/AtX6dD+32zCjVR9SOHTioEeo6NVbJ2JQ/WM?=
 =?us-ascii?Q?S6OX3b0fcAfNpsOvrIfQrDNgKD1dDyil/VhAsf9MrGLtBbz46IPyyeuBq55i?=
 =?us-ascii?Q?aLc8a5iebcCMXxoyF/iqrWdecAU1xSTXplVYAuH9mBsqzGDojRdtezpBTeZj?=
 =?us-ascii?Q?Dghx+Okl+BScDV0XSTvOaEZxEBWBVf+rMp1WM6Hr+H3RWl6d0fDz+A51cPzU?=
 =?us-ascii?Q?2tpRPQO5wys29dFvA1U8B7NXMkz6CKoNKirrIWFMLgubwZbkvjR94exBT5Nc?=
 =?us-ascii?Q?hJI90al1aBUjGyZtErqAfcHOrNztuVTkYLAEOP5X0B1qhsEG36O6Hh4s5wHb?=
 =?us-ascii?Q?B9FoluQ3Ad9qmrpIOikV40WnJgNdCSOya+cWDB/Vo1RhnjR5uxV9xA1aUmFn?=
 =?us-ascii?Q?93YEu8NHLe8QkYW0L+J2iMJK/MJvufLNOnu/2+T8FAZ9L0p8EHYHcdvTPcMM?=
 =?us-ascii?Q?9QOw/m5+tv7Nfnw8F5vDv4Fb2Mod7G8sPfiP8t2YcgC5Jm9mUQ0TyrMh3hSq?=
 =?us-ascii?Q?x53mGuotixy8LdH9VQzmkqvS9G3F0ETHbDjaO3OvKQZJXxOzMOXnk3WnorpR?=
 =?us-ascii?Q?yb6vePu3SxfmsPAgcFzMOtKq1znC6cEa/1otyhCRQeWCmKa2iK6KCR4YqjQl?=
 =?us-ascii?Q?loDpiMMsHG74d9Sli72Q21A0JwcfYHAz+vs+H7gv1ja0PNFdcLlyEHybGvzM?=
 =?us-ascii?Q?D/z752YOKJgfMzvdjQt66xcdnr2PgEtjoswz7X7dn92WTiEowEvM3xTmAjiq?=
 =?us-ascii?Q?QAz9TjewIA2UkEsQ/5mw1m7Sa4FDd2WlfDbwZexAausFgaPQ27zGGZ3WLfqn?=
 =?us-ascii?Q?4lNR/eLTNQ8SricoNC142Nvb6hUQHjFbLeGkcYBD7vn966Nu18Zxy+f2lNYx?=
 =?us-ascii?Q?vhu6k1xNvIT3m06RuPD6LSyE4Mt3W+qWNhYmxQyNKrvhWCDB6kyP/J15tAbs?=
 =?us-ascii?Q?vIeaAlQkmAStV2diWK56pt1arDu3JDYUDZut0LkOGqrA48EueUKDTK3HXNiV?=
 =?us-ascii?Q?VvD4c9gOzREi44yz/fPEbPJf09zyKXTs1GGqO3hK1reZ3O2/LfbOi3ojy0z/?=
 =?us-ascii?Q?aDADwfrEG1Fnh0sJy7rjqQ1zBN4VNTxRggtAsmpLMce0mNDE5olHeXl/rJh8?=
 =?us-ascii?Q?hM9Eb4/TQ5pZUWTgbeiiGLVl4Fs5QPlJBDFUkJUWw/HkjGedh0Yd+vzzprWi?=
 =?us-ascii?Q?FBz2Z8DvHjK4TYz8cDtt71tfb5OPwXoIDqyzMAzAS614kSfY86+KGY/Wy338?=
 =?us-ascii?Q?qMybsPlR+ym/9QCow9j6K3cQySr6eKwecKS0w8tB?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ad55b9f-ceac-48fb-3a50-08dc9bd52285
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Jul 2024 02:58:09.1262 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1dt4/73XwUyMT/vqGQG1d3JGQ4iiXIK/S+VJ8Nyh2a8NMBFby8EH0SThY7GMcfCQn+mxtBq3OOomqmyAwRfXSw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR02MB7733
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This patch introduces a new tool inject.f2fs to modify
 metadata
 or data (directory entry) of f2fs image offline flexibly. With inject.f2fs,
 it is easier to generate a corrupted f2fs image, which can help verify fsck
 or reproduce userspace behaviors of some a fault. If option `--dry-run' is
 used, nothing really gets chang [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: makefile.am]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.215.42 listed in list.dnswl.org]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.215.42 listed in bl.score.senderscore.com]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.215.42 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
X-Headers-End: 1sPCft-00010i-It
Subject: [f2fs-dev] [RCF PATCH v3 02/10] inject.f2fs: introduce inject.f2fs
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

This patch introduces a new tool inject.f2fs to modify metadata or data
(directory entry) of f2fs image offline flexibly.

With inject.f2fs, it is easier to generate a corrupted f2fs image, which
can help verify fsck or reproduce userspace behaviors of some a fault.
If option `--dry-run' is used, nothing really gets changed, and that
could be used to get the value of a specified field.

The following patches enable injecting each part of f2fs.

Reviewed-by: Chao Yu <chao@kernel.org>
Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/Makefile.am  |  5 ++--
 fsck/inject.c     | 64 +++++++++++++++++++++++++++++++++++++++++++++++
 fsck/inject.h     | 28 +++++++++++++++++++++
 fsck/main.c       | 29 +++++++++++++++++++++
 include/f2fs_fs.h |  2 ++
 5 files changed, 126 insertions(+), 2 deletions(-)
 create mode 100644 fsck/inject.c
 create mode 100644 fsck/inject.h

diff --git a/fsck/Makefile.am b/fsck/Makefile.am
index 40d31b8..48402ab 100644
--- a/fsck/Makefile.am
+++ b/fsck/Makefile.am
@@ -4,11 +4,12 @@ AM_CPPFLAGS = ${libuuid_CFLAGS} -I$(top_srcdir)/include
 AM_CFLAGS = -Wall -D_FILE_OFFSET_BITS=64
 sbin_PROGRAMS = fsck.f2fs
 noinst_HEADERS = common.h dict.h dqblk_v2.h f2fs.h fsck.h node.h quotaio.h \
-		quotaio_tree.h quotaio_v2.h xattr.h compress.h
+		quotaio_tree.h quotaio_v2.h xattr.h compress.h inject.h
 include_HEADERS = $(top_srcdir)/include/quota.h
 fsck_f2fs_SOURCES = main.c fsck.c dump.c mount.c defrag.c resize.c \
 		node.c segment.c dir.c sload.c xattr.c compress.c \
-		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c
+		dict.c mkquota.c quotaio.c quotaio_tree.c quotaio_v2.c \
+		inject.c
 fsck_f2fs_LDADD = ${libselinux_LIBS} ${libuuid_LIBS} \
 	${liblzo2_LIBS} ${liblz4_LIBS} ${libwinpthread_LIBS} \
 	$(top_builddir)/lib/libf2fs.la
diff --git a/fsck/inject.c b/fsck/inject.c
new file mode 100644
index 0000000..f6fd346
--- /dev/null
+++ b/fsck/inject.c
@@ -0,0 +1,64 @@
+/**
+ * inject.c
+ *
+ * Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+ *             http://www.oppo.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#include <getopt.h>
+#include "inject.h"
+
+void inject_usage(void)
+{
+	MSG(0, "\nUsage: inject.f2fs [options] device\n");
+	MSG(0, "[options]:\n");
+	MSG(0, "  -d debug level [default:0]\n");
+	MSG(0, "  -V print the version number and exit\n");
+	MSG(0, "  --dry-run do not really inject\n");
+
+	exit(1);
+}
+
+int inject_parse_options(int argc, char *argv[], struct inject_option *opt)
+{
+	int o = 0;
+	const char *option_string = "d:V";
+	struct option long_opt[] = {
+		{"dry-run", no_argument, 0, 1},
+		{0, 0, 0, 0}
+	};
+
+	while ((o = getopt_long(argc, argv, option_string,
+				long_opt, NULL)) != EOF) {
+		switch (o) {
+		case 1:
+			c.dry_run = 1;
+			MSG(0, "Info: Dry run\n");
+			break;
+		case 'd':
+			if (optarg[0] == '-' || !is_digits(optarg))
+				return EWRONG_OPT;
+			c.dbg_lv = atoi(optarg);
+			MSG(0, "Info: Debug level = %d\n", c.dbg_lv);
+			break;
+		case 'V':
+			show_version("inject.f2fs");
+			exit(0);
+		default:
+			return EUNKNOWN_OPT;
+		}
+	}
+
+	return 0;
+}
+
+int do_inject(struct f2fs_sb_info *sbi)
+{
+	int ret = -EINVAL;
+
+	return ret;
+}
diff --git a/fsck/inject.h b/fsck/inject.h
new file mode 100644
index 0000000..62543c1
--- /dev/null
+++ b/fsck/inject.h
@@ -0,0 +1,28 @@
+/**
+ * inject.h
+ *
+ * Copyright (c) 2024 OPPO Mobile Comm Corp., Ltd.
+ *             http://www.oppo.com/
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License version 2 as
+ * published by the Free Software Foundation.
+ */
+
+#ifndef _INJECT_H_
+#define _INJECT_H_
+
+#include <stdio.h>
+#include <stdint.h>
+#include <limits.h>
+
+#include "f2fs_fs.h"
+#include "fsck.h"
+
+struct inject_option {
+};
+
+void inject_usage(void);
+int inject_parse_options(int argc, char *argv[], struct inject_option *inject_opt);
+int do_inject(struct f2fs_sb_info *sbi);
+#endif
diff --git a/fsck/main.c b/fsck/main.c
index c8469cd..eca09aa 100644
--- a/fsck/main.c
+++ b/fsck/main.c
@@ -29,6 +29,15 @@
 #include <stdbool.h>
 #include "quotaio.h"
 #include "compress.h"
+#ifdef WITH_INJECT
+#include "inject.h"
+#else
+static void inject_usage(void)
+{
+	MSG(0, "\ninject.f2fs not supported\n");
+	exit(1);
+}
+#endif
 
 struct f2fs_fsck gfsck;
 
@@ -195,6 +204,8 @@ static void error_out(char *prog)
 		sload_usage();
 	else if (!strcmp("f2fslabel", prog))
 		label_usage();
+	else if (!strcmp("inject.f2fs", prog))
+		inject_usage();
 	else
 		MSG(0, "\nWrong program.\n");
 }
@@ -809,6 +820,18 @@ void f2fs_parse_options(int argc, char *argv[])
 			c.vol_label = NULL;
 		}
 #endif /* WITH_LABEL */
+	} else if (!strcmp("inject.f2fs", prog)) {
+#ifdef WITH_INJECT
+		static struct inject_option inject_opt;
+
+		err = inject_parse_options(argc, argv, &inject_opt);
+		if (err < 0) {
+			err = EWRONG_OPT;
+		}
+
+		c.func = INJECT;
+		c.private = &inject_opt;
+#endif /* WITH_INJECT */
 	}
 
 	if (err == NOERROR) {
@@ -1229,6 +1252,12 @@ fsck_again:
 		if (do_label(sbi))
 			goto out_err;
 		break;
+#endif
+#ifdef WITH_INJECT
+	case INJECT:
+		if (do_inject(sbi))
+			goto out_err;
+		break;
 #endif
 	default:
 		ERR_MSG("Wrong program name\n");
diff --git a/include/f2fs_fs.h b/include/f2fs_fs.h
index 870a6e4..3a5d146 100644
--- a/include/f2fs_fs.h
+++ b/include/f2fs_fs.h
@@ -45,6 +45,7 @@
 #define WITH_RESIZE
 #define WITH_SLOAD
 #define WITH_LABEL
+#define WITH_INJECT
 #endif
 
 #include <inttypes.h>
@@ -427,6 +428,7 @@ enum f2fs_config_func {
 	RESIZE,
 	SLOAD,
 	LABEL,
+	INJECT,
 };
 
 enum default_set {
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
