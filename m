Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 83E46989343
	for <lists+linux-f2fs-devel@lfdr.de>; Sun, 29 Sep 2024 08:19:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sunGq-0001CD-Ey;
	Sun, 29 Sep 2024 06:19:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <weilongping@oppo.com>) id 1sunGo-0001C6-Mx
 for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 06:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=He3o0Qe716045DnV+apOojVowluGeb2fYgxvCmmbUDY=; b=LX8iY3BJiT7BIj2F05zyKKMei+
 W1RLSp/D2Ml4kmiJSJAX6LN3cdKpTyMwa7hAU9Qf3VJe+Sy/vjj/HRF36bFzzoFdYXW7056rPmKcE
 2aY/YJYcJNi3Zc4PAsZ/Zc8p49lkTBQL3jVlCuWJZQsucvLVJMrVh1CJNy9PtwzI+iiI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=He3o0Qe716045DnV+apOojVowluGeb2fYgxvCmmbUDY=; b=N/Z30KG+j/27xZJOUt9xKt3xon
 MFnPvLMLIZSwDT0JuPFQzXkopMPqeG8I22Mf9fdv4/QV+YxX2GUcHx5oR/UbOWNTsAo1XgtBaHmHH
 1Y1mIhkQH/UTlvrFWbsnnsnAWlfpF6MFZdBGfoQZ5zS4xoOcHPqcWGu4sg27HyTmMl0I=;
Received: from mail-psaapc01on2070.outbound.protection.outlook.com
 ([40.107.255.70] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sunGn-00006M-Py for linux-f2fs-devel@lists.sourceforge.net;
 Sun, 29 Sep 2024 06:19:02 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=QvQybJ8vZPc4LdsfrW3+EB6fr1QmcxyieQX4ooXAKLsx1XKjsz6yxazxXzpvr7rUuLe0AZOzmUGJuFrUdf4wzrOMZeTaX5kcVlxgQDmrrCi+3CMX6K4iCqgoy6V3lrB5N0w8aYoRYTcF7OuGsuVJ0PjN1rWe8BpWU9VoWd2q5WV3xh/vdPe22VjYbtmVVEhm6JO5FPb95yB/Tpsk6mjzY81q7NQHZuNTo7iFaZg2KMy7rgVlvMOVmE2D5jpBJwnw+bcwD3BVQgRR0O73qNxULW9pPnSi4xcHdmkvTs7JA91CHqyLc4vYocg2yFFNifPOTLq794FwbccsDZ/6k1jhQg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=He3o0Qe716045DnV+apOojVowluGeb2fYgxvCmmbUDY=;
 b=jF0TfdnoNnAsLHY+wgdoYAIF7ValhwHnRkK+OmDnIhDsM7sIHdTQs3+IW3zcCBmZwsui6CoK+TeKTGvaky+vev/ZiqPcw06AqPzzWhV9Z0nmgJKGgdkYfzFHjomkvHYJGw/AsfTaA4B1Y769uEUp/PWfniSsSRqU4Nv2MLWoQitGuX9qvoM2nniiuWNyRP7r1xCiGzBNEEhE5z1ih4bZeGADfXqGU3Eh77ffg92INwP8Dca8NUkC1kGkasgrm2q67HhUV5KpYsyW75pdlo9649HJWFGTp2BmTkK2U6WkNshnbJAmcQPCBymG3OYocKJqlyorhq1sBwUHMI+x2dQx7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=He3o0Qe716045DnV+apOojVowluGeb2fYgxvCmmbUDY=;
 b=R2GIuzgqdR/TmSYJof1vXnLxFcWxD+7thbg67d8TlLYJ74Z3TTiLq22xCLeT4vc3uCkudcaVs2M2OFZTieUiV3CPy7vCU8pmaksOSGc9ud0FbwjYob7Kguy4g7hqCpnVrcjHEkQYjdcF+Hh+NsekfF6Ag2ByEKw2OaykepkZJ3g=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com (2603:1096:101:22a::14)
 by TYZPR02MB7318.apcprd02.prod.outlook.com (2603:1096:405:46::11)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.34; Sun, 29 Sep
 2024 06:18:47 +0000
Received: from SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b]) by SEZPR02MB7967.apcprd02.prod.outlook.com
 ([fe80::5723:5b88:ed4c:d49b%3]) with mapi id 15.20.7982.033; Sun, 29 Sep 2024
 06:18:47 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Sun, 29 Sep 2024 14:17:14 +0800
Message-Id: <c77bb0626adad3e7c7c0ef7b9e338b2b465dc3ed.1727582346.git.weilongping@oppo.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <85588954-f628-48ee-b860-9454b2c4fd1f@kernel.org>
References: <85588954-f628-48ee-b860-9454b2c4fd1f@kernel.org>
X-ClientProxiedBy: SG2PR02CA0061.apcprd02.prod.outlook.com
 (2603:1096:4:54::25) To SEZPR02MB7967.apcprd02.prod.outlook.com
 (2603:1096:101:22a::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR02MB7967:EE_|TYZPR02MB7318:EE_
X-MS-Office365-Filtering-Correlation-Id: 43075016-c080-41ca-63fe-08dce04e937b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|52116014|376014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?nSkdojEqYldmk1PYLl5N3sFBmeurZPuwP5uow/o/v5e2JeCp8eq4+xFi6Pz0?=
 =?us-ascii?Q?DicYpo6r2Fkj9dbCckN2oono/DgwCeNWksv7MDx0Qe50VtHUdAKw0EYCHbeT?=
 =?us-ascii?Q?SfaukqhDFhUXXGViQ3C8LeMSwcKPY8QDg8Oaoa4PkwvA29HmmU77bsfByEm1?=
 =?us-ascii?Q?ej48LYGAez+uhLTt/7Mv30DOG8xheoF77WsVil8JqFrjD9k/+Gv7ZOuq3a5v?=
 =?us-ascii?Q?UFphgZGsSGTzUPJMAFvvIPn6PNMMy8khh+hcn4L6s28lqGOA93vHShgu8Oyv?=
 =?us-ascii?Q?VPUDwmD4jUpMaUsf+KEwT3Si9ifajX/kWLXsY3LDfiOZ4acfcF1vynrqGI9j?=
 =?us-ascii?Q?Dqq45VZFa0QafjjWv4+XZ3tBBBtzwdGJmky06tPk8nFgb0VQtrGenU8V2wGO?=
 =?us-ascii?Q?KHoRK78hgvRMydVvsbKdGxc/d+btHVrbwdUrPjMyttwMru8RB4ZzjimlBkvC?=
 =?us-ascii?Q?3Iglgjqic9WH/zDKlv72ajHHDSr0brkYl0yqgVxtGUvK3bv1c+IFj48+wrCu?=
 =?us-ascii?Q?4DGFUM865YRTlQ12WK+IIzhw23AO3bewdhbKM1JjrqU25IdVmIUVZQ1GlxrW?=
 =?us-ascii?Q?UVwZbjX9O+B0pCQM04XXySLJEmBguxGq9VfV5HiwbL/tydOjEcB4OOmCyO1D?=
 =?us-ascii?Q?3F7/b0XFzOKxMFdHAIAYLichr6EgLkjEw5RQqHv516sEckP+EcHk2t+lSgZD?=
 =?us-ascii?Q?H+VvFZpm790ZzhVN6wAOF2cN94nhPFfFMO+yzO4Dqx4USDiOIcsZYbSHdSg3?=
 =?us-ascii?Q?7C1NRGsNErgMbJ/Q92yNaucTANlBac2zIG0TUTJI8WlOkB/hPMz52GqoQZLq?=
 =?us-ascii?Q?baIlttFDe3401i5Db906s9R1xe5RgTbEy4NOM1c60fuZFWMGwIbRzRI94db5?=
 =?us-ascii?Q?1i48B/GP9rrari+1mDkVRWYitjRbreM8kKnapBmuM9X/Yv15lZ50EHsf2ED+?=
 =?us-ascii?Q?PLCOD1Ww0ddLAQFqz6OcqbjEorjjybdz7ySUI0KJodztAFB7KiZt8kVNavcO?=
 =?us-ascii?Q?lnMQJwnwwkn+sW9WIi7DHyPmM+RCNf8jPOGMB7/5CnO2PENYUEZZDr+3ewv7?=
 =?us-ascii?Q?XTBQ4xt0CXX83io7NGP0HCxWBZyiczkcfIWOULIs86B4rbIQOLXdHi4MVjIJ?=
 =?us-ascii?Q?Bg2R3Hu1u1GBPuzvvTfvm8Gyc2mNzxFbAweunZaf+fECamp7p/QeW38n6lP7?=
 =?us-ascii?Q?408UahkbxSNLOqDih91et1e+b4qej/nJCsLOQAcR5x9pPkPhY9LgT53o88X7?=
 =?us-ascii?Q?+cMd7TmoEDXuhoVcF1urrjH3p/D+itdka4ZiHC9ycmcUHKI4tuLcp6SDZpsU?=
 =?us-ascii?Q?2+sLwBJCA/WRevYnU56Qdza3lZnVDwUkAh6icZ0ZJCR/DQ=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR02MB7967.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(52116014)(376014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?TYfdUKkKSIVFlBLr1gUOij/mR59qSEHoU7s9V6DYfv09hkqrfTh+fiLYRfMS?=
 =?us-ascii?Q?CiweI1dfxx8BxhwQAln4UK/uYSRGcupx8xxT1fD7ExcmTkWa/eHIrz+bpFSE?=
 =?us-ascii?Q?7aSrepbehtMeBzXl2OmJUMZC3RZ+Mo971XWXy4wOnwuZEprvGXTjbKUI5cRk?=
 =?us-ascii?Q?COBNvrWRHz8ILxuRPCydzwlPQVEIHW51dLh7Rl7VHyBf86CZYv+NFGOJaf2f?=
 =?us-ascii?Q?O77ZM4GPFOXDbxi2aU7wqzNwsHBvXRYEEKCMmF2xgirRc7WyDGjbV6CoW9eq?=
 =?us-ascii?Q?sbaNsmwtDIInS/vsAaZzw1eDe0Z+YYmpnnWZZINoCXh/BWIF7KP5Dv6RbLG7?=
 =?us-ascii?Q?SlHGLErvVzoql1RYzWlGkVaTz7e/JEN2IEK73ugHSAtat0aU1axZqzAJi26s?=
 =?us-ascii?Q?auCA9Q4X1+UEvs73i8lYR9fFKqi9yUS18zztPj4QZBFHlJgLmVL+oB4mgpXU?=
 =?us-ascii?Q?1osryCbKl6ewaQbGXiYdUG0Zv6eEVZkCMNIwF0sVe6I+BYfP9h+Ph6gn51G4?=
 =?us-ascii?Q?MHBAhxV4Ask7XL39n9mwXdYvtHaue04A4dAHa5kHSlfBTYNFwHuJr3pyCgWI?=
 =?us-ascii?Q?7ezqI3MQSfpAMl3OM+qTtnlDlAVDvYMvi+5bjcGBueQYt6gayOjHXXK7hm3l?=
 =?us-ascii?Q?JvTr2xSAmVjO+7FhCeGclZVq5Jjb/CvnXmA06rFp4FDmG2uAMmidPIKIGXl9?=
 =?us-ascii?Q?dxNtrtCT6vg7ckmeJ9hPSNkVU3jzkYJlKAccZ5u3khb+NF/lE6P+vdjSFp5r?=
 =?us-ascii?Q?b3rlDR0ZlWlBXu2suMUWwwVYS47O50AU4fcoYg/QjQxGCFyQSWGJpfBEAHpp?=
 =?us-ascii?Q?bJazKIpNCTPAze4AM3xAwqh1mnvApR4Ckrsd/70Ss27hGkzlp+whQyBJCYDd?=
 =?us-ascii?Q?HmgE+3b7nmRMH9u+fVNNF/CCQ/NzaaDBmQPblYF8JOPuTULNBVQ5qjckfZhO?=
 =?us-ascii?Q?H6UShrebCYMJrV59gok9udv8jcOYBg+at9H4SkItPG5q8I/SjsyBalEqDGpa?=
 =?us-ascii?Q?sfwMoFjnnj/SVcR2AZ+MZiaVLYvthHcW3RTqjyQ3r0OL2GF+0kz1qItO5hrl?=
 =?us-ascii?Q?dOe1oD5HG9JBe9rtnle5+f/zhOVPsLEg+pZsqhDuRocf82V2CLe+i1Hlu5HL?=
 =?us-ascii?Q?3sw23YV0eufN8cSNB59y0FsOddYNHlRXOre7YxW6x4Fu7YZ6aVT/QmFrHKrD?=
 =?us-ascii?Q?tK4DeojIvgL0KBkdETrQn5cXcM36fSMtc4N6ewXxeQ6stmDemtuR7Nvc2Xeo?=
 =?us-ascii?Q?coJ/Z96AarWAzQW8sbWelV6Xt8XSIlfGZh31Nm4SIZO1mnpK1dD/bATfaJWw?=
 =?us-ascii?Q?68p26YboZuZTRjvvGi4Gh5caey3qMvJsh5vEZld7XI0XrAw+Y+ExN3bhSYWy?=
 =?us-ascii?Q?Eo9szy/s2dy48FbKBW0eh1k+5ZdGYJvIRbhNcFJkjEDi36R/t6NEtAC1M3I4?=
 =?us-ascii?Q?FYvaK8tHa0YIzmzGq+K77bKo5yKuWI9GnubEeC2oZUYgBA+6po5HlRnyt44V?=
 =?us-ascii?Q?w6vha29MbgvHxU95nS7iVJ6ouKsnokhs9FPPoke5wpLfvB70KvxFepolijvZ?=
 =?us-ascii?Q?VfNC7KF3A2lT4kUMKirHQXM0MyaVtNyvEx5GompL?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43075016-c080-41ca-63fe-08dce04e937b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR02MB7967.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Sep 2024 06:18:46.8160 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: MoYCaUUjWJXmnL8ejEeK6jjrAkRoUo9glA8cPW8GrMmCNCxrjb7UvM5SkCHVlUvgCGGs7RKOXQ2PMzQAw3/+lg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB7318
X-Spam-Score: -1.1 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Signed-off-by: LongPing Wei <weilongping@oppo.com> --- v2:
 update manual of f2fs_io --- man/f2fs_io.8 | 6 ++++++ tools/f2fs_io/f2fs_io.c
 | 25 +++++++++++++++++++++++++ 2 files changed, 31 insertions(+ [...] 
 Content analysis details:   (-1.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.9 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.70 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sunGn-00006M-Py
Subject: [f2fs-dev] [PATCH v2] f2fs_io: add fdatasync
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
From: LongPing Wei via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: LongPing Wei <weilongping@oppo.com>
Cc: LongPing Wei <weilongping@oppo.com>, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Signed-off-by: LongPing Wei <weilongping@oppo.com>
---
v2: update manual of f2fs_io
---
 man/f2fs_io.8           |  6 ++++++
 tools/f2fs_io/f2fs_io.c | 25 +++++++++++++++++++++++++
 2 files changed, 31 insertions(+)

diff --git a/man/f2fs_io.8 b/man/f2fs_io.8
index b9c9dc8..124d662 100644
--- a/man/f2fs_io.8
+++ b/man/f2fs_io.8
@@ -11,6 +11,12 @@ administrative purposes.
 \fBset_verity\fR \fI[file]\fR
 Set the verity flags associated with the specified file.
 .TP
+\fBfsync\fR \fI[file]\fR
+fsync given the file.
+.TP
+\fBfdatasync\fR \fI[file]\fR
+fdatasync given the file.
+.TP
 \fBgetflags\fR \fI[file]\fR
 Get the flags associated with the specified file.
 .TP
diff --git a/tools/f2fs_io/f2fs_io.c b/tools/f2fs_io/f2fs_io.c
index 94f0adf..8fbad3c 100644
--- a/tools/f2fs_io/f2fs_io.c
+++ b/tools/f2fs_io/f2fs_io.c
@@ -174,6 +174,30 @@ static void do_fsync(int argc, char **argv, const struct cmd_desc *cmd)
 	exit(0);
 }
 
+#define fdatasync_desc "fdatasync"
+#define fdatasync_help						\
+"f2fs_io fdatasync [file]\n\n"					\
+"fdatasync given the file\n"					\
+
+static void do_fdatasync(int argc, char **argv, const struct cmd_desc *cmd)
+{
+	int fd;
+
+	if (argc != 2) {
+		fputs("Excess arguments\n\n", stderr);
+		fputs(cmd->cmd_help, stderr);
+		exit(1);
+	}
+
+	fd = xopen(argv[1], O_WRONLY, 0);
+
+	if (fdatasync(fd) != 0)
+		die_errno("fdatasync failed");
+
+	printf("fdatasync a file\n");
+	exit(0);
+}
+
 #define set_verity_desc "Set fs-verity"
 #define set_verity_help					\
 "f2fs_io set_verity [file]\n\n"				\
@@ -1808,6 +1832,7 @@ static void do_help(int argc, char **argv, const struct cmd_desc *cmd);
 const struct cmd_desc cmd_list[] = {
 	_CMD(help),
 	CMD(fsync),
+	CMD(fdatasync),
 	CMD(set_verity),
 	CMD(getflags),
 	CMD(setflags),
-- 
2.34.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
