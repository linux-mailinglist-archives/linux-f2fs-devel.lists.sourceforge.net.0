Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 472799748D5
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Sep 2024 05:43:55 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1soEGo-0001uE-MI;
	Wed, 11 Sep 2024 03:43:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <bo.wu@vivo.com>) id 1soEGm-0001ty-Vf
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=; b=EXQ8duLJX0ovTs9TT0PmNPzadm
 3N3fsDcjojDaEQRf213XJFadLY/IUaqWln+gaTYfkSPygwZk+SLdLAPUCOkhS9wzhD46DHLCfpqmn
 3/UVP+SesGLDwpKo2dbLzUCKxNswq3Yb8dbK6Xhh2I6EM9+eJfzwyYfprSht/V7hPooM=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=; b=MJ7zMz0CDgF5CjoqSyXOSJcH7c
 x1XcoyZEfUrk/RDJopVUw2SlRihRPJ0rYr6gseDkbqul0Ar8CBzz0i3Fpi6YcYeGG/lAlb8IHGJPL
 B9A9NUn5BPY84m1RhMnPqFaVORoD1y9ZWPZ2FcPimLPPoqKqctXQhxF1ek/1tyvkZfYw=;
Received: from mail-psaapc01on2082.outbound.protection.outlook.com
 ([40.107.255.82] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1soEGl-0000Nz-ON for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Sep 2024 03:43:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=VPN9g04UWuRoJDuuT8RXZLIMrtASbw6gp79MMXjewalSBGyWQQPjwsJIiCVlflzEsoBA48PMkcXMGHF57Lsm7Ua6ldRUD4JPuFnMX9gdU6EUVwMxYnO+GCrMRyD5jIQxId+hNfu99lRrVDkC4swruQbKiF12UxROSr50jJzAvfreshC9ibHqqCD3Fe6fVXf18K+bXNA/lD3Tn7IfGWk/2wavAwWGdgIpeQokvVGmWnqKFoIprqljvxS16bbrzctHxDuq4VkE0W2xpfhPEC61KWTSCKXYEI84RxYfXRpj5nqm+VuUNulkZcWFr9JHS6EKmKg82Hh0LIMLAPyQOsyETQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=;
 b=MF333iz5aWPf78NA2cA9FN2niA+KmewWORZ9obpIUt7yCK4PLcx/pxlKyZAcL+qTHJwy+DutCWHd6hwOmbQiNqN9N141/99PRFUiv+0tAua/DIx44hY4Jq5prIDctN4CE5qJCHiGrYzGRnVLKrepBE+ZoiU7UC4wF5XLhYFRYa7+QUfY+VyX/vhpMtVp7NdJ3bxWucyI2lKpdTyg45OpcJdbobjnmigZwT+z48EXj0gRedAULsOZ0Vej7CP0A5eBUm+ilRWg/9Plp7RZf+ql/9y1sTqdpzXBQNSBpq0mcjZAL/Yjpwc3XYTv2QqDQwSqbaeMkArtjOxoaj02xx2pOg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6YkUHWkSyaZim2/FraKiN+n8vb8EDsmqhJ3U8NImOxA=;
 b=cIc+vm4/P/nlxJLGWkcMkebqw9uyZQBvNxueCMy9EEs/M6LEARXSbei7T/Sqn8sHlU499dTH8FotecWKVYRUJD8l3uwQG+XY9ymsG8VsWSn75Z5gU/andlAsK63A9rJzI8uwrJEk+UGS8cUql3VvF/STYLOLo9voY8TTxHOk82XFWnYVnDVK3M8wv+imI/CI8Ihm9X5tBEVPaHtz57ojIoLvvmIyBP8lnRwDZaZa12r5DPwhU7fN/ytARPMyIxjoVCSRfeLkh57dknzhR5yBxV0W7DOssur7kqtWEMQAFD4LciDzae7m9DLiKi409n5S3ebRWUyIpzreQyDStXdIMQ==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com (2603:1096:301:89::11)
 by JH0PR06MB6917.apcprd06.prod.outlook.com (2603:1096:990:67::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7939.24; Wed, 11 Sep
 2024 03:43:45 +0000
Received: from PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5]) by PSAPR06MB4486.apcprd06.prod.outlook.com
 ([fe80::43cb:1332:afef:81e5%4]) with mapi id 15.20.7962.016; Wed, 11 Sep 2024
 03:43:45 +0000
To: linux-kernel@vger.kernel.org
Date: Tue, 10 Sep 2024 21:57:24 -0600
Message-Id: <64857ac35515abdb00cfad877094131b471a8776.1726024117.git.bo.wu@vivo.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <cover.1726024116.git.bo.wu@vivo.com>
References: <cover.1726024116.git.bo.wu@vivo.com>
X-ClientProxiedBy: SI2PR02CA0049.apcprd02.prod.outlook.com
 (2603:1096:4:196::7) To PSAPR06MB4486.apcprd06.prod.outlook.com
 (2603:1096:301:89::11)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PSAPR06MB4486:EE_|JH0PR06MB6917:EE_
X-MS-Office365-Filtering-Correlation-Id: 92b06946-a1cd-4812-a468-08dcd213f03e
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|1800799024|366016|52116014|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?lYhdtRgMgvXuU1+GCgFjaneo4y515buEbARLMsPJDQ8gKzW4MEtYBk8H2gKb?=
 =?us-ascii?Q?S/7M0DCLmhZUedGLl8Kdnhc+VNVXP8LkHCI0CxTb2skeKsBlvlizHKp5knrA?=
 =?us-ascii?Q?6HxR6aY2BO+FlJXFybQ89Zi/OxQGS2IGg1JuyDC8hNUaplUSwRrsbvnb4D4j?=
 =?us-ascii?Q?Vk/3MGK+Tu1mNrDTmkHYG8F7wtKem19iEPC8syU+o0BivQ2t1L9Tsyrk0MLZ?=
 =?us-ascii?Q?MTycPc0qwlFWe3WEcrlI3bie8263vNCQG11/QTEM2GQAJQZztsiMB07DP6lv?=
 =?us-ascii?Q?1gkmL9F2dxzlOwPM3AbNeZtTANf19r7W8MKonjKDC+bF0Cs4TqwqMGNWZNVZ?=
 =?us-ascii?Q?2JrTXA0V/+n9DT4VFIkKE3aeUaWL2QU1hEHVSA5DMDSJNvPINUmIwyPIp23o?=
 =?us-ascii?Q?0cmVK5YQjuMSaHC52mcJnKHEWz9dQMdwaoLoaQ/0yT5JdQnxiu3O/lqbPTYx?=
 =?us-ascii?Q?kZiCSWUp4/v8unVP7wTh6jfoyZ7+dMhdYdt+iFhBwjRUXRWlNKdQYq5G4IlX?=
 =?us-ascii?Q?pwTFEmN7vYz9yHtpvfJ/2gSOu/7a3bF2xduTsc0GQfzdqHfEmzp3qGbMAhbO?=
 =?us-ascii?Q?O2apEArIQ9oOwrs02poe4YIuqzjTTZBTHRGxUXGGTX0qxaS6xdkiw/jBhVZI?=
 =?us-ascii?Q?CGLbLXrJ5v6MCAax1+Jr+DwnND42oxzRCi2WNwUhV8TAiuBnybrFcVyrT/dT?=
 =?us-ascii?Q?alXWFR+80getRgXp3EkIszr0+2N3OeT2mTz1C6ewq/P0nruV82eRsHTd4+0E?=
 =?us-ascii?Q?hE/naQs6vr8A9CPc63r2lCSxUQ6qHbINmqENQqJSrpCueMOkfnbZx9IFIreI?=
 =?us-ascii?Q?gRqNhMyF+rkXA/A5uPi7ZklaJkjm8D90yLEukT1pcOiTDtB7eEp9gm7iJJsL?=
 =?us-ascii?Q?EN6/JHskIik1x5LZ7meYvP+Ca/PImI5k2F3YxkwRVkqxXaB2a960Z0uRIiBg?=
 =?us-ascii?Q?kk6WcI+su+DM6hZgtvpYuVxKUS3dR49PIP3E7RNXPw7iGos9+1PYBsw1607k?=
 =?us-ascii?Q?yyciY+mgv2bIWeC/8tN5yHPYTGfr1eBvHiiGjGszTmukB6/SiABbUU8q2yf4?=
 =?us-ascii?Q?saHZWYeCmJPUb1lsJGoXzRLU83Rldob+sddQlJ2aL1NxopywDvzvg0C71UX1?=
 =?us-ascii?Q?xkY6rdB7yeNi93u5XZKPgDpKOStPBnLbnwhqGvpMN0IewdJcopHibY7o7Tse?=
 =?us-ascii?Q?uGy/SZ6xSsnVOcJgPrpeNMlEhXmSnUNHT+b0TeQP/HuOUznfX4Kvf2Mz6fmm?=
 =?us-ascii?Q?lKmJYbs+vDouKJztpKBQ8bcmaxJIPNKrr917jn1dLJwdRjv32MkxVIcGIKiM?=
 =?us-ascii?Q?JLQANswtZEI6h5xu/Y2ymlJ+6wPJgBa7R8cwwEOlYWNlWq/yUI1tpQhk46do?=
 =?us-ascii?Q?elUWYyVNHauAbUnbINNWN0OE+CU0s9BgTAVzrsYQUynur8jk5Q=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PSAPR06MB4486.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(52116014)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mst4N0yhhAmnixpWmf0QCKKBiwki1aXWcX6nCohRvoFiTLDBhr+0OkKVNlVR?=
 =?us-ascii?Q?9SrApU98iuL/QSDZZbUfAlE8F9a0a3iKVEi0HWpkzr71jriHY7UDoO3X0s3n?=
 =?us-ascii?Q?oz3a8WFUOdG/MiMzP8+h3Nlrn0eNm541DODcek0pGyel8wnXYxA0+ssSuh2D?=
 =?us-ascii?Q?HQfKpXMPW+iaU3S1YcmNLGCSZW2ttQze+bpj/2/B40ETxDEhHcHmeJzqQHaa?=
 =?us-ascii?Q?4yRe+T/URts7510IIyfb/DW2El6j3qeXUWQOWQiKqfu8YWUXbWyhiDbbFSur?=
 =?us-ascii?Q?qXXsKolwPyL/yK6BFaBEBpAVbLmwkUJIzeezTPO1ubnngFCcNv2L0HWuMDG9?=
 =?us-ascii?Q?oBexbQ66s+Xjgk5u+bXv2CqBiurfk2kf1O6juOL6jh+EhuIrFr/JkJRSWEXJ?=
 =?us-ascii?Q?5IeBfsJT8jc60VszxyNTF5XB0zuV8FtcSLMRzOcv+YoA7t3z3XZ+m4Hu1esf?=
 =?us-ascii?Q?74gfKLjgr8pmMbuGiz3lKj8mPN/s9jEL0V/EXDVZZJ35vQH0M+HkQCUhtRkh?=
 =?us-ascii?Q?I9tTQ5NF3CcnidGwhTP4VTHtBaLwst0U+/1x1VN7dv/QQ+VtJ4fWAg0dha3W?=
 =?us-ascii?Q?XsFPOS6fFg17VVYuSkIbidhYHgtMEk1igX2GtktWletT8sbO5FOlHgwwQ/HH?=
 =?us-ascii?Q?ub9Rq7O484brUHI32AGLbMdYJ+Oke/11GtZxfC8KFt1lddYnbN7RsZ+tvYjS?=
 =?us-ascii?Q?j/NxfrmyehBrbZvwKVP9MrpsxRGb5PwOZfHGNZ0ZyAO7Z6ymwKdgo/YU3hJK?=
 =?us-ascii?Q?2nR1Ik8P626lrpYA6Hf/nPha47s7vKmEz9SSk/igEP0kxjhFf5bqMCVuFc2e?=
 =?us-ascii?Q?yWPAmLD9lSq5AidCzgZleMY0RUZbSdt+DgrX2B26wMVSjRRfdO2L1VJ2xLuI?=
 =?us-ascii?Q?xxdty0xO/3Z+aOG/U4uRtBKBP2EHh0tSAZ8xCkrQVXtAJiq7OlPtB7DssFHb?=
 =?us-ascii?Q?O6laQWm6Cgxx4SsJu6lsWX1cVALS4VyFMJBUFwrwrbjQTsKTFjCU/044Gun7?=
 =?us-ascii?Q?fYNUK88sc63ymg1QhE+YhjROLYx/hlSbMTG8EKuKwzuxJqWdycHrbWJpc+pg?=
 =?us-ascii?Q?+JRClc+d7dyaj7Y3P5WrbT7eaxdrDZGcGS2dY4qR8lQyafjDUBNVLpLqBG09?=
 =?us-ascii?Q?iIJnzN7OQkmCGRJHA2WU3RBCypy8hRzYLnYKGbX5/fgkfX9hSjSa7MRIQq8B?=
 =?us-ascii?Q?SvRDBpuz75+NMJAtsChDJmfbFV8n0mcBt0ln0/SRDjw8AUqJvTxZVDbPP1ek?=
 =?us-ascii?Q?Pz2EyhSFekFhiRJQF+EHUlOH8vXHDrA8SiN3DInvdEpbQg76WJbWShoEpb6b?=
 =?us-ascii?Q?2Fs71m63dlggRPfizvwmOKBU+c8iclk5v1hr37tdYcR+MESr/3A8FtsnEi4Z?=
 =?us-ascii?Q?aneZ4SSTeloy0HX8w27Dt4FbOFo1sawgTQDrrJUVesUFsC3nq1GYm5SxPNhu?=
 =?us-ascii?Q?5z6Wtvz4sx3s4SepQjC1b8n+amnc18vgdANdJtv/QM6gLLKjaNJKviU4X3Vk?=
 =?us-ascii?Q?KSEm82xyHYaFvaqyDETDYZoaNfndPNcYaYIWuQ3HWHpUWcy4YvN0+zNzd1pd?=
 =?us-ascii?Q?IclSweyIcwWufb1KgmwleRYoJ4iX+6QRbkxC1ygK?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 92b06946-a1cd-4812-a468-08dcd213f03e
X-MS-Exchange-CrossTenant-AuthSource: PSAPR06MB4486.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Sep 2024 03:43:45.8218 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: jVKthDJ6ImnDk8fWmU09NIOh845/6tlBmPFIk41/LkWooa38CNiDi05ZDlLpuVbC6kLDwAOwPm3+gBKEDMpqeA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: JH0PR06MB6917
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Before adding a new page to the tail, the old inlined tail
 page must be converted first; otherwise, the data on that page could be lost.
 Signed-off-by: Wu Bo <bo.wu@vivo.com> --- fs/f2fs/data.c | 26
 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.82 listed in wl.mailspike.net]
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.255.82 listed in list.dnswl.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1soEGl-0000Nz-ON
Subject: [f2fs-dev] [PATCH v2 11/13] f2fs: fix inline tail data lost
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

Before adding a new page to the tail, the old inlined tail page must be
converted first; otherwise, the data on that page could be lost.

Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/data.c | 26 +++++++++++++++++++++-----
 1 file changed, 21 insertions(+), 5 deletions(-)

diff --git a/fs/f2fs/data.c b/fs/f2fs/data.c
index 6d7b6074763f..f52834c1cacd 100644
--- a/fs/f2fs/data.c
+++ b/fs/f2fs/data.c
@@ -3418,7 +3418,9 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			block_t *blk_addr, bool *node_changed)
 {
 	struct inode *inode = page->mapping->host;
+	loff_t i_size = i_size_read(inode);
 	pgoff_t index = page->index;
+	pgoff_t end_index = i_size >> PAGE_SHIFT;
 	struct dnode_of_data dn;
 	struct page *ipage;
 	bool locked = false;
@@ -3438,12 +3440,12 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			flag = F2FS_GET_BLOCK_DEFAULT;
 		f2fs_map_lock(sbi, flag);
 		locked = true;
-	} else if (f2fs_has_inline_tail(inode)) {
+	} else if (f2fs_has_inline_tail(inode) && index >= end_index) {
 		if (!support_tail_inline(inode, pos + len)) {
 			f2fs_map_lock(sbi, flag);
 			locked = true;
 		}
-	} else if ((pos & PAGE_MASK) >= i_size_read(inode)) {
+	} else if ((pos & PAGE_MASK) >= i_size) {
 		f2fs_map_lock(sbi, flag);
 		locked = true;
 	}
@@ -3471,14 +3473,28 @@ static int prepare_write_begin(struct f2fs_sb_info *sbi,
 			goto out;
 	}
 
-	if (f2fs_has_inline_tail(inode)) {
+	if (f2fs_has_inline_tail(inode) && index >= end_index) {
+		if (index > end_index && f2fs_exist_data(inode)) {
+			struct page *tail_page = f2fs_grab_cache_page(
+					inode->i_mapping, end_index, false);
+			if (!page) {
+				err = -ENOMEM;
+				goto out;
+			}
+			err = f2fs_convert_inline_page(&dn, tail_page);
+			f2fs_put_page(tail_page, 1);
+			if (err || dn.data_blkaddr != NULL_ADDR)
+				goto out;
+		}
 		if (support_tail_inline(inode, pos + len)) {
 			f2fs_do_read_inline_data(page_folio(page), ipage);
 			if (inode->i_nlink)
 				set_page_private_inline(ipage);
 			goto out;
-		} else if (f2fs_exist_data(inode))
-			f2fs_do_read_inline_data(page_folio(page), ipage);
+		}
+		err = f2fs_convert_inline_page(&dn, page);
+		if (err || dn.data_blkaddr != NULL_ADDR)
+			goto out;
 	}
 
 	if (!f2fs_lookup_read_extent_cache_block(inode, index,
-- 
2.35.3



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
