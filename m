Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id C059791EF4F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue,  2 Jul 2024 08:45:34 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1sOXGa-0005PD-H1;
	Tue, 02 Jul 2024 06:45:28 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <liaoyuanhong@vivo.com>) id 1sOXGY-0005Ov-RI
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 06:45:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Content-Transfer-Encoding
 :Message-Id:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=4UQCj22NUmAFr+B289w93+ZVGx0u/LTME6FJQQqL1Jk=; b=EKRBL3TXwTOJmJ1YCDSreci/2u
 Z7c5iIiBOXPUMqjGb+ihYX+xdy02O28fxLKzDTNHkBOMlBW0NKuj/RWM4WdqnQgjFOdGVlpykM6Mw
 QAwDUGMHNnFD74qUQQFCwreEOou1NkrFhWD6GVYYBY2149Jaxwv2mJ/bmYwdNWjYsBw8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Date:
 Subject:Cc:To:From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date
 :Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:
 References:List-Id:List-Help:List-Unsubscribe:List-Subscribe:List-Post:
 List-Owner:List-Archive; bh=4UQCj22NUmAFr+B289w93+ZVGx0u/LTME6FJQQqL1Jk=; b=N
 /fSQUCPaNB5kALSe5r8phmxMdvnhv+qpjN4Ow51IoMFas5FPAJxR5kTHsuONncSxAJznehjPtzxFC
 fVbNO6oMaiDIHt/4RQOEmVDgkBy9Wwdsypzo4cBVlFrPxURzBk1+anaOVGTAS4Jw9YmP8xadnWFIA
 SIjc8/3gn88a1tWI=;
Received: from mail-psaapc01on2051.outbound.protection.outlook.com
 ([40.107.255.51] helo=APC01-PSA-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1sOXGY-0002v2-NB for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 02 Jul 2024 06:45:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=B6elZX5ESTHgItUZb+EziIiHWP9ilQDPDuNQmPlYUgqkM+wLyXGlMj2BtooR1XvrD0mVkwWogzI5gn69E8vYoeYqhhSZ7KjIaGPOGMD9f49p9Kb/X3fm+2LBb3L/w3FNAP923bkiJ911EW2p0fPINBzl7Pqi5hEdDpwOKJvECEtsoG2shfqRTwOw7gu16j90nW5QGFkVlCtRNZOCQeBGDM+ZCtZLrNx8gxKYHkmjQVErucnc9ItmFE1BhVUZRwIJXuCXTY5Wqw+jwWOHtiZD2H3bANdh/y60kgAzH1QCULOQVZND+wNKvmIOdJpU+pbbtlirr+mGAIlNzgs0I2DJ4w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4UQCj22NUmAFr+B289w93+ZVGx0u/LTME6FJQQqL1Jk=;
 b=KxaMRS2R4iWP+MR3tpdx1zymsOuHHpN/PrCjodoVJrMW4+UpuP/sR6bMmkvhZGs3b38fK36BBCYAxQwylSBxZBdS8OGmKHWRpslWT2Yl4FBlkOSJ8RPDKwwZYAFbGQe6UUPayqIJKMMHPQTxpNTYnsRcKKoPZSDbLiDUAE+0xc3o4q7gR7gGFokFbZ9Z/UdVNw/tSEPsLbUrkmvNr/npx7+DDiFXJgsj2fgTEncqtxHjG2+Akc7Mgvm/jPp8wZQYBnCfkWaRhkVtMpa/607Fg6JYyQBPubm2plqYgnxaGR1j/8JO8eb2KAvIC/yXfz1LRmmXJDSFkmafvoFOimqbxw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=vivo.com; dmarc=pass action=none header.from=vivo.com;
 dkim=pass header.d=vivo.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vivo.com; s=selector2; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4UQCj22NUmAFr+B289w93+ZVGx0u/LTME6FJQQqL1Jk=;
 b=YA4RHklHDz93ahR8PQva6tCsJ5j4DoUA2b7Hwzu+PyEm4GTQhQT11+E7akCY0JqweKXCoNAG/J5ET4+oY2j3mPO/Bhd0ROr/ELcf/Ofo64HC+21SgIpyw0vpykR/k53Yz+sbXUaALwUErX/BGiyXaQaondIYm7bfjgOx1ACSz4z+4c+KiqgGVW/9kZkMGmGsKznR8YrPbf14M5cA0clClnREBc34J3tgSdYJDDWyLdJ/Stpv/zTxYB/BM/65/f81u6t+E+T7h0PrRl1qXFhiay/aZFSvxAnd3M5ojxqnveQ6nCZLdVXjld/dmPWDR3TZnd8+dB6T3ThuMudsShMErw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=vivo.com;
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com (2603:1096:101:c9::14)
 by KL1PR06MB6818.apcprd06.prod.outlook.com (2603:1096:820:10d::5)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7719.32; Tue, 2 Jul
 2024 06:30:04 +0000
Received: from SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6]) by SEZPR06MB5576.apcprd06.prod.outlook.com
 ([fe80::5c0a:2748:6a72:99b6%6]) with mapi id 15.20.7719.028; Tue, 2 Jul 2024
 06:30:03 +0000
To: Jaegeuk Kim <jaegeuk@kernel.org>,
	Chao Yu <chao@kernel.org>
Date: Tue,  2 Jul 2024 14:29:52 +0800
Message-Id: <20240702062952.28859-1-liaoyuanhong@vivo.com>
X-Mailer: git-send-email 2.25.1
X-ClientProxiedBy: TYWPR01CA0022.jpnprd01.prod.outlook.com
 (2603:1096:400:aa::9) To SEZPR06MB5576.apcprd06.prod.outlook.com
 (2603:1096:101:c9::14)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SEZPR06MB5576:EE_|KL1PR06MB6818:EE_
X-MS-Office365-Filtering-Correlation-Id: 0393bbf9-3527-4a31-9f93-08dc9a6067e3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|52116014|1800799024|366016|38350700014; 
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?1Sgx/JJ4O1T2lZuJtcCLuhV568ADyzgR82R3yOocxOzNTF7qQv1PjvUVNW3T?=
 =?us-ascii?Q?sN0B4ciRCCefHL0UqmNkruXktQTc0Eq6VRKzWON50PjOVmGf7b1yVEcO7dQf?=
 =?us-ascii?Q?2cT7CEHVclJu9lsGnO+fLA5wH6Z/zOtD7l2jgpb2PmJL8JO1vd4TpD3OhLL8?=
 =?us-ascii?Q?Ynpvvz9n6UOhCczIvpGTB6K6n/rL5MOn59HUYZMU5DvWueS6dByGdYeMwy9l?=
 =?us-ascii?Q?UW4F+Ck3VjCIvLZUzXuTbIQCOeVu5ZVP73h281vr5sxN4tqlCjX/I5jww7jy?=
 =?us-ascii?Q?t+a5L4DsRMeyL+R3ACmkc5WIyBvhKQ6m+NdtacHLwouwms339Nk+4MpK3pbP?=
 =?us-ascii?Q?qKw2+1DTEgU0kMxjdTjkgfjwqhGlFzRpxdim5ABckBNdBsbM6Yo8FKqGHwjW?=
 =?us-ascii?Q?9P3WBMasEcHA8c7qMgYwHoOQFALcC8J0Q4oGzBIuHeRSj/QrVKV/pMDDICLH?=
 =?us-ascii?Q?gQjml1YYTdZuQC0qXSG1B98WUvBpWss+oiPUBlwHFELs2R5tUPYJOZwOFGy7?=
 =?us-ascii?Q?UtAfdOf/lipSkvhqFsqgO8y3rLSPqlfDJkvOOhveizf2DGpSPo55ibBJ1uA2?=
 =?us-ascii?Q?zjHpx5fkFq6lBhpvqS1dQihtZLMak4l59J6EgBYVMlbPuGMXaoGBi3C1EJAv?=
 =?us-ascii?Q?lAOu58jNCSoO201QJvqUv4A3IdCwheGkIAaj1vMWdFS5DQ4x9itf0ULsmTQo?=
 =?us-ascii?Q?XmRwbzGoCGL4syqCuPAP3Nix0413LLrXowmFr9uhq9FfY6fY9m9i2gSc4UQn?=
 =?us-ascii?Q?WMa4KGE7Kuz+AOkZzORsYUSBcgl0heutGgu+ZIzNzmWjsh86IuXy+aIk4zxb?=
 =?us-ascii?Q?Rqcb6jIa/MzVtq/04OWD/IBBN20voeLVk7LZa24ueCkqXErVcs79OgQNW0zo?=
 =?us-ascii?Q?vnQydZ6hME6q90sraN2k+oDY2eqGqvn8bzlaZ01Xiwpe7HuIpQVhnV/DQ4a+?=
 =?us-ascii?Q?m5ia9ZRf7EsECqLVFHMqHRhgYVNxktyOUkQ2x9V38ZMRPsMr8Y5LGVAYsMR5?=
 =?us-ascii?Q?WMxoBpWyQWPQl2bLM//p+4IyloHas8cdIARJrP01vV0UwxqalhzizaTXX6Fk?=
 =?us-ascii?Q?VmgzWr0492zEtjn3g7302mzA9U04t+q5qYDT2kpdsp5guHFBESWMmt1FU5F3?=
 =?us-ascii?Q?WirsvbYKohI5WUF1H3QOdMO66bvtTkOo6DoVIXOqrTcp0yea9nctnHWAingy?=
 =?us-ascii?Q?VMi2AgBpRG176T+sPM9y58+geUo4yVrvSNSiJD+0lStYa4DNoy6nzc9F/Xq7?=
 =?us-ascii?Q?aKRLwsMEDxrAw/5XsCHjiIU2IofAomFZpbLWaFow4kJ+cTypmiJ8dWPHEy1I?=
 =?us-ascii?Q?3QoltLFnPzexpkcGNKhJ8NoI55mB/522YES+fA8Kbl3VW7z5kt/jCJs9lZjc?=
 =?us-ascii?Q?lKqTZz1v/6plI109MyyenL6IQef0xT60UZ+taMA19yK8j4nqMA=3D=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:SEZPR06MB5576.apcprd06.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(52116014)(1800799024)(366016)(38350700014); DIR:OUT;
 SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?5oOXeZzFn5idc3VicwqgTpn8bgE2vsyF35ezBtbdPSWcX3YicbY7g81e2kbq?=
 =?us-ascii?Q?/bcAUbsTWzWyL0aUCfbQwGXITkKEAGrZgmkji2geDrWtj7kBjli1Zki0wbMZ?=
 =?us-ascii?Q?dohVaQGZxP6oP8YccdTnsEGj61sX5JVUanUQ94h085FfkwitQELIfoO0hmv2?=
 =?us-ascii?Q?8VgruhaQrWkcZZj1Uep+iagG1PkzajA4YbIUshpcrYUz+UUuVEr98z81VAce?=
 =?us-ascii?Q?k82dXfLuZCzkrKD4pLu5Cbe/KNr+KCeygjYH5VyM7cvle/VZwhW03ZtmGp5N?=
 =?us-ascii?Q?tef8PlIYab7IZaZ4x1uYtcmx0AR2QQt/g/9Gd828B9huQPSwrHJaGAHxNf9J?=
 =?us-ascii?Q?q6k+jtcrdWU7CBdIBnOcQjJP/LpKN0GEUKdzcqxCGiTHU9OHE+xYN31ykONo?=
 =?us-ascii?Q?4OvaALBEQSPCThb8Pces/NIy8jzSih7RaWUuy+jvFd6Q8XZYevIqy/X3bBMV?=
 =?us-ascii?Q?kydtYKxhcFbNV9P2cYXOu61ygh7KY6+to6wwA7Vc2rYLKiEH2/g72FfEI/Vg?=
 =?us-ascii?Q?K/X7QnKCKVyFic1cVx9mN89RsitV8QVVGe/PO98EUULeMKnf8kkhwMtuqOQZ?=
 =?us-ascii?Q?t+3bR6h41M2QHTs7s/niyYa/yoUXpKaRO0JnA0LUK5d0QN+IG9/8nnUtHDzQ?=
 =?us-ascii?Q?bhrgwcT1J28zdEAHiXvmX2emlAcVI8NlpqtSipziym9o/EaplgulJ9SnIQO/?=
 =?us-ascii?Q?ptPfLpRNDGLgsFhvHFIwz2CzPeO01lfoWsNugU99/pUJmuU38s44hpcjXq95?=
 =?us-ascii?Q?STA9cSGqKiXBixqjX9uEwklMclKAlTmUfHfYUpmo31ubOY9VEmeWXU8lgny0?=
 =?us-ascii?Q?nLFoLaufd3BSUt44ne6s9aceZgvJDFFDhYF2ONWBqqo6tOcKKiktI18/jmSe?=
 =?us-ascii?Q?T+6c+EAeNCoLHLCvvwv2EvbhMb6mZ4JcNR7v1P6gthLEJAfRsTtZoV2/jf0v?=
 =?us-ascii?Q?5rrf5xo03ianfuYvmxGSzo74mPpDX0fVSjNgLBd9esBQu/40FgJwC6hvd8KV?=
 =?us-ascii?Q?W3tbvY/kWo9Fq0ejpKCVCfNpJAptRH7zdC2t82OOhrBj3NlD01YkVgZdAJGN?=
 =?us-ascii?Q?3vBdGtokMC6+iJDXNECgTCGF0U0NCc8nVOh9mYTVVWDDLcna1/mOhXFrM0Wc?=
 =?us-ascii?Q?Z0UZBjH6P/BmX9wXSVQraqbLMhRlGcIsTtMPcEzrx78qPRnnpOBZiXt5H5lZ?=
 =?us-ascii?Q?iMcVkzMgr84Avi7OhCoY67f+EI2u3oQ80Ev6eOTVHEawVwGZYSY3CyvJ7/Mx?=
 =?us-ascii?Q?Y8utMDRWyQkEZAoQ/MzQnFQmpvLyNeT+eeedU5hRuuhtiRAGmxh/f9y+YI+K?=
 =?us-ascii?Q?M0Ajt29yu27HSygimTmgegF198KWyz2NRxbMUpQA5FT7Obj35QtS4EO5ADyh?=
 =?us-ascii?Q?efZoZ/ly8bTjaLDBdFa94AeNpkDicN1BreoEgEkFqArozUWppH9IQvCdeM6F?=
 =?us-ascii?Q?EO2bVFGwwE8SzVb6JBd4e5FyI2c4DsGWTI4nSLUOMZbEzJhRLsBx849xybGp?=
 =?us-ascii?Q?hagZsiyjBDd7rwwiVi2Exxi9Yg8NfMvchVuVg8rdWbzD3zuvhcun9TzmicK7?=
 =?us-ascii?Q?e3Dw2I0lS3e4JrIZROrVSGaeZP6Qk01xO9PTSusz?=
X-OriginatorOrg: vivo.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0393bbf9-3527-4a31-9f93-08dc9a6067e3
X-MS-Exchange-CrossTenant-AuthSource: SEZPR06MB5576.apcprd06.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Jul 2024 06:30:03.3031 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 923e42dc-48d5-4cbe-b582-1a797a6412ed
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/lTFYNax/O154c3FYJ9w60FZfJZ4UVhHuB4Yu1cg54PezU7SWVmifzglgOsS1jc1v+t/L1okkpvw+0iRXECYA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: KL1PR06MB6818
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Currently, we are using a mix of traditional UFS and zone
 UFS to support some functionalities that cannot be achieved on zone UFS alone.
 However, there are some issues with this approach. There exists [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 HK_RANDOM_ENVFROM      Envelope sender username looks random
 0.0 HK_RANDOM_FROM         From username looks random
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to
 DNSWL was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [40.107.255.51 listed in list.dnswl.org]
 0.0 URIBL_BLOCKED          ADMINISTRATOR NOTICE: The query to URIBL was
 blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#dnsbl-block
 for more information. [URIs: vivo.com]
 0.0 RCVD_IN_VALIDITY_RPBL_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.51 listed in bl.score.senderscore.com]
 0.0 RCVD_IN_VALIDITY_SAFE_BLOCKED RBL: ADMINISTRATOR NOTICE: The
 query to Validity was blocked.  See
 https://knowledge.validity.com/hc/en-us/articles/20961730681243
 for more information.
 [40.107.255.51 listed in sa-trusted.bondedsender.org]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.255.51 listed in wl.mailspike.net]
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
X-Headers-End: 1sOXGY-0002v2-NB
Subject: [f2fs-dev] [PATCH] f2fs:Add write priority option based on zone UFS
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
From: Liao Yuanhong via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Liao Yuanhong <liaoyuanhong@vivo.com>
Cc: Liao Yuanhong <liaoyuanhong@vivo.com>, linux-kernel@vger.kernel.org,
 bo.wu@vivo.com, linux-f2fs-devel@lists.sourceforge.net
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

Currently, we are using a mix of traditional UFS and zone UFS to support 
some functionalities that cannot be achieved on zone UFS alone. However, 
there are some issues with this approach. There exists a significant 
performance difference between traditional UFS and zone UFS. Under normal 
usage, we prioritize writes to zone UFS. However, in critical conditions 
(such as when the entire UFS is almost full), we cannot determine whether 
data will be written to traditional UFS or zone UFS. This can lead to 
significant performance fluctuations, which is not conducive to 
development and testing. To address this, we have added an option 
zlu_io_enable under sys with the following three modes:
1) zlu_io_enable == 0:Normal mode, prioritize writing to zone UFS;
2) zlu_io_enable == 1:Zone UFS only mode, only allow writing to zone UFS;
3) zlu_io_enable == 2:Traditional UFS priority mode, prioritize writing to 
traditional UFS.

Signed-off-by: Liao Yuanhong <liaoyuanhong@vivo.com>
Signed-off-by: Wu Bo <bo.wu@vivo.com>
---
 fs/f2fs/f2fs.h    |  5 +++++
 fs/f2fs/segment.c | 23 ++++++++++++++++++++++-
 fs/f2fs/sysfs.c   | 13 +++++++++++++
 3 files changed, 40 insertions(+), 1 deletion(-)

diff --git a/fs/f2fs/f2fs.h b/fs/f2fs/f2fs.h
index f7ee6c5e371e..7ba782bd15b2 100644
--- a/fs/f2fs/f2fs.h
+++ b/fs/f2fs/f2fs.h
@@ -1781,6 +1781,11 @@ struct f2fs_sb_info {
 	u64 committed_atomic_block;
 	u64 revoked_atomic_block;
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	/* For adjust the priority writing position of data in zone UFS */
+	unsigned int zlu_io_enable;		/* data write mode */
+#endif
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	struct kmem_cache *page_array_slab;	/* page array entry */
 	unsigned int page_array_slab_size;	/* default page array slab size */
diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index 4db1add43e36..327457c28700 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -2686,17 +2686,38 @@ static int get_new_segment(struct f2fs_sb_info *sbi,
 			goto got_it;
 	}
 
+#ifdef CONFIG_BLK_DEV_ZONED
 	/*
 	 * If we format f2fs on zoned storage, let's try to get pinned sections
 	 * from beginning of the storage, which should be a conventional one.
 	 */
 	if (f2fs_sb_has_blkzoned(sbi)) {
-		segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
+		if (sbi->zlu_io_enable == 2)		/* Prioritize writing to traditional UFS */
+			segno = 0;
+		else
+			segno = pinning ? 0 : max(first_zoned_segno(sbi), *newseg);
 		hint = GET_SEC_FROM_SEG(sbi, segno);
 	}
+#endif
 
 find_other_zone:
 	secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
+
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (secno >= MAIN_SECS(sbi) && f2fs_sb_has_blkzoned(sbi)) {
+		if (sbi->zlu_io_enable == 1) {		/* Write only to zone UFS */
+			hint = GET_SEC_FROM_SEG(sbi, first_zoned_segno(sbi));
+			secno = find_next_zero_bit(free_i->free_secmap, MAIN_SECS(sbi), hint);
+		} else
+			secno = find_first_zero_bit(free_i->free_secmap,
+								MAIN_SECS(sbi));
+		if (secno >= MAIN_SECS(sbi)) {
+			ret = -ENOSPC;
+			goto out_unlock;
+		}
+	}
+#endif
+
 	if (secno >= MAIN_SECS(sbi)) {
 		secno = find_first_zero_bit(free_i->free_secmap,
 							MAIN_SECS(sbi));
diff --git a/fs/f2fs/sysfs.c b/fs/f2fs/sysfs.c
index fee7ee45ceaa..bc9e5e8bb749 100644
--- a/fs/f2fs/sysfs.c
+++ b/fs/f2fs/sysfs.c
@@ -627,6 +627,13 @@ static ssize_t __sbi_store(struct f2fs_attr *a,
 	}
 #endif
 
+#ifdef CONFIG_BLK_DEV_ZONED
+	if (!strcmp(a->attr.name, "zlu_io_enable")) {
+		sbi->zlu_io_enable = t;
+		return count;
+	}
+#endif
+
 #ifdef CONFIG_F2FS_FS_COMPRESSION
 	if (!strcmp(a->attr.name, "compr_written_block") ||
 		!strcmp(a->attr.name, "compr_saved_block")) {
@@ -1006,6 +1013,9 @@ F2FS_SBI_GENERAL_RW_ATTR(dir_level);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_enable);
 F2FS_SBI_GENERAL_RW_ATTR(iostat_period_ms);
 #endif
+#ifdef CONFIG_BLK_DEV_ZONED
+F2FS_SBI_GENERAL_RW_ATTR(zlu_io_enable);
+#endif
 F2FS_SBI_GENERAL_RW_ATTR(readdir_ra);
 F2FS_SBI_GENERAL_RW_ATTR(max_io_bytes);
 F2FS_SBI_GENERAL_RW_ATTR(data_io_flag);
@@ -1153,6 +1163,9 @@ static struct attribute *f2fs_attrs[] = {
 #ifdef CONFIG_F2FS_IOSTAT
 	ATTR_LIST(iostat_enable),
 	ATTR_LIST(iostat_period_ms),
+#endif
+#ifdef CONFIG_BLK_DEV_ZONED
+	ATTR_LIST(zlu_io_enable),
 #endif
 	ATTR_LIST(readdir_ra),
 	ATTR_LIST(max_io_bytes),
-- 
2.25.1



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
