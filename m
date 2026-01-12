Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E949BD13281
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 12 Jan 2026 15:33:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vhy64KHxpQk310fopMTogYQlCeajG702ZcXS1V59ov8=; b=RWBS674Ptub0oEYnqCsZMQxXG9
	9dfve+SfOyo5vlCULQVQ4EqxpmL/6GLtcm0bBPqg2pqYugFzMkB7w0nPwzeEzlpl+GGtdzmNB1ltN
	ye94cNvRSUnBV/eNqZ3ZOUXZzHsQ1nO8Vao1dchtg6030JzqvzezIGTXLzs6OdcmWZuw=;
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vfIys-0007jl-S3;
	Mon, 12 Jan 2026 14:33:18 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chuck.lever@oracle.com>) id 1vfIyq-0007jY-Vg;
 Mon, 12 Jan 2026 14:33:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=7V9GkzD1iCuBUHOWM7OOblIVrJ4wtqKxzANd0Czv6KA=; b=e76FhADoDXf9A3qackci5bQg9C
 l8TX9ybsu3+VXvdKU4K7IIyr64vqMj9/a07smQ82ZiA8GXxCALWfgrLJMYdQmY20ITQ8rqEbBqcHU
 0ko9EgWpwo3FQk3yN42bOh65glcqpvTdlu+cgixIh5xq7Sd4l9hYEtwmXHyBtZ9FXNrI=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=7V9GkzD1iCuBUHOWM7OOblIVrJ4wtqKxzANd0Czv6KA=; b=bPyEEjYmWjRa5VV/qZCSlRHVeX
 j6cOQPomOWXhbFu/a77nBlTJGzCN2kWnjtKvlkah6YfOlzGZY5uNV1PHMyzHLYK1G/7tQw+WJkRyE
 1IvlhSA0q82/dJgoXBujUdRMgIt3eU9N1ij6v47eiqE3PiR8ZOb7A1ogl7LMdXnltO4U=;
Received: from mx0b-00069f02.pphosted.com ([205.220.177.32])
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vfIyq-0007h0-7Y; Mon, 12 Jan 2026 14:33:16 +0000
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
 by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60C1TSnC349085; Mon, 12 Jan 2026 14:32:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
 :content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=
 corp-2025-04-25; bh=7V9GkzD1iCuBUHOWM7OOblIVrJ4wtqKxzANd0Czv6KA=; b=
 iTGwbz9t9GdoPido+lA9LHr35U5vQStJsB35KPGIyPfcBF5eIpMttHl7eVlJjHdO
 iIXIAMpahJVx4RakGYU2hoXJ8UtKCdWwK7q+a9hFTRSCM3jMa6yJECp27s59Wnd4
 CSsM4RBH2MrWuAJAm5hsUYCKm4Dv54gn/xt6w/oQ62+XqMmbW4FLZBLKZvYZ0mTJ
 lbgKpMw7I5poxB0SHD9Ttb+PA95qr+cJO46joGLsvj5TKCTbiDkeYoFCGX+Cf2Nq
 xBPkQ+VoArALEITZ5N/l+1Aos4VhqXqGDKMjr3KVw6oKBtIzKfHpvESdfr0CZSS/
 R3ismZgAzDSfUKtW2b7Cfw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com
 (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
 by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4bkrr89pkp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jan 2026 14:32:16 +0000 (GMT)
Received: from pps.filterd
 (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2)
 with ESMTP id 60CE470M004234; Mon, 12 Jan 2026 14:32:15 GMT
Received: from cy7pr03cu001.outbound.protection.outlook.com
 (mail-westcentralusazon11010013.outbound.protection.outlook.com
 [40.93.198.13])
 by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id
 4bkd7h8pfb-2
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Mon, 12 Jan 2026 14:32:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=iIDbXqgBU8C8I4heZsIjZ5/gy3Pob3/Bwp6dQosuW6aCP9toMf6Aw92fkN6CrY43Np57QVOEF8zA/L/1t2MgMAheBdNFK6mGYfppsVYtCA5imvwYgIXi4JxoNg1bbkb7VFNQK7CaItOoltpnHJikG7p8TRMlYxQUyhQFDFmRZaXaKs0cdQNKoWQzth0bUKIF4stXt44rhwW4vLgXDi2jhDU5aVXxDEIGxXHrX31T2j7H0Crhry9+aVxCePAsnP0VjT8F04gEAlOj9gRbYQTKIFD84ja5JZMG45hwKg//4hTMdjBZCrR5etS0QJsRwm3ZgW/pTsY8hd5jpBlfHBIRGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=7V9GkzD1iCuBUHOWM7OOblIVrJ4wtqKxzANd0Czv6KA=;
 b=nVGSGU/cpQcc/uFJs3dmDPokX1tvyCxcUMf8ysmmNfo7MeLL0C1epKq1cxRuLaXGlxbcN6bWrfEqmOo2lafD6fVnDC1PnGNO7kWf+UTT+EAVnk6BMPvA9M0bR5NCJg5rtuioM6Z9BuYNz2sO+VqtKUigIq2dyOtA1LjHFe0cc5D3aRnpJiollPL3NwocPVy8vJcy9P0sCIFJZNDObuXAad6XIgozLtQyYSKPpigxtAk0e7NgbGHOi8i04180xvqUPCoN2CdmlOtaXuTcSaAl3RIxsnfCg6ZXQkZ0V8K+DUVHb8RdfHoWoLTnL9m4GQyTssxVxUKET2zzDbc2qBWDlA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=7V9GkzD1iCuBUHOWM7OOblIVrJ4wtqKxzANd0Czv6KA=;
 b=wAo/Sdp0wCpBO8TrV5kuZhkPnUqHNAgl9hBiGheXHQsoX3eNOKIL91P/nTWPvZQe2ITszNOj8Bq0xnAC4Ws3aRJGrp4Fkl8E5nFLKs7EdZ3udBFzBe9cJ57/ZljYDbWUhwlmlKrUq77u+hUJIe88L9NTBYNfjZL7mpRdxFn3gYA=
Received: from BN0PR10MB5128.namprd10.prod.outlook.com (2603:10b6:408:117::24)
 by IA1PR10MB5969.namprd10.prod.outlook.com (2603:10b6:208:3ef::8)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9499.7; Mon, 12 Jan
 2026 14:32:10 +0000
Received: from BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244]) by BN0PR10MB5128.namprd10.prod.outlook.com
 ([fe80::4083:91ab:47a4:f244%4]) with mapi id 15.20.9499.005; Mon, 12 Jan 2026
 14:32:10 +0000
Message-ID: <cb5d2da6-2090-4639-ad96-138342bba56d@oracle.com>
Date: Mon, 12 Jan 2026 09:31:59 -0500
User-Agent: Mozilla Thunderbird
To: Jeff Layton <jlayton@kernel.org>, Amir Goldstein <amir73il@gmail.com>,
 Christian Brauner <brauner@kernel.org>
References: <20260108-setlease-6-20-v1-0-ea4dec9b67fa@kernel.org>
 <m3mywef74xhcakianlrovrnaadnhzhfqjfusulkcnyioforfml@j2xnk7dzkmv4>
 <8af369636c32b868f83669c49aea708ca3b894ac.camel@kernel.org>
 <CAOQ4uxgD+Sgbbg9K2U0SF9TyUOBb==Z6auShUWc4FfPaDCQ=rg@mail.gmail.com>
 <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
Content-Language: en-US
In-Reply-To: <ec78bf021fa1f6243798945943541ba171e337e7.camel@kernel.org>
X-ClientProxiedBy: CH2PR02CA0019.namprd02.prod.outlook.com
 (2603:10b6:610:4e::29) To BN0PR10MB5128.namprd10.prod.outlook.com
 (2603:10b6:408:117::24)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: BN0PR10MB5128:EE_|IA1PR10MB5969:EE_
X-MS-Office365-Filtering-Correlation-Id: 583a59bd-b7f9-4d41-a0e2-08de51e75e7f
X-LD-Processed: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b,ExtAddr
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
 ARA:13230040|7416014|376014|366016|1800799024|3122999015|7053199007; 
X-Microsoft-Antispam-Message-Info: =?utf-8?B?WVRyUU5zL21VZEhHNnU5UHNsdUdjRU1LTWYyM0c0UGEzb1E5U2lja3dNVlkz?=
 =?utf-8?B?djE4bVJPZjB2aFpyZW1GY2pHZHkvYmdoSmxNeG95ZXpyTlhSMi9jZnhwV21D?=
 =?utf-8?B?cjlxUWQ4SGhaOVp3d0J5RXJXYmtFenMwMjhzNnFjSkx1RnlBazZ2QTJ6c2Vq?=
 =?utf-8?B?VmZEdUZRUXN5OVJUMnBFMDcvcU9wOXZyM29qWHdObE5kV2R5UUVzTDZKRjFw?=
 =?utf-8?B?eHBGS3pTbWpwRVR5YTNNd1ZVMmdvT20ya3p6M1dZS2JUelRzMEJLVGlVMG9Y?=
 =?utf-8?B?TEt5UTRlS1lHUEg5a29yQ3QySnlmU3dQem5ZS3JZZmE2US9JbjBwV0UwSDR4?=
 =?utf-8?B?MzJKeVc1VE90VjNyL2NVZzgwYzJTQUU0VWdMbXVGVnBSWW9LdndPWjM4eTAz?=
 =?utf-8?B?NTJwZzNSejZOZG8vQlRyLzhjWVdsNmh4eXZvSkMvTnA4T1QzSEIxaGw5aG90?=
 =?utf-8?B?MjZXc1hsS2gxWWJlLzluZDRUMXQrd3lyK2g3R3g3ZExZZENXSjhJaFN4cTl1?=
 =?utf-8?B?czBNWkZBS2oxTjJIVEJoZ0hLZXZxL2dFZzNQaXExclI0bzIrWStZaEN3NFV5?=
 =?utf-8?B?c2U5c3lKdk5QK0x5MzhyMENrb2JnK1dIMkI0aTVvc0tPQjJoUzJJYy9pWm5X?=
 =?utf-8?B?cEM3dStYcEJTUzFrcnk4Z0E1Tnhxck5QWWVvaHBsajVYRDMxY2E4aDZhK3lE?=
 =?utf-8?B?TGIvMDFEQVVIYmVGallBcGVjOEd6Uk9WYWdXWlNKWVFxdm52MjBvV0dndmNn?=
 =?utf-8?B?NzNORkFJOGlOclB4cU9kbi85SnB6U3ZRL3JJRXZpVVJHaG5sM0VZNy95Nitz?=
 =?utf-8?B?WGdRb0R1MUVCejQ0YjQvcm5kclVjaTlXWGVUSUVhWWR5US9iQWdCakFyeTNI?=
 =?utf-8?B?QVBteDJublpTcU1zblZSUjBmRlpsNjVZd1R0UityVTRueS9tQ0w2WmZWZThy?=
 =?utf-8?B?V2U4U1hzSlV5aGNJOElHVzZjM3ovNW1lc1Z1ek5WRW5CVlNyZS8zeDN5YUIx?=
 =?utf-8?B?eEw2b0NZNmFpbS9URThXeWRNZGpDYkZGd2JpY1JWYjI0MXRqc0pOQzlFM0hu?=
 =?utf-8?B?cXVqQzVWWEpHOHoxaXQ1M3lCN1N4QTlaN0o0R2h6RWoyVE9kSFIyT3hROUVq?=
 =?utf-8?B?MkpRRUxtcE54QVRkaU85S2YrTEdGNWpRMXczUk02ZTZFb1B6VFd5NFc1OFF5?=
 =?utf-8?B?L2dOYTFDZWtPYmNCOTdWd2Z4ZXpYa1RGSnJKMGdZT2dLdlhLN3N3dU5LMWc4?=
 =?utf-8?B?ODFyWmdqOTJvL3gxTVVvVkVXanprNFZKT1lIR0Q0dzd3ampoQ3ZWWU1MdGFQ?=
 =?utf-8?B?SzFobmRya0VGeEdYNG4zaFFBNDNDbEJURTRFdjhWNmhMR2w4UkI3YXhmVTFl?=
 =?utf-8?B?dlFlMmRwcDd0MmlwUDhwcUNFT1F1YUxKRTFnMWcvWUFDWFg1VEQza2VZVEY5?=
 =?utf-8?B?NEtIZ0ZEU2tYUVYzVGROaXJwcXZvOWQxclZhNER5RlhkMVJYWjJZMW83ZXp3?=
 =?utf-8?B?amZzOFBOSXlmdUljQmh5dkxkdGQ3a0NPZjMzMmdwY3hObGw5Y3FkQkk4L1dj?=
 =?utf-8?B?U3JEWUtsa2JUdXU4Yk10NE9VWUV3MEZwcnVUblQ1RGpKcDM2ZFNlMXk1QVor?=
 =?utf-8?B?VDdGYUJiREs3Z1c3YWlGcTlvVTlTVVErNXA4OWg3T3Y4MXlvNWRVdGJTYVR3?=
 =?utf-8?B?MUxiYVRRNmhrVzNPbGdCVkdKc3R2ZlRFR0VMb0JWZ3FjUkRBcUFuR0I3NWh2?=
 =?utf-8?B?ZFZ2YjZNbTVWSG1rczhGcHhyc3JnLzQyZy9GaUlQUzgzMlhINWVyVlh6SndQ?=
 =?utf-8?B?YmVONnN4Nk1EUEdVQnNxOXJ1K3VJL1Y1RlVEMmpNSktOTWlCeTlMUW4zWlJo?=
 =?utf-8?B?V2E0RUJlckZ4TGFOS0F6RVE1S1VFd1VTVFIybC9idFptWXFQVmt0UElxTGgw?=
 =?utf-8?Q?VQDlyfwE4jXvrfLm1+OZStl+fhIOQFyV?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:BN0PR10MB5128.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(366016)(1800799024)(3122999015)(7053199007);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnEveEhDQ3lKTllNMXc5VE5sZUVrSVlBZjlHbjg4RUptSnhqd1daWlphS2JX?=
 =?utf-8?B?eFpNZDhPYlNIVnBkSHpYbXBzK1hkWU0xK3A2N2lobVVhSGNZOVY1RHVTTEpw?=
 =?utf-8?B?TmtIOVhTbjNwMldnR3ArK0pHK0NQNDEzclh1ZElVVUQ5U3BhdFM0SFdWNnlp?=
 =?utf-8?B?dDZsc1c1WTFybEljTUpYK1ZUM1NFTHoyVFlpK2tPU0c1anJyNVIvY1lJOGVD?=
 =?utf-8?B?aUdKT2NmcEViSnpqQklNblJiQTU2elJ0Um1PZTF3TXBBVGwxMlIrOFlabnlD?=
 =?utf-8?B?L2QwZS9GWVhVWmhQbEZrQjQ0SDVGbkVDZFRWTExoYWVFRERhajR5V3Mza1pa?=
 =?utf-8?B?SmdqSk1PY09MdVdJWXh1YU8yOEVWcXZqdlZqNGl4dStjZWdWMTdmZlFVeGlq?=
 =?utf-8?B?ZzhjUXorbFNOMEF2U2VKNnM5VDVaaWtGMGJqUDFZTk5LUFJWWWFTdjhUTmJK?=
 =?utf-8?B?ZTZERXlBWXN0VDhHYk12VXRTZ1gxVUVjVlVxVzlibUFWTStyRzRacGd2dHJ1?=
 =?utf-8?B?ZGtRWnpRcmJLWHpqWVljUVN2Snl0VlRkSDNJNGp1cEE3U3RFN3o2enVIM2pJ?=
 =?utf-8?B?bFBYMmxkSkJUMW1NSGQxYVBqLzhudmZOTTRnMDcweHVzYmJDSTUwWmd1ZnpG?=
 =?utf-8?B?b3h1VU5rdUdtTEZ2WGNQbTF2RW9FY29EaGFhbk84UnRMV004bjFxQ1NjZndJ?=
 =?utf-8?B?aTdwZWgzNFFFMDdxMnE5ekdPcGhta2d0T01pTnVXbnp3Ym9RREdrZTg1eU5x?=
 =?utf-8?B?NUpkVlB3OE9ValorWjdWbTdSVVdCNjVybTNlaEkxODFHMEUza0cxb05jc1ZY?=
 =?utf-8?B?Rkxnam03ejZaOGIybS80YU00T1VielNkcjhBd0xaTHVqeE9yU1ZkRjFxVUkw?=
 =?utf-8?B?VHc4TGdrYTlMeExGUDZ6SjVtRjYrYUhNcE1qYlljSlFkcnUxNWV5V2tJMDRm?=
 =?utf-8?B?NzExbXdPckdZL3krbFVobkxIUUMwYnZEdE9aWUs5enkraE1hUHkwcEVzMnFl?=
 =?utf-8?B?WnE0SFgwekFoZXY4VUdYbjJTc000SkpzcXdtNTk2NVpUTWRDVnZFM3B1ZG80?=
 =?utf-8?B?bzFKZUdneW1DT0UvQ0lBMG1vVU1iZG43Z0V0Y0w5bVRxNnZQd0VZc29GZy9j?=
 =?utf-8?B?TExzYm9PVmtLbnJlT1VBR0ZNNGx3a1lRTWdqbzBibnJVZWFnVVlrdEhVNFlU?=
 =?utf-8?B?NTlJTnRBa3V1Y0J6cU1iWTNUMXpLdVBYemM0L09TbHdtTlVjZEcwOEtYblVO?=
 =?utf-8?B?TVQ1bmV1MFA0SWhTbnBsdy9obFNFYnNsZ2pqVDVWZ1FmWTUwR2loMnhCODh6?=
 =?utf-8?B?elF0V3JCaFpxTXd6Y0IxdFFFclNCSXZQSmc2WWplQk9WWEcvcjJ6akdrV3ZW?=
 =?utf-8?B?TURtK09hRjhabjVMcFFFVXoyNUkyV21FVXR2K2I4bHZVUUdjV01yVjROQ2dC?=
 =?utf-8?B?NTByQWdzZ0srOE1sWkg4d1EzNkF4eEN6TG9oN2VvUFZGMzFzVmFSTkU0TGVO?=
 =?utf-8?B?eU5VTjkzVUJmN3ltSElReXIvNHZjWW9lRE5Gdm9zK0J4cWdSdStGbFZ3MnBK?=
 =?utf-8?B?OHNyayt3WlNVVlFwdFluTGxwN2JxMzNEbGZNeFQ3SmIrYkhEUTdlK085RXFy?=
 =?utf-8?B?cldYaTcvb01HRFZtZnBpTDBleExOeWV6U1E1bk9tTnRHTDlxTVFXc0p1YjhH?=
 =?utf-8?B?NWp6eEhraEJQYkNveEo3U1owL1Bucm9oVm9TWVB4dWp0UXp5RFptZk5EbE5l?=
 =?utf-8?B?TUI4OFpWUGMvaFlHbTJhOUhNWTNtZDV2S21ZRWF4dHVHWURSaWRGZlFlT2Zj?=
 =?utf-8?B?RERXakJFM0VLRHhqZUNCSlpleDFZNlpxa1Jpck9MbXYvTktYRThpekp2WTA4?=
 =?utf-8?B?cE40RnpxTFUwcDhCdHlaWGpVQ0JlZnptTEMxS0l0WGhTU3lXY0t5dzJydjh0?=
 =?utf-8?B?Nk9KanNGSENMOTBzUzdlOXBLQzBjS09XSnptcSt5SWl4ODlRb3h4aVRTZVNX?=
 =?utf-8?B?YkM0YXNTaFlOdU1qTDhJK0lCQktmd2FFOWhUWFppdzRUM0xGMkFTUzkxY0Fi?=
 =?utf-8?B?Wm5INlVjTHJxcWtGSWxOaXpyTG11VE1nQmZZb0VWcmlkYUpuRDRsZlVyK2NR?=
 =?utf-8?B?dXFpNUJvbU5zTUR1VEp4V3QwZzJRTGJuZUgrclBNUmtaWVlLb3o4SGtDTXFN?=
 =?utf-8?B?UUdqU0JzamwwZW5yclByVU5xSTFWcWtHandBOFAvbTVpeDRpNk9NUS9oemYv?=
 =?utf-8?B?eHV6cms4MGFQbTZpZ0tZZmNWb1N0VGJ3WDBheGsxVUNxT2lRbzVGS0l1aHNa?=
 =?utf-8?B?VGRoblVyei80NG8wZ2tpb3l0Nk5sOGNVVVlRU1FTUDNFbzdwbUJFQT09?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: HJloHM0FYYfNlO2ZJLQuxsWHPIvGzM/mF7aV05sp9fkdzgVXQ9IJfqnsh3HBtZ0LLN7qKX+i6oFKAyvctl2vRNQ4gWO362ErHsbJ5BHA05KI/DHaYZ70cyrAJYFXGOEdo3PUXXBfVUVanXQYAdh7wLsK8nYkH8f40f8wtPKcxtHx1oB1qSfQPQ1SZ4LWH1wuwdFrIBSSqOpoYw6gmC3waswGJDM//UUqgape0WMZSS//Kh0nsuKxQfjlRSJKzryWTFRvbC8iDfJR9ZOPCw5WhVEhQgsyrdmbVquvk3RGvZ9AhEeO5IjCxn8QFw3pUfY4PnrFUAw6KvPrfC+nwNlN8SFXhtaeIn1/GcNJGMoISVMtnftmt0z0MYu3GERI8Yfx45RE06JPRgAGCONeI3qvN2+tgRqy+gdBKw5mzFkDyQG353SIhV4TwhITzKnwpc80YG7HmEpfq/qaZeV6w3wdHM4TWToCqaEmdxu1g+T0cHTFZe/ppoDsaQ35RjpAvlZU+cfJUaoI5VcEztBV5PHpd/I6Jr52PwK08EEyImuEIBmfqcv4f0SKxe7jDAnWkP6GUYZ+9/RzigcSQgu7vNrox2ldrOmAS6pOA7OulWVLYhU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 583a59bd-b7f9-4d41-a0e2-08de51e75e7f
X-MS-Exchange-CrossTenant-AuthSource: BN0PR10MB5128.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 12 Jan 2026 14:32:09.9243 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: styktScrdG1r5zo59+00+FG+85xehVyuNIiEwis60h97TGtHzVHUBReKnL2RUZLT5oJYBFdxFpdUQ7BxEjYlrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB5969
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-12_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999
 suspectscore=0
 malwarescore=0 spamscore=0 adultscore=0 mlxscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2512120000 definitions=main-2601120117
X-Proofpoint-ORIG-GUID: Qs3ZsZb9yaReWr0nN9-5pzbaZCVTmoOQ
X-Proofpoint-GUID: Qs3ZsZb9yaReWr0nN9-5pzbaZCVTmoOQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEyMDExOCBTYWx0ZWRfXy8bAqLJBnu+h
 l3NnC/vUIZRmHsl6LhJlAXOirFy/PvD/yRoiXmlF9NYLw2j2KbW+z69M1EQlrdU7VmJi8ecAd3r
 qgSzxeV8nlQl+EID2Tpt92yqK2JsbCscu+Req3U1zDPRF4a1rMjZy602qIkhik+M/9cIAMZFWYl
 90TfW+t1PPNiv5rAYnJGin5IgXYvh9NhdQOyIwdSiw3VJS/2dXb5DWMmfRqcUCNNpu03TU8cIVN
 S9Ulb/L2482mlCEFgWp1lLaON9ulSW0pvEtWBcexDH25qz5SZI4kVB0bKBrtNu9hJNHnVxPm7/B
 8dCCwgNVuMYLRcrXG7Y+nCLKiIBbwWWzdnO7cO122vX+67m0SlX4PTTCPbrvdZWu5jdwUhzjhJ2
 hbXiDVVgJ4aPYto+Cdrv019PvpHz0BiTMf3Veli6q6AUU/ebI4wfKXfslLuDQoPdrKULPpjXigK
 PDhhXfNuAPzFFDMrqtQdve/hgwssHGuTWvhhZpJo=
X-Authority-Analysis: v=2.4 cv=QIllhwLL c=1 sm=1 tr=0 ts=696505f0 b=1 cx=c_pps
 a=qoll8+KPOyaMroiJ2sR5sw==:117
 a=qoll8+KPOyaMroiJ2sR5sw==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=Sx9y5-vS8RwRFUeMaqUA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 cc=ntf awl=host:12110
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 1/12/26 8:34 AM, Jeff Layton wrote: > On Fri, 2026-01-09
 at 19:52 +0100, Amir Goldstein wrote: >> On Thu, Jan 8, 2026 at 7:57 PM Jeff
 Layton <jlayton@kernel.org> wrote: >>> >>> On Thu, 2026-01-08 a [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 RCVD_IN_MSPIKE_H4      RBL: Very Good reputation (+4)
 [205.220.177.32 listed in wl.mailspike.net]
 0.0 RCVD_IN_MSPIKE_WL      Mailspike good senders
X-Headers-End: 1vfIyq-0007h0-7Y
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

T24gMS8xMi8yNiA4OjM0IEFNLCBKZWZmIExheXRvbiB3cm90ZToKPiBPbiBGcmksIDIwMjYtMDEt
MDkgYXQgMTk6NTIgKzAxMDAsIEFtaXIgR29sZHN0ZWluIHdyb3RlOgo+PiBPbiBUaHUsIEphbiA4
LCAyMDI2IGF0IDc6NTfigK9QTSBKZWZmIExheXRvbiA8amxheXRvbkBrZXJuZWwub3JnPiB3cm90
ZToKPj4+Cj4+PiBPbiBUaHUsIDIwMjYtMDEtMDggYXQgMTg6NDAgKzAxMDAsIEphbiBLYXJhIHdy
b3RlOgo+Pj4+IE9uIFRodSAwOC0wMS0yNiAxMjoxMjo1NSwgSmVmZiBMYXl0b24gd3JvdGU6Cj4+
Pj4+IFllc3RlcmRheSwgSSBzZW50IHBhdGNoZXMgdG8gZml4IGhvdyBkaXJlY3RvcnkgZGVsZWdh
dGlvbiBzdXBwb3J0IGlzCj4+Pj4+IGhhbmRsZWQgb24gZmlsZXN5c3RlbXMgd2hlcmUgdGhlIHNo
b3VsZCBiZSBkaXNhYmxlZCBbMV0uIFRoYXQgc2V0IGlzCj4+Pj4+IGFwcHJvcHJpYXRlIGZvciB2
Ni4xOS4gRm9yIHY3LjAsIEkgd2FudCB0byBtYWtlIGxlYXNlIHN1cHBvcnQgYmUgbW9yZQo+Pj4+
PiBvcHQtaW4sIHJhdGhlciB0aGFuIG9wdC1vdXQ6Cj4+Pj4+Cj4+Pj4+IEZvciBoaXN0b3JpY2Fs
IHJlYXNvbnMsIHdoZW4gLT5zZXRsZWFzZSgpIGZpbGVfb3BlcmF0aW9uIGlzIHNldCB0byBOVUxM
LAo+Pj4+PiB0aGUgZGVmYXVsdCBpcyB0byB1c2UgdGhlIGtlcm5lbC1pbnRlcm5hbCBsZWFzZSBp
bXBsZW1lbnRhdGlvbi4gVGhpcwo+Pj4+PiBtZWFucyB0aGF0IGlmIHlvdSB3YW50IHRvIGRpc2Fi
bGUgdGhlbSwgeW91IG5lZWQgdG8gZXhwbGljaXRseSBzZXQgdGhlCj4+Pj4+IC0+c2V0bGVhc2Uo
KSBmaWxlX29wZXJhdGlvbiB0byBzaW1wbGVfbm9zZXRsZWFzZSgpIG9yIHRoZSBlcXVpdmFsZW50
Lgo+Pj4+Pgo+Pj4+PiBUaGlzIGhhcyBjYXVzZWQgYSBudW1iZXIgb2YgcHJvYmxlbXMgb3ZlciB0
aGUgeWVhcnMgYXMgc29tZSBmaWxlc3lzdGVtcwo+Pj4+PiBoYXZlIGluYWR2ZXJ0YW50bHkgYWxs
b3dlZCBsZWFzZXMgdG8gYmUgYWNxdWlyZWQgc2ltcGx5IGJ5IGhhdmluZyBsZWZ0Cj4+Pj4+IGl0
IHNldCB0byBOVUxMLiBJdCB3b3VsZCBiZSBiZXR0ZXIgaWYgZmlsZXN5c3RlbXMgaGFkIHRvIG9w
dC1pbiB0byBsZWFzZQo+Pj4+PiBzdXBwb3J0LCBwYXJ0aWN1bGFybHkgd2l0aCB0aGUgYWR2ZW50
IG9mIGRpcmVjdG9yeSBkZWxlZ2F0aW9ucy4KPj4+Pj4KPj4+Pj4gVGhpcyBzZXJpZXMgaGFzIHNl
dHMgdGhlIC0+c2V0bGVhc2UoKSBvcGVyYXRpb24gaW4gYSBwaWxlIG9mIGV4aXN0aW5nCj4+Pj4+
IGxvY2FsIGZpbGVzeXN0ZW1zIHRvIGdlbmVyaWNfc2V0bGVhc2UoKSBhbmQgdGhlbiBjaGFuZ2Vz
Cj4+Pj4+IGtlcm5lbF9zZXRsZWFzZSgpIHRvIHJldHVybiAtRUlOVkFMIHdoZW4gdGhlIHNldGxl
YXNlKCkgb3BlcmF0aW9uIGlzIG5vdAo+Pj4+PiBzZXQuCj4+Pj4+Cj4+Pj4+IFdpdGggdGhpcyBj
aGFuZ2UsIG5ldyBmaWxlc3lzdGVtcyB3aWxsIG5lZWQgdG8gZXhwbGljaXRseSBzZXQgdGhlCj4+
Pj4+IC0+c2V0bGVhc2UoKSBvcGVyYXRpb25zIGluIG9yZGVyIHRvIHByb3ZpZGUgbGVhc2UgYW5k
IGRlbGVnYXRpb24KPj4+Pj4gc3VwcG9ydC4KPj4+Pj4KPj4+Pj4gSSBtYWlubHkgZm9jdXNlZCBv
biBmaWxlc3lzdGVtcyB0aGF0IGFyZSBORlMgZXhwb3J0YWJsZSwgc2luY2UgTkZTIGFuZAo+Pj4+
PiBTTUIgYXJlIHRoZSBtYWluIHVzZXJzIG9mIGZpbGUgbGVhc2VzLCBhbmQgdGhleSB0ZW5kIHRv
IGVuZCB1cCBleHBvcnRpbmcKPj4+Pj4gdGhlIHNhbWUgZmlsZXN5c3RlbSB0eXBlcy4gTGV0IG1l
IGtub3cgaWYgSSd2ZSBtaXNzZWQgYW55Lgo+Pj4+Cj4+Pj4gU28sIHdoYXQgYWJvdXQga2VybmZz
IGFuZCBmdXNlPyBUaGV5IHNlZW0gdG8gYmUgZXhwb3J0YWJsZSBhbmQgZG9uJ3QgaGF2ZQo+Pj4+
IC5zZXRsZWFzZSBzZXQuLi4KPj4+Pgo+Pj4KPj4+IFllcywgRlVTRSBuZWVkcyB0aGlzIHRvby4g
SSdsbCBhZGQgYSBwYXRjaCBmb3IgdGhhdC4KPj4+Cj4+PiBBcyBmYXIgYXMga2VybmZzIGdvZXM6
IEFJVUksIHRoYXQncyBiYXNpY2FsbHkgd2hhdCBzeXNmcyBhbmQgcmVzY3RybAo+Pj4gYXJlIGJ1
aWx0IG9uLiBEbyB3ZSByZWFsbHkgZXhwZWN0IHBlb3BsZSB0byBzZXQgbGVhc2VzIHRoZXJlPwo+
Pj4KPj4+IEkgZ3Vlc3MgaXQncyB0ZWNobmljYWxseSBhIHJlZ3Jlc3Npb24gc2luY2UgeW91IGNv
dWxkIHNldCB0aGVtIG9uIHRob3NlCj4+PiBzb3J0cyBvZiBmaWxlcyBlYXJsaWVyLCBidXQgcGVv
cGxlIGRvbid0IHVzdWFsbHkgZXhwb3J0IGtlcm5mcyBiYXNlZAo+Pj4gZmlsZXN5c3RlbXMgdmlh
IE5GUyBvciBTTUIsIGFuZCB0aGF0IHNlZW1zIGxpa2Ugc29tZXRoaW5nIHRoYXQgY291bGQgYmUK
Pj4+IHVzZWQgdG8gbWFrZSBtaXNjaGllZi4KPj4+Cj4+PiBBRkFJQ1QsIGtlcm5mc19leHBvcnRf
b3BzIGlzIG1vc3RseSB0byBzdXBwb3J0IG9wZW5fYnlfaGFuZGxlX2F0KCkuIFNlZQo+Pj4gY29t
bWl0IGFhODE4ODI1MzQ3NCAoImtlcm5mczogYWRkIGV4cG9ydGZzIG9wZXJhdGlvbnMiKS4KPj4+
Cj4+PiBPbmUgaWRlYTogd2UgY291bGQgYWRkIGEgd3JhcHBlciBhcm91bmQgZ2VuZXJpY19zZXRs
ZWFzZSgpIGZvcgo+Pj4gZmlsZXN5c3RlbXMgbGlrZSB0aGlzIHRoYXQgd2lsbCBkbyBhIFdBUk5f
T05DRSgpIGFuZCB0aGVuIGNhbGwKPj4+IGdlbmVyaWNfc2V0bGVhc2UoKS4gVGhhdCB3b3VsZCBr
ZWVwIGxlYXNlcyB3b3JraW5nIG9uIHRoZW0gYnV0IHdlIG1pZ2h0Cj4+PiBnZXQgc29tZSByZXBv
cnRzIHRoYXQgd291bGQgdGVsbCB1cyB3aG8ncyBzZXR0aW5nIGxlYXNlcyBvbiB0aGVzZSBmaWxl
cwo+Pj4gYW5kIHdoeS4KPj4KPj4gSU1PLCB5b3UgYXJlIGJlaW5nIHRvbyBjYXV0aW91cywgYnV0
IHdoYXRldmVyLgo+Pgo+PiBJdCBpcyBub3QgYWNjdXJhdGUgdGhhdCBrZXJuZnMgZmlsZXN5c3Rl
bXMgYXJlIE5GUyBleHBvcnRhYmxlIGluIGdlbmVyYWwuCj4+IE9ubHkgY2dyb3VwZnMgaGFzIEtF
Uk5GU19ST09UX1NVUFBPUlRfRVhQT1JUT1AuCj4+Cj4+IElmIGFueSBhcHBsaWNhdGlvbiBpcyB1
c2luZyBsZWFzZXMgb24gY2dyb3VwIGZpbGVzLCBpdCBtdXN0IGJlIHNvbWUKPj4gdmVyeSBhZHZh
bmNlZCBydW50aW1lIChpLmUuIHN5c3RlbWQpLCBzbyB3ZSBzaG91bGQga25vdyBhYm91dCB0aGUK
Pj4gcmVncmVzc2lvbiBzb29uZXIgcmF0aGVyIHRoYW4gbGF0ZXIuCj4+Cj4gCj4gSSB0aGluayBz
byB0b28uIEZvciBub3csIEkgdGhpbmsgSSdsbCBub3QgYm90aGVyIHdpdGggdGhlIFdBUk5fT05D
RSgpLgo+IExldCdzIGp1c3QgbGVhdmUga2VybmZzIG91dCBvZiB0aGUgc2V0IHVudGlsIHNvbWVv
bmUgcHJlc2VudHMgYSByZWFsCj4gdXNlLWNhc2UuCj4gCj4+IFRoZXJlIGFyZSBhbHNvIHRoZSBy
ZWNlbnRseSBhZGRlZCBuc2ZzIGFuZCBwaWRmcyBleHBvcnRfb3BlcmF0aW9ucy4KPj4KPj4gSSBo
YXZlIGEgcmVjb2xsZWN0aW9uIGFib3V0IHdhbnRpbmcgdG8gYmUgZXhwbGljaXQgYWJvdXQgbm90
IGFsbG93aW5nCj4+IHRob3NlIHRvIGJlIGV4cG9ydGFibGUgdG8gTkZTIChuc2ZzIHNwZWNpZmlj
YWxseSksIGJ1dCBJIGNhbid0IHNlZSB3aGVyZQo+PiBhbmQgaWYgdGhhdCByZXN0cmljdGlvbiB3
YXMgZG9uZS4KPj4KPj4gQ2hyaXN0aWFuPyBEbyB5b3UgcmVtZW1iZXI/Cj4+Cj4gCj4gKGNjJ2lu
ZyBDaHVjaykKPiAKPiBGV0lXLCB5b3UgY2FuIGN1cnJlbnRseSBleHBvcnQgYW5kIG1vdW50IC9z
eXMvZnMvY2dyb3VwIHZpYSBORlMuIFRoZQo+IGRpcmVjdG9yeSBkb2Vzbid0IHNob3cgdXAgd2hl
biB5b3UgdHJ5IHRvIGdldCB0byBpdCB2aWEgTkZTdjQsIGJ1dCB5b3UKPiBjYW4gbW91bnQgaXQg
dXNpbmcgdjMgYW5kIFJFQURESVIgd29ya3MuIFRoZSBmaWxlcyBhcmUgYWxsIGVtcHR5IHdoZW4K
PiB5b3UgdHJ5IHRvIHJlYWQgdGhlbS4gSSBkaWRuJ3QgdHJ5IHRvIGRvIGFueSB3cml0ZXMuCj4g
Cj4gU2hvdWxkIHdlIGFkZCBhIG1lY2hhbmlzbSB0byBwcmV2ZW50IGV4cG9ydGluZyB0aGVzZSBz
b3J0cyBvZgo+IGZpbGVzeXN0ZW1zPwo+IAo+IEV2ZW4gYmV0dGVyIHdvdWxkIGJlIHRvIG1ha2Ug
bmZzZCBleHBvcnRpbmcgZXhwbGljaXRseSBvcHQtaW4uIFdoYXQgaWYKPiB3ZSB3ZXJlIHRvIGFk
ZCBhIEVYUE9SVF9PUF9ORlNEIGZsYWcgdGhhdCBleHBsaWNpdGx5IGFsbG93cyBmaWxlc3lzdGVt
cwo+IHRvIG9wdC1pbiB0byBORlMgZXhwb3J0aW5nLCBhbmQgY2hlY2sgZm9yIHRoYXQgaW4gX19m
aF92ZXJpZnkoKT8gV2UnZAo+IGhhdmUgdG8gYWRkIGl0IHRvIGEgYnVuY2ggb2YgZXhpc3Rpbmcg
ZmlsZXN5c3RlbXMsIGJ1dCB0aGF0J3MgZmFpcmx5Cj4gc2ltcGxlIHRvIGRvIHdpdGggYW4gTExN
LgoKV2hhdCdzIHRoZSBhY3RpdmUgaGFybSBpbiBleHBvcnRpbmcgL3N5cy9mcy9jZ3JvdXAgPyBJ
dCBoYXMgdG8gYmUgZG9uZQpleHBsaWNpdGx5IHZpYSAvZXRjL2V4cG9ydHMsIHNvIHRoaXMgaXMg
dW5kZXIgdGhlIE5GUyBzZXJ2ZXIgYWRtaW4ncwpjb250cm9sLiBJcyBpdCBhbiBhdHRhY2sgc3Vy
ZmFjZT8KCgotLSAKQ2h1Y2sgTGV2ZXIKCgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpMaW51eC1mMmZzLWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZz
LWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5ldApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5l
dC9saXN0cy9saXN0aW5mby9saW51eC1mMmZzLWRldmVsCg==
