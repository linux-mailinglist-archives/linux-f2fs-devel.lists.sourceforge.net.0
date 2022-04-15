Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id E04C850273F
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 11:16:16 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-4.v29.lw.sourceforge.com)
	by sfs-ml-4.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfI3r-0007si-M4; Fri, 15 Apr 2022 09:16:14 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-4.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfI3q-0007sX-Ct; Fri, 15 Apr 2022 09:16:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=cXmWoxiNrFUT36KRaCWH5ftRvcuoLnY+vq0rmT1Kt9U=; b=e4nbIzLH3e34ovgfJPyFWcJS0N
 HflQsoJ2wdgRKqb81ez4oztHlo6eUFG9gvrTgZbOjUy2MDYHY2WnQyhMr1eWrazIyXIAkQ/JUSqUr
 YM0HMicucjXkc83AN+Xf87raHsO4iwV+CpRYMn4o8n85XnootXvUfmWwQamBN5ZWf4mk=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=cXmWoxiNrFUT36KRaCWH5ftRvcuoLnY+vq0rmT1Kt9U=; b=YPD3Weelg7f6nlPZQCVsjxCLln
 Cxtbk2vtObVFDQHAGyCtZnN+3jZ/hJ9bt+0UzrWEx0BIIjJkGkUyYAvhfR6/eG46DVFeLsXrtqkjj
 0SOhyW5WIF/jhYvGoqF/yJzKfm4u6GbsBXyo7Jw7sisAppYKTW715S/U709l+12Hol1g=;
Received: from mail-mw2nam10on2044.outbound.protection.outlook.com
 ([40.107.94.44] helo=NAM10-MW2-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfI3l-0004Xz-0T; Fri, 15 Apr 2022 09:16:12 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=WU7wbWXMPRMCSKSHOIytJ+eX2d7dPF5S2B41rPR3o4NX7LGL0eHg2cjg0QKdThr7boThD7I81sqWbwhiim08Hq3J4/Jj657abDF6suNR7NgQVF22H5N1SZTbnBnf2Pqd5ZD8THBZ+JXLf2jOteWlqiWuGapnIk2FLAMdxDsgiBkTFNCBcKydzcIv/JHfXGsmFDgTSnYcb4cOIM07K1LX2JGAX4Gi9vT6SQ5ulze2BRBcHyHn+Y44YjQyz7lAI8dK+YtktkWZZ3HDcnkP5N1ftYZe0iF1KcXU0nmLDJW8pAv4Vu350YkK2wQIxW0rHbAVMNCHjXq8MLHd6d0CvE1zhw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=cXmWoxiNrFUT36KRaCWH5ftRvcuoLnY+vq0rmT1Kt9U=;
 b=HKq1lIpiEHpgz9XqSMCEvSRBp9j3kHVQVk5Sswl/JMPviKMnDbhJNWBGyF8HPEMM6FoOOLF1FeEezIR12hm3p7VJCfN/erbDjSP+lQnc2KCFWy32yVAnz4VK3JoAVwiJ9QGkhqazVUmun/MHtWU6jXTyfZQTd7r8SAZmBicxVR++jI+ImkjoLqjdr0YnTSkumqBuEuG5fK5W+IzZJETt9umKCLvJm5dcmXgpgAEiLkwDPsIMlbq/c5AyQ2O4ftDAJ6gCkqB2TGJhaGfeCa4k2oac/XHH18to4YhjNptm+inZc29pqJ74rR1q3TftXkc2g8A2Pptz+dk8+26hhQ3k+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=cXmWoxiNrFUT36KRaCWH5ftRvcuoLnY+vq0rmT1Kt9U=;
 b=PjcfOcmcIW+IJ+Rx7sLUBgkGMqL5A9o8uphx3jDX0X3PWGeQ7n8JJwtjzF4wxaDknIExHlAPQjAebMZY/u+ZU5YXZqony9jVj93r9e42VIOUwZtZOUhVOKYzuPQ418L2D9YinV5P3ASM3hpk+Z8l1gtLXh/oKAgJEPl0rxL6fjq4jhUXXVow5xQzmMlj45FbdPWI+THaSSV30hXXb4Z3aPWoVQxkZlwvOPVOWmMxQecPzPnSIjNvA0awydisQaYqmiVEPzY+LECJ09AJUKiN+T2VQ+aQxh+vAkV4lFt8kJAQHYNWnsYXDOKMmAOABtDsDaUImG5BHHxkuAKfIqczjg==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by CY4PR12MB1815.namprd12.prod.outlook.com (2603:10b6:903:122::21)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:42:07 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:42:07 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 13/27] block: add a bdev_fua helper
Thread-Index: AQHYUITeWwsZSeujF02rS5YtUAwIEKzwdgyA
Date: Fri, 15 Apr 2022 05:42:07 +0000
Message-ID: <77dedfc7-d5af-4d87-0383-613b80139850@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-14-hch@lst.de>
In-Reply-To: <20220415045258.199825-14-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: 78d5bffc-1ecf-410e-e5e5-08da1ea2addb
x-ms-traffictypediagnostic: CY4PR12MB1815:EE_
x-microsoft-antispam-prvs: <CY4PR12MB181583C18B6F4B1306D9F075A3EE9@CY4PR12MB1815.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: EyB8hyf1JleddzYMugoCzU5pDkbuoBJ4pMtfwahP2ogCrshpAMwi/M3kryaDsr86Ji8Q9U4kHeq8opzY12HtfVHQnFhUIP4brKkdTIq4Y6ukil1eCLgOOYlrZ5o1P0nbImPP8bumuAkoyxQWEqr2pscBJl7suKAqCf+rn7r+oOenvqj+4obi/miPtobHImnRCiFqVQgtDsT/N32Ixv+yCvs7EJ/Hlgkoeim10mAXruT2vQpZWRXCIY71uWhnrRmvywzHl7+0ryrDGpRopaC4VXorwnKmlY7xCtQdT3mJrLKecVx4z1anmMntcRJN4vtQSorQWycnaL1JGitCMJ13sT7IUOpDp8A9esZxVNNwKoF5yroommwEp/ZWFV25t1L6NdLAVHxuUSTk2hLWvATU1xURTecgCIb0C+Nt7FJH9FgvN1phKoF3Jy0/LQ7Z2L5XS7q3Y2RTN4gd17beEyBfgw9bBAZ7KGjVbp0h4a/agz8f8JNJ14537BDPs6J4py2NSMmRbnayX1NHA9E2IbENVLOxyFwNhoNxoUeEk4M9KIZevesgLhYW+Jmz/E5nFz5VzA4tF30LXK/mutY8o+Q3ehw562gSxt3f8beQMVMuO4uH1b0XtHszv8e4ig5MbRiv7U7I69/l0BQK5qbz4DsvzlZdDK2gMlITuS6vpjPKMLETzOjcBDVIkDggnK+CZDCHTsQf7NR8pON2Gh1zpljGDLbLOiFSS7nCHuiYk3MYIrgjzUsd+XeEtmHZBqZVF24+Em7DxOzP3Z/CS72dLl3aOA==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(8936002)(2906002)(91956017)(7406005)(5660300002)(4326008)(66556008)(83380400001)(86362001)(31686004)(508600001)(38070700005)(6512007)(2616005)(186003)(53546011)(6506007)(558084003)(36756003)(66946007)(66476007)(54906003)(110136005)(71200400001)(76116006)(6486002)(38100700002)(64756008)(66446008)(122000001)(8676002)(31696002)(316002)(43740500002)(45980500001);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?Rmh3d1NVRWtMeEFsb25ENXVPcVBIMC9EU1JnVHNBZDdqNHpPUDR3SGJFb1B1?=
 =?utf-8?B?WFVvOWJBVjFvWnNHOTdvQmVRQ2hHeHN3UlNEVHRuazZ5MFI2SVVraTQ5UEMz?=
 =?utf-8?B?VzZYdTAxRVp6U1RtSUFzUjdSaW5udmZySW9BenAvM2FZZ09hQVJ1SlVqUDJh?=
 =?utf-8?B?eXhCQm1lZExVT2pKSFRsNUt3RjlteDdQZk1LQkdUT2xNTDNoWSt2SThmMUVE?=
 =?utf-8?B?MCsxUi9lcU5OYTdzL1RFZ3kvMWVSa1Jjcjl5YVFJUDVyWGVzL1lmK2d3c3c0?=
 =?utf-8?B?eW5BL1pOdVp1SW92TzhlVzFJR3ZhVFFxYTdKRTMyN1ArMFVGZ01NYjZ5WnU4?=
 =?utf-8?B?SE8zQXdaWHkrclZZWWYxWWsyWEJMU0VSWFEzRldFU09HZUdock5xZGYrL3F2?=
 =?utf-8?B?VU1yN3FUYzk2Ny9JYXhNQVZqdTlCUkoxbURaUE54M29ZdXBVM1pWZGUvc3lo?=
 =?utf-8?B?em03MStETWlGekZqQXA2L3dHdjlWZThmbkk1VHdzMDN6eHo3YTNuZEc0cWN3?=
 =?utf-8?B?WFBvWDhlUTIwMCtjcVRqbjhUbGhCZTdRK1hFbWw3LzRSeHNQWGk4U1o1RG1G?=
 =?utf-8?B?ZEcxbGZlN3VkWlQzT2FZM1hlR0cyZVcreDYrU1ZpakhoS2V6ck1ka3pnSjV3?=
 =?utf-8?B?c2l3dVBUdE1mUVRnMGVYRGpSLzdXVTNRUzNHUitqbHVKaUNlb0RVcE9najdp?=
 =?utf-8?B?OUxqaFZXbzhZUXNNemhHd1lCcGRvQmlPSHFIc0tid3lPVlgyK083Z0ZuT3dh?=
 =?utf-8?B?SUVZdUxjb2lHRkNSRFhHODVKMklUYStkUDVYN2RVWDNLcUpaZmIvMk85WmFK?=
 =?utf-8?B?UzN1ekVRTnAwVVF6RXR0YmJSUXVnYlZSbmRSVTZoSHZrc1BKUXlVeGpVMkE0?=
 =?utf-8?B?dk5ram9IUTMwVXNZVFU1WmluR2NZZkIrSlNXQ3l2NEpXZUhZbXYzbHNDTnUz?=
 =?utf-8?B?UXNxM0JGUE1ORWFaQWphWEVIcEZpS1FzQUJZYUtmeURpa091SlJxMTJUOTFQ?=
 =?utf-8?B?MmIvMU1ucUVkWEFvblNJZHh6QVFmbUxSMUJzQ054MXdGV1h5eDJTSU5XTjZp?=
 =?utf-8?B?RkprY1hweDJlNDRnUGpIMEFYWkVuMERPUGk1b0FmTHRyNzFyRHpHemgzVHZp?=
 =?utf-8?B?RVZ0aXJxRXF4cGVmQkNYd3BOdzZjSWtVSVd0UWwxa1QrdFlNcEo3NjZZTVU5?=
 =?utf-8?B?L0Nid1ZoSkI5U3YvNkZNclY1dVZGaWZlTmROQ1lHUkJDa3AyYTZkWm1CaDNn?=
 =?utf-8?B?K2tWSy9va0hNcmRhZWl4SFV4RjNDSTFCaUdOeGVjNjNscmsyNFJUQWEreCta?=
 =?utf-8?B?dURReHdvTnplV3IyTWJzRjd0QS9mY0Z5b0hKQjhNT29MQnhYZXowZ1EySHZC?=
 =?utf-8?B?VWRRVEhGV1R2V0llT29Vcy9XZXBjemlQV0FpeXVnYXRPODd1NHczY2xiaFoy?=
 =?utf-8?B?cVo2WDV4UmF5TXh2M0R5TnVRY3dkakI2Mm9kOUNLaUhtRHA4M0plYlFuQ3hI?=
 =?utf-8?B?SHdkaldiWTRnUkx1VzdjYmUrdmZCMFQ0VHg3V0wxeUpJTy85Ujd5Q0hPc2Jw?=
 =?utf-8?B?YkFLMnE3Nk9zRENtY09wQXJkaUV4QmJVOElZb1pWTmNTUnd4NDZGVXkySU9T?=
 =?utf-8?B?UG1xRDVGMGhtb1AwWWo0UFJ6SmNiY1duYkQvcTBEY3p4OWREWVY4cXZtNzhG?=
 =?utf-8?B?dVNMcnU0ZVRCV3hjNG5kNGdnZlo1eGVwaHlIbWRtTmVXU0RXYWdRUnpReGJq?=
 =?utf-8?B?ZU4rZytpajlJdzJ0ZnNqV1lCYVlBNloxYUVYOUtmaUMwQ0UrYjZMMDVJYTUr?=
 =?utf-8?B?eHkzc0JVdnBvcmVabU9KeURONnBiRXZuN21mT2NJcVpZam93dXRDVFVyL3VC?=
 =?utf-8?B?UDF0cjhFU1hmaG1oQUlPdjluVjQyUng0YjYwUlhQT2x3MWVHOGxzc3BhYWdn?=
 =?utf-8?B?aWdCZ24xZmVselZnWTJtNng0Q2pvWGRUdXVBZVhTNlV2Umg0T1BxcjduVjRT?=
 =?utf-8?B?OGsvNnZKd1M5bXptRWdoNGNobDdTamxFbXNTMzhCOWxOSDZMTGZ6V0RHeHE4?=
 =?utf-8?B?czkxb2JnVnB0dHExUE9vODdBNWFJdlhqLzBrakJrMU1mSWlKSll4M0pTOWxk?=
 =?utf-8?B?SmZOTFN2cVJpdXB0UVdxSzFMVUt4RjFENFNIanNNWWovYTFkT1J4Q2c2SEhB?=
 =?utf-8?B?MGJKUk5PdUZyZHRSekVETit4MkZ3WUo2WmRZV2hmaitKYjRybnYySklQdHVB?=
 =?utf-8?B?dlBFMzlYdENUUHpCL3NXak1WU0FiZ091TGswZ1pSQW5ZZTlWN3lZWTJCVnN6?=
 =?utf-8?B?YlJEeHlaMnUzL2tuZ2pHM1lBN2g5T3hJVXJDSGdOeGhaSDg0Rm1Va2loa2c3?=
 =?utf-8?Q?1Z66E7GDw37e6nTgD+MH8VjpaJC1xSuIdTeG5?=
Content-ID: <DF997BF112FF594981505DC1D908FBEE@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78d5bffc-1ecf-410e-e5e5-08da1ea2addb
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:42:07.5188 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 4Ta0Zovff0U+n3TbFxVzpBAWYFvV5vI9cPj3l5EKpKj/yjyOIuU3gSYzhUD53UrhII2nt3yMopUhXs1a5HAr+w==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY4PR12MB1815
X-Spam-Score: -4.1 (----)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Add a helper
 to check the FUA flag based on the block_device instead of > having to poke
 into the block layer internal request_queue. > > Signed-off-by: Ch [...] 
 Content analysis details:   (-4.1 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.94.44 listed in wl.mailspike.net]
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -3.9 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfI3l-0004Xz-0T
Subject: Re: [f2fs-dev] [PATCH 13/27] block: add a bdev_fua helper
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
Cc: "jfs-discussion@lists.sourceforge.net"
 <jfs-discussion@lists.sourceforge.net>,
 "linux-nvme@lists.infradead.org" <linux-nvme@lists.infradead.org>,
 "virtualization@lists.linux-foundation.org"
 <virtualization@lists.linux-foundation.org>,
 "linux-mm@kvack.org" <linux-mm@kvack.org>,
 "dm-devel@redhat.com" <dm-devel@redhat.com>,
 "target-devel@vger.kernel.org" <target-devel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "drbd-dev@lists.linbit.com" <drbd-dev@lists.linbit.com>,
 "linux-s390@vger.kernel.org" <linux-s390@vger.kernel.org>,
 "linux-nilfs@vger.kernel.org" <linux-nilfs@vger.kernel.org>,
 "linux-scsi@vger.kernel.org" <linux-scsi@vger.kernel.org>,
 "cluster-devel@redhat.com" <cluster-devel@redhat.com>,
 "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>,
 "linux-ext4@vger.kernel.org" <linux-ext4@vger.kernel.org>,
 "linux-um@lists.infradead.org" <linux-um@lists.infradead.org>,
 "nbd@other.debian.org" <nbd@other.debian.org>,
 "linux-block@vger.kernel.org" <linux-block@vger.kernel.org>,
 "linux-bcache@vger.kernel.org" <linux-bcache@vger.kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

On 4/14/22 21:52, Christoph Hellwig wrote:
> Add a helper to check the FUA flag based on the block_device instead of
> having to poke into the block layer internal request_queue.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> Reviewed-by: Martin K. Petersen <martin.petersen@oracle.com>

Looks good.

Reviewed-by: Chaitanya Kulkarni <kch@nvidia.com>

-ck


_______________________________________________
Linux-f2fs-devel mailing list
Linux-f2fs-devel@lists.sourceforge.net
https://lists.sourceforge.net/lists/listinfo/linux-f2fs-devel
