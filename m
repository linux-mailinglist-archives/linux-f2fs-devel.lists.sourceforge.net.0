Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4E3FE978F58
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 14 Sep 2024 11:06:35 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1spOjb-0002vi-62;
	Sat, 14 Sep 2024 09:06:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1spOjZ-0002vS-Dy
 for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Sep 2024 09:06:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9p9Mw+X8NcH3ZyrUhS636Xv8f6yUvBPrkf+CDGzCuAc=; b=i4L6RN2307KHcK3reNMK0213Es
 GgYCzF0rIKe9D4ZRPnlCPvS70DbMkpog1r3+yL5xS9xOlS6ACfUxgJl6YUSMO96/cn0RF+7V/dbiv
 5Csf9eRJB2AYXJEU1Ke24v7z8zb6EJfpnFCaDjRq9rHuCT0TjRsq+4Jno9V33VnK8Rf8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9p9Mw+X8NcH3ZyrUhS636Xv8f6yUvBPrkf+CDGzCuAc=; b=kd2k2pgYMltcnOVnhEHp7GJ4xq
 jVpN8WWvCDQfkOvF9h3JlDE3yxiDNi0TvjueIS6dO5JKbcuqYnGehkRFVs56n6Sviz3dm5ztzMgTu
 7ilwh+2d0nECsQOIatvj4pVHg2BZ4Zu3OgRuKvxj6uLkMdPUgKr+OC9l+fd+gwlPkZFU=;
Received: from mail-psaapc01on2040.outbound.protection.outlook.com
 ([40.107.255.40] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1spOjX-0005Vx-Rj for linux-f2fs-devel@lists.sourceforge.net;
 Sat, 14 Sep 2024 09:06:24 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=f6LowYdAsRb11AkT37zR+9EWz18PynxB/ujSvOXPv2kJZVnzJUd2D//1QCb9jbb9ekBFUNeR0Cj+y1NxyXBWPGiTmUifM2IK/yUie4NxExfCOnNXjs+VHo2y9DpsonccSnuQ471N9lp4QEcRPmbFWj4yGO4Ss6dUU4+MrbSdhU/8m2n2fSPmjXYn5s6NLHeWF0JR0aEqWlQ2/6ZjML/pDLlKVWNugY3FaRlTikN/5Bq0QlshSQsRe7o6rkDocFIeOBmw3WIIJP7Mefien8d5w3LaX0MUUMf5yAzVfsAMnz1XxvVPp69agdM1ePGD67mu8gcCqcPfKGOyobVBDoC2dg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9p9Mw+X8NcH3ZyrUhS636Xv8f6yUvBPrkf+CDGzCuAc=;
 b=w/HaD2KxTPb/510+7CS4nHfD+Fpjm4+CQXp31lDedbrApXPReTNYbtlhXOFjQ/xkleG0wtREW1f1ZY+1bMpgTkwwQcNL4Ca8P9WwUEn8UhGcoBUPVuNmQhRreT/nzw6KbhtwnBo4DzROQB3Kgx/Ss5W/67oaR/daPMn45xW+JXw0nOsWh8x2yf1qCKuvAKJUh35WccP75MYAhr1MswpNd1vnmk+unDZFuj7KWjUiQp1hdo39XaUc/2wKEeJZfJ+5UklDrQ4zBF1H495FlMWIcfHk7ENGmilxF9SElWm7YwACtxnwcYQoLxVQlcpWub5T4KBb7cgxb7MDY/l622g4Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9p9Mw+X8NcH3ZyrUhS636Xv8f6yUvBPrkf+CDGzCuAc=;
 b=RgBbmPzc0BHIpjpgCvculC/VZZgl2YroAcjTwK4IP1JNQMo8VQocQfkAxv9QX3dzvYZVmD0Y0ZErHgyuZdZJN1j78/b/5+di5CvYtw1NIiD4/h0y5OLvP11y0+If4dRz2M7xtGPWmwtIVaHQoO5iwxSMpWSxy4MS2AX0RW1vbu8TUV0n8Qra379UzYVD3SAKtPD9LZnmIfbriVt5Nib8G/JgQdxCNepWvR42ITsf6/BHdHRjY5k0rcBBwCfyzd286Y/POxeMx0kwzy03JZyTnfUPAJQMD/6HpSeTKQwgOVMVigR0sS4e/nieLooLtrfnmq6/+PJviiiJfMtuA3UH5w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by KL1PR06MB6018.apcprd06.prod.outlook.com (2603:1096:820:d4::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Sat, 14 Sep
 2024 09:06:15 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.021; Sat, 14 Sep 2024
 09:06:14 +0000
To: Chao Yu <chao@kernel.org>, Wu Bo <wubo.oduw@gmail.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net
Date: Sat, 14 Sep 2024 03:21:38 -0600
Message-Id: <20240914092138.1120355-1-bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20240914024112.1069698-1-bo.wu@vivo.com>
References: 
X-ClientProxiedBy: SI2PR01CA0034.apcprd01.prod.exchangelabs.com
 (2603:1096:4:192::9) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|KL1PR06MB6018:EE_
X-MS-Office365-Filtering-Correlation-Id: 9c9c4a88-74c2-461e-07fd-08dcd49c7c0e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|376014|52116014|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?b29Tfx0SvmZMu6XM+vMZ0+1kaQPk4e75W54+sfVlp2xrFxY8LiFKUYQkDlh1?=
 =?us-ascii?Q?FJS2iLADF0QC3u/TzRvr9//9hgtg5hkC0oHVP739sduw8lJVGxjSns98kEzk?=
 =?us-ascii?Q?o5OL3MN9sZaUPtQgzOr2bp28JrZEKICS2CjMfxu0wg0je82RxGunz4F0Q9xb?=
 =?us-ascii?Q?8ItnXCcl4r/1izleQ+SocaxatsgL80/yp8SVxih+7eDRS66VQMNMj2uzLr2t?=
 =?us-ascii?Q?F8kaW225MBI6El1zE5mqaF1vjRrOD1AV+VgkL/7uHeVRvT1BBtRY+1PQIHW6?=
 =?us-ascii?Q?jfmCY17Ck5MX6FtTuDJw1tCjCpEsBQontsiC01+iRkr6BvUbrEZPK7YRBX8O?=
 =?us-ascii?Q?ziQ9M6MoMytdxCh9T/juYqRLDStWupMDPVaMQ472+0CNL1G6jnhJFVv16fX7?=
 =?us-ascii?Q?WL23yD4/Dhvk6m+8mRn2H30xQR7M0DFFvjx3ESuo90LajhUk/LOwNZNIDoQX?=
 =?us-ascii?Q?x5Ql113K3W++rovQcQN+eaN/zXiYRmTov0pCqpyTi5AeBwZvFhj/zGJFYWFg?=
 =?us-ascii?Q?SH7PDiEtlmJiZxSu0lR+ysBWq/kSmApXSqxbRBHeFZlMSupt+WeWtbUK1koA?=
 =?us-ascii?Q?aKKJqI+zCNQtN2Uby63icf/ywDtHfjmRZVXoei2dFv9kVIDGgoAQ98r2QYhb?=
 =?us-ascii?Q?IP3OB67f4KO5sGVU1cB4079YnKsNs3fDLCkWybtaVSmzdvyb32yyY1u3Gu77?=
 =?us-ascii?Q?Srlap9FkTWrjezQ8ZEvRYofQgLa2wifH0l/3CVSz/kVZ0Bfi1sdN8AhS6/JU?=
 =?us-ascii?Q?r39YEI3kUUwyl8YUVs52Fxtq+bouySgOpKfK+vYCUHseNtzi6WMi0bWduAPj?=
 =?us-ascii?Q?vhpCOJhEH7Vz4mCbRfu2LUdp9j01SBVqJtsZLQ24Aong/EaQVuq0MM+Rxeqz?=
 =?us-ascii?Q?oWfZVLqz5YKjMM77dPgd4WNMv2cBUtn8/w51PkCjFPYVbFLENIX9T6TH5SJp?=
 =?us-ascii?Q?OlLoO+Hl/n/WNrOnub5DX/rgw6TrpSpbG8qREoQfmV6twd81Rl0qs0LNCRq+?=
 =?us-ascii?Q?KQh+J7mXTS6CsDWDYILf4kyCbgrmDURFQ1UfFh7seN5B/tEissaFZOGGv4eF?=
 =?us-ascii?Q?Vc6Nq9Noufp0N1nhorhFhRW/+UI3QFUGWNjY7/vSQyHlywINxdC2iN5aG2cE?=
 =?us-ascii?Q?Cczcf9fqHIuflxGWuscfNj/RPw+rCJAKujKmLe6jWtMZqSpK1kgxcgH3XMS6?=
 =?us-ascii?Q?vab6Lr2uImG1YAjXJqvYHnDccMs7s6pBOyT261Y1mHbYzqV4Lh4CNVk4utzE?=
 =?us-ascii?Q?TQ/wISFsAK2+/wk8h8mRiObQ3L8jiXr2O8xBD8m6mXX3efPhOhgzjIAi6s8E?=
 =?us-ascii?Q?BBfekZsgGHBo6ksuGLskjr7Tw/ATtFL3tazUZcymVMwX6sEOaBrUC4UdkDDA?=
 =?us-ascii?Q?OEIhX/vh6VJkp+KLRrmDKWzTKbiAvBUOqQLuMDiFRBbIKUZo4A=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(376014)(52116014)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?wxg1BfbURR6CYTDGePoOMZruoi9Kqbe8eKvIWKgMi24yJH2YsBm5C8+SL2hM?=
 =?us-ascii?Q?UybcUgD1qPmqBaIJXqtuky19fDMPjsnzChqT75AuEHBMp3VXEjeDsjOlZO8a?=
 =?us-ascii?Q?0hGVClb843WS+KlJMkAu4nhPuiqCXZ8ccUd4CCs/P85zrAmt9ydOLh6pG+uT?=
 =?us-ascii?Q?YtTbFmQtJkpPDC5m2Yt0mLNOEUud0zD3zZOXyN71Zidn9MiV10jmg2OBw4PF?=
 =?us-ascii?Q?6jrocpBSIdUPbReYBQFntE7qGBbWCRQsifko3vKI3E6EfwpPEo2oFK9ZKYdL?=
 =?us-ascii?Q?ernonL1kxYTwoHioMpIkZ7Eu+EQ60C5i8Pdw0Ujnl/ajHrFGWFknLuYzfISM?=
 =?us-ascii?Q?9LDfFFPEO4+K84HV47wIgB2WtnE7SE3TeFb2VN0E9t6C3gRVd/+EQ2OaGgkV?=
 =?us-ascii?Q?Ra127H8qIKL7+SMQ4cGrkvwfhiMCzfnHyp31Pq5/jN+GOTS2Xq30kBXa/48T?=
 =?us-ascii?Q?HZUSBU06sN61bV8lfNar1NAOl8yyAs6ee5JWxLCUXyafUUp4awTE+G+Rdyet?=
 =?us-ascii?Q?J1433L2QOScasek4hk/8MAburMFD9TCEXBWzlOb/oCOcQI/b5vW2xqoJJFC2?=
 =?us-ascii?Q?yHcmscXCnY0e+PZsqkDvFv6dX75YeAZQ5hqevjK2zpFivfW0IkDmdRRUR/jE?=
 =?us-ascii?Q?R7bVjsMxQGfAbEvHKU8O0YkqjMVTyscINu027enkJsi0EDkYgFKW3rLi0wzc?=
 =?us-ascii?Q?qTmq9sumfMawtMDhNk0IrCFALYpOiRiCvGygBujzcPERp0StnLN7oFheOv7Q?=
 =?us-ascii?Q?YhSouqb0Ps0543ud0p/rQQABeGrbIp4xumlNP1ynCcBgtMdLIiwOqBG4PKoC?=
 =?us-ascii?Q?543FmQDgQ8eo+xb7xz5jERo8Jptexi3uQuvoxZZX715eYhuKIJXQmxbbYYcb?=
 =?us-ascii?Q?bYVc6HXdR7CJ3X0o6HJ1OsA0NnAYBI07bVy0LQuFHftoRhVVCSANjH/kL/WN?=
 =?us-ascii?Q?gQ1xh+Zna+uuH8uERnS7z/WTppoMHBizBFp1Cgmw8iaW7Zyz52A/BrbeGu37?=
 =?us-ascii?Q?9cV4oP+znWSQK3gJEdoY8eU2k//C+uh2PQfOlQeurcyxGr08Z3dxkde/Nk0u?=
 =?us-ascii?Q?rHDIgr55jIv+Ybp5ndp6ZWeE95B5rbo9YDxuF9VqyP3z0xvIXTDbijIhT41x?=
 =?us-ascii?Q?gu6c4bZW8KvcC0X3kb5lw5NATsLmDm5b9gZs2fqI8kzUK7+R1ZRhfERXbClq?=
 =?us-ascii?Q?awFqL8eXbYt6/gJFCCgqY6yZLaB30H0RNOhi8NG8k65yWHInUozJ1yqaiAaH?=
 =?us-ascii?Q?bchzoLgD6yTQJjRen6Dh99e+LX5uvTl7gKxRvNhLkQsxLkBmtAWT9tQifG++?=
 =?us-ascii?Q?koe+EdaLIr1qYak5P2KOAbCQt249v2kixh0JOAGU/L66/hkop3CRO3c1x3Ba?=
 =?us-ascii?Q?Ds42KnrqjJ7pU2QaAt9NqFUPJ9bC/7lWBBJ0aEa0xa7whwyeigLaVRKExyoM?=
 =?us-ascii?Q?MsIZgwHMsCr+DnDFVwSV+ZkzPYQOAQOiJjPhU7hqAPzHHVuX1BgQh+/WlSFB?=
 =?us-ascii?Q?pZi/5YTi1xAI5qudyb/iRh0j0y7U7KqB+xG/TzW7D87tDkeiniGVUAlMruWW?=
 =?us-ascii?Q?XffqglKZyBZOPyjJkh9D0bdlySuDZENj3FERlMxS?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9c9c4a88-74c2-461e-07fd-08dcd49c7c0e
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Sep 2024 09:06:14.3532 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: DXOXYUJGSnxdlnMw29yYbKmo1C7aYS0E45FgmsqClSYUx54lL844i3Gedyl4i05SGELLG9t1f76B7weYffXQLA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6018
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Fri, Sep 13, 2024 at 08:41:12PM -0600,
 Wu Bo via Linux-f2fs-devel
 wrote: > On Thu, Sep 12, 2024 at 03:14:24PM +0800, Chao Yu via Linux-f2fs-devel
 wrote: > > On 2024/9/11 11:57, Wu Bo wrote: > > > T [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.40 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.40 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1spOjX-0005Vx-Rj
Subject: Re: [f2fs-dev] [PATCH v2 00/13] f2fs: introduce inline tail
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
Cc: Wu Bo <bo.wu@vivo.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Fri, Sep 13, 2024 at 08:41:12PM -0600, Wu Bo via Linux-f2fs-devel wrote:
> On Thu, Sep 12, 2024 at 03:14:24PM +0800, Chao Yu via Linux-f2fs-devel wrote:
> > On 2024/9/11 11:57, Wu Bo wrote:
> > > The inode in F2FS occupies an entire 4k block. For many small files, this means
> > > they consume much more space than their actual size. Therefore, there is
> > > significant potential to better utilize the inode block space.
> > > 
> > > Currently, F2FS has two features to make use of the inode block space: inline
> > > data and inline xattr.
> > > 
> > > Inline data stores file which size is smaller then 3.5k in inode block. However,
> > > for slightly larger small files, there still have much waste.
> > > For example, a 5k file requires 3 blocks, totaling 12k of space, which is
> > > more than twice the size of the file itself!
> > > 
> > > Additionally, the end of a file often does not occupy an entire block. If we can
> > > store the end of the file data within the inode block, we can save an entire
> > > block for the file. This is particularly important for small files.
> > > 
> > > In fact, the current inline data is a special case of inline tail, and
> > > inline tail is an extension of inline data.
> > > 
> > > To make it simple, inline tail only on small files(<64k). And for larger files,
> > > inline tails don't provide any significant benefits.
> > > 
> > > The layout of an inline tail inode block is following:
> > > 
> > > | inode block     | 4096 |     inline tail enable    |
> > > | --------------- | ---- | --------------------------|
> > > | inode info      | 360  |                           |
> > > | --------------- | ---- | --------------------------|
> > > |                 |      | extra info         | 0~36 |
> > > |                 |      | **compact_addr[16] | 64   |
> > > | addr table[923] | 3692 | reserved           | 4    |
> > > |                 |      | **tail data        |      |
> > > |                 |      | inline_xattr       | 200  |
> > > | --------------- | ---- | --------------------------|
> > > | nid table[5]    | 20   |
> > > | node footer     | 24   |
> > > 
> > > F2fs-tools to support inline tail:
> > > https://lore.kernel.org/linux-f2fs-devel/20240903075931.3339584-1-bo.wu@vivo.com
> > > 
> > > I tested inline tail by copying the source code of Linux 6.9.7. The storage
> > > space was reduced by approximately 8%. Additionally, due to the reduced IO, the
> > > copy time also reduced by around 10%.
> > > 
> > > This patch series has been tested with xfstests by running 'kvm-xfstests -c f2fs
> > > -g quick' both with and without the patch; no regressions were observed.
> > > The test result is:
> > > f2fs/default: 583 tests, 6 failures, 213 skipped, 650 seconds
> > >    Failures: generic/050 generic/064 generic/250 generic/252 generic/563
> > >        generic/735
> > >        Totals: 607 tests, 213 skipped, 30 failures, 0 errors, 579s
> > 
> > MKFS_OPTIONS  -- -O extra_attr,encrypt,inode_checksum,flexible_inline_xattr,inode_crtime,verity,compression -f /dev/vdc
> > MOUNT_OPTIONS -- -o acl,user_xattr -o discard,inline_tail /dev/vdc /mnt/scratch_f2fs
> 
> Hi Chao,
> 
> I used the default cfg to run xfstest-bld and didn't encounter the failed
> failures. This suggests the issue might be related to these additional options.
> However, I'm not sure how to include these options when running xfstest-bld.
> Could you let me know how to add them?
> 
> Thanks

I found how to pass these options:
1. Add custom config file
```
# cat test-appliance/files/root/fs/f2fs/cfg/custom
SIZE=small
export MKFS_OPTIONS="-O extra_attr,encrypt,inode_checksum,flexible_inline_xattr,inode_crtime,verity,compression -f"
export F2FS_MOUNT_OPTIONS="discard,inline_tail"
TESTNAME="f2fs custom"
```
2. Then run command as following:
```
kvm-xfstests -c f2fs/custom "generic/418"
```

However, I am only able to reproduce generic/418 and f2fs/004. I will look into
these two cases first.

> 
> > 
> > Before:
> > Failures: generic/042 generic/050 generic/250 generic/252 generic/270 generic/389 generic/563 generic/700 generic/735
> > Failed 9 of 746 tests
> > 
> > After:
> > Failures: generic/042 generic/050 generic/125 generic/250 generic/252 generic/270 generic/389 generic/418 generic/551 generic/563 generic/700 generic/735
> > Failed 12 of 746 tests
> > 
> > Failures: f2fs/004
> > 
> > Can you please check failed testcases?
> > 
> > Thanks,
> > 
> > > 
> > > ---
> > > v2:
> > > - fix ARCH=arc build warning
> > > 
> > > ---
> > > Wu Bo (13):
> > >    f2fs: add inline tail mount option
> > >    f2fs: add inline tail disk layout definition
> > >    f2fs: implement inline tail write & truncate
> > >    f2fs: implement inline tail read & fiemap
> > >    f2fs: set inline tail flag when create inode
> > >    f2fs: fix address info has been truncated
> > >    f2fs: support seek for inline tail
> > >    f2fs: convert inline tail when inode expand
> > >    f2fs: fix data loss during inline tail writing
> > >    f2fs: avoid inlining quota files
> > >    f2fs: fix inline tail data lost
> > >    f2fs: convert inline tails to avoid potential issues
> > >    f2fs: implement inline tail forward recovery
> > > 
> > >   fs/f2fs/data.c     |  93 +++++++++++++++++++++++++-
> > >   fs/f2fs/f2fs.h     |  46 ++++++++++++-
> > >   fs/f2fs/file.c     |  85 +++++++++++++++++++++++-
> > >   fs/f2fs/inline.c   | 159 +++++++++++++++++++++++++++++++++++++++------
> > >   fs/f2fs/inode.c    |   6 ++
> > >   fs/f2fs/namei.c    |   3 +
> > >   fs/f2fs/node.c     |   6 +-
> > >   fs/f2fs/recovery.c |   9 ++-
> > >   fs/f2fs/super.c    |  25 +++++++
> > >   fs/f2fs/verity.c   |   4 ++
> > >   10 files changed, 409 insertions(+), 27 deletions(-)
> > > 
> > > 
> > > base-commit: 67784a74e258a467225f0e68335df77acd67b7ab
> > 
> > 
> > 
> > _______________________________________________
> > Linux-f2fs-devel mailing list
> > Linux-f2fs-devel@lists.sourceforge.net
> > https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
> 
> 
> _______________________________________________
> Linux-f2fs-devel mailing list
> Linux-f2fs-devel@lists.sourceforge.net
> https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
