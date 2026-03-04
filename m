Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qP39EKCKp2nliAAAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:28:00 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A4D401F9460
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 04 Mar 2026 02:27:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:References:In-Reply-To:
	Message-ID:Date:To:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NcepAbwEc977vcGVmBvX1PBu0rl+gkjpNyHA8frMHIo=; b=G50mTmp84mbaoDVEL5n+1QJKpy
	wAvjUOnwuFaiQo6YkIGQgHVvXhWjqR+ODizQheHuWdh70Au2hatgSamzLlkoNMycDB7S/mQ2ZDARy
	xIICJCLxmIywmslCh1kuaWYaduC34cmwdoZlBr0aewz1qkOt6kCANULWyqky0zThfX2Y=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vxb1o-0007jj-8H;
	Wed, 04 Mar 2026 01:27:56 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <ynorov@nvidia.com>) id 1vxb1k-0007jY-UC
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:27:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8gSCHE8kjPSLoULSKkpRxPQqFKwhZBXzpx81D8lSNwo=; b=fKRlNfR8pDU94FqGSQUYHGZcuY
 9DZ0J1Q+MxKy7Gv9TXjVYV3WJXSondD57jIazfXXXQC1O0Sfjx6qemBszt1/ncYhxFJzjDOy0YTJk
 G+kkgOe8wdZC9/dTWgeyqrjVuPGGtmtpMd3hhnTr8jCT3TP1Ru7kYRfDX+RLJAMTfi84=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:References:
 In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8gSCHE8kjPSLoULSKkpRxPQqFKwhZBXzpx81D8lSNwo=; b=AifAKNtB8+M7vhu/kRmc7Eu26V
 EMva68GKDaVuJ1Chp6fGXCs9UcvYbWV3VVYACETZnO9WzHH+yhfHzKzc792nhoFzpEkT5CUuQMJbQ
 nx/OUm5rY+yoSADIfJkhmfw86SiY4iiY29JsE0l4RBJDrPjRhgsIcs7amf/8pz38Ir5g=;
Received: from mail-northcentralusazon11013028.outbound.protection.outlook.com
 ([40.107.201.28] helo=CH4PR04CU002.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vxb1k-0007YB-Fq for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 04 Mar 2026 01:27:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a5afcP+xPp53aYkHswiWzdI4Msozqr5V4tHhEVXe9ZVjtcmRiy3VX11EkPHjazOLYMHmGxtIZ1Y0lGPnHStG+/C0bRfTo7MUqs/Mt8xjsP3P7e45Tsjhnuput9GwSWyBLlsoZq2QWZSKI21cj3tsvENx9xrZ9jKDxVS7Ir+xVogQ8dPScgJpIFGkkHmjRcuTtxYiJUwfWpSGShQNjiEwGmIFTPWDeJpwX+mSIb0dtqB29KsgifvWU6U63Ztsb8TPcihy32Q/yp19plQumzA04MwzycDnQcvnjZljjC1W1nyboRNthKtcyp9pXv4mMkgoyqWpLchikAR6nskSg4ChpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8gSCHE8kjPSLoULSKkpRxPQqFKwhZBXzpx81D8lSNwo=;
 b=wbJElpWqD6bg0np/jNgUS09/M6WzYi4dXudK8aKDX0VYiPs8VBeR5wWPPryGowCpTuB5H/ScREOXYsnBTRWUJtKCVh48VEvGMNSPA0FvjxenfxRYSiJv/3SsO1k4oIt9v0SSFvyG1Lev7GmYbW+CKWEmESsBklwuQfB/0v1pL4jgZ5k/XAhZKV0v8JCDOuUNm7RaR7Y9jbSdPvfj3NCPnohu+8z7NGRmq8hlm2RUA4hoz5u1Ay04m7rI3HziSV8vTp15QzorFOH2zQnTBkrfh8Bv20q+PV9C2YUE1fsyPndY0a/vtMAZdZOB6Zh9Szx+m/r3yjdbYR/4pz6V7wmw7A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8gSCHE8kjPSLoULSKkpRxPQqFKwhZBXzpx81D8lSNwo=;
 b=f5sF/09Q480wY19v1DY3Wt+SNUs6vVXNnfB4WTZLCiAUZdUuHcjnQZtwIPxSD5MC3m8FjWqDcVHdmYoyy3a3YR8YTJZoqiCMCvFvSlpv2IWlfLYXxnB27ls2FDf17x0IGjUDteajVACehCgQlH9MkjMfmgtNfDoUNo1niDZAL0eZigyTFSeuWyGGkSbRqKBVaxptIbqnrR9aBmVRDapK/pME3lM6UW7pm2Xj5/EtV/1OYYM5kg3kg10EopJujBHC/ujXluuVSmDflkCC6+qiRR/UlVgMH018CmS8f49SnBIU8dYa1kciQOVP4rRF/2Zu1WHrSt9VUT4gsIEkfXRHFw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from PH0PR12MB8800.namprd12.prod.outlook.com (2603:10b6:510:26f::12)
 by IA1PR12MB6651.namprd12.prod.outlook.com (2603:10b6:208:3a0::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9654.22; Wed, 4 Mar
 2026 01:27:33 +0000
Received: from PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d]) by PH0PR12MB8800.namprd12.prod.outlook.com
 ([fe80::f79d:ddc5:2ad7:762d%4]) with mapi id 15.20.9654.022; Wed, 4 Mar 2026
 01:27:33 +0000
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
Date: Tue,  3 Mar 2026 20:27:14 -0500
Message-ID: <20260304012717.201797-7-ynorov@nvidia.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260304012717.201797-1-ynorov@nvidia.com>
References: <20260304012717.201797-1-ynorov@nvidia.com>
X-ClientProxiedBy: BN9PR03CA0939.namprd03.prod.outlook.com
 (2603:10b6:408:108::14) To PH0PR12MB8800.namprd12.prod.outlook.com
 (2603:10b6:510:26f::12)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH0PR12MB8800:EE_|IA1PR12MB6651:EE_
X-MS-Office365-Filtering-Correlation-Id: a668991d-ff9b-4dbb-7daa-08de798d35a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|10070799003|376014|7416014|921020; 
X-Microsoft-Antispam-Message-Info: Z/6V97ZgGWZnJizosWGs3D3JmsBEU37quAoqwhEy56JDe8uN9V3H6D0yuBL506dxvp7oKI9HDcWQuTOlKn0o1JpfUQnxPPVHmG8fJW0OJ2nIPNi/BZ5LpoMR8z8W9ya02KrLD+7+pOg61gi6s0I3tkmeKrg5DEriLsalAWRhpbRdciQcUJ98RKyfMVAO/XnUqVRVy+mCCctZ5T0BPaspgBUdQCU+vpwLVMWgLWg4xwX5QaiOhiL5bYu3LJxw5MD3r3OTLNsbkDoQ0oUDuJh091ka7SnC0vuHZ3ptqQ3ghskwHcPQKSMbxV+7P8btNCQviv75jQU9o/qFRbhF2XUTNS+Qc4BtwtnE/Lvguo1ceZnaIQpK8RgQOlgihnvThAsXus7SPKfcgffX5kkYyiGOXXbx2QJxfndKopRgwym112xa8FNEwzOrYtKVSvsBMdlVPdMU8DUD5IC71mZYK1dAiaf36QUz9dW9Ibj8wULgR/OF2sGOXtJep8iC0/Ojd/ofmjfcQ6auj/jtREgrlK4jtSKwjsePgcVhq0mct+jNAElovWmy7MJ56cWAm7WgJ4SB1cTtaNxVMRhkgBJ56PKWV0JQu0xlZJ3NKA+xU4uPGfsFxXuV7VktmRigNpPV6h9vd5f9Pnphg3l+tgavj+Od6om9EpHzRTvSpjYzzG5471C9FMY+oSzEOq9q8Xn4COFLTJb1VuaMekZAgG+uBTdDVleFXWQy0PRNyCjZ1KPO4+wlaQ8xlZQ30GD3yei8xfzDp6Etd01YNcd7ZPo5U2jfWg==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:PH0PR12MB8800.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(10070799003)(376014)(7416014)(921020);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?laYgr3IxhCpx4j5kAcCot2E/Vds0o6kWWRSkjhyWLUWD7KnDgH7Y1ZuPn3NN?=
 =?us-ascii?Q?T7vC5+3ZaVnxRrdvyxx4Pk32wCA36ghzy+a7JPqKAgl/W6+ER1Gweb37TUlG?=
 =?us-ascii?Q?jbKLI3PtNYWB3vftGBA2zzxthZoh8cTCK1+iib+/D5uiOGZl3t/iu3gn52gG?=
 =?us-ascii?Q?6vdHH07a8CbBy8eX4hheIn+vKX3n8lCq+lScXOLywYvX5liTqyIobDDoHMxg?=
 =?us-ascii?Q?6/gdi8l94txKeW83Mpcn0rlrO2NZH2Wp+Xk9wwgBXl5m/yt5kpglcTqtX2uZ?=
 =?us-ascii?Q?bT2KRNx2B70ebitdNXc7JT83lyPk2H0/NEEZnmgauUaSD5EanlTM3rK3UMqf?=
 =?us-ascii?Q?VkZigj7W40REEgNAR+EZ2HoJEo2CCUHGldupvDrYdF/LeoC4GxS0mCufNpqi?=
 =?us-ascii?Q?+aroeTwNAV6oVuTfxshUYht6iSJAbIqVmtGmA+r9FfQ3NuOLqp7ehdd2OlFn?=
 =?us-ascii?Q?A+QTYT5DPXpU3Hjo6xbFRIeE8AzUnMeKNBdZVPJkA6MWofZ9AYvgvUfZzPSz?=
 =?us-ascii?Q?sMymeQ7yWdKdLd6lGxVL85nafColRy16aCzvBn5TqjIZwNlidpdNvFGY/RkH?=
 =?us-ascii?Q?ByLtJLcNNzgSr6mzWuPV3pm8Tq78hEGf2c2zMcdBlgH3dQwYa4JELCG+U0QR?=
 =?us-ascii?Q?KNTPwFJsRLv79MiuTHxxERMUXifaB9lRVVu9UeDeNnJnEf/oxfze9tHsxHHX?=
 =?us-ascii?Q?b64wyrpfq/5VWiLD0J5dKLbXcc6EB4OGeOWjKLxWdgTDWeyTMOTeNZtY4ltN?=
 =?us-ascii?Q?ilPrVnS9iVOlvhXSPF7inNdbpo3Qm9NdCiOftJtFr2pPTkkAUpJA1ddJsXHW?=
 =?us-ascii?Q?JV6H/5RL11cKVVtX91ibKZW07gLklZ5KG4OyZVmXf4qe+mwinGs5hhPDkCse?=
 =?us-ascii?Q?jwWtnKoExLGVTa9af5q3IRkESQZPeqRo3zvPV+tSSCrkkxO2DndjGFfQ3JSg?=
 =?us-ascii?Q?Tr+X9j8APyhcmfV+sT35H623x8I+h2YG1YdyewmmAkOxFzlp4e6RbzSSc5Ob?=
 =?us-ascii?Q?OhRz9+x2brAanr8h6fQ6kt1vX142wIyXIgoc4QBML58szqTKyEb1PjZS5QBc?=
 =?us-ascii?Q?IGl72nmkGzGrla/30UhPk/Uk33V77V/BS1KRwEOX+CNDXPxYD66C7bkUy265?=
 =?us-ascii?Q?2NWweaA/3yE0QY6orrpYKP4HQkb7VMgIOSBcOrDDk3lWK3TFyZ+sDvzNjYxL?=
 =?us-ascii?Q?nm6bQz7vMBlpbXKeCxouxHVtOmcvE2fEMdscirYsTU6RAkz6L5C0/LUezw+z?=
 =?us-ascii?Q?nQp3DS4x2tyD8sxYQyP2uTg3WJ+YIZS6GxlSQnNW3Bn+uBTZIt1EQYfSGZP7?=
 =?us-ascii?Q?ZIKGDgE2LTKC9RAcM9vVm3ZrvQDc7QoTNzUX41ttr3w+0g5s2Ji/gr/FyIbu?=
 =?us-ascii?Q?P7dG/cNYnnHQWq1o/DNFXBkEgSuY0o+vqJAZ8Jf0lzEsVlk345/poEQdlA+o?=
 =?us-ascii?Q?hf7PiKHDScKqE5Jh60nN78knkAj/oylR+TlFMCg5/D4EEUPCefP7ZnEcun2z?=
 =?us-ascii?Q?MYVGRd3uvVYU0vGTjb2jG3qb1vNYn+t1o7HdK9vymM2TtVhUxW/WJCirhuSf?=
 =?us-ascii?Q?pBmPscEsjuKH6aBdjXXDMv3/Yppc3XNC//+ObZWvq+DMuyIJ1uW3TvNFNzqO?=
 =?us-ascii?Q?fqHS0tbuUjJTX3ZASi+GQksg6JnUmNeG20CRLeFgzok2+suplVFdaKt7My4q?=
 =?us-ascii?Q?M5LyApib5nySpUtA+JaA2HSpBZrb14KDYPS6cyXnhX6yIyZ950FBjV7x172A?=
 =?us-ascii?Q?dVBrYx1dTkPYSm7toKzWE1J8W0h+zMjBquMe0kBK99qsGkl+aDlG?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a668991d-ff9b-4dbb-7daa-08de798d35a8
X-MS-Exchange-CrossTenant-AuthSource: PH0PR12MB8800.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Mar 2026 01:27:33.1912 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NuFdHRQ+7R7JZVi6h8G6FO97rJSCcjNiBcJaG0+UNpDidCcb/D65BlFnnGxlBYVv7Gy4M0KiWg0X+ktiM9h16w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6651
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Switch KVM code to using the macro. No functional changes
 intended. Signed-off-by: Yury Norov <ynorov@nvidia.com> ---
 arch/s390/kvm/gaccess.c
 | 6 +++--- arch/x86/kvm/emulate.c | 4 ++-- 2 files changed, 5 insertions(+),
 5 deletions(-) 
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
X-Headers-End: 1vxb1k-0007YB-Fq
Subject: [f2fs-dev] [PATCH 6/8] KVM: use rest_of_page() macro where
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
X-Rspamd-Queue-Id: A4D401F9460
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

Switch KVM code to using the macro. No functional changes intended.

Signed-off-by: Yury Norov <ynorov@nvidia.com>
---
 arch/s390/kvm/gaccess.c | 6 +++---
 arch/x86/kvm/emulate.c  | 4 ++--
 2 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/s390/kvm/gaccess.c b/arch/s390/kvm/gaccess.c
index 4630b2a067ea..40f85b7eca63 100644
--- a/arch/s390/kvm/gaccess.c
+++ b/arch/s390/kvm/gaccess.c
@@ -973,7 +973,7 @@ int access_guest_with_key(struct kvm_vcpu *vcpu, unsigned long ga, u8 ar,
 	if (rc)
 		goto out_unlock;
 	for (idx = 0; idx < nr_pages; idx++) {
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpas[idx]), len);
+		fragment_len = min(rest_of_page(gpas[idx]), len);
 		if (try_fetch_prot_override && fetch_prot_override_applies(ga, fragment_len)) {
 			rc = access_guest_page_gpa(vcpu->kvm, mode, gpas[idx], data, fragment_len);
 		} else {
@@ -1015,7 +1015,7 @@ int access_guest_real(struct kvm_vcpu *vcpu, unsigned long gra,
 
 	while (len && !rc) {
 		gpa = kvm_s390_real_to_abs(vcpu, gra);
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpa), len);
+		fragment_len = min(rest_of_page(gpa), len);
 		rc = access_guest_page_gpa(vcpu->kvm, mode, gpa, data, fragment_len);
 		len -= fragment_len;
 		gra += fragment_len;
@@ -1237,7 +1237,7 @@ int check_gpa_range(struct kvm *kvm, unsigned long gpa, unsigned long length,
 	int rc = 0;
 
 	while (length && !rc) {
-		fragment_len = min(PAGE_SIZE - offset_in_page(gpa), length);
+		fragment_len = min(rest_of_page(gpa), length);
 		rc = vm_check_access_key_gpa(kvm, access_key, mode, gpa);
 		length -= fragment_len;
 		gpa += fragment_len;
diff --git a/arch/x86/kvm/emulate.c b/arch/x86/kvm/emulate.c
index c8e292e9a24d..c060d1e2bb94 100644
--- a/arch/x86/kvm/emulate.c
+++ b/arch/x86/kvm/emulate.c
@@ -864,7 +864,7 @@ static int __do_insn_fetch_bytes(struct x86_emulate_ctxt *ctxt, int op_size)
 		return rc;
 
 	size = min_t(unsigned, 15UL ^ cur_size, max_size);
-	size = min_t(unsigned, size, PAGE_SIZE - offset_in_page(linear));
+	size = min_t(unsigned int, size, rest_of_page(linear));
 
 	/*
 	 * One instruction can only straddle two pages,
@@ -1372,7 +1372,7 @@ static int pio_in_emulated(struct x86_emulate_ctxt *ctxt,
 			address_mask(ctxt, reg_read(ctxt, VCPU_REGS_RCX)) : 1;
 		in_page = (ctxt->eflags & X86_EFLAGS_DF) ?
 			offset_in_page(reg_read(ctxt, VCPU_REGS_RDI)) :
-			PAGE_SIZE - offset_in_page(reg_read(ctxt, VCPU_REGS_RDI));
+			rest_of_page(reg_read(ctxt, VCPU_REGS_RDI));
 		n = min3(in_page, (unsigned int)sizeof(rc->data) / size, count);
 		if (n == 0)
 			n = 1;
-- 
2.43.0



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
