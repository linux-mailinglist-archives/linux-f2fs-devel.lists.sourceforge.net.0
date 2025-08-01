Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B25EB18516
	for <lists+linux-f2fs-devel@lfdr.de>; Fri,  1 Aug 2025 17:36:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=co7qT9ZYDllV/dfHRfTHEVNPKIqR2VQoay5nKsNWWkM=; b=ljVRPjxLpJ7hkuMIhR6K/SOCvG
	IMHWEHLovmmbiEGESXScFaPXDjRJfrk7qqc8rWLFsJf3/JXQXmrwALYVl8kbPLpSNVD7SssC+O459
	bKVLvQ2CiEPGqveuKuiux80EY45nnfdHi/6/9s7IBYKhtcKOaD56C81bniIewLxvfFUQ=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uhrnn-00030S-Ma;
	Fri, 01 Aug 2025 15:36:11 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <jgg@nvidia.com>) id 1uhrnl-00030J-N6
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 15:36:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Rt/M3svWgTjCDi1RQUj3qb7LyI/mcYjTVEYAqEdno7U=; b=VBMesM1jgAT2hSObyZzOPPNdk4
 B9UN81rG0BFNSNJopgRJJgjB9td2qZJVweweyvdS8LCzoPkXHVf475bd7s1fEZEIj1cbo2VTWPHlD
 GRKm+fFApTY0MI8vvN6HwSjvZpUceIy0HsLpvk7x/+7SKOnBapLZUqfX6GqtHpGJuS4U=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Rt/M3svWgTjCDi1RQUj3qb7LyI/mcYjTVEYAqEdno7U=; b=mGSlfX8skGKLffoFxCRPx5yvka
 J9piYgDy9iOyusMtwcOosbvQjS4PNUkbo2fPAVu3uvZ806h+xqtlPNji8fr1LdWzUrzRbtzaZLASm
 OUEndXj57G4X03vFxAKMg5u9bunN/Io8tRMSls26StGvli6nXJof6susKWeUpe6JraM4=;
Received: from mail-dm6nam04on2056.outbound.protection.outlook.com
 ([40.107.102.56] helo=NAM04-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uhrnl-0001KQ-9M for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 01 Aug 2025 15:36:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=KsqsH5pACeGuL8X//9JZXxmH90cEneVCWmdN9tfOd0M287DkasBJBoT3GkoMS2UDLBEuEITZSywqfi+8jeZCkt+cF/RnnNohNFIMJu9yc3USUVngxzalfc2xnwhoSyJ2MGNWjv1P1o7gOfW3nd7J/tB7TlMK7BZVTruz0Bgh4HPCPCMzMajPMu4yv1e221RE915KwZtTsqPxO0qoCiJofjscqnutoGOXWHbq08gV8YdDJs3dp72ZTu5Zr7L9iXsU4JpTcceMbiDnsQuZYMghIv778y4IXGMV9ruZAscF5iMrFD7rMkq2dk2i6MgRObaGb3NonW5OHoj2gLUj/5SF6A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Rt/M3svWgTjCDi1RQUj3qb7LyI/mcYjTVEYAqEdno7U=;
 b=DCVeD32an78Lsc/OZYYCg9BEJhQ2PS9n6Ditsp0BygV6ynendx1gmORd0b1jk2oIqodEiiP0+HuPm58ME3y9xMVrXoxrruLWmiqt78NWUvAYRmIhN0SPoKwTc67wsr60Xr3uB42E7YiRrGx5Hb4ACrJM2i84ilnLb6MfbMCkTMl/pb3rBezcaZEL2aYa27ZAxOs/LgH+9HUW56x87kb3qVyLgj3kDYIapGnjc4VS6zXLhYyra+l5MLarMVuZNN9I+sSx27caUqWVwGcng0gRHaJhDUzvFW3Oi/+tQZI8ZP8oCH54GMg7q82W7vYCAqc5BWFjhFPEB/Lh7lCVwsUyjw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Rt/M3svWgTjCDi1RQUj3qb7LyI/mcYjTVEYAqEdno7U=;
 b=PSIsFgI01jAoPjZquNgONb4yDHpG2Knko8cNfxBOLSJsIHKiGgRA295ICK3zIPXHo0B4iKHnUEd/yEBobrmnAqfvhrT5ntL29zfkQLH9usVmDeUDM6ZqsEdehRVRQPguctFrIzBMLQwFMuuyZhpw38M2Wyv4lO5guZ1OGUBm0hBvGz3MrjSijFJ6bH8aBQPkCrl7jTzr6jGgm5cX6+koRdKpFUlW08PQLIqUbkEuKwvknAVbbA+tC74dcYUPUaTu1UtaYUXJWsa1hfO9fMBSf3OxUYHiRCfPXxzLAbJBGNhLSdB+x3KPxlu3JT5zr+tLvngwAKApxrfJFW8lalXQnw==
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
Received: from CH3PR12MB8659.namprd12.prod.outlook.com (2603:10b6:610:17c::13)
 by MW3PR12MB4428.namprd12.prod.outlook.com (2603:10b6:303:57::15)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8989.11; Fri, 1 Aug
 2025 14:01:02 +0000
Received: from CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732]) by CH3PR12MB8659.namprd12.prod.outlook.com
 ([fe80::6eb6:7d37:7b4b:1732%7]) with mapi id 15.20.8989.011; Fri, 1 Aug 2025
 14:00:58 +0000
Date: Fri, 1 Aug 2025 11:00:57 -0300
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Message-ID: <20250801140057.GA245321@nvidia.com>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
Content-Disposition: inline
In-Reply-To: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: YT4PR01CA0094.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:ff::8) To CH3PR12MB8659.namprd12.prod.outlook.com
 (2603:10b6:610:17c::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR12MB8659:EE_|MW3PR12MB4428:EE_
X-MS-Office365-Filtering-Correlation-Id: a37152e6-539f-46d4-6f7d-08ddd103d734
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|7416014|366016|376014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?vI39CfqqpciPkPsBTDxIc7hsYNEIQLOLncZOFwL5irNaZqnVIzm+D+j0kSG7?=
 =?us-ascii?Q?cpbRZ1PDyfZZTNOW/mPmlqiSsCM0bedpyJPCzX2reKAiZZGr4k0Fp1HDC21y?=
 =?us-ascii?Q?5bwVtys0ze04p2s1SrSYwg3pUGnrJpSTqwxN1Ar0xQBwIRe07BEMfG/i5Nto?=
 =?us-ascii?Q?1UEmOK7QCDScRy8Mbu4LTEyEYJ/g/PCWxkIPMbR65omPzIJJ7XRY/UfEpQZV?=
 =?us-ascii?Q?R15gKSmFZ4dHo69FNB/muA9cwktFBHEc8s0QFiDcXaUrWCVFKu0a57lQVlHu?=
 =?us-ascii?Q?LVhBaZZz6ExJmeJbAmlnZ4EBMvNOcxjscc9uO3o50VaHCFg9DiATensJAitw?=
 =?us-ascii?Q?bh26BYdpGR5MKDfBieWEtl74AlLByl94T/4IoeAXxag3W71KsQRGZgHN0BwG?=
 =?us-ascii?Q?KMFO7Di9Djvohcg3xP8mqePeCM32WawzYwogMx3XIOR9AcDeYQBPZjrGSy8D?=
 =?us-ascii?Q?L2mXLYqjyZDNuioe1qoIUSff8EucEYDKOIbbMukzyjutOjGvOzhJdz48clGt?=
 =?us-ascii?Q?nG59YQ/HROWfFkTZ+N5XQobuLbhct7HG8kq5BRTjxp5TAdqsYYRLJvtbAtis?=
 =?us-ascii?Q?J41d0xqKp034jIhffbuEh/3kK+wAZ9EzmJcUg6NAF5JwzL+pu7I7JdG1ZH+l?=
 =?us-ascii?Q?0jmhlv/LSfBR+uijhK3XjGwyqHaPfeOD2/Lh3yaromKgOrX+YnkJDSw8yhYX?=
 =?us-ascii?Q?uDFniJKzdSr9KKpDoxCNeHXUL6YPDiQs0IV8o8X2hQtmurwj7GtSmjK/TKEP?=
 =?us-ascii?Q?2EzBPwNaruojw/k0cLTuWVT+9JLdQm6K0VBavQj8oQQfWvZchOaUl5cfJhkk?=
 =?us-ascii?Q?eiR12HfMKu3g8AdRvJlSbjDxdQ23OMjKkmvU4PL0EiQJ7X6olgGpPN4UOMGY?=
 =?us-ascii?Q?+l2WNZNQ42crMhlpF8g3DRlK5SyYZE52ipFfK53KuefcdSWUXn/7PZaqr+Cj?=
 =?us-ascii?Q?4E2ntY1AQBKb4O0eeYPADldCOS8LbTIBdHvHLcaj3oDQdvMkO5EybEobcBI7?=
 =?us-ascii?Q?HRcQFhRAII2Fs1tNTnfHvm9tS5pbtdHcD2CmG1AqATv76uNBpnH1l4dzq30A?=
 =?us-ascii?Q?uE6+6Fj3fm9ciF3yVghaP8d4XzWwuhq6ZIfXAUEudk4GEiMSqFgHWDwsGK2C?=
 =?us-ascii?Q?JQXIdqhAKkHR0tnO0i1vrtUHxBbRfE+XALHnHP0+BQlAQGuFujZMAHojgcke?=
 =?us-ascii?Q?zMb5EBblD3TERfpQMsxUkMZvpIL5A1fCRZ29vQw49zeFI7XSdGLoU8oXYAtz?=
 =?us-ascii?Q?1/cI7xAwVaz0ohHJlTF7rFEZ48wE/mu11+IPd8SvvGXUsRoumNG1cgP0UlwC?=
 =?us-ascii?Q?Ox5TTXbo4pA2XN4QnqDrYmKeLT+46hFmVWQBwf3aPjFQwGmMbRrlpXV1fwHA?=
 =?us-ascii?Q?mj+NFUcsph437tXfgYbB4IMHEZXTteS4VKq8Td18uDfMZWZN/U9WTOPBi02X?=
 =?us-ascii?Q?D1oIzNcqMRk=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR12MB8659.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(7416014)(366016)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?w10bs08ifbMst9RcDhZxfY1wg0Uz6Bxx2Y95qotAmDsjQrIDXT0ec9/bzTHV?=
 =?us-ascii?Q?9uSZsU1Dp3pllME1dGNC+NJdGxbHXQ4ZNLcpybxrR3PapFjWEl24113B+sQq?=
 =?us-ascii?Q?L75wClwqOmBAT/BhfbzW0fblb5jvsBNgBxpSoNM/dFC9hUMA5YxdipL1FafJ?=
 =?us-ascii?Q?euoiFRmpzl0eJfOmvQ+TzTVYsuFsCubUaDgb3Gh/x/aeiGjOz603SsKT/7wP?=
 =?us-ascii?Q?n4bNHD8RFL2SMfioVOUKxhU/PztVWXdT3Q0w5i1Lcoi9/mhzKa/UCLI2kn/A?=
 =?us-ascii?Q?BhXuZffD9DsjMeavjXbFMMGTF9GdCYW6mwG+9IILKAKSzlHp8EPxDmZvDtps?=
 =?us-ascii?Q?cfwg5vn/8QDdvSl5oEX8Yoo2PSZC32U9SwkHoMk07XKT7LQfx7WPJaBRBjwj?=
 =?us-ascii?Q?VGzkrdpBW+RwYZS3Ot7syBv6JyIbXn3JsSNiPOHBCWqHoqzMLIgNbcHlCWMf?=
 =?us-ascii?Q?lkQwG2M58VxLQrR7U77jbztMG8I4m/Hp+HtBlfFjr3pyniaxzxvPaYVRWi5K?=
 =?us-ascii?Q?eBp/+j04jNvpoTBqEJ2y6Z2QiSy0BHdDHEZzL1zXuq56RsNNrMFOIGggJbp5?=
 =?us-ascii?Q?t15ashWTn2on3L5WuV0yxGF68/fh3eseTJ+2As5WcPNLczAu3wNwzNImkj4q?=
 =?us-ascii?Q?2gdYAwalQ0MWWHSSzZQhwz58W8bI0IVEwB2ReYHZtGvMUtkeeP3L7/TMAtK0?=
 =?us-ascii?Q?HvyH7TZy8JtwjRtihICyR+tml0jpNU3bxEl3R2lEc4RT3DKWy7m7K5Hmog1D?=
 =?us-ascii?Q?IBmc+F1q0RiScLgrKXqj03i58EYiGmtEL1LBTpWDJAKElWzfPKoGgloM2A2f?=
 =?us-ascii?Q?Xp5KElUwJaKlJzGXH3PLV9S0HzI5xppJebIGsHqwedUU/M6SK+1bL2kE8ov4?=
 =?us-ascii?Q?lJ7ld1yoVnsJCMxG+P2Mg98WcfHaZA/f+mk4NwJS5GNzKa3JNmDqB9lYiatB?=
 =?us-ascii?Q?94Rrn2T/ngevftf2jKVsczsPI0Qd24/3S4qPQ2oxO5VXiULXNVeZpR+trcE+?=
 =?us-ascii?Q?RZ5hccnhvYRDcxYzvR8MMa71agM9F/qiJHKJ4Pvr4jMtSRqHSoKK/njRzxPh?=
 =?us-ascii?Q?E502jH5keViQ8G6gNxy7WcQ7btubtmxj+J107cw54mECx1OWQsWIt1HA+Av+?=
 =?us-ascii?Q?eauGDbHLcNJoLMbOjQHIukT38h8ymba1M2Nn2tEZRO+5XqOP8hLYYynJqS9N?=
 =?us-ascii?Q?VpfHEZHP868esxOi9V95kqc921Aw9aH6dk8b/8pxKvFQpaMPw7/ci05egSMx?=
 =?us-ascii?Q?U0UGM4TDOnVHiS1SUoeVRNKYY1ZqSsy1CcuSdhFHKRPFTaRSDnxmXUESXwt2?=
 =?us-ascii?Q?GVEelYVII+fZlnCTamfCCzKam7q4KciniAEKUmZeLPu+5Wug+Rb/xk8q3KzV?=
 =?us-ascii?Q?vxwsFLOzCkE8e8isR8jE6eQHi8gEkW6fSXLenuSLnzJR7xIoz5k7PqYDPTzh?=
 =?us-ascii?Q?snpAptOyEfPtJcK+eko/0NksHw1tDNA2H2KkzfrMbZmpQH3pM/v4Cy8+QvS0?=
 =?us-ascii?Q?2PNv5GNs3Y4BvmMUYbwF1thJKDIpHBhmxF1bCD2uRH/PpkjZk4XCixVlxY/o?=
 =?us-ascii?Q?PduvfoZxFMq0kd+Bnjk=3D?=
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a37152e6-539f-46d4-6f7d-08ddd103d734
X-MS-Exchange-CrossTenant-AuthSource: CH3PR12MB8659.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Aug 2025 14:00:58.4998 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NCPpk3AM48XA/POOSU0zCe+pvO7xmB70bIvT+bKdmAkO4GNiCDQrmS8fR5LTASJJ
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW3PR12MB4428
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Jun 16, 2025 at 08:33:19PM +0100, Lorenzo Stoakes
 wrote: > The intent is to gradually deprecate f_op->mmap, and in that vein
 this > series coverts the majority of file systems to using
 f_op->mmap_prepare.
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
 0.0 RCVD_IN_DNSWL_BLOCKED  RBL: ADMINISTRATOR NOTICE: The query to DNSWL
 was blocked.  See
 http://wiki.apache.org/spamassassin/DnsBlocklists#DnsBlocklists-dnsbl-block
 for more information. [40.107.102.56 listed in list.dnswl.org]
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.102.56 listed in wl.mailspike.net]
X-Headers-End: 1uhrnl-0001KQ-9M
Subject: Re: [f2fs-dev] [PATCH 00/10] convert the majority of file systems
 to mmap_prepare
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
From: Jason Gunthorpe via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, nvdimm@lists.linux.dev,
 Paulo Alcantara <pc@manguebit.org>, dri-devel@lists.freedesktop.org,
 ceph-devel@vger.kernel.org, Mike Marshall <hubcap@omnibond.com>,
 linux-xfs@vger.kernel.org, Tyler Hicks <code@tyhicks.com>,
 devel@lists.orangefs.org, Shyam Prasad N <sprasad@microsoft.com>,
 Jan Harkes <jaharkes@cs.cmu.edu>, linux-um@lists.infradead.org,
 Joel Becker <jlbec@evilplan.org>, Ronnie Sahlberg <ronniesahlberg@gmail.com>,
 John Paul Adrian Glaubitz <glaubitz@physik.fu-berlin.de>,
 Eric Van Hensbergen <ericvh@kernel.org>,
 Christian Brauner <brauner@kernel.org>, linux-kernel@vger.kernel.org,
 linux-fsdevel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Trond Myklebust <trondmy@kernel.org>, Dave Kleikamp <shaggy@kernel.org>,
 Sandeep Dhavale <dhavale@google.com>, Simona Vetter <simona@ffwll.ch>,
 linux-cifs@vger.kernel.org, linux-nilfs@vger.kernel.org,
 codalist@coda.cs.cmu.edu, Namjae Jeon <linkinjeon@kernel.org>,
 ecryptfs@vger.kernel.org, Yangtao Li <frank.li@vivo.com>,
 Jani Nikula <jani.nikula@linux.intel.com>, ocfs2-devel@lists.linux.dev,
 Pedro Falcato <pfalcato@suse.de>, OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 linux-block@vger.kernel.org, Theodore Ts'o <tytso@mit.edu>,
 linux-f2fs-devel@lists.sourceforge.net, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Martin Brandenburg <martin@omnibond.com>,
 Kees Cook <kees@kernel.org>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Carlos Maiolino <cem@kernel.org>,
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Chris Mason <clm@fb.com>,
 linux-mtd@lists.infradead.org, Jaegeuk Kim <jaegeuk@kernel.org>,
 Marc Dionne <marc.dionne@auristor.com>, Tvrtko Ursulin <tursulin@ursulin.net>,
 linux-afs@lists.infradead.org, Naohiro Aota <naohiro.aota@wdc.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Matthew Wilcox <willy@infradead.org>,
 coda@cs.cmu.edu, Viacheslav Dubeyko <slava@dubeyko.com>,
 Ilya Dryomov <idryomov@gmail.com>, linux-ext4@vger.kernel.org,
 Amir Goldstein <amir73il@gmail.com>, intel-gfx@lists.freedesktop.org,
 Damien Le Moal <dlemoal@kernel.org>, Rodrigo Vivi <rodrigo.vivi@intel.com>,
 Dan Williams <dan.j.williams@intel.com>, Gao Xiang <xiang@kernel.org>,
 David Howells <dhowells@redhat.com>, linux-nfs@vger.kernel.org,
 linux-mm@kvack.org, samba-technical@lists.samba.org,
 Steve French <sfrench@samba.org>, ntfs3@lists.linux.dev,
 linux-erofs@lists.ozlabs.org, jfs-discussion@lists.sourceforge.net,
 Jan Kara <jack@suse.cz>, linux-aio@kvack.org,
 Dominique Martinet <asmadeus@codewreck.org>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 Bob Copeland <me@bobcopeland.com>,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Joseph Qi <joseph.qi@linux.alibaba.com>,
 Andreas Dilger <adilger.kernel@dilger.ca>,
 Mikulas Patocka <mikulas@artax.karlin.mff.cuni.cz>,
 David Airlie <airlied@gmail.com>,
 Anton Ivanov <anton.ivanov@cambridgegreys.com>, Yue Hu <zbestahu@gmail.com>,
 Richard Weinberger <richard@nod.at>, Mark Fasheh <mark@fasheh.com>,
 linux-bcachefs@vger.kernel.org, Jann Horn <jannh@google.com>,
 Josef Bacik <josef@toxicpanda.com>,
 "Liam R . Howlett" <Liam.Howlett@oracle.com>, Tom Talpey <tom@talpey.com>,
 Hans de Goede <hdegoede@redhat.com>, Bharath SM <bharathsm@microsoft.com>,
 "Tigran A . Aivazian" <aivazian.tigran@gmail.com>,
 David Sterba <dsterba@suse.com>, Xiubo Li <xiubli@redhat.com>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>, Vlastimil Babka <vbabka@suse.cz>,
 Jens Axboe <axboe@kernel.dk>, Sungjong Seo <sj1557.seo@samsung.com>,
 v9fs@lists.linux.dev, Kent Overstreet <kent.overstreet@linux.dev>,
 linux-unionfs@vger.kernel.org, Benjamin LaHaise <bcrl@kvack.org>,
 Jeffle Xu <jefflexu@linux.alibaba.com>,
 Johannes Berg <johannes@sipsolutions.net>, Johannes Thumshirn <jth@kernel.org>,
 David Woodhouse <dwmw2@infradead.org>, linux-karma-devel@lists.sourceforge.net,
 linux-btrfs@vger.kernel.org, Alexander Viro <viro@zeniv.linux.org.uk>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On Mon, Jun 16, 2025 at 08:33:19PM +0100, Lorenzo Stoakes wrote:

> The intent is to gradually deprecate f_op->mmap, and in that vein this
> series coverts the majority of file systems to using f_op->mmap_prepare.

I saw this on lwn and just wanted to give a little bit of thought on
this topic..

It looks to me like we need some more infrastructure to convert
anything that uses remap_pfn/etc in the mmap() callback

I would like to suggest we add a vma->prepopulate() callback which is
where the remap_pfn should go. Once the VMA is finalized and fully
operational the vma_ops have the opportunity to prepopulate any PTEs.

This could then actually be locked properly so it is safe with
concurrent unmap_mapping_range() (current mmap callback is not safe)

Jason


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
