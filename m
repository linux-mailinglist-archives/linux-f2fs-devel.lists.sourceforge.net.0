Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id EBD40BA2F1B
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 26 Sep 2025 10:29:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.sourceforge.net; s=beta; h=Content-Transfer-Encoding:Content-Type:Cc:
	Reply-To:From:List-Subscribe:List-Help:List-Post:List-Archive:
	List-Unsubscribe:List-Id:Subject:MIME-Version:In-Reply-To:References:To:Date:
	Message-ID:Sender:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ficmKHGTIbwlA8XkBTB5TmWYPPXSxQZF0nyJHpSZHQg=; b=EJhnTfi5sNgwDvPAu9uaYfLi4q
	TCXvwnlNHoNdTVXsDobjiKzjsCFAMEkOSRkRY1lH7d9kgVi7ypsLpad29GlfJYs2B5q1R0jtHvsGa
	lxqgluem64I2OzlCFRYEBRXoOsO8yTSjYyrhx/zMKlFYM2n5sIhNSaQtw3t9hloUd/gQ=;
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1v23ox-0006hF-9t;
	Fri, 26 Sep 2025 08:28:52 +0000
Received: from [172.30.29.66] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <shivankg@amd.com>) id 1v23ov-0006gx-HN
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 08:28:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=9nO6v1jBPXrL9qfNdMcZLxyETTA/u3Yf9lFrozO5XKw=; b=FpExgNkq+s64ua8qXRJwK5S4C5
 gky572ZfhEGag8pXoC1kWTJFXH0LBOcGitO641IPD4cMm8QVNyCIu97y2VdAZQifoBZpHVm6951uC
 vsm4IqAmImw/T2k8e7oE2JSoFoNojExY8LDCIZSga1oAJYe6YPQ0JJYD+NRBM97/TOpQ=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=9nO6v1jBPXrL9qfNdMcZLxyETTA/u3Yf9lFrozO5XKw=; b=WK/gvLIa/41ix6jIXT7ab0oPmf
 mBgSUSxWc0/mR5+k0mVfg26+pOc94A/L5ohlRvj9dRKGbdbIoYxplvCemTj+XQFds2HTJ1BcCRxCY
 05HE0UuK6cunxlce7eX4McoFAICBMvn20SnvlEmIiqyGH7+On+hxmlE+X3f2xHBuDT4g=;
Received: from mail-westus3azon11012028.outbound.protection.outlook.com
 ([40.107.209.28] helo=PH8PR06CU001.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1v23ov-0001QW-Jy for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 26 Sep 2025 08:28:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=yVOYIbQqfMUx3/6ZPoak37c28QM2MyI1jpWOpcR2IBoWfwtlGfFb1mDe1vxsLCe+V7bjrmRYOO4QCEwij9eOxIYEoUTbyJ9ZJVteDcNJs2zNAGe/Sojf1i1c1A6wMhA7a2vnkJsN5jXHTQlK8UbX4wTM7s1osh9rQMTSvG34lR8UIzz4uSS5QF6wup2WRJikysBz/6tielaPcrTzKv/krRYweZB2oSBpZFVeM16rIK/ZfNVOW1leNQ6Y6MMuXjcN3dTkcQHqKnp0g2pCOCJC0i3EEgoFaQNh2LAormoThLzvFlirj5wvGqpgotpfum6wjIDPNyi0DbVKAzU2ArfgIw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9nO6v1jBPXrL9qfNdMcZLxyETTA/u3Yf9lFrozO5XKw=;
 b=exjy5DTx3WMe3VNAthT65JIOchcWqanLq+xBW0Weluu1yb9rLZ/Mgrn/6xlufw8nu+L6uQa9BwRmig7IeFSEeAFL4y2rNcGFVbdEOiAxvBVae7uACUf29N1ZHRKBe8IttLmDsqPgJSZ61I3pK8PUHRMGFQcJ2j63n72UkNt4g+OoWcFamj+EWVGCeXtYN6w+k0ZjpFqTgeApGYEPKSGZ1aWmSQ+cIApE+MipJGK62M4W+qJ98V5rWJRgNS4jDyT81LOCqsmLLhlTJ13Q0qa+g0Itw+FqSZR9sHkQnNa5yHmW6lsashnhObTpaRb8YzD3GR3wTFp2SonTSw7YhoKjdw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9nO6v1jBPXrL9qfNdMcZLxyETTA/u3Yf9lFrozO5XKw=;
 b=eyYKDUg1Vcce3H74yR4y6l94iMdafVA6VM32B3gkZ5y5DSr9JsjwIKDTzsGHxhF1JbujsHRoG9+r13VtSS3StpKl48SVW/mHcGvQ+7j9HD84m1JHAeCeoPbywBz5RFmI5onCWwDFEsCtUcUV986GLJA8gXw6S9XVefRDRQy+2/4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from IA0PR12MB8301.namprd12.prod.outlook.com (2603:10b6:208:40b::13)
 by PH7PR12MB9068.namprd12.prod.outlook.com (2603:10b6:510:1f4::7)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9137.18; Fri, 26 Sep
 2025 07:38:27 +0000
Received: from IA0PR12MB8301.namprd12.prod.outlook.com
 ([fe80::e929:57f5:f4db:5823]) by IA0PR12MB8301.namprd12.prod.outlook.com
 ([fe80::e929:57f5:f4db:5823%4]) with mapi id 15.20.9160.008; Fri, 26 Sep 2025
 07:38:27 +0000
Message-ID: <0e986bdb-7d1b-4c14-932e-771a87532947@amd.com>
Date: Fri, 26 Sep 2025 13:07:57 +0530
User-Agent: Mozilla Thunderbird
To: David Hildenbrand <david@redhat.com>,
 Sean Christopherson <seanjc@google.com>
References: <20250827175247.83322-2-shivankg@amd.com>
 <20250827175247.83322-10-shivankg@amd.com> <aNW1l-Wdk6wrigM8@google.com>
 <95ace421-36d2-48af-b527-7e799722eb17@redhat.com>
Content-Language: en-US
In-Reply-To: <95ace421-36d2-48af-b527-7e799722eb17@redhat.com>
X-ClientProxiedBy: PN2PR01CA0187.INDPRD01.PROD.OUTLOOK.COM
 (2603:1096:c01:e8::14) To IA0PR12MB8301.namprd12.prod.outlook.com
 (2603:10b6:208:40b::13)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: IA0PR12MB8301:EE_|PH7PR12MB9068:EE_
X-MS-Office365-Filtering-Correlation-Id: 94d3eeee-162b-4ee2-bff9-08ddfccfae33
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|7416014|1800799024|366016;
X-Microsoft-Antispam-Message-Info: =?utf-8?B?K094SHRzZVpMVGNpYVFmdU5BcTQwcXJTTC9DQUVabXc4cUtScCtHYkxPcGFo?=
 =?utf-8?B?RElyaS83REZIdlIrV2RzOG1zSmNwWkNhUytwOFVqNGNDOW9ETGdxTjQ5d2JJ?=
 =?utf-8?B?Vk5TQ0JxWW0wSkRaK2x6b2wzNHdlcmNBdExpbEljOWl0RzBKNzI4YlFXVHgz?=
 =?utf-8?B?UXBTMU5GY2VoOGUrZUliSVFlcWVUdG93K0YyT0FQRXA1RVQ3Y0QzUDNBZWp4?=
 =?utf-8?B?SXZzcUFva3RwZThZNUQ0ckxRNXNad21MNWJ4L29SeWlzTnB6U1hobUlUZTV1?=
 =?utf-8?B?VnFYMExTVXFZcGhCOEdhOU5wd0Rtcm9RTmNLb2JKaFljODRUQ1FhS1VneHhh?=
 =?utf-8?B?aU5pMk9ybURMTmpudkdjSFBaUXpMbndTUTc4L2RVdWV5SzRSUFc4aFlLL1kz?=
 =?utf-8?B?Ujhib3U2V25wcElYWklsanlreEh4ZEQvUFdvWFBydHVWa0p0emZJUzBxZkhU?=
 =?utf-8?B?TmxhYUJSWHJDeCtsZzRJWGlVbXJXVVdVU1dvUi9sR1A3bUdUSnFFM1FKL0tr?=
 =?utf-8?B?SFVpMUk0RkkyU0FmR1BLQm4rWVNDUEJ4cmVqcGwzUDg2TlZKNnVSbjRvL1Av?=
 =?utf-8?B?dENjUWR3U0FvMmQzSGw4YitaTTIvU2lYLzFQUkxubm9CSW5FdDhyTWh6VjlP?=
 =?utf-8?B?YkFvVjJRSFdMTjFZOHpnbS9hSTVEQUN6L3lLQ3Npd1Zmb0pqRHNTdDVsN2NR?=
 =?utf-8?B?K01jOFBhQ1hCS1pYbUNScDgvbnMwR2pmWlZsakRsVTJRVCtYWmhUQ1lRVXFo?=
 =?utf-8?B?cTFwbFdlMWV3VWcxU05PUzMvSXJsZTQ0YjlPYTRSMGs2ZHk4blprY1NoMHRL?=
 =?utf-8?B?dmNQWjlUVzEwUE5rOTgvWExwSXB4STBlUXlXWWwxczFjajRVeW40c3hkcmZK?=
 =?utf-8?B?YWZuaXFZNElJUk41MEpwczJGdit1akJFamV3TW9YN0w2RUVTMFVZc3ZtbFZV?=
 =?utf-8?B?SEx0ZDExL2NhWFFCdFc2cFJscHFNLzloRzMwRkRCeXJvQ09PVDU2U1RJd0Zy?=
 =?utf-8?B?THpFSHVwV1Z5Y05zSStmUWRuNERiMWkrYW00S0lWcDJHNkk2QU5xMGRuR1Vw?=
 =?utf-8?B?TmYybThvMUtUalpINjZlSzN6ekt5Qk1FbWtsQzdOL1lSVElaVUNRb2xmWUlt?=
 =?utf-8?B?VkdhMWtEejNlQVlJNzFGNzdubUlKZU1MU3phalA0Vy9PVHpDN21Ba1BOcjJu?=
 =?utf-8?B?UFZXSlFTVzFTUGpPS3ZGT3VHcExuakxaK0tzYXNOYy9jYjhXVmJndGlVc2li?=
 =?utf-8?B?SENHVVlhd2U4aitra3pMMno5b1llYTdJWE9vTHFHcTNQRnBSZzhjSnZlcFdl?=
 =?utf-8?B?TitkMnpUUVJ5bGZNMDBDQzhpQksxUTI5eGpLUEgzU0s2cXV5Y2tqUEpGN01t?=
 =?utf-8?B?YUNaSFhzNU9WZUhTRk91aThObmYyVnljeEtTQzFqNWtUMS9oa3N4ZDh1a0ow?=
 =?utf-8?B?R3NaK1h1WnBHR2w1MHRGTTBzR3UzY1YxajdRL2tWdDdZdWJQcmlwUEdxSDRR?=
 =?utf-8?B?VTVrdGpOYUVDZDRmeWNnMm1CaDVJSkJkWUhtK0wyMDZiR1BERnR0WTZtV3RS?=
 =?utf-8?B?SE5YSjludWVEdDlOTWplcTNPbWNxNVpONFRkMkR2SmhCOEtNYVVWZFJOTXAr?=
 =?utf-8?B?OHovMlpnWXQxUm5KNFVJM1dTbEVCTzJhdFlBU2lXM0pqdHVwa052ODFtc3Vh?=
 =?utf-8?B?OWJENi9WUEloT2psZUVYZGxxcEJzbmVZUWVXSU5PSVZoYTgvaExoVTlHNnk5?=
 =?utf-8?B?UGhLTWhqTXlNRFlERHQ3blJobGdGMUVCT0h1Rm1CWUJmMmxOaUR1TXN0NnAr?=
 =?utf-8?B?SGkxaHZqSjhuY3VHSFNQb1d5RC9OeVVGOXFPNHdFbWwvdEpOY0dUYXpWSEJt?=
 =?utf-8?B?TWxkdk4xTXo3T3AvanJPZHNmenU0YVZHQ1Axa1I3QWo1aXFaOU1XR0hIeW1V?=
 =?utf-8?Q?uyn4ioYfTnZ9jmnje/2WgMXE68bRDrcZ?=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:IA0PR12MB8301.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230040)(376014)(7416014)(1800799024)(366016); DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?bmxmdzE5UXdWT0lyblR5OHpHUmlBUEYzSDBvRHR2dEllZ1hGTmgyeTQ3RUdq?=
 =?utf-8?B?L05mcXFULzdmRlpldU1NNWR0eVQ4MVlkTXhVZVJQVmJxU2lQUXM4allhRVNK?=
 =?utf-8?B?UDFHWlRNOFlaaFRtblcxWW1nYWtMNG8wZDlpT2FhYjZHbkJiQUZ0Uk1mRjFw?=
 =?utf-8?B?dFpLelJMbHFza2J1M0NNd0k5L1Vxak5iV2hpMlVHeXQwUE1senpja3VEekhH?=
 =?utf-8?B?ZnB1d0labXowQ3AvSWhBMUxvOGdUeFZxTEdXSlZHSk81M1ZCa01GRU9XSTlM?=
 =?utf-8?B?Y0Y3YmdMdzJXZlgzM1VQcGVPYUY3cVpSemRBeTNFOXFMZDZmbmkwQ2FOSzdt?=
 =?utf-8?B?Uk5rZ0ZxcTM2ZlI4Yk5SUXZiMWUrVFNLa1d1eENWTGkwY01rZU5XR3lYUld5?=
 =?utf-8?B?T28xM2FxK1c3a1ZxNkxTNUN4Tm1TNCtIdmRVQXpQOVhkWFg5NlVZaUNZelBQ?=
 =?utf-8?B?TFJPVDYyRUJSR0ZzWnphRG9GMzJhNUk4TktvWUZBZlpDMzNCZ09xYTdmZFBY?=
 =?utf-8?B?c0loN1BZTDJPV2lxVkd5TWszZEw1bW9PZ2lrTXh4QmNNNGdoY0lsd1VUMU9T?=
 =?utf-8?B?Zk8zbEZIZ2pKcTdHTGl3OW9SUTlKenNYM2Q5ekNua0szOVFUaHdvYzlpOGMz?=
 =?utf-8?B?Tk1EMFBjMUhoaTU2SHpwWjBaNklZSVJ0ZkJma3BVN2ErbG1uWlkvb1NUUHFy?=
 =?utf-8?B?UlZUajRVNWhYRm10ekZLRS9mK2ZCb0tSaXNTVllLemxJWXdzRmZQSmlkZDFU?=
 =?utf-8?B?QjFhWWZlV0ZKNU5aNDRXMjFtRDRpM0dxZXBYclRQeVBJbTZPTWV3Vm9tNDRU?=
 =?utf-8?B?cEd0NjEydjdRb2RWY0Y1RnpsbmdPR3hVR3VmTlptdU1SUjdobGJVQm9xQmtQ?=
 =?utf-8?B?Mll1UVBxc0d3ODVCMWJVWnJ6Nm12M1dpMXd1WVo2RUpzUGFOZWJTeHN6Wk9h?=
 =?utf-8?B?Y2hEb0xQWWpjRzFZMnVHcHEzK0hmU3VaSnZlOWF5M1BOWHcyZzdySEJRcW5P?=
 =?utf-8?B?YmVWVG42c09PTXphbk82bXRFU1FXWGVlQXI5MWFCcUgzUEhocEVlTXBYeDIy?=
 =?utf-8?B?dmh0MG1KZTc1UTVYa3JjaTYycnpUemluQ0ErSEI0V1lUZ09ZUkVWMlhlVE1B?=
 =?utf-8?B?Tm4rWUtpNjlXMWI5VUt0b0F4YXpiSmFKVGZram1Ta2ZPWVYydzFaRkhKZ3J6?=
 =?utf-8?B?SHZMK0czcVMrNDJ3YTVycFE2cnl0enIyOG1ZUk1DeDBsZnZIMVNlQ29CMS9w?=
 =?utf-8?B?WGE0OTF4RG03eHk5MWtIU1J1MzNSZkZjVGZZaWVRZDJsWDNGZWNCWnozWkli?=
 =?utf-8?B?ckw3aTZQNXB4UkJNTGtHMDIyUFFsMGdMSGdPbU9ENUdoU1JSdHZOQksvZHpz?=
 =?utf-8?B?NkUyeDNJZzJaWnF5TlEvZ1JzTC9pZVk1aDV1M216bURKNmZWTVlZUWtrSk9r?=
 =?utf-8?B?VEltVU5ERFlOMThQWElzYkdvL3JvM1EvTE8rQlVYblphUWxqSUtFS1RVVURU?=
 =?utf-8?B?Ui9TV1hzc3Nva05RcDFrVnh5UjczUHhNekNXSXVsWkUyV3J5dXNJSXQyZjda?=
 =?utf-8?B?QWJYV3FZSm1WeXRyYXlOSmEySHU0N0xaRzc0RU1mWDdJa2srTEwvUy9QSFVn?=
 =?utf-8?B?akhWTDQwS0N6ZWJxYUU4bC8rdGtvNWdNN1BrS2xtQ0w5aHBMT0xzTlpEb1oz?=
 =?utf-8?B?eDllQVM0UjExeGZZRWVGL2lQanVJeC9LSkh0UnUxdFArSDQxdkwxUnhDbTB2?=
 =?utf-8?B?QlhuRzNNUE41eE1DQThoUFVrNUZkSU56WUpVQk1vT29NVkVpM1hKcU5EMnNw?=
 =?utf-8?B?VVR6aDJNY0VtVThIcENFZDl4WGo4VUZ2N3BycHBtSzJTTzdRQUtrRzlqWEdn?=
 =?utf-8?B?U1RqS1haSnBzbG9jcWJhVnZMNmpoZlpIaXA2d0N2NG5oTzhpV0g2UDMvNEtK?=
 =?utf-8?B?T3RwWDl0MTBwZk5veVFrbTBmL0gvRDJiVUUvK05PYXRiVG02elhraEJzKyt2?=
 =?utf-8?B?TUhaSEhNZ1NqZDBqazRwY0hnbks3cTA3dVVzcFNFaHRxV0pKSmpGOUxQckFL?=
 =?utf-8?B?WmM3eTNrb3JOWHdhNzZ1ZEtzYU1yRGdFYW5pZnppODJIOTBSU0x3VjhFbWZ2?=
 =?utf-8?Q?9OsjLMHb9IDzFFJhMHIaCRTOm?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 94d3eeee-162b-4ee2-bff9-08ddfccfae33
X-MS-Exchange-CrossTenant-AuthSource: IA0PR12MB8301.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Sep 2025 07:38:27.2978 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qERhmwqEDTTUsf8EY331X197pDmRa9i4UjRzF5ANHDGMG30Nz9UbWrBu+vEtGiFy3YjCGFJaVXGiSwvWxOrrow==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB9068
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "sfi-spamd-1.hosts.colo.sdot.me", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 9/26/2025 1:01 PM, David Hildenbrand wrote: > On 25.09.25
 23:35, Sean Christopherson wrote: >> On Wed, Aug 27, 2025, Shivank Garg wrote:
 >>> Add tests for NUMA memory policy binding and NUMA aware [...] 
 Content analysis details:   (-0.2 points, 5.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from author's
 domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.0 ARC_VALID              Message has a valid ARC signature
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.0 ARC_SIGNED             Message has a ARC signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature,
 not necessarily valid
 0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.209.28 listed in wl.mailspike.net]
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1v23ov-0001QW-Jy
Subject: Re: [f2fs-dev] [PATCH kvm-next V11 7/7] KVM: guest_memfd:
 selftests: Add tests for mmap and NUMA policy support
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
Cc: jgowans@amazon.com, mhocko@suse.com, jack@suse.cz, kvm@vger.kernel.org,
 dhavale@google.com, linux-btrfs@vger.kernel.org, aik@amd.com, papaluri@amd.com,
 kalyazin@amazon.com, peterx@redhat.com, linux-mm@kvack.org, clm@fb.com,
 ddutile@redhat.com, linux-kselftest@vger.kernel.org, shdhiman@amd.com,
 gshan@redhat.com, ying.huang@linux.alibaba.com, shuah@kernel.org,
 roypat@amazon.co.uk, matthew.brost@intel.com, linux-coco@lists.linux.dev,
 zbestahu@gmail.com, lorenzo.stoakes@oracle.com, linux-bcachefs@vger.kernel.org,
 ira.weiny@intel.com, apopple@nvidia.com, jmorris@namei.org,
 willy@infradead.org, hch@infradead.org, chao.gao@intel.com, tabba@google.com,
 ziy@nvidia.com, rientjes@google.com, yuzhao@google.com, xiang@kernel.org,
 nikunj@amd.com, gourry@gourry.net, serge@hallyn.com, amit@infradead.org,
 thomas.lendacky@amd.com, ashish.kalra@amd.com, chao.p.peng@intel.com,
 yan.y.zhao@intel.com, byungchul@sk.com, michael.day@amd.com,
 Neeraj.Upadhyay@amd.com, michael.roth@amd.com, bfoster@redhat.com,
 bharata@amd.com, josef@toxicpanda.com, Liam.Howlett@oracle.com,
 ackerleytng@google.com, dsterba@suse.com, viro@zeniv.linux.org.uk,
 jefflexu@linux.alibaba.com, jaegeuk@kernel.org, dan.j.williams@intel.com,
 surenb@google.com, vbabka@suse.cz, paul@paul-moore.com,
 joshua.hahnjy@gmail.com, brauner@kernel.org, quic_eberman@quicinc.com,
 rakie.kim@sk.com, cgzones@googlemail.com, pvorel@suse.cz,
 linux-erofs@lists.ozlabs.org, kent.overstreet@linux.dev,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 pankaj.gupta@amd.com, linux-security-module@vger.kernel.org,
 lihongbo22@huawei.com, linux-fsdevel@vger.kernel.org, pbonzini@redhat.com,
 akpm@linux-foundation.org, vannapurve@google.com, suzuki.poulose@arm.com,
 rppt@kernel.org, jgg@nvidia.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

CgpPbiA5LzI2LzIwMjUgMTowMSBQTSwgRGF2aWQgSGlsZGVuYnJhbmQgd3JvdGU6Cj4gT24gMjUu
MDkuMjUgMjM6MzUsIFNlYW4gQ2hyaXN0b3BoZXJzb24gd3JvdGU6Cj4+IE9uIFdlZCwgQXVnIDI3
LCAyMDI1LCBTaGl2YW5rIEdhcmcgd3JvdGU6Cj4+PiBBZGQgdGVzdHMgZm9yIE5VTUEgbWVtb3J5
IHBvbGljeSBiaW5kaW5nIGFuZCBOVU1BIGF3YXJlIGFsbG9jYXRpb24gaW4KPj4+IGd1ZXN0X21l
bWZkLiBUaGlzIGV4dGVuZHMgdGhlIGV4aXN0aW5nIHNlbGZ0ZXN0cyBieSBhZGRpbmcgcHJvcGVy
Cj4+PiB2YWxpZGF0aW9uIGZvcjoKPj4+IC0gS1ZNIEdNRU0gc2V0X3BvbGljeSBhbmQgZ2V0X3Bv
bGljeSgpIHZtX29wcyBmdW5jdGlvbmFsaXR5IHVzaW5nCj4+PiDCoMKgIG1iaW5kKCkgYW5kIGdl
dF9tZW1wb2xpY3koKQo+Pj4gLSBOVU1BIHBvbGljeSBhcHBsaWNhdGlvbiBiZWZvcmUgYW5kIGFm
dGVyIG1lbW9yeSBhbGxvY2F0aW9uCj4+Pgo+Pj4gVGhlc2UgdGVzdHMgaGVscCBlbnN1cmUgTlVN
QSBzdXBwb3J0IGZvciBndWVzdF9tZW1mZCB3b3JrcyBjb3JyZWN0bHkuCj4+Pgo+Pj4gU2lnbmVk
LW9mZi1ieTogU2hpdmFuayBHYXJnIDxzaGl2YW5rZ0BhbWQuY29tPgo+Pj4gLS0tCj4+PiDCoCB0
b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3ZtwqDCoMKgwqDCoCB8wqDCoCAx
ICsKPj4+IMKgIC4uLi90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vZ3Vlc3RfbWVtZmRfdGVzdC5jwqAg
fCAxMjEgKysrKysrKysrKysrKysrKysrCj4+PiDCoCAyIGZpbGVzIGNoYW5nZWQsIDEyMiBpbnNl
cnRpb25zKCspCj4+Pgo+Pj4gZGlmZiAtLWdpdCBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2
bS9NYWtlZmlsZS5rdm0gYi90b29scy90ZXN0aW5nL3NlbGZ0ZXN0cy9rdm0vTWFrZWZpbGUua3Zt
Cj4+PiBpbmRleCA5MGYwM2YwMGNiMDQuLmM0NmNlZjJhN2NkNyAxMDA2NDQKPj4+IC0tLSBhL3Rv
b2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5rdm0KPj4+ICsrKyBiL3Rvb2xzL3Rl
c3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5rdm0KPj4+IEBAIC0yNzUsNiArMjc1LDcgQEAg
cGdzdGUtb3B0aW9uID0gJChjYWxsIHRyeS1ydW4sIGVjaG8gJ2ludCBtYWluKHZvaWQpIHsgcmV0
dXJuIDA7IH0nIHwgXAo+Pj4gwqDCoMKgwqDCoCAkKENDKSAtV2Vycm9yIC1XbCQoY29tbWEpLS1z
MzkwLXBnc3RlIC14IGMgLSAtbyAiJCRUTVAiLC1XbCQoY29tbWEpLS1zMzkwLXBnc3RlKQo+Pj4g
wqAgwqAgTERMSUJTICs9IC1sZGwKPj4+ICtMRExJQlMgKz0gLWxudW1hCj4+Cj4+IEhybSwgdGhp
cyBpcyBnb2luZyB0byBiZSB2ZXJ5IGFubm95aW5nLsKgIEkgZG9uJ3QgaGF2ZSBsaWJudW1hLWRl
diBpbnN0YWxsZWQgb24KPj4gYW55IG9mIG15IDx0b28gbWFueT4gc3lzdGVtcywgYW5kIEkgZG91
YnQgSSdtIGFsb25lLsKgIEluc3RhbGxpbmcgdGhlIHBhY2thZ2UgaXMKPj4gdHJpdmlhbCwgYnV0
IEknbSBhIGxpdHRsZSB3YXJ5IG9mIGZvaXN0aW5nIHRoYXQgcmVxdWlyZW1lbnQgb24gYWxsIEtW
TSBkZXZlbG9wZXJzCj4+IGFuZCBidWlsZCBib3RzLgo+Pgo+PiBJJ2QgYmUgZXNwZWNpYWxseSBj
dXJpb3VzIHdoYXQgQVJNIGFuZCBSSVNDLVYgdGhpbmssIGFzIE5VTUEgaXMgbGlrZWx5IGEgYml0
IGxlc3MKPj4gcHJldmVsYW50IHRoZXJlLgo+IAo+IFdlIHVuY29uZGl0aW9uYWxseSB1c2UgaXQg
aW4gdGhlIG1tIHRlc3RzIGZvciBrc20gYW5kIG1pZ3JhdGlvbiB0ZXN0cywgc28gaXQncyBub3Qg
cGFydGljdWxhcmx5IG9kZCB0byByZXF1aXJlIGl0IGhlcmUgYXMgd2VsbC4KPiAKPiBXaGF0IHdl
IGRvIHdpdGggbGlidXJpbmcgaW4gbW0gc2VsZnRlc3RzIGlzIHRvIGRldGVjdCBwcmVzZW5jZSBh
dCBjb21waWxlIHRpbWUgYW5kIGVzc2VudGlhbGx5IG1ha2UgdGhlIHRlc3RzIGJlaGF2ZSBkaWZm
ZXJlbnRseSBiYXNlZCBvbiBhdmFpbGFiaWxpdHkgKHNlZSBjaGVja19jb25maWcuc2gpLgo+IAoK
SSBoYXZlIGFuIGFsdGVybmF0aXZlIHRoYXQgZHJvcHMgbGlibnVtYSBlbnRpcmVseS4KSWYgdGhp
cyBhcHByb2FjaCBsb29rcyByZWFzb25hYmxlLCBjb3VsZCB3ZSBwb3RlbnRpYWxseSBmYWN0b3Ig
dGhlc2Ugb3V0IGludG8gYQpjb21tb24gdGVzdCB1dGlsaXR5IGZvciBvdGhlciBzZWxmdGVzdHMg
dGhhdCBjdXJyZW50bHkgZGVwZW5kIG9uIGxpYm51bWE/CgpXaGF0IGFyZSB5b3VyIHRob3VnaHRz
IG9uIHRoaXM/CgpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL01ha2Vm
aWxlLmt2bSBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9NYWtlZmlsZS5rdm0KaW5kZXgg
YzQ2Y2VmMmE3Y2Q3Li45MGYwM2YwMGNiMDQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9NYWtlZmlsZS5rdm0KKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3Zt
L01ha2VmaWxlLmt2bQpAQCAtMjc1LDcgKzI3NSw2IEBAIHBnc3RlLW9wdGlvbiA9ICQoY2FsbCB0
cnktcnVuLCBlY2hvICdpbnQgbWFpbih2b2lkKSB7IHJldHVybiAwOyB9JyB8IFwKIAkkKENDKSAt
V2Vycm9yIC1XbCQoY29tbWEpLS1zMzkwLXBnc3RlIC14IGMgLSAtbyAiJCRUTVAiLC1XbCQoY29t
bWEpLS1zMzkwLXBnc3RlKQogCiBMRExJQlMgKz0gLWxkbAotTERMSUJTICs9IC1sbnVtYQogTERG
TEFHUyArPSAtcHRocmVhZCAkKG5vLXBpZS1vcHRpb24pICQocGdzdGUtb3B0aW9uKQogCiBMSUJL
Vk1fQyA6PSAkKGZpbHRlciAlLmMsJChMSUJLVk0pKQpkaWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGlu
Zy9zZWxmdGVzdHMva3ZtL2d1ZXN0X21lbWZkX3Rlc3QuYyBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRl
c3RzL2t2bS9ndWVzdF9tZW1mZF90ZXN0LmMKaW5kZXggOTY0MGQwNGVjMjkzLi4xMmNlOTE5NTBj
NDQgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9ndWVzdF9tZW1mZF90
ZXN0LmMKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2d1ZXN0X21lbWZkX3Rlc3Qu
YwpAQCAtNyw4ICs3LDYgQEAKICNpbmNsdWRlIDxzdGRsaWIuaD4KICNpbmNsdWRlIDxzdHJpbmcu
aD4KICNpbmNsdWRlIDx1bmlzdGQuaD4KLSNpbmNsdWRlIDxudW1hLmg+Ci0jaW5jbHVkZSA8bnVt
YWlmLmg+CiAjaW5jbHVkZSA8ZXJybm8uaD4KICNpbmNsdWRlIDxzdGRpby5oPgogI2luY2x1ZGUg
PGZjbnRsLmg+CkBAIC03NSw5ICs3Myw2IEBAIHN0YXRpYyB2b2lkIHRlc3RfbW1hcF9zdXBwb3J0
ZWQoaW50IGZkLCBzaXplX3QgcGFnZV9zaXplLCBzaXplX3QgdG90YWxfc2l6ZSkKIAlURVNUX0FT
U0VSVCghcmV0LCAibXVubWFwKCkgc2hvdWxkIHN1Y2NlZWQuIik7CiB9CiAKLSNkZWZpbmUgVEVT
VF9SRVFVSVJFX05VTUFfTVVMVElQTEVfTk9ERVMoKQlcCi0JVEVTVF9SRVFVSVJFKG51bWFfYXZh
aWxhYmxlKCkgIT0gLTEgJiYgbnVtYV9tYXhfbm9kZSgpID49IDEpCi0KIHN0YXRpYyB2b2lkIHRl
c3RfbWJpbmQoaW50IGZkLCBzaXplX3QgcGFnZV9zaXplLCBzaXplX3QgdG90YWxfc2l6ZSkKIHsK
IAl1bnNpZ25lZCBsb25nIG5vZGVtYXNrID0gMTsgLyogbmlkOiAwICovCkBAIC04Nyw3ICs4Miw4
IEBAIHN0YXRpYyB2b2lkIHRlc3RfbWJpbmQoaW50IGZkLCBzaXplX3QgcGFnZV9zaXplLCBzaXpl
X3QgdG90YWxfc2l6ZSkKIAljaGFyICptZW07CiAJaW50IHJldDsKIAotCVRFU1RfUkVRVUlSRV9O
VU1BX01VTFRJUExFX05PREVTKCk7CisJaWYgKCFpc19tdWx0aV9udW1hX25vZGVfc3lzdGVtKCkp
CisJCXJldHVybjsKIAogCW1lbSA9IG1tYXAoTlVMTCwgdG90YWxfc2l6ZSwgUFJPVF9SRUFEIHwg
UFJPVF9XUklURSwgTUFQX1NIQVJFRCwgZmQsIDApOwogCVRFU1RfQVNTRVJUKG1lbSAhPSBNQVBf
RkFJTEVELCAibW1hcCBmb3IgbWJpbmQgdGVzdCBzaG91bGQgc3VjY2VlZCIpOwpAQCAtMTM2LDcg
KzEzMiw4IEBAIHN0YXRpYyB2b2lkIHRlc3RfbnVtYV9hbGxvY2F0aW9uKGludCBmZCwgc2l6ZV90
IHBhZ2Vfc2l6ZSwgc2l6ZV90IHRvdGFsX3NpemUpCiAJY2hhciAqbWVtOwogCWludCByZXQsIGk7
CiAKLQlURVNUX1JFUVVJUkVfTlVNQV9NVUxUSVBMRV9OT0RFUygpOworCWlmICghaXNfbXVsdGlf
bnVtYV9ub2RlX3N5c3RlbSgpKQorCQlyZXR1cm47CiAKIAkvKiBDbGVhbiBzbGF0ZTogZGVhbGxv
Y2F0ZSBhbGwgZmlsZSBzcGFjZSwgaWYgYW55ICovCiAJcmV0ID0gZmFsbG9jYXRlKGZkLCBGQUxM
T0NfRkxfUFVOQ0hfSE9MRSB8IEZBTExPQ19GTF9LRUVQX1NJWkUsIDAsIHRvdGFsX3NpemUpOwpk
aWZmIC0tZ2l0IGEvdG9vbHMvdGVzdGluZy9zZWxmdGVzdHMva3ZtL2luY2x1ZGUva3ZtX3V0aWwu
aCBiL3Rvb2xzL3Rlc3Rpbmcvc2VsZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsLmgKaW5kZXgg
MjNhNTA2ZDdlY2EzLi5iYTRjMzE2ZjRmZWYgMTAwNjQ0Ci0tLSBhL3Rvb2xzL3Rlc3Rpbmcvc2Vs
ZnRlc3RzL2t2bS9pbmNsdWRlL2t2bV91dGlsLmgKKysrIGIvdG9vbHMvdGVzdGluZy9zZWxmdGVz
dHMva3ZtL2luY2x1ZGUva3ZtX3V0aWwuaApAQCAtMTIsNiArMTIsNyBAQAogI2luY2x1ZGUgImxp
bnV4L2xpc3QuaCIKICNpbmNsdWRlIDxsaW51eC9rZXJuZWwuaD4KICNpbmNsdWRlIDxsaW51eC9r
dm0uaD4KKyNpbmNsdWRlIDxsaW51eC9tZW1wb2xpY3kuaD4KICNpbmNsdWRlICJsaW51eC9yYnRy
ZWUuaCIKICNpbmNsdWRlIDxsaW51eC90eXBlcy5oPgogCkBAIC0yMCw2ICsyMSw3IEBACiAKICNp
bmNsdWRlIDxzeXMvZXZlbnRmZC5oPgogI2luY2x1ZGUgPHN5cy9pb2N0bC5oPgorI2luY2x1ZGUg
PHN5cy9zeXNjYWxsLmg+CiAKICNpbmNsdWRlIDxwdGhyZWFkLmg+CiAKQEAgLTYzMyw2ICs2MzUs
NTAgQEAgc3RhdGljIGlubGluZSBib29sIGlzX3NtdF9vbih2b2lkKQogCXJldHVybiBmYWxzZTsK
IH0KIAorI2luY2x1ZGUgPGRpcmVudC5oPgorc3RhdGljIGludCBudW1hX21heF9ub2RlKHZvaWQp
Cit7CisJRElSICpkOworCXN0cnVjdCBkaXJlbnQgKmRlOworCWludCBtYXhfbm9kZSA9IDA7CisK
KwlkID0gb3BlbmRpcigiL3N5cy9kZXZpY2VzL3N5c3RlbS9ub2RlIik7CisJaWYgKCFkKSB7CisJ
CS8qIE5vIE5VTUEgc3VwcG9ydCBvciBubyBub2RlcyBmb3VuZCwgYXNzdW1lIHNpbmdsZSBub2Rl
ICovCisJCXJldHVybiAwOworCX0KKworCXdoaWxlICgoZGUgPSByZWFkZGlyKGQpKSAhPSBOVUxM
KSB7CisJCWludCBub2RlX2lkOworCQljaGFyICplbmRwdHI7CisKKwkJaWYgKHN0cm5jbXAoZGUt
PmRfbmFtZSwgIm5vZGUiLCA0KSAhPSAwKQorCQkJY29udGludWU7CisKKwkJbm9kZV9pZCA9IHN0
cnRvbChkZS0+ZF9uYW1lICsgNCwgJmVuZHB0ciwgMTApOworCQlpZiAoKmVuZHB0ciAhPSAnXDAn
KQorCQkJY29udGludWU7CisKKwkJaWYgKG5vZGVfaWQgPiBtYXhfbm9kZSkKKwkJCW1heF9ub2Rl
ID0gbm9kZV9pZDsKKwl9CisJY2xvc2VkaXIoZCk7CisKKwlyZXR1cm4gbWF4X25vZGU7Cit9CisK
K3N0YXRpYyBpbnQgbnVtYV9hdmFpbGFibGUodm9pZCkKK3sKKwlpZiAoc3lzY2FsbChfX05SX2dl
dF9tZW1wb2xpY3ksIE5VTEwsIE5VTEwsIDAsIDAsIDApIDwgMCAmJiAoZXJybm8gPT0gRU5PU1lT
IHx8IGVycm5vID09IEVQRVJNKSkKKwkJcmV0dXJuIC0xOworCXJldHVybiAwOworfQorCitzdGF0
aWMgaW5saW5lIGJvb2wgaXNfbXVsdGlfbnVtYV9ub2RlX3N5c3RlbSh2b2lkKQoreworCXJldHVy
biBudW1hX2F2YWlsYWJsZSgpICE9IC0xICYmIG51bWFfbWF4X25vZGUoKSA+PSAxOworfQorCiB2
b2lkIHZtX2NyZWF0ZV9pcnFjaGlwKHN0cnVjdCBrdm1fdm0gKnZtKTsKIAogc3RhdGljIGlubGlu
ZSBpbnQgX192bV9jcmVhdGVfZ3Vlc3RfbWVtZmQoc3RydWN0IGt2bV92bSAqdm0sIHVpbnQ2NF90
IHNpemUsCgoKCgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2ZWxAbGlzdHMu
c291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xpc3RzL2xpc3Rp
bmZvL2xpbnV4LWYyZnMtZGV2ZWwK
