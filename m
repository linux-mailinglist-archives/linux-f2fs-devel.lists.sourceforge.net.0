Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 23AEFD1978F
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 13 Jan 2026 15:32:38 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k0wiWVYiMIeRZmS4LpVxtJW5DnuQmCDosyERIhS0xNs=; b=heUSMXqYgeNzaO44bO0k+d0qAR
	K6YEaF1lJ4wts2JpodkdPqf9paWS5t176RTDWfQG8IAO7do3wiiuub9rx6uizadzd4HJi74veO30D
	79Evy6g4DGpDuTgmJC2vZ+8Z7A5g9yoO0mCYxrKrDUp/vdVF7I8nbeQ4u7Uwy+EB0hiM=;
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vffRi-00040m-9l;
	Tue, 13 Jan 2026 14:32:34 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chuck.lever@oracle.com>) id 1vffRg-00040c-8F;
 Tue, 13 Jan 2026 14:32:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=i2rI8MDoYJrAAd0fLGuxa+lo7Iv4HeZULdwvtF30uVo=; b=aWRKap/wCP+SZW46RfAeEVWe/0
 fKBwHGYOCypSi5A+vNh8dL/jgLsJD1F5brEHP6oKhn/SR8NxloS45nsV+cWZOEesWwVzquFnoDwFU
 L6G63/yq/C9EaHnDN3zNSgkCtQsuiUJurubntyFr5eiVYMZbvKV8KWk8jmFsKTAVi6SU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=i2rI8MDoYJrAAd0fLGuxa+lo7Iv4HeZULdwvtF30uVo=; b=iQZSCjuXfvfaenhfe9Q6WV0uJA
 40YXZWPfrMMbxYCS31eAeXuOTarN77Y7KXSXgcfFPRMJLI4Yr24/GwLXd9z8gPaW9W7SJoN8GPAzq
 RYK1zyjTwoswAIFLY7+cJc4ulO4NsLb/YIHLfLXwsyReprES8VWZXA1Z1QpR8YlFLAlY=;
Received: from mx0a-00069f02.pphosted.com ([205.220.165.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vffRf-0006ho-BB; Tue, 13 Jan 2026 14:32:32 +0000
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D1gh0v2419471; Tue, 13 Jan 2026 14:31:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=i2rI8MDoYJrAAd0fLGuxa+lo7Iv4HeZULdwvtF30uVo=; b=
 ImF7ktHy435mD9bvPAtknaSPcYVRmHdhtNXVFM/03JfIw/uBXSuwO5fLMXnsuUsG
 YBveauZljNtqJStPXqRISu+XEENqK220btJvCda9nkfJERhEQaaNY9Ee3JpGshrH
 7D67Iz8xSp9HoAsOVi6dBnMGfH0FG72VIWlbp/EOEamwLw7kpkgxeOK4sSQ3YyQO
 YR5GGuSZDhSzLsgxI0gUCzp3KAnLOTzhnAmTBqAMpS48Wzteit1WujcxND/lr7/c
 TbhfmzIvCcE2fZRwoMXtyHRrmwIIHtcUaUBVzKlgewh1Q9XKul50HIgWBTqD1fPA
 YCsJ56dOZ7iBo6AB+PDUKQ==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkre3ugwa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jan 2026 14:31:36 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 60DDpSLM029121; Tue, 13 Jan 2026 14:31:35 GMT
Received: from bl2pr02cu003.outbound.protection.outlook.com
 (mail-eastusazon11011010.outbound.protection.outlook.com [52.101.52.10])
 by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4bkd7jjc0g-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 13 Jan 2026 14:31:35 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ZKZ+HEYuQ6WXM68FkIyKe4idYcb3TLxcPiSLFrrMChi042JMHGGe+maB2TraCFk7WdM5TheyYzjuIxFQ5dgdhybKXlLX1AjnamjhGn55AwET4NEZJAnQR5Q26v6OQdoAi+qT/+G2KulNM2Vfq1jFS2mSUFwfNoM8VQyJ7U3XBoqw3Pq4s14dg1DGQCVZGB/291eF9hpSbL1IHvoME0W5o60qJZfM/1DjoSgP2djLA/QFutlZoNDQVfuhr8GDUHLGEXfCtrWdHoYBRzvJ0hSxWkTncJUVHWeTiFjE2NHNwmR5L51vx2dkrB9o7lzEwh16vaTV4NP1WW6FkzwUp5LOng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=i2rI8MDoYJrAAd0fLGuxa+lo7Iv4HeZULdwvtF30uVo=;
 b=p/8KAvVa+9gMnDqjns2oN/FaiCIREWvhSLL2glBD1gEL/LW4NI3KIbBIOr4jHplsWOpcp1HxBM/I0QU9ffxtPMGT0TLm9sHjDue/qYDaA+9ol5lHRCc1zkb/uhDtMFZgpQJEoQ/mC0bwVyun8R/URbX1X7eJ60rjI2IbC0PqdDroFcFXo/bqXp63HqZ4tLzTNpeudishkrl7kEmgVur9drDyZPFmyEahePWs/JVygpnZGogZS+ljy62kWnNnwmpdK7BjQFwTDbHZohtyVCer6INE4IGznE5ryK9abS70jmkOfpJC79moL1Rvb6EmZtdw3d0ovjbaknvwq6lBJuL40g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=i2rI8MDoYJrAAd0fLGuxa+lo7Iv4HeZULdwvtF30uVo=;
 b=mnb+pJ43SRsOGdoHpkDXakg3fGsnRyo0YwXJ0ctn+vqLzyhQsDe3D1ocUa/JUU+ulL+rwtVzlDP1wVCNQhijQADog4ybTOd9154LOcTFZE4siWp64IypvfXjXyEnsm2F13SN867sLPnQUNwzrk6aXA9VfLWwJ9JFzmYne2io4l0=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by CH3PR10MB7458.namprd10.prod.outlook.com (2603:10b6:610:15a::17)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Tue, 13 Jan
 2026 14:31:26 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9499.005; Tue, 13 Jan 2026
 14:31:26 +0000
Message-ID: <78a5971a-822b-4eb4-9c3d-9c1011c5b479@oracle.com>
Date: Tue, 13 Jan 2026 09:31:13 -0500
User-Agent: Mozilla Thunderbird
To: Jeff Layton <jlayton@kernel.org>, Christian Brauner <brauner@kernel.org>, 
 Amir Goldstein <amir73il@gmail.com>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
 <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
 <ce700ee20834631eceededc8cd15fc5d00fee28e.camel@kernel.org>
 <20260113-mondlicht-raven-82fc4eb70e9d@brauner>
 <4a38de737a64e9b32092ea1f8a25a61b33705034.camel@kernel.org>
 <5809690c-bc87-4e66-9604-3f3ee58e2902@oracle.com>
 <594043c04e431992f6585d7430b39cff2b770655.camel@kernel.org>
Content-Language: en-US
In-Reply-To: <594043c04e431992f6585d7430b39cff2b770655.camel@kernel.org>
X-ClientProxiedBy: CH5P223CA0012.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:1f3::26) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|CH3PR10MB7458:EE_
X-MS-Office365-Filtering-Correlation-Id: a81c1f90-1115-45f4-3e8e-08de52b06e96
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|376014|7416014|1800799024|366016|7053199007|3122999018; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1NSdmZsMGVFTG5IcDBGblRWQ1p5blVRZmd4QWhRcFNxUEIvMHdWRXQyVWI0?=
 =?utf-8?B?WmczMm10UnVnamxYZDRGTU4xa1R4dWFhdlFsOUxwSTk5b2dZcG93YnZYSGZR?=
 =?utf-8?B?NjIxUVRJblIyQWg1NlkzQWdRNUdDalJqWGkyb0ZVZHZnbi94bzB3Q2d0eUlF?=
 =?utf-8?B?OFdKYTVrT0tGNXdsRjZwT0haRnd2UjdOeFl0V1BVZ2xZV0tJNzdXZTZsZXFk?=
 =?utf-8?B?VDJLTHV6TEh0Z0I5K0g2TGx6L1krUnVXdXJSTlh3WllTYmgwVXptbFlIVGhS?=
 =?utf-8?B?RFlZWmdsYTRpZjEvNUx4S3NiaFNKVWdFSG1HZkdaOVFURWtuZnlVK1BaeXhi?=
 =?utf-8?B?NkZySFpaWk9jVkY3cndJVFpqL21kNUZTemNTaDZyZmczcjhJdm5IdlptL2pY?=
 =?utf-8?B?dkNTTmNSSWNLOHJFaUM2Nlp6Y3hibXQ3NENJTHN6WjlwbjBpZ2Z5dWxwQ2tO?=
 =?utf-8?B?bFoxOHpzM20reGM4Zzh3NHNxNUJ2aXJ4bWczaFhJaFI3d0lkLzNCdHptMi80?=
 =?utf-8?B?UnNYSE12MjY0RUtiVzFwNlFXdnJQREx1QW5YOVQ3MUZXeDRjeStyS01WRnZX?=
 =?utf-8?B?Rjd0RG05UTFLMmZwMndWWDV2M2VmRXpPYkxLbWZ3bWxSZ3gybG15bFYzSnNM?=
 =?utf-8?B?RHNZZTBKOWloN2tHTXhNemh6aGVyYVllNzRqQ3JCYW9qd0lweHQ5ZU9tblNk?=
 =?utf-8?B?YVEzazdWYU9kczJTUm5sY3ErbUFjenlWYnpxMEE2NGJUblBTUUtmTlhGRmdC?=
 =?utf-8?B?QkxDQngvYlV5SjVrSHZ4YjkrTTEzWG5oSlJLRXhuTFA3c1VycGpieGVvZHpR?=
 =?utf-8?B?RitOS2o5dlVPWUNkSHhiZThEMS8wd0xEREtaTEpUKytJL2YzSEFndHkyZEdU?=
 =?utf-8?B?KzhEK0cwWXBnMXhYSFJMS3ZBUGk0OW1yWU43NmtRQzBYMnVVSEszR1BBb3dQ?=
 =?utf-8?B?ejhTd2pUNENrZko5SnROMUtnRTBPcG4rWGpYaC9sL0JERWFZVGRoYzhUQzRz?=
 =?utf-8?B?S2tHNjc3UnVleEdZWXdvSWFZYjlRUXdoOGFpSUYxTTdwcTBicDBJK0pPdGFJ?=
 =?utf-8?B?NE4yS0FJcVBzdWpWandud1hvcjUxMjM4dkNnNWNtMHE2TVFYdEtubE1CSld0?=
 =?utf-8?B?WWFmVHlMLzlKTXRlb2RGcGdyOFZiWDNad0lnbk9Ib1ZmbVBwcHdTSUVkZk92?=
 =?utf-8?B?VEdySnJwTGV5d2tvdzVpTXhMSEZkWlN6UUo3TlRESEMrdGY2cllHNWUzMlpx?=
 =?utf-8?B?OWNEUllsSnE4a05UMDhRTUlMNU9veWl2Y0Nsc1lPWTdVWkRSL0RCZmdGTUxh?=
 =?utf-8?B?REJCdEF4ZkpyalJJU3l5QUNoOEdHMzZOOXVOYWJPemdNUVJyRDdXc0VHR2hq?=
 =?utf-8?B?RTZ5eDYxUnVRbmwvTENTaFhZTmI1NSt1NXFzajVMK2ZDNnpSR3VIWXJiWGp5?=
 =?utf-8?B?M1VFeWhQMmhTNG9IcDJIVXB6SlNld1RoSkpGR2dnVklRbnViajBGRUVWQ1Ja?=
 =?utf-8?B?a1I1bit3ZHNkVnM0c0wyOXZPVEhpTm9PRmk5YnMxMGZDZmJnQWVWNDFJQkVz?=
 =?utf-8?B?SForK2VYdTM3VWlVanVxdVNubHJSc2JXcHNUWnB3UWlwcXpWdXZmb09xMjhn?=
 =?utf-8?B?NHRRbE5XamE5a1hDc1lwTzhWZkIrdGZVa1JSY2tXNVlrSFhMZmZ1K3g3dElo?=
 =?utf-8?B?QTRQbm1Wanlqd29Eb0t6WEg5VVlWNitaRER5eTJyNnF0bVdwclhNR0ZyYzY5?=
 =?utf-8?B?bmdOUm9Jdk9MOW5TNzAzTkwwbE1ZQXE1aWsyYXpCZTdEV3VqL0lIaGgzV09N?=
 =?utf-8?B?SVlkNnZZNi9iTWlkeXRFN040V3BoNHJXeHczVlNYQm1ZbVd5TVdqRmw1ZzQ2?=
 =?utf-8?B?cEozOCtkZEJndVM4TGlPTG9JWHZMKzNmYjFCc1hGRnVLY2YxbUdSQ2dGSld0?=
 =?utf-8?Q?Urq0Wg+YWXmiDbo6BwEkIjoOgfKZT2k9?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016)(7053199007)(3122999018);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?THZEQnpKL0d0Rk1tenlsbTV5MGRVdXE1ZElWNW8xYVlsek1abmVWaytiYTY2?=
 =?utf-8?B?QlJtMFFTY2czc0dpeXkzUkFaZmE0Q0xvK1hJNUtMb2JFUXg5RDI2NytnUE1U?=
 =?utf-8?B?WlZMZXR2ZjJxYnRIcXA0ejNpc1dtdnlQV0pGWVVQMGJkb0F1elhNa0NGT1d0?=
 =?utf-8?B?TkZ0U2hUWE5QT3czNHNGWjd1VUprTThVbFpPY0t6bDl2UWJNTHM3a2h0NjFy?=
 =?utf-8?B?b3d0ZldFVTFEUE1JWi8xMTN5QjYvcmY1dXNvcUwzTk10MXBRK3VvU0Z4MVVx?=
 =?utf-8?B?eUJiRkh2Smx5TmkrRVRHdm51MnVrbWx0dWh2a3B2UEllZm9iNmdOY2xIZS9h?=
 =?utf-8?B?TFNBbnFUNG5HZXQ4d21NdzRQbVZIZHpGZWNOY0tpV3QwYW9URFhDaU9CSUhj?=
 =?utf-8?B?dVhHcVZSOUVGSlZJZkN6ck52YlQ5RlBIalE1TEdtZ3pZaWNPclJOaWpqbUZN?=
 =?utf-8?B?TDJpWlFia1BtcmdFSGpOT0ZmTExPTG5GbXJMeDZnaFlKN3dMYkRRMlpYS1JE?=
 =?utf-8?B?U3h5eHV5WEJTSWNMaTJtYkIxK1ExczlpMnlSdjVIZHhidGxxeWQ4TzYwTS9K?=
 =?utf-8?B?NXlCZTVBNVZrUXhEQ0wvaU1ybU92WFdvRkFTaTdHcHRRVlU4c3NlNHNPRis1?=
 =?utf-8?B?a0VWNTlXNjBaTzdRbWgrNHIvNGJnb2JxQ2tiZnVYSFZMOFkyWkJqUE1SVyt4?=
 =?utf-8?B?UnJqSThkMEU0cUhJWHVuSXU0VG1hT1c3V0pzbkRZSkhtWTJDUVgvQjFqSTNJ?=
 =?utf-8?B?Y0p5bTNNalkvRVR4U1RSa1RNTmNFQVJmcXpETzFjcGptUTFpaHdNVkRNZytL?=
 =?utf-8?B?YXNOZlI5OXY0dGh1ZGZ6bS80Sm5wZG1uVGNhaG1mcjA1UDBqd051NURSTldC?=
 =?utf-8?B?K2hFNVJyaklJT3VkZWcvcjYySUZQYk9ZcFNNL09OdCs4WjdMcWVtaERxM0dn?=
 =?utf-8?B?OWQvL3BqZEdhQmJzK0RVcXRxZnJ4d01ObmkwWUp6MUFKaUNwZ2k4Z0ZiWU5Z?=
 =?utf-8?B?UHVlSm5GOGJ1UTgwQ2JFdGxCajdlTHJ0M1lvUWh1QXUzNXFXU256OFZKOG1K?=
 =?utf-8?B?TWs5N2Q1Sml6Z2NwVDBlZ0tnejRZY0Y2U1p3ZlBOUEFWcWE0bGk2TGdYUk9v?=
 =?utf-8?B?SnM2RWl4VnFsdG4zdlBGbWM4ZUNERXNsdHNSYVMraGlIL1RDZE5WaS83aStq?=
 =?utf-8?B?YkJ4QjY0aGhkQ2s1MHU5d1Y5OEFKOGw0eDR3TkpoZm9IdzZjeGlIMk5GdHBQ?=
 =?utf-8?B?R241N1ZMZEM0RVJaWDhNbXc5L3JUNU5UWmlwa2FXVng3aVFMNVlRaHNLTXQw?=
 =?utf-8?B?NG1lRmJ5T2pCNkRrVjl3ZjlDc2x6akFZSi8vVHZEM05hOEFoYXpJMlhkZGRn?=
 =?utf-8?B?c2lnUXpuMkxOR0ExRThWQnhMc0xzL2RMM1BNNUxncUR3MlkzSkwrZTFqZ1Nr?=
 =?utf-8?B?Q0kvRFlYeGZmbFd4eDJUWlhaakZmdGMyZFRvTlNPV051TWJ6QXYrWGRPVlIr?=
 =?utf-8?B?U2xPT2oxdXpKOG45b084ZkdFNEJnYmxhOGNzUloyTmo3blhNKzBZdE5PRTdQ?=
 =?utf-8?B?eW1RaFpldndveTM0cHhWb2piWE1zNWxhZmc0dnhOb2p1NC9Cdld4S0NjcGxY?=
 =?utf-8?B?SnhJZ2xiV2hDWlpORUpjNFVLbjVNOEZSWDV6MVBNNXVEWjFOa3F6WXF0Q0JZ?=
 =?utf-8?B?elIwazZyY3FTTUQrdjh3ekFqRmt0YWZUYkFiS2ZuRkE3QWpNZCsxYzRIQ1Jw?=
 =?utf-8?B?M1Z6cEdCSXd5cG9VNjZIWXdlT2kvRDVSWERxMXkwRVJuR0g2elJBOHA2NDVp?=
 =?utf-8?B?VytLekFwTno1aUNoZzhpaHgvZmZ2ejFIdktrOFZ4Mm90NGtGNmlFdmdYY1Zx?=
 =?utf-8?B?TWxxMndjZE9oMU5peUZEeG5zcittS0ovcjVvVWJCeENCK1lsYzQ3V0JqU2tP?=
 =?utf-8?B?cXlOcTFFZXo3SEVjTDFrcEhJMU95Q1dmWGNJaXJhUittQnMveURUZ2pINGxs?=
 =?utf-8?B?TzZ6eUltUFB2WEVORThWVCtZUE4rNGd3UEl4UGwvMTRjMzgrZDc5OWRndDJy?=
 =?utf-8?B?Mzk5MENyVVlHRms1MnhHK3dlbVpiOC94S1lkeGNudDlxcEozZFFqZng4ZEJ2?=
 =?utf-8?B?RENGWmR3RmM4NVJCQit6VU1IZFRKSGVCbkhsdys1VUEzbk1FNFE4ZEgxRnVk?=
 =?utf-8?B?TDRCM01pY2dIc3czZ2p4RWx4WVZJNTJlbXc2NndMUWZ4eU5CMXV6STlyaDVr?=
 =?utf-8?B?V0Z1d1p5MnphMGJUNnZGekdLT1A5NXI2bFRuKzJDZ1pvbkdWdXo5dDNBZ2hI?=
 =?utf-8?B?eFljcCtGWlR5UllyZFRSTUo5dStRdDlrVXBXTytIOHZLbkdiWGF1QT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: eiIJWlHttY/qJx3ytiMOa+3fdK60MF15YMgv3Uwl/ktAYecOnuG56GKeoGtwGFqHricfZ99HDZdlSvPJlmD0lMPkE3IaQm75Cl/HkgoL4U3a9A8cIYudBm1LsrwiU5af0/kl31L+dpPZLdhDkECePPYTxEqsqhAZO4mPPyfVaGL5kDRwlXcRORvNGVdwSqCbMOcTG6Vx0chG4/POvI823h4nGqCpHvIX9pOBN0sYaBIeHjBXm+r9ZH5LfhPWdc0AjTNJsz3CQ4B3h0SWJsRJIMCBiF8em+GDhHAUCnXthVkmKxqS/97HBMzk6cDnAgosmhEBBfoKb3afqc0M4+c6hFbKcTcEpR/+SYeZjdZtZaaRjHItcwEYNOXXnmPwflAKAWzrA8GsMhzcy+zK5d06LOwu+LjoNd6I2lV126D1slLsYpkXdzf/+GsImLcE39dYCXbxOkF4xC54wkHYZyoNj47D7NI84ghHcmqeY3SfGpYUYcVAdgnP20rxLKTpGe0PCHXWxAFF/j1wyqjYi29zykgxIZl/ivY8C6lp+xyCB8GbLZNOWMUOU/w2KuHa6TgQmfA6wihc9r1FVuwsWvLNEmg0iTm302bWyXieJSEv5As=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a81c1f90-1115-45f4-3e8e-08de52b06e96
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2026 14:31:26.3501 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 2obvMBvmshOkKBvJcurei0QbEuHojQ1DJCOb4sg0C4/Vfj3VNSx7bMaz5rH67xxL5zZC9JRsqENW0dCHtxM9hA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7458
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0
 malwarescore=0
 mlxlogscore=999 suspectscore=0 mlxscore=0 phishscore=0 adultscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601130122
X-Proofpoint-ORIG-GUID: CaVfWaufF1GohPUJrRW4uw2fy828ldqS
X-Authority-Analysis: v=2.4 cv=YKOSCBGx c=1 sm=1 tr=0 ts=69665749 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117
 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Y791ZhcX_UeUQF-99ecA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyMiBTYWx0ZWRfX9JTrv96ST5Xm
 iLHpa1T+1WDCRlx+N6AEDBgDIPWO4Np00xVIN8hUNCkEwmXtzbPlpru22iUjoTZcI9mbSzjp+Yj
 VXLdrvcHoThZAonpqSkLJPTzVtvjI1CgdR6i29RrT+SiBUtO9jyfAwrJi2I9DrC1oQJrCUKsjpX
 Sp6+xdCPPzVRSW5IjAeFDPCv+NawBfXnYW5IH4vuanrdKzo98mJ7Z5hA9hVVdPO1DnjVd3PnXeJ
 Osq2kApmIfWjUX8yK0wA11Sj8esrg97YyH+L7pC6CU9PQFYfkJDjMjcfaNnHhX3w2SYbJfls+MW
 BcFeBdzYn7H1UZDYKAxnfE6WRrBuW7V7i9RrovfM9CJbnhCwEcsjIqaYWhW1dubFJ9quXbCjyxM
 yE6rbZcfkcQL8sP4DYcscGwDv9lSLlq418xHrzxZtVZonikSj8/0MbmkQFYQn7eukYs6SpNSIuS
 vC4l8RKfY4rMTLZbTyOil0oynMMpLnRasYyL7Tao=
X-Proofpoint-GUID: CaVfWaufF1GohPUJrRW4uw2fy828ldqS
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/13/26 9:27 AM, Jeff Layton wrote: > On Tue, 2026-01-13
 at 09:03 -0500, Chuck Lever wrote: >> On 1/13/26 6:45 AM, Jeff Layton wrote:
 >>> On Tue, 2026-01-13 at 09:54 +0100, Christian Brauner wrote: [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.165.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vffRf-0006ho-BB
Subject: Re: [f2fs-dev] [PATCH 00/24] vfs: require filesystems to explicitly
 opt-in to lease support
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
From: Chuck Lever via Linux-f2fs-devel <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chuck Lever <chuck.lever@oracle.com>
Cc: Latchesar Ionkov <lucho@ionkov.net>, Dave Kleikamp <shaggy@kernel.org>,
 Alexander Aring <alex.aring@gmail.com>, Jan Kara <jack@suse.cz>,
 Paulo Alcantara <pc@manguebit.org>, Sandeep Dhavale <dhavale@google.com>,
 Martin Brandenburg <martin@omnibond.com>, Yuezhang Mo <yuezhang.mo@sony.com>,
 Anders Larsen <al@alarsen.net>,
 Christian Schoenebeck <linux_oss@crudebyte.com>,
 jfs-discussion@lists.sourceforge.net, linux-unionfs@vger.kernel.org,
 Konstantin Komarov <almaz.alexandrovich@paragon-software.com>,
 Chris Mason <clm@fb.com>, Andreas Dilger <adilger.kernel@dilger.ca>,
 Chunhai Guo <guochunhai@vivo.com>, Ilya Dryomov <idryomov@gmail.com>,
 Ronnie Sahlberg <ronniesahlberg@gmail.com>, linux-mtd@lists.infradead.org,
 Mike Marshall <hubcap@omnibond.com>, linux-xfs@vger.kernel.org,
 Xiubo Li <xiubli@redhat.com>, Yue Hu <zbestahu@gmail.com>,
 Miklos Szeredi <miklos@szeredi.hu>, Richard Weinberger <richard@nod.at>,
 Mark Fasheh <mark@fasheh.com>, devel@lists.orangefs.org,
 Hugh Dickins <hughd@google.com>,
 "Matthew Wilcox \(Oracle\)" <willy@infradead.org>, ntfs3@lists.linux.dev,
 Christoph Hellwig <hch@infradead.org>, Joseph Qi <joseph.qi@linux.alibaba.com>,
 linux-mm@kvack.org, Viacheslav Dubeyko <slava@dubeyko.com>,
 linux-btrfs@vger.kernel.org, Gao Xiang <xiang@kernel.org>,
 linux-ext4@vger.kernel.org, Salah Triki <salah.triki@gmail.com>,
 Carlos Maiolino <cem@kernel.org>, Dominique Martinet <asmadeus@codewreck.org>,
 Shyam Prasad N <sprasad@microsoft.com>, samba-technical@lists.samba.org,
 linux-cifs@vger.kernel.org, Tom Talpey <tom@talpey.com>,
 ocfs2-devel@lists.linux.dev, Bharath SM <bharathsm@microsoft.com>,
 linux-nilfs@vger.kernel.org, David Sterba <dsterba@suse.com>,
 Alexander Viro <viro@zeniv.linux.org.uk>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Jeffle Xu <jefflexu@linux.alibaba.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 ceph-devel@vger.kernel.org, Eric Van Hensbergen <ericvh@kernel.org>,
 Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>,
 Andreas Gruenbacher <agruenba@redhat.com>, Hans de Goede <hansg@kernel.org>,
 gfs2@lists.linux.dev, linux-nfs@vger.kernel.org,
 linux-f2fs-devel@lists.sourceforge.net, Theodore Ts'o <tytso@mit.edu>,
 Luis de Bethencourt <luisbg@kernel.org>, Nicolas Pitre <nico@fluxnic.net>,
 linux-erofs@lists.ozlabs.org, v9fs@lists.linux.dev,
 Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Namjae Jeon <linkinjeon@kernel.org>,
 Steve French <sfrench@samba.org>, Hongbo Li <lihongbo22@huawei.com>,
 Anna Schumaker <anna@kernel.org>, Jan Kara <jack@suse.com>,
 linux-fsdevel@vger.kernel.org, Phillip Lougher <phillip@squashfs.org.uk>,
 Andrew Morton <akpm@linux-foundation.org>,
 Sungjong Seo <sj1557.seo@samsung.com>, David Woodhouse <dwmw2@infradead.org>,
 Trond Myklebust <trondmy@kernel.org>, Joel Becker <jlbec@evilplan.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMS8xMy8yNiA5OjI3IEFNLCBKZWZmIExheXRvbiB3cm90ZToKPiBPbiBUdWUsIDIwMjYtMDEt
MTMgYXQgMDk6MDMgLTA1MDAsIENodWNrIExldmVyIHdyb3RlOgo+PiBPbiAxLzEzLzI2IDY6NDUg
QU0sIEplZmYgTGF5dG9uIHdyb3RlOgo+Pj4gT24gVHVlLCAyMDI2LTAxLTEzIGF0IDA5OjU0ICsw
MTAwLCBDaHJpc3RpYW4gQnJhdW5lciB3cm90ZToKPj4+PiBPbiBNb24sIEphbiAxMiwgMjAyNiBh
dCAwOTo1MDoyMEFNIC0wNTAwLCBKZWZmIExheXRvbiB3cm90ZToKPj4+Pj4gT24gTW9uLCAyMDI2
LTAxLTEyIGF0IDA5OjMxIC0wNTAwLCBDaHVjayBMZXZlciB3cm90ZToKPj4+Pj4+IE9uIDEvMTIv
MjYgODozNCBBTSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4+Pj4+Pj4gT24gRnJpLCAyMDI2LTAxLTA5
IGF0IDE5OjUyICswMTAwLCBBbWlyIEdvbGRzdGVpbiB3cm90ZToKPj4+Pj4+Pj4gT24gVGh1LCBK
YW4gOCwgMjAyNiBhdCA3OjU34oCvUE0gSmVmZiBMYXl0b24gPGpsYXl0b25Aa2VybmVsLm9yZz4g
d3JvdGU6Cj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gT24gVGh1LCAyMDI2LTAxLTA4IGF0IDE4OjQwICsw
MTAwLCBKYW4gS2FyYSB3cm90ZToKPj4+Pj4+Pj4+PiBPbiBUaHUgMDgtMDEtMjYgMTI6MTI6NTUs
IEplZmYgTGF5dG9uIHdyb3RlOgo+Pj4+Pj4+Pj4+PiBZZXN0ZXJkYXksIEkgc2VudCBwYXRjaGVz
IHRvIGZpeCBob3cgZGlyZWN0b3J5IGRlbGVnYXRpb24gc3VwcG9ydCBpcwo+Pj4+Pj4+Pj4+PiBo
YW5kbGVkIG9uIGZpbGVzeXN0ZW1zIHdoZXJlIHRoZSBzaG91bGQgYmUgZGlzYWJsZWQgWzFdLiBU
aGF0IHNldCBpcwo+Pj4+Pj4+Pj4+PiBhcHByb3ByaWF0ZSBmb3IgdjYuMTkuIEZvciB2Ny4wLCBJ
IHdhbnQgdG8gbWFrZSBsZWFzZSBzdXBwb3J0IGJlIG1vcmUKPj4+Pj4+Pj4+Pj4gb3B0LWluLCBy
YXRoZXIgdGhhbiBvcHQtb3V0Ogo+Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBGb3IgaGlzdG9yaWNh
bCByZWFzb25zLCB3aGVuIC0+c2V0bGVhc2UoKSBmaWxlX29wZXJhdGlvbiBpcyBzZXQgdG8gTlVM
TCwKPj4+Pj4+Pj4+Pj4gdGhlIGRlZmF1bHQgaXMgdG8gdXNlIHRoZSBrZXJuZWwtaW50ZXJuYWwg
bGVhc2UgaW1wbGVtZW50YXRpb24uIFRoaXMKPj4+Pj4+Pj4+Pj4gbWVhbnMgdGhhdCBpZiB5b3Ug
d2FudCB0byBkaXNhYmxlIHRoZW0sIHlvdSBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+Pj4+
Pj4+Pj4+PiAtPnNldGxlYXNlKCkgZmlsZV9vcGVyYXRpb24gdG8gc2ltcGxlX25vc2V0bGVhc2Uo
KSBvciB0aGUgZXF1aXZhbGVudC4KPj4+Pj4+Pj4+Pj4KPj4+Pj4+Pj4+Pj4gVGhpcyBoYXMgY2F1
c2VkIGEgbnVtYmVyIG9mIHByb2JsZW1zIG92ZXIgdGhlIHllYXJzIGFzIHNvbWUgZmlsZXN5c3Rl
bXMKPj4+Pj4+Pj4+Pj4gaGF2ZSBpbmFkdmVydGFudGx5IGFsbG93ZWQgbGVhc2VzIHRvIGJlIGFj
cXVpcmVkIHNpbXBseSBieSBoYXZpbmcgbGVmdAo+Pj4+Pj4+Pj4+PiBpdCBzZXQgdG8gTlVMTC4g
SXQgd291bGQgYmUgYmV0dGVyIGlmIGZpbGVzeXN0ZW1zIGhhZCB0byBvcHQtaW4gdG8gbGVhc2UK
Pj4+Pj4+Pj4+Pj4gc3VwcG9ydCwgcGFydGljdWxhcmx5IHdpdGggdGhlIGFkdmVudCBvZiBkaXJl
Y3RvcnkgZGVsZWdhdGlvbnMuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IFRoaXMgc2VyaWVzIGhh
cyBzZXRzIHRoZSAtPnNldGxlYXNlKCkgb3BlcmF0aW9uIGluIGEgcGlsZSBvZiBleGlzdGluZwo+
Pj4+Pj4+Pj4+PiBsb2NhbCBmaWxlc3lzdGVtcyB0byBnZW5lcmljX3NldGxlYXNlKCkgYW5kIHRo
ZW4gY2hhbmdlcwo+Pj4+Pj4+Pj4+PiBrZXJuZWxfc2V0bGVhc2UoKSB0byByZXR1cm4gLUVJTlZB
TCB3aGVuIHRoZSBzZXRsZWFzZSgpIG9wZXJhdGlvbiBpcyBub3QKPj4+Pj4+Pj4+Pj4gc2V0Lgo+
Pj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4+PiBXaXRoIHRoaXMgY2hhbmdlLCBuZXcgZmlsZXN5c3RlbXMg
d2lsbCBuZWVkIHRvIGV4cGxpY2l0bHkgc2V0IHRoZQo+Pj4+Pj4+Pj4+PiAtPnNldGxlYXNlKCkg
b3BlcmF0aW9ucyBpbiBvcmRlciB0byBwcm92aWRlIGxlYXNlIGFuZCBkZWxlZ2F0aW9uCj4+Pj4+
Pj4+Pj4+IHN1cHBvcnQuCj4+Pj4+Pj4+Pj4+Cj4+Pj4+Pj4+Pj4+IEkgbWFpbmx5IGZvY3VzZWQg
b24gZmlsZXN5c3RlbXMgdGhhdCBhcmUgTkZTIGV4cG9ydGFibGUsIHNpbmNlIE5GUyBhbmQKPj4+
Pj4+Pj4+Pj4gU01CIGFyZSB0aGUgbWFpbiB1c2VycyBvZiBmaWxlIGxlYXNlcywgYW5kIHRoZXkg
dGVuZCB0byBlbmQgdXAgZXhwb3J0aW5nCj4+Pj4+Pj4+Pj4+IHRoZSBzYW1lIGZpbGVzeXN0ZW0g
dHlwZXMuIExldCBtZSBrbm93IGlmIEkndmUgbWlzc2VkIGFueS4KPj4+Pj4+Pj4+Pgo+Pj4+Pj4+
Pj4+IFNvLCB3aGF0IGFib3V0IGtlcm5mcyBhbmQgZnVzZT8gVGhleSBzZWVtIHRvIGJlIGV4cG9y
dGFibGUgYW5kIGRvbid0IGhhdmUKPj4+Pj4+Pj4+PiAuc2V0bGVhc2Ugc2V0Li4uCj4+Pj4+Pj4+
Pj4KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBZZXMsIEZVU0UgbmVlZHMgdGhpcyB0b28uIEknbGwgYWRk
IGEgcGF0Y2ggZm9yIHRoYXQuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQXMgZmFyIGFzIGtlcm5mcyBn
b2VzOiBBSVVJLCB0aGF0J3MgYmFzaWNhbGx5IHdoYXQgc3lzZnMgYW5kIHJlc2N0cmwKPj4+Pj4+
Pj4+IGFyZSBidWlsdCBvbi4gRG8gd2UgcmVhbGx5IGV4cGVjdCBwZW9wbGUgdG8gc2V0IGxlYXNl
cyB0aGVyZT8KPj4+Pj4+Pj4+Cj4+Pj4+Pj4+PiBJIGd1ZXNzIGl0J3MgdGVjaG5pY2FsbHkgYSBy
ZWdyZXNzaW9uIHNpbmNlIHlvdSBjb3VsZCBzZXQgdGhlbSBvbiB0aG9zZQo+Pj4+Pj4+Pj4gc29y
dHMgb2YgZmlsZXMgZWFybGllciwgYnV0IHBlb3BsZSBkb24ndCB1c3VhbGx5IGV4cG9ydCBrZXJu
ZnMgYmFzZWQKPj4+Pj4+Pj4+IGZpbGVzeXN0ZW1zIHZpYSBORlMgb3IgU01CLCBhbmQgdGhhdCBz
ZWVtcyBsaWtlIHNvbWV0aGluZyB0aGF0IGNvdWxkIGJlCj4+Pj4+Pj4+PiB1c2VkIHRvIG1ha2Ug
bWlzY2hpZWYuCj4+Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gQUZBSUNULCBrZXJuZnNfZXhwb3J0X29wcyBp
cyBtb3N0bHkgdG8gc3VwcG9ydCBvcGVuX2J5X2hhbmRsZV9hdCgpLiBTZWUKPj4+Pj4+Pj4+IGNv
bW1pdCBhYTgxODgyNTM0NzQgKCJrZXJuZnM6IGFkZCBleHBvcnRmcyBvcGVyYXRpb25zIikuCj4+
Pj4+Pj4+Pgo+Pj4+Pj4+Pj4gT25lIGlkZWE6IHdlIGNvdWxkIGFkZCBhIHdyYXBwZXIgYXJvdW5k
IGdlbmVyaWNfc2V0bGVhc2UoKSBmb3IKPj4+Pj4+Pj4+IGZpbGVzeXN0ZW1zIGxpa2UgdGhpcyB0
aGF0IHdpbGwgZG8gYSBXQVJOX09OQ0UoKSBhbmQgdGhlbiBjYWxsCj4+Pj4+Pj4+PiBnZW5lcmlj
X3NldGxlYXNlKCkuIFRoYXQgd291bGQga2VlcCBsZWFzZXMgd29ya2luZyBvbiB0aGVtIGJ1dCB3
ZSBtaWdodAo+Pj4+Pj4+Pj4gZ2V0IHNvbWUgcmVwb3J0cyB0aGF0IHdvdWxkIHRlbGwgdXMgd2hv
J3Mgc2V0dGluZyBsZWFzZXMgb24gdGhlc2UgZmlsZXMKPj4+Pj4+Pj4+IGFuZCB3aHkuCj4+Pj4+
Pj4+Cj4+Pj4+Pj4+IElNTywgeW91IGFyZSBiZWluZyB0b28gY2F1dGlvdXMsIGJ1dCB3aGF0ZXZl
ci4KPj4+Pj4+Pj4KPj4+Pj4+Pj4gSXQgaXMgbm90IGFjY3VyYXRlIHRoYXQga2VybmZzIGZpbGVz
eXN0ZW1zIGFyZSBORlMgZXhwb3J0YWJsZSBpbiBnZW5lcmFsLgo+Pj4+Pj4+PiBPbmx5IGNncm91
cGZzIGhhcyBLRVJORlNfUk9PVF9TVVBQT1JUX0VYUE9SVE9QLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJ
ZiBhbnkgYXBwbGljYXRpb24gaXMgdXNpbmcgbGVhc2VzIG9uIGNncm91cCBmaWxlcywgaXQgbXVz
dCBiZSBzb21lCj4+Pj4+Pj4+IHZlcnkgYWR2YW5jZWQgcnVudGltZSAoaS5lLiBzeXN0ZW1kKSwg
c28gd2Ugc2hvdWxkIGtub3cgYWJvdXQgdGhlCj4+Pj4+Pj4+IHJlZ3Jlc3Npb24gc29vbmVyIHJh
dGhlciB0aGFuIGxhdGVyLgo+Pj4+Pj4+Pgo+Pj4+Pj4+Cj4+Pj4+Pj4gSSB0aGluayBzbyB0b28u
IEZvciBub3csIEkgdGhpbmsgSSdsbCBub3QgYm90aGVyIHdpdGggdGhlIFdBUk5fT05DRSgpLgo+
Pj4+Pj4+IExldCdzIGp1c3QgbGVhdmUga2VybmZzIG91dCBvZiB0aGUgc2V0IHVudGlsIHNvbWVv
bmUgcHJlc2VudHMgYSByZWFsCj4+Pj4+Pj4gdXNlLWNhc2UuCj4+Pj4+Pj4KPj4+Pj4+Pj4gVGhl
cmUgYXJlIGFsc28gdGhlIHJlY2VudGx5IGFkZGVkIG5zZnMgYW5kIHBpZGZzIGV4cG9ydF9vcGVy
YXRpb25zLgo+Pj4+Pj4+Pgo+Pj4+Pj4+PiBJIGhhdmUgYSByZWNvbGxlY3Rpb24gYWJvdXQgd2Fu
dGluZyB0byBiZSBleHBsaWNpdCBhYm91dCBub3QgYWxsb3dpbmcKPj4+Pj4+Pj4gdGhvc2UgdG8g
YmUgZXhwb3J0YWJsZSB0byBORlMgKG5zZnMgc3BlY2lmaWNhbGx5KSwgYnV0IEkgY2FuJ3Qgc2Vl
IHdoZXJlCj4+Pj4+Pj4+IGFuZCBpZiB0aGF0IHJlc3RyaWN0aW9uIHdhcyBkb25lLgo+Pj4+Pj4+
Pgo+Pj4+Pj4+PiBDaHJpc3RpYW4/IERvIHlvdSByZW1lbWJlcj8KPj4+Pj4+Pj4KPj4+Pj4+Pgo+
Pj4+Pj4+IChjYydpbmcgQ2h1Y2spCj4+Pj4+Pj4KPj4+Pj4+PiBGV0lXLCB5b3UgY2FuIGN1cnJl
bnRseSBleHBvcnQgYW5kIG1vdW50IC9zeXMvZnMvY2dyb3VwIHZpYSBORlMuIFRoZQo+Pj4+Pj4+
IGRpcmVjdG9yeSBkb2Vzbid0IHNob3cgdXAgd2hlbiB5b3UgdHJ5IHRvIGdldCB0byBpdCB2aWEg
TkZTdjQsIGJ1dCB5b3UKPj4+Pj4+PiBjYW4gbW91bnQgaXQgdXNpbmcgdjMgYW5kIFJFQURESVIg
d29ya3MuIFRoZSBmaWxlcyBhcmUgYWxsIGVtcHR5IHdoZW4KPj4+Pj4+PiB5b3UgdHJ5IHRvIHJl
YWQgdGhlbS4gSSBkaWRuJ3QgdHJ5IHRvIGRvIGFueSB3cml0ZXMuCj4+Pj4+Pj4KPj4+Pj4+PiBT
aG91bGQgd2UgYWRkIGEgbWVjaGFuaXNtIHRvIHByZXZlbnQgZXhwb3J0aW5nIHRoZXNlIHNvcnRz
IG9mCj4+Pj4+Pj4gZmlsZXN5c3RlbXM/Cj4+Pj4+Pj4KPj4+Pj4+PiBFdmVuIGJldHRlciB3b3Vs
ZCBiZSB0byBtYWtlIG5mc2QgZXhwb3J0aW5nIGV4cGxpY2l0bHkgb3B0LWluLiBXaGF0IGlmCj4+
Pj4+Pj4gd2Ugd2VyZSB0byBhZGQgYSBFWFBPUlRfT1BfTkZTRCBmbGFnIHRoYXQgZXhwbGljaXRs
eSBhbGxvd3MgZmlsZXN5c3RlbXMKPj4+Pj4+PiB0byBvcHQtaW4gdG8gTkZTIGV4cG9ydGluZywg
YW5kIGNoZWNrIGZvciB0aGF0IGluIF9fZmhfdmVyaWZ5KCk/IFdlJ2QKPj4+Pj4+PiBoYXZlIHRv
IGFkZCBpdCB0byBhIGJ1bmNoIG9mIGV4aXN0aW5nIGZpbGVzeXN0ZW1zLCBidXQgdGhhdCdzIGZh
aXJseQo+Pj4+Pj4+IHNpbXBsZSB0byBkbyB3aXRoIGFuIExMTS4KPj4+Pj4+Cj4+Pj4+PiBXaGF0
J3MgdGhlIGFjdGl2ZSBoYXJtIGluIGV4cG9ydGluZyAvc3lzL2ZzL2Nncm91cCA/IEl0IGhhcyB0
byBiZSBkb25lCj4+Pj4+PiBleHBsaWNpdGx5IHZpYSAvZXRjL2V4cG9ydHMsIHNvIHRoaXMgaXMg
dW5kZXIgdGhlIE5GUyBzZXJ2ZXIgYWRtaW4ncwo+Pj4+Pj4gY29udHJvbC4gSXMgaXQgYW4gYXR0
YWNrIHN1cmZhY2U/Cj4+Pj4+Pgo+Pj4+Pgo+Pj4+PiBQb3RlbnRpYWxseT8KPj4+Pj4KPj4+Pj4g
SSBkb24ndCBzZWUgYW55IGFjdGl2ZSBoYXJtIHdpdGggZXhwb3J0aW5nIGNncm91cGZzLiBJdCBk
b2Vzbid0IHdvcmsKPj4+Pj4gcmlnaHQgdmlhIG5mc2QsIGJ1dCBpdCdzIG5vdCBjcmFzaGluZyB0
aGUgYm94IG9yIGFueXRoaW5nLgo+Pj4+Pgo+Pj4+PiBBdCBvbmUgdGltZSwgdGhvc2Ugd2VyZSBv
bmx5IGRlZmluZWQgYnkgZmlsZXN5c3RlbXMgdGhhdCB3YW50ZWQgdG8KPj4+Pj4gYWxsb3cgTkZT
IGV4cG9ydC4gTm93IHdlJ3ZlIGdyb3duIHRoZW0gb24gZmlsZXN5c3RlbXMgdGhhdCBqdXN0IHdh
bnQgdG8KPj4+Pj4gcHJvdmlkZSBmaWxlaGFuZGxlcyBmb3Igb3Blbl9ieV9oYW5kbGVfYXQoKSBh
bmQgdGhlIGxpa2UuIG5mc2QgZG9lc24ndAo+Pj4+PiBjYXJlIHRob3VnaDogaWYgdGhlIGZzIGhh
cyBleHBvcnQgb3BlcmF0aW9ucywgaXQnbGwgaGFwcGlseSB1c2UgdGhlbS4KPj4+Pj4KPj4+Pj4g
SGF2aW5nIGFuIGV4cGxpY2l0ICJJIHdhbnQgdG8gYWxsb3cgbmZzZCIgZmxhZyBzZWUgbXMgbGlr
ZSBpdCBtaWdodAo+Pj4+PiBzYXZlIHVzIHNvbWUgaGVhZGFjaGVzIGluIHRoZSBmdXR1cmUgd2hl
biBvdGhlciBmaWxlc3lzdGVtcyBhZGQgZXhwb3J0Cj4+Pj4+IG9wcyBmb3IgdGhpcyBzb3J0IG9m
IGZpbGVoYW5kbGUgdXNlLgo+Pj4+Cj4+Pj4gU28gd2UgYXJlIHJlLWhhc2hpbmcgYSBkaXNjdXNz
aW9uIHdlIGhhZCBhIGZldyBtb250aHMgYWdvIChBbWlyIHdhcwo+Pj4+IGludm9sdmVkIGF0IGxl
YXN0KS4KPj4+Pgo+Pj4KPj4+IFllcCwgSSB3YXMgbHVya2luZyBvbiBpdCwgYnV0IGRpZG4ndCBo
YXZlIGEgbG90IG9mIGlucHV0IGF0IHRoZSB0aW1lLgo+Pj4KPj4+PiBJIGRvbid0IHRoaW5rIHdl
IHdhbnQgdG8gZXhwb3NlIGNncm91cGZzIHZpYSBORlMgdGhhdCdzIHN1cGVyIHdlaXJkLgo+Pj4+
IEl0J3MgbGlrZSByZW1vdGUgcGFydGlhbCByZXNvdXJjZSBtYW5hZ2VtZW50IGFuZCBpdCB3b3Vs
ZCBiZSB2ZXJ5Cj4+Pj4gc3RyYW5nZSBpZiBhIHJlbW90ZSBwcm9jZXNzIHN1ZGRlbmx5IHdvdWxk
IGJlIGFibGUgdG8gbW92ZSB0aGluZ3MgYXJvdW5kCj4+Pj4gaW4gdGhlIGNncm91cCB0cmVlLiBT
byBJIHdvdWxkIHByZWZlciB0byBub3QgZG8gdGhpcy4KPj4+Pgo+Pj4+IFNvIG15IHByZWZlcmVu
Y2Ugd291bGQgYmUgdG8gcmVhbGx5IHNldmVyIGZpbGUgaGFuZGxlcyBmcm9tIHRoZSBleHBvcnQK
Pj4+PiBtZWNoYW5pc20gc28gdGhhdCB3ZSBjYW4gYWxsb3cgc3R1ZmYgbGlrZSBwaWRmcyBhbmQg
bnNmcyBhbmQgY2dyb3VwZnMgdG8KPj4+PiB1c2UgZmlsZSBoYW5kbGVzIHZpYSBuYW1lX3RvX2hh
bmRsZV9hdCgpIGFuZCBvcGVuX2J5X2hhbmRsZV9hdCgpIHdpdGhvdXQKPj4+PiBtYWtpbmcgdGhl
bSBleHBvcnRhYmxlLgo+Pj4KPj4+IEFncmVlZC4gSSB0aGluayB3ZSB3YW50IHRvIG1ha2UgTkZT
IGV4cG9ydCBiZSBhIGRlbGliZXJhdGUgb3B0LWluCj4+PiBkZWNpc2lvbiB0aGF0IGZpbGVzeXN0
ZW0gZGV2ZWxvcGVycyBtYWtlLgo+Pgo+PiBObyBvYmplY3Rpb24sIHdoYXQgYWJvdXQga3NtYmQs
IEFGUywgb3IgQ2VwaD8KPj4KPiAKPiBrc21iZCBkb2Vzbid0IGhhdmUgYW55dGhpbmcgYWtpbiB0
byBhbiBleHBvcnRfb3BlcmF0aW9ucy4gSSB0aGluayBpdAo+IHJlYWxseSBoYXMgdG8gcmVseSBv
biBhZG1pbnMgZ2V0dGluZyB0aGUgc2hhcmUgcGF0aHMgcmlnaHQgd2hlbgo+IGV4cG9ydGluZy4g
VGhpcyBpcyBhIGJpdCBzaW1wbGVyIHRoZXJlIHRob3VnaCBzaW5jZSBTTUIyIGRvZXNuJ3QgZGVh
bAo+IHdpdGggZmlsZWhhbmRsZXMuCj4gCj4gQUZTIGFuZCBDZXBoIGluIHRoZSBrZXJuZWwgYXJl
IGNsaWVudHMuIEFGUyBpc24ndCByZWV4cG9ydGFibGUgdmlhIE5GUywKPiBidXQgQ2VwaCBpcy4g
V2UnbGwgbmVlZCB0byBwcmVzZXJ2ZSB0aGF0IGFiaWxpdHkuCgpXZWxsIEkgdGhpbmsgbXkgcG9p
bnQgaXMgdGhhdCAiaXMgdGhpcyBmaWxlIHN5c3RlbSB0eXBlIGV4cG9ydGFibGUiCm1pZ2h0IGJl
IG9ydGhvZ29uYWwgdG8gd2hldGhlciB0aGUgRlMgb2ZmZXJzIGEgZmlsZWhhbmRsZSBjYXBhYmls
aXR5LiBJZgppdCBkb2Vzbid0IG1ha2Ugc2Vuc2UgdG8gZXhwb3J0IGNncm91cGZzIHZpYSBORlMs
IGl0IHByb2JhYmx5IGFsc28gZG9lcwpub3QgbWFrZSBzZW5zZSBmb3Iga3NtYmQuIExhdGhlciwg
cmluc2UsIHJlcGVhdCBmb3Igb3RoZXIgaW4ta2VybmVsIGZpbGUKc2VydmVycy4KClBlcmhhcHMg
dGhlICJpc19leHBvcnRhYmxlIiBwcmVkaWNhdGUgaXMgYmV0dGVyIHBsYWNlZCBzZXBhcmF0ZWx5
IGZyb20KZXhwb3J0X29wcy4KCgotLSAKQ2h1Y2sgTGV2ZXIKCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlz
dApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNv
dXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
