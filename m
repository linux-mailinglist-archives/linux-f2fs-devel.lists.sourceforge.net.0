Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E8B9697FB
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  3 Sep 2024 10:56:42 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1slPL7-0002Sv-7O;
	Tue, 03 Sep 2024 08:56:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1slPL4-0002So-Vk
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=nbZeop3h776mT1amATsUdqwxv5obSgOzz80FLIbq/FI=; b=MHjHYHXOiYKAWXaOErFUP1Vash
 Bs80aNZvkwSTlBXpHxgoKDEM6EZX09mfEAc4RCgaLwM16XXJ91RuvkNJiYCvhn1Vh/CY4uZpkdSJ7
 kfII/nw6FfSNB+9N3C1hq9D9TpvoLUZTV4wx/jvFzu8IqimREDOPoTPs4Ju9UfqKhQO8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=nbZeop3h776mT1amATsUdqwxv5obSgOzz80FLIbq/FI=; b=dmUR6pg/j5elwTFT15fPr3xSHV
 MOrLSUEZHxcUTcOQe1bzA7OohneA0ZLndQtHxL9ztYxV9meh8hr2iLaf0/lL6PgMSXp6Y3uieT87t
 1O1PAojI8QmiZu8SDeXufj0eF6ia5r13TtZmvcbhLwp5lWCbfBpUkkS65dhYKLUULo8s=;
Received: from mail-tyzapc01on2050.outbound.protection.outlook.com
 ([40.107.117.50] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1slPL4-0001WW-0x for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 03 Sep 2024 08:56:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=REsjmizbeSXBMC9sVVAQ+qB7mk5uC6SHonmLFkFtUFYs91XGVqUGQ0J0ReOAV5T6zQ9q0KfJdVUC0R6qpn7e8m7oeeEyYIXzg7c3mrVG30x/x0o5jK0EUZNF/K7v8wyRtrbQijWPZbPksLUnWhTI7GcCASg4+7xW7NwT4oaOHT+0ZcF7xf4wYVaBSWKnuVAUkruJ3JmFACQr9hWIfhiFR4zmmMZdM2QLoZ2erpM235Zojv8NjAUUN+bpE3lmc3hzo/WRjv4POU3n2Z6fmPJAqoMtQffsK4YV0+dT7jdY9cPangVat1F/N2uh3UTPdeOBialUEehUrfgZdr6BKNqqBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=nbZeop3h776mT1amATsUdqwxv5obSgOzz80FLIbq/FI=;
 b=q6RBB8LBm7yh1IX+kBUYCXr+s3+N0knfMjK6e99epmstEiUEvW9bZcOkAOshyrrdK+T5sqDDz1381gPAZhr6jd9mwHz40Dm1noJnf4+JiDAX1nLA95Bi3ylqCuoLfcrxWb1Wef8lSSqwD/lyfAtzjJW1WB623bkaqkKZNiWfsqJnQh6rkPmBscB41e5pK8eRxxjLSTt27kGEY2Iry6Ff9PaQ4IT4eQqtc4jhSUsPYKYfXj84No6he/7cfzgSiUTS6Pzh9+1iUor5qAUGqbVgi3jfbHrcnt9SjjaNJozrGsZyHx3bTQWv5VIryWNKVj/RvLBE9wFFAKQqVF2e0juPWw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=nbZeop3h776mT1amATsUdqwxv5obSgOzz80FLIbq/FI=;
 b=CHDQtgT1ZTFCIm6XiIHWXBwlYUfzwAFdnew13v5TEh1Cd+J/YPZ1ybHkzXwWHYEiL8Ap+TTeBBsYj9U1Z8agbjzoNEOwrFns8wWJlJ9ST1Z1AKifVFqFhoBDr+P89M9WQYwVOkeGMqAtj2TBOBLobkvGQwQkrF56RoNS5BfPL2462RypxctSz8prkDky9+8U9oTlaG61nVwPi7TS/sNxD/RhxGT3DN3rDrieokcIBhC9tAJVUsAmt6XHXa0O0zkt9aYJZKizwbhBHQVbVag2UGdYy/DrWA6cP083R3XWdyP3iCW6vhkMfjcoOwinBBO9XVSHjYMcZMyr18wVQxS6oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by SEZPR06MB6253.apcprd06.prod.outlook.com (2603:1096:101:e6::10)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7918.25; Tue, 3 Sep
 2024 08:41:03 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%6]) with mapi id 15.20.7918.024; Tue, 3 Sep 2024
 08:41:03 +0000
To: linux-kernel@vger.kernel.org
Date: Tue,  3 Sep 2024 02:54:56 -0600
Message-Id: <fbecda7cba8a51a8b685f6d3138a04a99b93e46d.1725334811.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1725334811.git.bo.wu@vivo.com>
References: <cover.1725334811.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0008.apcprd02.prod.outlook.com
 (2603:1096:4:194::12) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|SEZPR06MB6253:EE_
X-MS-Office365-Filtering-Correlation-Id: 49833a68-1e81-4d83-f6bc-08dccbf424fa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?t7j4V+3K88KOWzhuvSEMC8q261iwGCNVzNwS3cp5d19F40ZCjIhJ1t57g1py?=
 =?us-ascii?Q?26m2wh61EQxUwzlqEUGsEmybsI2Dd8DPHXEccUqAL/+WeplXRRSvnqSl1qR4?=
 =?us-ascii?Q?IVq1XPlVPyn3Esr2V/7xlYHoRnBr/SY7VNIRPwBE5Sr7Sfrrs8HuveofbFdY?=
 =?us-ascii?Q?ifFGUTlV5MPAw4/4vAvPhhy8zZiq2EOSVMUJEOxX6Ejxvcc6lNs7tYCbPWLJ?=
 =?us-ascii?Q?bEegfxn1qUmsNSc7fJZHL+tRb1iVOs23RjDlugUmj2qbTgf1X/a2KwT45V3k?=
 =?us-ascii?Q?YQmPNKHhxyOsAzgtnUMVjYkUsodbqQlER0icwYT/Yy0m17FJr7YbYMLuHQL+?=
 =?us-ascii?Q?zj3J9qP8IwTIyZ5oEuBck0HzSSS7DgwEa86vQX+bzhspXTzgr5TYohAzMpqf?=
 =?us-ascii?Q?mcxNnMjTdY9MZCkbaMDMkuL9AtR9MQr0YAqw5CSP0dqr/8YVxou2ppLFjRpP?=
 =?us-ascii?Q?wBKQeFqrpgcfyNR+pc4Y4gTDtm2Dd20znmS7PuavOX23oN3mJsms6OoNTzHQ?=
 =?us-ascii?Q?hd1atgBPavmfQi+HYTiEg/eIvG4+1bG5x0vMt1rNUzA9gVtcwfJO5KbYCdnh?=
 =?us-ascii?Q?rc0uX0ghvXqZOFWbSvVBBC8hr9uDTVkQ9IeEj29msFCMo2PICe3QzSfjbWhM?=
 =?us-ascii?Q?gNvSdEjppSgye/sWLuo6nSQUMikJBjvcROa80t3Mt9XTjktDrliIZ5piFeS/?=
 =?us-ascii?Q?L8osrZ8N+En9vYdcRODmeVQ+MxvTuHZdiLJP2F2UTw1xz0XyWwMsW+UbH90W?=
 =?us-ascii?Q?VmRaAQ09aptxtcoe+Q86D9lJ74GSeO/26XJNPP5Ai8IGtvvdAcTV3bHwkkXF?=
 =?us-ascii?Q?SF4b3QP0NkhecC5DQgdVodb2mcx+BOu4pQkkU0QlwuNw28akXnJNu70VITDj?=
 =?us-ascii?Q?FifSzlxYvzGBszdt/kQf2NdUqGP34aERc9pGRTu4ELBRishHnJsTZVWZNzUv?=
 =?us-ascii?Q?ewHIkZ8afaMuLrlgxMdIXuJPekZSwPtYTwMDJumQcOlFgjAL3n7bdfxIBaF4?=
 =?us-ascii?Q?IH1C7BjztZiTvXOifJtNMTGvuNCSlHyKAvPaB5jHFBvlRdyty9YYSB3mMMUF?=
 =?us-ascii?Q?ij3X7g12oKRd755wS1cJH7448ctcCoVrm5pjVgXY3RQGMyq9G+AgMG6xmz1f?=
 =?us-ascii?Q?l1sEvqz85ai9PHBx0yRONuWCMscjiYm2V+iRkse8GmQ8Gmjoiair7jAG/iM0?=
 =?us-ascii?Q?gTFFbQbJC6gcjdxj7urlsuhgu9SzAzvYLdqCLVoJbotWejZW0Vnn4pgM3l/b?=
 =?us-ascii?Q?vs0TFQ5BuNHRZaKE2+xWh+MX4RyAMzCdkeuoXA8OVJhlx9ORkm/6+ooYQsZ1?=
 =?us-ascii?Q?zzQf1Wrsey6XUVu8M1NM+uuzHD/49CJcFv6kqV/TT394ZVyVp5IFvfFn+NWC?=
 =?us-ascii?Q?MrPGcVXgji1iSIfGM57ZRkRfvxOmQgU77aanyCVSCzjKmYobMw=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?WGLXuIQ2zEf+ykGxgCcZ1/5Ph+3NJLSMjfsFwyRFifyRyBE672wNPDjV38g5?=
 =?us-ascii?Q?n0yRPEuVzXVIBWU/4BtP+87oi75o1Ji06w12aUUl/bl4Gkg+aK2PUFZKzt5f?=
 =?us-ascii?Q?q8U65koraKAgXn4xynwwr47lOwhUPqjSRTtSzgo4GhmO3+rfBYwQQ6XFv25t?=
 =?us-ascii?Q?fXFlM4zuuklYNewmXYAV0aISDIqpKvhqr71TuIoQoDFpHxqjbUWGOc9sTeAO?=
 =?us-ascii?Q?SzPL42wdFhl1PyrLk215NfChhOVEbU/EoKy4CVESZnQPPegPP3hRoztAEI2E?=
 =?us-ascii?Q?V67+oFcxezOOga6eZ/FbuKw+ug6GbCtJvfktTPphhHD9TmXFsNmDQk5Gpxzs?=
 =?us-ascii?Q?otWHucdLn0Ffh0peMkKVuSuEqV0fu67hvuUJiuUN+3ffZXn9vaFC3G/IOBxn?=
 =?us-ascii?Q?fjjerUBfCTh4OTcjEo0Ky3l4cBhv4N39Z55iGyJcGXhdTd0H8gSHZyncjfVU?=
 =?us-ascii?Q?1QYHA7QP2fxchP6v6hKnXCKdHr6YpJgZDy0lerPqkanp1v9EkPb6bRquAW7/?=
 =?us-ascii?Q?9k6ys5eGw8KwsGfIalg+3QfdPnmBr00/o3FCVz5PCf9su2hEh6Enf9dt4/FT?=
 =?us-ascii?Q?Yex4N1dabWo7eGe71GK4wLMDJVVlDgbItXNE+4PWTXZYpfD3KwIswyFhUYKM?=
 =?us-ascii?Q?gsL1Pdn9pubkAKCKS+jahofBXG2VdE56U0voPiwcRLQato5lzK3QoGHzV7xl?=
 =?us-ascii?Q?cdXBORK3qNKvdILI1G4CNNkpasIAslr+9TmZCGt5J+SOGbLMPqf1MdmJnk7m?=
 =?us-ascii?Q?/2RCWalJSnzTEn+RSaZtR0+i1tMwOnHc3d3lAfjozHj07oG6pTeOS4b9VxRJ?=
 =?us-ascii?Q?yCChNI1D1uvSnTrlIJ+0QW0mfkwCHoHoMMOf9PSn/Ufpzhrv8dBl/ikKNLEr?=
 =?us-ascii?Q?fFth4/kGd57BtIqAaTIbq64IZde42/u7ICx+w9IainMKMrEvJJRSpqs15Rjc?=
 =?us-ascii?Q?6Z5CLCYUa1K8sbwPb4kuagnu2LYEit2TMssq/RK47OyuxIY2As7PZAd4LLDi?=
 =?us-ascii?Q?YfMB/b+WDO0OWvckuVxdnF3i+etVUywyPl0A7JyJ4y5IyS4HKX6jVCZblv+4?=
 =?us-ascii?Q?SvjRyXFZYIl97yoIMuVFGbXtWY8AlWj6K0rrzgnop38IEAjatiLxftHvgXnI?=
 =?us-ascii?Q?Tc6Sk7+PjEGxS82wBDTuWukAghU2UbMAZ3RFihlzO7vZO2u6gfyg94zd1jdd?=
 =?us-ascii?Q?q3o/zfcJMSgaeqh8HouViFgwYpSSwKyrJ75tSbjMUO0cqLzR2/eiLu/MYqIp?=
 =?us-ascii?Q?S2y4oA7mcZISPOCliJ9TZfW1J8WIV5A9fQCxuZa9ayWmthSYLOT1ZcJGx0Sy?=
 =?us-ascii?Q?GiPWaZJccoyHxx76CQNl1aN/ccidWwHoGHWbIpfhtPRHwYasBQumKqr65CPO?=
 =?us-ascii?Q?YQzC+NfbaRSNj41pgG2sr94Nd+l4os4GW0J5f6R9KHBnraj8HhKlI0+ksCz5?=
 =?us-ascii?Q?sPjZwh7I04Slxf+RZPkvhEwAWCwr3axXw648xKgxayIf5b9AD3TKi5RZiOQ4?=
 =?us-ascii?Q?JGWQEbzQT6rm9odtJ4w40ijPJ7CHgc1XTpMlXADwg9G96BnVElPdMIf0vuS+?=
 =?us-ascii?Q?XNRSK5cCFsoZujggrs33dFi1YSfWG2M8qZw6ipoN?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 49833a68-1e81-4d83-f6bc-08dccbf424fa
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Sep 2024 08:41:03.4227 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ry/W6KbMnFgdNG4ImpBVwxVCrG5Wu0HorMV63RsxEmvllifG4G9pxmKvBCbq5ryZla9Iv08PgKDtFX05h9CtoQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB6253
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Like the commit: b3d208f96d6b ("f2fs: revisit inline_data
 to avoid data races and potential bugs") Due to the limitations of inline
 data, there are many scenarios where inline isn't supported well, such as
 move file range. 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.50 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
X-Headers-End: 1slPL4-0001WW-0x
Subject: [f2fs-dev] [PATCH 12/13] f2fs: convert inline tails to avoid
 potential issues
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

Like the commit:
b3d208f96d6b ("f2fs: revisit inline_data to avoid data races and potential bugs")

Due to the limitations of inline data, there are many scenarios where
inline isn't supported well, such as move file range.

Therefore, in these scenarios, convert the inline tail file to a regular
file.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c   |  4 ++++
 fs/f2fs/file.c   | 47 +++++++++++++++++++++++++++++++++++++++++++++++
 fs/f2fs/verity.c |  4 ++++
 3 files changed, 55 insertions(+)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index f52834c1cacd..a59758e1c878 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -4141,6 +4141,10 @@ static int f2fs_swap_activate(struct swap_info_struct *sis, struct file *file,
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	if (!f2fs_disable_compressed_file(inode))
 		return -EINVAL;
 
diff --git a/fs/f2fs/file.c b/fs/f2fs/file.c
index 64ea0bfc2e1e..3dcc5e363c13 100644
--- a/fs/f2fs/file.c
+++ b/fs/f2fs/file.c
@@ -84,6 +84,10 @@ static vm_fault_t f2fs_vm_page_mkwrite(struct vm_fault *vmf)
 	if (err)
 		goto out;
 
+	err = f2fs_convert_inline_tail(inode);
+	if (err)
+		goto out;
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (f2fs_compressed_file(inode)) {
 		int ret = f2fs_is_compressed_cluster(inode, page->index);
@@ -1070,6 +1074,12 @@ int f2fs_setattr(struct mnt_idmap *idmap, struct dentry *dentry,
 				return err;
 		}
 
+		if (attr->ia_size > MAX_INLINE_TAIL(inode)) {
+			err = f2fs_convert_inline_tail(inode);
+			if (err)
+				return err;
+		}
+
 		f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 		filemap_invalidate_lock(inode->i_mapping);
 
@@ -1191,6 +1201,10 @@ static int f2fs_punch_hole(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	pg_start = ((unsigned long long) offset) >> PAGE_SHIFT;
 	pg_end = ((unsigned long long) offset + len) >> PAGE_SHIFT;
 
@@ -1501,6 +1515,10 @@ static int f2fs_collapse_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	/* write out all dirty pages from offset */
 	ret = filemap_write_and_wait_range(inode->i_mapping, offset, LLONG_MAX);
 	if (ret)
@@ -1591,6 +1609,10 @@ static int f2fs_zero_range(struct inode *inode, loff_t offset, loff_t len,
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	ret = filemap_write_and_wait_range(mapping, offset, offset + len - 1);
 	if (ret)
 		return ret;
@@ -1705,6 +1727,10 @@ static int f2fs_insert_range(struct inode *inode, loff_t offset, loff_t len)
 	if (ret)
 		return ret;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		return ret;
+
 	f2fs_balance_fs(sbi, true);
 
 	filemap_invalidate_lock(mapping);
@@ -2010,6 +2036,9 @@ static int f2fs_setflags_common(struct inode *inode, u32 iflags, u32 mask)
 		} else {
 			/* try to convert inline_data to support compression */
 			int err = f2fs_convert_inline_inode(inode);
+			if (err)
+				return err;
+			err = f2fs_convert_inline_tail(inode);
 			if (err)
 				return err;
 
@@ -2172,6 +2201,10 @@ static int f2fs_ioc_start_atomic_write(struct file *filp, bool truncate)
 	if (ret)
 		goto out;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		goto out;
+
 	f2fs_down_write(&fi->i_gc_rwsem[WRITE]);
 
 	/*
@@ -2964,10 +2997,16 @@ static int f2fs_move_file_range(struct file *file_in, loff_t pos_in,
 		goto out_unlock;
 
 	ret = f2fs_convert_inline_inode(src);
+	if (ret)
+		goto out_unlock;
+	ret = f2fs_convert_inline_tail(src);
 	if (ret)
 		goto out_unlock;
 
 	ret = f2fs_convert_inline_inode(dst);
+	if (ret)
+		goto out_unlock;
+	ret = f2fs_convert_inline_tail(dst);
 	if (ret)
 		goto out_unlock;
 
@@ -3353,6 +3392,10 @@ static int f2fs_ioc_set_pin_file(struct file *filp, unsigned long arg)
 	if (ret)
 		goto out;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		goto out;
+
 	if (!f2fs_disable_compressed_file(inode)) {
 		ret = -EOPNOTSUPP;
 		goto out;
@@ -3998,6 +4041,10 @@ static int f2fs_sec_trim_file(struct file *filp, unsigned long arg)
 	if (ret)
 		goto err;
 
+	ret = f2fs_convert_inline_tail(inode);
+	if (ret)
+		goto err;
+
 	f2fs_down_write(&F2FS_I(inode)->i_gc_rwsem[WRITE]);
 	filemap_invalidate_lock(mapping);
 
diff --git a/fs/f2fs/verity.c b/fs/f2fs/verity.c
index f7bb0c54502c..aaf3e754140a 100644
--- a/fs/f2fs/verity.c
+++ b/fs/f2fs/verity.c
@@ -139,6 +139,10 @@ static int f2fs_begin_enable_verity(struct file *filp)
 	if (err)
 		return err;
 
+	err = f2fs_convert_inline_tail(inode);
+	if (err)
+		return err;
+
 	set_inode_flag(inode, FI_VERITY_IN_PROGRESS);
 	return 0;
 }
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
