Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id A287F60822B
	for <lists+linux-f2fs-devel@lfdr.de>; Sat, 22 Oct 2022 01:45:58 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1om1i4-0001eX-3u;
	Fri, 21 Oct 2022 23:45:52 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Luben.Tuikov@amd.com>) id 1om1i2-0001eR-Hr
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 23:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:From:References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=bpGBa9Rr4uN64ok9iDDV/hFbcVrvfG/84EdVCW/8ySE=; b=aReDFRM5ZhbO9GE8QBZWeHzL6G
 NpXGUmGbDzhpsUZl7tzymkyztE9t2eVwT4ubQw+Se1o/kLIN8YN6HTaYKvNa3nqIjMwDcrpDKunOh
 VAxBoSmIvy5pKDXLB60C9HaaHjdkMouPuX1LUSa+mSAY2/DI3U0zCRYhosjyr1Yr/AHk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
 References:Cc:To:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=bpGBa9Rr4uN64ok9iDDV/hFbcVrvfG/84EdVCW/8ySE=; b=AkG5yy/7AMXdFX4zXe/CI6h9k8
 WT8GZqNUwOZYKpb8mNdA8pLl/9DMVYKZYbcDkKzysqr5UFYtfXwbRjVRGmpmmJtDF9XtW5VNDX3Or
 AfikxI8YV5kfwihBQ3lKu2M152orozwczX4v4vhEOJKXY0R8FcgZStxTDUVIogKC95yQ=;
Received: from mail-bn7nam10on2057.outbound.protection.outlook.com
 ([40.107.92.57] helo=NAM10-BN7-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1om1hp-00CrMc-3C for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 23:45:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IfgLgnrqxfnApVTN7pcxZUGWZSXDqaoJTvcG+gjlQkk/1NS7C8CtLbjEVyO14kXX78rp6uc7yNuWYwLO4bpZqrsOpMQHgUiMzZU+VHpLvmP/nHmX69RI4vEsgxUptZyadYqfZe7iambjMJUbAuR0wSV/hQs/Au32szORymPZNLs8eyOXqz9GS4YQryw/LKw7wHOUb2jOms64nPwUL1c4wNcyaoNxOZYozfyFjMUP+hhV0RvsFpW/mv2yMDhPFHk8xFmvAHjfF97UEyGv/tjTV0mFpzhZWbyydNruRxXuW5edu7G/pjFPS2FAkGdZnvSSEBVjEkxWC4dZP+LWzN9Mag==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=bpGBa9Rr4uN64ok9iDDV/hFbcVrvfG/84EdVCW/8ySE=;
 b=Tc0WAeDHHAlh3ldQuKqNVdkW8Poac3KPtya50OFkSwsely9fRfTpw94y7+JEWxv6BY7nWTsLvhhKT9ZvC/I4BtLSKjZRv8KORPhuoMMCiNTw1KV2q4oWwssfkI+ibffqh4iNVZT3QYa6sk42jFXdoXcCLnqVlPJIzSoNJL6R2o5Mj8iefkxyCByP6wPnGS1RCiImCifStV5yWBD3x6NEncH0ye5eD0WKmnseY127cHRt0uiCOXy8SiOEKYE+IBCdvKvDwRqB3lgdZrXBXnVDMYyQsJ1SrRGkZs5hha+i/ahvXb8aVjCO4/kIX5hjQsW8VREXggNjiFn6WtyHrNrkRQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=bpGBa9Rr4uN64ok9iDDV/hFbcVrvfG/84EdVCW/8ySE=;
 b=sikIsTSBPprQEYv/TS0i4n0ua5kGE0zSmdDFvSK1RTZ9FRcYZDstf8IurKTL9wdIPjwhlu5NsJzL0Rozqf8GQJooc8/JvY0jMHUpdwpkijVLpBzEabO13bTo5Bw4QSiOoVckclNdr7GpGQF/okgsUj2h9Ceiy08PPMY+LVXWzQ8=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 MW5PR12MB5650.namprd12.prod.outlook.com (2603:10b6:303:19e::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5723.29; Fri, 21 Oct
 2022 23:45:26 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 23:45:26 +0000
Message-ID: <dddec689-c945-a564-3870-b8cebf142323@amd.com>
Date: Fri, 21 Oct 2022 19:45:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <0591e66f-731a-5f81-fc9d-3a6d80516c65@huawei.com>
 <Y1JZ9IUPL6jZIQ8E@kroah.com>
 <f1210e20-d167-26c4-7aba-490d8fb7241e@huawei.com>
 <78f84006-955f-6209-1cae-024e4f199b97@amd.com>
 <9ee10048-f3fe-533b-5f00-8e5dd176808e@huawei.com>
In-Reply-To: <9ee10048-f3fe-533b-5f00-8e5dd176808e@huawei.com>
X-ClientProxiedBy: YT3PR01CA0021.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:86::32) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|MW5PR12MB5650:EE_
X-MS-Office365-Filtering-Correlation-Id: 54580e30-f48c-4ace-142d-08dab3be53f9
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: aGw1DrPLFR4cKWXUAaEcDXP7kewxDGHHsexFg+bcleKM44gaAlIfGy7WDrKTwPi758grxCfL14m28Qfzy1zAFeihOhbCSkTRgYXx451/vS5EpxKSCGKoPYFob1YDAmBBy2hUdXaFJy9du+OqrQ580BGM//1l/PQPwjSO15AYjEI7DQXW8DvpCYA5eQCRwRp2oA1UJV35og8h93wl/LVn0KAsdU/Ch5ZLzMWDbF2IH8/FnjM6EtMn+1XSdMvlaV/4mDnTrP0oFj9EuWyAKOvJjYKcqZMVLai8jVxW7UbKn2XU6kCQI4Qg2bGWDEIpyVKmmZJqBdjxc10eDer4H/WVPC5XFpAhYajU1YPpOADE8XZFmjQ8CaX9ts7ZM6oY1ZHuPoT9FqL/nbXYbzDfasrkByqBiEUaZ5jYGM9DPTO5gK8l9Hk/ao/7ZEw0pD3gvVrbt1QA2MubHmhtqjv3gOE/3ZY2y152uBTOyDiLZKasmc0tONJvUo/omNxiweDwV2TfndKqn1f8+EIoQ/WiMmwWW8h9pPy1pR3GZxgEccgL7jklmS4MGMn+uemyKTUIJF2ErugTZtcu6Bnnh+iYHPorsRXtOMFrYak6IUReOEDdQdPkJxGGFUvfe598C3FWfMhpf5uc2/QbcC6v7ksUSmXGopjeKu88e7BEaIZytmxckU8p+W9cw8gxRRnymlxX3FfUz6zziOZ6NeLmU/ATcfY5oERHUUIrKZJxiedMZRlc/lw2gFjMY5APJeGw9Ev6l9HMEOMRLC/THaeCUb/7V4Tg6+Zx4p4dLThLmUpXkaYqvQgv5T3LBR6i2kEk2dAdx0N+VEDT3/v03YuyyfqilHuLaw==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(136003)(376002)(39860400002)(396003)(346002)(451199015)(6666004)(6486002)(966005)(45080400002)(7416002)(5660300002)(66556008)(41300700001)(478600001)(36756003)(8936002)(4326008)(8676002)(44832011)(316002)(110136005)(66946007)(66476007)(2616005)(6512007)(38100700002)(26005)(6506007)(53546011)(31696002)(186003)(31686004)(2906002)(86362001)(4001150100001)(66899015)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?Q2FWellvK2p6ZmpiRkFPK3Bkc2Y0SVhJbUV6WUlJOEpPQk9uU3E5Z0crVHJU?=
 =?utf-8?B?SzBtZkxZSzI0MjBGYWlGSmNqZ2d1WGlpd0s0VUExcE9Zd084b1J6blg2VW8r?=
 =?utf-8?B?UzFpMEsyRnhPQnRuNnNEMktzdUIwT0p3MmdoZ0xCUGxwdlo2STQvZ2p0bENz?=
 =?utf-8?B?OG5saldyQkg0NTJwaTdPZm5NV1NLZ3RBSlF6eXdSV2FGeGNva0NsRXZaS2ZC?=
 =?utf-8?B?d0Vma3d4WEg3dVEzYlRWQlVIU1VnQUdaclBOU3ZLeWlmN25WelZIaC84WVJY?=
 =?utf-8?B?c2FaaDljK0tTWWJPSEVjR3lhaERrSi9WQk5SOXFRMkRWeTFRR0dXaEtKTGlW?=
 =?utf-8?B?RkdWbzJCY2k0MkkzUVJtTldWV090amhoNEpEcU43b3FMbHQvdW5mQ0lHUjRR?=
 =?utf-8?B?dkJSMFUxb1hxUkg2aVcrcTMxQkdrVVZGU3R3QUppSTdVczIva21ydG9vVWZC?=
 =?utf-8?B?VStkd2M0YUEvL09PVjdKZFFBMndvUGF5blp2ajA5ek50K1JLdDBwN2QyZTN0?=
 =?utf-8?B?MXkwaW1zamkrbk4wNldZLzNuaDdUUkZnRGs4MjZHOUU2akUrVGZCZFpaY1Nw?=
 =?utf-8?B?Y3FGcFk2VHEvOXJoZTBOUzNLYXdjdm1BenVCL1lWajkzVUN0NHl0NXpIdFVl?=
 =?utf-8?B?QWdqUjVFYWlKZzh5YWh2eFVvYXAveldMcm1hVVYxaSt3ZXRFenN1RmErbVhI?=
 =?utf-8?B?b1FNeFgxczJoRnhJc1FkcS9vdW9GTjN5bHA4OW5OVjNnSUViQ0s5YkdPcnJF?=
 =?utf-8?B?UXF5SEJ2TlN5SmZVSXo0OFFjWHpHUzZsU2c5bFgzSk95WlVVYXpERWNGdnB6?=
 =?utf-8?B?dDVmTlJMdVNCRDk0bFZQZWxwa2h2eUNmVFNzOFZrQXFLTGJwc3dMRjZ0RzVv?=
 =?utf-8?B?WStCdFUxeEFIcmRxWXcxNEpCU25NMjJIZ2ExZlVqdUorM3FWYmN2MTRXQjVk?=
 =?utf-8?B?U1hKVnJoVldsZGZwRWRocmVjSEFxakZYT2NuQXdhRTF4OU91YVdIaStldis3?=
 =?utf-8?B?QzBEc1QvM2V6UmJZYjdPdk03NitjMGNtdFVCc3FPN0VSRnJpV3lKbEkrUnZr?=
 =?utf-8?B?MW52anZDUmE2QUxJbjJyMDdsS0xILzI2U3BMQ2gzaTh5SjQwQWM0V0ZDQzVq?=
 =?utf-8?B?OGdOUTh6WU9PWE1OaU9Za2g5N1FONUo2NGREZHdZcHE3dzZybGE1TkVzaWVL?=
 =?utf-8?B?Y01TcjN0Q2s1M2EwNS9TakNhMWlIM1dhUCsrclo3cTRVaThabDVEUkd6UWo1?=
 =?utf-8?B?ZlVpcmFpY3dxSTltTkxlbktlZ0g1MGl0bCtjNVBJQ1lUZU1GMko2SG11YnN1?=
 =?utf-8?B?cnk3VDdJU2o1K0xjMWs3TlJLWm04WmlCTWxvUjhzYWxGWGpzWWxIa29Ya1lR?=
 =?utf-8?B?V2p1czg3YWVaNGNkeHVBbTMvTlJvZGFjMWtJRHR4bEtpNVJEQ3hFb3lNeS9R?=
 =?utf-8?B?NXowM3E5dk40NFR2VXZ3Ky9McVNhb0NidGZsekp0VlErQ3YzNXdoK0FpS0ZX?=
 =?utf-8?B?UmJOMmVvSS9mbGtNZnRmRUliUlRzeEFLMW56RGNTY1JqYU1Ia0tld2xKVVJW?=
 =?utf-8?B?ZVZRQTVoMllrYnU1Y2dUaEFmKzJUWEFodmRUT2RiUFBQbVZkNzFoVys3Z3Nk?=
 =?utf-8?B?MndTNytmRDYvWWxuaStDeFJWb3l2anZMVUR1b3Y5RVJLNHlEaGdmcnVIWEV1?=
 =?utf-8?B?MngzZHErMm5Uc1dSUmFNRE9Ed253VGdLL1c2cGp2NUtjcUN4aFJHQnBOY3h2?=
 =?utf-8?B?b2NUakJNWlpwa0ZGWjhVWXhZU2E1bjhFRTkvWnFnenEvemIrSHVQd2xRZXJz?=
 =?utf-8?B?bUlDS2V5L253M0VHbmpURDVLWVQrWmRMeGZBVVY1ei9wMVl3RkVKVWtNQmMw?=
 =?utf-8?B?YUVicHY2aVptYW1ueFFTZk9sQVh4UlhiNmRIYXRsbmFPbkczUXNVRWVhUzNS?=
 =?utf-8?B?S0NZZFZyR2Vid2svd014RythOWxPU2FWL01rc3Q0TFcrbUJHQUFwMHdBalFJ?=
 =?utf-8?B?VHVQZVcxQUhEZXJ2VVJSQ1JhM0ozSld5OERxNjFVWXJNaFNpWmQ5WTNUTURY?=
 =?utf-8?B?REpuWmJpRmFhYmh5VlVNWnlIUFhuMmJ0VkZVZFBmNTVSc29NeUMydWQ0bk9X?=
 =?utf-8?Q?J4JTjMsig2S9FxnKmAe7Vbw1M?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 54580e30-f48c-4ace-142d-08dab3be53f9
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 23:45:26.1743 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 7iawkYfgjKrRJkKVJ9PC3JfmAwNlzjkogEihwWkOSQrKv8vCMKol/DssN80A9GML
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW5PR12MB5650
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-21 05:56, Yang Yingliang wrote: > > On 2022/10/21
 17:08, Luben Tuikov wrote: >> On 2022-10-21 04:59, Yang Yingliang wrote:
 >>> On 2022/10/21 16:36, Greg KH wrote: >>>> On Fri, Oct 21, 2022 [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.92.57 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.92.57 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -2.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1om1hp-00CrMc-3C
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

T24gMjAyMi0xMC0yMSAwNTo1NiwgWWFuZyBZaW5nbGlhbmcgd3JvdGU6Cj4gCj4gT24gMjAyMi8x
MC8yMSAxNzowOCwgTHViZW4gVHVpa292IHdyb3RlOgo+PiBPbiAyMDIyLTEwLTIxIDA0OjU5LCBZ
YW5nIFlpbmdsaWFuZyB3cm90ZToKPj4+IE9uIDIwMjIvMTAvMjEgMTY6MzYsIEdyZWcgS0ggd3Jv
dGU6Cj4+Pj4gT24gRnJpLCBPY3QgMjEsIDIwMjIgYXQgMDQ6MjQ6MjNQTSArMDgwMCwgWWFuZyBZ
aW5nbGlhbmcgd3JvdGU6Cj4+Pj4+IE9uIDIwMjIvMTAvMjEgMTM6MzcsIEdyZWcgS0ggd3JvdGU6
Cj4+Pj4+PiBPbiBGcmksIE9jdCAyMSwgMjAyMiBhdCAwMToyOTozMUFNIC0wNDAwLCBMdWJlbiBU
dWlrb3Ygd3JvdGU6Cj4+Pj4+Pj4gT24gMjAyMi0xMC0yMCAyMjoyMCwgWWFuZyBZaW5nbGlhbmcg
d3JvdGU6Cj4+Pj4+Pj4+IFRoZSBwcmV2aW91cyBkaXNjdXNzaW9uIGxpbms6Cj4+Pj4+Pj4+IGh0
dHBzOi8vbmFtMTEuc2FmZWxpbmtzLnByb3RlY3Rpb24ub3V0bG9vay5jb20vP3VybD1odHRwcyUz
QSUyRiUyRmxvcmUua2VybmVsLm9yZyUyRmxrbWwlMkYwZGI0ODZlYi02OTI3LTkyN2UtMzYyOS05
NThmOGYyMTExOTQlNDBodWF3ZWkuY29tJTJGVCUyRiZhbXA7ZGF0YT0wNSU3QzAxJTdDbHViZW4u
dHVpa292JTQwYW1kLmNvbSU3QzI1OTdmMTA5N2MyMDRiZTU0YzdjMDhkYWIzNGE4NjU0JTdDM2Rk
ODk2MWZlNDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzODAxOTQyOTkxNDczMDA3
MSU3Q1Vua25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJs
dU16SWlMQ0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtz
ZGF0YT1OTlZDdGJUeEk1dXp4eEpBOW1Ldm5zeThkM2p5dWR0bDF1NENUY20zdHNVJTNEJmFtcDty
ZXNlcnZlZD0wCj4+Pj4+Pj4gVGhlIHZlcnkgZmlyc3QgZGlzY3Vzc2lvbiBvbiB0aGlzIHdhcyBo
ZXJlOgo+Pj4+Pj4+Cj4+Pj4+Pj4gaHR0cHM6Ly9uYW0xMS5zYWZlbGlua3MucHJvdGVjdGlvbi5v
dXRsb29rLmNvbS8/dXJsPWh0dHBzJTNBJTJGJTJGd3d3LnNwaW5pY3MubmV0JTJGbGlzdHMlMkZk
cmktZGV2ZWwlMkZtc2czNjgwNzcuaHRtbCZhbXA7ZGF0YT0wNSU3QzAxJTdDbHViZW4udHVpa292
JTQwYW1kLmNvbSU3QzI1OTdmMTA5N2MyMDRiZTU0YzdjMDhkYWIzNGE4NjU0JTdDM2RkODk2MWZl
NDg4NGU2MDhlMTFhODJkOTk0ZTE4M2QlN0MwJTdDMCU3QzYzODAxOTQyOTkxNDg4NjMxNiU3Q1Vu
a25vd24lN0NUV0ZwYkdac2IzZDhleUpXSWpvaU1DNHdMakF3TURBaUxDSlFJam9pVjJsdU16SWlM
Q0pCVGlJNklrMWhhV3dpTENKWFZDSTZNbjAlM0QlN0MzMDAwJTdDJTdDJTdDJmFtcDtzZGF0YT1C
eUNRazBxR2t0eXlvTlFnOElGajVBR3htYWVXT1huYklBNHJGblglMkI2JTJCQSUzRCZhbXA7cmVz
ZXJ2ZWQ9MAo+Pj4+Pj4+Cj4+Pj4+Pj4gUGxlYXNlIHVzZSB0aGlzIGxpbmssIGFuZCBub3QgdGhl
IHRoYXQgb25lIHVwIHRoZXJlIHlvdSB3aGljaCBxdW90ZWQgYWJvdmUsCj4+Pj4+Pj4gYW5kIHdo
b3NlIGNvbW1pdCBkZXNjcmlwdGlvbiBpcyB0YWtlbiB2ZXJiYXRpbSBmcm9tIHRoZSB0aGlzIGxp
bmsuCj4+Pj4+Pj4KPj4+Pj4+Pj4ga3NldF9yZWdpc3RlcigpIGlzIGN1cnJlbnRseSB1c2VkIGlu
IHNvbWUgcGxhY2VzIHdpdGhvdXQgY2FsbGluZwo+Pj4+Pj4+PiBrc2V0X3B1dCgpIGluIGVycm9y
IHBhdGgsIGJlY2F1c2UgdGhlIGNhbGxlcnMgdGhpbmsgaXQgc2hvdWxkIGJlCj4+Pj4+Pj4+IGtz
ZXQgaW50ZXJuYWwgdGhpbmcgdG8gZG8sIGJ1dCB0aGUgZHJpdmVyIGNvcmUgY2FuIG5vdCBrbm93
IHdoYXQKPj4+Pj4+Pj4gY2FsbGVyIGRvaW5nIHdpdGggdGhhdCBtZW1vcnkgYXQgdGltZXMuIFRo
ZSBtZW1vcnkgY291bGQgYmUgZnJlZWQKPj4+Pj4+Pj4gYm90aCBpbiBrc2V0X3B1dCgpIGFuZCBl
cnJvciBwYXRoIG9mIGNhbGxlciwgaWYgaXQgaXMgY2FsbGVkIGluCj4+Pj4+Pj4+IGtzZXRfcmVn
aXN0ZXIoKS4KPj4+Pj4+PiBBcyBJIGV4cGxhaW5lZCBpbiB0aGUgbGluayBhYm92ZSwgdGhlIHJl
YXNvbiB0aGVyZSdzCj4+Pj4+Pj4gYSBtZW1vcnkgbGVhayBpcyB0aGF0IG9uZSBjYW5ub3QgY2Fs
bCBrc2V0X3JlZ2lzdGVyKCkgd2l0aG91dAo+Pj4+Pj4+IHRoZSBrc2V0LT5rb2JqLm5hbWUgYmVp
bmcgc2V0LS1rb2JqX2FkZF9pbnRlcm5hbCgpIHJldHVybnMgLUVJTlZBTCwKPj4+Pj4+PiBpbiB0
aGlzIGNhc2UsIGkuZS4ga3NldF9yZWdpc3RlcigpIGZhaWxzIHdpdGggLUVJTlZBTC4KPj4+Pj4+
Pgo+Pj4+Pj4+IFRodXMsIHRoZSBtb3N0IGNvbW1vbiB1c2FnZSBpcyBzb21ldGhpbmcgbGlrZSB0
aGlzOgo+Pj4+Pj4+Cj4+Pj4+Pj4gCWtvYmpfc2V0X25hbWUoJmtzZXQtPmtvYmosIGZvcm1hdCwg
Li4uKTsKPj4+Pj4+PiAJa3NldC0+a29iai5rc2V0ID0gcGFyZW50X2tzZXQ7Cj4+Pj4+Pj4gCWtz
ZXQtPmtvYmoua3R5cGUgPSBrdHlwZTsKPj4+Pj4+PiAJcmVzID0ga3NldF9yZWdpc3Rlcihrc2V0
KTsKPj4+Pj4+Pgo+Pj4+Pj4+IFNvLCB3aGF0IGlzIGJlaW5nIGxlYWtlZCwgaXMgdGhlIG1lbW9y
eSBhbGxvY2F0ZWQgaW4ga29ial9zZXRfbmFtZSgpLAo+Pj4+Pj4+IGJ5IHRoZSBjb21tb24gaWRp
b20gc2hvd24gYWJvdmUuIFRoaXMgbmVlZHMgdG8gYmUgbWVudGlvbmVkIGluCj4+Pj4+Pj4gdGhl
IGRvY3VtZW50YXRpb24sIGF0IGxlYXN0LCBpbiBjYXNlLCBpbiB0aGUgZnV0dXJlIHRoaXMgaXMg
YWJzb2x2ZWQKPj4+Pj4+PiBpbiBrc2V0X3JlZ2lzdGVyKCkgcmVkZXNpZ24sIGV0Yy4KPj4+Pj4+
IEJhc2VkIG9uIHRoaXMsIGNhbiBrc2V0X3JlZ2lzdGVyKCkganVzdCBjbGVhbiB1cCBmcm9tIGl0
c2VsZiB3aGVuIGFuCj4+Pj4+PiBlcnJvciBoYXBwZW5zPyAgSWRlYWxseSB0aGF0IHdvdWxkIGJl
IHRoZSBjYXNlLCBhcyB0aGUgb2RkcyBvZiBhIGtzZXQKPj4+Pj4+IGJlaW5nIGVtYmVkZGVkIGlu
IGEgbGFyZ2VyIHN0cnVjdHVyZSBpcyBwcm9iYWJseSBzbGltLCBidXQgd2Ugd291bGQgaGF2ZQo+
Pj4+Pj4gdG8gc2VhcmNoIHRoZSB0cmVlIHRvIG1ha2Ugc3VyZS4KPj4+Pj4gSSBoYXZlIHNlYXJj
aCB0aGUgd2hvbGUgdHJlZSwgdGhlIGtzZXQgdXNlZCBpbiBidXNfcmVnaXN0ZXIoKSAtIHBhdGNo
ICMzLAo+Pj4+PiBrc2V0X2NyZWF0ZV9hbmRfYWRkKCkgLSBwYXRjaCAjNAo+Pj4+PiBfX2NsYXNz
X3JlZ2lzdGVyKCkgLSBwYXRjaCAjNSzCoCBmd19jZmdfYnVpbGRfc3ltbGluaygpIC0gcGF0Y2gg
IzYgYW5kCj4+Pj4+IGFtZGdwdV9kaXNjb3ZlcnkuYyAtIHBhdGNoICMxMAo+Pj4+PiBpcyBlbWJl
ZGRlZCBpbiBhIGxhcmdlciBzdHJ1Y3R1cmUuIEluIHRoZXNlIGNhc2VzLCB3ZSBjYW4gbm90IGNh
bGwKPj4+Pj4ga3NldF9wdXQoKSBpbiBlcnJvciBwYXRoIGluIGtzZXRfcmVnaXN0ZXIoKQo+Pj4+
IFllcyB5b3UgY2FuIGFzIHRoZSBrb2JqZWN0IGluIHRoZSBrc2V0IHNob3VsZCBOT1QgYmUgY29u
dHJvbGluZyB0aGUKPj4+PiBsaWZlc3BhbiBvZiB0aG9zZSBsYXJnZXIgb2JqZWN0cy4KPj4+Pgo+
Pj4+IElmIGl0IGlzLCBwbGVhc2UgcG9pbnQgb3V0IHRoZSBjYWxsIGNoYWluIGhlcmUgYXMgSSBk
b24ndCB0aGluayB0aGF0Cj4+Pj4gc2hvdWxkIGJlIHBvc3NpYmxlLgo+Pj4+Cj4+Pj4gTm90ZSBh
bGwgb2YgdGhpcyBpcyBhIG1lc3MgYmVjYXVzZSB0aGUga29iamVjdCBuYW1lIHN0dWZmIHdhcyBh
ZGRlZCBtdWNoCj4+Pj4gbGF0ZXIsIGFmdGVyIHRoZSBkcml2ZXIgbW9kZWwgaGFkIGJlZW4gY3Jl
YXRlZCBhbmQgcnVubmluZyBmb3IgYSB3aGlsZS4KPj4+PiBXZSBtaXNzZWQgdGhpcyBlcnJvciBw
YXRoIHdoZW4gYWRkaW5nIHRoZSBkeW5hbWljIGtvYmplY3QgbmFtZSBsb2dpYywKPj4+PiB0aGFu
ayBmb3IgbG9va2luZyBpbnRvIHRoaXMuCj4+Pj4KPj4+PiBJZiB5b3UgY291bGQgdGVzdCB0aGUg
cGF0Y2ggcG9zdGVkIHdpdGggeW91ciBlcnJvciBpbmplY3Rpb24gc3lzdGVtcywKPj4+PiB0aGF0
IGNvdWxkIG1ha2UgdGhpcyBhbGwgbXVjaCBzaW1wbGVyIHRvIHNvbHZlLgo+Pj4gVGhlIHBhdGNo
IHBvc3RlZCBieSBMdWJlbiB3aWxsIGNhdXNlIGRvdWJsZSBmcmVlIGluIHNvbWUgY2FzZXMuCj4+
IFllcywgSSBmaWd1cmVkIHRoaXMgb3V0IGluIHRoZSBvdGhlciBlbWFpbCBhbmQgcG9zdGVkIHRo
ZSBzY2VuYXJpbyBHcmVnCj4+IHdhcyBhc2tpbmcgYWJvdXQuCj4+Cj4+IEJ1dCBJIGJlbGlldmUg
dGhlIHF1ZXN0aW9uIHN0aWxsIHN0YW5kcyBpZiB3ZSBjYW4gZG8ga3NldF9wdXQoKQo+PiBhZnRl
ciBhICpmYWlsZWQqIGtzZXRfcmVnaXN0ZXIoKSwgbmFtZWx5IGlmIG1vcmUgaXMgYmVpbmcgZG9u
ZSB0aGFuCj4+IG5lY2Vzc2FyeSwgd2hpY2ggaXMganVzdCB0byBmcmVlIHRoZSBtZW1vcnkgYWxs
b2NhdGVkIGJ5Cj4+IGtvYmplY3Rfc2V0X25hbWUoKS4KPiBUaGUgbmFtZSBtZW1vcnkgaXMgYWxs
b2NhdGVkIGluIGtvYmplY3Rfc2V0X25hbWUoKSBpbiBjYWxsZXIswqAgYW5kIEkgCj4gdGhpbmsg
Y2FsbGVyCj4gZnJlZSB0aGUgbWVtb3J5IHRoYXQgaXQgYWxsb2NhdGVkIGlzIHJlYXNvbmFibGUs
IGl0J3Mgd2VpcmQgdGhhdCBzb21lIAo+IGNhbGxlcnMgYWxsb2NhdGUKPiBzb21lIG1lbW9yeSBh
bmQgdXNlIGZ1bmN0aW9uIChrc2V0X3JlZ2lzdGVyKSBmYWlsZWQsIHRoZW4gaXQgZnJlZSB0aGUg
Cj4gbWVtb3J5IGFsbG9jYXRlZAo+IGluIGNhbGxlcnMswqAgSSB0aGluayB1c2Uga3NldF9wdXQo
KS9rZnJlZV9jb25zdChuYW1lKSBpbiBjYWxsZXIgc2VlbXMgCj4gbW9yZSByZWFzb25hYmxlLgoK
a3NldF9wdXQoKSB3b3VsZCB3b3JrIG9ubHkgaW4gaW1wbGVtZW50YXRpb25zLCBzdWNoIGFzIGFt
ZGdwdV9kaXNjb3ZlcnkuYywKd2hlcmUgdGhlIGt0eXBlLnJlbGVhc2UgaXMgZGVmaW5lZCBhbmQg
aXQgZnJlZXMgdGhlIGVtYmVkZGluZyBvYmplY3QgaW4Kd2hpY2ggdGhlIGtzZXQgaXMgZW1iZWRk
ZWQuCgpEZXBlbmRpbmcgb24gdGhlIGltcGxlbWVudGF0aW9uLCB5b3UgbWF5IG5lZWQgdG8gY2Fs
bCBrZnJlZV9jb25zdChuYW1lKS4KCkFuZCB0aGlzIGlzIHdoeSB0aGlzIG5lZWRzIHRvIGJlIGRv
Y3VtZW50ZWQgaW4ga3NldF9yZWdpc3RlcigpLCBhcyBJIG5vdGVkCmluIHRoZSByZXZpZXcgZWFy
bGllci4KClJlZ2FyZHMsCkx1YmVuCgoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KTGludXgtZjJmcy1kZXZlbCBtYWlsaW5nIGxpc3QKTGludXgtZjJmcy1k
ZXZlbEBsaXN0cy5zb3VyY2Vmb3JnZS5uZXQKaHR0cHM6Ly9saXN0cy5zb3VyY2Vmb3JnZS5uZXQv
bGlzdHMvbGlzdGluZm8vbGludXgtZjJmcy1kZXZlbAo=
