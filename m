Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GLkjKYUFqmliJgEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 23:36:53 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id B195E218F4B
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 05 Mar 2026 23:36:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zaf7/OyRHEiHHJyEVPafden2+HWaaVw2jZrZRikA9Go=; b=ZnPTkV+xzYRGiqKVfTSjFbGXNQ
	C5/nITEg8gCgmmp+OIRN0c2K2zOX9OveqdA9xgwjCwxp5CDWSrxrlTWcXaU2oU5aAgdMb/LmF6581
	AIqHyQK6ix9BKOOocpJm+m8Pbe9FovCQ46paD63nV0ZSd9EFEKS+97k4hyMLam0Eqto4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyHJE-0005tB-UI;
	Thu, 05 Mar 2026 22:36:44 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1vyHJD-0005t1-0g
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 22:36:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=sK4hWfTfQi9uKMjCn2prGg63LIXWP5LivyqQBiu02gg=; b=fwfb8Ao2i1CfOsgkX5u8BiMQW7
 Egmjb6ePHpVOe9HBBJbBwrHxPDZkW8HKUTKC6hyptKNZqTcyqNh4EZP3VgeUsqUfkNa8Oda78yO+M
 NQAFpB1KtlVBr5UprZXXRu/R9xgNE3g4hk910QFHch6QSep9aOdMdfKy2eMuGguJA0aQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=sK4hWfTfQi9uKMjCn2prGg63LIXWP5LivyqQBiu02gg=; b=AOEqY5piSss6spbnVIkkNS8IQb
 /IjDxkI6XVflszqe07ddrLqpfzMiCYyiP7E6Q2lguE1gQsgks9GCFktGJVFdYaVDguIZjKEKNq0iS
 pEpL5nYIHUgi948v4Kn6p4LB4zcIIPXGQrGiAA0Za174JjIFW0IiDOqQk9ZmEHjIhytk=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyHJC-0004dR-Eq for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 05 Mar 2026 22:36:42 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625LgTHW1632969; Thu, 5 Mar 2026 22:36:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=sK4hWfTfQi9uKMjCn2prGg63LIXWP5LivyqQBiu02gg=; b=
 GhFta4WW/V7ye4T2Y8dQ7wAkqAYyNFBxBgCQFlIHyZdaTmJFZZ1SZwhOO4b3VKiE
 dVJe8+vCKCBVEUW3A9sFJ2YlqSdPDzdDrrm+sOOXDtiVxS3FZZ6hFl4kR9l+xR5C
 Bad08Wpl0xQJCHBL4WFxtbNJjZwnBOGuHBuaJlMZqawwoP05KzFZk8xJFzfQ/td/
 6fu2Ph20FES3xNZleMXZ+Ma+9O5XkLCP79BXp3Yg24TykxPjUxVB/v3QsaYM8RUd
 vF66+ne3eKw+rR2qcIuVWUjwYnjQJxvgMhZhedIEYLKwcXXoOLQe7knbyhYwpSPh
 Bt3viDGXMd4wBSqDY7r6RQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cqhysg3dr-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Mar 2026 22:36:31 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 625LmxOS029694; Thu, 5 Mar 2026 22:36:30 GMT
Received: from dm5pr21cu001.outbound.protection.outlook.com
 (mail-centralusazon11011063.outbound.protection.outlook.com [52.101.62.63])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 4ckptdujsb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Thu, 05 Mar 2026 22:36:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=txh7ghCRODp1yT9u95GeaA1UlS1XTWB1MZuxopg4zbPngNWC9VvTVcnquIibSunxIs0wipiW/u7dfmbwhZtLh4GWicZcciq560ddo8sZJ6P86Rbyy+poG5HuvODSMRKCckVTtLKAvvbZo4McRo7z341gb7KwxBmm1FfM20iQ9pnqYrWBcuhvrJvNUxwVq4CgoAxpM6qTGVssH6aqTM7sVYULIPExHXDD8MlyiJJWSrhF0kNRBdk3FN8h31wV91iKbYqxaioq++CaeTVxiUBd3FIZdHSuVXnuEldy34hnqB0UoN6Dhh+mvp7F8U5VP8ogbkPDB5IgPDrduy1J5ltNyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=sK4hWfTfQi9uKMjCn2prGg63LIXWP5LivyqQBiu02gg=;
 b=q/GGce/CwBIWWWsRe7K74RUFQ9Xd9nOf5x7M3SF0VdV24rMYxVCsmMyMRBEzjUzLGlX2XarviKwvSrbuGwP2xG4sazoUhfCFnnipa62SnV8ndmpnw9E65v8cLFvNzUx3CRnLdaADP7m+5gnk7gzZNggRUKbDAI8aUJ2lEhm3RlOoxavCDHaeq8PvrAnzn9fPqJiQNH5swRFSSWBSwv/HVTlZXaI96IM1Y/WT2RQVyY1IG+cCfa2Ldd6dJpXYZKvDShTVb2+oIQ8RW/nYeli8qYoyE3jpYL/aI+XLeJeG9xitY38fsTNCPqK5pd7oE0Gzk+tnEaKkjBYO9kxx7XxkKQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=sK4hWfTfQi9uKMjCn2prGg63LIXWP5LivyqQBiu02gg=;
 b=heNbyjNBs3jUD+rN7WWceohVY3javXncEObRHs0nI5u9Dgyr/Ynw7ymL0Z4SfGecEh68UnDBJw+v3uuabffKojFQJCb520mygq90Rmi6/XwUF4JAuXQ8Y9cE12lUYEqZKnGcgr1JwTkcouJBhuCvFImieK8WovMGocTrXcqdb9k=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by PH0PR10MB4647.namprd10.prod.outlook.com
 (2603:10b6:510:43::22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Thu, 5 Mar
 2026 22:36:27 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::5266:1601:5598:3f0a]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::5266:1601:5598:3f0a%4]) with mapi id 15.20.9632.017; Thu, 5 Mar 2026
 22:36:27 +0000
Message-ID: <6670e402-8758-4c64-b441-fa7aca40ad8c@oracle.com>
Date: Thu, 5 Mar 2026 22:36:25 +0000
User-Agent: Mozilla Thunderbird
To: Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20260304190424.291743-1-agruenba@redhat.com>
 <20260304190424.291743-2-agruenba@redhat.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <20260304190424.291743-2-agruenba@redhat.com>
X-ClientProxiedBy: DB7PR05CA0010.eurprd05.prod.outlook.com
 (2603:10a6:10:36::23) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|PH0PR10MB4647:EE_
X-MS-Office365-Filtering-Correlation-Id: 1e3ae435-ace2-44b0-2701-08de7b07a39a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info: ZSsEAFvkKbDg41tpRfpg3ABEr7rB0pdBal0etxFGkEMlqlj6nAWD8Ny+loDJYzWrjydWSFjh9lPD7qd0kqqdHf4r6g2j4BPtOcL6Bp4KI/IY8ge/QQiKOHeOmwToRKtBEARQ1Kpy7j1czxCnDln/UXnZCUdfqhgi8WvhJXL6v7JdUEBYaCpMU0WOsixEHpVj6y3i2+wV/abmjgOQnsWeaXwHMdvYJG6DPrtgdg137zOn+fPBr2zBit7NoGfNzeuhEcq7mjSgsa1SP1RS5Md3HbeCtV2JwO4yZU4ZSpSlVi2NT5MA1h4mAB4CQcy9WvY6R3e2vyRK1+OpeTLWHHeBFmD6aHR8ijUGWuDe0Ni1nN4HRFCjMeMMlLD6B7KBR3MfMweD1W3RV6JrkyQvUxKZYz1ewx+VAnjylhehx292r9Z+dY/v71jxBB6VZ+WOndhuV2mYyhVXTH0ts7zyjIJsVy1aFdqb0yy+p/b7tB9rtJKen76m3jjAXzXXQ0Jp1BpYHlEDharbaYc6+BW6jpQp1169B89IyMwoxyNy1gJEBSbOY9JKtR3q5lBLC15BIJWkOzyYfZmWRfTjKsEY52NLJYL8SAc6DkW79QJs6co3i4kHQHLXlpRqrIxqG+15pePW3NmMPVGuscx23hfomFYjaEoYjCcnZohSLFAM58j/SE2KUNFSfzDmOnUBucRbc79cI32sLhnx2uQ6SxSU0XbadULjOstQl1goARaf/dQZVzw=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFEAFA21C69.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(1800799024)(366016)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UUFMampONWMrYk55L0dlK0JVeUhEaXZoQ205aG4xaWo5dmVMR05OLzZWM1Jh?=
 =?utf-8?B?VmsrUk9MdWp6MTVIaXBGTEYwTXJZQ0YwVVNRQ1hld3BIWXQxMHM2TG50SUhG?=
 =?utf-8?B?K0ltNlFTbmhHREJTdWFNeUJCWkM5aElmU3BvSCtXTXIyT0VRcG9DOThNVkNr?=
 =?utf-8?B?c3BndXA3SlNXL0NFUTVCamptMEN3Q1dpeGphcFpqVFhraDBTOVZyT09PV1Vo?=
 =?utf-8?B?SjNWSElQSENXakNvM290eEQxNmYwUUJQOElYdW9DV0tyUmxKandjRCtnZEpK?=
 =?utf-8?B?eDZTb0tkcjFQR29yTnIySWlQaFBzaHllWnVvb001NlRqSHVrQ2Rzckh2SHVE?=
 =?utf-8?B?L1JBajNxWEJyV2hhTW1Ram4wU3RZTXFQa0JDUFNSMG1CV2FBUTNyVi9BZ05Q?=
 =?utf-8?B?N243aXVrWDRQV2wrZlhZTHJBblZIZVRuQ0xUdVZydlg5RURwS3RTU09VTUxS?=
 =?utf-8?B?cjRzTDQrbm1WUEY5ZktiM2ZTTFdCamhGeUJDU2NhLytHdFVHcWRXQmhQQjRY?=
 =?utf-8?B?MHNWRDRrT0ZESThRNTY3NDBVZWF5OHdFbmFkMys2YnFXRmFRTmp4b3g3KzUr?=
 =?utf-8?B?K1phMDN4UmVBNndoL1ZTUTdoT0lnTmdsNW5jdkhoNFNjTDEyQ3VpUWxEenJ3?=
 =?utf-8?B?Q2lZaWNlMlZHVWg3R3d1RkhhMmlnRCtjQytLQmJ3VU1UVUdteEtmWlJoYXRn?=
 =?utf-8?B?TTBJSDM4RjFNRGZMNzdPM3hyM2IrTnZtaEJyNkZ0NXZBN09wUEdyanV3dVZh?=
 =?utf-8?B?dzFEZCt3cjM2aFEwQWlaM2JzZHkvVHoxQ1NRYkt3aVc0dTRMVTczWFJXb1VQ?=
 =?utf-8?B?VnhIM2VmRFZaRGZQY1pBYUdMWWlaOFY1dFhrTFZzaytRWGJwM1d1SWpHZ2c4?=
 =?utf-8?B?UzNla2NUeEJGQ2U5blphSnZlQkJIeFYvVWNWYnV0a2dsK3kzUUJHNTJ4NWR5?=
 =?utf-8?B?L25qRWFackZTdElDaWZlOFFDTzVzS2FWczF3L0xhcE42VC9QaUZtYnZ1azRh?=
 =?utf-8?B?Y040a0NLMS95M3FFMXZ2bzNuSnJMU2ZJT0NyUFcvMzFFZUpocHZnbEpmNlRY?=
 =?utf-8?B?OHNPeEppYVN5YllLSVdob3VYWW9LWC8rRnRiaXROL1dNdVo4OU9kZlpmNjU4?=
 =?utf-8?B?cTZ4OVh3NXMvQ2doQ2ZWb2hBMWZ1Mk50QVNwaWlFRDQ2ZGJxMHZ0Sy9ROGdt?=
 =?utf-8?B?SnF0a1NtNGpOb3JMczNXYmVPSWI3SGFGRzFOS08zOWpEQzRoVTJ4L1pJWUUv?=
 =?utf-8?B?T08xNjJXZXhtZWVSSmozZDhHOUNoMkIwNFFhU3UxclF5Y3lGdjkzUFpyWmpU?=
 =?utf-8?B?YVA1Q2ZnMStJSEVXN3Z6eDZnVkZXQkI2YTFFd3JEQnRkcEdxUDI3Z1hHMmJ6?=
 =?utf-8?B?Mzdmb1pObm1kUjVWaWlaRzV1d1A4UW9sR3pGdDNYUXRaRjRoTHVlWGNQMkdk?=
 =?utf-8?B?ZlQwMnBxVFowSy95cTRVelBTV3RBRkR2UllNQ1ZTdHNRWkJiUUxEQ2RRTVZw?=
 =?utf-8?B?UFZnZERjbGNuQWp4dXNYTTBZRmZoQlJkV01NdHhRNk1DWVdabUg5dEd3VzlW?=
 =?utf-8?B?bDVJQ3B5cndnU0UxZUVqakxmb1hwQ0c2V3JNNVV3TTBMYTZ3UGw4bzA0UW5n?=
 =?utf-8?B?LzNHSDFRaGk2R283TGV0M2J2YmNEb3djSG9jaGNKMW5POXR4ditwNGNEWWVY?=
 =?utf-8?B?ck9rY0ZkRGx3QWxhL1ZXWUR3Umc3cHl5cDAzdjNWWHFkU3cyQmpXcUdCQzVh?=
 =?utf-8?B?OUdwTnFYWUozRHkzLzNPTDFqUjBpK1JjUXRQbThmdnRPV0RXeGRWMGhpVnBX?=
 =?utf-8?B?ZHEwNElWWnBrOWxwU0xIcStFK25naTBYVGZPY1lJTVEza3RWQy9UK3pJNFN3?=
 =?utf-8?B?bEtOZnp0YStBajVuKzI0ZEIydFQ1Njd5WnhLRkJxY3d2UWxDUGYweTZXWlpI?=
 =?utf-8?B?VWp5NnUzOEE2dCtwZzhJanlaZnI1NUVyUHVHR2hwdXExajV6U21hUGEzMTdv?=
 =?utf-8?B?dG54cmZiL2RlMWZMSTRVT2EvbjVNWUt0ZTl6MWNsL28rTTZndnVCVjlpcGNj?=
 =?utf-8?B?ZVJhbSs2UFdzdDBOZ3JULzhzSmhISXlzSzF2MFNRSmh5eUVEd2ppQkZsUDJR?=
 =?utf-8?B?K3hvWGkxQlRabldORU1EL1lLTzhSTDhaYk01VVdER051NGZDRXI2bVdIWXM3?=
 =?utf-8?B?MVVBRDBnQWc2SGRpbTQ1ZzNsU0lMUVh2NHlIYnJrWjhVVngxMVlkeGtIcjc2?=
 =?utf-8?B?bVpXYUlGT1dFU00vQjBRQ0YxMFYzcXo3d2s2N1JaU1dXVXFPTGVlQi9yZXVa?=
 =?utf-8?B?SVd2VXlLY2RXYVk2QldxWW1xYlUzb2EzSVFrUk1yWTdIU2RBc0dSZz09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: FpBth3xlpX0D9i5vxsNMARHUpkVVHK61KP6l3rr28Dw0XnklXEE1DMs2CxHjSJDUR8FgyeeyAAc55uAX9E+1IZ5oukDK94e4eFdtYGKoQ+l+HCVetDlqEZgy6dNqWQcx0TJ0nbv+nzJMllql65/jqEGsOjwfJiTqEUq8mq9cZ6grsvgw0sKjd+oS35rrSmNih5rZNKiVETAprl2a62BKhUlFKEaR6sKhOPuTR9nTFsKMeAciHJKaV4AafF0y59jj9ZCWJI9oHGgExYPFcEvnmx4CdtcdgpvY8LmnNobMrIoZ5mAGb9gfrgtJGrrW2Z9PUlVyTRP3Dy9kgU7lYQT3eEPNHQK9AmAKUCHNs6juQFFDcC7MtYlH/Ew3ZGXLMwJYEJpdC129K6Z2Kl2MZSnZ6MzbCafeZSORrxkJYMbQF/fcAG2sMfYWgxXLj6LM4I1CnzpiYQaAcDA2YapH8vM+gVxl1FFeJMDlKACcLgu+8adATrugMvahNfzZP7HhiR8s634dv9n19xJzP8OunHME2wT5vrQFzP/2NqVamLjnv/YKwE3fWZJ2MEnDD1RJyH91WpG3XMCpda8hdNNZasoPXf+xvXUx6+4nrW3GRdzPXAo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1e3ae435-ace2-44b0-2701-08de7b07a39a
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Mar 2026 22:36:27.7226 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GvLqyAAG/xX1TkYflVmhYvvGxewFTwgZVcfYf3EbekkdelIPcJf7YQdHbM44bcNFeG6D7uFFz3uSrE3vk3avrQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4647
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_06,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0
 mlxlogscore=999
 phishscore=0 bulkscore=0 mlxscore=0 adultscore=0 spamscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2602130000 definitions=main-2603050194
X-Proofpoint-ORIG-GUID: k1h76jQjD1uoCu0h0DguIAoZO7y2tQML
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDE5NCBTYWx0ZWRfX8Aj8Oet/9mcj
 sbTuRnpVB/3Pk5aNtWzGuWTuEl/J7UMG69psyplsVPPKfXP2LzrLvg3QFuJFIfkty96PeozarN8
 tFo66RgyuT/OXGkrlrNU7WKUTNRqgdS/OaaPSY98rooo5PMdbwkFAFWEdt15GjL1F/WDl7/19b2
 1hGtJwhokHxoW7HsuXCyBVZi0QBdpLPa9lTbDdRfOA+qiaJYt/EUr2oFWYi6t/bv4EAROkMlFiY
 kvafLlDmPPOd9QkfRSQtRCxXaSRUbPJY3lJ9+0AdupH5hKq9KOE/vGWEPMkLs5NTZlwTeEAh3K9
 NuHOo7fNw6+rZLDvSJ2o8JgSUUYmM8qqPdK+1ZXVToIpuEFbhQvhDLvtPnbfrEhDBmjyfgjrdjk
 9DaNXBKhkneXuotxMAegE380iUhnIEDY3t6EBTkqG+p/3wvfJxz0iAauULifnC1Z54j1wnCxm6+
 DUaJHJp6/h8MJOLDyew==
X-Authority-Analysis: v=2.4 cv=Jsj8bc4C c=1 sm=1 tr=0 ts=69aa056f b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117
 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=BxcFmBYk3axAdTEt_0wA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: k1h76jQjD1uoCu0h0DguIAoZO7y2tQML
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/03/2026 19:04,
 Andreas Gruenbacher wrote: > Since commit
 9da3d1e912f3 ("block: Add core atomic write support"), > there is a gap in
 the blk_status_t codes and block status code 18 is > unused. T [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vyHJC-0004dR-Eq
Subject: Re: [f2fs-dev] [PATCH 1/4] block: consecutive blk_status_t error
 codes
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
From: John Garry via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: John Garry <john.g.garry@oracle.com>
Cc: dm-devel@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, linux-block@vger.kernel.org,
 linux-bcache@vger.kernel.org, drbd-dev@lists.linbit.com
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net
X-Rspamd-Queue-Id: B195E218F4B
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	DKIM_MIXED(0.00)[];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	RCPT_COUNT_SEVEN(0.00)[8];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	HAS_REPLYTO(0.00)[john.g.garry@oracle.com];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On 04/03/2026 19:04, Andreas Gruenbacher wrote:
> Since commit 9da3d1e912f3 ("block: Add core atomic write support"),
> there is a gap in the blk_status_t codes and block status code 18 is
> unused.  This causes blk_status_to_errno() and blk_status_to_str() to
> return incorrect values for that code. 

Sure, we get the wrong value (for 18), but 18 does not match a valid 
blk_status_t

> Make the blk_status_t codes
> consecutive again to avoid that.
> 
> Fixes: 9da3d1e912f3 ("block: Add core atomic write support")
> Signed-off-by: Andreas Gruenbacher <agruenba@redhat.com>

Reviewed-by: John Garry <john.g.garry@oracle.com>

> ---
>   include/linux/blk_types.h | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/include/linux/blk_types.h b/include/linux/blk_types.h
> index 8808ee76e73c..89a722d76c28 100644
> --- a/include/linux/blk_types.h
> +++ b/include/linux/blk_types.h
> @@ -168,7 +168,7 @@ typedef u16 blk_short_t;
>   /*
>    * Invalid size or alignment.
>    */
> -#define BLK_STS_INVAL	((__force blk_status_t)19)
> +#define BLK_STS_INVAL	((__force blk_status_t)18)
>   
>   /**
>    * blk_path_error - returns true if error may be path related



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
