Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A3FC39892A7
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2024 04:28:22 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sujfO-00079O-Mi;
	Sun, 29 Sep 2024 02:28:10 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1sujfM-00079F-8s
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 02:28:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=XoFp0nePSas7xgzmyhzjFsHoKiflz+dMvPuW83tUaGs=; b=DwEES3UpqBG1BpGRbDaGlNMFpk
 7SEhCbAaK+uivz/4BCAngRyrvEqGCxb6jDuU2Dcn8YdKzHbT+Gyy82RFHGMoZC+o0qgJArKkUDdZ1
 5MHUt6Qe4sLbeqE+Mp5YenbYGF6FO+46VcxriscHpHjKK1xaPwDE0YGI4yzH9HAftG8w=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=XoFp0nePSas7xgzmyhzjFsHoKiflz+dMvPuW83tUaGs=; b=g
 +dsnMzQzrnE3VZJv+IvPRjhzB9Uq0Fa/z88v0Dd13KYHlR5fGoB3vEzYnpFC3x8FZbEmogZVcnRxz
 w/YiD8Z75HpcvqLjwnmt5lVG1Dc9waDgl3JxYjjPtmllf5ZK2g0w5Xq1xeBwXnVUUJQp0U4gYhcNR
 lGivSxlvLwRRSvcc=;
Received: from mail-tyzapc01on2080.outbound.protection.outlook.com
 ([40.107.117.80] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sujfL-0002wh-74 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 02:28:08 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Gl1lI39Gid8tOynzr0uyBENXEjkSN9oznuecpmOf+MkN4XVcCtnWOipmypIhuK8lRhXwqfwfFihobujSCOwhNUjJyxZBwRuMqWTe+KkkreVGeLf/9UUVwraWPdqBjF30pPHTIAH8yMRmGbmG097MAAstDEmSRwyctPHQc46tur4FfqiPHEULbleWB7idCySsTT2kv8x0JNQyI9SSV5iqhf6ZzRra0o7QZAkxelmGU6ZgptgqN9q1HgdQrPg4EwLsVLVkEFcqleuEmzKGICTDORFo8XMDrVRRCH92GW5YYint1AYeRA6piGYbgEjVz6FAExpKm+CNtF+30KDireAmTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XoFp0nePSas7xgzmyhzjFsHoKiflz+dMvPuW83tUaGs=;
 b=E6uUC+FmRtiySuQhNjxRkzG63VjPfBSFw7EU51J0E8hmL5O/EGZG37Jd6FioW0u6mTSi4i9AnQGm93rl/rL4y0wBTzxJn4s7O02T+MZXvTDtbGH8WPX7zjl+g5P9Vg9WQmLohL+xehl0d7DcnwXcCNZ4Ll7BZMhQAoxUNWvTZBIn3y6PpYdtyZxsO0mhi9WPmrBQDSNrB28a2TbmOki+4YeJa0f9VBi3vJmnwgB+RrF5ofOFG+RsIXeep9txkTuPxN+gfryi3viXnz9TWvLX0dChzl5SDhS0W3dLuHT+/HpgSpZ7EHDnfR9dUEjKoo3H6R8e+ewr9qbyews/yZyeng==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XoFp0nePSas7xgzmyhzjFsHoKiflz+dMvPuW83tUaGs=;
 b=CClrub7NZk7XHeDsUDNhcS/v9R77DebKkXJY6dH82ASgO5DRJg+HsRYdjRj212WRtki1t+ejzz/hK+Wn9DxWVS7Nv9Ft09af/tyXhwhEWkl8Rbdo4OenPbqo83Kv3z467hWlNC6HmAWMarwMCkByYqxY9s8FIXT4+WPhJmfpCRQwDbNNZYI6y8laIzhMF81ku5h7QFgDOnGPgD4uf9vEweOXibc/vfkDINnwOFIiNHSdn7mIT948A0sW6Xat8Fs3wVqj6/Oteqww465X8vPI6/i/TXpYKFf+z/GCfNg28lWxSpzcX+4yhlb1wBlB952g06m2Hkp01eVMKIeLujHvZw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by SEZPR06MB6119.apcprd06.prod.outlook.com (2603:1096:101:e8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8005.25; Sun, 29 Sep
 2024 02:27:58 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%5]) with mapi id 15.20.8005.024; Sun, 29 Sep 2024
 02:27:58 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sat, 28 Sep 2024 20:43:43 -0600
Message-Id: <20240929024343.3763975-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYCP286CA0117.JPNP286.PROD.OUTLOOK.COM
 (2603:1096:400:29c::15) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|SEZPR06MB6119:EE_
X-MS-Office365-Filtering-Correlation-Id: e0cc14f2-97aa-4a91-e79a-08dce02e5530
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?s43XswHeOtrTclNG5yBB3pTcWv/pV8ER8fT0nJl19qcT/KN6MoRkAeMVDcF6?=
 =?us-ascii?Q?RP48lqZ4E5BNTkMv9B9Mm7gkYY8bcEmNy1+0uwksfBTEumX3jzjhvHFu0rT8?=
 =?us-ascii?Q?ZnGHr3vS+k27R8QwkigRYyhgN458qarHOTKgS+E436y303RuXLv4dFaJGeJl?=
 =?us-ascii?Q?gRGJdwZaz6ZPhJtm6JDStZPj/rlCPNajuAHXyxL6CTz1zNUiCEXcC2RqoZ0U?=
 =?us-ascii?Q?eJvTkNgB+7HsWP17Xlhqq11uWSnLy6tCNv2wrmsu6J/csJU1VGm4cEwhc8jW?=
 =?us-ascii?Q?ZEYTR7ib8k9bZS6eZTWuKb8NvoF6C9PaDivnJBscLby6aZeibizoZQ/lMMdQ?=
 =?us-ascii?Q?HcbMxopQeHzmQw8nbVm3dwXgdB6EmpUyBzKM9iHqVoLOZy1VkSZQzkY+tpfe?=
 =?us-ascii?Q?NpHT7PeVNgGGVOJ9aKs6V0lJpToi5g/gZ42h4d/QqVG9lryGPOS4fobtlYJL?=
 =?us-ascii?Q?U8vQ6edkDZSrxGpD7b9+N3qmbk4kAPqvkMvK4V8iyUmzVQ5cMkeiik1RMxEN?=
 =?us-ascii?Q?D8SntFE989t6wAXuFnDzdFg7Cb6M6VJ/LBGKLQXA4wsCdPe5dpTShuOf80WD?=
 =?us-ascii?Q?+GajUwR00xoI7tqrJx4Q3G1Zy8goVWz+xK3wuwkLXNv41nu8yj55t2V+RmOI?=
 =?us-ascii?Q?kfEqxT0/Gtpp8rGZ+oxNFP1gKZQieidvzqLHypdxWx7/YZTCCaNrfB3t0t0b?=
 =?us-ascii?Q?q0JpLkzKQHf0onGeKQLZZO+oTALL/lLwE5pIfwxq4CbFr9IBvHsh2U9kvPRs?=
 =?us-ascii?Q?IJo+ApU+4Mj5bIfZl0XDwldgnpiJoEFJmfa/5BfoRDg0gtZLeDBAX2DY5Imc?=
 =?us-ascii?Q?hKUcuH6FbjjuHORtaJcjF/NSIWJ9ZdwwfQBM+v1DFQqAzVRNyMYzPNMptglk?=
 =?us-ascii?Q?PX/KiLf9jJApEis8U1DGHzytjl0i4/xjw6U4sdlJKNK1HgTzQfqS6ktAb8R1?=
 =?us-ascii?Q?8e8PCjalGJYlAUfXr9VNuVgHRf7ISEzRrGrGClKnBuHimLpurK3Kri1xTy3v?=
 =?us-ascii?Q?jKdrpvKtNLIsiqkhT1cyeqgqWfjUwL8Ta5X0pokRnwVndnl46Bg3f2t/OQ7M?=
 =?us-ascii?Q?G+k7MryTLA2tvNo/nbHBmwuR+np+uYySrf6PPD6R9OjIeygVHEzeSXbR1jKv?=
 =?us-ascii?Q?KOsDnrOcN5EHjxCw/SXVjxtv1HOAzLMEt/4pGE9vgKg+WOfhWOl97eLAshhk?=
 =?us-ascii?Q?xxU9LVogJbo4t0eoeIEL/DUTBbEN2VBEDgjkpIrFwCgPPRPPD42OI2Mj7COR?=
 =?us-ascii?Q?LvuRuMO3iTcHtL9c4Ql52kxxpjAGEzieoxIVrXi+PH37SNlQLu2tmLku2Amn?=
 =?us-ascii?Q?ktgWZIkafHWlxVTGxzu27EqHGyooSDo6bWF0wQFnd6rY6Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?a4svtNH9uHUQB2wCYY0ec0ibTRCEJIsACS/DOY4zmQbSwPamd00Wf0Wn/stp?=
 =?us-ascii?Q?23OJNuRWS0p3diX6T6on72H72Wc9RcuINWiM9m6z3jzfVZbBnpLTgKohFwoo?=
 =?us-ascii?Q?NtJFOMuFyoF1icW02RR3E+wiiNLsRyXDn/gILDHTGpAFst3G0yAPhEnxeeSe?=
 =?us-ascii?Q?lWEEgemirPjjoaoaEGAd8BUzUUlp+v60SAExIuOZywJd6Wsljapj08w65jYv?=
 =?us-ascii?Q?avQAhNcmWDFTFX3t+iEN2+pKXfnWfntcx01US7uUgq34TFZww5buOf3d/wTt?=
 =?us-ascii?Q?jUtLyVaewozg9tCKmPswMuNrTorFTDmeA7NgNzM9wWhBjI7y+o+nbeBER4KB?=
 =?us-ascii?Q?C275IDhHiBRmNUidBgyJf8E7n54NAGpUh/MwYbmtkCFOGeGyOD8AmEq08vCR?=
 =?us-ascii?Q?bykGHSEVBbdGxPTd9fJUvuJVKmY18gK2S7eJUWgcpdgCR8jBQ29RnoDpOZe8?=
 =?us-ascii?Q?xSOAAaBNZ2Ophz4s61q/FvnWgw//jQ6BsAePeMZelejfArwVhsbEkgJZAoqg?=
 =?us-ascii?Q?wQbR0GUx6DBZ7lq1r7xqcipeaKWyjhYQKqfoPfpf9l2UeNwDCwoxYswEWKfP?=
 =?us-ascii?Q?SQmFaUQNekv7xoxJnE/6CGTRINpRF3oxNEZsX92M2jxNra4B79I0fBpGJiFC?=
 =?us-ascii?Q?bBsR/pG6wfy0irn+8R5JkFb7YqagVaOCp7advo6gQ0d4QFjqgK1rIBo6Io/e?=
 =?us-ascii?Q?y4IKo2T8x3QdvtexY6VaMMDx2xFoOOW5d6b72J1mNT6f/YxvAUbQItKOOfY3?=
 =?us-ascii?Q?teYyqfHQSEVImcKmsisg0+ckPUXkHv6H5Z5r7AEJSP+dVOx8HVKjeoVGtIos?=
 =?us-ascii?Q?YeG8PK8gTvetxfoMXifqbJK7RVRXuEoXc8EV5wWlYSWB7pF6V0WeR4Dy0u8m?=
 =?us-ascii?Q?5uRaGUvUjkqqIFaRdCXMOGvXilBTt842mt8cE7bbv+s1sE5dLo0lAXH2QU+I?=
 =?us-ascii?Q?UyqdaedNqtkBfs1dw/6mEl1iJFiTV3lx/pKNmm3yWDMbViuhSGGh/tYawONe?=
 =?us-ascii?Q?UfcsD9EpBN+DMUh9ANrYBwpAyCTKGZVVB6afLCjSCCEz/adSQI4tmbpLDt9M?=
 =?us-ascii?Q?DCC5xzGpmMRXJnktS8uL2UIBdIgm/nUZRcmcmMROb4JGb9sAFKojClNx+vFP?=
 =?us-ascii?Q?hqz5+03njiZNCrfc15Jvf2fhOZxeASfInLzTrY71nIHXrY4raZhRUTTwrhYn?=
 =?us-ascii?Q?U9F2/7xVXYXlmh7Vh1DQJwGyFmtZ4lchdOH7xxpdMJdUNA5W677Dd1/yn/Li?=
 =?us-ascii?Q?hRpHXatJb85EIH9FovfR4IX3OiLFn0lG/KGakSufvBLr64zCm0kbZGI4LS7y?=
 =?us-ascii?Q?xH12u8gYXabiLUSa5zyvanY+naXqdJDTzrZ9qcQfwLJL4oyqZy4POfDKM9bv?=
 =?us-ascii?Q?0zrczRFZJpN14+B9gjfp+kwr04ITZMrkbeSiI7vlFrGAKuv4TRLVsC6bOQ4T?=
 =?us-ascii?Q?vJxmZW2PHg/hxpmaF8Ov9J+M1H8v/VQ5DsOEN+0Cjj9iRZb5DkICPYI2B3Jv?=
 =?us-ascii?Q?DNky5M/fuiAG6F4f9eSppz367Py5QyNAyM2cL/f8jGNex7Ai0VsT4LIPJAiE?=
 =?us-ascii?Q?/Ceg6Sa+X4/LdN5siaLixyXX71g6bmTjlni5I1M6?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e0cc14f2-97aa-4a91-e79a-08dce02e5530
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 02:27:58.3793 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sEy447GypYBzIGD3XoKWMUy9ZM4jCNc7ap+ZTRlxbaloOGK3aaqAZf02oHxMS2A0y0t2tiq0Dr5Cm3Q1PNmmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6119
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  After release a file and subsequently reserve it, the FSCK
 flag is set when the file is deleted, as shown in the following backtrace:
 F2FS-fs (dm-48): Inconsistent i_blocks, ino:401231, iblocks:1448, sectors:1472
 fs_rec_info_write_type+0x58/0x274 f2fs_rec_info_write+0x1c/0x2c
 set_sbi_flag+0x74/0x98 dec_valid_block_count+0x150/0x190 [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.80 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sujfL-0002wh-74
Subject: [f2fs-dev] [PATCH] f2fs: compress: fix inconsistent update of
 i_blocks in release_compress_blocks and reserve_compress_blocks
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
From: Qi Han via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Qi Han <hanqi@vivo.com>
Cc: Qi Han <hanqi@vivo.com>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

After release a file and subsequently reserve it, the FSCK flag is set
when the file is deleted, as shown in the following backtrace:

F2FS-fs (dm-48): Inconsistent i_blocks, ino:401231, iblocks:1448, sectors:1472
fs_rec_info_write_type+0x58/0x274
f2fs_rec_info_write+0x1c/0x2c
set_sbi_flag+0x74/0x98
dec_valid_block_count+0x150/0x190
f2fs_truncate_data_blocks_range+0x2d4/0x3cc
f2fs_do_truncate_blocks+0x2fc/0x5f0
f2fs_truncate_blocks+0x68/0x100
f2fs_truncate+0x80/0x128
f2fs_evict_inode+0x1a4/0x794
evict+0xd4/0x280
iput+0x238/0x284
do_unlinkat+0x1ac/0x298
__arm64_sys_unlinkat+0x48/0x68
invoke_syscall+0x58/0x11c

For clusters of the following type, i_blocks are decremented by 1 and
i_compr_blocks are incremented by 7 in release_compress_blocks, while
updates to i_blocks and i_compr_blocks are skipped in reserve_compress_blocks.

raw node:
D D D D D D D D
after compress:
C D D D D D D D
after reserve:
C D D D D D D D

Let's update i_blocks and i_compr_blocks properly in reserve_compress_blocks.

Fixes: eb8fbaa53374 ("f2fs: compress: fix to check unreleased compressed cluster")
Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/file.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 9ae54c4c72fe..7500b4067996 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -3791,12 +3791,6 @@ static int reserve_compress_blocks(struct dnode_of_data *dn, pgoff_t count,
 
 		to_reserved = cluster_size - compr_blocks - reserved;
 
-		/* for the case all blocks in cluster were reserved */
-		if (to_reserved == 1) {
-			dn->ofs_in_node += cluster_size;
-			goto next;
-		}
-
 		ret = inc_valid_block_count(sbi, dn->inode,
 						&to_reserved, false);
 		if (unlikely(ret))
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
