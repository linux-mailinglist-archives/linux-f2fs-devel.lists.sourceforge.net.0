Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 7C62FC809D7
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Nov 2025 13:59:16 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Date:References:Message-ID:
	In-Reply-To:To:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+8vwFNBQ30c4nr9BbJ+FLIVT2pgfJUfUab0PzOBOEP0=; b=PG71CiZcNpl04Y+xloyevC4qJj
	8igpJTL1F1hA9QhnJUXDBFpHRfkysN6QMSJtOW3bHkNM8s3QSShLDRoNZ8M8vhSPifL2/oCILHTFo
	8ZOYrVaUW3tZfm378mEMR5FQQL5m8IBQixb5r28Tx2iY9O4zTaMWf1mH3RfGRjyrGN0M=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vNW9p-0001P1-3Z;
	Mon, 24 Nov 2025 12:59:05 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <martin.petersen@oracle.com>) id 1vNW9n-0001Ot-U0
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 12:59:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Type:Date:References:
 Message-ID:In-Reply-To:From:Subject:Cc:To:Sender:Reply-To:
 Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
 Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
 List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=iSYdDm5dYcUmFSH9RxiVlVeDvqeEUm5EYiNri1jiAeI=; b=POhFBdHTylDHfZquCfIUpL5ZDX
 CzA4wSwpCjLr7JAeHa8R+Yx6uk4sq6qeKeHV6JniYripRrdJWpfv9PvoIkjV4ilA05pHLLetTFrAY
 X1yWfh2lnKuGL3BRVytcYFxfFDkI3Chng8gW4uByJlVOx4dV717Ruj2cVA8WIFC3ezL0=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Type:Date:References:Message-ID:In-Reply-To:From:
 Subject:Cc:To:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=iSYdDm5dYcUmFSH9RxiVlVeDvqeEUm5EYiNri1jiAeI=; b=mUl8L5QKKDGR0tGtxB5bNElyje
 W+yK6vLYIs/2fyZpDCysfUhowFHm/4EPfA/+hhA5bMy/bR7FpH/P1+nF0YrI93ayB/32wJcTuflAM
 VJ7ap5tEk8Icmv8d2BrK3yNyywiLAYe5A5f/s/vwlhjGZJbbyCXf8sAeUUmOOH8HiJss=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vNW9n-0006IP-Fe for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Nov 2025 12:59:03 +0000
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AOCVMOe1038454; Mon, 24 Nov 2025 12:58:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-type:date:from:in-reply-to:message-id:mime-version
 :references:subject:to; s=corp-2025-04-25; bh=iSYdDm5dYcUmFSH9Rx
 iVlVeDvqeEUm5EYiNri1jiAeI=; b=lAi6cOYV/pPSmbLv26Qj4eoQnz8HEAXN30
 QFEALRBzMgSstEmS0EFDb/cccWRqfD/82t7gbDDDY6c6cWuj6NLAnm24XgWTsitD
 9j4V+hRcc0XM16wTBnvJrbCgg/cLyq/Qg1Xzyphl2WRw2v5C6V1nvAyjnvTVYM4L
 QTELpHhXRbZcWtT8f3d9YAoUF6RhHegAfVhAO26uaaJtMbwnK/J4Ty2AnRdYifV4
 IB7rSmGPb1T/7b0IdkQK/HA8FvNvyAOdl55XRAlp2DqrohAEws03V0EqHfq0e4Vm
 tPrjcXWQvizuHwaoDnAWjNIjYsNN+MwXXX3k1rmAPIbLgNfPt9qQ==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4ak8fk9ycv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Nov 2025 12:58:28 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 5AOBm39l018853; Mon, 24 Nov 2025 12:58:27 GMT
Received: from sn4pr2101cu001.outbound.protection.outlook.com
 (mail-southcentralusazon11012049.outbound.protection.outlook.com
 [40.93.195.49])
 by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4ak3m82v3w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 24 Nov 2025 12:58:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=bojMdKOU4CemD5N9hZ1GBJZt+gbiYUHjpikFkWN56N+m3GkInfr52c/s5pqh4NYXF7QEh1Tz9gq0cquro0vd/B7xn9iF+12I/Qa4BizRK/flexaJx5caTyIxy17CfwrjkQ0YZl2KVk9PgygR8ltRCUw01pnrZ10N4oiNgpTxVDY/bQgE+d/X0zGMfKV+ADt/ujU0lt04W7nhQaUseTtSx5UIeVqQS13OwE9eUnCTNVkzUpDS/4YlsJU7/8x40txszNpEfnXKMFPMnAgYkzheK4intXxTPqu30LqqCu2kGHCb4HtNNqtbmclEETW6tAc6xyNLNIPZAAz7ZDwcnOji7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=iSYdDm5dYcUmFSH9RxiVlVeDvqeEUm5EYiNri1jiAeI=;
 b=dz2uzr+r0QTNC/a8kSjLMaqQCOiq4TZGvpMI48jZbbza21VEK6e0N5WJfUe+a4RxC4c17t1gMbNO8rF+qkRFXdiApHTBAHMULDWaZrdTzUM/kt6F8hKXT724K/BhLBE7muPoT7n5wKuv3OfSQHxUhb6XgqZoEo9dKNtLI7fzEbTyxSlIAsfjfUSPW6gVhwqHt6NvT8D0OAYE09kCoMms6NTcAVhKuVJUjVS3dNzSS57st+I4wRsVbucM9Ye0Oh6yDJMR6tBSXk7JqWHeRI9qNwKR9aQr0ZGpDHGevyMsTkC7UK4tfNoFnI4xHPKYDnYk4nCx+u1xUdNycEyj7JKdlg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iSYdDm5dYcUmFSH9RxiVlVeDvqeEUm5EYiNri1jiAeI=;
 b=lyzy9lYi5Y7ADMLzFbKhLQ2KYyQX23NtVwwaXhoiWX710MQRhQVsEeglTcr0rGtMA3BT/+ex1P7UDa4grIfmyF8hBHeTRFEa95s9vtNjZ8FfWrTbSoxmW0aYQa5MQvcInb4Mnfqv3FxlNoinr2k3Qja90oqidnhKPobAVcn6/Wo=
Received: from CH0PR10MB5338.namprd10.prod.outlook.com (2603:10b6:610:cb::8)
 by CO6PR10MB5790.namprd10.prod.outlook.com (2603:10b6:303:145::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9343.17; Mon, 24 Nov
 2025 12:57:52 +0000
Received: from CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf]) by CH0PR10MB5338.namprd10.prod.outlook.com
 ([fe80::5cca:2bcc:cedb:d9bf%6]) with mapi id 15.20.9343.016; Mon, 24 Nov 2025
 12:57:52 +0000
To: Chaitanya Kulkarni <ckulkarnilinux@gmail.com>
In-Reply-To: <20251124025737.203571-2-ckulkarnilinux@gmail.com> (Chaitanya
 Kulkarni's message of "Sun, 23 Nov 2025 18:57:33 -0800")
Organization: Oracle
Message-ID: <yq1wm3f4mgq.fsf@ca-mkp.ca.oracle.com>
References: <20251124025737.203571-1-ckulkarnilinux@gmail.com>
 <20251124025737.203571-2-ckulkarnilinux@gmail.com>
Date: Mon, 24 Nov 2025 07:57:50 -0500
X-ClientProxiedBy: YQZPR01CA0179.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:c01:8b::8) To CH0PR10MB5338.namprd10.prod.outlook.com
 (2603:10b6:610:cb::8)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: CH0PR10MB5338:EE_|CO6PR10MB5790:EE_
X-MS-Office365-Filtering-Correlation-Id: 6483c847-9d0b-44bd-3839-08de2b591426
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7416014;
X-Microsoft-Antispam-Message-Info: =?us-ascii?Q?eNVng+7aPKC8impopddqDzhupdQHMIsIONM82x99ZcvIwJ524C0Pj2JpPVNA?=
 =?us-ascii?Q?A/HYn7DkVkI0fug5+wKj5jhm86dzm2oovltOsF3ycnTtS3ylzLKoNRx0A+96?=
 =?us-ascii?Q?Fu4R8J2p2jBwNOU+vmKxGgwY1urvhfDS3BbcBUwFeeGCBbtz6H1hIFp4ksC2?=
 =?us-ascii?Q?DflNzVqyAIAVhC8auG7pKcwnrkJhxpLPhQ/Ont4WeUcEJQ73Z6mH8+p8lH8M?=
 =?us-ascii?Q?9xuZ1ywkgIf3HKkWDtUogwDAgT3EhN72xpW2Dl7RFyX4GXHcBT3b1NzERmWP?=
 =?us-ascii?Q?3np08dDJOofjYgGYNljyud/Y1mQgGRscQ2EUTQaDxdHQSVpGMxZtXidROURq?=
 =?us-ascii?Q?RXPDSGBLMw0vpap1D0ges++CaphdYPeaoZ/RWqsF9B1m1RNeqMYcMZta5bOW?=
 =?us-ascii?Q?XD8ovT63zfOdeI5DVgBLTHWB25B10DUXo/7Uy1RxndjKwPqaEdGDD9B3wHAx?=
 =?us-ascii?Q?Al4w6WTi2iqGciF9cuvIsa+CEQRJoBG3mrYTTwtCOxr19bymS3/8/vgVnb3+?=
 =?us-ascii?Q?n/B/9f+dkYggAN9xUq43ebQOhTBrDeVH4vcf3coccfcf8y0KPfDLQwJs1Kbj?=
 =?us-ascii?Q?8yntgq3kEqis6pN3gxkHu8u6586CtFKH4Hlw26I9P6qq81uUQ5o2jabB1m24?=
 =?us-ascii?Q?OStPo2qRbZsyO6bjZ+W2FfF1zaAEy9J5RL65ms8ZGD/qe9ZP77OnWmAesXVN?=
 =?us-ascii?Q?Po75vtuXjCRUZSEGqVGB4z5xtwXtoPJJqLwgLsHTkbwwMPF8tJ5d1NdX2rFY?=
 =?us-ascii?Q?NdykidcoQXWnB5WtL+9pYSIGC4sOKpxcvJikx7NDGHKoVegKQIIeIQjCDaO8?=
 =?us-ascii?Q?ldJwd6SqJtECr+q8OanBDE9TgLgnTbikMDoUDyUie1E2D8o6fv8etbthokP4?=
 =?us-ascii?Q?FmWmXCCk0bjeBiAyQ0rHhFz4goCrgUszCBBaWSDgpYu4dsG1dvGdIMizXvh8?=
 =?us-ascii?Q?tNeVGzyE2gaP0YklCumqQqx+qCIpQqnelVvfiKTby6d9S0tjJZa8L8KvpLcZ?=
 =?us-ascii?Q?jb0YWrGpatOPKEW9qew0fiIF+MSLzqp+8vXeMHWqmwXzByAH/ddkIvKRBByV?=
 =?us-ascii?Q?SZiyRMyPmkq3Xuk+ovC0IdvUyIULobyyHZoul4L6tqkBx6zytD5l4lqcVbSr?=
 =?us-ascii?Q?SiA3eHfQ75qis49Fwcm0XrQlMVv3w54nGCMK/SMC7gpnK41KI8P0ti5NPw11?=
 =?us-ascii?Q?0sscarrh1pLsVYgBQ8O+G00oc8lZ4fo/nQ14iJMF4VueTe2tQ98wT5X8LZxH?=
 =?us-ascii?Q?3VXbc6adO83TaAhkwLZMjy2GKkXLiu6RtiB7paLaJpSBEfX6lRaESa8wssny?=
 =?us-ascii?Q?IFtuRoi+y+2uBB7XOEQ0tJbR+h2lAMcNDSBbLuBVdpLdBIAT1zqjV40CO/cb?=
 =?us-ascii?Q?/kN9SUbNopKm6FgsfTR/6FBBLcAmjTP8e6VpvX4ZZuyNJKrUoSVqJqy36dO0?=
 =?us-ascii?Q?w4Kcxhlp+lyL3QzhykdllvOVLmC/BE+v?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:CH0PR10MB5338.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(1800799024)(376014)(7416014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3QTvCO3Z3bCTp71Q4hZWR7RG3kzlq0WFfgUHhc7ry5eQYQmqhSFLf+JeRrTB?=
 =?us-ascii?Q?GOBNV/xH5Z+t48O0UI/tuSsigsyV67lnp16hVGeCyEt5ZQZefIBTLI6xhwem?=
 =?us-ascii?Q?e2gdHonDR6tD1M9YlxzDjEoifNTM06tbF9N8imsLFULjZ8jHgEky9Y8GpkeY?=
 =?us-ascii?Q?Pw5zZIieJ7S+w+C/8Cs0yKuYEjKd4DZcQbeENughW7dhaLFt8RCkusxRmv64?=
 =?us-ascii?Q?5xIo3I08trGgrgjxbX8bczihXFA07fy7fVW0wcifQ7jrHCh1u9hfrbOqTjuo?=
 =?us-ascii?Q?e6XUgPusMh9PKY2zdWcaQxVDEvIBJcyFMF40Ox1Nk334LV4GLCGJHC06epAD?=
 =?us-ascii?Q?U1NVugZPqZyVsRM6jf1wXHYpuZr5DqtrWXPR26elYclzDYD5aRcGe5mmemff?=
 =?us-ascii?Q?/nMD6keut7o4qIwMlcwvZZgQRyoNLQ1+lIpI9OhgFtVihrBBbpJeeW+9qy6b?=
 =?us-ascii?Q?Hd8/aNCebozXVQ4XIpD9OEWoHUwGAEG3R0u2XppUv0ked+919+LFlxO1r2fW?=
 =?us-ascii?Q?NN/UG2nJ9OmBr8wTgp+gvwXTy9cP7lCD+OpEE6HTd4uQDAd9XraMyc4chnMO?=
 =?us-ascii?Q?XW9dHeJBY4Fa75ymjh7yvH6D/y6LgZyUuC9oWyNeM6/d25Khn4zwxLctmMxB?=
 =?us-ascii?Q?++HWD8fPxF3CFsDZunB2P98c5by6Ve1frySfxpGQu6AA05mYas/DMYvnl6So?=
 =?us-ascii?Q?zWAvo7twq+ZrKvjObqnpS7y7qMn00XqSJobkDOeY1w8ru1ulf8qb8o8mYxqN?=
 =?us-ascii?Q?qkTA0hYoqou4s7DlpP74CkGDWb4YzbAvhjzUPjnO9JOSPMWQ5myoNIsSrN2d?=
 =?us-ascii?Q?KH0xI2wwHSlrMmu2Dhtw5qGEOw9n6JEoIZo24dy4DarRJwHldYXCVA4hZPh2?=
 =?us-ascii?Q?kuq+OGSeHz7RMgoqmFUg6DzfPusQ6iZ5NAHWp4XFtJABBMAxjzxqaZ5qFVHl?=
 =?us-ascii?Q?4flvutTteXL5UrGnUonURTco48P5lydpPGIbCBEwSJF2R2xACO8B635J9VNS?=
 =?us-ascii?Q?F0t032k24zNGwo0dnOK67l8G++xGFJNRYGftd8zTY9Tcf5Vy9t0LQvKINIUZ?=
 =?us-ascii?Q?bSsZXgzbIfBgvJuFvI65sKA1RyFPvh8x+iApeqA3zsQ2mtWgwwQLl+B5bKKz?=
 =?us-ascii?Q?uv/04a7mY4PKELW9/xf/Szz3jzDy2WWL5bzZOlqGURdKH7whT0DWY4baLFr6?=
 =?us-ascii?Q?qyoDD8sMdOqA7txg2XBiHXVW6E43dwtTEUkI/b8U9MN+nFFMS8QFnbfr3lve?=
 =?us-ascii?Q?JGlKBUYXCIDiIeni8/KGN3gFenb56bXIHmQ2mnjQBTVPv19sk4EF6fwZvIJj?=
 =?us-ascii?Q?+dCJB+k0oGTDt1nRmT2bbuOOVQzsAjdDOSgWI/4DU+N7XxC/C28MBjKZYfiB?=
 =?us-ascii?Q?qSBb7rGKp9guXBMQkrx2KrA0Kp/6EuP+AqtcCsFJLpLpEN9StqfkLfECL5V2?=
 =?us-ascii?Q?sfeKdzpMu6Q2w2mG7kCk/UfT6Abic2NK8CJIhTbmLCpKudzWF7l3OsdwsnR0?=
 =?us-ascii?Q?5l39QhV+huxq8IuYWAXZHjD7jXTV0X0QwBLZMapUuJ1PTZGOwjiviWd0MwPt?=
 =?us-ascii?Q?I8JVWys8DJkqOlUEflC2ETcuS+fi9eEoony6Py8TrAtF2svXtKnaErtPEYFZ?=
 =?us-ascii?Q?4Q=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 0qzk8Do/XiA4ULENhzlKaFjg8b5AgkHAOBnFG+NGs5mNcKmuP0EotWD/hQjqekFrL2zmZNQekkLxAO56Fiu/u++H4PY8g+omgsXU8KxJdCdaMCr/LgIqUnsZ+gNB3MJC8WKtZOxloN1ZTf/ollsnLFzzFOpKBkLbLx462VLbr5doejA1P8jVhhopZZw95RvX43dSmxhbYLQIMplLaAdpLbEqdGX3B5D+WJjZ697VBz8aK7+Va/BJ1tb6d04fYEKAYX634u6MpnK44Z3kHyNPVgjZLkUyO7F+oX/8CPkHSuz0FwDl/IsNWWP8f31kM/0csi0iPGv7ioyh8WMru33HCBqG1/Moz9fy/uglu+YQsJeKEd/fg+ugLgQ1DFS92crPXAWrmyadfhW5Tj4PFVD4SzoYrU8tPeD0QOxSZGZ1X/kRtqaji99XgZIivARvuaq8g0TXke8bzaQXE2vhsD4GOjnSVpE4poQYIpVAH5olgV+hdbTebNxzxVlkXH5l+utX7hrYzMZfaw1XpSOYltEFlrcMNd9+QKe9AmeJ1QRvVwu/OqMPfVcV0jMMNjfNwXPdSKeRgdjQgkOEwXESbnfflldV9vOZU0JDSVNv+VNBGxE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6483c847-9d0b-44bd-3839-08de2b591426
X-MS-Exchange-CrossTenant-AuthSource: CH0PR10MB5338.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Nov 2025 12:57:52.5082 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: M1XPRZVq+8gQPZTz806tK3I/UFpZC26DqChJb83DKO2khvGRE/mJdhdXLOdMEyxFhaNqmJSTPPIpuMbR7V7I5/G38NZZLPXonE/R4Thh64c=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5790
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-24_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 adultscore=0 spamscore=0
 bulkscore=0 mlxscore=0 suspectscore=0 mlxlogscore=999 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2511240115
X-Authority-Analysis: v=2.4 cv=f4RFxeyM c=1 sm=1 tr=0 ts=69245674 cx=c_pps
 a=OOZaFjgC48PWsiFpTAqLcw==:117 a=OOZaFjgC48PWsiFpTAqLcw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=6UeiqGixMTsA:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=yPCof4ZbAAAA:8
 a=pS1GTPjh-CLonHFnBUIA:9 a=MTAcVbZMd_8A:10
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI0MDExNCBTYWx0ZWRfX6ZGf9r8HXV/4
 UkjHTGB2KnMPYJPHo+9yJTpfZFk+EZMf9xKRL2k799ra/rFs/3eXLRb2HRstZRytJ9WfuV8l+oi
 SJa6rr28SQdFVk+C28fSzyuqqFjZWG7YboDKAP/sGnQ2zx8SLX4gc4GyH000I5c8pZsMrp0KqGJ
 sxd9GwjKtOxjUEUrrGq+3/pqVlN3OCR7jSIJlN25z1AqChEio5IoDmClpZgulzWVDkJfsKYh/LI
 /UJ9L2IfcGM4NHL5L9+0uVHBXeF+sk2xWwQrElFtRCfjT2O931XcBC49B+b/VHkX4yFPgZSz/cr
 nUseM0xG3dQSiGok3XxTV3kow7wszwWGgYO7nSDQ7DfynlrGMvGDuXuV+2BXxoe5gqA6WpsWcPP
 tR09BGGvfSWrSMmv0MfDh4U/YKAQiA==
X-Proofpoint-ORIG-GUID: Nq6YxKY-1Cvv4R7HolR-IXbi4gwohAuE
X-Proofpoint-GUID: Nq6YxKY-1Cvv4R7HolR-IXbi4gwohAuE
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  Chaitanya, > __blkdev_issue_discard() always returns 0,
 making
 the error check > in blkdev_issue_discard() dead code. Reviewed-by: Martin
 K. Petersen <martin.petersen@oracle.com> 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vNW9n-0006IP-Fe
Subject: Re: [f2fs-dev] [PATCH V2 1/5] block: ignore discard return value
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
From: "Martin K. Petersen via Linux-f2fs-devel"
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Martin K. Petersen" <martin.petersen@oracle.com>
Cc: axboe@kernel.dk, dm-devel@lists.linux.dev,
 linux-f2fs-devel@lists.sourceforge.net, kch@nvidia.com, sagi@grimberg.me,
 linux-xfs@vger.kernel.org, cem@kernel.org, snitzer@kernel.org,
 linux-kernel@vger.kernel.org, linux-nvme@lists.infradead.org,
 linux-raid@vger.kernel.org, linux-block@vger.kernel.org, song@kernel.org,
 mpatocka@redhat.com, jaegeuk@kernel.org, bpf@vger.kernel.org, yukuai@fnnas.com,
 hch@lst.de, agk@redhat.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net


Chaitanya,

> __blkdev_issue_discard() always returns 0, making the error check
> in blkdev_issue_discard() dead code.

Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

-- 
Martin K. Petersen


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
