Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E4660C6CE33
	for <lists+linux-f2fs-devel@lfdr.de>; Wed, 19 Nov 2025 07:21:51 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:Content-ID:In-Reply-To:
	References:Message-ID:Date:To:Sender:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9HRZO8znYpytYnZJ9SMudbOee4caxF8WdZY5/pE1e7U=; b=LtiGyi3X/ZdEYchzGhCYctikh2
	ONM9v1Zmj7GPoiDAOvt0vJkJ+L8yAfX/08ZJFyBUqnO1qTNoxxlLG2nqcLke0sFCqrEf9JXr+xy03
	EfiEx0fedNJUprtTpJfihCkOyedJ0R3XV1FmuJwWr6Nk7pnP6iyA/qTqYzai65vDQ/f0=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1vLbZZ-0002A1-Ku;
	Wed, 19 Nov 2025 06:21:46 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <chaitanyak@nvidia.com>) id 1vLbZY-00029t-2N
 for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 06:21:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9BHE5dSMLbgZ6tKBelHtzaedc/RLyCmmXl+9or9RW+c=; b=jrMBSPPOe/R/93j8iPNdWjWJ6F
 TAHA8m71Kmmr7Lzp0529Tefe1bb0o3pEX7dsssekvKrYaPokWjH0UTWuuW3X+WcFuALReRNqQZov2
 nOFcPk5+NKx0+a46qmAz8JAURvjXcRM8dXmGO+KJFw+ImFm5CUCdINuwIi2IhHrrx5jU=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9BHE5dSMLbgZ6tKBelHtzaedc/RLyCmmXl+9or9RW+c=; b=X/kBtUA0Bqt6qQtJXy5b88lnrp
 bKnT3COilZZx1FFwFfF3fGdZ7nYlDMz1eWGai3qyHi08ZSCF3nVEYXkiQjI75Yp3HahISC2YqV4WC
 j0A7ah6a27PHuxcOMFq5IfKFwCecLZ1sQhPxiC/mFoMPSHc1Oc7Ka1umjtF1GHHUSBw8=;
Received: from mail-westus2azon11012067.outbound.protection.outlook.com
 ([52.101.48.67] helo=MW6PR02CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1vLbZY-0003Ea-5e for linux-f2fs-devel@lists.sourceforge.net;
 Wed, 19 Nov 2025 06:21:44 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xfssDBPAblK/OVOiLHPPxKwsqBoBbIsC5hcQQZXI+3Prp0AGo6wykow4jsO1B84D3v7DOraQ6BndwqaceH6eOI/lnW4rIiCIYtSOrgjqVAG1oXXoOhhtWEHktPOpWq6WIIzCDWrnwnh7OCH52FBc5bQQhtNVXbM2xpT9PO6wnQjOJ1W86Pl7ZVTazvXhGVo/MxburhQf2+wCg/hsFot1FYnXADXidyPF3UHdr7lOAR5JeNTifZZe5JDMg+IZkQkhjugasCRG506PAftX3iRrGrFMVXiiV3a1qwwmUcXnpkJ4skwRX2/H5o6PtlOLz+DhhmRT5JH1EFcVNi3vitujRw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9BHE5dSMLbgZ6tKBelHtzaedc/RLyCmmXl+9or9RW+c=;
 b=nXvHabYGGiVCtZvE93BsnNm9ixGnJdQMWaeH/Z8AfuQHvsfzQsIGd+Pji78DuqLMuY202jyZLjGnB/xtYITTT/PckX3ogslZbfzAAuBh/vOEf9LzQXv8tunwOrrabSdA574+iI8w67roEIGo0jbYfEi8fZ5t0J+d63RdBtXJ6Q5Zzwt6GdXwVd3V6AjHTpZJlOmRKnwCw5Kv0QVUJ7Fr05M0x7eYXlP8ulmsjhRUig/n0Wex8diqDERrWcJ03NvY6G0fV1eKSrrFplKYe1cYuQG+f0NOM9iFA0W/AJm7YkbzcR0cWKR87yrL4oKoC0ZoN62+OXqA3dTshA5LdEHGUw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9BHE5dSMLbgZ6tKBelHtzaedc/RLyCmmXl+9or9RW+c=;
 b=fHLp5C1CrSxizhpn0LPJGJtTRrgOqwWTbgW9qSu6mydfc5XOGQeSYYkEGQ9I7efZzxTZXET58TW2vd2pbRfrA4fIZ5E8fgjl1azkq1NEv6unGNkZFajle5aTh6J0TqEWGLoGPWrmpIsOu7zUi25K+NAXh9HX0B+noVwx1pcqHQKtex4iikTn0qhuQLN2lKr7ovJO7R7hUhWRCxt3dm1nqp0VzEULHPpD863EgKksQIRxyaDP2y3ga6t/boaM7sSfTAQIeRDpanHQk8gJVWSOqqJXK1YiedTSk2FT9avF6Ajq3+O9FKCOgXz0CBQIJDwtttlgyL375CX7KAxy56WI0Q==
Received: from LV3PR12MB9404.namprd12.prod.outlook.com (2603:10b6:408:219::9)
 by BN5PR12MB9509.namprd12.prod.outlook.com (2603:10b6:408:2a8::12)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9320.22; Wed, 19 Nov
 2025 01:48:16 +0000
Received: from LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b]) by LV3PR12MB9404.namprd12.prod.outlook.com
 ([fe80::57ac:82e6:1ec5:f40b%5]) with mapi id 15.20.9320.021; Wed, 19 Nov 2025
 01:48:16 +0000
To: Christoph Hellwig <hch@lst.de>, Chaitanya Kulkarni
 <ckulkarnilinux@gmail.com>
Thread-Topic: [RFC PATCH] block: change __blkdev_issue_discard() return type
 to void
Thread-Index: AQHcWF7yNJJ+LMVprEiEuh4NR7P85LT4Ey2AgAEpOYA=
Date: Wed, 19 Nov 2025 01:48:16 +0000
Message-ID: <ac3443b4-9b68-4613-b6df-c94970d1fc68@nvidia.com>
References: <20251118074243.636812-1-ckulkarnilinux@gmail.com>
 <20251118080427.GA26299@lst.de>
In-Reply-To: <20251118080427.GA26299@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla Thunderbird
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: LV3PR12MB9404:EE_|BN5PR12MB9509:EE_
x-ms-office365-filtering-correlation-id: f007474f-fdbf-419d-8e54-08de270db52d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
 ARA:13230040|7416014|376014|10070799003|1800799024|366016|38070700021; 
x-microsoft-antispam-message-info: =?utf-8?B?WjkrSlhkTmZja3B3MFZMRU13WGx0QXFtQkdFcC9QN3pMYlhlM2Faa1ZKVEUv?=
 =?utf-8?B?QUdlVTFuYnJpUlR3VC9EMEhXdzJtK1ZTZ1JLTkpZb1l1eExRVUtvVkZlK1E0?=
 =?utf-8?B?N0h2eUNCRWgyNkhSbWNQQVBYenJpN2RMSFBxeEdYNC9QdDZUR1NLVG5obStM?=
 =?utf-8?B?SFRuaVI2WVFXSVpiR2tVU1BFUWMvQ2ZxVFdqcUF3OWZSdUlpcXhCQUd0cDB0?=
 =?utf-8?B?S0xGWlpib0laRyttMC9iM0NjOXhJd1F4elVyQkhKVUh2ckpIc1JyaXNkRWpy?=
 =?utf-8?B?SGFabnJ1c1dOYU9FZEsxdVZMY3hobk9LcWRhTGE4ZXRXaDhuS1FDVWZBUWZU?=
 =?utf-8?B?cVIzVG9aeTQ0amZXcVR6cnMzeWFHRzdyL3ZwOXNJQ2llSGczTktBNUpMRHlN?=
 =?utf-8?B?V1JqMG5ZaUh5cWFyb1hyVnFSMFlvdjdtbWhodXhnYlJ4WnNsNmllUXpoaHoy?=
 =?utf-8?B?RHUvc2IxcFkxa1NnRXQzbUFLSytTUVlUWnBNc3BLOTk1U0RQNFlOajQ1RHpi?=
 =?utf-8?B?T1AxZnoyMTVXdC9uUTFPMnBBSVVIQlpKRlpLVTB4NWhlYnpoWSt2MUQ0L0ox?=
 =?utf-8?B?bSs4eHR5UTUrbWY2aE1DbXpmZWZ4UWdMcXlRZTBmZ0o0TzVoU0hLVWNXdjVH?=
 =?utf-8?B?eXZqOVRGeEMwYTNjUlBXeHdmUWloakdJUTV2K3JaMk96eldiMmNLOFYvdVk5?=
 =?utf-8?B?TWp1aU1FcVpPd2hrM2d2MDdzVTJUeW5PU3loYlh3ZzdvSmtqcGk4YkpMZGRF?=
 =?utf-8?B?UThOc2FUbjhoeG1tYzdFd1FqMkthdnlWZ2Q2Q2tMaXN1bGdxb1RhdExSTWcz?=
 =?utf-8?B?OEpDM1QyNnZtQlYwdDBlSkhsRHZVUTFaUUZMMlJVSS8yTHhmdUpoZ3BOVVQ0?=
 =?utf-8?B?U0ZTZWw0UWhMZGQ4YlVqSjFpZEpqUERHMG1VTVBoclpzRkxiZy9hWkxxYVpr?=
 =?utf-8?B?SElTWDh0dVJmaEdIRThZMENNdXIwK3ExVzRoOXM5cCsrd0pNNnc3b3ZCQWYr?=
 =?utf-8?B?WUYrdGZXajRIbkdIM080OHMyYW9GSHRZYmFtTXBaZkFpL0xmeUNuQWNGemZv?=
 =?utf-8?B?ejI2TVo3enZ3VnIvRmJiMFVGdjA5dTJXZzl0Y1BhWGZXUnJMd1JDdmdJb0lJ?=
 =?utf-8?B?eVVIelhTSmIwUWh4Ry9adFloTGw0bFEyZm1CdVdsM29qd1V1WEZETmxGVU1X?=
 =?utf-8?B?alV4cWtyNG5ZWmZNYzdMRmQ3enIzOW41alIyMmdMaEZMdTNhSE5hT2NId3Np?=
 =?utf-8?B?S0VzYkljWGc1cGNJdWNXL015WjJuclRCRUxhSkUvc25NQUlGekhodWREQlZY?=
 =?utf-8?B?NGJkVEdwcDBrL0xsbTBrc09iMy9BdFJHS3dzME9QaVFtdnVodTRLRGpsaGVp?=
 =?utf-8?B?MEUxaDZuc1FuNTN2bnBTZjNwMFp2MFlVZVlVV2NNejBkMDlnVHZRQWx5dm9G?=
 =?utf-8?B?MmJRMGlZUlEwSkxRWXhHemJ1UUZFN25iOVpJREc3RGV2M05rVUMwYkFib1pH?=
 =?utf-8?B?eXNmQXlTNjVORnN3Y2ZJTzVjTEsyRGdreWJlaEtCKzRETmRXVVhqdTdKNlc3?=
 =?utf-8?B?SXdaTEVGUDBFSXp0NmpEemliaTBxdTZqbEF4ZjZUZXo3OGZINW1ZemlMcUNP?=
 =?utf-8?B?MjZSdTVjc0tJbmpyMUoxV2xFbWJsajR1bTBWTEdiMXFZSUJvOFZlTjdoZEpS?=
 =?utf-8?B?VG55NjNVQWlydVBnQWR1Ymk2TGdTcVk0K3pyMWg1ZkxKalZybkRlRVkvWWVn?=
 =?utf-8?B?b1dXd2o2QitoSm0xangybi90ZDhveGNNSzFzTmYvUVVWYmw4d0FLdHpFRG9s?=
 =?utf-8?B?RFFnbUovQkg5WmVWWVdBNWptUzJ4NG1FTkRENEFTMmJYbGxidUJlMFJ2d1NK?=
 =?utf-8?B?aWRReDlSaTQ3NmNvKys5YTNCcUI0RE1mSmVRUm1xZXZTL1ZpeWhxOGxYN3Aw?=
 =?utf-8?B?MjlJYjNFL2oxazVIbi9TWWtJZ1NpWktCaG9PZDFBTTFMcUV2SUI4UmR1WmdO?=
 =?utf-8?B?ekF0WjFwcXRjNzIxRGUzMXVtVjdWSS81Z0hxUUxPdU45VVRYdEFERk5jcXVU?=
 =?utf-8?Q?R61euF?=
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:LV3PR12MB9404.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(7416014)(376014)(10070799003)(1800799024)(366016)(38070700021);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?MzZaMTJYb3RRa1g0eXE2WUMwakFBbE5PN0NKUFpsQWxQbHNTeWI1VU50RHRn?=
 =?utf-8?B?ZXoyQ1R5MmJBNTFWdXA0SmllQko5RVFsU3BBZlAydVM3RzJOWGZ5QzRTZk96?=
 =?utf-8?B?TjJKTWdaUDJPbWltcEdCVmZzbndxYzVsTXVqRDFCTzZWcEpWaXRLMDlDbDNS?=
 =?utf-8?B?UDhXMWJyR2xoQkJOVjg0ek5NbHhrcTFYZCt5Q0FsdGU4azVoZktKb0xpYVdx?=
 =?utf-8?B?RldaRHorQWJ6U0JyN0xrTXNkblZ0VWxZZmczZlFOREZZcTVJSXlIQ1VNNmQ4?=
 =?utf-8?B?R2ZoV01ySWtmOWhLVkFOcDFOa3RnZUh0dEpxUkk2bElyUGZtT0tTb25BdmJO?=
 =?utf-8?B?QXYwZ2lWaTdSbnVpQW9lR2lBSWNGNUhwQ3RFdHVOcU9DYVdDbmRGMGRUcExF?=
 =?utf-8?B?cGlyeUZBcXA5dE8yWG5UcFZtRUdZK2U2b0JoZWZRNDdzYmZwRVViY3g1elY5?=
 =?utf-8?B?QUJ6U2Jld3pNVlZ6VmZLWGw3Tm5IZ2ZGa20xMHF5RWQ0WFQ3S2RaL2ZEaGlJ?=
 =?utf-8?B?SGhvRG9NeVRnRkdpZkhybUFPOGNob2d2eUt5KzlLK0QwMDFld3lRbmpoNUMr?=
 =?utf-8?B?cVdwYVVWMG4za3hDcFlnSmRUNDlRVE14MFVHbUx5Y3RvYkdCaW9PUzVEbGJk?=
 =?utf-8?B?S01nTWlxaDAyNnVDN2NDUFVPMDA2S2lFM29CREU1NUh5Si9iNURhalE1VVhp?=
 =?utf-8?B?SVdvK0VFdUZYOHhFTEliNlhaZWRoemhLZzFpTjhGblMyRlFiMmVCZE8xbnZT?=
 =?utf-8?B?cTVJYVN5VnZUdVdCeFBlVGx2S0NGU1lmSDVZZzJ3bnl0Q1FaYXdoSHZpU0sr?=
 =?utf-8?B?bVR2ejB6N05zVnhOdlJ6QWw2YWZ6UzAxT2FoVUx5b1lBRmxiS2pFbXpOV2Mw?=
 =?utf-8?B?TWJQNHFIMXM1Z1B0RzZ6d25NdVhsRUUwcjJxcW9Fb3ZwQ0JMbEZpS0xkbi9y?=
 =?utf-8?B?Sm03NlJGamh1NENpUG5COUtUUTR5TEFpQnEzZ3NLbDhHdDMwTVFVN1RLaVFQ?=
 =?utf-8?B?aURmSUU0QlNGemloOElscjhiSFlXc25hcXBWNjI1c3BaSzdSN3h4RUowTTJs?=
 =?utf-8?B?bGtFcE5mbG9jaDBZTUEvMTZsV09CeVN3NzAzRzkrdkp0NUF4OVNlaFFyQlRB?=
 =?utf-8?B?UUZwYzhnanc3MXFEMWh6WEhxbUFXcmNvS2U3V3I4Wi9GaUhmaDc0cGQwN2ww?=
 =?utf-8?B?b01FZlFGL3hrZGtnS1VJUmJ2RzlJSENtM1IrbkcreVA4SnEzRmFMT0lRenFr?=
 =?utf-8?B?Q0JMVzltRFp0eHppTFRRdTBEczBqZjhwSmw4dkI4UmRpUENST1ZTVlhOR0lN?=
 =?utf-8?B?enR6RWpWMXlST0NZdW43U0pvVXd2ZWh4NTZZSjRsQUVvR1dYK2xSeThZbURq?=
 =?utf-8?B?ekd1a1h5UFhlODBpc2JaNWh2RU9OR0s1OFdkL093S2pZRGxPUHNVNFpJMDJh?=
 =?utf-8?B?ZEFiT1pDUFVLaXR1YVQzZFBvTGxUa3hvTGN2RWpHak1aSGFWYlZRcHNxTzk5?=
 =?utf-8?B?OWRFenVKQzdkSzB5aW51WTRoTFBzYkEwUnhtY1NCd1NBcnRaOGpob1pXOEIv?=
 =?utf-8?B?Vjg2SVJndW9oVW1veHBEY0M5WVNCMnAxejNDZDRjQWZiQ1ZDTlhrSTE3Y21k?=
 =?utf-8?B?djNMME9SZUZkQ1VTL0JacjBSTG1iNU9HMlFvOFZiZzhqQUMyamxZdjMvNEtJ?=
 =?utf-8?B?WkJ4b0JtUW0yUHJCaElpRUY5Yi83bWJ2Y3NwajY5WDFLSGVPbTdpd0drT3pM?=
 =?utf-8?B?OW90ZUVvMzRKQzcwd1A0S3RRMUlxZ2hlclR5Y1pVWi9pUVdyZnVoMGd3SFI3?=
 =?utf-8?B?cmdhOEZsNmNVVDZoaTdQMWo1VWx1NXFUSUhsekczQ09ZTlNYODR3WWFlMC9L?=
 =?utf-8?B?YkZGcTl2azBqV2F1WnFPa3ZVRTNRVXVrVnNORVVFYWFvQlBaeDdsdENBQnF6?=
 =?utf-8?B?eDkvTjdMOTludmdGUTlTdHR4NDhPa2dSM016dm9UQ29vNUpzQndxYjBjM1dV?=
 =?utf-8?B?UklJa01HeTAzbW8vM2YzMjhobUtnMjRnNEpNYWh3UU9wZ1RzYmViZG1kUXBv?=
 =?utf-8?B?RXl1U09nYVIzTEl4dnYvK3dhdnZobldHSXN6cTRwTlY5cmlNR2RLSnBickk4?=
 =?utf-8?B?c2hrTEdGa1dyeFpacW8zT2dqWVdTR1R4dG9yRlhUMkw2cjg5N0E4cXowWVFY?=
 =?utf-8?Q?/u5LfLy9Rdxski9kmuRPfbQZVQC76BcHx7ugGpQvhzg/?=
Content-ID: <AAA42724A7215248B8CA9E560D7EC27A@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: LV3PR12MB9404.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f007474f-fdbf-419d-8e54-08de270db52d
X-MS-Exchange-CrossTenant-originalarrivaltime: 19 Nov 2025 01:48:16.0851 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: VM6F5RFcjiKALMzArrPhNAn1ESjANIHy5gh4VeIjY1GsF5Rd1mrbpqTzBQy9UFhsb+qv81PNXB70SBL+6Kd0zw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN5PR12MB9509
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-2.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 11/18/25 00:04, Christoph Hellwig wrote: > On Mon, Nov
 17, 2025 at 11:42:43PM -0800, Chaitanya Kulkarni wrote: >> Due to involvement
 of all the subsystem making it as an RFC, ideally >> it shuoldn' [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [52.101.48.67 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1vLbZY-0003Ea-5e
Subject: Re: [f2fs-dev] [RFC PATCH] block: change __blkdev_issue_discard()
 return type to void
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
From: Chaitanya Kulkarni via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Chaitanya Kulkarni <chaitanyak@nvidia.com>
Cc: "dm-devel@lists.linux.dev" <dm-devel@lists.linux.dev>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 Chaitanya Kulkarni <chaitanyak@nvidia.com>,
 "sagi@grimberg.me" <sagi@grimberg.me>, "cem@kernel.org" <cem@kernel.org>,
 "snitzer@kernel.org" <snitzer@kernel.org>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "song@kernel.org" <song@kernel.org>,
 "mpatocka@redhat.com" <mpatocka@redhat.com>,
 "axboe@kernel.dk" <axboe@kernel.dk>, "jaegeuk@kernel.org" <jaegeuk@kernel.org>,
 "yukuai3@huawei.com" <yukuai3@huawei.com>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "agk@redhat.com" <agk@redhat.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 11/18/25 00:04, Christoph Hellwig wrote:
> On Mon, Nov 17, 2025 at 11:42:43PM -0800, Chaitanya Kulkarni wrote:
>> Due to involvement of all the subsystem making it as an RFC, ideally
>> it shuoldn't be an RFC.
> I think best would be a series that drops error checking first,
> and then changes the return type.  That way we can maybe get all
> the callers fixed up in this merge window and then drop the return
> value after -rc1.

thanks for the suggestion

>>   			gfp_mask)))
>>   		*biop = bio_chain_and_submit(*biop, bio);
>> -	return 0;
>>   }
>>   EXPORT_SYMBOL(__blkdev_issue_discard);
>>   
>> @@ -90,8 +89,8 @@ int blkdev_issue_discard(struct block_device *bdev, sector_t sector,
>>   	int ret;
>>   
>>   	blk_start_plug(&plug);
>> -	ret = __blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
>> -	if (!ret && bio) {
>> +	__blkdev_issue_discard(bdev, sector, nr_sects, gfp_mask, &bio);
> ret now needs to be initialized to 0 above.

done.

>
>> index 8d246b8ca604..f26010c46c33 100644
>> --- a/drivers/nvme/target/io-cmd-bdev.c
>> +++ b/drivers/nvme/target/io-cmd-bdev.c
>> @@ -366,16 +366,11 @@ static u16 nvmet_bdev_discard_range(struct nvmet_req *req,
>>   		struct nvme_dsm_range *range, struct bio **bio)
>>   {
>>   	struct nvmet_ns *ns = req->ns;
>> -	int ret;
>>   
>> -	ret = __blkdev_issue_discard(ns->bdev,
>> +	__blkdev_issue_discard(ns->bdev,
>>   			nvmet_lba_to_sect(ns, range->slba),
>>   			le32_to_cpu(range->nlb) << (ns->blksize_shift - 9),
>>   			GFP_KERNEL, bio);
>> -	if (ret && ret != -EOPNOTSUPP) {
>> -		req->error_slba = le64_to_cpu(range->slba);
>> -		return errno_to_nvme_status(req, ret);
>> -	}
>>   	return NVME_SC_SUCCESS;
> nvmet_bdev_discard_range can return void now.

done.

>
>> diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
>> index b45eace879d7..e6078176f733 100644
>> --- a/fs/f2fs/segment.c
>> +++ b/fs/f2fs/segment.c
>> @@ -1346,7 +1346,7 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
>>   		if (time_to_inject(sbi, FAULT_DISCARD)) {
>>   			err = -EIO;
>>   		} else {
>> -			err = __blkdev_issue_discard(bdev,
>> +			__blkdev_issue_discard(bdev,
>>   					SECTOR_FROM_BLOCK(start),
>>   					SECTOR_FROM_BLOCK(len),
>>   					GFP_NOFS, &bio);
> Please fold the following 'if (err)' block directly into the injection
> one, and either initialize err to 0, or use a direct return from that
> block to skip the last branch in the function checking err.

done :-

diff --git a/fs/f2fs/segment.c b/fs/f2fs/segment.c
index b45eace879d7..3dbcfb9067e9 100644
--- a/fs/f2fs/segment.c
+++ b/fs/f2fs/segment.c
@@ -1343,15 +1343,9 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
  
                 dc->di.len += len;
  
+               err = 0;
                 if (time_to_inject(sbi, FAULT_DISCARD)) {
                         err = -EIO;
-               } else {
-                       err = __blkdev_issue_discard(bdev,
-                                       SECTOR_FROM_BLOCK(start),
-                                       SECTOR_FROM_BLOCK(len),
-                                       GFP_NOFS, &bio);
-               }
-               if (err) {
                         spin_lock_irqsave(&dc->lock, flags);
                         if (dc->state == D_PARTIAL)
                                 dc->state = D_SUBMIT;
@@ -1360,6 +1354,10 @@ static int __submit_discard_cmd(struct f2fs_sb_info *sbi,
                         break;
                 }
  
+               __blkdev_issue_discard(bdev,
+                               SECTOR_FROM_BLOCK(start),
+                               SECTOR_FROM_BLOCK(len),
+                               GFP_NOFS, &bio);
                 f2fs_bug_on(sbi, !bio);
  
                 /*
-- 
2.40.0


>
>>   	blk_finish_plug(&plug);
>>   
>> -	return error;
>> +	return 0;
> Please drop the error return for xfs_discard_extents entirely.
>

done :-

diff --git a/fs/xfs/xfs_discard.c b/fs/xfs/xfs_discard.c
index ee49f20875af..1f35c1d80cea 100644
--- a/fs/xfs/xfs_discard.c
+++ b/fs/xfs/xfs_discard.c
@@ -108,7 +108,7 @@ xfs_discard_endio(
   * list. We plug and chain the bios so that we only need a single completion
   * call to clear all the busy extents once the discards are complete.
   */
-int
+void
  xfs_discard_extents(
  	struct xfs_mount	*mp,
  	struct xfs_busy_extents	*extents)
@@ -116,7 +116,6 @@ xfs_discard_extents(
  	struct xfs_extent_busy	*busyp;
  	struct bio		*bio = NULL;
  	struct blk_plug		plug;
-	int			error = 0;
  
  	blk_start_plug(&plug);
  	list_for_each_entry(busyp, &extents->extent_list, list) {
@@ -126,18 +125,10 @@ xfs_discard_extents(
  
  		trace_xfs_discard_extent(xg, busyp->bno, busyp->length);
  
-		error = __blkdev_issue_discard(btp->bt_bdev,
+		__blkdev_issue_discard(btp->bt_bdev,
  				xfs_gbno_to_daddr(xg, busyp->bno),
  				XFS_FSB_TO_BB(mp, busyp->length),
  				GFP_KERNEL, &bio);
-		if (error && error != -EOPNOTSUPP) {
-			xfs_info(mp,
-	 "discard failed for extent [0x%llx,%u], error %d",
-				 (unsigned long long)busyp->bno,
-				 busyp->length,
-				 error);
-			break;
-		}
  	}
  
  	if (bio) {
@@ -148,8 +139,6 @@ xfs_discard_extents(
  		xfs_discard_endio_work(&extents->endio_work);
  	}
  	blk_finish_plug(&plug);
-
-	return error;
  }
  
  /*
@@ -385,9 +374,7 @@ xfs_trim_perag_extents(
  		 * list  after this function call, as it may have been freed by
  		 * the time control returns to us.
  		 */
-		error = xfs_discard_extents(pag_mount(pag), extents);
-		if (error)
-			break;
+		xfs_discard_extents(pag_mount(pag), extents);
  
  		if (xfs_trim_should_stop())
  			break;
@@ -496,12 +483,10 @@ xfs_discard_rtdev_extents(
  
  		trace_xfs_discard_rtextent(mp, busyp->bno, busyp->length);
  
-		error = __blkdev_issue_discard(bdev,
+		__blkdev_issue_discard(bdev,
  				xfs_rtb_to_daddr(mp, busyp->bno),
  				XFS_FSB_TO_BB(mp, busyp->length),
  				GFP_NOFS, &bio);
-		if (error)
-			break;
  	}
  	xfs_discard_free_rtdev_extents(tr);
  
@@ -739,9 +724,7 @@ xfs_trim_rtgroup_extents(
  		 * list  after this function call, as it may have been freed by
  		 * the time control returns to us.
  		 */
-		error = xfs_discard_extents(rtg_mount(rtg), tr.extents);
-		if (error)
-			break;
+		xfs_discard_extents(rtg_mount(rtg), tr.extents);
  
  		low = tr.restart_rtx;
  	} while (!xfs_trim_should_stop() && low <= high);
diff --git a/fs/xfs/xfs_discard.h b/fs/xfs/xfs_discard.h
index 2b1a85223a56..8c5cc4af6a07 100644
--- a/fs/xfs/xfs_discard.h
+++ b/fs/xfs/xfs_discard.h
@@ -6,7 +6,7 @@ struct fstrim_range;
  struct xfs_mount;
  struct xfs_busy_extents;
  
-int xfs_discard_extents(struct xfs_mount *mp, struct xfs_busy_extents *busy);
+void xfs_discard_extents(struct xfs_mount *mp, struct xfs_busy_extents *busy);
  int xfs_ioc_trim(struct xfs_mount *mp, struct fstrim_range __user *fstrim);
  
  #endif /* XFS_DISCARD_H */
-- 
2.40.0


will run the basic xfstest and send out a series to just remove the dead-code.

Thanks for the review comments.

-ck



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
