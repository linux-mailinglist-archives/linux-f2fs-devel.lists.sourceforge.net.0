Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id KNueJpoRumk2RAIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 03:44:42 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 8D3FE2B5593
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 18 Mar 2026 03:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q4KQ2z5DBxAdHeZ+edtw0XgewW5GoRB9SKh5n9sG2Fg=; b=GOFC57BUnnFe7CYAD1NC4BvrLm
	PL92sEgHZ46O/wfcTcNiWbdoiS1yE/c3H1FMIAEODkxtgm9V647FKaiqmEGRS4Jsc3TwdjFX4QrFC
	nD3gHbsRG0WpyioCNPOgP5Mz0Rw8Lc+Z7BdLoSjVb+g9Dv6LvnQfdzQi++MzFW30uhzA=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w2gtY-0003sW-JP;
	Wed, 18 Mar 2026 02:44:29 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w2gtX-0003sM-Ra
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 02:44:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=xQagxC23n1GpoR2UFT2oLFIWmIRITYQmlXwzUQx2IZk=; b=hYtz1Lr7C4FEQYeNLMw6xqmHtJ
 5lxrbfSAN/apJpEijW5lTvMMFisLw0KysERExwvXxj/zQQY7m0Exn6+s6xnU+kk3NYWp6IYXR7Uot
 boPTuzh9t29KS9qzkDZxEAAZeXWtZw0WXaVT9KmvqeAHf1S7DOySOl6tn6FpxpcjnSus=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=xQagxC23n1GpoR2UFT2oLFIWmIRITYQmlXwzUQx2IZk=; b=g8FIyjdjaGeFAMFULGSr2cxG52
 B16dWaWIuyZSL9QwSG9Ell3tiVk3DgERnIlbIYW30WT1XxKk1gp+VvjnGdc4TOfeoy5xh7ONPBYAy
 Ab4KNPDXPiSnONOdekTVWwKd76CXmfRnJsqmpgwRswwH9uDg9DxNbZ7i3e1g8yQDXObc=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w2gtX-0002jz-Nn for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 18 Mar 2026 02:44:28 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62I2NOMR3797743; Wed, 18 Mar 2026 02:43:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=xQagxC23n1GpoR2UFT
 2oLFIWmIRITYQmlXwzUQx2IZk=; b=H3NJIYbsRBVqt4hJ86iwjtBSlwVbrvOOQJ
 yravYBgLEGN5KDrv1TJvuDnTQT76Kw1V/jtBcv+eQ/aPQXBnE00evZ/CSuCr7QEU
 JSMl35eiK3r1i60e7hPgEcObZh4/K6gpKiyGOpaHlvm20GJtMeizgw1MaBt/qEpt
 L3joQfMhNn2MF1hY5w7NlbxkUakkIuF6nE9nardnA/kYouWIHxYCYkZ3Jc3K4yAK
 hJIujFj0/xYcg1Y3mekEwPy978KtrRfuK8Qwa6WDTiZcGlysZkUpY8KCukf1gtmA
 V36hnftPLUX47K9QWps9r7Us4k4b/dCe/OiKWYz8RiIi5KbPbhvA==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cvyqbwa1r-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2026 02:43:35 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62I2BpVr021279; Wed, 18 Mar 2026 02:43:34 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com
 (mail-northcentralusazon11013025.outbound.protection.outlook.com
 [40.107.201.25])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4cvx4pa5ja-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 18 Mar 2026 02:43:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bhcER1IDuRsrVDcevhEgf7x1I4yZ2bUqwFOn5TvSJbVzAL+YjW21dbvFx8she9bQS2NfQidDB10/FjDc/7U02rvAJUK1sBApcDaI1RXQn1qa00UKaeCWm/21fgw78xh7+5at3+QILp2pHXF9MIEd8JtaZZ7QxAiwO5dcZvQqDeamNTvwXE4ATR+1rJVYJVnEom8AHySP79o4Rf/uuPzl8T7EOZ8zB0WAjB573P5vdf+5Td8oIHN2PJhCVtI7UO2hWHMg9Ibkmg8owbd+mIIIDYZmNE+Y9eaJZ5PWFuUbs+W7FpLMsFKiVzVdH1Q341qkb042Fs03FfrZ3nyXYMokYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=xQagxC23n1GpoR2UFT2oLFIWmIRITYQmlXwzUQx2IZk=;
 b=JfbWUP9LeibqsaKi6j+ZbVTRJ4k5syJWqisp32WoS/t7TnpVNjHmLpXpx3Lt6Q/R12qtzUiJ5q7CaQIuLIEw7uKAk4i4EgbDqDi1eCD+6UbAPLBcmZd8ciYXn3jg+1uHV+gJ1ATom1qIsjgE00l3SKkRBpMq+WEZbyaDI/MB48Dbu2j7Rv8wD1gfNklSSqxMJeSD9bg0SLVVt0xfK0iyuIkJTndolgACSJBCZap+b6Z0930nXfcyv7E/8jd3SFkREKUlXkBx3ep/2k9vg7CLgWJVdiUNOBuxH3Zv8Pspea+v9GyT6vgSG8r1vOm4KZgrY31VCWLNTK4pRPy6z9klhg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=xQagxC23n1GpoR2UFT2oLFIWmIRITYQmlXwzUQx2IZk=;
 b=AclxnwPZjznW17AZThmqnXz893X4ouia/QVmVJYJXVTKX770Mgvrim3+5y9378WvP09sq2X0RezWfO6dU1Z1MQDZvw0O5ic6LPpMF4HybP8PJyWck4TgzJT8xg0YLo49EKh2MMjD7udAKSfV/K0pFeGK75gMpsUVXttt39nq/mk=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by CY5PR10MB6166.namprd10.prod.outlook.com (2603:10b6:930:32::13)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9723.19; Wed, 18 Mar
 2026 02:34:27 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9723.018; Wed, 18 Mar 2026
 02:34:26 +0000
Date: Wed, 18 Mar 2026 11:34:16 +0900
To: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
Message-ID: <aboPKERGvOniN-OK@hyeyoo>
References: <aa-1-Y3v3D1hzPvL@hyeyoo>
 <69afba32.a00a0220.d013.0002.GAE@google.com>
 <aa_R-6SdHYBBkQX-@hyeyoo>
Content-Disposition: inline
In-Reply-To: <aa_R-6SdHYBBkQX-@hyeyoo>
X-ClientProxiedBy: SEWP216CA0124.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2b9::11) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|CY5PR10MB6166:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ae05dd9-731c-4cba-d15d-08de8496df7f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|56012099003|22082099003|18002099003;
X-Microsoft-Antispam-Message-Info: VQzan/I6IC2SCtwD+myzxAJe48VFP5FIEyURbKH5hIrpV5nCeQDhsZ1ksw3rifAjw3Jy5lgu6sGtbpi7p+6S+oA1yuOHlp+1L+aPLk+EV0Y/rAo1slhO6rL9C/GBPTaU3BGFZ54BV1jn348Niu22jKNfxJEfNDseNWB8o1idN6MV1Sic7rg1DsAg45kW7RN/TvDeFHpD0RNUQaYTTVtdKq80yCOyVeIp9FkEaYF9m8hLj6VgRki/iyBUPxeTVOE7dCxF2ZMLEI+eXzo18TpYHagopzKXjef0K6bZVSAktcJFacuuqy82huZRNs2jN2rFKwT9lJZiDvkwb1G4tkRFmXiPYWYSPCzfLDrnXAHMQuxbmEJSOaruVy3XTNhyn+lCnhC3imfl5Y+rj6C4ZhNYk9nfBi5flly+A6ww9h1yt6EMJgRoZFYwnE+nK8DFwiQI5LxugU7X8zpcqhhQVQ2e7Gjs73qAX74GMjfs/Pay3F5jNJBWyj577glOifwJk0/JcAPoOyRRYKugA14VO9huZ1r7MwDGdnEhkfbT/NpSwWsNDLxnBFpmDVsHTeijiWqxZqcGfOQ2XPQlS8uM6NHfWGwakZPknoCSP9I/w7C/1o6qPfLUrAQEbE5DrRnT/gTnWux3T/fEfWPO7mFJNsshG+kXHjIgGz393X8XeMMByjiH1CH7TqgcNhDgQAMmhjQWW4h+bUOJifiP9BPvVoyUFSfhZHF/OeoYUVXq2wmY+6U=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(56012099003)(22082099003)(18002099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?EaazFWVXQkGg+h2e8KMZOIqX8AkspFmuz2eTk031rzbko7iVKMRXOtUTZJsu?=
 =?us-ascii?Q?DqjV6mONZ4tLm4N8V7+x7/CGQn+ZQo6PkH+ne5icYcyC2H46vrfQKvn7SklQ?=
 =?us-ascii?Q?MkiJC3QXhEF7uYrSf4Mmt/mpyfaum/vDJ9yq3CgSFlS+8Upd6hNZAcYW6YAp?=
 =?us-ascii?Q?fJc8QHAolVjWk3OIpyH3xiqskQbEdVAgGqyZSlb4qQ7QGiVcwex46eDXSABk?=
 =?us-ascii?Q?LTqHF8kwUmYR+qE0YIIc06k1CH0+T+g3J4nxq79SIz7DRO2VsTZKyupgqPPa?=
 =?us-ascii?Q?l19QkPXTPP7ionq3ozJSoL2+JL0TpCsSpfOSKZkqjIfyIIniDAm51yPgAHs4?=
 =?us-ascii?Q?oGJD+0ehlqZpkGQd4CTLlOMN2JhgyiNXALMFI9Amtfuiczjhm103kk8uFj8H?=
 =?us-ascii?Q?/XKwxaR8JV1PqxocRC4Ul2FpVO03gfPK1MBVQMkGbmKWBDDQC3Zf+Y+4AlHW?=
 =?us-ascii?Q?Y2ZD5AomOyoo6z4cxLyQHkTR8f8eqCXmC1dozS+SCbhFQpg4SuFqAlRAKrdB?=
 =?us-ascii?Q?trv9gXTBdAXSpHZUBpRC9H1DISDXBSS8cmDSZALNjZUvDVP2r6ksZJxK7TcT?=
 =?us-ascii?Q?wIp3D0mmLHHjSgQzj+2a2TZdHSOc9ueBCkw8ox38bJOZhg2u5M1Wp4vKAP+7?=
 =?us-ascii?Q?ZZLsTS1Hj38TEYGJhiqgP+ufNZrTlpLZHvaemtqkSch6AvRZAPG4z8BlCWoE?=
 =?us-ascii?Q?+OqIXkUXkghmGVp61R8AC8qeEVzXkMYCAzewxAgcWrJP02X5vhEY/LzZ86DJ?=
 =?us-ascii?Q?WD50KT3mcaQbyz9o6XOvs3oO3I7qLxUmDt7y8CLndEaSp3Q1hnSEp0Mn08FN?=
 =?us-ascii?Q?Zd2AV97e7t6nBGEE5NSs5mfju71bs4OiUWphku7nQaYq9iseRydzkThhCb/7?=
 =?us-ascii?Q?VRpzRlK3vwcgz4UMwiMXwP/OWZ6ow38tmL2nvg+Fb+tD7FNShiQtiidZv3AX?=
 =?us-ascii?Q?mPi6tOQd3ZNIJECNQTXs6jQ7ountVSq25idp3MLsRWmaG+oqAXYCF9mDdB1h?=
 =?us-ascii?Q?ZQYbAolxH2luNYy74UoWJCAVW2BtJmtm6B3c63s6VX6sU3Mo6XVJoT6vz4gI?=
 =?us-ascii?Q?+Tq27qaOa/BXO+zqX+2+lTmhumJ+pWX1mZ6I2F6l2Al9cD1Zwhk1LJJhSDQo?=
 =?us-ascii?Q?CR8NZGwHX5o5lejAe5y3TH0/irnBZ6L9E7620EZTr9cb7FkL9XDUl9gckpJ6?=
 =?us-ascii?Q?fgbXV7EiMRZo1PLwfx0T/sp5raAiO+8EFH6I3qzJ9M3bcv18D6E1PPrFBMn9?=
 =?us-ascii?Q?vwdzpiFgPiRHMTuc4TVfLD6udovJorEIJearSIn3NfYiDKSL9jkv4atnq+zI?=
 =?us-ascii?Q?IQ+rTuTuNp/PDCJzpc+VuGqvX0ldkB4JglBcTSo99FrjZm7NlI6iEBTyVr2U?=
 =?us-ascii?Q?2uZoIXQXGCnm3wqRGZO+j6aveQddDEfWsCJQ/CiAe0HODhi3z8FROfp+iUoi?=
 =?us-ascii?Q?N63+QWkiRy0xHXcNqSYWz4NmAx98Cqmc0ERzkzoIOIfrlj7fQLDMbIcfywPm?=
 =?us-ascii?Q?lAFP205Ql8YX3F4bXQuy+33NKJ8L/H/2Nkwt7Jyowk4d3FcruzLUmMcirGXF?=
 =?us-ascii?Q?Cz/ZwoQfiIlzLMpTtijuDyE91/fP5yiZzSLkGaKIY3wV4NXIZe4XVtGbIAYx?=
 =?us-ascii?Q?pNDqktqFlhNJh9gQ28FSV3pcfGZVjgvcfqWK+/5K+CPtmxKVLJcaN2HIxszz?=
 =?us-ascii?Q?c0YNGYXRuhz7qdCcz7N9Pw9COqVo7KfLLv6zQyN8ljXyecxL0IQ0gOZSbco+?=
 =?us-ascii?Q?5Eb7L8CQ8Q=3D=3D?=
X-Exchange-RoutingPolicyChecked: tylvqBOjawvwNvc1MNHo1AAqBbqv+R3y6aHbnzgQ/Igzc7fKz8yGkJO1nbB4n63+M3V6P4XxIu4hBDdiEV8kZPtlFS2Yji9yxAut/jDmDXtVDZxSl5z/J2F2jvrrUStQqVHrbV45aq47jp86DV33soOYdFMT5wWP75kR5ssWBY5W2qqGOXgdgRxYMndn03r6vbp5FdhoNmajCRt+a7rGGnIB1+ubJgFGJu5HzLNaON/d+Pxi2m6XEsiGfPHLJJ6EHAN+oViIUizswFVCXRJcc0apn0K5Wlh1BdYNLYRsO7bQ3e+SF0meMwRbsJWuNy2G0qoEkpXUrFmNylks2VY0/Q==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: I++l5FnTYuzIRee8L02c0PXe6RozU1gJrvGs9N1akASU0Yss7ctqhToTgSf2/3njghfNZqSZNlpHXsV5s1y0p1vf45ZZw/r9VoxmftCmUfQDoRvdJXegKlhwOuA+yOIb4Cnmt1iOOEiOww4Z27wcnwVfsR524iCL5/GXTC62H68smBe4D/3bEzEu5eXYQA5sdNvryo18GrEpTaFF/uYePm5ajK28U22kkcGSMP+4LOZ6SpVxDI5okZbbE9rvQbmxg49Y7/Eg7FlL8mUQZj+9uuAOMHp3TKL0iobzARPctrgP1WNsVOjQaEERKPle8XGX301vhxcdIoBZlcuSgt1ctJHuRfk02Jq+oBnRf9qOe4ggG6cnCe2A5/7fNOHjdi+/s1ttt9lKd2dVI+fbsRXnqUbcPJgSJIB909GF+OYdo0ciZD+rhRSuF3FJ49uD/ByyyCcVuFXoDThVKC764G3pydtbVP4EvApo8Oem8am1dHVNDq3/3YIcP9LCF9MfGvEqA1QEFHGs8qY6Kp/KTHtLCviS+9wVLXkJ/DTn4pL3cQ1kaHI8fGBCRO+mZm8ChnbXIiGi/G9kxKhkzDbHkpmTJaF1aI0Af2YJMSAAxu16Gj4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ae05dd9-731c-4cba-d15d-08de8496df7f
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Mar 2026 02:34:26.5527 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDtnFP3HHZqIgmASaPwQgl/R9UqMGmxkOY/YI4dfBXNuMTAF1DqPOME2zQqfc7Bp94MHRLPP9O9BL+QNPb5FUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY5PR10MB6166
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-17_05,2026-03-17_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 phishscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 bulkscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2603050001 definitions=main-2603180022
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzE4MDAyMiBTYWx0ZWRfX5RRDlJTBOuPU
 5GpJX10uOVFWzCgzydc5N+Jm00BCv61XIvL3T+DiJEGAeUbvQ+HBtEXsnkhayGS/TYV+ZGxKu90
 rbENbfNe/tWroJ9UkE3NOhC/MjT/DDXgd6stR4ZJCnUSz9r2hfqPs2jSfyaK1WOVnWpo4ESjYcC
 e/6CGSSH3Hw5ZDsj+e2b5ekYeNeUz2sOc/GWqIzFiyI/uVQVbRmlcN4K/8QzGV4YHfUQT63wb9B
 FXfuc+1m6b7MtphJUO+BmfWMYtRovXEwinBmxIyARFilPRlmXOSiK++XXkrmJ34Lup/BoHwnFyA
 aJ313RpzMCmcn+ucevjxwM3qlxjhrxbrNVWl8Jxu8wIKiFVpTOsY9edzvXyJ1USoiIzODpnmyGp
 FRVYoN3YMy4sfC93QqGL292abebu2XiVSp3qLmt/5/sVjXECu8Vt6i00ZXKaQwaNmnKN+j74cMy
 mZj56JIdzj2/YzSCgKKVWitPsvoVbZyJlBIMvGjs=
X-Authority-Analysis: v=2.4 cv=J8WnLQnS c=1 sm=1 tr=0 ts=69ba1157 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=BqU2WV_vvsyTyxaotp0D:22 a=Xuqz1nnFySqRZCOGbB4A:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13824
X-Proofpoint-GUID: gx746JCLNHxrb1bto9JGT2c8-2aa-n85
X-Proofpoint-ORIG-GUID: gx746JCLNHxrb1bto9JGT2c8-2aa-n85
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz test diff --git a/mm/kmemleak.c b/mm/kmemleak.c index
 d79acf5c5100..b7be2cc1efc3 100644 --- a/mm/kmemleak.c +++ b/mm/kmemleak.c
 @@ -50, 8 +50, 8 @@ * * The kmemleak_object structures have a use_count increme
 [...] Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1w2gtX-0002jz-Nn
Subject: Re: [f2fs-dev] [syzbot] [mm?] [f2fs?] [exfat?] memory leak in
 __kfree_rcu_sheaf
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
From: Harry Yoo via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Harry Yoo <harry.yoo@oracle.com>
Cc: wangqing7171@gmail.com, vbabka@kernel.org, lorenzo.stoakes@oracle.com,
 jannh@google.com, catalin.marinas@arm.com, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, liam.howlett@oracle.com,
 linux-f2fs-devel@lists.sourceforge.net, linux-mm@kvack.org, hao.li@linux.dev,
 pfalcato@suse.de, linux-fsdevel@vger.kernel.org, jaegeuk@kernel.org,
 akpm@linux-foundation.org, sj1557.seo@samsung.com, linkinjeon@kernel.org,
 vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Spamd-Result: default: False [-5.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	MID_RHS_NOT_FQDN(0.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:catalin.marinas@arm.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:liam.howlett@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:hao.li@linux.dev,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:sj1557.seo@samsung.com,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	SUBJECT_HAS_QUESTION(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:replyto,lists.sourceforge.net:helo,lists.sourceforge.net:rdns,lists.sourceforge.net:dkim];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,arm.com,googlegroups.com,vger.kernel.org,lists.sourceforge.net,kvack.org,linux.dev,suse.de,linux-foundation.org,samsung.com,suse.cz];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Queue-Id: 8D3FE2B5593
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

#syz test

diff --git a/mm/kmemleak.c b/mm/kmemleak.c
index d79acf5c5100..b7be2cc1efc3 100644
--- a/mm/kmemleak.c
+++ b/mm/kmemleak.c
@@ -50,8 +50,8 @@
  *
  * The kmemleak_object structures have a use_count incremented or decremented
  * using the get_object()/put_object() functions. When the use_count becomes
- * 0, this count can no longer be incremented and put_object() schedules the
- * kmemleak_object freeing via an RCU callback. All calls to the get_object()
+ * 0, this count can no longer be incremented and put_object() adds the
+ * kmemleak_object to a deferred free list. All calls to the get_object()
  * function must be protected by rcu_read_lock() to avoid accessing a freed
  * structure.
  */
@@ -93,6 +93,7 @@
 #include <linux/mm.h>
 #include <linux/workqueue.h>
 #include <linux/crc32.h>
+#include <linux/llist.h>

 #include <asm/sections.h>
 #include <asm/processor.h>
@@ -138,7 +139,7 @@ struct kmemleak_object {
 	struct list_head object_list;
 	struct list_head gray_list;
 	struct rb_node rb_node;
-	struct rcu_head rcu;		/* object_list lockless traversal */
+	struct llist_node free_node;	/* deferred freeing */
 	/* object usage count; object freed when use_count == 0 */
 	atomic_t use_count;
 	unsigned int del_state;		/* deletion state */
@@ -209,6 +210,13 @@ static DEFINE_RAW_SPINLOCK(kmemleak_lock);
 static struct kmem_cache *object_cache;
 static struct kmem_cache *scan_area_cache;

+/* objects pending RCU-deferred freeing */
+static LLIST_HEAD(objects_to_free);
+static atomic_long_t objects_to_free_count;
+static void flush_deferred_frees_work(struct work_struct *work);
+static DECLARE_WORK(deferred_free_work, flush_deferred_frees_work);
+#define DEFERRED_FREE_BATCH	256
+
 /* set if tracing memory operations is enabled */
 static int kmemleak_enabled __read_mostly = 1;
 /* same as above but only for the kmemleak_free() callback */
@@ -522,14 +530,12 @@ static void mem_pool_free(struct kmemleak_object *object)
 }

 /*
- * RCU callback to free a kmemleak_object.
+ * Free a kmemleak_object and its associated scan areas.
  */
-static void free_object_rcu(struct rcu_head *rcu)
+static void free_object(struct kmemleak_object *object)
 {
 	struct hlist_node *tmp;
 	struct kmemleak_scan_area *area;
-	struct kmemleak_object *object =
-		container_of(rcu, struct kmemleak_object, rcu);

 	/*
 	 * Once use_count is 0 (guaranteed by put_object), there is no other
@@ -543,11 +549,19 @@ static void free_object_rcu(struct rcu_head *rcu)
 }

 /*
- * Decrement the object use_count. Once the count is 0, free the object using
- * an RCU callback. Since put_object() may be called via the kmemleak_free() ->
- * delete_object() path, the delayed RCU freeing ensures that there is no
- * recursive call to the kernel allocator. Lock-less RCU object_list traversal
- * is also possible.
+ * Decrement the object use_count. Once the count is 0, add the object to the
+ * deferred free list. Since put_object() may be called via the
+ * kmemleak_free() -> delete_object() path, the deferred freeing ensures that
+ * there is no recursive call to the kernel allocator. Lock-less RCU
+ * object_list traversal is also possible. The actual freeing happens after
+ * an RCU grace period in flush_deferred_frees().
+ *
+ * Unlike the previous call_rcu()-based approach, this avoids embedding
+ * rcu_head in kmemleak_object. Objects from SLAB_NOLEAKTRACE caches (like
+ * kmemleak's own object_cache) are not tracked by kmemleak. When such
+ * objects were linked in the call_rcu callback chain via rcu_head->next,
+ * kmemleak could not scan through them, breaking the chain and causing
+ * false positive leak reports for objects queued after them.
  */
 static void put_object(struct kmemleak_object *object)
 {
@@ -558,14 +572,46 @@ static void put_object(struct kmemleak_object *object)
 	WARN_ON(object->flags & OBJECT_ALLOCATED);

 	/*
-	 * It may be too early for the RCU callbacks, however, there is no
+	 * It may be too early for deferred freeing, however, there is no
 	 * concurrent object_list traversal when !object_cache and all objects
 	 * came from the memory pool. Free the object directly.
 	 */
-	if (object_cache)
-		call_rcu(&object->rcu, free_object_rcu);
-	else
-		free_object_rcu(&object->rcu);
+	if (object_cache) {
+		llist_add(&object->free_node, &objects_to_free);
+		if (atomic_long_inc_return(&objects_to_free_count) >=
+		    DEFERRED_FREE_BATCH)
+			schedule_work(&deferred_free_work);
+	} else {
+		free_object(object);
+	}
+}
+
+/*
+ * Flush all deferred object frees after an RCU grace period. This must be
+ * called from a context that can block.
+ */
+static void flush_deferred_frees(void)
+{
+	struct llist_node *list;
+	struct kmemleak_object *object, *tmp;
+	long count = 0;
+
+	list = llist_del_all(&objects_to_free);
+	if (!list)
+		return;
+
+	synchronize_rcu();
+
+	llist_for_each_entry_safe(object, tmp, list, free_node) {
+		free_object(object);
+		count++;
+	}
+	atomic_long_sub(count, &objects_to_free_count);
+}
+
+static void flush_deferred_frees_work(struct work_struct *work)
+{
+	flush_deferred_frees();
 }

 /*
@@ -809,7 +855,7 @@ static void create_object_percpu(unsigned long ptr, size_t size,
 }

 /*
- * Mark the object as not allocated and schedule RCU freeing via put_object().
+ * Mark the object as not allocated and schedule deferred freeing via put_object().
  */
 static void __delete_object(struct kmemleak_object *object)
 {
@@ -2209,6 +2255,7 @@ static void __kmemleak_do_cleanup(void)
 		if (!(++cnt & 0x3f))
 			cond_resched();
 	}
+	flush_deferred_frees();
 }

 /*

base-commit: fda995dadf2960405545e5002aaa85207aa758cf
--
2.43.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
