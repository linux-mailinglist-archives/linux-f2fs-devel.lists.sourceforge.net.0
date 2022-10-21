Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BB146073AE
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 21 Oct 2022 11:14:46 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.95)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1olo72-00011W-Ae;
	Fri, 21 Oct 2022 09:14:44 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.95)
 (envelope-from <Luben.Tuikov@amd.com>) id 1olo6X-00010t-Hs
 for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:14:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-Type
 :In-Reply-To:References:Cc:To:From:Subject:Date:Message-ID:Sender:Reply-To:
 Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
 Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=Q251mzfsb5DlGC85pwHzj7UDAFI0ShBjQfuh/jjyVsg=; b=NAoQ2A/Y6NgS9a5ZL38vjHHJHz
 LuwOx6cS9kbBLSWUXOlwIbYG1Uf1MaSdZwoAHWtJrsHJstUXZnAJAhdqB7cp/bsBO8n6cr0uPcOGO
 OBa8R9DC90IDJvJn7ZeZ4T5r2GDgEZdYe7oAlUnwW8EsReaqybev+S7QlwdzjO/J0thY=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-Type:In-Reply-To:
 References:Cc:To:From:Subject:Date:Message-ID:Sender:Reply-To:Content-ID:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=Q251mzfsb5DlGC85pwHzj7UDAFI0ShBjQfuh/jjyVsg=; b=Fc0fDsTnMTNyUYjTf5m7mnkPEY
 Ff25IUBVDzpMNERquOZO1RmV6yzTgc1I4xExF+G+ss0lpfQ/E89jqWhkyqA+6GW9rl7XKNf3O5SOc
 nIi5gENybJkcJe/NnqWpeEyLUex1Q85g48K2UoQlOcfupwtuH065FIpobWexc7NDO57Y=;
Received: from mail-dm6nam11on2041.outbound.protection.outlook.com
 ([40.107.223.41] helo=NAM11-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.95)
 id 1olo6I-0007Fd-Jv for linux-f2fs-devel@lists.sourceforge.net;
 Fri, 21 Oct 2022 09:14:09 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=AO1IWlrWPXyjK5RZ0xCtHEAwZSDSUPtsjWcLMcL5MNHHYw+UKcnVoeU6HTrqH+owoQGhVn3LHMcllH0gduju/EknjxUq8o/PcCIlesc//RA0/vXi1OZcoayFbx1gfyUBBaj251xPvJc61RjsZYyGv+ePYhT1gGd/gPWAeh7blekJGXG0lLAUyMrM7MSmtkKprQp3d9rAIMi3CVYGh93EcdqCmIxevMx5g1OVzDBc3XJ9ft+Znv6jwABOuDuFeC8x4ydCNjfTyxC0yQeKKZKBWP74IImp9TF+UzWubambFfx43/Kw0j7PXUDt1SheXorfT0QaoHIBEwOpMRqn31nqvQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Q251mzfsb5DlGC85pwHzj7UDAFI0ShBjQfuh/jjyVsg=;
 b=ndUvpFbHhxuHqtoyrvNqKhGZMH1hwtj5R3rqxnssUm2Ch/XTLIQjSIPryiUqxESbKhxT5Zb5qDyeaGvrPWRm0+zbHDwrbCIe5dFpE+I/PGkLCj1KPrTDW5OF+L4ryXCqNxllhP0Vg1Kxf5Aqqj6T2pSpcTk6U3ejeJHG/fOqTLIL2nQHG3nYVrRY+T+U4VzvubIDQcj8egg2C7xgFm+IyPVe7lA77C/k3qqoHbJCSzGu3olKiBmOxcT6M9D/OMMJs2hcNJxBpI/ZL59mxVcKq37iI8phLjhrpTlxF/UnozxgBSEjucTPCq6y0/0/YZIrPeiHvqd9dMzy93QpoVOUwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=amd.com; dmarc=pass action=none header.from=amd.com; dkim=pass
 header.d=amd.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1; 
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Q251mzfsb5DlGC85pwHzj7UDAFI0ShBjQfuh/jjyVsg=;
 b=c4LJxSJwUO3E/4zaRExZtJsnex681gh5nBqCuB78iniPxc3wvcvIRXbAYYyvUU4SUI+VtxagXyZ81MgH4YO7TkC6gdOv09Kpk/nd/2oQeNR+6cXAPE61O23OduMAhwGZ0hRyb+w5fgV61Kc4QD2qQVGrXvsmh+9/516+6etBkT0=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=amd.com;
Received: from DM6PR12MB3370.namprd12.prod.outlook.com (2603:10b6:5:38::25) by
 SN7PR12MB6691.namprd12.prod.outlook.com (2603:10b6:806:271::9) with
 Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.5723.30; Fri, 21 Oct 2022 08:41:11 +0000
Received: from DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425]) by DM6PR12MB3370.namprd12.prod.outlook.com
 ([fe80::d309:77d2:93d8:2425%7]) with mapi id 15.20.5723.035; Fri, 21 Oct 2022
 08:41:11 +0000
Message-ID: <19689b9e-16d1-c6c5-4ee8-58885fbf8fb0@amd.com>
Date: Fri, 21 Oct 2022 04:41:08 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.3
Content-Language: en-CA
To: Greg KH <gregkh@linuxfoundation.org>
References: <20221021022102.2231464-1-yangyingliang@huawei.com>
 <d559793a-0ce4-3384-e74e-19855aa31f31@amd.com> <Y1IwLOUGayjT9p6d@kroah.com>
 <5efd73b0-d634-d34f-3d7a-13d674e40d04@amd.com> <Y1JV1wxf/7ERAMhl@kroah.com>
 <35e66c7c-ff25-efd3-cfbc-d06130687aa7@amd.com>
In-Reply-To: <35e66c7c-ff25-efd3-cfbc-d06130687aa7@amd.com>
X-ClientProxiedBy: YT3PR01CA0070.CANPRD01.PROD.OUTLOOK.COM
 (2603:10b6:b01:84::18) To DM6PR12MB3370.namprd12.prod.outlook.com
 (2603:10b6:5:38::25)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM6PR12MB3370:EE_|SN7PR12MB6691:EE_
X-MS-Office365-Filtering-Correlation-Id: 98a45d05-4649-4cb9-cbd9-08dab340019f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: MbwkcXzQpKxEfYR0Ksar0quqZBoOQTbzkAtjpW0n3/r8FkxFGdM1tblrL/0MPgFcdrXp25eTq5baV/KtLqDoHN3QV9w9zk/jA3WgP4tdEivcy8tjf0V5JjC4M10KGNy0q6K7XwaZf6xu2Re9WkwdBvrOIYllsX55Nly+CON6D+i4Y8v70LI5EzqRjJXgz43eshskkFVgi/wTNmC3yh4PIbK0jttzFC90NdQcjNkUbm083sFohAm2/Zoq5T+l2ukmumQOJGkZQaG4Tw4a2WK157O/6JfA47oJioPzjhdPV77uV+95ZLYQ5WIfL9Dq/RlGt/qjYSn5Rn2ANHjBPHB45+GCkJ5EsjojZ3wIzgakQdhOySswmYXJqXe9WOzEnSEAmoGcF7EX0sm8T/KhbEXRd+0mCoqLSpRzbNusMznHKTNAItlacZoCjtgerIIyhCT6M6U9Vh/gQUUAfapmcaK99IFx6Ch3WU5l6oVWrOnd3hXLdP4bi+RJAeTcya8pjsIYnVpeRtIhopJ3SZOQURNzM3hs6solvohbBVhrD0wwKChXTotApsmn7J7GGwCJiazkm2mGLdiBGyt8UUW2fqjiJcbFJSXn7Z+QprvEwR1Q3rQdCgYky2BQYqfG7QO0Nf8rMbKme5Vh5wb0JrUPSAZ4M1FedeugSr9Eo7WnXiM3QSJ2owDAgPcDeFZqLLALn5U/b3r4ZoQSQGDQZF6/gKF+sSs0PeIJUtbEgzYYUTq9vlt+1TPDZGzfYD5RAcc4rRUdGUDM2VWn5CQNHX/RezlwLqemEd/nCNsUUQJi/vyaC7VMesW8J1zneyzEg3uNByZSpWIVUazOsmptph3dsa0xPA==
X-Forefront-Antispam-Report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:DM6PR12MB3370.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230022)(4636009)(366004)(396003)(39860400002)(376002)(136003)(346002)(451199015)(38100700002)(186003)(2616005)(478600001)(66899015)(2906002)(4001150100001)(31686004)(6486002)(966005)(45080400002)(44832011)(66556008)(8676002)(4326008)(6666004)(31696002)(6916009)(53546011)(36756003)(8936002)(86362001)(6512007)(66946007)(66476007)(26005)(6506007)(5660300002)(41300700001)(316002)(7416002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?aVlzUUtSUUtuZ01qWFFJbXdKVkVzVzd3Kzd3dGVCUDRsVityaDlURkszbHpB?=
 =?utf-8?B?Y1JQVU1kVlJwS1BDYWhMSUdNK3p1dlZGWHAyTGhTeUl2V3RoS3BKTjJGdXJz?=
 =?utf-8?B?WWF2UGpKVlN2U1hGcW5SbU1LTEFRcWdGUTF2aHFZeTRseDh2MlNRU2JZZUJp?=
 =?utf-8?B?bUNaWlF4VXJTVnFJd2JOTmFmS0JMYkZvRTRGS2R6Y3pvNEhXK1Zra0xMVDho?=
 =?utf-8?B?d0cyU0I5c1d4b0N1cUd4QXNiK0Y2bStNdDB1Uk9qdXlBN2MwWHFFaFZiSVBZ?=
 =?utf-8?B?V3ZOcmI1ekw2bEJsNmVycG9CTUw1UzkrM3FRd21ZMWpMbUMzdmc4ejVKWkNk?=
 =?utf-8?B?YyszaTMxQVNQWWhrRDRCcFI0OTlHWDZWVEhRdkFGNkJMUVR6K2ZlU1ZJNUdU?=
 =?utf-8?B?N25uYVVSRzJrL2k5Z1hyTlVOUnIvdVJiejNDMlJZcDBDN0J2WGFUcXloS1FY?=
 =?utf-8?B?S3VwOWd3RkNMWDR5WUZDQVZJd2RsSW9IbzB6ZFJySnN5RlV6bEZRYlVnNlRk?=
 =?utf-8?B?c0hUU2JtUEJRVEZ5cm5TbEVnUHVxOEF5cXg2WnlzOVl2VEMzeHVsZnpqeDVL?=
 =?utf-8?B?RHM0eVBvRldBVVF5emxiTzVBOTVPMnVDWmxPVXJOQ2dycFlyOEFwTTNjaU15?=
 =?utf-8?B?WElLNFpwVXZZeEdqZExJUUR1bVl1ekx2WTI0bEhkZmRkUTJwWERFWjlvbzF3?=
 =?utf-8?B?d201SlN4SVhMOTFiQ0lwek0wZlNTZXhoYXEzSWFWWUVMT3RFQXdLbHhBc2Y0?=
 =?utf-8?B?b1k1ODhxSnBwVDN6bnR2NzZ3c0k4VEljZC9IaHNpd1lzV0hxN2VtZlFoNmV5?=
 =?utf-8?B?VFozcVJHNEJtS1VyZzBGZWR2UGtBWVFtWVNlKzByUUpxYkdLREFIK2VBa0dX?=
 =?utf-8?B?VTVLZmR6UnBmYzR3Y1ZBMTZMU3FNOXZNSldyWlMvTWFwaitrdWdka2VHSjFK?=
 =?utf-8?B?bDhCc3VtMzVqOUNDNzcwNkJLdXhaczNURjhLdVJySVo3QlJkbDYvY3o3VFJ4?=
 =?utf-8?B?SmVDSWIrNFMzekd1bDMzRnJGWG5IWjF4RUY2ellscE5DeG03VWhaNnVacGZQ?=
 =?utf-8?B?NEVqUGZEcytDMlpQNUV2T3BNOUtTMDR4VkRhMVNRUlFRUGJFeXkrZmZucURl?=
 =?utf-8?B?bThxUVl6R0Q0VDBTR0cxb1M4cGVtSFA0QnNTR2c2VjJrZEw4b3kwSmlBbU1X?=
 =?utf-8?B?bkNoWGJEUmdWeE1oUzlzemw4R3dXMklpNjFpNmxYUlArVkREL0xzbTlQS2xN?=
 =?utf-8?B?T2tad3J2VWx4WXZuV2RzS3VWdzJCcVV4TjRMUFFKWFgvQlR2NURNTXlJWGIr?=
 =?utf-8?B?RFEzdjQ0enIzWnIxdDlMWTlwTFdDTDZDQkJVY0lvbnNybDVEV2ZCL28yTXJv?=
 =?utf-8?B?cU5QQStQMHV5QXU5SDE1NUpVaXB2YlFBWE1iZWQ0SVc5WUpkSDB0RnNYMGxQ?=
 =?utf-8?B?L0JodVA0dWVnT1UvOWhzUGhSZktXVk9uZnlIeThheXVRNzVRaStYaHBLYWtJ?=
 =?utf-8?B?ajRZWjQ4OE1GQjZWcmZFQit3SmNPUHJGVGtxL2RrVjRhVVBGRFkwMUY0Y3Q5?=
 =?utf-8?B?dWxjMHM3bzN0WHY5ejlhaExOaC9SaG5nc24wenp4c2RWMEJ2aXkrT2c1VGQ4?=
 =?utf-8?B?eHJGc2U5Y3pnRWFCbDJlSlk1c0lCaXZ6R09UekQrbzVpVkRNQ3V6NkNIS29v?=
 =?utf-8?B?NXhsaTZVY21XckRFTE5nN3psYUU4cXRncndzSElUZDFNK1VlQndIeE8veTVj?=
 =?utf-8?B?STExU2wrdEdyUzd4Mm9LOE01L2d1bXVVS3NXZjZTTm1HRFJZSEFZaFJHR2FI?=
 =?utf-8?B?K1M1TG9FQldrbXlrTUtSL0s5b3NKOEZ0NFB4RGxKU1BqaFB3SXk5dElSRmVp?=
 =?utf-8?B?dmN0WjZGT3ZVNU84RmpXUEVHM0hNUnRXZ0grdTloVS9zaTR0ZVFibDRFRmo5?=
 =?utf-8?B?UzJjNEFXTysvU1pudlZyckFSVlI3d3NBcFR5L2pXRDVDL01telNGSERxeS9O?=
 =?utf-8?B?dlBYTHViNjd5djNDYXJZM3VScnMraXRIM0lZbEp5UE9Md3hhVFdUNkJlQW9W?=
 =?utf-8?B?RjZDNFBOR1JldGNkMVlQZGFTNzE3ZDlNRnZmbGQ1WDhXSUdnN3F2bkp6U3ZR?=
 =?utf-8?Q?aDVqoEYgtQSo75ougFkvi4SAa?=
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 98a45d05-4649-4cb9-cbd9-08dab340019f
X-MS-Exchange-CrossTenant-AuthSource: DM6PR12MB3370.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 21 Oct 2022 08:41:11.4437 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: GpDetdkIfbAz1foXMIm2PEmIPULnMWF3/EdNI7ncGVSeYMi/iE90eklYv+Xstb2W
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR12MB6691
X-Spam-Score: -0.2 (/)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 2022-10-21 04:24,
 Luben Tuikov wrote: > On 2022-10-21 04:18, 
 Greg KH wrote: >> On Fri, Oct 21, 2022 at 03:55:18AM -0400, Luben Tuikov
 wrote: >>> On 2022-10-21 01:37, Greg KH wrote: >>>> On Fri, Oct [...] 
 Content analysis details:   (-0.2 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 RCVD_IN_DNSWL_NONE     RBL: Sender listed at https://www.dnswl.org/,
 no trust [40.107.223.41 listed in list.dnswl.org]
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.223.41 listed in wl.mailspike.net]
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid -0.0 NICE_REPLY_A           Looks like a legit reply (A)
X-Headers-End: 1olo6I-0007Fd-Jv
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
Cc: rafael@kernel.org, qemu-devel@nongnu.org, liushixin2@huawei.com,
 joseph.qi@linux.alibaba.com, linux-mtd@lists.infradead.org, richard@nod.at,
 mark@fasheh.com, mst@redhat.com, amd-gfx@lists.freedesktop.org,
 Yang Yingliang <yangyingliang@huawei.com>, hsiangkao@linux.alibaba.com,
 somlo@cmu.edu, jlbec@evilplan.org, jaegeuk@kernel.org,
 linux-kernel@vger.kernel.org, linux-f2fs-devel@lists.sourceforge.net,
 alexander.deucher@amd.com, akpm@linux-foundation.org,
 linux-erofs@lists.ozlabs.org, ocfs2-devel@oss.oracle.com
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 2022-10-21 04:24, Luben Tuikov wrote:
> On 2022-10-21 04:18, Greg KH wrote:
>> On Fri, Oct 21, 2022 at 03:55:18AM -0400, Luben Tuikov wrote:
>>> On 2022-10-21 01:37, Greg KH wrote:
>>>> On Fri, Oct 21, 2022 at 01:29:31AM -0400, Luben Tuikov wrote:
>>>>> On 2022-10-20 22:20, Yang Yingliang wrote:
>>>>>> The previous discussion link:
>>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Flore.kernel.org%2Flkml%2F0db486eb-6927-927e-3629-958f8f211194%40huawei.com%2FT%2F&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7Cd41da3fd6449492d01f808dab33cdb75%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019371236833115%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=C%2Bj1THkHpzVGks5eqB%2Fm%2FPAkMRohR7CYvRnOCqUqdcM%3D&amp;reserved=0
>>>>>
>>>>> The very first discussion on this was here:
>>>>>
>>>>> https://nam11.safelinks.protection.outlook.com/?url=https%3A%2F%2Fwww.spinics.net%2Flists%2Fdri-devel%2Fmsg368077.html&amp;data=05%7C01%7Cluben.tuikov%40amd.com%7Cd41da3fd6449492d01f808dab33cdb75%7C3dd8961fe4884e608e11a82d994e183d%7C0%7C0%7C638019371236833115%7CUnknown%7CTWFpbGZsb3d8eyJWIjoiMC4wLjAwMDAiLCJQIjoiV2luMzIiLCJBTiI6Ik1haWwiLCJXVCI6Mn0%3D%7C3000%7C%7C%7C&amp;sdata=pSR10abmK8nAMvKSezqWC0SPUBL4qEwtCCizyIKW7Dc%3D&amp;reserved=0
>>>>>
>>>>> Please use this link, and not the that one up there you which quoted above,
>>>>> and whose commit description is taken verbatim from the this link.
>>>>>
>>>>>>
>>>>>> kset_register() is currently used in some places without calling
>>>>>> kset_put() in error path, because the callers think it should be
>>>>>> kset internal thing to do, but the driver core can not know what
>>>>>> caller doing with that memory at times. The memory could be freed
>>>>>> both in kset_put() and error path of caller, if it is called in
>>>>>> kset_register().
>>>>>
>>>>> As I explained in the link above, the reason there's
>>>>> a memory leak is that one cannot call kset_register() without
>>>>> the kset->kobj.name being set--kobj_add_internal() returns -EINVAL,
>>>>> in this case, i.e. kset_register() fails with -EINVAL.
>>>>>
>>>>> Thus, the most common usage is something like this:
>>>>>
>>>>> 	kobj_set_name(&kset->kobj, format, ...);
>>>>> 	kset->kobj.kset = parent_kset;
>>>>> 	kset->kobj.ktype = ktype;
>>>>> 	res = kset_register(kset);
>>>>>
>>>>> So, what is being leaked, is the memory allocated in kobj_set_name(),
>>>>> by the common idiom shown above. This needs to be mentioned in
>>>>> the documentation, at least, in case, in the future this is absolved
>>>>> in kset_register() redesign, etc.
>>>>
>>>> Based on this, can kset_register() just clean up from itself when an
>>>> error happens?  Ideally that would be the case, as the odds of a kset
>>>> being embedded in a larger structure is probably slim, but we would have
>>>> to search the tree to make sure.
>>>
>>> Looking at kset_register(), we can add kset_put() in the error path,
>>> when kobject_add_internal(&kset->kobj) fails.
>>>
>>> See the attached patch. It needs to be tested with the same error injection
>>> as Yang has been doing.
>>>
>>> Now, struct kset is being embedded in larger structs--see amdgpu_discovery.c
>>> starting at line 575. If you're on an AMD system, it gets you the tree
>>> structure you'll see when you run "tree /sys/class/drm/card0/device/ip_discovery/".
>>> That shouldn't be a problem though.
>>
>> Yes, that shouldn't be an issue as the kobject embedded in a kset is
>> ONLY for that kset itself, the kset structure should not be controling
>> the lifespan of the object it is embedded in, right?
> 
> Yes, and it doesn't. It only does a kobject_get(parent) and kobject_put(parent).
> So that's fine and natural.
> 
> Yang, do you want to try the patch in my previous email in this thread, since you've
> got the error injection set up already?

I spoke too soon. I believe you're onto something, because looking at the idiom:

	kobj_set_name(&kset->kobj, format, ...);
	kset->kobj.kset = parent_kset;
	kset->kobj.ktype = ktype;
	res = kset_register(kset);

The ktype defines a release method, which frees the larger struct the kset is embedded in.
And this would result in double free, for instance in the amdgpu_discovery.c code, if
kset_put() is called after kset_register() fails, since we kzalloc the larger object
just before and kfree it on error just after. Ideally, we'd only "revert" the actions
done by kobj_set_name(), as there's some error recovery on create_dir() in kobject_add_internal().

So, we cannot do this business with the kset_put() on error from kset_register(), after all.
Not sure how this wasn't caught in Yang's testing--the kernel should've complained.

Regards,
Luben



_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
