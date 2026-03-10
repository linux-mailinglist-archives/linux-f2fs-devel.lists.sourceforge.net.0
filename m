Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id OIzbLT/Sr2kfcgIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 09:11:43 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id DC99524709E
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 10 Mar 2026 09:11:42 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1qM671jOmOT2C8wwoYOLqvukiJBki4D2PoW0hlB3J/w=; b=WRCmGvu+rBptyijV8uKEyTYzi7
	/gnGoZa+QzPr5tMDF/6DF6DXRCRM/ro2s7tmhiHoEmqDmibbbz84PProzrFbC2Fy8L8eQYnL/E4H1
	FaTY4BTkbHQc9S7y7FSK1q0gXSeP8TKjIlCiFmtd675R4SARsEzGpWmrPgjl13FRMZgk=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vzsBZ-0001FG-RQ;
	Tue, 10 Mar 2026 08:11:26 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1vzsBY-0001F9-PP
 for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 08:11:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=g11566VaswpDr4JsqWz5uzRFuAGl5kuwe+Vm/tL4ceQ=; b=aSeGCERGh4Da3AmeLwyd5giA+z
 9/ci5UnCumeWjhGhJokRisCYOOMUuwHJzCSju2UTB76Qk+rU9eGzwaw3/g4PeGInkZwPqfiubGw42
 qSZnOo4O6HakVBUJu57rVEsOc5+JEGLRa/iEt98XGdeaxHvJNw/2bvnxCiKecwweuRL8=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=g11566VaswpDr4JsqWz5uzRFuAGl5kuwe+Vm/tL4ceQ=; b=NyvpE3O/ShYyPFhdQ0OmkbYgpu
 n6P8l0ZjVHv9WFW7biS0g0BgAydmh/g9k0MZESDKoJVUlfjs8bWBajRkCYgaXxyJgWcvTx9zO7b81
 jT6ZSKHNcAYgQ8n8XhhP9fOpkOVH+QcmM4V/NmHgS0CIIieLmoIN49gLIedib6i3Wj1I=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vzsBZ-0005sO-3d for linux-f2fs-devel@lists.sourceforge.net;
 Tue, 10 Mar 2026 08:11:25 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 629IMrcl1627924; Tue, 10 Mar 2026 08:10:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=g11566VaswpDr4JsqW
 z5uzRFuAGl5kuwe+Vm/tL4ceQ=; b=ZUkpQh7pOUWtK2llM0UlzhX+XJhW8rQxEc
 BGQokn+gWFFzF5uL0oC+1ZveIYRTxUbsRhuTHbLxH18Rcrj7TiRhW82QrogUuQIU
 xx254stgQpcnk3XDYUfTtneb8/lY5RYfAS3O41MpymaWOgXIrPi3omPCJzElwg6R
 Y11mTyCmXPbqushXQRUQErnFtUz/OWnL+cbZhcAyAX5y/fBO/MAclXjq/oxRiqyT
 +MKVfiKAf6L/uCmWTlsd7/3F3uph8QFoqIcbd1+7MymKJgobRH1r+NbSvlLXfPB6
 QyO860zEN+h2GdEB0JwbyDKUUQWK+IxgbOLwLNNcmCPzPjcfcHQQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csmps2d98-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2026 08:10:47 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62A7hcKu012954; Tue, 10 Mar 2026 08:10:46 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11013054.outbound.protection.outlook.com
 [40.93.201.54])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4crafeajxq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 10 Mar 2026 08:10:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YnSFtTNNYQg/5mJbhTX0EOyZO/yxaad4Uaq1aIOmQLQJ1b75Djos1D/PK+8S/pFv6hHjEUUNFlopuTBcGAzpAdJVpHce/EbOBrsg5ywN+XQjD904QbweZy7RU254HMgYFwccbclbQrIRVOB+Pvuq4g7ExM9+TkgSN8xTJvflKmWRj2yFfRSfneav7AYxM4F9m3RUz7ytj7FltiZVLYf5K+dsU/N06AygoGTjw0xJPmmaoU5zEmD4KitUphveTB0oMQxxVUAP0DwkQrQINOEvg3t3UvvEMvzJgNCpnGnNcl1c0hIKjhg4NDoZfkINpy42OjaLys2gIsZXJDxvwLNeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=g11566VaswpDr4JsqWz5uzRFuAGl5kuwe+Vm/tL4ceQ=;
 b=tZK+L4KuVimV7aMVVjRDoTXjgd4m2e6lSwoImBXdzZV3A3V+NmrmfDXnbMHVGFMGplkGszn5AZVKeLZgbukLUt+oBCHDKEem4mb0WOPqOAFjXXmUs2cu4EwVPQALooGJhoYW8Gz8LfpF3IJBHeGl8gXX1g8LMsGYlmVlctMHO0+UtujZXcXhePuWH5uoP1am3sZuyQY35focrqo99Ho4EkNEFF3csR+3Imh8QYcibJcIBcEQY/8HBl/eQ2jlPfbHXHfTeZIwHM5eWXWGsEs/2cZmwXG2amLnV4faPEoi8wN63aGz5+sSUfb08S/5bBJN7skhpS6LuOTsSyR9aAMYYw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=g11566VaswpDr4JsqWz5uzRFuAGl5kuwe+Vm/tL4ceQ=;
 b=Js59GL1Nz7sZ1ouuIxmEP767rLuFuqk6VNeZFT732+tng+S8wakFfFT1Ht2WKunjRlEzZgh1e0gZkt7K4gp3vcqszOn1v2Pe0RoukP6yo/ol9EKxK5fU4Q6JVQp503D+R7/M8fPPkPqqj5ffH8CGoQqsRxoHSbdfDIOFNeZEd2M=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by LV2PR10MB997779.namprd10.prod.outlook.com (2603:10b6:408:378::23)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Tue, 10 Mar
 2026 08:10:43 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9678.024; Tue, 10 Mar 2026
 08:10:43 +0000
Date: Tue, 10 Mar 2026 17:10:35 +0900
To: syzbot <syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com>
Message-ID: <aa_R-6SdHYBBkQX-@hyeyoo>
References: <aa-1-Y3v3D1hzPvL@hyeyoo>
 <69afba32.a00a0220.d013.0002.GAE@google.com>
Content-Disposition: inline
In-Reply-To: <69afba32.a00a0220.d013.0002.GAE@google.com>
X-ClientProxiedBy: SL2P216CA0204.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:19::20) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|LV2PR10MB997779:EE_
X-MS-Office365-Filtering-Correlation-Id: 5cee7ffd-cfe5-4dd7-edb2-08de7e7c8648
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: l6F7fLkQG1XI9aM5m0WgQjx+3fA7d5BOi8bSZYUKAK+CkhgwObbeTCtxNnt9wXgsTU612k6b+M6Ju4e4pkeavEn6HJQ3RDWpg/y3z4qFg1AAbj7dsn1baJ/mBrFkdnNC8dFOCL7YvhyM+4jBO6xxstOB930lNiuaC/Eqi40aBDcsW8mE0VLzNNmgUwXW2em9/jd5aTnzrV5ma6F7p3vvWoYcWDO/4Np5ifOEtRr7PCSkSg77iEqOf56oE2HDqyjCGsUEPMQOfqC3Tohgm30eFUIz6/kM6a6k8FPicktCaFkdtbl/ZGt1bSaXLYHL7BfMEpcMyFqKCwL5hHJfQ6DSnAZRjJ8g/CN+KGhNEaw9xH3sHYb8tG4A2DM5QVHdCKaqRdTgDsKPoSsI1tkxEXmn3wx4Ppj8Gg8JlXZaaNQjU4mixunab35VHNWMLZrJ0zcxNgW0fKqgirs8aodP5cmBEVtUxmRWS0WRN2znA3l3Hta8MH2hpb4N8VCzrWnFztYlKRsJUym0abXWBXpN9+LQeMjnWA57/q001XBSgyrnSvVnKsTvrMUrDfPelB6JQKlfPQYtdoczCRg8K0LIMeTPuxX1zZH8pGFV6Tfy+5DAV2KvXJDP0G5s4XDVLXy84HdzyoBymkFHHc88CZWQpvByBanlnw7IceGVOcHaeqnjdbabgq5AWHK+3rfJ1BiPUvm7MQ8dwHoVROWV1pHlvzUmrc8zyNwqmuTmal0VSuVcmK4=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?/B33ju8DJr0lORoxopQhordtf5ehNGFVFHQf5OeTAhZZop9bNddTch+0rlBI?=
 =?us-ascii?Q?FKJPZVQUWQm2WLsBtAayvw53da19qMaebx7MThTIwI/e2gasH0Z/06aFSo1n?=
 =?us-ascii?Q?0kVRCojGZlAxth9PiRz5Qoyu9pzmF39aOMsbOgw/lUayfyWZQStzFpGdf9ag?=
 =?us-ascii?Q?R5h8ih5M3PLbYT7Ts9PH4sDx/pavaJbAJJBtPAc/ddYgDh4zgPj+gOBytH69?=
 =?us-ascii?Q?/tU0vey7m3sIUaPAKt5TGcLchhVKB5z+pNtqaJIAdrfc9Vbf0pzFB1AQtsPD?=
 =?us-ascii?Q?sts0nsKIDz6kZCt9ZlyqXm9YbTaAooBKRKy5vTNhmFuX9xvj5pb5FX/XRdcw?=
 =?us-ascii?Q?Vl976GfEGgSCSF48QIWt98gw8l1svY89tg83McUURhOJ4dH4LHqk3Md4zVIn?=
 =?us-ascii?Q?MKJKFIuUyqmAPeDSQql2tJLjM2EkyRhSl4Cao2hRoD+uVgdF5ZYJrqVQfjaQ?=
 =?us-ascii?Q?5HNQczXiaEAAT8JtI4dAn6BMNMYRAkNCjKpnQV/ceQ7naZpHz2MnpvsMnFCW?=
 =?us-ascii?Q?pQoOJcPmQDpESZ5dIUZRFkToXnuapeFcXm5otB+lsuZx5whGPix3ajjnO8y1?=
 =?us-ascii?Q?Hc7p+xZmynZh1nWlnonJKP8b5D9EjlNfeSe+DJ9V5hiO5KgQyxcgRGk8oFT/?=
 =?us-ascii?Q?0+iMX8M88zcRsx4KGWqHqoicamdHJHOXB3dkV/USfL9G4XbRS3Jb8B0sbwKY?=
 =?us-ascii?Q?oMNbJEmbcULYFMhqX0tuJ3oxWGTt5EtJQqq0Z+mtcokD6xjEeN8YlRxVbeXZ?=
 =?us-ascii?Q?e+F/MXUTK1kLjhkLffi5TRl0/w1xL7lZyB+0EbfHmtfDZlj80uBhXCWYWHT/?=
 =?us-ascii?Q?ojwz6t+T01ziwnb+/pgtEFelIBwRmOeABHe8qfjTh7+VHpbzD4Rl840m9+QC?=
 =?us-ascii?Q?VfWyuAcccoMPGRO9txx4RBlCTpwg8Pgwd+iyhU6HIHXT/db67RXrD8NpmNSG?=
 =?us-ascii?Q?4hTZhXUG5EsJhvgvgXbgL6yE+TV2d/fMjA5pV7Bq/qXHEjsSESZV1N93IaeU?=
 =?us-ascii?Q?w7b3ZlkmnuDFSuz7z/I5JCS6nBsqAMWDLHnqOz85rV35JtGOE/Bfl12mke9I?=
 =?us-ascii?Q?g0JtCqs+pPuTySYzRdCt31yBZGCrt0a9NGb/NqwKSZlJ9KTV7yP64gSrt1Lq?=
 =?us-ascii?Q?4zd0cY8EG24RNF50IDYMXVma7kBQ7IDjgvacNbFTk4TkuWUJsd5B1W4NJNNV?=
 =?us-ascii?Q?UC7E5SZfqqwaHezuP8HnQbyqlNJ0aSrEOkB0xsSDc0u7sL7KmodPDmvBKIJb?=
 =?us-ascii?Q?5B0QZPPXqL7NuPRpqsGyQnrd4Dw10W/5y6GF6mPDMxI4dOsA+VW1LpendvPv?=
 =?us-ascii?Q?dJgpZ44Ll9Va9AZuryQR3w1oPDqvte/PgmlLGmKoB+pOiH3zcz7tjHk7EAwR?=
 =?us-ascii?Q?UH4o51xu7cIOllHGvuejmLnr8voB0/0OMjybQjjydUQteCMOMCf1ttK+N90/?=
 =?us-ascii?Q?BbXoBztGitsT8V3JVtMe3AxLAcrk3Ck7Y8X/SQ0F9nSJbPA+pr7BvhtWsk6Z?=
 =?us-ascii?Q?hIcO9fypnWIM0h0hZeT+CSvE0aaVbjR1Io7oCr5uuzVV3GBiqiiNjpPX54+5?=
 =?us-ascii?Q?bkS7lN47MHzt8w/kDbrLWOq6qSkd0NgM7xsKyMlx18ggYRn056H73NtQyexa?=
 =?us-ascii?Q?gB3S/qpiFILUbOiMKuXWpY4UB0jrRK1WNSTOHk18L+uIbC0MTWCvVogIYcAS?=
 =?us-ascii?Q?kVcs9iVc1uN0R1Uf2Y5qP7NQx59BMliSNBhtTIhtzS0lYcL57F8h+rTkm2sg?=
 =?us-ascii?Q?UJ0p8ACreA=3D=3D?=
X-Exchange-RoutingPolicyChecked: cZI92rFG/c4yF4IsWmB+raoy6KY1vc1WVyFDeYg3vTdmAVYJf+18P4PIQnKc4AcPOEF/nYg6m8SvJaH6kixQrfhT/Y/TmGXYWh3/1QQSmlfG1xbgs45on9MiKRiYARYVSCQF0SsTnO8nfHFtaVifgIUvBimTHdrZd3npCHcV+a4P5NqemOYTaE2EjoJtTFiPhQibHCfEDUeic84O2G7p3JoQmXyEkQhjlHZR+GpeOaQrzA2CKZems5a33tTXEfowQJFiZvXyYlyaU24SjqscTMPmEJliVowlJkDi7q94u0RCQqTMYWcwV9O7sftpwaKjbLHqyDh7hTpaD5oduqfP3A==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: bYvqEvxg5srxtamWLXP2uTrLU2/w+2/koBA7/7TqY4nRvOfCafQZdtoc4K3nZGLzgiYnMQsupetZnVFME/RF8Pw58/7WCZYl5ho4DuYHt6pBnQWrrCoDUI2cqP9zNELSMHM5gAmCAyOpy0vQWkAmcOYtPpvYpNRsenylZPUx6zjcKmIb8YqNh5ZPgO2IzoKMmXJuI+IqTJUnTgS3UjIIYgwqY1Tcvh9j3Rk/Enc1Wy69yVF0Gr9EjyCHk4X17W6qh0qm9iEo/JYi9tQJ5//vncAn/p6Cp9O5BgkM6SgenvWXMnLCuHL7nI5qQ48XEGBrkiyUCYrDf1pAUdiEanbf4YqF/HR6C1aPZKDbKLe9FRRS8vK4xlb2wT2zLVAsRyWNH4tl8Wo9fofQk1l9rxrcSecwtomrxHm051UyoX8Ts8RhP9kPIkpjf3IsFQpPSCMONP7NhAeYPgRXg/JffslB2yzLgUyUFh0rbyrMH5hNi28hJ4CSyUNGMJWTKZYkdRsFoE+CSaF/dsN0EId3RbLLLGbpSNJZUyNG17f1vJnL0xcAoZVtBB4SxA6HOt+3hK6CqTvd4Yizf3wwmpPUVRNrAAZl0QgVmAObgaz48+G8UWg=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5cee7ffd-cfe5-4dd7-edb2-08de7e7c8648
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Mar 2026 08:10:43.0437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H/iLM0wZr9DPfSocDVy4qUgZOrst/XhmF5ziw1U1mnE91NLCoHI5uaQETQ7U23GpwxGemI2rq03x5LL6VQPeHQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV2PR10MB997779
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_01,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0 bulkscore=0
 mlxlogscore=999 adultscore=0 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603100068
X-Authority-Analysis: v=2.4 cv=IJQPywvG c=1 sm=1 tr=0 ts=69afd207 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=7Gl3-_t3PgB9XO-mQDs3:22 a=OWf7uXLi2fQ9eYRmFwwA:9
 a=CjuIK1q_8ugA:10 cc=ntf awl=host:13819
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzEwMDA2OCBTYWx0ZWRfX25+gNP4cOc/5
 cLD+kyTkc0l8OgFAHizwsViAmoSKcznrG0aSQUoiAvd/ivAwjx6ZvDzULo4J8y+lNefMnerx6gJ
 JSaCF/YJMDTAsot3MEnImeret2VYryxkgm46/pf+GG+e3JlF5d2YjmKSUBn5ACTN8iDnFOUMwwC
 HuVKL6rlVIYkWQYF5XTbcfZ5A0GLBCIxpUcbQB/C99OWxe5345+Ublu68Gw1b/E4A1ZobPsbe3r
 JgFGO1S70xh+mjOQV1K+4wulrKKvsuAk0Uc6VXLuCAa8pqX/GGObp9YTLwkBJn6NKj8VsaeKIyA
 h1c0ureG6j3SYEGI1sy9e0Cx+k5oLyB6eW8m85CXpfIroRsscAz8nafRoOshYXQunR5ZHbeywbg
 ba8X0qYGfToReEd9gZEvN4E1wir5VSO3k0ZrzuWX7+zWDZ2UUdivHLHEw9jLNw8LOIkCgCcgE2C
 ONsHpVQOIQndtoUgYSUjbFriErYMeE/lQ3v096gI=
X-Proofpoint-GUID: zq2DEVDx-bJFScWkyXlXBp_Vdl5TWt7U
X-Proofpoint-ORIG-GUID: zq2DEVDx-bJFScWkyXlXBp_Vdl5TWt7U
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  #syz test diff --git a/mm/slab_common.c b/mm/slab_common.c
 index d5a70a831a2a..73f4668d870d 100644 --- a/mm/slab_common.c +++
 b/mm/slab_common.c
 @@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vzsBZ-0005sO-3d
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
X-Rspamd-Queue-Id: DC99524709E
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-5.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	SUSPICIOUS_RECIPS(1.50)[];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MID_RHS_NOT_FQDN(0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:catalin.marinas@arm.com,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:liam.howlett@oracle.com,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-mm@kvack.org,m:hao.li@linux.dev,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:sj1557.seo@samsung.com,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_QUESTION(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,arm.com,googlegroups.com,vger.kernel.org,lists.sourceforge.net,kvack.org,linux.dev,suse.de,linux-foundation.org,samsung.com,suse.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:replyto];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel,cae7809e9dc1459e4e63];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[harry.yoo@oracle.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

#syz test

diff --git a/mm/slab_common.c b/mm/slab_common.c
index d5a70a831a2a..73f4668d870d 100644
--- a/mm/slab_common.c
+++ b/mm/slab_common.c
@@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
 	if (!head)
 		might_sleep();

-	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr)) {
+		/*
+		 * The object is now queued for deferred freeing via an RCU
+		 * sheaf. Tell kmemleak to ignore it.
+		 */
+		kmemleak_ignore(ptr);
 		return;
+	}

 	// Queue the object but don't yet schedule the batch.
 	if (debug_rcu_head_queue(ptr)) {
diff --git a/mm/slub.c b/mm/slub.c
index 20cb4f3b636d..2f2228d3e8b2 100644
--- a/mm/slub.c
+++ b/mm/slub.c
@@ -2776,6 +2776,7 @@ static struct slab_sheaf *__alloc_empty_sheaf(struct kmem_cache *s, gfp_t gfp,
 	sheaf->cache = s;

 	stat(s, SHEAF_ALLOC);
+	kmemleak_ignore(sheaf);

 	return sheaf;
 }
@@ -7538,6 +7539,7 @@ static void early_kmem_cache_node_alloc(int node)
 	slab->freelist = get_freepointer(kmem_cache_node, n);
 	slab->inuse = 1;
 	kmem_cache_node->node[node] = n;
+	kmemleak_alloc(n, kmem_cache_node->object_size, 1, GFP_NOWAIT);
 	init_kmem_cache_node(n, NULL);
 	inc_slabs_node(kmem_cache_node, node, slab->objects);


base-commit: c23719abc3308df7ed3ad35650ad211fb2d2003d
--
2.43.0




_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
