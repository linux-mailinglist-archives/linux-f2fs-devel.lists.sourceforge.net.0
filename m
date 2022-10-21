Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D2BF6072F3
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 10:53:49 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olnmj-0007M6-TH;
	Fri, 21 Oct 2022 08:53:45 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Luben.Tuikov@amd.com>) id 1olnmC-0007Lj-57
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:53:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=8tgJbDECy1xY+raNOW2piIhcXYjWuQC+Pyq127+CAqg=; b=RrEW6kv+rvikmRjJORWdjj3yZ4
 Qm5VqRn1Scuce1rHlVNf3lgulv/dMdb9qIG4gT01Xq+z80C9cFejmgwmIdrBUzEiFw2v5Px0DRLSJ
 pCJdIUZvLdgUc5SD+gU0yr+jzgKdjzDwb8hcctk9apjXANABUrE7HMCT3omN/BFHJ18Q=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=8tgJbDECy1xY+raNOW2piIhcXYjWuQC+Pyq127+CAqg=; b=BiHyCjaRUWGQy8GyNpH7c1LbLK
 7XkarzMd50Iyu9JXt4vybbMVHUrmMl1jvpG/05MqHhSMWYyTZ9mcIx+JwXQ1aMF/TSvdGQofkw3Fo
 TRj9F8ZoOZh5trooJH3F/7xxMNu0btWi6ak6P3sFOc9i6MiCN9rHdgXzXI0T+REqVvxk=;
Received: from mail-co1nam11on2085.outbound.protection.outlook.com
 ([40.107.220.85] helo=NAM11-CO1-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olnm5-00C5xM-DU for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 08:53:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Px6XYnBqhpU1/Nyy6U9ykVTKqHY2mTE3tMI+xsrwspUKeXBjvFBqiaEXkrX52c1X1QZMn3+n8AJDCxwHuKsJ3QA801wQHhxDA4YmY3USPcygzmi2UhhHUby/7wah+B52eSPSAxmhY4dPyHp154UK8SnBBCBpPcuzRQ3tM5FGA0a5B6SJ3Sefiyv8xrCNhB9mtp1EhWUw5RdCVlWlRRJvXDrd+Fmv4j+vVI9B4BoKkoHb8XTk0Oq5ouQVXYs/wBxJTrwDQtXJ+qkKs817ibpQxmXxY5nfzr5BEs6zb6MKBbQjR4UroI49o54Fn4LwdIfXPMW1GL7yZ1/iSGh33Mxxtg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8tgJbDECy1xY+raNOW2piIhcXYjWuQC+Pyq127+CAqg=;
 b=fJcFq+b9F3odM9dXa1Ko7Dbvhr46PoLuLX577NEIT1QXRe+ngyGJn7DX0Sxjt0J3JgqXqeslyvFhSjKF1S755WTTc0Ef3Mh+IJXYJPV5jxkJ21NU6RrXeNr4E/RxflMD5KmDAS653gICLKzDvSAHiLjk+WXptIFvUbf3c3Wczziq4RTx1aRc26kxUfneETHGw1ZwL6nrhi6wGk+P9zeLN7b5LcsB1jvOjp1/CQsBYMDJcDaWI7czWMrYvUrLEOTwT67WvwPJCtOoWab1ekGMIMX1u61clSUfY/UXZ9d2MHpBvBJf3j0s7yx3G4tGB7KPIbHtZGzxz7OZiIXQqVE8Qg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8tgJbDECy1xY+raNOW2piIhcXYjWuQC+Pyq127+CAqg=;
 b=aS5L/YiHt+BVLXemKUlcQUXysD8R/la2eYB30LBoC5+YNne6DDbtD5AQvCKQjKxnqdpj0ZrsUt/cS+AHnbQYIy9zYDlfGyZS9JuU3z84GmawXY0H4eSxLobkVy8cqPDg80CW0lo97rbZ3czkbwqAAZSifT5cnTGYJXfP7i5zEi4=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 DM4PR12MB5215.namprd12.prod.outlook.com (2603:10b6:5:397::21) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.35; Fri, 21 Oct 2022 08:52:56 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 08:52:56 +0000
Message-ID: <1c150db1-dc49-e3b0-4dca-f1427a180e4b@amd.com>
Date: Fri, 21 Oct 2022 04:52:53 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-CA
To: Greg KH <gregkh@linuxfoundation.org>,
 Yang Yingliang <yangyingliang@huawei.com>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
In-Reply-To: <Y1JZ9IUPL6jZIQ8E@kroah.com>
X-ClientProxiedBy: YT3PR01CA0036.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:82::35) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|DM4PR12MB5215:EE_
X-MS-Office365-Filtering-Correlation-Id: c35ac337-61fd-4e8a-9c78-08dab341a5c2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: s2nLFrbuhJHsKhSgpZ7C/fUA3n6j6d/EHHwT+HVUXO4Q1zUKhWelW6H39+RTAjQeAkD9ayjMdsrZ5kBLak/Gkuy6MxeXEEgsJZRIKSFTwbJJN8PUYt8VgPa1e9fdqX6VVAX7EirXley62g7KQIGpqGdVyYUThEtezm1LRUyzA97mPtLjwBhtQgNKBuFRLvmj6abTCjclR19p6tU+0zqphvGP007LJ1YJYTGk7JdG1cm9h39gpXZ1taXU0uVwOpYQlFAHU7rTyjP7aNqJriKS7E8tCoeRh/eWh/yoeagCGl2la7+42shG5Gbx8KnJi9msayN4SXoWD/15xiW4cj+nnRQmWJiJ03n4Eg4PBTYAta9M5osqJAhV+BOc1M8NxQKNUFAHMsE3cEnMenKKRmptFP8H8tjNJ5aaoBvvtvW7N3rMpXAkQ3c3KoIwQ/HJU0CrlpVH2hCaWmK1cbxuXkIVwdAeqpBYVs4deiUwkj7JlhVcl6tM6nqAFHYN4aTTMygu5Av6PaWzvrK1jWv+U/qODhPKHRIg6sg/Lv2PjWLH2wxCk28DsYDFlzmpnq0encVgLRmJA+rx/REvSOSdyB1M2BDdEynC+CQI20VCBYDrEVLOEVgg2UUphEK4s8LfklsULxLp1IeT2MGAXklK0WUOtLZqA5cuzzBJSJAxOtY/x9qZJwV+59TyT/BBEOQC3I/VPlKF+FgO8g4FpmuIZZTaXS0Nwnh6AnoqaVUznlCYJoFPJ2dSApnsKvnb6oy0io6ppXZflnKfG/f6YPb05mq5U6S2pAjrUnw7GOjN7FZxqdYRpQUGj1NasM1CrK0n9K2o
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(39860400002)(366004)(346002)(136003)(376002)(396003)(451199015)(26005)(66899015)(4326008)(8676002)(41300700001)(38100700002)(6512007)(86362001)(6506007)(966005)(53546011)(8936002)(31696002)(6486002)(36756003)(316002)(4001150100001)(66476007)(66946007)(31686004)(2906002)(66556008)(110136005)(478600001)(186003)(7416002)(5660300002)(2616005)(44832011)(45080400002)(6666004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?eGtnZXUvUEkrQmE3cm9nMVl6TTlxT1RVN245SElTVVF3T0lXSEpJcHkwL2Vi?=
 =?utf-8?B?UXhvOFcyYTlNcHcra1c1K1cyUDJrcTUwT08zRDRpbmZKalI5aEVYak5aU3Ji?=
 =?utf-8?B?QmFjTmg0dkRQZmdSQTZha2hsTlhValM1TnJMdWxrcm5vL2dVc1VLVnQ3VFJ5?=
 =?utf-8?B?bWJjRlpxZ0tlL3l2QzNGQ1QzQzE1S2pPQWRqR1RsTHZ1cE0raFJxeUZSZDRH?=
 =?utf-8?B?NDdCRkJmZUpzQlBZei9RRFhyOHA2cW42bERtSzU1T2JHc29aNU9rQ0xsdVBu?=
 =?utf-8?B?V3liSGdPT1RRM3E1eERlVTVqbjBGbWVEcW5janArYURIN1JqUzFCU3Zmcmx6?=
 =?utf-8?B?c1B0cm91MURyaklxWnZYT2FWODhTZ1JRVCtwS3JHTjZ5UDdsRUpnTTA2cGZY?=
 =?utf-8?B?VXhXekNDcFFPSkR2dit6MFZOTW44MXdDUmF3Z1ZCUGg5NkNoY1Z5UVdnRVNI?=
 =?utf-8?B?WjUzVFpVcnhlWkpwdWVRcktscHhHZUtTeVNlRWdlVGI4eTgvaEtFdS9BRmp4?=
 =?utf-8?B?ZFMrUDl3UEd0bnJ2TDNmQzN5ZkhSZEtTVjF3QUgyK1RXNkJmdUloSTgxTUZt?=
 =?utf-8?B?SGJuYmR2YjdMT1NJN0tsVmtvSmVtb1lqR2taUDNwSmgvWkx3Q2JURnMxRDlv?=
 =?utf-8?B?ajlZVC9EalVUZ29mV0YzTmt0ckc2ek1HR2NsenR1SzV5UHEyUWZEOXpPVkRs?=
 =?utf-8?B?UTN1eXYxOWRmeEpheWdSUGxJemdIMXBZZTEzcEZTeVZybzZTQjg5UjR0blZ5?=
 =?utf-8?B?T1NoSmhyckFJSGtPa3o0R2lBYVZzd21rc2NkYU91SGErLzNnTW0vUVF0NTQ2?=
 =?utf-8?B?Y0xZcDdSRytKMlFnZDhyNmRqUDFmT3FkVHdHeEpvZlFKSU1DcmRoOFhLaWU2?=
 =?utf-8?B?c3FBZEM4VWNpaSt5L1UyS1ZLeUgyT1pIVWdJU1NoK0hkVlZRV2NiQXBkY2JT?=
 =?utf-8?B?VEVrc0JOUWdONi8zMU1hOStKaytmblBmMklsV0dYbERhSHFIUldIRkxzZDRx?=
 =?utf-8?B?dWtSNGVQQVdIS1g3SHZvaVBBZ2N2b290OFZOWTRJRkFOMldJY2lSbC9Lc25D?=
 =?utf-8?B?Y2hZTjVCWjhSb3Y3ZzhsYUswUGEvSjFtSGZnNnVjbkdJcDEzN1lxaHFVMEpY?=
 =?utf-8?B?bS9UUlptZzd4TXI0dnBxaU1hcUpzR2Fxa0VYSzRKRCtqNys1Ti85Sk05anBV?=
 =?utf-8?B?cm9aa0VjaldSRWtYclZhVnd4ZmxWK1daeStweDE4djI1SUpLMk8zMDVRUHpI?=
 =?utf-8?B?VGp6eXdPNkxIQllqcXV4M3VoYnMvWVZFVkhxUVVDOU1HRXBFVnBVNkYvWldi?=
 =?utf-8?B?Nm1jUWJ1ZTNOcHMyQ1ltbXRlQlYyc3I4ZkZPZkJ6bndsTEwwbjlyNVJYbERL?=
 =?utf-8?B?eWJtcU4xcVRBT2dVTVZSNjJTZTh0SGpNL0xHMmY4N29vS0ViWXp0eUt3TUhn?=
 =?utf-8?B?ZnBTUU1zYkhrdVUwQnJ2WERSeUVCNkVYN1JmS3BZNmYvdXhjR29ZQ29RQmtG?=
 =?utf-8?B?aWIwQUhjZXBocmt5WnRpc0E3cU9iTThHL0tFTE5ycllWMnh4SE9RcFdlOWRJ?=
 =?utf-8?B?dkpwZ3dhaGRBNVpZMkZQT1NkU0lOcFRUOTA2ZWQ0aVNxUDErelhWK1NTaEc4?=
 =?utf-8?B?MWgxOW5ZV2RodVEweUt6UFhqU1Flc0VPanl3V2RtWXNKQ0JJcThaOU9qMlV5?=
 =?utf-8?B?R1oyMjNFN05HbzJReUxIcCsrd3RLZ0NIK2VhaVR1MWR4aFBzNTh5ckNjcGRY?=
 =?utf-8?B?MVp1dUJPYWFiTjNuT08rUVAyd05tQmpUZDFZd1lYMWljSStUdnpTQ29UcVNJ?=
 =?utf-8?B?YitMQWVzRHltNTZaVnc2QnA1dGJLSmIwR21zY1FFeVhIVENFMjlCdFBBZ1lT?=
 =?utf-8?B?Qnd0K1VJcDBiUFp6N2svQk5XNnVhb2FhZVQ3dWNKalllem1IRExxeXk0N3pR?=
 =?utf-8?B?Q1FFYjNlUVF3UW5VYUQ1WHRBN29xWlNOMHNCZDFHMTIxcUJDNFNkejNTdStT?=
 =?utf-8?B?dEdkVWFOUHZoQit2V3ZhdHRZOWFWdEN4YUliRFJqMSszZTAzdlE2VGd0am91?=
 =?utf-8?B?Ryt4VW4xL3c2eWJJQ0JPUkFIM2VaUHFacW9FRUZxTXZtMGFZR0dza2dOc0J1?=
 =?utf-8?Q?uSEokRlrA5NJ8Otkiic9IY7Of?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c35ac337-61fd-4e8a-9c78-08dab341a5c2
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:52:56.3462 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XSzjlRoWN73eufyNO9FEyRxUfRhlplZ4QvI49ZCld/3HcNILECOnKYpicxvYAJx6
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR12MB5215
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-21 04:36, Greg KH wrote: > On Fri, Oct 21, 2022
 at 04:24:23PM +0800, Yang Yingliang wrote: >> >> On 2022/10/21 13:37, Greg
 KH wrote: >>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuik [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.220.85 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.220.85 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olnm5-00C5xM-DU
Subject: Re: [f2fs-dev] [PATCH 00/11] fix memory leak while kset_register()
 fails
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
From: Luben Tuikov via Linux-f2fs-devel
 <linux-f2fs-devel@lists.sourceforge.net>
Reply-To: Luben Tuikov <luben.tuikov@amd.com>
Cc: rafael@kernel.org, qemu-devel@nongnu.org, richard@nod.at, somlo@cmu.edu,
 mst@redhat.com, linux-kernel@vger.kernel.org, amd-gfx@lists.freedesktop.org,
 linux-f2fs-devel@lists.sourceforge.net, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, jlbec@evilplan.org,
 hsiangkao@linux.alibaba.com, alexander.deucher@amd.com, jaegeuk@kernel.org,
 akpm@linux-foundation.org, linux-erofs@lists.ozlabs.org, mark@fasheh.com,
 ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gMjAyMi0xMC0yMSAwNDozNiwgR3JlZyBLSCB3cm90ZToKPiBPbiBGcmksIE9jdCAyMSwgMjAy
MiBhdCAwNDoyNDoyM1BNICswODAwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToKPj4KPj4gT24gMjAy
Mi8xMC8yMSAxMzozNywgR3JlZyBLSCB3cm90ZToKPj4+IE9uIEZyaSwgT2N0IDIxLCAyMDIyIGF0
IDAxOjI5OjMxQU0gLTA0MDAsIEx1YmVuIFR1aWtvdiB3cm90ZToKPj4+PiBPbiAyMDIyLTEwLTIw
IDIyOjIwLCBZYW5nIFlpbmdsaWFuZyB3cm90ZToKPj4+Pj4gVGhlIHByZXZpb3VzIGRpc2N1c3Np
b24gbGluazoKPj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5vdXRsb29r
LmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGbG9yZS5rZXJuZWwub3JnJTJGbGttbCUyRjBkYjQ4NmVi
LTY5MjctOTI3ZS0zNjI5LTk1OGY4ZjIxMTE5NCU0MGh1YXdlaS5jb20lMkZUJTJGJmFtcDtkYXRh
PTA1JTdDMDElN0NsdWJlbi50dWlrb3YlNDBhbWQuY29tJTdDYTgyMDZmOTM0OGUwNGIxM2UzZGEw
OGRhYjMzZjRmNTMlN0MzZGQ4OTYxZmU0ODg0ZTYwOGUxMWE4MmQ5OTRlMTgzZCU3QzAlN0MwJTdD
NjM4MDE5MzgxNzM4NDA2OTQyJTdDVW5rbm93biU3Q1RXRnBiR1pzYjNkOGV5SldJam9pTUM0d0xq
QXdNREFpTENKUUlqb2lWMmx1TXpJaUxDSkJUaUk2SWsxaGFXd2lMQ0pYVkNJNk1uMCUzRCU3QzMw
MDAlN0MlN0MlN0MmYW1wO3NkYXRhPUhxdkYxcDRlakY2JTJCWVM1dTBwZTE1WmREZ1VBSVZQJTJC
QjF4UVhJQ1dqTndZJTNEJmFtcDtyZXNlcnZlZD0wCj4+Pj4gVGhlIHZlcnkgZmlyc3QgZGlzY3Vz
c2lvbiBvbiB0aGlzIHdhcyBoZXJlOgo+Pj4+Cj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3Mu
cHJvdGVjdGlvbi5vdXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3LnNwaW5pY3MubmV0
JTJGbGlzdHMlMkZkcmktZGV2ZWwlMkZtc2czNjgwNzcuaHRtbCZhbXA7ZGF0YT0wNSU3QzAxJTdD
bHViZW4udHVpa292JTQwYW1kLmNvbSU3Q2E4MjA2ZjkzNDhlMDRiMTNlM2RhMDhkYWIzM2Y0ZjUz
JTdDM2RkODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzODAxOTM4MTcz
ODQwNjk0MiU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJ
am9pVjJsdU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdD
JmFtcDtzZGF0YT1MbVJnV1VTUWdLNndKdk1kZkJnak80Q2lhS1EyVEJvZVc4MzZyMFViY2pVJTNE
JmFtcDtyZXNlcnZlZD0wCj4+Pj4KPj4+PiBQbGVhc2UgdXNlIHRoaXMgbGluaywgYW5kIG5vdCB0
aGUgdGhhdCBvbmUgdXAgdGhlcmUgeW91IHdoaWNoIHF1b3RlZCBhYm92ZSwKPj4+PiBhbmQgd2hv
c2UgY29tbWl0IGRlc2NyaXB0aW9uIGlzIHRha2VuIHZlcmJhdGltIGZyb20gdGhlIHRoaXMgbGlu
ay4KPj4+Pgo+Pj4+PiBrc2V0X3JlZ2lzdGVyKCkgaXMgY3VycmVudGx5IHVzZWQgaW4gc29tZSBw
bGFjZXMgd2l0aG91dCBjYWxsaW5nCj4+Pj4+IGtzZXRfcHV0KCkgaW4gZXJyb3IgcGF0aCwgYmVj
YXVzZSB0aGUgY2FsbGVycyB0aGluayBpdCBzaG91bGQgYmUKPj4+Pj4ga3NldCBpbnRlcm5hbCB0
aGluZyB0byBkbywgYnV0IHRoZSBkcml2ZXIgY29yZSBjYW4gbm90IGtub3cgd2hhdAo+Pj4+PiBj
YWxsZXIgZG9pbmcgd2l0aCB0aGF0IG1lbW9yeSBhdCB0aW1lcy4gVGhlIG1lbW9yeSBjb3VsZCBi
ZSBmcmVlZAo+Pj4+PiBib3RoIGluIGtzZXRfcHV0KCkgYW5kIGVycm9yIHBhdGggb2YgY2FsbGVy
LCBpZiBpdCBpcyBjYWxsZWQgaW4KPj4+Pj4ga3NldF9yZWdpc3RlcigpLgo+Pj4+IEFzIEkgZXhw
bGFpbmVkIGluIHRoZSBsaW5rIGFib3ZlLCB0aGUgcmVhc29uIHRoZXJlJ3MKPj4+PiBhIG1lbW9y
eSBsZWFrIGlzIHRoYXQgb25lIGNhbm5vdCBjYWxsIGtzZXRfcmVnaXN0ZXIoKSB3aXRob3V0Cj4+
Pj4gdGhlIGtzZXQtPmtvYmoubmFtZSBiZWluZyBzZXQtLWtvYmpfYWRkX2ludGVybmFsKCkgcmV0
dXJucyAtRUlOVkFMLAo+Pj4+IGluIHRoaXMgY2FzZSwgaS5lLiBrc2V0X3JlZ2lzdGVyKCkgZmFp
bHMgd2l0aCAtRUlOVkFMLgo+Pj4+Cj4+Pj4gVGh1cywgdGhlIG1vc3QgY29tbW9uIHVzYWdlIGlz
IHNvbWV0aGluZyBsaWtlIHRoaXM6Cj4+Pj4KPj4+PiAJa29ial9zZXRfbmFtZSgma3NldC0+a29i
aiwgZm9ybWF0LCAuLi4pOwo+Pj4+IAlrc2V0LT5rb2JqLmtzZXQgPSBwYXJlbnRfa3NldDsKPj4+
PiAJa3NldC0+a29iai5rdHlwZSA9IGt0eXBlOwo+Pj4+IAlyZXMgPSBrc2V0X3JlZ2lzdGVyKGtz
ZXQpOwo+Pj4+Cj4+Pj4gU28sIHdoYXQgaXMgYmVpbmcgbGVha2VkLCBpcyB0aGUgbWVtb3J5IGFs
bG9jYXRlZCBpbiBrb2JqX3NldF9uYW1lKCksCj4+Pj4gYnkgdGhlIGNvbW1vbiBpZGlvbSBzaG93
biBhYm92ZS4gVGhpcyBuZWVkcyB0byBiZSBtZW50aW9uZWQgaW4KPj4+PiB0aGUgZG9jdW1lbnRh
dGlvbiwgYXQgbGVhc3QsIGluIGNhc2UsIGluIHRoZSBmdXR1cmUgdGhpcyBpcyBhYnNvbHZlZAo+
Pj4+IGluIGtzZXRfcmVnaXN0ZXIoKSByZWRlc2lnbiwgZXRjLgo+Pj4gQmFzZWQgb24gdGhpcywg
Y2FuIGtzZXRfcmVnaXN0ZXIoKSBqdXN0IGNsZWFuIHVwIGZyb20gaXRzZWxmIHdoZW4gYW4KPj4+
IGVycm9yIGhhcHBlbnM/ICBJZGVhbGx5IHRoYXQgd291bGQgYmUgdGhlIGNhc2UsIGFzIHRoZSBv
ZGRzIG9mIGEga3NldAo+Pj4gYmVpbmcgZW1iZWRkZWQgaW4gYSBsYXJnZXIgc3RydWN0dXJlIGlz
IHByb2JhYmx5IHNsaW0sIGJ1dCB3ZSB3b3VsZCBoYXZlCj4+PiB0byBzZWFyY2ggdGhlIHRyZWUg
dG8gbWFrZSBzdXJlLgo+PiBJIGhhdmUgc2VhcmNoIHRoZSB3aG9sZSB0cmVlLCB0aGUga3NldCB1
c2VkIGluIGJ1c19yZWdpc3RlcigpIC0gcGF0Y2ggIzMsCj4+IGtzZXRfY3JlYXRlX2FuZF9hZGQo
KSAtIHBhdGNoICM0Cj4+IF9fY2xhc3NfcmVnaXN0ZXIoKSAtIHBhdGNoICM1LMKgIGZ3X2NmZ19i
dWlsZF9zeW1saW5rKCkgLSBwYXRjaCAjNiBhbmQKPj4gYW1kZ3B1X2Rpc2NvdmVyeS5jIC0gcGF0
Y2ggIzEwCj4+IGlzIGVtYmVkZGVkIGluIGEgbGFyZ2VyIHN0cnVjdHVyZS4gSW4gdGhlc2UgY2Fz
ZXMsIHdlIGNhbiBub3QgY2FsbAo+PiBrc2V0X3B1dCgpIGluIGVycm9yIHBhdGggaW4ga3NldF9y
ZWdpc3RlcigpCj4gCj4gWWVzIHlvdSBjYW4gYXMgdGhlIGtvYmplY3QgaW4gdGhlIGtzZXQgc2hv
dWxkIE5PVCBiZSBjb250cm9saW5nIHRoZQo+IGxpZmVzcGFuIG9mIHRob3NlIGxhcmdlciBvYmpl
Y3RzLgo+IAo+IElmIGl0IGlzLCBwbGVhc2UgcG9pbnQgb3V0IHRoZSBjYWxsIGNoYWluIGhlcmUg
YXMgSSBkb24ndCB0aGluayB0aGF0Cj4gc2hvdWxkIGJlIHBvc3NpYmxlLgoKV0xPRywgSSBiZWxp
ZXZlIGl0IGlzIHNvbWV0aGluZyBsaWtlIHRoaXM6CgoJeCA9IGt6YWxsb2MoKTsKCglrb2JqZWN0
X3NldF9uYW1lKCZ4LT5rc2V0LmtvYmosIGZvcm1hdCwgLi4uKTsKCXgtPmtzZXQua29iai5rc2V0
ID0gcGFyZW50X2tzZXQ7Cgl4LT5rc2V0LmtvYmoua3R5cGUgPSB0aGlzX2t0eXBlOyAgLyogdGhp
cyBoYXMgYSAucmVsZWFzZSB3aGljaCBmcmVlcyB4ICovCglyZXMgPSBrc2V0X3JlZ2lzdGVyKCZ4
LT5rc2V0KTsKCWlmIChyZXMpIHsKCQlrc2V0X3B1dCgmeC0+a3NldCk7ICAgICAgIC8qIGNhbGxz
IHRoaXNfa3R5cGUtPnJlbGVhc2UoKSB3aGljaCBmcmVlcyB4ICovIAoJCWtmcmVlKHgpOyAgICAg
ICAgICAgICAgICAgLyogPC0tIGRvdWJsZSBmcmVlICovCgl9CgpBbmQgc2luY2Uga3JlZiBpcyBz
ZXQgdG8gMSwgaW4ga3NldF9yZWdpc3RlcigpLCB0aGVuIHdlJ2QgZG91YmxlIGZyZWUuClRoaXMg
aXMgd2h5IEkgZG9uJ3QgaGF2ZSBrc2V0X3B1dCgpIGluIHRoYXQgZXJyb3IgcGF0aCBpbiBhbWRn
cHUuCgpSZWdhcmRzLApMdWJlbgoKCl9fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fCkxpbnV4LWYyZnMtZGV2ZWwgbWFpbGluZyBsaXN0CkxpbnV4LWYyZnMtZGV2
ZWxAbGlzdHMuc291cmNlZm9yZ2UubmV0Cmh0dHBzOi8vbGlzdHMuc291cmNlZm9yZ2UubmV0L2xp
c3RzL2xpc3RpbmZvL2xpbnV4LWYyZnMtZGV2ZWwK
