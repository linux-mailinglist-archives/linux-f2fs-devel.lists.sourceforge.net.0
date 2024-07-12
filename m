Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 58F6C92F3E6
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 12 Jul 2024 04:02:09 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sS5bk-00055O-IM;
	Fri, 12 Jul 2024 02:02:00 +0000
Received: from [172.30.29.67] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shengyong@oppo.com>) id 1sS5bi-00055I-Cl
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aoeHWLRg9GoV2nXHcGWUIDKI9J77WnZKFK7RZWYa/aE=; b=j9drOD+o9Ff26MtqUjwkK7TxT3
 UyhsoOlyu7qZ+i8qVGkrdGXtrzbS8PKkTpAtOJ6aOb37D8cTdo4ccM8pQNiisJ9gi8ILXK/WNnmkt
 sSmnTrXhOLrHdEmU6BH8IfkkHgUBKufKNHKWkNoTO79Pd8E9yc7z9yW9ZW8nqe43J9MU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=aoeHWLRg9GoV2nXHcGWUIDKI9J77WnZKFK7RZWYa/aE=; b=M
 y417VLBetthyzciNJ08WIi92Gc3sYdBoS74d6sDc8KYy4jdKaRk05CIvnn3ZV0Yslu18vKEI5Ucmx
 3aYlLjUZUDJDW+f1Ho2RzDwjOHzLoHnfVsY8eE/wsH2a8vF4UfEcTRNbePsDsCCNS+cWeEd2P8ytg
 jQfghlXB91YTNkdM=;
Received: from mail-tyzapc01on2047.outbound.protection.outlook.com
 ([40.107.117.47] helo=APC01-TYZ-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sS5bi-0003QU-O0 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 12 Jul 2024 02:01:58 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Tv+kC2RK3qgxErB9jFS1u6S6/V1VdMUt8dHJEM23wMCKiIQTGGB5p2J7R5EfzTIwij0zB8IlOB/KN9MmLr/la92wWLsdduZT/TVLZEdK4lMV6PL8zv8Cc9+pnBwnPcqn0mG6/SL09+CAjk6S/Q3bypeAIymgYg1p4wZvD1a37lbSMVyOvxixx3CcSwClSCcqloVnhson8BuFNxcIOXaIMkeMd5aEbG1MjVUydp9Lr/djETzJuoZTJ7dD8B6n2oxsfOY8ANjshzMhTCitWOZPeOu1lmW3xzyv4bv+2Xy3yUw/bkBy5/H6P2/o8x/kyQ8Doy6F522JBcrQc2f1RCcGMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aoeHWLRg9GoV2nXHcGWUIDKI9J77WnZKFK7RZWYa/aE=;
 b=pWyaQoheALi4SoHr/3QvJMZU1ShPO9QhJkKyKoDG7++jjOcKEt5wWZfTPh4cCqoYCDqxOTfVJbpYpalaCzftYIrM4kK3IzBx4XI0k4DdZjK+u12s7mOrrF2l/wbx3pDzuTGpbhTpHnT6armrL2xyQZ0o8Lnfj/UUC7EYfUW9n0sz8d7pWwNBgZxU2oQMqeoqck2Ww3gk4U4StcF58wIRZcAwdci0r6/TrwSZKrtmVypqpGTPBIKfrmT/GOmRhpklB4ZSA6vyLmyydCJzpfg7wUGEPNO0eG/tfzD5CoAZ0+Qa64tIHzqTm/ZK7Uue0YvnUqY4tZPSoQMMltxoJvk7jw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oppo.com; dmarc=pass action=none header.from=oppo.com;
 dkim=pass header.d=oppo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oppo.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aoeHWLRg9GoV2nXHcGWUIDKI9J77WnZKFK7RZWYa/aE=;
 b=Pq7xH7jio/50a0YkkTqu+nv6Mtc/ko2gsF8pR27OM2m4NAkPioIe3g4tXp4I+vQ4ZumLkmCHVNdniXfS9DxddZE2EKfOcjOEVsQPym1UwU/O/aiNrS9ZxYdJQu/N0/tYwNsalzIA2lKDjNHZLHSkz7VX2pSQgyhoWiTOSKu8h80=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oppo.com;
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com (2603:1096:101:6b::10)
 by TYZPR02MB6621.apcprd02.prod.outlook.com (2603:1096:405:28::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7762.20; Fri, 12 Jul
 2024 02:01:44 +0000
Received: from SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796]) by SEYPR02MB6014.apcprd02.prod.outlook.com
 ([fe80::bb06:c283:a50:7796%7]) with mapi id 15.20.7762.020; Fri, 12 Jul 2024
 02:01:44 +0000
To: chao@kernel.org,
	jaegeuk@kernel.org
Date: Fri, 12 Jul 2024 10:01:29 +0800
Message-Id: <20240712020133.140148-1-shengyong@oppo.com>
X-Mailer: git-send-email 2.40.1
X-ClientProxiedBy: SG2PR02CA0009.apcprd02.prod.outlook.com
 (2603:1096:3:17::21) To SEYPR02MB6014.apcprd02.prod.outlook.com
 (2603:1096:101:6b::10)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEYPR02MB6014:EE_|TYZPR02MB6621:EE_
X-MS-Office365-Filtering-Correlation-Id: 64907992-f676-4a13-878e-08dca2169474
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?FLxWv8lJDVenINdyTXhnWxe9EpyJ2i83H+Xlaw/JXEgeNSNrUmx6PHH48tzi?=
 =?us-ascii?Q?wCKIHrDHLed9shdN9EziWdG96zo6oYgS60KgX94l2QMWqqw+YiQCelWL3Zqy?=
 =?us-ascii?Q?e5nZz9osfHT3p+P4lVebbhl5CP5a+7sD/uNKM8EzateoXdOYTB9UoWmCeYWr?=
 =?us-ascii?Q?TWI29x1eialFHFZxT1LUfvv95YMgE2G02YF7odL20HdsDA7ZFW3zths/Wric?=
 =?us-ascii?Q?qLxFPDhJYVD44olgKpQqgijWv5yuCLSVLQXhjXwAcQpv4CvNQR0U5uaxqNgG?=
 =?us-ascii?Q?Qdlly5xCSVA3/FmHy7EnMi0DHGM6Od5cnbvGu04bXAOYzels5j+OtnDW3n76?=
 =?us-ascii?Q?+iHlX82pf67PBiqjGISwEwlm6YS0dt+Jdz5/e/ocnkVkPdWt9ellV+2yAYJD?=
 =?us-ascii?Q?aBPsXE9LVifZmYbgGsxi1OCxZdXgxFq87CPFv9ds6xhAQlKVRTMR1iAuMIF2?=
 =?us-ascii?Q?YwH/qoQXxWMuvMTSzj/4sCiMSefJ/GoliikF2nm9uatJuTaDiGzkcfXZ6r0V?=
 =?us-ascii?Q?qh/V/8tQ4ov3kjSamINjztXRlBoBrCCzY2O5mjsOjZIZ+1iRRsKNVvuJNyps?=
 =?us-ascii?Q?f7eh4FW6z7t5t0YdEKdHqNpqJfzVw7Q+COtTKXZqpr3NtYSnqh4Q6gsXkADL?=
 =?us-ascii?Q?xjev/Xu92rybMrwS0ycYZSVsZqxvWhSysq8cpyR5imwSLVi0eIx7hkLSjRQG?=
 =?us-ascii?Q?RBIzRgxglZNaTW/ivY2DYWTJaHH79Jvy9JxO08K1cVV3ihhgt+Wlo9U9UaeT?=
 =?us-ascii?Q?uGL0bGTaIL+Q5Z35Nbh5JLtIMsBqGvT7lO68NQ8xg/n2DffMxYYYjiPm3oom?=
 =?us-ascii?Q?SGvps1rhEXiC+5CxAx0tkijWjq9hHNWnuEYxieGnKxz4C6m5kwa5B+IHKhMv?=
 =?us-ascii?Q?RYxIkHjo/AsJ7hE8GEYMwFTjLaeI3cxgtYVmENzPiQq/DPK36fhwFpmBHBEp?=
 =?us-ascii?Q?/593Fdsvw7G4ZtVNaH1W4xTLOlQlBRvxIqKk6rhD+0Z8Qt5hGx9ZTkUkqLfr?=
 =?us-ascii?Q?wy712CfWU2nS0vVYv4eiwfaSW7Nphhk4MRwpTWuOi+HU5asXBf+RsEQJUmPE?=
 =?us-ascii?Q?LdaL+wnPue1gElDp0TcgR8UMYxWnB5gH7g+oH5Mc53as8yx/AMI5Rq61+mxi?=
 =?us-ascii?Q?L5Xj6yZ2ELCdoBTGR0hRIPYXmz21DanqjW2qx1Sp0qOG1J26t04rfxsaNlQ0?=
 =?us-ascii?Q?zUztBDpEROqCs60NegPYxLodJ/DFLjUHTqWjgVwx9pzKy/eJ9HqOjsWlX8wJ?=
 =?us-ascii?Q?dk+Wk93Yz51JskGi0w9TmcEmir1/Hhl2KMoBCcfjUfz33mBPC5RjMHhjKv3A?=
 =?us-ascii?Q?QMmzxe3ADYXfisNdKw9Lq4wxltYAouNfAgX8nDLpBMExTLYFU1PrMHk2ZZhJ?=
 =?us-ascii?Q?82rTJBUEwNXBo+scdkgLkbAnRMzZZDwRHtuuAWQ2WZK02Mi7sA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEYPR02MB6014.apcprd02.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BozJmTmESF1Gqb61ZLrXB9OUhwge0J6Qo0lhdhvzOHc//o1BvMS/0HZ7iLOZ?=
 =?us-ascii?Q?sGkXMR9+9gMmzkmJ/mZrHn0yI+t5Pea+nCUNZKvdgOzFtqwXVpAIMN+qc/pZ?=
 =?us-ascii?Q?XkQ0pK7L8LMyPWYaKwuF4uQsUdNQBBg3Qe6SqVgFHwqprp2W3+oofuNLR8Ni?=
 =?us-ascii?Q?g8UuEZVLWNRin7aNBvUij/uvr6VKxTI2UeauJeGMbmc2AEarvKMxg7SmZh/W?=
 =?us-ascii?Q?srcZbujwcLl7iQR1DWDqJ6BQ4Clxkvm6Fe2OIHbEobjJfoqz8kNXiRSymYsu?=
 =?us-ascii?Q?mYHvKlMDUM0Sr72cwRmF9rgkxD3RzK7WRwPG+hQfQdEpv6/B6cWcVPxm32MR?=
 =?us-ascii?Q?9qK7WVUI0laOn+S1i0AgZKTWCkFgTA0btIHsKEkU0KdebhvmWJvLraxYC0jQ?=
 =?us-ascii?Q?SXtdIXGKa/aUF4lfVHMhJsJDHxmLHpvOSB7qpNzDfxNzwwOJdAEbjsZVUqS6?=
 =?us-ascii?Q?Ah6PPBKu1Zhqau0Ns8CVmHou97hqr3oSVlzHQXdlV7rnuMmgLhjuFzvvK6ZE?=
 =?us-ascii?Q?tpiYjXs2NLjANuirHtymU7ha8lE7bdZj9TPTZFkcPbTZa8csbwvRzOQ9wvdP?=
 =?us-ascii?Q?oHOq0cJAAeFA8SCBUgBLq2TwCTbGuarI9cinxfC1ZcIafRxtvofASPvZh1VA?=
 =?us-ascii?Q?x+g6McV5v3XPgZJSFY9B9mW+y1htpmyPDuZETRX2+cGIvTs0+Xg+oOpmCKsv?=
 =?us-ascii?Q?AqQz6h4OMnRc5Gc1XuaEtjOEAIeVVVT5mNFKudQjYhxVoI89UyOO3hSekjLe?=
 =?us-ascii?Q?8UqUUUBdWPCEuOVDsP29x9uvbXEtOuQzGf6qbIq509moiycOXpRdEr0dTcWh?=
 =?us-ascii?Q?AHcWWFzWprreBIlXw+2qGxjLE/Wp8JI5a0bTX0owcMJVfnY0VfW3io7zDZdw?=
 =?us-ascii?Q?iruJ5IG33ZlaKWzci7R0urLS2Wynpzxvk23OtL+iYsm8jPo9OBtD1mqvTfQI?=
 =?us-ascii?Q?eddwfGllVE9cV4oO6KqQp4NhGsfaiGV8wyVS+2k0mpIP9TN6lNSddlvNW+of?=
 =?us-ascii?Q?UUhCbFDEPS7fwamMpUAcrGKjatEr4Bise60xNctR8fYewWQXIpVOcWi/vHHG?=
 =?us-ascii?Q?zukLuEqzXnOj9J/3q/BnAeKLNWpogx19VrBz8FgV+yJqsa4SJOlQTBssmrdX?=
 =?us-ascii?Q?U0AjFHrRSGoRN0bsUDg+f/m1e2piQJn0bTmXc6HvAM0GXgQRS8VbADrol4px?=
 =?us-ascii?Q?1BXmtmcqWzHFGxWoNVZLi4rVz6TCshPgaURBGbUZhnli6eK5bA9fmb8AJ5ki?=
 =?us-ascii?Q?laVVXV65Y/t1A7Hf8pmve5AV9GPogHnlz480zutw1aNroYsafdZN7j7lFoe4?=
 =?us-ascii?Q?KWhnIPtvugeEavNK0IqanY2bIZfpPqjjFkheBWJL0XyjJGDfAVfp4vcIHtRk?=
 =?us-ascii?Q?IFqJpCM3Bx8fBlPBCN4+oSAX7wzK7Fr46Hp/+48+fnPGuUblB8/cmWqm7p4q?=
 =?us-ascii?Q?qd0HUpl8xFde4RokUuQgLJ3Bfxe7Ut/4Q591ltNeNfgBDNqaDXI1FispDqYl?=
 =?us-ascii?Q?59+l3b39my3tCtFrnUxUVPJVRCrPVVs571ijLiHyf0i4wMStKeh5m8n/kBoo?=
 =?us-ascii?Q?su6vmiCC0QS9NdIahWWPHjShhXGd/QtuEA1zjwjz?=
X-OriginatorOrg: oppo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 64907992-f676-4a13-878e-08dca2169474
X-MS-Exchange-CrossTenant-AuthSource: SEYPR02MB6014.apcprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jul 2024 02:01:44.5182 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f1905eb1-c353-41c5-9516-62b4a54b5ee6
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: vQU2qp0m5BIyHvXER06jJ0mFnhWucFpdFzA5fwycdxQJc1ikp8ydSBKc1NNNEv38ZJMIU+V5bE1NQ7T8C4ELgA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYZPR02MB6621
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview: Remove redundant function definition of is_sit_bitmap_set()
 and export it. Signed-off-by: Sheng Yong <shengyong@oppo.com> --- fsck/dump.c
 | 2 +- fsck/fsck.c | 12 fsck/fsck.h | 2 +- 3 files changed, 2 insertions(+),
 14 deletions(-) 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.117.47 listed in sa-trusted.bondedsender.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.117.47 listed in wl.mailspike.net]
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.117.47 listed in list.dnswl.org]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
X-Headers-End: 1sS5bi-0003QU-O0
Subject: [f2fs-dev] [PATCH] f2fs-tools: cleanup is_sit_bitmap_set
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
From: Sheng Yong via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Sheng Yong <shengyong@oppo.com>
Cc: linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Remove redundant function definition of is_sit_bitmap_set() and
export it.

Signed-off-by: Sheng Yong <shengyong@oppo.com>
---
 fsck/dump.c |  2 +-
 fsck/fsck.c | 12 ------------
 fsck/fsck.h |  2 +-
 3 files changed, 2 insertions(+), 14 deletions(-)

diff --git a/fsck/dump.c b/fsck/dump.c
index 90e3e0e93c61..4c1d4d3cdb19 100644
--- a/fsck/dump.c
+++ b/fsck/dump.c
@@ -660,7 +660,7 @@ dump:
 	return 0;
 }
 
-static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
+bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
 {
 	struct seg_entry *se;
 	u32 offset;
diff --git a/fsck/fsck.c b/fsck/fsck.c
index 7400dcf35a11..e2fb042d3dec 100644
--- a/fsck/fsck.c
+++ b/fsck/fsck.c
@@ -633,18 +633,6 @@ err:
 	return -EINVAL;
 }
 
-static bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr)
-{
-	struct seg_entry *se;
-	u32 offset;
-
-	se = get_seg_entry(sbi, GET_SEGNO(sbi, blk_addr));
-	offset = OFFSET_IN_SEG(sbi, blk_addr);
-
-	return f2fs_test_bit(offset,
-			(const char *)se->cur_valid_map) != 0;
-}
-
 int fsck_chk_root_inode(struct f2fs_sb_info *sbi)
 {
 	struct f2fs_node *node_blk;
diff --git a/fsck/fsck.h b/fsck/fsck.h
index 6cac926037bb..79cf08522873 100644
--- a/fsck/fsck.h
+++ b/fsck/fsck.h
@@ -281,7 +281,7 @@ extern int dump_node(struct f2fs_sb_info *, nid_t, int, char *, int, int);
 extern int dump_info_from_blkaddr(struct f2fs_sb_info *, u32);
 extern unsigned int start_bidx_of_node(unsigned int, struct f2fs_node *);
 extern void dump_node_scan_disk(struct f2fs_sb_info *sbi, nid_t nid);
-
+extern bool is_sit_bitmap_set(struct f2fs_sb_info *sbi, u32 blk_addr);
 
 /* defrag.c */
 int f2fs_defragment(struct f2fs_sb_info *, u64, u64, u64, int);
-- 
2.40.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
