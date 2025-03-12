Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F86EA5DA18
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 12 Mar 2025 11:02:46 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tsIv6-0005UQ-P3;
	Wed, 12 Mar 2025 10:02:36 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tsIv3-0005UH-Kq
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 10:02:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=zi2kNaj0+gWPDFfJl4CNPjOVMArnGnCzfBecAOH141g=; b=hHMTw3SZV2Z8DeaIslYCMVtIZd
 Ll5WOcCyyaMBxIbsarTTSG90XYW1v3JQeNkPMI4zec80x6iBrSI665xGbf2Oi4ZeipGj0lFLw3Fxd
 YUJq5iNm9UUT+npUXoBYoXWHKnkiSUXXensDkYnPfUiXFyULO8BAAQj+AtUk14c6wzM8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=zi2kNaj0+gWPDFfJl4CNPjOVMArnGnCzfBecAOH141g=; b=B
 xw9ZFN/e+9QqOKOCSn5Kssb8osBa5b3ooImbndtjIf+d1kOpiVpSbq5wEuKdk37T4OVZopXqhj/+D
 OhSHi4OrgLzjh1ym8hnGCcwYiBesaoc22mzc3irKxVCjfYtqrQg1F0eOBehbpaW3ynDQVegdvrIQZ
 3pO80ghHCaEE80NI=;
Received: from mail-tyzapc01on2076.outbound.protection.outlook.com
 ([40.107.117.76] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tsIuw-0007fd-MI for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 12 Mar 2025 10:02:33 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Ivj76G5lMRlTEivDQWD11qLx5GQW1vWohoW5JtPotFtEri5D79xmdjxXqIpmEjy6uK53dXPg54LUl6PbGE2f5dAj25fX0nlS4JEsrAhalQvSfwpJKKWppd/CWv2Fmas9G6as2JRtM9aLkwWbp+HCoGMC0BA/k8Iys/kc+0N5iYV4zwDYHaHB2P8vRDA7MGNbxWMIG3RZ/pe8lKiGP5CZMHn24tA+Sw+PpzqZGP4DcgxVIV2KpRDAvUG4cE4JFXcKvqMd7dppFgfMCynxh25NvGNwC/dVpZuwfGidsO+nYFikVt9j0UlxP8gxdN8yo8ZGT72RcFV9dAFuGH8ziYKQ7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=zi2kNaj0+gWPDFfJl4CNPjOVMArnGnCzfBecAOH141g=;
 b=e6budn87ouDi3F01SsgOpvX2gBHe018dXcY/J3ktOirUhveYQE3xVfSYzfDWZk01L7Pi4hEGmevO4+Jfi7fBWcqgFkMLpJvJQmoHdYzShKgOhOfU48EEzR2eKBlPgt1Np23ImcpmKWSeFVFDza2gaOaBxBagmr/llbOS6xkDl+f4RrXTXCKqf9doEENv+QZDSYaYw9BRfa2BuRGM2pdZIXYjg7UTGrQwtEjVQJPD+M1e5AcYU9Cvn/xAZaYQBzIh0ZbI8Eo/c4uhL8WucX9B5e4xfW+RuFZ/brUBtVw9Wcdidro6cOPV2r/184EfI+18UPoCQWNRpfrlWMCkU6MZPw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=zi2kNaj0+gWPDFfJl4CNPjOVMArnGnCzfBecAOH141g=;
 b=FbUMbHqZWSsGVZ+yusn4JJ/fvymzGsJXqtIHgAKw4jS/6dUBmxAPhxpJiDnF0X6xv3w73EYb/zKaKa3dpOV6zhfxeAuxVjUx+Og7eynPxxzbEYed04syV0L+zC5ts3lGhf0AbTukygFrck27hWQsEUeXO1VkiGRZ2KXUZYziAJXW1oU8iwWL4/iu1gW5W4EpG3vBVepyH1dDuteCci/7Jjo727ybnYEFzW6oa+HVvLvYQThSenjr9ySrA7zAky1ZI/0+iTTmH1ufxT+VrtI7uriGtSI2dgLF04/4UnQK3Dj/ubqi68SkHJ2buVFIjkDmwzkH41orHEmHpRfx/3X5Cw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by SEYPR06MB6929.apcprd06.prod.outlook.com (2603:1096:101:1d9::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8511.24; Wed, 12 Mar
 2025 10:02:13 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%5]) with mapi id 15.20.8511.026; Wed, 12 Mar 2025
 10:02:13 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Wed, 12 Mar 2025 04:20:05 -0600
Message-Id: <20250312102005.2893698-1-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
X-ClientProxiedBy: SGAP274CA0007.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::19)
 To TYZPR06MB7096.apcprd06.prod.outlook.com
 (2603:1096:405:b5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB7096:EE_|SEYPR06MB6929:EE_
X-MS-Office365-Filtering-Correlation-Id: c4617362-eb7e-490b-722c-08dd614cf5e6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kQUfcH3W0mxKRR4Z0NcZPXKJPIZQkcA2se/VuC37PpEAP+5gggTD8Yefb/ct?=
 =?us-ascii?Q?Kv6zbG+wol03ELRLYlRDRJK3qrtqNh9k91QYiksjh5zlwwVcOCPJNr74quLn?=
 =?us-ascii?Q?E3RQd1xBoxhU7m6JkYyeCNJOHHgFw0FGu6KLjuNzDP6yobEIJudXBeA9MqeI?=
 =?us-ascii?Q?UPoB+ZRd1asV/aqBVQ/zNLZJf4HvA+2aOtxPb0xOKe1p+6wO+B9UtQdCrNI/?=
 =?us-ascii?Q?q1gzxJBjlMKl7chVETkVU5LCsIRN2dJZCF4Vad5lrOTLuQkLzG9EIKcL3zpO?=
 =?us-ascii?Q?3PdUa3CQI1w0mPNLGeWONTQVXAOheoH1jXlIFvUBKPG3UOUzabJGbrHN+Mz0?=
 =?us-ascii?Q?KhWIasq691JpLBRjtNiTan5jN/ZQv8N4Vuy6UXn+/laIQqlxvXtZun6I+qN/?=
 =?us-ascii?Q?86TUQOtH5fhiHJJazLJNdzBeTBG5XiLMirsLs8S0P3vqZ+2TRjRtmoH/QJsb?=
 =?us-ascii?Q?C+of3FspKKbId/Ny7dZJH+VJ4F7nQjLXUFrWfNN0dvKT9lHze0XM5Q7oHcGv?=
 =?us-ascii?Q?cesomJMpeWPgIItLT8NQo1T11CpiAJ/PG7PQ7yQ5i9M272feaC3UDhQYgb8a?=
 =?us-ascii?Q?/wJhwNa0t9LaKzU0clBe9kLFdam46Q4pCinx1aje3XxLagRfwnBEXbxPeySG?=
 =?us-ascii?Q?i0L+oujSePW44VbfSjpntbV/4u0gYuVkufElFmA1R7x3Yj2LE65B3oNGlEcg?=
 =?us-ascii?Q?XpzvSVrVsrOXQkyLhL0pjCk0IpV+mKWdYCpK1YSpzRWJIfOgt7GTjg8Boxuc?=
 =?us-ascii?Q?DhIS5/6K6Ufrg4NMnfK7rpNoJPC7DXlw5wsunsdiLF5nYjtW5TM+30TBaBfN?=
 =?us-ascii?Q?DbHTgO3t4nJEs4RIgeamlRxZY7knuCGW3yltHe9q0wy2BeEfTJ5Roipqcnlk?=
 =?us-ascii?Q?AxFbx64pTJ30poJ+N+2vSTEmpkij4ENsaodY5H+60mfuNgY5WRLy0KgoT8yL?=
 =?us-ascii?Q?6OnAD/HVsSy4dp8dfFAPJCrwlAwKQH6F/IiDPtknp4oUXxf4s4hySoof0A+8?=
 =?us-ascii?Q?irsgIsqJ0/I7/x5cTo6gcnX7Qlbnu+QdtVqtswtIIljP3cNDhFMFhH9XH2Wg?=
 =?us-ascii?Q?5p81eCxXUTpPSPuoAvms9y2SMktGcEa2yQ4COgSKq9yf0EMyoTk5yYjY8uzU?=
 =?us-ascii?Q?hlDJn2Q2lcR4cH8y3oqa97EAWEjH61sn7qspLj5x62/lhZQHKStmeqLO2aSg?=
 =?us-ascii?Q?J4p6KRO8W699veXXr0az9aNgZmRrGFX9rgsdcekvSmu5ScdtKgSc/HLMbAFq?=
 =?us-ascii?Q?Xpl/jvNuxDTX9YwomxnsOBkYVDlnt7ioGDE/JEQj7tqy61MEE8o5SMnuITgP?=
 =?us-ascii?Q?PlBjpr/C1KjcwdU0exAAp2febKHPvSSV8dELkr+PpynzAEEkWbFeByubfOTi?=
 =?us-ascii?Q?6GuSM1H25xzoGJqPR6MQziC4aSDixijzx0lsUMbIyi8MhA9xLmcDw04lq4hw?=
 =?us-ascii?Q?JdqIDvs5YSut50O+H5BUMl8uLGbLoOQE?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?NnESFrRAFyiW/FKAL2XEPABLbGK8ISis/r0hEVsI6uY4S9Yfy+fSsRAXrgfK?=
 =?us-ascii?Q?JdLmyTdlPSxfPofSHvYsLYOkPsRWRhbZipkwpUFlY1LzP9kIN5SzCG9IGQMA?=
 =?us-ascii?Q?EBc04jlyt0P/C74I7idPXnSo1VnE0fe+zLDqH4beQz+HQdrG4se9DdRhWtf1?=
 =?us-ascii?Q?sa8Ejst7XEBg9OF0MQbY3sx2jCSfqgFDABJJRAbOLntL856zV28VcpYrVvnf?=
 =?us-ascii?Q?TPi6dRMIqeITKJdcKbR0yj2EDCGsH5Nb9kejOtI42Ed1qUQV4Ti5lx0k+cqM?=
 =?us-ascii?Q?uSwgCmvCY8Yj9js4v4wTQqFFvVAqirRwW/B1XQ6IlJQgbZU4PalVu4V9+tBy?=
 =?us-ascii?Q?DLPGTCk80VCtgzOIURtQQqxNjKCZRC8T+XtezLgaqCV2wk8zvPcbzhgeMxaV?=
 =?us-ascii?Q?l5hkGJGjLTggitY56K5dWsRe5Oual60Nx1eD54A2DDal2ozTns1de29SgNBl?=
 =?us-ascii?Q?oGIblamTmy+I08+MluyOdpAZIP1OukC6Hhhb702QzeaRN4Ib126E9qzZBHJO?=
 =?us-ascii?Q?Qs0mlCrCNUwq/BcbLlBscamosq66xpuMRRv9mE2GNWuAq6vl8D3T7n8Kt3Hz?=
 =?us-ascii?Q?OmJFswyeowi39mrqOZc6iOxf6jp2Bb9PUjKf1ySLVSy7vFZVj3W0oeHf263G?=
 =?us-ascii?Q?w7YNKzs3JPmE6DHuRNJeQd98iY2K3yjw4jvoRvWgQKVZk108S9m5FfrvAf0D?=
 =?us-ascii?Q?6TQNL+6QrWtzfhrfPGDuB/G4ahtScgmZLduN9J9P50hyPGtqA+cr8jCLXecP?=
 =?us-ascii?Q?YyOYOqgmcvLQVAbtlI/S55tY6LaTcl29n7G35Z7wEisgjTNrtLJXXDQtUaai?=
 =?us-ascii?Q?FROgJn18dXMf8VYivIp+bD8zwDD2lq0T8F8KmHj+y+QOsOKPhaV7wRky6QvQ?=
 =?us-ascii?Q?VHicizdXKbGAMYLvzmCqCE6D8NmsLLUAyydpzD9eDdf7TuQcxgiC26kxMhUQ?=
 =?us-ascii?Q?/eiYPPuYZwRnqToegYtenNi/WoTKCbr3qNur0X4vFPwE8bax6WbMUpaZR99H?=
 =?us-ascii?Q?4AwSUjBPMYuKyfSVue1X4KQC8pAoKc7+A05p/qUXh6zEC4F2UufiU5W/F+oT?=
 =?us-ascii?Q?C7bt/BXsehL6ExnByTSlIAWhK/C1AlYyTDHWho19Ck2QCTRTUcR0dnsdDeH8?=
 =?us-ascii?Q?Q4+q5zt+fS90YubjXu856CW00TNfxPCmnUywVeYak4DOvgmPth5wPhOLverT?=
 =?us-ascii?Q?dax5IbA6b/Vva4GAgVMZ/Isthx7jrbnp8XJq2DmDEfuTnRbL9VEr2szfT9Zd?=
 =?us-ascii?Q?Jb0xY+b7HfvESWMUreou46g6kU/IJNzIR+5AVCti8T9Gy718xPJ2itB+8mYF?=
 =?us-ascii?Q?k2yZ3sf32TnsYrQjRH++F0uJpVX822E6m2/d87P8OeRKFOOnLNRLntegLBqE?=
 =?us-ascii?Q?i2nLr4OIHzztEv/4RtZCVQTVyxMBXJgm6PPaoFQBtih+0oU3swQv2gLg6hMz?=
 =?us-ascii?Q?/r986k4s05vUtzxVVfEn0fB5Z4iWsWU33vMBuORwCgqDE9TDFRXP2IRmIP3Q?=
 =?us-ascii?Q?E234kaTyXqPNAA150/VGzR121KlOHDmFpAxcYTB2WF/0n/vn/8KtXbkZdm+J?=
 =?us-ascii?Q?DOPBigDD4DiKa6qm+FuE1axpqu8+eQBmAZLJtcsk?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c4617362-eb7e-490b-722c-08dd614cf5e6
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Mar 2025 10:02:12.9454 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: OJCiUANLBcv0w3VssrEuGw4cko2XDP4VrmHvKpy2IyaDGOMDO7I44S6mqTOboaxKXNObGj7wPA9s0yzSO4r8zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEYPR06MB6929
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  fstrim may miss candidates that need to be discarded,
 as shown
 in the examples below. The root cause is that when cpc->reason is set with
 CP_DISCARD, add_discard_addrs() expects that ckpt_valid_map and cur_valid_map
 have been synced by seg_info_to_raw_sit() [1], and it tries to find th [...]
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.76 listed in sa-trusted.bondedsender.org]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.76 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.76 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tsIuw-0007fd-MI
Subject: [f2fs-dev] [PATCH v3] f2fs: fix missing discard candidates in fstrim
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

fstrim may miss candidates that need to be discarded, as shown in the
examples below.

The root cause is that when cpc->reason is set with CP_DISCARD,
add_discard_addrs() expects that ckpt_valid_map and cur_valid_map have
been synced by seg_info_to_raw_sit() [1], and it tries to find the
candidates based on ckpt_valid_map and discard_map. However,
seg_info_to_raw_sit() does not actually run before
f2fs_exist_trim_candidates(), resulting in the failure.

The code logic can be simplified for all cases by finding all the
discard blocks based only on discard_map. This might result in more
discard blocks being sent for the segment during the first checkpoint
after mounting, which were originally expected to be sent only in
fstrim. Regardless, these discard blocks should eventually be sent, and
the simplified code makes sense in this context.

root# cp testfile /f2fs_mountpoint

root# f2fs_io fiemap 0 1 /f2fs_mountpoint/testfile
Fiemap: offset = 0 len = 1
        logical addr.    physical addr.   length           flags
0       0000000000000000 0000000406a00000 000000003d800000 00001000

root# rm /f2fs_mountpoint/testfile

root# fstrim -v -o 0x406a00000 -l 1024M /f2fs_mountpoint -- no candidate is found
/f2fs_mountpoint: 0 B (0 bytes) trimmed

Relevant code process of the root cause:
f2fs_trim_fs()
    f2fs_write_checkpoint()
        ...
        if (cpc->reason & CP_DISCARD) {
                if (!f2fs_exist_trim_candidates(sbi, cpc)) {
                    unblock_operations(sbi);
                    goto out; // No candidates are found here, and it exits.
                }
            ...
        }

[1] Please refer to commit d7bc2484b8d4 ("f2fs: fix small discards not
to issue redundantly") for the relationship between
seg_info_to_raw_sit() and add_discard_addrs().

Fixes: 25290fa5591d ("f2fs: return fs_trim if there is no candidate")
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
v2->v3: Add f2fs_bug_on() to make sure it never issues discard to valid data's block address.
v1->v2: Find all the discard blocks based only on discard_map in add_discard_addrs().
v1: https://lore.kernel.org/linux-f2fs-devel/20250102101310.580277-1-guochunhai@vivo.com/
---
 fs/f2fs/segment.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 86e547f008f9..c8ad8e3bfebb 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2075,7 +2075,6 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 	int entries = SIT_VBLOCK_MAP_SIZE / sizeof(unsigned long);
 	struct seg_entry *se = get_seg_entry(sbi, cpc->trim_start);
 	unsigned long *cur_map = (unsigned long *)se->cur_valid_map;
-	unsigned long *ckpt_map = (unsigned long *)se->ckpt_valid_map;
 	unsigned long *discard_map = (unsigned long *)se->discard_map;
 	unsigned long *dmap = SIT_I(sbi)->tmp_map;
 	unsigned int start = 0, end = -1;
@@ -2097,9 +2096,10 @@ static bool add_discard_addrs(struct f2fs_sb_info *sbi, struct cp_control *cpc,
 	}
 
 	/* SIT_VBLOCK_MAP_SIZE should be multiple of sizeof(unsigned long) */
-	for (i = 0; i < entries; i++)
-		dmap[i] = force ? ~ckpt_map[i] & ~discard_map[i] :
-				(cur_map[i] ^ ckpt_map[i]) & ckpt_map[i];
+	for (i = 0; i < entries; i++) {
+		dmap[i] = ~discard_map[i];
+		f2fs_bug_on(sbi, (cur_map[i] ^ discard_map[i]) & cur_map[i]);
+	}
 
 	while (force || SM_I(sbi)->dcc_info->nr_discards <=
 				SM_I(sbi)->dcc_info->max_discards) {
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
