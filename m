Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 51131A6486F
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 17 Mar 2025 10:59:54 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tu7G7-0005uF-VY;
	Mon, 17 Mar 2025 09:59:47 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tu7G6-0005u6-E3
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 09:59:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=OPMwHxvrqvzN9SEXJAuSf92F/0BoN/FJ8f9SA1NCMas=; b=LPYj1I5scKQKYWBDXZan/11jlv
 TSFLZq6KdwjNYBdofIFBA/goqnHASImP5lxcbUDf2D5imfwSQ6WnfgNn/4b7P5fFBpJcL2kHSspSP
 RlmNU64qpVSQofh3+5JA+3NTFsIbLnjUo7FbkBQva5mzVg8NLfUkb72XIKLpCoFqjfEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=OPMwHxvrqvzN9SEXJAuSf92F/0BoN/FJ8f9SA1NCMas=; b=X
 mA5IjsWOCpKRx5W8gd69bHKgiv7upaba3hEmNkD0gh1iSZtfm9pxP+RajAtNu4fLe0zzv5lq0Ps0N
 aFgVajk/2BD9mzmyKyKeZR9ZVnVCQuJXpUnZgEcovXMaY+b18aKK6ax/5JyhSotoWafodxTZ2a+vL
 GMV/YZW8cUpa+vVg=;
Received: from mail-psaapc01on2046.outbound.protection.outlook.com
 ([40.107.255.46] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tu7G4-00007n-Sg for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 17 Mar 2025 09:59:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=k+vALhGFLLRkBxgg42inabqoUZpzggMcShEC1cC7BTjUo6AQqQDAGBjFHonv2YV0GrPDrzOLsgpuOvV0bbxooWrNkLPh5b24a86Cl2nPnB/3hBElFr1u8WPJ9p0VRxuF/xLWx3Advmh8sBPXAW72TD3kvu/MG3lO5wzVitL0VMc5HC3ELwtqlOPyRZ73P29qh6x5a/hKdQeAppGY6ZzeIDR2WBiQ00Kbnu5CM1ViHTMHAo/lZqa71d+gvTe9v7/tJ4tTzhKXXy9kMm58+1lGluKB4QJZ5bIYe9EZiTtlIsUrXIYNqrmCyWJp9RKWFW9+Hk65Gn7xb6nlFGwURJzzNA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=OPMwHxvrqvzN9SEXJAuSf92F/0BoN/FJ8f9SA1NCMas=;
 b=gNxZu2kgYP42vnVXDazkeMpK0eIE5FnSQUYho1tyR4oM7PL+X1Em6AJdgKYIcUoOoKazfLVBpMU7uz8LlBGwqrwXJcEfgVgkLDOBsEKLO4biJ4RMNzLWZ4LnthgHdDut+r07YD7b3iSIjffxx5D2GXfiJWLcTTmf11G3Q5E9ksUSqi1B/xVbOlp7GDyroYJMH899lxEqplhCCgTrkroMeyOgbOo3E7tzi6xHt3QfxFGA/7xyg1445H2GskcMrb8al2SAp+ot1bHIoBDVaCQ/f8+y/kpSqPyuu2wlGlnXKZExQ4MkAD4paNN5ljNH7jhwGOUcbYIw4rp0FO6lTyZ8Jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=OPMwHxvrqvzN9SEXJAuSf92F/0BoN/FJ8f9SA1NCMas=;
 b=mx5a+Ig2mVasl85+Tl3e5KIxS7lZzXb9FI6ql0IykHlpziDH5yNt1pdZKs4r9qRl9ahEFejiEdAtdhdTTZ0CATalGCfLL26888Vmpbf1jjtQOB3u2bASiiXGlq79cA1VESyDzF2U8/4LwvD3UhTRh9bNWr6W1j1EubWPvRCb6oqfRboYaT1UvMD5TCcNnRlSdmF2DWqXyA29+lviNiUFlA/+lJkPcLjGULSEJj46x2mCU7a4nighNM4oCt9OCDD32xArs6Gs4CE1NGbrTAYlF2X7EN1BQcoYnEKzBMG++lR9JvgAAlnTnk9TrGbUL4eAQbG/I/y4h3AbvHvhr2rksw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEYPR06MB5766.apcprd06.prod.outlook.com (2603:1096:101:b9::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.28; Mon, 17 Mar
 2025 09:59:30 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.8511.026; Mon, 17 Mar 2025
 09:59:30 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Mon, 17 Mar 2025 04:16:24 -0600
Message-Id: <20250317101624.3223575-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0030.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:263::20) To TYZPR06MB7096.apcprd06.prod.outlook.com
 (2603:1096:405:b5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB7096:EE_|SEYPR06MB5766:EE_
X-MS-Office365-Filtering-Correlation-Id: 6337fe32-f692-46ee-95f2-08dd653a6944
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|1800799024|366016|52116014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?faM2QYwHRiFOX+UMc/g0cGQffmY2SOa94ABd88I6sG/X+0sGs/sHDtg6irOc?=
 =?us-ascii?Q?RN01YqHLfa5yUL1G4zHkhfhxTlKRM/dJnYHP+qhxzGEhCq64bRIbxQxYUQ9u?=
 =?us-ascii?Q?vOfWsmuqdBC2unBne2ffGUDRWVlipSxWx5pjG//MDVS59rVNHBTjVN9bBKED?=
 =?us-ascii?Q?r2Eu7X5YhowsNLp3eB57sNMdvTKBGDaReVlBsmOUZIdNsZd00+v13sNyQJ2G?=
 =?us-ascii?Q?8pOm8pcLrOsO36i1Hr88WM9mY0u62uhAWnU3gMesWic1GffxUU1+5EVGxViY?=
 =?us-ascii?Q?lhR7hOUl1vGa4d+73R51v/vS7cea2cw1f0KdslVruwFZdc6Lxc6hCszBaWq9?=
 =?us-ascii?Q?31FfmHq1JJzPyddG9cuy5wHaF9wGzrr5YU0RymM4TeUZRY2H7qN48p2m+rZq?=
 =?us-ascii?Q?P8bV+WWv2TT7eBuSTz2zMU3A0uplxMsxh6Sx4zAyKl4p2wjH5Uvzd+KYFJlN?=
 =?us-ascii?Q?poImUXpGWXIjC2MFh9TDARex2AfZcfmqRM+adnKtUdZlGdOW0SKfzGumeDhr?=
 =?us-ascii?Q?Nzy8CyN8oWAUaqBHG+5v9B/0Q/bE7Wxo/vKNq9Cqf+u1I5WV4EuRV7eoN+Mx?=
 =?us-ascii?Q?iJx8NspS0Q4tqJecq0AJeY22Hk0mZFuRwXVOMWlozC2+uisirryWKugU9MFE?=
 =?us-ascii?Q?1hoQH04S7NzFbeb02bFzhthttjzKDYyzC96ZMFpM+SWMs3NaYtT4ClCtK/51?=
 =?us-ascii?Q?fa96iX7ApmpUces9F6yaw4tucrxPgHVuozpWyoLdzc/tpYuIi874LuuhcYiZ?=
 =?us-ascii?Q?3q3Ou3ysuOUwGWUkXqKYmu1Wv5m+2mSFrJZ5tupUxPK8f7/XxUOwB2S4UGua?=
 =?us-ascii?Q?sW0RAbqMhcLJH2R51qD2ILH7zx2diVJaHe+O70p1BHdIG2dLE9kcCuiUTZDi?=
 =?us-ascii?Q?B12pTftWEjQsSGbyD36eIMdY0mdtBuKcii+C10Sb8lvQq8+WpHy144OEIJzf?=
 =?us-ascii?Q?Ly19NGSLwnmr90ZoO1upsLNm8ZghUtJT4KVQIqVcaJSXxMjkTXsTA9YZhYHL?=
 =?us-ascii?Q?9z5ZvQpY6U02xZRQHC1QHvW5FmILJ9pxzkcuhikU3YWD0FeNvCL5sUwyqYh2?=
 =?us-ascii?Q?nwaXEbZhMNzCa+2VFuxFIqJgFgyR3VxXLRxqYHt6fZrH4Tb2cKkwECCs5k5U?=
 =?us-ascii?Q?Ut3IrV6bLll7kNg5/3vYcKt4k/RHTiy1oVWq69FYDNAcc4e8ZSLyDlSqCEME?=
 =?us-ascii?Q?hbwWm3vw7wJBoLXKa1b7jino5y07L0Pxkuc/nU53ESyy2/1Qa/Grk3GHYG7M?=
 =?us-ascii?Q?myz58ukcYqniSeAVYIQCvKisVgqzvTkT2XfamSRvUfIKd0lfDjMBmnozDVd+?=
 =?us-ascii?Q?mFLxDMYI8+TVqW/+SM2JUNOuHeOXJJbUB8nF+Q42wHdRq6tcGri9czcdKiIj?=
 =?us-ascii?Q?BXrAn5LpNN9RaBBhDRnJ7+7YIT5NxSTOZh1CCe/1bNiIfjXVSNc/MK+/UaGD?=
 =?us-ascii?Q?HI9g1tTVq/6S+LYeGnIcI5wXNvu5wi0A?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(52116014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mb9dXI80vHhEhjZDs5jk+X1DWQXEaLvzPy0cCv2KOFedKyAW/JcrIju/jePJ?=
 =?us-ascii?Q?rb4jjXa8okvFQ0QuZXGm80Q28HdHoGeDcyXioPRpMPHsyTVDICCFkKzkBIvB?=
 =?us-ascii?Q?GuwMMrM3o2W135GfIwZbRWlwC83qL/vaHjfTxjoeetGNYtBBsJBZd3Cu/ZyC?=
 =?us-ascii?Q?assSF8Osflw+cyAfGRL2w4D9zV5CYGWTkkNxcNW2ZQg94UOs4vQBHdkmUFpp?=
 =?us-ascii?Q?ZDowDfrsrp2j9iooImguyAiV8Yib9sT0PoYletC0YEKy5akOSp7vlklXZ3Tc?=
 =?us-ascii?Q?IG+y7E+vRoS9eWzLdX7mYzHHTFSCKC1NxtoxTSkNiE3M0+vFOkIEpYn783aF?=
 =?us-ascii?Q?6m8aUVf2EBBsELtglhulxV9xR6Tn6J/nXMaqTs8XXqEAdsnLjClmLYec5OXR?=
 =?us-ascii?Q?NHK6zCL/WekOPINf25pYJEKqGb0FMC2aBeGVL5uRUimkAYlCh/Pau0qQU0UH?=
 =?us-ascii?Q?OOGmI80mlUPJSV3fy7OOPzK+9Q2i7eOUKMk449+LbXDIF/ymfbXFia2FS07D?=
 =?us-ascii?Q?HtBqoDZ9OZe0sXWAnOhMbCpXkgm+uyi4oNGHH59RsV4cMO2UJcQ7CAJSQgV1?=
 =?us-ascii?Q?h6Yr1kDJsFo6oGsWP+ldPn+dbqoCol23h9Jp4dfqkD7rlcE5jIsPN3bUvS6L?=
 =?us-ascii?Q?Bftfyr6wfW9Byp0rbSUIeJK3SzkRj7MS7Agpzmiy1DiKBtD5NAGcnasyJovc?=
 =?us-ascii?Q?3N9/WYp8J4IOXw8Bg8gZGy/hXXKSoJSm91CeAKrVE0kRhBSuoy8QPqDYLoww?=
 =?us-ascii?Q?jQp30ug83Cm5odT/tmwXSczqIDjOFhT/StCZPutubtDklqemP2NdgDCbsPZi?=
 =?us-ascii?Q?/RnTIz+dvbx2FaMG62W7pqndrzsNJ/VbDUJhTF1IWcJtxY7teOMDHeOr0RXh?=
 =?us-ascii?Q?+nWiIApIcHCsCqAQeelHPKZm3J1znvfJRipBoRZx/rMOuPVojJe8rmkyAs7B?=
 =?us-ascii?Q?uUyWk/unaHns8xvbAzWtI/i4uYqB9EUrsQOAfN/ejHBNq7aEI+1Xptb501Ea?=
 =?us-ascii?Q?MHG8XJqplLHE4uo1pqXmf5IRRMmrkjFske8lFDYuq+w6KhioWlMx9MeoQ+LB?=
 =?us-ascii?Q?AQfEppf/Gv4cwMno7phFKTjDoUXLoFuaEZDPRHYfIIRwj2x5eHqeKWz2PGWi?=
 =?us-ascii?Q?dlpQvAuDzLvrKFsKn1qoRwO4cDfKzG6w7OR/h7w2ZmcTgb6xla4nrF8EYSUJ?=
 =?us-ascii?Q?FfVjJvfDz/pl+kgfCGD0FR2gZR41Q1TsSNMUzKVW+m4fNiTnltrtN/2aKYT+?=
 =?us-ascii?Q?eefKzZOjGJDGoJKl9zREUZLWRWjEPiAecZoNTQmnMxowN3vREh6Oc+gl/01d?=
 =?us-ascii?Q?U4YOeoiDewgatOvx8JylwbsWVa7bKid98L4hy+qKaQ50zr+Hchm62qn2WqqV?=
 =?us-ascii?Q?iBHQe9WqXsQXspSMwLXvA+4xxJlSDmcn22FSDQuVi1H2t1dttkPMYtW9oip9?=
 =?us-ascii?Q?TdkkbeEhRbfTC6b0HkOxN7Pqa/SwlrUGB7SSuJ7bH2sXYnIQC1mPxW2lb1Dx?=
 =?us-ascii?Q?fRY98mEtd+F+0LDsszx0oybTB/5y37ncK9cZBVlXT/KxSlVUb6eOfNfVFI0n?=
 =?us-ascii?Q?xKVVXFmjOfh7EC4DmXcuS1Be0ggoeARqkkkOqazl?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6337fe32-f692-46ee-95f2-08dd653a6944
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Mar 2025 09:59:30.7853 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 0KGUnzRNk3IyHnGbhC3nJMkJ3NTXqNc7Ya2F37XM3OLgQau65VedHSU07LwT98I3KJyDj+N/J7EkgGl7CDp0gA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB5766
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  During a checkpoint, the current active segment X may not
 be handled properly. This occurs when segment X has 0 valid blocks and a
 non-zero
 number of discard blocks, for the following reasons: locate_dirty_segment()
 does not mark any active segment as a prefree segment. As a result, segment
 X is not included in dirty_segmap[PRE], and f2fs_clear_prefree_segments()
 skips it when handling pref [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.46 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.46 listed in sa-accredit.habeas.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.46 listed in wl.mailspike.net]
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tu7G4-00007n-Sg
Subject: [f2fs-dev] [PATCH v3] f2fs: fix missing discard for active segments
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
Cc: Chunhai Guo <guochunhai@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

During a checkpoint, the current active segment X may not be handled
properly. This occurs when segment X has 0 valid blocks and a non-zero
number of discard blocks, for the following reasons:

locate_dirty_segment() does not mark any active segment as a prefree
segment. As a result, segment X is not included in dirty_segmap[PRE], and
f2fs_clear_prefree_segments() skips it when handling prefree segments.

add_discard_addrs() skips any segment with 0 valid blocks, so segment X is
also skipped.

Consequently, no `struct discard_cmd` is actually created for segment X.
However, the ckpt_valid_map and cur_valid_map of segment X are synced by
seg_info_to_raw_sit() during the current checkpoint process. As a result,
it cannot find the missing discard bits even in subsequent checkpoints.
Consequently, the value of sbi->discard_blks remains non-zero. Thus, when
f2fs is umounted, CP_TRIMMED_FLAG will not be set due to the non-zero
sbi->discard_blks.

Relevant code process:

f2fs_write_checkpoint()
    f2fs_flush_sit_entries()
         list_for_each_entry_safe(ses, tmp, head, set_list) {
             for_each_set_bit_from(segno, bitmap, end) {
                 ...
                 add_discard_addrs(sbi, cpc, false); // skip segment X due to its 0 valid blocks
                 ...
                 seg_info_to_raw_sit(); // sync ckpt_valid_map with cur_valid_map for segment X
                 ...
             }
         }
    f2fs_clear_prefree_segments(); // segment X is not included in dirty_segmap[PRE] and is skipped

This issue is easy to reproduce with the following operations:

root # mkfs.f2fs -f /dev/f2fs_dev
root # mount -t f2fs /dev/f2fs_dev /mnt_point
root # dd if=/dev/blk_dev of=/mnt_point/1.bin bs=4k count=256
root # sync
root # rm /mnt_point/1.bin
root # umount /mnt_point
root # dump.f2fs /dev/f2fs_dev | grep "checkpoint state"
Info: checkpoint state = 45 :  crc compacted_summary unmount ---- 'trimmed' flag is missing

Since add_discard_addrs() can handle active segments with non-zero valid
blocks, it is reasonable to fix this issue by allowing it to also handle
active segments with 0 valid blocks.

Fixes: b29555505d81 ("f2fs: add key functions for small discards")
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v2->v3: Add the test case for this issue in the commit message.
v1->v2:
 - Modify the commit message to make it easier to understand.
 - Add fixes to the commit.
v1: https://lore.kernel.org/linux-f2fs-devel/20241203065108.2763436-1-guochunhai@vivo.com/
---
 fs/f2fs/segment.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 50a346f7cb93..396ef71f41e3 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2096,7 +2096,9 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 		return false;
 
 	if (!force) {
-		if (!f2fs_realtime_discard_enable(sbi) || !se->valid_blocks ||
+		if (!f2fs_realtime_discard_enable(sbi) ||
+			(!se->valid_blocks &&
+				!IS_CURSEG(sbi, cpc->trim_start)) ||
 			SM_I(sbi)->dcc_info->nr_discards >=
 				SM_I(sbi)->dcc_info->max_discards)
 			return false;
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
