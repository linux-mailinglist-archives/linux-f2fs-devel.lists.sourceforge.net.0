Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id CFCC9B1E339
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  8 Aug 2025 09:30:57 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Message-Id:Date:To:Sender:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p2tM0S6tYQrdPgpOPomqoqz1cy4W4GXQRRH0Xcrey9Y=; b=cEtxofl/fqowp4T/bTcPbyEbLt
	bpQ5aXWW0DaVA4MHLnmYCVV1pGOaqQV47JRB2tOM1BpVluedjh4n2kZTAgz6Am3Iw0x+VPv1XPWfP
	lVRXFcckrbB+Cpu9EuW1WkEsHMjjfDsTeMrrMuumYpiZO/qwHnwFc4AWHIMc7kCA+lYs=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1ukHYu-0007Yz-PR;
	Fri, 08 Aug 2025 07:30:48 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1ukHYr-0007Yo-LN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 07:30:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SndbL3COsT8obWCy+h9dUbENPsro17P8/mJMILvv/3E=; b=eCxabe9E2Ya+QiDwP5ltoBcZHX
 30PLlkDaufILqBDxUZo+ITp4NKvs6bmPNXAnfmPYe42c7ooeEyLJ4T6iscCPHnoQkGmPXBMgUoNOB
 5hhsEnXI4rvf8zA9Vi87VRQQzwjinOUogRoqAznt/YTDj4K5MFF4WXJ8CKwhaGsFseco=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=SndbL3COsT8obWCy+h9dUbENPsro17P8/mJMILvv/3E=; b=a
 e3w5yRVXqvYS4Dv3JfFgCpeR0vjkS6eIcu8bZ5Sd/927PDtA9lYxiZHxrqBtwub/1DcmOLoWk0tQz
 E9ok34CMfQxYHEg5lhV/itL7zz0MgWQ4rjIqk32N0dGLcQjfGwKWH3dNn+hofSA0sHHWueAZMzsQ7
 2ZdAwSDF1VyeeQ/8=;
Received: from mail-japaneastazon11012057.outbound.protection.outlook.com
 ([52.101.126.57] helo=TYPPR03CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1ukHYq-0000gZ-SC for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 08 Aug 2025 07:30:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=M1uLObbzSaPakkcuqvYXHm4hxnnPbilgJbKCRQAm1j3ezCSFgijGpasJePCzDpCWjXwzEX7jbMrTzl0fmgkrhL4j37keY+kKlqXvEWtp0eHtMcv285m3ZL3h6t5z6bFeRXr9ESQoEQfychQANg/sNR8RLXOR/Z5BauZj+QecI4zrDYpWWrXCccJDh+njfwNfZ59EHsiEVTEVGeHc8zWdYrB92Ekj+Gdvntm+OHUM1I5siEx6NuGg7e12vOhWOYHynmdMkyzAij/zl0GhPH07g7o9RWwAkfpeSN1MwxUDuuk7IFWN4oIxkHuBibf4d8a3MErBF60SdbVEWhio6DGzFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SndbL3COsT8obWCy+h9dUbENPsro17P8/mJMILvv/3E=;
 b=ZHScRMRiK1/mzsGYlQA9BQ2h7d2taGpvM8SXpCWawlt6fsvmq3ddcG8NMTdBhKYTKA2l2oJmaku7LjjVxaoFCz6ne4Voh2+ZDlz88kxvvY1xYMwamsVr2J7hPTM/km/1hD8VRJVmsB/zOVmuRhd35R3nPIrjFznD1Ja0BQz4Q7LxfF4udJK2GlVF3SwSbEUikED+P/71nob+T/U7gQ2l6yJhcRljiXpfjT1vC4Mn9Lb8hciymfJaXQMwGy2YgD4gfiNZpbVRPCXePSH5vawIXh5T8uhYOqtFoF0HavZlCd4/Jwns5KI/JsALaFwRPBPrEZjI3/N3Vu3CMytXS7JkeQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SndbL3COsT8obWCy+h9dUbENPsro17P8/mJMILvv/3E=;
 b=HcqOVv/A4l6z6zOEaYCKHQgJmPGVowqM0h5xO5XriKPjT7mejLeOiPxkr4oBwyMc28nWJbIOCQWRiGmLnDAbqeMlK+7kRcao/uJTSvUDaLA3/wudhIgJW6LjgYF0UpznseieyAu3NlilbT7yFHiuHh87j2fpSVCeKJw3XfJc0+QsbFZK15Btq5d1jZy9xWKm9Fqn9KOgVpMwRGKTubt72xjtcJ/Y0oK8Ibi5n/e4+DP7a6Tw+uDhQp005PntnM4tnYiJr1kdEtZScK5+kxZAn8vLvqyVRhSLuNXRLkAbUYy6XBw1ZvLmwMVenKVYMb0EzrQQLjVFhFQ/LGrY87SnIw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com (2603:1096:400:32f::14)
 by JH0PR06MB7178.apcprd06.prod.outlook.com (2603:1096:990:9d::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9009.14; Fri, 8 Aug
 2025 07:30:28 +0000
Received: from TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263]) by TY0PR06MB5579.apcprd06.prod.outlook.com
 ([fe80::4f2:e048:7c93:f263%5]) with mapi id 15.20.9009.017; Fri, 8 Aug 2025
 07:30:28 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Fri,  8 Aug 2025 15:29:39 +0800
Message-Id: <20250808072939.202357-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: TYCP286CA0322.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:3b7::11) To TY0PR06MB5579.apcprd06.prod.outlook.com
 (2603:1096:400:32f::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TY0PR06MB5579:EE_|JH0PR06MB7178:EE_
X-MS-Office365-Filtering-Correlation-Id: c9476d7a-5dcf-4e56-6dde-08ddd64d726c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?drcmGJTT+szd4MefDyInfFySonkV3J4xK+gpCao3FL4oDHBRlJnvljouAuCd?=
 =?us-ascii?Q?nEcT9qQlRyXSxsVxiJU6vzHaeVrb7kos7CYElT4ryX5MkrQgs6yJBr9mMff+?=
 =?us-ascii?Q?ecOzhrotxGiB/U22BUVyUCw7lLCiA+spTCZL6g6eprR1JgppuZE9tfeU7miC?=
 =?us-ascii?Q?LSFzZWfrpuzJnj/jpdPHZ/FCP0NHiKz/wuCryVRbihP0J0qrw01QE9f8rG3e?=
 =?us-ascii?Q?bU0NSNw0e9OPkr81nd8XBlp/m3+Ej9F8c10kLiECRqVghVpL0PcHnvufhWNk?=
 =?us-ascii?Q?IPeGfYk1+oKejCwS7nkquFlqVWSSNJaN23MHJKI3fhzXUwjYG1z/NpRsAFHe?=
 =?us-ascii?Q?2M9ZWL/gNjYVoJ2hmIVy79D7cG6PiXfGyvvhPozQIRsP6OqFQvhk/j1XOYTW?=
 =?us-ascii?Q?g4NEgIH+6i1WSaLmV2KEg4Y2AbkX12rMVV+BGA/P6A7kWBMy/ntUyitbl/bJ?=
 =?us-ascii?Q?E0V9eCzMC7zk5Abdl8dT2I3U4w23NBeDf+a3jba+Rfz4IJk6TlgsLF+YH1pe?=
 =?us-ascii?Q?AYthzqnXTCmU27l+m7u7H4ALHfIMSqunXwdygpiVknwb7KYDhBprRbf+7Sov?=
 =?us-ascii?Q?qcP7E8A4kMdQOcWGFrKEUYQ+SiGhzz9+0PQ0Y3mPr9d5pr0Qa2y5WlaD8Rzd?=
 =?us-ascii?Q?BsIWm6V9QkXp6jYDEgoB3+pq6eV0x0tfdrLcYhdOJAHf0Qnn56+jHJZZUV9C?=
 =?us-ascii?Q?4KSoZlqAWlLQrtfYkCPTTKu9Ckp/w+/tY7sz8+2ni8X5P93lJ2IiswylLCP/?=
 =?us-ascii?Q?VKTR2xFfdocsqxI7d8DTnfwlhsGlb84GmuKWUYlMfs4Lmcs8nTOj1cbWNc+B?=
 =?us-ascii?Q?IuiuvP78H7QDQJ9Dq3WoIiB2fb+z0oAtAST96C7GiHWtrCcTlMFI/94raDNO?=
 =?us-ascii?Q?et6VuLptN8YnReD3IYQv7JG9Au7PwDGX0C6b2HlCQwvdIQ7pNmGiKG+1yctT?=
 =?us-ascii?Q?9YBUxB2VTpe/z/qpOIp6RJP6aSaRdOt+lrw/BlVBaptIwsi4BCrUfgr3KKC2?=
 =?us-ascii?Q?ScMLQtXIWn7Pk4owBg5F08MUOj4muwJqfBA8QHEBg/4UkhIwCBjDsWVs/Y+D?=
 =?us-ascii?Q?T/bPbbRT3D1upz1zBzjm/DYHSVERSI+hDjHyZKu7rOw7g6atRCqE/wfQRpjB?=
 =?us-ascii?Q?S8ry47JcoNaLn8U3HoRUhaftCHB4tqmZ8s4s/56LC/eQpXFN3hkB6LPLE3A8?=
 =?us-ascii?Q?9YKDng5f8AS7m/hJXSHCVt54SqLA+fVgW3gUU1oiCuJJLMJ/W4O94dF4oyqh?=
 =?us-ascii?Q?2qhyrjrTgVoHhQhSiSRTxczySOLvOvagE9T9ewQP6+LmDQY/3WvGIosf6j+V?=
 =?us-ascii?Q?/+BUleXT+K/SAZ3wsDvqshhYh/Ay5GFNnH9XoTet8j9gzjbsx7/iD8cKWR/l?=
 =?us-ascii?Q?5bm5pkBXyqdBB2xCjvbjBDwVM9qj83KkaGonH7OzxCwA+G9VnSEZN9V/UvZB?=
 =?us-ascii?Q?i/dEy8YZqAujLYVNR2AURnYwN7B21FV2u9F7V6dhkodKc3hekmTFeg=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TY0PR06MB5579.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?F9osMbKcSSyODiQc7wc+I2GbOPKeUUU/Ko90AWNHFbpSEZlTBTY1CZDl5Tn6?=
 =?us-ascii?Q?n5iVxPVoLet6C/oGoFEWdufoUIQHS6PNyJzKixvi5FhdJ7/KbeDyJcUCSX/3?=
 =?us-ascii?Q?hfJ7bSetkL3rwu2d081q3avwBcZQ1PiwP3SgZeHRaACJge+7ySI24SJJ36tK?=
 =?us-ascii?Q?2N2YZ0DWZofeEJlGlMo0CfJIh+4SR7G3Mr/kEQR7WCKfIwIOhOIZExH/p3Nj?=
 =?us-ascii?Q?ubGlnKJoWWn+pmmnfs2P9Z/y0QYUHhD7ozivTexl2AjbVCn2G8Xm7NcoRPEJ?=
 =?us-ascii?Q?aYDJ8BJ95h8B4ENUF2BQO3X65thWkH5Af4DDjmETp9huoITOX6mbpmzVr2TG?=
 =?us-ascii?Q?5GBw2JSfTXF+xm+D7iggSAln1XsDn6JHrtmw/GwLB/3+5a8aOSuKm1Tzwrxo?=
 =?us-ascii?Q?Oz95WsvhiNj7NVeZjODqIKNm+zVf8om2KoRRTvW5jJF86PkYAdwFm8nRdsYC?=
 =?us-ascii?Q?1pskhNGS6Ye9D+hTy/uKbAbPWtqfO540XeNaIQ5lf5YT6D18pJKd0KZDHpKV?=
 =?us-ascii?Q?Tw6/AWreYd9Utqup2fmkpO4WNaOSjV+sMMa/iyn/CxnXnzvDAt9IiysFJvsr?=
 =?us-ascii?Q?HjVLfGzinIJkzmNaKFBm1HlkGiVXziJrrs6Cteh4+dxnY8elng8iMkV9V3xc?=
 =?us-ascii?Q?cvIwx3ly4NRV2z9eXYXJaRxIvAeryatZTZfWf5QL2FTiCdnfN/M+luOIenSk?=
 =?us-ascii?Q?9hIRkUgMTn8Pa29JSX9R1i2oRgteG2tMxYZEWQcKv0cIsm4PoeMMHf8bHhUF?=
 =?us-ascii?Q?Wrd71Px028Vu+ZIXdNkCV/e4FImqf21tJewm8yHMTgE868owM0vbrB/MQ7km?=
 =?us-ascii?Q?i69UC/QmaMBxGN2rU9jtWki7b71odQPqlp3/w7LgjzWn+CBEIE6Gp8isyJvE?=
 =?us-ascii?Q?JDEoM68FcG/k8TUdQRsJuji6eZdp6wO/sMtRrd41wrahaEak+FMLniFuOUEj?=
 =?us-ascii?Q?tNG5+GED+eeMauNF9WAPlGpDY0L7wmtyYuyGeD2OiqJ+TXam2FYuZsoG49xZ?=
 =?us-ascii?Q?HO+WsbR+UAufuIN2vjPHPyfnJlGh4easc1OgS/n7+iGZ+qvyOxKqZOHUgwqP?=
 =?us-ascii?Q?cgMLse3azXVr8I/mYNM3kD8FRc6jgOeeOfix5/rlxPge4GqdXpUepqyDWcdO?=
 =?us-ascii?Q?Ptytnteg9smTrP+opVYqq1x/0wBp+vLxh/0nWq4pkxPVnNb621RdHscPLOjj?=
 =?us-ascii?Q?UohaI3mWSGvik7Cmcvp4/s+2ZsA5u2BQH/XCRB0PMYrW9S3wpJr16d7ZZeCI?=
 =?us-ascii?Q?3kw7KZWXH4tv9pBNcz6ym+LXUN1CysN1RuoPksp0fVL/YIHylMspCEgylY5J?=
 =?us-ascii?Q?7S5XUMH/CGLOZlM68pNj7Ogn8V6f8iJqfRMua2Na3K3z1HdYpthekmR6/jG3?=
 =?us-ascii?Q?HsVTdopeaSriKzFatTJ1JR7wkBJ6O4bmFQlIhJzWbm/WWpKu4cMA9+SYS4Ip?=
 =?us-ascii?Q?Cz90cyzG+GJI4+W6UH1Bj/SWhwmippMaFV1UK2QHLM6296LxFIosMXina7Kk?=
 =?us-ascii?Q?ZqucJgilpT5wKQXcps6VOc4CerPMr4hyAt1taEXmMa8GV0qyCZW4icgj181w?=
 =?us-ascii?Q?jAf0oVK8Vzep3wvZXs1uEqw3A1mwfa1Ro4kDHchj?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9476d7a-5dcf-4e56-6dde-08ddd64d726c
X-MS-Exchange-CrossTenant-AuthSource: TY0PR06MB5579.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 08 Aug 2025 07:30:27.9180 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: dE3b8dLmX7HsE3aZAYalEIQRcLLtonK5vXS9T5frpiqDbsCATPWN02fJJVIhd7UNx5QtKwDD5K8rkXuitgLOAQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB7178
X-Spam-Score: 0.8 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently,
 we have encountered some issues while testing ZUFS.
 In situations near the storage limit (e.g., 50GB remaining),
 and after simulating
 fragmentation by repeatedly writing and deleting data, [...] 
 Content analysis details:   (0.8 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.126.57 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 1.0 HK_RANDOM_FROM         From username looks random
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
X-Headers-End: 1ukHYq-0000gZ-SC
Subject: [f2fs-dev] [PATCH v4] f2fs: Add bggc_block_io to adjust the
 priority of BG_GC when issuing IO
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: linux-kernel@vger.kernel.org, Liao Yuanhong <liaoyuanhong@vivo.com>,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we have encountered some issues while testing ZUFS. In
situations near the storage limit (e.g., 50GB remaining), and after
simulating fragmentation by repeatedly writing and deleting data, we found
that application installation and startup tests conducted after idling for
a few minutes take significantly longer several times that of traditional
UFS. Tracing the operations revealed that the majority of I/Os were issued
by background GC, which blocks normal I/O operations.

Under normal circumstances, ZUFS indeed requires more background GC and
employs a more aggressive GC strategy. However, I aim to find a way to
minimize the impact on regular I/O operations under these near-limit
conditions. To address this, I have introduced a bggc_block_io feature,
which controls the prioritization of background GC in the presence of I/Os.
This switch can be adjusted at the framework level to implement different
strategies. If set to ALL_IO_PRIOR, all background GC operations will be
skipped during active I/O issuance. The default option remains consistent
with the current strategy, ensuring no change in behavior.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
---
Changes in v4:
	Adjust the default policy ALL_IO_PRIOR to 0 and modify the description to
	match this change

Changes in v3:
	Modified the issue where it does not work after closing
	CONFIG_BLK_DEV_ZONED.

Changes in v2:
	Non ZUFS can also be adjusted through this option.
---
 Documentation/ABI/testing/sysfs-fs-f2fs | 13 +++++++++++++
 fs/f2fs/f2fs.h                          | 18 +++++++++++-------
 fs/f2fs/super.c                         |  2 ++
 fs/f2fs/sysfs.c                         |  9 +++++++++
 4 files changed, 35 insertions(+), 7 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-fs-f2fs b/Documentation/ABI/testing/sysfs-fs-f2fs
index bc0e7fefc39d..21e6951919de 100644
--- a/Documentation/ABI/testing/sysfs-fs-f2fs
+++ b/Documentation/ABI/testing/sysfs-fs-f2fs
@@ -883,3 +883,16 @@ Date:		June 2025
 Contact:	"Daeho Jeong" <daehojeong@google.com>
 Description:	Control GC algorithm for boost GC. 0: cost benefit, 1: greedy
 		Default: 1
+
+What:		/sys/fs/f2fs/<disk>/bggc_block_io
+Date:		August 2025
+Contact:	"Liao Yuanhong" <liaoyuanhong@vivo.com>
+Description:	Used to adjust the BG_GC priority when issuing IO, with a default value
+		of 0. Specifically, for ZUFS, the default value is 1.
+
+		==================  =============================================
+		value				description
+		bggc_block_io = 0   Stop background GC when issuing I/O
+		bggc_block_io = 1   Stop background GC only when issuing read I/O
+		bggc_block_io = 2   Prioritize background GC
+		==================  =============================================
diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 46be7560548c..440542ea0646 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -155,6 +155,12 @@ enum blkzone_allocation_policy {
 	BLKZONE_ALLOC_PRIOR_CONV,	/* Prioritize writing to conventional zones */
 };
 
+enum bggc_block_io_policy {
+	ALL_IO_PRIOR,
+	READ_IO_PRIOR,
+	BGGC_PRIOR,
+};
+
 /*
  * An implementation of an rwsem that is explicitly unfair to readers. This
  * prevents priority inversion when a low-priority reader acquires the read lock
@@ -1804,6 +1810,7 @@ struct f2fs_sb_info {
 	spinlock_t dev_lock;			/* protect dirty_device */
 	bool aligned_blksize;			/* all devices has the same logical blksize */
 	unsigned int first_seq_zone_segno;	/* first segno in sequential zone */
+	unsigned int bggc_block_io;		/* For adjust the BG_GC priority when issuing IO */
 
 	/* For write statistics */
 	u64 sectors_written_start;
@@ -2998,13 +3005,10 @@ static inline bool is_idle(struct f2fs_sb_info *sbi, int type)
 	if (sbi->gc_mode == GC_URGENT_HIGH)
 		return true;
 
-	if (zoned_gc) {
-		if (is_inflight_read_io(sbi))
-			return false;
-	} else {
-		if (is_inflight_io(sbi, type))
-			return false;
-	}
+	if (sbi->bggc_block_io == READ_IO_PRIOR && is_inflight_read_io(sbi))
+		return false;
+	if (sbi->bggc_block_io == ALL_IO_PRIOR && is_inflight_io(sbi, type))
+		return false;
 
 	if (sbi->gc_mode == GC_URGENT_MID)
 		return true;
diff --git a/fs/f2fs/super.c b/fs/f2fs/super.c
index e16c4e2830c2..a21cecc5424e 100644
--- a/fs/f2fs/super.c
+++ b/fs/f2fs/super.c
@@ -4629,9 +4629,11 @@ static int f2fs_scan_devices(struct f2fs_sb_info *sbi)
 
 	logical_blksize = bdev_logical_block_size(sbi->sb->s_bdev);
 	sbi->aligned_blksize = true;
+	sbi->bggc_block_io = ALL_IO_PRIOR;
 #ifdef CONFIG_BLK_DEV_ZONED
 	sbi->max_open_zones = UINT_MAX;
 	sbi->blkzone_alloc_policy = BLKZONE_ALLOC_PRIOR_SEQ;
+	sbi->bggc_block_io = READ_IO_PRIOR;
 #endif
 
 	for (i = 0; i < max_devices; i++) {
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index f736052dea50..1b587908f049 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -866,6 +866,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 		return count;
 	}
 
+	if (!strcmp(a->attr.name, "bggc_block_io")) {
+		if (t < ALL_IO_PRIOR || t > BGGC_PRIOR)
+			return -EINVAL;
+		sbi->bggc_block_io = t;
+		return count;
+	}
+
 	*ui = (unsigned int)t;
 
 	return count;
@@ -1175,6 +1182,7 @@ F2FS_SBI_GENERAL_RW_ATTR(blkzone_alloc_policy);
 #endif
 F2FS_SBI_GENERAL_RW_ATTR(carve_out);
 F2FS_SBI_GENERAL_RW_ATTR(reserved_pin_section);
+F2FS_SBI_GENERAL_RW_ATTR(bggc_block_io);
 
 /* STAT_INFO ATTR */
 #ifdef CONFIG_F2FS_STAT_FS
@@ -1303,6 +1311,7 @@ static struct attribute *f2fs_attrs[] = {
 	ATTR_LIST(discard_idle_interval),
 	ATTR_LIST(gc_idle_interval),
 	ATTR_LIST(umount_discard_timeout),
+	ATTR_LIST(bggc_block_io),
 #ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
