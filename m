Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B8F9A9E11
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 22 Oct 2024 11:13:50 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1t3AxR-0007YT-6E;
	Tue, 22 Oct 2024 09:13:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <hanqi@vivo.com>) id 1t3AxP-0007Y7-5E
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 09:13:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=c0YZGuPz4Edh9o/BFrP4xxZ84krhcxxNoOoFa0LR6QQ=; b=UL+8uTGP4Z5DOSEISNYcZs4V6e
 53k2L62rcJieBhtq5gf9vN+dC6tdVmF8I1XOofjZRr7ebfNnjCw/zAj361dY5Jb0rFEIWIsLv2K96
 fifOvIsBaphjKRyZC/EIwaEUoSFz7CUEOlzTywFTx0EouqCfuJMSP7eTeVrHkkJTfv+g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=c0YZGuPz4Edh9o/BFrP4xxZ84krhcxxNoOoFa0LR6QQ=; b=J
 Q6TCly0boIdwzgDZtXyDvFHDfYD9m6N3o+8k9iU68JnWCDXzPRmtu/QIW1/pIJw3EhEMxYymQmYs3
 qQKuMsu91mR7B8AKPCPTa0XxeB0DHzv1qfy5VL39tedwPXgjoiI1dhm1sObtRSfr9yVxl4NrK72pq
 YXJ1dEOxGzvT0rwk=;
Received: from mail-koreacentralazon11013059.outbound.protection.outlook.com
 ([40.107.44.59] helo=SEYPR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1t3AxO-0004zD-6H for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 22 Oct 2024 09:13:39 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZrVMp89xpiL4Jq/sGYitxsy4bqiwIhSBTxpt+IW2n6A3rzGOesfR8sy1zBK5JQ8oVWw3MJCwEKjAWrbi2h/O3WNi3Q4zMmnmzU/MAuaG+QOuHT7RC+YBcJy7Wq5FJ8bB6hT2UK1X1Dola2freYKEgEbqZ/hUBDKTR4gMY/aLLZqz87doxI71LmHd+9sY1qdp5f9R7PZxk1OqVDbswTzusPXrKrl6GrL/4mleNhzAgveHOCBXgZEZKN+FEvDatzjLo+AKvxVny9p15zO4v0cdvRIiZDpgIWlbaB4d1Qtr9s2x/efIezBcCnvEQdOKW1+ORU+qr4Msul3Ita9dTNdehQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c0YZGuPz4Edh9o/BFrP4xxZ84krhcxxNoOoFa0LR6QQ=;
 b=Y2ANsg2CYoKDlvktBLJFV0HEu9HqW+oUxIV8N7FtNmo7s+yPLvZaVI+fQlhWaTPVjJux221fdLFk93JHSaEJK2Q3CvbclhtsOmOBkY+M7zBnkBkWIBCyAMyVTV6RojvDai8dpaSxRy7iTUVyn8nqzngsLdcpcMsIIYTw+Aex+aFeEMyqgGVQjEp1uK06JfE86cME8v4up72G8wYKfrc0+boDzU2XXVea/UEqE+obxt+ZsL8TsD4N4rMkoDQLjmEl4S/gosAZz7G/XqIn/J8sXeyA1Dz7wF6V3lJX3QnernDs6IFNSQtV5O4ydQEGS522hh5nvxOuBU3C0fs6LvdF1Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c0YZGuPz4Edh9o/BFrP4xxZ84krhcxxNoOoFa0LR6QQ=;
 b=W7PlVoquMql3Cd5z/pEhkE6C3KteZ+Xm09NiFyjiRdN++E1VrgmVr/vBx+dj8BTXCYP0Af+cyhKrMy4nsY+KystbZr4CYODZJ4bQVE9VuKWDqm+7i4i6L9im28+6/et5Wm8b9pnEXK0mDqQAsMt4n3inwTwBOFcb7RA0NZu14LFhlbKv8WhKEnYdBflG9kqW6aZ0XaZ2O232YD0RFplndq31VvEY3l7IcDcMmAQTzlZ7qCR1cE8z2RQOAXDUlyFkotbC5Gth6T8G6q/NdJgni0/9W7hIJ27YT/u7TdjXfFAG/Yc+Rfg+ClcZ9BnKU1usxwtlXnjI/fCsNiP+7yZT6w==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com (2603:1096:101:228::14)
 by SEZPR06MB7079.apcprd06.prod.outlook.com (2603:1096:101:1f5::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8093.16; Tue, 22 Oct
 2024 08:59:09 +0000
Received: from SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0]) by SEZPR06MB7140.apcprd06.prod.outlook.com
 ([fe80::9eaf:17a9:78b4:67c0%6]) with mapi id 15.20.8093.014; Tue, 22 Oct 2024
 08:59:09 +0000
To: jaegeuk@kernel.org,
	chao@kernel.org
Date: Tue, 22 Oct 2024 03:15:25 -0600
Message-Id: <20241022091525.1808542-1-hanqi@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: SG2PR01CA0180.apcprd01.prod.exchangelabs.com
 (2603:1096:4:28::36) To SEZPR06MB7140.apcprd06.prod.outlook.com
 (2603:1096:101:228::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB7140:EE_|SEZPR06MB7079:EE_
X-MS-Office365-Filtering-Correlation-Id: 0235061f-1caf-41dc-d356-08dcf277ca4b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|52116014|376014|366016|1800799024|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?2gXnGt3jcmQLiTVaCu5X+fkd4EuK7Nwv3kILtvlKGQItp/PC+T5IcQLkUA24?=
 =?us-ascii?Q?3+bWLk7shhr+q/18a4tRS2iBE5mEWW0ekphxlkbWy3E1O+04TE2hmBM0X5Pn?=
 =?us-ascii?Q?l0wszXyLo0uKrm/JK+HGehcFcW75/MdHFKs/wsysIfmG7i3O/wcelA+Mf2Lp?=
 =?us-ascii?Q?51hFjCZ2wTT9zdONWzkuTtgE36Z21GCEXvQdpXJXx4ifEOD3f6zXSNiMs8jp?=
 =?us-ascii?Q?wVC2EC/I/VwmCTv6Jv6Z+K5BXK2cHmymmboT8cgDhea8PUlpXefHgXm2smvQ?=
 =?us-ascii?Q?VVR6Q37xWlBxDB2uJrp/SJnUO2Q9BH0RPYAgHzg05IwcJPd33956jTTgLUEj?=
 =?us-ascii?Q?BNQnRzA5i3EpsBZkPg9h1iJ4iT6NuTTaXRBDHGz2ZJ6YKIrGvJXPVZ9JkFRe?=
 =?us-ascii?Q?drasRN3EiYbaZyVgs9kkG3CI0vi3PIRj6eqc7895Mort8eal/Itm+tUySjgm?=
 =?us-ascii?Q?K5zJLkh4QO/ztuKHwF6yptH1HUjnsbCYhEyoGBXx6bufxAIg8f8gv7uZ+mBb?=
 =?us-ascii?Q?OVJAxU9heQhepnB6OQDdXyWe0BN+HvNcHjshjIgq9v0sOo+rM4ORx5SzDRfq?=
 =?us-ascii?Q?z4FSSVWg9ZvjIs5fi9REb56KdW9ojqabIxoD2gKK4P2DD36epgbffg+KK0dx?=
 =?us-ascii?Q?0pvwTuZcJFbqQKNMTlNEvGoJX523kTCTfmVPu/KsAZn4HTFFBotLOSSJmYGD?=
 =?us-ascii?Q?+6wK/nnGnApooZy4UmqMCZ9J57FEXwOhsADIlBc+qCAhhfX8Ovpc7dfNrniM?=
 =?us-ascii?Q?+KjnLbj53IlXxnBrgefwOEC4LHO4j5oOIDgnrmCC/q6SeQrqRWUTRvQF+XFQ?=
 =?us-ascii?Q?OaahAM2U6oZg/2qa8ZiPERJNYzcSuc7pXt+nqBbhZE6D7c2/irPw3LP1yqdp?=
 =?us-ascii?Q?514PeEfEdRtHG502xF054Xvvt/eQxghTMUuyM8b/x5dTtIvXBAPB2VtAUIin?=
 =?us-ascii?Q?dFPAveh4EMNBlPlB8ikDV1HMdZgIf5Mo+h/0a/IFwPLNotXAwlmZdGln1nZB?=
 =?us-ascii?Q?KOJxKIFStIIngxomV1Py1gHLsNZ/mFtdsRTmZp1oCSdCuKsrd3iRP06obglV?=
 =?us-ascii?Q?1XeEXR54w/drLZ/4IdwIGXwUQ8Jh1kQd0HN3sdVDpIB9Ff3Pqc5dvHTByAkd?=
 =?us-ascii?Q?jjzS7M40yzwzCsVHuqGwWCA0qPBnOqnW7ytRyvkETeMErckPFUxLqoRugtWW?=
 =?us-ascii?Q?ua8B00smSypF290upg2lgE/OCvhea9vIze7eEMbj+3IIXK1a2tLRgadbk1bM?=
 =?us-ascii?Q?iVNJqWTXTU52/ZEmyqe4z3v5rJcCoOwuTXRr4FGblBO268Tw+/r2GmTQOxKM?=
 =?us-ascii?Q?0KP3PEtEplC9Y5jN0atDBDHudKr0Ujb7gDP6eTNm9SrpKL99IxFGGbiDIesD?=
 =?us-ascii?Q?t+qEExY=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB7140.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(52116014)(376014)(366016)(1800799024)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SNoERFoZYjZJCEFQGBiaX4SUBX524f1vqOHUrZYoSK/S0NZ6ajJAUNeo8VBF?=
 =?us-ascii?Q?xYtKtQGG0UKjqFVudmc1dNgSw5zV9mayAgDjB1p7m8IEaU3TPK0GxMnVzjPd?=
 =?us-ascii?Q?X1JL6DTQiTL4GJHJd9KILsOKyviOpwNgvxVmhjkB+GlAE+oQumJG6DbGao+v?=
 =?us-ascii?Q?r8aCOPcCB+71/mOtuBWsp8axT1hSno6I8rt9fGob4Vpo7d6DCwOZcQtbKUt7?=
 =?us-ascii?Q?gl6U0+8Y4fEQN57QFX/HrCDpSbNrsWep5+POGJoLU/hmkCTiYs5YPJbe3735?=
 =?us-ascii?Q?y+LAQzGelZYzDO4B8SfqE5CbUGmh2NmVVLXCGF7Va+0pJTjUIrDd6ibdE8SK?=
 =?us-ascii?Q?dKgTMAA1BsDSOJ1sHP7xKY5OfZ/EI94d1CqqX6HWA2o5xjb5iyz8JJTwG5Gb?=
 =?us-ascii?Q?R1UmlubRz8f2h1BoCnH5z5/cX7KtA+bnKJNw2nhaZf41QccyMDfgxrtFoBAf?=
 =?us-ascii?Q?OHN/0XJR2lTqoySdasklIj8P1VINaWPlCYBmFXFER+Zi2T9+CotCONrRkZEX?=
 =?us-ascii?Q?MLfpax149o1lbb/3ZxkbRGiByxszEuSvl2VjvOFOWJkv7gJPyIjPMBGok8Qf?=
 =?us-ascii?Q?JLO8Ps6okGSLkWHClxdges3Z24CaaiwR3XnDHXg6Oobq2EkTpFPDRMqarPse?=
 =?us-ascii?Q?vDIo0oad5PkXI2ybJkodK/D2I9fmQ3sW1QaVhq5ncXo0e+i50VMjUTMKgf9q?=
 =?us-ascii?Q?e0qq/WmfkxbYP7JVJppvaPhsCysZ5KEcRJEJRcyc4j7xGvBLSTx0lc90yED9?=
 =?us-ascii?Q?LI4qWzZCbSmkj4PUQtJoyfOC/55RsPNJ/rKrH6IoEv1SIxEoy/oiM3nY/clu?=
 =?us-ascii?Q?Bag9HOmCBDNb+n244cr31e0z9Q1IhcIHtfwAdhXYtWCuh36qrzx77qm1psU4?=
 =?us-ascii?Q?NbSSk3QnjfN5xQwmqwyg5PhEM+6pFSREXoy2yPXBuWEibg2ZWnqQu8AmsNr6?=
 =?us-ascii?Q?QgW0rk+nYEMeIb7oMKtiBSRB5NylK0EPFjIdxq1MuR+qElPjiQe7lmZf/fks?=
 =?us-ascii?Q?OmLX28DNxGsq7XDDyXG216DpAuzkrrGD68Y0LvguNzhnL2w0nqKF802c5Si5?=
 =?us-ascii?Q?ejDrhc0NM4v1wHUAgezQSPOEflyh4lYLaZAr4H74LuPK2QWwA8SGNDbbNTig?=
 =?us-ascii?Q?hV76LdUVc1BdJbL+FfsL1YaUo+vo+IqT6dVj3cIFTNUUAgvFSrZc+sh392OQ?=
 =?us-ascii?Q?uXBHP5j2dGvyZyqdUgP1Q4tP2m8qtHKBikwgsQpm/rIFNBaiVLhWCwXuuSrq?=
 =?us-ascii?Q?BaoK0PjvBIzQGG/WUQ5vUpd2wsYgoCGYAnSmK8qu2g/lH7Za6qY67tNKzRnw?=
 =?us-ascii?Q?jrHGCwdUoskJsCGBExYnwET0Y0z7NIwJdTadeclCLa1GhkRki1zGUIwYUxOL?=
 =?us-ascii?Q?Nz+jZ//xoty2I+KIEJ8fqzxv/ljJYiRwUrbJEyWKsDpSgow3Mt75sCCKlT1x?=
 =?us-ascii?Q?mveLYeqDNm5iQMigFUlTij/m78Rnkjcsc2OeSUD4dLFAJyk1RHopccffTmqr?=
 =?us-ascii?Q?+XHmHAx0cQKB7y2qE7tDxbtsGGcgMM4JD4J3S+r+dCtpETaA0HgkXOvfjkll?=
 =?us-ascii?Q?qDQ3gaM/vet4+TEtvyf9R4bs6dBRpHUqQ0hX7zR3?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0235061f-1caf-41dc-d356-08dcf277ca4b
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB7140.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 22 Oct 2024 08:59:09.0210 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 3rGC8dfLJIZRZx8j/DqamAxwsPoRV/U3tdU/Y2XwK6trCsfUMejfKY+tzyzcrGYqf6dzkq6BCjwMFcvUQCmZmQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SEZPR06MB7079
X-Spam-Score: -1.9 (-)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
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
 -1.7 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.44.59 listed in wl.mailspike.net]
 0.0 SPF_HELO_NONE          SPF: HELO does not publish an SPF Record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
X-Headers-End: 1t3AxO-0004zD-6H
Subject: [f2fs-dev] [PATCH v2] f2fs: modify f2fs_is_checkpoint_ready logic
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
i=1; while [[ $i -lt 10000000 ]]; do (file_name=./file$i; dd \
if=/dev/random of=$file_name bs=1M count=0); i=$((i+1)); done

In f2fs_need_SSR() function, it is allowed to use SSR to allocate
blocks when CP is disabled, so in f2fs_is_checkpoint_ready function,
can we judge the number of invalid blocks when free segment is not
enough, and return ENOSPC only if the number of invalid blocks is
also not enough?

Signed-off-by: Qi Han <hanqi@vivo.com>
---
 fs/f2fs/segment.h | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/fs/f2fs/segment.h b/fs/f2fs/segment.h
index 71adb4a43bec..b7af84a07435 100644
--- a/fs/f2fs/segment.h
+++ b/fs/f2fs/segment.h
@@ -637,12 +637,31 @@ static inline bool has_enough_free_secs(struct f2fs_sb_info *sbi,
 	return !has_not_enough_free_secs(sbi, freed, needed);
 }
 
+static inline bool has_enough_free_blks(struct f2fs_sb_info *sbi)
+{
+	long long total_free_blocks = 0;
+	block_t avail_user_block_count;
+	block_t valid_block_count;
+
+	spin_lock(&sbi->stat_lock);
+
+	avail_user_block_count = get_available_block_count(sbi, NULL, true);
+	valid_block_count = valid_user_blocks(sbi);
+	total_free_blocks = avail_user_block_count - valid_block_count;
+
+	spin_unlock(&sbi->stat_lock);
+
+	return (total_free_blocks > 0) ? true : false;
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
