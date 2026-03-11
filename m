Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aD1EG/nbsGmHnwIAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 04:05:29 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ACAD25B422
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 11 Mar 2026 04:05:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:
	Message-ID:To:Date:Sender:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TXeVZgGYG8+MHSQcABHk9CwAW6det0itocCk565592I=; b=jCKThUpqwrStpGtIX6BW8zWdkl
	50jikxkTKuVMuIiqyAMjufuYJnM6z1DMZlSyaZMoBvGE140Tznl7CD7ux2TxvmDrBrI1sLU/rANF+
	E3V1argBi+6q6kLHimHYWngyNiJhiq/aMhp5gzcbhUp1gISdjDxqr2+3VGejNLt2kLrM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1w09sr-0003gz-7M;
	Wed, 11 Mar 2026 03:05:17 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <harry.yoo@oracle.com>) id 1w09sq-0003gr-0x
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 03:05:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:In-Reply-To:Content-Type:References:
 Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=d02wK2RC4mNTATsnVC3tp5Ne2TK6JO4d3MmeXrl4CDc=; b=aai1ajh/14CpM7jo64/wMnTlAN
 Y0tln1igV2tI9z9B3eAfX360r6/uNpC8LChg0z0BcEMTDCZ2+j9LCR1P/Ss+Y/ZIfxkfRgu8WMjEi
 ZS4stIUhc+z80Lv5bzGW/xnNYnWTwqfvL51tmIbfoxqqmSwLR1sI3rmQKQ35X3KdB3/c=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:In-Reply-To:Content-Type:References:Message-ID:Subject:Cc:To
 :From:Date:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=d02wK2RC4mNTATsnVC3tp5Ne2TK6JO4d3MmeXrl4CDc=; b=OEQs7PRUrRol67SL1w9Y8stbMj
 y4tFXEcXYBtVm/BWscoav35bCiXmdOSKMJ3ORd5z0vaA4VsjRm9T/RhUzRwVDqn2PAVWAaPsuC+70
 MKW+H6HJP8OpeauyJ2kTODkFSMIPliE/kW6sIzElpwGtI9pIAUN7FWVZrf0+BSI3AedE=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1w09sp-0008Nd-7T for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 11 Mar 2026 03:05:15 +0000
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 62B1WPUY1336828; Wed, 11 Mar 2026 03:04:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=d02wK2RC4mNTATsnVC
 3tp5Ne2TK6JO4d3MmeXrl4CDc=; b=kRrS/yAdRnZmpz3qMVkbHVDLTNvQQxX0Ac
 mpO+HhV8CSk8HkJBRz1Pj05i6EvD2snNBQKQdJ+DDZ4iImlNXtuexAIG3BpNq56n
 H7hsjbqTV5aQRExQV6UlGQJqlbovbRvvS98gwvYX7aW+nS8IkSiwnvnb3oAKGXcd
 bKsiBreuqHlvTedyRc0VAiVkU932d2te2EocgWVHq3jQ0dP76s/6etIxnhFcwrwO
 tevhHeGhfsJP9CcaL10A0rk9oe/BzKYJErsj1/mrqSy7RhtuG0r3PPGVWzgqo3Cs
 c1kTtcdx7TwXuDXQ3eenUWtYO1O9Fq7l410M16sTsit7bLFc/hyQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4csmmac4x7-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2026 03:04:50 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 62B02DAB007063; Wed, 11 Mar 2026 03:04:50 GMT
Received: from sj2pr03cu001.outbound.protection.outlook.com
 (mail-westusazon11012011.outbound.protection.outlook.com [52.101.43.11])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4crafaxej5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Wed, 11 Mar 2026 03:04:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=PnyRKFHvb8XnpqfaEefsPwP5XvvYnOAzTuO20uCaYqn0frQWYQn/3HCnFCZUkjL9rx122D3nAw91VeKefWfJdzxrlhFCu3QYvS5Bf4Fr5yDqlGq3CFbH/Ufo5J6r73QchcAna9zE4hOiPymEnRstW29pUaR0lMlr0yEkOXOi5vMHl6fVZOL8VwdYou5asjZpDM/TSCJZz06KIMEdb1T4dUrP7pbFG6LCRFHgYEPEfQnDNRXz5+H0VJTjv87GbAPYri3bn9nBr5BwNI2qIG3lYPshFxZJA79ITVvmhE8aHml+SIz1o5iY/BhWStMdYm0qRUBNvZxSHBZJhUcIk80mbA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d02wK2RC4mNTATsnVC3tp5Ne2TK6JO4d3MmeXrl4CDc=;
 b=H6YOTo9WcyR0tLj0h4LksJ92lYMO4//8Bo/XoMSDT0ZDKijBtRcfpVXpUvxpsV9KYIbTwCXuLOkNSn4o+ajwL8UvjMUO0N6/zjTsWcwsT5Qy3/NYJRiDlsBGyuVkaHk4D7PjHTCLIBBAwVWWUxVxHhJRwK8J4stCTbWKwgZoVei3CJHpqf/IJPJs9zUggXOvI0LoGJhlAiXSvkFdO8rn3LT7r8cH2YV60Hp4cMQSSYebfdmHi096bH8yejXeDxe8XIsKtOwLzymmbt6RCmziED7r5+pHT5/ke56PbKWfOPRhsRInHHvadX2UrhziV6j4w7nAlnPyVbBP++xHnrYf3A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d02wK2RC4mNTATsnVC3tp5Ne2TK6JO4d3MmeXrl4CDc=;
 b=SELgIiOnqvpaoc+JsE7/Yw8YB7oB6uOYYrp59Bd+iOsq+AiBu54kxj8B0+hsL313mM7/Cpnlx5KnKo5Y3mODliG92kD+kndzcGE/uSbb84IcWe2/ajkhvPLtJfeCPqQ4ihaMq3+24cf50JSrLk/yUR+waCK6I8mlMqMHsxIgKjg=
Received: from CH3PR10MB7329.namprd10.prod.outlook.com (2603:10b6:610:12c::16)
 by DSVPR10MB997823.namprd10.prod.outlook.com (2603:10b6:8:389::14)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.25; Wed, 11 Mar
 2026 03:04:46 +0000
Received: from CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71]) by CH3PR10MB7329.namprd10.prod.outlook.com
 ([fe80::c2a4:fdda:f0c2:6f71%7]) with mapi id 15.20.9700.010; Wed, 11 Mar 2026
 03:04:46 +0000
Date: Wed, 11 Mar 2026 12:04:36 +0900
To: Catalin Marinas <catalin.marinas@arm.com>
Message-ID: <abDbxMmK0XEYgM1b@hyeyoo>
References: <698a26d3.050a0220.3b3015.007e.GAE@google.com>
 <20260302034102.3145719-1-wangqing7171@gmail.com>
 <20df8dd1-a32c-489d-8345-085d424a2f12@kernel.org>
 <aaeLT8mnMMj_kPJc@hyeyoo>
 <925a916a-6dfb-48c0-985c-0bdfb96ebd26@kernel.org>
 <aassZV5PjgFx8dSI@arm.com> <aa66XJDX4QfmEbNA@hyeyoo>
 <aa8uByvL9GwsGfnO@arm.com>
Content-Disposition: inline
In-Reply-To: <aa8uByvL9GwsGfnO@arm.com>
X-ClientProxiedBy: SE2P216CA0206.KORP216.PROD.OUTLOOK.COM
 (2603:1096:101:2c3::11) To CH3PR10MB7329.namprd10.prod.outlook.com
 (2603:10b6:610:12c::16)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH3PR10MB7329:EE_|DSVPR10MB997823:EE_
X-MS-Office365-Filtering-Correlation-Id: 1c766ef5-12c2-42a2-4e6e-08de7f1af382
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|366016|1800799024|7416014|376014|22082099003|18002099003|56012099003;
X-Microsoft-Antispam-Message-Info: vDOiNz1TekXl+7OaovpMkjNgS07AZPC+sYlKv3ahpnk7PWhIAotaHUbWXZPDQdO1bTMcB/tIQuRtE1TMRb/+sNJUle60lyYctfsPYEELPX8xUtUNNbHgW4gGraMmE9seHv+PAngdmPpO53rByfABLqbbFHLayy//rdwT5g2maEegtFm93Hcobqnh0qLiSCYs6tbHz8RorpoYJSejNxTb/anesGe8aYkZT0NSMqkGklvqWpTMRWZ25c4dRmuzo5xV0z0ezb7rKdxxuQsjC14jiP6M6/FxDs7C3R/vG52OOU0N9YNAt3OomuboJHA04ttezUUahsNjl9WiVCcjfL8OqDLlCAOrDGmD+ZziI47yN+uIEaJAHRvqGbzTRqQJ7GuSRLQjHagCL6vCn7qe5stkGL4tDuCFWj3rModW9iOOu+8Ov/FvPbx177JF7fruTHJ2XuGA45pfsj4mJMYvB4cOlVk+Ki52j9GBtt+HZzr0KfC7usRIGaUCF3rlrtyq/hiz14MPyIzoz6N6YJL0iSrNhl+RZ9xVkrtkqV9+Aqjw81eL97pZh0pdlzAlzjh061MJKHlHfTOVYbMQjLslTezDXnociz5zBwOeVsH0HuYe4KIrkhCs4E5fj0Hbj2MLx6vByQGfG/2uv6i50SV5CJszZC2pgoEhJfLtrfC5/KNYvkXMQ8pb2jKI09K8JLfSCFGinWIANmjPrkVLfG1flPKPJ3z6Q/t2dZo46kdF3wnEuFt1JjRJYcsL0Y1K14uhBJrJ
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH3PR10MB7329.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(7416014)(376014)(22082099003)(18002099003)(56012099003);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?x4Rb810mq0oVs8PE6yDWp/E5a/jdA/EFFGar1ZgUodsm771U8syQuz1KH3LK?=
 =?us-ascii?Q?6yuaKGXWy8Vkaj3ihKRoUgq96cSr3BZHZzL0dhyoBxLBYgSLX0TIFI6Fr8BA?=
 =?us-ascii?Q?OZbp2MB8L2RPZ+TPITTXmAUeBCaJyRBLmsYqK4phyZh4nwj1eRWU4SpRxi5g?=
 =?us-ascii?Q?xcGJIfjfpefv3CCiahEGmmntPbXdAeiIPHzdi6acU/0K5G7cBwW3evUmihby?=
 =?us-ascii?Q?lYxbgj/QRdc3qgrQRdvDnR07JAfIGlwnuaaJE60zC1QOiIyuTYqf8XiNP9rp?=
 =?us-ascii?Q?KkPMtkYOuHCuQTKqEaLLwd1M4M72l+jWGhLW5wBnUhJV7bTgHJz7xOXEx8jl?=
 =?us-ascii?Q?OEf02SOH34NkW/eXSMUmIbzOgnENVXZ3/pSEhlzAwBd+QEoCUDbV5npoD8vd?=
 =?us-ascii?Q?iul9AoHlBaI3U578YOFGJS5JzHV8cu3rLiXh1MDS4krA2fEoLVILVUVHkqok?=
 =?us-ascii?Q?L6u+xWkLmCw6ZZoOtON32DN2NEsRIOTiRQXdx01hBoppDw57Aw5nsM5jYPVd?=
 =?us-ascii?Q?kprBNo6E56H03DZ3rQqz6cdwYfzWefdNDYcZkFm5/Ai6WJDAadOfDvQ1wV4t?=
 =?us-ascii?Q?qSQ1w9BvSUN9Y+OVY8VXhm4m87+del2F+iox/tqTvqVp7iRwlNDHR/LrzPNu?=
 =?us-ascii?Q?Xs/mBYgM3s59UUvYMrieunGGduCNsDmZnr49xLMt1LpeV15admbMNhoN91DG?=
 =?us-ascii?Q?PiCiWsuJABpyFw9miz4hvKafHdldDu3YJ1lGzOevBjPT0mtXzbLfAGmlR4YH?=
 =?us-ascii?Q?jHC2R15XL3dUDWW5WzoqULwz9q9KIOhTK14BDEfCtPA5AJTLmprJuuCn7NxE?=
 =?us-ascii?Q?Zwl43xqZXYL1vz0r6awh3uQIS0rXcI7dJtIIOQUPiBN2NVu5d+V1KA3mKXaA?=
 =?us-ascii?Q?FKs7DVJ/L5YacAZV6PuOn9CwXmCPg9hQkKe44pMjL9Lc2weY2JtJdu+sFn+Z?=
 =?us-ascii?Q?RuBTKbG6N8Z9ZfLwEE96TjEii/u+4zbFJVT5482TJylM/qp+ApnAN+7exwf9?=
 =?us-ascii?Q?XckDtoCKpsaN1+hhsniFNYPiDVccEvR1S15sH3+Eg4DeWjATv5WJIGTvAPts?=
 =?us-ascii?Q?Cp/c3Axh8Ri3OwsQV+7MfvQLyCFa4gY+dN3/ByH7huvKgIDTTTd02YAjsfE1?=
 =?us-ascii?Q?EybjWOqX3xiKnSxKEtrLCAUXXYFCfz/laYycMscetOGpNkInjaR1i3L8nSuJ?=
 =?us-ascii?Q?7S/KSFOAAZ6tqKwv6mzE1ioxjNIof/TYkE9c8CqauIUfopyCS/d0IeyEmrYn?=
 =?us-ascii?Q?owT+IOj3ZciX8WSNK6zjJs1/ySH6+sl++CZC7eRloC/2/ty6IEHnTyAhAQj4?=
 =?us-ascii?Q?voiUbvvDgHNKGUFd24dLr2HOMYtTo4ArKNE2lGc1FOVcfXfTSoccQrXtyX0Y?=
 =?us-ascii?Q?kVc8VdiTo21gIASVIPBIj4SgzITG48XZPwEvZTOfqEAdVjNnX6NPze/j9/Nr?=
 =?us-ascii?Q?VgpiMomkNbcvnNHQoYcd7I9hFxf7XA9sJveBmaQmiVmO72UYfizvR4gbjQti?=
 =?us-ascii?Q?nZR0K1r8WVu74VJ1KbC8sH0UJZhfDCefEAUO3cWxmKwLaah9p6LVkkqL939n?=
 =?us-ascii?Q?UfwqGWe9UEEsrL8TniD2e8CugEisC4EOzGGw8+o83Hzb33PVOEk7glsRMIab?=
 =?us-ascii?Q?JMsvN2JoM5Kn7duUjcrW45kpIAyuEyfvMsnDJHrZfXPgDEH1JhEByJgc7bZB?=
 =?us-ascii?Q?ASFm/mP2IKkgPD1cyB5bgOWNlqOqo+ljrKJNYCVb6yEdMuK+wOx+uFc2Ydi/?=
 =?us-ascii?Q?yDtkLWuH+g=3D=3D?=
X-Exchange-RoutingPolicyChecked: XNeLJ20bGTDOCybYKzqjssxJULDPxP0OUnNpwB0L40x9Q9BpzYepPUIVduHEVpYJ/GurDrCamXqwsSZiFH3N6ZjaNjjLQFUHNAVDb2FWKTzckOPRErDN94V0U2DoUMlGf8MEsKiGfyZqOdrOv9Z3+pvwTiDwEL4yIFsXSRh8yiWVBpkwsYo2CCe7IYeULSMsB/tTl2uj5dz+yw+6EtmPwoOZ2mStIgvTX24zD+Tfa10RgWNrQPvrMLaROvzNb68FUWu8G5c2biNsYLHpZqKJ0RV5yR0TPaxDZNy+yHaqm+B3e/LfaoEJqsNN7c9au+jSw2PjpqxJ+sTleIush5U4BQ==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: YoYEiMFu+79yUdTlMMufNOS2tMO21Oj/7AYEwaShWSHu8FzfUjY1tID3dF+D02KUo5L+hKe4lxAVbIJUQQNA7uQdz6ZEgrmBnaqvqgBtrevgtgaXt0TKq/sB6GnzLnucc0kCqhZQvu+yqtMXhWYhBemAYahoq//wtUkpbmviFWf6XKqfspa6NwQ7cfwXxhh+4NBaW2rmUmwFnmCrJXXL2XkdBKXVjQt5FXVINy29Tq4sZaQWyAZTN/1Q0gFcciGL/W15hHCzMB/PotT+DUa7A+vSCdHvcsbw2BfM0QR+OknADnqZMvfgdQUjM0Wbc6gQnl61mBi2JIsvzHgpqk13VzuDZ9c/BL7gxkDJdAFJpHz2Gqy/uuaasYVyYfIUpbxrZ5PmM92637v+5tlUYNwR5mAk5T9GbMJsWIutUWr/b5kz2Ga3Z/YOxJ5iH1IIawryF7AhA13v0JbAtkn0AVLzVFiGk/87z3OCJH9iquTQhMuqoJdOefhSg5R9A5RMQZdscp9T/JZvdQXwougVt2vrLNL5OEC1g9WH/Inr6wdmiylGzMeflbIKIPhLoEveYB48W6NU8iX7v7WkypWXcthjGEjvFWbuoQ/nhmD4ktWxuMM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1c766ef5-12c2-42a2-4e6e-08de7f1af382
X-MS-Exchange-CrossTenant-AuthSource: CH3PR10MB7329.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 11 Mar 2026 03:04:46.6414 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: y0h2pej5a/FLI+4qFc0ABYRCuSup1UMph6ZpJop4MgVZH2j1aJG767F7vHyw8xq7gtv0R2gt7lVKISTfVpWY8w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DSVPR10MB997823
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-10_05,2026-03-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0
 suspectscore=0 adultscore=0
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603110023
X-Proofpoint-GUID: 2iyEuLhcZMB1xCFR2uuTuJRASEWj9MKQ
X-Proofpoint-ORIG-GUID: 2iyEuLhcZMB1xCFR2uuTuJRASEWj9MKQ
X-Authority-Analysis: v=2.4 cv=U5efzOru c=1 sm=1 tr=0 ts=69b0dbd2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=EIcjfB9IiI4px24ztqRk:22 a=VwQbUJbxAAAA:8
 a=2yfsraa4F8vYRlcxvuwA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzExMDAyMyBTYWx0ZWRfX31vmKwwIJ0aN
 YmTRTG8Op4NM0Rhz+beR5WE4yYvhoGHcqCWmsI02Y3irxQ4BUfgMyrPvB0nPL3kmVmt4cUm3EHW
 S7JNb+/LXZ1vFmPpPHY+HDPnaNqEcZphS6vP08ADbL/8HfCuFiJvSEeSINGyAnIPyqjrXF59bk8
 GvcpUHqwNVKXxmXkD0JydPoqwjdnVtBbLGfqh7XViDsw9Jx/AicC8Ut5TrOjsqCE7UWotNWZYeJ
 5Vhbi3BrKuPk6j47X5Nc4ruJFEvpnj4C9d/1nRRPqi/bMMjW086kPpgRuwpuVbhKEKPbRJnmx9w
 ZPD5rCq61k9cRnwx17olhZDboeBFEqHCY9rALmDmot8wxAEVGtdKUrwliIro9YFRBkCmBvvnE39
 w7aIecBncLcnMIbowlJNDP/UjpGhP0xFYZPLd4cZRJNQLNIoLCccFxPJokWFWtTppZM+tmAAVqt
 oXTC4DuGBJCs8ctD9jw==
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On Mon, Mar 09, 2026 at 08:31:03PM +0000, Catalin Marinas
 wrote: > On Mon, Mar 09, 2026 at 09:17:32PM +0900, Harry Yoo wrote: > > On
 Fri, Mar 06, 2026 at 07:35:01PM +0000, Catalin Marinas wrote: > > > [...]
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
X-Headers-End: 1w09sp-0008Nd-7T
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
Cc: Qing Wang <wangqing7171@gmail.com>,
 "Vlastimil Babka \(SUSE\)" <vbabka@kernel.org>, lorenzo.stoakes@oracle.com,
 jannh@google.com, Hao Li <hao.li@linux.dev>, syzkaller-bugs@googlegroups.com,
 linux-kernel@vger.kernel.org, Liam.Howlett@oracle.com,
 syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com, linux-mm@kvack.org,
 sj1557.seo@samsung.com, pfalcato@suse.de, linux-fsdevel@vger.kernel.org,
 jaegeuk@kernel.org, akpm@linux-foundation.org,
 linux-f2fs-devel@lists.sourceforge.net, linkinjeon@kernel.org, vbabka@suse.cz
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: 4ACAD25B422
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
	FORGED_RECIPIENTS(0.00)[m:catalin.marinas@arm.com,m:wangqing7171@gmail.com,m:vbabka@kernel.org,m:lorenzo.stoakes@oracle.com,m:jannh@google.com,m:hao.li@linux.dev,m:syzkaller-bugs@googlegroups.com,m:linux-kernel@vger.kernel.org,m:Liam.Howlett@oracle.com,m:syzbot+cae7809e9dc1459e4e63@syzkaller.appspotmail.com,m:linux-mm@kvack.org,m:sj1557.seo@samsung.com,m:pfalcato@suse.de,m:linux-fsdevel@vger.kernel.org,m:jaegeuk@kernel.org,m:akpm@linux-foundation.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linkinjeon@kernel.org,m:vbabka@suse.cz,m:syzbot@syzkaller.appspotmail.com,s:lists@lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	DKIM_MIXED(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	RCPT_COUNT_TWELVE(0.00)[19];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	MIME_TRACE(0.00)[0:+];
	SUBJECT_HAS_QUESTION(0.00)[];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,oracle.com,google.com,linux.dev,googlegroups.com,vger.kernel.org,syzkaller.appspotmail.com,kvack.org,samsung.com,suse.de,linux-foundation.org,lists.sourceforge.net,suse.cz];
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
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On Mon, Mar 09, 2026 at 08:31:03PM +0000, Catalin Marinas wrote:
> On Mon, Mar 09, 2026 at 09:17:32PM +0900, Harry Yoo wrote:
> > On Fri, Mar 06, 2026 at 07:35:01PM +0000, Catalin Marinas wrote:
> > 
> > [...snip...]
> > 
> > > I wonder whether some early kmem_cache_node allocations like the ones in
> > > early_kmem_cache_node_alloc() are not tracked and then kmemleak cannot
> > > find n->barn. I got lost in the slub code, but something like this:
> > 
> > This sounds plausible. Before sheaves, kmem_cache_node just maintained
> > a list of slabs. Because struct page (and struct slab overlaying on it)
> > is not tracked by kmemleak (as Vlastimil pointed out off-list),
> > not calling kmemleak_alloc() for kmem_cache_node was not a problem.
> > 
> > But now it maintains barns and sheaves,
> > and they are tracked by kmemleak...
> 
> We could simply add kmemleak_ignore(), especially as we don't need the
> data in these structures to be scanned. We can assume the slab allocator
> doesn't leak it's own data structures.

Yeah that sounds reasonable to me.

> But I couldn't figure out why
> kmemleak couldn't track down the pointer in the first place and any
> random kmemleak_alloc() I added did not solve it.

Perhaps we're seeing mix of

  - kmem_cache_node not being tracked by kmemleak causes false positives
  - sheaves submitted to call_rcu() cause false positives
  - not calling kmemleak_ignore() on kvfree_rcu'd objects cause
    false positives

So I tried both:

  1) calling kmemleak_ignore() on kfree_rcu'd objects +
     calling kmemleak_ignore() when submitting rcu sheaves to call_rcu() +
     calling kmemleak_unignore() when rcu sheaves are reused  +
     calling kmemleak_alloc() on early kmem_cache_node allocation

     https://lore.kernel.org/linux-mm/aa-1-Y3v3D1hzPvL@hyeyoo

  2) calling kmemleak_ignore() on kfree_rcu'd objects +
     calling kmemleak_ignore() on all sheaves (__alloc_empty_sheaf) +
     calling kmemleak_alloc() on early kmem_cache_node allocation
   
     https://lore.kernel.org/linux-mm/aa_R-6SdHYBBkQX-@hyeyoo

They seem to resolve reports for sheaves and kfree_rcu'd objects.

But yeah, there are still a bunch of leak reports
(hopefully not false positives caused by slab anymore?) 

I notice that some of those objects are freed in a call_rcu() callback.

If submitting to call_rcu() put objects into rcu data structures
that kmemleak is not aware of, how has kmemleak dealt with that?
(perhaps users need to call kmemleak_ignore() before call_rcu()?)

> > > -----------8<-----------------------------------
> > > diff --git a/mm/slub.c b/mm/slub.c
> > > index 0c906fefc31b..401557ff5487 100644
> > > --- a/mm/slub.c
> > > +++ b/mm/slub.c
> > > @@ -7513,6 +7513,7 @@ static void early_kmem_cache_node_alloc(int node)
> > >  	slab->freelist = get_freepointer(kmem_cache_node, n);
> > >  	slab->inuse = 1;
> > >  	kmem_cache_node->node[node] = n;
> > > +	kmemleak_alloc(n, sizeof(*n), 1, GFP_NOWAIT);

By the way, this should have been kmem_cache_node->object_size.
Because... the length of kmem_cache_node.node array is not always
MAX_NUMNODES (yeah, that's confusing).

> > >  	init_kmem_cache_node(n, NULL);
> > >  	inc_slabs_node(kmem_cache_node, node, slab->objects);
> > 
> > But this function is called for kmem_cache_node cache
> > (in kmem_cache_init()), even before kmemleak_init()?
> 
> That's fine, kmemleak starts as enabled by default and tracks early
> allocations in a local mem_pool[] array. kmemleak_init() just
> initialises its kmem_caches for the long run.

Ah, right. I totally missed that. Thanks for the correction!

> > kmem_cache and kmalloc caches should call kmemleak_alloc() when
> > allocating kmem_cache_node structures, but as they are also created
> > before kmemleak_init(), I doubt that's actually doing its job...
> 
> It does. I just added a kmemleak_alloc() in create_kmalloc_cache() and
> kmemleak complained that the object from the kmem_cache_zalloc() is
> already registered. Of course, no stack trace saved for these early
> allocations but it does track them.

Right!

> > > -------------8<----------------------------------------
> > > 
> > > Another thing I noticed, not sure it's related but we should probably
> > > ignore an object once it has been passed to kvfree_call_rcu(), similar
> > > to what we do on the main path in this function. Also see commit
> > > 5f98fd034ca6 ("rcu: kmemleak: Ignore kmemleak false positives when
> > > RCU-freeing objects") when we added this kmemleak_ignore().
> > > 
> > > ---------8<-----------------------------------
> > > diff --git a/mm/slab_common.c b/mm/slab_common.c
> > > index d5a70a831a2a..73f4668d870d 100644
> > > --- a/mm/slab_common.c
> > > +++ b/mm/slab_common.c
> > > @@ -1954,8 +1954,14 @@ void kvfree_call_rcu(struct rcu_head *head, void *ptr)
> > >  	if (!head)
> > >  		might_sleep();
> > >  
> > > -	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr))
> > > +	if (!IS_ENABLED(CONFIG_PREEMPT_RT) && kfree_rcu_sheaf(ptr)) {
> > > +		/*
> > > +		 * The object is now queued for deferred freeing via an RCU
> > > +		 * sheaf. Tell kmemleak to ignore it.
> > > +		 */
> > > +		kmemleak_ignore(ptr);
> > 
> > As Vlastimil pointed out off-list, we need to let kmemleak ignore
> > sheaves when they are submitted to call_rcu() and ideally undo
> > kmemleak_ignore() in __kfree_rcu_sheaf() when they are going to be reused.
> > 
> > But looking at mm/kmemleak.c, undoing kmemleak_ignore() doesn't seem to
> > be a thing.
> 
> If that's needed, something like below:

Thanks, that was helpful!

In addition to that - assuming that OBJECT_NO_SCAN should be cleared
when changing the color from black to white, I made that change when
testing it using syzbot.

> ----------------------8<---------------------------------
> diff --git a/Documentation/dev-tools/kmemleak.rst b/Documentation/dev-tools/kmemleak.rst
> index 7d784e03f3f9..da2c849d4735 100644
> --- a/Documentation/dev-tools/kmemleak.rst
> +++ b/Documentation/dev-tools/kmemleak.rst
> @@ -163,6 +163,7 @@ See the include/linux/kmemleak.h header for the functions prototype.
>  - ``kmemleak_not_leak``	 - mark an object as not a leak
>  - ``kmemleak_transient_leak``	 - mark an object as a transient leak
>  - ``kmemleak_ignore``		 - do not scan or report an object as leak
> +- ``kmemleak_unignore``		 - undo a previous kmemleak_ignore()
>  - ``kmemleak_scan_area``	 - add scan areas inside a memory block
>  - ``kmemleak_no_scan``	 - do not scan a memory block
>  - ``kmemleak_erase``		 - erase an old value in a pointer variable
> diff --git a/include/linux/kmemleak.h b/include/linux/kmemleak.h
> index fbd424b2abb1..4eec0560be09 100644
> --- a/include/linux/kmemleak.h
> +++ b/include/linux/kmemleak.h
> @@ -28,6 +28,7 @@ extern void kmemleak_update_trace(const void *ptr) __ref;
>  extern void kmemleak_not_leak(const void *ptr) __ref;
>  extern void kmemleak_transient_leak(const void *ptr) __ref;
>  extern void kmemleak_ignore(const void *ptr) __ref;
> +extern void kmemleak_unignore(const void *ptr, int min_count) __ref;
>  extern void kmemleak_ignore_percpu(const void __percpu *ptr) __ref;
>  extern void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp) __ref;
>  extern void kmemleak_no_scan(const void *ptr) __ref;
> @@ -104,6 +105,10 @@ static inline void kmemleak_ignore_percpu(const void __percpu *ptr)
>  static inline void kmemleak_ignore(const void *ptr)
>  {
>  }
> +
> +static inline void kmemleak_unignore(const void *ptr, int min_count)
> +{
> +}
>  static inline void kmemleak_scan_area(const void *ptr, size_t size, gfp_t gfp)
>  {
>  }
> diff --git a/mm/kmemleak.c b/mm/kmemleak.c
> index d79acf5c5100..99b7ebd03737 100644
> --- a/mm/kmemleak.c
> +++ b/mm/kmemleak.c
> @@ -1292,6 +1292,24 @@ void __ref kmemleak_ignore(const void *ptr)
>  }
>  EXPORT_SYMBOL(kmemleak_ignore);
>  
> +/**
> + * kmemleak_unignore - undo a previous kmemleak_ignore() on an object
> + * @ptr:	pointer to beginning of the object
> + * @min_count:	minimum number of references the object must have to be
> + *		considered a non-leak (see kmemleak_alloc() for details)
> + *
> + * Calling this function undoes a prior kmemleak_ignore() by restoring the
> + * given min_count, making the object visible to kmemleak again.
> + */
> +void __ref kmemleak_unignore(const void *ptr, int min_count)
> +{
> +	pr_debug("%s(0x%px)\n", __func__, ptr);
> +
> +	if (kmemleak_enabled && ptr && !IS_ERR(ptr))
> +		paint_ptr((unsigned long)ptr, min_count, 0);
> +}
> +EXPORT_SYMBOL(kmemleak_unignore);
> +
>  /**
>   * kmemleak_scan_area - limit the range to be scanned in an allocated object
>   * @ptr:	pointer to beginning or inside the object. This also
> ----------------------8<---------------------------------
> 
> -- 
> Catalin

-- 
Cheers,
Harry / Hyeonggon


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
