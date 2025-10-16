Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D93B0BE38CC
	for <lists+linux-f2fs-devel@lfdr.de>; Thu, 16 Oct 2025 14:59:15 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=24+Dz78nOdgOjJZJug8T8LL7/W8CpD4yeweWXFVAxWQ=; b=IgufR3Era22J+tdlAD6sbXzgPn
	HPrieGxnxKsBtnBr/WW0GE0HKMoI846JMVuRm6nCXlkE/e/8BlEOI9zfQM1TdUljZYbZLPRNTb+id
	+8qSiXJABNqmbGA56OkBDmEHb7djh30tRJU9H5bPO4FEJsaT71Y0IjWg4ZznEuP2ml6I=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v9NZQ-0008SN-Cg;
	Thu, 16 Oct 2025 12:59:04 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1v9NZP-0008SH-FI
 for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 12:59:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=M30CxV1aMi0FtJXMJ7c5OlauVYlqHgXAHk6l6IIqHqI=; b=BUcP4FmG5yM00SGD+pLEQHRqaR
 qs/Yrtx6+XRNKpuf2FkFeAtmoTvmvYOn+OmvfRaymSggz9LKO+2VzPWH441HkXX6fKba2g6xt20OE
 xDi5cB4Eyu1Gu+OMLea3JS2CA6r3wt46ChyL924p87Sc3pLLDpEn0TKp+NSb8swfy4Yg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=M30CxV1aMi0FtJXMJ7c5OlauVYlqHgXAHk6l6IIqHqI=; b=gDyhBHmtUJUKUwjq+CazIPkJER
 2dOH9IGcZkFuItieAUVJUdhJFaMn8Z2/pvu1mOBRs50qUBJO1gvYwP9v9d/rIZRA8M0QN6LYRkp0i
 Q+ICLHpH4Yx18G+2TvteUkadS+6dAoIQ5wbuUKvK/IPbtnJWB6ywB7yDJzObS8PuA2rE=;
Received: from mail-centralusazon11011021.outbound.protection.outlook.com
 ([52.101.62.21] helo=DM5PR21CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v9NZO-0007r6-Ny for linux-f2fs-devel@lists.sourceforge.net;
 Thu, 16 Oct 2025 12:59:03 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=NZdAHuitmV1WlU3CkoKSv80zsS4Z4kTIyg2259aDECkzZUZq1pvyAkPyFq5A9Di03DLzIcJ7rR+sRMBgItzfhmq1YTSsg8/GIunDucrIlA4IaYXfsvQWCU8RhuHP0f7Oa28iHh/6Z+0fdINSUP6LSCIxNIUKJsYd3vEWc2cxM/QIdDAOlUpUlB6hm2pExdH4vOUPHcvKlgCMKTmAFv7+oz1Xq9Y73G0lNE+NP9flN/QmCF+8p0w1E/PmYdEI7WdwvHp1FjYo7Q+z6ZisRf6UHL3U8/iexSrvK6N4HLirhf6qS0amBlN3CVRynK9ZRLjy7eZatzxOztu2NgwvfR9v8g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=M30CxV1aMi0FtJXMJ7c5OlauVYlqHgXAHk6l6IIqHqI=;
 b=hRa2RcMwfOXrRTG2AXKzxG2h/M7bdvS9oZ542OT1oECTO5+AkO/N07FJItsEOHD5kEpFasgbpj/wQSdeoSEzhgQDPu621bCRjkkNZzT7EDKhCrDZwtPypTYa0Mz9Jq7AK6JBzCrau1UYUGiQ92SmGHnzZwvVdVMEM1wBdadvTJLN8WJsCw63iSZw/8FYpi3+ZT5jJjva4ZgpDCRYdMfnKg8w69Io+LhUSE7U1oQ4RAAouZ7wqP4P2nN1nwxm69O7TYw2XXpmEcao17aBzTMbepYhD6QR9/0QixlDOQ3SloBGyvr+D4JsUlaSqDfShgt/sOmU2M+xiOrROsAWvonb+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=M30CxV1aMi0FtJXMJ7c5OlauVYlqHgXAHk6l6IIqHqI=;
 b=L4CJtmvlamsNzDZBY/0lzCl/+b2ybf5XfxMKIenDBx9Yhyw1paJwd4O7QLhrcFXxeAUIjNvSnXx17OtDJEhwxQC0B6HkBasRWlRp+ai5vZ5bZZOoGaQKAKAt01H3EgdPwcNYkCjj2vUNZ4esUbViqAbde3Z9n7Ag6mp5ky1zVN8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13)
 by LV3PR12MB9215.namprd12.prod.outlook.com (2603:10b6:408:1a0::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9228.11; Thu, 16 Oct
 2025 12:58:54 +0000
Received: from IA0PR12MB8301.namprd12.prod.outlook.com
 ([fe80::e929:57f5:f4db:5823]) by IA0PR12MB8301.namprd12.prod.outlook.com
 ([fe80::e929:57f5:f4db:5823%4]) with mapi id 15.20.9228.011; Thu, 16 Oct 2025
 12:58:54 +0000
Message-ID: <6c2c92eb-1699-4256-ab67-7c4dcee4e547@amd.com>
Date: Thu, 16 Oct 2025 18:28:26 +0530
User-Agent: Mozilla Thunderbird
To: Sean Christopherson <seanjc@google.com>, Gregory Price <gourry@gourry.net>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-9-shivankg@amd.com> <aNVQJqYLX17v-fsf@google.com>
 <aNbrO7A7fSjb4W84@google.com> <aPAWFQyFLK4EKWVK@gourry-fedora-PF4VCD3F>
 <aPAkxp67-R9aQ8oN@google.com>
Content-Language: en-US
In-Reply-To: <aPAkxp67-R9aQ8oN@google.com>
X-ClientProxiedBy: MA5P287CA0025.INDP287.PROD.OUTLOOK.COM
 (2603:1096:a01:17a::15) To IA0PR12MB8301.namprd12.prod.outlook.com
 (2603:10b6:208:40b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8301:EE_|LV3PR12MB9215:EE_
X-MS-Office365-Filtering-Correlation-Id: 5180484c-5108-4c57-c889-08de0cb3c28a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?UDJnaUJEL2V3K1hNUXlyb1VtV0FYN3Jla0JtOEVEVDJ4SVc2UmtyMkdsSldP?=
 =?utf-8?B?QWJuNXh0Z25PdW9LQlB0NFIwbTdCalQzb1ZXZmVlRTl4Nkx4UFJMSmJ1RU9q?=
 =?utf-8?B?YzZaTmZYOFNqN2NFeEgrRFhFamNJSzRsWnJMaVdSWFAzcHFpSTRKRTZ2ajVo?=
 =?utf-8?B?Yk5Pc0JkKzdidWFIV2NPeXYwcUp4V0UxODVGeUpyWXJKWkpPcVRJY3lhNlJa?=
 =?utf-8?B?VkVyVGF5bWxOdEM3RGFHZjNSa0o0WFUrMC9LR1VyZlFLTEVydVpGNEhTM0FN?=
 =?utf-8?B?QlhqT0hCVlpUaFhWQVR2d0lMZFVXSUpJUll6a2tObWFGRjZidFZtNTNwWTZs?=
 =?utf-8?B?TE5KS1lOY1NDdDFVRUFGUDUzMDRVQVFmaFVGQzdVWWtSTUQzQzlwdFNUY2g5?=
 =?utf-8?B?cmwwYWFWeEZEck1oQmFrYmQ4c1R1QkhrYjV0anRERTE4L3Bic05vVEZzdGt4?=
 =?utf-8?B?MXkxVlBheEhuRSs4aTZvWFY2SWNuSWNvYU92T0p3K3VBc0ZBSlJ0V2pYWldw?=
 =?utf-8?B?dU15WjFQVnc0YVBCeHV0dnVaSWpxSGZGT0tCUHlod1Azd1RKMXhmT3ZCTExy?=
 =?utf-8?B?Z1htOHpWdEJTcEFiWFdxZFZka2xCYWJnd1VMbzdMclRpU1E3VkxSK1Awd093?=
 =?utf-8?B?TXVYZWRHVHI0RDkrUWxZQU5vUHMyNjhFVW5RR2gyL1NmTlNnVkV1TGdkQmVX?=
 =?utf-8?B?UDJXSXNpbERSVDA0WlpkSUVoRmNEalRmdE1uaGd4ZDM5RnVXZkNiemdHM1M0?=
 =?utf-8?B?L3Fqa2pmN25yQ0dJNkREVUFzZmgxL2I4eldWSU5OMEZQRzgyaHI1MUM4cXN6?=
 =?utf-8?B?R040UW4wSGxKZ1V6ZGRLa1ZjK0c5ZkptSHFiNkU1OEVMMXNXVUk4M2VhNFA1?=
 =?utf-8?B?ZEJJblVQNmVSdHFwdzNla0NKa0RRdk92aTUrUEhobWQ1NW9sV1MzQUVTa21F?=
 =?utf-8?B?czZVZDZwRHBhTGtrMWpoNlpCQnNZcnd6OHh1TUExeXJhSU5heUNvaUs3QUFu?=
 =?utf-8?B?MDhQL04wam02dm5GQ3M1SUpPbVoxdUlXYWV3TGIrTnM5VE5vUS9pOXpFVnNR?=
 =?utf-8?B?K1ZvMDVMdFJCSU5NV1hGT3BhSmZoS2pnUWZFd3ZOZ2hRczFLbllSOEpVUU5t?=
 =?utf-8?B?bGFYUlFRZGZEV01NMSt0ME5Lb2djRlNQdFVIcHBwWTVGbXc2akd0UWVJL1F0?=
 =?utf-8?B?TkJYMTFCanFJVVM0STFYMmtIWFJVckI5cjlUT2Q4OUFKWUJwRFVzRCtVY2Rr?=
 =?utf-8?B?RlMrbUtmNUZDUS9XaUpjUnl5MXpxcnAzUW1WUm5aUzcrbnJXZGNTLzVMSG81?=
 =?utf-8?B?dXNPK0hLS2ptajBMQW15Z1k3QmVQZlNhWmRZMVhmRE10UDdWU21WaktiK0NJ?=
 =?utf-8?B?Zk1iRi9aVXdFZXRVNWNBdmkrZ1lTMmZsWThYUTBmQlJIbVEyUUZSQW96RS9k?=
 =?utf-8?B?d2hzbXpmazhOVEVMVUtUTmZnOTE5SHZtaVdBQlRicndiSkRpN2d0VldPUXQ3?=
 =?utf-8?B?dzVuVmZoU0piNWREV1lQbDBBcFU2cXhONmRoTFYvSmZTNERYNUFVaSttVmFo?=
 =?utf-8?B?SkJtWmJLWXFnSEsrdzJVa0VYNU51aVNpK0JmZEJnUHNhWGlVSGFKa1Nvc2E4?=
 =?utf-8?B?TzNPL2FSZGNFQitmZlMyT2RRNW14UFVVOTRiVjZDODlmWWYwWmJuRmNPK0Vt?=
 =?utf-8?B?MnlxQ2IvaERERVI0Y0l2TmVxNE16dy8zSHd1aDNuWXR3Z1dMQjh5QkNsK1hY?=
 =?utf-8?B?RHA0bVFKbFBLTU96OVQ4YUdaYjJGbFhnTkFMNVBTdlFvbWNUeTcxazMrd2Nw?=
 =?utf-8?B?Yk4wTXRHV09jYXJWdExha1JrcVhSNEVwRVlyZ1Q0Ym1jbEVYaExWd3NKNXYy?=
 =?utf-8?B?aEs5aDNJam5pSjlWT3lUQk5HR3NLUkh3aGU4MTV4Q0ZMZ001Sjc4em9POTFw?=
 =?utf-8?Q?I5mxNc4U42eLVUVJIGu6def+Jj97h+V+?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?cFhLM3lWUW4zTWZVMk1YaXZHTFZtd0hybDVHcWRDaFB1Q05VamZUYVRKNDcz?=
 =?utf-8?B?MkRtSFJ1d2xwd0xCN2V2Vk5LV1IrL1JpQ0RWMWFDdTN4dVN1T2hPWSs1QXZi?=
 =?utf-8?B?azVydnRiVGJmNG94Y0hMdlBkblVoeVJHeldQVmNsekQxRzRKQ1gzQ0ZEUm1i?=
 =?utf-8?B?eHRhM0VGRFdVZzZVVTJXemlMbjhSOGdoUmdtMml3SVcyeWRJMUJ4UHZoMExY?=
 =?utf-8?B?Z1lDVWlFeHVBNTBoNDJaV2Jtb2U5VnRoalBaWGRUL1ZrOHNIQ2lsYTgrc0xL?=
 =?utf-8?B?Y2pTUVcyWDRqU2FQbHUweDE1Umlqb0pQaGtkTW54dmloTGlFNW1IZ3NDWHVi?=
 =?utf-8?B?Sk9sR01aZGlvZXd6ZFdCcE5lWVFIbCt4UVQ1UlByM3JYOVA4ZkF1TnBqcjBN?=
 =?utf-8?B?dHVqRENtZlVlN2syTmVXRFdwYk5CMjZ0NzNJdjdBenlLQ0NpNG1CbUgvWkpU?=
 =?utf-8?B?aXRDVjZ0RWxIN2ZrV2NrYlYwcFJNcHVKVkI5LzFSTVBMOWtONlkzMU4xZUVL?=
 =?utf-8?B?SW50SWFkM0Naak5vTGRNV1RFUWxQZTBhdzhvRHlJQ0REbmlXbWxjVFNSeG94?=
 =?utf-8?B?ZmhJR2xqL2JJaCtGN1JiT285cTRuZlpDakk2YzR1bE9WR2VKdVc1bzZOSENW?=
 =?utf-8?B?M1lyaEF3ZDBkaDhyQUJzV2xpRGVJNUk1aW93K2twUENIMjZydVdOMGN4alAz?=
 =?utf-8?B?MU9haVgvblJTaWxOaVlMVEkxL202WThRVG5nMmJKdkRqWmJuMUQ0YktIcjRs?=
 =?utf-8?B?M2duVkZ4Y0I5NHloV2FVSEFvRXpGaXhrNDd0Rjd4ZlNBdER4RUlJL1d5M3li?=
 =?utf-8?B?TEZJQkl0TndvUVNVOW1SQjNKSVhaR2E0aVVnYWZPNFRGVjNGQVRPVy9sSWFP?=
 =?utf-8?B?QTJwVFpzNDFTNFVWUjRIMFdTUkNKL0ZySDIrSVg0TXpVN1lOQStvMEVNU29n?=
 =?utf-8?B?MWw4REhDL1NMemxEUkhKZithMldTOFRuaE9BUHRtemhnb2I0Yy9pQVJERUFv?=
 =?utf-8?B?NWZubTZ5d0tXZFFTTEdpOFRkRCtubHRVSmhFVmpvcGFnVWxaOURacFY0TWVz?=
 =?utf-8?B?RE0va2x4eEtWUTZIK0c5TXdDR2t4NkhlVUI5ZzBJNE5Udk13NmUxaDBnbXMy?=
 =?utf-8?B?YjNCdnlCQzl0eHA3QzJva2JFeHc4aUY5UWh4Q1ZHVFNBS01hSWYxakloMUxE?=
 =?utf-8?B?R0ZkMDR5Qm9vR0g1VkJLY0hsSlR0NmJoT2tPcXpWNThMOHZlaHVqZWIxZ0dK?=
 =?utf-8?B?b1RnWmppQURWdElHUGgrYXRCQ2JRMG1RUno0ZWNHWjlFK044TEJPRFlnZ1F3?=
 =?utf-8?B?ME1pNUtVejc3S3FnaDBYMGFOSW5Fd0lSdGhEMUhsN0RkbkJEVzdYU0sva2Jr?=
 =?utf-8?B?dUxtYldrY1RWdWptdjZYRE12VHdQSER0KzRlcFZNc2NiSUx3YkhsSU9paUgy?=
 =?utf-8?B?Z1ZnYzVhekhBbURuU2YwbitiOVJCV3lwS2FXdUs0QVd2SWxueVkvb2w3K20y?=
 =?utf-8?B?NlVseEJ1aks2QUFDK1ZXbE55Ukt2ZEJwRjdyZEVrcmVvdHI3WlQvT2doTzll?=
 =?utf-8?B?d3c5L1lKL0cyVXdFajVLT0ZNazM1c3FmVlUwYzRCSkJsZlo1ZGVRYjd2QnZL?=
 =?utf-8?B?REhZLzkzT05ZQUtmTzF6L29pMmxoV2FVSnZTT0drVW5XaVBSZjBodURxaDBx?=
 =?utf-8?B?YnZPaUdVZHNadHVaL3l4TGNQMGpVS2gyMklpZ0hac3hvZ0krRllHd1I2eDlM?=
 =?utf-8?B?RGpkWWh0dGdLcE1jZUdMUFcvZENTN0pDZnBkOURuWkpHc3ZVMEE4SHVzZ1B0?=
 =?utf-8?B?OHBqc2VWY3FJcEE2RWlLZEs1dktiQms2ajVEMmtQb1VUVXhXcFQwZitIOTlQ?=
 =?utf-8?B?eVhaakk2SEtncUZ0UEJDV3VGUEdXTUs5NWdyYThIS1UzSUR0M2hDelBZSEFI?=
 =?utf-8?B?VTFJN0lZMVVQZXIvWXJpQTdGeGo2VjBERDNISktpRHhuNnVUY1RNS2NhWWk3?=
 =?utf-8?B?SnZ2ei9IUVNJUWF3RnJER1dBc1JoU2llNUp3N3cxWGc5SEFsN25mR2ZyS0Zw?=
 =?utf-8?B?cVRnS0dGMDloYnJ3dHlJeWdOUEMyOTZ2Rm9IV2FtOG9BSmhTdFhJQWZPU3Fp?=
 =?utf-8?Q?mrX2vF5ctdZ5qNx93Wgkw6qJ/?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5180484c-5108-4c57-c889-08de0cb3c28a
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Oct 2025 12:58:54.0523 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1NhayZ0ER9p0NW1qe6sBl5WY9DuKaD1jfZKh+e9g2HbktKtCOfo5fuTZbQx2k+QPaEpiccJDkpeMj4dYNL5FXw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR12MB9215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 10/16/2025 4:18 AM, Sean Christopherson wrote: > On Wed, 
 Oct 15, 2025, Gregory Price wrote: >> On Fri, Sep 26, 2025 at 12:36:27PM
 -0700, Sean Christopherson via Linux-f2fs-devel wrote: >>>> >>>> st [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 ARC_SIGNED             Message has a ARC signature
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.62.21 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v9NZO-0007r6-Ny
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 6/7] KVM: guest_memfd: Enforce
 NUMA mempolicy using shared policy
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
From: "Garg,
 Shivank via Linux-f2fs-devel" <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: "Garg, Shivank" <shivankg@amd.com>
Cc: mhocko@suse.com, gshan@redhat.com, jgg@nvidia.com, kvm@vger.kernel.org,
 david@redhat.com, kalyazin@amazon.com, peterx@redhat.com, clm@fb.com,
 rppt@kernel.org, ddutile@redhat.com, linux-kselftest@vger.kernel.org,
 papaluri@amd.com, jack@suse.cz, ying.huang@linux.alibaba.com, shuah@kernel.org,
 dan.j.williams@intel.com, matthew.brost@intel.com, zbestahu@gmail.com,
 lorenzo.stoakes@oracle.com, pvorel@suse.cz, ira.weiny@intel.com,
 dhavale@google.com, jmorris@namei.org, willy@infradead.org, hch@infradead.org,
 linux-bcachefs@vger.kernel.org, vbabka@suse.cz, ziy@nvidia.com,
 rientjes@google.com, brauner@kernel.org, xiang@kernel.org, roypat@amazon.co.uk,
 chao.gao@intel.com, jgowans@amazon.com, thomas.lendacky@amd.com,
 ashish.kalra@amd.com, chao.p.peng@intel.com, yan.y.zhao@intel.com,
 byungchul@sk.com, michael.day@amd.com, Neeraj.Upadhyay@amd.com,
 michael.roth@amd.com, bfoster@redhat.com, bharata@amd.com,
 josef@toxicpanda.com, Liam.Howlett@oracle.com, surenb@google.com,
 ackerleytng@google.com, suzuki.poulose@arm.com, linux-coco@lists.linux.dev,
 dsterba@suse.com, shdhiman@amd.com, jaegeuk@kernel.org, amit@infradead.org,
 tabba@google.com, yuzhao@google.com, joshua.hahnjy@gmail.com,
 apopple@nvidia.com, nikunj@amd.com, vannapurve@google.com,
 quic_eberman@quicinc.com, paul@paul-moore.com, cgzones@googlemail.com,
 linux-mm@kvack.org, kent.overstreet@linux.dev, rakie.kim@sk.com,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, jefflexu@linux.alibaba.com, aik@amd.com,
 linux-fsdevel@vger.kernel.org, pbonzini@redhat.com, akpm@linux-foundation.org,
 serge@hallyn.com, linux-erofs@lists.ozlabs.org, linux-btrfs@vger.kernel.org,
 viro@zeniv.linux.org.uk
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net



On 10/16/2025 4:18 AM, Sean Christopherson wrote:
> On Wed, Oct 15, 2025, Gregory Price wrote:
>> On Fri, Sep 26, 2025 at 12:36:27PM -0700, Sean Christopherson via Linux-f2fs-devel wrote:
>>>>
>>>> static struct mempolicy *kvm_gmem_get_policy(struct vm_area_struct *vma,
>>>> 					     unsigned long addr, pgoff_t *pgoff)
>>>> {
>>>> 	*pgoff = vma->vm_pgoff + ((addr - vma->vm_start) >> PAGE_SHIFT);
>>>>
>>>> 	return __kvm_gmem_get_policy(GMEM_I(file_inode(vma->vm_file)), *pgoff);
>>>
>>> Argh!!!!!  This breaks the selftest because do_get_mempolicy() very specifically
>>> falls back to the default_policy, NOT to the current task's policy.  That is
>>> *exactly* the type of subtle detail that needs to be commented, because there's
>>> no way some random KVM developer is going to know that returning NULL here is
>>> important with respect to get_mempolicy() ABI.
>>>
>>
>> Do_get_mempolicy was designed to be accessed by the syscall, not as an
>> in-kernel ABI.
> 
> Ya, by "get_mempolicy() ABI" I meant the uABI for the get_mempolicy syscall.
> 
>> get_task_policy also returns the default policy if there's nothing
>> there, because that's what applies.
>>
>> I have dangerous questions:
> 
> Not dangerous at all, I find them very helpful!
> 
>> why is __kvm_gmem_get_policy using
>> 	mpol_shared_policy_lookup()
>> instead of
>> 	get_vma_policy()
> 
> With the disclaimer that I haven't followed the gory details of this series super
> closely, my understanding is...
> 
> Because the VMA is a means to an end, and we want the policy to persist even if
> the VMA goes away.
> 
> With guest_memfd, KVM effectively inverts the standard MMU model.  Instead of mm/
> being the primary MMU and KVM being a secondary MMU, guest_memfd is the primary
> MMU and any VMAs are secondary (mostly; it's probably more like 1a and 1b).  This
> allows KVM to map guest_memfd memory into a guest without a VMA, or with more
> permissions than are granted to host userspace, e.g. guest_memfd memory could be
> writable by the guest, but read-only for userspace.
> 
> But we still want to support things like mbind() so that userspace can ensure
> guest_memfd allocations align with the vNUMA topology presented to the guest,
> or are bound to the NUMA node where the VM will run.  We considered adding equivalent
> file-based syscalls, e.g. fbind(), but IIRC the consensus was that doing so was
> unnecessary (and potentially messy?) since we were planning on eventually adding
> mmap() support to guest_memfd anyways.
> 
>> get_vma_policy does this all for you
> 
> I assume that doesn't work if the intent is for new VMAs to pick up the existing
> policy from guest_memfd?  And more importantly, guest_memfd needs to hook
> ->set_policy so that changes through e.g. mbind() persist beyond the lifetime of
> the VMA.
> 
Additionally, the shared_policy based design enables range-based policies via its RB-tree
implementation. IIUC, this will not work with VMA-specific policy design.

>> struct mempolicy *get_vma_policy(struct vm_area_struct *vma,
>>                                  unsigned long addr, int order, pgoff_t *ilx)
>> {
>>         struct mempolicy *pol;
>>
>>         pol = __get_vma_policy(vma, addr, ilx);
>>         if (!pol)
>>                 pol = get_task_policy(current);
>>         if (pol->mode == MPOL_INTERLEAVE ||
>>             pol->mode == MPOL_WEIGHTED_INTERLEAVE) {
>>                 *ilx += vma->vm_pgoff >> order;
>>                 *ilx += (addr - vma->vm_start) >> (PAGE_SHIFT + order);
>>         }
>>         return pol;
>> }
>>
>> Of course you still have the same issue: get_task_policy will return the
>> default, because that's what applies.
>>
>> do_get_mempolicy just seems like the completely incorrect interface to
>> be using here.



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
