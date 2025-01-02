Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 46F079FF801
	for <lists+linux-f2fs-devel@lfdr.de>; Thu,  2 Jan 2025 11:28:58 +0100 (CET)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1tTIRe-0004Pe-C3;
	Thu, 02 Jan 2025 10:28:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <guochunhai@vivo.com>) id 1tTIRc-0004PV-R4
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 10:28:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=T1aMG3GVzwYX0HJCTcQ9ArjF5DoPr2yQtdqerUg8mC0=; b=Z6pI1x2QS72Kd4tqpuQKckVgV8
 UxjDz32JxOUPzGXurHi+brILJaNNSOe6XFuAWrb6BZRG+laKpWB9vhT/hDuyueHH1n1aJ/AE5i+HN
 A8wdXvNBr0Uod6RL0OFJJ9aN0+LG3DdI0zEQfphBtl+/TqgxBHYx1BbplL5m98rdwZRQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=T1aMG3GVzwYX0HJCTcQ9ArjF5DoPr2yQtdqerUg8mC0=; b=RhwZCfHc95QP5nu+ikoyOoGw1M
 Yko22l+8Oq9+wCc/dmJc6G+IMEvYCfsw544zvy/HqUnsL+/+TeKLuV+pVFjq1AW57urQjoaNRURIF
 kQQmhFlZhk2wxn1EzEt9TdYMFeQZykD0CZ5jkIBe3HCiSh3qukUthlmp1uS5oKi6V864=;
Received: from mail-eastasiaazon11011018.outbound.protection.outlook.com
 ([52.101.129.18] helo=HK3PR03CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1tTIRc-0000rJ-SS for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 02 Jan 2025 10:28:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=HRnwIIRUoMVIdEIgsa7np7TCJ1Tw7ZqXWAEEAiHnphEmEjxxKgKdPHwxECKMveO9YDc4jG/CiUb841UOHm1S+ypl4HB27OOtjGNYc+dGRJ6cV5YYri/YzpRCe7s6Of4AjjFxfNcLT4qCnHECXSy44X+sVaMt4EMIfEdNV+3r19mxif+k0OwiEHI+IiX3DuLFmV4aU7Uc/5IFttneL6ME2Wkdcc/+kQ54Gj3sZdH9L0trhqdzWP/BXOCe3eSRW426nMiE75O5QH2F0dCAZboPzlj0UY6TaT361Oti2HaF/Kw0itwQL71HeSv+eHIws/a4O1uk/vPrIck+hWlWL47Udg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=T1aMG3GVzwYX0HJCTcQ9ArjF5DoPr2yQtdqerUg8mC0=;
 b=QQFtpOsm80FTKe3XM4rf1DfIZunP8zveWTGQobzlHRgFWFiSLMdBXs4aCXipKOltU2vkFzTotnkUpWeHx488FErZERcUwwx1HUEZwhC3YWBf5UE4qdBIm0OSix9eLh88u2FVrV2Yl0Qn1JeC7wY9empoQC5pgUo6sXbSUGAdb3d3RUt/eH+etnxQk4EiKfWc4Ltgyooe08SY/vDyqPnXQwlkpog/NU1jGamjpP1FYEPAZRD/pGIMt0+bOALXwMuTQ7XWcmtFuGsuBbxh2pKeVYn3blwuFTvffMgRH3m9K+2vFTDOaRZPDh5UxHqeN3G8RkuwbJfJv97Gf5WTtUDsXw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=T1aMG3GVzwYX0HJCTcQ9ArjF5DoPr2yQtdqerUg8mC0=;
 b=KitFuBENhRbu4d2h1JaDkH7Izyx7tDof6ee1t0SCQ+UzOCU+klSyR7p9mlcGAPpIjEX7WWOGPrt8TpxzRxdI+bLMw2izY5q+UuuqW82Bp/Ygzb3NBPLyQ1C35/VBpgiL1Su0eOuC0hB1n2KwTt/k6eWtSy14GxoB7YyHfdulXmpeSO9MUwUhPJKnUGWGk+niDWtojS1u+YsYKMC2SrMmYyhcBAHXKQPKI3Nyt8K7q9t7mU67CjEbiVlcXR4zM75Mm0JKX6Zcak8r3ErpIvw2kesKuH4BZSi3g0U41xkK+5R0wtLG16KiBw2kdNDBzQ/ljzZTLrjF3cepu4/LR+Tb6A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com (2603:1096:405:b5::13)
 by KL1PR0601MB5726.apcprd06.prod.outlook.com (2603:1096:820:bc::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8314.9; Thu, 2 Jan
 2025 09:55:57 +0000
Received: from TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b]) by TYZPR06MB7096.apcprd06.prod.outlook.com
 ([fe80::6c3a:9f76:c4a5:c2b%4]) with mapi id 15.20.8314.001; Thu, 2 Jan 2025
 09:55:57 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Thu,  2 Jan 2025 03:13:09 -0700
Message-Id: <20250102101310.580277-2-guochunhai@vivo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250102101310.580277-1-guochunhai@vivo.com>
References: <20250102101310.580277-1-guochunhai@vivo.com>
X-ClientProxiedBy: SGAP274CA0010.SGPP274.PROD.OUTLOOK.COM (2603:1096:4:b6::22)
 To TYZPR06MB7096.apcprd06.prod.outlook.com
 (2603:1096:405:b5::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: TYZPR06MB7096:EE_|KL1PR0601MB5726:EE_
X-MS-Office365-Filtering-Correlation-Id: 702d3094-53d7-43ae-c25b-08dd2b13a796
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?kYO9XkNKfRvoagVFSlty0Yik75qrAk/cFiX9ReohfON2NaY7kiAWuVwuiyt+?=
 =?us-ascii?Q?8sIzl0zV1RXmk+vNIXT5WdCwNJa1wu8BZF/WdguNSLQOi/A7VBr5I8vxKbkD?=
 =?us-ascii?Q?c5VQJowe6bQVG39MEZxhEThwaN9HDtvwlfynFV+2yNc6aqHW/aXMIrjQh9mC?=
 =?us-ascii?Q?fSp4kN7OPXg3BWQDmMPsNPC0z51BPCGcBd0gbG6EVSJgQSv3QJV90Rr7RiZ1?=
 =?us-ascii?Q?T3K5ny44umv1zWHqehimeNdXiEAwWTT36aBCeQ9yB0S9SAc89lIIjSDIIuKq?=
 =?us-ascii?Q?PWQCDI1Xt0mrdXtwtoTV7GpKJw532hEsv3ficrt69/jmdDQPdyZhGAu4fV4F?=
 =?us-ascii?Q?WegdpJc53/GbToieKevchYcPkOvm6c+dRXF+7T8DP9IJbyxxSxSJp9avpJli?=
 =?us-ascii?Q?ayF2SU7lpWs3F0fWNUgsIT81Dps9K+iu8b3tVH30tH2mkkZkwdIzZvOUzPhB?=
 =?us-ascii?Q?khOOCKv9egx1kALrE8kUMRhEFt7svnl8ShqDvKoZxZ2uEhGlMZbXq6ivYAOq?=
 =?us-ascii?Q?e85bxM591Gnqp+V2w6kHKcJ9bqnbXN9wApZ9OJ3aA0JDzznwtlto4lHZ3AHx?=
 =?us-ascii?Q?+ih6sIfrTRxwyI0ZgEF35A/U9yZaPVfuLr5coD1AMOoVo8j2aTHQIk6fxmgQ?=
 =?us-ascii?Q?lhmbxOhcHrTxx0tiMBJGxq4wqqUsqDECutPvyem/dEETtpsJH4fVDaslQXA3?=
 =?us-ascii?Q?IkVuoucrstxaJRmg0HKRTj0xnKFj/mNn6uo4dMwWFxToWhnXrFG3Lb/vC3AY?=
 =?us-ascii?Q?gLIyVx/CYp72F4ynGLp01D9eFl38IgmBzHmXGNBj8l0+SWpO/anvDamuPe0z?=
 =?us-ascii?Q?eB9KMlsZz86TsS2XOcPtEiVWsdKXvNII2IwjOafbhPntz6Kv07XrbLR9NBMy?=
 =?us-ascii?Q?I3vgh5uoCVy2Fb/UgVdR4JVtfcQ3AErh1xhIlpS9V/4pfzHmRGIWUUlUjYu1?=
 =?us-ascii?Q?OnGcuQojrD++axi5mUEnO0YqdAJZPRg4tKpWPMY96vYbdCG5sy+8vY8hD8MC?=
 =?us-ascii?Q?m4KubZ5Xi6aHJRS8ICiKkLI+q3LICcPdDKiFQaFBfZIW/eV59Dl8dZySIo58?=
 =?us-ascii?Q?2uYL6Kz9zs2a0Y+E4njvpYtyOVM73RxDNMB1dCE/mLulrEkamTZ8nsVSTstO?=
 =?us-ascii?Q?91uwbhNaeeNg+iI2wm+xeh4B37kwTAeYCGa2eSK2V7GuZw54DcrHSuTBhcis?=
 =?us-ascii?Q?l8SQaYikMkyI3cb1aHO2iVRNEiUVKqRGOLIqbVGteVjW6mYRNNxlDiMpL1/G?=
 =?us-ascii?Q?iIp4fEEix0JCW+QophSd6Fh3Q04XD006s2K0kp36tbKd2HQApyuR3vKvewFA?=
 =?us-ascii?Q?nktPmPKKauHCoJLiXNRmD/nuCwca7k79v14mBFB+s6quLVHKDOjnaAsKEcFu?=
 =?us-ascii?Q?2nGuOkl0e4ZbxU2mEtRYAJwATMDlHHgIg25SZNrgVVj7GsjaZSm9BFrlUjtM?=
 =?us-ascii?Q?z03LXRJYAzUtfQiHC58ulTEmiG7t2HEQ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:TYZPR06MB7096.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?i3x3x8SUPaaAfPinpUW+3UO5m+FzSuuOnpBxkI06iEIjTC8AxryZ8ZG4+fd0?=
 =?us-ascii?Q?GSEwbBknu918HMIk9O0XEVV13uZp8GXMmcAD7gPj6FdIi5d7hAFJQMIoKd0m?=
 =?us-ascii?Q?kAf/2jZDc/xU0O3YptKBpABlTjYb6QtjX9dTzuha+4VjyzybwDc1j3wFgijx?=
 =?us-ascii?Q?kHhMJQsktEpugJjq6XWgJEr5U+qxKH0w+hy0DBpIq2NVbA+YpHMSQ735gMZJ?=
 =?us-ascii?Q?39p8kdFixyLzoKyM4ejPmQHfgJYIb39Sks1l1/kce4GH0kZAiyqtwBgdQLjM?=
 =?us-ascii?Q?8dMJtXwuDQd+mBI1I61oNDEz+obIwCB9Ngn/eKrDnoKcfMUN/uzNkazcnM+C?=
 =?us-ascii?Q?7TU0uQYI6um6IoMAm44FpLd/d13lbn7dnYT0+KwyCoZDz6GhtkrGeZFAju8c?=
 =?us-ascii?Q?P1VhNy09ARTQxSFf0F2B2QsFbtEN/I8/TXlaxl0mTwEqtcmVeNON52FrfCjG?=
 =?us-ascii?Q?J5IEQWte9mcwlj9zkM49Lu0xr4Uhm9n0pkz9UwUzz28TeDsqH3iCwTb2+PUw?=
 =?us-ascii?Q?6nTHHIzCAm6LRJ42mkwqErUMBrHJVyvm+1GrH1unf8xT+AXoqm2ugNI0BqKn?=
 =?us-ascii?Q?QZbq83+NxDUocAGHufSQpqL5sBYnr7emQhaBAjLqCsiuQrWASK960R1tZYRD?=
 =?us-ascii?Q?vbkThNdAoBcD2WdHPOntLSC5PkjYWiNewpLcGVrJW24xfP9sjjatDvQqjjWg?=
 =?us-ascii?Q?DWDWdlmbxFoi7uT/aA0C3ZmxnD3cLFyJWrN+JaI+JocCEAOT3NpRMjrArjsF?=
 =?us-ascii?Q?jtVcqjjkpo45WAv/w782CSszkA1THI0D8i2sQP/16WFfJkYVFm1ERYldmibU?=
 =?us-ascii?Q?oCTbPR6lD7XgFtMXMWmlargGGNrO1EkWoye65VpSrDmaVvN/OhdD+hOLdSgQ?=
 =?us-ascii?Q?QP0L1SCUYUW/U0x/dBPr6cEnllFbNLthk+8VqfSavsrWbUcbf3G/By7jT+rD?=
 =?us-ascii?Q?0ALd7Rtdq/oxbplFstOgmnhfvPaH97bKTr+N3bdE3rTT23CeLD4CGp3/oUjD?=
 =?us-ascii?Q?yfZ+Kt+l5pFc0PwAd5fxW9im0ut+wZze2aaGcGZrZLbITKbPOCsg0QmRUX/0?=
 =?us-ascii?Q?MfNQLD8AyPsxg2+NfoSnsTCLpFiiKYKiW9GPRtc0lWvwEX6nlLatYcu8o/g9?=
 =?us-ascii?Q?IwhURfswo8F6nqFjZ4M79DU2ymZaqaPcj6mus7I1R+GIW9NPPIUNMNfXBNHe?=
 =?us-ascii?Q?DARf19wfJ+llx+mQ51tAll+x6R2Tmb0TQRNX9ChnczaDgw2RPeYHMstKwYWa?=
 =?us-ascii?Q?IeM5nKvyUTvSVLo/ISH+rpD2kDsQcshAR50QNnzENYvxZ+KwIatKzvRfnK/I?=
 =?us-ascii?Q?RvLNri6tukPukjI+wD9YcFuqJm07AFuKhd1LXBaaO4yC4urGS/d1FkSLMZYj?=
 =?us-ascii?Q?NxKGA/s6l+MXcD/r+S2pumk80GdlWH5tLfzoJb2+lUtSzqOuow2jrW/pX8aG?=
 =?us-ascii?Q?VrxpTO7MDvTUA9ZO8rxCscXWqil991lKGwdjtPitamYHQsma//ylxqvf9ObX?=
 =?us-ascii?Q?sAjkZ71Npfh9FGsf8OU3Nud0wd+tZcDyED/uSy8d5BOuIDzzroM7BMFyc/KE?=
 =?us-ascii?Q?q0xSFB5KqLCewuyVGMW1ZGmci93Ipr6TstJdNsf4?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 702d3094-53d7-43ae-c25b-08dd2b13a796
X-MS-Exchange-CrossTenant-AuthSource: TYZPR06MB7096.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jan 2025 09:55:57.3838 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kkr328L6kNVa3DQX6ua41YRUztjaXVerdl8x4TV3GgbtMFKkBfIM0AB2MduO8pd/90tSWKdoKIZdkwUranQJRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR0601MB5726
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: If userspace issues an fstrim with a range that does not
 include
 all segments with small discards, these segments will be reused without being
 discarded. This patch fixes this issue. This patch is som [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_CERTIFIED_BLOCKED RBL: ADMINISTRATOR NOTICE:
 The query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.129.18 listed in sa-accredit.habeas.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [52.101.129.18 listed in bl.score.senderscore.com]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.129.18 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1tTIRc-0000rJ-SS
Subject: [f2fs-dev] [PATCH 2/2] f2fs: fix missing small discard in fstrim
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

If userspace issues an fstrim with a range that does not include all
segments with small discards, these segments will be reused without being
discarded. This patch fixes this issue.
This patch is somewhat similar to commit 650d3c4e56e1 ("f2fs: fix a missing
discard prefree segments").

Fixes: d7bc2484b8d4 ("f2fs: fix small discards not to issue redundantly")
Signed-off-by: Chunhai Guo <guochunhai@vivo.com>
---
 fs/f2fs/segment.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 8fe9f794b581..af9a62591c49 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -4552,6 +4552,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	struct list_head *head = &SM_I(sbi)->sit_entry_set;
 	bool to_journal = !is_sbi_flag_set(sbi, SBI_IS_RESIZEFS);
 	struct seg_entry *se;
+	bool force = (cpc->reason & CP_DISCARD);
+	__u64 trim_start = cpc->trim_start;
 
 	down_write(&sit_i->sentry_lock);
 
@@ -4609,7 +4611,9 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 #endif
 
 			/* add discard candidates */
-			if (!(cpc->reason & CP_DISCARD)) {
+			if (!force || (force &&
+					(segno < trim_start ||
+					 segno > cpc->trim_end))) {
 				cpc->trim_start = segno;
 				add_discard_addrs(sbi, cpc, false, false);
 			}
@@ -4649,8 +4653,8 @@ void f2fs_flush_sit_entries(struct f2fs_sb_info *sbi, struct cp_control *cpc)
 	f2fs_bug_on(sbi, !list_empty(head));
 	f2fs_bug_on(sbi, sit_i->dirty_sentries);
 out:
-	if (cpc->reason & CP_DISCARD) {
-		__u64 trim_start = cpc->trim_start;
+	if (force) {
+		cpc->trim_start = trim_start;
 
 		for (; cpc->trim_start <= cpc->trim_end; cpc->trim_start++)
 			add_discard_addrs(sbi, cpc, true, false);
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
