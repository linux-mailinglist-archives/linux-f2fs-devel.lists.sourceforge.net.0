Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by mail.lfdr.de with LMTP
	id WbHAJmLmHmqZYwAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Jun 2026 16:19:14 +0200
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 081E962F3DA
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 02 Jun 2026 16:19:14 +0200 (CEST)
Authentication-Results: mail.lfdr.de;
	dkim=pass header.d=lists.sourceforge.net header.s=beta header.b=iW+HZklw;
	dkim=fail ("body hash did not verify") header.d=sourceforge.net header.s=x header.b=Vy+7CqAD;
	dkim=fail ("body hash did not verify") header.d=sf.net header.s=x header.b=jCwS0onJ;
	dkim=fail ("body hash did not verify") header.d=vivo.com header.s=selector2 header.b=DGZ3x3HV;
	spf=pass (mail.lfdr.de: domain of linux-f2fs-devel-bounces@lists.sourceforge.net designates 216.105.38.7 as permitted sender) smtp.mailfrom=linux-f2fs-devel-bounces@lists.sourceforge.net;
	dmarc=pass (policy=none) header.from=lists.sourceforge.net;
	arc=reject ("signature check failed: fail, {[1] = sig:microsoft.com:reject}")
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-Id:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WD7unEp+LY9UsvGP5QF3Sx/MPRuwbbrmjFB4VVtbhH0=; b=iW+HZklw+FMHkLpX8ZL5CxYb+a
	Kw30tcIr95MhhjajTRQoz1nsrG120GXx9+dr67yjsNhxDweRfMv2LcZvPOpWWUWUx/YgrsL4TdqbM
	CRCf0ot+I3Q0gMuA8425Q8AX9bYir+uFX/3bTWBRP7qmlS1gvWCgBub4mUp39NFW0FS0=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1wUPxJ-0001qK-T4;
	Tue, 02 Jun 2026 14:18:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1wUPxH-0001qB-VJ
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jun 2026 14:18:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=IGsbgp24/gLZK+zWyryaN6NwQoGL3B3SBZ3Dpcj5IWQ=; b=Vy+7CqADpOeKoG3SuP+74YR33s
 TMrY6f5JYEPQ/2NVLG9iKuIN/E9kwqlTCbuMIh67te7CWBhMqkE8TM+iNghxwmQIjRvuGd29Fy6Em
 UDAb1UrjQIU+4nSgMUVDmDLHevqA9GPKl816saHSe9MWBo2QDzUAXJ0ja8hJ/6DUp4kc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=IGsbgp24/gLZK+zWyryaN6NwQoGL3B3SBZ3Dpcj5IWQ=; b=jCwS0onJAvm8nI1dx1FsC68Gxz
 /hXfFtWDiNIdrjXBUqdeOwPnwgHWklMQ3tl2tba3V/jgpyADuCfL/MOR44E93BYsUlgvTqSJqRT8x
 6kRa0RqbCAqgoW9/LmvXhHK2yoP7beWz4WVzyuuqTVyQhM+9UYLaS2SMSMuqHYgTAQJE=;
Received: from mail-japaneastazon11012032.outbound.protection.outlook.com
 ([52.101.126.32] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1wUPxG-0006jW-Q1 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jun 2026 14:18:56 +0000
Received: from TYZPR06MB5950.apcprd06.prod.outlook.com (2603:1096:400:333::12)
 by TYSPR06MB6766.apcprd06.prod.outlook.com (2603:1096:400:473::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.16; Tue, 2 Jun 2026
 14:18:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=fnGPVG8HtkXM32UCV0xscCZL6j7Js27AAUk/r0sE4grkTvxDB2rEMnzvrfy7g/G6+6hCZCtJYmAbqRlSLxKpp3H8839pjDyxc6QyohWFfpwJgH5YN8tbTh+DQfFKbH9AbFSg7oFstXiZ/w//APmHlOHwCrpFvoJFkbiED/yDWSNeyYr/ulK+bZZZuZe2BqWCEDp3izrpLIxB9BdQaY79PwWS2gygdYa2DUIBSIi5fNB0uK0azMtqLHXhniGp6vlCe/FAgAL9cEestsv0c5lxWWtszuZJ9AudrpaYW19TTHG8UmiAj3K5EF9YHP94iqSADsx4OY4rjc1pQ3NK0JOhfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=IGsbgp24/gLZK+zWyryaN6NwQoGL3B3SBZ3Dpcj5IWQ=;
 b=UGNvP+BePIMm9Qgt/Op5q6lZnDjxpz8dJciZiiqfrMU/NrMwYL7dGY55MQWC+jbPWLuVvuerziBU/zJoKUpTWVO3IESK9oZ1tNt6yPM/ULdnyvnGnpo8rfmw+6vNjSf+Ulj4zMdMHN83V5/PshIadphxyaEW4u+hxpy5YErMEgwFWB1gccPyEeQhJ+Um0t3234jTyBUESDL9UEK06zR9K5+0KJSgffnLmxb2lou7lUns3Inmpavv+hk2khDIZdy4LVDDTiU5CHNh/Y2U6IT4cItCjit182Zqhoz3MTzoXxx+84FknvnLbIELFXC2QHUp4tJLcFWxohw2OpL9nApK8g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=IGsbgp24/gLZK+zWyryaN6NwQoGL3B3SBZ3Dpcj5IWQ=;
 b=DGZ3x3HVEsc5niAPSHooldI2Ru2X+BYEwkPfSNZMaJ0lfpk2sMIwp72WUrxhwcQM/ZSSQ5GC+EPmXWLgQYjUDTFHJwf9KdHmJxCEZVtMnqEai43CHHMPqIozq72NluXbAYu21rJCfs60zkRhZhtqHANKBCLgBC4Ug72gZF0szsb5l3M3j7gQ9UM5Ug6bnQ/sit6ealUW0YFKryU103fBigG3sixiSGKKxL457mqNQqJKek+P/0bRwZMheM5msFaR5SXGsUYkE+3ihNstW+Rz60AvTKLwDeuNfjnTJG9i6qBLgSgtXAk43WRDpTGkb8Vda2azK3e8VTJeE3DR+yA7cQ==
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by TYZPR06MB5950.apcprd06.prod.outlook.com (2603:1096:400:333::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.21.71.12; Tue, 2 Jun 2026
 13:41:30 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::24bc:5613:3ffa:cb96%6]) with mapi id 15.21.0071.015; Tue, 2 Jun 2026
 13:41:30 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>, Chao Yu <chao@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 linux-f2fs-devel@lists.sourceforge.net (open list:F2FS FILE SYSTEM),
 linux-kernel@vger.kernel.org (open list),
 linux-doc@vger.kernel.org (open list:DOCUMENTATION)
Date: Tue,  2 Jun 2026 21:41:02 +0800
Message-Id: <20260602134104.348655-4-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260602134104.348655-1-liaoyuanhong@vivo.com>
References: <20260602134104.348655-1-liaoyuanhong@vivo.com>
X-ClientProxiedBy: TP0P295CA0038.TWNP295.PROD.OUTLOOK.COM
 (2603:1096:910:4::11) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|TYZPR06MB5950:EE_|TYSPR06MB6766:EE_
X-MS-Office365-Filtering-Correlation-Id: 9eaf1d90-a711-4a33-b76a-08dec0aca6c3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|56012099006|11063799006|18002099003|22082099003|3023799007|38350700014;
X-Microsoft-Antispam-Message-Info: Nn6k+59qa44eMOpPuSaYJWaoSicQ03d3xerimMIjTFG+Kjh5+vqUOcY8IJxyqcxQM8pPUBFkJXfRTZSdBflsMsWQUnswu97tUKuTwCjYzU1PWPbNBWFaWyvrJCY1osvuL6GoI1TP2W98z8riy/J71n73c4CSmVy0RXVp+ufjVeLtuLraUPCes0q/DrhqBQ3JvEtGwyBy8LTpUHfxK4XPSJHe4PLhsnSIvN1goK5rL/LiT5c/esx94nCnASS3RIS7/dT7xsV9qzpS5gizOPBkhBZQpZOFCrTPprSJ8CknyuQs8fLAtYqngexK0Yq2hMpvznw981xHpD26bCWLFnzxeQBP02JMHDoBZWBMqjaAiyIBwRcRGPbNPBf24SHnVweMEYyofbESicbcAECtmWaVhgyZ+hn65ztXJADspbw4/2kar3s8W4RwCSazqWC/xPCkPkrrfP3df7rxY7v6QiJQQOhABM5cQMkJT0AEqj7ALng79ju49SL9pM8+IOD04J4DxSLVEaPmHmiw8ZfNcV7QzFBSvjt9zOsfW4Z4QkqE9b/C2WnaQJ6mKdo/RpGebyFki7+r7rykpIt81UT/jDTtXoeR/UDPds7d2NML4iZ3d1c0pGiuUN+s+/ZpWL95oYy4OaeWdeNlxsh95vspVE7GliHDYPZh+SXxzXVr4zs5WkU4v83rP2+p+nFD6EDjCsqDtsdXTUHGu82eS2seydB/6fjOOxeB5TLA5EPRGyl2zEux2q9pOl6PjjgXbHv8PUjv
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(56012099006)(11063799006)(18002099003)(22082099003)(3023799007)(38350700014);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SMBT8w2S5xg95hVjVIX1H8Yu6AhHRfztWbcNXtUhNKXLibLto2TKB7qh4aDt?=
 =?us-ascii?Q?j1pKeZ8VbxIZE8U8Ps3Bjhb0Ahz5bPbsQpfzI9pGel96DnD47JXamk2Q42D/?=
 =?us-ascii?Q?AbLZ4LuXkXgn//03Li/57/BVOIbWa1ScqAS6FpVT6unai2AZLnrIBu+dj6mw?=
 =?us-ascii?Q?nh7xJdt/T3OKefj2Mz7d6nAed4Mb2CATVYU6mWKeCk7UkJb5ldYnJeXvRDBj?=
 =?us-ascii?Q?Q0wtHiWzHtAzmloecc4q0Jgk74rplG6+LaO6Sq7jUF5eArs7I20NOvMPKQ6B?=
 =?us-ascii?Q?w3AB+BfxaAxXpV38ZUC5hkfN9cOhnDvbIE/D52C9EVWazUQfuD7PmwX5kYOS?=
 =?us-ascii?Q?n1RMEjixxe/E6NP8Vf804YkoDGD3EzOt+eV2ToiTglFwdg0d8qTex8cjpAp6?=
 =?us-ascii?Q?5qeTe8KUTh7ygcxxjXOu4bclFeQVWnFXB0mcauGhn7K+NZPAQ3vx7SZ1VotZ?=
 =?us-ascii?Q?8zVhIspFMeIedjgFNif5SHAYPv+8jN5h3tlS4gs8e0lO+6KBzd+moro0emT8?=
 =?us-ascii?Q?b+6E9v3aQLl+sCHkJMjbqioSrk58AOD0sCjOio6VGzObtIAeGEAPHoxuZ7u+?=
 =?us-ascii?Q?FSzo/9BxbMj5eimZhX7JxGv1MMNj7eSbg1JhieVT/CMX0GxKblcvfvDSWpsL?=
 =?us-ascii?Q?Dm6QIsZU/S4BhlPSpM4ViaQtdM5mDqRP1Gk7cNldjcKmJgzDJcKcCLIOUAcJ?=
 =?us-ascii?Q?cB4OGPVZ1XTHVgn5C+RtZPc0CAAqb96U4tEfaeARmpmgO6t95w0a6thCC1YN?=
 =?us-ascii?Q?yXbxSApFPvs918SCzkZo4ZH99cYv/Lub1gA01craUKJimxQtyMML/zyy5gDb?=
 =?us-ascii?Q?/9Q2oMPAfMxt4TBU2/e3wx9lUkipwltehpeHbFf8xrn6Yf/pPJ9mgtqQsxqR?=
 =?us-ascii?Q?JmPjnIM27pcJ6mL29igXKfuApiwg/Eeh7hzPK9pqKekJQ78gpt1YL6jR86q7?=
 =?us-ascii?Q?MdNauuk6PORWl7m+ZG8JzjFFWRTcDot74XchjwKrT5cpST3Tlae7WoLpFz6g?=
 =?us-ascii?Q?HWzXRoWNQG7QbvG1QMscru3RGkY2s2LZwl9/a8LTLE/MNpb/iMJblzxy905t?=
 =?us-ascii?Q?W2kGyXThQXjYEmj6AilS3/QIS4b3Iiz4M+T87kVt82zZ2rP/iTt2di1qvfjG?=
 =?us-ascii?Q?KYVzYYPgjFN30cLZocVyu+eiYHbHJdYfwIWuwYoiS+law9PvSKXttYes4LyR?=
 =?us-ascii?Q?Xj0QoougRyeZmUI/diilGgICU8c4Jn4LsxlTAEsyb5xYG9UpW154/kwMDXW6?=
 =?us-ascii?Q?xsIswbrOAsPkqz/KSvZrSQu30fcGC2mkVlRlDnUNV9LFfy6rpHjBnCc+kyh1?=
 =?us-ascii?Q?mhgOq50/qDDDGYpviC0/iXuwSRH593hY1aX7N5emzhExgSJyKxXlZUxl/qL/?=
 =?us-ascii?Q?/LKp6AEO85z33jWEovQvwXjWEzEeCrsl661dxDoioJRNsihbkWeNNoKcIScy?=
 =?us-ascii?Q?quQDOPwBuilph+bj1t0swMVimJp4K98w0TL/Y7cNbe4oYzREvKbxqNQc8lCY?=
 =?us-ascii?Q?yph1XAiH3OvSGkvWwl0goh3N9PacOzWK5lC0bFk7A0mN8k8MNPvo2ncZ5FAQ?=
 =?us-ascii?Q?jyVoBy1Qgg3lYsPYnPvujonh/qLbM9UDz6frGJoElyAVnx8Zi4vnJwssw6hg?=
 =?us-ascii?Q?6ZaXtdPpEDhV+qquqMdY74DbP3n+PBXG+ldjCmwqn09+9j3DDyXnz0s8gC4S?=
 =?us-ascii?Q?spM/TTW8OlzTmO7Jfg7Al5HGAZqfXv0It+Eo5rs7wl2Xz4vBoZ6n15g46y7I?=
 =?us-ascii?Q?/yXlgqK/bQ=3D=3D?=
X-MS-Exchange-CrossTenant-Network-Message-Id: 9eaf1d90-a711-4a33-b76a-08dec0aca6c3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jun 2026 13:41:29.9675 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r4oZF+63BsVtxG1pvMheH5scnYDiLN3fJuhfsH7omsAkgIGEf3MCofB9Bk92iDbXqlX0MVBBTE+oxllxNtcpiQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR06MB5950
X-OriginatorOrg: vivo.com
X-Spam-Score: 1.8 (+)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Document the F2FS encrypted_inline_data feature, including
 the on-disk feature requirement, the CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA
 dependency, how inline payloads are encrypted and decrypted, and th [...]
 Content analysis details:   (1.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 1.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.32 listed in wl.mailspike.net]
X-Headers-End: 1wUPxG-0006jW-Q1
Subject: [f2fs-dev] [PATCH v2 3/3] Documentation: f2fs: document encrypted
 inline data
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
Cc: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Action: no action
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
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:jaegeuk@kernel.org,m:chao@kernel.org,m:corbet@lwn.net,m:skhan@linuxfoundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-kernel@vger.kernel.org,m:linux-doc@vger.kernel.org,m:liaoyuanhong@vivo.com,s:lists@lfdr.de];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,vivo.com:s=selector2];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,vivo.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	ALIAS_RESOLVED(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[liaoyuanhong@vivo.com];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	DBL_BLOCKED_OPENRESOLVER(0.00)[vivo.com:mid,vivo.com:email,vivo.com:replyto]
X-Rspamd-Server: lfdr
X-Rspamd-Queue-Id: 081E962F3DA

Document the F2FS encrypted_inline_data feature, including the on-disk
feature requirement, the CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA dependency,
how inline payloads are encrypted and decrypted, and the truncate behavior.

Also document the supported key combinations.  Files using filesystem-layer
encryption reuse the normal software transform.  Raw-key inlinecrypt is
supported only for per-mode policies, while per-file inlinecrypt keys and
hardware-wrapped keys are not supported for encrypted inline data.

List encrypted_inline_data in the supported F2FS feature sysfs
documentation.

Signed-off-by: LiaoYuanhong-vivo <liaoyuanhong@vivo.com>
---
Changes in v2:
- Document raw-key inlinecrypt support as limited to per-mode policies.
- Document unsupported per-file inlinecrypt and hardware-wrapped key cases.
- Clarify when fscrypt prepares the software transform for inline payloads.

 Documentation/ABI/testing/sysfs-fs-f2fs |  5 ++--
 Documentation/filesystems/f2fs.rst      | 34 +++++++++++++++++++++++++
 2 files changed, 37 insertions(+), 2 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index 27d5e88facbe..dad483fb2fc1 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -258,7 +258,8 @@ Description:	Expand /sys/fs/f2fs/<disk>/features to meet sysfs rule.
 		encryption, block_zoned (aka blkzoned), extra_attr,
 		project_quota (aka projquota), inode_checksum,
 		flexible_inline_xattr, quota_ino, inode_crtime, lost_found,
-		verity, sb_checksum, casefold, readonly, compression.
+		verity, sb_checksum, casefold, readonly, compression,
+		encrypted_inline_data.
 		Note that, pin_file is moved into /sys/fs/f2fs/features/.
 
 What:		/sys/fs/f2fs/features/
@@ -271,7 +272,7 @@ Description:	Shows all enabled kernel features.
 		inode_crtime, lost_found, verity, sb_checksum,
 		casefold, readonly, compression, test_dummy_encryption_v2,
 		atomic_write, pin_file, encrypted_casefold, linear_lookup,
-		fserror.
+		fserror, encrypted_inline_data.
 
 What:		/sys/fs/f2fs/<disk>/inject_rate
 Date:		May 2016
diff --git a/Documentation/filesystems/f2fs.rst b/Documentation/filesystems/f2fs.rst
index 5bc37a1c4e51..feffad89db01 100644
--- a/Documentation/filesystems/f2fs.rst
+++ b/Documentation/filesystems/f2fs.rst
@@ -420,6 +420,40 @@ lookup_mode=%s		 Control the directory lookup behavior for casefolded
 			     ================== ========================================
 ======================== ============================================================
 
+Encrypted inline data
+=====================
+
+F2FS normally disables inline data for encrypted regular files, since inline
+data is stored inside the inode block and does not pass through the regular
+block I/O path.  When a filesystem is formatted with the encrypted_inline_data
+feature, encrypted regular files may keep small file contents in the inode
+block.  The inline payload is encrypted with fscrypt contents-key semantics
+before it is written to the inode, and it is decrypted back to page-cache
+plaintext when it is read.
+
+This feature requires the encrypt feature on disk and kernel support for
+CONFIG_F2FS_FS_ENCRYPTED_INLINE_DATA.  It is intended to be used together with
+the inline_data mount option.  Files using filesystem-layer encryption reuse the
+normal software contents-key transform.  When the normal encrypted file
+contents path uses blk-crypto with a raw per-mode key, fscrypt can prepare a
+software contents-key transform when the filesystem-managed inline payload is
+read or written.
+Per-file inlinecrypt keys are not supported for encrypted inline data, to avoid
+per-file software transform memory growth.  Hardware-wrapped keys are not
+supported for encrypted inline data, so F2FS does not create encrypted inline
+payloads for such files and existing unsupported inline payloads fail rather
+than being interpreted with the wrong key.
+
+Encrypted inline data is stored in fscrypt contents-aligned units.  Therefore,
+the maximum plaintext size that can stay inline may be slightly smaller than the
+ordinary inline data capacity.  If an encrypted inline-data file is truncated
+from a non-zero offset, F2FS first converts the inline payload to normal data
+blocks and then applies the truncate operation.
+
+Recovery copies inline payloads as on-disk bytes.  Encryption and decryption are
+performed only when moving data between the inode inline area and page-cache
+plaintext.
+
 Debugfs Entries
 ===============
 
-- 
2.34.1


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
