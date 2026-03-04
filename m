Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id wErKDKCKp2nliAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:28:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 994021F945A
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:27:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ogvYHOrc9NtNuHei/drt/XCrXFtQyIqE7hoIgxvuiFc=; b=WxRb7UsjnvSGYLtflMejUEwA3i
	f7EioC5W58flJhsJb0g5/i3m8J4CEx4SEpvcte1GKMNr8lhxvzlJebj8tPvM34s8BX6+9/t7HBZBn
	SiluO19/egOCi828YrEJulEsgE2m4B/I4zPyFIVSVN+ciyNc0Ja1hghlWWHGPCXHlCaQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxb1l-000724-WD;
	Wed, 04 Mar 2026 01:27:54 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ynorov@nvidia.com>) id 1vxb1k-00071u-Bg
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cH7iO9Q4dZ8KuVQBv2cYkhEWudXwCWScxmGAOwonoNc=; b=DzEskKUcYibG32Amn1wslo/MIT
 SHTMDTKRva2Mn9pp+qlBD47W2ImFJFtM9RZw2w17UWZYJ1bzvjumYQvdDdjYD6PQBoAn5nBEp5NFt
 ndrFXCqpAzwHgfbsesyAvfD78CyPSsUuBZJqavkbuRhdTm95X53XlcC14CZCwzqto6Cc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cH7iO9Q4dZ8KuVQBv2cYkhEWudXwCWScxmGAOwonoNc=; b=PsHLkOeMNCGtb+YyoSb6Xnl/lM
 v3DGoIJqBl1lhaJjSEgluMhKnVGoXunC4SdnSCgamJZFeeSwPNIP8kyQAaeeBP2ZcTNwMm991Yg3A
 ajCT98pMIAGfVwqBezut+IqClqu2H0EObrscLBdn9t8cV+TtgF8llohB7IQmtbsRpyjs=;
Received: from mail-northcentralusazon11013028.outbound.protection.outlook.com
 ([40.107.201.28] helo=CH4PR04CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxb1j-0007YB-MF for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=GUEpwqnDbdPpBFRDxd8rnb3Vao87jMfH2abY4/OrjXVEGZc9rOA6dtPM9sl0ZHHPA9cyyL9xKk+KkW6bElnzgtt7PyI0PIAMRPES0cn+yAhCTMfwzBcSny6Euwrtq+UPFDyqSwRIVSG6k25wfijiYiPook3rNZUzm9xetExw5YmCEqtBM7OrbEbgfJR4EIhJFIrwz/AAu1BQVWGB7hqTcyTpKh+WTt57sGy3WKJ7U1Ey5p6wgNaXjUCNtW6lzw0/Qz9FaSuAXp2xcPovmgXNqCLz7PuFh4e6JGP1W3Fkb8z2oN4gBfSsTTRz5WV6bIYoqRY5ZquiPxS9HArdSmZ+LA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cH7iO9Q4dZ8KuVQBv2cYkhEWudXwCWScxmGAOwonoNc=;
 b=t8wacObLG0AtvAojklDfDBN7M+nNgorS+XHCHCBT03FGhzaMrqG50IqW2452P/566lxsMgoPpiDWDPgXMOs01T0zT7NDFr3BSLHBVg+Du0aL/ipH/l1/4W/c48GAQTo9ROV2c+oGqaag7pXbY0UfUC5xNfP5zRMltohel28YdwkYgcWgzCO+ombJ5LLIkSAi2Fsd2Baj1PfCwg4bMSsn5I6LY9u4KOm+jtTqLOQF1Eyuj/NXVkRi3fDvO/fF7TVZ+Qs2XYTnEbe/JiTVpU4uPVYTb9Vc8j4lPZbAKFWmGxolWzl5s2veg6jErv6F36Rp8zqlULNZ9C8FV1uyao3u0Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cH7iO9Q4dZ8KuVQBv2cYkhEWudXwCWScxmGAOwonoNc=;
 b=RYiZja5NTXFxA/THkqh9oYYNQ7N6NlCbbe3SeoUPo09/eEzXD8gihvHKCM/RaD/iQcIZOzmWSNLPept1DFHUHNQYv+eRG/AwmkhkGbqo+N4t46p4d1SqRPPeOAHgMPXhKsr7gSP5XXLqaJCBWvlmWWRlXS3Oyt5zAq41WlGGh2z9J2p82btAv1AyjLheMFf7r+vwpsqib0xz8iA3NIHCqeVxQow0L7Dh8pWi0CUIIRWKa4XosCAmH874K9vZiU2lZ1UP8ZlzpwNGmmLSHkRvKHigv8hSdDpJfjwlHg0wldEAvm7E9IDjlMFLfL5op9vdKkyZKrbO1dOE3GE0cuq1oA==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:31 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:31 +0000
To: Andrew Morton <akpm@linux-foundation.org>,
 "David S. Miller" <davem@davemloft.net>,
 "Michael S. Tsirkin" <mst@redhat.com>, "Theodore Ts'o" <tytso@mit.edu>,
 Albert Ou <aou@eecs.berkeley.edu>, Alexander Duyck <alexanderduyck@fb.com>,
 Alexander Gordeev <agordeev@linux.ibm.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Alexandra Winter <wintera@linux.ibm.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Andrew Lunn <andrew+netdev@lunn.ch>, Anna Schumaker <anna@kernel.org>,
 Anton Yakovlev <anton.yakovlev@opensynergy.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>,
 Aswin Karuvally <aswin@linux.ibm.com>, Borislav Petkov <bp@alien8.de>,
 Carlos Maiolino <cem@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Chao Yu <chao@kernel.org>,
 Christian Borntraeger <borntraeger@linux.ibm.com>,
 Christian Brauner <brauner@kernel.org>,
 Claudio Imbrenda <imbrenda@linux.ibm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>,
 David Airlie <airlied@gmail.com>,
 Dominique Martinet <asmadeus@codewreck.org>,
 Dongsheng Yang <dongsheng.yang@linux.dev>,
 Eric Dumazet <edumazet@google.com>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Heiko Carstens <hca@linux.ibm.com>,
 Herbert Xu <herbert@gondor.apana.org.au>, Ingo Molnar <mingo@redhat.com>,
 Jaegeuk Kim <jaegeuk@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Janosch Frank <frankja@linux.ibm.com>, Jaroslav Kysela <perex@perex.cz>,
 Jens Axboe <axboe@kernel.dk>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
 Latchesar Ionkov <lucho@ionkov.net>, Linus Walleij <linusw@kernel.org>,
 Madhavan Srinivasan <maddy@linux.ibm.com>, Mark Brown <broonie@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Miklos Szeredi <miklos@szeredi.hu>,
 Namhyung Kim <namhyung@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paolo Abeni <pabeni@redhat.com>, Paolo Bonzini <pbonzini@redhat.com>,
 Paul Walmsley <pjw@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Sean Christopherson <seanjc@google.com>, Simona Vetter <simona@ffwll.ch>,
 Takashi Iwai <tiwai@suse.com>, Thomas Gleixner <tglx@kernel.org>,
 Trond Myklebust <trondmy@kernel.org>,
 Tvrtko Ursulin <tursulin@ursulin.net>, Vasily Gorbik <gor@linux.ibm.com>,
 Will Deacon <will@kernel.org>, Yury Norov <yury.norov@gmail.com>,
 Zheng Gu <cengku@gmail.com>
Date: Tue,  3 Mar 2026 20:27:13 -0500
Message-ID: <20260304012717.201797-6-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0595.namprd03.prod.outlook.com
 (2603:10b6:408:10d::30) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 9ff22217-fd5c-4cb4-bb7f-08de798d3498
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: kNpItpHekTNXaKTKIoYtGV8Ypn7ulc25MzyvMa2NB7zhSgWxNFJ6YoesWE480hRO3kIFHehi1NL1IAFEF3KjqvV3lkLvFxRPalMczBWKU48rBG9YCt/iyiFTx3U3QRa135ph3fAxkK4pqm076Ap1smGC2bfo3pj50DEcTd5iOnMmN7Wzrb5T1Vzw1dv9rGBbyzetDoXhygbazWgvTZgeLoFfmierJeksW6ztYBDE1EQNDjJp+ne6ODaVuPIZyNSEOaPTTU84902A2oVkMAAzvzl0JCsPTk/9B2psN3OXDCiYeFIgo8YkT5bANW3qxmdf7SocpEpL+rj/lG6YqYFZTD8fNIRQanarlNMaXlFFp9mG3IrYPXwsB+5a41IiNL6ofEnTLmcEZyjRh6blNWr+cuC76R5uk1CdlgoGHJZV3JBXbW9odm2bBKGtsXSlfJzbr1Ax1uYmZSbPwgjMmpiXY8Q28Sh9pG7Qpu59S9loQjFoeuLaMT7qNhUIrcE/5e88qU0LQE500uvcPyVbKp2r0hWH80EkosvIZRxvUr5ZjaPUEw+DR/lRC7gOgrUkBG0gMyDH4YX5pb4MiWsQr7n0zOIf4SiGwz3zxdK8g8byYcGd2Nfv/tVVm0W9hzCm6M1CphhkW5juUUIdwXoMptDar5P8tqSLeP8d3lfndR1eaZlC4cANgDccvwLq++HeWiWBuGbBVDH6Z1RNrscJyfyHhd5ItUAhGylKpHVpT6m+ExIka1qj7HSsQeVUyvcIlRMnx+Q4QWBZB5Yy9LBrHs/c3Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?QovhxB1t0D05zU82J7ljlNOcfFani18E55Vci/LJ5lFSVxGGxTLMHD8dNWwM?=
 =?us-ascii?Q?Da+r91pDr/AjeXlSvVnuXr9KvAOYU+u9spNyh8YrRm7aV1z70UuBwFET4gDJ?=
 =?us-ascii?Q?fxDxS+Jbfg6JiKlOhMh30S4Ea2PaeyFaUA0U+2ORN/ql1E1kJetHVNyPu5vM?=
 =?us-ascii?Q?mVd6wmVWNygYY7pvVJiG/nJlAK79Jex4vNlZqZvyi12S3fcy9Sfmh07SsP1X?=
 =?us-ascii?Q?4oVT4s84uL9spRPxpKENVyrNNik7bEEQRCQQ3pP2tL7CFwO5rTx4qf+0YZ9j?=
 =?us-ascii?Q?y/QD2q2v0nqFgbER3FB1YJGEIN6cJsh9gtOvAV2CarMqdUIZxC5A/tHIw5LQ?=
 =?us-ascii?Q?Wv+9QpJ0GLCvHBPB4BfVs75pK6ARqPVvY1JF4XW8WA1ksRT73nDAPDsVn9w6?=
 =?us-ascii?Q?nMPo81N0pUsLNa25STin4h/fSUQf1Y6JNqLDQeCSKD8vaJhgyibg8eqigNzX?=
 =?us-ascii?Q?Nor1uobYjGsFDTklxq501v2u9N6zh8giRPC8nVXJzzgKSG+IUGa5mOkx9vhy?=
 =?us-ascii?Q?Xy1to0vOqEmXnsvqaFPmXO85LqjtLGGJEDuGFgP/2yH3VyDSWwlwuGUiA0Xq?=
 =?us-ascii?Q?hU7HBKgtNhmFqC/sHOw6QUreYRUr11Qn5k3+U9is1qHpR+oVS2oLfwoy8i0a?=
 =?us-ascii?Q?J+rET2Ft1bKpUTiuvdPn/lAYlcQQ1YBtBNJpxj+UceOZRowiiY/rvt2sSU/k?=
 =?us-ascii?Q?Dipd2WP/7VGEg6rLW8z+55Qq4D9jtkRxw6sQUdpI1PCz32BNzRBDHgUBH4n8?=
 =?us-ascii?Q?QMYroBQZqPM3jTHwwAuJr7qV9mxn7Q6mStMIdpr+7CJ9fcSC/f1GIw5RgdlX?=
 =?us-ascii?Q?5fabSXQnw4w+KKincKOThnWPArA2EzJklK4vBKYJalDmyoEw3/orxtxqRbsB?=
 =?us-ascii?Q?Zj4J6lAtU3semknfNPdiR+hqd4IrUmKHet3qpxdLA1Tqw4wysCvLftZ2F+wa?=
 =?us-ascii?Q?MV+xK8Btl9ooNwm+B2wI32UM+MNDgdhqRIrC3546u/HjopTuUShPV+WtWK1S?=
 =?us-ascii?Q?NUxkCYO+FX0XWapL4yKZWzevaiGmjxiwb7QQ9u5ohFZyZe+K5v4kwHZS+GVt?=
 =?us-ascii?Q?hrzF9jaQMJ4DHVQQun2V071lsUnC69dnpQLZqfkcnlfPwcw/bsqomaBU6y/9?=
 =?us-ascii?Q?6XTB8Kme3WvCQOEBib89w2prRquH4XaQ8LX7NxIxPNE21YQR7dzvLP9YziHs?=
 =?us-ascii?Q?vV92Rq4bD0WbB+uLxt7Ruooxim7k+wIo32Hqo8P1m+qsRoUczWkzBqPVl4Yh?=
 =?us-ascii?Q?saZyekj16IO3xKfAEfXTLtYRZV/Db3gzzHKdHVwlfqyJFrhOtK+0uDSNwLTX?=
 =?us-ascii?Q?ZA/kaws0Dl+TASCHgepQsYBXjYscXVVEOM4gQh7h+QcxefwGxlo9Rv7ndTgr?=
 =?us-ascii?Q?KDqoB9mPwFzUcjfkqYD1+K16nmcuYEBjp3tDKMrhACtpIgijR4FiPPIgdC9E?=
 =?us-ascii?Q?+8p9BmBvItS45Mu3X096L8WIuhsXghje+0DHjSEGVtU2LIAyVJA3Syuw6Oea?=
 =?us-ascii?Q?oYYTr2IPKXvYwyxT6aW7ANzcG6NGdL2Lr2uRLz6Nrps7qglwqFkf7nMqfuBQ?=
 =?us-ascii?Q?A6+Hid9KKbK1sQULk8y6jYJFHzRm5pVWv0BqbrVoPaxe0rCnO6wsFhEOO0Q+?=
 =?us-ascii?Q?eCkGhPEhFG3bVg9HsHOb2ZPu6Szp0HSLTotSdfbdes6hDAI7tfo7l/2655/S?=
 =?us-ascii?Q?u5ycHPNHo3Ou/aNHd2VwYkwQXzeCux1TJpz7vAew8R1OGQoXQTP9J+FhEJUo?=
 =?us-ascii?Q?5SWPhbsow7CzkcunqJfeuNfBugEHsQtZb556aLKW6pCL+NaI4T8L?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 9ff22217-fd5c-4cb4-bb7f-08de798d3498
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:31.4195 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qJG2wZNcH0YZXZvPE/LWYWJh2EsHiMu0N3jfwzgwN7cnGTkwvvZpsqSRJA5D3KC4+XlZiwL38K7Vlhu5R4KnrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Switch SPI code to using the macro. No functional changes
 intended. Signed-off-by: Yury Norov <ynorov@nvidia.com> ---
 drivers/spi/spi-pl022.c
 | 3 +-- drivers/spi/spi.c | 4 +--- 2 files changed, 2 insertions(+),
 5 deletions(-)
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.201.28 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxb1j-0007YB-MF
Subject: [f2fs-dev] [PATCH 5/8] spi: use rest_of_page() macro where
 appropriate
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
From: Yury Norov via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Yury Norov <ynorov@nvidia.com>
Cc: kvm@vger.kernel.org, dri-devel@lists.freedesktop.org, linux-mm@kvack.org,
 linux-riscv@lists.infradead.org, linux-spi@vger.kernel.org,
 linux-s390@vger.kernel.org, x86@kernel.org, Yury Norov <ynorov@nvidia.com>,
 linux-ext4@vger.kernel.org, dm-devel@lists.linux.dev,
 intel-gfx@lists.freedesktop.org, virtualization@lists.linux.dev,
 linux-sound@vger.kernel.org, linux-block@vger.kernel.org,
 linux-xfs@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-nfs@vger.kernel.org, netdev@vger.kernel.org, v9fs@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-perf-users@vger.kernel.org, linux-crypto@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 994021F945A
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-6.11 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7:c];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:akpm@linux-foundation.org,m:davem@davemloft.net,m:mst@redhat.com,m:tytso@mit.edu,m:aou@eecs.berkeley.edu,m:alexanderduyck@fb.com,m:agordeev@linux.ibm.com,m:viro@zeniv.linux.org.uk,m:wintera@linux.ibm.com,m:adilger.kernel@dilger.ca,m:andrew+netdev@lunn.ch,m:anna@kernel.org,m:anton.yakovlev@opensynergy.com,m:acme@kernel.org,m:aswin@linux.ibm.com,m:bp@alien8.de,m:cem@kernel.org,m:catalin.marinas@arm.com,m:chao@kernel.org,m:borntraeger@linux.ibm.com,m:brauner@kernel.org,m:imbrenda@linux.ibm.com,m:dave.hansen@linux.intel.com,m:airlied@gmail.com,m:asmadeus@codewreck.org,m:dongsheng.yang@linux.dev,m:edumazet@google.com,m:ericvh@kernel.org,m:hca@linux.ibm.com,m:herbert@gondor.apana.org.au,m:mingo@redhat.com,m:jaegeuk@kernel.org,m:kuba@kernel.org,m:jani.nikula@linux.intel.com,m:frankja@linux.ibm.com,m:perex@perex.cz,m:axboe@kernel.dk,m:joonas.lahtinen@linux.intel.com,m:lucho@ionkov.net,m:linusw@kernel.org,m:maddy@linux.ibm.com,m:broonie@kernel.org,m:mpe@ellerman.id.
 au,m:miklos@szeredi.hu,m:namhyung@kernel.org,m:palmer@dabbelt.com,m:pabeni@redhat.com,m:pbonzini@redhat.com,m:pjw@kernel.org,m:peterz@infradead.org,m:rodrigo.vivi@intel.com,m:seanjc@google.com,m:simona@ffwll.ch,m:tiwai@suse.com,m:tglx@kernel.org,m:trondmy@kernel.org,m:tursulin@ursulin.net,m:gor@linux.ibm.com,m:will@kernel.org,m:yury.norov@gmail.com,m:cengku@gmail.com,m:kvm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-mm@kvack.org,m:linux-riscv@lists.infradead.org,m:linux-spi@vger.kernel.org,m:linux-s390@vger.kernel.org,m:x86@kernel.org,m:ynorov@nvidia.com,m:linux-ext4@vger.kernel.org,m:dm-devel@lists.linux.dev,m:intel-gfx@lists.freedesktop.org,m:virtualization@lists.linux.dev,m:linux-sound@vger.kernel.org,m:linux-block@vger.kernel.org,m:linux-xfs@vger.kernel.org,m:linux-arm-kernel@lists.infradead.org,m:linux-nfs@vger.kernel.org,m:netdev@vger.kernel.org,m:v9fs@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-perf-users@vger.
 kernel.org,m:linux-crypto@vger.kernel.org,m:linux-fsdevel@vger.kernel.org,m:linuxppc-dev@lists.ozlabs.org,m:andrew@lunn.ch,s:lists@lfdr.de];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[linux-foundation.org,davemloft.net,redhat.com,mit.edu,eecs.berkeley.edu,fb.com,linux.ibm.com,zeniv.linux.org.uk,dilger.ca,lunn.ch,kernel.org,opensynergy.com,alien8.de,arm.com,linux.intel.com,gmail.com,codewreck.org,linux.dev,google.com,gondor.apana.org.au,perex.cz,kernel.dk,ionkov.net,ellerman.id.au,szeredi.hu,dabbelt.com,infradead.org,intel.com,ffwll.ch,suse.com,ursulin.net];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,Nvidia.com:s=selector2];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,Nvidia.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	RCPT_COUNT_GT_50(0.00)[86];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,netdev];
	TO_DN_SOME(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[ynorov@nvidia.com]
X-Rspamd-Action: no action

Switch SPI code to using the macro. No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 drivers/spi/spi-pl022.c | 3 +--
 drivers/spi/spi.c       | 4 +---
 2 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/spi/spi-pl022.c b/drivers/spi/spi-pl022.c
index c82cc522776d..78fce33ff422 100644
--- a/drivers/spi/spi-pl022.c
+++ b/drivers/spi/spi-pl022.c
@@ -761,8 +761,7 @@ static void setup_dma_scatter(struct pl022 *pl022,
 			 * we just feed in this, else we stuff in as much
 			 * as we can.
 			 */
-			mapbytes = min_t(int, bytesleft,
-					 PAGE_SIZE - offset_in_page(bufp));
+			mapbytes = min_t(int, bytesleft, rest_of_page(bufp));
 
 			sg_set_page(sg, virt_to_page(bufp),
 				    mapbytes, offset_in_page(bufp));
diff --git a/drivers/spi/spi.c b/drivers/spi/spi.c
index 61f7bde8c7fb..cd4a18f3afaf 100644
--- a/drivers/spi/spi.c
+++ b/drivers/spi/spi.c
@@ -1162,9 +1162,7 @@ static int spi_map_buf_attrs(struct spi_controller *ctlr, struct device *dev,
 			 * the desc_len and the remaining buffer length that
 			 * fits in a page.
 			 */
-			min = min_t(size_t, desc_len,
-				    min_t(size_t, len,
-					  PAGE_SIZE - offset_in_page(buf)));
+			min = min_t(size_t, desc_len, min_t(size_t, len, rest_of_page(buf)));
 			if (vmalloced_buf)
 				vm_page = vmalloc_to_page(buf);
 			else
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
