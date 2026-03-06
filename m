Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id MCO0ByP4qmlxZAEAu9opvQ
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 16:52:03 +0100
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 26F1022442F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 06 Mar 2026 16:52:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=I6uGoDK80gOXame2SGt+4HUJ0CNrxk9jdRKCIhMM8sU=; b=Nlb1/G23awIRzzFbHOqeeqqE2P
	NxdUFoaNQ4vy6mZtoaYL4lHwRS32+m5h4DFDMW/TZ8u5/4A178Am67qCYKM4g7ChFLd5dw1OxFeD6
	EmZrPwqejvytW60Xu8b+ciRnhHOtcd9AUC9CiRhIDPM5HmM/kzR5m3QwjpbZ9SUJuiiI=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vyXSx-000250-9H;
	Fri, 06 Mar 2026 15:51:51 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <john.g.garry@oracle.com>) id 1vyXSv-00024s-SK
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 15:51:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Vj+Cl8+X0dRaDZp9DQzN1/LLixpKg52S/fU79P3Ss8Y=; b=agJo0JTrDbvcP9xEAb4WeEtU33
 zYCsgrVmFEYNIdiJAamChQ/jekZpxBNvApAtrrRnUR1iE+hxqyh2PCG4Osr34UHuJ4Yk9o8NQOTaj
 fiG8oweMa3h9MN/pOvhRmxarPMwFb8yZtQ5O2WSsZpsKij9PFwhD1UY+2oendfba+gYc=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Vj+Cl8+X0dRaDZp9DQzN1/LLixpKg52S/fU79P3Ss8Y=; b=LFgN9jyObTI8+qrn+W5HUgj3z0
 TCK5NE2KTazGd677zJtZRWplOEVhT+6WQ0bjIgIaVhkgHm0dhdknZavFztKm84RZCFNX9sKmRt5y7
 tPbp1pZDJ9np4X1NJuF8BqFONatU48quh3iFDwuS9DUip1x/ibBD0u6uUU3EFfpexhp0=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vyXSv-0003Hc-7g for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 06 Mar 2026 15:51:49 +0000
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 626FYJgx3388845; Fri, 6 Mar 2026 15:51:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=Vj+Cl8+X0dRaDZp9DQzN1/LLixpKg52S/fU79P3Ss8Y=; b=
 XH9GtncltqH6bEMQZ9VPTN9X7OcSDBxjFDI5c0QhCUE+WZiTFNQ0Dt2BsKQCr82V
 +XRQgDTbAV2IK8bmVxxLmW7nL8RlvHzFZeaygbIWQ47YtpbOB+BRA6Hcsbh05szt
 c6BgSOZc8AI69eh1rq65JKBf7nZE4HH42Y9UfwEI7f9rLSRenuHS/XywsJFTK3PB
 p+BtyuhQt3rqTNn7SCeYJBoeYbkpXgPX+73Od11sSgT6J2ZlvKHYyLdsV58RIuHP
 KFHSTalQRYuClkE54bePNpD1FRSC4THe9p4raeP0s+XaubLk28QVw0r2CDgOdiBm
 LWfwRN9emAwbnVq8G/Mqsg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4cr1p5r12n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Mar 2026 15:51:38 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 626EOgHG001439; Fri, 6 Mar 2026 15:51:37 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com
 (mail-westus2azon11012034.outbound.protection.outlook.com [52.101.48.34])
 by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4ckptk50q3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 06 Mar 2026 15:51:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=YJP9d1sgQWcADlVbJd87pibJ/nShHBVZjMgx18tvTCyaOP5UuDPKWaUX9D854xwVbew2Ui9Md8c8kj4cM7IetGVRbbGQFTF/klE4N373Rrp0J/UJVHmfaRiVJYCEi7zr1DjXM5Ww3XOSCme4ItDdlj2Lk317sEMQbghXwzMOMx+qKPvnGeD1uHpboybVYr31c1hWc3gHRIsM/uVotelcwKRsfsvXwnfERdGgCQjjxIPGz2vV74M82+oxd4Rdbl7nGETOVwWKjy1BzwzeKmIpy3jM5XC/A+cLrYRFbyY5jwLtqAa7NBLFPsoNBuDi/5cWW7Hst0m0467qQXC4Iqsnrg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Vj+Cl8+X0dRaDZp9DQzN1/LLixpKg52S/fU79P3Ss8Y=;
 b=YDaXIppxt4YCry5l6EsN95wTg6iYdeXwXIO3UaVWxM4pFPcgePkFnyGZIRnT4pcbdifLS48mjr859mQKGFhg6kMTYxVBgW1WwbxFh7EA0EC2Cn4sXyiv/6C8Sj3KXqrm9psfuAtLO6XcIYqyPcmg6yYc+SjrCYmjbnr/hfsDOGuWjGgT7gRVZsVCco09253A5m+062/mKgHfO2ij00nk3DWyS9MppXWjOO1N/ABl3Atdc0YRz8MABsrR3t1tM7+xNpqOiUfq7CzsTce8M2erXNhg/611Rwdep25X8nK0jftTpj2YALvO7JC8gs48LSFgSK/WH1qakXbZ34WatXO37A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Vj+Cl8+X0dRaDZp9DQzN1/LLixpKg52S/fU79P3Ss8Y=;
 b=RNx2iwqR84KhFsQX66plS2HxYPd0+cLR0m9mC9wwsPENkb8GTart/3tChv5UCZq+kIuRD0uRFzWwM7SXZWKxaP67J9tknjgjkJHVQVx3v2A7ygDed9aAPnoWzVcozGkLzirhs9yco6UiIhPXWxJcamkHA4WwN/q3y86ZCPSZIxw=
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54) by MN6PR10MB7421.namprd10.prod.outlook.com
 (2603:10b6:208:46e::5) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9678.18; Fri, 6 Mar
 2026 15:51:34 +0000
Received: from DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::5266:1601:5598:3f0a]) by DS4PPFEAFA21C69.namprd10.prod.outlook.com
 ([fe80::5266:1601:5598:3f0a%4]) with mapi id 15.20.9632.017; Fri, 6 Mar 2026
 15:51:34 +0000
Message-ID: <a60a80a7-e612-4eb1-a151-eaaef57ac14c@oracle.com>
Date: Fri, 6 Mar 2026 15:51:29 +0000
User-Agent: Mozilla Thunderbird
To: Andreas Gruenbacher <agruenba@redhat.com>, Jens Axboe <axboe@kernel.dk>
References: <20260304190424.291743-1-agruenba@redhat.com>
 <20260304190424.291743-3-agruenba@redhat.com>
Content-Language: en-US
Organization: Oracle Corporation
In-Reply-To: <20260304190424.291743-3-agruenba@redhat.com>
X-ClientProxiedBy: DU7P194CA0006.EURP194.PROD.OUTLOOK.COM
 (2603:10a6:10:553::15) To DS4PPFEAFA21C69.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::d54)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DS4PPFEAFA21C69:EE_|MN6PR10MB7421:EE_
X-MS-Office365-Filtering-Correlation-Id: 13cf97d7-52d8-4247-792d-08de7b983dfc
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info: IP7zh7es9N3BfbKyfk/E2s2igtd92ZXHd343ChA4yDk7yVlV556SX9n+D0iy8FquYeYND3Sd5C3jpuzbcw/c0GU7a70hgY3CGyleltf/Rx4HOT72UE5lWZCfSp3HKhIJMoNDFj/w0SqFXlhZsKt56x0QraMyTBhgmylk4vbo291tZgbDH7GJvdNquXg9pRwCDG4woAWyg90erhBF6sUEh1JXI+DCAhg1iarFnG+HzcohAwU2l2C5+SoJ083lyA3bOsaZwX/ZArffabwYLlaQmojLUN9+ZOMO0oT0lw5mhA53b/A6PQYDDqQbZQgcDqx5O7V0RUtRiMRsH9vehx7oeDXZvK8l7KQdSEkHqDQiFEYIf7zZC33xPpH+DofIMkAu9ZofFbLtslzG0bdgAwprjy6Hd6o8Fz9tKFHRD9j6JHLQJEwfi7L7TOW6zAoPPfIGtxhQwwzovoJVzfviDhveYBhzcx8fl2oavp39EpgTMTEGKWDjzQKraB56toJgps0fGHrZTMtcfRQIxF6xAvl7arMX80zoxirVUPC/FAX4pzEn5uYEIMrejKdmfHx/294BOhI8KJnecP93dWjyk9ytti/Ct1tuRgMaXTAXMiSG3lfhKLJnOl/Pv9vzJ6aHpqPqrWhtl3HG0LHzDWIp+s0BYXPYissb+rjM24+Iw8u5/zdOaqiwya/5jlYcV2oM6T/Qz/8HJ3wAWwyvvAioAv/x/rj/5vPUvz4BOJbtx+XhuRg=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DS4PPFEAFA21C69.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(366016)(376014)(1800799024)(7053199007); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WCtrZCtrcmdCdmFkZXlEZjF6SFlPSDQ4T3lnNlhBM3BOUXpCY0tMaWFDQjda?=
 =?utf-8?B?c1M2Mk9Wc1RDdytORGpaYlc4THRZUHVqYVJLNjZXUTZJYXU5Wk9vQUw4REQ1?=
 =?utf-8?B?OFpYbzA3YytRc2NzOFdVK3ZUdzMyM0hDZGI0VGRiUTFZTVRqZjFKbFhVZVFt?=
 =?utf-8?B?MkpQUTN6VkNGMDdrT1hieitqSXlFNXdWMkFjU1F3azBmSU1sKzRqVEtCWHVj?=
 =?utf-8?B?SHJiNXlWVmw3djRHa3VJZU0yLzNVMWpzZ1JhOFJHSEhVaHBnT0V5SzgyOGFX?=
 =?utf-8?B?eEtmNGpRQXNsSTR4dERPZUd0UklCREFwLzZUbmxYaSs2SjJtbkdiMXZHT1VW?=
 =?utf-8?B?UGtVTHoraTNmaS9MV3pxam9rM1BpQ0sxNUgyYXVwVForSUxZcEYvU1NCb2p2?=
 =?utf-8?B?bFVndnVrY2owVG5RWjZsWFNHcHN5TkxjSW4va3VsenVpNnk3QUt4Zy9zS2g1?=
 =?utf-8?B?eVNJRzhnSk51OTU1cmQxZkx5b3JkRjVaZTFCZGNUczhpRU9aLzZKQk0vNWtG?=
 =?utf-8?B?QXB5dG9rSUZYb3JPdTNGTHg4bEdGL05QVEpGTGd3djlhZVVKWjgwVm0wVUt0?=
 =?utf-8?B?Z2k2SlBJQ0pvUWFSb2ZnK2RCbW9lRXBIQ2JBYWY1ZmtCSTlCamROUVRUZlZB?=
 =?utf-8?B?TmVDcGp6b2ZPUERpWEZVU1dlVjVpalUwM29jbzZ0MTZ4NVhyL0FyT1A4enBk?=
 =?utf-8?B?VDRvbHoyNEhtVEpmYXRuejFZUXQ0azlFU043S1R2aXJJd3VlWG5uVnlvR0Nr?=
 =?utf-8?B?WTBXTnV1dXY0Sk05MTJ3ZlUwL2twM1ZFaXJxbkp4dXNzQUNJdEhCVmNmQjdO?=
 =?utf-8?B?N3J5eVh3b0lkdmJCaHYwbHQ1Y0IrVmxMT0xIQ0FqNFJWTVNHRVRXeTNwMm1n?=
 =?utf-8?B?cEViZUw3K2hsbnB6MDVQcytEcUhaTGpDSFlUYXQza25rTUpLVUlENHhNU3Ax?=
 =?utf-8?B?alRUQ081L3ZFVTFDQzJLWlJWaVI5VzFOSFAvZDlHUDJiemVUcEdYZ2tkOVpJ?=
 =?utf-8?B?UVdPN1lLREY0bzdobDdkL3IvUFc3RnJtK2FaUEc0c2NLb3J0c0VEUW5kVk1k?=
 =?utf-8?B?ZHNlT3drcWt1Z2JWZmRFWWNBbWhHT3hLait0YlVENnlBaXpKTW5idXdOdVcx?=
 =?utf-8?B?QXFndzRJZ0dWUC8wMCtseFdDcnhES1AwU3VDTHRJUFlTVjhaZmxQMWg2TDdE?=
 =?utf-8?B?L0dIVnZReXE3SlEwWlBEQmlXQTgzb1J4VFVJVHZGRmRsdzA3NXp4M1Jzelhy?=
 =?utf-8?B?dnZXbzhOczRZcXBnQlJTaS8rRDJwYkx3Nk0xSnZzYVkzQUw3ZWFnNUpONEQv?=
 =?utf-8?B?VENQcDYreWw0Qlg5YUk3K3duZ2E1eE1hcUZ6MHVwMTRkSXRWZ2d4OTFIQVFO?=
 =?utf-8?B?ZUVRNkVFNkFBQXpIaEtoVWVzLzZWamRsNWJ5RW1sQmt6RTJiaG1rMXRwL2VC?=
 =?utf-8?B?Z3BTN1ROc3czT1ZFRUxPL3pEWmUvRDlUMHhBc0xHVnNWSHlodVkwYWUzV3ND?=
 =?utf-8?B?WXlMb2tjOE02VGZJeGxjWHhBQnErY081SXF0Tlk2K2xCc3RlZmxLMDh2OUNk?=
 =?utf-8?B?WGlqWXo5OGt5YUd2ZjlTL3pyWEFPMFRnSDdpNmFuWmxHVDBVQUpVMXR6enhj?=
 =?utf-8?B?M3h5M2NXVzJ2ZHFXcktyTXdVWm9NQStBL3N2NHBmSGFJSkhnelgySDFvdzFj?=
 =?utf-8?B?U2V4NXVHRnFTaFI5RnlER2JuZzU3NXpJRzNFcDlITFFreWRGMlpZZktIQkdl?=
 =?utf-8?B?elowd3g2T2dSa01EV2xIR1Frd2hjcU1GQVR1RW15YjdJcTB6cGJuWXFHSDFq?=
 =?utf-8?B?Z2dPRXg1bzhTNzFpRklDY21lcVRvQVFHcWdId0RxSjhvdnFoakNMRTl2MmQ0?=
 =?utf-8?B?dFpaRjZqcm9WVEE2WEFrNnQyS2h6MzBUSk43NEJyeEU3VCtKMXp0TFlVYUVJ?=
 =?utf-8?B?SFVsN3dtV0gzRERIVzB3VWt4N0ZjbkFYWmozZTRxQjBjS2I4eFJYcnZ6Rjgz?=
 =?utf-8?B?OWxFZzFrcmRmaXZhY3V0T3pnSVpJR2NQN0J4ZW51UU90SlVCdVloRmo4UXI1?=
 =?utf-8?B?T0RvNi9VN1U2UzRLVGtCNUp3WFVXem1SK2NPT0hXVGRzL05CbkRhVG9ZMkJ3?=
 =?utf-8?B?eDNRalRXM1JwR1g5ejZ4U1MwYVlHQ1VsZXoxT0ZQV1RhNGl0WW0rVFJUenlD?=
 =?utf-8?B?U2EwWjQ2ZERwMTNvaTRyWlZudTNkZXptS1pkL0o2bDJCWEhOU0RwTisvM0hj?=
 =?utf-8?B?ck5aZDNjbWxKenIvdDR2YUFvUG95Uk5FMHNheEFmWitJY2VuZDdDY0w3R2V1?=
 =?utf-8?B?Z3dVVFJ3cXdwSTdxYW9wdkJjZlZhRngzRGg4Uk1ZbTJScTZvbkVaUT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: QXka6RZHy2AbjneGqmbZLvUjHn4cRO2Nv+1maRYTUm0oGpoQJcqJxy3umO2Wmoz0bLM9Whse9nhws5bESSZ+th2OsYW2+cNhF+JW7XOsfJpubcZJ8XQ29pGCxjskfoD2ARLWlAGSy25P6OgpzHH3QqpyG+GXGulfiK8yBis4remZEgS5/UtnTtRniODZqCzkT+e9iWIDZ5HOlLvkHABOY6PCHdWX4LSveBxSKEGzDMUsHDukrsnCKinusm1SBB1vN/2uPMYm8AJXCHB/eYsEC/rsW3tYGHIiyvYshqPesdMDKzXfFfTMfatocWqj08LzgZE9gzF0E8WshcNviu/Xwbb2y12FuUshmAvCp5TdAFbH+KUzXGBGIG1w9ebMvnPmR2LujDAOjjaUr9EmTiGlArslCZQ9Ym2fVewHGbHxZn9dRF7IDSN8slLpHdF3cGe7WaJBw2QyVuTTagb9w1dzGR0ircJx6ubNIrA6bNGOsdZ2zQDiUPixKVSRalbyNyEVJ9UPQ/1VkOs2NIrvXq/tKU1R0j0q2BvGB1vsK9eKvapbPD1Q68P8jzO/2IgmUPXLRi/1rWJZ6XG3OFdbMo3LZzgSNe48CrI6MoGfoMnr8j4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 13cf97d7-52d8-4247-792d-08de7b983dfc
X-MS-Exchange-CrossTenant-AuthSource: DS4PPFEAFA21C69.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Mar 2026 15:51:34.1415 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cLuQjF1+8IQYCeKDC9sPUBcCWtxdT2voK6XngvmnrbAp6SRJ0dCxALrOhpWvP54Bp03mZk10Nyoynk0pDXtHlQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MN6PR10MB7421
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-06_05,2026-03-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 malwarescore=0 phishscore=0
 spamscore=0 mlxscore=0 mlxlogscore=999 suspectscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2603060149
X-Proofpoint-GUID: JFs8JS8Ia3dSEdxKKY2qKcBhK-QRtZOo
X-Authority-Analysis: v=2.4 cv=JOg2csKb c=1 sm=1 tr=0 ts=69aaf80a b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117
 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=20KFwNOVAAAA:8
 a=yPCof4ZbAAAA:8 a=FCHOSpNyMqDNgBJJgV8A:9 a=QEXdDO2ut3YA:10 cc=ntf
 awl=host:13812
X-Proofpoint-ORIG-GUID: JFs8JS8Ia3dSEdxKKY2qKcBhK-QRtZOo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA2MDE1MCBTYWx0ZWRfX/K4kcxrCfMJN
 Nw/6CMRx11r5tUnWlLbEcDhTKjExjnZQCj+4HUli1WrcDZUibomzq7zkraIj/ifTeuksnguPpjI
 NYJXxO9tZjQbkxqLwGbeypMO7JdVWoHj2LUuCud4Rui/TMP7CItnVZMRNJbs/TF4BW1CrWUqfKz
 aguPl0Pp/a7tYQ2mjqE1McWl04wcs2oN2whohOFBq/gp52XgqB/nJKp/07QOGKEuhm/cO16R6bH
 XssCSzbrhvljpcBFtnKuVrc2p8XTYuxxsUZA9lo3xAbGOd2dsGKZodlakYRc15NhRUKiTyZ8yzU
 Eikg9/aXj5oRvlL3JcnFoSvpjfnTAJmLeUgBu8aZLg5SWlDlj83306JUmVC07McyWyYsExcsDqZ
 4Xqvz20yg9L9Ro1f7XSob0mvFMjO0W/gB8wMu4QkVs1rCtGhq3K4ldLozM8xsapwvx6oGEgbu1F
 rh1zxI1PoRn1UVgO3AQ63EE+ezsvdgHPnJlSJlZg=
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 04/03/2026 19:04,
 Andreas Gruenbacher wrote: > Change blk_status_to_str()
 to be consistent with blk_status_to_errno() > and return "I/O" for undefined
 status codes. > > With that, the fallback case [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vyXSv-0003Hc-7g
Subject: Re: [f2fs-dev] [PATCH 2/4] block: get rid of blk_status_to_{errno,
 str} inconsistency
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
X-Rspamd-Queue-Id: 26F1022442F
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-7.61 / 15.00];
	WHITELIST_DMARC(-7.00)[sourceforge.net:D:+];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:microsoft.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[216.105.38.7:from];
	R_SPF_ALLOW(-0.20)[+ip4:216.105.38.7];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.sourceforge.net:s=beta];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DKIM_MIXED(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:agruenba@redhat.com,m:axboe@kernel.dk,m:dm-devel@lists.linux.dev,m:linux-kernel@vger.kernel.org,m:linux-f2fs-devel@lists.sourceforge.net,m:linux-block@vger.kernel.org,m:linux-bcache@vger.kernel.org,m:drbd-dev@lists.linbit.com,s:lists@lfdr.de];
	FORGED_SENDER(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.sourceforge.net,none];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	FORWARDED(0.00)[linux-f2fs-devel@lists.sourceforge.net];
	R_DKIM_REJECT(0.00)[sourceforge.net:s=x,sf.net:s=x,oracle.com:s=corp-2025-04-25,oracle.onmicrosoft.com:s=selector2-oracle-onmicrosoft-com];
	DKIM_TRACE(0.00)[lists.sourceforge.net:+,sourceforge.net:-,sf.net:-,oracle.com:-,oracle.onmicrosoft.com:-];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oracle.com:replyto,oracle.com:email,oracle.com:mid,lists.sourceforge.net:dkim,lists.sourceforge.net:rdns,lists.sourceforge.net:helo];
	NEURAL_HAM(-0.00)[-0.998];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[linux-f2fs-devel@lists.sourceforge.net,linux-f2fs-devel-bounces@lists.sourceforge.net];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TAGGED_RCPT(0.00)[linux-f2fs-devel];
	HAS_REPLYTO(0.00)[john.g.garry@oracle.com];
	RCPT_COUNT_SEVEN(0.00)[8];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	ASN(0.00)[asn:11320, ipnet:216.105.32.0/21, country:US];
	RCVD_COUNT_SEVEN(0.00)[9]
X-Rspamd-Action: no action

On 04/03/2026 19:04, Andreas Gruenbacher wrote:
> Change blk_status_to_str() to be consistent with blk_status_to_errno()
> and return "I/O" for undefined status codes.
> 
> With that, the fallback case in the blk_errors array can be removed with
> no change in behavior.
> 
> Signed-off-by: Andreas Gruenbacher<agruenba@redhat.com>

Reviewed-by: John Garry <john.g.garry@oracle.com>


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
