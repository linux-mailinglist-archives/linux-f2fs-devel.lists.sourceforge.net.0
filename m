Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 98ED260BC5C
	for <lists+linux-f2fs-devel@lfdr.de>; Mon, 24 Oct 2022 23:40:12 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-2.v29.lw.sourceforge.com)
	by sfs-ml-2.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1on5B2-0003MK-Bk;
	Mon, 24 Oct 2022 21:40:08 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-2.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Luben.Tuikov@amd.com>) id 1on5B0-0003ME-NA
 for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 21:40:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=aKLI9t59nWGEXVCakOqqAeZb8XgnUTLQV7s+exihwxo=; b=OhBl3tXKPoHwT/FMSwWo1MWNwD
 JpNMbqfd1VrCzqib2VTPQiqNEocBTpJT9T+SOjP3WmZ0T76pimlXR5x2I4qq2b00a14syTbbVQpwx
 mN99KtDayeZ7BCgv5QGiqpoR+SS9rVkOSMkADgJ2r6P6FOTd6Z+ELjvuyIFgJTggPpf4=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=aKLI9t59nWGEXVCakOqqAeZb8XgnUTLQV7s+exihwxo=; b=TYIravaQ/tbJHX+x5Vbwg0cCxx
 V9ojIzqU41ugy+VbtiKIXohnl772eHGdkVq2wnUHscxON0Ac9O+VGqXbO7K1lx+msONK14XOA566g
 MH3mzfZtncWMWXCjeaj/8BvM/rdYRRVjMLN5xIFKNmDQxwqWUbm8KQ+nRZDAYtM10MBw=;
Received: from mail-mw2nam10on2053.outbound.protection.outlook.com
 ([40.107.94.53] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by sfi-mx-1.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1on5At-00G6gO-2B for linux-f2fs-devel@lists.sourceforge.net;
 Mon, 24 Oct 2022 21:40:06 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=c032ZbrJbcAm/40O5j182wsCqvB5ujL3qpzezPt+6k6JxXJgSmOMdaituwS4w8DbsVkpGgZ2ipgShW1pH3jIua1SYLuE+6MAitmeLOrUKOE9hGlicpYi2xy+eab2BTXQVWFOuk0qeSNk2oh48eSWIjRLPoSOGu13G/0wd4ekJJQc2cW2yMLiViEzyi6j1wJxLfFPnfYUQzF8jUu0vN0m/TolGd3Mot/Vvggl2GYa2zvu4SvNLa05DGf+wqkPGL933ssAnJAE2OvuGB4pgcjW7VTSwYpt5ePQjy8zHV4El5GCLyBA5hTnU29K1psSrLz40H3oIWSQ+vHtTmWyXxT/fw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=aKLI9t59nWGEXVCakOqqAeZb8XgnUTLQV7s+exihwxo=;
 b=n+pYkdxyE2UqHq0XCulfvqHfRMy41SeZ3sErEomQjHSSqocOkfOJbBWc0a7r0FJAe+WUBtKndKcxSuKmKsnws0iqx4r5ND4cLieV52AcHk5qJyHNARIPMwO3IgVBlnjy0UtSOOKp7RNVh33ADwrjZVEtjyHcCXEYk8E2u/0/z+OJ1FVuqB/QoyKnpPhGoa36YnbkphimfJYo8I+5I008d/qlR6uF2XeYvdgPGvBSC8O4XdpDMjM89c2WZxdgIw1WkAN7SZqYNtfwOSR7j2sVtDExDeObi9xxfDftEejwU/w6cHrfOw/kTrui0AUsNzvIqrVt0CmJIq0wCnQzdPqB4w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=aKLI9t59nWGEXVCakOqqAeZb8XgnUTLQV7s+exihwxo=;
 b=druCWTl939K2PvchFOrU7w/XcVexoZzePd4pHEPATb0bJy8n+RNJkAF+Jgrqa9SSe/6ApeHBGRBrPpmxlFZEAcfd9kjIXdACYUK6EQPsUeXmh09WuHPqdeLcQG8/HUB3qQgvSW8Pej3gD1vBcs+kcyc5R3XnRMmc8VbuQ4BDK98=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 IA1PR12MB6187.namprd12.prod.outlook.com (2603:10b6:208:3e5::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5746.26; Mon, 24 Oct
 2022 21:25:29 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5746.026; Mon, 24 Oct 2022
 21:25:29 +0000
Message-ID: <dcb8b35a-7d0d-cc00-41e3-6e66837c506f@amd.com>
Date: Mon, 24 Oct 2022 17:25:26 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Content-Language: en-CA
To: Yang Yingliang <yangyingliang@huawei.com>, linux-kernel@vger.kernel.org,
 qemu-devel@nongnu.org, linux-f2fs-devel@lists.sourceforge.net,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com,
 linux-mtd@lists.infradead.org, amd-gfx@lists.freedesktop.org
References: <20221024121910.1169801-1-yangyingliang@huawei.com>
 <176ae1a1-9240-eef8-04e9-000d47646f4a@amd.com>
In-Reply-To: <176ae1a1-9240-eef8-04e9-000d47646f4a@amd.com>
X-ClientProxiedBy: YT4PR01CA0001.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:d1::11) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|IA1PR12MB6187:EE_
X-MS-Office365-Filtering-Correlation-Id: 0efaccf6-f9a0-4d8d-e4af-08dab6064684
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: CzcHZS8vBg6TeA4dbFTkeAn7o3CJ71KDQ5duLSRBDtlcQ3pAFchZDw30qT3a4Llp4Rbxy4r4X4Ir21GM/RFa8AWkQvFHSwdbYgnuXQ0DxoOy9TDKe1nGZWk9nw9vl6xzRkT3VbYdLLq3JXDJH8jHbF4CV17H4v3blVGwJFv96K7bdYx2ZEvYbXgspFIvzpy5EvhvVUGbikqVyaLb2E7zcE17zLkyKAszzPMWrk/fo012uQapx/pYhLooIEOydRVTWReM2vI2DrWuGlD+RvnMwqxkHXgItxtmb5uXVnHk5DQhavwGW3PpaFhyF6Hqy/Z3vU+VeZ+2EWG/9PhSxQVrXilHuRJDG5DBAvq+nbKnOU0Ail2uy5CLvsyLlj7ZEJZdsnEm7dMZtq963fjNoH7l1jHcwchsCvF1ZGaZOXpIa53F9vqWxz95+eWpvaXGerNpQuWzTq6tAL5cCS1Iy5sUZarV9Vtpn5gfzOhqXEzY4qqcRLjJ7+ZmP8zy6O3aEY+zg0UCAYg+/kAaIsXsM1qbp+1GGYurmDkVmB/JDtEWZHpTuJ6W89bPk1nQjNOp5ruZN66BxawHx3Gpnz8poR/9lGvtlgmUTsbUnppQG7TlQLsFDkkZUodwihH2z+OxdSFhhbq6yF9xpUz4KMAmKCxzK/mUQERUYbc1wraRNnUi650tC2yIpTI9WMneCOr7wAtwpDxeXOYq6yG5fHaD9/+w4e05TWHa1/+KqtKenQvo+QfgOfjRN+ciz2hFYKy5Eyr8+1xFwHD18KvIxWfwq0BGo0R0KZfDC7Fnbgy7pt4mgjc=
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(376002)(346002)(39860400002)(396003)(136003)(366004)(451199015)(316002)(478600001)(53546011)(6666004)(66946007)(4326008)(66556008)(66476007)(6506007)(8676002)(31686004)(6486002)(186003)(41300700001)(8936002)(5660300002)(7416002)(44832011)(2616005)(4001150100001)(2906002)(26005)(6512007)(36756003)(38100700002)(31696002)(86362001)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?YU03eU9sLzdxdFVYM3FuRW1pTTZYTUYxRmJpNEFFQkc4S1Brandqd0RxMm9Z?=
 =?utf-8?B?Tk1LZ0dFZ1RVbXdHUUowMGZ3WVg5UVpjRGpXYjFLYjM3WkVCOWMyTnlWMkpa?=
 =?utf-8?B?S3dmaWFWYjRLUUZCUXBudWE0azQwaXFydkQvYXA2VHVpd1pFT1VKakd4TElL?=
 =?utf-8?B?OFpOa1ZlRFRvNDhZRUNnRCtOTWNQUkVUejN0YzQ5cVVOUXdVSXJmUVJZcDhY?=
 =?utf-8?B?OUtqNFUxZS9PSlpsakNKYWNPaldkY3lFZ3QvbW5iS0VOOXBDUElaY0tmQk52?=
 =?utf-8?B?RzJHN1VQTXFrdWluRHF0YkdId0tMWnQzcHZKMUluYXlpcFF5S0JnMVhpcEt1?=
 =?utf-8?B?UndpMmlKL0pwK3BZL2I1VGJ1ZXF4ODZyczZ5OUFsaGtCaUVDbkFwNUdXOFZH?=
 =?utf-8?B?YXZ0Z0xyNkgzZXpjZFh2bFNvdDFNM3pVTXRZV2JPZjExNmNpaERiN2hmRVIr?=
 =?utf-8?B?Zk1BVFVNeVNnbWxpQ3ZZb2llM2tBdmtwWVVLS3l6VVZhUEY1UlVFdEU4WHU2?=
 =?utf-8?B?YXY2ZVBjb2JGcW0zM1pDR2hpR1lYTERqWW1LZko2ZHJlT21vNm9MeGxneFU1?=
 =?utf-8?B?ZElpTnVJaUxRSU5HaU9DaUswNjhFWm0wTzQ4RWtHZ1NyQUowTGZBTjhKYnUw?=
 =?utf-8?B?aCs3dklIVXNCY3dGMCtFazF2d3VtVTg4MmFjbFpUUWplb1NVbC95K2pyS0N0?=
 =?utf-8?B?bEtUU1h2eHpmSXJCTmxGYTlYdmcvM0tJVXpKdXVldEN3WTRDSzl6NjJ1cXJu?=
 =?utf-8?B?S2lSUkw4TWdFemdtS0JyRlUzOGJaN2s3RHgvRGVSM1pXaUh3d0xRd3B3eVo3?=
 =?utf-8?B?YmRENGIzUnpIeTBIbEVIOTRrUlFqeVk0OGl3aVBaZ3VETUI5Tk8weEw0Q2VN?=
 =?utf-8?B?Z1dwYUlpQTZIUXdud0svVnEyMFhsV0lvOUIxVVlLQ3NzK1ZSYnRDVzF2YzFC?=
 =?utf-8?B?NEs1M1lYVkdMZEcyYVZRQlYvMjVhcUR1bDA3aTN5UDEyRWVrUEM1cEYzUjRX?=
 =?utf-8?B?MStBaUV1bHZnUTM4dHJYUlFteVlTS1RUM0hRRTA5WmxDSWZEL1J6R3c2dHBs?=
 =?utf-8?B?UDNXR2xUdjBxRS93S25GY3VNeEYxdXNhcUsxYml2ZElQUFh2Qmd1d0FLb3lC?=
 =?utf-8?B?L1ljTHNFWmgzQm5sQi81aXlzemlXMWZ3Nkx5dTFsWWJpNExsazV5Z3lNSnRk?=
 =?utf-8?B?bnJlZXJQNUxnSFkzY042NkhxZmlvTGNuR3RCMnUyekFCUDg0MjgyRXdUUGhq?=
 =?utf-8?B?TTdoWHQ2emhyb1hqTWR5dTdabHBySUlvSVkvZGJkSkdqZUVlZjA0ZERCczZE?=
 =?utf-8?B?TlhZOFhWV2ZhbmRuc2VLaFBRYXI1SC9SV0gxWEU1aWMxSDRmREtSRXJ2bmpW?=
 =?utf-8?B?VFBvS0tndVBpcEtIMjE0eXBKeWtQZTh0Nno5bzE3cmlJK2hScGRBamdzK21M?=
 =?utf-8?B?eHYrZW43UlJvRHp0R1hpZzMyVmVTUUxFVy9FMUs5SHdVUWdxek0zSnZLb3Z6?=
 =?utf-8?B?eWptcGN2N3hrUWdQZmZaVlN1bnk4ZTE2a01BamVkd2RwMXpBTVpUaU1jRURl?=
 =?utf-8?B?ZVNrY09WWHU0NU9pQmMyM0xFeXNiU3EvMjdlRk1oWndHTE41NDZ4bVhOQ3Ri?=
 =?utf-8?B?TUx4Ym5EblpGcmQrVWpFSkk5NWlCb2RtanRwNUZwQ3Q4aWZnU0lONHhpckJ4?=
 =?utf-8?B?MGpHejZ5N3BNWWs0dTQxZTk2czlteGdGRkphRkMwcEFrZWhGc3ErV3JiR1BO?=
 =?utf-8?B?WW94QXg5SHQ2c1l4eHQxSlNZaUtDdmdBS295V2hoclRuYmtKOEtacGxwSS9h?=
 =?utf-8?B?ZFVBaTFyVjMwbEJ2OEd4SHRWZDN1ZmJPVEZMVXdCRlVZM1owaGVQSUJwTkhx?=
 =?utf-8?B?ZEE1SzJWcWx1YWkwVmRzYUFjc1hhVWMyMW90YThPeE1OdTU4OUUwWkFHR3BV?=
 =?utf-8?B?eWlHZzk1TXpGODdzam5HbzA5RXlWZ08xM3F3YmdlZFlIdFl5TG1WemdxaHNw?=
 =?utf-8?B?VkFRakJkZy91RXFGR2ZGMHF6YnJaeGhZTnExT1RLaVVUWmNGQzdaQmpjY0gw?=
 =?utf-8?B?N1JJVVRhZ01kcjgrYXIvUUNheFFWb2V0Q2txcy8yLzBOcXM4RHROSENoZDFO?=
 =?utf-8?Q?Y7E7Sp6Bx6mqzxMYPoUtbkARC?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 0efaccf6-f9a0-4d8d-e4af-08dab6064684
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 Oct 2022 21:25:29.7707 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Zk+gt6mxWiTKdVHkUE/yuWTTNy/nX/+eaE2y/7veK7NVnXIw0WTaJuS5EAODxD4A
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR12MB6187
X-Spam-Score: -2.2 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-1.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-24 17:06,
 Luben Tuikov wrote: > On 2022-10-24 08:19, 
 Yang Yingliang wrote: >> Inject fault while loading module, kset_register()
 may fail. >> If it fails, the name allocated by kobject_set_ [...] 
 Content analysis details:   (-2.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.94.53 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.94.53 listed in wl.mailspike.net]
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
X-Headers-End: 1on5At-00G6gO-2B
Subject: Re: [f2fs-dev] [PATCH v2] kset: fix memory leak when
 kset_register() returns error
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
Cc: alexander.deucher@amd.com, richard@nod.at, mst@redhat.com,
 gregkh@linuxfoundation.org, somlo@cmu.edu, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, jlbec@evilplan.org, hsiangkao@linux.alibaba.com,
 rafael@kernel.org, jaegeuk@kernel.org, akpm@linux-foundation.org,
 mark@fasheh.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022-10-24 17:06, Luben Tuikov wrote:
> On 2022-10-24 08:19, Yang Yingliang wrote:
>> Inject fault while loading module, kset_register() may fail.
>> If it fails, the name allocated by kobject_set_name() which
>> is called before kset_register() is leaked, because refcount
>> of kobject is hold in kset_init().
> 
> "is hold" --> "was set".
> 
> Also, I'd say "which must be called" instead of "is", since
> we cannot register kobj/kset without a name--the kobj code crashes,
> and we want to make this clear. IOW, a novice user may wonder
> where "is" it called, as opposed to learning that they "must"
> call it to allocate/set a name, before calling kset_register().
> 
> So, I'd say this:
> 
> "If it fails, the name allocated by kobject_set_name() which must
>  be called before a call to kset_regsiter() is leaked, since
>  refcount of kobj was set in kset_init()."

Actually, to be a bit more clear:

"If kset_register() fails, the name allocated by kobject_set_name(),
 namely kset.kobj.name, which must be called before a call to kset_register(),
 may be leaked, if the caller doesn't explicitly free it, say by calling kset_put().

 To mitigate this, we free the name in kset_register() when an error is encountered,
 i.e. when kset_register() returns an error."

> 
>>
>> As a kset may be embedded in a larger structure which needs
>> be freed in release() function or error path in callers, we
> 
> Drop "As", start with "A kset". "which needs _to_ be".
> Also please specify that the release is part of the ktype,
> like this:
> 
> "A kset may be embedded in a larger structure which needs to be
>  freed in ktype.release() or error path in callers, we ..."
> 
>> can not call kset_put() in kset_register(), or it will cause
>> double free, so just call kfree_const() to free the name and
>> set it to NULL.
>>
>> With this fix, the callers don't need to care about the name
>> freeing and call an extra kset_put() if kset_register() fails.
> 
> This is unclear because you're *missing* a verb:
> "and call an extra kset_put()".
> Please add the proper verb _between_ "and call", something like,
> 
> "With this fix, the callers don't need to care about freeing
>  the name of the kset, and _can_ call kset_put() if kset_register() fails."
> 
> Choose a proper verb here: can, should, cannot, should not, etc.
> 
> We can do this because you set "kset.kobj.name to NULL, and this
> is checked for in kobject_cleanup(). We just need to stipulate
> whether they should/shouldn't have to call kset_put(), or can free the kset
> and/or the embedding object themselves. This really depends
> on how we want kset_register() to behave in the future, and on
> user's own ktype.release implementation...

Forgot "may", "may not".

So, do we want to say "may call kset_put()", like:

"With this fix, the callers need not care about freeing
 the name of the kset, and _may_ call kset_put() if kset_register() fails."

Or do we want to say "should" or even "must"--it really depends on
what else is (would be) going on in kobj registration.

Although, the user may have additional work to be done in the ktype.release()
callback for the embedding object. It would be good to give them the freedom,
i.e. "may", to call kset_put(). If that's not the case, this must be explicitly
stipulated with the proper verb.

Regards,
Luben



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
