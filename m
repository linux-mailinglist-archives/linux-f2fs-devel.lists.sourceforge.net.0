Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F7DADCECC
	for <lists+linux-f2fs-devel@lfdr.de>; Tue, 17 Jun 2025 16:08:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Type:Content-Transfer-Encoding:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKZY8u1O9/CU5T2d8FtoXjaO+uJoki06bwXHillTXPY=; b=RbM5TuASuQ9v8d310QrFTSq5s1
	HJB5e7Fdei8IB0Yt5afQxWzWrih8+NjFArrW89Ox6xSdssViwYR7Xw8vsIlXspuLLWYb0exYRrTQ8
	RMacVsVIut34G3fDx03unPiddeGLpKPBPmAhS5ikAtWesQ/MlCijQL8VgpFFGG8kfwx4=;
Received: from [127.0.0.1] (helo=sfs-ml-3.v29.lw.sourceforge.com)
	by sfs-ml-3.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1uRWzR-0006ch-1L;
	Tue, 17 Jun 2025 14:08:41 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-3.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <dave.kleikamp@oracle.com>) id 1uRWzN-0006cI-BM;
 Tue, 17 Jun 2025 14:08:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8oKkXqWtxjgAj9B6YdYXjVyrnRlQETbPFOsHG8ye+TY=; b=jr6UqjgBqz3VukHcsXOSuPfYjp
 H6a32ZwMK4xKJ0Cb5i2ijeEdAnoY+Id65tVmfn/Uof2z2WOhAtJLfOXfhbDhGiFLUenqLtU+oWWpE
 GDvIuXq3j0P2BmDlf0sB6LxdJSD3ANWbDURCdXewNHWYs1EZsy+0KuCua4Hai0x6Xiwg=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8oKkXqWtxjgAj9B6YdYXjVyrnRlQETbPFOsHG8ye+TY=; b=EEuWgoohx8IbZXJ4gF2BCpmOsx
 3H34QbGsb6bCOjYqi55VIzmZ0IJU8LefgtWcZkmk8ApHPw/lHMuVL0KlcEukqIcOTpFq6nOL3ogam
 x4bSGwu5QFfk2gkavOd9U8m9O/iQDc92UCFYuSrX1NkbdAepoqvkjv3exbY0WF7sg6G0=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1uRWzM-0001XN-HD; Tue, 17 Jun 2025 14:08:37 +0000
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55H8tZJQ026730;
 Tue, 17 Jun 2025 14:07:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=8oKkXqWtxjgAj9B6YdYXjVyrnRlQETbPFOsHG8ye+TY=; b=
 DnFh08XP3+BLK6COLtobny7dH6juXqFHJu4JIab677hNWX8iQ+6Ewl0iQYLkoKLp
 mCvqd3wk0312uO3huxNTBhOdjM6ql9kyYQh5SYUHMHnrvkKEakwGoKPNWzZ96s+Z
 xdboxR7ldXZKuxBctFwkcssNEYpHLqzkhETN4PbCZbagf/7cfTaLI8cqT97QJdkZ
 x1rrPSo4ktuOwaAbhjsGjKuuXxh9XfTK2JleacPXNp3sYhrT2LH9iosXWaYrAXD+
 DaePRHXge1nYDy+gEntWN9ukRdCRpaF81bwk4CDveV4sOjnfUTAsPr/1s+qxdy0E
 VXippHF0Fbi8J3uf8ejEFw==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com
 (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 47914enbf5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 14:07:30 +0000 (GMT)
Received: from pps.filterd
 (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 55HD4gET032155; Tue, 17 Jun 2025 14:07:29 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com
 (mail-bn8nam11on2089.outbound.protection.outlook.com [40.107.236.89])
 by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id
 478yh99g17-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 17 Jun 2025 14:07:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=p4iGOJ6kd0LPl9wI+34gvLk/MJva4nrz2G0yyYSPnD1bn5SN/lIm5oon6DGzjoEnk4lmMeYhLNpV5V2lFd3emwo7xPSrr9Lert6i9uefUCezEpQC7/UE+rdR89B4anXQ3YdyuEqN9ZAD7XY3/ciVP6jbK3IZCaPjMj0ipAk80pr/Oy/fIWOz/EE4FIjNCeJDWJD7EZ1umbvrbAAwJj7qdraP45iYN9h7jNG/r61wETEDv6WPdNzqIgNC3qg8Kqp3mmZBn9UmeZ1oJ+NG+BMzzYmm08t/TCjS7OE4DmEtjbzHN9T5MbP4sbMVqilnvleOMDt4uMuZeVGY0muZ+GGiJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8oKkXqWtxjgAj9B6YdYXjVyrnRlQETbPFOsHG8ye+TY=;
 b=Oc5/XR/ZPnLjZq1qTBqE5hQBn/WPGr7A/3mONKmlN34nAHkOF5Mzwmu7bVcB8zWge4M6GYFaKfGZ7WAmFeYDeK9vPZa/5J+Ik7TsBuEi9AWSx6d4QQ0NiG1ocDNEPTe6iQAYUot17m2RTIFd+HuIrDVG4/zJhe5jKv8759xTAp6jf5R7SUYmhKsPt0lIrB5DnLNU+n3crXGUlyXL1bkqNbyBQp+fuMfDBtq5MtPDGM0Xf0ikEUBFhS6YfxBvh5C7DN4ZB+cpra6phA3ukp/qxDyL8IioVirGheieXeUyuWYYYfAaX/m+DaOSI0eoBFWRWdw56YxmZcfBFv00Sdyq9g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8oKkXqWtxjgAj9B6YdYXjVyrnRlQETbPFOsHG8ye+TY=;
 b=xFyoSn3iAAJTET+b1KlAioNgOPztjXKrrWPMgxYs7iiMCe3jTzKvIBP+qSLlZdCBgOdSlPr8r2OFumdKc83vj/DtNd5ArSBaxXZfcrEEDBJWw2tDDZO2Wqty66mz75Q95RDM+OkWrD45olbl9YQQ1PndWgyjc5NMdcqQZf2ZsXM=
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d) by CH3PR10MB7308.namprd10.prod.outlook.com
 (2603:10b6:610:131::11) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8835.29; Tue, 17 Jun
 2025 14:07:23 +0000
Received: from DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::1c40:7ef9:414e:f765]) by DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 ([fe80::1c40:7ef9:414e:f765%5]) with mapi id 15.20.8835.023; Tue, 17 Jun 2025
 14:07:22 +0000
Message-ID: <e20adc50-7c83-4bd1-aaff-799a5debdfbe@oracle.com>
Date: Tue, 17 Jun 2025 09:07:15 -0500
User-Agent: Mozilla Thunderbird
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>
References: <cover.1750099179.git.lorenzo.stoakes@oracle.com>
 <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
Content-Language: en-US
In-Reply-To: <c7dc90e44a9e75e750939ea369290d6e441a18e6.1750099179.git.lorenzo.stoakes@oracle.com>
X-ClientProxiedBy: CH0PR13CA0032.namprd13.prod.outlook.com
 (2603:10b6:610:b2::7) To DM3PPF35CFB4DBF.namprd10.prod.outlook.com
 (2603:10b6:f:fc00::c1d)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM3PPF35CFB4DBF:EE_|CH3PR10MB7308:EE_
X-MS-Office365-Filtering-Correlation-Id: e4f5e2d1-b0c7-4b93-2740-08ddada84741
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|7416014|376014;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?a1MwaWdxNEhHWDNETWlqZ1NsMHp1RzA3VkQ1KzE4bSs1NWYwQjZmVEg2d25i?=
 =?utf-8?B?UGJqS29GVkEyV3pKeW5FY3RleDVqNTNubzlhNUZqLzlmNFdRRy9OeFR2TTh1?=
 =?utf-8?B?bjU2c3ZCMnZhSGtKQTkvSU4zSnRSVFQ4ZVFDWEU0ZytoYUIvM1cwMjZIeUMr?=
 =?utf-8?B?VFRkZ3Yyd29SUHhwYm1lcWFsRXdYbjM1T0ZyR3ZiVGlsc0NXUUtvMVYyQXdB?=
 =?utf-8?B?Yi9BQkdRbzROUnFmQWpMSTduV0VjcXpEQ2pRTE5rRSszVXI5OUJoNzE3ZWMw?=
 =?utf-8?B?L3J3d1htenZzRUd2aUc4UHhabi9ZN1dPNzh6bTBLdm5nOFhObTFoSjJxM1d5?=
 =?utf-8?B?SDhNSHJNbkFyMmpLWWdNcmRIQ0Z0bEQ2dTg5T1ByYUlVRndzWkxOcDA5RFhn?=
 =?utf-8?B?cFVBbUZ0MDJkaWV5K1BReEJITUl5aElleWQ4SUtpRmgwcDJjOTdHb1RuMDdB?=
 =?utf-8?B?ZndwOUZDMzZ4eWF0TGNtejdWWEJQQ2hIVmhlNVhXdjZ0cXEwNEIzTFhhQlBq?=
 =?utf-8?B?dER6TUdIT2RWU0E5WE9QVWt4bzRUYm03b3ViRW05V1ZHYWxUb3c2QUJOTHFH?=
 =?utf-8?B?MjYwM0RwTjlsL0RPZEdwWHg3VzQ2Z05VKzJRMldGa2Q1SCs2YkRJNjFTOGdl?=
 =?utf-8?B?L2hOeXBqc0VoTG9TYVJ6Ni92eHJtbDdta0ZSUldlNUN3cVRFM3BlbWNPRDQ3?=
 =?utf-8?B?Y0tLYmJ2YlREMkkrcjNJdEZ1Tjg2M1JNVXlQMUhlaTQrTHZHb1dNMnJBL25q?=
 =?utf-8?B?bGRZZjR5MFl6aWxGbjgwRk9FbWdxL0lzbm02eGxkSDRRSlg2QUpkelVYN1JE?=
 =?utf-8?B?RHR2Q1g1bG5xR3NxT0RSOHNEeS92VmpPUk5MV2RXQ1VuT2E0OXQ1UmFSZnVM?=
 =?utf-8?B?SHZUOUNNcE82NTRhSFZBWEdrejNWS1NITkc4OUZFOElOcGFDaDJHZWhRcjBw?=
 =?utf-8?B?Mnh6c0ZsM1JDTTNlZGhhWVZ0bVI5MnpwemhzQVZVMXBGMG92T2RZU2FwclFJ?=
 =?utf-8?B?NlQzb1RQc1JPQ2E5VDVDVmZRL2JKdHhEK0NNbDFpRktBbEFPRXE4Y2RPeVdu?=
 =?utf-8?B?WEdya0poYVpiQlpBaDlOL0lHMEg3N1pzNFpsRVFjL056M3dOcXpDTlZUOTV0?=
 =?utf-8?B?UElJdVVKUXR5bkxZSDlYMzUzUGxjK3hJdDFGTEtSZzBtblNVaDVBMHlHejZv?=
 =?utf-8?B?VkhTOXpTVG5kVG9JZkdNR1o3Z2pmMXJHSUpSdnVCcDFKd3RWbkJkVUE1Nkty?=
 =?utf-8?B?WkdVZWhDVlBBd0VNVjZqTzBONWE5Y3NiNzVvRHdCczI4SHpHc2JZckpGVHpr?=
 =?utf-8?B?OVNQMm9Ea0RhU29Ea1VZWkM1RDAvL2FMcnE4Z1hLamV2eDBLY0lKM2d0U2V0?=
 =?utf-8?B?QTF3Qlp3QUpBdnROK1o5WVlkMXdBYjJ3MkN4Q0FMT1RKS0RmQTNHbHN3ZnFk?=
 =?utf-8?B?Rm5iNW04V0JiQ21NWGFQdlN6SWlkMTJtN0tPT3hvU0c0TlpEaFZVQjA5WENM?=
 =?utf-8?B?S1dhUVNZdisxZUd4UFNaazNrNXNvbExPOXlLOHcrcjNBczZ5YXRCOE4yMDI0?=
 =?utf-8?B?TXZodUpyNWNHU1ZZWDZwZ1NEaTE5U0dLclhjblYzNUUveDRkeGhNU2ZEU1N6?=
 =?utf-8?B?by9TSlU0Vm90aXdaSkx6Mm9yb0I3WjJ3TFNySEJXY3hRVVBnL3VURzd6YUgw?=
 =?utf-8?B?MCtPS2xtQXZ3RXJ5S0I4VVF3bk5GU1JMR0lNVWd6ejNQUzdwb1liV0hWUU5P?=
 =?utf-8?B?RmE4bGYvMktOSGxRNk9zYW5NT0g3MTFXcTByblRWRWpDR0lPVjZuRjJTUUkr?=
 =?utf-8?B?OUlQay9MMnpqYUpqdmVVSHUwMisvMW96RTVUYjgwQlQyM0J2ZUpLN0xsdXFq?=
 =?utf-8?B?bmU5SC9ZQWdONWorWVNONnZ0NndhUGZPVVBiTzV4ZFRMbkpySHF6ZkdtN05Y?=
 =?utf-8?Q?2TVQFSQQEGA=3D?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM3PPF35CFB4DBF.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(1800799024)(366016)(7416014)(376014); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?WDRCY0wvVnRNUnllRGJwZ2hqcmJpTHhweTdlby9PNjBhQjJkbmxsV0RKc3l0?=
 =?utf-8?B?UThlRHcvTXhoNHVmV2RVcUpkaEhHU2FmenZDb3BvZnF0RzZnSzRHTlJtVmcr?=
 =?utf-8?B?WVlYU3BkSS9tQWYvR2NRSWsxRWMxYkNOV0h4U0FvVjA4UHB4R0Y4NW5ySDl1?=
 =?utf-8?B?ZUl6Q1FlQ1YzYXpRckxiUHdwMkVEZit0dWlLc09aUUt6amhNSFRBSTNQTTlk?=
 =?utf-8?B?RFgrZEJZL0tlUUZFM1VpSjkwV1g1VFJpSVE5TDhQdTFlZllJejl3RGxueW56?=
 =?utf-8?B?OFVGOGVxWm82Qmh5WnRJZXJxWEE0ZGZJZ2k5cXFPWFdyTTZkaVgzV0ZhQ3Mx?=
 =?utf-8?B?TVEzc05BajhHMWtKSXAwQzV1aytFVzdoek5rSnNpUmhNTm5SejAwWFgvNDhu?=
 =?utf-8?B?OUlOVlYwajNEWXNSYmQ5YjN5aWxlUlVMdmVyQnpWdjdYWFYrV3RMNTBOMWMr?=
 =?utf-8?B?TCtYWERHNXhMY2wvaG1BWkRJZUJ4dHZaSy83UVo5ZWlkWXdFQmMwN3dQRHFl?=
 =?utf-8?B?NlVKV0ZkcURJaHZ4RXhSQjBVT2pZc0lZaytKaHJhWTZEcEVYYXN6VkV3TEhu?=
 =?utf-8?B?dnF3L0pnSDZKTjI0d216MEJnM2dhNHpIWkdQMmUzMHVpaFZJYkdnM01rV1ox?=
 =?utf-8?B?cDc5SjFZNlQrVGlURTg2UnhSajJ4aGdwcG9zOEdVNTlzZnczRUFCMlI3TXQ0?=
 =?utf-8?B?dlBDMzJZL0JHTm1NQzQ2Q3prZlZDNEY3R2tIUGtVaHI3TmF6ZWt6U09nVjYw?=
 =?utf-8?B?VzJGZjhPMVl0UFluVG5ZalVYUzh0QU90a254VlladHZBc2d4cmtXWmxRMVVU?=
 =?utf-8?B?ejhDdmNsdXAxMHlLN1JoK204eG9SV3M0YitIeXE0YWRKUHhwVWZxa2JZOXo2?=
 =?utf-8?B?Ukt2NW5oWjhRamY5TVgxVWo3d3orT29XQ3kzUGtnTUNCc1hudHZLQTRRTHZQ?=
 =?utf-8?B?SjBOTEtXZmhuZVNqRGIzOVhCVUIxdVNsTy9YWDlpSTM0a2lKeDhaY2Fab3V0?=
 =?utf-8?B?RXBNYitwWFNaamt6Ymdxcm5taGY5bXRIU2Y3VHM4UjRFL21ocXpPL2xRclFL?=
 =?utf-8?B?cVhFcTRZTmUyOGVsUzVLVlVLWDVzNHFXWmFIWnRyZlpHei9RbkpVSXpYNnRK?=
 =?utf-8?B?bW1wU1V4QkJPWVdRcDVLWXVWb2N4bVdZUmdMVTNrdE1UdVg4S0tXQVRybUsx?=
 =?utf-8?B?Z2F2My81YVBZT0ZMSVp2V0grd0ZvMVZ3S0VKYWxKRkZXUHFQN1F5QVhTR2NI?=
 =?utf-8?B?NVNaZGpDSVhma1JXbjZQWjcrRER2ZnowRUN6Z2tOVFFtcFJLZy8rQURrdEs1?=
 =?utf-8?B?cmo4cEgvUk5COTRWRmRUV1dQcUt4VHQyVGJaZEJ1N1pkVVFJTEVpZWd4U3V3?=
 =?utf-8?B?TlBFOEJNc1JIS3BsOHBMZ3FDa3pwdmF6M0NIUkVTaHlWaVFvNVFPYXBRUk9W?=
 =?utf-8?B?OUNxVys0SThTUTExTE1uTzlpbktjYlhDbWp2TnRxbWs0YUNwQlI3NTBwQU95?=
 =?utf-8?B?SHJMZUxSQW1BNXV2RVBrMmYzb2NEVFpvcUtOMXd5Z1ZqNWcyTEF2TlFLNzF3?=
 =?utf-8?B?ZnBOOCtuZWY1YlNZdzBtQTdCakNhVTUwdjJ5VGFRbVppV0o5bnlFN3F0WEYx?=
 =?utf-8?B?MHh0WWFGc2VrbGZRSXdoNnhRMU1nNW1kaXd3dlRaNFhkR013ZmxINW40TGUz?=
 =?utf-8?B?TGZTMEJIY01pUUJWeDlmcG93dDJkWUpRUDBBR3NhNnVOZ0VVcmUrZjlqV25W?=
 =?utf-8?B?SkJZWHZGdmllK3pRaEhsSkhhT0pST3hPaGs0VWhuMWhORXdyWjAxMHFxVE5G?=
 =?utf-8?B?YjArdkNtTnRDYlBqL0t4ZnFsYmZzN1g3NnBNV3Nmd3NZN0J5NW9aWHBNNmJS?=
 =?utf-8?B?ZEJkdS9NblVwSUErLzJpZ21BVmRQeGM5WXE1bzN0b3c4dnNNOERNTGhQc3Rp?=
 =?utf-8?B?eHJwRkh3c2dEQ3o3eDFXcS92R0huSWN5emNUZm96OWlSZ3NPL3NRbm1WZk9F?=
 =?utf-8?B?WW9MWUkybUpsR1ZOYjB1SjFIck80VGJyQnZyb3Jmb2Zwb1dkdm5TUTN4SkNy?=
 =?utf-8?B?RVFoRk50K0o0VktWallCMlp5SmlQMVRMZmx6cnM4dEJFaVdnY0IyejRoMUFt?=
 =?utf-8?B?cHN5RTJ2UHQra0RDcmgrRE1jUEQxSzZzTnFZczR4RXdTd2dTNmM0cjY3Y3RP?=
 =?utf-8?B?dHc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 8sDeyZdz4JzHr5nwNZH6GpVkAU0r0hVq9TqLSGrYzQwTxn1Zn+k+sEv96jdUw61XJQnr3YthOKB9s/b1DEwzTokEGUBjMsCTFBQK7tzbiHd6SzoWNkpNPRZJgRzdLo2aoRCYIv8nwtXmD+MCOFaBqLCNsJWLko/cbobwCiQd4rm11gi/Diwtr5ELlkNj5r99U6KhpS30rkliq5mp5MnzQSxgfBR2xuFu8a7Ak6ie2Ihe0quPPkKvghXtlnib7bgiAthYPczXDSVjAwk+FMAk92CPFyZWUj6sCp9+ur2d5H1mtmSa2UWmojy92EcLHws8RoCGztUou4Xx8s8krMX0zgBwVFwG+IGN9vfxUouw9okUbgu7HLb+7VxCDjGKDrXbB8ogoE7lYAthuyH5w4dVoVcpvtrvLXSevQmTTCbGc3h3iKOQaHs3i92fBAmiuiLjmpcKkWPJehfr7vidagvqB9m/gbcCudQ/tRAq9MWDvV737iVpn0ya9moHa563s5F7g2HDrLVAxLdoOeduGMEFo7NCBCBrYzOmH8O/9PGiuyNwwhUv/Zh1uwqneKUjjhKGj3IksRW526E1t2CCyDt6rNKsu5iRQEQqfqvY8r5Ghpo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e4f5e2d1-b0c7-4b93-2740-08ddada84741
X-MS-Exchange-CrossTenant-AuthSource: DM3PPF35CFB4DBF.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Jun 2025 14:07:22.1402 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: YmVfAV/JcEikiGaTEPi20uzuoRXu2BEmrPuh9jssYmB3TR40bpbTRAa/bXHAYZZKSBaMAE4lR3tPu5ARO3zCsfnjk6BbTxdM+B5t9ZGJAL0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7308
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-17_06,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 mlxlogscore=999 mlxscore=0
 spamscore=0 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2506170109
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE3MDEwOSBTYWx0ZWRfX4zUr4RJnhmn+
 MGfOtjJ1emvnhhQGvj595fWQjXp0Of9tdIaGawP/Kz9TiW3+w8SzCTzbk2+N9cZsCOkiunrrEqx
 5dG/lj1h2uInC/K8ajVeX15M7Su/Usq+ozQMjHjyZXRXoL4DUi5cYVuthA863Z9dFLNORI7HKKA
 axyWTU2sKS1DOhul3NsmztGXdrVGXUOckqDh5S65TKBayjUeiNyWuTj8qnh0KRkFTsFgfp9Mhtf
 FJa1BCQZ7G+zfgdVtutZbzowgLUTXCQ/aUQDRMhOMFvM+mdkvC5GREEHtGBt+gmEw7azC17p6L5
 Fdv3Yii+IfFFFVn6cW1/t1WFuKI4bFWr9stMsGKXnSewN4FnoriCo0kH83uXOpdlkWZNLO2kXNS
 nvs2+b7ZjISNW5hsEakp+wC49b+tp4ccA1ZyNmLnSV0XiBVJzX3UwwXAL+TjkpDGuSQUG75+
X-Authority-Analysis: v=2.4 cv=U4CSDfru c=1 sm=1 tr=0 ts=685176a2 b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19
 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6IFa9wvqVegA:10 a=GoEa3M9JfhUA:10 a=yPCof4ZbAAAA:8 a=o5G-qmDkIs9ic1zT-8QA:9
 a=QEXdDO2ut3YA:10
X-Proofpoint-GUID: DouHvnqdEtcZBK_RLAs42C0I7p1ZWtiD
X-Proofpoint-ORIG-GUID: DouHvnqdEtcZBK_RLAs42C0I7p1ZWtiD
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 6/16/25 2:33PM,
 Lorenzo Stoakes wrote: > Since commit c84bf6dd2b83
 ("mm: introduce new .mmap_prepare() file > callback"), the f_op->mmap() hook
 has been deprecated in favour of > f_op->mmap_prepare [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.0 RCVD_IN_MSPIKE_H5      RBL: Excellent reputation (+5)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1uRWzM-0001XN-HD
Subject: Re: [f2fs-dev] [PATCH 08/10] fs: convert simple use of
 generic_file_*_mmap() to .mmap_prepare()
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
From: Dave Kleikamp via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Dave Kleikamp <dave.kleikamp@oracle.com>
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
 linux-fsdevel@vger.kernel.org, Trond Myklebust <trondmy@kernel.org>,
 Dave Kleikamp <shaggy@kernel.org>, Sandeep Dhavale <dhavale@google.com>,
 Simona Vetter <simona@ffwll.ch>, linux-cifs@vger.kernel.org,
 linux-nilfs@vger.kernel.org, codalist@coda.cs.cmu.edu,
 Namjae Jeon <linkinjeon@kernel.org>, ecryptfs@vger.kernel.org,
 Yangtao Li <frank.li@vivo.com>, Jani Nikula <jani.nikula@linux.intel.com>,
 ocfs2-devel@lists.linux.dev, Pedro Falcato <pfalcato@suse.de>,
 OGAWA Hirofumi <hirofumi@mail.parknet.co.jp>, linux-block@vger.kernel.org,
 Theodore Ts'o <tytso@mit.edu>, linux-f2fs-devel@lists.sourceforge.net,
 Hongbo Li <lihongbo22@huawei.com>, Anna Schumaker <anna@kernel.org>,
 Martin Brandenburg <martin@omnibond.com>, Kees Cook <kees@kernel.org>,
 Yuezhang Mo <yuezhang.mo@sony.com>, Carlos Maiolino <cem@kernel.org>,
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
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 6/16/25 2:33PM, Lorenzo Stoakes wrote:
> Since commit c84bf6dd2b83 ("mm: introduce new .mmap_prepare() file
> callback"), the f_op->mmap() hook has been deprecated in favour of
> f_op->mmap_prepare().
> 
> We have provided generic .mmap_prepare() equivalents, so update all file
> systems that specify these directly in their file_operations structures.
> 
> This updates 9p, adfs, affs, bfs, fat, hfs, hfsplus, hostfs, hpfs, jffs2,
> jfs, minix, omfs, ramfs and ufs file systems directly.
> 
> It updates generic_ro_fops which impacts qnx4, cramfs, befs, squashfs,
> frebxfs, qnx6, efs, romfs, erofs and isofs file systems.
> 
> There are remaining file systems which use generic hooks in a less direct
> way which we address in a subsequent commit.
> 
> Signed-off-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

For JFS,

Acked-by: Dave Kleikamp <dave.kleikamp@oracle.com>

> ---
>   fs/9p/vfs_file.c        | 2 +-
>   fs/adfs/file.c          | 2 +-
>   fs/affs/file.c          | 2 +-
>   fs/bfs/file.c           | 2 +-
>   fs/fat/file.c           | 2 +-
>   fs/hfs/inode.c          | 2 +-
>   fs/hfsplus/inode.c      | 2 +-
>   fs/hostfs/hostfs_kern.c | 2 +-
>   fs/hpfs/file.c          | 2 +-
>   fs/jffs2/file.c         | 2 +-
>   fs/jfs/file.c           | 2 +-
>   fs/minix/file.c         | 2 +-
>   fs/omfs/file.c          | 2 +-
>   fs/ramfs/file-mmu.c     | 2 +-
>   fs/read_write.c         | 2 +-
>   fs/ufs/file.c           | 2 +-
>   16 files changed, 16 insertions(+), 16 deletions(-)
> 
> diff --git a/fs/9p/vfs_file.c b/fs/9p/vfs_file.c
> index 348cc90bf9c5..2ff3e0ac7266 100644
> --- a/fs/9p/vfs_file.c
> +++ b/fs/9p/vfs_file.c
> @@ -516,7 +516,7 @@ const struct file_operations v9fs_file_operations = {
>   	.open = v9fs_file_open,
>   	.release = v9fs_dir_release,
>   	.lock = v9fs_file_lock,
> -	.mmap = generic_file_readonly_mmap,
> +	.mmap_prepare = generic_file_readonly_mmap_prepare,
>   	.splice_read = v9fs_file_splice_read,
>   	.splice_write = iter_file_splice_write,
>   	.fsync = v9fs_file_fsync,
> diff --git a/fs/adfs/file.c b/fs/adfs/file.c
> index ee80718aaeec..cd13165fd904 100644
> --- a/fs/adfs/file.c
> +++ b/fs/adfs/file.c
> @@ -25,7 +25,7 @@
>   const struct file_operations adfs_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.fsync		= generic_file_fsync,
>   	.write_iter	= generic_file_write_iter,
>   	.splice_read	= filemap_splice_read,
> diff --git a/fs/affs/file.c b/fs/affs/file.c
> index 7a71018e3f67..fbac204b7055 100644
> --- a/fs/affs/file.c
> +++ b/fs/affs/file.c
> @@ -999,7 +999,7 @@ const struct file_operations affs_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.open		= affs_file_open,
>   	.release	= affs_file_release,
>   	.fsync		= affs_file_fsync,
> diff --git a/fs/bfs/file.c b/fs/bfs/file.c
> index fa66a09e496a..6685c3411fe7 100644
> --- a/fs/bfs/file.c
> +++ b/fs/bfs/file.c
> @@ -27,7 +27,7 @@ const struct file_operations bfs_file_operations = {
>   	.llseek 	= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.splice_read	= filemap_splice_read,
>   };
>   
> diff --git a/fs/fat/file.c b/fs/fat/file.c
> index e887e9ab7472..4fc49a614fb8 100644
> --- a/fs/fat/file.c
> +++ b/fs/fat/file.c
> @@ -204,7 +204,7 @@ const struct file_operations fat_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.release	= fat_file_release,
>   	.unlocked_ioctl	= fat_generic_ioctl,
>   	.compat_ioctl	= compat_ptr_ioctl,
> diff --git a/fs/hfs/inode.c b/fs/hfs/inode.c
> index a81ce7a740b9..d419586d668d 100644
> --- a/fs/hfs/inode.c
> +++ b/fs/hfs/inode.c
> @@ -690,7 +690,7 @@ static const struct file_operations hfs_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.splice_read	= filemap_splice_read,
>   	.fsync		= hfs_file_fsync,
>   	.open		= hfs_file_open,
> diff --git a/fs/hfsplus/inode.c b/fs/hfsplus/inode.c
> index f331e9574217..0af7e302730c 100644
> --- a/fs/hfsplus/inode.c
> +++ b/fs/hfsplus/inode.c
> @@ -366,7 +366,7 @@ static const struct file_operations hfsplus_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.splice_read	= filemap_splice_read,
>   	.fsync		= hfsplus_file_fsync,
>   	.open		= hfsplus_file_open,
> diff --git a/fs/hostfs/hostfs_kern.c b/fs/hostfs/hostfs_kern.c
> index 702c41317589..bc22b6cc72af 100644
> --- a/fs/hostfs/hostfs_kern.c
> +++ b/fs/hostfs/hostfs_kern.c
> @@ -382,7 +382,7 @@ static const struct file_operations hostfs_file_fops = {
>   	.splice_write	= iter_file_splice_write,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.open		= hostfs_open,
>   	.release	= hostfs_file_release,
>   	.fsync		= hostfs_fsync,
> diff --git a/fs/hpfs/file.c b/fs/hpfs/file.c
> index 449a3fc1b8d9..a1a44e3edb19 100644
> --- a/fs/hpfs/file.c
> +++ b/fs/hpfs/file.c
> @@ -255,7 +255,7 @@ const struct file_operations hpfs_file_ops =
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.release	= hpfs_file_release,
>   	.fsync		= hpfs_file_fsync,
>   	.splice_read	= filemap_splice_read,
> diff --git a/fs/jffs2/file.c b/fs/jffs2/file.c
> index 13c18ccc13b0..1e05f7fe5dd4 100644
> --- a/fs/jffs2/file.c
> +++ b/fs/jffs2/file.c
> @@ -54,7 +54,7 @@ const struct file_operations jffs2_file_operations =
>    	.read_iter =	generic_file_read_iter,
>    	.write_iter =	generic_file_write_iter,
>   	.unlocked_ioctl=jffs2_ioctl,
> -	.mmap =		generic_file_readonly_mmap,
> +	.mmap_prepare =	generic_file_readonly_mmap_prepare,
>   	.fsync =	jffs2_fsync,
>   	.splice_read =	filemap_splice_read,
>   	.splice_write = iter_file_splice_write,
> diff --git a/fs/jfs/file.c b/fs/jfs/file.c
> index 01b6912e60f8..5e47951db630 100644
> --- a/fs/jfs/file.c
> +++ b/fs/jfs/file.c
> @@ -143,7 +143,7 @@ const struct file_operations jfs_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.splice_read	= filemap_splice_read,
>   	.splice_write	= iter_file_splice_write,
>   	.fsync		= jfs_fsync,
> diff --git a/fs/minix/file.c b/fs/minix/file.c
> index 906d192ab7f3..dca7ac71f049 100644
> --- a/fs/minix/file.c
> +++ b/fs/minix/file.c
> @@ -17,7 +17,7 @@ const struct file_operations minix_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.fsync		= generic_file_fsync,
>   	.splice_read	= filemap_splice_read,
>   };
> diff --git a/fs/omfs/file.c b/fs/omfs/file.c
> index 98358d405b6a..319c04e63964 100644
> --- a/fs/omfs/file.c
> +++ b/fs/omfs/file.c
> @@ -332,7 +332,7 @@ const struct file_operations omfs_file_operations = {
>   	.llseek = generic_file_llseek,
>   	.read_iter = generic_file_read_iter,
>   	.write_iter = generic_file_write_iter,
> -	.mmap = generic_file_mmap,
> +	.mmap_prepare = generic_file_mmap_prepare,
>   	.fsync = generic_file_fsync,
>   	.splice_read = filemap_splice_read,
>   };
> diff --git a/fs/ramfs/file-mmu.c b/fs/ramfs/file-mmu.c
> index b45c7edc3225..b11f5b20b78b 100644
> --- a/fs/ramfs/file-mmu.c
> +++ b/fs/ramfs/file-mmu.c
> @@ -41,7 +41,7 @@ static unsigned long ramfs_mmu_get_unmapped_area(struct file *file,
>   const struct file_operations ramfs_file_operations = {
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.fsync		= noop_fsync,
>   	.splice_read	= filemap_splice_read,
>   	.splice_write	= iter_file_splice_write,
> diff --git a/fs/read_write.c b/fs/read_write.c
> index 0ef70e128c4a..80fdab99f9e4 100644
> --- a/fs/read_write.c
> +++ b/fs/read_write.c
> @@ -28,7 +28,7 @@
>   const struct file_operations generic_ro_fops = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
> -	.mmap		= generic_file_readonly_mmap,
> +	.mmap_prepare	= generic_file_readonly_mmap_prepare,
>   	.splice_read	= filemap_splice_read,
>   };
>   
> diff --git a/fs/ufs/file.c b/fs/ufs/file.c
> index 487ad1fc2de6..c2a391c17df7 100644
> --- a/fs/ufs/file.c
> +++ b/fs/ufs/file.c
> @@ -38,7 +38,7 @@ const struct file_operations ufs_file_operations = {
>   	.llseek		= generic_file_llseek,
>   	.read_iter	= generic_file_read_iter,
>   	.write_iter	= generic_file_write_iter,
> -	.mmap		= generic_file_mmap,
> +	.mmap_prepare	= generic_file_mmap_prepare,
>   	.open           = generic_file_open,
>   	.fsync		= generic_file_fsync,
>   	.splice_read	= filemap_splice_read,



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
