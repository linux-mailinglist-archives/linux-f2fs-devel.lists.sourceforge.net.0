Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 88A449697F7
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:56:40 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPL5-0001Ak-BM;
	Tue, 03 Sep 2024 08:56:39 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPL3-0001AB-MV
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=; b=aCLVWVAzJV/WzPWLkSWWhVCPlc
 Y99gheL2tEZmqR47J98Bzrc1r0JFmfRh9Kuvia1Vv3L5rU6DJFhx94NIDCqHPzA1IT+LOaDvi9zsh
 gL4pAln2u+kRDFCsG/v28sF02bcJM1Pki9zN/K0wfiDWmIGTI95cx0NS0HTQz9jo8xEg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=; b=LYFfuOsPi8Ho2Kq/p0aqn7Y9P1
 3lD3JcM3FjlOzKrhsDYJpYH0kWpb4OOHY7LmQwg7+zsFK7ZcBAueaf4iIeXK6aH65DuCxaqDgBPxu
 ZeofdljsyOSDpHU65UPBEepDyga1vw8uRioj90k7pSnIbkIUdk6a0j7gPrmjJHtMQVeg=;
Received: from mail-tyzapc01on2050.outbound.protection.outlook.com
 ([40.107.117.50] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPL3-0001WW-1j for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=j7wjkLHc1aKn6edQE5ZG1P+jjEr9eThCTqiDopNuByXXwmSuWAwczGdJ39Pmw2Ua65/GWWjx9qiQueUqPIezQEaAgM6AmNg4nv2azG9hAxXKwbjGlH6tPhwI6DdxwA3x7AzG51r2X6tm6+NWI2hh0A3HwvWA497ubjGqsr2cWPyz3jON5IbhZk5vwuy+q9dDmxwWN9zg6ffsZ7m/ULSJfBRNciqX0HQLXuCwYCsb/ztL3cz/6jtU8TicML1ZwsTzP41Gj7grLiDHwQ15SLFUgQyC5vGTLjIeqXdU9GBVjeUtjUdnnVcbr8K7ZPflWkHDmoYQGdtxESTX2BL4y1EPqw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=;
 b=Iq4vrfRifcf4y/5VTn5CzgaO5k19fCJMcL0fNNzX89hc5X5vCy1WGxWlyNfSS4f3fkbEaWCG+nXYWYya4737pCWj92Y7QHD5xd2NjxU9a8vwHuOkOImkJ2gar8BDWlzEFoW0HM1SAySyb8tq9cG/3jLuOdiH30J309lJKl+jtHKZ/0tXqAuUy+6ZxBp6C/kOavJhtGPfUiUSfK7zKQ/zvQ8T0fTJLGSaUydiYJrTpoQO2YoD/9bzPJIazN0TE/SB5rPvKS5/GF8LmrsebkoGogX1I0CIS+MbaIU+oRo38j89ftxpAn4nQNmk4Prrlq/RwC76c3BgPxI45wmBkkPkBQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NMu3pawJjX7tZUFb0bQVd90/AKHOuyxS8U1KgIgm3H0=;
 b=aV446yRhhmeAj81mTeNykWE/i7BkTdDHjQdJOvmQwMcjMe7HW/6HJcCOkK+Xr6yBB2dl5r/uU9hqbEjiC19HCTXYEB1T+aPliinWMNosBwpFsPMuZjKYqw7UH9pqDKsGHESbBEVSf3CJu2ptHaS5dOfEIZ98yzSMZ0zy0D4HMhXj8BOXgOqrriWZCu8+EpcpcxEH2sibUeCzH100eQ3zVfj7EFRmDAVmhp6DPwnrvS5y7LX2CzjwEZBH8RwbnIADQZ6ZfIEH57cP2Cxm8d3C7QxQw7+Sg7QX+ZGtL7ntXPLySXIcy/rMXPWWoy0aPjIHR5E0uImey+aIWynWmo18hg==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6253.apcprd06.prod.outlook.com (2603:1096:101:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 08:40:58 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:40:58 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:53 -0600
Message-Id: <067f905e4f3b71727cfada291b090896463ef796.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: fd5161b9-479e-45e7-c17e-08dccbf4222c
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?zDd2VlFYivjzkn4QOPiAecorxoETuuze5V46JB0Wu5PADoVW8tp3rNzUYNGT?=
 =?us-ascii?Q?7a/vpvtqDXBDVzM4GtQmXdaB3KMS0VRdXznvsMbkhWTB8dDEc9RjgHzqvni4?=
 =?us-ascii?Q?dgNDUMOHfAPBYualm0Eezslc5+RM7xv/FTAoOO3HCCUNVpPGu0cGovOF+XEi?=
 =?us-ascii?Q?6NbJuuvCRMP5Rc7S2QdrdIXW6kOAWBvB6ENE3RPTgyhJWYTQ5iisctMtAXk2?=
 =?us-ascii?Q?ZeL7Na3sG642BQhJjWjwiWZ558rl+qhfAfltqUCeoP3ODPqY50TCq7hjfkx7?=
 =?us-ascii?Q?OZp3XKe/YUUKMAmP72W8e+ANNisVTri74zU06Yq1QKa6rDZ8gQ8JLj6M3q11?=
 =?us-ascii?Q?X0SO35ApOn1+h/lWF8wSuSOYsw5sLCoPRTDvWb/cbpAyW7M6KOW1LdAe+l0N?=
 =?us-ascii?Q?9uqVlFvOSZA9D3gUmZwIKtl3mOSHz9mWwNHgduEZEeaWZevMPVy8HLPQd4bj?=
 =?us-ascii?Q?rTA4+SQ5bMi1A4r0rsF1Ous5Pp1E/2BLWQVeTVLwovmezzrHgUwZW3JLED/B?=
 =?us-ascii?Q?W+QY7D7rwTioT/k0qwek3bODdLppXjWA69ZWAdwm5b5Ce7dho0dsjqDqgCB8?=
 =?us-ascii?Q?MZQxAiNIEGkknnAfO1WquRGMDicir+WkVD8WNmh/HNO8eqwAQc7O7ck0Xhdu?=
 =?us-ascii?Q?PjmaxBhvEZQf/cPIlCPDxcLn1b0CdJcZS4Cv3+PP9F+F/ZbQgd6UH3zZllw/?=
 =?us-ascii?Q?wpB+V9hEBBnOubVpd3FDSfbdfidmJzmG83DITeF+4oE2MnNXQgfBQXi1i9ez?=
 =?us-ascii?Q?sBzDoUoY+6YjBjI3VJc0tLj6RLN/zl0cX+rB3qeC83Hdn1/71zuBjSV0j8+K?=
 =?us-ascii?Q?44xRQZp9Q2vDzUad9DWT6ITdxdAdSydzRlK6Rr0Z8I3tEHrVzVmXfYgXm/dc?=
 =?us-ascii?Q?DAqvmsbj4U0mbVUlIys5M6J6jW3Ap7x/9FbxgKR0HUY3afNB/qhw8ArGnCS+?=
 =?us-ascii?Q?17T9M/joHmhHgvHTL+ENX10rIusZ181x5g0fVS5MsBrOCLICG5YjQ0RvzBdD?=
 =?us-ascii?Q?0iFRQIQWNK977ZtDOQWnXjzleCpPuh3AgDzBnnwOmZpXtfX8DDZQX+GHc6pU?=
 =?us-ascii?Q?EYae+f74zi2Dqv0/dZkYpFdtVhINaLgzN+tIB5K2aVoxR4hYdQFzNmuSpvwZ?=
 =?us-ascii?Q?F4Z1Hz5BEU5tHxsixPjln2taqqDGrPlNQJrOkC2FGAsCQwzcl6p+5/GviVRL?=
 =?us-ascii?Q?vilGsoDF/pAhYQJsbIRGs55y59RAI6zLtXWyxCVQdh5olQfwSpTGpS1H8+Om?=
 =?us-ascii?Q?mTTep6AxSdw6wj3spWJe2q+DZ0TAn+47f1EeFRfhJK57XQexbdjmy4FlOIpB?=
 =?us-ascii?Q?WpKf8oCMdoGuuthLgUqjMVzdGnKRgDrlpM2xJRWmJtKCeogE47qJJDad5AxU?=
 =?us-ascii?Q?fRXK4kpmEi7sU9Gn1Pr8bjMFzZ3QELqOyfrCLcDewwhiHaMS4Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?lh6kRz9wo060ovgpmKCG8eeJWed2xTXNVyHso3gwyJcsHeemEmA4wNXleBvT?=
 =?us-ascii?Q?ZRWmtm2LikePwpxNZ7RYDacvfuf65hgqe+LVJwJFYrDMcK923Z+9xpphboGJ?=
 =?us-ascii?Q?PihzaEpjG2CCO7hjL7fKUpK/N7pPco+XRfwOQqbYYbdqXisvTWVhmbxpZ+Sw?=
 =?us-ascii?Q?egExZa0fLxLZ4gGy8YiaD5WALpAkNLN3DEz+rNgNErXG9UQiG8S9hXqAdDb9?=
 =?us-ascii?Q?DBKBWht+F+6tiRN2jMJ+XCrTeLBn9Px5LuLaGKdNssb03wL3QLHhXN3HkxZt?=
 =?us-ascii?Q?hfPFZKrdjVUNPYxPIhZKOGdvi0ENNv37ZQA5cRdky1IkLGo4UlQ35nnu/3dz?=
 =?us-ascii?Q?a8Dfi1oTRqgxsbLy6QcPpFaJwkg3J8eDca1hbw8VGuj9vq2HDiVvqkho38GR?=
 =?us-ascii?Q?vt70PZ+Gxph+pr7l9NUU0nT2nMylAuw86iz/gIemL+sy03WQK7MjpgdTX8fK?=
 =?us-ascii?Q?F0+PtW54AKQ5AoHT1CHrMoSxJJk3oDlq3Np7ruvyyGGXFwSjDSaeS2fX5Ytj?=
 =?us-ascii?Q?zhPY2dPfhQRG8BHiJd4m4/eXfOmTkpJ+KtzlQ6cV3Y9TKiyXTTo1KPZvDizw?=
 =?us-ascii?Q?Rs9+oDVqHG0cv8dsiaseXZpyRmRJTjN5x2RfBuJu9ISXZDjPEJ3BZ9OudxZy?=
 =?us-ascii?Q?dO4H97xnI7NQB+owwRYQZbqC9DjF9nDyyE8ZWd7Fo5F8Gt7Wv+Mw800i3XL0?=
 =?us-ascii?Q?u4y2vnFJ1ufJOQ56kNuBdLhOz/dcx2E44tSyvedOZB8x6IgcUfnOOI1fu68i?=
 =?us-ascii?Q?OXwR2M4T5YRAdWEG8Jek+u67oDMPX2SRY94joprOuw2/Pm+HPg+A+fPSjZDU?=
 =?us-ascii?Q?e5K07BQnNYmglhLN+ObFTai7rzRvyk3QBmhGg9kO2hfBRBonEATUeJXISbu9?=
 =?us-ascii?Q?L2UvNoi3AMoT2zD3z0Sy8fnzHovrbbvOqS1RHBDOWy+wXom46x5OhPYRcmyZ?=
 =?us-ascii?Q?4+L3/0nZVUJGqO7V87RiuHbv3FhwjLrBuzH/jzmRrEsPlg2+tihkaLmrnWfh?=
 =?us-ascii?Q?vOVunGrPtPMf4PGnn7T4MB7HAh4A+o1zp6GJOcp9zIU1msqtdYJFJvUBj+bL?=
 =?us-ascii?Q?LrFGdgy6jVb7pL3Aup1SF5y14kCo+x7Su8+V+uyg+FU1h72P5wuxtaAXnR9j?=
 =?us-ascii?Q?2fiqwJ3FPgrL9JdHbjQgKWsa0PmYhH1FmbyNxhOAq+I3ObcQgQTgCf5pk4AK?=
 =?us-ascii?Q?2xER8H43niAPZ+GYUtQwqI62iPIFFw2PNvtpcJ0Rle0v1Of24EeCCYMLnuwR?=
 =?us-ascii?Q?wKV0YVDZD50NoO8LH3W+jTgxf6nsaw62Rxm4fgYQJ4LNM6zKqwYNO+rdFBSE?=
 =?us-ascii?Q?FomOU3EKywaVjymqIrh789RsHI8y6WQ0/m0BoRQTy7rsRyJK+G/ndPFnSWjR?=
 =?us-ascii?Q?7TMKc1EtctjZEh9ExpPy/u4BJslirINgxPqyfYbZj7xB5ZP/YzjVqE9KXk78?=
 =?us-ascii?Q?S2UOXTUrZxq9bSmeFjyGLWoZ8zZBzfWbO3JJtCqjzAPhcLpn5dcC66YXA5aD?=
 =?us-ascii?Q?HYqnipYrHcwr9/KJmmul3iPzkLbmPzPNKsfbimWTN35Qho1YWMFgL++syZms?=
 =?us-ascii?Q?fGUsQVlVK/BHg1HN5ZQ27lw9Pgl96R47X9I06EPw?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: fd5161b9-479e-45e7-c17e-08dccbf4222c
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:40:58.7522 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: co18DbyZwpk0B//8mkCqpOm3DwHUVk8S5L9/JJvnru5UIbsC94qg+mp5JQy1/E8ad3uX03Fj/rgQSgb6xfA5PQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6253
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: This is detected by xfstest generic/114. The inline data
 needs
 to be read out before writing to avoid losing the already inline data.
 Signed-off-by:
 Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 3 ++- fs/f2fs/file.c | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.50 listed in wl.mailspike.net]
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPL3-0001WW-1j
Subject: [f2fs-dev] [PATCH 09/13] f2fs: fix data loss during inline tail
 writing
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
From: Wu Bo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Wu Bo <bo.wu@vivo.com>
Cc: Wu Bo <wubo.oduw@gmail.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 Wu Bo <bo.wu@vivo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

This is detected by xfstest generic/114. The inline data needs to be
read out before writing to avoid losing the already inline data.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 3 ++-
 fs/f2fs/file.c | 7 ++++++-
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 476325a26d4e..275c5739993e 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3477,7 +3477,8 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
 			goto out;
-		}
+		} else if (f2fs_exist_data(inode))
+			f2fs_do_read_inline_data(page_folio(page), ipage);
 	}
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 2551403a5b83..64ea0bfc2e1e 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -4729,7 +4729,7 @@ static int f2fs_preallocate_blocks(struct kiocb *iocb, struct iov_iter *iter,
 
 	if (f2fs_has_inline_tail(inode) &&
 			(pos + count > MAX_INLINE_TAIL(inode))) {
-		ret = f2fs_clear_inline_tail(inode, true);
+		ret = f2fs_convert_inline_tail(inode);
 		if (ret)
 			return ret;
 	}
@@ -4842,6 +4842,7 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 	if (iocb->ki_flags & IOCB_NOWAIT) {
 		/* f2fs_convert_inline_inode() and block allocation can block */
 		if (f2fs_has_inline_data(inode) ||
+		    f2fs_has_inline_tail(inode) ||
 		    !f2fs_overwrite_io(inode, pos, count)) {
 			ret = -EAGAIN;
 			goto out;
@@ -4861,6 +4862,10 @@ static ssize_t f2fs_dio_write_iter(struct kiocb *iocb, struct iov_iter *from,
 		if (ret)
 			goto out;
 
+		ret = f2fs_convert_inline_tail(inode);
+		if (ret)
+			goto out;
+
 		f2fs_down_read(&fi->i_gc_rwsem[WRITE]);
 		if (do_opu)
 			f2fs_down_read(&fi->i_gc_rwsem[READ]);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
