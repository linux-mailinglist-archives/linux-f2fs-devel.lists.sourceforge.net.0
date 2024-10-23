Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A32579ABBBC
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 23 Oct 2024 04:43:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3RLY-00019E-19;
	Wed, 23 Oct 2024 02:43:40 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1t3RLW-000196-K7
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 02:43:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=31/B/P5KVS387l91kICJzz0kfOPBEZisMqBbfEFlnIo=; b=RGsCD+LzmN4br7dS3VSngf4TY/
 2RYTGtSuMm2anCHu8clIvp2HRmAmpBsWTAxN0E99LacdiwnBORPPvXBmJUzA9uguiV/3IkpigLMCU
 Gnn0ucw/M6//lMuUUnMzpl9AMbCOhm0jJzt/vIA/wPBzyOpjqAWRmmpJa1AoLyzwIdow=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=31/B/P5KVS387l91kICJzz0kfOPBEZisMqBbfEFlnIo=; b=i
 PN+1ysYn7fJ1KwljhG6lnHiQnPkyGG65/7+Wb+6jMhgjLY9ZLg0JJ/1K+lBXqskKxltNNT7JT/YN4
 +YPzOjFFwvYTZZ4hPv/a0Y1hcVLK0Y5xRhLmF8+wTwcEAD5mQOhEwDThwXZfSB36+oVp5m+WHkeSQ
 WyU5UwDoHE9QNSxM=;
Received: from mail-koreacentralazon11013070.outbound.protection.outlook.com
 ([40.107.44.70] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3RLW-0004Jq-I5 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 23 Oct 2024 02:43:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=OQU+q72v4Fc9v+Zf+7L1xxxhgjcdbdkwJSCf9TOfDTh2YWtHmC1Hb1jFAmhNY9CMhOJor1j2QEeWrRWiaK0XG1b8wWNdL7PvXeS7ay6jqzH8EDDXNGvN8fg5tLrOhVAxCGZZk1KoyS5eFarYiRf/d2mVpFgfDZQIX1P4CnAgjvjZlLdrjSx68YvXlGuJn6ODpSpPvIqR0Xa6lBV5ps2WfEoscGz75YtJdr1sxoQ0k2Nd63JGqviTBZQqjHmhjUPZSaLY4J5jf6XRMrMg+SLpRKJNcrN+qDxZJoMnqqMohfAvNxPN/qKTdEB8orfDdOomzopccbE44FiKLI63/tjFbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=31/B/P5KVS387l91kICJzz0kfOPBEZisMqBbfEFlnIo=;
 b=ia9YLS6qHj6Ww7drSgv7wJVV2ZDJxyX2jqo1YXgXE5lxZl6fWidArHzJ7pCnsk3pq812tBrbHVE+OhY/u291Z3Cx5QHUazVGE9PiOJPQNVHxxenKIh3zlMoH4s+m4NouKQAvJhlKis6fEpcSMoBGc0yFXkgO5ShHcz9zi1QHIbhu6Zi/KKZkhzEyxGGsdQKJbyXSEx7143GOZTfwrMdQbenCh2HceMBSfsaw+YuTlfnLkWIkAIXQOLE82UjwGa9bL88aSQTGGCci5wtCgFPqOuwKP6GXYFZxdoHsxaLKn+XUVXomXZgvG8Oo219Tx1SjPh+d6aBvUFmGTmkY3omipg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=31/B/P5KVS387l91kICJzz0kfOPBEZisMqBbfEFlnIo=;
 b=H84T0iZXymNx6e3ouKe/g5CFItK7czcf9TOIl4rvjY2hZ2Hpgya3hJ25r6qbZpW0s43NkO9RywWGR274/HH1H41ohCBI5C6hSFlsV4Np6PJvJT9qP6ENPTjyyRZQIFit+rOA65/RpJ/gU2u6Z29MTo2AtgHc8HyJVLawVyKpJGJ6WeTmQcbzKRn/ay5b4OGnm8VfExdC2whyYEl2lHBrrV9EqtA/C8fSyvYrnehjAlNj2cMf2b/fEHFp09ltDCahurGTUOvVxZLa0MEqFLwP9j9QFIWBzOUp7ex47CeeqSwNC4Tgq6sbwty2EKZaK+9NQpj2lYv1YejU8aQoqLrj5Q==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by TY0PR06MB5233.apcprd06.prod.outlook.com (2603:1096:400:21b::9)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.11; Wed, 23 Oct
 2024 02:43:30 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.8093.014; Wed, 23 Oct 2024
 02:43:30 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 22 Oct 2024 20:59:45 -0600
Message-Id: <20241023025945.1817457-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR04CA0152.apcprd04.prod.outlook.com (2603:1096:4::14)
 To SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|TY0PR06MB5233:EE_
X-MS-Office365-Filtering-Correlation-Id: 09d7c2a6-aaa1-4078-667a-08dcf30c7a7a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|366016|1800799024|376014|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?4aXFt9dX37j/f7h5zdmgXrbmbB7o7sXfIeheZVHbqPctmFBfTqI5ccsRbrTB?=
 =?us-ascii?Q?XqauOedthMd5RY0/z0BfF0xo1SklcBLPHWBkBINfAw15rcm/bzkdMrh+KOKo?=
 =?us-ascii?Q?KbferCRSr9Qw9lObBwkcCgBZKI0hDmNy8Hh+ZwIJf4jz2lEXc8SSMt1HbXZh?=
 =?us-ascii?Q?VZ9+DxqGOXmOBvs5Id+jIpogmuoqHwBATioWZGbG4LB2EEghrXC91Q8ex//3?=
 =?us-ascii?Q?Pdp3DhOgERi+VHa9tqMrAKGczP2GTCWusohM+W0sHzLqQJpZQzjBdYGAmUKr?=
 =?us-ascii?Q?HbjZvCSGHcHLnNavJtzdWEeWIrlhh2+szEfG7tsY48c8+m+lRnl+G8wHPms+?=
 =?us-ascii?Q?rW++w82+rnSXNxMZLjTNLyXrDBkNUzy2TSNCXrK+3TZAsM6z7NumQfoVYd8Y?=
 =?us-ascii?Q?40bEYrE7AFehxiV/o/7NvoiRcVNMzg3w8wp+C2R+oo0W3J4U6UCD3FyvkJ1e?=
 =?us-ascii?Q?Fg6oOMCWCiA5pcSXJIE1OU57EIxSgT/625nh9EdzXhtXucB91ed/DNZ5VeQJ?=
 =?us-ascii?Q?qgS+sj0Yj9aqzSUvfrl4dlewgUK/BIt8piU6VbnKCz8tW1NG7yVpktStveRj?=
 =?us-ascii?Q?0rfN9iOL2jtv64fRz6CzKHb7u3U2F3RPmr6Opg6rupTyL4haVZmiDz48RJNr?=
 =?us-ascii?Q?6HnAaCu1sgVzHgOqVFz79V4jC7uYBc/HEhUX/mWV8idBEhRZ5cpAg6+Bbc0r?=
 =?us-ascii?Q?X0eE6h5mT+UexJNrV552H4l/V1qnx0vrTN6qsjQSjyspsmu3Ob5P3RZM5tps?=
 =?us-ascii?Q?z22oxoX7i2ZkCTJRPjq/EGCy7idqI0n//kGn2HtWoPVviDzVwdh+FoUeNwTw?=
 =?us-ascii?Q?ef+hrrXCzKgmP+Td5UfL92kviMpe/9SUeUaCbm85U2kCIOHqhLBCpLFARtrb?=
 =?us-ascii?Q?DdyluCSPE6lG9/cDV/xDITnt+DMxv3DNClDRZZUFV8HyKnUSkcUaLgFAlP+U?=
 =?us-ascii?Q?ARcu5CNJs1AI4m238p89SC+B2nbt7VBhZq4pX1855/0T1wBH1H7t99kQf2Ur?=
 =?us-ascii?Q?NHEnCoS60fryPLE77gTVcVBVnMCxgvg3GniyZWnbpekzM3O+CKQAbP5Nh3eA?=
 =?us-ascii?Q?9uHc0G12PXnWAjMdFoug+bRWJKB7ma6SgxXWyutw51t3eYp9KHYZIh3EJSKJ?=
 =?us-ascii?Q?9xfaPHa910nkHcUCiNmoYXz5SU1d4mn4Lcr/MRCPvbTaG87ZEF5W3TvIxTUi?=
 =?us-ascii?Q?u3/I2BkIJYA24nr3/QQPPIcFlXgWRN837xEsesa4DENm5Jv8HNoHPaFWu7lR?=
 =?us-ascii?Q?gZ3SGvPfkjpbGBhGDh7q7LWtCYdrGBtNAUrn/Ey8vYUmCGky2VR9URiZBwZv?=
 =?us-ascii?Q?Zy1QGPOzmPO1+RkexZBNmr+4OZe2tHy3fs/U2vr5nzQmBuj3ttL+Xq3WOMx/?=
 =?us-ascii?Q?px7KYRE=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(366016)(1800799024)(376014)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Qp8VoN73tdYCfmxZAbNRenj2I3wcWSWrWQ3xd4hVES/0TH0QA3Cj74ApBSq1?=
 =?us-ascii?Q?YHQG1js0Bh6SnwrY/yHvKbqMMhSBJUM+Usrim9qx1gkm9sZl3jNWY0Euh2Iz?=
 =?us-ascii?Q?1Aoh7glzh1M9dYF7N44oFyeQsulWYZsgBoQAoZ5EQdt/U0FuT4Cex085ImW9?=
 =?us-ascii?Q?y7uHyvkElB3uAsYb/fQB58/FCszyUkhLj/Tt1zXpm5W2UF/za6gJrzS8EUzj?=
 =?us-ascii?Q?0D+AC7P+KiZKRZZY1ee6hINbsUb6rbn6EQ+YzIuFOQCXrfLn/Jf6VMhTBr8k?=
 =?us-ascii?Q?pfel/ECZLXKI+KWzEy3oqQMKCRYaBEkCEVWe00aS1lHX0ra+PKdEQPs+20RG?=
 =?us-ascii?Q?SXqGicWiWDlldbr1QOWDwPfDkDVfit92GYhBLhJzg0GiBQywtL1jps11YEzH?=
 =?us-ascii?Q?3a8g6obDYFRvw2z4y7BblEpCNv7hTpOv6NZu7UFTxkUvNz3SgZBwyy6N0SYs?=
 =?us-ascii?Q?Sb9LDYttfD/PL0rb/GyaTseCUXgBdaqPBA5xyxuBZC60rHmFOuimGZhzQ160?=
 =?us-ascii?Q?/JNVNgA3FN3dUDnQIVE6JwtzLFjDxyfdBpmck967e6PYUidsMDkWZvMhgY/u?=
 =?us-ascii?Q?L+KNAQcth0HpVjIwKg9xe5m6SiRMCT2XABY2A/Bp+xq9oZkTDmsxT/3t/O7x?=
 =?us-ascii?Q?t7Xr9N1Pq965qDkRxbT3gTE+yeTa6djDT9uqXd2mvReJ6MgF/9p7f84W2qN4?=
 =?us-ascii?Q?t5MwSnfHUU5BZmL8R13jmOJw6hS5pKMPSkKf5bnMKALkRpTWzYZiuWEEmNko?=
 =?us-ascii?Q?0g5JIYjv3NzOH3da60PxN5s8IDznq83/tKZvdSsVCzi+zvd2FHv34zk+Zx2v?=
 =?us-ascii?Q?ZWsga9MMeP/QslR7qIvgPW6GMkqfsrbDEcxUG5X5uyTjRmIXdDxDDL2FTAlm?=
 =?us-ascii?Q?nSI8ux6aXxbJkj5i0UfmazhexsUwOLJ2gv/ZGwaGwWWI6++y5cclyHB4vemv?=
 =?us-ascii?Q?u2nva8bm8xmPFKeKcg6dxGMQKNg4aZDepxf0OoE0trA+o/l1l5UK9ZzOBeNF?=
 =?us-ascii?Q?92mx2TNjZwlvLrATYvgD/XNRu8g2T87LD3AStUZUEg6u6pK6NovztiH8yoXe?=
 =?us-ascii?Q?N0LfqG7vln+Ol8/EFPkPc/54Z2tvmOCWrXaiSLx20pOOQeQdoRQAgUUM/PjU?=
 =?us-ascii?Q?MWGyk/uZJijloypDxPImqXcMtBUBDVSPRzyQUzNHmPjVc9OoWn1rAkYPY8MT?=
 =?us-ascii?Q?rb7OtKoDjdSQwjrbAo56S9cSe9WoeEAlOyr0CImad0SxpL3cK9hjkZ3d4Sri?=
 =?us-ascii?Q?7/gFk+M7kvwKC3tuO8pSdE7apZ+Be+wBhEpe3aKZfY9B4gsqOuSsh55Y1mFk?=
 =?us-ascii?Q?cN9gAXnDKHNkwxvWDJd7Gwdf4vkWAtHhbNWf/P5REiWG3RmJ1lK0sylrv+LS?=
 =?us-ascii?Q?4Taajyz2Jtn8nKpHCg+J7SOCtIoHm7khtjfPCm9zLh9/8LlmJx2i62MeUDkS?=
 =?us-ascii?Q?7nzw/CfPS7JbtoDEyJkRLG0M2xis1AnAWBScIjAqfr7/p/YTroUNvVnd2Nfm?=
 =?us-ascii?Q?BVDVQKN6pSHkSYqgxwrJn6xm3U4efSqx37lTu5SqRTm540xbPBuzRxXR+ZYI?=
 =?us-ascii?Q?zbe6mUqY5cIIh7LZbdRXnD0ZH8uUeuQhvkzn4qf+?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 09d7c2a6-aaa1-4078-667a-08dcf30c7a7a
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Oct 2024 02:43:30.1735 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: hrL+I6WkeKWk8wq04XQ7wskv7JIu4BK3QZ5Z5Y9YwMHbebH4zy+q1S2OcOJkaTTH50ExKTGz0fE2sGUnh7pqpw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TY0PR06MB5233
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  When the free segment is used up during CP disable,
 many write
 or ioctl operations will get ENOSPC error codes, even if there are still
 many blocks available. We can reproduce it in the following step [...] 
 Content analysis details:   (-1.9 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.70 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1t3RLW-0004Jq-I5
Subject: [f2fs-dev] [PATCH v3] f2fs: modify f2fs_is_checkpoint_ready logic
 to allow more data to be written with the CP disable
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

When the free segment is used up during CP disable, many write or
ioctl operations will get ENOSPC error codes, even if there are
still many blocks available. We can reproduce it in the following
steps:

dd if=/dev/zero of=f2fs.img bs=1M count=65
mkfs.f2fs -f f2fs.img
mount f2fs.img f2fs_dir -o checkpoint=disable:10%
cd f2fs_dir
i=1 ; while [[ $i -lt 50 ]] ; do (file_name=./2M_file$i ; dd \
if=/dev/random of=$file_name bs=1M count=2); i=$((i+1)); done
sync
i=1 ; while [[ $i -lt 50 ]] ; do (file_name=./2M_file$i ; truncate \
-s 1K $file_name); i=$((i+1)); done
sync
dd if=/dev/zero of=./file bs=1M count=20

In f2fs_need_SSR() function, it is allowed to use SSR to allocate
blocks when CP is disabled, so in f2fs_is_checkpoint_ready function,
can we judge the number of invalid blocks when free segment is not
enough, and return ENOSPC only if the number of invalid blocks is
also not enough?

Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/segment.h | 17 +++++++++++++++++
 1 file changed, 17 insertions(+)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 71adb4a43bec..20b568eaa95e 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -637,12 +637,29 @@ static inline bool has_enough_free_secs(struct f2fs_sb_info *sbi,
 	return !has_not_enough_free_secs(sbi, freed, needed);
 }
 
+static inline bool has_enough_free_blks(struct f2fs_sb_info *sbi)
+{
+	unsigned int total_free_blocks = 0;
+	unsigned int avail_user_block_count;
+
+	spin_lock(&sbi->stat_lock);
+
+	avail_user_block_count = get_available_block_count(sbi, NULL, true);
+	total_free_blocks = avail_user_block_count - (unsigned int)valid_user_blocks(sbi);
+
+	spin_unlock(&sbi->stat_lock);
+
+	return total_free_blocks > 0;
+}
+
 static inline bool f2fs_is_checkpoint_ready(struct f2fs_sb_info *sbi)
 {
 	if (likely(!is_sbi_flag_set(sbi, SBI_CP_DISABLED)))
 		return true;
 	if (likely(has_enough_free_secs(sbi, 0, 0)))
 		return true;
+	if (likely(has_enough_free_blks(sbi)))
+		return true;
 	return false;
 }
 
-- 
2.39.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
