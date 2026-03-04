Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kIHhNKCKp2nliAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:28:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 47F081F946F
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:28:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SPULqCdc5w5jlhGNBUl4BcdvZJQIGZ2q7vY67TBeBY=; b=AmbAbdwg9LcHuWfKDZOhXjvhth
	lkGYMz8w4xXHu177l6xjC+V6yE8eSH4aTjl6OFfsFYE/Oj7iKKxqQBmWm5ol+kkukJX/nheuQZ70d
	qpfVo0nCPBYapsSl0UBJ2w6dnHbLeuEGOjw5X7HKl0R0Z7Sjw9k42BBe602ChSSa26SM=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxb1q-0002E8-4C;
	Wed, 04 Mar 2026 01:27:58 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ynorov@nvidia.com>) id 1vxb1l-0002DH-Bh
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:27:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=; b=GibiXoccMxx7bKk+Y8jA2+Xvk8
 9rzPVRl1bgHJ6dhMconEfdW2sNbUUNvqY9czgaYEHi/xU5PhGSPJN3hmXioRsFiDMXnP/8rt+Tb06
 3zZ/hFYsaFYkDLhOXMrPLh9+62ukVX+3grywi6IsmAQ0+3HGtEkSOA5K/3K97wi06Ovo=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=; b=nKae5LGjGCsteGC/R/+N06lJu1
 IES/uu1UO5gInstx54L5xxqA+wysBd7ibSmTHBsnzFgj/17+/SZCf1Ih4xYXVxljxTi6oDg2/PtJs
 qgCRzCVglD9Fe/e7izDS+x3e7aokSfWi7NXbuTlmLF/XZYgpSCrmuJUwb4fQOfKSKpN0=;
Received: from mail-northcentralusazon11013028.outbound.protection.outlook.com
 ([40.107.201.28] helo=CH4PR04CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxb1l-0007YB-MR for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:27:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p7IyXyBnfC59bhh/QDlC4xjm8gnxI/aVjCQ8NWjD+TQ/phVsvcvuW+NLBwz88oegj1uUlu3Eo3WVXfBEPFYLVctAff3OGVKs6Xv8Wggf01j3o0MSOeSxHA5GJqJjudqqXN/2oDkFpLWG7rNbgythWaGJW701F+WT+MDBwzxmlu9SXw/oaP0PeGTAWeV9kaOO841TnqajI5htVvdPBVcphxbO0+fCcLLs3ACa6zPrI8LdN0/pSUTyF6rkpr0iKAmaNhVLW3qunh4s7ITlNquQXbSIEekdoDCyuvRtVfUJe+oVe99SGOdiQIwubQe36N7K0Itb8+4Q5Sa+OhGYRxeCXg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=;
 b=w+esDmCCph9thTxJi6D9QEtzrUzS5rQDHMVxzz6TS7qPP7AfnGlXihVXA05VntXiv4B6vEmeBEDvccO27e4Ko2dC7bs65ACkzY3wPreezzZgngCi9P8sE/duNHHHgFmmJN9NBZsU0Us9uaLpK0fJZ3mT/4xh4/TBtjrO2R3aQOUNEn7ml8MMFvfkHLLP3AVkyhgcLytd9ojZ31UtxREx6DQU0dataSsAq3aoeyhGOxQFcMtKumoym/0xXP8VzElidNH1V2VsQqfhnizX85t/USGwEFg+FsJhWpfu+cj7+GVZy9VnGvbC3Ym8VvzmSwj3kSb6OPoRbdlrpNeO3pp4+w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SMCVXE/QqXcN89uo56glYVb2KUIcE1svTHLTUm91N2M=;
 b=maidt9YUEg9SE1s2e15IkLkTmsj5XGLJ0eWvmZLG17QCRfvRHNiGN9W3S5yzM2gLA3ZwjtK0HMjZkNSiN9sN7bTS9l2uk3KeXEbIqBn3LZ9aPcH2V7tMnIv7aSCbInGtrtlF2wl2hQtVVFRA0iLD8deJv7DgLNRD88+Qtd+yFA1TrYXYHfU+Y/QQCMYfQ8QTzb+CCv4rUUsIG1ZLmGNhWtC5E+8P0TBA208y90uayInBW54MyAATkCPSzlbHYLLHap/J/tssthm9awMpbHFDACRlatTjRTT4e7jAMrCvGEqGDgfcCtwSioUqVWfEw6oStZDZTh77KMsRBqjrVmO03A==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:38 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:38 +0000
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
Date: Tue,  3 Mar 2026 20:27:16 -0500
Message-ID: <20260304012717.201797-9-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
X-ClientProxiedBy: BN0PR04CA0111.namprd04.prod.outlook.com
 (2603:10b6:408:ec::26) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: 2609bae3-d7b5-4d6c-cdad-08de798d38be
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: xtr88SI7Q4AcFK/iCkO/xPPWk0+R3vDrTpAEkNkbZ8qomfK3bAqE3XXgk3WCNroUewaQ35DD4OpAJK1mIhUjhWYvBFTqoeATTFnLAmqOp15cQE84BTc+8CnbiKwRE0wOPvR4+P9wrFVo6jX1SM5uRem1u/Gq0/uFWMPPtwK4pVRqQ6TaZagPbb9tU2AbyJI96CdJV+D/9u2lDuLkmio5k8PimILuLSWNRKkjzizNdjFIBx5FcpjDsKEPd36qCC8fgQ8K5WsoA4hd5dyEORYzDfvI2oH/zoDgA0hctTSJSGry0uzr+8AI9tV8nUZjlMsrDCf2UMGeEBPxCmE01gt5eH7odkBaAXu3EvlsN6LtmIu5GU5fD4aHKyOhJRiFYkfo3RM9lHPrff6Rd/B1e0mihJxDWgodSpZDp2Bpzx+5nG3mrD3EQJBDgDvfDixNyRZ+D2aSppWErIY/rwuO20KAcDloK2pH91Uj1qnwopT2ICDEqyTmNOvm+Gnr6DBGgKdRRa6zeWiOM/aYM9V6u0Pp7f4YTFLa/5PvZfCBhkWFIQy0buCigXXjKYExH4rTtmmMH+bAOCnV8nCxPP4RNKGZRMZGwhL9BYG4V4IVzgQ/aZ3+XTJFWe/5uwHcrp5qPa1zQTsFD/7c32RWrSRS12+/v+bw81rbNRTnOAvEZy5XDi1Eenxd3W6HyH5I09MHMhmlW1TOC/u2untYVG3C00LNI6+bNraN5Rg/0lUN9gfUQLS/TQXgz9Ud6SR48QdzfL6/4dmZN94g9vM+nkmTSClPgw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jZT52MDM+eEm2ajfhuGGg1je2uDA86dzD5RM7cWtaSUcZsmLo3p4LUo+VZgH?=
 =?us-ascii?Q?CcFY4fZq73cONvgI/up9p5BMyftLSMlvV00Vm3N2XA2UaJorXSvVHlN6e9rG?=
 =?us-ascii?Q?+BS2M5jomKURFg3P4QGjVyE9mdjFeF/n4cBQznI+N8UtjPZtlqzw/pXI8KHJ?=
 =?us-ascii?Q?Jx8Li/Gt32NxfUzyb0Re2KRK2EpLasBGScpnd5rc93/stq2s6BEU/S9JEtQK?=
 =?us-ascii?Q?0J2Ig3D27nnZt1DlT36YFV/Z+bGIN1t7oc+eMYIJpkmGuytatGb6NtHeW9Qc?=
 =?us-ascii?Q?otPJ6O82PeDiCAbVWKAIGs3yRNs/jU7k0xlBn6jLHxH7TFNKFK5kVghg523j?=
 =?us-ascii?Q?oX4r5I9M2ZnolMGZb1AZcCOyJZe+YZOBWqTA8i6z72KvugdAVo9VtSpTTxLS?=
 =?us-ascii?Q?BiAlthrnV8VTo2+a4EracIh+n+0e5ma3dxFtYhg41j2oJp5krPwgvyFpYE1q?=
 =?us-ascii?Q?gMgzWOMwd+/EjN7Jmg97D8iRFNCImOLvjk/FwATm86gkRu7Fpj/L2qJLcp8f?=
 =?us-ascii?Q?9OirouLpKCmoGuAycTa4DutOGkyJXTl0yb5aiFywqakzGWYOCiK8p8fOjzVw?=
 =?us-ascii?Q?iJmYDNPuAuXYA6ifAnDtnyXjSYpku7Vd4oCULY+YgrnR+mD8jN8oUbTsfxDJ?=
 =?us-ascii?Q?70dcbbGaemRAcZ3oDRNwmkIIMM3OmgbkVbyPt0V4HT8ZIOCAN8xFEF4p6cGO?=
 =?us-ascii?Q?eW9Ix7e20XVgZMGLl7Rf4bR0GJbrbrvHzK5p6O8K530TWx2RmTkMKKovm9d6?=
 =?us-ascii?Q?hRiCXlxG9Mwxk8xdLTLIgXKCd2DteHO+ouNXq8Vy/6bTe2q9lFY/nozPKuSj?=
 =?us-ascii?Q?3XiTDROtScMtG+K/Sx8p0yHfEDmN8m4+AcFQDS5z0pUFiNGUNxzyWTdSlqXp?=
 =?us-ascii?Q?NCH3PO6j9oS5Rz6N9b7La609E0iQ+8jqEkej5ry+SuPdbJtjfWcZsxcpbA2l?=
 =?us-ascii?Q?PKq1KNKu5R4L67Dt5dzmNkYIj1t5aezZMVNdaTUYopF69DGNpu6XCnMIdzmx?=
 =?us-ascii?Q?YuclF7I1XJRth9WYwy50lhD7wU0Yx7UkWn0srKPJcBh6COcsxslET61mBVZY?=
 =?us-ascii?Q?hiRG2fLtJQw5l3Y7iLDndQBLijJWAeuWbrOFhTMeYQiOJsLuZD34AcS4n6I9?=
 =?us-ascii?Q?CSKMBYHwj3GQ1sjrBRQcLTs5r/rAu524+LplcySqtzj31wxZWNEsSGDhkhWq?=
 =?us-ascii?Q?gUHEJGESGgSe7ricmXWRJu/bL0g555G+7khTbaBSErtMHZO8cp4BPDMjlF8Y?=
 =?us-ascii?Q?AJh3p8vJq0AxIeaJW7+CEweIQWdGYANN2l/oBAA/seklaYQhht7LMXx47aEv?=
 =?us-ascii?Q?fe7x/gjpSQ6qh0sxrjjga5a2bxc/M1BYS1G0gpwCM7jIEl3r3Woh6Np/SssN?=
 =?us-ascii?Q?0bRjcJjYMdGY8VfCjp2wtkZgxg75kLzeHKTUkw1jiUTz+zJxIFneVF9ZOBS5?=
 =?us-ascii?Q?TZdcNGY9VNNZdRgyvbi61Lu/TOCIf+vn3O9hJ4SQzqE+XF2Fyvbf4qvfYGAj?=
 =?us-ascii?Q?TC+KI43yWW7FPkdnVxH0fYofJDaG+Z7428TtImGS7j10tIa2cscZjOsPhgHW?=
 =?us-ascii?Q?7r7El9t92QBbstiWTNULLaGH0t1N2FN8XcT0xQ8t4xk5O7IeK/48IZ6YiYqg?=
 =?us-ascii?Q?Nb04R/5oI4l0W1ht89mqdstkVexYsc2UQ1BQEX0A1uDg7sXC0xuBvZQ4yOKh?=
 =?us-ascii?Q?5ceyzxrZLiFnpOfqTHF2HzrtUnQDhu2Xj+OZwNZcxC1k777PWjJy30XAifgM?=
 =?us-ascii?Q?XXCFrLmaSRas1lUilO2bKMt1CtRSz/X7urTZvi79BSv9E/gD9ePe?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2609bae3-d7b5-4d6c-cdad-08de798d38be
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:38.4368 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CXt8e378FJ0B3MzdzzWaWK9oK5KIDe3bPOTtrn+uSqUA2hwKB8rT9SRgsjZlbcdaW7oWw1Rhh0hszU/hvHkVeg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Switch arch code to using the macro. No functional changes
 intended. Signed-off-by: Yury Norov <ynorov@nvidia.com> ---
 arch/arm64/kernel/patching.c
 | 4 +--- arch/powerpc/lib/code-patching.c | 6 +++--- arch/riscv/kernel/sbi.c
 | 4 ++-- 3 files changed, 6 insertions(+), 8 [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.201.28 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vxb1l-0007YB-MR
Subject: [f2fs-dev] [PATCH 8/8] arch: use rest_of_page() macro where
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
X-Rspamd-Queue-Id: 47F081F946F
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

Switch arch code to using the macro. No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/arm64/kernel/patching.c     | 4 +---
 arch/powerpc/lib/code-patching.c | 6 +++---
 arch/riscv/kernel/sbi.c          | 4 ++--
 3 files changed, 6 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/patching.c b/arch/arm64/kernel/patching.c
index 1041bc67a3ee..4c3a4401719b 100644
--- a/arch/arm64/kernel/patching.c
+++ b/arch/arm64/kernel/patching.c
@@ -116,9 +116,7 @@ static void *__text_poke(text_poke_f func, void *addr, void *src, size_t len)
 
 	while (patched < len) {
 		ptr = addr + patched;
-		size = min_t(size_t, PAGE_SIZE - offset_in_page(ptr),
-			     len - patched);
-
+		size = min_t(size_t, rest_of_page(ptr), len - patched);
 		waddr = patch_map(ptr, FIX_TEXT_POKE0);
 		func(waddr, src, patched, size);
 		patch_unmap(FIX_TEXT_POKE0);
diff --git a/arch/powerpc/lib/code-patching.c b/arch/powerpc/lib/code-patching.c
index f84e0337cc02..186a9cb79ee3 100644
--- a/arch/powerpc/lib/code-patching.c
+++ b/arch/powerpc/lib/code-patching.c
@@ -463,7 +463,7 @@ static int __patch_instructions(u32 *patch_addr, u32 *code, size_t len, bool rep
 
 /*
  * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ * Assumes 'len' to be rest_of_page(addr) or below.
  */
 static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
@@ -514,7 +514,7 @@ static int __do_patch_instructions_mm(u32 *addr, u32 *code, size_t len, bool rep
 
 /*
  * A page is mapped and instructions that fit the page are patched.
- * Assumes 'len' to be (PAGE_SIZE - offset_in_page(addr)) or below.
+ * Assumes 'len' to be rest_of_page(addr) or below.
  */
 static int __do_patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 {
@@ -554,7 +554,7 @@ int patch_instructions(u32 *addr, u32 *code, size_t len, bool repeat_instr)
 		size_t plen;
 		int err;
 
-		plen = min_t(size_t, PAGE_SIZE - offset_in_page(addr), len);
+		plen = min_t(size_t, rest_of_page(addr), len);
 
 		local_irq_save(flags);
 		if (mm_patch_enabled())
diff --git a/arch/riscv/kernel/sbi.c b/arch/riscv/kernel/sbi.c
index c443337056ab..9a2f656f776f 100644
--- a/arch/riscv/kernel/sbi.c
+++ b/arch/riscv/kernel/sbi.c
@@ -602,7 +602,7 @@ int sbi_debug_console_write(const char *bytes, unsigned int num_bytes)
 	else
 		base_addr = __pa(bytes);
 	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
-		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+		num_bytes = rest_of_page(bytes);
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_WRITE,
@@ -631,7 +631,7 @@ int sbi_debug_console_read(char *bytes, unsigned int num_bytes)
 	else
 		base_addr = __pa(bytes);
 	if (PAGE_SIZE < (offset_in_page(bytes) + num_bytes))
-		num_bytes = PAGE_SIZE - offset_in_page(bytes);
+		num_bytes = rest_of_page(bytes);
 
 	if (IS_ENABLED(CONFIG_32BIT))
 		ret = sbi_ecall(SBI_EXT_DBCN, SBI_EXT_DBCN_CONSOLE_READ,
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
