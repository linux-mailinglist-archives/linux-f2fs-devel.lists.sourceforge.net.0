Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id AAB349748D0
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGk-0001tH-2x;
	Wed, 11 Sep 2024 03:43:49 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGi-0001t7-I4
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=; b=Ca/C0mIcsPUysc3R5JO2xVETLb
 FH+4EENstzUuftKErTRkLE4QLioXgXr33pDJFRovsOL9OFCF5VLxx3jBeicFWK5OzY83bLKtk1Yb4
 byozozo4jBMr7b/pCx4qJ0COKuXvRNSknWpAJnGFvCibvegbJayXO4ObbwJjrcMCTLok=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=; b=GwiPqZ80UKpnqg1kufgfyWrkZ/
 f7PmWw3ADwvEZWInq1wIF9SdpQNjfRlSWmqIxErKvfhJeqrbE/mfs6mbQem7nDfGw49e0nkMptUtC
 t75JOrZs+df/hUrhVXthrQlabXAigmgztScibWT9AImbuOCmXNanxjHTDp1uYnhfnGj8=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGh-0000Nz-9F for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:47 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Bb604e/HCP2A0241uBi7vgZbUy+L3KgOqDNgrzmNNFAKSziM7EFvlc7osCDNcb61plO1ushcuOC8mIvRwezdzGsNzEN/uWVogRzh83RnILImP1XsQWasS/3iaILgX3oASZqur4OCeVuXE2yXhEfvkwjv6p/Lz+Avo5SNh2lRfhy6aDayPFsWfrQr68JcyA2ScGyJS4bEk3mzHdWf7NgsjFw6/OjU8X1hMLJ2dm4oi0aU2vf6vd1QpDGpXGIKFGmoucoWm3x2BbxG6WCFMdT5LSNfqYslsQdyJ/n00s+aGxqlQsoMQKZN5r8ypxDg0gUneVYsBgnB5izBqJW/aNgiBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=;
 b=yg6D2uEjzaUicNL3ajjSKMypQWH8IOT/X7XeKti0UOauHjzcTWsIe0/cTXJEzDYr/HHGvtVs8p4mPmMaF6P3AuPhwqeVvjgwFF9eJonp5FtK+m66dvgAvx7ydMEd07zkiHlO+G7x04VIpgwKG1jnNlSwV4DY7uNpkfyFjVWPYiZJ1Qy4oaCmV9t1MmBmvD7zvbpdNfTrkxsDrlH9LZOteHMrkDCz5NsQQhG6FlkUN9grxldiPV0ezCGMwZp5gVa04OGC6L43xgJhKTRj59cnJCnEQZMrYlyUin9eoUX+/165zr3Ybruvb0aKqagj61zZYdx0QCmnTF28m3VRVutqiQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7CC/3LcYA72yvGa3hWCirw1THavdhx+JFL9Z/mwmypc=;
 b=HJMvMhnVK5DpkjvquZ9FU8LEHEj6Hpk430oIXvtCMi0SrQtL3ofiK/bv5rsPNTlMe8IrTmwkhdxYi8BXjjbaCE8u+7pExnS4UtSjWLknVLuX7hkfLSyEjE0S8my5nwzPnhvsGJM1K/43wOVGNFJ1+aujyFi2G0W3VByWKzyaaem5UlpK65GPK36uuP0vKgQHDsyIjjXW5FOSy2lubO3uhhBplElkAMvK3PaenBd4QZKTbrolEKlBufvN0CE2nNsOiqwVaqVLYgY7BijTMAnwPxGJWCYZ22uBfRdJ0jUyiW4hD7jEe8XlZ6Gq6oyCNWA7np7WEdVCX+QGbBD6cilbzw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:41 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:41 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:21 -0600
Message-Id: <a76b4bcb04c636b7e40443a9c372679db67fdb6d.1726024116.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 180713e2-3807-4357-26a1-08dcd213eda7
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?ysDu6CASKiRbXh/vjtXmIva45wHbpTNhUKjtMnYCrrMBOW5FQU7PCySt7DNL?=
 =?us-ascii?Q?AJ+NEQQOVzMJ/bWPWdxcVt2K9RYkZsLTRMVPGnft1woLtO78FD0Tq/6uD6q1?=
 =?us-ascii?Q?x/OMp/jsuEQYeR2XMJmz1Cj0c016YS6tHNKm0HyAc/R9FFzd6TrbqyitPF1k?=
 =?us-ascii?Q?MJTCEQFBFmaWDbPdcoq4TUWX0jggrUvEYpKJn7abQcEdLQOgSGts+7GO3qTC?=
 =?us-ascii?Q?ToJhoO3Kv65ezCvnCuW9+p7O2QTYFLiCTLhRiw0w2Rr0qQnfgsnLIy+2P5j3?=
 =?us-ascii?Q?lzFYhedqut/MyzWfQDz0z4mo0UVm/JeKlba2k7HY2ZHiJJs5v/eXTwldDZAQ?=
 =?us-ascii?Q?yVHqaiT+ERSxJED3NN1Jl6ILbgER9ijRXOiruO5Gp4BVb2SiPSSeis0Cl8t0?=
 =?us-ascii?Q?cqX8nhC3Mw2UjRck/RNjGR74NGoWeqbj75oq4Wa5Mt3XLQSQbIkTgEzTQIlT?=
 =?us-ascii?Q?0346RHjDJY3tRCOhzPqbmkvHmVb8iGpmDmevMwNNLAUd2JwI9NXkocHMwti2?=
 =?us-ascii?Q?af/Qe2snI3b3wHRLqMq3VADDBr50JadrPhCLgJNhTfQkm2Jr+vro0KE+itKm?=
 =?us-ascii?Q?v6rO/Z6/uJnOZK+XYDH/6DhoiZnf8N7Yrn2TCShRmp1BsvxzG0QbdBsLWb3V?=
 =?us-ascii?Q?/4bVuXeaxgz8pJwJW+VLSt4KUoerJqJkDbkWq97tcqKN+hNkGLH4TSyQQA57?=
 =?us-ascii?Q?oQH7ITBcRDOLCcxY8rICK7S5EyYkIf3xsYvPzuRdFCyjQhf73B9Epj68IkbP?=
 =?us-ascii?Q?5q0FqbQkPYob8QIYWHpcBg3aOLVnwHj05ii0D11RtPpw/ltxZqXhtGq+Ivba?=
 =?us-ascii?Q?1U38Ehom61lHAlOOPQd6aAshZyA/+rV68xoqNFGAIHrwTtvP8cZHRdTJPdYn?=
 =?us-ascii?Q?O7+L3jc/YPThYYZGcwMFi4FJKD779giKHjpKAgiYQqRtrVwoshnSbv4gbbz5?=
 =?us-ascii?Q?D7DQF9Jus7Bc/b4dhC29CdklKdf+gb/PkAwIBH+Y4Tv14Iccu/mFxfzusWEV?=
 =?us-ascii?Q?bcq68wK0JqgMGwLspejIIwDv7FVGtWmz8KmEPB5kQDgn39x1q9oSvck7F26N?=
 =?us-ascii?Q?VqyE11UQaR4t/S/BjIaH8xHpPjvAXanT/R++49J5Ma4bPWLwR2u5zAO5sLd9?=
 =?us-ascii?Q?wPYh+JR4zB50FI3XYojkw+QZk2n/uZ+lCwC47QdgMmFDnj+TVPdz7OrQmz/b?=
 =?us-ascii?Q?9FmvQqOjXhSDzGa7F68wZLYldqLS976GJTUyODZQkYAdyToof5v+QY1fKPpL?=
 =?us-ascii?Q?9QZDhmTT03okYnb9BdYX6R4MMke6vq9LEKrH0PHhmovBy58bLnZlBr5vcXDQ?=
 =?us-ascii?Q?Tj26hYPJ2Fs3TQEfLE1+5JFmhcTqXYGYborFt/4KhYAqqDoN3DcbzTeFzZsN?=
 =?us-ascii?Q?ZsbVJOAXXQpwBqzFEIJKhpjrOJxdBho6FWTRm9DxS9ciSpc1Iw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jl7YkasFoSVt55z+9bIPnPY02fGVpOa2BRFU4+p0f/bXvYjUqDst67/DnmX3?=
 =?us-ascii?Q?0d0jxupgsLXOyiJC2OrL4CuThK1afLlTPy6UHYqONJc10+88RUkjnlfWseWW?=
 =?us-ascii?Q?4Lvzyl2C6EGcfumRmr6XiJVH+/fTV9q176dSNkKSKb6E3fn7W1VJGrxxfa6p?=
 =?us-ascii?Q?6Io/c+HHH2VUdw7G4F+e7800mJUmDBnHeDwhF7ULsmqPuHAwcv8gZKHR4xjf?=
 =?us-ascii?Q?76aUsPqfyTmv1sBnJWS4L44PCLTy+HFEb15M224CohPwyfGw/R4RmfyqOGNh?=
 =?us-ascii?Q?HddL9SM7OGSsBUsyNfoxj65n828lXrHlnYqOSiKUaVAKBDZu6z0EjCiDZyKF?=
 =?us-ascii?Q?BCsuvZ5ndpVdaWzyL3mLsFAWja4rX+HLjtWxA/IUPIBIK1eLgxlrBV4lZT3A?=
 =?us-ascii?Q?h/SvP5iJ6uZ0BNtDA5aPAqLtsNTy7s8Ym52sr40U8Ll0uM8Aew08aNzYwzzT?=
 =?us-ascii?Q?LKDCSJc5HGEROq4jxThof7ZxI4FLpbutmJFyCMR3UiQ4/G23lIvTfx0ci6Ox?=
 =?us-ascii?Q?vfvTcHEeCkN1+lhsYFCxa+95jeMhystjHJ77drSIH4Y9u/L+9Q10Z0TwOJ4Q?=
 =?us-ascii?Q?Xe5dazNeGT/PwAMeG5/k6YKfhNX17/5E7HWGruAN0YVDfJ6fBAn3CzxQXBrg?=
 =?us-ascii?Q?D5+N+kAAfT46kYfB9be7QbLK0f9drqvzOynTPuGvy1dU0FkyhCTsLurHSs6C?=
 =?us-ascii?Q?abvYNmFg/IVoFU8FBbGt/MNF/U7O2DCpehWBv9wN5qZdHG94cTaZ9GfNNkEU?=
 =?us-ascii?Q?wHqDrXH+ay5lySt+pX7xX1NssD90YAqUDvne+sg6sSquwCYKj/hZVhYK814E?=
 =?us-ascii?Q?arH3PfkcxTqY9rhAPC67uY03xYf+A8hM5jjv47smeWXXTu44M/CJuEhBx+EV?=
 =?us-ascii?Q?FN44GTefVz/L7TmDwzlvtLE4sQX9oAs+5sW11fh7B+ggbIIPbg81GrYItdAi?=
 =?us-ascii?Q?4U2NdO+NHIZnUJswD7VsYgdDnMhVy3r6iOCcIuqJmZTAzt0HWcn3NT5pQ4EG?=
 =?us-ascii?Q?X2w6/PlyCDFhEyZKmB82z7/Kibv217OGLnm8izSgNG49mHjzNhndRHteSCBy?=
 =?us-ascii?Q?E4IpSJ/0qHtg234rw/sWG8wlbav2/vhvb59N6t1qY4cO3HvCam0+jmePby6y?=
 =?us-ascii?Q?0r5Yq2N6i8oFy5KuQ3U0EYqm6kX1CdNsh1MW+B+vp+n7lyo1t5lFU8mX8DUu?=
 =?us-ascii?Q?SdPL0Tg/Xq4fanoWKqiZO3TTM8WVgWPu3vs7lRmnn7xzMbSf27XKbYkG2x5o?=
 =?us-ascii?Q?qoGUhaIQUfGfV82UOetiYFXZ4tNtpsOwqlDCkNA7eLGgZmetsgUzes9KHphb?=
 =?us-ascii?Q?HNCRYFvRaVGdcjFdLLZ148af/vChUAf2ZvbyKLAtWr72OzEuQkKJ89xVZ1G5?=
 =?us-ascii?Q?W6yFCi+hmMwf4/0CXUMbnOV4ajl/v6w1Ynbq9A9sEprRK6RDdSPgzP/iGpsB?=
 =?us-ascii?Q?uNCgvOoWYJv0kQCqrDuhat1laippMHyORkLnvtfg4eApYMAVkljYxdgnTz1U?=
 =?us-ascii?Q?rkwv/RfhVeTLONDZ2nSGq5+T4DR3pmkYwYQXRu5L8wJaWyqICbJjtHZyEdlh?=
 =?us-ascii?Q?M3ppUug4Y670CUuhYypRQafoH3xlj6/HwkOqS2w9?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 180713e2-3807-4357-26a1-08dcd213eda7
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:41.4486 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: IApWSvIWda4shYiP9n1QQNkbZAGzdS1DenEDuqB1ucax4dnG9cctm61N9Qv9iioBV3XRVIc1SHYABlHfvGu4yA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Convert an inline tail file to a normal file when the inode
 expansion exceeds the maximum size allowed for the inline tail. Signed-off-by:
 Wu Bo <bo.wu@vivo.com> --- fs/f2fs/f2fs.h | 1 + fs/f2fs/file.c | 6 ++++++
 fs/f2fs/inline.c | 43 +++++++++++++++++++++++++++++++++++++++++++ 3 files
 changed, 50 insertions(+) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1soEGh-0000Nz-9F
Subject: [f2fs-dev] [PATCH v2 08/13] f2fs: convert inline tail when inode
 expand
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

Convert an inline tail file to a normal file when the inode expansion
exceeds the maximum size allowed for the inline tail.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/f2fs.h   |  1 +
 fs/f2fs/file.c   |  6 ++++++
 fs/f2fs/inline.c | 43 +++++++++++++++++++++++++++++++++++++++++++
 3 files changed, 50 insertions(+)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index 2e0530b55e74..f889d97209c7 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -4211,6 +4211,7 @@ void f2fs_truncate_inline_inode(struct inode *inode,
 						struct page *ipage, u64 from);
 int f2fs_read_inline_data(struct inode *inode, struct folio *folio);
 int f2fs_convert_inline_page(struct dnode_of_data *dn, struct page *page);
+int f2fs_convert_inline_tail(struct inode *inode);
 int f2fs_convert_inline_inode(struct inode *inode);
 int f2fs_clear_inline_tail(struct inode *inode, bool force);
 int f2fs_try_convert_inline_dir(struct inode *dir, struct dentry *dentry);
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index dda4cf6d7325..2551403a5b83 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -1783,6 +1783,12 @@ static int f2fs_expand_inode_data(struct inode *inode, loff_t offset,
 	if (err)
 		return err;
 
+	if (len + offset > MAX_INLINE_TAIL(inode)) {
+		err = f2fs_convert_inline_tail(inode);
+		if (err)
+			return err;
+	}
+
 	f2fs_balance_fs(sbi, true);
 
 	pg_start = ((unsigned long long)offset) >> PAGE_SHIFT;
diff --git a/fs/f2fs/inline.c b/fs/f2fs/inline.c
index a542956d618a..c2f84f3dde67 100644
--- a/fs/f2fs/inline.c
+++ b/fs/f2fs/inline.c
@@ -235,6 +235,49 @@ int f2fs_clear_inline_tail(struct inode *inode, bool force)
 	return 0;
 }
 
+int f2fs_convert_inline_tail(struct inode *inode)
+{
+	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
+	struct dnode_of_data dn;
+	struct page *ipage, *page;
+	loff_t i_size = i_size_read(inode);
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
+	int err = 0;
+
+	if (!f2fs_has_inline_tail(inode))
+		return 0;
+
+	page = f2fs_grab_cache_page(inode->i_mapping, end_index, false);
+	if (!page)
+		return -ENOMEM;
+
+	f2fs_lock_op(sbi);
+
+	ipage = f2fs_get_node_page(sbi, inode->i_ino);
+	if (IS_ERR(ipage)) {
+		err = PTR_ERR(ipage);
+		goto out;
+	}
+
+	set_new_dnode(&dn, inode, ipage, ipage, 0);
+
+	if (f2fs_has_inline_tail(inode))
+		err = f2fs_convert_inline_page(&dn, page);
+
+	f2fs_put_dnode(&dn);
+out:
+	f2fs_unlock_op(sbi);
+
+	f2fs_put_page(page, 1);
+
+	if (!err) {
+		err = f2fs_clear_inline_tail(inode, true);
+		f2fs_balance_fs(sbi, dn.node_changed);
+	}
+
+	return err;
+}
+
 int f2fs_convert_inline_inode(struct inode *inode)
 {
 	struct f2fs_sb_info *sbi = F2FS_I_SB(inode);
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
