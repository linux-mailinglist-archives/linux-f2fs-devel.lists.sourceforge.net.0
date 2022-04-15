Return-Path: <linux-f2fs-devel-bounces@lists.sourceforge.net>
X-Original-To: lists+linux-f2fs-devel@lfdr.de
Delivered-To: lists+linux-f2fs-devel@lfdr.de
Received: from lists.sourceforge.net (lists.sourceforge.net [216.105.38.7])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F1D450254E
	for <lists+linux-f2fs-devel@lfdr.de>; Fri, 15 Apr 2022 08:06:43 +0200 (CEST)
Received: from [127.0.0.1] (helo=sfs-ml-1.v29.lw.sourceforge.com)
	by sfs-ml-1.v29.lw.sourceforge.com with esmtp (Exim 4.94.2)
	(envelope-from <linux-f2fs-devel-bounces@lists.sourceforge.net>)
	id 1nfF6L-000804-Hg; Fri, 15 Apr 2022 06:06:36 +0000
Received: from [172.30.20.202] (helo=mx.sourceforge.net)
 by sfs-ml-1.v29.lw.sourceforge.com with esmtps (TLS1.2) tls
 TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384 (Exim 4.94.2)
 (envelope-from <chaitanyak@nvidia.com>)
 id 1nfF6J-0007zs-A3; Fri, 15 Apr 2022 06:06:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
 d=sourceforge.net; s=x; h=MIME-Version:Content-Transfer-Encoding:Content-ID:
 Content-Type:In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender
 :Reply-To:Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To
 :Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
 List-Subscribe:List-Post:List-Owner:List-Archive;
 bh=gg8hdgNEhj02MY/XmMdpyN8wb87wt0DFAivKrNj4n08=; b=D2uigHPIHF20wsUukEkshLirUa
 d7gGwPZteSt92ose98tjcqfNlTY/hYuvMQzGVUXAs8lM/k0AiTuG9eogJd4vVhRLlN3EbiYf5o7YN
 gL1jd1uBMcFPUZxyOGfLIeIQb8Oq9x97Gg/4s/f7ZbpKPh/vO6CyUKza6st8Vs+jRi3g=;
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sf.net; s=x
 ;
 h=MIME-Version:Content-Transfer-Encoding:Content-ID:Content-Type:
 In-Reply-To:References:Message-ID:Date:Subject:CC:To:From:Sender:Reply-To:
 Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
 :Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
 List-Post:List-Owner:List-Archive;
 bh=gg8hdgNEhj02MY/XmMdpyN8wb87wt0DFAivKrNj4n08=; b=HTQbBDzv+E/zxrV9rw1fAmgPFS
 io/zyjQnIjAP9UQGh6b4mhXycZKFQoiBbUYyAniYqxmaKr0UVh9KIbdIgSApEpdC1L4Lqzksjali2
 zPSkttgOtydv2B5Ix1Hj6pGA/fVNWMli8xqyVGG+mIFyDkSnHFXCz3Bo59QCnJigG4V4=;
Received: from mail-dm6nam10on2052.outbound.protection.outlook.com
 ([40.107.93.52] helo=NAM10-DM6-obe.outbound.protection.outlook.com)
 by sfi-mx-2.v28.lw.sourceforge.com with esmtps
 (TLS1.2:ECDHE-RSA-AES256-GCM-SHA384:256) (Exim 4.94.2)
 id 1nfF6B-0004tU-Vv; Fri, 15 Apr 2022 06:06:34 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=O77Ekaajc81OAFOi95GlPR4qcqaBkysRHsJ43vFj1+j3H3zLtSUSqZUgbck05+m4DSy9MMrse7WZocMAwHtUfg3UyWBUfse+6nx1sGW0+7mq0XASog4m1XVFgjPp8rdSIM5tx5IbNA7UhqYvbNZ4b3pKlQA/BdrMKRbQ5+gd50O7Wvq5adewagI0+2R15UvKZIwSieXyV93tgXxuyTqGlUcEjVpHRvyBWPvcI81M64098L5mQr8udbKzqt8nEmImFpxC3DCVIYhgVhkWidXrMpzZfmRiQljqlO9/VVQPqSQQs61a63GpccjAjXny4IGLF2wUMT6Se6SpFO2haEIx7w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gg8hdgNEhj02MY/XmMdpyN8wb87wt0DFAivKrNj4n08=;
 b=jvguEBMxycXbMCw6KPaqOa4VrhjKN9V7qiaNFWMwsqbfLjBYgQENWNFsj6ZMi2P1fT4Y6agiBkPTFtUyhBFWuWrE1bi3V3PiwpdSAbk7MIssOAqWRLZBqXaVnNjDHGFfH8hAPV0RdufDizG/sjrdB09LBoYh0Osnq3kDjgv6riaMxfMPXNK6G8tBGlEhIgqPS363DChPE3g2Ef/K/nllIjxcrUEv8mvcrnkpP12p57t+rLO/YKzFlvFG3ePYKKIZiKxwqC5GQNEmeyTsE1Gwf+9yU/ydFjpva9A8DRNAATmD1DdZXXMPQX/yra+sryYPqCC5OHH3H0w6sIG4CGt3Cg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nvidia.com; dmarc=pass action=none header.from=nvidia.com;
 dkim=pass header.d=nvidia.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=Nvidia.com;
 s=selector2;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gg8hdgNEhj02MY/XmMdpyN8wb87wt0DFAivKrNj4n08=;
 b=VDfgTaSk5uOJnNTZAAWJSAbOvvp7Dt4od+YuLkDUMZ2ERormmWeB0Q+sPvkB5n8RJoFUxRkiwP+nDz2Fs35bmeYFbR6mPO7uQUMmz8n+49u7LUiIP7y7mFawzwK7yKMqEI8j4UQb9MnM2x3Ux28jnKdTq3TvNRrMh+Cd30qzvuh4VFhe5SOTf9k8SzDkKUBCFMDoLPfntk5xglLsaVsAJ0vk30HUrRpiyKMMuKHle45ZrfOjcTEmsdvFY6+fnxfZJUNzP25uVLHPMXEvhyITTPlYWasjDVq4Nqh/uR27m991It4FlP/HgYDyr4CYtAh1OK3Ou+7Afi6ldKj5DeFnFw==
Received: from MW2PR12MB4667.namprd12.prod.outlook.com (2603:10b6:302:12::28)
 by DM5PR1201MB0169.namprd12.prod.outlook.com (2603:10b6:4:55::22)
 with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.5144.29; Fri, 15 Apr
 2022 05:51:29 +0000
Received: from MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b]) by MW2PR12MB4667.namprd12.prod.outlook.com
 ([fe80::a90b:9df2:370c:e76b%3]) with mapi id 15.20.5144.030; Fri, 15 Apr 2022
 05:51:29 +0000
To: Christoph Hellwig <hch@lst.de>, Jens Axboe <axboe@kernel.dk>
Thread-Topic: [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE from
 REQ_OP_DISCARD
Thread-Index: AQHYUITx2Wbm58EJ9UyANBYH5JqbHKzweKgA
Date: Fri, 15 Apr 2022 05:51:29 +0000
Message-ID: <ad050f78-2d64-0ff9-a6b0-968cfa53eacf@nvidia.com>
References: <20220415045258.199825-1-hch@lst.de>
 <20220415045258.199825-27-hch@lst.de>
In-Reply-To: <20220415045258.199825-27-hch@lst.de>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nvidia.com;
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: c9fd5094-8dc8-417c-1c9a-08da1ea3fcca
x-ms-traffictypediagnostic: DM5PR1201MB0169:EE_
x-microsoft-antispam-prvs: <DM5PR1201MB0169C8FEB54422A788EA47EFA3EE9@DM5PR1201MB0169.namprd12.prod.outlook.com>
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: AmVfwKV6cd4uqx7He4BuZiTWp0+dFZvn6EzYAM/qM8fTafRDgAWKcLgUoMlxzsJPYe+yQX6WDo7+kOOvNSP1qP781PM+B2kjgmIo08YtxKcDWv8NCW+TpQR3IvIHAgE1OUK6c+WT4VB3oJrcV2vmJoS/+ddH6IHDewe2Ftogor2p+oKFRxGJj7A5qQ6NBla1a1aBdvnEZyIuQsvkx3H+FW6X2mGTjy4lO1K3ZmAq2Z/ycAshtZs6BVUFDr3C60r/jBPzVuGmm2kSQ3/xsgW1l/B1vIsQnRVXFm1cff8PyptIUiXNozdrEZ5eTeV1aX0zyp7TJTEMIL8jbd5Lel1KdL0iwNiYFC9BYAC3rMKweU/Q+5Ec8Vdz5xcpoZGYlj1FYv/SWNzZA0KFL9itvVdJte10Pcl6KQaU5mMRUQBTrWn9J9EmBuNqdbpSbvtdX7N12XqQ163AFebLWjsUVIJTMEJohi8GMAT7ShaGokObl+W37caJWbNxCs3NPznZAiSRdu12XyL14x8V1XFdDoibTUectDnELKTbuJ9hdUv6/6Y9ixL2uacBcUzLvhzwXS2P8xfrcItzXmQFBPx1OAsWvc6zYc/IfF6hSofnZCOqRNya6ocs0d8cjvnlr7+3NoOWeoLFSZqV/6QGmKKdmPKdWVoYx8NRG0dpBtVU8qUigY1IERlt4Y0kMx90+EZymw29N313FbUSHIZ/M4Ww2HQNApkHt6ZXb7eZrVYIqdrmmLknsJ2VEU+KBkOiekjlqC1YM32UJ8GWmnhbxrQX55cNdQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MW2PR12MB4667.namprd12.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(13230001)(4636009)(366004)(7416002)(66556008)(76116006)(66476007)(66946007)(91956017)(66446008)(7406005)(122000001)(186003)(86362001)(4326008)(31696002)(508600001)(36756003)(5660300002)(6486002)(54906003)(38100700002)(8936002)(83380400001)(4744005)(2616005)(64756008)(8676002)(110136005)(71200400001)(38070700005)(316002)(6506007)(53546011)(6512007)(2906002)(31686004)(45980500001)(43740500002);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?QzF4enRGVEozclBWQ2xUVjF5L1g3NzRQZkxXZmdSbGxpZVZLMkJtY1NkV1lR?=
 =?utf-8?B?aHFveDlYcnVyVUNXQXVYc3lZN1ZtRWt3dk5vNHEwN1lXUkdlRVEvVkIvazVw?=
 =?utf-8?B?Q3dTa0lsdnlyRk15ejFpTTIwd2EyK2Jnd3RNQS9WbzZHL3U2enYzSHU2bExl?=
 =?utf-8?B?dHlRckZXSmlPNEIwenZTcmFXdlEvUXI3b0tQd01KQ3RiNkxDbU9qZk5MOWNL?=
 =?utf-8?B?b3hRVUduTG1VQmJIYnFuNDNSZGFNK1FxSks4dTRleit5S0ZBSHJKN2dzWXE2?=
 =?utf-8?B?OW5qVGpUYmV1dTFSWGlnMUtkNzJPUDl4d0prZ0RsVFBBZ0JPTHhlY0xvdDFa?=
 =?utf-8?B?eW50T3FJc0J5YkNVcms5QldtMkJmamMvakZMUVl2SU9acUs3eElDQmxSUnBq?=
 =?utf-8?B?ZnkyL01hcy82YmtqQlJUSEJUd3lEaC9Ld3JacXRTNy9mQ0V5dHRhQm9FRjJQ?=
 =?utf-8?B?b3BOU1BtWXpqSUVoUFd0UGZBWUFmL2Y2U0FBQXVqOVVGMlFuRlU4ZTBSbDMr?=
 =?utf-8?B?K29nbDBZRTJPNHJXNnBqdnRRbWxLSnVNbWtnNnhoTVBKNU42UWlMSjRNYXVJ?=
 =?utf-8?B?ZjE2QjJac1lhd1ZFUXRaMDFsWVJLbmU2azZoV1VRd3FMYnkzcUNmcjNpN1F0?=
 =?utf-8?B?ejJPNmxyTVZqblBucUdEQ29VRFlLT1pUb0tOTUJyQkc0SGtrSS84UEhhNFUy?=
 =?utf-8?B?bGhpY1lKcUxzNWdqYnE3anI3S3dWeE1Sa3B1OEdhNi94UVl6TXZ2NGlUSUY3?=
 =?utf-8?B?dC9hZnR5RmIrUWN1OUp4TjZQOTc4ZXpIZU9kazUwUEJETDBhOSticFdYMDRo?=
 =?utf-8?B?Ti9DL2R5bVV6TnFpeDVYdzhnQzZOcDJYQVhxVHRiWkxqYjBoMWdiUjZrU1pa?=
 =?utf-8?B?d3RMVURoRHg4SlBJeTBraDZqK1RpMHlndnZCN1h3bDZjc0haN0I1K1JTYWVo?=
 =?utf-8?B?c016dkNObFNVa2VDU01Va2hubDdLbC8yS09TdGNHSVM0TFdVYldHckRNbUk3?=
 =?utf-8?B?RXhNdkZQcWRCTUJzdHBveUtBVVpQTkl2WGNHd0ZLeVVWUC9IbzYyck5lTDJV?=
 =?utf-8?B?SDQyRjJMN0RmL1dyL0xVZ2FKTVRBcjVUNTFDR3NFbUl2Y0gybjFwTFFoOUJ4?=
 =?utf-8?B?T1lKTzcyS1lKbVBGYlVOU0hqSHFUbTF0dXpMYXRTTVgxcmNzdHBIVnZ4N29z?=
 =?utf-8?B?YW9CYUhSekxRSy8rTGVvdllhU0VnWmZSZE8vejhNbnptWnZOQm4rUFRrS3Nx?=
 =?utf-8?B?aU9RQXdYRElEakFpM1RkL0N1YnVuVDh6Z2VPdUZBWDdJU3FRaTRYYlphQVFT?=
 =?utf-8?B?cGdNZDkwYUs0UUN4TlhGdUZCOENsbXNqbjh6QUZ5TThGTGM4eXZJa3luc1o2?=
 =?utf-8?B?TGtCR3VKYkthbXUxaHJMZmdjMkZhZlJOU3kzUWxMSlpFK05hTEhWQlZCWlFB?=
 =?utf-8?B?b0ROckVJcW52RWFxWUFpeGpWOWZ0WFNWTVZzUm15aWU2R2d4ZGwvT0k0OHIr?=
 =?utf-8?B?eGJ5Q1VYZWJGZ3RHQktJSE1RQWRBVFFza0J5SGhmQm1KVGhMdE1YSmMxUDY5?=
 =?utf-8?B?VmNiTjdJOWJhMnBsVHBFVTJaWm13d2d3VjhoaFpSSm1sVERMZkVGUTlFSWtH?=
 =?utf-8?B?OTY1QUN6UlhtbFhsNUIydW9Bb1VDTUs4L3pSMEIxYktlZ1hidy81aHBIOTZC?=
 =?utf-8?B?RWgwOXlPZ2E3Ti8vM25yRG4xUFZSblBjM2ZGVVBEck1qM2JmYU4xVzJTVW1r?=
 =?utf-8?B?SkQ0dDV4V1JRaWFxTTl2cEp4aFdwRjZ4ZTJsaWErVjIxT2d5cUJKbkpaQlFN?=
 =?utf-8?B?NWtzd2ZNYlZUenZwOG1zREFGOU1LVGovRHl6THRpWWkydlFnN3VoN1V0TEZU?=
 =?utf-8?B?YVBkQy9ZRncyK2g5OXVrL3BkZTYvcVVTbG9wdUhpNkttaGlIOVhuRlFSWmRL?=
 =?utf-8?B?YkJMd0dNNUJnTmdqNFFRZDNNQU84VUZVdHc0ZnJObmpYYTNrZEhmMXpLS1Vk?=
 =?utf-8?B?MVdETlYzeGxUZHJCL1IyeFNrU1Z3YlpqQjFrd2lJdlhXaG9sSG1GU2pBQTlD?=
 =?utf-8?B?RGNVd0RGa0s0ZU9vL09PL1RjZDFHbytOL3BHRzB4NTAzU2c3anNENDJsMGRT?=
 =?utf-8?B?Q0NNblVSMklrVTN5MHd6ZUxOeGRTbXN4YnUwL3o3ajJlbzVpZXhObmMvZHdm?=
 =?utf-8?B?NkpnaWo3QjIyZUdNREhOWkppd0V3TzllSFNreWVEV1J0MGhVSFhwLzVTejNB?=
 =?utf-8?B?QndGdTN1NzMrM0RyLzYzRVhDUDhQYytNYWU2OEQrKzFYSVQxNFh1bzZ5MXBX?=
 =?utf-8?B?djB5eEw2WXRYNERJQi9EaVp6dE1pdlBZY0Y5SDRHSld5QXpCNlJLcHkvdmN5?=
 =?utf-8?Q?3X2JVDPgqkisQy2o=3D?=
Content-ID: <C5A7864F5C266F4ABDCFD32C055621F9@namprd12.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: Nvidia.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MW2PR12MB4667.namprd12.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c9fd5094-8dc8-417c-1c9a-08da1ea3fcca
X-MS-Exchange-CrossTenant-originalarrivaltime: 15 Apr 2022 05:51:29.4703 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 43083d15-7273-40c1-b7db-39efd9ccc17a
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: IPcAt18WzYDe1ZXZaQ67IfuhtbBuQMqjGvQ61935BGXjt8u7waNpeop0EhPBq1EGBFzNYdvWpPbakAPDA6Tcaw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM5PR1201MB0169
X-Spam-Score: -2.7 (--)
X-Spam-Report: Spam detection software,
 running on the system "util-spamd-2.v13.lw.sourceforge.com", 
 has NOT identified this incoming email as spam.  The original
 message has been attached to this so you can view it or label
 similar future email.  If you have any questions, see
 the administrator of that system for details.
 Content preview:  On 4/14/22 21:52, Christoph Hellwig wrote: > Secure erase
 is a very different operation from discard in that it is > a data integrity
 operation vs hint. Fully split the limits and helper > infrastruct [...] 
 Content analysis details:   (-2.7 points, 6.0 required)
 pts rule name              description
 ---- ---------------------- --------------------------------------------------
 -0.0 SPF_HELO_PASS          SPF: HELO matches SPF record
 -0.0 SPF_PASS               SPF: sender matches SPF record
 -0.0 RCVD_IN_MSPIKE_H2      RBL: Average reputation (+2)
 [40.107.93.52 listed in wl.mailspike.net]
 0.1 DKIM_SIGNED            Message has a DKIM or DK signature, not necessarily
 valid
 -0.1 DKIM_VALID_EF          Message has a valid DKIM or DK signature from
 envelope-from domain
 -0.1 DKIM_VALID_AU          Message has a valid DKIM or DK signature from
 author's domain
 -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
 -0.0 T_SCC_BODY_TEXT_LINE   No description available.
 -2.5 NICE_REPLY_A           Looks like a legit reply (A)
 -0.0 DKIMWL_WL_HIGH         DKIMwl.org - High trust sender
X-Headers-End: 1nfF6B-0004tU-Vv
Subject: Re: [f2fs-dev] [PATCH 26/27] block: decouple REQ_OP_SECURE_ERASE
 from REQ_OP_DISCARD
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
 David Sterba <dsterba@suse.com>, Jaegeuk Kim <jaegeuk@kernel.org>,
 "ceph-devel@vger.kernel.org" <ceph-devel@vger.kernel.org>,
 Coly Li <colyli@suse.de>, Ryusuke Konishi <konishi.ryusuke@gmail.com>,
 "linux-raid@vger.kernel.org" <linux-raid@vger.kernel.org>,
 "Martin K . Petersen" <martin.petersen@oracle.com>,
 "linux-mmc@vger.kernel.org" <linux-mmc@vger.kernel.org>,
 "linux-f2fs-devel@lists.sourceforge.net"
 <linux-f2fs-devel@lists.sourceforge.net>,
 "linux-xfs@vger.kernel.org" <linux-xfs@vger.kernel.org>,
 =?utf-8?B?Q2hyaXN0b3BoIELDtmhtd2FsZGVy?= <christoph.boehmwalder@linbit.com>,
 "ocfs2-devel@oss.oracle.com" <ocfs2-devel@oss.oracle.com>,
 "linux-fsdevel@vger.kernel.org" <linux-fsdevel@vger.kernel.org>,
 "ntfs3@lists.linux.dev" <ntfs3@lists.linux.dev>,
 "linux-btrfs@vger.kernel.org" <linux-btrfs@vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: linux-f2fs-devel-bounces@lists.sourceforge.net

T24gNC8xNC8yMiAyMTo1MiwgQ2hyaXN0b3BoIEhlbGx3aWcgd3JvdGU6DQo+IFNlY3VyZSBlcmFz
ZSBpcyBhIHZlcnkgZGlmZmVyZW50IG9wZXJhdGlvbiBmcm9tIGRpc2NhcmQgaW4gdGhhdCBpdCBp
cw0KPiBhIGRhdGEgaW50ZWdyaXR5IG9wZXJhdGlvbiB2cyBoaW50LiAgRnVsbHkgc3BsaXQgdGhl
IGxpbWl0cyBhbmQgaGVscGVyDQo+IGluZnJhc3RydWN0dXJlIHRvIG1ha2UgdGhlIHNlcGFyYXRp
b24gbW9yZSBjbGVhci4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IENocmlzdG9waCBIZWxsd2lnIDxo
Y2hAbHN0LmRlPg0KPiBSZXZpZXdlZC1ieTogTWFydGluIEsuIFBldGVyc2VuIDxtYXJ0aW4ucGV0
ZXJzZW5Ab3JhY2xlLmNvbT4NCj4gQWNrZWQtYnk6IENocmlzdG9waCBCw7ZobXdhbGRlciA8Y2hy
aXN0b3BoLmJvZWhtd2FsZGVyQGxpbmJpdC5jb20+IFtkcmJkXQ0KPiBBY2tlZC1ieTogUnl1c3Vr
ZSBLb25pc2hpIDxrb25pc2hpLnJ5dXN1a2VAZ21haWwuY29tPiBbbmlmczJdDQo+IEFja2VkLWJ5
OiBKYWVnZXVrIEtpbSA8amFlZ2V1a0BrZXJuZWwub3JnPiBbZjJmc10NCj4gQWNrZWQtYnk6IENv
bHkgTGkgPGNvbHlsaUBzdXNlLmRlPiBbYmNhY2hlXQ0KPiBBY2tlZC1ieTogRGF2aWQgU3RlcmJh
IDxkc3RlcmJhQHN1c2UuY29tPiBbYnRyZnNdDQo+IC0tLQ0KDQpMb29rcyBnb29kLg0KDQpSZXZp
ZXdlZC1ieTogQ2hhaXRhbnlhIEt1bGthcm5pIDxrY2hAbnZpZGlhLmNvbT4NCg0KLWNrDQoNCgpf
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpMaW51eC1mMmZz
LWRldmVsIG1haWxpbmcgbGlzdApMaW51eC1mMmZzLWRldmVsQGxpc3RzLnNvdXJjZWZvcmdlLm5l
dApodHRwczovL2xpc3RzLnNvdXJjZWZvcmdlLm5ldC9saXN0cy9saXN0aW5mby9saW51eC1mMmZz
LWRldmVsCg==
